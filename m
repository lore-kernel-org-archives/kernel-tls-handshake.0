Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226444;
	b=v/A7kKY/RMjCya1tpcDLVFovlX9e6kckkpJlMNZR3lgJsKDJjcyM/MKx/+/6a7Q4NmLV
	 QbJAjudmwRLGD0Wv7iFvQ3R+p8qL56EkSvf72+xVk8AfJvmLB8iO5rb4k542pEyNKd8eB
	 BBJKL/o8UaHpSm75apzs5J8G3OoBZ0a9WKlEOmylpk5rBDYj3R14lZTBXgLeKppHawxDy
	 ZqPXzO8dKVMLIzEOTjlBO7hhl6iCe4fzrauRn8aD53zHRCeG5eEiEg2VqHZ95eKNisFPB
	 EX+StjWeW6hDw/H3BwYkaKvLJ81AycWjMSuztlnWYLCYUIZe5lZV6P3lQb9Vf/X4dFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
	b=OAiF8gluqSYBQ5AAzI/WbD0MqiJrpIjWioCYZGUvpWPZNedKSTC0mKNyyKRIrguXVsIH
	 +Gcnej9jC6evvCx5Lvdzom/0D31rRkNTeLgxX3HvdjRKSpX5RW1jbvxZpLKirCDeXgnEU
	 tk7YfDy3YkNqnq/ITR2QLH5SKmoOPwQ2EtPl54fTsAjoCL0OPITcmAVE7KkrSXMRIpMao
	 DsviwAy1reL2JXBKaMkFeZG9bg7X9lICy9y/I4g4NYPEfGo1zUwWmppp90KxrzhPrKVKO
	 Tt4gencVnDoX6WnpleReOoShIgiIC35ZAT9ey1mu+HuIfAoZpkvyCfPfXIUmiwH2U9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/lqgIuE";
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90126606A325
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  9 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90126606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/lqgIuE
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so603589d50.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 09 Nov 2026 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794226443; x=1794831243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=K/lqgIuEE5/PHPFV/WVkQjpAJpYTXmJseHqxDxMsk2n3AYOXJWSDf+99X6R/2h3GTX
         gkeH+duhdejqLHQ+RkIloi6G0+O3M5nmWTRPqfrKtcB5oWeznp6VcGm7tp9/U/fxo9jT
         CEAGYvjoI1M2w8bRfOlk28pjvWC/0mx8IUR1SxMVkegXHFgLJw432hKRyEQKIc3ZiETo
         ktUUChFEqRKvUdGFYoUMHcSjnVVT+vT7ifnCfdHZ8X8oFxt1f+3jWSQbgl7950BfGZss
         rcMxCFQfaXmnqzS8Ut0XwZ2ctl5WOEDypwLVrEo1jGkg77RZ3vmneaqSJGgekA8R3YNa
         DFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226443; x=1794831243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=tq4nk0jkzZyEZE3QxQsZNKBPAD85w3E6PcVJpkw4U3snuHqTsK6zhcCkWBHi0Gk3+I
         uuyv4gED90lqQEz5h07wePDB4AGv8xrBT1vpBLMtCaWFHSodw10AvQXM2WpbjohHc8xr
         H7Mx8aHtSl7BPRrwIcUuHSuLO7BE8Ey2eHt3BCeLk7u+ktMeJmNBchUQ6DffLampJOXz
         uQuily1BTS2W6NX9W5KNIUr2K1gc96uJ0CnhdSLu/uS+w4JMQK0Y7N6ClEdWBAk2Afz6
         nI19AdYXAAC639pnb7twjlNblVNAsN8q70Eh/u9ObjcjB1NhhQhtxX7cMxFb6aEBff6o
         za2w==
X-Forwarded-Encrypted: i=1; AL+hErG+1lOIrtEl8WPv78rNC/yWS63VVFNr9ASUMmgYwaxXRaYtHGk7aNyRFo+HqUs0gHWNy7U1Jmh3G4M0FQw4giZb+KlHnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8EE3aspXJiYNjcffYyFUVI4Cn4oMnkzRsD4Kg+q2Qh4jonl12f
	tCsWn6fp2Nm0tx5iMJ/yXcBUx1Q4coIqhQma3DweaN+23U0wix16osyi
X-Gm-Gg: AYBFou2Q+qMqjueatorNnmD2mfq/RXVyNgR9nVkH3u5Zj+GKkoh2OAKOgKo73RYsTYw
	w2RG6sT22sm3djJ/uA9idMH4wlOumVxr37GYF8o+aFmtw9tXwvHTIds9rPGYvqiMsaurbmAbOh0
	0SdFavh17Mc/wVQAeU7vnvqVRmYRFczk4RPazFciHOmbTSViQ+mXyTHhRnZflkUcjtBt/hGvKTK
	LJhV+3wuQd9S1bPe/kCxiDCakOrfcg+9kAqN4Pfvu2jpTXEocJWU3cyUYRaxXUoDPAtOwCCj7Gw
	xfPCzoOibA6NqA/GWF50m9MUwVa2Oqw2IvccHnk5+1q0JIa80yz/+ovIdTg3YYT1RQDBfZgYz0i
	n7GriSS/LdqIEmYREq5P31bV6wsKKOnTPSdRs0lcA53icWgJrNRk+5oHbuY/+ponl9158jQNHkz
	wB8fg21X2fUfhDAsPvIHcKFr5S6QAEf6jJD9UWwNukB6bE7UR2uUOCAsP7/hiya4Q5K+Xp37MgP
	qm6bmAK8pvKIUivzCGDfdmgfyE7CpG8QpqOvP6uBjgo2tWoIW8ezC54Pz0sD7T5AhQI2bEhiqB2
	F6yR2NfNi4H0YcYGvHmguw3przMGuPGmXW4=
X-Received: by 2002:a05:690c:e3ed:b0:8a0:76e8:c738 with SMTP id 00721157ae682-8b36c664b7dmr25866737b3.0.1794226443428;
        Mon, 09 Nov 2026 04:14:03 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b95cf4bsm3720905d50.16.2026.11.09.04.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:14:02 -0800 (PST)
Message-ID: <7f9b7ab9-9728-42be-a5c1-9e8e62c23ab9@gmail.com>
Date: Mon, 9 Nov 2026 07:14:01 -0500
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
Subject: Re: [PATCH net-next v6 0/6] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Daniel Pereira <danielmaraboo@gmail.com>
References: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
 <au5JP__7P_PzwDUe@krikkit>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <au5JP__7P_PzwDUe@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sabrina,

On 11/6/26 16:40, Sabrina Dubroca wrote:
 > I'm on a medical break so I won't be able to give this a proper review
 > for another week or two, but since it keeps landing in my inbox, I
 > want to make a comment.
[...]
 > So this is kind of a "can we slow down until we agree that we
 > really want that?"

I am sorry to hear that. I hope you feel better soon. There is no
hurry. I will not send a new version before we agree on the
direction.

 >> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
 >> KeyUpdate.
 >
 > Because it isn't meant to handle any part of the handshake at all,
 > just the record layer.
[...]
 > So what you're proposing is a very fundamental change to how kTLS
 > works, I'm not convinced we want to go this way.

KeyUpdate is a handshake message, but it changes only record layer
state: the traffic key and the record sequence number. The new
secret is one HKDF-Expand-Label of the current one. Nothing else from
the handshake is needed.

 > If userspace libraries don't do the right thing, we can fix the
 > libraries.

I agree. The main users of this series are kernel consumers:
NVMe/TCP (host and target) and sunrpc (client and nfsd). They have
no user-space process above the socket. tlshd does the handshake,
hands the keys to the kernel and exits.

 > And that can't be handled with the existing handshake subsystem?

Not without new problems:

- A handshake daemon cannot write the KeyUpdate record to a kernel
   socket. It has no file descriptor for it.

- NVMe/TCP sets sk_set_memalloc() on its sockets so that it can
   write out pages under memory pressure. A daemon has no such
   guarantee. With root or swap on NVMe/TCP, the daemon can wait for
   a page-in from the queue that waits for the daemon. An upcall or a
   reconnect every few minutes makes this deadlock possible every few
   minutes.

- The traffic secrets must reach the kernel in any design. If each
   consumer does the KeyUpdate itself, NVMe/TCP, nvmet-tcp, sunrpc,
   nfsd and every future kTLS consumer need the same state machine.
   In kTLS it is one implementation, which user-space applications
   can use too.

 >> the 2^24 limit can be reached in less than 10 minutes in many cases.
 >
 > My math says that's 28k records/second, it's a lot.

Storage traffic is different from HTTPS. The NVMe/TCP host sends one
TLS record per command, and a 4 KiB read is a 72-byte record. The
record count follows I/O operations, not bytes. 28k operations per
second on one queue is normal for NVMe. I measured one queue reaching
2^24 records in about 80 seconds. Connections stay up as long as the
host does, so even at 1000 records per second the limit comes after
about 4.7 hours.

Without KeyUpdate, the consumer must reconnect at the limit. For
NVMe/TCP this tears down all queues of the controller, stops the I/O
in flight and repeats every handshake. NVMe/TCP is storage for
critical systems: databases for banking and stock trading, AI
training data, and systems that hold personal data. These systems
cannot reset their storage every few minutes.

 > I'm not yet convinced this is a strong enough argument to justify
 > changing the model under which ktls operates

RFC 9846 4.7.3: after a KeyUpdate with update_requested, the receiver
MUST send its own KeyUpdate "prior to sending its next Application
Data record". If a sendmsg() or sendfile() is in progress on another
thread, nothing above kTLS can stop it before its next record. kTLS
checks before each record.

 > Why does this need to be a socket option? It feels wrong to use a
 > socket option to trigger sending data, why not hook on sendmsg()?

I agree. I will remove TLS_TX_KEY_UPDATE.

Martin
