Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2712356D9
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248028; cv=none; b=q9hQDHrtnhcgAfJHBq/62GtH7MCjwUvZygW6wjGaAB8zdR5y83zxAIySbaHBoZ+lJaOf71it66w1XWmp3QMDDEZC0t84TPuTizDuPg4KPPE1izQ3Ye9QvKpNYADTo4j500tsebE09d/TEjx6qAcCg5P6tCSalxqsSYDEnmfTHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248028; c=relaxed/simple;
	bh=pUKJPrLx0M2WMbh/ePs7QzJ4DazqZizbc++rbelECWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZyq1mOwujbJY9FKeu9bbX+4qmP/5RWNy+UaLKvM2CAATXxJf3Erih1uI1hfT8rY8eYwUXMnDXF3ALgNH0Dyatcl7IAgaLNEA/0Nowss53ykc0Fw3yhVul9dqGu12KvVCZvl7VoXt68iLL1ewPc6f11qQc4vx+qfeX9vrYqJ3Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hT0PfY1P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hT0PfY1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762248025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltNFnYEQmixQZpMP12HbSmJnNGHT1YgJ5lkpfeO1BNA=;
	b=hT0PfY1PSRvkPoh3XVfgEdNs+/C5tgjjXg0wDVS4m1xvEwAQPvYFX7TLCqo9dotCLALY1m
	W2cQCVhsR/CeY4ssu6LaogLK4mVD79DYeDB5KKeCUIEWJyCSR3hiIpEpKNP0ubyPGcV7pi
	sEWxn8u1O9H22q42TP9tAceWdHXR4YA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-1WTkJ4bVOr-WjsPIbZ_nTA-1; Tue, 04 Nov 2025 04:20:24 -0500
X-MC-Unique: 1WTkJ4bVOr-WjsPIbZ_nTA-1
X-Mimecast-MFC-AGG-ID: 1WTkJ4bVOr-WjsPIbZ_nTA_1762248023
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-475de1afec6so18402475e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 01:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762248023; x=1762852823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltNFnYEQmixQZpMP12HbSmJnNGHT1YgJ5lkpfeO1BNA=;
        b=X2pjCLw1ULx0xkmyKN7M85IxDgi9lr0RjvBR7TZCFBzLIjt7xXXzYc1dhIpDw+Hqgz
         y+4PYuGTnL8A0GBkaA8Mv8nzEXjJSKA6A8bav0pAjAy6mVYhDMkA5S3CmgyIuU8DjigA
         7yOq//HgeQtAGgeSfQ/pX1p/3dGId3SDVtU53WINosd9UMfCvDQTbcbZPDrREWYmOCyc
         kBZxyeAp1vpURTlYw6wImSoiiYrGB3ol7IDl0vUCDzJyvHCd78bZlDSVkoyfxbJqaJ51
         JLZmn8+ATtBZXPT8Luza/h2G9nqbGW0KhJ9QiidSZoXhOqO4CiFVwBdf2PmfNFTKvenI
         MvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOUYJ/RwILG/yD4tP08ZsmEOFef0oV19odyZlGnOEcsLpu2ZglCzhjG48seQUps/oB3QF/pPFfba3uZvivhua7xVl31A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUQFRl3+OPghcwmzNkN2a8UyXTBM/jzQObAvFwKvSo/EhuTUBx
	mdsYgifaz/xi8QP15Vf9+U7r+QOo/bqhzgUJs7z0Inyoh2nxjRe6WSwVBmuuKGD65VI0X3fNsFt
	PWQx2rwmxiG6RVwLfoNYFFrrL1Rx+PXx5holb43Ty0l70oJYsFB6YrqIo6PpIqqcB83nc6Hz8jP
	T5
X-Gm-Gg: ASbGnctn7s3fr6sw4ol8UA6ievOj2TSAo0rWdTx0SUiYgtNyUJuxgxrGsHuV0DZYwXN
	1yr4J2U3A3hryu2zSUVKi3TT/Db6ObOT++zhUWYCo62/zgAJM3TrLvquNSC0yynmW6SDOG0WzUh
	SjqbEKR6diTMvrc5Gh8NcFX0iVxoUtwqtcC8GRDpK472KBk4Fm6b4PKDf4/p6vbiUPPIf7bwVsI
	DiVj8/H2RnBWpRbKZ9bCbvrn50BkdZ77yarfK6ECSmcoeU25HAH0FfJo71+L9s2z34mqtBYDSAu
	RUaFeNI769JnSMe+sj/7cFtW+7AMDgzFrwDrLSwULmE3tM54NENa/cplQJNyW7zaE+sljYryLPi
	yJla1zO7x8/uoDX2J7EoTL5+HcsJkF1cbLze6Jq9UbrH6
X-Received: by 2002:a05:600c:488a:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-477563a0172mr7272255e9.13.1762248023179;
        Tue, 04 Nov 2025 01:20:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/p/JinMYxs2wrDLzSGvdns88BAErQtC1F7WbaqV2NdVF5IW/VkWgEi7rHVWoViH0BqwGtQA==
X-Received: by 2002:a05:600c:488a:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-477563a0172mr7271755e9.13.1762248022677;
        Tue, 04 Nov 2025 01:20:22 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fdef7sm3539621f8f.43.2025.11.04.01.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:20:22 -0800 (PST)
Message-ID: <a0fee8ef-329d-4286-aa8f-b569b9e4ab03@redhat.com>
Date: Tue, 4 Nov 2025 10:20:19 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 01/15] net: define IPPROTO_QUIC and SOL_QUIC
 constants
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
 <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RVIpsk2ov4Qc7lk2n-KMJwuAReW0KJFaCSqfOsObtTU_1762248023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> This patch adds IPPROTO_QUIC and SOL_QUIC constants to the networking
> subsystem. These definitions are essential for applications to set
> socket options and protocol identifiers related to the QUIC protocol.
> 
> QUIC does not possess a protocol number allocated from IANA, and like
> IPPROTO_MPTCP, IPPROTO_QUIC is merely a value used when opening a QUIC
> socket with:
> 
>   socket(AF_INET, SOCK_STREAM, IPPROTO_QUIC);
> 
> Note we did not opt for UDP ULP for QUIC implementation due to several
> considerations:
> 
> - QUIC's connection Migration requires at least 2 UDP sockets for one
>   QUIC connection at the same time, not to mention the multipath
>   feature in one of its draft RFCs.
> 
> - In-Kernel QUIC, as a Transport Protocol, wants to provide users with
>   the TCP or SCTP like Socket APIs, like connect()/listen()/accept()...
>   Note that a single UDP socket might even be used for multiple QUIC
>   connections.
> 
> The use of IPPROTO_QUIC type sockets over UDP tunnel will effectively
> address these challenges and provides a more flexible and scalable
> solution.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

