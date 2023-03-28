Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A98BEB
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34DDC4339B;
	Tue, 28 Mar 2023 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680015989;
	bh=7l6Tm6AXo54+wJlFegu9xrA07vpcTHVtiNrSC7mqp0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mVrcsDHtnu3lzFJQaQJORqzTKLLNS7ns+mwUYccujA/2G95EW7MUflvqeeTmqxU6F
	 i+12wya49zFKuVyMk+xPWBU2+vpw4IY2t5YjM7jxCMqHexv9OdDKtjjAnYVvq/+qFG
	 0sAa7vnPlkelfR4Ko5mKr6XrfVdZKMai0T4oCW/kRME0f2sw3EsqSZVB9WcUXe1Mh1
	 TARga0Y/N6RKrTHcuJDB9wPa4r5RGZxZvd0P76ZTQDNfttQbpN5NlxrKv+r+PsNmIG
	 zJsPvUZ3RgXvJu8kzxYr75dQwVKBO7JLmYOawRDgabMwsHE9mGHcC/Nbv4owvkJldg
	 W74IqBQC+N/4A==
Message-ID: <dc016e618a7b9282711ca830a65bf4c1442bfa9e.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Olga Kornievskaia <aglo@umich.edu>, Chuck Lever III
 <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 11:06:27 -0400
In-Reply-To: <CAN-5tyHCj4P7KP1PC1mFAYpAKCCVOLq_KJEtRscEz+QkBN3qXw@mail.gmail.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
	 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
	 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
	 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
	 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
	 <CAN-5tyHCj4P7KP1PC1mFAYpAKCCVOLq_KJEtRscEz+QkBN3qXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 10:50 -0400, Olga Kornievskaia wrote:
> On Tue, Mar 28, 2023 at 10:45=E2=80=AFAM Chuck Lever III <chuck.lever@ora=
cle.com> wrote:
> >=20
> >=20
> >=20
> > > On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> > >=20
> > > On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kernel.=
org> wrote:
> > > >=20
> > > > It's true that it is less secure than having full chain-of-trust, b=
ut
> > > > this seems like a case of "perfect being the enemy of good". If we =
don't
> > > > allow for self-signed certificates, then we've created a rather lar=
ge
> > > > hurdle for anyone who wants to deploy this.
> > > >=20
> > > > One thing we could do is reinstate the tlshd option, but still allo=
w it
> > > > to check the signature. Then it could log something if that check f=
ails
> > > > but still allow the connection.
> > > >=20
> > > > We should of course document why using that option is not ideal, bu=
t
> > > > ripping it out entirely seems rather draconian. That's just going t=
o
> > > > drive people to not use TLS at all because of the hassle factor.
> > >=20
> > > I would argue that "no verification" option should only be allowed in
> > > some extreme cases. Like say having an option that explicitly says
> > > it's running in a debug mode and say on the foreground only (-d -f
> > > --noverify). Having such options might clearly state the intent is to
> > > debug only and not run for any user usage.
> > >=20
> > > I also don't see a real reason for "noverify" option except to remove
> > > frustrations during the setup.
> >=20
> > I might put it this way: we don't want to have customers installing
> > something on their clients whose out-of-the-shrinkwrap configuration
> > is less than secure. "no verification" is less than secure.
> >=20
> > My preference would be to have some kind of way to get self-signed
> > certs working with no client-side configuration needed. If the
> > client mounts with "xprtsec=3Dtls" it should work. Do we need to
> > plumb that into our handshake upcall and make "anonymous"
> > handshakes explicitly allow unrecognized signers?
>=20
> My vote is not allow for insecure installs (ever).
>=20


Is it really better to force people into plaintext connections? I very
much disagree here. Raise your hand if you've never used cURL with
"--insecure" or told Mozilla to accept a bogus cert.

> Perhaps ktlsd install on the client can prompt the user asking for
> location of either server's self-signed cert or server's CA and this
> way it would have everything that's needed before using it?
>=20
>=20

NAK. Interactive package installs are no bueno.
--=20
Jeff Layton <jlayton@kernel.org>
