Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F18BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24045C433EF;
	Tue, 28 Mar 2023 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680016521;
	bh=qxba/QlWN6taxwq5T7GqO2ORq2GpL+eieVhoeCI89qM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d8upl6QjGpJVCceo+OpGA6Wjnp8lLd4mtmMwPrDnzWilOLCtNcpdEUi5sa6SVjVuZ
	 V4xbv1bdAT3L5HxaBULRKafrd1Kg4WGQ/ww43+g79fE1FbwC9c9mOYulKapZlDZtSH
	 GHVKbl4f3F5gGfxuTFNMRiCZKl4W7fGHaa0jlAy173TpZxfjEV+Ulj/A3OxgiqprhN
	 oXjdoZZOJr111VSQ2JKtJ43ypXr40/XpbUAQJzX93iHaEcKEPCyzRHUi486EORSNRq
	 eM3d5XmTuOBUFolrgc+ZAj5ObuHrzoj80M2N86/bbnIUmtW028xLw7mAUzp5jCz5yh
	 C6QoVh+8yXsfw==
Message-ID: <5dc5434e09f768afc71ca588e88f0ccd8fbe3e4d.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Olga Kornievskaia <aglo@umich.edu>, 
	"kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 11:15:19 -0400
In-Reply-To: <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
	 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
	 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
	 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
	 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
	 <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
	 <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 15:05 +0000, Chuck Lever III wrote:
>=20
> > On Mar 28, 2023, at 11:03 AM, Jeff Layton <jlayton@kernel.org> wrote:
> >=20
> > On Tue, 2023-03-28 at 14:45 +0000, Chuck Lever III wrote:
> > >=20
> > > > On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wr=
ote:
> > > >=20
> > > > On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kerne=
l.org> wrote:
> > > > >=20
> > > > > It's true that it is less secure than having full chain-of-trust,=
 but
> > > > > this seems like a case of "perfect being the enemy of good". If w=
e don't
> > > > > allow for self-signed certificates, then we've created a rather l=
arge
> > > > > hurdle for anyone who wants to deploy this.
> > > > >=20
> > > > > One thing we could do is reinstate the tlshd option, but still al=
low it
> > > > > to check the signature. Then it could log something if that check=
 fails
> > > > > but still allow the connection.
> > > > >=20
> > > > > We should of course document why using that option is not ideal, =
but
> > > > > ripping it out entirely seems rather draconian. That's just going=
 to
> > > > > drive people to not use TLS at all because of the hassle factor.
> > > >=20
> > > > I would argue that "no verification" option should only be allowed =
in
> > > > some extreme cases. Like say having an option that explicitly says
> > > > it's running in a debug mode and say on the foreground only (-d -f
> > > > --noverify). Having such options might clearly state the intent is =
to
> > > > debug only and not run for any user usage.
> > > >=20
> > > > I also don't see a real reason for "noverify" option except to remo=
ve
> > > > frustrations during the setup.
> > >=20
> > > I might put it this way: we don't want to have customers installing
> > > something on their clients whose out-of-the-shrinkwrap configuration
> > > is less than secure. "no verification" is less than secure.
> > >=20
> > > My preference would be to have some kind of way to get self-signed
> > > certs working with no client-side configuration needed. If the
> > > client mounts with "xprtsec=3Dtls" it should work. Do we need to
> > > plumb that into our handshake upcall and make "anonymous"
> > > handshakes explicitly allow unrecognized signers?
> > >=20
> >=20
> > Since the client is the side that's rejecting things, having a mount
> > option that allows you to relax that check seems like the right
> > approach.
> >=20
> > How about a new xprtsec=3D option? Maybe "xprtsec=3Dnvtls" (no verify T=
LS)?
> > That would allow things to work out of the box, but still leave
> > xprtsec=3Dtls as the more secure method.
>=20
> Nah. xprtsec=3Dtls is supposed to be less secure: no authentication,
> just encryption. The secure method is xprtsec=3Dmtls.
>=20
> IMO xprtsec=3Dtls needs to skip the signer check. I think I can make
> tlshd do that.
>=20
>=20

It's your call, but allowing the client to check the certificate without
requiring the server to do so seems like it'd be a good thing to allow.
Maybe there should be a new option for that instead then?

Either way, I'm not sure skipping the signer check altogether is the
best thing. It'd probably be good to check it, and just not fail the
connection if it fails. Have it log a message on each handshake instead
so that the admin is aware that the endpoint is not verified.
--=20
Jeff Layton <jlayton@kernel.org>
