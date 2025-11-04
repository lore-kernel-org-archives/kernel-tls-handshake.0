Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DAD191F84
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259608; cv=none; b=a+TxaaspuAb+x0mDWtZXoETyb3z+DsmKgTqlGJRMxJAgzDwWvSrSo6MEpcBwrXHr8upaUmV0qkuH/3VjAwj3zTzEOAcGlnI6IactudU083FLTLwjtfNzq3k30vkq/Osau4/bUzdG3THyBqG1r51Tp+f+Na0rKd18nSk4k8hLyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259608; c=relaxed/simple;
	bh=rvu6O0E/7DDQAPj95W4jLS6+wxWIiNJJleMFtELomlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvSQgu01798ky8+Kk4tOq1i0n1OFQlKID/PM+Q1kOy+HnhylyrQV/WYr5bCR8BKwrt2DAGl77TgGcXradWFHHEaXq5rKH5M/VYVhFi3Zq4zcviLSIW8KoHlgxhUFDMgHBAqPA8Ve99Sktma9PQkg8S3mNY1eo5uFhJltKtiAKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvkelZuH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvkelZuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762259605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+n3IR+AGm5h5aAEd+ooyhPcJs+3zBjyrD/S6ttEIHg=;
	b=RvkelZuH+Id7D1p5Br4U28HG+9GDaZkllXUASNn0BVdgIAPXIhDv37rDuhsKRMdUoe0hzz
	CiXlVuNJ7hLE1dv13jvYzLJBQqacTIz4A1V6fTRBB1RcH3/Yg4+TttA3fr+icYtNqOMzjk
	Ehr5U83chHlVS4NmD6AHRXXHkh9/8Iw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-6HZBDbGRO6CA_HgcjmzW5w-1; Tue, 04 Nov 2025 07:33:24 -0500
X-MC-Unique: 6HZBDbGRO6CA_HgcjmzW5w-1
X-Mimecast-MFC-AGG-ID: 6HZBDbGRO6CA_HgcjmzW5w_1762259604
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47740c1442dso22714695e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 04:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259603; x=1762864403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+n3IR+AGm5h5aAEd+ooyhPcJs+3zBjyrD/S6ttEIHg=;
        b=C8A9vvri7rTsxTbk9gZSXT9cYa5NEhokTJjUCo04UvT4x8U3cbS12gg1JzRCv3gvXg
         f0PIO5sJe5cLwyO/57QAwrj5xJazVOFjYWj6hfEcYqANjDwkghwRpuB2TgNc4xI2x4WQ
         nMn96Fr4LmiskDlCXpOTlmlhPsGnsntp0HthsIFqIXMMHzv/zAmE1ENY8pXUyNR/LAKb
         TStymUTIcpSkgzTQGdKaFmislvvbRbBiLgK0PxjUzqNRnnF9Pb3nfa3Ht9MbSzH4NT6L
         HJXGb8Q7G0Alhpid6dZAuybxc8ETYucxgeA7Tmflf2HIgO9PXt2ASjWcrKvvqXA5AWmi
         dwGw==
X-Forwarded-Encrypted: i=1; AJvYcCWEk48BPcOOgMynAao3x/+xArCuspXwVDNsiTfACWKII5qruRAfZsWxxd2ylnXWDuyeOCuomCqk48K1ODw1aImj+4hPJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyaxHTUyzix0m6/0rPNtYVrY7TL6IDYu3YFaQ2Q6OLQMsoYmJq
	tQHaHpl5qD5m6Yuu7TWZ6Q9rmfEENQnBbufDSD7KWSZk8F5t0KnDGhCoUIdNNUkZ8YKkVxmnntw
	IR/Ic5V2Hkg8FGL5ZV67URQMj5DAtO5ThY/RdYnMFu0HZH+2XF8NoNpfgmjrU+X/6qTqFgDaZSV
	T6
X-Gm-Gg: ASbGnctfDpdJucDqK81L1+eoPEZq1csfSm2M7VTnepIyj6H7ZXs9StKfogMXmhS/QFH
	q2cezPnebC0Qe6ed5MYuSdJ4pkmNjCREG8rWvGBfccU4+giZ6eLHZ+Qym9c1unZT+cRfttXkSy6
	TqRQYU7pkTS0Ww/G1V3ONIq13d8tnhGea8uNTXz7ez2/u+nYop5IQJ6jjzQi8lYhceEBD6dY931
	q0RZLYwO1wTbHGlULgPtUiXmEBkssEsVlF9LjKwAwujRlFI04jG/QXiftMTi4FR7BzeGGDFA/wy
	H5ostGJnpBzEXTUWfJ/ncqjYjr8Ww55/E1+9jXDAYrfxnX26O5ryLPebFzMoTOoUDw4oGdxdUxK
	vd4gSansNAmbfdARP1TIBnhlchwIa9qwW2Jk/kai4d8TU
X-Received: by 2002:a05:600c:a086:b0:477:5582:dee3 with SMTP id 5b1f17b1804b1-4775582e17dmr21786605e9.23.1762259603577;
        Tue, 04 Nov 2025 04:33:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW7XZAfAI36z3n3gua+YP3lVHEkUX5rYhKEKRSMwAwl/px8xmvwUV2n/8i+Vg7lzMYGCOnZA==
X-Received: by 2002:a05:600c:a086:b0:477:5582:dee3 with SMTP id 5b1f17b1804b1-4775582e17dmr21786255e9.23.1762259603207;
        Tue, 04 Nov 2025 04:33:23 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558e695esm17324625e9.2.2025.11.04.04.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:33:22 -0800 (PST)
Message-ID: <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
Date: Tue, 4 Nov 2025 13:33:20 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 13/15] quic: add timer management
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
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4HBj-FGk69-NxSO3bgAQEDj4oGEP-jtg7mQRaP5uTb0_1762259604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +void quic_timer_stop(struct sock *sk, u8 type)
> +{
> +	if (type == QUIC_TIMER_PACE) {
> +		if (hrtimer_try_to_cancel(quic_timer(sk, type)) == 1)
> +			sock_put(sk);
> +		return;
> +	}
> +	if (timer_delete(quic_timer(sk, type)))

timer_shutdown()

Other than that:

Acked-by: Paolo Abeni <pabeni@redhat.com>

