Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA85449EA8
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Jun 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496080; cv=pass; b=ZBMWSvsB9HBy7FVlF/VOZMJF2GrolO21vW4HHavI96eIDbkK1HrS44Z1Ljj76TMBGREr4t/6V1lhQd6jdIl+FS4+DxcepidzyVOs4mS3g8qR028hQfTDffgUSiws0f0P2eW92f3YZ49UhfBpqFPiMg07DwGmQmjUur44yieVXhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496080; c=relaxed/simple;
	bh=GVn5Lv9HKRp9C9WqvkbPPVBvO9kfeaXDD5rNKVVFxPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zy6PZZ7QI/5OryUrKtcCxnEax58flU+JhfugwxBBoeihbgCtJbr+SjChC7V3/a7/tUmU/KqEHQmsHZEk6jg4uRpj7fx0mTwez7JUpcrAiGIM65rMy0O1czdjfDPk2cfRHKF9dd5DIBUHZ032SiDcHg6iTekNFSxl6rTpXhDs+JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+CPMoLt; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+CPMoLt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842848fd613so771812b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 03 Jun 2026 07:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780496077; cv=none;
        d=google.com; s=arc-20240605;
        b=azChsrVtPoESafJgS3L/dorfxc7S6mD5ff0KllZuOUYZqTgAgt3ODsKI0xhN/cQH8V
         P7tm5kL8SjbHocSfHwZBKSCV/YiPuIpNJsYt0fsYgP2igUpWlqiPQSSomQKzIgyGju3M
         FCHnuHXW8TEm+NOGpWkeRq/7AxVQpMjAtcVohCseL/o7iBNBHAdpke0O/XLDL16r55F0
         bZnitdi+SkThDCLYGjxjS+HY83gkwJYkscI2609RnWy/yG/UEz5tQMvb8yStCHg0YjNB
         COSBKYUvIVVZkRwoD4a/j2gm3K6gbt0Rdpqtu0OvliOlzOb8DTIZ6ymRRjcKd5G+ZuMl
         FVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        fh=l3meqc/zbQ1YiCoA641kM6BTu+5k4SxLM/izblxKkY4=;
        b=E494RKeeC+nuDvoiO92auidnEHtjCBp/nP2loZjz58HhFMZw1RVCRMZ+5PkwE3Mz35
         h6euOdUHfEgSDaLjQZxVRHxhPJQQHN06g7HCoiRNVMRDe872WlzCiKMZBupxdhnoSRza
         mrhxnVPCRFTiPgTFGY9RuKQQBRF3QspENwe23z8LefG3wmdwQlvPUXnQiUOJKH98kZqD
         XNm2R0LE7Vt6XabTlI0pTDaA5zRHGPovl86EwC0xFtrI3gbKYLAS7IVCvI8tDVaJQ0/0
         4BhHszvB4Wj50XDccIEtiso/s+1JLlnyjO+4G2bjWRgh7DkQNF7yHGY7cB1TkGZz/DgQ
         LPHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780496077; x=1781100877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        b=l+CPMoLtT6Jv3r9hXUn7h1MHbptF6J6+hfSbFjwwj5k1XDTsyFmwnAZicUMW3h/KZM
         lB7B8eA88lhMd1s6TOk2uFbPtT56k+JlbCtUwmgm9Y1zldiRvrk3hdTqOduY20wVpNbw
         6fK0dU/KevqI9dHlNG3RVR7GNE4/HP2f/nn+tqPiH0rEHK2ZwD0swW3KovLmdqNMqTGF
         etwToRMEG+/tdVWVe1uY9Kj4ba+3gv4QE0aiuvvlq/od09AbLT54T9wPNC27PhvqrYg6
         6++T+NXDoHTwczW2E4UBfRNJHDPc7a1knbkXUlMLTF1gCU6JO1VDiMnuBr9gFKfbzlEC
         L9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496077; x=1781100877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        b=r6jF2NnCb5oo02fvR4a+7nFNoe1LMPxgdbPs17OWMMXhv7Tc8k/4cVxvOXYK/68D38
         I6e1YEmIxMDcp9mAkritf6xO+UXAtkXJ/svMeM9BEE9N9Yy5fohsv7Q4yuASWhoE1Hzk
         cqPMwJSS1kOpoAMH9w4zR1sUu+lEC3+NMXM5PZlyEEg1o2+bhn7ni5GYSbTzpNf/nWOF
         nAMawLnrC6sK5Ze9g82CFpceaJNYbupxZurGqj6MwCD6SDiDM8R/r/5xQaLIpDCe2ri5
         lJ1/vtcwNw5MPqiHo6xg97PL5rqMOpq55yOk02JSZgTm81kJA3PZLSvTv8JsX5aZXp0q
         Q/ng==
X-Forwarded-Encrypted: i=1; AFNElJ9Ng7Bk2Cs2f4kUcWOUJ+rrBB5ST3AsRPF3IEtZj0SPLOHO8UULzaz15pGylGjYHcqcSwF9xiheOMrEnuWlqeSf/AqnCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRdXvNc1y4WLwcqL4FvG0AatwWaGWCKlyT2AU57ss1g6GqF0Gf
	Q4pmDP3chZiRR5EXnztbHIz/AyVv92Nls2tPIc22i9uYY8IA2m+aR4GRz5y4LRJ6n0JgUgMX6Ue
	VDNsyla5RFjGqvl+lkF5VTk+9X15psJY=
X-Gm-Gg: Acq92OFdu1M+RK7IqMgqlvWIgtfLuRi2WiUz2MJ0phbs8A4elx1LR+rt/THl7ne0qNt
	N7B5dv9ryaBPVmcZJLLb3J/VlKF+zZre1c7LC6J1Tjgp2IEFsO33OIDcykT2lBilt6KZKxPf1bw
	pWCzvv56/qnqE4hPrwwl+QIAL0kCe0NmaSjucPr5bTZOVNetOCriaFZ48la0Z4igc9+4umxM9I2
	u0mUGqsa0hGkZn0Pgg7VvyE1VYa/jXuBZyKhVP45wPxgrUPxFjiWAaG8JAd0j6YfAAB9v2+MU3f
	r6rwSI0C370423FAR3LyVOkbkYw9BM56dWjTsEfzzI+uoVuHv7zINqAyJpEx7WoQAhi7tPXTSVU
	ewMsE8eT3U+IMV5moCjEAP9ttzqWPh2KAZRXIBXzGMh0pd2Ss
X-Received: by 2002:a05:6a00:1491:b0:835:366f:5da2 with SMTP id
 d2e1a72fcca58-84284f3f96dmr3416839b3a.37.1780496077086; Wed, 03 Jun 2026
 07:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780232930.git.lucien.xin@gmail.com> <CADvbK_fBbLCwY61HXsNeGCA8MhiBKcbvE0BvSZppohJgtXO+2g@mail.gmail.com>
 <20260602111823.0b1129d6@kernel.org>
In-Reply-To: <20260602111823.0b1129d6@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 3 Jun 2026 10:14:24 -0400
X-Gm-Features: AVHnY4LQ8snWAMk7idEx52eDDVjzE-lgA4L_Uyr30iAlUILJ8Ee2UHGsNH5YNQ4
Message-ID: <CADvbK_e7T=Yfb800TbO+BcpDEp=Sf6rbtiy2daLaskFAjeg=Ww@mail.gmail.com>
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

On Tue, Jun 2, 2026 at 2:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 2 Jun 2026 09:12:30 -0400 Xin Long wrote:
> > Note: I've run Sashiko on this patchset many times locally over the pas=
t
> > month and addressed all the real issues it found. I don't see any new r=
eal
> > issues being reported on:
>
> Coccinelle had a report tho:
>
> The NIPA CI coccicheck run flagged a new Coccinelle warning introduced by
> this patch:
>
>   net/quic/crypto.c:1164:13-20: WARNING opportunity for kmemdup
>
> At line 1164 of the newly introduced net/quic/crypto.c, there is a
> kmalloc() call immediately followed by a memcpy() into the allocated
> buffer.  Coccinelle's memdup checker suggests replacing this two-step
> pattern with a single kmemdup() call, which is the preferred kernel idiom=
.
>
> The fix is straightforward - replacing:
>
>   p =3D kmalloc(len, gfp);
>   if (!p)
>       return -ENOMEM;
>   memcpy(p, src, len);
>
> with:
>
>   p =3D kmemdup(src, len, gfp);
>   if (!p)
>       return -ENOMEM;
>
> Please update the patch to use kmemdup() at that location.

Will address it in v13.

BTW, is there a public link to the Coccinelle check results?
I don't see them showing up on Patchwork.

Thanks.
