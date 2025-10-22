Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE5330B35
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131810; cv=none; b=M5oIgKeWaMGQlM2NjUic6JPytqK6osamcxo6lv64rADHdi9F1jFpX6uGgcjlKtO08ObWXPG9lO3pL4wpt97ygz9tmpSq4KXh+6CP3XKVldJez11znlm/ccclzfkBkq8JzdgjYtLSGT7PwD/O/pBu7xgVHOuNsHydVI97KFqbVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131810; c=relaxed/simple;
	bh=MkLx2R4aQDQRSte1k6rDu2d4S0+mLWdRZ24YtDib+QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUHUBZT69kMTh7jqUxOzMCGm5g7SgtHad97uq1z6F/mnEvBV3LjYLoEKOpFQOFTBe4TknIX42cgbeSxVk9p9M5CLc8DIZqIxtrmh8nTmvYJTkpFaUCNkEsxTnktqOLPphLFcOSWGPUCwzYUByCMVkc5deF534G84mAwoczLQDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzvdknwA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzvdknwA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c4c346bd9so8608826a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761131807; x=1761736607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUpfROanALk009O5ukzxUjqqmJACMBILWAOKJHciC34=;
        b=FzvdknwA4w7LxXgwrjkjIo1DTBT54hURD19DIWNvoaf55efX1V4vX+K4AWW+sm2IrO
         oUyWSTGnraLcg+Ol9T7RTuwH6NM6JSQcm6vn1MxZKZXhiqt148p2ypSfaXvADmciqm6A
         nOU+FgtOzEQ0+cirID0SObskf5D9O8mzZF/eLNYABq4cy73WAEr1m0f6xbFSJoR9SG2u
         V1AxFObXAvlCmLX1I+zsZMHJs59dvEoOnMMSPgBhQ9LdMNupG4ZwEn007AAUULuYXElg
         XNUIDUDp38W+uyreXUfjHDInjMWtfnmwIyA/igsAmnGmM31pYYrkn34YN+zQkfSmxDHY
         6gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131807; x=1761736607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUpfROanALk009O5ukzxUjqqmJACMBILWAOKJHciC34=;
        b=sKCcE9/Pj/Bb8H52edwBmFrWsFmCINQccHfJ2hPnIqzrIhRKTqM8T7No32ngUWtGRq
         mfYIyqZo+oZy9EdIQjEJtOw8RsejV2xjadYKKAwSMkJyfp7kh8DlB0cx49U4ghk1u4Y6
         zLaq/FCw+BONvXDScF2AH8qRfvbkXTy5KocJrhStVgDitWMkswe0btaP3yw8EF6iSC6k
         goRFzXTBZhAh8PJj5gO5ixpNp5bbzCFxmCr291pNbWv7o1UXgbgj3wBCQApSCHsd1hDl
         zSsmKKKAFCgOmeY0twCBVG1+h0zVTCR4IJeT9XnJs0ZxwsHGhSCvkhlTH2nyIiiT1l4E
         waUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg3ih3X0u0hYqCxeLfk+05Xl44PzXuKFp/WOeQXDBB8tmWGzNWTT7VMFjxnyexnMkKbyPADxL24f+z6bd68824exEkDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ3akUk1yEeHZGgd9QWKP5C4sAVVCn27w2x8PBtZ6zvsoUJbRV
	kLD1kTDJLFlmTtHfgZi4uQonMwoGj3QTNrfap86No5r99xh2G87MQRwkVHYoUKzxGZBG0IDHh+a
	uryZbFKeApwVCIft62TbL5VX4vGL4Nes=
X-Gm-Gg: ASbGnct19I/HR+B/fDZI2E4JPiKg3S6p34hTNbHbZ9NN7JJ2rrmYBH+AurA9xy6RDZj
	qy2u2FoXC5GPe3L2LFCRJI7HI7aoF3cvlC/HXBcxoKvzmeu2eqeWan1OYuLIkC/E8muGokiRN8C
	fCbvOKfyD5M75jj+ugeFgw49i1KsQ5Ib2FFNVaSxKfa9uf6N0T4WJ8tgRcQYKV/RpzqIohDflsc
	XQQ/LIXKv/kAuNYJtQIIrp395NgIwF2Ud7f3MH7fTaHPATAPGgR63gLNWC6N7j5fDuxnJv9oQSf
	eiu66bDMayWnFVN5wooOV+KTmw==
X-Google-Smtp-Source: AGHT+IFeLMsqZpbHAvlJBzKIdahXOOBShjYQZyOY7ATbt5n7WHdXXR/ON08TB4hturxLMLEB0GOq3i/bLAd52DC8p3U=
X-Received: by 2002:a05:6402:13ca:b0:62f:8274:d6bd with SMTP id
 4fb4d7f45d1cf-63c1f626dd4mr21176233a12.8.1761131807215; Wed, 22 Oct 2025
 04:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <20251017042312.1271322-6-alistair.francis@wdc.com> <dc19d073-0266-4143-9c74-08e30a90b875@suse.de>
 <CAKmqyKNBN7QmpC8Lb=0xKJ7u9Vru2mfTktwKgtyQURGmq4gUtg@mail.gmail.com> <4b2e5998-a646-4f99-8c87-95975ff8fe66@suse.de>
In-Reply-To: <4b2e5998-a646-4f99-8c87-95975ff8fe66@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Oct 2025 21:16:19 +1000
X-Gm-Features: AS18NWBDgW-hay2VUeCdIjfUCzoI0NhxABO1jEUfCaPHUmJ8eBnU71SyICyiPWc
Message-ID: <CAKmqyKM-uX6_a+Ru01RD3-CwoucTN7P_sU+d=MEKSo2pxG_tDA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:56=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/22/25 06:35, Alistair Francis wrote:
> > On Mon, Oct 20, 2025 at 4:22=E2=80=AFPM Hannes Reinecke <hare@suse.de> =
wrote:
> >>
> >> On 10/17/25 06:23, alistair23@gmail.com wrote:
> >>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>
> [ .. ]>>> @@ -1723,6 +1763,7 @@ static void nvme_tcp_tls_done(void
> *data, int status, key_serial_t pskid,
> >>>                        ctrl->ctrl.tls_pskid =3D key_serial(tls_key);
> >>>                key_put(tls_key);
> >>>                queue->tls_err =3D 0;
> >>> +             queue->user_session_id =3D user_session_id;
> >>
> >> Hmm. I wonder, do we need to store the generation number somewhere?
> >> Currently the sysfs interface is completely oblivious that a key updat=
e
> >> has happened. I really would like to have _some_ indicator there telli=
ng
> >> us that a key update had happened, and the generation number would be
> >> ideal here.
> >
> > I don't follow.
> >
> > The TLS layer will report the number of KeyUpdates that have been
> > received. Userspace also knows that a KeyUpdate happened as we call to
> > userspace to handle updating the keys.
> >
> Oh, the tlshd will know that (somehow). But everyone else will not; the
> 'tls_pskid' contents will stay the the same.
> Can we have a sysfs attribute reporting the sequence number of the most
> recent KeyUpdate?

Why do we want to reveal that to userspace though?

Realistically it should just be ~2^64 and it'll should remain the same
number, even after multiple updates

Alistair

> Cheers,
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
