Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647610;
	b=Qy3VxeB+GC5otnqLBe8iwijRey1jdLWqbLSnZ9Ced8RoTC5xgYfyjgWh2r09Qtw+c4Dj
	 f54SdCruoeUdX5fRKh3NyFC9ruLsIGdXo9/lloIA6d6Nqywgtwxph+zz6DI6b07MIKQe6
	 TRU4bv73jzZDVdm+dYluOShIHbRkVqfdeQ1BT/uQ0EJim3HvTpUKKg1OnQS+3XYrRUNV/
	 km7zKPq3c1XV5cvoySdUREeYDJMdqX9ivI3+X/PL0qk9XPkyVWQK8dcXy2tGxJ1m9x9+w
	 JPO4tb9TD0MOFm+wkmYG8YTdq1jJPVuDzNyiBkd6QqFImdn+h/+vbMegMWUUaUCj36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
	b=SnSlajyS/n+DiCJf+gnfSz0kn9tWnfnahPyQy/X1jVobmw6B/iAH1bCdTmYRN9Qoagt0
	 FqU4iqgLz+nxJszmiUt1YRw4SlZIGj++CKBkSolf4ZB8iMxYBjqPZHEwIjfmslMh5wW/0
	 UGS9w+WGkUr4Ig5iuF6qsVFeoKG95GTvh/MoqiZDLC1/HLTW4ldwOHwWZgjwe0nRztaka
	 I0XlHvvbAJKZr/ZYZNgBx2CUtH2uBkLxa4139IpHqoePf8b3gIvIMNmMaHPi4D3CbCaX+
	 TQWeCVyH4RTXpj8WiWOE6OScdGlOELFdjbJdU0BeigQJxnllfib0tH0+0lVUk6b24MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vclgwXWy;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6124606A326
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  2 Nov 2026 19:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6124606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vclgwXWy
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-67569b8cbf8so1728916d50.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 02 Nov 2026 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647609; x=1794252409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=vclgwXWyPPrwo5M6trpsTX+F1xuTXlSi0EubiwHRfVyk5mqHgJpH08RlYw8FYIbigE
         FClrP0CXzQP6ZseGPDXUrfU5/LlVrW7ex1xg6WH6FtdKRAVEddpTLqMzB1fMKigW26QK
         zKr7dbkRkdFbyrgfdrxm2ESH2WvP33e4cq0/gM9cw4U2tKSmckcdGcNOLEP3fNsIpMUG
         T+P+U+yDPizV3dqDrDTpRfOBTCSUfTAKNMKBu2QtnXF/6PvFlpxq8U2XodM1xPX3RUuA
         tutAO/5Mg8Y8k6C755lOcTkIPN1mlfNv7HDgpXnWtU4Zf41u/R9AKIsbsHQdtlHImiBE
         WLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647609; x=1794252409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=MtjYhy4qWpqi9+PifqqGm7cEuYtvlrv5ZlNIFRy7BdKhZpxFCIyAa25WIsjZpcd1n3
         MkLLmv24wtbPyMBQjJQfdkq3gW/AZk9DDrvxyBKe2iYA2R1LiY3cs+uE8ROoT8/scZUA
         PyDyQGqatpqnGGDmEL1OXOxHNmtCzt+k6H5Ewh6zgf0Jojj0rJCDRo2m2U2mWDX7+Fuv
         sEjVpbhsUD7H7p5wMhVFF7b0YRr8lFv6WkT1QS7dyPfUHZT33uAp1TVxGzJcBNXl2fT1
         TRSWKFhhwWD2j8F9FuAMao/73PAEdLDRdEK89BVtVvh+ZSPQcYM6x22j753xU9smk0ME
         crmA==
X-Forwarded-Encrypted: i=1; AKwUvBxhcRp03OavBE4zDc9ZvfXiuZJXb6U9yMguqjSal5AMaHjHGIJ/qAQ/GyLBUbE61nBaO2Xqmgvl8Lcj58Pmf0eKIerG5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ez4igK3/hTgU5S6J7rarnk3AD3UOfWGdFpKg9JcoBLtSaZ06p
	qDx25Z86f9aKn78gPMa5HA0sYrA9QHBlHeOPYz1PGX+s4ydCUXMPlX1n
X-Gm-Gg: AYBFou2uv5HFkycCWSAGVZwYyo0tRVtvELHZ5t9ZOYfWaiscQRL7xOtTkvxsH6drVQH
	+GzL25Py3uYB1Z9yIIwS8EyiIEk1Ta5JZSUHjVLKvqgFpA+fsX5eLAnalpqWFxS7VzLRwmTvAef
	dOgS+/C4heLpszMxe8lwDiB2RE/axpSL1R74qcPCCC8dI9C01ngIJ5whRBsWgZ5vdGv0oX1fxUI
	qz3k0p5vvI7Xfv3aBlB2vTJB6c1x4cpJyVR98UtA7PQguH3nnMTcLKqvc5qFxwnE3oOjmcmPoQJ
	aL1q0DkkX/Ft6ZgPDmjuKoTueS6dEsHscTkRzJbsJ71dOscUFE412FOKwIzcnLot/4enY69veIk
	D5PR3k25gwPDXKhifzAr6zmyVpneWgJm+hVv5NSyw2LoCpo1qCGrbTKF69rgAmKi4E8wyBO3QM6
	MTBjCzUj/rdE6gkutZxMaYJJOeyzyvT37kSrSUL5e2cvPB2jbSR6xPanIoZ3O5SMFtJYWE+BiTq
	5/OYhAQTzqppdlc37hr3T0mEHgOMSJe+S7ZYzQpyrcvpDYr5ZIR36Qz2SISbm0FfoUgCIi9+HNj
	8k/ouoZlMUxdR/6PCm58+DiPTKfpApJQnUE=
X-Received: by 2002:a53:d148:0:b0:679:93bd:85ee with SMTP id 956f58d0204a3-67ba4ffc1a6mr6007860d50.39.1793647608751;
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3700b8sm5719489d50.23.2026.11.02.11.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Message-ID: <d39dfdac-e0e3-4c42-9a55-fbcef6806d77@gmail.com>
Date: Mon, 2 Nov 2026 14:26:47 -0500
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
Subject: Re: [PATCH net-next v4 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Martin Belanger <martin.belanger@dell.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
 <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/2/26 13:24, Chuck Lever wrote:
> On Mon, 02 Nov 2026 11:57:57 -0500, Martin Belanger wrote:
>> The matching tlshd change for ktls-utils is a small patch to be
>> submitted at a later time if this series is accepted.
> 
> Recognizing that there may be further API changes, for the series:
> 
>    Reviewed-by: Chuck Lever <cel@kernel.org>
> 
> I don't expect any changes for the sunrpc consumers will be necessary.
> For tlshd, as far as I can tell the whole change is:
> 
> - In tlshd_start_tls_handshake(), register a callback with
>    gnutls_handshake_set_secret_function() before the gnutls_handshake()
>    loop, as quic.c already does. We rely on SSLKEYLOGFILE to decrypt
>    NFS traffic in Wireshark, so that needs to continue to work.
> 
> - In tlshd_initialize_ktls(), after the existing TLS_TX and TLS_RX
>    install succeeds and only for a TLS 1.3 session, set
>    TLS_TX_TRAFFIC_SECRET with the write secret, then
>    TLS_RX_TRAFFIC_SECRET with the read secret.
> 
> - A configure.ac check for TLS_TX_TRAFFIC_SECRET in the installed
>    uapi header, so the build works against older kernels.
> 
> I assume you plan to send tlshd patches, but let me know if instead
> you'd like the ktls-handshake folks to take care of this.
> 
> 
Thanks for the review.

Yes, I will send the tlshd patches. I have a prototype, but it uses
gnutls_session_set_keylog_function(). That replaces the default
SSLKEYLOGFILE writer, so I will switch it to
gnutls_handshake_set_secret_function() as quic.c does, and add the
configure.ac check. I will post it to ktls-utils once the kernel uAPI
is settled.

Martin
