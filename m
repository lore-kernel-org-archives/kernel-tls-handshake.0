Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E868801
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D2CC4339B;
	Tue, 28 Mar 2023 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680015800;
	bh=oQrUkjDHxH7WvCXIs3jSK5ymuCxi510XLQOe+KsvrK4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IPpIzfc3nPqZ8E3tweLtivA2pVGtlOW0z0OyHHqDEWp2nXEKsdfa6EOJR5+5qlk/J
	 bKPN4a+kbqjTQ2zMznUdgdEOn5DQLipzduX9tsDr4zoIfatndzFqp9xo98ff5l60jk
	 ETiadVIk7jQ57dWrOnmhVbvSb+Ve4dJokOXF1yjzRN78u6y7qt9gdnoSgJnk8sW0ei
	 QtOI2KaJ30W0lDyY4lh7RLPTsPfJBNB1lvvNvMUtU7XVC7dbNjL0lZOhuOvF8YAn1q
	 Aa4g3RsJT1XnJXdmnvbj8u53+ECcujVooJYUXAjT3ZX+k1F3xe1iPfievyX1h55fbE
	 1Mg+NQQi3fHhA==
Message-ID: <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>, Olga Kornievskaia
 <aglo@umich.edu>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 11:03:18 -0400
In-Reply-To: <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
	 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
	 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
	 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
	 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 14:45 +0000, Chuck Lever III wrote:
>=20
> > On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >=20
> > On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > >=20
> > > It's true that it is less secure than having full chain-of-trust, but
> > > this seems like a case of "perfect being the enemy of good". If we do=
n't
> > > allow for self-signed certificates, then we've created a rather large
> > > hurdle for anyone who wants to deploy this.
> > >=20
> > > One thing we could do is reinstate the tlshd option, but still allow =
it
> > > to check the signature. Then it could log something if that check fai=
ls
> > > but still allow the connection.
> > >=20
> > > We should of course document why using that option is not ideal, but
> > > ripping it out entirely seems rather draconian. That's just going to
> > > drive people to not use TLS at all because of the hassle factor.
> >=20
> > I would argue that "no verification" option should only be allowed in
> > some extreme cases. Like say having an option that explicitly says
> > it's running in a debug mode and say on the foreground only (-d -f
> > --noverify). Having such options might clearly state the intent is to
> > debug only and not run for any user usage.
> >=20
> > I also don't see a real reason for "noverify" option except to remove
> > frustrations during the setup.
>=20
> I might put it this way: we don't want to have customers installing
> something on their clients whose out-of-the-shrinkwrap configuration
> is less than secure. "no verification" is less than secure.
>=20
> My preference would be to have some kind of way to get self-signed
> certs working with no client-side configuration needed. If the
> client mounts with "xprtsec=3Dtls" it should work. Do we need to
> plumb that into our handshake upcall and make "anonymous"
> handshakes explicitly allow unrecognized signers?
>=20

Since the client is the side that's rejecting things, having a mount
option that allows you to relax that check seems like the right
approach.

How about a new xprtsec=3D option? Maybe "xprtsec=3Dnvtls" (no verify TLS)?
That would allow things to work out of the box, but still leave
xprtsec=3Dtls as the more secure method.

--=20
Jeff Layton <jlayton@kernel.org>
