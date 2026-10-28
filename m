Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199854;
	b=yJjUfRI0d2r4G5x/IdnxXW3TljLBjmhFtB/B+o6g+W5GLs9UWJHFgKZqr7oRgAVJ/xJU
	 DGzjgXXI5xjKAitfcR2/wT7d32p+o3XBGSRCSncqwP7E60jSRC75E00LqCFDIlBpiYqWo
	 EyJZzfZPGrZqpMmhihOVttgG/D1KKkx4JfAenpJ8yOCBtINiKd2aOwHt2JOZz0Gkhdq8w
	 OFkB/SJnFF5LlTdg3dNNBgdOquJ9YSycUU2W8QQ7OCQ0ie+B/vMwy8q6W9iyQqWzdhWkg
	 SN6+97CivGuxEeaoyaZsybspIOXfTF8AlyhqihAAoM0H7SVL0BSvzsJ+cPafo/8sWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
	b=ob28b3DLwh037CJqqAfwfG8QKEiYTC5AJ1pREmzu3GQ9ZH/FX6tk9rytSU7iVEHRWPFA
	 HMPVht2QznbJBTDKI5jXdKMEhh9R357lROWoeKhlUsXC3biRjdU7iBLPYULRTRRnLqdjp
	 UesDXiXIwjyFpR+TddGz4e/wclkWdrJtklKl/laD1hilPD66xsGzDdsOpBYijoa1Kvu5U
	 iCvTfJvxnYSxj4yIUk+GH+HIKE0GGIKxc2OB8q8GrYhVU3Sj8/nQblgawXwwKcPg1dZgH
	 e2N5x8Dmf0gnetV8BXCeOhh1u1+lFGru/u/UuWqPmcgz6B1yrIb6Zd8C0ookJ3mU+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.129
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90476606A31D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 Oct 2026 15:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90476606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-8b0b746503fso2573877b3.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 Oct 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199852; x=1793804652; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
        b=AqbwTinJpnb4zoBIlClg8qq0Mma37NAMah6YOPqvT7VeWQ2xi0pEmMqIXMFitaGF2m
         mjsUwldZqZzGh2Y9ZqGr83hT4/bR70mF19gulLyT7GPyIQB4xuppDnMBowYUvEtQ+2ih
         yeUhbP2JpTLF9dB+gyc7tikuxFGi3Mx6GgIfq3EXY3bBe/hGQmhSrXcm9tWxvmRgMxPX
         FiReL+lW66rG50/YMHVbP0+OHbc7oevUiD9PKoDRWf7g3YjxEayLVrHfZvuM63ZZCIFL
         r7JPKs/IB0lo2TdpDh3euEEk0XyWmb03kFzcj3yVjhLc82gGqxjT6kU1ZeOTvWcvqeKa
         Ai2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199852; x=1793804652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
        b=UvSbm5vrjyCXTnTfM0oC6EoRyovmdLPXpFIg7eS1IkuUMpWT3RLE/uGwfmhmixWPcm
         g5F6nz/llAIFjvyKrUcC+6i1yv2AePrVttjSCM7bSkjugkilRexjVmCEPgtvQS/9DKQV
         ns/wt/ujLNmlvdZFxweGl21iWYizfHF1b30rWyKK0xWYz2GYuG4RkaRFJxWuIPOO0Gti
         wBmlX2fS3rejo56Hy6GU0VoY2fl6fn2igsG9iX1P1if/WQNUuxPw/qKn7qWNzXVNSTJT
         R5zn8aZlOwQ2pnXu4O/Dkihc7Vkr7w/uzTRyxl3N1d2BK1jsQ/8+twdrJMdJ7VIpzzPz
         jiyA==
X-Forwarded-Encrypted: i=1; AKwUvBwiOPeNcL7bL03I3l1J6bQCJMBIu16Fd9D6V0KkUr4BNNe03wxEovg0maFQzvP3wsToMPx5YT4yNcoiJ8vimXkiqnbKmA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKxyUjCNCchQSeyA5rvB4F0DyrONMpph+3cxqIgob9EEUbX2noA
	0TeLrAHCAwaoUpTZB8N0Ec+sbpEMdyvL9ZSkGwwXMurvkQmMdZ42rqlw
X-Gm-Gg: AYBFou07/nqNc8vJ4a2pCAgIRHjZx9DlHNOGqbILjp1cx27IouYNoNu4sjTcbSQryXp
	srx7UMdJlEZnGo7rsm+brk/dIjBDmH/qP715Jce6r199bTGhhYcWRnBnLIl0YFyr6LQ0sqxC5P9
	1QAFpognogn06cNChMBB7+9+MhkR1oAFKpZDJ8HMhDWXKPwlBoPGjlVaNTT2onFU43lHi4RTJMO
	Pm4Fj9CZqZMbNdnVXKoqktGnMq8tHxmeqe0bAr89XTUrqtAkaWr7wNTBJoVAKZrkSYMhZ6Tyn/a
	yR28YbUzYbRGCW59FKs6Kbkv+rI0xcgecoPh4l+NpAjB/utfBD79RgpCwSkPE48vIZQwbBhQGmk
	DvambBXfuimw9wCoGyPIusQeNQGXFb6QEyGTIOS2P8Q434rGDwlQgxMbX2qHV/BAp7bp7g90OmA
	j9PzXukrNer8aUnX8V69gx0HtirgRQBGMONcIl9Vwa+HSayJhCk5PSLPus3zvnMaToyErTfLpTO
	vYw9daNAZLxOxlUUqhmLh9sDXIPIx+mf9kfOWqnBtdpdMxf34exsfBdIOtWQO8kx6Z0RTJM8uv4
	6SeyDE8MuqJrD/tmP8RBLOY2uZeih2XhSTcj
X-Received: by 2002:a05:690e:441c:b0:677:d9d8:d927 with SMTP id 956f58d0204a3-67a7bebab48mr1814453d50.74.1793199852326;
        Wed, 28 Oct 2026 08:04:12 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a1887c9sm1801270d50.20.2026.10.28.08.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:04:11 -0700 (PDT)
Message-ID: <69b373c4-4a1f-4863-a1e5-dd8aeea7b02e@gmail.com>
Date: Wed, 28 Oct 2026 11:04:09 -0400
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
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Hannes Reinecke <hare@suse.de>, Chuck Lever <cel@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
 <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/28/26 10:42, Hannes Reinecke wrote:
> On 10/28/26 3:21 PM, Chuck Lever wrote:
>>
>>
>> On Wed, Oct 28, 2026, at 9:52 AM, Martin Belanger via B4 Relay wrote:
>>> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
>>> KeyUpdate. And when it receives one, it blocks the socket until the
>>> application installs the next key. kTLS also does not enforce the key
>>> usage limit on transmit.
>>
>> No argument here.
>>
>>
>>> This applies to TLS libraries in user space as well as kernel users such
>>> as NVMe/TCP or sunrpc:
>>>
>>> - GnuTLS sends a KeyUpdate after 2^24 records when it runs its own
>>>    record layer. With kTLS, the record layer is handled in the kernel 
>>> and
>>>    GnuTLS therefore never runs the check. OpenSSL never sends a 
>>> KeyUpdate
>>>    on its own.
>>> - NVMe/TCP and sunrpc don't have a mechanism to install a new key. A
>>>    conforming peer that sends a KeyUpdate stalls their connection.
>>
>> The design intention of these consumers is that they are supposed to 
>> break
>> the connection and create a new session, rather than stall. If that is 
>> not
>> happening, that's a bug. KeyUpdate is complicated enough that backporting
>> to LTS is not really an option, so that bug needs to be addressed first,
>> IMHO.
>>
> Yes. But Martin send already a patchset for that (well, for NVMe, at 
> least).

Thanks, Hannes. Two points to add.

A reconnect is also a valid answer to the record limit: RFC 9846
section 5.5 allows closing the connection. The cost is the problem.
Depending on the load and link speed, the 2^24 limit can be reached in
less than 10 minutes in many cases. Each reconnect stops the I/O of the
queue and needs a new handshake upcall, for every queue of every
controller. A peer that sends KeyUpdate on its own causes the same
reconnects. With this series, the connection stays up.

> 
>> The argument that was made that put tlshd in user space is that we do
>> not want the kernel to handle something that the libraries are already
>> good at (IOW, mechanisms that have been soaked in commodity usage by many
>> consumers).
>>
>> Is that rationale different for handling TLS KeyUpdate? I see that the
>> series adds back the HKDF functionality to the kernel. That seems like
>> an indication that KeyUpdate should be handled via an upcall.
>>

The series does not add back the HKDF library. It computes the HMACs
inline with the HMAC library, as the NVMe PSK derivation in
drivers/nvme/common/auth.c does. That is why commit 6d888db2cfd9
removed the library. The QUIC series also derives its key updates in
the kernel.

GnuTLS does handle a received KeyUpdate with kTLS since kernel 6.14,
but only when user space keeps the GnuTLS session. tlshd does not: it
hands the socket to the kernel after the handshake. So the library
cannot help nvme-tcp or sunrpc here.

Martin.

> Yes. TLS KeyUpdate requires that all records _after_ the KeyUpdate 
> message are encrypted with the next key; idea is here that one can
> (and should) do this in-line without stopping/resetting the connection.
> _And_ TLS KeyUpdate is done independently on the RX and the TX side.
> 
> This makes it extremely hard to implement via tlshd; we would need
> to pass the KeyUpdate message to tlshd (which is easy), but then
> we would need to stop processing incoming packets until we get
> a response from tlshd indicating that it has installed the new
> secret.
> 
> Which makes the whole idea of KeyUpdate (namely that you can
> do it _without_ stopping packet processing) a bit pointless.
> 
> And I haven't even mentioned that you would need to be able to
> stop RX and TX _independently_, which I'm not sure the various
> ULPs can do.
> 
> Plus there is the question why ULPs need to be burdened with
> protocol specific knowledge; why would I need to code hooks/
> handling for an extremely protocol-specific know?
> It's far better be handled by the protocol itself.
> 
>> Are there policy decisions that need to be made during KeyUpdate (like,
>> has the peer's certificate expired, or has it been put on a revocation
>> list in the meantime) ?
>>
> No. This is not about the certificate, it's about traffic secrets.
> If a certificate is expired you need to reset the connection
> to install a new certificate; TLS 1.3 does not allow you to do
> that while the connection is established.
> And handling of expired certificates is an admin choice, not
> something one should do automatically.
> 
> (The last thing you want is your root fs becoming inaccessible
> just because a lazy admin forgot to renew the certificate ...)
> 
> Cheers,
> 
> Hannes

