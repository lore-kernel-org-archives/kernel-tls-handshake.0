Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F63115AF
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 20 May 2026 02:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245987; cv=pass; b=j6dkDRzC3B4F+9uIC+OO/uWphYPvkQuK3GPdanceD9VJknrjReiVHqc3TZrawgoiYjTb6lfWsYVaHvjnyp3Lri44ifL30V6NYyAky2BdTbmqddyTHgcMP/B2ZBtxcx6z0/yqjsYjK9sdG9tmEprrfZpZgJRl/4ZlqTgouYkqGr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245987; c=relaxed/simple;
	bh=gkg5apv26kveK8ieeIvoayv5d9V0BHoYpJWe0U0l4RY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTEW32E6pwD3ZjUxzIDMdQlQfsyzlIFWwyWOsPo7OTQp4qkjIKukpf1z+KLWW0jLbG5qZmZGgrGswSjNAK6wJQ2dwArGgf9A0qYwxY+ZKneXCQ4aq2vww//sp2nGFdSeJ3DJBJAJNTUMqp2syK2IfAsKkGP5JXnqLt1mtVaz82I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FScllV7G; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FScllV7G"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bcda7765d64so1035418066b.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 May 2026 19:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779245984; cv=none;
        d=google.com; s=arc-20240605;
        b=Tv7GCfZG7nQCLBNdC4uokRCJufctMaGinGqlBVH0m/IWFV7i0yH5T/C3DP/MBkJ+dz
         FCAMNbi9OtTH/KqNpA4L4qKYhVaRVwLIEhtv1sw4Mt8edJDWQ7lYAaMwdKpeZwqex7Hf
         F0HrMvZLQM5PhBlTexw81CWW1sTw6UrIyhvYDGde8Q3OH73RFpSnMz2IYxPaSOUaWZrH
         4clST3eRydQEAPBIf+jX9NH9WUupZNVoj11JfbE/VS7hl/7aJvsxyiI0sjJvyo4nubjS
         q0Vp0b2eZ0tdu6uIPaO2l83yAV3q6lQBEi2MpIh+nkDnc+3CA5/dS7YCO7YMWPKLFAAz
         /5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nm6CIpHH9aBKYNyn4RB4weM0wPhHggfU/Ja8w2ciW80=;
        fh=gVdlaufuZoOs5VrhOKWRzkT2DjPYxUF/4mnlAfmSyO4=;
        b=AWPHGRLFEb9Im1rOdCwnNG0mgBvucoHQ4E769HW7ltzeqIsBUiOxA0ilioGZxLUUHA
         ISanHndWjaUxUyINqDtAMghLjjmpuF3HfBBnVg3fVJj3eJLZQBSnwXTo2+F793P3ojYZ
         Difb95x2zmbCsVfCK/FGuBLgiHPNgQcMhe+y7kQyj9+UHEXD9HOIir1JDUwjmrgKPg+a
         gB/rfNDfYja3bz1dh/hA4jbQhD2Lfv7h6ClNj9dpJ3v7Rzle4IwqqeGSvt/DOeg+2oBo
         SoWXSdmd/Sak1R8+rOVShBpXr8VA+RSoyjjvudv5JcefJACcXy+ut/bgF4A5afuXdE3O
         yUcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779245984; x=1779850784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm6CIpHH9aBKYNyn4RB4weM0wPhHggfU/Ja8w2ciW80=;
        b=FScllV7G2k+D1v8PmOdDwC6T7gygxarhik/mjdQDEwoVhE9nFjPrV4UCCUX6QlrFgI
         jbcP1qg3UZSlCKOlZR5G4xaWcS6hn4OPQjeZ5sZAdUKtP/kxvHPwJl4GoxPdtnxcOUmL
         51Zh+RTpTrgR0Odz/qWf9At506XFbsQ6cinzqjVns6MUNqhNUvptHP385mn3mAeY9SM4
         lEKqtiTj7rFHveelEBN1FCmOWMxDvDdB82wLSgxjK2HgQH7jRD5DAbvPa99ZVxQ+2ZPY
         7ucxHr1+zuTpFLRehRJ/bMHEpkPoqXikH3514aQxnQSLY9zzj1N0HtJvz80IiF6XyrsJ
         +i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245984; x=1779850784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nm6CIpHH9aBKYNyn4RB4weM0wPhHggfU/Ja8w2ciW80=;
        b=LN4Zuw6fJX9N+Ww534cwe478inoF/hWUjQhnKcVHr9OvlHhH/uPYcZBXAjWvpDRQ4Y
         aJioQ2Xaefg6bnmjK3TR7uuuNOUPtKwNBouYG5xg3eoTuSclpXTWkc3RcErkb35lPGXh
         4eYw/5zVye/koGMaAs1UIRsnMdi+W6tzKUnulwc0Gs4SC2u5hFZKwoNx6MbsaNDyR+/F
         DDAqHBQQSH7IyftF19DYhE+cGwl0SyXOn6D4QgF1pFS8/fwtf8DxMGFpF6hC27sONP3K
         274KGJcXdwOsxIW98tx+/ynE/X28Vnb0gHQjHZvETuZ3Vtrdgx9keq0dFxWDd/MYZV/7
         PAAg==
X-Forwarded-Encrypted: i=1; AFNElJ9/6S6XvADbsSNAivhrQmHDjihDsZLz6/UJ9sWYx8Eh3+6hCF9AJzObpdIHhe6ZRMwPoy6UVjEMDi0Xe3dKuFrRXLUOow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6k47GtpM/Du6pdAosUobtvEXxg7oNbZ0Y2tbx0+sdtHSvkO8U
	Ei68LcllEJIHEfk3fp/KNVtyl1rP7UY6mxcw6B2ybzdAA0De/wbJqgqypTgD2isYUxe4hi0jy/I
	mLXSRou9sViowcDB03msdX4wJ+fkOUaI=
X-Gm-Gg: Acq92OGjeDMFPVChZXjZ6wFfpHwRjhQmzoKpFcHV6PA+mOulpV9I9kup9MC/x6BQtd8
	6AIZZPLoIL9nFrQjk4p6B1VomGNhXW1XVJDL543WGV2pfgxGMWrsVxbPMitoECg/kLvwUzaZrqS
	DNzGQ9Y7tG6orrgUDMM2i0Lvk0nCGo2YxhWKpHzrC93jwrkyatMMU7G03Y/Nu4lheeOBbIopcuf
	oLIorW5YudC2O/AUBnzGBFYBiLSUPnddqHWm35xk54SGcYuCe6SQJhUAHa6u41S8PwPeyb6tUp6
	ndmB4BpGFDJ4D6j+fbUJfSS7BEuIAwm/Gh9tL2DFKWUPPyxy4cj6sJjfhUw=
X-Received: by 2002:a17:907:9611:b0:bd9:e001:fbc2 with SMTP id
 a640c23a62f3a-bd9e0020955mr188644066b.30.1779245983230; Tue, 19 May 2026
 19:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518-handshake-file-pin-v1-0-4bbcb7e62fda@oracle.com> <20260518-handshake-file-pin-v1-2-4bbcb7e62fda@oracle.com>
In-Reply-To: <20260518-handshake-file-pin-v1-2-4bbcb7e62fda@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 May 2026 12:59:16 +1000
X-Gm-Features: AVHnY4LterXSqMooW_fn189c4rCYxZ0LkAk9IW_2wIKW6Yl8XwJEA0sFFAXx2F0
Message-ID: <CAKmqyKOvK+MVuVy=tMgyVEPoM6gyQGzc2XCxxgRBK8aqRXM=3A@mail.gmail.com>
Subject: Re: [PATCH net 2/7] nvme-tcp: store negative errno in queue->tls_err
To: Chuck Lever <cel@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Chris Mason <clm@meta.com>, Christian Brauner <brauner@kernel.org>, kernel-tls-handshake@lists.linux.dev, 
	linux-nvme@lists.infradead.org, netdev@vger.kernel.org, 
	Chuck Lever <chuck.lever@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:29=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote:
>
> From: Chuck Lever <chuck.lever@oracle.com>
>
> nvme_tcp_tls_done() assigns queue->tls_err in three branches.  The
> ENOKEY lookup failure and the EOPNOTSUPP initializer both store
> negative errnos.  The third branch, reached when the handshake
> layer reports a non-zero status, stores -status.
>
> The handshake layer delivers status to the consumer callback as a
> negative errno; the other in-tree consumers --
> xs_tls_handshake_done() and the nvmet target callback -- treat
> their status argument that way.  The extra negation in
> nvme_tcp_tls_done() flips the sign, leaving tls_err as a positive
> value (for instance, +EIO), which nvme_tcp_start_tls() then
> returns to its caller.
>
> Drop the extra negation so queue->tls_err uniformly carries a
> negative errno on failure.
>
> Fixes: be8e82caa685 ("nvme-tcp: enable TLS handshake upcall")
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  drivers/nvme/host/tcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 15d36d6a728e..68a1d7640494 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1702,7 +1702,7 @@ static void nvme_tcp_tls_done(void *data, int statu=
s, key_serial_t pskid)
>                 qid, pskid, status);
>
>         if (status) {
> -               queue->tls_err =3D -status;
> +               queue->tls_err =3D status;
>                 goto out_complete;
>         }
>
>
> --
> 2.54.0
>
>
