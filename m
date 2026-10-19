Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF45938BF
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Oct 2026 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420450; cv=none; b=a7X5EPN+1E2RJzJkeWgMfWmZQzKMFhkzpz69XuCS99b71IaPMUAtpZLGe9V2PT3pIfqbwmFUCagl8xAgJOpyqc+p9SOnszkNwhv7EJIRl4fjrjLV+f7qgiyq6ENxWKjL//+dxIF6MQDspwFYSjXWHid7sKrCjJITm07OBfHYsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420450; c=relaxed/simple;
	bh=KCOn9yx9dfacjnx2ymk4rDCUeSU/QtjZs+M6aj744YA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UY1r4fsAi8q9SORE7i/8TOzFHA/0lo3uHtkoeE9NHUUOe/BYNpBc+UHVME0NTp0ixI618CsZ5sgzZGzX71A7ikDsK46IUhB6yYBQN+WTKwFdJtOPkPkMSeTgpY6EmFqQeviJIY+mTNZWNYlu/0lyAwGZbfqOo6/82jwmj8Y1JTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxeV/kfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxeV/kfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE351F000C4;
	Mon, 19 Oct 2026 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420448;
	bh=OVEhX/xgdWh7h/foCHmk0y8+845PHuzJyw1lSYIr0WI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=oxeV/kfR6FRhyurWlSp3QlOtprsPkfWVvZHSt2qFjT7oVwNl7BnPoAfHI2X+A4AjK
	 4KbkdDSJldblSSxvjPupOIhowBapCjWybS/RtU0AI8SQsZWGbIP96I8pvi/VTE/NEu
	 7Lu5tkm1aGP7GsznrsdCgNqZ30iO1VsolwOGQufQ+iL+FUHMWyRq93TFmYXkor2qRz
	 WCIkajGF1zTGRJQN//d3UtAu+SYTOxLP+mCBdpKeGkLERSeX1GnDjk9cpSQOifDodc
	 dYZKm3Ib1V0zhcFG47b16LF+MuJmgLdixqltle427lDlx1MiXKBMKfenuS+m9n1xO9
	 EFy2o0cQE+aNA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 617BDF40066;
	Mon, 19 Oct 2026 10:34:07 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 10:34:07 -0400
X-ME-Sender: <xms:XyrWamaGe-gzJ8kuwlSM9Rb1okfzCeCoQLBwisQj1pBGKpTKWARavw>
    <xme:XyrWakOx7iy_RZ0Ag58TEanauYnFmUVoifBDcRI0BMhdCgfY-fDEbuKXTpCZQNs8M
    VCaYGe9TuTBQZQCauWV4PsT5TaitEr5-UdCqYOeE1uVLXo4Yw5jKKWm>
X-ME-Proxy-Cause: dmFkZTGuhnYYmFmynjKZM0sZo4CvCeaiJPXssg/kZwzxU+f9qAN+Kscsr3jACiEhdrzYvZ
    D902DOm/qe+0hKUiZGBVKCXqcafmURtRWM1hr+rJpqmXTEIR+R9VuWL3ryfnKvw2XtaOQo
    f9Xd/zUCxJaVI7RIRJx7m5wUlk5PreG00p5QLrBR/kXBBGrlu95I/itsqhFYAjIlKrNPlR
    yUsoekGhruF2Yjikb2thtn81MYKF/7Oax2ugGheMz4R8q8Uby5NHRR1Hu8sJamteuvxZ6X
    LiLnR+2p2RoVjvxLkkXqB/SkB/kDaifTvuWfZiDEncpyjJcDbGj7uQdZPcBdbqVmVAZ8J9
    aZRBDWIm++RGLN1pr67nuJTNe+vlt0AlrLIlbIVDFWbQD709HbLqccUN5MckF7sBqXqkFC
    v9mPcg4eCMqiRcN+ouK1+o0b2LeqHXnbOkf14I3h1S9XGypp0itJRHk2OKcFgzKKVbWxWZ
    8e4GHq3IA3lSYWqCwPdHQzaFT0cdl8TvQ7CkAYA57V01hyE2t1LBUIqU3J+7ENyhhwtZTq
    oa229AJHm0OSJIdAcQmliR/6c3vLn22qjDzTM5v2C8UM8K7NB8fwPLKGKVJKrQ/it0ZNEX
    RVCdE1UZ3cOL4pEBnC61azt4IE/d+7YSHfnNytIV6iMUCXoq2MaEK3BJpXkg
X-ME-Proxy: <xmx:XyrWag3qW_qa7lC7gp_1M580MiA6yFvgKUabhT-fftDQP17Z-LOE4w>
    <xmx:XyrWai3ZMCC_i_9GNyf0PNdw9X-K-tXnG9YMxPI9ClI3Ufq7i4u2gQ>
    <xmx:XyrWar9hyD0e6RRgK3HBNcMJsqSm3CmsVnUIOlq-y_ypDmr6OkXI5Q>
    <xmx:XyrWan25yB5RfZmmi7M1LJAccanF9EK9Lp6ADuXQnpdsLCKYQYv-LA>
    <xmx:XyrWag9SLEWhQxFUpJKs3-cMsPDVjT2yTtEn3VImVw8yr2SWMyufIBPa>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 47B7C782738; Mon, 19 Oct 2026 10:34:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AikR2skN0iZ7
Date: Mon, 19 Oct 2026 10:33:41 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Andre Sieber Arens" <andre@sieberarens.com>
Cc: kernel-tls-handshake@lists.linux.dev, "Xin Long" <lucien.xin@gmail.com>
Message-Id: <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com>
In-Reply-To: 
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
References: 
 <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous QUIC client
 path
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Oct 12, 2026, at 12:40 PM, Xin Long wrote:
> On Sat, Oct 10, 2026 at 4:05=E2=80=AFPM Andre Sieber Arens

>> @@ -760,14 +774,14 @@ static void tlshd_quic_client_set_x509_session(=
struct tlshd_quic_conn *conn)
>>
>>   if (conn->cert_req =3D=3D TLSHD_QUIC_NO_CERT_AUTH) {
>>   /*
>> - * No verify callback runs on this path. Without this mark,
>> - * the audit reports an authentication failure.
>> + * The client presents no certificate, but the server is
>> + * still authenticated, as on the TCP path: its chain must
>> + * verify against the trust store and match the peer name.
>>   */
>> - tlshd_dane_record_unauth(parms);
>> - gnutls_certificate_set_verify_flags(cred, GNUTLS_VERIFY_ALLOW_SIGN_=
RSA_MD2 |
>> -  GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5);
> Should we keep this line to align with tlshd_tls13_client_anon_handsha=
ke()?
>
>>   gnutls_certificate_set_flags(cred, GNUTLS_CERTIFICATE_SKIP_KEY_CERT=
_MATCH |
>>     GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
>> + gnutls_certificate_set_verify_function(cred,
>> +       tlshd_quic_client_anon_verify_function);
>>   } else {
>>   gnutls_certificate_set_verify_function(cred,
>>         tlshd_quic_client_x509_verify_function);
>>
> The patch appears to fail to apply. Could you please double-check its =
format?

Sorry for the delay, Xin's email got swept into my Trash folder
accidentally.

Andre, can you respond to Xin's review comments?


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
