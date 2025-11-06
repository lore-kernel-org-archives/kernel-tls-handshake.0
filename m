Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B32D46D9
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447762; cv=none; b=bqYMVH+Qtzpp7XbEDMNnOksgrdoZ8uWxZpWy2zyQ8HyWEL5+qS2VK/b5abNWO3bvwavyBuETnM8538k3Y9860lmMrGj+Kr6xTKhp9saeidirHwEe48ENCVDxJ1XU33wJuUMF/UaUBB/gKSfUbmNpCo+oZ+zlZMR2FuweorcR0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447762; c=relaxed/simple;
	bh=gPC9VPLFYbjfVxBSFkmUOkcw3DGZnlisHf1J732GkLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwvPTa/PxSz0q9FippqPQOvLL2onFd/pDBWy1YKPo+UDOOqBHdikz3nDD8+gXoIdQXqJZaHdEpjxXKCnE40RkmhA8uY8o5x/kLtAe2VYelQI2XAB/tsLKrtlAA+YDjrPc0QrsMBzeyR2+WWHC4qBfJ68Srnfm7vvedyx7GC+CnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwO5YYfI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwO5YYfI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso1045019b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 08:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447760; x=1763052560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qzn6+Sh35pzxbK3z/xOK777J6LI54V1OZ2Oy1H+1YU=;
        b=VwO5YYfIfUhj+i9TpNodBFRyiICY5b7mtzGOWitaWCSEbPjHwziLKRytT4TNC17Vf9
         eJFFTno3/Eid86wLUMIuC3e44MTxzPw361pFB+pVcAjzTM9KWFvkMltMwsWWS/OrLbHm
         S30CuEDmRc+DTU4GpqNHKKZaDd6FlFPUpu5Uzp7AVfYHgse73XgeY4Tuv8aBkN28gD0+
         wZPcD92cWYKQPW80fQ52b67hkWenQ0c0TyhsvWurog15Ne7ZP38D7jxf+bKd4bFMH2LY
         wdwz05FkrYYED4zwOQCc9KGJBFKaK+F2Gxq1VmGbFBfSEJq2baxFDfXdP151P/lcA089
         qbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447760; x=1763052560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qzn6+Sh35pzxbK3z/xOK777J6LI54V1OZ2Oy1H+1YU=;
        b=D728chkG6FRxOtAU6mWzhS7hWYyE4OZ7iQd5Q/YhSlmLD3/e7ABY89ssuPb5tNuUCi
         Tu89Ah3eisrcf0y7AsnaejzanoW4KdQp6bK5lixLsEnQRhTJ7aPL1jzZRSCgcAUwPlv5
         6ZRe649HntfatrdgWOSVksKIc/W7H0CGPw5GdIycnPmICvNHGzwXMK9oe6BZPKDULBDW
         YjcH3ZAdFMXSJNfen9B7XQTFgtE7hb66teDJG6VtSNClp+mK2/KdShjeARPe4fl2xyEg
         FmVvwD2ke/EUIg4aCA8wtEHza1nTU58vWIvDKzQoB03NT11qOwq/TvJs3xybHbnLbHAR
         GY/w==
X-Forwarded-Encrypted: i=1; AJvYcCUYACxCbWHE4cI6mozS3/fp1vAXy6JAN+93BZRiTtc8tWYfuK1LZ2w4o4TRi+hVVvklG8E4IXac90HGQ94E9F+nZkjakA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMNuO0lsLBEALcABVbKIT+luaxXz4JUlm9oFlhjYaI5oP7RuU2
	F+VLEW0aDGuvVEunOu/3bJaHxQMTLdbFzUiMkqlX+TGGVkzogIzbBFWeuNUa1gHb3MSncsvtcq7
	9TeF8BFzcdWPheh/T6jIBOke7cKvJZ7w=
X-Gm-Gg: ASbGncvs9w90GByM3rBfb1jjp+gk/m+jJQ7VAw5yHfc6ilkulTJwbakNXRJC9Q1KvP9
	Z9p/69g+F7ZUMHUw9gQDQfJTfz4/Kpiuriv7osLzPjoGdC0qXQLbZELwWmwnQqnt0fhOSK73bS0
	wZYYLykkkdYxTh/GcLzVTtFlzFwdoIPrFyJAXK+rWLbLxvXDp1w4i7Dt+LP4u4wCiMXrxbrS9Nb
	xAdJKGS7cwLu0DogobCD3GB9cIMgWPTxfg8jLvm2vzasVzTPbHlqNyaA8NhlGLm+k7TXvD1KKke
	+qy4ysBKJRFofkKu1NDpTFMDqH5R2Q==
X-Google-Smtp-Source: AGHT+IF5xt57zcNq+U+HwDSwBlT/1oLe/u7UB3heYQ1Kbhs29xTrM/I6aw5xgiWPTyWZevpEl+UkTdOu25fxJ6wmzM0=
X-Received: by 2002:a17:902:ef4f:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-297c04931c8mr1358545ad.51.1762447759701; Thu, 06 Nov 2025
 08:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
 <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
In-Reply-To: <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 11:49:08 -0500
X-Gm-Features: AWmQ_bkulaWnvSaWsxVAziWY-nd-sBA09kWceVf7bj-CFTKpUJNHZl6a4fE2Pjg
Message-ID: <CADvbK_f9o=_L=K+Vo_MbJk3mXFgriUUtGCSVm6GNo6hFHk5Kzw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 13/15] quic: add timer management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 7:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +void quic_timer_stop(struct sock *sk, u8 type)
> > +{
> > +     if (type =3D=3D QUIC_TIMER_PACE) {
> > +             if (hrtimer_try_to_cancel(quic_timer(sk, type)) =3D=3D 1)
> > +                     sock_put(sk);
> > +             return;
> > +     }
> > +     if (timer_delete(quic_timer(sk, type)))
>
> timer_shutdown()
Will update. Thanks.

>
> Other than that:
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
