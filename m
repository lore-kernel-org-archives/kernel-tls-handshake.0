Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2361494A8
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625805; cv=none; b=aOKP6P60BRWsQiXW7vandH+yC+VC47hJ1uXgWUaNyWAKUNhKqJdANEJORuijufVftunKgWIM3jNkyeFQ8uU6VONVMwpCGEyTneTecw8KU4UbP/2Xb5rwRnRLU3splFgaiTGV0bZri3HVMQqLUAJabf06So7X+aAeiQhKKaR3fYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625805; c=relaxed/simple;
	bh=CnjT+wTvdLj/XmSwX9+HvaHNCfGc5byZJJs+xML88EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKlrfwXQiLADy6ca8Jf1eQj9Rj4PF0xZR5X+ZAYj0vD18jyknp+p5ZAUuQM1gbR1pYPapge3ENY43uLbnjdIKZnivFL7NDlE/WNGeXVWvGb3xc6HB9QuxSjoeuyAd1n5g9jauMVaksos+o+F+YVmLu2+/fFDoDdBJsLZr7hOPIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkOuLs69; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkOuLs69"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cf214200so58569035e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749625802; x=1750230602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLXwhOzLy2ZgHaxlzHBkxyFYj+4wv6Fd18VXWsS81Io=;
        b=CkOuLs69m0MqojrUS8bYYusLkTlAQRGJqjwtQwFTYMOuL3T4HKlp/pi2cGwCS+Bx18
         huwiFZf5RxmBWIAMthHiYEZsdFc1TxObdnMLhN1I5zeRLTxCdX64xmHn+SyJkZVv2dU6
         8rDUvWWEAonwVHfE1LBXbXtWPYZqYWwa8KljjH9N27oGSW2n+4JmLUajnyoObbrFOPP7
         M9uXtl2yHZAfc/oNQrcAh0QXCsd/skl+A2Xoip9WzoAm+HJQpEi6lMUIl5J1quiBA8Ez
         8Lx1pvYf/F2rgIG91efdMjwnD4M2Tj3Ulk38b3xIX7mdwhz4UEOp7UQzONDxP7RdNXoR
         u+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625802; x=1750230602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLXwhOzLy2ZgHaxlzHBkxyFYj+4wv6Fd18VXWsS81Io=;
        b=RNGNfnwGb43JAhzzu0Dxsp+Sc/JU/3HVlsD8gPP+5BdH8xDovLsRnxvQzBLtFcjnSI
         SR0Sj3nm8UeRG2pXgE2vHz805dtrXkfHuTSH8Az89Uh7hPPb3nXWQPY7g2OA6lE1ANo1
         nH+5A2dSKrBbKDDpR+4aLwgyNSPKYXal4tK3j32Z3T9WdCp7X+VZWFPDwvLwk1c98R4H
         nSWD0rCm5r0aOmrCxcldFr5HI571ihUifC7Kh/pxdtwj1ExOfZE9j0I9tXH2BVSQ6d5H
         Llwo1lmLAbfU06gplLv/iy8p/DkoUo4cyLkPqo3Nt1bcnX7dcQK3kpRYcbH3KoXmL0U0
         djRQ==
X-Gm-Message-State: AOJu0YwdonyNSJr07Fwbc0U4KJu6ZjxDKo8BVw4O7/CzGYf67MJmnzsy
	ojqzKy3sy+C813beb4bdDu6t2zvmrvPqxcX5JkNu9qs/U9NY5Fo4haHu+M+OYVCI
X-Gm-Gg: ASbGncu5a12cKIivsmpSa0auoJlTIgdq3PNaBTcb5DKXGd+wbly2NQVoqJhTU3iZ+Tu
	gyEGezed3Ml/e83zK89Ce02OF3L8xTdbp2nWtYbljf+HdPojtrlfAan5AQBIf8Z2r7WB5GPoMkM
	gEQe8WdHtGkq22lKuBbHGdAm1c6EkbD2w+kz0w9J6mdIliNKYy8KpNPGlLYD+zVEPFXxI6oUHvp
	OiKRJ5BvGQ/Ex+XY0rd1McJlGEZC7ytSW9da88AygPPUZLOciKlCvunw3P/BRXr9is0fJCqcYol
	etbX2ZrqTaWSnmcCVwaXfG1ceJJruyrytMgCN9AJ+rZejnINZ4oukW5v3alRrD5REGucaCNCcuu
	II8h8DfT7XwxmDespjUkRK+Ozgp49+oe//SIwSQ==
X-Google-Smtp-Source: AGHT+IET64wRKuUR9777PCRlQRdhHCgS/n0YoIzzfg49RZ/+Q07ADjuasiEozXOdGCi3EB5WZYSbiA==
X-Received: by 2002:a05:600c:1e27:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-45324f331f1mr14044615e9.17.1749625801577;
        Wed, 11 Jun 2025 00:10:01 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz490o.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518bc06sm12020985e9.24.2025.06.11.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:10:01 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 0/3] Add CRL checking to server and client
Date: Wed, 11 Jun 2025 09:09:40 +0200
Message-ID: <20250611070943.235087-1-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add CRL checking to the TLS client and server code.

It introduces an x509.crl configuration option that specifies the
location of a CRL in PEM format.

The CRL (certificate revocation list) can be used by an administrator
to block access to certificates that should no longer be trusted
for some reason.

See https://github.com/oracle/ktls-utils/issues/103

Rik Theys (3):
  Add server-side CRL checking
  Add client-side CRL checking
  Add x509.crl option to man page.

 src/tlshd/client.c       | 28 +++++++++++++++++
 src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 src/tlshd/server.c       | 14 +++++++++
 src/tlshd/tlshd.conf.man |  9 +++++-
 src/tlshd/tlshd.h        |  2 ++
 5 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.49.0

