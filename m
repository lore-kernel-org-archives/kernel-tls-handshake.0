Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5CF20C49E
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499663; cv=none; b=s1ZLPXa3UwdmzNwYsVZ9TsRWksd9gsjRQ0PHA0V/f828RRyN3y0saWcqutk7HZiDbxd3HABkTciShzfZaxC5Tn2eVoMabREWexreOhae8u0YonLUZR8fN/Qo8U9n8dnPmhRX7T5jRxX1bpOOHUg4A0yM3UptZ2v2iGMOWd1BTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499663; c=relaxed/simple;
	bh=0Mt8HDlN1MZxVoBwVhsiBJXPoD6z+Dl9+UfBYKAL6DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqOYFUU/kIdVOX0qtjUTz4Ch81Zd2VgtoP9lZEITBppxNkAFQ15j74txwIsSDshlys0gvBNtru4a5M9jWCKNHMrcymPSkF6WJlbG9nqhDXELHtQebpkmFrsNfRpspAn2u5IXGsp35Rb8AesVv4e5pMZqODl491taQZol91pPD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=hnci0X9M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VM0mo/DB; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="hnci0X9M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VM0mo/DB"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DCCDA11401A1;
	Fri,  6 Dec 2024 10:40:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 06 Dec 2024 10:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1733499658; x=
	1733586058; bh=mZq9C3rgm9bf/Vhrr5LgvysyvOHsgKp2AkdaylPK1iU=; b=h
	nci0X9MpcRvmOu8yUWFqEypFzdteVumXxsQTlerXnBwYeIvpdFgik9hLKDSvni/j
	VTo4zIBsUBx3ZL97ZxQnejxC5JMlG41uTEc3iJJA+rJyNjDhqNC2jAqrUDqfcOr0
	PnqFm8AIdMUHtq6c4+xvGfNfDyLaDfbZxOYcVhfdfl71mqMEEVALMMEk3nHwU5oc
	b/fw5bW9MJLuv2Wa0YzTeBfJzp71PaqNaOR3jtGzhoy9pLrCJy9I/UZgJZaVB3QE
	vnIH4nEAQucdLO397gnl6/rwKabg6KR3RU1293Ed1Vzu6HGjf2q6IfKSFHJS3a7Q
	oVBU8mT+BvT/V8YFUZfIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733499658; x=1733586058; bh=mZq9C3rgm9bf/Vhrr5LgvysyvOHsgKp2Akd
	aylPK1iU=; b=VM0mo/DBSKiJvHFL03R74ypUvsf3WM/SIFdaYUC37yqO2rCPScy
	VnbJOwcZ3CpiIh5Kb6oe8TYRJNRo869lztkoFPehJ/u703xHqc6AkjPxJmKfwebF
	dStpTBY2MMUvkc7eFDdVjMBpT2RgwSHtt7QiKHgaOiqfBe5pcmCmuuCvHdXffdUj
	tpPBkxDRcPjSGn8nJjMOQQqoP7XtMsUbnh+Myg+5mILeSxSSpw5WIYtamEM2gjCC
	o6cKdNvSarlQa9IFmhtXDZu7XlZIcWfuOZqHGUfUYNjVEIxA2hkhhZlS43qxMXRt
	OzvsXRPqNFfiYpS8ZhZXK+BvVgynCwx6pwg==
X-ME-Sender: <xms:ChtTZ2DB-nkrbij8miD7NesNtmxuF-AOg9ajp6jni_uI3iNlFIO1NQ>
    <xme:ChtTZwiy9gWEI3V7Sa0BLV3v-69D-g46fwGJyA6AlzgiBzue2ovFrAlDHI8Zzr-rJ
    gND-oXWRLeX1B9MGQA>
X-ME-Received: <xmr:ChtTZ5lVvTQcUd4U3o7-vaA2JD5bpjDhxg7MXr5xZLdjmfDhYT1cqPfL2C5N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecu
    hfhrohhmpefurggsrhhinhgrucffuhgsrhhotggruceoshgusehquhgvrghshihsnhgrih
    hlrdhnvghtqeenucggtffrrghtthgvrhhnpeeghffftdevudfgkeffjedvieeilefhteff
    feefgfehvdevhfejjedvkeefleeggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgusehq
    uhgvrghshihsnhgrihhlrdhnvghtpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehhrghrvgesshhushgvrdguvgdprhgtphhtthhopegthhhu
    tghkrdhlvghvvghrsehorhgrtghlvgdrtghomhdprhgtphhtthhopehnrghrrgihrghnrd
    grhigrlhgrshhomhgrhigrjhhulhgrseifuggtrdgtohhmpdhrtghpthhtohepfhhkrhgv
    nhiivghlsehrvgguhhgrthdrtghomhdprhgtphhtthhopehkvghrnhgvlhdqthhlshdqhh
    grnhgushhhrghkvgeslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ChtTZ0xUdGsQfoduyQK09rsryK1pNy8bgr9_rWArZgRLvf-PlRLnFQ>
    <xmx:ChtTZ7Twlx4xm4OWlx3o3lXr27dg5IfVhiZ4b3ZEfh3PPq0Wwln0Rg>
    <xmx:ChtTZ_bQyQd6zzg0NshUv9_hcU14No998XKCDsKf6p-Bw2VSZNI-rQ>
    <xmx:ChtTZ0SOEAxhAEeRKKxVd2SxhE9I1X_qTUnk1FtTAsv4pdfMbLtHyQ>
    <xmx:ChtTZ8JT-R9R87dl1K7A7A-7wgqEvpGLm2FU9jXngHAcsaREiTGql6ib>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Dec 2024 10:40:57 -0500 (EST)
Date: Fri, 6 Dec 2024 16:40:56 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever III <chuck.lever@oracle.com>,
	Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
	"fkrenzel@redhat.com" <fkrenzel@redhat.com>,
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
Message-ID: <Z1MbCCLxxd9hWgCg@hog>
References: <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de>
 <Z1LfX4S71BRvBKOW@hog>
 <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de>
 <Z1L2jQJ8Lr2kehXy@hog>
 <de5448a1-c5a6-4dab-afca-484eb9d6c445@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de5448a1-c5a6-4dab-afca-484eb9d6c445@suse.de>

2024-12-06, 15:26:08 +0100, Hannes Reinecke wrote:
> On 12/6/24 14:05, Sabrina Dubroca wrote:
> > 2024-12-06, 13:09:23 +0100, Hannes Reinecke wrote:
> > > But how does userspace get the KeyUpdate message in the first place?
> > > I _think_ we should get something like TLS_ALERT from the ktls stack.
> > > How is that implemented?
> > 
> > (talking strictly about "pure" ktls, not tls-handshake/tlshd)
> > 
> > Data records are passed to userspace via a simple recv(). Non-data
> > records (for example a KeyUpdate) need cmsg: the record type is
> > stuffed into a cmsg, the payload goes in the usual buffer. If the next
> > available record is non-data and no cmsg is provided, the read will
> > fail. See Documentation/networking/tls.rst (or
> > https://docs.kernel.org/networking/tls.html) for more details on how
> > cmsg is used.
> > 
> 
> Ah, right. And that's the issue.
> NVMe-TLS is using the 'read_sock()' interface, which doesn't do control
> messages. And changing it over to recvmsg() would not only be a major churn,
> but we also lose the ability to calculate data digests.
> 
> So if you have ideas how to handle that ...

But you have to use recvmsg for the control record if read_sock can't
read anything, which will happen when you hit a control record in the
stream. At this point you have to call recvmsg() to dequeue the
non-data record, process it, and then you can go back to read_sock
until the next non-data record arrives. Like a splice-based userspace
application, I guess. As long as you don't pop that control record
from the socket, you can't read the rest of the stream.

On the TX side, if you have to initiate a KeyUpdate because you've hit
the limit on the current key (or the peer sent its own KeyUpdate and
requested you to also update your key), you'll have to send that
KeyUpdate with sendmsg and the correct cmsg (see the selftest patch
for basic examples from a userspace program [1]).

[1] mainly TEST_F(tls, rekey), and maybe TEST_F(tls, splice_rekey) if
read_sock is similar enough to splice
https://lore.kernel.org/netdev/e00a6aed157b20573afbfc6c2353af2afa54f48e.1731597571.git.sd@queasysnail.net/

-- 
Sabrina
