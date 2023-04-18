Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C42F44
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 14:08:02 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b5312bd4fso10525550b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1681826882; x=1684418882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMsy0mka0/oLQH13Cbhamw34gCcZf+VMF4t3FOHYBFM=;
        b=it7GrLhufT1k+Suam7UQeo3Lfqmn+kaWn3fwGXvga/FY7jVxx4GVTFCe+xZKHytt2M
         /UUAwh7yP53R401lU5u0tvy9tTBoHlH/1WDMyJ35+oc3lw9nojESMh9dAxuz9Xk3Z1Vq
         1os7LLPEj6LKdq5pDFrIoYkdgVGSzzbNPbwI/srSylYfw3k2ESoDcdzUX1htUhemcSaQ
         JUij+V387aPK7Q2E1QHXypZntneKLAlIMcy/hHED+Klf8jtukWcqw0cyw307sy5JAuIC
         WaF/KJsnBEEuLoPv9A+3i2o49iqn+fdv0nfhpsrjd+GvcXEjYssEkID2CNiSEUuVIxNT
         aRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681826882; x=1684418882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMsy0mka0/oLQH13Cbhamw34gCcZf+VMF4t3FOHYBFM=;
        b=LnnGn9q/9uoDyqydDIIkRLwyTNGzkJ+6TSupPuFOCwkaidb2yzLS0u55A/Jr/tiWbF
         OlqL7mG4YBExqKCsaLiVeo17SDtbojXFZFpYuLaBEKRjVBpCEPF13QVz6RFIsaRJW3QH
         yhJMgtvRZhmZ6DOetzv0W76ojOeytADJ9zPkCUILS0W0nUOlPEu00qOU6tiBrvP2tLe6
         ey8dZ+EqF2kJ7hGlMpHwyjuZPjM2FN6gf2PUKVM7aoFBYq1cz/dgAHJ5HWi+DjJGxkHL
         ngcxFXxiE8X+iXkhDGxvcntFk7WhbAjm4mGH4VnpVUn9ggSGSYPhmzK6MbaEYCwWQKe+
         xP7w==
X-Gm-Message-State: AAQBX9dI84RPpZD6hkxD2AvU4YSzH6Wc/wzCWZf2iPW9B+Q3vNOpwSaT
	PTAes4HW7PCM0TCtrKMmopQCs+7SoMl6jEkXT5U=
X-Google-Smtp-Source: AKy350a+48OKrMwkAPc6JdkNl4KK5hAUVWpkRFlbWJqWtGBQTJuhvFzMOUgyl7yPNktfRh88HOSXweUF/B5BppQWtd4=
X-Received: by 2002:a63:df4b:0:b0:514:cc9:e013 with SMTP id
 h11-20020a63df4b000000b005140cc9e013mr655957pgj.6.1681826881980; Tue, 18 Apr
 2023 07:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com> <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
 <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com> <99E0BBA5-B7AA-4FAB-86D8-D125689211B9@oracle.com>
 <CAN-5tyGd27YrqNX1G9Kjg2Y0TLP=9m_K+gAf+wVw_Hsr4PeC-g@mail.gmail.com> <69C7EFCD-7E5B-483F-B278-6B460D966FE5@oracle.com>
In-Reply-To: <69C7EFCD-7E5B-483F-B278-6B460D966FE5@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 18 Apr 2023 10:07:50 -0400
Message-ID: <CAN-5tyFN+1nGw9+Q53d+JbwobB2=cyxqszMafh5o0yqjL=SwNQ@mail.gmail.com>
Subject: Re: advice on kernel configs for NFS with TLS
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 5:44=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
>
> > On Apr 17, 2023, at 4:13 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Sat, Apr 15, 2023 at 4:09=E2=80=AFPM Chuck Lever III <chuck.lever@or=
acle.com> wrote:
> >>
> >>
> >>> On Apr 14, 2023, at 5:18 PM, Chuck Lever III <chuck.lever@oracle.com>=
 wrote:
> >>>
> >>>> On Apr 14, 2023, at 5:15 PM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> >>>>
> >>>> On Fri, Apr 14, 2023 at 4:42=E2=80=AFPM Chuck Lever III <chuck.lever=
@oracle.com> wrote:
> >>>>>
> >>>>>> On Apr 14, 2023, at 4:14 PM, Olga Kornievskaia <aglo@umich.edu> wr=
ote:
> >>>>>>
> >>>>>> Hi folks,
> >>>>>>
> >>>>>> Do we have guidelines for how one were to build a kernel that woul=
d
> >>>>>> support NFS with TLS? As in what kernel options are required to be
> >>>>>> turned on (and what off)? I was under the impression that if one w=
ere
> >>>>>> to start with a base RHEL9 kernel config that would be sufficient.=
 But
> >>>>>> I believe I'm wrong.
> >>>>>>
> >>>>>> For some reason when CONFIG_KUNIT is enabled it leads to a kernel
> >>>>>> where the upcall doesn't happen. The kernel logs that it did
> >>>>>> handshake_submit() but the tlshd never gets anything. I don't know=
 why
> >>>>>> this kernel options leads to this behavior as I'm at a loss how to
> >>>>>> debug netlink upcall.
> >>>>>
> >>>>> handshake_genl_notify() is a no-op when CONFIG_KUNIT is enabled.
> >>>>>
> >>>>> Not suggesting that's the best long-term arrangement, but
> >>>>> notification is disabled when KUNIT is running so that
> >>>>> the Kunit tests don't depend on having a tlshd running.
> >>>>
> >>>> Thank you for the explanation. Is it fair to say that to have NFS wi=
th
> >>>> TLS CONFIG_KUNIT must be off? In that case, Jeff, what will RHEL do =
as
> >>>> it defines it by default? Or does it mean that handshake_genl_notify=
()
> >>>> needs to be reimplemented to make sure it's never a no-op?
> >>>
> >>> I didn't realize that distributions build with CONFIG_KUNIT
> >>> enabled. I'll have to figure out another way to disable
> >>> tlshd notification when running Kunit tests.
> >>
> >> Using a disconnected tag didn't seem like a popular idea, so
> >> I've pushed a fix to topic-rpc-with-tls-upcall. You should
> >> now be able to build a working RPC-with-TLS system with
> >> CONFIG_KUNIT set.
> >>
> >> This push also rebases the branch on the latest net-next tree,
> >> and attempts to address the warning about .kunitconfig files
> >> being ignored.
> >
> > I've just gotten a v10 version I believe and built it (with KUNIT on)
> > and I didn't get the upcall.
> >
> > I'm at commit 3cf4924e3d6e69ee42e917007ac9227b1576bc39 (HEAD ->
> > chuck-rpc-with-tls-0417
> > 2023, chuck/topic-rpc-with-tls-upcall)
> >
> > A git log shows the .gitignore patch so I believe I do have the v10 pat=
ches.
>
> - Confirm that notification is working if CONFIG_KUNIT is disabled
>
> - Instrument handshake_genl_notify() to see where it is failing

Apologizes, I had a bad system. In v10, I can have CONFIG_KUNIT
enabled and I get the upcall.

>
>
>
> --
> Chuck Lever
>
>
