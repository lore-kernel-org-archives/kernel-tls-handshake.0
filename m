Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8C3644B4
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Oct 2025 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767859; cv=none; b=eh3wBRL6yVO4KaMrTJek4ZQ+pcbZzUMRZ2+ic0/mCcz4+Pf4q+ZAjztgs5cfakCg5L0Lc+ywy6/bORQ3CQQgh0vk559FzZ/dfwgrgq6z21AHuHudFpJNsWdpn2+dr7JUX9QXuZoRTe86UacYjsAa+mtr7wn3N/Ai357peKtnbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767859; c=relaxed/simple;
	bh=+rNIfhn612wSnJwTsWfa3rI2oXBKL1DitnLLKvmVa24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyLH6B6S/vh+w70FQKLzIc/iIfjLuEYtIlZP/Z4l0d7+mCpKwyn4l32qKGNpAQvC8y73iV0XXRTEkCaTJwugzmXetnFR9k3UrEQzjxHk3xM2PTHjCbg61aSquGptRXah58mAlvUnY65QH1hMO72QbePGU3If/HgPte4Kxy8dGA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDeo8YiJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDeo8YiJ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so304230b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Oct 2025 12:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761767856; x=1762372656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5AE88Ciiu4y1L+Whuiba6HLMWI7gvS/KpyPblrUqXI=;
        b=VDeo8YiJJX4kr3Vc26c9SlsRWMoGLKPcYtUbHX6XKOvhAOafODHDL5vOqmjavY4DX9
         tWVMjLhim3Lhw85jHlyB19MKBH9fVHUXl0jQIHaL/SAFyc94QO3/vqRciz+gUXV4/T/d
         NrRmtOlZeNUjdk8YZa9ds2BXby+5KuTOXrNr1fEu1Jwm+veN3/crRzjFS3ZKXfp+Kbyi
         RFUabWgwwdqrQeHm05rBF0Hg/7yggCrROqZSOJMLrcIDQoHN255F4B85olxFffBSIkyM
         xeB/zD4Fuk6E6Ctfjz1xlmB0kTV9cTtCXuNEaSFRgsIgkwxQWM+fZAdmHhZFLthUGhL1
         prmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761767856; x=1762372656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5AE88Ciiu4y1L+Whuiba6HLMWI7gvS/KpyPblrUqXI=;
        b=CqCk4WU5n5NwuSx0KFJWLAC3tx0o/a1fq1qRTEIojE84MsPfs7kV09isDg89HU72ht
         YMQNqGJo8hrI3yfoTS3Lm6IsvmPPjFH1DLSquCqwPdU+d16tLjhdoLzKJGPl4FtMsM0T
         YcAhD3M9sXKYdE1g1qirhdGGpHDbH2PWXsH4odv8nAplm7SHGCAMa7HGAPiLaeEl7R8E
         WZcVnaEAobTnnXPzThbEgKBdloBOUqf3Am2OKyFJK8lQn5Ofy0BHkZ8dS5HyDpyYcpEo
         JIbZud85zMMhGc0xFxK8Q84D3d74GIVABG0MrZVHdndC+XGPABfrZFLuzV11YUY52wmq
         dUXA==
X-Forwarded-Encrypted: i=1; AJvYcCU95MPXS3Z2vUtQ4ivriUd/1FJKsvLSAZCjpnjpIVEPuwSGdvUYiwO5hwmxZ5MUVxW9heeu1gTZ8D/4uCBDdpScYfHwiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2JU0gFvG5NN+Hg4mbo275p5oMfzRr7xVzDKjA8UMqfJuA3H7h
	yYsExj1ayS9IVPKgCjjJU8MbzjQ3Iv1bRS3AU1USG05MKK9Y583L82ITuamwpj0QyHFJxZzhSeO
	5k2WvpRGrbUzsCBRO+wzfOodDa071pi0=
X-Gm-Gg: ASbGncusSfkwPjMXDZ8YAQjYqr34jU9tBTbJYOSWf1QYUd3TmsPXkXHpRY4D9q6JzUQ
	6vzpU+zGDF+LDMc9uFVOT534tK6P54uuWUHAoC8uys6y7UDDOYZoN+AJaClGWZcJWkCdGNqomU8
	1vzL14K7pTVZ+GlMFpgDl+o6LWHezXTRSX8AvBF18u0w3ZWy6SpFZ1mcXWJW3HWVtiprx08ZXZe
	5MZUFVHirxTklXBpjkItH3zyEQMxEh+W4lRU2xSL80kdNYOFHxbOlKm00U7rTKwwa4c504vuw==
X-Google-Smtp-Source: AGHT+IFNCX0ckOsChso5kJGqid4SLOaalcmgzvE+F5pb8cfkVkc0r3f/yGGJSksDBL4n2c6XJFS70z/v5MFaLPK0zXQ=
X-Received: by 2002:a05:6a00:3a27:b0:781:1110:f175 with SMTP id
 d2e1a72fcca58-7a61506a504mr866733b3a.14.1761767856388; Wed, 29 Oct 2025
 12:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org>
In-Reply-To: <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 29 Oct 2025 15:57:25 -0400
X-Gm-Features: AWmQ_bnwX6EuAJChCufrlpzg_AX6H7XB1Uf5xbfwoMjEpTiQtpfFTcbK0dDvD94
Message-ID: <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 12:22=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Hi Xin,
>
> > This patch lays the groundwork for QUIC socket support in the kernel.
> > It defines the core structures and protocol hooks needed to create
> > QUIC sockets, without implementing any protocol behavior at this stage.
> >
> > Basic integration is included to allow building the module via
> > CONFIG_IP_QUIC=3Dm.
> >
> > This provides the scaffolding necessary for adding actual QUIC socket
> > behavior in follow-up patches.
> >
> > Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
> > Signed-off-by: Xin Long <lucien.xin@gmail.com>
>
> ...
>
> > +module_init(quic_init);
> > +module_exit(quic_exit);
> > +
> > +MODULE_ALIAS("net-pf-" __stringify(PF_INET) "-proto-261");
> > +MODULE_ALIAS("net-pf-" __stringify(PF_INET6) "-proto-261");
>
> Shouldn't this use MODULE_ALIAS_NET_PF_PROTO(PF_INET, IPPROTO_QUIC)
> instead?
>
Hi, Stefan,

If we switch to using MODULE_ALIAS_NET_PF_PROTO(), we still need to
keep using the numeric value 261:

  MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261);
  MODULE_ALIAS_NET_PF_PROTO(PF_INET6, 261);

IPPROTO_QUIC is defined as an enum, not a macro. Since
MODULE_ALIAS_NET_PF_PROTO() relies on __stringify(proto), it can=E2=80=99t
stringify enum values correctly, and it would generate:

  alias:          net-pf-10-proto-IPPROTO_QUIC
  alias:          net-pf-2-proto-IPPROTO_QUIC

instead of:

  alias:          net-pf-10-proto-261
  alias:          net-pf-2-proto-261

Thanks.
