Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329380;
	b=w6SuR6TXyNq9yGDt6kS7gY2z5XfgQUvsKZvVzyIag3PLpS8TfRZilERXzQeH44IpyWeP
	 2MiRn2rXcQ/RPl82FGirgkX3a5xNfWqQoJlUl0EHgW56gBWyB/5vmxqm6DD7qkSHe2Ur3
	 j5R+0YwEorx7/01OJpnvdR6f22lXaK5PCcBBXofkfzlOckhB4hu71oQ94gtjgfJWFUnXe
	 LConTeKKynJe1NztXi1I6IBrZewGLnhYh7dWJA+JqSipIQG86v28Dx7SWYuEQ+SkkqK7i
	 CdANtOfXmWEluorj8JCP8x52wOLmyLYEkz/8v+tPObSh1qj8i+5piQ1mtDhTUkxK2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
	b=TzNCNyxYLN736/jbq4kUvSnaVQQCv0vG9uyFM2OeIwQYrmml1mLGFyKnNBgcRM1+2R5m
	 aiEwoK7vTQ+nf/04tG5jgwEbnBzZq9XxmKwY+o0zxWlj93npUVkKLVb+O4DL1cft/qtw1
	 r+An5lw6bOdkpNqXE+2zLPc2qtJzTWRdhi+yFdSObc9vp2pr1JdxEMZfXe4YBoMacR+u8
	 5kjPY6nZrlz+qIBWeYQUv5oSj2YgiVG+NXVAedVB6Stv3FuOkFMf1qa4hF+ZMIqD4b/ee
	 RM1f68TRigZZv3m8Wtk9Ot8DyQxvvxpnRoh7WW8HhNkwCmp2sL0x0ktZeIsFHxvpG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKgVmBTq;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B752606A323
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 16:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B752606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKgVmBTq
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso1548811d50.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329379; x=1794934179; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=pKgVmBTqgbJCZcdQnTctN4VwFDBGSl+LXyKF1Fnf5Rgs3cMTUhWLN8DSxuxKuOrVYS
         Nk9Lcb75iuEQ/0qgv+g1iby+slzq18nrlycX7Oo8+S4ZdXttLTVR/aXVsrE8711Rd973
         sZ6m7k794JP7j8WJjZQMpnUaaXDEIFkc3rGb6H2gcs69sMyivb41lgp3/t7//P2j4vjT
         W0K8fgiztRW2T1Z7ftvsra+gYSDP+IymIAQ1yQ8WqLobZgMjRS9SciRyJ9JnaS2AMnjy
         XneIHrm/4LkOF0cRueWTSTbhAozkq0DJJ8HKZi8KEZIPelAYN2rofA3UPcHP/fSjZYOA
         f9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329379; x=1794934179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=hzF8ny3yUVKeqIf0kQIojGtpZzFgrJS3wq5xw7j5yVWfJsvHMWv3iYzkUUzJosXcWa
         3kDyIpl+HL4DNTsG8YmnxspE8QZtJ8H847jxOdD93nYbVFdoQ61qi7hvrprtmcTEroBq
         ZduRBKilY3m7iC41HuLcmU+sO/QQQ/d35eA29Id3knGKRTUEOyEwPOhLLgmCQuGsQlsy
         xV/SWsqyGO7FAtDUso/PR/h9iYWbmx3xaPdBrGgQ3Uxd2LvzgCr4ht8FudiQ/qXrgbTZ
         LeqxzpHt6xdNql9H/jIsq/mqpcaYN5wTvpGasb7iWWYqSOM/U03PEia4Q/JbculXK1TX
         u++A==
X-Forwarded-Encrypted: i=1; AL+hErHViwlEXUjqw7L2+ehTP2ag5U/WgQ4mxyR1UjAwWAqc9VXx1GFbuJkEzSolP6MfTPTgoAs2MtdJd2AjEtae03/ewQvocQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/EekTXwkqoYNgfICjfNVfgKQpG8bwqIClB5GwIP21JFanXqvd3
	tkw7c8PdBQeG2PtSHSFoAdg4DOO3yUm187Epo6sHhoNWpdgWWKXx0+yS
X-Gm-Gg: AYBFou0nxZc1sfkpj/dDX/r9Mo84LRuKMBqLXmk9vnslg19xc//4kVdC4340JdNfeqO
	oKShRwDX2JpgnUu9chjZFcgGHPeepgZJFPn07UJVtUhlREvGCIkeC5w1GVC5NaVr0Gy611fEq+i
	f3khVATRYEpFP7eL1t7UEGsEl4m7N9ncKuZsysm366PpAy9mN+zliMXaOj3J6V1DSiMGELYuhoG
	3U+zEBGu6fixRaTW+bbi8zbeywBg2V48vn7+0gVGQ9Si5A0rSqLLvnoF0+jbIGDD7HSbsI4Cr0+
	q6ym1b7EYd7UvBUMWEg+jje5ZsNVNvMOVUCxvcqEh812porCovGENyqCa4CRdFGspfvP9afIBga
	LVmH6bRC2MXd1ngDE1VbImyxwAdpHsSm9W9fk2dAxJVc9ZYSW90SiLypBRQeT/ejPAxSZJ2dxV8
	IUH/5hTQ8SnJTUh8M1qlKy6fjBK9+DWswfMq3GqXxNHLZOHk0CIeNbBM/tvPRMi8zlQJwIiabU0
	Q44hzl5GCKYARTBhW/EpXpV/zarsnxDY+BtBlK6gS4qrAqmdWXVQrLhBsC0OQrE1hyyeP56+4dV
	cpBRXYf3L35ycgF21NAaW729I+NsMMpduD3zeZW7w47mgLUKghSyjMLWpA==
X-Received: by 2002:a05:690e:12c3:b0:67c:fa4:2b9f with SMTP id 956f58d0204a3-67c566077bbmr2140240d50.15.1794329379380;
        Tue, 10 Nov 2026 08:49:39 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2244105d50.6.2026.11.10.08.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:38 -0800 (PST)
Message-ID: <83246c2b-6663-4c52-95f0-50dac116570b@gmail.com>
Date: Tue, 10 Nov 2026 11:49:33 -0500
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/6] tls: update the RX key when a KeyUpdate
 is received
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
 <179424471155.994134.17986033334400694237@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471155.994134.17986033334400694237@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> What happens when the KeyUpdate is not the first handshake message in the
> record?

Valid. A record with [NewSessionTicket][KeyUpdate] is legal (RFC 9846
section 5.1), and the check reads only the type of the first message.
Mainline has the same gap: tls_check_pending_rekey() does not set
key_update_pending for such a record either. With a registered RX
secret the result is worse, because the kernel owns the rekey and the
connection ends on the next record.

v7 will check every handshake message in the record. A KeyUpdate that
is the last message will be handled. A KeyUpdate followed by another
message will end the connection.

> The RFC does not forbid a KeyUpdate that ends a record with several
> messages, and the rule the code enforces is in section 5.1, not 4.7.3.

Agreed. The commit message in v7 will cite section 5.1 and describe
what the code does.

> Could the comment be reworded so that a future caller doesn't assume the
> old key still works after a failed rekey?

Yes. In v7, the kernel-doc will say that the key may be unusable after
an error, and that the caller must end the connection.

> Should Documentation/networking/tls.rst be updated to match this
> behaviour?

Yes. v7 will update the "TLS 1.3 Key Updates" section and the
statistics. TlsRxRekeyError will count every received KeyUpdate that
ends the connection, not only the rate limit.

pw-bot: cr
