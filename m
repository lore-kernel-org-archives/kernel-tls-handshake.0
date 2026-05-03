Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48EF3A6F02
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  3 May 2026 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777840664; cv=none; b=KcSY52REwOKCRwSZXlPyk3m7BP8v4taIRoQWBTESyOKZQm75CpNcBXyLxq0SZ9tG89fRWES+OSlbj0QaF1lD1owr1pTKBSm43AOeylzZK5XFOqZ2YlJQRWGeRvCES2+69hGQL4mrUI4b4D2lZMN2gkvOD5myYAz+xufshXHHm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777840664; c=relaxed/simple;
	bh=Z5b86b4L+PAinJD3BxZUrtC9W5L6diq78KjWtWbTvvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeXixx/6TJ+5aYo6+HvcbOhsRtUZNwdTqh7lbFfNmvtsA/wHeLP3iWYf8/2K6FYGoOfv1zTtuNxS2sJihhMf7/kcbmQa/TENKZVjCNQ6IbJkOxunvC7DRhVtvSjovwUFHMJIMczwphJFR1LJjRYFZpKkrU67anO816Luu337D1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44da2de25f3so244489f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 03 May 2026 13:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777840661; x=1778445461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBhoBNigO182+FyYzF6s+pQ5AVkS34awtZUk4Xg9sYs=;
        b=PEYqMvBBUtv8buEwVotqSH7p/usnuCx6//q7Qts8N6eYGyCVBA04HAjs4nAe5oOQ8T
         bTDVYUiW/pj1iUCO6eJA+SthVmHOl0bg2v5pE66btr4zvJQDieRMCFGn5uAggEVjVf+n
         B8cgzbq4vrHDO3bXi3t2vg4kLBZVW5eYrxtYQnKBy6RwCbABouVf2r2/6zFEeEPndBA8
         7c/ncY9QEUPF22gChFbozydAmujOgt8r4JeiIHOX8hBMqg/EqQpIxqtKGPrqnsOHVJA2
         RQyBLwb3wEhEG1aGHRAM4kq2g8QE8TCrFsSwpDg1e76Znb9rAArrGBn1gzqxYA8Asn8l
         Rv7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9jhwAct+nePey+Ws9Z/A+mn4zb157Sv2Fmob7FND1aJhKmdxGuZ78ByYe9S9XSGi+YQ+bqkzYL7IpP4aKsd6MivLs2Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHWztEb+TdKric/rCS4tq5OC2z6p7FTEFHDnAyjy5Hc4uFS1Kj
	zdrE+yBo8A5lCgVQ+oeBmX5sKarLPEB1cKnZQtuxLUx+DlOtIIRgrm2e
X-Gm-Gg: AeBDievQN4yvSfnRvG2raVr6eVHBz6alMJ5OxhJuzL1fUuUMh/WQWEQ8C6FyJrFts1z
	7fowsWCAO6tik8n2fnXtikE0A5e12k4MZgjTGjfDlQNVnnh4eDzA2bEOdZlxE0WIv0CzfZThvlG
	BUowSSHOcf8ENrEm9kCj5f5s4hQMOT9U0NO/D/y9WgSB217ASnUtl8BUUqdNWZOEceBTRj9+/N3
	fQNhyf0APNPwfZIFJlHtJvwkTO1hxJqPaHCcFeqrnurBP6wDagHOa9e00TqTX6a5+IjTXZZVCqJ
	WoU7vdj63L/T8fHaNzuObUMRcLY2FSamro6nPzBLM0x/nVNKGh/9PKN2bu7xDTysQGo7N/paBOp
	xfmVLot9Bl8Yl5stU+6nr4ZMdLf2DPk70KAd9wmps1/H4yscsPtYkFkos9XmHhmUEFDwWmqH1am
	y4kdTUE88gRF4XJFYN9VZUG26qzeOJi5JFPFoVP45GB0uBLqVq7yjw6zr9Lk217eyPGmrt
X-Received: by 2002:a05:600c:a590:b0:48d:5e7:a5b4 with SMTP id 5b1f17b1804b1-48d05e7afb7mr23347075e9.23.1777840661043;
        Sun, 03 May 2026 13:37:41 -0700 (PDT)
Received: from [10.100.102.74] (89-138-71-216.bb.netvision.net.il. [89.138.71.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm485050665e9.2.2026.05.03.13.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 13:37:40 -0700 (PDT)
Message-ID: <2330c9c6-de7e-4cac-b991-3ffcfdc23858@grimberg.me>
Date: Sun, 3 May 2026 23:37:39 +0300
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
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <98a865cb-94e3-4f57-8b9e-0634c43098b9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/05/2026 22:11, Chuck Lever wrote:
>
> On Sun, May 3, 2026, at 9:48 AM, Sagi Grimberg wrote:
>> On 02/05/2026 6:08, Chuck Lever wrote:
>>> On Fri, May 1, 2026, at 4:19 PM, Scott Mayhew wrote:
>>>> On Thu, 30 Apr 2026, Chuck Lever wrote:
>>>>
>>>>> Cc'ing the ktls-utils development list.
>>>>>
>>>>> On Thu, Apr 30, 2026, at 9:32 AM, Sagi Grimberg wrote:
>>>>>> Hey Chuck,
>>>>>>
>>>>>> Upstream ktls-utils fails passing client certificate and private key
>>>>>> using the .nfs keyring.
>>>>>> Bisecting leads commit facd084e43fc ("tlshd: Client-side dual
>>>>>> certificate support").
>>>>>>
>>>>>> I manually apply this (probably wrong) change and keyring works:
>>>>>> --
>>>>>> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
>>>>>> index 2664ffb..a946797 100644
>>>>>> --- a/src/tlshd/client.c
>>>>>> +++ b/src/tlshd/client.c
>>>>>> @@ -327,7 +327,7 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>>>>>>            } else {
>>>>>>                    tlshd_log_debug("%s: Selecting x509.certificate from
>>>>>> conf file", __func__);
>>>>>>                    *pcert_length = tlshd_certs_len;
>>>>>> -               *pcert = tlshd_certs + tlshd_pq_certs_len;
>>>>>> +               *pcert = tlshd_certs;
>>>>>>                    *privkey = tlshd_privkey;
>>>>>>            }
>>>>>>            return 0;
>>>>>> --
>>>>>>
>>>>>> But, I have a feeling its not the correct change...
>>>>> Scott, can you triage this?
>>>> So when I added the dual certificate support, I didn't touch any of the
>>>> keyring code.  Frankly, I'm not entirely sure what is the right way to
>>>> set it up and the docs are pretty much nonexistent.  As far as I can
>>>> tell:
>>>>
>>>> - you need to load nfs.ko first so that the .nfs keyring gets created
>>>>     via nfs_init_keyring()
>>>> - you need to restart tlshd so that it links the .nfs keyring into its
>>>>     session keyring (I tried loading nfs.ko at boot via modules-load.d,
>>>>     but tlshd still reported an error saying it couldn't find the .nfs
>>>>     keyring)
>>>> - you need to convert the cert and key to DER format
>>>> - you need to add the cert and key to the .nfs keyring, e.g.
>>>>
>>>>     keyctl padd user "nfs_cert" %:.nfs < smayhew-rawhide.crt.der
>>>>     keyctl padd user "nfs_key" %:.nfs < smayhew-rawhide.key.der
>>>>
>>>> - then you mount w/ '-o xprtsec=mtls,cert_serial=...,privkey_serial=...'
>>>>
>>>> Is that somewhat accurate?
>> It is.
>>
>>>>     Is there a better way to do it?
>> Have a script/automation SW.
> Our intention is to have mount.nfs pick up some of this work.

That would be a nice addition.

> We need a solution that can pick up a different certificate for each
> network namespace, for instance. And we want to enable certificate
> storage in the system's TPM someday.
>
> And this needs to be made reliable relative to module load order.

I support everything you said.

>>>>    It seems
>>>> like a lot more work than just using the config file.
>> Well in some cases, storing credentials on a persistent file is not a
>> viable option.
>> For nvme there is a userspace utility that helps with this to some extent.
> This is because handling an NVMe PSK in the keyring is a first-class,
> supported mechanism. Handling the x.509 certificate this way hasn't
> really been thought through.

What makes NVMe PSK more "supported" than x.509? Both rely on userspace
to create keys using a keyring (either a well-known keyring, or some 
user created keyring)
and pass it to the kernel as parameters (either comma-separate-string to 
/dev/nvme-fabrics
or as a comma-separated-string to mount.nfs). These are not different IMO.

Unlike NFS, the NVMe spec defines standard identities (host and 
subsystem qualified names) and
shared secret format as well as naming conventions. Hence nvme-cli 
provides a nice interface that
does not force the user to open and read the specification. nvme-cli TLS 
helpers primary purpose
is not really to save the user adding a key to a keyring and adding it 
as a parameter to the driver
connection string, that is just a nice by-product afaik.

>
>>> It is more work because keyring support for the NFS consumers is still
>>> aspirational/experimental.
>> Can you elaborate? I think people expect to be able to pass certs/keys to
>> tlshd the .nfs keyring. Also I expected it to work (as it used to).
> The "cert_serial" and "privkey_serial" mount options are not documented
> at all in nfs(5).

I thought this was an oversight?

>   They are intended to be a way for the mount.nfs command
> to pass key serial numbers to the kernel NFS client, not as an
> administrative interface. Because, yuck.

I agree this can be made nicer with passing a key identity perhaps (although
it can create also some annoyance with how flexible key identities can be).
In NVMe both options are supported.

The way I see it, use of a keyring most likely mean users rely on some
automation software to populate it anyways.

> This doesn't mean we don't want to support using a keyring for x.509
> certificates on NFS mounts. It means the capability isn't finished yet.

I understand. But it does exist and I know of multiple users of it.

>>> I've pushed your patch to a "fixes" branch for folks to try out. I'm not
>>> sure yet whether we want a 1.4.1 release with this fix, since keyring
>>> support for NFS is "not finished".
>> I understand that there are features that are not supported via the
>> keyring interface. But I think that users expect things that used to work to
>> continue working. My personal opinion is that releasing this fix is
>> appropriate
>> given that this is a regression.
> You are the first user I know of for this capability.

The first that you know :)
Definitely not the only one.

> Yes, technically it's a regression, but it's not really a feature that
> is supposed to be ready for users at this stage.
>
> You are also building tlshd from scratch rather than using a distro-
> packaged version of it. That's rare enough, but it also means you can
> apply the patch that fixes the issue and build it yourself.

This breakage was brought to my attention by a user working on
Ubuntu24.04 ktls-utils (1.3.0). It'd be better if we'd caught it sooner...

> I'm open to considering a dot-release, but you haven't convinced me yet.

Ultimately it's your call Chuck. But IMO we shouldn't hold out a fix
for this until we are happy with a nicer mount.nfs interface.

>> Is keyring support for NFS marked as "experimental" or "not finished"
>> anywhere?
> Where would we add such a marking? nfs(5) doesn't document either of
> those mount options.

Yea, I agree.

> Patches and architecture are welcome. As I said, we want this to work
> eventually.

 From my perspective (up until this conversation at least) it used to work.
I was not aware of any dissatisfaction with the interface.

Anyways, would be happy to contribute to this (don't know anything
about the pq stuff though)...
