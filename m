Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588032;
	b=nOC0omzsbQNx/5lp9m/kum2Hwjad7BeK0yU7h3b4ZKZ0X7VxitgbAFWpzMRPYU1WB5lF
	 1xtdiIpa8QNFRS977n+gJ46v7fx3uZgiChdhnEw+HCZ16dYr10YRn6cJeqsC1MI57dAnW
	 ltnHpBJMnztXlh8rva8g8iusbAz/HkKvz3UXsYfwmNkuImwBG35ktcITgoZ1yy3IBnvgo
	 NsNEf3Y3PsceGRMgal7HHLitn04rYcPqkV9ujNMM1C7H8dHAi3EMWV+1Q99IgYVaP/W0D
	 2gCQRIktR5gMLrpsA0Qx/Dj2Fv8CnKm0qjIlMOuH+hbj24XM4QztPPFmkBsMB4FBjJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588032;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=RCmYAFTcU3ebpR3ZsXX5enm+CnDlA3LG0++QH4D/MRQ=;
	b=ij91Ub4MTY9fmZc80wcuIWcoZFz4BFlL+A4VAq4aeoPtwQ8WcVt/Qg7vArULww1AO3UU
	 Jlt0NNRAhzNyuNpdsRoZDyrlmlTYTE926av9E2gfYUfczX4XgMuEWKQaeuwUIvEIC8ZPX
	 agUk0HCjm7Z+llgW31QRZK55j8qwUlGCwn781leEXnlQRdP7WOClbeEljxgkEMYNGY4uh
	 +BRDEk7LccYFnTrQQ94JonjESl17/iW4mSHuCPGHsRlNjTf6qD/GJ9Cww9eXc1LFzzroL
	 M/SwXLvSBjZWaZkQnOdNn4Mf7P3gxSWmEDly5cqSFQgfphJDqNyh/XM8XpVtBCbFQOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApZwW2Ib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85652606A319
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 Oct 2026 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApZwW2Ib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187091F000C5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 Oct 2026 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792588032;
	bh=RCmYAFTcU3ebpR3ZsXX5enm+CnDlA3LG0++QH4D/MRQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ApZwW2IbPEw288zS8buUZg0fDh1kI6DVw3oVh7/xIGGUSztvt14SChPhyFTwyB5AN
	 8GC1OGmqy0/0RoR8/kwSxKwRn4eqeszsvu2w1tu4rPiDLcbMKIWABQ5+wsbTjd2QGj
	 OD0EGEiPb1EGdHweYMQmVwFVLoQ682j7zD8IZP/KLvXbfpShJY3I9SUx4kwoqPkilm
	 yoTGYzFzblBpJk+rpiWH+2C68W+sh1f7RQN7K2M08CNvi5BSLVvmDQ4s11oehBzZVn
	 ZIKnSH9QelouoU+K8niyyoggOu9gljy2SdoMvnlfsuR1k2WJmQvyzrP7BeSB5LPoMZ
	 OSYUt5eKKcgrg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 76001F40066;
	Wed, 21 Oct 2026 09:07:11 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 21 Oct 2026 09:07:11 -0400
X-ME-Sender: <xms:_7jYatv1jvS0fZeKZcumHhjXJQxr2HQnFO41VZuML-xyzJJUQ3iGVQ>
    <xme:_7jYahRENP0uy-L3EaS1kwdQBlYGtoWsO4RnDZ0_pSh3Y70yok1mAz3B4pH-RZR9S
    lGylAx46C9kJgQDUpITiLnslog5MSUkejGPOvhrDln9o5Da77200Z9I>
X-ME-Proxy-Cause: dmFkZTFnGakfsi75SBzpuKf8SfPXzMOePq5AlCD+q5rXI/gWKHHbdbrYqgACZNLcuw1S3t
    VPwIY8vyA4ewK1Vmc35fHg85VH4oCJHF/kdNIMRtNt+llF3079d8ym70TtK3vsoHiT6Mej
    lkrcLl5AvazZnKhgQ5modA5fOPMi2xS4Mn9Dp7a6IeZ8nNYBDNu3QV5cHfHsnWUpS39CzN
    fn9hpff3u+ERpLvwKkOotaI59PkjTPx6Cf9gYYxkGtpsx7uaEVuka3WG8CtWldYhNiOtqX
    F1InsfgKe18s8WF+nOocXki0ND917v5GQ3XLtcLLvqh/hQAAiuuD5QBVlnolmOSZ2yoHgU
    tlcAd127JCeLZUAYLpuR1k4mcWBuhQm2YX97OtsnfJMwtpjJGPMDTZ7+jxqEUZQTYJbr7z
    lbqBlYYSMDQHy4WfCkTAcgP/+do7MLe/jliv436tw7K9B+3+TFlUBZXZGGL3gX+FjsDrIM
    IY1n6UxCZTW51Tj/D9iQV29Dv8FX/TenyI3OzDRxSmKbvvz3o6xM3w1OKFJUAxzPmL+cVx
    8uWd7WgsxUXd7cunE/dAjLxC4lQSV28vcdPTRa7a6j/NUr7LuT5voLrI0KC83Pixe12qSK
    4Yd0/76ejYtWgioB41m5mSlvF05ssFW2e9GuiBh8chDsjqEG2/amVqLvVOSQ
X-ME-Proxy: <xmx:_7jYahozID22PJ6q1ZsQnVozxKUVuc6_eesUGpeUygJRk_yLeDPyDw>
    <xmx:_7jYarahYYVJEDfd7IluEyUoovCGQd6tsyPtkI2DaILg7MzN0FsVfA>
    <xmx:_7jYahTaBNSxsDGTrj8Z17lpbnpKG8f_nETRN0cQr7LAOU1GEixWIQ>
    <xmx:_7jYaq5TAA8uVkn-BEhxdO89LDibYz1oYRcXieR9L3kUN_lpg0uOrA>
    <xmx:_7jYauz-jCSspVS2Q9Fb5pi5ykgQJGwhnYXi22Z9JRJFQh5q7Wg2_yec>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 591A978273B; Wed, 21 Oct 2026 09:07:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AikR2skN0iZ7
Date: Wed, 21 Oct 2026 09:06:51 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Andre Sieber Arens" <andre@sieberarens.com>
Cc: kernel-tls-handshake@lists.linux.dev, "Xin Long" <lucien.xin@gmail.com>
Message-Id: <7cf54f03-76b5-42b1-b9b8-a899efdcb067@app.fastmail.com>
In-Reply-To: 
 <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
References: 
 <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
 <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com>
 <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous QUIC client
 path
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Oct 20, 2026, at 9:40 AM, Andre Sieber Arens wrote:
> Hi Chuck, hi Xin,
>
> Thank you both for looking at this. This is my first contribution to
> ktls-utils, and my first patch sent to a mailing list, so please bear
> with me while I learn the process.
>
> On Xin's first point, keeping the GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2/MD5
> flags: agreed. v2 keeps that line, so the QUIC anonymous path sets the
> same verify flags as tlshd_tls13_client_anon_handshake(). If you would
> like those flags dropped from both anonymous paths, I can send that as
> a separate follow-up patch.
>
> On the second point, the patch not applying: sorry about that. My mail
> client turned the tabs into spaces. The patch itself applies cleanly to
> current main (e486e5fc4ba8) with git am. I will send v2 in reply to
> this thread with git send-email, which should avoid the problem.
>
> v2 builds with -Wall -Wextra -Werror on Fedora 45 (GnuTLS 3.8.13,
> GCC 16.2.1) with HAVE_GNUTLS_QUIC and HAVE_DANE defined. The same check,
> on a 1.4.0 base, has been running in our builds: the handshake is
> refused when the server certificate comes from another CA or is issued
> for another name, and a valid certificate still works.

I applied this to ktls-utils main.

For future patches, please put them inline, not as an attachment, and
send each patch revision as a new thread.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
