Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733AD50097E
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883903; cv=none; b=MQaVPlJJhePwX4++eyUm0/PzWWUJJ83lwBjD+jSijzxA1ZGnv8QhDDFoXbLvRl0rg/znTtDOu2ql+1dxRmRwOrdpN2+Wer4ubl3KEBdRAQ0PWpLgPAwZgUYNNKT7C36SutlYb42huco368enyx2bQVXu9r6t5jn1BnVmdlKY12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883903; c=relaxed/simple;
	bh=DXhgONYeIS9bChdWRL5MXzxkLSKekfV9hllD3azG3T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eb9Nym/Fii0JLpigkrBXVqVOJ7El2JaovMXqGusOCpDqKMhW2MJNPCET8JJ1iiM5fCzUDojiGwAdBTUVJ7oZmcgKTegnAoLxcRYixRuUWbeGp6Cyf7qNrejvnu/K6v/nRAE+xsGiJJo+L4WDdPAUKhpqQu/biTzk5B1NtVnFo6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZmiTmoI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZmiTmoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOEaS67jxDLLnbL0hp6gXDx5hl4Xnwdn7lV77ig2jkU=;
	b=WZmiTmoIUofRl8sr8F9/HwP7/5eQAnMWfSJHHewdgtexOO0cFD0DlxLi297bdfe3L0msCC
	xz62p5OLndM0MEcOhj5xzq9y7Zcr6dvTNZKhRWLzXSAl4hbWGNnmFN6x/K4rLxBgJwrc2z
	BhjUsSgEOdWrX/6biakx/mYH/QMLPjc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-iMU_NWYMMx2SQaQdSeymVw-1; Thu, 08 Jan 2026 09:51:39 -0500
X-MC-Unique: iMU_NWYMMx2SQaQdSeymVw-1
X-Mimecast-MFC-AGG-ID: iMU_NWYMMx2SQaQdSeymVw_1767883898
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4325b81081aso2394590f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 06:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883897; x=1768488697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOEaS67jxDLLnbL0hp6gXDx5hl4Xnwdn7lV77ig2jkU=;
        b=bd6iYgk7GV+J8qvD7l7PVFuUk8AJmeZTv0kf8u30eeJU76DKR/RUri8+qWN5c1nyBR
         Kx0vupX0s1PyI2RbQFQXGtMmMvkPxydyV3e4pWMYwAu71ZLsFgpu80hwLu6pioAbXHdN
         P/v5JYtwTG1KsNEGaV3iHWylndYfaI39qnbjGkjZ36culpiv8Uw/C4Cvr/m8+m3QeOBD
         sXhnhWpkz3/NoPD9nn4x5P73Tqt4pkLyfRHkJ0a0hCkouGCBDX7LwCzFC0zeDPlx6EvX
         6nu0bugeX21CoKPFI8qH8MonpGm7yrIm53hLlWzxW90Hy+kw8G1+rwpafLyzvQ6Ytm+J
         D2QA==
X-Forwarded-Encrypted: i=1; AJvYcCUhntAFVf7PucWz33o+CJKnlEsXzWC6TzUpFjwaA94ytc+pT/yvFgfgGugNSx7UKjp1ffOW4CzgVdTwEJWDHLm5O32kyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7dwHXDgwP+rqDPIIkEotq5Fyb+A3rwEnrNbcYC57dPylzanKp
	KYi4dr1821Rkq0TIxqYSpcfUBs81KumJUOrbpMiMwqM78m8U6ke23HaGqOo8e2Mz/tfm3ZvEcdO
	2uh5EZB+Xqj0JT1rMjQZrpYGFliLkysxKLqPx9xv68vX4GKwrx/BJzmwYDKMPlUwIqIbfk+qTIB
	sd
X-Gm-Gg: AY/fxX7L8/AIhEyTMpt2ixF9117n2CT958vyUCahR5rXy2VAU/iV11hYLb0BcmVw7+d
	iTuqyPhMdjQHYjIgBb82l0eLk3mVGJMQLzD/lV44bzIuEq82+zj+Hf6O+mUWRFa2n1pazmD+m/2
	W5w/Mw/owJE8KwAv0pR1bt+PS2NBJ1u+Xni+k7A0aAiFKcza0Gj2w9LyrjjztXLcfY3Lh0mJBjy
	1p4N4AUBzKs19vTBEp/DPMqsv/nfIF6S3xohP7mOl8/w4nSfAn3JPJ11IZuypucqbS1TpyseoTc
	J+3QPkXFudITYxdJdOVjuXU8kkuGeqsNm+5Oexfx9IaEQzlfSRR+R1CdeJxEW5CoOCTXESkpQEi
	b+nGGbYfoBo6yjw==
X-Received: by 2002:a05:6000:250e:b0:430:fd69:9926 with SMTP id ffacd0b85a97d-432c377ece0mr7284131f8f.28.1767883897600;
        Thu, 08 Jan 2026 06:51:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl69o07nid1rtv2ElvvEp5emJMaGD57S1+3wGIJzICQrcTyqY6I1e4bFP5EYxEC7EOfbCGWA==
X-Received: by 2002:a05:6000:250e:b0:430:fd69:9926 with SMTP id ffacd0b85a97d-432c377ece0mr7284095f8f.28.1767883897151;
        Thu, 08 Jan 2026 06:51:37 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff1e9sm17585141f8f.41.2026.01.08.06.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:51:36 -0800 (PST)
Message-ID: <32c5dc26-d200-4c45-bcd5-3739699e39eb@redhat.com>
Date: Thu, 8 Jan 2026 15:51:34 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 04/16] quic: provide family ops for address
 and protocol
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
References: <cover.1767621882.git.lucien.xin@gmail.com>
 <d6526f74c99731fa08bdd43f97330f9c2dd78e43.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <d6526f74c99731fa08bdd43f97330f9c2dd78e43.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hwijCt9NJaWyC-WBCX3GZkH-2ptcoQv5SxW5Ju30q0E_1767883898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> Introduce QUIC address and protocol family operations to handle IPv4/IPv6
> specifics consistently, similar to SCTP. The new quic_family.{c,h} provide
> helpers for routing, skb transmit handling, address parsing and comparison
> and UDP socket config initializing etc.
> 
> This consolidates protocol-family logic and enables cleaner dual-stack
> support in the QUIC socket implementation.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

