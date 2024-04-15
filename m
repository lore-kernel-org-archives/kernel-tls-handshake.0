Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A644D133
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 Apr 2024 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713175638; cv=none; b=fputtsra5d3QJvGs8Ov1sqB2j9JkJXR0UGHCyWeLijA/cBRwQrg8T4h0M3CMmZLpIF3XB/lQKz3qtbAJHn9hH/otyijAJh5Rix7j7Sbazni3LQO7xkPAJloOyXFyv4x0yx+zpMR8yGNwpB4KZBYNamBHQ1rvuLb09WVaQooYiqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713175638; c=relaxed/simple;
	bh=//V+V2R40r5SUvLYR5q4Klg9/1q6WEihOSkTw8xBNnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kFA9xLtB5NSnxKNtXDsliGqS1QDx47iIz8lXkXsgAKDoK6hbpdzvoSvKGCS7wRb/Zf7NOLtL8p9pNutwOusHT2dithm1hRRAwC1PPjKSDbb3oxAs/3Z60KeoWoTzbV6p6O18TWGw8q6kMrW6BqUX8pGZOMHwSZwZSvZ3l5rtZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlHx1ImV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlHx1ImV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d6e23253so3136209e87.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 Apr 2024 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713175635; x=1713780435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhlEjmtmUCpQ7ergSdGRir16O+zkW0stCcQ9+0jWIYY=;
        b=FlHx1ImVdpZmrEMKWmX6QcW46Vcj9pe3Skr6lN2XygxN/6k42JEINewZ6cZHh9R4Hk
         ckUMwCt8I0Ik4dDZSQQPvH2VG99JoEg1R++oKqX51brOkia5xrGFJS6nuifEhyWYaAyP
         cy8f2cNtUgTlh0rBUOoVkgJ/q+dYzuQAKXRz82oo/l7eXpgeGKSLlKOtEzcDa/1gRVWB
         xcPgPwGXMYr/wujmV9slXnYJ98ktsEFzT199BVOjTXtvp1stn2ydo4hl9vTUjgC2FkNE
         ib8u2Wgk0BPrZ1RMYnoSRHhLFClz5m58YKLNZMR5tRshsZ1inNt7gSOnL934TJdX42/E
         YPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713175635; x=1713780435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhlEjmtmUCpQ7ergSdGRir16O+zkW0stCcQ9+0jWIYY=;
        b=AEvQ8p7QldXeI93a7LYG+v2rrUGi0SKL3vlH9NjcatR0ngKu5ScsnmDIyCKTFLfFjN
         bTZ7m6yx9UVpk7rzG0m13bFaVu1PYCJEWBg/uiCowFKHoSf7KqoketHWHZ3+IKZD1TuL
         dXaey1Z6nNdcmG9TNfffECkePvbQCFIUhRbAlrfeP+ggtiThw5zI2c+HtWkm94QN4F2q
         GN8H9vagAEU3rPiXGqSo/STccBOMqUcH78yVjSzKJuHnELL0UwfJhnUswIamd15X9sw5
         4VW2hVv15Nj5sYtDTFtZSDWBd6m7lvMdhSO7efWFzRsxEGboiZn/qG0zYBPDZ/JRGOqm
         idIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMgJgIyF+ige80O3TKvaMay72IwSzan3H6Kq+FvIlZ1dWVqvo+CV7qDc+PIMYwM9yUFKLwVsm1vrsaxlaGlZRhfjqY4TjigwMeNJH/vIMM6W/JDjs=
X-Gm-Message-State: AOJu0Ywr5iJrDIDHE88fibkHAgY6/mQQYmOVm27L3P+ql13R7FHAlZJJ
	saDzU7+xS+4LX/3xMKKbnfjc8EV5YulqxQ7dOqFWJHNSqeVI8eji
X-Google-Smtp-Source: AGHT+IHdiou1eDSu75+fUv+u+sAkaqCtkm05euiSudyzbg/LpaOWWWlCBAgNmxSLvF4sVwV8UDA6FA==
X-Received: by 2002:a05:6512:68a:b0:516:d43f:898 with SMTP id t10-20020a056512068a00b00516d43f0898mr8871756lfe.21.1713175634718;
        Mon, 15 Apr 2024 03:07:14 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b0041663c75ef1sm15748031wmq.32.2024.04.15.03.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:07:14 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net/handshake: remove redundant assignment to variable ret
Date: Mon, 15 Apr 2024 11:07:13 +0100
Message-Id: <20240415100713.483399-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable is being assigned an value and then is being re-assigned
a new value in the next statement. The assignment is redundant and can
be removed.

Cleans up clang scan build warning:
net/handshake/tlshd.c:216:2: warning: Value stored to 'ret' is never
read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 net/handshake/tlshd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index d697f68c598c..d6f52839827e 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -213,7 +213,6 @@ static int tls_handshake_accept(struct handshake_req *req,
 	if (!hdr)
 		goto out_cancel;
 
-	ret = -EMSGSIZE;
 	ret = nla_put_s32(msg, HANDSHAKE_A_ACCEPT_SOCKFD, fd);
 	if (ret < 0)
 		goto out_cancel;
-- 
2.39.2

