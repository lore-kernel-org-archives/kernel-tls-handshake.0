Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C01E2FB09F
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Sep 2025 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088638; cv=none; b=twi4PWhlJ1M8I8FzRyFenjh+hmCxl/PInEO0LILdbizqVO0s4MJ3MgaL10Ku6daQOOGRsKyF5IfRORj2Y+CLVm9P5HFDvNZ9NmULkbiuUnEhVSWKjgu6RqjxKkMNwEpYzrv3W6+Zsv/bN64y23IM3UiDb0GgFb5Di6kVkdjB6bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088638; c=relaxed/simple;
	bh=ur5JMIMfJCcNnsAEuLEJhGLcooBQ1GgahWDjs8G8Eg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg0jzbjp2PjPKIqZE4AiHRF3e7h3gCYJr+MIdxoAU+q0lPrpymNM2TJAZeKlDkeioWt8nF0fPHXzvU/CZRkzyx655Lc4NE1a2rCHbaNaAO+bxzadgEV+olz+1NsEQuNgoBHxKXhBYnXBuYbkFMVJCh0Bodwa3UA7Rs0kK+bskrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=EdEpp31+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="EdEpp31+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f76277413so2805336e87.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 05 Sep 2025 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1757088634; x=1757693434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ5lKT8MWq9BlErADmClzSG7/N/nbcrdEgrcT5yeDiw=;
        b=EdEpp31+IsgArRBITXrp2tb2hNyjuPa0KQniufzufsnuU4IRvBTEui1apLpE6eJt3p
         dcvtGme48eGD4KNcgDq1jr/KkepJ3+LNEQG2/0Eg0T52L8J8UTdAg7BFU4tdlpH8QYll
         j4S6CZaITWUkB11LH3zEYX0zCHKG76w7DXTJIWaTdqtthYp1ROHQZuQHGhgp/CEvfHh0
         H0eFBGwn9xmj9Z/kyzS624fS9mVCp/INcdh4dB82DuSRk82pstF+MTyth/jkT53pC5Um
         xq7yDdMi5t1EJpyYwekm8gVAgGXfRRV/Sed8pFxWNOS3LZlmb6VEEYqgLXYAv3CV9td3
         cDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088634; x=1757693434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ5lKT8MWq9BlErADmClzSG7/N/nbcrdEgrcT5yeDiw=;
        b=fMPIsPufbzMqvpBn5j4tB8fY8WU9Ck8ZdldqaMuxYkHAccJ4jZkoy5Eksg7h+R7VA/
         I8iJbJlfLg3nyTcK1t5YQsnxT+OCPvQMfyLrOwIU2i4SSR82/IWIepMfMPaseHSQ76yk
         6ORxi5W+zsuN5j+A5AJNmSQY3C4yppgywdfkcCLj6WV3nPJuknOlUU/FwujLdnvVN94V
         6SOubRxqesykmXPGmHd8LShWn8qLQG/lxxz1HgXoi5ko6J/WRxO+tIQPpiQHRGPTYyzw
         pNmtQX9iM+gbqz4vPtg6TSxiq0pBmZYQmbUPdHMNscqQ3THDrtYiBwXjgV1hqxvOTo9i
         dN9w==
X-Forwarded-Encrypted: i=1; AJvYcCUEYFj7ysYkXmHuDcFBLsaKCdAjLLnNWDrZMMIifpivALrr4Y+okCUsvoFSeoRCUMJycTQwoiC6yZrsbgAPF2qiMsvMyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLpkMaqmZibDwLTfqIMD8AwuAh11cwx7K+F/NnDuzhI9CNj0Fl
	jFA+Dy91f5zw945FNqcuhPbvxlcV5AbZkp7/6Gat3TM010rczbMFifpN7q5W+vaLh4tVr4SHJi6
	vgmtXnj8vrTkkIE7YtOKS4/h+zXHm5no=
X-Gm-Gg: ASbGncvYDtJoWFIgVU4xf2yd1DRc+WXscyOEbIPj0GSUpE4vRiM9Lp1dX6V4m5FwSGw
	mMAme8wpsgBhVmTRCOC3uilHzoYs0JQoqpUHVYTnRQKtSFzRtO8YIc+w1IBFxjPMQ/JQNvcM9A2
	nmkivf9cjQQj7q0Rj/KITiWcQ0Roh4Inj/pF11SJtEzfJTpDTU0xk1vhve42ISeo3iZ1xZBkS0Y
	XnTcjyMwLA77tmHSKU3wO4LkrutFjlSp+IdCb8q1Q==
X-Google-Smtp-Source: AGHT+IH4XATrInTUDVReB90YvO/+WxFS3HmfZqUUGXwXcEnfrW4wwIz+ykUEAEhK5InYJjqbQmozqhPkoS3eqY6kZqE=
X-Received: by 2002:a05:651c:1b12:b0:332:2235:911c with SMTP id
 38308e7fff4ca-336caf71358mr68599551fa.37.1757088634191; Fri, 05 Sep 2025
 09:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250731180058.4669-1-okorniev@redhat.com> <20250731180058.4669-4-okorniev@redhat.com>
In-Reply-To: <20250731180058.4669-4-okorniev@redhat.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 5 Sep 2025 12:10:21 -0400
X-Gm-Features: Ac12FXzBiQ30iKKbP0zzoq1oKAENaPAn2hm04QJoePVvv8Y4CUwCe8BkLoQZJ38
Message-ID: <CAN-5tyF=5oQLyy7ikbbhFW10OrUfHh0Sr3D=G1nHN+pEsfiSzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] nvmet-tcp: fix handling of tls alerts
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: chuck.lever@oracle.com, jlayton@kernel.org, trondmy@hammerspace.com, 
	anna.schumaker@oracle.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-nfs@vger.kernel.org, linux-nvme@lists.infradead.org, 
	netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, neil@brown.name, 
	Dai.Ngo@oracle.com, tom@talpey.com, hare@suse.de, horms@kernel.org, 
	kbusch@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear NvME maintainers,

Are there objections to this patch? What's the path forward to
including it in the nvme code.

Thank you.

On Thu, Jul 31, 2025 at 2:01=E2=80=AFPM Olga Kornievskaia <okorniev@redhat.=
com> wrote:
>
> Revert kvec msg iterator before trying to process a TLS alert
> when possible.
>
> In nvmet_tcp_try_recv_data(), it's assumed that no msg control
> message buffer is set prior to sock_recvmsg(). Hannes suggested
> that upon detecting that TLS control message is received log a
> message and error out. Left comments in the code for the future
> improvements.
>
> Fixes: a1c5dd8355b1 ("nvmet-tcp: control messages for recvmsg()")
> Suggested-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Hannes Reinecky <hare@susu.de>
> Signed-off-by: Olga Kornievskaia <okorniev@redhat.com>
> ---
>  drivers/nvme/target/tcp.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 688033b88d38..98cee10de713 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -120,7 +120,6 @@ struct nvmet_tcp_cmd {
>         u32                             pdu_len;
>         u32                             pdu_recv;
>         int                             sg_idx;
> -       char                            recv_cbuf[CMSG_LEN(sizeof(char))]=
;
>         struct msghdr                   recv_msg;
>         struct bio_vec                  *iov;
>         u32                             flags;
> @@ -1161,6 +1160,7 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_=
queue *queue)
>         if (unlikely(len < 0))
>                 return len;
>         if (queue->tls_pskid) {
> +               iov_iter_revert(&msg.msg_iter, len);
>                 ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
>                 if (ret < 0)
>                         return ret;
> @@ -1217,19 +1217,28 @@ static void nvmet_tcp_prep_recv_ddgst(struct nvme=
t_tcp_cmd *cmd)
>  static int nvmet_tcp_try_recv_data(struct nvmet_tcp_queue *queue)
>  {
>         struct nvmet_tcp_cmd  *cmd =3D queue->cmd;
> -       int len, ret;
> +       int len;
>
>         while (msg_data_left(&cmd->recv_msg)) {
> +               /* to detect that we received a TlS alert, we assumed tha=
t
> +                * cmg->recv_msg's control buffer is not setup. kTLS will
> +                * return an error when no control buffer is set and
> +                * non-tls-data payload is received.
> +                */
>                 len =3D sock_recvmsg(cmd->queue->sock, &cmd->recv_msg,
>                         cmd->recv_msg.msg_flags);
> +               if (cmd->recv_msg.msg_flags & MSG_CTRUNC) {
> +                       if (len =3D=3D 0 || len =3D=3D -EIO) {
> +                               pr_err("queue %d: unhandled control messa=
ge\n",
> +                                      queue->idx);
> +                               /* note that unconsumed TLS control messa=
ge such
> +                                * as TLS alert is still on the socket.
> +                                */
> +                               return -EAGAIN;
> +                       }
> +               }
>                 if (len <=3D 0)
>                         return len;
> -               if (queue->tls_pskid) {
> -                       ret =3D nvmet_tcp_tls_record_ok(cmd->queue,
> -                                       &cmd->recv_msg, cmd->recv_cbuf);
> -                       if (ret < 0)
> -                               return ret;
> -               }
>
>                 cmd->pdu_recv +=3D len;
>                 cmd->rbytes_done +=3D len;
> @@ -1267,6 +1276,7 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_tc=
p_queue *queue)
>         if (unlikely(len < 0))
>                 return len;
>         if (queue->tls_pskid) {
> +               iov_iter_revert(&msg.msg_iter, len);
>                 ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
>                 if (ret < 0)
>                         return ret;
> @@ -1453,10 +1463,6 @@ static int nvmet_tcp_alloc_cmd(struct nvmet_tcp_qu=
eue *queue,
>         if (!c->r2t_pdu)
>                 goto out_free_data;
>
> -       if (queue->state =3D=3D NVMET_TCP_Q_TLS_HANDSHAKE) {
> -               c->recv_msg.msg_control =3D c->recv_cbuf;
> -               c->recv_msg.msg_controllen =3D sizeof(c->recv_cbuf);
> -       }
>         c->recv_msg.msg_flags =3D MSG_DONTWAIT | MSG_NOSIGNAL;
>
>         list_add_tail(&c->entry, &queue->free_list);
> @@ -1736,6 +1742,7 @@ static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_=
queue *queue)
>                 return len;
>         }
>
> +       iov_iter_revert(&msg.msg_iter, len);
>         ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
>         if (ret < 0)
>                 return ret;
> --
> 2.47.1
>
>
