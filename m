Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624552ED141
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260465; cv=none; b=pLbBhvU1lO1yLh8TVqVTIvvgZBu9OfAYKWkQS/UNT92uQsmrEHUdkhm1sjz+qTcmFIEZH0XsJ34GkRumjfKa/WsRvk+oGkt8TzsuRc9es1DY7fBGVgKUzs5xON6F4VhFAvs6oivl3Wo9dNDt3D57hqwmTs++iqkd21SfHzEPVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260465; c=relaxed/simple;
	bh=g4MzobWCgMAbdFKqXdws3q6G9OR+n0+6vpq9/2gGiYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/AWrV3FMfzRxm8eLDF20dSV4c03fyEZIDKRhf3lOEJZieATEtJ7ohcRyYKz7E2aVFDSABSec76o9y14ek1Sf0HKO92oQqyYIX2Y+As30evk723BNxbKfNcRIBBmp/rZjkCb2Qc+oYtyNTIjfXvmJOcuOuX5AKSypu/8/Wx0HRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMTaQf+k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMTaQf+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762260463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWnifgGT0AcayVvuS2yfUcRlYF71GXMXDqlq2lq5xps=;
	b=aMTaQf+kuhxc2tgeFfGbWZ8kMFlMNFoDO0FPyNdK2ZsjZMlB1qDl97ZkyaEUwZ+Mo2oXOp
	P66RADyxlaaASAcZzSyE3IFccKJsbDra+W/VatHkq9cHOv+YAhhlsmc6Q2aZU3AkUckb2T
	3DKlvdHebhDbT5A9q7csq3oxvIfjKyY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-Y42OXYJPP665kubuS1St_w-1; Tue, 04 Nov 2025 07:47:41 -0500
X-MC-Unique: Y42OXYJPP665kubuS1St_w-1
X-Mimecast-MFC-AGG-ID: Y42OXYJPP665kubuS1St_w_1762260459
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-428567f67c5so2678006f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 04:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260459; x=1762865259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWnifgGT0AcayVvuS2yfUcRlYF71GXMXDqlq2lq5xps=;
        b=m3LN7ZZV6dHl+UOLsAyccAdxOUYkliLGMkv110FoQyl421mtrcYtGBk7Ya4hUZx1Q0
         tHRcdy9umpKb8mtbcPCaD97AGvJUMKVTirfjw1yTDSgTMvhpb4oKRE1x1AuRk53WQbiM
         OJg9/Hn6kTD3QnQOZSih+4YXcJF3jjw/6ZJ8ki6Vcn8McUP4zW5fwFXPk8qTkfXqz3P2
         VRfOgEDy6+52lwjMBQKIgXt+Ib8kFipY1p9leV68VqbXnxCqqcm2C/zvEFV1oD01vw8t
         6pFVmrWA+Nvsze2by2yTBl+FfGLQrxQMx9vuI0GC/qrn7r24fvPcmENmtf7gc1UKOT0I
         2hwA==
X-Forwarded-Encrypted: i=1; AJvYcCX5iO5URS6Hq6bkAqzEAH688aYUmq5KYf9LeAlYp6Fhtfh1CF0OwQpBn0H6jQN2Nfmxq2J9V+i8FTHROq97Q9eolv5+Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6T0T2xrYDvFdGMbhaQBDbhFGLwjZvIF9gtdUr72EmScS9RbLc
	6vBk5LyX9ojEkvL9yCGckmvB44tq18g24rSTtlTQVaBYY1BTWbwVTStx0Oyf0MDdy1GwTeqe0ow
	Ek0hJf4aiw9eEmnfq9WEfsHX5vpdOwwe12cy8EPwOAY9djlnX2HYGmji88hVs2IDK/tKUfIJxja
	+4
X-Gm-Gg: ASbGncsqb8M5g67KApxN24TVbJafe8ik5v/VeHnLlcoZ8ghr0DIzq527n/gCN0GeMrO
	wnx3jTiPSAcmcB2riCy45GMT8kaqucqI0WCU0bYWsUfdIDvKtFL+1x+ArK43pZW9/ml119qVjvn
	tN69WUAgd/Su86+zwsTGH7x8sNtnoMAwXTNedCM1iGz+mAHiNUp3inDpX92oNi1jzFsiQdBVLl7
	p0U+aaFkiit285whKImMxg2GPMVT41ZIjRexOLcNgjpOFrbZpYRvHZspv0iPQUgIfW0G1Dbf9OB
	uBAvCku0x7z9nO01iSrhjoGqHM3ZRFeXU4HZRDWm/zxAQgHdZv54RW7p+r2hF9My+mRMbo2kW/e
	397L/pmuPmydIceK/Mpcc/t6xqVYmh9QBn+A1VncLqzBL
X-Received: by 2002:a05:6000:4b0f:b0:429:c965:afa with SMTP id ffacd0b85a97d-429c9650c2emr9026846f8f.36.1762260459275;
        Tue, 04 Nov 2025 04:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiJ1SiVaPavd71LCb0yruPCRV4eS0waiUfxW8OCw2NKcYZLnottK8w5LOXobrD0/V4oRg99w==
X-Received: by 2002:a05:6000:4b0f:b0:429:c965:afa with SMTP id ffacd0b85a97d-429c9650c2emr9026809f8f.36.1762260458840;
        Tue, 04 Nov 2025 04:47:38 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dbf53e86sm4620311f8f.0.2025.11.04.04.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:47:38 -0800 (PST)
Message-ID: <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
Date: Tue, 4 Nov 2025 13:47:35 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 14/15] quic: add frame encoder and decoder
 base
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
 <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3whei9q19C9-dU3Cnv4h16-JMWxLntpK4O_CC6jbay4_1762260459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +static void quic_frame_free(struct quic_frame *frame)
> +{
> +	struct quic_frame_frag *frag, *next;
> +
> +	if (!frame->type && frame->skb) { /* RX path frame with skb. */

Are RX path frame with !skb expected/possible? such frames will be
'misinterpreted' as TX ones, specifically will do `kfree(frame->data)`
which in turn could be a bad thing.

Possibly add a WARN on such scenario?

/P

