Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD116AAB
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  5 Sep 2023 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693913419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hx4qaQPNqtGBwUG5sAja1BX1LDrR6Dd11AvXGeJC2bw=;
	b=ayDO+HJnf5Q/7axkHtNqH8PY0mlELG/xvB2ERpZJ9Wm1gOmHvxzf0+5YKe5Ri4ycqR7lFX
	0toHHitXd+cOEUP75xWyBY/2JL+m/fnQTEg2Q6Hd9Y4DXxpqkg62Na2ykpSEnigBfRzLiY
	5GNUwvFOeCG6/fN5jaKF6lS8s5PRAuU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-OMha6SjSM2OSAww5M5-jZQ-1; Tue, 05 Sep 2023 07:30:18 -0400
X-MC-Unique: OMha6SjSM2OSAww5M5-jZQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5222c47ab80so453879a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 05 Sep 2023 04:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913416; x=1694518216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv6f+Bund+aOav8i92hsu3U60yuGizOjIHaAUDH/8ak=;
        b=AYKOJo/i9mndM53tYiqXRK6wY+27JdfCTIW3b5fd6q7RiBc24w9datm3KbB/zxY0L3
         uSJCtKufhJ0XROex4CmuqBD649XgH24ggB69bMe6LsnplIMfUVA7i2CNB20OzZ3bpdkQ
         9uRePGhHLGltkyOQSBCko/QDuNfjg7vPHEo6dvu0R1RATSW2x/M0kOEWGjY3fVRAWHTv
         SvRQpY9uNgNudZrnTJgiYgIN1kZXe/bzOnKdmcwh7qHOO7u52kgm7bwUeDZEGWNidbRA
         +pir+UlEqu1kedH5qb6t/KeDunI/JblY+ygG3fS0TxSwaCyU5ZepwWsEK2oDTCyteINu
         tjrg==
X-Gm-Message-State: AOJu0Yxu74Y3daXoeRir2mI0MxYarBpaanFIFRV6/B4k9PQZUa2IK1Ar
	OE9gue41M5JpZjvEpp6fAXo02bdYpa3WHBQeXSSoDmXK/cAyYKjEmjjTTtcCdhQgzyrHkTBx3U1
	ZuWzZSUUythc6GWgy1PeoOpgVQHrRxJbCPilfZJhXOHU=
X-Received: by 2002:a17:906:7487:b0:9a6:7fee:8253 with SMTP id e7-20020a170906748700b009a67fee8253mr440108ejl.0.1693913416778;
        Tue, 05 Sep 2023 04:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiNZ/eeb/x/e1HwqLSqOWZ8DlHIz5+zghqSNlPK4ZLxyjlxIGDNQ35kvFB4P0eXMF7RRW1lQ==
X-Received: by 2002:a17:906:7487:b0:9a6:7fee:8253 with SMTP id e7-20020a170906748700b009a67fee8253mr440098ejl.0.1693913416485;
        Tue, 05 Sep 2023 04:30:16 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-254-194.dyn.eolo.it. [146.241.254.194])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b0099bd5d28dc4sm7394401ejc.195.2023.09.05.04.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:30:16 -0700 (PDT)
Message-ID: <99247acb1d2769f6d76f10c26c6e19e3de33b05a.camel@redhat.com>
Subject: Re: low pending handshake limit
From: Paolo Abeni <pabeni@redhat.com>
To: Moritz =?ISO-8859-1?Q?Wanzenb=F6ck?= <moritz.wanzenboeck@linbit.com>, 
	Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 05 Sep 2023 13:30:15 +0200
In-Reply-To: <QT8I0S.51IG54TEPYUC3@linbit.com>
References: <IIOG0S.DV0B3MDEVDQF1@linbit.com>
	 <90B2279F-F69B-43D2-B809-006519825D62@oracle.com>
	 <QT8I0S.51IG54TEPYUC3@linbit.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-09-05 at 10:56 +0200, Moritz Wanzenb=C3=B6ck wrote:
> On Mo, Sep 4 2023 at 15:13:25 +0000, Chuck Lever III=20
> <chuck.lever@oracle.com> wrote:
> > Hi-
> >=20
> > >  On Sep 4, 2023, at 8:39 AM, Moritz Wanzenb=C3=B6ck=20
> > > <moritz.wanzenboeck@linbit.com> wrote:
> > >=20
> > >  Hi all,
> > >=20
> > >  I'm currently working on enabling TLS support for DRBD, so I'm very=
=20
> > > keen to use the handshake infrastructure.
> >=20
> > I'm happy to see the handshake infrastructure get more usage.
> >=20
> >=20
> > >  During testing I noticed that the allowed number of pending=20
> > > handshakes is quite low. This seems to stem from the following=20
> > > calculation:
> > >=20
> > >  /*
> > >  * Arbitrary limit to prevent handshakes that do not make
> > >  * progress from clogging up the system. The cap scales up
> > >  * with the amount of physical memory on the system.
> > >  */
> > >  si_meminfo(&si);
> > >  tmp =3D si.totalram / (25 * si.mem_unit);
> > >  hn->hn_pending_max =3D clamp(tmp, 3UL, 50UL);
> > >=20
> > >  Which, for the typical VMs I use for testing (1Gi RAM), ends up=20
> > > being just 3 handshakes. The limits in general seem too low also in=
=20
> > > the best case. If a node just booted, and would start connecting to=
=20
> > > all configured DRBD devices, we could easily hit even the upper=20
> > > limit of 50.
> > >=20
> > >  Also the calculation used doesn't seem to make too much sense to=20
> > > me. It allows more handshakes when using a smaller page size?
> > >=20
> > >  Would it be possible to increase the number of pending handshakes?
> >=20
> > IIRC I added the dynamic computation in response to a review
> > comment from Paolo (cc'd). I think the limit values are arbitrary,
> > we just want a sensible cap on the number of pending handshakes,
> > and on smaller systems, that limit should be a smaller value.
> >=20
> > It's true that a handshake can fail if that limit is hit, but
> > the consumer ought to be able to retry after a brief delay in
> > that case.
> >=20
> > I am open to discussing changes if retrying proves to be a
> > challenge.
>=20
> Thanks for the explanation. Actually, retrying is not an issue. I was=20
> initially
> vary, I thought the requests remained pending until the handshake was=20
> complete.
> Looks like I was wrong about that, it's just pending until the netlink=20
> message
> is sent to the user space utility.

For the records, if similar issues should some real issue raise again
from small limits, I think it should be possible to expose some user-
space tunable (sysctl? socket option? both?) to let the application
adjust the limit.

Cheers,

Paolo

