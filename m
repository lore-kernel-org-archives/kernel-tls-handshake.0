Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582B3D60
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:33:16 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b73261babdso19484011fa.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1692214394; x=1692819194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYvuFJJbryTXq8avgTqMYz8fDnic2xgZUwMOi+7/QYM=;
        b=oXr+TqmRQypGhdeeacbC91+eWsxz7KYoPPFiDW+F1l8L/96TX27m3ldTmOgb/c24qy
         jbdMzZPu76IKb/fENpvJWx5dY4KunWBZhS6wQRjwpvtFcaIB/aKBphyy1S9fUpuX9S8t
         Ps3/GAj59X84kjose4GoRt7I+oDfkh7Yg57clXrdzmjg1nAxwL/UtwOhe2GGXPKsKBZk
         I2H46i+4h32Lz1yFKUDYqR9fA/MbSVa9xnf1OIE3Y7K4xa/i6apgEu3Ekn56iZ3b0Gii
         cv+m2Nlz1qcZg4DEOWCOXhWvYIK+vROan6sdxXM3Dh6WfGSG3Vo9LtIl5NQn5d1ySzCJ
         2JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692214394; x=1692819194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYvuFJJbryTXq8avgTqMYz8fDnic2xgZUwMOi+7/QYM=;
        b=luY0SXTxH4SAfeF2xeUO679lWL9RBXUFCxk1yrXq+kSDeRO1YAzzQYeFVAubf8qUqV
         DBPi3WWZCGGzUo98iYbTp6MXmZLEX4FHkS4tyQ0TR5uEvgC3LhW9qcOPHErY3fHjJn2z
         Cx7VNCrgGfEXZuc/eUJP7UeFjSmAzX+duAJHTk+8EB7bbNt5hVwImi7vBPP2cEJvxOrF
         DUPt7q6wSy9Y8rK2dICyZcawccmYB0S5hkJy/Rzm9OEos+tu0iPOdyuQcnSEHuUJcpMg
         NY00LcX68g0GcdxBrCj1v7fT/C2D1dwxQgxfQuyGoPWICSs2MiEYjlbJBQZwgmr5/1n4
         zr1g==
X-Gm-Message-State: AOJu0Yx8nQ7SAHIzPfzmuipJNZ4ZNyImmwY7r6+XiOLDt+n/C084FNJI
	27OsRe3e/FWaSlfEuBItlHvXGulF0PuuqyaMlbY=
X-Google-Smtp-Source: AGHT+IGLHfq4ChAqtRJ7HDnJjNnWNn0gyDv4pBV2Vf03rNk6wY8JcfEe3a0KzhskSiirPQdUC6oXb1eB0coPq4tQ+g0=
X-Received: by 2002:a2e:a606:0:b0:2b7:32d1:6c7d with SMTP id
 v6-20020a2ea606000000b002b732d16c7dmr2017268ljp.2.1692214393925; Wed, 16 Aug
 2023 12:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9674EE10-AA24-4868-A2AF-2785C10A7BD3@oracle.com>
In-Reply-To: <9674EE10-AA24-4868-A2AF-2785C10A7BD3@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Wed, 16 Aug 2023 15:33:02 -0400
Message-ID: <CAN-5tyELqRN0nqu_dxN_yhJssz+iFCM15nHj1b57OSg7rykRCg@mail.gmail.com>
Subject: Re: mount-by-IP-address with TLS
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:01=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
> Ben Hutchings raised a concern about using reverse DNS to deal with
> mount-by-IP-address:
>
> https://github.com/oracle/ktls-utils/issues/22
>
> My security expert agrees that the reverse DNS query here is a problem.
>
> The proposed solution is to forbid TLS mounts where the peername (passed
> from mount.nfs) does not match the server's certificate, either its
> SubjectName or SubjectAltName. One of those I believe is permitted to
> contain an IP address.
>
> Will this handle pNFS layouts and fs_locations properly?

I believe it will not. GETDEVICEINFO call returns an IP (or a list of
IPs). Specifically it's netaddr4 which are I believe are always Ips
(not dns names)?

struct netaddr4 {
        /* see struct rpcb in RFC 1833 */
        string na_r_netid<>; /* network id */
        string na_r_addr<>;  /* universal address */
};

The netaddr4 data type is used to identify network transport
endpoints. The na_r_netid and na_r_addr fields respectively contain a
netid and uaddr. The netid and uaddr concepts are defined in [12]. The
netid and uaddr formats for TCP over IPv4 and TCP over IPv6 are
defined in [12], specifically Tables 2 and 3 and in Sections
5.2.3.3and 5.2.3.4.

>
>
> --
> Chuck Lever
>
>
>
