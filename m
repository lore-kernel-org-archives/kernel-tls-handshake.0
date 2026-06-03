Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3438BF9C
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Jun 2026 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780510514; cv=pass; b=skyukbXuigSeXvB69SQlGM9eL6UkRSZrncBVETjp5jQhYxKmi7dmsMk2br8Cpfc6ikljpHE68aB2DvNx0Nmqu7UEtrSnyfcS7+rHUc9MruTW80gKmdhR55WW+59wSxT2a82kjAyw7iErtsCwqGimfXMqRaG/60mbeuBBSJdXddY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780510514; c=relaxed/simple;
	bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug8fC6kaU/UXugBx9fhkqeipFrC0Clq7KTcGdAybxYCfoUBGB0ZuKAIz3etOuRZw2WU1SbZ10saOd9z3uHzw5GjMe9f3w6o8BRTVg7CXl/9E+71INpfXtkmjfmLONMIAwiDqZSpjyG5hRbmc9rvc48HYSJPfNufpVomhdjt6zzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkc2Dbos; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkc2Dbos"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso3813158a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 03 Jun 2026 11:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780510512; cv=none;
        d=google.com; s=arc-20240605;
        b=FHZ7h9bKLBEeMRE2o/jRmTGCaVhJLQLsdg6SwaBv5HgIT8zegrulK227sVxZvtLNYS
         YcYSw9yu9ezO5+oaGu3iMCjhYz4g8Xw44QFO/ELDRARXhe4/mf+3dlmKF/VMBNhRvVap
         DGQV2NdRILY8txFib2vmZvdPTdvJopRI6dpx8jXk7b0wwHaCdgf12Hmk99yegMITbWPb
         VC40Un6jHNxePkSNWsqjOF1jmwTLxUvMjxOyG5p2G+5nbeEA5pD1UZpJDAS3igP0zwdU
         gilzwJLnocipebgx+EQiQaxA62lds5goyOrPJG5pyq+72XCIkqgZn22lKTYenx8UGnJN
         AiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        fh=ATbQurLGT5yqiCPWkBstzATulluY9QX3CDOZG9cMeXc=;
        b=SzuRpibEldOHEQ8jgLTZxzrnLdMHjIMDSgHoy+MZeMfOmJKlBnJgezqaSFAFlZuOdT
         8SFh9bsZ0xhF0yBsPvlfvrtijk6rksBvinT8D45XKX2AktQK4nwkKmMq7mLSPfmuEdcU
         4Iogkn7EI4ZlL/LHlyoOkoSjZRP5loPe8FtFtuFos2pwzl5iNgp6R72+XmrQOzs4hZ6R
         81UB2bibOnCDBXmKSTf73tnuLJjvkolxkFyL3yPN64JUPwx61NQkRGVaJ41oGGZAnhJw
         owZaTRt02MloTRi+59iy1nc+gqGN08puewFHIKtVy6PCzu7YRW3uj/E2Rh4qimaW9IA/
         kKBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780510512; x=1781115312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        b=kkc2DbosJFKQzwxDADLpLyGoNr+NEc8ZCnZ9MRj1ART9t3T5ttEV6/tZnNYSB7h8Yu
         opGWzH3JqjM96M8yXNdSNwHvYF4ujApycwHXu+SWKZ3wCLw9kFBPx30jOXYhmuOALx+0
         qeVs1cfVlF8qZPZtrlX3fMxZjGbxC7v4liQqn0SuIt2I0hx+sQT3yOLH5WQ2SuvynElm
         8YM8QNK3ZR+jd3xfu1Wo2wIPH6Fha0pO6ClFzOEmciFTGsFYyEvJZLV9QHbs+x5Fwd9y
         MyJevuczAP1I5x5bKVttwuyGLdFF/dw1cN8ILZqPPzspS2wXftQmxkFHObUnmxrB5VC/
         c/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780510512; x=1781115312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        b=RXRzyEMifkj2N/MZCYKQ0y3EEp+qLCUxhBg/1p5J5MB6ebNL9WayyGyyt2ivG+rSUX
         8aWDLjWMhWBl8MkG8eZfpWh8wkeWqKorzygSjTMTaB58rdtrquVzmQ3/MKdRmdu8p4uc
         2Uw20MaE53oAyqsKeQnSvhTkrBqLIH1oICzJ0o2kTZRb/H/IYj4bsPW4S3SBjbZtjwbe
         drlA/fPEP214+iGfcg7PJTvTyZ4InWbbz5sGl00nMtHwCOR1BgzJF8cNXNok7WROlWv1
         Z/earu14xe0e/EhyJqVbKXvKOcAubSho8TBPzel2C3VwLRrsLh+L0E/DnXppDc7kPMGE
         U91Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ptyF65K5n+teI8EYNXCpaXTGDkcnS78ERdh7R1QKXGbgSHXzhq42kBQ3g//3tyVwGCx4BvNMAhp8YgLP21KEWRavwLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8nc69Q+iKP1sc2sW3oInqSLpHmJSjt7INuCw9P7r+QeKV2KbN
	akFQ9fBlEIsbUSx8riftIhKsYYnhWHr180zvRxhg0lceOgBoiqCcr0H2jLmXH4j0WqzIHUFtvnG
	57ZdAqh3vnyQFOfAIfIdzrjDlPiWzOmc=
X-Gm-Gg: Acq92OENG7a8tYKw8L5UoeJ38tT97jDk49QpdUDqdnibLclMxFJXCklyGGtWdHSkgDy
	aScdMV1VWKQ+Z5yWTGNPTrnreNrdgovw8ua5ld7DrqeT2XnIYwIH2+zTbW3d8TYa0vSpbn5xgG9
	ejLjSN1HXQMQxCUsLoIdCTnZ/nT6mZ/jGFGaH37XuBk+9375C0mz0PTspnVZBFNuiFnpqwEjakB
	MRRF3gV7Je2GpXFO0h1IQMSDHPWT8MLeEptXlUtQqJhIsbO0ppCzFdUzphBNfEVfFuG4awu4cIB
	N1hW8bs1Z46jSuYdLBQAQhOunLd/tH5YmncSfeRLve4FpMSkstGSZ4hr7VzEWAmh+l9qvXkUY0s
	WNTNDlzIMZfoT7RG1+Q==
X-Received: by 2002:a17:90b:3f90:b0:36b:71e6:3de3 with SMTP id
 98e67ed59e1d1-36e308379b2mr4410234a91.3.1780510512536; Wed, 03 Jun 2026
 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780232930.git.lucien.xin@gmail.com> <CADvbK_fBbLCwY61HXsNeGCA8MhiBKcbvE0BvSZppohJgtXO+2g@mail.gmail.com>
 <20260602111823.0b1129d6@kernel.org> <CADvbK_e7T=Yfb800TbO+BcpDEp=Sf6rbtiy2daLaskFAjeg=Ww@mail.gmail.com>
 <20260603103924.643f1ea4@kernel.org>
In-Reply-To: <20260603103924.643f1ea4@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 3 Jun 2026 14:15:01 -0400
X-Gm-Features: AVHnY4Iv1uP_QmOrLNz1hlCQg2FIUIb0L_vtpgS-GxknImKiY2MQj6lnEeZbzQ4
Message-ID: <CADvbK_eSh_b7kVRkkgXoRwygCVoxuwB=Dg3qxEbYdW5cscSfHg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 1:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 3 Jun 2026 10:14:24 -0400 Xin Long wrote:
> > Will address it in v13.
> >
> > BTW, is there a public link to the Coccinelle check results?
> > I don't see them showing up on Patchwork.
>
> They are part of the CI that runs ksft because they are very slow.
> So they should show up if you click on the "contest" check in patchwork.
> (caveat - I haven't actually check if that still works :))

I can see it from "contest" now, and it's a long list.

Thanks!
