Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31F358D32
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  3 May 2026 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777794538; cv=none; b=Y+XDi/9zIBQOgy0FQv+UlK2gxFwmN5ttaysUh4qr8k/17lr+t0kzfTt9Y09GM5IR2PG6rIIpVsi+9WSsLQ9l2uSG7jNG4ngZvCRo3zpXQc+qndBHy0EfkxGcZKFcXL4rSRSA+9AN4mDZDRDITh1a7ACbjDBI6x0FN8jMYgU939c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777794538; c=relaxed/simple;
	bh=PLx9Zoa8UL5sjHZD5SjE0bRUhgl/4Oe21i0xKz+x7TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0HWWk83GKCy6lMHQkPmnlxMJ+6OT0gTOWCtcugh48eKFO4Oonutmta5I1IIX+mQUVAEBLqyvfRiygMY8SJBON0prj1MjpvPQRzSbnn4eiKL1+2Kr1G4lIsxuvPZkJLlcH+thcCD5pQnueVQprxKvpMhgIqzNSz+aZqLSTPbSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso37236175e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 03 May 2026 00:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777794536; x=1778399336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPHUcGdbv7Ch7jGJFK5JqglmPmO4Ck3el5ikbMNjxkY=;
        b=m+9ITVIiSMzbMLhEgYLxE3m061jKq2bOZHiBBKpawbA2cqRGe51m44swHRWsU+cTmW
         2nzdg9/j2kqArUjAKVmJB6EiI+AxM+b8oSXVlxLzfdMz+KJsubzZYIjFb4Y/qOBZX/jV
         8h+FWCj49ookAy6G7KcHenfLIbXJxgsy8chg8G2GOchcWlD0xYSYpvKippq4Pk14wXZi
         ZBz78QLq5AdPy3bAh0WiUu0t/b8hCgdSYpct7Wtaq4HRTWLu9yBEYP63XUwdIkdiauUY
         Q0tqK6kjlBLhSRcdTxOhmFtQ1Gm/jzj5oLYMAx5zPQaShIjt+yW4bgY22laToGmizLmI
         oALg==
X-Forwarded-Encrypted: i=1; AFNElJ/2zPy3ljnOOymnCHNckj6HZEcaWj77DTCJWCCtTq2wD8b+8ByxeGEBnkAl/ZTnBaohfcWtkerQ5j2fEh8bbnFpfzXP9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhFpBYszRQur3QUkki8Dpd3yDkpq19+kfkYZflTpnJHnzr4mf0
	0MvIjGubqvhI/75S73ehRTfF4CYYHCr9NZlDCU+uF6r5rAKLfYKdrJJE
X-Gm-Gg: AeBDieu3izGE0xluYIegSx5xD2RU7RqcBcIK/gqdvSkIocAiFu6PyIWpXnYOoY5cuPT
	jiHehgKIVEEoBwt6n4WhLSRbYRdGlvbvvQdBJVRV4AHYdf2G+VpHkQTnQHBauQv55uw86Fo9zcu
	bqlJk4eBlY2MWB8GQvGjXP815w4tNVBCzNEUjsSv8iPautOx9r5Tk52CmLQyhy3EbKhg19Sj4Kh
	QLT107m2YPMTFkzUBGZt6r5+xxbQYNpw7EdmmZisTMWRp+mqK0iPoOTYWhl2Gl2yeYLI7qkAhP6
	En7l3Fj/cmsSaSzuIhDJFjoCjwDA/acrspHBVYiStrQaOV2jETlevyPIovFIAVrCpX/477ufdE0
	3OeLjytPmhWdFURh3LyIjDznnNdhyO8A69G7hJ1uNOhTh8hAqDzI2TlVY+9RYEyLTeb4rf4Ojh6
	yDoSSAsQhvtLMM6+0GwtlWB6SEi7vSNYvbjlncoHmGF1yN/bbNcqp2nDtJT+p9a2Hul1YDSRhSU
	A==
X-Received: by 2002:a5d:5c89:0:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-44bb5b4d38cmr8855673f8f.26.1777794535829;
        Sun, 03 May 2026 00:48:55 -0700 (PDT)
Received: from [10.50.5.21] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf5dsm17093705f8f.1.2026.05.03.00.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 00:48:55 -0700 (PDT)
Message-ID: <e55cd958-6d86-4c6b-abc6-5be83fc53b0b@grimberg.me>
Date: Sun, 3 May 2026 10:48:54 +0300
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
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <7c6516be-adb9-4d0d-ba7c-fa107fd4a865@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/05/2026 6:08, Chuck Lever wrote:
>
> On Fri, May 1, 2026, at 4:19 PM, Scott Mayhew wrote:
>> On Thu, 30 Apr 2026, Chuck Lever wrote:
>>
>>> Cc'ing the ktls-utils development list.
>>>
>>> On Thu, Apr 30, 2026, at 9:32 AM, Sagi Grimberg wrote:
>>>> Hey Chuck,
>>>>
>>>> Upstream ktls-utils fails passing client certificate and private key
>>>> using the .nfs keyring.
>>>> Bisecting leads commit facd084e43fc ("tlshd: Client-side dual
>>>> certificate support").
>>>>
>>>> I manually apply this (probably wrong) change and keyring works:
>>>> --
>>>> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
>>>> index 2664ffb..a946797 100644
>>>> --- a/src/tlshd/client.c
>>>> +++ b/src/tlshd/client.c
>>>> @@ -327,7 +327,7 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>>>>           } else {
>>>>                   tlshd_log_debug("%s: Selecting x509.certificate from
>>>> conf file", __func__);
>>>>                   *pcert_length = tlshd_certs_len;
>>>> -               *pcert = tlshd_certs + tlshd_pq_certs_len;
>>>> +               *pcert = tlshd_certs;
>>>>                   *privkey = tlshd_privkey;
>>>>           }
>>>>           return 0;
>>>> --
>>>>
>>>> But, I have a feeling its not the correct change...
>>>
>>> Scott, can you triage this?
>> So when I added the dual certificate support, I didn't touch any of the
>> keyring code.  Frankly, I'm not entirely sure what is the right way to
>> set it up and the docs are pretty much nonexistent.  As far as I can
>> tell:
>>
>> - you need to load nfs.ko first so that the .nfs keyring gets created
>>    via nfs_init_keyring()
>> - you need to restart tlshd so that it links the .nfs keyring into its
>>    session keyring (I tried loading nfs.ko at boot via modules-load.d,
>>    but tlshd still reported an error saying it couldn't find the .nfs
>>    keyring)
>> - you need to convert the cert and key to DER format
>> - you need to add the cert and key to the .nfs keyring, e.g.
>>
>>    keyctl padd user "nfs_cert" %:.nfs < smayhew-rawhide.crt.der
>>    keyctl padd user "nfs_key" %:.nfs < smayhew-rawhide.key.der
>>
>> - then you mount w/ '-o xprtsec=mtls,cert_serial=...,privkey_serial=...'
>>
>> Is that somewhat accurate?

It is.

>>    Is there a better way to do it?

Have a script/automation SW.

>>   It seems
>> like a lot more work than just using the config file.

Well in some cases, storing credentials on a persistent file is not a 
viable option.
For nvme there is a userspace utility that helps with this to some extent.

> It is more work because keyring support for the NFS consumers is still
> aspirational/experimental.

Can you elaborate? I think people expect to be able to pass certs/keys to
tlshd the .nfs keyring. Also I expected it to work (as it used to).

>
> I've pushed your patch to a "fixes" branch for folks to try out. I'm not
> sure yet whether we want a 1.4.1 release with this fix, since keyring
> support for NFS is "not finished".

I understand that there are features that are not supported via the
keyring interface. But I think that users expect things that used to work to
continue working. My personal opinion is that releasing this fix is 
appropriate
given that this is a regression.

Is keyring support for NFS marked as "experimental" or "not finished" 
anywhere?
[I should register to kernel-tls-handshake mailing list]
