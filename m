Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91323815C
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758642556; cv=none; b=d/i7VwNIz5te49PSGNbJdwFyeNP6el+kZSQj4GVQqAtVZpWBBDZYiPUW7/EBNXysHC0lfp9Ho33yP26fKWRNnMErVJZpKmSxn+bqw5eMvD+9qf4ZF6F4uKq0APoiCYfQH3qclUI1XZHhyWR3BojgrAbYni3hdyFqH9jvNk8Q2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758642556; c=relaxed/simple;
	bh=a6gz1VpqLfP2Qo81xJtC/LGGtIJs3zssm8VUofjyi+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC1HhT+5IFMaaJcQvyDNxTaCduiNVDdO9j+JFQKK5AHS2g7Xkdc7bly3ouRcaaMHbtLKv9UfwicD/Ze0scYpwPLoj5nY6e63QYhqpvU07pMsbVCYThgr6/5c7pptcz/fxyiNnnkS8EcqX9cG0DLQ5ywUbZb/jzIYUAixdS74++I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnpZsrDg; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnpZsrDg"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b556b3501easo434467a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758642553; x=1759247353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgkmz7Yia2mUyCjlHvvFUXxL30TIgrGepaFfyyHrQY4=;
        b=OnpZsrDgR5QwN4QX8UhoE5jnnoNMmRGCLyeO99aMLli4c7FCykkt0Xf4ONHIB6rjqB
         4RHxg++59POKejzHcCIX34NtRxsa0DnGKK4EPqlKb/k7VWHNLnxxHBi5xjvQx+LMxYva
         cdK1IlLOB8oQG9NQjmUk61Ips0aydWoFJQeOFYeVh+DlbmJmzTMkMiOEI1b2EwdvpWAq
         9RPRNZYPYaVueAtJ2fukog3/P2oCuZAxNR8etE9dSZUxZ6BjtFzuEUX0wRWr37ZP51mT
         N80hyel1OgkI6tt47avTkeY97Ih1XyzBeVu7/TQVwhbLqK0y0yv/WCuhu251C2lLO6Ds
         gKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642553; x=1759247353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pgkmz7Yia2mUyCjlHvvFUXxL30TIgrGepaFfyyHrQY4=;
        b=YrRZZnTppYW0bAtQRZiFzBe+wPRuSnuWn7llYKxZ1NCoyeWflGukVlfTlvLOGHF540
         vxtnq5/2DIG38DHISSE3qD0iBigm/DK3WZ740R6fmwid7DyOsbZ4RC35C0M2CDwbsry/
         1Vy4zh4SI8ozJlyKQmkVxVnk++75u1MB8MIKrMj+W7J5wgOrdq7DC+tXNt62SOLrCAbQ
         GG2j8iXHBdSkHWfHod6my1c517qvXjFDec3GiQn6yLHcgLa7TYqqb1w49W0IxYBGU8Ym
         6xlEyR9SCAlHehjP40eAcWjSLnmxA1KtWwFSHZH2o39OXqixhP8D68P3uY3ipYH4NSnd
         Cuug==
X-Forwarded-Encrypted: i=1; AJvYcCXNN0A0Ld/vsHbOsudITtV/C0hDHSzWQb6Ls0zHipTl83bTFcjHQySISCqYArPQIWWyoKiMoFNv53Qxw0vqB77GlWQHhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKM9qo+z6ddjuyzBy0P4p0Agc6PusKVxdfiH1kGGiM48FdS48B
	bwddLm5NcfMtGK0Q2YSWH1W/KvONxeBUH3wHmPDgovo5N94K4Qr6SZSLG7mhrGsgtuBW2HRPyce
	3qkN7rEXLGbB8CMRreXOOsM52bVr1SWU=
X-Gm-Gg: ASbGncspymgqsiPhevC5pZpgkh45Yxk3W+iwmFnoe72hdZuTtpHiPJ0IGb2HiiobMP3
	Hz343yyK87LqXsgN2ekPp38+PUXSoKlLGHUl6H1DezN5nvsz0uAWuNa32n1x7OBubHzJtkG/4mQ
	b64eWWDZObjAX6+eUzZdv8dt80PhLEPGthq0OB8Y2txXExhR/MnXvP0lkn2OXPAhMZ4EWCauqB6
	2xD1tukhotXsXfakxiasN/cf4U3vsPjAicLjUMf4Q==
X-Google-Smtp-Source: AGHT+IG7o9i2dC43ioTn7wIZWQ8fZEx36/pwtA6UL0v+ENVD318XjL1HnK/qVloz+EM5tn9E+0yFRx7wuB1Epbm1wH4=
X-Received: by 2002:a17:90b:3d0b:b0:31e:cc6b:320f with SMTP id
 98e67ed59e1d1-332a94e17d4mr3928720a91.5.1758642553164; Tue, 23 Sep 2025
 08:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
 <20250923090641.GE836419@horms.kernel.org>
In-Reply-To: <20250923090641.GE836419@horms.kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 11:49:01 -0400
X-Gm-Features: AS18NWAbFH9Ui-fpEfRTHKNs6RYmJyoXlKo6RimozANIMCZAAraSfSWOKbynGIY
Message-ID: <CADvbK_e9w0vW225G++wmHPrBj9d=7MBYXT4i8aeMvZ=Oc-g-ug@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data structures
To: Simon Horman <horms@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 5:06=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Sep 18, 2025 at 06:34:52PM -0400, Xin Long wrote:
>
> > index f79f43f0c17f..b54532916aa2 100644
> > --- a/net/quic/protocol.c
> > +++ b/net/quic/protocol.c
> > @@ -336,6 +336,9 @@ static __init int quic_init(void)
> >       if (err)
> >               goto err_percpu_counter;
> >
> > +     if (quic_hash_tables_init())
>
> Hi Xin,
>
> If we reach here then the function will return err, which is 0.
> So it seems that err should be set to a negative error value instead.
> Perhaps the return value of quic_hash_tables_init.
Good catch!
