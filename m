Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AD171A2
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jan 2024 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gnu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gnu.org header.i=@gnu.org header.b="nvZ+XWMq"
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <ueno@gnu.org>)
	id 1rOOzD-0005ha-6V; Fri, 12 Jan 2024 16:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=s8BJ2pfwDnLleFJ82K6/DUQfdOgySAQlTqsCCmRGL+Q=; b=nvZ+XWMqoauUGgWrt8MU
	98kgjcZzOVDoDDbBwe1czV4x0F0V1YsqzN7d88iokwjbezIH+r5secEDkiYHmbIB/gR7BqwBbAgnx
	iNuj3emUrMuySRtxb2ljFbVdR36QTYLSYtj/NFgafU21rtyR1vZ+fejEmwSuDo9+B1mQNNxJWCbUc
	23z0mdfN/gCWav1JKwRwBuh/141XaSFE2GX0HfXhUT+LcGe9kxAfKi2owpbCf/1Yh7q3RIW7UvZGO
	eFMiH9556VG56vzbnAH605Zijk+nlkRE3D4/nynZBVJ8Ok4XPSziWzOx1nMn+GSiRtgmeNon+EgtK
	6Y2Qrmh27/NCdQ==;
Message-ID: <87frz29rhr.fsf-ueno@gnu.org>
From: Daiki Ueno <ueno@gnu.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever III <chuck.lever@oracle.com>,  kernel-tls-handshake
 <kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils and gnutls
In-Reply-To: <18007242-4dc7-45ed-905b-a3994f62e4e2@suse.de> (Hannes Reinecke's
	message of "Fri, 12 Jan 2024 15:24:43 +0100")
References: <878r4v6j0t.fsf-ueno@gnu.org>
	<565BE265-C1C2-4AF5-A668-C5087D258017@oracle.com>
	<18007242-4dc7-45ed-905b-a3994f62e4e2@suse.de>
Date: Sat, 13 Jan 2024 06:22:24 +0900
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hannes Reinecke <hare@suse.de> writes:

> There are some issues which could've been addressed:
>
> 1. Multiple PSK keys per ClientHello: the RFC allows for multiple
>    PSKs to be sent with each ClientHello, yet gnutls implements
>    only support for a single PSK. This is getting interesting
>    when several cipher suites with different lengths or different
>    scopes are supported, and the server could pick the appropriate
>    one instead of having the client to retry a ClientHello with
>    every available PSK.
>
> 2. Support for SPDM device attestation certificates: SPDM has defined
>    the use of X.509 certificates for device attestation. But as these
>    certificates are not bound to a network instance SPDM makes use
>    of 'Subject Alternative Name' with a distinct OID. It would be
>    good to implement support for SPDM X.509 certificates as chances
>    are they will become more prevalent.
>    And any implementor will need to generate valid SPDM certificates
>    to test out the implementation ...

Thank you.  I've added both ideas to the list.

Regards,
-- 
Daiki Ueno
