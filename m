Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3599E51AFDE
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 18 Sep 2026 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752106; cv=none; b=iElfKrzRi0xoCNy8ndwFjaWHxIVgnzn/JQh74wTf1BdtB8A33GB3FtK1KnpkQFtfHKBWpMjKjzkevj1HpCsEhK0gp91fP2jcf+1vEiuzG7N9YGskLBHMGYPxxIQUR/RwKNaKJSF0CAlNqJrMemXli58F0S/o9m58hviL0nV7AUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752106; c=relaxed/simple;
	bh=de5x0Zxo6F6d2MB0yVScP1sFcZZJFeuVMt4yQvyoVlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1lljAPCyNuPVF4E5gRQgHhap46tnB6QuFflx3ieeyjIh70e3k7TVjXs7OdRIXbMvHNa9U6M1xTk57c+QZFAHMp2nSrWqbA216EsEW6Ak0l0/hCpwOCkGJaU3SmZbiShKxTt3OKPba88tI/PiIos73TeIo09da2zR6Rn5oJN2EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=a6WlNoLR; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="a6WlNoLR"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c2613d8157so438783eaf.2
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 18 Sep 2026 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1789752099; x=1790356899; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBKlhw0dOEOei2lTcRYxlQw5MM/EKQhWFk5pNENBOIA=;
        b=a6WlNoLRscohbr7p8URezLZSuP1j+8wrUir0WX9hEC2B8kEAolKXVI1Okp0JTCCLam
         vXezf2VxztrVtBvkDC8eho1xEi2dlZysclIbxlaEa60CnwrUKngyvMSynO+jfQAHlwkt
         dAJc/eB8T0pwzjIiA9T2og0dvkBFx6MOlraj11G4Sb+T+BGxiBqQkJLck7CELVQr9Ehx
         hSLHZd1DkCVeXOrQVzsaQ5BJef723KmWcVawhYtjo0G6FmzBSYPysLbyNK7rGDSJvbuV
         d+2TMlXBK/MCKhu5RUNtRFqE3gHwn03BL8sGU4sHgPl/ITxweykUap8zppB2ExC99ycF
         YejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752099; x=1790356899;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBKlhw0dOEOei2lTcRYxlQw5MM/EKQhWFk5pNENBOIA=;
        b=To9Y5OGTeITLUHmnhDiWnfGEnWUkb+HNi+RCQpEeonFeGtLAyxShyNt57+KLs7H9OK
         dgTS7oFtX+D+31HhzHlsm8Ej6hrPkHjjUvef0mqMbLVJH2hu1UIndZEBEfeCf7ZvQV5t
         GR5rgsZdops1bfaeBYerUGt6q1wTc4YrEwTlQhjiSLq6Ux5WgFDJS772Z4AVUSuuhOXL
         fJ18IqonnYkZ6E22jwlXdR4j20wW3mxrlXtCaZzPaSUISnF+DOb54vvpa7aHAna2Vkqu
         K8IgExxYpJPceQierrZ3XXZhCzRPkBOP3u5NFP924X22NRrFn2KjwC3qAlpXRZcuuX3v
         ePnw==
X-Forwarded-Encrypted: i=1; AKwUvBzW0FaLL1+6Lmzy22WgB67YGsQiLUbpZu18qjMbWMv68NZq4c7Aju1abffQOf89Nq4hxLuf1vEAeRr82DMzskvryYEmyw==@lists.linux.dev
X-Gm-Message-State: AFuF++kuwoByJ9LfcEIZo+C7KMZJPYTZI1VuS0cV8LbptUNJ6m6t+Os9
	kdmZwxK3cN0n4KP0F8ht5qu30Qii5d0biIuRTdmTU68V11t29uuJDOJ/tuJGos0dSCI=
X-Gm-Gg: AYBFou3nOORQ+EGsYLHbVZeNgk/Vd57KPtBkkpWlQ7KC4xmZMnxhu5+fx+5jIj8jGL6
	v5V3Gwj9OG/DmheOYi08e2nQRdmkQOPh+ZRhaDcgZr5eIZHUQgc8FEsnv+jCLMkcxwotZrtzOZb
	cZxOzt/5mRTFLIqmsqTvSsqguKbgquB9llM/7N56J6ghdiRlKhLyDjIt5lq2dVIeLi/JsoAADew
	B9ibs8mZntyqG9zEXbhj9WXEgluqQomww/IxDXgltVzRyyyTOnNrPNg2ZGoa7VctNr/WuZG3S+R
	7w8A0pXwxayZ881JDloDCYxZ2cjjDpMDlr00m0vdCC5G0Ghf5PXwHe2oekp5Q1VtoZmSzYNl/AS
	GM7suqjSw4MRYfKuL0AOgx7/juOvhfMhEDDYd78ychR9l8thkqjc/hTQ45EvxinBWSmnm6Co9zC
	w2S75vxE3v3fdcMhHJu/0bs+5yGw0ANwMpsch5VfzSxXOi/28ypFJDY20ELxvzcVv3SQkx+rlDc
	sr1FnlHv/CtEnomWbA=
X-Received: by 2002:a05:6820:a284:20b0:6cd:3fdb:fa6a with SMTP id 006d021491bc7-6cd3fdbfe8dmr158239eaf.85.1789752099254;
        Fri, 18 Sep 2026 10:21:39 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739852afasm1477855fac.7.2026.09.18.10.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:21:37 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nfs@vger.kernel.org,
 keyrings@vger.kernel.org, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] NFS: isolate mTLS client credentials by network
 namespace
Date: Fri, 18 Sep 2026 13:21:34 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <2FBF57B6-FBB6-498F-A1F4-695D52EB89E9@hammerspace.com>
In-Reply-To: <20260918-nfs-mtls-identity-v1-0-197e568d78a7@kernel.org>
References: <20260918-nfs-mtls-identity-v1-0-197e568d78a7@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 18 Sep 2026, at 10:05, Chuck Lever wrote:

> An xprtsec=mtls mount names its client certificate and private key
> by keyring serial, and tlshd reads those keys with its own
> credentials. Each key therefore has to grant user read permission,
> and any tlshd on the host that learns a serial can read it. Nothing
> separates one network namespace's credentials from another's.
>
> This series makes the network namespace the isolation domain. The
> RFC thread asked whether the user or mount namespace is the better
> binding. tlshd services the handshake socket of one network
> namespace, so that is the namespace it already lives in.
>
>   https://lore.kernel.org/linux-nfs/20260602154740.49861-1-cel@kernel.org/
>
> The keyring is held in struct nfs_net rather than found by name,
> because /proc/keys is not namespace scoped. Its serial travels with
> each handshake instead (patches 3-4), and tlshd's possession of that
> keyring is what lets a provisioned key grant no user read permission
> at all. Both ends of the link exist today, in tls_handshake_accept()
> and in tlshd. The handshake genetlink ABI and the cert_serial= and
> privkey_serial= mount options do not change.
>
> Still open is how userspace names the kernel-held keyring. Patch 5
> prototypes a request_key type handled in the kernel and tagged
> KEY_TYPE_NET_DOMAIN. A keyctl modeled on KEYCTL_GET_PERSISTENT, or a
> read-only attribute on the netns-tagged nfs_client sysfs kobject,
> would do the same job if the keyrings maintainers prefer one. Keys
> that userspace adds are quota-charged by user namespace while the
> keyring lives in nfs_net. Confirmation that this is sane when the
> two boundaries differ would be welcome.
>
> nfstlskey, the provisioning tool that consumes the key type, is
> merged in https://github.com/oracle/ktls-utils/ .
>
> Tested on one Fedora VM acting as both NFS client and NFSD, with
> tlshd from ktls-utils 1.4.0: NFSv4.2 mounts with xprtsec=tls, with
> xprtsec=mtls using the identity in tlshd.conf, and with xprtsec=mtls
> using serials that nfstlskey provisioned.

I think this is the old upcall/namespace problem that's never been generally
solved (as far as I know).  Here's a shameless plug to potentially revive
the original "key agent" concept which solves this in a general way.

The idea is - user space processes (tlshd) register themselves as key-agents
that can satisfy request-key.  A key agent represents itself as a key-type,
and the appropriate key agent is consulted for request-key if the calling
process has that agent's key in its keyrings.

Otherwise, this solution looks good - but without a general solution to this
problem, other folks building on keyrings will keep trying to solve this
problem.

Ben

