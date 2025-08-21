Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A73277B9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782265; cv=none; b=edkh9sxHETsGUh369yxTUUY2UbOFjFbmL6d06lnYYZuR47sRLVeIBsKoZ4Xs1ZPZ0Yod8dmY2sdF+t+nfO6KDupe+lu9dPUlwfAAvN526vb7L25olviwKqjzjZCQ/vIoOUvfkhlEQz5GR4VThNEsqP83+N2C1qvXvWZervZN190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782265; c=relaxed/simple;
	bh=bwFAOQRH2KQYfE+CAuwfRyBLCaRld0/730EcCpxmlXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzVUdMs4ydazl19Acxsn1D9VZTjIkpRYJtf7enU8xyxtS19w+APxTcrYb+x3s65dxdDJt8Bf6fPemxXHjbMc/24+Y5ITmVVAtlG6D1WgebIrMPQQJ6TW8bE/T6bNxhKY7qPNsj9yjG6Jj42D4bPCuf4yZVAzmPMqT7KmGwrutwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Embb5ciC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Embb5ciC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755782263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Afy5XNBwcOSovwamEVwVUrdjuD01YmpHvgt60RHlLnE=;
	b=Embb5ciC1t/rOl6awtAyYDUxpUJ8zL035GV5QpbL6Ct41pc71uBIQhcvcTqmyxJlGgytii
	XqJ8lJUU7+fQz3Am+shQvWtCAUWHkx2jO2Dn5U3lAR7YP95m1rJVu0WzrNZtwNY+WtS0pG
	POfg24PcmwX5AzGmY7n8fk+Iz1BL+T0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-N8z_jRBrPgWq553r2uMBFA-1; Thu, 21 Aug 2025 09:17:41 -0400
X-MC-Unique: N8z_jRBrPgWq553r2uMBFA-1
X-Mimecast-MFC-AGG-ID: N8z_jRBrPgWq553r2uMBFA_1755782260
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1ad21752so4356205e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 06:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782260; x=1756387060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afy5XNBwcOSovwamEVwVUrdjuD01YmpHvgt60RHlLnE=;
        b=lKWj4gY+7XA8r4u/FDfWEsDnksbkF4WA+Ov1JfLl2U3o9h6H7otA7v4ClS0xRjAxJT
         OGRz2Yi0IcqrBcbNLVGOASOo8Ai4hNKH6+6vm5qqG1164RDfyr0pU1Z5QZc+AiSs5TPD
         k9Ub6uHoARY0RWHe8gS6QAlQs84DpDHIEM8CdakzX+leVHvRbu2qGfUNGe8xlNf2clAC
         6e5fKWgdYIFWmQVNRKmRbP2gQDnerK6r1q3eH5ifh7E/o4rcJCziwicW/okgZ8S5lc92
         uZm+tWkx874GRdvWvMELq0gVRJTrzCWspF8g7EuV2EG24UaPlP6Dwf1SwHNdxpKXvfqO
         4v2w==
X-Forwarded-Encrypted: i=1; AJvYcCXBGrwdac28R24pYcXMRMIm3hGJQOWDU702LyX4MVNLDFci7A0QmfeT4BFoZVqx0xm70WuNBOOhaSwrmOeBCOPCdBQJyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySfDSDJIYbuRfoz7cukQUmHidHaPI+lV1XiFAx56bjOxKs8IZP
	r7KIFAtE3oW1GxE9Fw5tCUqeWAwPRfipI4c3nVrPZs2A3xAG3Zw6kGseY3mXvAuBl+r10rsE5tE
	uEqe28kYbxHqiSix1XwWLIWTvbNf7GGU4pIVDHq+tVbGgAzMhIjNWFSqFPOLmjXc8QY5SsyIDxl
	Q/
X-Gm-Gg: ASbGnctTHtVYoJhd5Yt0wgDKtDL5C8iJbC/foiGLL3zRU2cFGfgqtLVXJTtxYnnJuEm
	GuDkj9QHzITEWcA5fRfWcFMZl2dJdvn4qHeyYfyFZ5hVI8Wpe31NLV7YyaE75JLEJxnnq6r3Poc
	AIkwuaa66ZrqBjB2gFOqRqVIxvuSwoE+Gz5ZvM13ceBg281tYktE/VmSgLN2OkLf8F684SHmtoh
	xmwQlH6U1p7Ivjqrs/NHRfyTWQZh4bgJj6BVneyNqLBmR9gKwQOX6/hjG4ga0FhCXn9DNiviMWG
	sli5aHWEWbibcLQMbX5U63i2SBpq8YooG7PTu4/iawn6M2llIPCMx7YcByDvfa+mnSegconGwu3
	GNvQCdWRRep0=
X-Received: by 2002:a05:600c:1d01:b0:455:f7d5:1224 with SMTP id 5b1f17b1804b1-45b4d9e900amr21733195e9.9.1755782259988;
        Thu, 21 Aug 2025 06:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKup3Bv+uTuJGCC0dd8vM3UgErwkB4o60xSOsgAT0YbFG9UXZs/zd4wk8y+8JlORfOl0DGxA==
X-Received: by 2002:a05:600c:1d01:b0:455:f7d5:1224 with SMTP id 5b1f17b1804b1-45b4d9e900amr21732515e9.9.1755782259493;
        Thu, 21 Aug 2025 06:17:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3fab22726sm4908227f8f.37.2025.08.21.06.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 06:17:39 -0700 (PDT)
Message-ID: <7cfc62a6-b988-400d-829a-306211e1a156@redhat.com>
Date: Thu, 21 Aug 2025 15:17:36 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/15] quic: provide family ops for address
 and protocol
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
 <d208163af2fdd4c6ca5375e1305774e632676e5b.1755525878.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <d208163af2fdd4c6ca5375e1305774e632676e5b.1755525878.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H-ljGWAg98Eh58nNi9HmQC93STBmt11lRkyrVJshKMg_1755782260
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 4:04 PM, Xin Long wrote:
> This patch introduces two new abstraction structures to simplify handling
> of IPv4 and IPv6 differences across the QUIC stack:
> 
> - quic_addr_family_ops: for address comparison, flow routing,
>   UDP config, MTU lookup, formatted output, etc.
> 
> - quic_proto_family_ops: for socket address helpers and preference.
> 
> With these additions, the QUIC core logic can remain agnostic of the
> address family and socket type, improving modularity and reducing
> repetitive checks throughout the codebase.

Given that you wrap the ops call in quick_<op>() helper, I'm wondering
if such abstraction is necessary/useful? 'if' statements in the quick
helper will likely reduce the code size, and will the indirect function
call overhead.

[...]
> +static void quic_v6_set_sk_addr(struct sock *sk, union quic_addr *a, bool src)
> +{
> +	if (src) {
> +		inet_sk(sk)->inet_sport = a->v4.sin_port;
> +		if (a->sa.sa_family == AF_INET) {
> +			sk->sk_v6_rcv_saddr.s6_addr32[0] = 0;
> +			sk->sk_v6_rcv_saddr.s6_addr32[1] = 0;
> +			sk->sk_v6_rcv_saddr.s6_addr32[2] = htonl(0x0000ffff);
> +			sk->sk_v6_rcv_saddr.s6_addr32[3] = a->v4.sin_addr.s_addr;
> +		} else {
> +			sk->sk_v6_rcv_saddr = a->v6.sin6_addr;
> +		}
> +	} else {
> +		inet_sk(sk)->inet_dport = a->v4.sin_port;
> +		if (a->sa.sa_family == AF_INET) {
> +			sk->sk_v6_daddr.s6_addr32[0] = 0;
> +			sk->sk_v6_daddr.s6_addr32[1] = 0;
> +			sk->sk_v6_daddr.s6_addr32[2] = htonl(0x0000ffff);
> +			sk->sk_v6_daddr.s6_addr32[3] = a->v4.sin_addr.s_addr;
> +		} else {
> +			sk->sk_v6_daddr = a->v6.sin6_addr;
> +		}
> +	}

You could factor the addr assignment in an helper and avoid some code
duplication.

/P

