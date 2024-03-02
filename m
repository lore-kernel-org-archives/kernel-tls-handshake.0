Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9D23778
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  2 Mar 2024 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709400677; cv=none; b=aSSWT5LbMA4YPS9/02jH/k8gk7N61p0w33wS54cAFzVUodF1kNRmAiCXJKXIyeAW7vT+k2hGMmg8oSBm8/wDhlTGD6Q1P4Wb4Vl5DwEyjE+CuZS/YD7CObyBz8XanJJCAJ3HAUFVu0YapRpctENAB6o42mmzazHSc+rUIZEj9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709400677; c=relaxed/simple;
	bh=iPz2N//pkVv67uUVuB/lY/+RHGjZvdu3iSQrOx9NIr8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=vCBgjgpHNWUlwPdlm4uRarlUutrmAOXjm0f4D0dkXpaLisSJbJfJR4C+yRYcq6Z3ePsilp9m/APwq9n9A8rKbdONVU68NBolhqF2T3ALBzXwclHUO++rUDIPuvUJOe1XWrksbcSJbiP0wgAUKQVx9rXrh4aoNJyw3I4ZrR0RBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pecke.tt; spf=pass smtp.mailfrom=pecke.tt; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pecke.tt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pecke.tt
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TnBnr1hlJz9sk1
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  2 Mar 2024 18:31:12 +0100 (CET)
Date: Sat, 2 Mar 2024 18:31:11 +0100 (CET)
From: Damian Peckett <damian@pecke.tt>
To: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
Message-ID: <1440495327.67118.1709400671916@office.mailbox.org>
Subject: Implementation of tlshd in Go
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal

Hi,

As part of an exercise in better understanding the kTLS subsystem I've recently re-implemented the kernel TLS handshake daemon in Go.

https://github.com/dpeckett/tlshd-go

Right now it's a very experimental proof of concept but it should be pretty trivial to implement the majority of missing features (eg. PSK and server handshakes).

I think the most interesting aspect for me is how we are plan on dealing with x509 certificates/keys as the asymmetric key type naturally doesn't support reads.

Best regards,
Damian Peckett
