Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F8BA20
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 20:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4066DC4339B;
	Tue, 28 Mar 2023 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680035357;
	bh=oY+3xDsKQvZoI9H4+l0PfLSucV8BAjjdEMt0o5V3snk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i7EYcPJiNPqV+UKcyzgzQfUolLLNZ7OUUUlK6UFPOiui956cCW8szbhqevPE1Ia6D
	 omxAVvm0KicHBpSe1hkNCtt5plxp7Lv2hAZGTGTd7mLIWLKCwZ/4FXMr9AzCxFsR0q
	 s8tqLm/6LlDJZcuBgDS7v4yTp1u1XDZs4fQt6R/gAQe7uhjEhgzSodZD9iJchy7Olv
	 her3RQLhHgu7qzXsIn79KV8YfWkOyPW2YAPzsOucgumAoVlSw8pe/016e1OVIz5ZE5
	 MwGIxZpiPcaGoYcRtSZETtyu5NRyNpIjiJmP8zlwB538/Ggy9d7LApyH3JmaIVa7Dq
	 NRlDg7L5Js7hA==
Message-ID: <44b718e213a57ea3018f4fac6c648c35ed1d1977.camel@kernel.org>
Subject: Re: [PATCH] handshake: set hr_sk field earlier in
 handshake_req_submit
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 16:29:15 -0400
In-Reply-To: <CE691A38-999E-4128-880D-F6A5AEB20D79@oracle.com>
References: <20230328181040.292486-1-jlayton@kernel.org>
	 <CE691A38-999E-4128-880D-F6A5AEB20D79@oracle.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-28 at 18:12 +0000, Chuck Lever III wrote:
>=20
> > On Mar 28, 2023, at 2:10 PM, Jeff Layton <jlayton@kernel.org> wrote:
> >=20
> > Otherwise, the request is always hashed with the socket set to a NULL
> > pointer.
>=20
> Sounds plausible. I will need to check the clean-up paths too.
>=20

You're right about the error paths. The sock refcounting will need to be
fixed up for sure.

With this but fixed on both ends though, it works for me pretty
consistently now. I guess I was just unlucky with the hashing!


>=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> > net/handshake/request.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > I think this is the problem I was hitting earlier. Chuck, feel free to
> > fold this into the original patch that adds this code.
> >=20
> > diff --git a/net/handshake/request.c b/net/handshake/request.c
> > index 54ba304b5bef..44a097210e59 100644
> > --- a/net/handshake/request.c
> > +++ b/net/handshake/request.c
> > @@ -207,6 +207,7 @@ int handshake_req_submit(struct socket *sock, struc=
t handshake_req *req,
> > 	if (READ_ONCE(hn->hn_pending) >=3D hn->hn_pending_max)
> > 		goto out_err;
> >=20
> > +	req->hr_sk =3D sk;
> > 	req->hr_odestruct =3D sk->sk_destruct;
> > 	sk->sk_destruct =3D handshake_sk_destruct;
> > 	spin_lock(&hn->hn_lock);
> > @@ -230,7 +231,6 @@ int handshake_req_submit(struct socket *sock, struc=
t handshake_req *req,
> >=20
> > 	/* Prevent socket release while a handshake request is pending */
> > 	sock_hold(sk);
> > -	req->hr_sk =3D sk;
> >=20
> > 	trace_handshake_submit(net, req, sk);
> > 	return 0;
> > --=20
> > 2.39.2
> >=20
>=20
> --
> Chuck Lever
>=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>
