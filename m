Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45998465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E6EC433EF;
	Tue, 28 Mar 2023 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680013761;
	bh=dCpXvXmH4FcUKxqpXlQ30rfkXcMbNcHxyEVwjKhonuo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TVETZLauIDPbZNTs84xUZxASlBtELrFAjZXObauvGvkbDg8rSWUM0M9RkiLln3NsZ
	 3aqGk6qShUd7ZBGWn4NrS/3H5owaJi63Wm7bwcbPF4dNmPU8/G0K4xGLGJOeo9ckXA
	 E5UlgnZ/aVQHlTQ0zxpqb42ON42keZ7RZYV46yyp9Nsh2xoyep70LxeqhmKhMivNye
	 c3wktA+VorF2/uhD1vh9pQrVPIqBNk9DDrrGyVzs8fDO+5I2Mh6Hl8aGrYA/ZKSCYi
	 3BukXFgtysykbt0PjMwe9IsZDQGEAmSqggbizaF6xTvANA8wBruaQjBVEIyfaH4oUD
	 Br2APf3VapKzg==
Message-ID: <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 10:29:19 -0400
In-Reply-To: <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
	 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 14:04 +0000, Chuck Lever III wrote:
>=20
> > On Mar 28, 2023, at 8:55 AM, Jeff Layton <jlayton@kernel.org> wrote:
> >=20
> > I wonder...should we have the ktls-utils package install a self-signed =
cert by default?
>=20
> So this idea is intriguing, I had some similar thoughts.
>=20
> I'm not sure what the security implications of all this are.
> We'd first need to look at other certificate-based packages
> in Fedora to see if they offer a similar quick-setup. The
> cert would have to be created at install time.
>=20
>=20

I think when apache is installed, a self-signed cert is created. You
don't have to use it, but it's what gets initially installed.

> > I created a self-signed
> > cert and tried to use it, but the client rejects it with this:
> >=20
> >    Mar 28 09:01:20 nfsclnt tlshd[1092]: Certificate signer not found.
> >=20
> > Is there a way to make it not try to validate the cert chain?
>=20
> Olga also found that self-signed server certs are not
> working as we'd like. tlshd had a mechanism to force the
> clients not to check the signer, but it was removed
> because it was deemed insecure.
>=20
> I'd like to find a way to make self-signed work seamlessly.
>=20

Ditto. A lot of people are going to want to use TLS opportunistically
without deploying their own CA and issuing "real" certificates.

It's true that it is less secure than having full chain-of-trust, but
this seems like a case of "perfect being the enemy of good". If we don't
allow for self-signed certificates, then we've created a rather large
hurdle for anyone who wants to deploy this.

One thing we could do is reinstate the tlshd option, but still allow it
to check the signature. Then it could log something if that check fails
but still allow the connection.

We should of course document why using that option is not ideal, but
ripping it out entirely seems rather draconian. That's just going to
drive people to not use TLS at all because of the hassle factor.
--=20
Jeff Layton <jlayton@kernel.org>
