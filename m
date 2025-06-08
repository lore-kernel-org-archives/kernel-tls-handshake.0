Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3F635
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749379867; cv=none; b=j8KvrCHKpLtee9VaWEwbbWg3kTZGF7C71NtAJqesfmnFn56C8uC6+2gpQu60+kpgvcKmn/ffceacCJuRmAWJ/gimeOVd5eBsoXdM9qE0NEDoteZJyLx4sgufVCXIUu89o7L5TGDtf8bz0nY1kIwgwsLI+xDSWZitKtS/GZCZX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749379867; c=relaxed/simple;
	bh=MvrswOoi3CpSJqPltFVRniSKra8rn6SPqN/8Q7VmDc0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=R/L5MrfNIUmpkF1z2qBIZn6hxlnpMup75rjJIOwKsHupXcH9m2Too62xoadv0NXMtOSIsgsPQjW988kc64dr58gTY6A0cjyIqDtv3TXis8gYIumreMew6vYQrAvEhgEQxpdkq5ka1N8oaKSGrK3DYpSKvRWssdAyW+mQIreaFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd/0c5J0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd/0c5J0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54700a46eso160487f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 03:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749379864; x=1749984664; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvrswOoi3CpSJqPltFVRniSKra8rn6SPqN/8Q7VmDc0=;
        b=Zd/0c5J0sYicOykZm0tiTOzTfl8lfm4jqkIokG6g/PYWIscUY+BExE2oOGTUolE9Lm
         88sbHNVovh4ki0BFwUi8YVRGh9+e8Gvr2SHuvdU99kVBmDJXVY9bbmPeZqwOFEbBxeGO
         eTp6HxdNen3tQpFrRkzYTmb0CHj7UsXzpauRHCALNls2Ac6wTvNvwGmWZuqMJSt110Lc
         TumAY26OCnjwT+KGBSXEF8ghrx1BNUjpPrtEc58FYnK5bUVyOj1v2v/TOpcPCdmQAWP5
         pgHZLboPbcE1V5JOTaZassnUnr27jZMZijPHtGq/aaGm/91aefrpyNFlBXWp/BZYIpHT
         LXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749379864; x=1749984664;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MvrswOoi3CpSJqPltFVRniSKra8rn6SPqN/8Q7VmDc0=;
        b=KjKt3ZeyCG4gHRlnTuH+Cjh/ohYjDn3RBF1DQ/4RJxF4GCNwp76ZLd3FAz9cYelGUl
         r2n4tPInKwZNKRmJAU5cTkv+qqtE7MzFUGMSTmzlBs7YUMs2xz0b2MeGWvQ5v234CO4O
         OHpBvsV2Z8ri1V4gKT9ikFI56KwN3GgBzM82hE7fK8WK3q04FHgaJn7QZaluflFixg1d
         jzyMqklS732Rkb92TJZprpznCGFqR/AeWAhti7J6FXCtf3u8YeEJkCGAPHgTfw//acQz
         ul0jjWdTxZsJLDCUeXo5t45N2Ocu07MGo2bSB/WhIol9zG2F5JNQMQ4W6zs9Q/uoW6G4
         PkLQ==
X-Gm-Message-State: AOJu0YwIGdFB18oYuwID0RsbkN6iGFamgBc2jND82DliZkNrOMZ+cNaN
	AEVPAUFviKqEJrepvZpUqsi52z5r026plWJ5QxJGr4XBnu4O43KiUusAytYfOw==
X-Gm-Gg: ASbGnctquQef35ouerGEvZMRjhHCBx+vloYE5k1Nkt5b0q9+QxKi7FpDOG5UG9zbXys
	AZ4NsRe+NVWgEQfD4WrPvhKF023D7tHbAx5ACf9Cx8/7wcv7IADYT2doCwIVRhywMDILIm/VuUd
	VHNV8WNFgeaq4RAVydp/Q2gYQJGn8fd57970GSUazksXSxr5OpXN19lTlQfqRrePcsrc2m0KNWa
	kE8V7PesQGgpQ/3wE0iZ5OCDnqk+RPsKLB9NHoWqPcfqZcupzj2Z0Au2i6ItchhsR3d1sS7jGij
	9KTo4nvPT+b74m82+g6mRuB4t7J/gr0epvzFIVer03ipOE7awDrmWa1jfY4QYMhCjs4/yB2Kfoc
	a+P6pilOTzb2eAXhagU8=
X-Google-Smtp-Source: AGHT+IEj9/qjBm4s7kfb5vigfZPfg8OK5H1zgF0CVcbGsQPwj1uGExo9kU4N94mVmFTewwAI3foP7w==
X-Received: by 2002:a05:6000:288b:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a531cf3966mr7385265f8f.48.1749379863869;
        Sun, 08 Jun 2025 03:51:03 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm7127711f8f.16.2025.06.08.03.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 03:51:03 -0700 (PDT)
Message-ID: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
Date: Sun, 8 Jun 2025 11:51:03 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
Subject: ktls-utils client address verification and other patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I've been evaluating the use of mtls to secure NFS mounts and have noticed there's a fairly serious limitation:
Any client which has a valid certificate can impersonate a different client, since the server does not verify client address.

This is unfortunate, as I'd like to give different clients access to different NFS shares by naming the clients in /etc/exports,
and I'd like to use mtls to ensure that each client not only has a trusted certificate, but that it is only able to access the
shares to which it is entitled by /etc/exports. In other words, I want to verify the client host name or address against the
client certificate to avoid address spoofing.

I can understand why this is not the default behaviour: In general, a server will not be able to verify clients in this way.
But for NFS on a personal or corporate LAN, it is highly desirable.

To this end, I've developed some patches which allow the tlshd server to be configured to instruct GnuTLS to perform client
address verification.

Please see patch series here:

https://codeberg.org/kbm0/ktls-utils/commits/branch/verification-patchset

Because the server can only obtain the client hostname by reverse address lookup, and this has security implications, I have
been careful to confirm the hostname first by performing a forward lookup in the manner of FCrDNS: We call getaddrinfo() and
check that one of the resulting addresses matches the one which was obtained from the reverse lookup. Should this check fail,
we reject the certificate.

I've also added an option to use a textualized IP/IPv6 address for verification against the certificate, in cases where no DNS
address can be found. This works if the certificate includes the client IP address as an alternative name. It is also possible
to use the IP address as the first recourse, and this may be useful in some circumstances - it is possible for client and server
to verify each other entirely based on IP addresses with no reliance on DNS, if the certificates are set up correctly.

These behaviours are enabled by setting options in tlshd.conf like so:

[authenticate.server]
verify_peername=true
verify_peeraddr=true

Another issue I came across involves the fact that when a client connects to a server, the server name is passed to GnuTLS for
the purposes of SNI. If the client connects with a bare IP or IPv6 address, this is not strictly allowed, as only DNS names may
be used for SNI. This causes the server to reject the transaction. I've added an option to omit the SNI in cases where the client
is connecting using an IP address:

[authenticate.client]
relax_sni=true

There are some other patches in the series: I wanted to textualize the peer address up front so it can be used for both logging
and also for verification.

I also thought some of the processing in netlink.c looked a bit sloppy: Optimistic assumptions were being made about the
contents of return buffers when functions like getnameinfo() are called. I have tried to correct these.

I am hoping for some informal review or feedback for these patches in the first instance. I didn't want to just spam the mailing
list with them upfront. If there is any interest in them, I will submit them formally.

Thanks,

-Ken. :-)

