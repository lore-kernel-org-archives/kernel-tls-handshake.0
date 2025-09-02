Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA513C8FF
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 Sep 2025 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756783858; cv=none; b=Z9oXsM6IXaKYBC0GhMbxft5vzAfto9tpsOZSEObURaeVYEJ3sczLOGuckwUnOdBarICZJTzbHh4WnMNqhCBZH1L7c7QdpeJpbhkHOTsi4nF+2Ga28JRXZ838CZKmZZd5DPV8iLIC2THuo+SLjbEEJEcg2ef2cv8pmZ+Pf+69VcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756783858; c=relaxed/simple;
	bh=ufFwImynso5Bq2CxyVZa1Z3HfWL7aJ9r/WzP9DNPFJE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qie+NT0Trcae6ht54pG6O900FVFSQy/+thmm38qOvSkIrgR/dpo4Gbisp5MSqpjHgb+YQB3chJ+O0ZfaeRnCm7ESQr4LEPtTRLq2R2b+IOVoJjsaYg5jihzdK52zJFLNNxhMuc5h/m5bLLe/rADeStoYPRFx8feob2bzqP16GqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtCj6X5s; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtCj6X5s"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2445824dc27so44578975ad.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Sep 2025 20:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756783856; x=1757388656; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ufFwImynso5Bq2CxyVZa1Z3HfWL7aJ9r/WzP9DNPFJE=;
        b=dtCj6X5sz9JriTlo+9XO+10F1/2Lzr4Sk6HKL8pkWB3Gay8QH+UHd0oCyTmvuegjex
         1E1Cp9ps7ehOra00DfGgRnErWeOJ0XT0P1zB8qExpAYp2Gd2L1o0zJ1lJMwtw4gfMDev
         zNi83MKNxR+iR99nE2TWkHb3hiE++X+Xbbd7xdI6U6HLgyQg758kU5BHgXn9cex5ytUU
         NAp3HGYWrIN789aKmGwUwzPd5d8Kr7RUu8r6KNmCLw6uzDZ1kCSVdAfFISvtkOL/lC4y
         eyNpipULE1c7/0qTF4yVRseGh1zNQLWaWN9qg7ftAyLBBaslBsOylUHMd1YJBvZRYwl4
         3rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756783856; x=1757388656;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufFwImynso5Bq2CxyVZa1Z3HfWL7aJ9r/WzP9DNPFJE=;
        b=uO7OQGHrOFgGc1cOagMtDW4VJLXvR7CB3loZIWOAE1UDqlvSbzWCaAEZSntFQkfYnW
         n7dBhsHXmS5TRkN77r0Tq6mVuYgJuL+KJYeC88nZyDtI//rHbaas0idVlPy08/cmKKgv
         qvIIngnkpsmpZ6Dwpz/xXkI7VZ8mhlBvLEWvC6jqvvryO2jVBZVut0rdNwncsHCmDQBU
         3yhCJhpgpCzT9CO+Of1nm4r2eq3krkJJfx8x5caPBwbISJw6KtYIOTnZ5uHcM54ykFF0
         YZ4oiZmNVDRen/7zD1burqFYTBak2xnPFTQoOp2VR1bNCb3vmZGf6WV7xUw/bFyOpKVx
         dI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoYwaYgiY3E9NtrNEePPdu8nHAoLrNbMZraOo+tHwqipOHBzTIr7f6WgbNzasgNeRwIeSXMzOunfqQFbtQRYOZi6+c+A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw46CSpx3mvzJ8Rp6B+b6nMV66Xn/EHeOuKiwvaCNhy1v7i2zWu
	djjeqpMKxn422HrUKORJc9aL8wga+FxGp/8oybpl7Xc6wOe3uO5GDjpP
X-Gm-Gg: ASbGncuLKJHjep4tsBegonMsRt31mwJoYGQjcqrH+xQN5ysAJ5PGWzJBsUVjJ6WjLVJ
	HAKVL+sMcmMPSRR+wE3aZMxsBl7hKK7Xkkg3y4myNa7Knuj7yHAuyw01Dl4VIsLMpWuzbdcCAnC
	uItQPRkcC36Q11XVHEt77rdgbe9Sje9e/+CjM2hn/6qBNcTkXth0ivyc+lgVF+kPz7q9HgZxJKW
	vVfdXLSYS4AlZdQhWcol5TGT9UJSYoAc++6zTMjla0L0wQOEgesjBYRTWNkIpTaMFZAfIn80cUt
	n7LforK09knTHoTEgoLsHvon4kd+wLOe9msl/HRYGT0ORSuDL5d1nsTp7RkxuMcHGoxApYSA/OD
	K35OqgnoW2qPc+K7yy8QyUXGaqvc+6e0tycU2PZJujaQt+0U=
X-Google-Smtp-Source: AGHT+IEWLqzRdh0yJn8Aksx0GkhFqYddmdc77+jsyaksy05k+WhwsrJquVPpepfa6EutwmpSr/yUHQ==
X-Received: by 2002:a17:903:120a:b0:248:d4d5:841f with SMTP id d9443c01a7336-24944b1f934mr111412905ad.58.1756783855828;
        Mon, 01 Sep 2025 20:30:55 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24a92f89758sm77842265ad.9.2025.09.01.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:30:55 -0700 (PDT)
Message-ID: <76d986e3f304dc199826228e90ad3f68160ba8f3.camel@gmail.com>
Subject: Re: [PATCH] net/tls: allow limiting maximum record size
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: chuck.lever@oracle.com, kernel-tls-handshake@lists.linux.dev, 
	donald.hunter@gmail.com, edumazet@google.com, horms@kernel.org,
 hare@kernel.org, 	john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, 	pabeni@redhat.com, Hannes Reinecke <hare@suse.de>
Date: Tue, 02 Sep 2025 13:30:49 +1000
In-Reply-To: <20250901113844.339aa80d@kernel.org>
References: <20250901053618.103198-2-wilfred.opensource@gmail.com>
	 <20250901113844.339aa80d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-09-01 at 11:39 -0700, Jakub Kicinski wrote:
> On Mon,=C2=A0 1 Sep 2025 15:36:19 +1000 Wilfred Mallawa wrote:
> > During a handshake, an endpoint may specify a maximum record size
> > limit.
> > Currently, the kernel defaults to TLS_MAX_PAYLOAD_SIZE (16KB) for
> > the
> > maximum record size. Meaning that, the outgoing records from the
> > kernel
> > can exceed a lower size negotiated during the handshake. In such a
> > case,
> > the TLS endpoint must send a fatal "record_overflow" alert [1], and
> > thus the record is discarded.
> >=20
> > Upcoming Western Digital NVMe-TCP hardware controllers implement
> > TLS
> > support. For these devices, supporting TLS record size negotiation
> > is
> > necessary because the maximum TLS record size supported by the
> > controller
> > is less than the default 16KB currently used by the kernel.
> >=20
> > This patch adds support for retrieving the negotiated record size
> > limit
> > during a handshake, and enforcing it at the TLS layer such that
> > outgoing
> > records are no larger than the size negotiated. This patch depends
> > on
> > the respective userspace support in tlshd [2] and GnuTLS [3].
>=20
> I don't get why you are putting this in the handshake handling code.
> Add a TLS setsockopt, why any TLS socket can use, whether the socket=20
> is opened by the kernel or user. GnuTLS can call it directly before=20
> it returns the socket to kernel ownership.
>=20
> I feel like I already commented to this effect. If you don't
> understand
> comments from the maintainers - ask for clarifications.

Hey Jakub,

I don't think I saw your email, apologies! But this makes sense, I have
drafted a V2 using setsockopt(). I will send it out soon. Thanks for
the feedback!

Regards,
Wilfred
