Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3D26A1B6
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762930911; cv=none; b=jSHOzoO+1iLNARwr9fo7wwYsWzw0Ll2exA5BWs+/ojUcdw/Vi29mxgsf1XuUgSKG0d9Qp98OaGeAsnpm6oRem0HYUxzGDHK+0I9Qeo3QCJX/RThWXJRdxmtxmBK6NKa29JNBrffVGS/ixaN9RR7HSosrBuyI3rv1i0dSHJnS6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762930911; c=relaxed/simple;
	bh=1Ec91SlkGrNDvEFQrEabla4raYuzemV79aiA4BykeIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cybIP8o/D1nMqSj8FCps2/We4D3F7IBSoR3VaVM9d27xu8N4RM/ozM7sstMZLrUTifQYfdpaLON9XgkCu9/sr6PiRqkCojgxGYOL2il4Qvd0EqCnJDyS5Jc46I7arVBrDiUgOz0Nb0JJ1r76lnRp+gElCQZotME/bFEasOUXcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C9036227AB7; Wed, 12 Nov 2025 08:01:40 +0100 (CET)
Date: Wed, 12 Nov 2025 08:01:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: alistair23@gmail.com
Cc: chuck.lever@oracle.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org,
	kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v5 6/6] nvmet-tcp: Support KeyUpdate
Message-ID: <20251112070138.GG4873@lst.de>
References: <20251112042720.3695972-1-alistair.francis@wdc.com> <20251112042720.3695972-7-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112042720.3695972-7-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 12, 2025 at 02:27:20PM +1000, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> If the nvmet_tcp_try_recv() function return EKEYEXPIRED or if we receive
> a KeyUpdate handshake type then the underlying TLS keys need to be
> updated.
> 
> If the NVMe Host (TLS client) initiates a KeyUpdate this patch will
> allow the NVMe layer to process the KeyUpdate request and forward the
> request to userspace. Userspace must then update the key to keep the
> connection alive.
> 
> This patch allows us to handle the NVMe host sending a KeyUpdate
> request without aborting the connection. At this time we don't support
> initiating a KeyUpdate.
> 
> Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
> v5:
>  - No change
> v4:
>  - Restructure code to avoid #ifdefs and forward declarations
>  - Use a helper function for checking -EKEYEXPIRED
>  - Remove all support for initiating KeyUpdate
>  - Use helper function for restoring callbacks
> v3:
>  - Use a write lock for sk_user_data
>  - Fix build with CONFIG_NVME_TARGET_TCP_TLS disabled
>  - Remove unused variable
> v2:
>  - Use a helper function for KeyUpdates
>  - Ensure keep alive timer is stopped
>  - Wait for TLS KeyUpdate to complete
> 
>  drivers/nvme/target/tcp.c | 203 ++++++++++++++++++++++++++------------
>  1 file changed, 142 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 818efdeccef1..486ea7bb0056 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -175,6 +175,7 @@ struct nvmet_tcp_queue {
>  
>  	/* TLS state */
>  	key_serial_t		tls_pskid;
> +	key_serial_t		handshake_session_id;
>  	struct delayed_work	tls_handshake_tmo_work;
>  
>  	unsigned long           poll_end;
> @@ -186,6 +187,8 @@ struct nvmet_tcp_queue {
>  	struct sockaddr_storage	sockaddr_peer;
>  	struct work_struct	release_work;
>  
> +	struct completion       tls_complete;
> +
>  	int			idx;
>  	struct list_head	queue_list;
>  
> @@ -214,6 +217,10 @@ static struct workqueue_struct *nvmet_tcp_wq;
>  static const struct nvmet_fabrics_ops nvmet_tcp_ops;
>  static void nvmet_tcp_free_cmd(struct nvmet_tcp_cmd *c);
>  static void nvmet_tcp_free_cmd_buffers(struct nvmet_tcp_cmd *cmd);
> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
> +				   enum handshake_key_update_type keyupdate);
> +#endif
>  
>  static inline u16 nvmet_tcp_cmd_tag(struct nvmet_tcp_queue *queue,
>  		struct nvmet_tcp_cmd *cmd)
> @@ -832,6 +839,23 @@ static int nvmet_tcp_try_send_one(struct nvmet_tcp_queue *queue,
>  	return 1;
>  }
>  
> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +static bool nvmet_tls_key_expired(struct nvmet_tcp_queue *queue, int ret)
> +{
> +	if (ret == -EKEYEXPIRED &&
> +	    queue->state != NVMET_TCP_Q_DISCONNECTING &&
> +	    queue->state != NVMET_TCP_Q_TLS_HANDSHAKE)
> +					return true;
> +
> +	return false;

Extra indentation before the return true.  This could also be simplified
down to

	return ret == -EKEYEXPIRED &&
		queue->state != NVMET_TCP_Q_DISCONNECTING &&
		queue->state != NVMET_TCP_Q_TLS_HANDSHAKE;

or if you want to do away with the ifdef entirely:

	return IS_ENABLED(CONFIG_NVME_TARGET_TCP_TLS) &&
		ret == -EKEYEXPIRED &&
		queue->state != NVMET_TCP_Q_DISCONNECTING &&
		queue->state != NVMET_TCP_Q_TLS_HANDSHAKE;

Othwise looks good.
