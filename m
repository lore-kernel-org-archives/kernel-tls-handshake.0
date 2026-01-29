Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD633ADAF
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705603; cv=none; b=q1pG0kbOjzpwvOsrXcBLer7LhqwRDWkSVZ6OZxgMoP374HKktt+WD3q/0/nnAnAFm/AoBY4c4l9KaqJHtDoXxK+KuanAEMxGWtJx2TSizFyn8RA337wSHk3w3GN5HD8cYa6X8lrHNdyDdxmU+sfSTNiZEWn2JLFb/u9iXMs0uIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705603; c=relaxed/simple;
	bh=WOGhGhsnQIX0JLxRhL6uuprL7CVf0Nxffn2Etmsupas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjOQ3KBZlv1EASe2xkla6vmC8ztt7KdOZA6hwYdLo7o05R15S/omFrsHAgrRoVhvPug6oxQRBtLvGl9SP3MJG8hwHf+MTedvODAXL218JI7jhGFFa+PIUfMur5sliRNLeWxTO2HPMM9PES6U8RbxT+lc32Y36j7F9J+0Yn+keSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FzwuvNBN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FzwuvNBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769705601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxsJZ4lY7/i7NTzxVza1t8bxhbR1O4VQ7g3k6JdX5O0=;
	b=FzwuvNBNkqnk9SyHXPyHb2M+FqkJV8Xpbb78Gynildhk9o6i6BFqWkYi9OkoxBR96fDITe
	k/E/j8flWnJu+fHSTFBpWyzjjqtnS06tgUiiZbPAXjIphX375H+oSFuciQg3XnWv8hXA3r
	1cERL4tp3ipOrLtFH3+9MHXMeHFrEzA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-3cEWVxCcPjW_05ZYXvQIwA-1; Thu, 29 Jan 2026 11:53:20 -0500
X-MC-Unique: 3cEWVxCcPjW_05ZYXvQIwA-1
X-Mimecast-MFC-AGG-ID: 3cEWVxCcPjW_05ZYXvQIwA_1769705599
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so12037555e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 08:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705599; x=1770310399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxsJZ4lY7/i7NTzxVza1t8bxhbR1O4VQ7g3k6JdX5O0=;
        b=bxzNbDUferBmECNLndvmJ60Y7IFlKNJWybZQJpW+Xt/3urwtxfKm+UCHBjGwLbE+sh
         Fj/XtQ2HtgrQqdruiBcpoA592Tpg242KLOmh5M41yDbonS6AEMYo3lseJTjn8GZFlgRv
         /mqUTexxAMIpCWlDOqGcZwifuJuXMcPVIlal9ySpBueIHpHOvUAhou1pnPvjcA0Ty6wV
         MBUtbXG+voal6KkqK0wA2gu1Mz+4gYq1S8fZulurMXpgeyU2q/eRDcdB1mBOXD9IDufc
         MNytfStgqvNSwQ7l6krt/oB+HxsiiRBCyEZMH9RNQNXp+aoliWfPd6sL6Fr6nZxlJvwC
         nDAA==
X-Forwarded-Encrypted: i=1; AJvYcCXrYm685FjdmWGh44nXoYWHrKZfy7BJnH1MML6MXsJ6fN3Le+WCkucOOrsgHe+DxfXDo/OCDgJGF9IkVTN5itNb+0unXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+QWoNA8kXtD65inzOxn7Tud3VBZ8svQkZAHmHe50kau6BSEXs
	DE1qu3LQnsoJpSniBD5wzmftjy325gE2KdNrpN3C17s8VAreVDQ2BY5cxGt9a/jTugdo6Xu7LW0
	aMYP2ZMErB9yTmhOR9CrSPegM5QvvnwfepM+kLNr4G0XfzYoJZdr2QN2fskZIOTMBvgZTknY8Sh
	hx
X-Gm-Gg: AZuq6aJsCZ1E/K4gXaLhld5W2M7rV+YjIgkheAUNMJeQYi85gf/SBmTZWppw0tAsmGS
	mLOmvpPMI56RRn1RIc7RAjM1czLOXEgmShKgchr5NYF4K5j2RJdXGqOdKm5yUNiDNu6sstFdDf9
	FIlrRMG+kc9IPyHENvyifj2yHfKLGJdW9QMO56uvWMS8VhBf3tPHHGjkBwVfdkYVDw+o7wYGY2v
	96lTCi8YJMv2ECgZDGjqVRfEqgoKFyB2pEfPAYtYGEkYuxypP2ECtOJbSsHw4jjOBgxJEnE93rK
	9xdyOIE1gu10Enct1f3lMqsvRxBj/3gJdR/Bt9/ytm5sKqF5S6KPhjnhxg1ChPz2hMDAkQcRpFU
	Nfc3iF6oDrFMJ
X-Received: by 2002:a05:600c:4e90:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-48069c2a907mr105133765e9.4.1769705598755;
        Thu, 29 Jan 2026 08:53:18 -0800 (PST)
X-Received: by 2002:a05:600c:4e90:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-48069c2a907mr105133265e9.4.1769705598230;
        Thu, 29 Jan 2026 08:53:18 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5e195ecsm793975e9.4.2026.01.29.08.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:53:17 -0800 (PST)
Message-ID: <bbbaf4e5-1c31-4c84-adb4-dbb94b8d07f4@redhat.com>
Date: Thu, 29 Jan 2026 17:53:14 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 15/15] quic: add packet parser base
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1769439073.git.lucien.xin@gmail.com>
 <46f93cbee41da1e1f7b7f408b17915fd93b39ec1.1769439073.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <46f93cbee41da1e1f7b7f408b17915fd93b39ec1.1769439073.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dZCtSTIZomOZiRQsUn-eaSex8N8SBVN2-6jujdIwrsw_1769705599
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/26 3:51 PM, Xin Long wrote:
> +/* Lookup listening socket for Client Initial packet (in process context). */
> +static struct sock *quic_packet_get_listen_sock(struct sk_buff *skb)
> +{
> +	union quic_addr daddr, saddr;
> +	struct quic_data alpns = {};
> +	struct sock *sk;
> +
> +	quic_get_msg_addrs(skb, &daddr, &saddr);
> +
> +	if (quic_packet_parse_alpn(skb, &alpns))
> +		return NULL;
> +
> +	local_bh_disable();

Is this really needed? If so, it needs some comment explaining the
rationale, otherwise please drop it.

/P

