Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC413FD126
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  1 May 2026 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666774; cv=none; b=IYqtGuRaU7DWg/coNKWtvPlyBRgJe57IOBvXrXdMDlL4ob4pKTDkrxuzc/Zl2Lg6MR3pnyqnjce1k4modci/BgjaIeZNhZNRNOvkDcoaJlUzonaFGyA3wNwYbiSKFLBrJGYLWMThugLLNB6GWMpnkv/hTYOUaZbs0tZmeerHAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666774; c=relaxed/simple;
	bh=yfksQDDAIlwQsdwmryV+Uu7l9fMYd74fQB0Elp7uzCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jrtYOX9STlAD2TDt4cM0hw/yhcAipLZSvKMcAVxHChKgC7B9WJQDtcuQFdT9ox42YBwTXYuwJ64xp2Mf4UzTU7B585KRT56+EmZlqDrEw0iQ/ybRkLp1OY8+MGtunBQiB8FwuK1MzyTKvYyvb4AXp0ojWaZM2CyxlP5jeBgng24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikDljPmR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikDljPmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777666772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ep0E5GKozsLcODb2MoB53aeSDPYJUIXCxKSh7OK+OL4=;
	b=ikDljPmRWUEcugNd+Cj7znTzmevrJubueus5urRaNGwj0HojL8UoMIkDxmA0R64bspdvZT
	uVz1jbxZASlY4akNnYjwv5rco7iFxHxLyxmdi1SHEpt3w0ED0wIeYd/3ZlKgEiT79WJuHk
	pNM25yn05jlLtK1cU3zmsNQfD4Ka5S8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-6KPs5neGN2Cg8WGdh97y4A-1; Fri,
 01 May 2026 16:19:28 -0400
X-MC-Unique: 6KPs5neGN2Cg8WGdh97y4A-1
X-Mimecast-MFC-AGG-ID: 6KPs5neGN2Cg8WGdh97y4A_1777666767
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92A56195608C;
	Fri,  1 May 2026 20:19:27 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.80.84])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C95630001A1;
	Fri,  1 May 2026 20:19:27 +0000 (UTC)
Received: by aion.redhat.com (Postfix, from userid 1000)
	id 73D577C9FB2; Fri, 01 May 2026 16:19:25 -0400 (EDT)
Date: Fri, 1 May 2026 16:19:25 -0400
From: Scott Mayhew <smayhew@redhat.com>
To: Chuck Lever <cel@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chuck Lever <chuck.lever@oracle.com>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: Breakage in ktls-utils with nfs keyring?
Message-ID: <afUKzeUYPhb97DX4@aion>
References: <fd4aaf4e-b1b7-4ca2-bc93-955c31fab317@grimberg.me>
 <92a53963-1e4b-42eb-af81-6be9f63f9e43@app.fastmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <92a53963-1e4b-42eb-af81-6be9f63f9e43@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: PhDUFmQEB-T_zdwTa73w336G3FyDAUp3aIK7kG7xsoo_1777666767
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Apr 2026, Chuck Lever wrote:

> Cc'ing the ktls-utils development list.
>=20
> On Thu, Apr 30, 2026, at 9:32 AM, Sagi Grimberg wrote:
> > Hey Chuck,
> >
> > Upstream ktls-utils fails passing client certificate and private key=20
> > using the .nfs keyring.
> > Bisecting leads commit facd084e43fc ("tlshd: Client-side dual=20
> > certificate support").
> >
> > I manually apply this (probably wrong) change and keyring works:
> > --
> > diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> > index 2664ffb..a946797 100644
> > --- a/src/tlshd/client.c
> > +++ b/src/tlshd/client.c
> > @@ -327,7 +327,7 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session=
,
> >  =A0 =A0 =A0 =A0 } else {
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tlshd_log_debug("%s: Selecting x509.ce=
rtificate from=20
> > conf file", __func__);
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *pcert_length =3D tlshd_certs_len;
> > -=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcert =3D tlshd_certs + tlshd_pq_certs=
_len;
> > +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcert =3D tlshd_certs;
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *privkey =3D tlshd_privkey;
> >  =A0 =A0 =A0 =A0 }
> >  =A0 =A0 =A0 =A0 return 0;
> > --
> >
> > But, I have a feeling its not the correct change...
>=20
>=20
> Scott, can you triage this?

So when I added the dual certificate support, I didn't touch any of the
keyring code.  Frankly, I'm not entirely sure what is the right way to
set it up and the docs are pretty much nonexistent.  As far as I can
tell:

- you need to load nfs.ko first so that the .nfs keyring gets created
  via nfs_init_keyring()
- you need to restart tlshd so that it links the .nfs keyring into its
  session keyring (I tried loading nfs.ko at boot via modules-load.d,
  but tlshd still reported an error saying it couldn't find the .nfs
  keyring)
- you need to convert the cert and key to DER format
- you need to add the cert and key to the .nfs keyring, e.g.

  keyctl padd user "nfs_cert" %:.nfs < smayhew-rawhide.crt.der
  keyctl padd user "nfs_key" %:.nfs < smayhew-rawhide.key.der

- then you mount w/ '-o xprtsec=3Dmtls,cert_serial=3D...,privkey_serial=3D.=
..'

Is that somewhat accurate?  Is there a better way to do it?  It seems
like a lot more work than just using the config file.

At any rate, I was able to reproduce the reported bug and the patch I
just sent fixes it, but I think we probably want to make dual
certificate support work with keyrings too.  What's the right way to go
about that?  Add PQ cert and PQ key parameters to the upcall?  Or add
lists of both PQ and RSA certs and private keys to the existing keys
and teach tlshd to parse both out of the existing keys (which I'm not
sure is possible)?

Also, is nfsd supposed to work with keyrings?  I see that tlshd looks
for a .nfsd keyring, but svc_tcp_handshake() doesn't populate ta_my_cert
and ta_my_privkey...

-Scott
>=20
>=20
> --=20
> Chuck Lever
>=20

