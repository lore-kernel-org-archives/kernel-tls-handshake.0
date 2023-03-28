Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536648465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B65C433D2;
	Tue, 28 Mar 2023 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680012836;
	bh=8UfTR5Uku7UweFHxAi4d6+HmljMC/xddSeZ6VVuEGNE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XTI530qM3QSQi3xI32nDXup1sMcoxEq+Yz7oN5zIqdKILL6OfUgaBiKpZ+0ckep53
	 aN1vJoT9pJJjMFcwXtmGSYs9lghI4GfsWf8IscAkoB80L485qcqIxcrqMnw3l54ZRf
	 V542UMJCq5jqugnESGZyisP12bUWMsC8yXvpcT7Y6SEYdo5VW2jkwF/UD//18sNiEU
	 +wPVDtnyq7/M2qrdIA27JvY0Gz1mdgig8JZwTBIWtFuc+GSzE2UTp+rTiNAS6UPd3n
	 fQS3yL0NKSQTEkY0SMV+xAlGZffKDzsfjYtRLINaltoOgjdaf6StnqN30w759DkXFJ
	 j2bUp3hdpXPFA==
Message-ID: <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 10:13:54 -0400
In-Reply-To: <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
	 <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 13:55 +0000, Chuck Lever III wrote:
>=20
> > On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.com> w=
rote:
> >=20
> >=20
> >=20
> > > On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> wrote:
> > >=20
> > > Hi Chuck!
> > >=20
> > > I have started the packaging work for Fedora for ktls-utils:
> > >=20
> > >   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
> > >=20
> > > I also built packages for this in copr:
> > >=20
> > >   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
> > >=20
> > > ...and built some interim nfs-utils packages with the requisite expor=
tfs
> > > patches:
> > >=20
> > >   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
> >=20
> > Note that the nfs-utils changes aren't necessary to support
> > the kernel server in "opportunistic" mode -- the server will
> > use RPC-with-TLS if a client requests it, but otherwise does
> > not restrict access.
> >=20
> > Client side also has no nfs-utils requirements at this time,
> > since the new mount options are handled by the kernel.
>=20
> In case I wasn't clear:
>=20
> This was meant as a suggestion. If you want to simplify your
> test set-up a bit, the nfs-utils piece isn't needed at this
> point. But feel free to include it if you like!
>=20

Understood. I needed to build it for the server side anyway, so I
figured I might as well. Eventually I'd like to set up a Fedora COPR
repo that has all of the packages we need to test this, but I need to
sort through the certificate handling here first.

Are there docs on how to administer gnutls? For instance, I guess I'll
want to set up my own CA and issue client and server certs. How do I
make gnutls trust a new CA?
--
Jeff Layton <jlayton@kernel.org>
