Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200365;
	b=iPHXC4RXX/uX0e+d6Dm0nKCDARPqqxoGb935q+hQtgrtzN96LCPPLq3Fnhi7wFCbomOl
	 urtbIeyPW0LzXSsSKUIgK3pP76+Y48RclNjZ1esufmuw5L3Ngcm+cvYuFEK049ZCyZSGO
	 JcCTecPrfjYE1qJorKGz2oWETXCTSVKA3WQBXzaQ6ne1PfkPP7vmxk9VXDP/ZWoOJ2kGb
	 Oru9JmUCLKlv6a/TZlbHJtwHH4FF1yddaw3RZUHjjbuO/Vf1MzW0TUY8JJnmf0ned3Tsl
	 9D9jjCcIV0HtGsMwadg00kCSEonfX1GM5qjnc3EJLsyAP/zp0RyB6dqZLjb4Mgd4xrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
	b=DdNgETspwYP6LsJLM3E+V3QwIXIoZFMNlRJyEEdKW8aUZgCg1fFyl/SCqaY5+Jm8dRmu
	 SUC5A5sspkZEu5yi3vWJkUIwtj1yzd66DFHX65ZZ8JNk8yC1JVZqaG0lhHpwbsH0PDWXN
	 h1kTjXj9Aib+PfPvFO9F7XS9GZQnOKaWl5d+3TpvrWui9FfYv0lP102EK90v5kBcI2wkI
	 3Fq+FL0BNcgKQ6+i2XkXZZc4IXRGAIZ+vlNYz0bobNbM1uLewJtuHbU7qoohVD0A9dBHb
	 A9/pvI4KATDqPyRicZwasQbjCxuHNgbUME/CeqQ0/CbDBXzUHiw/jw5+5L/nW0T+vIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPYXdSyS;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D21606A31F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 Oct 2026 15:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D21606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPYXdSyS
Received: by mail-yx2-f11.google.com with SMTP id 00721157ae682-8b1809cf49eso4914087b3.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 Oct 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793200364; x=1793805164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=RPYXdSySbF20fd055T7WtIFDlVlaU/ya3tSglPLBsrCl36K/8NSzqrFM/Kr1Zrw5wL
         KCqFMg79oOP+rHJE/z9WeMEtsNM1nR3kVMOrScDnrj9o7ab9xWBIlWb3rFkEeeyjLzXP
         oAYQ0+noNf/aLVyCdTR4r5NAHbbVRsFhf8aFcb6Zuib9pze871aSLbRrogx614f0tW9Q
         we6+Om4rJUDwhNs/vOqoUPivUQE1XknVP7ry2rn6ecHmN8jO7DpS/iQinulkGWnOaWBs
         dfXf2qqJDaE7M7RhgJdM+F/dQXLOZGGix8OJuek8UPBr0WxyGM5nzeYc0WYlCgf+R67e
         GQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200364; x=1793805164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=iN4jkonnYJ+Ta2/c9f1NlTGwFKqnL/i6DuAcnomT7b77k+CNyLG+B22VSCVr95aggO
         NHo4dGWp1dfcpWamHd3q8fWeVAt+BskKzNHpmrOmGVbRJJ4zivGGFhVOYEqOB8tzZSjn
         0QIyd8Y7Pfxzx2mWPa/bYubr87YCgCChTkBBSzbSUpgrdFaWCy4ktFMjryzcg62lqzaW
         Vg3/Ixmapr4KY2gD1lUEda6U4DIYsUSy4j+O2fVg4EVNq7idlx9FXFd7mGzxdxpnYl34
         8KTsBnVcalb9oxX2w/Ih95C1ef6V6nn4/2/A12EAUAyNQtq9JNnghoK/koyHTt8xKN6D
         92MA==
X-Forwarded-Encrypted: i=1; AKwUvBxBAA4YJ2gFAfDh7lZC8T4PUzBdmbpVvrcgZqBa+jE5GSX/JR3knM2dI8HfEGz/8AFmqNNWyo/KpsL7fOlMctp7Vp9/Nw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+ywJ8u/6l+nynUyoTvtItHGZjLa3Muy+SWudHoMV8FRldG704
	oeV4Q0pYT6jFGKR1rU9Lq2dh8hiGkGMVehjHTiwBE2l7TF8D4j7NsL8C
X-Gm-Gg: AYBFou3HkqBbOlN6YrOor6LPIMlC/ggSltI0jD9Rd0cpZe3GNq41Gthr84tZZsAYjBy
	VMb7nETvKGy7ht1F08HGcSqeDG4dRm8MOKM6Yzm9kqCDL19aBIyGWU3nLrXHj0I3e27fZ2wagHu
	+5Vy23zCeXQTj/EeU/2zSdW1rm6rzbe/SyVOOERZphVjdkkfZDErRxkFYNL6drvcLRwXDVfjxuY
	s3oCHbwm7RQrdHNO5PF4W3mAAP9WpxAH+t9RBwJ7ULYXsd/GNHgN9VPqoN/Cn58DXIbwqBKbJYa
	GgZbn1kDSho8YIKEY41V7Gulk5aBPev7tykGGVuP9fWW8asOXSAOzVxsGRojBF1f557Ts40ME2r
	fuGeecKztQTBpi1TMtpLVU5r8WgAxMCCSDFDTjNAaR4+9pC4lwY0glFL55Ut4IqeW3FjEtjPkgW
	IwlDAteBldUDqloh/h/HweoHd7fFcxtHfOrZYMRtVSQ7688ag3m8F/EIx1I3HuzmXg+Y/3/KiKp
	UATIO+W0ib5rYxo4RDMXv3YSA4oJoxOOHP7Lwsn0XImy0mh068vClbJ9ye/PwGcKdVCMdcYzue4
	+1J1MF92/e2aWr8UF3uA/4CWnmlOrGut95c=
X-Received: by 2002:a05:690c:386:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b1b5b457ffmr18430047b3.56.1793200364364;
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e539e34sm29934517b3.9.2026.10.28.08.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Message-ID: <e674379f-819f-4334-99b2-7b8dfc89d1a0@gmail.com>
Date: Wed, 28 Oct 2026 11:12:43 -0400
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
To: Chuck Lever <cel@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
 <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
 <CAPG1HMsnUDa=Q5O4fwZOU=Pd+m7ahzu574Cs+mWoB_9KUT5ASA@mail.gmail.com>
 <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/26 11:01, Chuck Lever wrote:

> 
> I get that dropping the connection is bad; the current weak-ass
> implementation is meant to handle KeyUpdate until we have a proper
> spec-conformant implementation.
> 
> My concern here is if the current design is malfunctioning in LTS
> kernels, the only mechanism we have is to fix it upstream and backport
> the fix. I don't believe stable@ would be happy absorbing this full
> series.
> 
> Your commit message claims the connection stalls rather than getting
> replaced. If that's true, that needs to be fixed before this series
> gets merged. Can you confirm? I don't expect such a fix would be large,
> but the ordering matters.
> 

Yes, for nvme-tcp. Since 6.7, tls_sw_read_sock() returns -EINVAL for a 
KeyUpdate record. nvme_tcp_io_work() then stops without error recovery, 
and the queue stalls until a command times out. Only the timeout handler 
replaces the connection.

The fix is small: "nvme-tcp: start error recovery when read_sock fails". 
I posted it on Monday, and Keith applied v2 to nvme-7.4 yesterday:
https://lists.infradead.org/pipermail/linux-nvme/2026-October/066937.html

The queue now starts error recovery at once and reconnects. It has no 
Fixes: tag. I will ask Keith to add Fixes: be8e82caa685 ("nvme-tcp: 
enable TLS handshake upcall") and Cc: stable, so it reaches the LTS 
kernels before this series.

I have not checked sunrpc. Does xprtsock replace the connection when 
tls_sw_read_sock() fails, or does it stall too?

Martin
