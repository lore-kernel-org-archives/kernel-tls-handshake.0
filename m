Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CF38E5F6
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919512; cv=none; b=pYDlzI7sHmqXlIZAHfc4gelJjM1AuJdcw8SiFtrhGnPJ+K3uCfj3QU3Agwlv87i/ybtfKYbjicZJaKeTTHLpk3igrikS+lrSYEEvCqNHQM8w4eTS0X+avr0kBhwDjZ663rQjaSbqz+lSsb4j9Emv0oI9QSX348asbt0hFOQ69iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919512; c=relaxed/simple;
	bh=f11dCp7P6vtG0fXeypBN/abvJwiZ5XOizrijrXdkHk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcJstBKdRpCN1+DqiTzqkid7mQmQD5/IJp5fNZXXIItdSuqiF3267cos26P5NuN3owXLvGzm9/OYgry1vNFkXg9w+C7yaWF1NqqUuYUNNplI4AtgeY857YWkEtSkze0C41kdpQVfLB7oGOLxvBwrRM7Pr1Bq3WbJbDwy6G23vUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T4GLvUZp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4GLvUZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768919509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trifWfZ7aWYVX11q/l4Y4wctobYfLQu9Hbg9myXq/us=;
	b=T4GLvUZpTJ9e2oQVl25z9fQlCFrghhS4BBai8mwYmuV/u6M3xNwyYMOCAp7EEM7S7nw7iC
	zXGiPylPvp6iNxf/cszVKxUj1smmPIcUDikXmfbSkwgsHVJWGx59Xdw8+Cka0nlqiC5nDf
	ReNU7degmENXvuMmuDNDOu6ZBo7XhGg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-6oaa5fheM6yAdfVVY_OrNw-1; Tue, 20 Jan 2026 09:31:45 -0500
X-MC-Unique: 6oaa5fheM6yAdfVVY_OrNw-1
X-Mimecast-MFC-AGG-ID: 6oaa5fheM6yAdfVVY_OrNw_1768919505
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4310062d97bso3698571f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 06:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919504; x=1769524304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trifWfZ7aWYVX11q/l4Y4wctobYfLQu9Hbg9myXq/us=;
        b=m+cWB0x1Abk4pvY9X5qHRA9Kw0eQPNC1owERDLERC0dYfzW7eRuamSqQx4Xbyc3+ce
         5qBwz1YB/QwLBQ1MDs3i1qtjZftMm6JopssmoSLZ32mEK0L35PxjMnAWuXb5M8XapPo6
         GGyaESIJUs5NV2B+lPQYfY3wW8N3GNc5a+6Cck86Aki4lnpn6ERbLzc5a97O2YHXFgtA
         5f1XeeulmMijG9WrpK+vs94GEDnXC0bxZhryhskLqlQlOHkDtzBGBY6mlwIuI61JlQT6
         5FJAPfuvRU91xyTZjffzYakccPjBaKC2jAtw8BRyx3jH67bVyvGljLkAFR1wd4+12wdm
         28ew==
X-Forwarded-Encrypted: i=1; AJvYcCXXZClAPZv6xgLhqkq7lBJNaAy5piHZTMsSXvDCjUc00z6JbW2aPrX46AsSlbzW7el8IzUpbAXCkHHCEw0pFo9uP30qnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqCqxW769m4dvRB2msAKiWpv+PPKDxADrKgIzUi+90md6YphGb
	8POQj4l7fEnD5sUwx1qxpubzB8FH+CzLCu558EwcH9+KU1BBzpWHSsnuzzEfll4LfdD29c0IYmn
	zT79T26ycTazmU7MKWJaljhtkDB17Ry0V6eM+jIscoQwfxeqQRAseY7xfV8p306NOOTxnkYZEfr
	fu
X-Gm-Gg: AZuq6aLi4GOctKCGhfATzWShNkmF1Qzx48+UZsRokBHGV8QBahv4QAeOoCjmwFrTAQN
	Z1YeJ+A3RP3D1umkWNTWCIo3frHsT0pTQ8MRGFVxO2j9+PLe9B+PTso0wAkEWESOwY21vuR/6Wm
	qodn1sm4Tjnr2m3TcU8SG+jROBuLBuHudiR+x1IpaQxzFYreE+2F5rNP1taxOKaBm2e0L/u7Amg
	klt67ndUPelhOOoFjstLAAtVDuByS5VzNJ2tYvgFsxgRBDYQSc1HO3KWD5GYB5aOVTAbKaXdQ+j
	xQmrUfJCM2DBwvUoi3CeTdUA7xj53GJO/+RouJvIQgUZySoO86PUDjaWF/nk+imq8eX2ujZwfxi
	J2XXfEoprhVaO
X-Received: by 2002:a5d:64c4:0:b0:431:488:b9bc with SMTP id ffacd0b85a97d-4356a026502mr20090549f8f.10.1768919504596;
        Tue, 20 Jan 2026 06:31:44 -0800 (PST)
X-Received: by 2002:a5d:64c4:0:b0:431:488:b9bc with SMTP id ffacd0b85a97d-4356a026502mr20090480f8f.10.1768919504090;
        Tue, 20 Jan 2026 06:31:44 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999810bsm29866110f8f.40.2026.01.20.06.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:31:43 -0800 (PST)
Message-ID: <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
Date: Tue, 20 Jan 2026 15:31:38 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 15/16] quic: add packet builder base
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
References: <cover.1768489876.git.lucien.xin@gmail.com>
 <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KVx5Wpd4RsAXpjS13dEQfDGP4jH2wK55lgMc1L5SfAY_1768919505
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> +static struct sk_buff *quic_packet_handshake_create(struct sock *sk)
> +{
> +	struct quic_packet *packet = quic_packet(sk);
> +	struct quic_frame *frame, *next;
> +
> +	/* Free all frames for now, and future patches will implement the actual creation logic. */
> +	list_for_each_entry_safe(frame, next, &packet->frame_list, list) {
> +		list_del(&frame->list);
> +		quic_frame_put(frame);

If you leave this function body empty and do the same for
quic_packet_app_create(), you could additionally strip patch 14 from
this series and avoid leaving several function defined there as unused.

/P

