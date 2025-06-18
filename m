Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299F2E54CA
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259040; cv=none; b=gSW4vfgeCvb3LB2L3YP8MUCTFSZku15tIEkKOpJbeFD7caRp9Hc91ukJECxYCKxx4QfFMeCLncmPsq104cfDmNRkIenlJvzugHXMDpNHoQbBcsTnR7dqXupuV6KN65qK2SDRCFTJJr/VRMViotTof9GcxCxTlsW06q0mkMMFVKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259040; c=relaxed/simple;
	bh=13yWN+bcq8HbxWDrTzyKWxIqpCHZjJEJVYyT8eO0j54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qk7WY/zLT1eyxpm8CmfJmEqnSoL8yeNmj3tEIHdTqJOqmRDASSQh96Jh4nj/QljTS1FfCv91t5WvjnHCiQxBRmOS1wOvpKaoS37/EYaO683QUFWD9ijfctVlDS2jDZutg5lK7+D7snA0qs6B3eS5ibXEtlU1hGWoMcNXTZDf9aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyzh0WJa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyzh0WJa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b584ac96so5520003e87.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 08:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750259037; x=1750863837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bUMsBqSF1ApFtPnWUcTgROrRmehNkiI8ha8FEydv3U=;
        b=fyzh0WJa/97HBMt0aLsENZBqGY9wTF24IH8gneFH5HZN6AKhp/UqySaClcV7etk+f5
         Cr4syswCy8KqYEiblCjnFdC8O9hvm5UEYQ2LniwFxP+o6yWc8dnOByf1Ink38nIX1PDv
         8VB9ZZ12UPV1A89h93Q4ewuIW/bHr3eFleaXa4TVoT5ejldnEkKFK6X2oIf6CUiI0Jb/
         5fqyaL9UeaNVLY6JVLL8s/INOqYXClBuJVcSdAjDcGpHiJEnWrYsHA+h/AvVgdGPO9Zd
         ju2L4EvmGtFHZbQEH546M/OSTwfJ7W88ZparOmSGu2zryz7NS+5hlImelhnNJ+1teD1L
         SzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259037; x=1750863837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bUMsBqSF1ApFtPnWUcTgROrRmehNkiI8ha8FEydv3U=;
        b=G76Wjo+Wv8a/MHY/9E6I6LutU4Ga4hs4MrFmA0ri5mArPH4GD/KoGrtejueBwDUppw
         Zureb2TOdPjzmjBi9noPlu+H5Ot5BR/FwIOode3QfalruW52Bs++QeSJ5WWoS3mO/1Ee
         JVlG6v6xetCgA3+pSJGapfpusWTv5SmPj3VkzVfMXlebOfD9mLEqIKVb4jrodszAZGpI
         RTLoCEulQOzY1fxvW9NvnJSSrD+5AYXdALX4Nz7/vZsqux/jNxbKqxuPSN8yEtxNlO5r
         2XLMLaMF0SH6/r8TEBxbostXMibMHaqrqvvfDagq1g7BQ7FalslMbQTG/TZSHDopiV+S
         igKA==
X-Gm-Message-State: AOJu0YzjoQiRwbwfog+7qE4pc35dKVnbOWUqsDE/YP/0jXY5jv46xGBU
	aD5GYD2/fJ10/T4JKQRYdLgqHRxfYykoaaUnchHq+0n983T/6SgDwP9MVFnizQ==
X-Gm-Gg: ASbGncs+EMmxaxzvPQxqWCqst8H7T58WbA+mXC7fT7vmJjnL8FXncaQzKP6KoXL58+k
	fa344JJgxwz/Q4+3oJevvNn/zDEnZMe40/8nQPN4c5SzeH6t2cXcu96osDqRBHC9k5U5yPowvGT
	bCZFja48JfWl5J8BYvfdL18Dp2Pxt7HHiVPedAYbU6+9b7LNGJ2gejUMfVrQx5vX5OcI1kzt1SC
	/YaHsZC3wgaleqlLBIDtSdiem/nsJJXIRFnArUVx466Bsi0v8dWDfYI7B2uw5nn0BmLcFrcZTIl
	ss5WLgsfJPMjV+vQe7js39IUm9tukD+qbNbSfIe/tYZ7uwPTJ+EEuR2G3+WwPjcJ4p+NdBqLh95
	b9ty8JmIpIlt9KLHc9XlchMw/sQ08dUof
X-Google-Smtp-Source: AGHT+IFkmXyezjJVAaI+ZKScxbpajjnoGknenxtrJWnNjSztEtkyu0Xzqeq1dl9KYP6q9L1RpIMyIQ==
X-Received: by 2002:a05:6512:15a4:b0:553:5121:d70c with SMTP id 2adb3069b0e04-553b6e8ca5bmr4635291e87.15.1750259035548;
        Wed, 18 Jun 2025 08:03:55 -0700 (PDT)
Received: from [192.168.1.227] (102.135.90.146.dyn.plus.net. [146.90.135.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c192sm210333205e9.26.2025.06.18.08.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:03:54 -0700 (PDT)
Message-ID: <47ec64e3-22f7-46f0-b929-963f7ebc1bca@gmail.com>
Date: Wed, 18 Jun 2025 16:03:54 +0100
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
 <7e910cd5-f095-4002-841d-ea724569312b@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <7e910cd5-f095-4002-841d-ea724569312b@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 18/06/2025 14:42, Chuck Lever wrote:
> I implemented this.
> 
> However, apparently, source IP addresses can be spoofed as easily as DNS
> query results. I don't think we can make even the IP address check as
> secure as it should be.
> 
> Add to that, such a check is not possible to do for clients with
> dynamically-assigned IP addresses. That includes most IPv6-based
> clients.

I'm grateful you've given these patches such careful consideration.
You've demonstrated how this sort of client verification doesn't apply
in many situations (insecure DNS, dynamic IP addresses etc). I always
understood these limitations, which is why I made the functionality
completely optional.

Given that tlshd is a very general mechanism, proposed for purposes
other than just securing NFS mounts, I can understand that my approach
is not an ideal fit.

However I still don't feel you've grasped the reasons why this approach
is useful, and could be used to enhance NFS security in certain limited
(but IMHO very important) cases.

To spell it out again:

- The current position is that mtls will allow access to ANY client with
a certificate in the local trust store.

- This means a client is ether trusted to access ALL exported NFS mounts,
or NONE of them.

- For effective security, I wish to limit that further so that a client
must have a certificate in the local trust store AND that certificate must
match the network address or host name they are connecting from.

Why is that useful? Because each NFS mount is exported to a particular
client or group of clients named by network address or hostname in
/etc/exports. With insecure NFS, this is not enforced in any secure way
and therefore a client can easily impersonate any other client and gain
access to the mounts which are exported to it, simply by address spoofing.

These patches were to enforce that the same checking already performed
against the NFS mount point are also applied to the certificate, therefore
it attempts to PREVENT TRUSTED CLIENTS FROM IMPERSONATING EACH OTHER,
limiting them to only those mounts for which they have been specifically
addressed in /etc/exports. See my previous post for examples.

Without this additional checking, a client is either trusted to access
every mount, or untrusted to access any of them. This greatly reduces the
usefulness of mtls. An analogy with user accounts would be to say that
you can have as many users as you like, but they all get root access!

When looked at this way, you will hopefully realise that in scenarios
where it is possible to verify all client addresses, doing so can only
add to security because it ensures that a client must have the correct
certificate AND an address that matches it, a more restrictive criterion.

> I might not fully understand the vulnerabilities you are trying to
> defend against. IIUC, there are two distinct impersonation attacks:
> 
> - A client's certificate and private key are copied to a different
>   system
> 
> - An attacker creates a certificate that duplicates an existing
>   Subject
> 
> Seems like both of these can be mitigated using a narrow truststore
> for the NFS server's clients and/or a CRL.

The problem, it seems to me, is that having a global truststore is a poor
model for securing client access with mtls.

A global truststore works well for a client accessing a server, because
it wants to verify that the server is not being spoofed and gain a secure
channel to it. This is how CA certificates are most commonly used.

But with mtls we need to look at things from the server POV. The server is
going to grant access to some resource (e.g. an NFS share). It can check
if the client has a trusted certificate, but if that is all, then it implies
that EVERY trusted client gets access to EVERY resource or share. Not very
fine-grained.

In terms of trust stores, I guess the only way to mitigate this would be
to specify a different server trust store explicitly for every share in
/etc/exports. That seems rather unwieldy, but it would work.

> Do you feel up to opening an issue [1] and describing your threat
> model?

I can do so, but I'm not sure whether to frame this as merely a lack of
documentation or a security threat. It depends on the security expectations
people have of mtls. A big warning in the NFS man page saying "mtls does not
protect against trusted clients impersonating each other" might be sufficient.

Let me know your thoughts.

-Ken.





 




