Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2B148850
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Feb 2026 04:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771474019; cv=pass; b=WHtc+FRDd9C4NikrtKMYIidqHsvX7DERXPcaeXhSR/0tCrQzD8Jli5x9Oe/t54T/fJsbImc6iB/d9aOSNe4QZ58bN5ox0QdeD2xPKeQKI9UH75LAscDC7u3RVzZm7iHbxznVR5+ryQC5wTMO0LVXXXGYcYBIRoMG18bdhzpOrEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771474019; c=relaxed/simple;
	bh=M5bClbIGl8W19YBZbpud3XdzP5Fjo2rzslJcaFPPgBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q84NSeCDYF6k66Qq5FoS/2UISGLEe6ENaAobhGEVyKbqAHfRBPWQrYzgkQMJ91JTH6NOLJGmq36Zh/QX/Qj56GkL5XlGdSHSVkxkjvolhwcZ2wD8ZmHBaS+k74zJjVU8WS0rXJrel++1sUPSaikl0h1ZrRiSJAbGcfZjhjzxEPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3kSXPVB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3kSXPVB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso770356a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Feb 2026 20:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771474016; cv=none;
        d=google.com; s=arc-20240605;
        b=CVgkIMYeJsVIoX6DGZJbB0MalH2p9WZyVPg7RJ7d6srLovUxxDj6PDdS/MKDOSOem/
         gMgVcLbmEh+r8y8jWSFOJSnLEL1M2dlvws/Yh45EYU8JhwUcpAmlhqlqOZhCP6cLQIzp
         NP9eE7axuNkbZqFhiN9FBjyaVX5wNnhz0alNhupYcVg9i1+enT1G69YxePox5HQkvQpg
         RXGd69AIs4XkbH7NA36XZaO/phACiFXkVXCtOCJKMrDgu7lcYgpAD423RdWCes5xTYzg
         4v8tZYP4MKiuNSNI+dS49358bP9Fed+z2Nc8FWI45t6GCI3MbVncr434MY4p0YPCn1i3
         tGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M5bClbIGl8W19YBZbpud3XdzP5Fjo2rzslJcaFPPgBo=;
        fh=HU0q6bO87TN5sq+uEz7rzu6rvrVozDdbJHMjbAIOxp4=;
        b=INpdCVDcWh76uyvkf7zfT8zaJ/VWN5N1/kRf/L8Bh3w2+Hnwon9SyjHYwWjUHrKGmO
         3C3x/s5/JIAuiTwOi/8JmzlmDxAgmiYO/XqB5aNa8VeTXCzMCqwirxWyoVqSOgz2dwcW
         544uB6KjmHe79fXPx9bQx2jGv+mjZ374lsA7T/tNuzyE8tBWUdj1ytcyyBTmzEQOJ/gO
         Jtsfyz9PHg7eE6mCk1j280X3zC/aHrxaOii7AuHSBCSEZooJxTD4dX+XHM0njsrqJZYa
         zbkYHPtuO1qAzpR36efKa5Wct6CWrnWkKIaGJpxWbpFFwonzSsvdq7tuM4HqXzvPlHnU
         TWTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771474016; x=1772078816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5bClbIGl8W19YBZbpud3XdzP5Fjo2rzslJcaFPPgBo=;
        b=G3kSXPVBLlYsDp6ip7aZyitwEbrrKbyyvwlK79KEdey1Z4M7zaLVMmtq7tJVWXu/kd
         c0tRj1EbKJfcQyRvqs0bQzyTa1p2CpAptbD3kPoXuTzYuiEXfYsgEk7DbP/dSNYusGEC
         QIFMWyrFPQGDTDJxTxub1h5lBXgpg2ZnNjxuQAvmVYgJHqUF13MRwZz16fbkrrw3HxL0
         hfU0XUMXWbu5LvyHU1yQjYTz4MP+RPlzEWhR2B1BCEXf4dhVzfP4Tbh2h5ssqG0UbihX
         j81YcwkAvpXhCfv7DpUTYHgvYl332e05vFe4hh5SNOYvzSDu7Xd/n7ZB5cVgRSdgpD24
         kkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771474016; x=1772078816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5bClbIGl8W19YBZbpud3XdzP5Fjo2rzslJcaFPPgBo=;
        b=ugoLzyqXVm0cYGEmBe6NHf3chj/YSh3/viyiN+mBIjUKnuE1lKfX6scQUFmSZbY7Y9
         yMiC/hIJsISnospeZgtb9umi9rUKYlMO+EWEvnOsIV3P7TXA2/+6+VNGcF/ym4aGSnyo
         T4oGVKBkKjDVjvu9tzjhGThCWnRhY5i4G6sULv1jlW49M+Sy1izNF0k01xN+FuCIOLPK
         ndIDDt6Tjw9A0BeAxuuybg6cHzVUN6TGIFjck6mjE0zAO8LGTrdNLkjX1ExDLzH8b5JF
         EUC/WZ7kgWbePil3qrNvi3wCn70KSQ03PMmmj87mkjEnjHJFB5W6rDnovi1xV4Zyfart
         1ddQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGSw4MBjzCe3PchlP3Nn7VMZ5dJ+9G0tvxwTiOSyycfKz1lveoPY0BbACg6orE/Ho0QV2DoBeeHRQ/QPruhkrJT4O6cw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8yW8AAb6WlVOSOAsEWlQyR0rIHRFYZdS36977AOmSwlQJ3tY/
	BM4PoQxE/1g1rzFzMYbqnbCtagfZQlxDCvPvoWG/dfOjKkRmAkuA0NFjrsdyNBk5LVao+dOebUZ
	yVxSEMGPJ7qwMfLS7FLNQd1ktS7xhdww=
X-Gm-Gg: AZuq6aIrCkfEhKo1pva91NClanTJU98AARVKvu6Bd1toxb5FQQKz9v6wfJBtrUOEVwQ
	zL+Kiapd+xRtZi8BceyG5nx5s9k6ObjTPkSYhB7ZessoF5uWbpQJ6GJmhhZ9ADQBHxr4uB09iBp
	/2nzw2clA9kCa+urjOHDDduzUwnY9DhVfv/GNDNX/6SikuW83hdfDMM5wvg943Ynt5OiDxMbYiu
	czDWS3fYo/oxu44XHPrx1d38RtxvtjCV1dpvZw7hRvwx0mtfQhFBwrNAVUfpwUw4DAQx3ZMzHor
	q8ZvMdSGQ0RS8dH8jHe6gEWOZvWP++BmtqgG/Q==
X-Received: by 2002:a05:6402:210d:b0:65c:65b:e853 with SMTP id
 4fb4d7f45d1cf-65c065bef8amr6940336a12.20.1771474015691; Wed, 18 Feb 2026
 20:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217222033.1929211-1-cel@kernel.org> <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de> <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
 <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de> <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
In-Reply-To: <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Feb 2026 14:06:29 +1000
X-Gm-Features: AaiRm50eUgAhVc_N7_qaqUmrLWqABwpvCt6JkR5Dm4FE6LjRfv5Vfw_SGxNRkyk
Message-ID: <CAKmqyKNMSJ7zw3Uo6VRcyb5b1zTR=i3OutVZTh7nQsMX3+yrgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for
 control message delivery
To: Chuck Lever <cel@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Olga Kornievskaia <okorniev@redhat.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 2:12=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Feb 18, 2026, at 10:52 AM, Hannes Reinecke wrote:
> > On 2/18/26 15:33, Chuck Lever wrote:
> >> On 2/18/26 2:29 AM, Hannes Reinecke wrote:
>
> >>> The way I see it, ->read_sock() has an advantage when you can work
> >>> with skbuffs (ie network packets) directly. Then it has the benefit
> >>> of being paced with the packets arriving as they do on the network.
> >>>
> >>> But for TLS this is no longer true; the TLS skbuffs are synthesized
> >>> on top of the TCP stream, and the boundary of a TLS skbuff is complet=
ely
> >>> decoupled from the TCP skbuff (in theory, at least).
> >>>
> >>> This can result in TLS skbuff stalls when waiting for the remainder
> >>> of the TCP data stream to arrive.
> >>
> >> An entire TLS Record has to be present before it can be decrypted and
> >> passed to the socket consumer. Is that what you mean?
> >>
> > Yes. And that makes ->read_sock() a bit pointless (from my POV); lookin=
g
> > at the network stack the skbuffs are assembled/decoded by the TLS layer=
,
> > only to be converted into skbuffs again for ->read_sock().
> > Which seems a bit pointless.
>
> Is this true only of the software kTLS implementation? For
> offload, I'd think the decrypted records are placed directly
> in the skbs that are handed to consumers.
>
>
> > But the main point with ->read_sock() is that we can only process
> > skbuffs, ie we have to wait for the TLS layer to assemble the entire
> > record.
> > With recvmsg() we at least have a theoretical choice of returning
> > a short read, allowing the code to do something clever in the meantime.
>
> Do you mean that read_sock is always synchronous? Perhaps
> judicious construction of the consumer can help there; but
> I expect that plain TCP has similar pathologies during, for
> instance, a network partition.
>
>
> > Mind you, that is all conjecture. Might well be that ->read_sock()
> > is beneficial for TLS, too. Or, at least, doesn't do any harm.
> > It's just that I don't trust the author of the TLS read_sock()
> > implementation; his network stack knowledge isn't _that_ great.
>
> Time to get out our measuring sticks, I suppose.
>
>
> > (Problem is that my performance measurements always ran into
> > some obnoxious occasional stall, rendering the entire measurement
> > pretty worthless. So I couldn't tell whether the recvmsg()
> > implementation delivers a benefit or not)
>
> Generally speaking (ie, hand-wave mode) that kind of stall arises
> because the consumer expects it will get another data_ready and the
> network layer does not conform with the implementer's expectations.
>
> So I like the read_sock_cmsg design here because with recvmsg,
> the CMSG payload can appear in the consumer's data buffer. For
> direct I/O, that's bad. We also really don't want to place the
> TLS Alerts in page cache pages. With read_sock_cmsg, the CMSG
> payload can be efficiently directed to an independent buffer
> that is never visible to user space.
>
> And I prefer having a single receive path for both non-TLS and
> TLS processing. That's so much less code to deal with.
>
> This approach seems to me to be more architecturally sound.
> We just have to get over the implementation bumps IMO. I think
> we can certainly examine ->read_sock with software kTLS to see
> if there's room for improvement.

I completely agree!

The current read_sock approach is very brittle, as soon as a control
message appears the whole thing falls over. In the NVMe world we are
seeing devices issuing Key-Updates, which is breaking things.

So far the approach has been to convert to use sock_recvmsg() instead
of ->read_sock(), but at least for the nvme-host conversion (not
upstream) that has exposed a range of subtle and hard to narrow down
bugs. All this churn just to handle a few control messages.

This approach (in this series) seems like a great step to handle
control messages without having to redesign existing otherwise working
recv flows to use sock_recvmsg(), which doesn't seem to have any other
benefit, besides handling control messages.

Alistair

>
> --
> Chuck Lever
>
