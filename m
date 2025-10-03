Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2E2E8B72
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759485281; cv=none; b=S79BAsThmbv4+MWGq8hjyKqn/7XZK8Wij4WapKbkdUScEuN5op+OiWeq8OCXh5g+iUZfI1sItNuDNlLELgbX5ehDJT6Hm4otuD7KcOJHgnycEor/tXOktb5IJJ1ekjI9lWcn8cbErVR3vKFRnA6yE3QndF8EOzyarIg59Vrn1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759485281; c=relaxed/simple;
	bh=2WZUeKVDfC335msd+Bd9qMK6RYmQrB0O9LN0WZblAc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssZI8UWeHYSNAKSzYvbJHBfEhrA4VxoKaFDKCTyn0fSmCVkF0TiGIIEG5l/TGEx6ab7eOOKtlBQ2pBrkgMav/+yY6RPbc3MIKHFLjDJmoUps7pctfmagB8Zr7mL6gNpU3eqr/Aw697wmhAozte//5huBUEPlb5isiFdF5OlHp3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2102F227AAC; Fri,  3 Oct 2025 11:54:34 +0200 (CEST)
Date: Fri, 3 Oct 2025 11:54:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: alistair23@gmail.com
Cc: chuck.lever@oracle.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org,
	kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 7/8] nvmet-tcp: Support KeyUpdate
Message-ID: <20251003095434.GB15497@lst.de>
References: <20251003043140.1341958-1-alistair.francis@wdc.com> <20251003043140.1341958-8-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003043140.1341958-8-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 03, 2025 at 02:31:38PM +1000, alistair23@gmail.com wrote:
> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue);
> +static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w);
> +#endif

Can we find a way to structure the code to do without forward declarations
and either without ifdefs or with stubs when you need them?

> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +			if (ret == -EKEYEXPIRED &&
> +				queue->state != NVMET_TCP_Q_DISCONNECTING &&
> +				queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
> +					goto done;
> +			}

Wrong indentation and superflous braces here.

> +	ret = nvmet_tcp_tls_handshake(queue, HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = wait_for_completion_interruptible_timeout(&queue->tls_complete, 10 * HZ);

Please avoid the overly long lines.

> +
> +	if (ret <= 0) {
> +		tls_handshake_cancel(queue->sock->sk);
> +		return ret;
> +	}
> +
> +	queue->state = NVMET_TCP_Q_LIVE;
> +
> +	return ret;

This should be a unconditional ret 0, or am I missing something?

> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +			if (ret == -EKEYEXPIRED &&
> +				queue->state != NVMET_TCP_Q_DISCONNECTING &&
> +				queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
> +					goto done;
> +			}

Same as above.  And given that we have multiple instances of this
check I suspect we want a little helper for it.

> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +			if (ret == -EKEYEXPIRED)
> +				update_tls_keys(queue);
> +			else
> +#endif
> +				return;
> +		}

If you provide a proper stub for update_tls_keys this becomes much
saner:

		if (ret != -EKEYEXPIRED)
			return;
		update_tls_keys(queue);

> +#ifdef CONFIG_NVME_TARGET_TCP_TLS
> +			if (ret == -EKEYEXPIRED)
> +				update_tls_keys(queue);
> +			else
> +#endif
> +				return;

Same here.

