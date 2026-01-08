Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9882BEC41
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910803; cv=none; b=uaWAVAcO6Sl/Loh7p/Tqs5dXHzec/oLwVzG88wlOK5hjZ7X3QMXaUb53K7GG+CgerYEOAMb5mKKv6fXhjMyrLP0mWuMkeN3lIEDhM5CWFTD49xeqJmN7+uPfn7e5hB8xoEMH/8xFbzcgH7qkWEIsIeaAGPbMmkLjltbclhsXBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910803; c=relaxed/simple;
	bh=+wSVc2IT5bsrbZWZdITGeeRuH5v05cIZtgKBrisJhGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7y3kdti0OyhMFW0G/Zn4EKAgRpTwnQmGtMeZJUcZa73AXQZ+75crcjV3lKWtHTo8RvKo8/AxTfI3kqg7SodQ12T8r+DHZqD+JKa69ta/7CmPc8BBtcGACnrsCZO2TrCHx80Cc3K0SvEPrtrGO0sLgg71P4pb/ID1mZ3bUeYOlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtcbS9O8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtcbS9O8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f30233d8aso27142525ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 14:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767910801; x=1768515601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eSpvqBcCMdUnYFu5r+IbcRJ+Ycs9RPex6ZaryNeYwM=;
        b=JtcbS9O8wt0lyz4gxvgdZBNooP6Wodf3Jz+kHFQfHqugvh6Kqs4a8e+Uw3BKhgDnNR
         9vtAwKYVTt8fZtqf6al3lsYTxyiocJ4qnqcCdOw1HzTsZQSzUkgsRvQgE/HKMQJhtrDM
         ksEg5ITpKMC8v8+w1JfbaeHnUUTUiHk7KF/uODnI2lcQgIxjgspmgAXMG8fEVqLVq5eQ
         S8YIB6X4kDc4c3ujFBo4Vwkz/4EQNiJbGvlOfE/9ef7ed8WORDxX1R4xlWzP2dB4admw
         QP7UolT2iBe/Dky0tXwKBl0+kyQHf+P7TfilBJib7DdATzL1QXMPVtGu21vR+jN2np/Z
         Tmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767910801; x=1768515601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eSpvqBcCMdUnYFu5r+IbcRJ+Ycs9RPex6ZaryNeYwM=;
        b=F4qEEcFyJ5I3eYpFbbWmgtq+UgzmW8KMhh9+WY46Grqhm893++lSWaagUwd6uPEGsb
         SzEGHv6+cn96unU2AtFe5pCpH8ehVe8MSNikmo7PUMttZkiV7aiLoRT+7Tu34NUWvjg/
         8yzT3Gfi7uhPGAZ89x9td3PsQZ/7GUJ6lntoQb4S4NJNyZrhTeoXHE7Rh/+Vr6aXC3vw
         R9UhesweB4ccwBEHtMbp+fIC23eWQ23irjGYLAU365ZLBKjtotGBOy9uuHbvgU0Sab9N
         NdE97bzNPTQSgAY0c85KX7ZzGe2PqScLrITALHpgCIdj/o6gWdCeSFUHCUB6gMcjH8G8
         A5jA==
X-Forwarded-Encrypted: i=1; AJvYcCX4wI+uTe4MPX/jibqhobaOG1nX9PIhRjOzqyJ9S6Jrjzqd2k3bsGbfbt5sRMlqiZsDqRZlR7O2BMQfyo4KejS2lcJgsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+0jdWpmfCto8+gIYupM/aWHRvukN0Ht9A2xMx65ddZgHAkDj
	Nsvuj6OAgr8eZg3an9jKoU3H3C0kp8faU7Buhu6KK4tpOQFU0QrhXE7j3xOJXR5OMIDH2srDug2
	dib3SQU2FLtLSk39OezSUO7MnCLYKcqY=
X-Gm-Gg: AY/fxX4G6R2uqsCkGovMUOJGMS4WhTUX6j3u9rXQTrxzr36oc7OPY/eoHR9TsTLhJj1
	iiHgBQiZdbxZCgJpjlpRIYkBDDCSRApW6NQ3+VovPdLmO4UAtDSFCuxvS7aJwM87Cx+OPp0ITw8
	i+oBvZvLkK9Tb2QFlkskD9qwjcCO1rh130YWoVKivNfDF8CaFPxpHZlyRMY/mtsX/wpmSlZgGSo
	4b4bk4eSe2gdvZNZ0sDEna3uE0OSu6dWPWuQnKY75OLzjpBEKU3u7isSGhEj7rhNOorKko=
X-Google-Smtp-Source: AGHT+IE6kkegFDt+9XCzD+S56azqAPTIJarvZtVAkqkfUkoYB3glBC/TJm42hBLD2pQUlnWfdjMc3cigjDPJ1b82sgo=
X-Received: by 2002:a17:902:fc43:b0:2a0:ccdb:218d with SMTP id
 d9443c01a7336-2a3ee442824mr75598785ad.17.1767910801242; Thu, 08 Jan 2026
 14:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
 <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
In-Reply-To: <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 17:19:49 -0500
X-Gm-Features: AQt7F2oQeSaDlFSlRPZRuDsHDmuOmu--yt6QSCtiFGQnIoBOFFX8SGhuo0gGWpA
Message-ID: <CADvbK_eVM5T3u7hiXR=S3ydHCAneCP_wLM7Q4Tc=D6eJ9tv4sA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 02/16] net: build socket infrastructure for
 QUIC protocol
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

On Thu, Jan 8, 2026 at 9:40=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > +static int quic_net_proc_init(struct net *net)
> > +{
> > +     quic_net(net)->proc_net =3D proc_net_mkdir(net, "quic", net->proc=
_net);
> > +     if (!quic_net(net)->proc_net)
> > +             return -ENOMEM;
> > +
> > +     if (!proc_create_net_single("snmp", 0444, quic_net(net)->proc_net=
,
> > +                                 quic_snmp_seq_show, NULL))
> > +             goto free;
> > +     return 0;
> > +free:
>
> Minor nits: I think an empty line before the label makes the code more
> readable, and I would prefer #if IS_ENABLED() over #ifdef.
>
Will replace all #ifdefs with #if IS_ENABLED().

Thanks.
> Other than that:
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
