Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037E26AD4
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490325; cv=none; b=NOcBNm7wO2Zs3ANueZOevWAZ/EHIcdMYhEuAP0Rx+3o49kZM7GybX5OhSrhWodQySA30uzuS5Lb1g8a2c60KwIDs2RCEkUmHMghzYW29+GyhB9aqZOYapi9ceCSqsXVW3wFyWR+gdXGXyEqiDHaewSB2QhhaktvRKhj+TK8Otz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490325; c=relaxed/simple;
	bh=cOM17qxh55BTTEUuQB3Vwttg7y3OfBiMvP9VX+xBhT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtA8xLZmVVtel34sa97pZ1KZlWwHKK8yeL2v9m+vLhszpDiJuFVbmwgK1srpVhYJcRDMNDnqfgXitgWbMSSlSpBT5wHTQAfrbXAeMomPO8Vnw/DzNY5YfxSVcTxLuKfyQYUoONB9qt7BevW6H5hSUNNPnIOA/XaofRoNE8+33Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=VVDKZnpp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XbR4JGUe; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="VVDKZnpp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XbR4JGUe"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 59C2B1383739;
	Fri,  6 Dec 2024 08:05:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 06 Dec 2024 08:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1733490320; x=1733576720; bh=CufCHVHaRm8HIakNR7YUUS5qa7rY+J/D
	2N5ZLc7r/94=; b=VVDKZnppvPBGLwuj1QYoQrHPtFSu0OY2DI2Etbf8nA64z8is
	v13u41zjP8dU4HlS/aJrnXhzjp3LBX5IXaAtf8YBUtco34LztHK2fXn+RsJVRIKa
	VTTcJ4oBiCqKp/YSPREfUKc2Y9lQI3IO5vVYjGLd1ygAU0cDcxxWBsjFNi6D12lg
	j0sf1GgC0dDneH3Wcf9I3Uy+krQQLplQ/Nyrbuzex8dXdgULkWOYsL6HT+R63DPH
	75MJEOqNoeZRDvufhGnvS0NZrm7ZnTKZBXPkWrRqKZODyuLZrvT9VPCY23GyByZG
	p7YlL8T1tb5tv+g+B4DFBmbVxfHDEQYNnN4Qag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733490320; x=
	1733576720; bh=CufCHVHaRm8HIakNR7YUUS5qa7rY+J/D2N5ZLc7r/94=; b=X
	bR4JGUecvoXcbfnyfG3ymeA1x5q2iK6oFoFA8lNFm0sAh1tRZP0Fm2Ynw+0KEV4S
	qpRsHXsbEJ9Cpy4fbtyBWKkvnMT7SGbsKPnK7+G8MqAeRFTkyBF/8w+tp84BJ3zx
	4UvbW0kWOqaYcso2l2dHBg0A3lN0qMOXvO1+mkNtCBDyLVtuw6nA8nN2IRmrrAfk
	9X9CCgwE9ihb4xDk4+drogRuD5cYFEzTvfEbDL3N9aExQ8Eru4he9t/RcPTWHM0V
	D7r3Wpz1kPDa5+CRD7VQrHqaHAsgWTLxTsutBisFNQ6sQGqJ0GM9KmCTxrkKLNZh
	7bNsR5Uk5okBjGAwL2U+A==
X-ME-Sender: <xms:j_ZSZ1pVZm1YERcLOSzvlsHTI7qaIavyS_qavkVH5Xzo4Iz8yJtFkQ>
    <xme:j_ZSZ3pPL4hqQ71ZE7APdkpm9GrNhVWKKWtL0N00h6SsDL6xaX4tZ-oRruRVcyEEn
    QmdRdaIHhWX83dNu5E>
X-ME-Received: <xmr:j_ZSZyPLZIXtiukUpFdYEuNCMfCfwWmywLKoGPDw-diMVoT4a5q_59PyKMPI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomhepufgrsghrihhnrgcuffhusghrohgtrgcuoehsugesqhhuvggrshihshhnrg
    hilhdrnhgvtheqnecuggftrfgrthhtvghrnhepveduvddtveehteekvdeiueegheeiveej
    keetfefgfeeffeejgfdvfedtleeufeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsuges
    qhhuvggrshihshhnrghilhdrnhgvthdpnhgspghrtghpthhtohephedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohephhgrrhgvsehsuhhsvgdruggvpdhrtghpthhtoheptghh
    uhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepnhgrrhgrhigrnh
    drrgihrghlrghsohhmrgihrghjuhhlrgesfigutgdrtghomhdprhgtphhtthhopehfkhhr
    vghniigvlhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlqdhtlhhsqd
    hhrghnughshhgrkhgvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:j_ZSZw5ckz0XNAHTQeaoG5lcDQfR-GD3e9ZwTIXvHQPsIVvjGXWrYg>
    <xmx:j_ZSZ06KntlXbDljjYQHZH5CMFFpRbJyJr70p8gl7Ppb5CvmgK2VEg>
    <xmx:j_ZSZ4iTkb2f61yCiG3yiyx97cPmgIs91LqywjqHZlzSG_TAx2PYZw>
    <xmx:j_ZSZ26SheVBrWqXOwgNJVEdmZHRGAvzafXGgH2_2qb1a0lTygP2cQ>
    <xmx:kPZSZ-Rvp7AE4M3dWK-X4NymoH9aQYzdBw0xihbaF5nW1ZrMareDgPlB>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Dec 2024 08:05:19 -0500 (EST)
Date: Fri, 6 Dec 2024 14:05:17 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever III <chuck.lever@oracle.com>,
	Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
	"fkrenzel@redhat.com" <fkrenzel@redhat.com>,
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
Message-ID: <Z1L2jQJ8Lr2kehXy@hog>
References: <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de>
 <Z1LfX4S71BRvBKOW@hog>
 <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de>

2024-12-06, 13:09:23 +0100, Hannes Reinecke wrote:
> On 12/6/24 12:26, Sabrina Dubroca wrote:
> > 2024-12-03, 16:20:12 +0100, Hannes Reinecke wrote:
> > > On 12/3/24 15:33, Chuck Lever III wrote:
> > > > > On Dec 3, 2024, at 2:17 AM, Hannes Reinecke <hare@suse.de> wrote:
> > > > > But the current in-kernel TLS implementation doesn't allow to change
> > > > > the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
> > > > > the only chance here is to close the connection and start from scratch.
> > > > 
> > > > Have we asked Boris and friends if it would be possible to
> > > > implement KeyUpdate via ktls? Just curious.
> > > > 
> > > The immediate problem with KeyUpdate is here:
> > > 
> > > net/tls/tls_main.c:tls_setsockopt_conf()
> > > 
> > >          /* Currently we don't support set crypto info more than one time */
> > >          if (TLS_CRYPTO_INFO_READY(crypto_info))
> > >                  return -EBUSY;
> > 
> > And my patches (mentioned in the first email of this thread, but
> > there's another version that I sent for review more recently [1])
> > address that.
> > 
> > [1] https://lore.kernel.org/netdev/cover.1731597571.git.sd@queasysnail.net/
> > 
> Ah-ha.
> So that worry is solved. Great work!
> 
> > > so we need to close the socket whenever we want to change the TLS key.
> > > And that results in a call to the socket callbacks, which informs the
> > > NVMe-TCP driver, and the connect is reset.
> > > 
> > > KeyUpdate is a single message in the packet stream, transferring
> > > the new key values encrypted with the original key.
> > 
> > nit: the KeyUpdate message doesn't contain the new key, it just says
> > that the new key will be used from that point on (otherwise we
> > wouldn't have to worry about keeping secrets around?).
> > 
> Yeah ... but that doesn't impact this issue, no?

At least on RX we wouldn't have to worry about recomputing a key, it
would be provided. On TX we'd still have to generate the new key
either way.

> > > But: The new key is derived from the application secret, which is _not_ the
> > > currently used Key/IV values used by the in-kernel TLS implementation (cf
> > > section 7.3 'Traffic Key Calculation' in RFC 8446).
> > > So we cannot compute the next set of application traffic secrets; the only
> > > one who might have had this is the tlshd session, but that is destroyed once
> > > the handshake is done (or, rather, I hope it is ...).
> > > 
> > > So the original handshake traffic secrets are gone, and we cannot
> > > derive the next set of traffic secrets from there. Plus I'm not sure
> > > if we should keep that around in tlshd; that definitely would be prone
> > > to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...
> > > 
> > > And that's before even checking whether we need to modify gnutls
> > > for deriving updated traffic secrets ...
> > 
> > I would expect all TLS libraries keep those secrets around to be able
> > to implement KeyUpdate regardless of ktls (but I only work on the
> > kernel, not gnutls/openssl).
> > 
> They will keep secrets around as long as the program using these libraries
> is running. So yeah, technically tlshd would be alive, and gnutls should
> keep the secrets somehow.
> There is a resolved issue for gnutls ('kTLS key update support'), which
> seems to indicate that gnutls supports keyupdate.
> And looking closer it seems to be transparent to the caller.

It makes sense to me. Which key is being used is an implementation
detail that an application using TLS shouldn't have to care about.

> But how does userspace get the KeyUpdate message in the first place?
> I _think_ we should get something like TLS_ALERT from the ktls stack.
> How is that implemented?

(talking strictly about "pure" ktls, not tls-handshake/tlshd)

Data records are passed to userspace via a simple recv(). Non-data
records (for example a KeyUpdate) need cmsg: the record type is
stuffed into a cmsg, the payload goes in the usual buffer. If the next
available record is non-data and no cmsg is provided, the read will
fail. See Documentation/networking/tls.rst (or
https://docs.kernel.org/networking/tls.html) for more details on how
cmsg is used.

Part of my patchset is pausing decryption when the kernel parses a
KeyUpdate message, until userspace has provided a new key (because
trying to decrypt the next record after the KeyUpdate with the old key
will just fail).

Quoting from the doc update in that patchset (updated for v6, so a bit
different from what you'll find on netdev):

---------- 8< ----------

TLS 1.3 Key Updates
-------------------

In TLS 1.3, KeyUpdate handshake messages signal that the sender is
updating its TX key. Any message sent after a KeyUpdate will be
encrypted using the new key. The userspace library can pass the new
key to the kernel using the TLS_TX and TLS_RX socket options, as for
the initial keys. TLS version and cipher cannot be changed.

To prevent attempting to decrypt incoming records using the wrong key,
decryption will be paused when a KeyUpdate message is received by the
kernel, until the new key has been provided using the TLS_RX socket
option. Any read occurring after the KeyUpdate has been read and
before the new key is provided will fail with EKEYEXPIRED. poll() will
not report any read events from the socket until the new key is
provided. There is no pausing on the transmit side.

---------- 8< ----------

> Have you tested your implementation with gnutls?

Frantisek has (a while back, I keep getting sidetracked from finishing
this patchset :/)

-- 
Sabrina
