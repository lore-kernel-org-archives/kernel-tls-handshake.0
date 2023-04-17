Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7968BEB
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 20:13:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id kh6so25562152plb.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1681762422; x=1684354422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCq2yME81DcovsR3IpsTlImtgc7TUO0o8iJ2xMEmXTk=;
        b=aICyUaOJegkDjqa7MSyT3MQTeooB0fLKxu7gHehOn1KW012uQhd6Yz+UGmeOLEMGCI
         iPFqlGTlq3F0u93e/BnxUbLb92xh4SrM/ghEDV1qKlM19URgszSlgQKUzH7y9qFnrzUJ
         THQjw7HO5xTuKIOnlkFK71biifivMYc+uAFAEMOR7uauVKhhlriEMuIgpESlCGjtvttV
         8IH3zxQWu4r0iVtkYI1rg+kBlf+wcLDJnZg+KlmLAqZR+FvU7UAUb3nyNyoMOJZ4MVyd
         z0bVMxT3vEHR+9w7FUeu+/RhB8/94AJYkxEVT7kQy2sKYu0Vwo+/b27sYRu6O1wINYy8
         +LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681762422; x=1684354422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCq2yME81DcovsR3IpsTlImtgc7TUO0o8iJ2xMEmXTk=;
        b=WVoFQDuTTqWn/W/le3FvA0lGnmfqDKRSa7BiJxpVdc5P8icZCR2Y5IcwQBORMuI3yH
         FWw8d8uzTFnGwfqNpJ81UmL3kvmdYAN9u62ih3zosNckjUx6O/BVrIuq0/0RvZ3xsN5p
         k4YwWBPqHDIk4iO6piQMKz6drZDdRREpFFMYltqtSEeiDKW/R/nOwgleqJBtexuxbSae
         IzSbKT0o7t+wNLvWcFN0Vm5zcS3Lp0BT0//W3XyWlV5Y1SEk4SWZp/vxEprIAc1ZT0h2
         K8EAHe4UcK+6u9giRpv7sZJU3NeHV0enoh9U70JEuWPWIGH9mX7qTUbXCrQ9E6KQMzIc
         nXiQ==
X-Gm-Message-State: AAQBX9fTnpFIW97+BwnB5fjX6PJJAU4k8T0LdHx2asQYKDH/IA6n25uM
	8m9r6FM5lxnhOfzj0AaEy5nn+dhRGVlQ4fWAKWBH9ZUh0EI=
X-Google-Smtp-Source: AKy350ZAMi15TbE9+NVnB/rMokjbegjc5ocDneQLuFTc4+vT2xR/fEBNaOjXEHILx2W+JrjEXCB3klBDCgPgfT4ylOI=
X-Received: by 2002:a17:902:bd8a:b0:1a0:7630:8ef9 with SMTP id
 q10-20020a170902bd8a00b001a076308ef9mr31756pls.12.1681762422460; Mon, 17 Apr
 2023 13:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com> <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
 <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com> <99E0BBA5-B7AA-4FAB-86D8-D125689211B9@oracle.com>
In-Reply-To: <99E0BBA5-B7AA-4FAB-86D8-D125689211B9@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Mon, 17 Apr 2023 16:13:31 -0400
Message-ID: <CAN-5tyGd27YrqNX1G9Kjg2Y0TLP=9m_K+gAf+wVw_Hsr4PeC-g@mail.gmail.com>
Subject: Re: advice on kernel configs for NFS with TLS
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2023 at 4:09=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
> > On Apr 14, 2023, at 5:18 PM, Chuck Lever III <chuck.lever@oracle.com> w=
rote:
> >
> >> On Apr 14, 2023, at 5:15 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >>
> >> On Fri, Apr 14, 2023 at 4:42=E2=80=AFPM Chuck Lever III <chuck.lever@o=
racle.com> wrote:
> >>>
> >>>> On Apr 14, 2023, at 4:14 PM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> >>>>
> >>>> Hi folks,
> >>>>
> >>>> Do we have guidelines for how one were to build a kernel that would
> >>>> support NFS with TLS? As in what kernel options are required to be
> >>>> turned on (and what off)? I was under the impression that if one wer=
e
> >>>> to start with a base RHEL9 kernel config that would be sufficient. B=
ut
> >>>> I believe I'm wrong.
> >>>>
> >>>> For some reason when CONFIG_KUNIT is enabled it leads to a kernel
> >>>> where the upcall doesn't happen. The kernel logs that it did
> >>>> handshake_submit() but the tlshd never gets anything. I don't know w=
hy
> >>>> this kernel options leads to this behavior as I'm at a loss how to
> >>>> debug netlink upcall.
> >>>
> >>> handshake_genl_notify() is a no-op when CONFIG_KUNIT is enabled.
> >>>
> >>> Not suggesting that's the best long-term arrangement, but
> >>> notification is disabled when KUNIT is running so that
> >>> the Kunit tests don't depend on having a tlshd running.
> >>
> >> Thank you for the explanation. Is it fair to say that to have NFS with
> >> TLS CONFIG_KUNIT must be off? In that case, Jeff, what will RHEL do as
> >> it defines it by default? Or does it mean that handshake_genl_notify()
> >> needs to be reimplemented to make sure it's never a no-op?
> >
> > I didn't realize that distributions build with CONFIG_KUNIT
> > enabled. I'll have to figure out another way to disable
> > tlshd notification when running Kunit tests.
>
> Using a disconnected tag didn't seem like a popular idea, so
> I've pushed a fix to topic-rpc-with-tls-upcall. You should
> now be able to build a working RPC-with-TLS system with
> CONFIG_KUNIT set.
>
> This push also rebases the branch on the latest net-next tree,
> and attempts to address the warning about .kunitconfig files
> being ignored.

I've just gotten a v10 version I believe and built it (with KUNIT on)
and I didn't get the upcall.

I'm at commit 3cf4924e3d6e69ee42e917007ac9227b1576bc39 (HEAD ->
chuck-rpc-with-tls-0417
2023, chuck/topic-rpc-with-tls-upcall)

A git log shows the .gitignore patch so I believe I do have the v10 patches=
.

> --
> Chuck Lever
>
>
