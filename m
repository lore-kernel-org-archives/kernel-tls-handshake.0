Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60C171E66
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jul 2024 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795433; cv=none; b=TPapUGQ2Z+UqyrD5p1SlY/A9K7teQeOiiiPHD9F4tG4oqc3uBYx9xL+Wqru5myseeJOvKj8V1alQTxXG7AD+o5qcVk0dsCje01nvtOb/5iMgMQ4bvApiRkB7qPEDEAG7cn/zLsxCsshbzezrHldJ1pkeaJsVinnE7M4MXGM96G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795433; c=relaxed/simple;
	bh=gUEPz5EuKVAYOknmUS1BzZsxiEAXRoqV7fKw6e29CEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BDyip3dShFedUN0jO/PXmXeR6a+LTMSZCsTOKtcLy938crKNqaUbubuAn0PJZRRdTUk7M60+u9GniN+T5vvBfnv16YMcgU1OEzeg2DxK9bg6ZybNDmgl0AoRvibvJi+4NdY4D1N0WR1wreG453cO1wOK69zRG2CsRuNAGX419hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biSLcmFp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biSLcmFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720795430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USUaQfSZnqpM5+3hfWkGrFymmNXh2lm6uExu9Bm+Y7Q=;
	b=biSLcmFp2c0LGU2vFUICiRJWRrLWKgXpm7ZhYFIbdt3NCj7IR04CquiIsxhuuf9C9UIlT4
	LocsJrm20UZvmbO1EgrpTgTXz5KM6FLuOJW6fo5bk9rOstdlvPCtsA3ik5O7CQoe6yfxgN
	RH7AZyLFt6Vb/zr7+0ICrbEIpcLM76Q=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-o6d8Fwi0PTK_1Uk82ZTQ1g-1; Fri, 12 Jul 2024 10:43:49 -0400
X-MC-Unique: o6d8Fwi0PTK_1Uk82ZTQ1g-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3d92e5d767aso418154b6e.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jul 2024 07:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720795428; x=1721400228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USUaQfSZnqpM5+3hfWkGrFymmNXh2lm6uExu9Bm+Y7Q=;
        b=BOQi1r+ivSWdM7vhD87bPwNt6KcFMUNR6+nhnOgYP6q2y/BbUPq7UCrYWiGmDRfgzF
         hChOWCjWY/65UwAUagdw5rbuosYD0LTPHP86+3Beo6F/Be0nn3JuTbGGl8g2inv456g1
         M2ZaOogqypxjKO30QN/eQiqQ+4xnWahVyfW55wf3eSvzL2lyWov3FOcru4lAh292PQ78
         +NZnU4Lgh3oekaFfOLzqjwChj4BoiNC0ZLCiuG1DRxMU5UZBc4/FeWBPcFprWqZzYR5F
         3g1SWhvznOYIgCoORw7Qrl2PKxU4q7Yeam6vKs4V78jARYNop16lHnp+XLVePgIJokQB
         5HsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ848hTeV9S4/hXpzNu3JlAum59kMqyuSqgEmDj0wxezuQRxPD5TxwsXGJski7OXsSsAC9SvUXqeaPYwwcYX76FZBOSMYYp2LHc/KOjLO9jFsrOrY=
X-Gm-Message-State: AOJu0YxE2ltLNHkYoINaeVmFOHl1nJzMFrlc6egAJbr7L44ve5+nhE1X
	lxmCm176PsGffqAnMeMDZF2PGa8HjkTsDcIZu3jMNSwTs0EE4ThGzuzyp52P1DxYLMeGr5xf/pd
	DmvHCrlGN0XUCj2+zkcjk6hHou3hpHhR2a8k8TTlr/p0H4DIDSR2ibt6+Ky1BuFwMSNGrqZ9MRb
	+zE9Dh
X-Received: by 2002:a05:6830:1650:b0:703:78ff:1e1 with SMTP id 46e09a7af769-7079f21be02mr5529861a34.0.1720795427900;
        Fri, 12 Jul 2024 07:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZG/40Zml+g28zYmkAtbEEuSwLANdKol/8Q+Lu3Yr0HR3blTDBMCBoWJ55B3OVnfhQ5bpRxQ==
X-Received: by 2002:a05:6830:1650:b0:703:78ff:1e1 with SMTP id 46e09a7af769-7079f21be02mr5529852a34.0.1720795427620;
        Fri, 12 Jul 2024 07:43:47 -0700 (PDT)
Received: from [172.31.1.12] ([70.109.136.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba7afe0sm35703146d6.76.2024.07.12.07.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:43:47 -0700 (PDT)
Message-ID: <91bb8272-e9a9-493d-8e21-613574f02389@redhat.com>
Date: Fri, 12 Jul 2024 10:43:46 -0400
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: patch review for upstream ktls-utils
To: Chuck Lever III <chuck.lever@oracle.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <EDDA7FA4-FEDF-4687-A6A6-112D9CEC90FA@oracle.com>
 <51FCC68D-03C0-4B96-BAD7-9248D6D80405@oracle.com>
 <A579F7B3-0044-4EF1-8AEA-BDAAC93BF536@oracle.com>
From: Steve Dickson <steved@redhat.com>
In-Reply-To: <A579F7B3-0044-4EF1-8AEA-BDAAC93BF536@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/12/24 10:17 AM, Chuck Lever III wrote:
> 
> 
>> On Jul 11, 2024, at 11:01 AM, Chuck Lever III <chuck.lever@oracle.com> wrote:
>>
>>
>>
>>> On Jul 8, 2024, at 1:40 PM, Chuck Lever III <chuck.lever@oracle.com> wrote:
>>>
>>> Steve asked why a number of recent commits to the
>>> upstream ktls-utils repo were never posted to this
>>> mailing list for review. The answer is more complex
>>> than I would prefer, but here goes.
>>>
>>> The instructions for contributing to this code base
>>> are here:
>>>
>>>   https://github.com/oracle/ktls-utils/blob/main/CONTRIBUTING.md
>>>
>>> It mentions creating a GitHub pull request. That is
>>> the usual method to contribute to code under the
>>> https://github.com/oracle project -- perhaps the
>>> /only/ method to contribute to Oracle-controlled
>>> repos. Indeed, even repo maintainers are not
>>> permitted to use "git push" on these repos.
>>>
>>> So for many recent patches, I've just taken the PRs
>>> that were opened on GitHub. Once or twice, I have
>>> emailed kernel-tls-handshake@ to ask folks to have
>>> a look at the PR on GitHub.
>>>
>>> For patches posted directly on kernel-tls-handshake@,
>>> I apply them to a personal branch, push them to a
>>> GitHub fork of oracle/ktls-utils, and then create a
>>> PR from that fork.
>>>
>>> Until now, ktls-utils has been "experimental" enough
>>> that patch review has been a "nice to have" rather
>>> than a "need to have" -- but that will be changing
>>> soon enough.
>>>
>>> I would like more review of work that is submitted
>>> only via a GitHub PR. Towards that end I have
>>> looked into setting an email notification that is
>>> sent whenever someone opens a PR. GitHub does not
>>> appear to support that. I still have to check to
>>> see if I can set up a GitHub Action to do send
>>> email for each PR. The usual approach for GH is
>>> for people to Watch a repo (ie, opt-in to
>>> notifications) and that's awkward to do for a
>>> mailing list.
>>>
>>> I'm reaching out now to see if anyone has other
>>> suggestions or thoughts.
>>
>> I'm still looking into crafting a GH Action to
>> send email notification for each pull request.
>>
>> In the meantime, if you are interested in getting
>> notified about pull requests, please go to your
>> GitHub account and "watch" the oracle/ktls-utils
>> repo.
> 
> I haven't found a GitHub Action that is approved
> for use for repos under the oracle/ project that
> can send email notification.
> 
> I did find an open GitHub issue requesting more
> general support for email notification, but
> there is no response from the GH team.
> 
> https://github.com/orgs/community/discussions/18039
> 
> For now, please "watch" the ktls-utils repo to
> follow requests for review. This is the typical
> workflow for GitHub repos.
I just look... I am watching for "All Activity".

steved.

