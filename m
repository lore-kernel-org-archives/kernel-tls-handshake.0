Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313E7E
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  8 May 2023 05:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683525101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLTbeT6jM0D3RVqr2zdpg7Y25T3gfeDdrcPX2lOqsbs=;
	b=MFbXzVp8SgC1xI8qRjocy3MCbEAX0LCiIhHXD1/yoe1PEx5H6x9u1IkK/KuAJBTwT1QlEv
	2vTo20PwMj+CbmNMtRARHjP9bdinlHWkc0Ri2IQWLNrPb5W0WToYqo8ajPggdh//LdXMYs
	ejaeO7lwj9OgXC0o7IGJPbjqfAvXg1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-h68X1-o8OO-nKcuUgKQeAg-1; Mon, 08 May 2023 01:51:40 -0400
X-MC-Unique: h68X1-o8OO-nKcuUgKQeAg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f18a51f6ebso3989645e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 07 May 2023 22:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683525099; x=1686117099;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLTbeT6jM0D3RVqr2zdpg7Y25T3gfeDdrcPX2lOqsbs=;
        b=anlUxzI8I8ZeU3UKnnBAmlT4lvy/XTHw5GeP5vBg+MNvPCYGWzujGYRJ5/Y8K/1VyT
         lANvBxf2fJAnk5xqXLoO6OIoR47n95GgiGD/QGpWnhhKi02Gg2rwE11c5/3ei3YOmrR1
         B3VT07CxOw2PU4Nmwk/+a+6P+Z8Uli0kk1pT3wDJmQxgVsBhC9SwOd3huR/iNsAxXSgk
         4cAdDeh6pi0StscBDYrsJWXevD0s2dYMRbA2rTm0vXxsgY8k1suK7HLCjxWMa8/FdGH0
         yK479rhxz3Q+FYF95gtA+mumiHyE3JzU4jVhsSnNtjFn9N0Fz2FXcWeo/9oVAcvLwDvM
         NQrQ==
X-Gm-Message-State: AC+VfDw+4lPNoAop2SpmujSklpAFylWNAZ3NPHCtv29sA5Q75rtPIAm4
	1XBK2d8lDlOujHE45JQRjFB45Q7v+Drvn6tnvudlCRJqz+RUrX1h7vpn2BFCAWJds8ZBbfZX+Oq
	WfooR41SsMMqpuq0aDKb6bDC2TETrLm4DU+A=
X-Received: by 2002:a05:600c:6020:b0:3f4:2297:f263 with SMTP id az32-20020a05600c602000b003f42297f263mr2347836wmb.0.1683525099290;
        Sun, 07 May 2023 22:51:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EJJzFIVde559fQuvadWrh3eK1CRiflB/aYXJl0mZli70VE7/t+Atm1oTInJ/O0P9bIfEeIQ==
X-Received: by 2002:a05:600c:6020:b0:3f4:2297:f263 with SMTP id az32-20020a05600c602000b003f42297f263mr2347831wmb.0.1683525098996;
        Sun, 07 May 2023 22:51:38 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-175.dyn.eolo.it. [146.241.244.175])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003f41bb52834sm6097334wmi.38.2023.05.07.22.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 22:51:38 -0700 (PDT)
Message-ID: <1809df1d8507120dbca5c500ec00784478ec701f.camel@redhat.com>
Subject: Re: [PATCH 0/5] Bug fixes for net/handshake
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, Chuck Lever <cel@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	dan.carpenter@linaro.org
Date: Mon, 08 May 2023 07:51:37 +0200
In-Reply-To: <20230505164715.55a12c77@kernel.org>
References: <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
	 <20230505133918.3c7257e8@kernel.org>
	 <ZFWOWErJ6eR/RX/X@manet.1015granger.net>
	 <20230505164715.55a12c77@kernel.org>
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

On Fri, 2023-05-05 at 16:47 -0700, Jakub Kicinski wrote:
> On Fri, 5 May 2023 19:16:40 -0400 Chuck Lever wrote:
> > On Fri, May 05, 2023 at 01:39:18PM -0700, Jakub Kicinski wrote:
> > > On Thu, 04 May 2023 11:24:12 -0400 Chuck Lever wrote: =20
> > > > I plan to send these as part of a 6.4-rc PR. =20
> > >=20
> > > Can you elaborate?  You'll send us the same code as PR?
> > > I'm about to send the first batch of fixes to Linus,
> > > I was going to apply this series. =20
> >=20
> > Since I am listed as a maintainer/supporter of net/handshake, I
> > assumed I can and should be sending changes through nfsd or some
> > other repo I can commit to.
> >=20
> > netdev@ is also listed in MAINTAINERS, so I Cc'd you all on this
> > series. I did not intend for you to be responsible for merging the
> > series. We'll need to agree on a workflow going forward.
>=20
> Let me talk to DaveM and Paolo -- with NFS being the main user
> taking it via your trees is likely fine. But if it's a generic TLS
> handshake and other users will appear - netdev trees may be a more
> natural central point :S DaveM and Paolo are more familiar with
> existing cases of similar nature (rxrpc?)..

Really, I' not ;)

My guess is that net/handshake is going to be dependent more on core
networking changes than anything else. If later developments will
require/use/leverage a new core net helper, it would be quite straight-
forward going trough the netdev trees. Otherwise such changes will
require extra coordination and/or an additional RTT WRT kernel
releases.

All the above very much IMHO ;)

/P

