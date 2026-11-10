Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329705;
	b=C9Zr5vPmw90PexGfxNB9VkpaJlKe9G9V3N3e7qLem1KtqkAQiME7rvBbcr67Z2IdSpDX
	 NLFdFyk7q+jRpQwbGtVJPIS7AD7YMsCBzAY/Iu82LvRwKYRxYsuUIhXfnk7MdgjofPTZW
	 Chk6fEqZbwoLm6U8E9QYARywUcjzTCrmpRpLQlAOaZvs8C4bqUa7soLEWxMmTlY6b7XOU
	 /IV3StQiccjmukYhqMfmy+Jve5kp2p4iJut9ZbsTLuXCwu+A+rW3cH5ac6Tt4qRsAVoAl
	 6QLcwrtzSra7eAZ9hDuy9cnERnDhdDW64hzY7jIWr7T8ptDQmfoxEkSixvJaTbUnpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
	b=AkEJaDoQTsOoKhagWH4Z2yOqnZHAGjmd5Hx/0Gi9gytYxx7W4aYhF3f9pwsNdz5RdENh
	 sJZ0KPHLKSbmkh5AuZAG/IYdXgc5/L6fTezqxvKvukXEx+V8eVdos/PzwKpn/7fl944H0
	 L2cSF3zBoI+dVilhTvklltpRGfBuDkXGvwUpr1RNGz7OrMSksMNvVyZPXICMplLv5fwpc
	 0+gmwvWQ1hrhb0iVhenYS2yZ9YeLLDtIoC8MI940opxaJ2afhN5zmB+dBIO4lzBEbXyt4
	 VBC80HefPFja8NADWfFw4ykwAn3VfpOmHHJ06DOlqPTMa25BUiDVOHdaZ8ADmzoJV/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gud4IvSP;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B9606D201
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 16:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830B9606D201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gud4IvSP
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a3d39e403so1526195d50.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329704; x=1794934504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=Gud4IvSPafX1gEB9OsZex2xjUS42ON+5PHvkwNFNfaDydesWHSIR+IyLOkFLo7UsAF
         RecGZBC4Zjda7indta1M+FDgFhLnVNu7/JQEBqrB20hDkMmjZCiw96yFx/cj3ASf4O9b
         H/+gEkNoWXk9cJ1CThb+8YJlksCZSQ55VPdI7yiMBUjBmF+j7LocaKR6r7wT8zWcvEhM
         ZT7ny7tVUo/tyEA7S5hPIfs2CJyzaGoFW3CCb2wCUp9frYJYf0tHb1dOqBJu0QJkSQ3o
         sgX46Gsw7m3EdckdHCbNjr0gnejKZ9Uc3sAcba5CIJHY09tjzVrdqGbKS7LMADMAdLbV
         XIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329704; x=1794934504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=jDQeZok0RzVi5XglIgCa4iwmzKTz2XBhO+MwhaiDY0SKX6qbMzquwAsumYAr68Oa7U
         rl/UWBgL9WV2voXftbBu7Xu5zi9M3v4ooZ7lXT70mkKJjtKlV7TB/6oz2FCZeyAfSQpI
         WY6UQnppr5kN2MKUzVmF/BO7idCSZCRMxgkYeW5ShSItxOGm4jh4HqZtVibvxob97jDm
         OMNS6GR1rzzgxgyPVAYmLq7L8Qaowza9R8cWGNgXgwiOLDFXg5gt71bYPn8m1zE7C+SF
         fuQZwjqe9BSBGj5Q2lDmiIwnc9fxxodLrFKkB1WII4U6aDAbSdQ4JEfcFaB1bHwgzeuu
         /JFQ==
X-Forwarded-Encrypted: i=1; AL+hErF2/wGdofv3ejFVI4hBqYRafe6PoY96Fz/0elGmwitxz2jBf39McN2lpMlE/qnDgYGjuJcuBgQL2sAhxX4zsoNBQMZy7Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9W64r+/sSpe/Of1RhhuPDld+xYIhZmH6PjWsODxjA/Cj/qL3K8
	am8WCVCy6BiQ80XC+xJC9vfRYa62m8Y8ZFRqyHMbrFtz7ehxB3NK7knRNBCCdEQtvaQ=
X-Gm-Gg: AYBFou0bP72VhhMXEFdg29lUE4fLZYZI4SsVc8PwiA6jC6xxfIZxj87nK1LidTxqtOJ
	s5yqGRPm+/Nz1Q7yKujumOSeFrVvedZiSxwnA27/ztDn1BuN0Th7+I49CZ2LxBgGUeccMKQ7ahL
	Rqmphv55C7q2FpdHjd3vrvFpd9di/aBULNVULRoj0cxZlI0vJSJQvMixNfKar5VhBEKesU67Yag
	aLcjoWq95c/7bvGUxUW9tHmPeQo3nOZsiwF8e0D2blSOJUVE30sFK2kNeXdRAEk4FmZ/IabG77M
	CEwgKaMjUi3PHAtkZV4kGbHd3xBbLK0uUYpr2ZSwRd7W3QDdbPru7c8g4sqph4a3tKz+Jx5RPNq
	xHtdHAPecSTd92W7Er1R/b/E7UVV8TFBp8FepFI96miqNulbN2H63Qh1bJELAndcfdj3iQvLn5Z
	13GK5YqpOdQozOU7L4k37xkXLQ+grZYtR4zaoObBrNB3+YQRR33JFDerzrSDDeubEnbmZxOXcqh
	QFO0ceYGRwbo140QNtw6xjmCTFQfAvDUNjGEr8550890xd5kgVG2n3PaSWP/bkut3jfsB9CPJSx
	2kk16++zs/nb/hBckqy04I0FAFF5apwGlyw=
X-Received: by 2002:a53:ed04:0:b0:679:b810:6df3 with SMTP id 956f58d0204a3-67c568c72d0mr1465408d50.84.1794329704143;
        Tue, 10 Nov 2026 08:55:04 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2255948d50.6.2026.11.10.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:55:03 -0800 (PST)
Message-ID: <a24bc088-3316-40f6-a9c2-acb77fc9befd@gmail.com>
Date: Tue, 10 Nov 2026 11:55:03 -0500
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
Subject: Re: [PATCH net-next v6 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
 <179424471332.994134.12793914111732564453@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471332.994134.12793914111732564453@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> Is 2^24 the right limit for AES-128-CCM?

No. RFC 9147 section 4.5.3 and Appendix B.1 give 2^23 records for
AES-128-CCM, for the same 2^-60 target as TLS 1.3. v7 will use a limit
below 2^23 for CCM.

> Should TLS_TX and TLS_TX_TRAFFIC_SECRET take tx_lock, as
> TLS_TX_KEY_UPDATE and TLS_TX_MAX_PAYLOAD_LEN do?

This is the lock drop listed under "Not changed" since v4. A TLS_TX
setsockopt() during a sendmsg() in another thread is an application
error. Mainline has the same window: the existing rekey takes only the
socket lock, and the records of that sendmsg() can go out under two
keys. Taking tx_lock in TLS_TX would make the setsockopt() wait behind
a blocked sendmsg(), which changes mainline behavior. The design of
this path is under discussion in the thread on 0/6, so I keep it
unchanged until that is settled.

> Can setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) block indefinitely on a
> non-blocking socket?

Yes. v7 will remove TLS_TX_KEY_UPDATE (see my reply on 0/6). The
kernel will then send a KeyUpdate only from sendmsg(), with the
caller's flags.

> This isn't a bug, but two parts of this text don't seem to match the code.

In v7, the text will say "before the next Application Data record".
The TLS_TX_KEY_UPDATE text will go away with the option.
