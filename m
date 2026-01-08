Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB12FDC35
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884466; cv=none; b=KpA+eZRc/FrqHR+LQKPVdFlY/xohEA+JgI4wQfl/gkgXQmSzbzoU6+zx33WIRblYRqgdXZh8OSETnv9o0T9E8w0n68LjQYxYnl9MRL3TsOMlvbkGp8DylpMa3xc1ccRxeVAte1kgDMPuwoRK/ajUsZkvmT5bujjkYUwzd2TzcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884466; c=relaxed/simple;
	bh=x/KSeZmo4BpDEjmSmP/FoMnnJGbAD1EDOlqErMkqNac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGpqgY+JKmEWliCAglVe+SOLsswPYF7eCZvlQaJBn3wDLyiZ/MDbk0HxqVuSvbdQqJVGzqgQYdXCcNdAsQP8gnPUhadcxT9C4hZMREa4vZxLCWnMS1R0cL1hz1knrjKTEJJno6c/InThXr/YuYmExPjpBZ6c3qFhfyWSFt/qkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DW2jIpCP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DW2jIpCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767884462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqGiJMM1pVcyveofpqbLm9RhIj56aLTI2bxMd5dfX0k=;
	b=DW2jIpCPA0he7BMudf35dWeXxOMpPrdQYmwKZ0PKNdT32zf96lqiUptpG/wEWJTq5Bsitt
	ollFofNU9K+s0H40n+WagCEdhxZug8dDAMrtxi1RSlKcX2gB6GIFXdEF4R9ucLgFZifIJa
	Gdq9HGrepb0Z1BT72q60eJtXczxxsRU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-6qMn8XBdNyWWapQWfvLRrg-1; Thu, 08 Jan 2026 10:00:59 -0500
X-MC-Unique: 6qMn8XBdNyWWapQWfvLRrg-1
X-Mimecast-MFC-AGG-ID: 6qMn8XBdNyWWapQWfvLRrg_1767884457
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4325b81081aso2401730f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 07:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767884457; x=1768489257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqGiJMM1pVcyveofpqbLm9RhIj56aLTI2bxMd5dfX0k=;
        b=OwwS2IYAVy7yQylegTEvrU0C6JKrjJvJXK48uTnVMoq7WmMyQ0uSzjjY0n3ASJ1FQh
         l/eXAr8cco+lb1E94eZfXlMY/oMwkxR0uChsZ4rFZ8qhHOIQq1Ws3yDwUCdLCD2j97SB
         Gvh1+Dm7Q46S1LQZB1NUCRWDeLLxFULlNoban58BRrT49ffxTqaLqiyDCzRWqF7PHysM
         ilp9kfUOTwlogjIqZZRaRooXyVksdyYFAMb1VVdMga3gH0gkEbVdeiteTZ9Bfu4Mc7MW
         pSv5AMlRctCDv/lU8Zm0bRXTfzyoI7QNBYhW1V7UiQzmLLecno+FHTO/7mOTe2Wqq2/P
         6biA==
X-Forwarded-Encrypted: i=1; AJvYcCXj+NkUNm5ExEKPiqcAM23XY1Gmhkm3bxPZKQCT8n2uKPn3hGLWpVuBGn5vFI6esKCzUxZftr3LPl0AmocgaFqnRUp4qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJemBT7DQXY4nqExXN0DErp7vZp7h436Ki820U82fuEUXRm//7
	1gRDrFBuY86VyfRm164DKTilL1qLnBWIDXGcVy0+e/Jad6A5P65/CNwTOlNahTYwF5cUatPpAib
	01r6a1bqYZGYGeeHc1cWLx3S4WMmTKzbL/Ji8crtA/yrovpNbjb4qDNSCk/XD7QROEY51sqhCJQ
	Ne
X-Gm-Gg: AY/fxX5UGZCZOTu/baGU/aQaZL7FD2YtjpDbcqqvIcxbhlacTKcGxIHenpqTw4ytJOg
	XyGdo+20pqvJDoAP1fbeH8FzBMhYLZFehBus8qMD8+J5VzPsSvi9++3n05SoOSjzUunURvdPbKd
	MKpa6yeRVVtfSeVwNC2SDLqL4t0CXS6VWjNvh0buypv/PSikzbt6RN6sgs+9WLcmxpIOmr018GV
	mt7Hn4C+MVioYXiXid/ai2W9B+vwuMvevUfYuihvmHZ+UCC+4G2jk6oJlGkLQzsJLML87b87XGD
	pFztifFNHNJSHAJbOWahb0xCuM13+uMRMk1bKAgvU4F9nWPVXWgwAz5S6X9hhlam3R2cSUEeBia
	n/Q3jv1xzi2PleA==
X-Received: by 2002:a05:6000:603:b0:430:f72e:c998 with SMTP id ffacd0b85a97d-432c379f3d4mr7580311f8f.51.1767884455783;
        Thu, 08 Jan 2026 07:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFTqZKQeu3SumB0qBMJBfqywsL0m05L0nnqVw7M8JGsK2WTMQCpTmAHt9TI/XwSLSTqMmww==
X-Received: by 2002:a05:6000:603:b0:430:f72e:c998 with SMTP id ffacd0b85a97d-432c379f3d4mr7580153f8f.51.1767884453818;
        Thu, 08 Jan 2026 07:00:53 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm17351709f8f.38.2026.01.08.07.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:00:53 -0800 (PST)
Message-ID: <1f31a9ac-01dd-4bb1-9a5a-ec67b381c5c0@redhat.com>
Date: Thu, 8 Jan 2026 16:00:50 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 05/16] quic: provide quic.h header files for
 kernel and userspace
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
 <127ed26fc7689a580c52316a2a82d8f418228b23.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <127ed26fc7689a580c52316a2a82d8f418228b23.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z9UA_4sw2KKMs6R2q5ckxE6ZzAdRCav0jhIaYJaK3Ks_1767884457
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> This commit adds quic.h to include/uapi/linux, providing the necessary
> definitions for the QUIC socket API. Exporting this header allows both
> user space applications and kernel subsystems to access QUIC-related
> control messages, socket options, and event/notification interfaces.
> 
> Since kernel_get/setsockopt() is no longer available to kernel consumers,
> a corresponding internal header, include/linux/quic.h, is added. 

Re-adding kernel_get/setsockopt() variants after removal, but just for a
single protocol is a bit ackward. The current series does not have any
user.

Do such helpers save a lot of duplicate code? Otherwise I would instead
expose quic_do_{get,set}sockopt().

/P

