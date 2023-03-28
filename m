Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84A33C5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E17C433EF;
	Tue, 28 Mar 2023 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680014307;
	bh=m0ugGOvk128QeloMaixffhOyTQYiNYoxTc5vAYPbVE4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Xhf7GXnoK60B+/AhVTIhZ8yanGSEOJOe0FB0Ho4epoKc/8MUa8WjCiZJEew/C+3/w
	 jJiAKUPwhoEU2wnisI/Xv3wUUYR3pP4oEb0eplhxLOmF6plaTh+Kjpb7WJXZ8SFn30
	 kKo01jz1R71g+hwci5TB59od9C4zwpkRbwReB7VXZ0BBk99dYEA3CAjfuLAM1IyMH7
	 kbnvmsQXe5FmK2qgEAbCdP+7OFu/w38eXVj1I5zDNfiBYsJ1BXA6RnkewR1bkF1Kre
	 aSqqNBoJ6ccKgq/DFN8i4J9PrW4EA6z7nqmXccumjUmG9hN7lXp21ATVqKjpFT9TKs
	 t75ldV3WvWJ/g==
Message-ID: <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Olga Kornievskaia <aglo@umich.edu>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	"kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 10:38:25 -0400
In-Reply-To: <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
	 <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
	 <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
	 <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 10:25 -0400, Olga Kornievskaia wrote:
> On Tue, Mar 28, 2023 at 10:14=E2=80=AFAM Jeff Layton <jlayton@kernel.org>=
 wrote:
> >=20
> > On Tue, 2023-03-28 at 13:55 +0000, Chuck Lever III wrote:
> > >=20
> > > > On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.co=
m> wrote:
> > > >=20
> > > >=20
> > > >=20
> > > > > On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> wro=
te:
> > > > >=20
> > > > > Hi Chuck!
> > > > >=20
> > > > > I have started the packaging work for Fedora for ktls-utils:
> > > > >=20
> > > > >   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
> > > > >=20
> > > > > I also built packages for this in copr:
> > > > >=20
> > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
> > > > >=20
> > > > > ...and built some interim nfs-utils packages with the requisite e=
xportfs
> > > > > patches:
> > > > >=20
> > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
> > > >=20
> > > > Note that the nfs-utils changes aren't necessary to support
> > > > the kernel server in "opportunistic" mode -- the server will
> > > > use RPC-with-TLS if a client requests it, but otherwise does
> > > > not restrict access.
> > > >=20
> > > > Client side also has no nfs-utils requirements at this time,
> > > > since the new mount options are handled by the kernel.
> > >=20
> > > In case I wasn't clear:
> > >=20
> > > This was meant as a suggestion. If you want to simplify your
> > > test set-up a bit, the nfs-utils piece isn't needed at this
> > > point. But feel free to include it if you like!
> > >=20
> >=20
> > Understood. I needed to build it for the server side anyway, so I
> > figured I might as well. Eventually I'd like to set up a Fedora COPR
> > repo that has all of the packages we need to test this, but I need to
> > sort through the certificate handling here first.
> >=20
> > Are there docs on how to administer gnutls? For instance, I guess I'll
> > want to set up my own CA and issue client and server certs. How do I
> > make gnutls trust a new CA?
>=20
> Hi Jeff,
>=20
> To get self-signed certificates to work you need to (on the client's
> machine) copy your server's cert.pem file into
> /etc/pki/ca-trust/source/anchors and then run the =E2=80=9Cupdate-ca-trus=
t
> extract=E2=80=9D.
>=20
>=20

Many thanks, Olga! That got me further:

    Mar 28 10:35:05 nfsclnt tlshd[1498]: Handshake with nfsd.poochiereds.ne=
t (192.168.1.140) was successful

The mount still isn't working yet, but I think I'm getting closer. I'll
keep poking at it.

Thanks!
--=20
Jeff Layton <jlayton@kernel.org>
