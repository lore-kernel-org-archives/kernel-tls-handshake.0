Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223328F924
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 13 Jun 2025 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856161; cv=none; b=YlIGOgrqSdyICr+bKZdhnhFRUoMrrtFQSHV9SBcpmAy3BTj8cHEpr1AVXI7AQ4BXwrRD3izloJr2R42/1QIrdPqHhyJ07VCNJLK5nyIVvl6o5pAkGkJf747LIyYFZE3y8NJRup/Xohepf/py9GYK6YS+YB1cVv2+P3k70r+weX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856161; c=relaxed/simple;
	bh=7m2U01gzrLeqZSX8ch3m1koJaptsKXJzkkzTw9WPLm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1KBY1Dj/Cewh6o6/fv/7cN1ZBE/LWWlYqOEn26n0C5IN2VeaBH1y+KPCFbwZir+dROYCsDwpplAM1/OACH+jCOmBK0epEZqkuQuUzEO4j92E13H5fwRXX6pvVrkDg0rMr35CuNs4nWm0NhDsx3vQm+GmyvvmA3tHl7jRSZ01VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7kgjnbd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7kgjnbd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so31434605e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 13 Jun 2025 16:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749856158; x=1750460958; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgfsneacS76x3FaaQZiDh0/GSuiCbSBaFnxeUILGvqs=;
        b=d7kgjnbd/079IZxGbFL6y1A2LBLrYFtJnEbwxP3ie8Y5T0noF2sD3kCtldjR8/CkXV
         cwrod4JEYPTygJG71g+8hQCuCHKBisM6TARcdB0PknK9o0l/pW03qzP+3hCrsn7Vj5zC
         p/c8+nA+/MAhB555USLLmin7ZxK3+u48MWyQDwwrapfcOakHg6Amgv6fSAzpGUSn8rpZ
         GAdH6+80dDmOBcPHuahUpqLPCstM/MNnOZUCUJrchPsWUOfy4wd2zr4HvBaqYfTbl44j
         TewfOwsf6oE/S32jpkE0M31/mFD5d/H3kvi+Q0RudlQblVGBcpuANhTBc8pr8Zd4nQ6R
         guKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749856158; x=1750460958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgfsneacS76x3FaaQZiDh0/GSuiCbSBaFnxeUILGvqs=;
        b=RJqElxa5VWSHXzrmNhiubqplKY3wopJc/afpyz80aFsUE4TNYGi/FU6rv0yGfamT54
         lrCrC2qRNE6zIqEqBX1Hgo2TfeKX2KHKcl6xX2YbrF04iQWXhU3qApbvdjuHuW+Ghw60
         ENmOJxt3zVx+gjd3XY77i2jeY7aD1dbEehx+CKpMb0/VC47vWcVRTuqt5yJsc50kqUT3
         6Y1THez3aZqIU2AKmZeCRE5kiTR0fRyNoBcccDXLOF5/6hWurWHEcPhadAgCXED5oVlS
         1EiiEyOhRYa7ll+YJ242drXAP1oLgAlASBIVkJLId1/H7S1+mv9H30FOGF1l1AKazPmt
         pYSg==
X-Gm-Message-State: AOJu0YxRYKjBMaTPnxA9SwcLQFSBOey2983hZY11T0U/h9Q2UoyF+764
	WMw3+Gl0djBJpASzqv/3TOSZbewTl5jlmpH/3IGLviOzH8iEj3RtS20mvqI8NA==
X-Gm-Gg: ASbGnctFzLr5iscFgmyKLWx90OjUgC7RG1mvWx5aWRbOqkreDeUkJICF2uDbUvKYDut
	SfkD1b8LRGysbq6QHXvSS8AcWm/LCF38bvFYIX/N5cbNSEJEfxlKhkeZHeK7zZxXU0fawMpSyKj
	Yn0gsjF4fs6FQ7Dx1zFeDgNe5hQCmzo6enAJk9UmY1KDgIreq5qolNF44TgHT5F+SY97+YRzXuz
	PsrSCWwILZfbkFfoq6LOqz5wCZ5FfzLieH7W0D31gb0vV91XZBgsADVyE0caWqaspKqBLGBKv4J
	Tlv5KNVGWlaQTeXIzsBZvzIMnhq032BCpuFE6pXL0YtCMVP2P2ZpiGjfwsQdknLDsuY493Vg6jp
	9+h1CC7MNMwKQ5Y/aE80=
X-Google-Smtp-Source: AGHT+IF4yjhgxAz9xBP74imvNnQlPpPYWfoUaF3Su+ZdOMtF+NNo6+5mOuWi/6kjpv52FeMIaQ33eQ==
X-Received: by 2002:a05:600c:8b26:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-4533cb0ae9amr10501495e9.25.1749856157943;
        Fri, 13 Jun 2025 16:09:17 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2324c6sm64357355e9.12.2025.06.13.16.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 16:09:17 -0700 (PDT)
Message-ID: <07ebad41-0c74-4fc0-9e34-d2dc959a1d7b@gmail.com>
Date: Sat, 14 Jun 2025 00:09:16 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 22:42, Chuck Lever wrote:
> I think server-side tlshd should /always/ check a client's source IP
> address when IP addresses are listed in the presented certificate's SAN
> field. No new configuration option is needed, I will test to make sure
> all of that is working as we expect.

See my comment below re patch 7 for a possible banana skin.

> The two changes I'm still equivocating on are:
> 
> 1. [PATCH 5/7] server: Add boolean config option "verify_peername" under
>    "[authenticate.server]"
> 
>    I'm not comfortable adding a DNS query. There's no way for tlshd to
>    confirm that the query results are trustworthy, and it will add an
>    indeterminate latency to every handshake.

But note that the existing code already performs a reverse DNS query in order
to obtain a host name from the peer address for logging purposes, so there is
already an indeterminate latency cost.

The forward DNS lookup is a standard practice for increasing the relibility
of a name obtained by reverse lookup, as here. I agree there are ways that
this can be subverted in general cases, but that is true of x.509 with DNS in
general. The present code doesn't perform any additional checks on the
certificate SAN at all.

>    IIRC, tlshd used to perform a query like this, and we were asked to
>    remove it by our security reviewers.

Fair enough, but I would be interested to know where the security risk comes
from. AFAICT, providing a (forward-confirmed) host name for verification against
the certificate can only reduce the scenarios in which the certificate gets accepted,
it cannot increase them. That is to say, if a certificate is rejected by the existing
code without any name check, it will continue to be rejected with the patch applied.
If I'm wrong on this point, I'd be grateful for a citation I can follow up.

The only downside I can think of is that enabling this check may create a false
sense of security (which was never there in the first place), if the admin does
not understand the implications.

That's not to say I don't think that tagging sounds like a better solution,
although given the widest use of x.509 certs is effectively to verify DNS host
names I'm slightly surprised that you don't want to support DNS at all.

Note that the client code *does* already pass the supplied host name to GnuTLS
for verification, so we have a situation where the server name matters on the client
but not vice versa. I was attempting to redress this asymmetry a little.

Checking client names on the server this way will be no good in general internet
situations with NAT, proxies etc (where the client certificate is always likely to
be rejected), but is potentially very useful for adding additional security in a
controlled LAN or VPN situation.

> 2. [PATCH 7/7] client: Add boolean config option "relax_sni" under
>    "[authenticate.client]"
> 
>    I haven't looked closely at this one yet, but I suspect it's
>    nearly the same as the deprecated "-n" option, which was too
>    insecure to be allowed to remain alive.

The documentation for gnutls_server_name_set() states that "IPv4 or IPv6
addresses are not permitted to be set by this function". So if the client
peer address is actually a numeric IP address, surely we should not be calling
this function regardless?

In particular, if you are using certificates with IP addresses in the SAN,
and you are validating those on the server, (as you mention above), I suspect the
certificate will always be rejected regardless of validity. I haven't tested such
cases extensively, so I'm open to correction on this. Once I read the
documentation for gnutls_server_name_set() I realised it should never be given a
hostname containing a numeric IP address regardless of the situation.

> I am working on implementing tagging for x.509 certificates. I found
> other software products that do something similar, so we are on the
> right track with this approach. But it's actually quite a complex
> undertaking, due to the variety of information that can be carried in a
> certificate. Stay tuned.

I really look forward to it!

I'm glad that someone has finally taken this up: A means of securing NFS properly
without Kerberos is *very* long overdue. Was it 15 years or more ago now that
SKPM/LIPKEY was about to be supported but then never made it to fruition? So I
really hope you achieve it this time.

Best wishes,

Ken.

