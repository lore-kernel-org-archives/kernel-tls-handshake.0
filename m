Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1131FA4
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  5 Sep 2023 08:56:24 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a645e54806so281044266b.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 05 Sep 2023 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1693904182; x=1694508982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udFpCeZoOU7dR6YWb2DH47TXe0YWlvLLF07A9kG0dEM=;
        b=CB7PmrR06Z0S8dkQyuxc/31UOOthMPll/xSexALNlGUEXbGImNq0hkand0NDug6mBw
         8Ns3cpTk3tICaVcV4SytkaXWPURGVtjrrxNtoZmu5oPDmwtzXH9LX5BfOuUSN5uOAd5b
         a65u5561t4E9IR6lYwlzHnyAJSZ45BWcxarjmGzBlskIZTmYbnL1eeiFew05Z7/jyPnI
         0lCTy4I15pPopJMFh/T1WIDZEuM5FcT7PnjTg0ue/NA/vL2vcz8n8+JpY+YoRgkyeuLo
         W2Dgo6vjN0wFFJEtuoXhgwd+HE5JxYPjzcfjkslvE/oaME1WPDo5NJaRDRBK1T7tQjtJ
         UtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693904182; x=1694508982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udFpCeZoOU7dR6YWb2DH47TXe0YWlvLLF07A9kG0dEM=;
        b=cW3bqF/W7BVQFlrX0oCmKkceL/6gRKgHe3YaKe4lY9tWVwJWp1NZsnMIr1s0UAkpdb
         An/g8WFzX18LuwIFFMlMHma/WyDIEw0t36Os0laxit05e3gK23Uu52et9Vplm2/StIks
         OxGahj22NeYXHt/W7uKNGIohMWewrAhrRKBm1jyQ+TU28k7cpJcaU8mrvAiH3T/jcyy2
         b+hfPYJDVTQ9HxNHMPBqSOt+VMmPOkHV+27GoUmcnRsoAen/IS6B+ooWBZpbJL1lyENg
         sEr/CpmznI9mcsenfD6MZDBEqrQktifbULR+16fIeOiTucDSeU9K5GJt1CHsBGsGcitT
         2ViA==
X-Gm-Message-State: AOJu0YzfjVIZj5g5E9/2+Fm8/wLrNdYYWKPHymQZML0adKZ/WJHTbF2l
	haszfqRKKHfeWWxqkbPrSW0oaw==
X-Google-Smtp-Source: AGHT+IE0ISCi7lbfaDdplWn8czJKr84Cp7ccyIr3d6qdj7Vyf8AnqBH4pjLjK13Hxspy3KKNTJvSAQ==
X-Received: by 2002:a17:906:ef8b:b0:99d:fd27:b38d with SMTP id ze11-20020a170906ef8b00b0099dfd27b38dmr8840659ejb.70.1693904182128;
        Tue, 05 Sep 2023 01:56:22 -0700 (PDT)
Received: from x1-carbon (2a02-8388-1ac6-6200-94b0-27b3-1dd9-8373.cable.dynamic.v6.surfer.at. [2a02:8388:1ac6:6200:94b0:27b3:1dd9:8373])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b00988e953a586sm7288931ejb.61.2023.09.05.01.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 01:56:21 -0700 (PDT)
Date: Tue, 05 Sep 2023 10:56:14 +0200
From: Moritz =?iso-8859-1?q?Wanzenb=F6ck?= <moritz.wanzenboeck@linbit.com>
Subject: Re: low pending handshake limit
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>, Paolo Abeni
	<pabeni@redhat.com>
Message-Id: <QT8I0S.51IG54TEPYUC3@linbit.com>
In-Reply-To: <90B2279F-F69B-43D2-B809-006519825D62@oracle.com>
References: <IIOG0S.DV0B3MDEVDQF1@linbit.com>
	<90B2279F-F69B-43D2-B809-006519825D62@oracle.com>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Chuck,

On Mo, Sep 4 2023 at 15:13:25 +0000, Chuck Lever III=20
<chuck.lever@oracle.com> wrote:
> Hi-
>=20
>>  On Sep 4, 2023, at 8:39 AM, Moritz Wanzenb=F6ck=20
>> <moritz.wanzenboeck@linbit.com> wrote:
>>=20
>>  Hi all,
>>=20
>>  I'm currently working on enabling TLS support for DRBD, so I'm very=20
>> keen to use the handshake infrastructure.
>=20
> I'm happy to see the handshake infrastructure get more usage.
>=20
>=20
>>  During testing I noticed that the allowed number of pending=20
>> handshakes is quite low. This seems to stem from the following=20
>> calculation:
>>=20
>>  /*
>>  * Arbitrary limit to prevent handshakes that do not make
>>  * progress from clogging up the system. The cap scales up
>>  * with the amount of physical memory on the system.
>>  */
>>  si_meminfo(&si);
>>  tmp =3D si.totalram / (25 * si.mem_unit);
>>  hn->hn_pending_max =3D clamp(tmp, 3UL, 50UL);
>>=20
>>  Which, for the typical VMs I use for testing (1Gi RAM), ends up=20
>> being just 3 handshakes. The limits in general seem too low also in=20
>> the best case. If a node just booted, and would start connecting to=20
>> all configured DRBD devices, we could easily hit even the upper=20
>> limit of 50.
>>=20
>>  Also the calculation used doesn't seem to make too much sense to=20
>> me. It allows more handshakes when using a smaller page size?
>>=20
>>  Would it be possible to increase the number of pending handshakes?
>=20
> IIRC I added the dynamic computation in response to a review
> comment from Paolo (cc'd). I think the limit values are arbitrary,
> we just want a sensible cap on the number of pending handshakes,
> and on smaller systems, that limit should be a smaller value.
>=20
> It's true that a handshake can fail if that limit is hit, but
> the consumer ought to be able to retry after a brief delay in
> that case.
>=20
> I am open to discussing changes if retrying proves to be a
> challenge.

Thanks for the explanation. Actually, retrying is not an issue. I was=20
initially
vary, I thought the requests remained pending until the handshake was=20
complete.
Looks like I was wrong about that, it's just pending until the netlink=20
message
is sent to the user space utility.

Best regards,
Moritz


