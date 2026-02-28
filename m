Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E78A937
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 28 Feb 2026 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772276983; cv=pass; b=NxNqQffyMGY0lIFRdNFJ142ShAKykzqGl0aua7oEFEgfZ0SKXbWseuh7u9E2tVpG+zpH7zO71ryO1JMtn3UU00qr1nJrnqEyR7j3AsCcvE6uE0vwDfbaU01a32hqfvJdczxhF3oGI6Mus4amPnm8p0Gglz5Mb7/R9A3jGnKEoN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772276983; c=relaxed/simple;
	bh=3HEMrx+Tfoxfs6tFRi2jbNSmsoPX7IP+n2t6Y02916Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8npVL8V2FOtP0JdJH5ycwmbayMq3x4WxNX50QrbXQoQ7UVLXtKCknO/9meqj6QpBbE8tUKcjYoNNKPBerEMgbCxjLJzj7DwEmIn9G/tlyR0Q6S3LrvxLAOg7wVRpDqsVZWO932C1zqntPgkIJNQ9Po6GMf60sh8yVUBUYl0B9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WetkdUah; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WetkdUah"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8d7f22d405so454782866b.0
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 28 Feb 2026 03:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772276980; cv=none;
        d=google.com; s=arc-20240605;
        b=KTuxqla5LQMFVgBU2SRHlXQ7xhTUao1wOq8w1sXs5uLe6LYXFt5B10GrM5Y9g2gLiG
         Oc9Te/bi3LVIX3vKLQ+qav++S1hWn4W7/s7gJW/pYUB0ohhkNO0ddrUVcWFKCKpSQH5b
         1+3kOmEVydNvm4Ksb14VRPnSNiC1hBMlgjRdpxeu7oa7DUe/DhGTA4Xa266KTb7ywGrt
         cLmtxjIwUM/tgC/Epp1gzREqwPNONCwXCMQ7Px1c+FdiUF4wJhQD2j5DB+F67dniEeBT
         zL0xSh8X9sCRm/6B5ZZK3xojN47uLzU8mw1wxwfQGgn3TlLPu73p2ELyJe7kku8DieiS
         T9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pZpH0SsSdjGYJZhl8QpF9eScJFkhidHoyeHhnfxbdU=;
        fh=g0/R25AnzjoA/gQXe0kajAbdmOtrQMBWBcFSpvAETZI=;
        b=CO+nP7ZWoJTpOEQWlbn+L9qnPM1O6QV4ufvaNlB3/hegrDgkR+9IKfKqqPwhadruFf
         UqFS7REZ1jItAeoCSu5xmDeO3Hy8TYzFEBYVLH6AFpqsMa5haRObtzxfsDj55RtUW7Rg
         ebW/PmRjzCyi58RRunmSeeKDxjsgb7pKrMJ5VzsP3yG0pwRVLv0tFdELIAl9wPmbV1MN
         57YF9zV23ptn6FoVTThIykoSjQGBEWpq6pJ9/UBxCWQPSfHnx7PAGxSSs73aaOvvS4wX
         uCr/kkBRPttfqIBezMEzdn2vf71nUQbhz4QAHOFg3DsNST6nF+bf06dCRE4MTP4PF0X8
         PJfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772276980; x=1772881780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pZpH0SsSdjGYJZhl8QpF9eScJFkhidHoyeHhnfxbdU=;
        b=WetkdUahztfC3hTBI8awSIT0wOLAn+2nd8zqVQ1+5fKLCZ3hrwxtrmRFt+QPhNoxm9
         mfC5I4oWf/pQr5mc5fOR4Fl9Tv2pwSC9224PwfkBA/gB7UBaVoSDYfT3F6yhARRqiZih
         Yg+RwVf/6BR7S9BEIhnbsyfQBI0YXIZDnqCVcBpbpuf4Fa/MbuPwF/7f72ic04AhyVfc
         Ld/Q9mJe/FNgYw5QuLVHkDQPyCAn4kq9YUMtNcF1OeZMtl0CZ9y5DIxW7Vtnhgbhpp/Q
         jtf9doPQx6gRDdIMVxl4fq3QyVKSD7y75JwVKHxrD/dBqynERSsDZmQeKDdyM7ma221u
         juHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772276980; x=1772881780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pZpH0SsSdjGYJZhl8QpF9eScJFkhidHoyeHhnfxbdU=;
        b=PXR1lLCUTdCt1SbMpH4wCpPB7HY01gGjhnqqpKPuXfiMYPRVjEIm7PMUJ1AEimFJDq
         TKxbYi5CMdJn8BlZJJ72s9CRfBmUTVONhoXSQhz2l8T1AguALrdyaIq1sCY+VW/ukEPC
         B+65Lg4z2c0SFKnKyUCXNeGuiFx7939z+ADz0CqnW7d1dXdmF78benvw39eiIsSBmvgk
         Y5TIYqJ0SZK39JFtwg7peqdVlGqTiGB3EFbYD2RceSufRtubAryIYT3PblLgyrCrXTL3
         tAtEE6n/aolfXSdR9KoUkcrcOOQULGULtgyJZeduBairgb9PR/t7r+16RxCwBHmBNyfF
         DVQw==
X-Forwarded-Encrypted: i=1; AJvYcCUOaUmpGmzFQAjS0AHo1Dws8gJ2eJOYFGFuwzVxy4kkadfqkAxG+yDPqVcKxWJYMOef5fgz4yyp8BblaTm79BIjfhLF/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVD9qYBkyC+lnZXIm1S8tep4nBJIbI6xlAnR/GSRBsEPj3YTgA
	r8hw34SgT4JtJtH+cY4oTKo3MYSYfBq/riLFG+sHSSPSof8wWcG6jljUuFM06lpgzb04uFALW0V
	PPJk7+UenCZKN2xVCrzbf8WKqO7cWbVo=
X-Gm-Gg: ATEYQzzzw/qOIraau13Og6hKU3EvoYSozg0LvxFkOWeMVcy477FKwKLSMSV6hB+ua7V
	JXzNCANn2m3QDYbvQDmSzTiZmTlZoldIJEZcbV3DtJVZ3fjT7PBc4nlzIft4pMKmlojIApzzABN
	j9FGZiJeW2kMBBrtStJWBd2/Ar1USo17nc78kX25iDV7pE2PegSi6hlXunMcmtkVYLB/SHq0xM4
	GAUNTr+sR6ZQ+6bKLjnizRP3XkTffS5qex9CLPmSy3fXYvIInOWPSYNg8vnFx2mdB3hR6bo0w0i
	STCXMotqqrxBAbPmwS+vv/0cQ502gXRDrrSTiQ==
X-Received: by 2002:a17:906:eec2:b0:b88:5953:2f14 with SMTP id
 a640c23a62f3a-b937638a19fmr361004866b.16.1772276979437; Sat, 28 Feb 2026
 03:09:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217222033.1929211-1-cel@kernel.org> <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de> <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
 <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de> <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
 <bf17b852-06db-4b2e-82a9-c6173adf761c@suse.de>
In-Reply-To: <bf17b852-06db-4b2e-82a9-c6173adf761c@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 28 Feb 2026 21:09:12 +1000
X-Gm-Features: AaiRm50lU9rPUZvqgOP1mI_Tj_54Q5gqceh01DKDtJR_NplYucvcPEp_jeyxO9A
Message-ID: <CAKmqyKOjbNkbAGY1bTp1cH2kwAPbViVA6UEv0uSdY=J2vRAk9A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for
 control message delivery
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever <cel@kernel.org>, Olga Kornievskaia <okorniev@redhat.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 6:10=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 2/18/26 17:12, Chuck Lever wrote:
> >
> >
> > On Wed, Feb 18, 2026, at 10:52 AM, Hannes Reinecke wrote:
> >> On 2/18/26 15:33, Chuck Lever wrote:
> >>> On 2/18/26 2:29 AM, Hannes Reinecke wrote:
> >
> >>>> The way I see it, ->read_sock() has an advantage when you can work
> >>>> with skbuffs (ie network packets) directly. Then it has the benefit
> >>>> of being paced with the packets arriving as they do on the network.
> >>>>
> >>>> But for TLS this is no longer true; the TLS skbuffs are synthesized
> >>>> on top of the TCP stream, and the boundary of a TLS skbuff is comple=
tely
> >>>> decoupled from the TCP skbuff (in theory, at least).
> >>>>
> >>>> This can result in TLS skbuff stalls when waiting for the remainder
> >>>> of the TCP data stream to arrive.
> >>>
> >>> An entire TLS Record has to be present before it can be decrypted and
> >>> passed to the socket consumer. Is that what you mean?
> >>>
> >> Yes. And that makes ->read_sock() a bit pointless (from my POV); looki=
ng
> >> at the network stack the skbuffs are assembled/decoded by the TLS laye=
r,
> >> only to be converted into skbuffs again for ->read_sock().
> >> Which seems a bit pointless.
> >
> > Is this true only of the software kTLS implementation? For
> > offload, I'd think the decrypted records are placed directly
> > in the skbs that are handed to consumers.
> >
> >
> >> But the main point with ->read_sock() is that we can only process
> >> skbuffs, ie we have to wait for the TLS layer to assemble the entire
> >> record.
> >> With recvmsg() we at least have a theoretical choice of returning
> >> a short read, allowing the code to do something clever in the meantime=
.
> >
> > Do you mean that read_sock is always synchronous? Perhaps
> > judicious construction of the consumer can help there; but
> > I expect that plain TCP has similar pathologies during, for
> > instance, a network partition.
> >
> >
> >> Mind you, that is all conjecture. Might well be that ->read_sock()
> >> is beneficial for TLS, too. Or, at least, doesn't do any harm.
> >> It's just that I don't trust the author of the TLS read_sock()
> >> implementation; his network stack knowledge isn't _that_ great.
> >
> > Time to get out our measuring sticks, I suppose.
> >
> >
> >> (Problem is that my performance measurements always ran into
> >> some obnoxious occasional stall, rendering the entire measurement
> >> pretty worthless. So I couldn't tell whether the recvmsg()
> >> implementation delivers a benefit or not)
> >
> > Generally speaking (ie, hand-wave mode) that kind of stall arises
> > because the consumer expects it will get another data_ready and the
> > network layer does not conform with the implementer's expectations.
> >
> Naa. Tested that one. I've seen stalls affecting _all_ queues at
> the same time, in regular intervals spaced with the power of 2.
> Current reasoning is HW-based LLDP frames handling.
>
> > So I like the read_sock_cmsg design here because with recvmsg,
> > the CMSG payload can appear in the consumer's data buffer. For
> > direct I/O, that's bad. We also really don't want to place the
> > TLS Alerts in page cache pages. With read_sock_cmsg, the CMSG
> > payload can be efficiently directed to an independent buffer
> > that is never visible to user space.
> >
> > And I prefer having a single receive path for both non-TLS and
> > TLS processing. That's so much less code to deal with.
> >
> > This approach seems to me to be more architecturally sound.
> > We just have to get over the implementation bumps IMO. I think
> > we can certainly examine ->read_sock with software kTLS to see
> > if there's room for improvement.
> >
> And that, I guess, is the real argument. We've seen with the
> recent TLS alert CVE that posting TLS messages in the recvmsg
> payload is a _bad_ idea, as this puts far too many restrictions
> on the format of the message.
>
> So you see me convinced. I'll give it a go to convert nvme-tcp.

Just a quick update that I have done this for nvme-tcp with KeyUpdate.
Just chasing down one last issue. Hopefully I can send some patches in
the next week or two.

Alistair

>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
>
