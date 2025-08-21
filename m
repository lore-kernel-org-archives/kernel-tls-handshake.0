Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AD2253A1
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775133; cv=none; b=qfdibd0wQNpA0bR4lZiXJ6hygwVIK5m3o48gftC5Li7xuJqGRqg2VsoCVYiplauwF/xQWs00RpNA6CkvKREdpMK1pqImWFI6yuN7vmsDgJFgS62hJ/B8v0NN6oF6h+3UvPBGTdlfyD319Ha2IuPCFcGg5tODnok1mCvPToM4+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775133; c=relaxed/simple;
	bh=0eZh22ExobVFn9QdpDSpMbExsBJy4p5TIuWrfygp2ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtCszq1lugqBSVxQfDBN3jPXmkh0oadLTMl7wQrikLh0n/YyHlUxpvwUXCt6tg23ejk5/zCdgdvqeeSDtk5k7f7TUOLDn1JdFJ8O2RFjmTKWbu6al5az/1Y7jT1+xeK4/6wo56dSy6t1+VI2RLo7y/enPAzg5udx5MqbZs+SVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bimY4EpP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bimY4EpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755775131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTF7fdaBAf09RlYCJCvUZk3IkcMydLaKtpCtjA+Wsos=;
	b=bimY4EpPkpl+O/eT5Xx/T5qZ1knEdu/g8a4C5FOQk8JxdmzrvdSgvOdbX0SiBIWKvUXMFo
	Is1PMkghKDvc5XA4xlrMTkHV+xCZEgRURRJg+SgvcLhYTioL4oe+mgDOXJnz9bVkhPjabt
	vR82bo4xon0pE5vUGzYSF3qHIjQmQ20=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-GCWUWebTOimtv5dH9Y68bg-1; Thu, 21 Aug 2025 07:17:51 -0400
X-MC-Unique: GCWUWebTOimtv5dH9Y68bg-1
X-Mimecast-MFC-AGG-ID: GCWUWebTOimtv5dH9Y68bg_1755775071
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e87062832bso232019385a.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 04:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775071; x=1756379871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTF7fdaBAf09RlYCJCvUZk3IkcMydLaKtpCtjA+Wsos=;
        b=ttuakIj0DGQdpUvqeDHjp+6v83WXrdtTIYa7qPJzOzf1hbni/wd97iLyv5oMPApbko
         au+6+SM4qLyGP/pwgjAyUIcU3K2DIvLqO2nxXKWGhhkjZiElIVRMNcudAEwBCc9s70Pl
         459gEoEfSHvffdlpUUUENMjewtXUpqIthNbK6jXC1LuB50OwsPVyqizLG7ttJV8Zml51
         6G/Wd5qEnhEwrr2a+rdwIU6fBtsq7xPV6mZDizyn1xGEdk2F1Tfz1BQFQvxeYHY9mzOv
         kdMYi4QQPnQe6lizLM4Drc1u9fkeAUFA1bzJ9hWwdWfTy9qMdWWSQ5Wc1oBCJSw0Pu/F
         nsTg==
X-Forwarded-Encrypted: i=1; AJvYcCU+qxeEgWf/NpSRoJ581Bm1O/UmPEY4XZRQ5zZnW6FX1QfUas7Ual+5Ll7Fup3zmOEQEtcK3TvInAvVhW2EAGep8QFK6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh2IVpHseQdcSEavPpaNdhcNpTDimtv7/aLjWFR2LQJbX6kmYD
	MNdwCNbEgz23QzrqSzJo/Zgj66puMyE0SgQ9eatraI+UHIbuWCqC4EH+6EPUllbcU/Q4N7A0TtP
	mDGrEmmts9AkiP6mfRT5df7BXj7oSFaP/S/n/jFOufWPFCTFZdyUy7hH9HSbHXDXXn9pHq//q99
	ph
X-Gm-Gg: ASbGncu3G+/Rvl3E2qWwsendPBwHTvfQz/5IaoXTz0bOGn1RiUrVfeBNJiPS5Y6G4Rs
	D0WmH7330D7VPOhAVMEe5wnchHdoqz03OK46hU+BLjvFf/C6LBGIsDbH1WJg90V4o6VQ1nwIp8k
	o0qhSoq0csNsXpxVw0j0ArLlpsi9p+e8aA56rzjUyNlJxIpbV6MMSt3hpdSX0FSsddwb71UaXa3
	LoZgRAWPJa4a/kZ4DqvZw6SiLvOdMQjH3ADwhIZ2BUUNp5thoEDjWRPJAe2bKjfiu8cWvFvVJo4
	OBzzHgy8OV0uKuLsXcb0tHXdYDD0gPolfHCr63txCxBOwqowuly/aRhPhiCFY1t2QAVY2/8+LeK
	4rEdTn1p1Od0=
X-Received: by 2002:a05:620a:4153:b0:7e9:f820:2b87 with SMTP id af79cd13be357-7ea08ea6badmr221663885a.72.1755775070640;
        Thu, 21 Aug 2025 04:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKExl4TKOYXLwhVSd7hxOBflNKJUSf9wwh0aonmAI1AB6dLc57LZaBS4sxU5LAnOMYXuVEEQ==
X-Received: by 2002:a05:620a:4153:b0:7e9:f820:2b87 with SMTP id af79cd13be357-7ea08ea6badmr221660085a.72.1755775070157;
        Thu, 21 Aug 2025 04:17:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87f16f9ecsm1080143785a.24.2025.08.21.04.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 04:17:49 -0700 (PDT)
Message-ID: <ec99ef48-c805-4ce8-99d5-dcf254f6e189@redhat.com>
Date: Thu, 21 Aug 2025 13:17:44 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/15] net: build socket infrastructure for
 QUIC protocol
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <0456736751c8beb50a089368d8adb71ecccb32b1.1755525878.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0456736751c8beb50a089368d8adb71ecccb32b1.1755525878.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n_-FS3UzIn6CC7huFluPUnfViUBdIypj2GeOb6G27Oo_1755775071
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 4:04 PM, Xin Long wrote:
> diff --git a/net/Makefile b/net/Makefile
> index aac960c41db6..7c6de28e9aa5 100644
> --- a/net/Makefile
> +++ b/net/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_PHONET)		+= phonet/
>  ifneq ($(CONFIG_VLAN_8021Q),)
>  obj-y				+= 8021q/
>  endif
> +obj-$(CONFIG_IP_QUIC)		+= quic/
>  obj-$(CONFIG_IP_SCTP)		+= sctp/
>  obj-$(CONFIG_RDS)		+= rds/
>  obj-$(CONFIG_WIRELESS)		+= wireless/
> diff --git a/net/quic/Kconfig b/net/quic/Kconfig
> new file mode 100644
> index 000000000000..b64fa398750e
> --- /dev/null
> +++ b/net/quic/Kconfig
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# QUIC configuration
> +#
> +
> +menuconfig IP_QUIC
> +	tristate "QUIC: A UDP-Based Multiplexed and Secure Transport (Experimental)"
> +	depends on INET
> +	depends on IPV6

What if IPV6=m ?

> +	select CRYPTO
> +	select CRYPTO_HMAC
> +	select CRYPTO_HKDF
> +	select CRYPTO_AES
> +	select CRYPTO_GCM
> +	select CRYPTO_CCM
> +	select CRYPTO_CHACHA20POLY1305
> +	select NET_UDP_TUNNEL

Possibly:
	default n

?
[...]
> +static int quic_init_sock(struct sock *sk)
> +{
> +	sk->sk_destruct = inet_sock_destruct;
> +	sk->sk_write_space = quic_write_space;
> +	sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
> +
> +	WRITE_ONCE(sk->sk_sndbuf, READ_ONCE(sysctl_quic_wmem[1]));
> +	WRITE_ONCE(sk->sk_rcvbuf, READ_ONCE(sysctl_quic_rmem[1]));
> +
> +	local_bh_disable();

Why?

> +	sk_sockets_allocated_inc(sk);
> +	sock_prot_inuse_add(sock_net(sk), sk->sk_prot, 1);
> +	local_bh_enable();
> +
> +	return 0;
> +}
> +
> +static void quic_destroy_sock(struct sock *sk)
> +{
> +	local_bh_disable();

Same question :)

[...]
> +static int quic_disconnect(struct sock *sk, int flags)
> +{
> +	quic_set_state(sk, QUIC_SS_CLOSED); /* for a listen socket only */
> +	return 0;
> +}

disconnect() primary use-case is creating a lot of syzkaller reports.
Since there should be no legacy/backward compatibility issue, I suggest
considering a simple implementation always failing.

/P

