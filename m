Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F172441058
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925269; cv=pass; b=HIpBe35SSAvlKbnnfy7TqPLByVbgUm47a40XSlFFq/f2lISHCwutg+tnLEJhEvk3nsjhFtaVZn8IxWc0Vrv76PutUBz2bop/xvM/D++jMYUalZE52B+a9MdEUs8FsGlvW6xNoa8hq5hUvwnXbTpbASQ0JZvWfgrnEGk4jIOxAjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925269; c=relaxed/simple;
	bh=67lJ0kNh1HNTrTPswLOz4RdeuIvnZ8b8fX/uZYsptR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8gC28zLzFwYpo63/dIVO2gyFUR9xzcIUXGuxbTUz2iq8A2Y7i+VVQ/YzyDBmMaChjoaQaVTEGm4AgHksuCQPAuvQT2WfIRgHTEnHl4Cx3ke2P2OfF8lC/xWFgxvalea85DioRJnZW/mwgScC6aj6ZkLbE04Fi1y7D1rRGR5IJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJy1LgT8; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJy1LgT8"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so3623165a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 08:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768925267; cv=none;
        d=google.com; s=arc-20240605;
        b=UGulYOArd5ACmmTIyeKCjp9nedq7t+UUgQD8gtUBI7kCk0+vh7eJqXyy7UhHt+qBuH
         EPYPyZ44ZhY3f+d3sr9Kko39o4wYDSxbPZx8Gj+jLLUAixgrkXSCeJJhSZddGhTRtafL
         V6cBpUdedtGol1H2KyqgEJwYXEan22LzKYYpvSz/3K4WQWKWfbnH6Y2gkg04vpSdfPPc
         WK6EcVSNxbQWCmNUZfMLMqOuuwWcJ8+/ZwEOs0MgA6dlyq7IDQMjIherxRAFzsrCIvyD
         4H1uYfMqxgMu38bt+JgSwNnbb72Pny89zeetiMRN0QHu1HOs6kV+ktGaUL7P61GiR1H1
         xwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        fh=kU2GbAWmuAerlDLIdkEaONpWPNq3ggaarhZ6rfkoSf0=;
        b=dhwzYFzInODioNZ7y3ong7nBrkwJAk1hV7uDOHZ2xLmFlgKKoLyiAerI37Iua/tBbJ
         tFHWRlrYy0owHfnEhOVwP5GxGizApn8wwc6/T5U9rX4+Fj8ihwIIl9ueWsIqZsGlzywy
         lKmLGDGvuPq/Z+1Pi+3ub9/hH1ZsjjibEhWkRmsod+sfDgpAPKX/rh1Hprp2JPIIvJ/X
         xmfmJjYLsiY1cgO4rsyyJgHXR09X1Uif1Fmb0bSi5UEg/CK2/SWjjGo1cvbCrV3w0z9y
         /k8TxZpImzNvMY3KdlBwI1bu6Evzq0R0+zrNmApGKQNyNJyFh/g46+QKwl1d/u2YAoX2
         r7zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768925267; x=1769530067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        b=YJy1LgT8j7Vdw1FYn4Qccs3gDzu3ku77Ma9ka/8BvNpkqqR8VgJZGD1M7DshxJDoEK
         bvV/TEf9mCM+rp+sqR+ppZIKG531b30a8IwBXQEBLORBwJuImRJDEmwy53mgScybI1YK
         Lq0ZI5iyLZg0TcTxruNaBRtGHlH7YvgERY3UwPJbfnpDYTcJNdmPQYI63clsJINMGC/t
         HfiHFmaLyeXObWL/wWrqqx0sPcVPLQ1cbpHx1FCO3x8uQcprg6/cO66hluSHFTz0TpyH
         Zr7aat0fMVIUi3tN+K3QRhSEwFWI691MemQTbashUvdHoLEHebVzhgkDa2hQB1yrSPh7
         KsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925267; x=1769530067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        b=bKoCd5iVZDOrUuor8O5fYujHlw5D2Hoz2U/bz7PXeSsXcbg6r+Djyx9TnEl2L4llue
         27OHfporBqQmlpNrfUeBGagymw0HeHbUyq6P6J9IvVniMkcnVRYa/6iWyvutfmEp1y9U
         UK6WOMnYPgcvyolkw2KDFEIZWcon8NYY7KmWKyim2jV/FgXr1neH9KqhFJ5z/Jqji+uG
         5WJEWcjo+P88X7+ZsgVAMc9BJG6zu8ZbcgNyC+4qlyWxKEhkAKR4SNobreJhINCc2LM+
         X+X1GMq5R0vnpRASatJI/gw/0lrbIrCqml9/v+CaTigh8t+dfav1yE1diaosGBvKMtR7
         Nysg==
X-Forwarded-Encrypted: i=1; AJvYcCW8mqkyZl2J5/fPcUl2LnOU+wSnWuCL1NxvgNUEVAM0v+x/hc5CM4zy7AvhCDgh5ZDT7ALbSlrtaQdzOlMZPuBlYcMtXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyFzIssoAKg5tgEXG5Ic/ZeMIy+mO+gfrH1KVTHfWPxgXI5EZ4
	xZWds2ihz6MjMFTjJ9UwmwbyPVnS4vMBJsKnkbmFZ9YT3tGs96eJyGefyydeTNMgCo5ybSewabo
	rZ9w0Aexxkw4Z+UJa4aD4SWRi452jHkA=
X-Gm-Gg: AZuq6aJPHvWwObJPIrbv38MvFwRmjKfdkJy37quE03KsNa/BuEtPbkN+1zXwZEWom8H
	I2Jl03P8RCEGXBqjnYUPRtXBDComZcDgFXA/cqk3rsFmo6U3ArQ/nJNC/m+PNrRgc3HaCJUK6AX
	mFGGMW7eqfKBFZeGNtkbttvdmAW4WdHSituQ6mx2ei5yKd0D5+WW6zX5s/FBcsQIKr9X6O1syAc
	Ve09/W5W3hM8FaSuRv/2Qz8+Hpn33BEotJIUbu9Hj4UbdHJIlyowBVspX3Ge3DLMPPrT5uIHcUr
	8PIB+xWlPgbWs57nhwqQXOYS4Z2RaSdWVSJqOsQ=
X-Received: by 2002:a17:90b:240e:b0:352:c146:dc39 with SMTP id
 98e67ed59e1d1-352c146dc7amr1573652a91.30.1768925266857; Tue, 20 Jan 2026
 08:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768489876.git.lucien.xin@gmail.com> <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
 <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
In-Reply-To: <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Jan 2026 11:07:35 -0500
X-Gm-Features: AZwV_Qi-fSbMUEaDUskVF2b8pxcUG-nT6lofmi0ehgNJjkJjIxLYY_l2FerCdKE
Message-ID: <CADvbK_eUfuuwMg28nxo4g4+fLjJNrRDDWro8oape3uXu6GvoQA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 15/16] quic: add packet builder base
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

On Tue, Jan 20, 2026 at 9:31=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/15/26 4:11 PM, Xin Long wrote:
> > +static struct sk_buff *quic_packet_handshake_create(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_frame *frame, *next;
> > +
> > +     /* Free all frames for now, and future patches will implement the=
 actual creation logic. */
> > +     list_for_each_entry_safe(frame, next, &packet->frame_list, list) =
{
> > +             list_del(&frame->list);
> > +             quic_frame_put(frame);
>
> If you leave this function body empty and do the same for
> quic_packet_app_create(), you could additionally strip patch 14 from
> this series and avoid leaving several function defined there as unused.
>
I will give it a try, to move patch 14 to patchset-2.

Thanks.
