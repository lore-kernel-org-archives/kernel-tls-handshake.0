Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300C3C05
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Apr 2023 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682087349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRBcypUraCtzZJFQMCB7l2NT7D5GcycZJmpCQOTXIYY=;
	b=OOWLYYLU53nvRHwDEUFLhn06mWdwjuaSLxzW1E7fiwPCTx+XzSdzjstOySRzKaRz/4IbtG
	5LwrPPTqSpNH9h3GRMOgt9QNXmUC79k/cO995uOvYexJUDgA4fe8Nnt9PwiPr740k9/tBh
	ow9QxZT+HOl28rQRDW05unbI4jsV2Q0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-ztn1R7rAMZqnjLt0F3QuYQ-1; Fri, 21 Apr 2023 10:29:08 -0400
X-MC-Unique: ztn1R7rAMZqnjLt0F3QuYQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3ef44f554b1so12423911cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Apr 2023 07:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087347; x=1684679347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRBcypUraCtzZJFQMCB7l2NT7D5GcycZJmpCQOTXIYY=;
        b=i5yyzx34MUORdHhbG08y24p2aKYqPZlAucNnYssHUyJZ+LtlC/oSCHNOJUetQlc8oC
         H3FKxh3nxvrSq9tUpssEzF3pv69dz8zb9XfbV9LU8BAJaksNhy3bzCHiBQBbFNbZAsH9
         VEo8A9xYrf7i9hLldkStWibEZH42gzqExh2X/6BdTIkUBMLsSPPCs1DdP0a+ji6ZDpxL
         w8XdHr1NaXjM1sVDWsPdoNaWKHxAsOmW09BeS8QW5O2Etx7xxqCMeKamLZUIMQhf0ahw
         q4QdXS93YZrnwbPY2Y3hHIY7rF80pLTsfZ7JkmTgL5yGP/MXkkOTL5OGqgEVFJnJQPVO
         KFjA==
X-Gm-Message-State: AAQBX9eIdbQqZpEYRV0T8wA/WENKcS2pCYXd/OGKU33EOPEVSzEM8o5a
	IapJPpsSA+F8hJAjXmoezYqxVP52kFM2LDu1l3lgtuDmppeD8QyjYv8NR9MOGVLFuvcyFlBO75c
	xsSMi1pAcO7iYT3/nRF5VPjyZdpz2Jon86LU=
X-Received: by 2002:ac8:5e0d:0:b0:3ef:3edb:7676 with SMTP id h13-20020ac85e0d000000b003ef3edb7676mr8907205qtx.61.1682087347516;
        Fri, 21 Apr 2023 07:29:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSBTp29qJT43yxFm9b6eKQiEPpNgDdYktYXW3qbmDTYpvGM0Xxv6zwjdzay0nvd7IMkXUtJg==
X-Received: by 2002:ac8:5e0d:0:b0:3ef:3edb:7676 with SMTP id h13-20020ac85e0d000000b003ef3edb7676mr8907180qtx.61.1682087347268;
        Fri, 21 Apr 2023 07:29:07 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
        by smtp.gmail.com with ESMTPSA id z42-20020a05620a262a00b00745f3200f54sm1347268qko.112.2023.04.21.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:29:06 -0700 (PDT)
Message-ID: <16786c40c480b96cfe3a1727cad6d7f389f8f17f.camel@redhat.com>
Subject: Re: Fedora packages for ktls testing available
From: Jeff Layton <jlayton@redhat.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-tls-handshake
	 <kernel-tls-handshake@lists.linux.dev>
Date: Fri, 21 Apr 2023 10:29:06 -0400
In-Reply-To: <2CFA4DB8-7EAD-46CB-970F-67CD5FCF9D36@oracle.com>
References: <85ee133945a9f816ffb9612146a6f835c6d443ec.camel@redhat.com>
	 <2CFA4DB8-7EAD-46CB-970F-67CD5FCF9D36@oracle.com>
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38)
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

On Fri, 2023-04-21 at 13:32 +0000, Chuck Lever III wrote:
>=20
> > On Apr 20, 2023, at 12:17 PM, Jeff Layton <jlayton@redhat.com> wrote:
> >=20
> > I have a Fedora COPR repo set up with the latest RPC with TLS bits from
> > Chuck:
> >=20
> >    https://copr.fedorainfracloud.org/coprs/jlayton/rpctls/
> >=20
> > It has a kernel package (currently based on v6.3-rc7), an updated nfs-
> > utils package (only needed by the NFS server), and a new ktls-utils
> > package (0.8 based currently) that I'm working to get into the main
> > Fedora repos after the kernel patches are merged.
> >=20
> > My goal is to keep this up to date until the relevant code starts
> > landing in the main Fedora repos.
>=20
> Hi Jeff-
>=20
> Excellent work!
>=20
> I've had questions about building ktls-utils so I'm interested in
> your experience packaging it.
>=20
> On Fedora, folks have installed keyutils-lib and keyutils-lib-devel
> but ./configure still reports:
>=20
>   Package 'libkeyutils', required by 'virtual:world', not found
>=20
> Did you encounter this issue, and if so, how did you resolve it?
>=20

Thanks! I missed adding the client patches to the most recent kernel
build, but they should be in there in the next one (brewing now).

No, I haven't seen that error. I did go several rounds with failed
package builds due to build dependencies. The current specfile has this:

    BuildRequires:  gcc make gnutls-devel libnl3-devel systemd-rpm-macros
    BuildRequires:  autoconf automake keyutils-libs-devel glib2-devel

...and that allowed it to build on f37 and up for me.
--=20
Jeff Layton <jlayton@redhat.com>

