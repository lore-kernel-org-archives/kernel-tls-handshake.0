Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1130F85
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  8 Sep 2023 19:45:35 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2be4bc1ae53so8409491fa.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 08 Sep 2023 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694202333; x=1694807133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyFhMEv7gyDceU1ga+M4sUflmPB0+g6IppX3+Buxp54=;
        b=eNmfR2N2Msxqnnl65ndilmAb0XS7111u9Gv/6LjIYDPtL9TVxu88Qx5RLHdxlCajxA
         FtjLJ7sXsKKpLGPZe+snVFJAtQfacYddHv0viyiS3qstpeDkl5CJZDIjI6V8waZwP1eK
         ofUpA9r1pJ7t7joBq4RFId0QQ1Yw9JY/XArlpod6VHYidjzKQf+N+h9JshXRlDidTyyo
         TZ+2L1u4yiiFb5QGMjUD7/pRsQ0bSCxJwkjXWqxkz4Wd9P4xhuupuekU0e+H971gsMXi
         6aZXNQWtUh8UU3G82y7oDuQviF+lMA6kuUd0OvIFXIALz0Da355vi+vT1WK7IueTjPFF
         YwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694202333; x=1694807133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyFhMEv7gyDceU1ga+M4sUflmPB0+g6IppX3+Buxp54=;
        b=GA5A9hEdA50tODm3iTF0+fw4oBJSny4YKne5iPR/sjZlHFFFVPh+3sPKjmTKN6tOzT
         7VhdN8cJBGjOdNpzlhxMB4gp2v3rdYPs50Zffk6LqlwcbhTM9BuXPc8nIIdMgYXUn+cl
         bb/iEAZ4AmiPpufs56Qi7UTRXpTL76mw9sDN4W+0YPxpm4MO1hjE0/2JBAWEFICc78Le
         bZ6OtkYt3ZFMwVwV0MW0/TxrRG733Ve8NZDAHx8L7O7fgeMnWG6rJeLkG2QS6GZ3BbzZ
         //qaMmBHb6yyfCra26Hg+G3CD1XaXAag04jxLfT5yOSv0Yzh4YpFzRdetRYFVsnNM6Y0
         bC4g==
X-Gm-Message-State: AOJu0YxA9estCtSk4LnJr3kjyfAz6nvnhLdIATaDilcw02Qy2a0RgNzK
	MzC3tLtT5hWjTP7siX4LgI5BhcAGBv10JR/QC3w=
X-Google-Smtp-Source: AGHT+IHLTsPhswsyB1pct6Jbx+J9MrbEc0WvcRx/qAR7PN81Xlp0sf8wWzVEAZISagUBUYHQgDoxGMjvHyXsbZthOaQ=
X-Received: by 2002:a2e:9e87:0:b0:2be:6aac:4586 with SMTP id
 f7-20020a2e9e87000000b002be6aac4586mr2227061ljk.1.1694202333162; Fri, 08 Sep
 2023 12:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 8 Sep 2023 15:45:21 -0400
Message-ID: <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
To: Chuck Lever <cel@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, Hannes Reinecke <hare@suse.de>, 
	Olga Kornievskaia <kolga@netapp.com>, Chuck Lever <chuck.lever@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 10:05=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote:
>
> I've been collecting a few patches for 0.10. Here they are for
> review. There are two that are controversial:
>
> - "tlshd: Revert b586f7d97795"

Is there somewhere we document the requirement for the certificate (ie
that server's IP address MUST be present in the cert)?

I've been struggling trying to produce a certificate with a subject
alternative name in it.

>   This one removes the reverse DNS query done to make SNI work for
>   mounting servers by IP address. This query was noticed during
>   security review as a problem. Instead of a reverse query, server
>   certificates can list their IP addresses in the subjectAltName
>   field.

I'm still unclear what the real issue here. Is the object that if we
are mounting by IP then to create the SNI, the client needs to do a
reverse lookup and that's not secure? OK. So why not just not use the
SNI in that case. It's an option. SNI is supposed to be help for the
server. Now when NFS client mounts by IP it's unlikely it's talking to
an NFS server that's servicing multiple domains (for which it needs to
be pick a certificate for).

If we are mounting by IP don't do SNI but don't require certificate to
have the IP in it's subjectAltName.

I currently spent over an hour and I still can't figure out how to
create a certificate with openssl with a subjectaltname. ok perhaps it
speaks to my own abilities but I didn't think I was that bad.

I still believe requiring IP in the cert is not a good approach.

> - "tlshd: Reorganize tlshd.conf"
>
>   This is a user-visible administrative API change that I wouldn't
>   do if ktls-utils wasn't clearly marked as PROTOTYPE. Let me know
>   if there's a better way to go about this.
>
> ---
>
> Chuck Lever (5):
>       tlshd: Check return values of non-void gnutls library functions
>       tlshd: Ensure tlshd_peeraddr is initialized to all zeroes
>       tlshd: Revert b586f7d97795
>       tlshd: Reorganize tlshd.conf
>       tlshd: Demote missing options
>
> Hannes Reinecke (1):
>       tlshd: add 'delay' configuration parameter
>
>
>  src/tlshd/client.c       | 22 +++++++++++++++++----
>  src/tlshd/config.c       | 23 ++++++++++------------
>  src/tlshd/netlink.c      | 26 ++++++++++---------------
>  src/tlshd/server.c       | 14 ++++++++++++--
>  src/tlshd/tlshd.conf     |  9 +++++----
>  src/tlshd/tlshd.conf.man | 41 ++++++++++++++++++++++++++--------------
>  src/tlshd/tlshd.h        |  1 +
>  7 files changed, 83 insertions(+), 53 deletions(-)
>
> --
> Chuck Lever
>
>
