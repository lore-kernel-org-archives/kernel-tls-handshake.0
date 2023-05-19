Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F3411192
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 19 May 2023 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684510961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt+/cJ4nWjCmvpQkJFUy4G/NdHR1IPGRqyictYqkQog=;
	b=TsbQPvoTtpFd6/LCYeIP7L1cK4JPyYzBfq9gr7QJQGpj89JLQ2Pa4HsemAqSgssqiBJJ6y
	QqRhNpNF3ivbhV2qyHraYHgNmi0K2b+JDiiUMkh4+wVSNJwCa35rAoZXabE6Jcg0QkRs/G
	x2VhJ+NhpO1bzcc1BsPg3OjeWxWifrE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-6X5uUgQNMWCfXIuQgez2Ig-1; Fri, 19 May 2023 11:42:37 -0400
X-MC-Unique: 6X5uUgQNMWCfXIuQgez2Ig-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f08900caadso5384615e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 19 May 2023 08:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684510956; x=1687102956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jt+/cJ4nWjCmvpQkJFUy4G/NdHR1IPGRqyictYqkQog=;
        b=eGEhnblI/vWdFMXaCZ9bIBkROiv+gx/SNpyaE1lb5Yq43CffHJ/xv/DCHYVRQtvVXy
         Bipjlv3KCQjrMzJCu0j1fOKG1ByXXJDGCSPv+hzU0qCueKRH9rpqu4fT+onQKxafdzlU
         EFhXBUKZQdZGkCnEa9+wfnwuR+HLB/EdHXxD1LGdviW81cVecIbMWrcPjaqftEV2+VvZ
         cBLZjP69z9Tj/jd70Vz22vy3G6xEx9itHLK5u4vUk0VTrca3kn1epWAx3lpHHLgz2dhc
         Lhvg/dBD7rWBqMN7dLSIqyGtZWhNo9urrdFmhcH7VHFw5rzu3X/4cQ24G9Z0CbbrOa1B
         z1tA==
X-Gm-Message-State: AC+VfDwYHdaR3KcHQ2e/pfFE67vgj/rs2SSu6biOUd4O+ZuksoOeVV3N
	bIkaR4Ar3IwOgMdMLY+LRRAqPCjAJBqa4yZg5Cs174Sg6miqhXX3cNZpeZOmv3f1Bg8P8TrwCHS
	gLLhkb6Da/Do38rXRbGrVf/MmodvFXMBkepk=
X-Received: by 2002:a05:600c:1d0e:b0:3f4:2297:f25b with SMTP id l14-20020a05600c1d0e00b003f42297f25bmr2158039wms.0.1684510956774;
        Fri, 19 May 2023 08:42:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4N9GJzZz8wHS97yA0R3l/hkzXH2gTECzf/kabyPfHR/tZ+jyEYNC24niZl0bnehX1oxKHY0A==
X-Received: by 2002:a05:600c:1d0e:b0:3f4:2297:f25b with SMTP id l14-20020a05600c1d0e00b003f42297f25bmr2158026wms.0.1684510956416;
        Fri, 19 May 2023 08:42:36 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-235-104.dyn.eolo.it. [146.241.235.104])
        by smtp.gmail.com with ESMTPSA id n8-20020a1c7208000000b003f50876905dsm2811299wmc.6.2023.05.19.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 08:42:36 -0700 (PDT)
Message-ID: <586f34837914765c25bac131438cd83609c9b6d4.camel@redhat.com>
Subject: Re: [PATCH] net/handshake: Squelch allocation warning during Kunit
 test
From: Paolo Abeni <pabeni@redhat.com>
To: Chuck Lever <cel@kernel.org>, netdev@vger.kernel.org, 
	kernel-tls-handshake@lists.linux.dev
Cc: Linux Kernel Functional Testing <lkft@linaro.org>, Chuck Lever
	 <chuck.lever@oracle.com>
Date: Fri, 19 May 2023 17:42:34 +0200
In-Reply-To: <168450889814.157177.678686730886780464.stgit@oracle-102.nfsv4bat.org>
References: <168450889814.157177.678686730886780464.stgit@oracle-102.nfsv4bat.org>
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

On Fri, 2023-05-19 at 11:09 -0400, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
>=20
> The "handshake_req_alloc excessive privsize" kunit test is intended
> to check what happens when the maximum privsize is exceeded. The
> WARN_ON_ONCE_GFP at mm/page_alloc.c:4744 can be disabled safely for
> this allocator call site.

Should such flag being added to the relevant entry in
handshake_req_alloc_params?

Thanks!

Paolo


