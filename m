Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D842065
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 22:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758667281; cv=none; b=srJPTjYeP8L6jdw0ixeFTxVvmL/+QsstM1YG9gHkSTb9I11dj7VRwNqw9agLWTUsvKPaqpfzkaYqxsi0boHK/e0wAxEzVJFdU8K25JlQlgFB2mwHZsZS45YMfw4CtwSgu7B58zpB69PTW14YMxmcMWsv0jShiSn/0SO0Zi3OQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758667281; c=relaxed/simple;
	bh=cmBsUZipADskDpX6PlXa2pbKkZTLpakb0o4g3FwfvIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWkJOh/hXScvfhAUdU0zDJngHcGB+EMf9snL8F+7DEPdyWBjfWKsgLGC3+k8rSsSVqQEgqNlnu05SNQHXfgPc6qRWgnJi774wC4W/Kb9CyLR2jSxk6wmduqWJiGRJNBNZKDtAgw55zgaAV+uUHS1FXqyPQ34fZAxx7eU7Yfeg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctS/FUH6; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctS/FUH6"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f67ba775aso317303b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758667279; x=1759272079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37r2ox4TabLsTt8j0ijWDMYWPMezxYRNEUseCEHx+eQ=;
        b=ctS/FUH6UpUVkv4GS3fIEiu3rRdZD8PqdkEwWwmWN9qlA7XkrWY5YInI0IqdjRloTE
         aXQX/w7aYw5yhblJ6jnCPGivNlnu1GM9xhctjfXdofal9b9QACARwhrCsGkfDUfbF/oV
         tYIUHp5yZZOERC40BN2KSa/FuBKiIg4dntcFn1CLkqi+PoEnSX3awhI0jM1xb/wxB7Pf
         4ocOCcQ5ypZMz+g9I+6vy2OQUaBErz2FBvdliGNhVOKTO6OhepiwGlG3cTKOEorS0/B5
         BfnR5ApnhnRPEmKX3VfzAmKBrOBYnYFIcDYEvkq3sSmAide1M/GQAnK7dxE2UUAC9l9e
         DKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667279; x=1759272079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37r2ox4TabLsTt8j0ijWDMYWPMezxYRNEUseCEHx+eQ=;
        b=KpOipl0QQwjzP0omK2gUpC9hMHzJbxmahjs3D5r/+0duEYdQMJQ+J7zTj5Nn0a2DdI
         UQWhDaRsSOQFtMbalqy5hh6o478uP7fJ0dS1MlCEgPHH1F4aKGs9urzvXUSuyL4WCyQu
         /8zePAnfMoUN5VjA+VtRB7y6Jn2RMNhlP7waIAhd1DvRlZudZAXp89K5dkdSbXEqJX9N
         GNTb3YncR1gNkq775pw/tDMAKaBcUbRpKWKFpL5C4YeOnXgeZdZYXPb8iU0BqdUAZjyW
         k0dmg1LOAh3UuVRvWnr5Hq15woF3crT4PzDvrz3yKZLIBUwqsOivLBBfExYOaltAdAaF
         oe9A==
X-Forwarded-Encrypted: i=1; AJvYcCWZKzNql5BP5Xp5ZIU9DIScumXTrqscoZTlchX7iudnKoNNlu4en4pFvbswNWrCXB96fJSca8V8YshjIbxULtbw1fzfvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxecxA+fX0no244GZq0A6QVl3SNCYxEjBY4I3vHDfj7RCIDm232
	iwH2YANx2k9MVv3kwEoYZHCtqGxrePqyAYhuYBPETp8/ushgiX1DywKSumpMXd+UKihwzT1h8ct
	Jc/0MZTSAVxmHp51jTRfZdRBE//ZRay8=
X-Gm-Gg: ASbGncuu1qBTmlJsUutzPlkYpJ+k05sjhpzc+aO/b59CLMBIwi/8HfxJ0P++2d0Fb1/
	oXRvzIPxFmAC/9itprxFaYCc8cmu1kdgQZkmfMk65rY9jGjcofHe+RVDdhXNABVYc1sa25oGSPq
	j19ysSRdn0gM9Dez8kDWia/0zTGDlSMQ8Y3qlpb0J0qG880nQ9Dv37NhehnQ2QbETxUjnL0w32E
	XflqPYF
X-Google-Smtp-Source: AGHT+IGJrhruMouGlQvilSMSMvkJRpvcE+7ng4ekxj0llVbMFk7UlZv+A6r8Z8NnLT3xIyP42jJjo7saHoqF4kWN6fQ=
X-Received: by 2002:a05:6a21:99a7:b0:262:e0d4:6a9 with SMTP id
 adf61e73a8af0-2cfee3b80demr6158025637.34.1758667278721; Tue, 23 Sep 2025
 15:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922220710.1255102-1-cel@kernel.org> <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com> <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
In-Reply-To: <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 18:41:06 -0400
X-Gm-Features: AS18NWAUKnMbQ0DUtUDMy-nzktmVze46MvZZ4T2FBlYoybfgGmh3en_5Jcy7SlQ
Message-ID: <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 5:02=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 9/23/25 1:27 PM, Xin Long wrote:
> > On Tue, Sep 23, 2025 at 3:18=E2=80=AFPM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 9/22/25 3:07 PM, Chuck Lever wrote:
> >>> From: Chuck Lever <chuck.lever@oracle.com>
> >>>
> >>> Static analysis tools have noticed that
> >>> tlshd_quic_serverhello_handshake() expects its helper functions to
> >>> return errno values, but two of them return GNUTLS_E_* values in
> >>> most cases. Convert those functions to always return errno values
> >>> or zero (on success).
> >>>
> >>> Cc: Xin Long <lucien.xin@gmail.com>
> >>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> >>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> >>> ---
> >>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-----------------=
--
> >>>  1 file changed, 32 insertions(+), 22 deletions(-)
> >>
> >> Xin -
> >>
> >> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
> >> Callers expect an errno, but internally the utility functions set that
> >> field to a GNUTLS_E_ value.
> >>
> >> Can you apply this patch, fix up quic.c as well, and then test both an=
d
> >> post the fixes here?
> >>
> > Sure.
> >
> > But conn->errcode is used to pass the err to parms->session_status.
> > What does parms->session_status expect? errno or GNUTLS_E_ value?
>
> session_status contains a positive errno or zero.
>
>
> > looking at tlshd_start_tls_handshake():
> >                 /* Any errors here should default to blocking access: *=
/
> >                 parms->session_status =3D EACCES; <---
> >                 switch (ret) {
> >                 case GNUTLS_E_CERTIFICATE_ERROR:
> >                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
> >                         tlshd_log_cert_verification_error(session);
> >                         break;
> >                 case -ETIMEDOUT:
> >                         tlshd_log_gnutls_error(ret);
> >                         parms->session_status =3D -ret; <----
> >         parms->session_status =3D tlshd_initialize_ktls(session);
> >
> > It also seems mixed, no?
>
> The -ETIMEDOUT arm sets session_status to -ret. ret always contains the
> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
>
> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
> gnutls to kernel"). Passing -ETIMEDOUT directly to
> tlshd_log_gnutls_error() does seem a little bogus.
>

Got it. I'm trying to align the QUIC err process with tls13 code.

- tlshd_tls13_client_x509_handshake()
- tlshd_tls13_client_psk_handshake()

- tlshd_tls13_server_x509_handshake()
- tlshd_tls13_server_psk_handshake()

It seems to me that: When gnutls_xxx() returns errs in these functions,
it only logs them, and doesn't set any value to parms->session_status,
but sets it until tlshd_start_tls_handshake().

So my suggestion is: not touch these functions for QUIC code:

- tlshd_quic_client_set_x509_session()
- tlshd_quic_client_set_psk_session()

- tlshd_quic_server_set_x509_session()
- tlshd_quic_server_set_psk_session()

but change their callers tlshd_quic_client/serverhello_handshake():

@@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
tlshd_handshake_parms *parms)
                ret =3D -EINVAL;
                tlshd_log_debug("Unrecognized auth mode (%d)",
parms->auth_mode);
        }
-       if (ret) {
-               conn->errcode =3D -ret;
-               goto out;
+       if (!ret) {
+               tlshd_quic_start_handshake(conn);
+               parms->session_status =3D conn->errcode;
        }
-
-       tlshd_quic_start_handshake(conn);
-out:
-       parms->session_status =3D conn->errcode;
        tlshd_quic_conn_destroy(conn);

and then in tlshd_quic_start_handshake(), keep the code setting
conn->errcode =3D errno, but set conn->errcode =3D EACCES for all
GNUTLS_E_ places.

What do you think?

Thanks.
