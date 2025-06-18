Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDEB1FA178
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237300; cv=none; b=ZMUe2EN5EuPCNKPa8KjaUVBvv1ecdR0Z+eP80JSzHH6QAKE0GJPgsbevDehB4/VhR73SEkf6FHVnRcxOJkkNzeUFDhOeekvArUvv+3ZUBlj1HDQ3fIQI4UgQ6WLeU9M3lenOGgAwrUHJZunxWPygVneVUzTR6qTXvjBOp9zu2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237300; c=relaxed/simple;
	bh=vCLQJ+t8CP73Xdm9Z/97X0Kj2ntQPLTqDSYHnPehQlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JXmujLg+ouX2ICMTnn1L85YtV1DU0syHQoa/X5s4KKVtDCZ+r4VA+la2YekD9klTw2Q7dvTixBXmZY+dRgBMUWZVFN6VW8LHIKT4ygLOJ/j1t0qQjVYn40E4WvscWrFz1qWP4nxWOBz+gfUQl3HBB/4cNAoyv1Bs8NpGG0edgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI/JseGy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI/JseGy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45348bff79fso40755375e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237297; x=1750842097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zp4hfstk+1K+73YubfXaWyH+9J7sEJfH3oDkcma8i4s=;
        b=WI/JseGyYBgej3ClxgSYUAaD3/JT3xjzMj9eXL0p/jDKovd5Kb4rIq1DA3uNt1y7Gn
         2sc6UnlJgukUrFGjDDyrzeyZ1XZNUxWwJXj4XQ//Crr0TlwLzZnhZ1ruae0XS2/R9FTN
         fl8dU6/cgEeZZ/81XnGIFmnU5tQEonJ6dwRwaaTTExgPzV7kSz3EOLEvN/RNte58k/MB
         Y9/RXmok+WljIiw9phwSXuOBXTAxXvVaKPiROOOQERZbON12jdCAXFWPe68k9u29FOkc
         OH0SKfe3vuImDWle9GkUhb37fv7oZZ3DV1/8pWoYENhL7vqc9RFMCkHaLJRi2JLVSiVp
         XulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237297; x=1750842097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp4hfstk+1K+73YubfXaWyH+9J7sEJfH3oDkcma8i4s=;
        b=vKcdaa/MuoxEYTAPdsIdcGvzESZ2vPO2ySgEgsMYYBvt1ZAtW968kV3ffkFGHNYNv4
         1DCsEf8fkBZRf+EHmJjkU1Ejz8vgWod9Kv0wx16R0gWBKhXwO9IP5HzezdkvhetuDo7R
         8kuCrV0kgJOh+64iHfYvuSgKFGkcfeoVxGeBWZAYwmAqqyWEAKHA/LPSRWQ5NWFxmjue
         DcxtlncZJMA4thOAbo3P1vKoNzCdc3MZsPQcGMvq346bCcg7tiZ4VXudwYDFSgM6PIgm
         L0vX43AInkRGrpvofsw+d2z1vs6vNMELZ+1sKvMLCt8jMlgnb9Uwzq9eXbZpuKb3P0B5
         D1zw==
X-Gm-Message-State: AOJu0YxlK64y6IrsayPeXC/NC+RwxAM24Xs7gvi1I3TCoaOTDOxBddJ9
	NHs2WykKSW9/TyQwvL16d+acTB+/KUUoPSlWwgk4wIDUse8cNusxQlBnu2OFM5qU
X-Gm-Gg: ASbGncsoVhxzQ7bZub6EdfvmQNA5Iu85YK46Y7ubctb5aePJ29Kn7C0HZ5Yl5OviPCs
	nAx2fOzrpGmqTjJJW9GO3/h/ICGSp8uth+mpZ1Xu6SZz1xH8p2SSCddNUpO/JedoIxMBckifItS
	G0e3+DdaWzDyM1453A1iyvDVIeAWWU4hFpLNtHRperfKhnfiyyAdJX3/T2yqZmEYp3L7cEBE17C
	aMREsp23aQsgLdx5uwNnkmwy6EyZCu20YEn5q5niXNVqTqafTtCY4ezf2ziegSf22xcKIfiWJw+
	58gbKEH13jYZ6J4fSr1Atkdz/Ar10s9wMD8bcpZHKSfSzPbeOiuAa9yCYXleNeWNqI5Oyo4bokX
	S7SRpg2zu9KG4VYZI79uwjE9BymVeL6/x8Z4xiw==
X-Google-Smtp-Source: AGHT+IFYDnnpX0I9IYuRSmZlNobmGNuG+eXse1yPkyZVs4qbpPXM5qa39IzjHf+88AqLDcLtNtZQug==
X-Received: by 2002:a05:600c:1c90:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4533caf5cc0mr147822465e9.16.1750237296546;
        Wed, 18 Jun 2025 02:01:36 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:36 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 0/3] Add CRL checking to server and client (v2)
Date: Wed, 18 Jun 2025 11:00:35 +0200
Message-ID: <20250618090040.566838-1-Rik.Theys@gmail.com>
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

The last two patches implement the suggestion from Long Xin.

Rik Theys (5):
  Add server-side CRL checking
  Add client-side CRL checking
  Add x509.crl option to man page.
  Move server-side CRL code to common function
  Move client-side CRL code to common function

 src/tlshd/client.c       | 68 ++++++++++++++++++++++++----------------
 src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++
 src/tlshd/server.c       | 63 ++++++++++++++++++++++++-------------
 src/tlshd/tlshd.conf.man |  9 +++++-
 src/tlshd/tlshd.h        |  2 ++
 5 files changed, 158 insertions(+), 50 deletions(-)

-- 
2.49.0

