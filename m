Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6AA70810
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295915; cv=none; b=lu5rvlbXMWQpp7vGUrtt8vnmaYcu+bvrDyGgOWn/CNywd4AE1t3Hs53iavSSkRbEDNhwvZ4Ohqr4YbM41189Jbdm76k+rO5hAvdBZx7nJ1WBH0NCMz5C6A/RmBE/pOeh8PjN1fAzHoRfaKhaPCTmHDfXUTiq4lToR2eVYTo/iOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295915; c=relaxed/simple;
	bh=cIIrTOVlC3bXSKi+mZruvQiu25kMcY3J4iVTy2b63e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwfBJrWJ9c0D6O454Yy8aCRoXJ7EcLXp/Pw7EPdFHkIN9NMFl8D7F51aI5HpWS7e+jm8WdgYbIduZKbB9+kmb3WzLscLUYc5aJdziFmmESFvOTlUA2lx91bo37JYLf7wWmEXoi4yV1me4E0MVa9XjOmGoSyDdpKAKGYqXDQfO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1DibesS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1DibesS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770295914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KqqY7o17giM2jgPy+d2XiGnDvxNW+2fee3IUyYpT+c=;
	b=B1DibesSfMf+ZAa3f6axClUZDVcmnWHtT8sxYCQcCGJUyMfWYSgeHoKH1tD/JaTH0/wf58
	/AQPfAEaZO39H/5h6oyAgTU0X6FSlJwhaMwowXyOP9npwvbydJ/9CQWZno9ZANXPD6gmBb
	0vIgMiVbWxi99ywfOFURMyFDZJbVoXo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-RuYXUOr7Oka39pu211hfFQ-1; Thu, 05 Feb 2026 07:51:51 -0500
X-MC-Unique: RuYXUOr7Oka39pu211hfFQ-1
X-Mimecast-MFC-AGG-ID: RuYXUOr7Oka39pu211hfFQ_1770295910
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4804157a3c9so10878125e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 04:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295910; x=1770900710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KqqY7o17giM2jgPy+d2XiGnDvxNW+2fee3IUyYpT+c=;
        b=Xq27Y4T1HHw+pkKxqRfUnV3mZKzeyq/5H32HR8fxLKt8POIUbOi0HF3fqO90Q/Bmk3
         eVIc5On0liHZ8P+PM0iOtdkbPPDiSkr/wqCmVFgAS55cWRALAbUwp1dWsvInayn+/cnZ
         EfULNvBJ5IG2p5pu7JQL/hlBZoSDg+7OjCvZUjsWQOXQClNA1hkyfokER/0U38f4KJNW
         ZCRSr35CIMzpWWIz1TDH8pVIAlLIFTX/+5lFA6SHhIn7Ktui/D3z6ScIvGVhmRJldT8N
         i0/SWSIWELTYIBgOAwn+cQ2sYi1YRHma7aQAa8B59vsmI00Pl0cAgRkYcwJf5enOVdPY
         DN0g==
X-Forwarded-Encrypted: i=1; AJvYcCWQdyu/xTC/Aqo4HXr5auX136R0I2HVjIbK4jcOXzCHXLEJhsCf4FPkELlaXkX7rPeoUgAMmvmAIuSoi0GxpQw3VWXXUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Z1KnjUr7e/OH4kiv8aqNrWrGhDmhILwe1jkXDfmCAcxHeh8Z
	O2+NcIbxzIrgTfpsebHhOvLWkyWYAT49W9O8cnU6lxlQIOCYMCjgNjqtPTxRHIqWSVKiJhLvdkS
	WbwbjGRTVDvC2o/As5RfYqX4T1kd6ZOXMbVBaRQem83Dbd46okp6nRbmGDZybXqj/2Ap9ahmVNU
	qi
X-Gm-Gg: AZuq6aLzn/zdFt36S014hRM95CcwXjTAXQ+llonuawzA4LXwFhCfn/Bow2kLwR1mPL5
	sbyxqOnEC8Zbf6em2aWvUArdJ3PT4ICEEP89FHf+ab80ObXMlU3V7Uq09q4OCihIiZA63umGhyN
	yY1rDnyr5Uiw7Do2a2aXPW5vHXY2HBjnl1JAosK3bEapxg/CD0ySvLYCLfHZOz/rZZrnhv04PVK
	OBOuLX4i4vC0xWw+uIC/cxXgHFOjBTpyVHHSMFvDcfN6s3viq6eui46mrNtZqrh1ZfrxD883pzd
	boaa0gj4seqxOOR3jLt5hFxiI4RuUqQBC8yh+R15tl7rL5hdsLxA6z+f0nhndkJqqTfHMiMQdUP
	NaKiVPW3OCqNN
X-Received: by 2002:a05:600c:3e0d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4830e96fb0cmr71819275e9.20.1770295910312;
        Thu, 05 Feb 2026 04:51:50 -0800 (PST)
X-Received: by 2002:a05:600c:3e0d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4830e96fb0cmr71818865e9.20.1770295909848;
        Thu, 05 Feb 2026 04:51:49 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe5614asm63353995e9.4.2026.02.05.04.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 04:51:49 -0800 (PST)
Message-ID: <1bcfe20e-0103-44a5-82b5-90cba7ba5a60@redhat.com>
Date: Thu, 5 Feb 2026 13:51:46 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v9,03/15] quic: provide common utilities and data
 structures
To: Simon Horman <horms@kernel.org>, lucien.xin@gmail.com
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com,
 alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org,
 tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se,
 quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com,
 dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com,
 pc@manguebit.com, kernel-tls-handshake@lists.linux.dev,
 illiliti@protonmail.com, xiyou.wangcong@gmail.com,
 andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com,
 matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com,
 metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com,
 dreibh@simula.no, davem@davemloft.net, sd@queasysnail.net
References: <74174c085fb11b8a63e72a7df730b6f4a7479c5c.1770042461.git.lucien.xin@gmail.com>
 <20260205115449.2195294-1-horms@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260205115449.2195294-1-horms@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _DA3XN_yIcxYiN1INa885r_8T9D2hNC-7O92YJNT2sQ_1770295910
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/26 12:54 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> quic: provide common utilities and data structures
> 
> This patch provides foundational data structures and utilities for
> the QUIC stack, including hash tables for socket lookup, connection
> ID management, and helpers for encoding/decoding transport parameters.
> 
>> diff --git a/net/quic/common.c b/net/quic/common.c
>> new file mode 100644
>> index 000000000000..94321f3f213d
>> --- /dev/null
>> +++ b/net/quic/common.c
> 
> [ ... ]
> 
>> +/* Reads a QUIC transport parameter value. */
>> +u8 quic_get_param(u64 *pdest, u8 **pp, u32 *plen)
>> +{
>> +	u64 valuelen;
>> +
>> +	if (!quic_get_var(pp, plen, &valuelen))
>> +		return 0;
>> +
>> +	if (*plen < valuelen)
>> +		return 0;
>> +
>> +	if (!quic_get_var(pp, plen, pdest))
>> +		return 0;
>> +
>> +	return (u8)valuelen;
>> +}
> 
> Does quic_get_param() need to verify that quic_get_var() consumed exactly
> valuelen bytes?
> 
> The function reads valuelen at the first quic_get_var() call, then decodes
> the value with the second quic_get_var(). However, quic_get_var() determines
> how many bytes to consume based on the varint prefix in the data, not from
> valuelen.
> 
> If a malformed packet has valuelen=2 but the varint encoding requires 4 bytes,
> quic_get_var() will consume 4 bytes while the function returns valuelen=2.
> This could desynchronize parsing of subsequent parameters since the caller
> expects the buffer to have advanced by valuelen bytes based on the return
> value.

Hard to tell without any caller for this function. Possibly you could
drop it? IDK if enforcing such check would be correct/safe from an
interoperability PoV.

>> diff --git a/net/quic/common.h b/net/quic/common.h
>> new file mode 100644
>> index 000000000000..bfec0aaf2907
>> --- /dev/null
>> +++ b/net/quic/common.h
> 
> [ ... ]
> 
>> +#define QUIC_CONN_ID_MAX_LEN	20
> 
> [ ... ]
> 
>> +struct quic_conn_id {
>> +	u8 data[QUIC_CONN_ID_MAX_LEN];
>> +	u8 len;
>> +};
>> +
>> +static inline void quic_conn_id_update(struct quic_conn_id *conn_id, u8 *data, u32 len)
>> +{
>> +	memcpy(conn_id->data, data, len);
>> +	conn_id->len = (u8)len;
>> +}
> 
> Should quic_conn_id_update() validate that len does not exceed
> QUIC_CONN_ID_MAX_LEN before the memcpy?
> 
> The destination buffer conn_id->data is a 20-byte array, but the len
> parameter is u32 with no bounds check. If a caller passes len > 20, the
> memcpy would overflow the buffer.

It looks like the check responsibility is on the callers. I guess it
would make things more robust and simpler move the check here.

/P

