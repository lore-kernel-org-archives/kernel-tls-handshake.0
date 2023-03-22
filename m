Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4023AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679476005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQ+VJXd7ZyBQHEINWDDR/nupbUy4rpNkecWfxjExf9M=;
	b=RsGGsP38863hHDMNFQI9+Xvn3E+wBLN9TFNBkMyKz3xKEU0SkMvapXg7gyDCXTgnyBwxKu
	4VHLGJD9qYYVG8J61bqEOmbWiPj19kgq+5L9ptD41Er1Bn6tfdfdbxZV91I+PrLVuFBDSd
	t9UsMIN3f/+uHYq72AJrsd76yt54e7k=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-qD3AdAd_MNyfbRx8oB6lbQ-1; Wed, 22 Mar 2023 05:06:44 -0400
X-MC-Unique: qD3AdAd_MNyfbRx8oB6lbQ-1
Received: by mail-qt1-f200.google.com with SMTP id c14-20020ac87d8e000000b003e38726ec8bso2047150qtd.23
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 02:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679476003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MlHDqfGbslAe9msaTatiN+17p55n60LjBLi0mnLeSo=;
        b=TRyLQCVtWUGQNWl2YXdf8uq7X8xeVh5o8GkvY1QrjEfEshcpGEXMvK220O83m2jOgY
         SbuSgDdekmY8RT+wjfXjrQOhUSnm6M3aKAkSMZNUDoPsXw7EzX6z+6jCKey24sEig5+6
         MejPANiIz/G8JdcQiW2xIt6P8CS6wUHOpu2lQqWZfTiGNptkqww8FebvNdt/+KZkozCV
         0PFpgZdjBDE8/RnIOYoeSQf1KZI9MruFhR6jpEbzd+HGWgf8pZTaYRyx4llMnc8Fm4yh
         JEiK5joVGNp2D+qfkM7trf+7byab9tXcgJ4USIoz61uRqQCiPuVcMktHOQpsMB3MHAVQ
         9R+g==
X-Gm-Message-State: AO0yUKW6TsqEqayhQcdkKMJe8m/z8y/7U29dHXgnYwqt8VbJauw20ycy
	vUEd11UojrxCanLga4kF42CQYZlcxzuyoAU7RMBdEdTY0HdXuT6gqcgrK/s54n/MfMrKbhmj9wZ
	qX+kHgwqtpT+kN1VMVV0cDAD66I/UZQzj/20tTeLSfzw=
X-Received: by 2002:a05:6214:5093:b0:5a9:ab44:5fdf with SMTP id kk19-20020a056214509300b005a9ab445fdfmr8701207qvb.0.1679476003329;
        Wed, 22 Mar 2023 02:06:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set+3Db3BEp45bS/UBFNKv/x87AWA9BOyr2ex9r1mT8G7M4NEeoWmDR67cxCj76ccwFZdVl3P2g==
X-Received: by 2002:a05:6214:5093:b0:5a9:ab44:5fdf with SMTP id kk19-20020a056214509300b005a9ab445fdfmr8701185qvb.0.1679476003041;
        Wed, 22 Mar 2023 02:06:43 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-168.dyn.eolo.it. [146.241.244.168])
        by smtp.gmail.com with ESMTPSA id u23-20020a37ab17000000b0071f0d0aaef7sm7581331qke.80.2023.03.22.02.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:06:42 -0700 (PDT)
Message-ID: <b2ef2852d49ffa443c1f56ab78c5872afa5e9ef8.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
From: Paolo Abeni <pabeni@redhat.com>
To: Chuck Lever <cel@kernel.org>, kuba@kernel.org, edumazet@google.com
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, 
	john.haxby@oracle.com
Date: Wed, 22 Mar 2023 10:06:40 +0100
In-Reply-To: <167915629953.91792.17220269709156129944.stgit@manet.1015granger.net>
References: <167915594811.91792.15722842400657376706.stgit@manet.1015granger.net>
	 <167915629953.91792.17220269709156129944.stgit@manet.1015granger.net>
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

   On Sat, 2023-03-18 at 12:18 -0400, Chuck Lever wrote:
> static bool __add_pending_locked(struct handshake_net *hn,
> +=09=09=09=09 struct handshake_req *req)
> +{
> +=09if (!list_empty(&req->hr_list))
> +=09=09return false;

I think the above condition should be matched only an bugs/API misuse,
am I correct? what about adding a WARN_ON_ONCE()?

Thanks!

Paolo

