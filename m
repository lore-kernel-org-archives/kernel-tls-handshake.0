Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC93252917
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883518; cv=none; b=nfj7AbWWiax58KNhq788Z+H35xAZpzABNza9oXJYjZIkGcE5Hy0tv8Df6xMXxswmuDRcBm2qdp+OKqAPLhXwLfro/bt5u+bUtU0vUeO1FOC/CXDCAd2eb+kH/d01eUrTW5TUG7tiNMsJvEDmnF01ixf/h/jh6zuiP/XGhchjFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883518; c=relaxed/simple;
	bh=uJ44nbEpEWeaDIiIyh51DR/9MMAn1kfodhd8t3+Mi/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkaFH3tTCHJNUgSokBnVso2VtPZUNp1YxZh/QsIY04UeC6sW9E95GJlQYF2gefRnwiLy267mKn/mZm32RlNna7xbt+pS6wZKuc9ZNUshH5fVykoztf32+vhU8l4qieaddSMIH78bP56EhXZCyG0jNVsXraL9DPZEiRgwO0D9rZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGejm9ND; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGejm9ND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9G9GBVaRvkt+4+qD39+mpxztmdx+7UqfLQ8rq+gGpU8=;
	b=IGejm9NDM3cKhjrMbVjMjU6xDGO6dyR7lwm4C2jAC/axVlXylgGjOVwlwJAnHpyG3CNNlm
	aPQr2BqrijTNws08ARaQRzhWkyVBY7TJCl6SloEq8lGKEFSiPmWalAyG2c7DGsc5RV78nh
	2jS35+34oMPFoCkXtx/cvXsZ2fUKaGY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-e7ae371jPfetUra1mQ_vHg-1; Thu, 08 Jan 2026 09:45:11 -0500
X-MC-Unique: e7ae371jPfetUra1mQ_vHg-1
X-Mimecast-MFC-AGG-ID: e7ae371jPfetUra1mQ_vHg_1767883510
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fd96b440so1662697f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 06:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883510; x=1768488310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9G9GBVaRvkt+4+qD39+mpxztmdx+7UqfLQ8rq+gGpU8=;
        b=ZYQ1Kj/QQwg16SLKtaVDHYFtG4wa1+uH9eDGrMea+4XiKQHyKniXJIetolmOIUjclX
         WWKQLxctppQWqoUcXl71oGhvfD8J2q8PEfr+rBQ3Qb2Ij3fKxpmBrxrQP5k9IJ8W6GwN
         FTzwN9/I/uGXmytbVCfhyeM/Pt59ROYxu4NyyIFRzbNjYo6yWIdx7kDeGDSCZ7uBhOQx
         gehTflXhLh7m4K8cmz+wH5TOcsT1GT0e9CffAKU4u7pXxTKSXhIK6PSoIHEH4yShRjIY
         BGLYLr4DtdlQZCLqY43NICPenAjO11eit8FPjSAw6t3/Oc7DQOlA22Ce0m83BJbNT9S2
         DN+w==
X-Forwarded-Encrypted: i=1; AJvYcCX6c/nPb8w7KgH5WHgvt54zz99B0K7doP5oexjvPU0IwaU7Vs9u6m0vTYaEY86Gf26F2J/0+5+oL1eSAZ7YB2PLb2V0tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7pm6V3L/ORMWZTDT/MO/ZrzqsbFLLkAPHIf0Lkblm9ISRav+Z
	M3N5POmuBhXU14e2nChx0Z88SdnlRLfD07HdG9XiR41n4pbaKucIqOsGO42MqladiwdhGG3ttRP
	hXFnJ/WjyDkJAzDcjA6fGAMgULu/B2LL0jme0HVdkuPmZgynWnixTb37prDOnXjcR+uYJNSZ3cH
	HQ
X-Gm-Gg: AY/fxX6hr+UCbG6rifiRQhOboSjCWdJvlWv+ZktfBD9pSboBWPZGRY0aGn7e33Od9Pq
	J2nhvfTC5WEV6MAUGv9V617mIJbLNWco5pt7m0Rz115KQC8B+Da6VU+7ZmfJQYOue6+s3SkfQ4D
	H+NhjMczEApTZyPtBv2FxEBvYKj56Ln8+srZl88jT/IzFZ/+vywW9YGwXIuvhwRRtBbTUBT7T8d
	iStZzUKbIkBhUNWsPj9hRrLpKWaa/O/cv8GNMbjULkx7sVxIBBsQGbgqlBvWZ2mGXWJh3zpkKOz
	4t/rwnEicHMZPt6JFSwH0t6etxZ3WsM37uYy5qyNK51rhal4JR46AtMJhl4hfTrfTSXJBGe3o1+
	F/BvTPRkgkFL9Tg==
X-Received: by 2002:a5d:5888:0:b0:431:8da:11aa with SMTP id ffacd0b85a97d-432c377906amr7149464f8f.59.1767883509926;
        Thu, 08 Jan 2026 06:45:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjZ12e96jv36O/fc3w7pA93fJkC/TKQaB49Tqq9W4f9f+lI2Mq1ArAa/xwJPV++ZigefYVIw==
X-Received: by 2002:a5d:5888:0:b0:431:8da:11aa with SMTP id ffacd0b85a97d-432c377906amr7149411f8f.59.1767883509440;
        Thu, 08 Jan 2026 06:45:09 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm16708196f8f.29.2026.01.08.06.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:45:08 -0800 (PST)
Message-ID: <6c8a1f56-16ed-482f-a9a8-ac840a7aebd3@redhat.com>
Date: Thu, 8 Jan 2026 15:45:06 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 03/16] quic: provide common utilities and data
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
 <f891d87f585b028c2994b4f57712504e6c39b1b5.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f891d87f585b028c2994b4f57712504e6c39b1b5.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IFz1ZXkYIm7d6QtnFwLlBKKW4X5qnkJwD-sSYCspVeI_1767883510
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +/* Check whether 'd2' is equal to any element inside the list 'd1'.
> + *
> + * 'd1' is assumed to be a sequence of length-prefixed elements. Each element
> + * is compared to 'd2' using 'quic_data_cmp()'.
> + *
> + * Returns 1 if a match is found, 0 otherwise.
> + */
> +int quic_data_has(struct quic_data *d1, struct quic_data *d2)
> +{
> +	struct quic_data d;
> +	u64 length;
> +	u32 len;
> +	u8 *p;
> +
> +	for (p = d1->data, len = d1->len; len; len -= length, p += length) {
> +		quic_get_int(&p, &len, &length, 1);
> +		quic_data(&d, p, length);
> +		if (!quic_data_cmp(&d, d2))
> +			return 1;

AI review found something likely relevant here:

"""
Can this cause an integer underflow?  When 'length' (read from the data)
is greater than the remaining 'len', the subtraction 'len -= length' will
wrap the u32 to a very large value, causing out-of-bounds memory access.

Compare with quic_data_to_string() which validates: 'len < length'.

The same issue exists in quic_data_match() below.
"""

/P

