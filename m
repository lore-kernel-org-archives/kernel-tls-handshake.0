Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8663554673
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404589; cv=none; b=VMQwN2NVYnHbjpIuf5gigQT31wuKVYX8NgaCS8q80DoZH5XgcmM0LPtcznfWrOExlo11aF8rRi5XApO2k74TSl8AUynKDiIKki0uRUy9Fr+wcgiAHSGcrMkTNsWYsmmZe0TG1QNklsHHqlTo1kszObQouBvRCnkRxFbMtLLtj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404589; c=relaxed/simple;
	bh=qDPIj+tsoEidO+NNSIG9ionOVB70ePKtLOmIiB51qKg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=A4QmvaxZNpBeFZoIi6socMa4Uq7deklayOoKoi/aOtt9oRyKAz6nnpwH5HRmC+lEzQTyH7vh0D/7N2txixrq97BQU8eDL6HPl5sdGS7ljvpgCWxaLF2y+SYrhiQPqUIZuxrRLFUhzEdobkwTiagJ/JY3efGd191MTvfhSGfpG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1aCXnY9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1aCXnY9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3027845f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404586; x=1750009386; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btwRM/XgY5BWERKitaFsM+DOAqNrXsUqO91/s6wBBXw=;
        b=Y1aCXnY9kFgLYJ3doad/GfIwp4BwGKQ5ONbg6olSzQEWBl0Xune4oamJJwhZ8lS+gm
         XobTFsakJyhN9OXM3aWbmilnQDzC1rkrlSCEqY0MUnczh6YmcYk7QSRVGHQUrl6qMPAT
         +7SHXKv0F2r4p1BSGDQX7WqicEr62OKzT089FKNPxsaqcAkHID4ZAK8HYQoYl4hKPEdh
         QZyZvvduVEqgZESEyBF4OwqRzWtFlcsW20IKiMWShrz05kxb3Ev0A3TeT6l4qR0ykRPM
         KlVKTIjFWAjsJ9tts3W+KGWVYI9K5g55fXGLi1yTjY6H3s22BCutiAtUx7hbUAgiraV2
         oOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404586; x=1750009386;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=btwRM/XgY5BWERKitaFsM+DOAqNrXsUqO91/s6wBBXw=;
        b=FTYyOHnMXCr3qEjX+BIEFGRl7lRXvv8/E5iz/lYzJBCiRVb127wWD1jK+O4XcPpVOD
         hC2ajjntR61E0srIlSZYx9AEjdUCN6enjvHJJiErGUgeb72k/eJnFM1m3PcN0ByfAfJr
         6xTFwyyLwQBkTU4S79Kn5jppsTMAQ7ErHC6u5T7ngIATNsO7Wcu47nUkgC7jYOkT/6WI
         d+5BFQ+6NhY7e9TUgjGwkGEEq8alRkPKC2hUPt9aoeahaQLQvKQpbmqQyFNgm7VfLsGF
         IVFX6n4I19FUWy5qwvUF1H3oV4nzUBJ2LLU5JVOlDadWvIzjhrpMkLjrJykt2L/C3lWZ
         m+eA==
X-Gm-Message-State: AOJu0YyBEGHEg/3cdocqBJlBD9+XK96m+U4NXUfgDpd6bOTe44UMfM+C
	ITy+LaDBdYfubMdS9JNy2iSgX6VDryAsDldpHScCS2SGEb9u9JOepKQn+IWRNQ==
X-Gm-Gg: ASbGnctCrtjL/2IkLgSniEvTyXEP+0UmhdeIEzrRSFsPdd6GEowBTgChwPvjhHGzqEE
	mW3bjx9OPSjNGoY/rygzgiTFW35+TGQ5Qrm/In8Vq3G82OzC6B+OAQJYWuKUMDg7FbHqnods+AC
	cZhxm/CNtqMj+GEyYpKttEZzZqScXk7vT61dQh2GNC57wYwNi2S48QDtr9C+7h0e0qd6gAb5j2U
	/0fXHdaUuz6ExQbkFiuXES20FWm2ju1/VClZ4Q0CAm90Zo/YeLA6+3AAfqxzSGyP2PKDXsWMHHp
	go/gK1G7HciH09we/+ZkTJdIVY0ROH6vCLt1YZ5t7BqrZWef5rpPU/sZzhFY4qxQgmpYJdp9lPW
	Io5nK/MmU
X-Google-Smtp-Source: AGHT+IFLz5JHONxGagcO8Zmuh1W996/IULKEDCuhZkC13JZI3uFTFXNf6rP9V5ZdJiibWxibkUj1Tg==
X-Received: by 2002:a5d:5c84:0:b0:3a4:fc37:70f5 with SMTP id ffacd0b85a97d-3a531cf1c12mr8429178f8f.58.1749404585799;
        Sun, 08 Jun 2025 10:43:05 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b653dsm7694736f8f.39.2025.06.08.10.43.05
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:43:05 -0700 (PDT)
Message-ID: <bca6320c-2bb4-4727-8ad0-0e3a0207897c@gmail.com>
Date: Sun, 8 Jun 2025 18:43:05 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 2/7] tlshd_handshake_parms: Ensure peeraddr_len == 0 until
 peeraddr contains a valid address.
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/netlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index 34a1f47..ce8e981 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -245,9 +245,11 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 
 	if (tb[HANDSHAKE_A_ACCEPT_SOCKFD]) {
 		parms->sockfd = nla_get_s32(tb[HANDSHAKE_A_ACCEPT_SOCKFD]);
+		parms->peeraddr_len = sizeof(tlshd_peeraddr);
 		if (getpeername(parms->sockfd, parms->peeraddr,
 				&parms->peeraddr_len) == -1) {
 			tlshd_log_perror("getpeername");
+			parms->peeraddr_len = 0;
 			return NL_STOP;
 		}
 		optlen = sizeof(parms->ip_proto);
@@ -297,7 +299,7 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 	.peername		= tlshd_peername,
 	.peeraddr		= (struct sockaddr *)&tlshd_peeraddr,
-	.peeraddr_len		= sizeof(tlshd_peeraddr),
+	.peeraddr_len		= 0,
 	.sockfd			= -1,
 	.ip_proto		= -1,
 	.handshake_type		= HANDSHAKE_MSG_TYPE_UNSPEC,
-- 
2.47.2

