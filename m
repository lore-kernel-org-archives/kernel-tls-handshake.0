Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8642F3F
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 21:01:31 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id h193so2902213pgc.6
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1681160491; x=1683752491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHAxl18RVYMpvM9zU37BjSG4ZkG8VgaViz9m31zZEpY=;
        b=Tr9IFWjZlVzurg2pa+mOTofY8Z7X+rcz+iQAEHiiZo6erVl+uEC8ySFEF594uTjSyE
         BjzSJVjyE0XvqTx1AhBFCXeTSCm4zXOpn0ezxPAcyLgmwHMPcoLhj8E0ZrBE6pQjW7fK
         ka7+RoLBKLforF3BE0nUVaHP2VjPjkig0/MglZwZo2AqwkOC7uamepaehjT6nzRmAMQU
         P5jC91MzMkgH4k7xl8RItiD4K0ggACagwGOl5thuzoev3K70XP/N3sHAXfVFX7N2vDOg
         r2HgBP74o3+lqRMRSYomDodDMhELLnOqQIQSzwIbyzN5qHZzdcmfiBXjGMJKoKhl9vqH
         7F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681160491; x=1683752491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHAxl18RVYMpvM9zU37BjSG4ZkG8VgaViz9m31zZEpY=;
        b=KI36r2gLVX7mmu4+navPF5ESxc19pyPfFHrsmCbIysDXDe40wrCamBCUYxkv/V7fN2
         Q67s4kSasL+wJoTx80dgJpesQ7re+l1WqWZqh2qwYdu53HQy0YZJq5Lf6/j2MWpTlGdx
         EGWuMfHiD2BPIBMpSRwP18YtsnVe9JGvRtVw8guLJigU7gBXiluXNq64wzwlqu3iGCmB
         XqmkvOYiE5+6W2aEUFHGTDEWuFi9Z0gwr1PWdGCypg8c+OZGlBCUHKczmKZxjt60go8r
         FrKZuxhRfew3Vx0bE8sRuYvO/HRke0a2zaGC9jMraO1+u/K6DpY2GJvKa7uBNrDHGoPZ
         Rdkg==
X-Gm-Message-State: AAQBX9d2eXQwgXSatLh3/CXBNkiJgciYAUafeOlW9IzBaqw7K5W1nwKl
	FpeEHF1yyw9gBw3VzvQmGW6v2uYg9+2GG31Dh8owF4tpc8w=
X-Google-Smtp-Source: AKy350b0gqDSlHSqhisdIx/2e5n1ayZm8DgB4/edlQaPpPCAQfkg8RGdjgTmivRicuNep7pJgq+JiwIyFBlK3BHbI5w=
X-Received: by 2002:a65:4781:0:b0:513:e029:d172 with SMTP id
 e1-20020a654781000000b00513e029d172mr2979924pgs.12.1681160491313; Mon, 10 Apr
 2023 14:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <F800AEFD-7E3B-4133-BADF-6FAF610A2827@oracle.com> <16EB9884-474D-4449-9F81-2DB1A77B7DC7@oracle.com>
In-Reply-To: <16EB9884-474D-4449-9F81-2DB1A77B7DC7@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Mon, 10 Apr 2023 17:01:20 -0400
Message-ID: <CAN-5tyFi+Jf+Ur_h82MzcMcJniMbcuUCMNFtX6Pt=2WF0dQ3Ww@mail.gmail.com>
Subject: Re: pre-release of netlink v9 kernel
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 4:19=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
> > On Apr 5, 2023, at 4:32 PM, Chuck Lever III <chuck.lever@oracle.com> wr=
ote:
> >
> > I've collected recent fixes here:
> >
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> > Tag: netlink-test-20230405
>
> Hi -
>
> I've received a couple of questions about next steps...
>
> I'd like to post a v9 of the handshake upcall patches to netdev@ later
> this week. Has anyone got test results they'd like to share before I
> do that?
>
> (Please pull the netlink-test-20230405 tag to get the latest).
>

Hi Chuck,

But I don't see any such tag (thru my git command. I do see it on the
https webiste). I asked Anna to see if she pulls she sees it and she
doesn't. She also noted that: "If I follow the "tagged commit" link on
the gitweb page, It has a red "NOTICE THIS COMMIT ISN'T REACHABLE"".

Anybody else has been able to get Chuck's latest version and it's just me?

>
> --
> Chuck Lever
>
>
>
