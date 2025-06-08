Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042F8633F
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749401828; cv=none; b=tzTfvt6w4QGOdLnb4bJx30//2lLcHCfj6pZQYtE6HNwWeLoi+tdgcZkQKeng+IYBaoC464Gb0ml4maf5g9vFFYEytC7oQEzEmIxzA6PwMX1OW8XrPNuMpCNmOBD0SpOJMHJzgx4Mv58hyqPrLTClJWYX5OM+1q0FJcmzjqJn8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749401828; c=relaxed/simple;
	bh=XIVBztJZ6I7uT+mRJDywxrbkH+2yXjvSq1GNdTApys0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCRv/TWQoO7jipmntd+K1MrPNzXILTaEgOsznqvSR4Weg9IMVDmbmFOfkhRdm8sWAHnOw/RzTIKfDuwmYjSqt4GB14ms48E7XmWYsgyyxvZ4hQHXNvIB5g924Dt6PCzSmLGo5aGaTjRHtlISHoHR+Cdn946P2KcDG0INoM8PTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ntju4xdd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ntju4xdd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so47185745e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749401825; x=1750006625; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxqpez0kF93DNUi2/z1sMNuwTQ3AsLouBZPSEuZXvk8=;
        b=Ntju4xddZ6pbNdWuChTd6OnKylkYGZNwczTS6kAo1sEdH3o9LYIIuzYGjRJ0EhvGWv
         EEodzmxxJVc4iVXHyWWXzx+vLPkxMpluMfpFnzVe7EuYF8KXBihSQLxgx1A5ILSMSZlz
         msmjnpcGAbaGpS2Yni5c8YNRz6g/m9LhXlnNTYjisdJLmYwGtqozFxAT0BzN641MhTaZ
         WLd1SX0iXf8ObGnzyhjVoPnaHHlmCaza7djmPGWwcxEZsCCDtD4P9PtDMdNJlQFS3mTM
         whEuipE6gwSP00rNI3T9Biou9fGELCWlQDhZGnTzBeOrWQ+1mN4FZj1DFAScNiYTM7be
         jNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749401825; x=1750006625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxqpez0kF93DNUi2/z1sMNuwTQ3AsLouBZPSEuZXvk8=;
        b=S0ZEr2zPioCRGYCRPDodO4yRUzMlbpKaMSiy0MEZ4XBPHdliXQGMlIX2BIsOJ1dTyA
         2skgUsxaOUNosUFDYoQ0i4jc960OzwDdeyYL7+E+17GzmCHuezvolhHGMV27G5QezG1j
         4+n2kvPdLq4Rfakuo7dkdsEGgYDLAQrodIB1vQhblCpEjavkj1h5GRM5uuWmDLQ3yD4h
         0fXzFKNmwhuE3PLIjyBCipCHOC1jF9gOR06VczLRJiGNRpJUYb+nFpNX1StYBh45If/5
         0uUO8KxYHwsZYKY0VaFfJQinZCXs4ClTPyEVlmBNxm1jFkpX5sQeUtOS4sEVEEaH0U2a
         My7w==
X-Gm-Message-State: AOJu0Yz/7q4YmKKNfuVzAhoDZkUWCpgwF11Wq3yHwApzaARzHY3KU41u
	PUqG6O/Z/D6GC0MbR9nfRsQlLRCV1hT5LkJpWK2yAm1HpSjXCgb8sMKb
X-Gm-Gg: ASbGncu5wEWNkis86j3iiXezRGPx7Q9Gn71MzWEjrxbKeFs93APSjlcq8TwqHppomHF
	IfGbcdgBnT1esbyGfeEJuwiKQjVAGp4Z/B704Z7goH18X/lhn/06ON4Mvdm83/3Szb2OMOSMu0H
	HVC4dsF+1mwUYT+3zjcdh45EyTlupKuMvNjFGzJnoI0GlvnN15jX0CuTQy5niWtvSnTRQwmw203
	tYI9Hq5R8QGJ4SmiLsd3rw5p9tjhVmupnv/1qJwujlkOcps2JgqcFRNVH9e1XdHjXod5AyHZrxq
	S9DsHAN/VpqNzMk/x1q/XsxzEZPy3oSQH2z5L897xy7AAcfr2SNC3rDTCLdcsMsABICOkTm5+yL
	a5fcoA++zdNoawqG1iAw=
X-Google-Smtp-Source: AGHT+IHsg/E1J+1ugLgJn2g32xeJU3JfwLRjnq81UV4keO8ei+QiD0lID7S6yB23xAuScjfPc5tkpA==
X-Received: by 2002:a05:600c:1c83:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-4520136a9f3mr87106575e9.5.1749401825007;
        Sun, 08 Jun 2025 09:57:05 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm89384065e9.38.2025.06.08.09.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 09:57:04 -0700 (PDT)
Message-ID: <8342df0b-f308-4b95-905d-87d2c4a4d55a@gmail.com>
Date: Sun, 8 Jun 2025 17:57:03 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils client address verification and other patches
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
 <0d1d9550-43cc-4e85-9d88-adb72ffd5dfb@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <0d1d9550-43cc-4e85-9d88-adb72ffd5dfb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/06/2025 16:51, Chuck Lever wrote:
> On 6/8/25 6:51 AM, Ken Milmore wrote:
>> I've been evaluating the use of mtls to secure NFS mounts and have noticed there's a fairly serious limitation:
>> Any client which has a valid certificate can impersonate a different client, since the server does not verify client address.
>>
>> This is unfortunate, as I'd like to give different clients access to different NFS shares by naming the clients in /etc/exports,
>> and I'd like to use mtls to ensure that each client not only has a trusted certificate, but that it is only able to access the
>> shares to which it is entitled by /etc/exports. In other words, I want to verify the client host name or address against the
>> client certificate to avoid address spoofing.
>>
>> I can understand why this is not the default behaviour: In general, a server will not be able to verify clients in this way.
>> But for NFS on a personal or corporate LAN, it is highly desirable.
>>
>> To this end, I've developed some patches which allow the tlshd server to be configured to instruct GnuTLS to perform client
>> address verification.
>>
>> Please see patch series here:
>>
>> https://codeberg.org/kbm0/ktls-utils/commits/branch/verification-patchset
>>
>> Because the server can only obtain the client hostname by reverse address lookup, and this has security implications, I have
>> been careful to confirm the hostname first by performing a forward lookup in the manner of FCrDNS: We call getaddrinfo() and
>> check that one of the resulting addresses matches the one which was obtained from the reverse lookup. Should this check fail,
>> we reject the certificate.
>>
>> I've also added an option to use a textualized IP/IPv6 address for verification against the certificate, in cases where no DNS
>> address can be found. This works if the certificate includes the client IP address as an alternative name. It is also possible
>> to use the IP address as the first recourse, and this may be useful in some circumstances - it is possible for client and server
>> to verify each other entirely based on IP addresses with no reliance on DNS, if the certificates are set up correctly.
>>
>> These behaviours are enabled by setting options in tlshd.conf like so:
>>
>> [authenticate.server]
>> verify_peername=true
>> verify_peeraddr=true
>>
>> Another issue I came across involves the fact that when a client connects to a server, the server name is passed to GnuTLS for
>> the purposes of SNI. If the client connects with a bare IP or IPv6 address, this is not strictly allowed, as only DNS names may
>> be used for SNI. This causes the server to reject the transaction. I've added an option to omit the SNI in cases where the client
>> is connecting using an IP address:
>>
>> [authenticate.client]
>> relax_sni=true
>>
>> There are some other patches in the series: I wanted to textualize the peer address up front so it can be used for both logging
>> and also for verification.
>>
>> I also thought some of the processing in netlink.c looked a bit sloppy: Optimistic assumptions were being made about the
>> contents of return buffers when functions like getnameinfo() are called. I have tried to correct these.
>>
>> I am hoping for some informal review or feedback for these patches in the first instance. I didn't want to just spam the mailing
>> list with them upfront. If there is any interest in them, I will submit them formally.
> 
> Some general comments:
> 

Thanks for replying.

> Essentially we don't want to make certificate validation dependent on
> DNS for any reason, since DNS is easily spoofed. Have you considered
> putting the client's IP address in it's certificate's SAN field?
> 

Yes, and my "verify_peeraddr" option covers that. But the current implementation of tlshd does not check either host names or
addresses at all on the server side. Therefore client A can use its own certificate to impersonate client B simply by using client
B's IP address. This is because you are supplying a NULL hostname to gnutls_certificate_verify_peers3() from
tlshd_server_x509_verify_function(). AFAICT this results in no checking of the certificate name at all. I've tested this on my LAN
and it bears out.

Re the insecurity of DNS, yes, I agree it is insecure *in general*. But once you have forward-confirmed an address you are in
essentially the same trust position as any browser connecting to a website via https. I'm not sure why you see that as no better
than no verification at all? The difference, of course, is that in our case we can control the trust store, so we only trust a
limited population of hosts. But what I'm pointing out here is that all trusted hosts are treated identically, which is not very
useful in most setups. I want to check that the client that is connecting to my server actually matches the certificate it is
presenting, otherwise we have an impersonation problem.

Additionally, in the sort of LAN situations where NFS is typically used, name lookups can be secured in a variety of ways.
I'm simply using /etc/hosts, with my systems on an internal domain that has outside lookups (both forward and reverse) on that
domain blocked by dnsmasq, so that is fairly secure. Obviously there is DNSSEC, LDAP and the rest to do this for enterprise setups.

> Further, there will be plenty of cases where clients obtain their IP
> address dynamically. In those cases the server needs to perform its
> certificate validation based solely on what is in the certificate.

In a *general* client/server situation, the client may have an ephemeral IP address, or come in via NAT or a proxy or any number of
ways that mean the server can't reasonably identify the client. In that case, you obviously wouldn't want to turn these options on.
But as I have pointed out above you essentially end up treating all clients as equivalent. You just have to live with that I guess.

But in the specific context of NFS, very often the connection is over a LAN or VPN and the client addresses and names are
meaningful, in fact they are *so* meaningful that this is how access to shares is policed within /etc/exports! So these patches
cover a very natural use case for NFS. I have made everything optional so there is nothing lost (except for the additional security
that you currently don't provide anyway) if you turn the name verification off.

> 
> But meanwhile, you can post your patches to this mailing list (inline,
> not as attachments) one at a time, and we can have a look at each
> individual proposal.
> 
> 

Will do. Thanks!

- Ken. :-)


