Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A46CDBA
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Jun 2024 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707649; cv=none; b=IHgzewucM3+4BQvKBWprT5J7ab3Gprb5glThOfKigk+Ls9V63Pko7TUhZUXJ5AUb76udkcXV+znsZDtT+SYukOrVOzJCQRrN2tfBy7FASkzcOVJOwXdPQeGTvlT0zCpJsVNvh+Wzx2i9nudZGkqAcsdfMEr4PbXbtwqdDu9OfwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707649; c=relaxed/simple;
	bh=xaYWWV2a9Eyh4pTT4c5JukEbUwPGF5c0GTCcGveBkUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kyCSWfoGDe/Au1687TxrC8slfv8j7gZ9vKKqh7rzHHpngKMDj3S6JS3v/MxrauuzfkLONYeq+fUJJtykZCGS5nfy7WX79OoZ3Cr1WRhDdaWUrF0lFcNfc+PprbW5W8pbTvl4HW4n/+KDED1xKMNWOJmYsHBg1A1Icheyjk2qGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDLjLkW9; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDLjLkW9"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7eb358b6f3cso2505339f.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Jun 2024 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717707647; x=1718312447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2CavziyRYvVsiZBjGnr3XXDj9edie5dUVdVwHnqzVUk=;
        b=GDLjLkW9tglYGjxFEjDwQyXys41lNR5A7n2jx86jD9qlsa1Uy/UU+dpraPjtDsaHIJ
         XjnHkUBQsf3deR7BhttL1QUKI7W+npqbnpjZCH1WKNdnv5zjrsA5uu4D32kSIc8n12Sl
         avXfFUKtm+HPvnmCltfNqzgryHW1peRto5VvbDmrrBcfHObZ3i8lxkSrh5CiHU99JmJz
         JeVatkRwZUceuaRGarE0mK9pDAMsYTxGRMj2inl0hmhsiTQLC01ig34R3rMa+oJzzg2z
         t7Edybqxtsh5Si3u+r9V5QmWu9xe5Du3+t65KOMibY9zThxT4iKYfxBNncbbt1qXfx3d
         JxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717707647; x=1718312447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CavziyRYvVsiZBjGnr3XXDj9edie5dUVdVwHnqzVUk=;
        b=c2GPSYGDoLhMS3DxyQMUpECJkJkXDX10Gec9So0/RaZBp7rjz016Vm8Iy1yIGOd2FB
         WgK6s5yTq/v8+TtV0j1DbUZAAYze3jI1MgW/PJlrpSMpOARQrffApvZaGrTzumhV4yt2
         uYTSIO34Xc+9Qwmo9Hi00Z4cWbZtkrtsC/SRUyv3vajgKTHhPaXStHsWMi35AWNvgK9c
         VcQU4T6aiMNUj3IkMgS4jJTVhulINYydvo0K4I7X7ho004UC75l7a1QZS42KL1x+B0RG
         /39zVKx4t/ARKArAGp6bt2jtu6VoZSArSHOEiaBYCXKZMP5Y/JBqkPMVTQFFEgJCfyMs
         wTQA==
X-Gm-Message-State: AOJu0Yx5U6yV5kmAUttBWPQ3kAeLQRagMGc8fCYq46GrFlOroehVlz09
	dMCBXE9Bxdzj7sMsU1y6mZl2h4FWDvidJlrM/66/YvP8G7loGnGH
X-Google-Smtp-Source: AGHT+IFsVR/WzCdLxnPRaPK1y0W+sSF2JR9bM5w4S68qFVDARiblGtLrWYD4ehi4ZAIwSItBplj0cA==
X-Received: by 2002:a05:6602:8ca:b0:7eb:2c80:5354 with SMTP id ca18e2360f4ac-7eb5712c5a8mr89809739f.0.1717707646587;
        Thu, 06 Jun 2024 14:00:46 -0700 (PDT)
Received: from kolga-mac-1.attlocal.net ([2600:1700:6a10:2e90:b13d:10eb:8bb8:c3c9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7a24d38d2sm499414173.170.2024.06.06.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:00:45 -0700 (PDT)
From: Olga Kornievskaia <olga.kornievskaia@gmail.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 1/1] config: supply meaningful error for non-existing pathnames
Date: Thu,  6 Jun 2024 17:00:44 -0400
Message-Id: <20240606210044.42285-1-olga.kornievskaia@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Olga Kornievskaia <kolga@netapp.com>

If tlshd.conf had a non-exists pathname, the code would have a
non-descriptive error:
tlshd[64556]: open: No such file or directory

Such error can happen when a filename specified had trailing spaces
after the name of the file.

Instead provide a more descriptive error such as:
tlshd[64423]: server x509.certificate pathname "/root/server.crt " does not exist

In hope that the administrator would notice the error or extra spaces or
some other typos in the pathname.

Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
---
 src/tlshd/config.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 20e914d..aeaba05 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -184,6 +184,9 @@ bool tlshd_config_get_client_truststore(char **bundle)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("client x509.truststore pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	*bundle = strdup(pathname);
@@ -217,6 +220,9 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("client x509.certificate pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -261,6 +267,9 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("client x095.private_key pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -310,6 +319,9 @@ bool tlshd_config_get_server_truststore(char **bundle)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("server x509.truststore pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	*bundle = strdup(pathname);
@@ -343,6 +355,9 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("server x509.certificate pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -386,6 +401,9 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("server x509.privkey pathname \"%s\" does not exist", pathname);
+		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
-- 
2.43.0

