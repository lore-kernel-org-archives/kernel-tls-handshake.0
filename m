Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B5316199
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 May 2026 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881744; cv=none; b=rur/qtv9p0qlCj9LDHWUxRSN9p2XCDtaNOeJvThXtDCGbeDcO/Roqgd+iyP8xmtrvKC78u32RGT7rMrAL29SgXffP/837iMXI3ODbUjo/oJyhIaUONoOF863vMHi+tJbOwKzflNGBY8M7nqDul+o6V9h5wjxnu5lWVi4Ntp1Yog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881744; c=relaxed/simple;
	bh=Mkwvvchs5dFnGFmZxJVzUyBojjwtQ7xEYiCsoAxi0yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFMtVrM8A5ecPL6ffH3icPV4EUjDyjewzSWt5NUpWdiplZRgVGgQ1NStaI7S1bS55jmDn1GqcFnMvxZJ1h2YryhbugDTNcKv4s0IBeM4LUPXrSwdg5/07JtSsYtUHIt/BjmyG8D4dgv/OCvDVP3XDMO17nxDs8olpPfO+wkFPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48909558b3aso40171145e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 04 May 2026 01:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881741; x=1778486541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CarnnHPlg7YuwUl7tfiZl86Zqe2Qu+0fW+ZFKF4meNI=;
        b=Ohqm+G7QCC05w3WAUCLvuz8u16ZJU5LZ/+rNhIUsYRwFJp/l2+vHOcG5nQQx7+wOKM
         oc6AJzFq+9cQmlFmtfhxLfP/K/x+osPGf4A/uFQSm+MHi5lvIXsic1YUZhGhKZ8FFz6/
         2ShM0fxPqyuuM3lNFM07w+UBxwq8vY+j8xqaiDDKjqh82l2nn7XcgJ9tt06o2q7R+MPJ
         uvtmhAX1qH3aYSs9XJmv+7YnVUq7WDG0Q6jOWbpKCJSli7OoY6QLjw4PcgNYY48cusid
         CMbs7uEn/axgR1NsntcyH8qIgua6Qphrbb/UIKAYMo4DZQbnSOz/007sHJbFc77YLxUl
         scIw==
X-Forwarded-Encrypted: i=1; AFNElJ+dFW8DUlR9XtzyrFC7lFWWrrBZSQkiq5IV7bUuAUgv/lB+p6b+j7obG1MfA+Ok4kiLBsj4IXKKtQ6tNtAnLXqjvQtG4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnJSPG40zwn/TIbwF1UiHBUQjkMDjddrGA/VSEvB01nk4sFaWN
	/6DQj7Izpw5/TooZrJYVbeRkSPvnqWqBPCrCoscBcggqTAXg9w680Vnm
X-Gm-Gg: AeBDiet7gyfWKBIrsBr+aeQATp+3dWakz4VoJA01ilQWdKcfyN8CO9zQR1kTgIyNeSl
	elFNIUL9DUtKSzjuKUSL+8D5IaNPuFErs9MYRanJJLoa8BwnkOP3OFYI82CwfXU4oa3S7SsF//X
	NCrhp5Xf/b0vxVDe+r04VcSZMujs6wvIDmUaD2e1CeYzTfXDYKUiBPwdT6vDkeQAxtNT4ILYFnj
	TFEb3O9Iym+pypiL2jIJFJziUKpdnNnni4aZNYiIgKVGAXRtWkMxOR6FEbSNWwT8wakpJoEnob9
	nmKPmTlKMfdNwKgJSGMcSwHOvIRvgriloL/QaktZAL2mgAvRDhHUX4ZlaWYhXt0lYXvCIOHNa3L
	0aGQDeJ5xi8BZI/Ie8NuF+C0uaKr6cWKKOmgke87HmhmfVX62KI6Pyjlwl0CpzrPZCIC9Tv7Omy
	/B/nP7/Z1srsczRhuz+7LWCrhEmul1tkk0qYxja1Y+++1cjnYLKadoa7i+TyVnHYyCAOG+QBOYA
	g==
X-Received: by 2002:a05:600c:8903:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48a9863891fmr108942705e9.10.1777881740652;
        Mon, 04 May 2026 01:02:20 -0700 (PDT)
Received: from [10.50.5.21] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c3422sm283977185e9.8.2026.05.04.01.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:02:19 -0700 (PDT)
Message-ID: <7390cf6c-0f65-41f9-b5e6-4414417efa2c@grimberg.me>
Date: Mon, 4 May 2026 11:02:17 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Breakage in ktls-utils with nfs keyring?
To: Chuck Lever <cel@kernel.org>, Scott Mayhew <smayhew@redhat.com>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 kernel-tls-handshake@lists.linux.dev
References: <fd4aaf4e-b1b7-4ca2-bc93-955c31fab317@grimberg.me>
 <92a53963-1e4b-42eb-af81-6be9f63f9e43@app.fastmail.com>
 <afUKzeUYPhb97DX4@aion>
 <7c6516be-adb9-4d0d-ba7c-fa107fd4a865@app.fastmail.com>
 <e55cd958-6d86-4c6b-abc6-5be83fc53b0b@grimberg.me>
 <98a865cb-94e3-4f57-8b9e-0634c43098b9@app.fastmail.com>
 <2330c9c6-de7e-4cac-b991-3ffcfdc23858@grimberg.me>
 <ce60fc54-5082-44a4-99ae-dccbbb25eb88@app.fastmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <ce60fc54-5082-44a4-99ae-dccbbb25eb88@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> This is because handling an NVMe PSK in the keyring is a first-class,
>>> supported mechanism. Handling the x.509 certificate this way hasn't
>>> really been thought through.
>> What makes NVMe PSK more "supported" than x.509?
> Hannes contributed NVMe PSK in the beginning. IIUC PSK was the first
> authentication mode available for the NVMe/TCP protocol. I'm not sure
> we can say that x.509 is supported for our NVMe/TCP implementation,
> though that is something that should be made to work someday.

That depends if NVMe standardizes x.509, I am no longer a member of
the TWG so I don't know, but I agree that it would be very nice to have.

>
> Likewise for NFS and x.509 -- that was the easier authentication
> mode to implement for RPC-with-TLS. Eventually we want to support
> both.

OK.

>
> It's simply a matter of development resources and priorities, there
> is really no spec reason it cannot be done.

Agree. Although I am not aware of a need to use PSK over x.509 for NFS...

>> The way I see it, use of a keyring most likely mean users rely on some
>> automation software to populate it anyways.
> Sure, but that software does not exist right now for NFS.
>
> And with containery deployments, everyone likes to write their own
> special scripts. Hard to say what exactly the nfs-utils-provided
> pieces will need to implement.

OK. So just so I understand, what interface would you expect mount.nfs
to have for this? Or you expect rpcctl to provide an interface to create 
keys
with nice human-friendly identities which would in turn be referenced by the
nfs mount command?

>>> You are also building tlshd from scratch rather than using a distro-
>>> packaged version of it. That's rare enough, but it also means you can
>>> apply the patch that fixes the issue and build it yourself.
>> This breakage was brought to my attention by a user working on
>> Ubuntu24.04 ktls-utils (1.3.0). It'd be better if we'd caught it sooner...
> Full CI is something that is still in the works.
>
>
>>> I'm open to considering a dot-release, but you haven't convinced me yet.
>> Ultimately it's your call Chuck. But IMO we shouldn't hold out a fix
>> for this until we are happy with a nicer mount.nfs interface.
> I have to stop you there: That's completely not what I'm saying. No
> one is holding back a fix -- it will be merged into the main branch
> in a few days.

Bad choice of words :) didn't mean to say that you are against fixing it.

> The question is whether this issue merits fresh upstream releases. As
> I said, the capability isn't advertised, so at this time anyone who is
> using this capability is doing so at their own risk. Whoever told you
> this was a production-ready feature of the NFS client was mistaken.

I don't think anyone told me, The mount params exist in the kernel, and it
was working, so I just assumed that this is supported.

>   Can
> you provide a key serial number on the mount command line? Yes. Is it
> something that is tested and is the interface unchanging for all time?
> No.

Yea. The person leading the project was not aware that it is used by anyone
so of course it is not guaranteed to always work.

Perhaps we can discuss what do you think is needed to make it something
that is expected to work. For sure it needs to be documented in nfs(5), that
is a no-brainer. What else though? (my assumption is that TPM support
and per-namespace certs are not a hard requirement for the keyring feature?)

> It wasn't clear that 1.3.0 was the problem. 1.4.0 was released just
> last week, so that's where my attention was focused.
>
> What you are asking for, then, is a 1.3.0 dot release for this fix. I
> still don't feel there is a strong requirement for that, given that
> distributions apply fixes to packages all the time. But I haven't made
> a final call on that.

I suppose we could have users open bugs to their different distributions
which are exposed to this and have them fix it in their pkg. Or, tell users
to build from upstream/main. The question is what is the downside/effort of
making a dot release that contains this fix? That I do not know.
