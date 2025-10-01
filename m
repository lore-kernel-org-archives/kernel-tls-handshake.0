Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AF54918
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 23:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759362451; cv=none; b=e3ApZEklb+E11fA8X6aIaGWBRvqn0fMvldJ/euO7EPLQxcnoMYYDQH2udfw+4DBBsSywvd3lb4QLBQXv24LdniROGqqgHVpS6lja7ROorP1P2ni4HAOR77gq4OlTAijQtwRfvXTVvtQq1gIyLInsiVe1RhxnkeJiergONP+JwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759362451; c=relaxed/simple;
	bh=Q5OV0iHNvwPfgjAjSDngXVbSmStA2FOxoQkhjA9BcEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IM0p8wiY5wX++cYSQnpYQsGVYIMEu7ht56mOe8l5iq0ChRpwH1wguGW5fzWJMY8PjmMrzOTPNl1blT7HiKiRWGE5s+sUL80MxcxxLadYtH0TzR4ExWKYf5MlcFKLJMtZLB+B0/l/1QDyCTv9z8uL1JkZhMOpF6OujtOeuqpGpFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRm/OsPk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRm/OsPk"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so840333a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 01 Oct 2025 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759362448; x=1759967248; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu6/YggQt+LeqPOCyVdiXLO15FORLYOiCKcXMkHLwjU=;
        b=iRm/OsPk9yItZGjpOLqjYc6NXHGj8P5/bfkzL1BqwSpFv4fYqfBZtoAW9bWuWm1VW7
         nFBGMThtXl8wqB8Zh1JbXYB9hPg4H6GiYjQSepE54v+qVi8dsMsL3UCNkxKZdhVFcJI+
         V7QB5b1xzJtNbj2pnbZtafyko2Jb1owD/tdrK4uBP+m/onX2NFjJeZNLgGsobgWFHBtK
         hdfhV1ovojGJZ2UPfKpYuCgWeygRInKHQV/3y4PeDm1jsLLDEuSCNUolwJU+F6qyopMn
         iizQbf9J3DTwaZAaVU+4PyjV0etqifWEzlElKhHwbr59TjpnxfBbb+7o5ChkVpowY29o
         ZboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759362448; x=1759967248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zu6/YggQt+LeqPOCyVdiXLO15FORLYOiCKcXMkHLwjU=;
        b=hSXbTD/nX2gh2oC68bqF0buVocfpI7n8wGs/laFFocTRuWNGVMG/Nx55KqH5p6h4Mg
         yXHjXyxB5snBZ0iC1LD5pb+bnU7Wwmg1SnMrErpLXDy3eVeqay3lYp0037JA7f/6M61t
         4iMoP7zWVNTWqu0U6K7urfzH5RtXUxeJSRYeroQZs62+IFYHVzgCbVrxkbSqES68ZPKX
         X7VbJX+GNNAmNwdRUInYyE3Y1cWY+XaD/qJPUdpplwb4AjMfb3e0j6L4g5sibfreyG1M
         /03pc/ysg3zl6FpzCJuyLtDKUAGhlHimDdrviPjrZiHvg8yQ6D1tbDthkg9c/6LIiPma
         RqCQ==
X-Gm-Message-State: AOJu0Yx/Szjf63QVFGPSKgIfiSV/jUqaep6x/WGwx2HIAUrlHyY9lxN7
	JEo4/G7WcCgU4QU/LOv/VwWWUmTVpVGAVlYBoBSh/3XHdMgdimKEO1//BU63JSI4Ni7FmpzxcQu
	rSQ9W0lZB7qiBdtugwau/lwWU9vPGKlw=
X-Gm-Gg: ASbGncvg8UWbgvk5UjUQ4jCGDF+daRZ0aH2n5CY/Shzzd/mCB9EaPXFsZQQ31rYPv/d
	gQNploDEnI9oFiAHtrv7CB7PMnSb1C2O9IpTXR/LbhLx/ds7TXNsvcGUs7q2+mHsEyFI7IU6u1T
	cBCVvcmtaiTEoA5nDqYRxXpeOkHeVxpr2Htgii3kVV/onnOkMzFWA76rdV6yWlGJLuJ28VSU21h
	8WihgyqS3jzeYSn8c6wPuvMukS81HlDv7UrCsiIXzSOYCNLl2tzSRS+mDvZvA==
X-Google-Smtp-Source: AGHT+IFFe/M1H84rn8UM0uNP2wzEEP0b8NSsYPWPtS3OprUMgmvLfm7r+CIvHDXnQQ1bQW0+fCdQRA08iiHmfgN2ed0=
X-Received: by 2002:a17:906:c146:b0:b46:1db9:cb7c with SMTP id
 a640c23a62f3a-b46e4791038mr570706666b.33.1759362448073; Wed, 01 Oct 2025
 16:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001042734.17307-1-alistair.francis@wdc.com> <9ca1828f-49a2-45e6-b8c4-dc64be71b33f@suse.de>
In-Reply-To: <9ca1828f-49a2-45e6-b8c4-dc64be71b33f@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Oct 2025 09:47:01 +1000
X-Gm-Features: AS18NWCOfD1CjTkufYX8T-lfvnvf3QSB_8jsYSoXAdFH9uNlnM074VOLGuFh02Y
Message-ID: <CAKmqyKNpFhPtM8HAkgRMKQA8_N7AgoeqaSTe2=0spPnb+Oz2ng@mail.gmail.com>
Subject: Re: [PATCH 0/8] Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: kernel-tls-handshake@lists.linux.dev, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 1:27=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrote=
:
>
> On 10/1/25 06:27, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > The TLS 1.3 specification allows the TLS client or server to send a
> > KeyUpdate. This is generally used when the sequence is about to
> > overflow or after a certain amount of bytes have been encrypted.
> >
> > Work is on going to add KeyUpdate support to Linux:
> > https://lkml.org/lkml/2025/9/5/137
> >
> > This series updates ktls-utils to handle the KeyUpdate request and
> > update the keys.
> >
> > As part of supporting KeyUpdate ktls-utils will need to save the
> > connection state in the kernel keyring during the initial handshake.
> > The kernel then provides the key serial back to userspace when handling=
 a
> > KeyUpdate. ktls-utils can use this to restore the gnutls session (using
> > the patches mentioned below) and then update the keys.
> >
> > This requires the following gnutls patches that aren't yet upstream:
> >   - https://gitlab.com/gnutls/gnutls/-/merge_requests/2021
> >   - https://gitlab.com/gnutls/gnutls/-/merge_requests/1968
> >
> > and kernel support, which is added by: https://lkml.org/lkml/2025/9/5/1=
37
> >
> > Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
>
> Right. I've been too slow. Actually I have been working on a different
> approach, as this approach has some pitfalls which I'm not that
> comfortable with:
> - gnutls session restore is _actually_ tied to the 'NewTicket'
>    TLS mechanism. While it _might_ work without having tickets enabled,
>    I'm not sure if we don't run into unforeseen issues.

Yeah, the session save/restore in gnutls isn't exactly designed to support =
this.

I have changes submitted upstream that make this work [1]. If they
aren't accepted then my approach doesn't work. If they are accepted
though then we can rely on the gnutls unit tests (included in [1]) to
test that the save/restore works for KeyUpdate. So I do think that
alleviates a lot of the issues.

> - From what I've seen, the gnutls 'key update' function will always
>    update _both_ vectors, for TX _and_ RX. That works for the receiver

That is no longer the case in the latest gnutls. So any version of
gnutls that works with this series won't have this problem.

>    side (as this side receives the TLS Keyupdate message, updates
>    the RX keys, sends the TLS KeyUpdate, and updates the TX keys).
>    But for the sender side we need to send the Keyupdate, update
>    TX keys, _wait_ for the Keyupdate message, and then update the
>    RX keys.
>    And I haven't found a way how I could instruct gnutls to do that.
> - The actual key update really just means to derive a new set of
>    TX and RX keys from the traffic secrets. And the code for doing
>    that already exists (in some form) in tlshd.
>
> So my approach is slightly different: having tlshd handling the
> keyupdate directly without invoking gnutls.
> In order to do so we 'just' need to export the hkdf_expand_label()
> function from gnutls. Once we have that we use a gnutls callback
> to retrieve the resulting traffic application key from the handshake
> and store that key in the keyring.
> The key will then be passed with the 'session_id' setting in the
> accept response, and stored in the kernel structure.

Ok, so this sounds like it is using my submitted kernel patches. You
are just taking a different approach with the tlshd implementation.

> Then upon KeyUpdate we have this workflow:
> Sender:
>   - Call into tlshd to start KeyUpdate on the TX side with setting
>     'session_id' in the 'accept' request.
>   - tlshd sends KeyUpdate message with 'update' bit set
>   - tlshd reads the key from 'session_id', derives a new traffic
>     application key, stores it in the keyring, updates the
>    'session_id' setting.
>   - tlshd derives a new TX keys from the traffic application key
>     and updates the ktls vectors.
> Receiver:
>    - kernel receives the KeyUpdate message
>    - kernel calls into tlshd to start KeyUpdate on the RX side
>      with setting 'session_id' in the 'accept' request
>    - tlshd reads the key from 'session_id', derives a new traffic
>      application key, stores it in the keyring, updates the
>      'session_id' setting.
>    - calling 'done' to return the the kernel
>
> And then the receiver switches roles (and becomes the sender),
> and starts the above process but without the 'update' bit
> set in the KeyUpdate message.
>
> The good thing here is that we don't need to modify tlshd
> too much, and we have full control over the handling of the
> KeyUpdate message.

I would counter that the advantage with my implementation is that
gnutls handles all of the crypto operations and generating the actual
KeyUpdate message. gnutls is battle tested code so it's handy to have
gnutls handle as much as possible.

>
> Will see to send the patchset next week.

I look forward to seeing them!

I'm open to other tlshd implementations and I can test your patches
once you submit them.

1: https://gitlab.com/gnutls/gnutls/-/merge_requests/2021

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
