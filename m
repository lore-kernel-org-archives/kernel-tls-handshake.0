Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F03C0F
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Mar 2023 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679932799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=br/bIBFrQJ45QViCWoowx3j8UoiXpJyeaKeAxjPiZJU=;
	b=Qez6T2pJErEOkxbjYJgRkAruNYmL0q1++swcFG0ffFpKuHeLvOAcvEpUoMSgMT7q5bpi8m
	BYXadDik9HFJv9p3hHJkZSOt1VW98Kj/jvfskQDmlfUEGYNljhlv8NnQN/O+TLT7B7j5uv
	xWYP6H2knqiFij6qDsC9lyfZ0ov/1o0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-uPC_DpIPOXam_Sc_78aHNw-1; Mon, 27 Mar 2023 11:59:58 -0400
X-MC-Unique: uPC_DpIPOXam_Sc_78aHNw-1
Received: by mail-qv1-f71.google.com with SMTP id f3-20020a0cc303000000b005c9966620daso3713437qvi.4
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Mar 2023 08:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=br/bIBFrQJ45QViCWoowx3j8UoiXpJyeaKeAxjPiZJU=;
        b=6SdI/jlkdHAS7NV0CUp44qAHB/+mZzrwK/zfzfaB21ltktGBy7FgbrdVFfXkWx9JO7
         1g30MO6yEJwUvQwJVSjme7YZENJOGvI0CIe3x9/+4fuBc/X6HkmIxGsdTTxgt64cl41q
         1vYYwn8QbfkwwUqLXzfqAiio3GrxPaqFPbPifK8DeP3jKYAbCzE5d/efIzB/s5fYFwK8
         YlodCMM8oRml11rR+4mVYhTmHM3XlqrkzLnTr2GEFrpEMamNFOpbuYp/uYPfs0HplBOc
         Qnd8wyYk15uzi7yO1USvQIUWJfiGb6kNODhtARBQLyn6kV6pFE93rpvoehYNbVzyE4qV
         SLTw==
X-Gm-Message-State: AAQBX9f2zg1yiZWajMMDV4JpumTVvdN9AJJdzx7JhLFeVwFJiHE4JnE/
	7HF2F7NzYnyaM3VTKfenGCTbbn6vj3uYNCROz4kNNo6rlPPbFvr7dJ1sjEZ4ofyIe1cKAOrRjR5
	uRrLz9WBq7KrAgYsUEJdy5M72yGlAXMcdY/A=
X-Received: by 2002:ac8:5c8e:0:b0:3e4:e810:6631 with SMTP id r14-20020ac85c8e000000b003e4e8106631mr7183752qta.32.1679932797622;
        Mon, 27 Mar 2023 08:59:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350bDQ7tT/uRjDLeeoBY2QklVcCsj3RvBrxSVv7Wis9muZGjCz6ns30Fc+aUvyfSqMNNDg03vtQ==
X-Received: by 2002:ac8:5c8e:0:b0:3e4:e810:6631 with SMTP id r14-20020ac85c8e000000b003e4e8106631mr7183730qta.32.1679932797389;
        Mon, 27 Mar 2023 08:59:57 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
        by smtp.gmail.com with ESMTPSA id t126-20020ae9df84000000b0073b4a55a2d1sm16809224qkf.124.2023.03.27.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:59:57 -0700 (PDT)
Message-ID: <5b26b256b1b2b363ddff5a2091c5040ea87b1666.camel@redhat.com>
Subject: Re: ktls-utils update
From: Jeff Layton <jlayton@redhat.com>
To: Hannes Reinecke <hare@suse.de>, Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Mon, 27 Mar 2023 11:59:56 -0400
In-Reply-To: <85c10c3e-fd89-c05c-2ed3-d8b81cf4f615@suse.de>
References: <95A50C6B-435B-455E-BF18-4FEAF41F147F@oracle.com>
	 <85c10c3e-fd89-c05c-2ed3-d8b81cf4f615@suse.de>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-03-27 at 17:38 +0200, Hannes Reinecke wrote:
> On 3/27/23 15:58, Chuck Lever III wrote:
> > Hi-
> >=20
> > I've applied all pending netlink patches to ktls-utils, and
> > removed the netlink and netlink-v7 branches. This means any
> > subsequent work will just go onto the main branch as a normal
> > patch instead of the chaos we've had since ktls-utils 0.7.
> >=20
> > I'd like to start preparing for two things:
> >=20
> > - Release of ktls-utils 0.8
> >=20
> > - Incorporation of ktls-utils in distributions. How can we start
> > the process for Fedora and OpenSuSE ? I'd like to get any packaging
> > nits resolved before the release of 0.8.
> >=20
> I got one fix pending which I haven't submitted yet, so please hold off=
=20
> until then. Will get preparing a PR shortly.
>=20
> > Will distributions want a tarball release, or can they pull a tag
> > from a github repo? So far I've been providing both on github.
> >=20
> We would prefer to have a tarball, as experience shows that git tags can=
=20
> be changed and might yield different results than the tarball itself.
> Reproducible builds and all that ...
>=20

Yeah, I'd agree. Having a "blessed" (and signed) tarball is best.

If you only tag out the release, I'll need to create a tarball for the
packaging anyway. It'd be best however if all of the disparately-stored
tarballs had the same signature.
--=20
Jeff Layton <jlayton@redhat.com>

