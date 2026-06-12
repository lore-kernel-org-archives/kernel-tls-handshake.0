Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197535DA68
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293437; cv=pass; b=XjT9v3oO6Uo3kT1gSHtJ92HLDR55LaAJO1AqWi+0F2WN7JTgfQS4vw9KT+Jr3yE0B6/RgHwMjoQRfhum855mv6SB08XFZ7vUuz76G9JrIUJ0X3LljgcS9fq10cVZiooW6XC8Mfl8Uj8svOeiaiB3/3GrLWllAvKAioHNuUd1QAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293437; c=relaxed/simple;
	bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fo85Lbp/p2sI4ywB72LM/yuTvpfHwproCGKaQ1idNbcepfN9WYFoB6aF/M5rbtsKTkAbmByyJ10yNpX6/og7hVYHCTaAjh64CRHMmdoWKYDO55pGXcowp6Z5mjETp9flDj8UsSkLNyUps61ezXMdngfAS21dOYuu/CSUKdyaDDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfSurQj8; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfSurQj8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842848fd613so1401099b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 12:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293436; cv=none;
        d=google.com; s=arc-20240605;
        b=NJil829Uk6pYi6blIZtVy9KAmm6cHSJhRyrtoGA+vvQ914oDAPZatIHLvv79/a87H+
         kgKhtfISA9gh0ePjWxtTCovKC16c92hQNEFM4Sf/pSPNPiM4d5A7K0kRm6mcYVkwe23X
         4zm7VdzHQ3NYThX1H9rjtkO4aHHIytogBbflkd0xo4pc/MgzUaS0uHnyaPun5dr33c2o
         0x79NfMsSFvi4VUp/KLCinN9Xv8OENZbIHc7LSRS/SJxru7SquGg1mktvOYnza3YY7jD
         H+l/VMNE5W4sqKq7qascWrcD57KpFrjXXpa6Fm4WZvVEm7dkMmcMFEb0iG/gncgLcbaw
         20BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        fh=Fq+5fT4LpwFWJjY19xNt3ZrZBFNt0mUqLcmk3Sa1wdY=;
        b=HJEiVonEznB8bimbpi20USrzG4dPcclzb+tQHkkQAm1HiJWiEiujANjUVMTDBKRkds
         lXpQu1uyoJB/tZ+4drahxtJBjz+bHd47swBBaMURX1jROaGYoIO6njwEbgrb9XSG2md+
         pRHHynv3toaEP84HmEWfjjpCqhwQOP9wCPsSAmIpW18DqOt5j7u3qk14kMOJlNc73c2z
         qM2dsuO7JsTheJJeB0FoFyHxEKkhujRS9TG+uhFIQ4vVUNEAoc2Wu4072EzvwqwCI92D
         2akw9pJOLdrGzHozJkYKIoqjVyYZo0mgu1Tz9jeNfqJ4MX8JbFv7YBoAkygsK/OLGsMG
         8Bow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293436; x=1781898236; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        b=LfSurQj8iw0ulrY5pkO6UEqO6mtOciGWrOczqksYLiRai1Y7QHWPGMiU2M1ZUI3psF
         oqAALAjxRDiSZ6JMqsbk2yuADR9mNW4mCQzYLAynmmH9lGHHC5qtLgQOHJQr6508w4pH
         nC6dYE7BAO9J5cv+3Bz8xLA60HrXwyrXjl/Eiw3ghI4QTyNCPTBxSHxFk3XzZerKHG2C
         /6ob57UDN+lyffzQsQZTGKXkxaWhSllI02J8Nc+VND6/SuCy0OJguwpUfzTTZncunAh4
         woP0CsJ0IlFqe5JO64eT9CGVhGkHc80h0LMTddjWvJzBzSUedxPGY2m3eNcvrQhnpNsV
         fPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293436; x=1781898236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        b=YFvk8tw9dkAuLid7+guRJpbYHDUMzbzfA20FncNtpkJQLHgwiPinki4YEtzlzr6HWn
         7zv/sVXBU1G7R0BiAJD6+PAkwOfSAyH2rNrSdTgd1qStTPnKUQkxf4ILInsk5QpEHLzN
         xZOV1w9uZ/USBJiyvV0+QPiE1HwUFUaGSRERWmMfZ9z5gXb7FROKt5UULRU4H6uUPs5l
         eZ5vIzKjXDQKyw7P6UQoFsaR5hWQvMlRmcX2qdsWJxu1aS7fHKzyrRs/l6q6CQpXBmO9
         fwAqNtxiI73kHGZ+c8r6zDEpboutdIL30Upq4Rib5w71GTMfLvFypfYktaFKWLoH/tpv
         hS/w==
X-Forwarded-Encrypted: i=1; AFNElJ/CZ+lEYpXR7E5uugR+pFFlVeNedAMrPxCNUqmfSOit68pFYVWqMIEPw6/OOKsOcRQESHbnhVvmISEtOFDVHKmdUtMFww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOTKwUIe71fGiFlT1Zw8xmaRMIo9QLJbm4K7r4LUvSAtpJgdut
	CEF28iv6oZDzJ44ixuOCktVayGJmCMp8OaUnmghBB3pPicifgJROrdmeQYN27SXEh2ysedO4uTY
	AYrDiCBsoy7lE8Z/47ceZXz58w2PQX/Q=
X-Gm-Gg: Acq92OHJSwBDxB+dZwKwS97syQoyAgz6mKWkymQIJsZzEOzNZgc5dWk9661okjzPBRs
	1aUBYglIFq3MQZoIbZFRgjFkYhhomtbdlcHVEAl9QHay6SF7lKA+vtuGu43hO96y55qMwhtrkaJ
	DVxyHDCCIcnvU5Td3lekXj7BdIjq16C31V80QnxkQftzANZfpXdmiHPxJCaAiqPiqNjtH7ag1E5
	Tt5TxnhSKnTdr4kDOmuOi5Dk6Zm8kVhvmqf9jeDvXLZAUTUr7L5n2U5SD6UKFsbg+lRH38zOZiW
	XX+5/5299cWIHIa0GXcJ+PTyHUog7pAFUxM0ATFNJCO46xiZGPkjT05wre0AkG66Cj1/LSDYbUq
	mz+3U1Q==
X-Received: by 2002:a05:6a00:4146:b0:82f:1b1b:e166 with SMTP id
 d2e1a72fcca58-8434d0aeb79mr6315498b3a.33.1781293435882; Fri, 12 Jun 2026
 12:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <1b5480358209643e574188ccba83bc9ef0a84aee.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <1b5480358209643e574188ccba83bc9ef0a84aee.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:43:44 -0400
X-Gm-Features: AVVi8CcosIZ2HodYXSoI2GurOTwt4JyXnbbeTIrOgwh_78ZtgEuE0FazxT7w2bQ
Message-ID: <CADvbK_cvO+EGvbzySPQc4DvN7GM-94gFZK+_pXMSkj8b9--DDA@mail.gmail.com>
Subject: Re: [PATCH net-next v13 06/15] quic: add stream management
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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

[sashiko-claude]

> +/* Get or create a send or recv stream by ID. Requires sock lock held. */
> +struct quic_stream *quic_stream_get(struct quic_stream_table *streams,
> + s64 stream_id, u32 flags, bool is_serv,
> + bool send)
> +{
> + struct quic_stream *stream;
> +
> + if (!quic_stream_id_valid(stream_id, is_serv, send))
> + return ERR_PTR(-EINVAL);
> +
> + stream = quic_stream_find(streams, stream_id);
> + if (stream)
> + return stream;
> +
> + if (!send && quic_stream_id_local(stream_id, is_serv)) {
> + if (quic_stream_id_closed(streams, stream_id, !send))
> + return ERR_PTR(-ENOSTR);
> + return ERR_PTR(-EINVAL);
> + }
The recv path here rejects stream IDs whose initiator does not match the
caller's role (a server cannot accept a SERVER_BIDI on the recv path
without it being closed/already-open). Should the send path have the
symmetric guard for peer-initiated bidi stream IDs?
Walking through quic_stream_get() with is_serv=true, send=true,
stream_id=4 (CLIENT_BIDI), flags=MSG_QUIC_STREAM_NEW:
- quic_stream_id_valid(4, true, true) only rejects CLIENT_UNI on the
server send path, so CLIENT_BIDI passes.
- The !send && local block is skipped because send is true.
- quic_stream_id_closed() compares 4 < next_bidi_stream_id (initially
SERVER_BIDI = 1) and returns false.
- quic_stream_id_exceeds() can pass when the peer's max_streams_bidi
is non-trivial.
Control then reaches quic_stream_create():
> + stream_id = limits->next_bidi_stream_id;
> + if (quic_stream_id_uni(max_stream_id))
> + stream_id = limits->next_uni_stream_id;
For a non-uni max_stream_id, stream_id is initialised from
streams->send.next_bidi_stream_id (SERVER_BIDI = 1), so the loop creates
a stream with id=1 instead of the requested id=4, increments
streams->send.streams_bidi as if locally initiated, and advances
streams->send.next_bidi_stream_id past 4.


This is a good catch, will add quic_stream_id_local() for send.

Thanks.
