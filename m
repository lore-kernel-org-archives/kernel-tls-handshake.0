Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9291FCD1F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237302; cv=none; b=CW6rGucxK6ZSxLqcaumFjfSJtY5xxKpn1SgJPjYwDVJbmJUoDusqUpWmQ6aH9+pwoLBPf9YrX4aUKBOftZMK2DwZhvNTmozKfrf0yfkcsh2BUIO/UW51GO7effnKcJSaOsS7f/jD40Vntf/drfY1feFnJcIoEAMfCePYnjF/Bms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237302; c=relaxed/simple;
	bh=veME8UMeODm3yy0HZfmR7phfbGpY7dr332p730NQrcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRxLmyDOM+sx6BafMtAkTEdnRCZtirDZ+HZ1BeyedpPJr9VK/Lbls/wKq9DfZpOpHhBG0O2ZcXzj64b3VpCmww/NYEPKzHE1AgjM7FBmt8ryB6aEgEzFMSZxjCPbJCsT7NEQuEOlwkZHkeB1mQvqPWbglMt2NYS9F6M/m9odHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkh5jtf0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkh5jtf0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a36748920cso7876586f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237300; x=1750842100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jrAa7oBy/Tuo39mdbZzLvbfnygBfsaeINLOrqZBacc=;
        b=hkh5jtf0xsVPqW5Ruk1Y2Rg1gft7dvGMeKcTYRG9xveIloK8EsqDc4w6gB7XKmh0Ui
         OQP8m39RmvWEhViaiNCuDOKOcUxU/8n/JT1atnsbnMa/NGeNyQhxR34+kA0TeKv1sstV
         mEH3K4CUYndJDwoNHPjpI+ObtNqpNTWYSgE38iFyChA6saBr2y0h102kRmAg2HzmDnL9
         AYlLpeN5Epk2fNXB/Zevxb4LJaUHnicSUA4XeBzm1C5SIg/i02eebRa5qT4SUR8pdanW
         8Z6gS4+wIMf68FK1qOg2IK6lvCy0sSoeRr1b35oJQVxGESRaMWA3d30tb8ixasvw3PBU
         BAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237300; x=1750842100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jrAa7oBy/Tuo39mdbZzLvbfnygBfsaeINLOrqZBacc=;
        b=iBQF9ZjlhROuM4clIyIelX/Z1BAM0Ju1SQ7e7itX+Diyan2mlLzLhKCkNoz6CbsOqW
         kskQGy0k1ynFmw/Qg4tWoKV7d48psPKFsSXVB3Sw/u/T6ofqgfmjw1yoevEMA2ODwH5b
         Ypgr/UiquPePi4LeDlT8nBNVjrYq6WL0VtKlompILfqyvueVMUQjaZU6KoHrMaOSPR1S
         dQMPZsd/2BrZTYIgiklzW3X2hiFwH7UYecqx0aVCI3Rmd46ACPraBHpXO3yXSFVI8Gby
         RTzppxJEQdWvt9sgRErE4p3dTbR5Kq65R+l6cyyW8kqdmNyTkFs5iN77lkgYLw+VBdoV
         9yqA==
X-Gm-Message-State: AOJu0Yx0kBAo2WRSpiP2PJwAW/PtALAQr2ipj1CsP3k4sltRtoDmcTra
	G4mwYlsk5DJqpLccax4Vxu0gjM2uSw19+DQrkTYAJw23M2bF2UyMPfQKIO61frSJ
X-Gm-Gg: ASbGncuCUHRVlty98qLDk+1/+AF5sRzSRWTg1dcwM2YRsx7RSK1u6Pua/Zux9siR/Z0
	nUHTXv+BaUDn5RTaGtEJgEyqVpI9Uu9HZt9XMi+6tNOnD8sRhSmqNVasJnsQCjUZfMty0cVsm5+
	Hue0sVNNayZ+N49ctHSUWYNr561yo3+9HbUgnBOIfjY8Aoh9PGR2s6h7UMuLQUExYIg6xatlrl+
	qmGQnRdZ4h9FLQA/QSGqnHp5F0G2wdmAPWNemRRf/RPUxJFQTJeFAt14Cn+ep9ZRtYPzrljOTAG
	u1WrIn+cEeQQhtPUXs7BBVe9HP6fYF5KaATkKejsF6JAsfWYHd9ow6lx5LWqaN6DrvRC+WKwJl6
	f007E84HIC5KaPmGy0b2katEA0Awr1rpdOxJOCw==
X-Google-Smtp-Source: AGHT+IHuHbaaWPk3lCwagT+/mH5idt7PtP/9LDVymXcQFRVZV+DLimlp1m1Hl3Uk2IL0oPQJ95bZnw==
X-Received: by 2002:a5d:5f4f:0:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a572371c25mr12708924f8f.13.1750237299385;
        Wed, 18 Jun 2025 02:01:39 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:39 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 3/5] Add x509.crl option to man page.
Date: Wed, 18 Jun 2025 11:00:38 +0200
Message-ID: <20250618090040.566838-4-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618090040.566838-1-Rik.Theys@gmail.com>
References: <20250618090040.566838-1-Rik.Theys@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the man page to include the x509.crl option available
in the authenticate.server and authenticate.client section.

Signed-off-by: Rik Theys <Rik.Theys@gmail.com>
---
 src/tlshd/tlshd.conf.man | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 9d6d92f..745058a 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -94,7 +94,7 @@ and it consults the settings in the
 .I [server]
 subsection when handling the server end of a handshake.
 .P
-In each of these two subsections, there are three available options:
+In each of these two subsections, there are four available options:
 .TP
 .B x509.truststore
 This option specifies the pathname of a file containing a
@@ -104,6 +104,13 @@ If this option is not specified,
 .B tlshd
 uses the system's trust store.
 .TP
+.B x509.crl
+This option specifies the pathname of a file containing a
+PEM-encoded certificate revocation list (CRL) that is to be
+used to verify the revocation status of a certificate during
+a handshake.
+If this option is not specified, no CRL checking takes place.
+.TP
 .B x509.certificate
 This option specifies the pathname of a file containing
 a PEM-encoded x.509 certificate that is to be presented during
-- 
2.49.0

