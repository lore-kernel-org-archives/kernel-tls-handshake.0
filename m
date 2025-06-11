Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366FF2253B5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625822; cv=none; b=cD3eKyNZxW5ZITNuaw3dQfkTgqX6DNik659qUjdNBJiKQrMFRYQICrVwHxoKNw/jv7D1c9ea7BIMjZh+JYiLSWB4u/f5bU21dI4Q3wy2YRChU8DmLS4IpfrRJ2oh9DK6JQ2FfWGRAX9nR/jO9XLUJtd3YjjLVBWy/Eye4tzzYxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625822; c=relaxed/simple;
	bh=veME8UMeODm3yy0HZfmR7phfbGpY7dr332p730NQrcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goovBazNAG2Wdm96GVHqnNGDKuZZ+neJpKXievE1l924ZQzBRRe0pT9Q6qiOxbz5+ENCLaryZzad1QbqpbE6fIebCjcYBBZIRNlMJVZ3LKH4LrAcmCnP9bSk88GCDQKDvfLWcVZrFK0U3vR0xHYtsOtQVRlLKw3zlf0k3gmknX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQXu2rsh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQXu2rsh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so3518216f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749625819; x=1750230619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jrAa7oBy/Tuo39mdbZzLvbfnygBfsaeINLOrqZBacc=;
        b=IQXu2rsh9fL4V653fPhF7iM6JiP237w/U9g7/EHh1Xc4idf5dZYCFkB3hyJKOsEbgQ
         hjYMq9gCW2d44NorCOIwWG7QARadKRlmfuWjcbbHYsNhnHomQxUhfBFc4yAFrfaAVXEy
         SJIM1rbkbi8ixqy47aEnRo66Mafj8GyMJMoesapCoRi2siCMkkrJ/y4MbrtgnEmmMbnI
         cYGzqcaWKiF8f+FmjwIGYm+3KW65saoV9tchl4ODxM3GHB7cqJQkDLy6Exr5E5t4jQZi
         pYN8XayEkpTsv7+ye98ruvPt/8uksnlpz1IztLEgD/pTzbaeIXxGD2XGsQxEry+QIkb2
         7OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625819; x=1750230619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jrAa7oBy/Tuo39mdbZzLvbfnygBfsaeINLOrqZBacc=;
        b=IfOYWbIdt8OyyjQhkCU32YYmaUDX3AEIcRnJbEqrYR76eHmuIGgeQGXvZCdpE/wgKe
         uXBsKrefZNtSNWNPp5agRtjWg5fS7Sb97aWXyWQBPW9XfJW8yRXvvxQDaNaUlHWm1K2M
         KMj7ZrjnzVL5jJ7HoPPJ2bjLkfDG8/SlHbrS87t9UJXTAQiEZaWYBxFhNC1hpDI23Up3
         BgS1H5djE2HYBjn7ErqamYGJC4AZII4y7pnCEMlabusvzpN+gdtUtyzongDNKaPvo+Fs
         LV0ApFF55VueAwOWL/uyBIBB93c+1gb9SemQek9AfeEHjEvdnzi8+6KuoFsrzrBA49jR
         9W4g==
X-Gm-Message-State: AOJu0YyUjV0vcylynHAgPej7lUFhbaNThwMg1lX+uOhrkwxLUxml1Sym
	adWAUnWJKOWveqsxomBwnTUNip4+nbK2PcG8C1w6imeiv4AD3kPVyXSB4lLHoCiF
X-Gm-Gg: ASbGncv/vK+T8y8iz8mRsfpekn3n8Gq6mZEn/LzpSCAiG6EGxK9UOrtsYi5SqJTYKIV
	p+JBEi58E+ZRchEV+4sSgEcfZtAvkfw3s13lhutNuzPAJ7sX2EZqN8k2hUGixdcvpTHIR29XtvW
	0knAPgjUwK1c5hC/OY+cgTeoFtkWcdrXeozbv59n9/GWbhGKANOpSRzKbKZYNPEvGpxHiv4L6cO
	rYR0+fjta0uavO8CZ5IZ7SkkUlmdZQdhrJf5KDt2ozMjgjAab2/4643wYDvY30+8ShdTyJFMqB3
	WyCR1VkpDDJW1mM2xcRx1wNXW7kLPygH7aH3+6pMUvqWbUxspTzZxKQ7qLEc1nasHd9NVyZIVba
	jHDJtbcSxlqepRtK3EkcC6MP8y0h1O9YZK9gkMw==
X-Google-Smtp-Source: AGHT+IFI/2caUO7HFDmpi/1SrZkurjxdwOyX/JOSpAmzEZf5Byz7Rw8eECpL+7APFE+64RLsRLfuGQ==
X-Received: by 2002:a05:6000:40c9:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3a558802ea9mr1356829f8f.24.1749625819420;
        Wed, 11 Jun 2025 00:10:19 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz490o.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518bc06sm12020985e9.24.2025.06.11.00.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:10:18 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 3/3] Add x509.crl option to man page.
Date: Wed, 11 Jun 2025 09:09:43 +0200
Message-ID: <20250611070943.235087-4-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611070943.235087-1-Rik.Theys@gmail.com>
References: <20250611070943.235087-1-Rik.Theys@gmail.com>
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

