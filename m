Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF03E2D8779
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Nov 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381203; cv=none; b=boJT1r9mkWmib8VsrWN2XhsMouXSg7Me1UhajPlXMcaGrLpOFIHS7btMq05SynuFtk6pLP+3VRPuaE8dAjNkTevHqLyg6WOWXSKSHjStRl/SJIOf3NCxkjAQhZNHKuf9OrwBxIvA+I13A6Zt9+Ketv3dGdml+QcU4dGBjpaIcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381203; c=relaxed/simple;
	bh=EYKxP/O/E3xqBmODbiboV3aBEJpx7ZMxu1D3mOtTn3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzit2UaYBgyxfN7UwXjZVbitR1XlF5Ntn3PXYwBESuaH2VzS8Y5BcPDDYON/ELGF60G9LTFBxqHSxjDExYKTAvgJIZ1YMWQtSeCkQYEmgdnAfIPrPwoHjnKzbkPhyJKJJHhZ+6DE2J1c9I+kwmZ/9sQRIzIOxKKf9EmyZKjhK3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3LLwDYc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3LLwDYc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295ceaf8dacso3439145ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Nov 2025 14:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762381201; x=1762986001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui2U0Ij5vkKFB7H5IIU3rlE4C90Li/F+qZfil4Xomfo=;
        b=j3LLwDYcQZjOr8Q5qludEG5UMK98bg35iiZz4Wj3PXxGA3CIbxdpNEH8UVUDQd3lhV
         dX1lYT5iPCBO7z1e93AD6K/TjTN6gs0arPBPTA5FqQ5hqp6BVKfSDTnXDfxvx8Cz2QK/
         Bjv7mXyymRvu2X3AIIjohO47YT6iJFxAipdbmgNLMJVOTbAwCAVIpcNYPgBfLk8jBr39
         LTMKnD0WHwfhnO/DcWHQy9GXlt2C6cGL6m7GobgJoIWh50VyXaI2ALrUCXZ4xkM8ne83
         GD8S1L3oL7MgFyirdHDdtfmRokd2H3DvFnL9KSPgwz9JGo1ZFKQKR0Ff3Ez+jFxiRQhI
         rXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762381201; x=1762986001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui2U0Ij5vkKFB7H5IIU3rlE4C90Li/F+qZfil4Xomfo=;
        b=eANXNSTYf0UzzeI4YGaeBsMc5HFhDXORsqxOpQNyQndxbeYkufLexqmF2m9SQoMwsA
         0KIsyBsk4ryR4NS+WKspBFViKaKgbgXThh98o1JbT9ZkzK7EOsVEPz6o4CbkEvnShsx2
         zATcQzYMnVKmtISPmy4d4ZzcV2R3+YyWp9x96pr6kXPRgM1xrh4SmCxaIsBh4DKO81mt
         kVuBZAw/FkBkmYt3SIvPHHTh29/WoijXgldopf/e9JoR3wc9ILwut0K98mZCYSLf/MJ/
         222vv/g9iI7HBCNstTLKquxV9lPKa531qKQCyf3+RlQPYsdP4bin54CRH7WW47HLZBaq
         yPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY+yfiR6kwDocCJNSSIICzPtih4TYsQmEfnRZGD+ACzaS17wOF5dzI35xhmG8EJxth2R6ZEIH79DkHNi+f6bjgjZTC3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2urB2d0J7CuBtZgo1ZyU97RbSRjX5N3Dj+F6cZEK8sHyvyy1i
	JeDqDvSCwQcX+f0itZf/rxos85P4ZvsRJD7gfwshWS6V8XbUNrLKO8n1yURwjKZGsFfeTcXEmTm
	f6CZxU8P/e/KsbEV2gvo+mUAT0w8M78sWqEl/
X-Gm-Gg: ASbGnctNfthF8E8DR9HI79/rYmzxwagTnq2GuaiNxc4VXuXnAusBvm1mOVs3nDMGvK9
	nj21Bwv7h1X6Q4jiCVW7Rc1M6tKXCKhkPbJakATJM6Z+H0y1V39X+gnFWpKLYjQ26WaOt+4Ev0N
	xcGRUWohPX2rYmaxkVlsjsLL02n1K0MJ6Do87b7aa4YXbJi1KsH0ZEthNUPZgVlJPPHhzyJJRzt
	iOq90ZL2K7V5oSa7V/XSvEnpS1yvdZrNQSJtOMid1kscquISdfpitSjDx8t
X-Google-Smtp-Source: AGHT+IEDvGlUuVEideahYZY+ODYUe4guvkm4F0yQbQ2rOAGZccJElktFd+64A9TEF3O1cn/fjQ78uoSBDOooxDIQsAU=
X-Received: by 2002:a17:902:db05:b0:295:6850:a389 with SMTP id
 d9443c01a7336-2962ad2b2c3mr69533935ad.20.1762381201200; Wed, 05 Nov 2025
 14:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <20251103184145.17b23780@kernel.org>
In-Reply-To: <20251103184145.17b23780@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 5 Nov 2025 17:19:49 -0500
X-Gm-Features: AWmQ_bk5zH6aZ8eA6Di6ajFu_oTzlSNpD7ldH11olJifIEsUkj_P9OR2FBRf4E0
Message-ID: <CADvbK_fdph6C5+nnUix2259TQb9-vBVEPOxMpzzpEy5xhR-xTA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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

On Mon, Nov 3, 2025 at 9:41=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 29 Oct 2025 10:35:42 -0400 Xin Long wrote:
> >  net/Kconfig               |    1 +
> >  net/Makefile              |    1 +
>
> Haven't gotten to reviewing yet myself, hopefully Paolo will find time
> tomorrow. But you're definitely missing a MAINTAINERS entry...

I was planning to add the MAINTAINERS entry in the second patchset,
since that patch will introduce Documentation/networking/quic.rst,
which should be listed in the entry as:

F:      Documentation/networking/quic.rst

I guess it should be fine to add the MAINTAINERS entry now without
this F: line in the current patchset, and then update it in the second
patchset once the file exists.

Thanks.
