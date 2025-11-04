Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA5314A97
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762250110; cv=none; b=gNgxJqfyLNTmXJtfDvrz98GzqfKe/WgvLdOTYaqupnoUdf+KYYZcNe/Hd3dwpZw4FMMn+m5hNZRKWQtCecvx/7Yx2hwlV3Yod1P6P7w5yzCetE/Nvz4NP14Fpca4QLkGeuXYbwiMuXRZSGVzCvxgRJgaiWrqAzed02ld4F265rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762250110; c=relaxed/simple;
	bh=QfSQ5cpqVePGEDeF20Ht8A/SzrjwwOLDakiJXtv47U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWqyuqKaBZ5i0Im5nasjQyuVhKhImRkFgjRAWgt/n9nZITFn2xSxeS31+Z9GlAOTkFbUlcRSl8Ur0qO6DxGKcQZjYnWEXdmlk14FDH0IPPfsvdu95FznPvp28qTiAQfMpGRiK4oapUUZV5FRdHQZpiG9vcO5EnKdZJHwFnURbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQcTEQX8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQcTEQX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762250107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VP7vTJNouoan64MmsnztfHu0gZfK42bIBxJmyPWNcv8=;
	b=IQcTEQX8PW7A2EKkkLPTeicvAX6AybTRM/I63+gtKb1r0BknExu5V0NDKBDFFKj/XVwDzm
	69tlH6mI7FQQRAeQt2LjomSn2O7GJ9W0sjRuhkXQ6wAjoplEHT7W1VtxzE330RnUkOMtl5
	GLPCQ/FP9t+SIvhCEcmbRDYcaktJRIU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Gc8oAJFkOk20j7DNm77GLQ-1; Tue, 04 Nov 2025 04:55:05 -0500
X-MC-Unique: Gc8oAJFkOk20j7DNm77GLQ-1
X-Mimecast-MFC-AGG-ID: Gc8oAJFkOk20j7DNm77GLQ_1762250104
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4770c37331fso38207095e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 01:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762250104; x=1762854904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP7vTJNouoan64MmsnztfHu0gZfK42bIBxJmyPWNcv8=;
        b=mtsWd6yLq3+JtZcYiiUkWBDZIC2ogk46KcoFEPkts5OptLhFohyAAWfMu/jgUNj+6U
         LPLIOI0kwxnOCWF9WkasIO41oD8gn/Sh5D/amlWQs24jyHHrzee/ykRJcXCUo+Trqe+y
         Eulutf95/aOxerpsj72lN6B9nMIHiX78ovFqXsPjrUwJInMoHJKarc1N6Z4J6bQB1lJf
         9yyCOT9LRjcVSlgZ4GGHvs+ntZMv3ZK0NFq+ZDraQB/BYZcgylI2dbvq+wwO21SHiUU4
         2N0iajI09v1y5kdnTPgICd5TMRb/nZGZVyVtF+BWVb2J1teBEXIeVae00hfgbzj6AApj
         khGA==
X-Forwarded-Encrypted: i=1; AJvYcCWXbCiEIc4l2orBLDMVlATcYTfgSrI3COVRpIll12JjTSf1sk5YII/9QiPQFmC51BsFjI/nLsp7Nx62U2UqIOfjdNhkwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeyZ+rY2iPQbPm16aPWYgck5R017AJK0nLSirvWG7ITdAUKIuC
	cWNJIs3yzgM/qT5yx70Gk1s1BrFv/lOKrgRB2f0EGbbazqvxulcE3upiZk+dxfkfd4qfrmRXw+R
	e4cOJdBShhzS1Kg0K88aMKJ6N3yAjyYPa0M5iO0sClO0+XFl7FWxn214D5DzYY8lBMct0C3+LFs
	Kj
X-Gm-Gg: ASbGncsAxIJCjiSOO+R7Qlw36hHQkqMnH1XlZvGDrxtjJOfExu3c65UkmGH0UtHmp50
	Z3jzU/LUG/YLy8jnDkcUr9lvmF8hmfXpZyxZE/AGycdBdokoY6vU+0bTz9G/zB8ZLwzQwoO5o7M
	tqbGxIPy6YftP+67/A2nBnt8yDhSqI6TX0bwA/a7z6+upEJ/+8cugOk+lOvxQaWVnQ5mt4KnNTn
	doPE9SQ40AXyF/d3BlLsai2DfK+gGrWHeLISb+96prqXpGyQKXVgGyw4wv3jFmWq7aobcmx3PAo
	Mi3b63YmKhXC+xrefY0O6JGCrCmL/hRFI4NZAtY5bRXhOMZDM+cCQmUuDY1NPSDQMJopBKRyh3O
	NVoJf8u6K0IxfDD4pdpCzWpAH6iwBa4YTp3er/pmLtx1m
X-Received: by 2002:a05:600d:8394:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-47730ef502bmr102634815e9.2.1762250104380;
        Tue, 04 Nov 2025 01:55:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6j3suXJsdE1W3rADP1TPpeXGC+84lF7jrCGSmoPCopSvWPQsrXeTI2soLtfPTzeuZHI21IQ==
X-Received: by 2002:a05:600d:8394:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-47730ef502bmr102634195e9.2.1762250103915;
        Tue, 04 Nov 2025 01:55:03 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775598c2c9sm28545315e9.8.2025.11.04.01.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:55:03 -0800 (PST)
Message-ID: <1fcf4639-4c3e-4c07-9d01-0537cadcff42@redhat.com>
Date: Tue, 4 Nov 2025 10:55:01 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 03/15] quic: provide common utilities and data
 structures
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
 <66e48fe865ea67beb2a7f5cf084ea86d93592dff.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <66e48fe865ea67beb2a7f5cf084ea86d93592dff.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ird1NkHmX3ilvnVnerxye1ridclr8_aOUyavLG0tnEo_1762250104
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> This patch provides foundational data structures and utilities used
> throughout the QUIC stack.
> 
> It introduces packet header types, connection ID support, and address
> handling. Hash tables are added to manage socket lookup and connection
> ID mapping.
> 
> A flexible binary data type is provided, along with helpers for parsing,
> matching, and memory management. Helpers for encoding and decoding
> transport parameters and frames are also included.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

