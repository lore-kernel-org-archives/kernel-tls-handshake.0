Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDE27B329
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 03:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759289884; cv=none; b=PcyXIiKnh2nnGEqJSzwhRdZO3M5Z631g9IocNfq6ESVQbmcvPeM2qG98jPPy1ZJgwgxEsNm22ytrh5QeIHU7UYzTpAlTLvC509oQP3BWjMT4+hO0bqII8nLu3KJ5qS0RDCKge6PB97hcUVjYa+vNG33Y/S1b9O5YZZlBDpCq9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759289884; c=relaxed/simple;
	bh=e/eLCWUOoDlhPxMbRxgzkr7o8gClZ8t1mpQVC5wmkLg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PUbWAScWKpHqI+H1ZQDdQzYgqJ3lqygb2wytbosTkEVQhJdL5hM7TVOFYMq6WqL2SX+DdPxoytsT2RbtDcy1g8u+qY8HHA4bC/ISqUgPoSilg23JdT2SQ6HznuDZBJr1oIQiighN4k55hnFZDz7PRCIGrQXudWYVIiLQc9u2kCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=gCS1mz9s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J8II7CU+; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="gCS1mz9s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J8II7CU+"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D67E27A01A5;
	Tue, 30 Sep 2025 23:37:59 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-04.internal (MEProxy); Tue, 30 Sep 2025 23:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1759289879; x=1759376279; bh=FP314q4G06WZ/Wwx3+Zi5XNrXkOB0tAg
	518ewiVWUHQ=; b=gCS1mz9sPUknpu3aU9Own8gL6zBpQhG4mD6QbDb5WkSmO+2C
	KqcuJejiIfGBgw24/FdXRHxc2jf/7qc4zCb93UuDrhgtfmy9saGacHrxJ1JJ6n/+
	hH5NeBIAt8zBGWfniJAiqU53HVxIkOvi+ZYDAECyDw678mR9J7xexnXoSlUru6cE
	gstmTRH+7C9RmGKu14Jl+PCpHzvkTBolK/15Pi4JltQHJqdTlweiW4sX1gwUtv3S
	CKhM4kFa+TtXlQlqvnXvEVWiHBy/YEImKo95KqzFr6Ngo9DWp/0VXVTWDdyHd3RK
	HiooncbyFSNQg5gDaQc9dESLpgJf2pcVmSLkag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759289879; x=
	1759376279; bh=FP314q4G06WZ/Wwx3+Zi5XNrXkOB0tAg518ewiVWUHQ=; b=J
	8II7CU+3365NmRzDCPWFUDmS9javxOd4L03dC6LgV27MmT62PjYbShGWbjH7UiAY
	DvrG53D5NNe5ZQsaFlMEtmRTOFeYF8jty48yFUcpbvZlBE52gWSJwKblckxHVc10
	4afT/8YPBCD1VasBo0mHa+J7vyCA2tWcfXFCbLEDrqwQ3WuzI9D/GIRHDBMNDeoy
	K9c/DScqdgRZO3Sg9vh1Xmfxj0Np8NT5djr4kEiDf6zP1L5ZymPHawdOCQC3ErC4
	+8S7l6DY17YJqgk+wVGmzWJpL9wtgH9OMWKhnqWjij3vBVo42+ELxZmOuAe+Bmza
	68T+IyPAHqbtGd5VJzALg==
X-ME-Sender: <xms:F6LcaBNpPzSU3IYbKMP1SGkBrBJy1CDZE3GTfRxqXayy9JIgIb1KGQ>
    <xme:F6LcaOyieWr6PvIIwDA6-XvZ50s1YdcMX-4HH88xA_T9fPM7xWZ4LM1Wu8zyBnylM
    TIp0Esh97WwvFzEluLFYTS9GqDQ0E4V_yHK1an6MvIImZs_G4Z_1lE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekvddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculddqiedmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpeetlhhishhtrghirhcuoegrlhhishhtrghirhesrghlihhsthgrihhrvd
    efrdhmvgeqnecuggftrfgrthhtvghrnhepjeevudfghfejhfeuvefhgfehjeeiiedvuefh
    ieekkeduieeuteehhfevvedvueeunecuffhomhgrihhnpehnihhsthdrghhovhdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhnsggprhgtphhtth
    hopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghrnhgvlhdqthhlshdq
    hhgrnhgushhhrghkvgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegthh
    hutghkrdhlvghvvghrsehorhgrtghlvgdrtghomhdprhgtphhtthhopehsmhgrhihhvgif
    sehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:F6LcaJIa22tQAQd5YngzsiAEw_cFInTF_r5REuHhV69qDMLeuI2RCg>
    <xmx:F6LcaM7_i8lLk7xV-tAVgiZPygFRrO4xAKe0LSc3xaOYtimId4_g6A>
    <xmx:F6LcaEx6uHgRuDo_srmmn8uTGapRPtOUJwawjqHrLOqKQGvubHf89g>
    <xmx:F6LcaIbbDdXtEBRpfm-AFG9gLkRuYTVSF4pL7_-EWgqzhiCLEldkDg>
    <xmx:F6LcaHxC0dvTcQx3mBhhQuUQY7zQ9GEvHbr9NiO_MWPSKLWyiUKwAh1g>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 51A39240009B; Tue, 30 Sep 2025 23:37:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AG4t4IDsYU9k
Date: Wed, 01 Oct 2025 13:37:39 +1000
From: Alistair <alistair@alistair23.me>
To: "Scott Mayhew" <smayhew@redhat.com>,
 "Chuck Lever" <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
In-Reply-To: <20250911212815.1414784-3-smayhew@redhat.com>
References: <20250911212815.1414784-1-smayhew@redhat.com>
 <20250911212815.1414784-3-smayhew@redhat.com>
Subject: Re: [PATCH v2 2/4] tlshd: Fix priority string to allow PQC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025, at 7:28 AM, Scott Mayhew wrote:
> Specifying either of the SECURE256 or SECURE128 keywords in the priority
> string results in the ML-DSA algorithms being disabled because the
> post-quantum algorithms do not map nicely to the security
> classifications based on "bits of security" used for traditional
> algorithms [1].
> 
> Use @SYSTEM instead, which will allow PQC on systems with newer versions
> of GnuTLS.  It will also allow users to disable PQC via a policy module
> (on systems with the crypto-policies package).
> 
> [1] https://csrc.nist.gov/CSRC/media/Projects/Post-Quantum-Cryptography/documents/call-for-proposals-final-dec-2016.pdf#page=15
> 
> Link: https://github.com/oracle/ktls-utils/issues/113
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
> src/tlshd/ktls.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
> index 883256a..50381bf 100644
> --- a/src/tlshd/ktls.c
> +++ b/src/tlshd/ktls.c
> @@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
> const char *errpos;
> int ret, i;
>  
> - pstring = strdup("SECURE256:+SECURE128:-COMP-ALL");
> + pstring = strdup("@SYSTEM:-COMP-ALL");

This change is breaking traditional handshakes for me as _gnutls_resolve_priorities() fails to resolve a priority.

I'm not sure if it's a system config issue though, is anyone else seeing this?

Alistair

> if (!pstring)
> return -ENOMEM;
>  
> -- 
> 2.50.1
> 
> 
> 
