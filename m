Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CA81A3BD7
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404568; cv=none; b=nxOulTL015N/nGzhyV1B6aeCAtfRcfDdGk0CsKSN3awmIpxfAPuD2bxqR/xIyjKvuBIx0rLDRHbwXRBHUDk3OgFH1xnkh/YaElK+C7SLkkrVNvH8etp0Yvf9kH8OvB6EBYyc6yh03uLtoqmEwUjQLV1aI+Qp2E6mLdVU4rU2DJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404568; c=relaxed/simple;
	bh=+7EsAiL8YgxoEIM5yoOhJXaDV9l55OBUKQDQ5DTyrno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=lB0+qS8GfeEggqfiDPM92cQjZ0zsErQ3FxbdHxoaIKSMONMhnhDcMn3dilC1K8jKIT494CrSM2hvYlPRNhH53Qk8DucXjClJqD5x+TewfZT8084hMp3tBLpp8toK3JPbaiaEyfIak/+Yj4TVqzsq3SDKLDx/x5Y0soUU1Gns6rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cri3o+bm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cri3o+bm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so37607995e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404565; x=1750009365; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gnEaWUFZ5eAiwYUJ7/AWmxTOzUVqjXnyY18WlzoBvM=;
        b=cri3o+bmstjwWzcQOxTTrFvsDVJc+xJBZLQMOb4Bh2Nim6ARCyD4E7rXwAxFpZWxCE
         Q8T/s6LhBdasa3H3SLBi0/YGz4pcV1wjLgRv815udSYUckCpQ4/ViJoUsQW9mFuDgSJL
         YoM8EDF61wyos3EvC+wH5VtSyaoF18/BZNpv/+w6UD3cT6j3y+HDmlJ9VsflNydj8mhq
         EvkqjtZ2ILymjH5kBjBVoIC1t8nAeY+QaLR1AfpKIe4vJrwgNurBoWrd9dJM61ZqHqyE
         vwIUU++dpm3ij+NzzTcTjZ+yPCHNhGfXH/0aB7l0iKnZt4wTtiboXQRZIZs6/TJMf4gQ
         T1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404565; x=1750009365;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gnEaWUFZ5eAiwYUJ7/AWmxTOzUVqjXnyY18WlzoBvM=;
        b=WVM1Ma0NOCBaAW++luVoC11hEDrcZxS1JUr9zz8vf0WjJVER0dLTlnDA/folqrBDve
         tA7RZN5mk9sb57JnGCAfYu1vxOD2ZyhJbI+hZd/QFrm5JzUjkUFSuCxavopHkH0BqlFT
         QcpG+ft8CTWdyNRw6c3u5dR4XxRLMYuMsUjoGInBsM9PQSXozmG4o+mmsaeSl+8l14sS
         i3Qypzp8u5MVphE1lRu332jg/Raqka1Cu0IzkD1DI+Cf5AAhs6voLTDOeejp3vYrpjTh
         BbGoNt6xsl9a+SAQdzmtsKnK9rHvTpUoGFKlAxVP2J7AlIEAUjPeADJarFv0fjN9BhTi
         iQkA==
X-Gm-Message-State: AOJu0Yxs0SApVpA6XO5lcCm4zYGDwLWZ0M9HSa2t9ry7cFKPDCBcQ+ku
	eaNy8cwXFdGuS7zW0WeKDO4zzJ1/bGmf4TS67BtYplcmEMXMm+9RirsBCS0RKg==
X-Gm-Gg: ASbGncvd64tsu+HiHe4N0Ib10e2tTSu7wTDsWfv+51kgG6MHdb1Oxmx/ve9poZp7fLj
	lYRrO3jzWVGcNN9EmaWbT9B8PPF3KCu5dW5+NreA2uQZ5RtJLxnNERSpZXim1QVUwx+rzxHB/c8
	SKkjpD42lyk8h5Znqvihi9eHKiqhq8KIBZK+bHmIh/4K12ergl714GA/bTmVJywjSqMzx9c/qOC
	7GT5md9/Z1LESE9PcEYQP0oLhGmGP79VpOYYSi0mnIdXl2iQLzj/ZFL+Odh5f96h8+bYB6BjwDD
	2DWvae5yl02ChiQEv7ORF5rZJ+zHeVlK8igR3kOpwU906Az8ICA0kPvPRCgl7kvZ9YhtI/oAhe8
	zG2NC3jeM
X-Google-Smtp-Source: AGHT+IHUWlslS7eVDA/Z6Dye+IoHzIm30Uo9EabY3txC/kYSKwqauxcp/7N7ZgnQGmP2qplJcgJ3QQ==
X-Received: by 2002:a05:600c:1546:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-4520140d6ccmr91007015e9.23.1749404565357;
        Sun, 08 Jun 2025 10:42:45 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322aa3c0sm7544344f8f.22.2025.06.08.10.42.44
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:42:44 -0700 (PDT)
Message-ID: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
Date: Sun, 8 Jun 2025 18:42:44 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary dynamic
 storage for peerids.
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/client.c    | 2 +-
 src/tlshd/handshake.c | 2 --
 src/tlshd/netlink.c   | 9 +--------
 src/tlshd/tlshd.h     | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 9c8f512..80107b2 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -434,7 +434,7 @@ static void tlshd_tls13_client_psk_handshake(struct tlshd_handshake_parms *parms
 {
 	unsigned int i;
 
-	if (!parms->peerids) {
+	if (!parms->num_peerids) {
 		tlshd_log_error("No key identities");
 		return;
 	}
diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index b9de6b3..6d10eaf 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -185,8 +185,6 @@ out:
 	if (parms.keyring)
 		keyctl_unlink(parms.keyring, KEY_SPEC_SESSION_KEYRING);
 
-	free(parms.peerids);
-
 	if (parms.session_status) {
 		tlshd_log_failure(parms.peername, parms.peeraddr,
 				  parms.peeraddr_len);
diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index ff9e35a..34a1f47 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -188,13 +188,6 @@ static void tlshd_parse_peer_identity(struct tlshd_handshake_parms *parms,
 	}
 
 	parms->num_peerids = 1;
-
-	parms->peerids = calloc(parms->num_peerids, sizeof(key_serial_t));
-	if (!parms->peerids) {
-		parms->num_peerids = 0;
-		return;
-	}
-
 	parms->peerids[0] = nla_get_s32(head);
 }
 
@@ -312,7 +305,7 @@ static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 	.auth_mode		= HANDSHAKE_AUTH_UNSPEC,
 	.x509_cert		= TLS_NO_CERT,
 	.x509_privkey		= TLS_NO_PRIVKEY,
-	.peerids		= NULL,
+	.peerids		= { 0 },
 	.num_peerids		= 0,
 	.msg_status		= 0,
 	.session_status		= EIO,
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 135e1e0..f058a1a 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -39,7 +39,7 @@ struct tlshd_handshake_parms {
 	key_serial_t	keyring;
 	key_serial_t	x509_cert;
 	key_serial_t	x509_privkey;
-	key_serial_t	*peerids;
+	key_serial_t	peerids[1];
 	unsigned int	num_peerids;
 	int		msg_status;
 
-- 
2.47.2

