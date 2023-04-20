Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF38C15
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Apr 2023 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682007428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xpW87KmDjomF/XnIr+sGvwMjmLo84cGnzstO6sr3FAA=;
	b=Pb6hrb4feIgHjsy2c6GXIgNrVPgR2wUYOUHHlGzeOxvhlAZ2QHUHC8A0/oJeJaZtIJzk6t
	BZHFF6Hoytk9468riKtR+sBcaDU2CrSIZH3zGrYZtegBNw+mkcToFhJ+L348Db1mmsfwKC
	55gQBeVJtQtvTWTAWExckiby/dJfJos=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-7Zeu-GV3NYGULckreOEyBg-1; Thu, 20 Apr 2023 12:17:07 -0400
X-MC-Unique: 7Zeu-GV3NYGULckreOEyBg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-74ab517c14bso365424185a.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Apr 2023 09:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682007426; x=1684599426;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpW87KmDjomF/XnIr+sGvwMjmLo84cGnzstO6sr3FAA=;
        b=TUFoO7EaiBh/QpKa5wvHQLftl1v8I+/FhA+u23J5XyGLvl2UCeq/yjL6i9hNo4lADQ
         6CyCfce+TtPC3tL7o1ZGCIK7FL9bIX6TyXKmUgWhPAsVZkEavUBi5JP7NRPMVQVTd00V
         0fhO71+RPD6CVrL+di0yfSAfYlBD/6gk5wj2OL3MstWw1bWyQQ0F8PtUM2bO7+pGh2fZ
         hXmzcXV/38pMqzXTI9ZFbSKDA5pvSViVANq/7TXE7+oQY0Aqt+Cbv/8ytRGB6B4724Kg
         uFbECAXSPihtLgiBrJgZBgHS5K7zq97fXld4knv0FHB8BgnR2LncgA2eAhe4bPhclZX4
         QfnQ==
X-Gm-Message-State: AAQBX9fE/h+4YfVcswpmjdQQZBs/kACsQBXM4c/CJomeORYaPEp5gLEV
	2GlgqIW4wj3kW63EERqvE0bf+DgwLtVEAjNGeFiRByviihvqN+H6AHXJTUeJE0ifMrL51lfqVb7
	+p5n6k4XDx59HbflLjKNvjs5znGIRrQDO5gkzwZebkis=
X-Received: by 2002:ac8:7f07:0:b0:3db:9289:6949 with SMTP id f7-20020ac87f07000000b003db92896949mr5422096qtk.3.1682007426187;
        Thu, 20 Apr 2023 09:17:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350b10i77sotQOnptkKJ7cSZw1BYnrgnKHDTON0qheXqzSDyYAJ7H+5NiJucFNPeumCOzSTu/1A==
X-Received: by 2002:ac8:7f07:0:b0:3db:9289:6949 with SMTP id f7-20020ac87f07000000b003db92896949mr5422066qtk.3.1682007425929;
        Thu, 20 Apr 2023 09:17:05 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
        by smtp.gmail.com with ESMTPSA id 78-20020a370651000000b0074e15df0941sm545686qkg.38.2023.04.20.09.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 09:17:05 -0700 (PDT)
Message-ID: <85ee133945a9f816ffb9612146a6f835c6d443ec.camel@redhat.com>
Subject: Fedora packages for ktls testing available
From: Jeff Layton <jlayton@redhat.com>
To: linux-nfs <linux-nfs@vger.kernel.org>, kernel-tls-handshake
	 <kernel-tls-handshake@lists.linux.dev>
Date: Thu, 20 Apr 2023 12:17:04 -0400
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

I have a Fedora COPR repo set up with the latest RPC with TLS bits from
Chuck:

    https://copr.fedorainfracloud.org/coprs/jlayton/rpctls/

It has a kernel package (currently based on v6.3-rc7), an updated nfs-
utils package (only needed by the NFS server), and a new ktls-utils
package (0.8 based currently) that I'm working to get into the main
Fedora repos after the kernel patches are merged.

My goal is to keep this up to date until the relevant code starts
landing in the main Fedora repos.

Cheers,
--=20
Jeff Layton <jlayton@redhat.com>

