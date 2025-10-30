Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B261EF39E
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Oct 2025 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833635; cv=none; b=mxKQ+NrLITqQpOnilBxtz3lI2igGBGkN7SQpLzi/W/Y4NXv2O49tjV/0x5wOK9i5AMB8yAuhStqQEULaHK/UgawMnv2kr9yERo2jAkTnVAcUzSnBnuujweJU/SntNSu+3u8XVzSqhkv3lXTzt7TJa1AhdqQ2KCjKQqpuO4o96wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833635; c=relaxed/simple;
	bh=/T40+ChYVbQJjlFEBDtmTJc9Zvc0liM/GgUzEfzM00E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLPw+4quHullGr/oibPoQCLx6qYRKfdF1lWXSWPbnPMtX+dTKj4h2/ws2yiXuemay6ihgcGzbNyRBeW4Mc01LMua4ObqMljUTk4LQ8UWewlR3xIsnTjPBmtj7uxxkOHO9YqozVvT10aNldqVo3SXJw0RC//vkijyHYyZwcgpR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlimrrfs; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlimrrfs"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so1012831a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Oct 2025 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761833634; x=1762438434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GwPV67fM5V5sQ6RejEBhGju2a3kknsbjfFsnKSUOpA=;
        b=hlimrrfsF7x/2u9F8WvJPnT+vZ7ourUGNTE+PgRj51muaNCy/qP6dZU5ESgOeA0UHP
         /aiBVI57Zvc5ftZXNGZrF9eQHHrnHWMNgB0lvJ0cdyy9faY5702T+ZouLNElWLxbH4fX
         QXDDiBiI9hZLclNMx78zX9+d3FsTBkpdbfhegjaYCaFwni9F+a7KjoOmvcaWCze9k4g8
         fqUVmKIYjMlOhaoFS7GmZpb1RiX4hd48TJ5LGPOf9FNJSsTN+hT2xaETEtszF+eYT8yT
         br2lB7llmjA4Su2RygoFC7fZ6sH8C16LCs8Pg6N333SLz2lQ1xoQuEbNYDUeSc83WV3x
         aOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833634; x=1762438434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GwPV67fM5V5sQ6RejEBhGju2a3kknsbjfFsnKSUOpA=;
        b=OQng3qaGxgavQR/40Ph93ugDQM35lMz7QBpOHOeTfUnFe4oed+1ahOpos7QSMrMfHB
         ZB3dLxgEQZ4Pu+CGCQdOPea4ZMA8WC4QWktXx6tBNQ+bn0YJ0BJDCckIsDI3X7Bee/TV
         tVRafupGMqek9gJSEdDKABXBOMDigYBcTVuzLTUvE961ZMgz6ugC1nO6Ppy0gSYWjfkD
         e3LCzmz/O4zbn+k3vYpb7yVCXPN7ixAtwQfMUWLI3GpwiefNUlj8CIVzut5bY44hrCW9
         +G2Oo40vvuaa7z7gBDtnMAmgR2imT3Fc0aFZ/XhwVZ9PZ1uYxUMLaNLvWKyz0YUUBQOr
         c3DA==
X-Forwarded-Encrypted: i=1; AJvYcCUbdtcbEfAVkVxIi4d4ghpu6Mh86/LPj2hR1TLGmIr2NlKcfGrSa1l8QdUR17ZteCilpb7OmWDBbk3FBG+VQMto6mDzXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDOP6CZOnASkfzy5yc2sC8TcRXTn4r8s/c/OvQF73Gi7w2cj1e
	YU4a/lpYlH4CORmCi4Gd68s6vMtlPIeQ6YXIOaKB2ogKjV9qAdWoUK4Nclfg/Taqjk1l7vyxBku
	GkdEE5trXqjLJNfLPb3Rcf9TFd37j/sE=
X-Gm-Gg: ASbGncsBPcOJqWBlgfgln1Fsm9bDljXOGOBUMSviQGJS93zR2X9M0mrbS99I24tBWAx
	+HBXxL8IzD2wEyg9z/q9vkskE5oAqD6CUfk0+UawynsXysNBBRHM/PncLH77uoxg+pRsKmc8k8U
	t6H18eq6D4hFSEyBbJZDcWB3uEUz5dbjsd8l20QcriMZA4LZzpb05ks0WNo01ggdPB4Cn0EG8B6
	LCwWKvJriZ/O5UVBQsX/bxlOO9ZO8GZulo7YbF+yf7sCzzK0ehQR85B15Qy8kJmm0wnlYzOuhDS
	Ye9Lj5O6C5vrLY2q1Q==
X-Google-Smtp-Source: AGHT+IGQeZf3/xDx9PN4GOOFJoj/NMC2uHC5MkG58KIcW+QZIEsnabkEgg4aAn3sUpRS5Lsc0ZRHkz4/xmiVriMCfJo=
X-Received: by 2002:a17:903:2349:b0:267:bd8d:19e with SMTP id
 d9443c01a7336-294dee35d83mr74289795ad.22.1761833633536; Thu, 30 Oct 2025
 07:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org> <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
 <b9300291-e828-47fa-b4d1-66934636bd7b@samba.org>
In-Reply-To: <b9300291-e828-47fa-b4d1-66934636bd7b@samba.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 30 Oct 2025 10:13:40 -0400
X-Gm-Features: AWmQ_bkH59qmzfsesvc02GCEqCTGnpE58Lv-Efw4wO4JNI_ID0XqW9PU-fQIxTI
Message-ID: <CADvbK_f=E11=dszeJos98RvBY5POXujgT0dFo-LG6QQuGW20Kg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
To: Stefan Metzmacher <metze@samba.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
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

On Thu, Oct 30, 2025 at 7:29=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 29.10.25 um 20:57 schrieb Xin Long:
> > On Wed, Oct 29, 2025 at 12:22=E2=80=AFPM Stefan Metzmacher <metze@samba=
.org> wrote:
> >>
> >> Hi Xin,
> >>
> >>> This patch lays the groundwork for QUIC socket support in the kernel.
> >>> It defines the core structures and protocol hooks needed to create
> >>> QUIC sockets, without implementing any protocol behavior at this stag=
e.
> >>>
> >>> Basic integration is included to allow building the module via
> >>> CONFIG_IP_QUIC=3Dm.
> >>>
> >>> This provides the scaffolding necessary for adding actual QUIC socket
> >>> behavior in follow-up patches.
> >>>
> >>> Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
> >>> Signed-off-by: Xin Long <lucien.xin@gmail.com>
> >>
> >> ...
> >>
> >>> +module_init(quic_init);
> >>> +module_exit(quic_exit);
> >>> +
> >>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET) "-proto-261");
> >>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET6) "-proto-261");
> >>
> >> Shouldn't this use MODULE_ALIAS_NET_PF_PROTO(PF_INET, IPPROTO_QUIC)
> >> instead?
> >>
> > Hi, Stefan,
> >
> > If we switch to using MODULE_ALIAS_NET_PF_PROTO(), we still need to
> > keep using the numeric value 261:
> >
> >    MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261);
> >    MODULE_ALIAS_NET_PF_PROTO(PF_INET6, 261);
> >
> > IPPROTO_QUIC is defined as an enum, not a macro. Since
> > MODULE_ALIAS_NET_PF_PROTO() relies on __stringify(proto), it can=E2=80=
=99t
> > stringify enum values correctly, and it would generate:
> >
> >    alias:          net-pf-10-proto-IPPROTO_QUIC
> >    alias:          net-pf-2-proto-IPPROTO_QUIC
>
> Yes, now I remember...
>
> Maybe we can use something like this:
>
> -  IPPROTO_QUIC =3D 261,          /* A UDP-Based Multiplexed and Secure T=
ransport */
> +#define __IPPROTO_QUIC 261     /* A UDP-Based Multiplexed and Secure Tra=
nsport */
> +  IPPROTO_QUIC =3D __IPPROTO_QUIC,
>
> and then
>
> MODULE_ALIAS_NET_PF_PROTO(PF_INET, __IPPROTO_QUIC)
>
> In order to make things clearer.
>
> What do you think?
>
That might be a good idea to make things clearer later on.

But for now, I=E2=80=99d prefer not to add something special just for QUIC =
in
include/uapi/linux/in.h.  We can revisit it later together with SCTP,
L2TP, and SMC to keep things consistent.

Thanks.
