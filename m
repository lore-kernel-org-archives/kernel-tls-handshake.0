Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B818F55
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Sep 2023 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695286777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4TZou60+SKYzdbWYogj65SYgMTBZDPG5rM/GAK2kd4=;
	b=e9gOuxEukOYuShj5wH9L16Ya53JvwdM4KikKtJ/wHbDM096+L7/YsDQ+MBzl/B06T1m2aQ
	EwDnLt68qHt1gjgZdTWADSx/kxqN5RU3i56esNHojLZS7h4t0oGQM8hB9CR0ma78OZfcXc
	A1KGWSdHQv/nMqGcwyIMu+p5AojS2SQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-L3YfqkF3NhWmnEPLYL28HQ-1; Thu, 21 Sep 2023 04:59:36 -0400
X-MC-Unique: L3YfqkF3NhWmnEPLYL28HQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae56805c41so18100266b.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Sep 2023 01:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695286775; x=1695891575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4TZou60+SKYzdbWYogj65SYgMTBZDPG5rM/GAK2kd4=;
        b=ZiXvXUFcbS6BDxfYXiMy6Utm2mmaHNnu7YEqZdDSKQjJSdgjG1UsMpF3hLqgGl2U+U
         f4d1oMI+1syK7N4DlkNsWSvDhN01tdA4x+xYQg96oSnDHKKYCeQIiED3txiOGI6HK2Hq
         8C84w5XXztQ3d20zx3kKpKbi30Xs6V78oIj+vTzOPainnTwHfmCuamIc86f2+i5OfPCu
         swoDOXwSFh/OwbJYvhw57qWU0Lo/WViQSX+EVbRt1Vn7L3Wz5hjyEBk9y8C4FvFJFHPk
         +nLtMZaNXHWuEOSYikvBIhyTYsWG4qBiu1cVvW4qFk7iGz2SE0nVPXEf3K+aIJkuKHk7
         JUkQ==
X-Gm-Message-State: AOJu0YwK4a2KnAIXjwHmhd/t9xGp4pkcrSgH0ULbYZWHHV9rNY/A0D5S
	3p5REkEiPbV0AlFaswd+FhSO4Nz4QfXnc1kJX2AwSn3YPl/HgIKVSNDTf12O6yBIYV1ifHTY0uk
	VlHJoD5Av2zF4Qng8Z5W2Xo40z/JfFRS35Ec=
X-Received: by 2002:a17:907:9512:b0:9ae:4492:df34 with SMTP id ew18-20020a170907951200b009ae4492df34mr3040555ejc.6.1695286775007;
        Thu, 21 Sep 2023 01:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGlmeJnWZ+sn8kzSxDMyc1NVykwD3pK7V0gjvb5RmYbzE0KhGvzw5vrHFI35DI5C5iXlWVlg==
X-Received: by 2002:a17:907:9512:b0:9ae:4492:df34 with SMTP id ew18-20020a170907951200b009ae4492df34mr3040545ejc.6.1695286774642;
        Thu, 21 Sep 2023 01:59:34 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-251-4.dyn.eolo.it. [146.241.251.4])
        by smtp.gmail.com with ESMTPSA id lw13-20020a170906bccd00b0098884f86e41sm707189ejb.123.2023.09.21.01.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 01:59:34 -0700 (PDT)
Message-ID: <b5db3535a15b7e1bf89724d934fb880d292913cd.camel@redhat.com>
Subject: Re: [PATCH v1 0/2] Fix implicit sign conversions in handshake upcall
From: Paolo Abeni <pabeni@redhat.com>
To: Chuck Lever <cel@kernel.org>, netdev@vger.kernel.org, 
	kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Date: Thu, 21 Sep 2023 10:59:33 +0200
In-Reply-To: <169515283988.5349.4586265020008671093.stgit@oracle-102.nfsv4bat.org>
References: <169515283988.5349.4586265020008671093.stgit@oracle-102.nfsv4bat.org>
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

Hi,

On Tue, 2023-09-19 at 15:49 -0400, Chuck Lever wrote:
> An internal static analysis tool noticed some implicit sign
> conversions for some of the arguments in the handshake upcall
> protocol.

This does not apply cleanly to -net nor to -net-next, and the lack of
the target inside the subj is confusing. I guess this is for your devel
tree???

Cheers,

Paolo

