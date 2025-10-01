Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193827D77B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292925; cv=none; b=ehZMDKrEXDqiI1+zL6uypSszkQQfWkyoe0kA9yAaPb6BOIg242EYMGYozm568tUB6qyGvF9PAa2ohpY5ACaXimfP5m+VsiQZ7oKMZBHFd75RRh/hto/XlM/NSf0BfJ7fVxUn4eVcOHtFeEsSfDFeRowvFiALD1vcru6iRzNGsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292925; c=relaxed/simple;
	bh=U/28++tv8jEeFP60KfKLAShtSzY1PrMeCqMpLQx5Eys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=an08kin3S7CRDjVp73m4CtXk82Pd0Pdr4ARmtqZ8KbKu0oy+cGNpuNzslGSFL84sxYwDAEf4iXUy7qpCQ9cyNwLCqiPsChfeCNBG2/sZAiNvActZzp9CfhFkOtNGE9pt1yRQsvi2tjBhCepnZAArNxpIFj/G7tR5Np4D4jwihyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxU6DNOW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxU6DNOW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2698e4795ebso70853695ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292923; x=1759897723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8PxN6XYKVgts+bHjSXPTF+jw05ySxgIFPfepY38r6Q=;
        b=PxU6DNOWLi9rGPR2ygDZMUpbpqs6ruKp0sOogdTU8WvFMnbxX9ee2W1kQQTG5oehA2
         gOv45Hlm1TieIDTfetn3/vkpDlxcfwCqTR8pClvCmio863XoViz9TpSTD551MLj/jdXh
         YoA2geVsmZtzwG0ENEVAg4C3BvpB9bjtwC5yeZ9fX/Y6M/Bodtfnb3YJixfmyPd0z4LB
         4LUgH0HEntlFkV9w/zFkIBRalOUpx30KqL/DD6M77ZQwa+QuQVzPOsa+mPHsnmSGgRed
         tg+NFw7yAr2mLg5MdLD/pKeR5BTw0JJXiO9/SrGzwRzZ0swhdcmm55upFN/d6gcvm+UT
         DBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292923; x=1759897723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8PxN6XYKVgts+bHjSXPTF+jw05ySxgIFPfepY38r6Q=;
        b=FGVLNIB0vnOxBSc0uN7i2wJ4klOMFfWIDk6up5lP8XTq9m1p/TB5dQOtF/M4mygX6h
         TNp0/G50kz46kIUR7K5PhK5WtOEUU/y5Huti68I9whJ/1UvjOr+/u3eEPra2SSnaO+85
         946rWWucKNRiyBCaDJhsndkao7clOAtWk0B0qOBF6PjWA0OerK9kNr5jZ0Q4U8F9W/WO
         qbtcNoS2+N0wICjxVaf0zDef7nNpq+CN0emmESXd3tst6Nw70kiRAhf2AP6R3+TRThrr
         UZyRx5NxherlG5TRrW2Pr0tFkh6xcRdJJwPR/s1vkd8Ap3IgeisSP/jOrOXm22AszPtZ
         6u8w==
X-Gm-Message-State: AOJu0Ywfm9CkALAEMdMAADn4gxQ2z3yShpV6JC/t5aL1rVrf5yshS7V0
	hzzbmpN6DZOVAtZjS9C4p9v9WawLO3lyJ9x9tgW/w2uHt/dRT8anHWLOk9gH8A==
X-Gm-Gg: ASbGncuO1sPJJouOGjDmARo87ZQwyvjmvwW/m0jOZEnGP3ij11F5YQJnOS1OCwqEKtC
	Yo+VNuaGCd2SPNpwDjmLYPKTaA3GPAdUH2xR7dnv45+IFSH6sxeJBmCakC3E/fVu/swah+nX1B2
	/FMAqP6tviBDk7iOceL3QJ1akpQv83YMdJqv1F+Qnc2WTboMi/fy4WwA7q910p0olnQMy9QVg/Q
	BspZdvyM+ncEp9tFOXDUbZt7KfSTMmbdhplmoILgIvG8SS29ZlwMO3j4Dp4H+y+84+ufk/qNZRi
	TzELw/cpFEdsLMY868lbNjS8EgBeWmxdofbJxAaZUNp9+fbaxvTfd1Yg+u/SqLFq7eKk8mfgbKW
	nQg/Dz1P443orjZRHXniSnwK3DjT6onE8ek34Ey4NV6xW05S/Zx4AVeoc4DvDLStdBQSZWOMFoa
	LUWygEIcgpBl6XcH7Y4wZO1hMHpKQ0yuis6ttqLdDHrq0A5powA4Zq
X-Google-Smtp-Source: AGHT+IFZa47ZYBjuyTr4ZPXCfFHmTOBrsLffnrP79rEcrhhN/7AeOF/kpJH1HYm3mHTbQ/bxHZuGig==
X-Received: by 2002:a17:903:1ace:b0:275:8110:7a48 with SMTP id d9443c01a7336-28e7f2eed8amr26272365ad.39.1759292922752;
        Tue, 30 Sep 2025 21:28:42 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:42 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 7/8] tlshd/netlink: Support the new kernel KeyUpdate support
Date: Wed,  1 Oct 2025 14:27:33 +1000
Message-ID: <20251001042734.17307-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001042734.17307-1-alistair.francis@wdc.com>
References: <20251001042734.17307-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/netlink.c | 13 +++++++++++++
 src/tlshd/netlink.h | 14 ++++++++++++++
 src/tlshd/tlshd.h   |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index e59c945..51096c6 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -102,6 +102,8 @@ tlshd_accept_nl_policy[HANDSHAKE_A_ACCEPT_MAX + 1] = {
 	[HANDSHAKE_A_ACCEPT_PEER_IDENTITY]	= { .type = NLA_U32, },
 	[HANDSHAKE_A_ACCEPT_CERTIFICATE]	= { .type = NLA_NESTED, },
 	[HANDSHAKE_A_ACCEPT_PEERNAME]		= { .type = NLA_STRING, },
+	[HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST] = { .type = NLA_U32, },
+	[HANDSHAKE_A_ACCEPT_KEY_SERIAL]		= { .type = NLA_U32, },
 	[HANDSHAKE_A_ACCEPT_KEYRING]		= { .type = NLA_U32, },
 };
 
@@ -330,10 +332,14 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 		peername = nla_get_string(tb[HANDSHAKE_A_ACCEPT_PEERNAME]);
 	if (tb[HANDSHAKE_A_ACCEPT_KEYRING])
 		parms->keyring = nla_get_u32(tb[HANDSHAKE_A_ACCEPT_KEYRING]);
+	if (tb[HANDSHAKE_A_ACCEPT_KEY_SERIAL])
+		parms->key_serial = nla_get_u32(tb[HANDSHAKE_A_ACCEPT_KEY_SERIAL]);
 	if (tb[HANDSHAKE_A_ACCEPT_TIMEOUT])
 		parms->timeout_ms = nla_get_u32(tb[HANDSHAKE_A_ACCEPT_TIMEOUT]);
 	if (tb[HANDSHAKE_A_ACCEPT_AUTH_MODE])
 		parms->auth_mode = nla_get_u32(tb[HANDSHAKE_A_ACCEPT_AUTH_MODE]);
+	if (tb[HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST])
+		parms->key_update_type = nla_get_u32(tb[HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST]);
 
 	if (parms->keyring) {
 		err = keyctl_link(parms->keyring, KEY_SPEC_SESSION_KEYRING);
@@ -376,6 +382,8 @@ static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 	.peerids		= NULL,
 	.remote_peerids		= NULL,
 	.session_status		= EIO,
+	.key_serial		= TLS_NO_PRIVKEY,
+	.key_update_type	= HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC,
 };
 
 /**
@@ -550,6 +558,11 @@ void tlshd_genl_done(struct tlshd_handshake_parms *parms)
 	if (err < 0)
 		goto out_free;
 
+	err = nla_put_s32(msg, HANDSHAKE_A_DONE_SESSION_ID,
+			  parms->key_serial);
+	if (err < 0)
+		goto out_free;
+
 sendit:
 	if (tlshd_delay_done) {
 		/* Undocumented tlshd.conf parameter:
diff --git a/src/tlshd/netlink.h b/src/tlshd/netlink.h
index 662e7de..b691530 100644
--- a/src/tlshd/netlink.h
+++ b/src/tlshd/netlink.h
@@ -19,6 +19,10 @@ enum handshake_msg_type {
 	HANDSHAKE_MSG_TYPE_UNSPEC,
 	HANDSHAKE_MSG_TYPE_CLIENTHELLO,
 	HANDSHAKE_MSG_TYPE_SERVERHELLO,
+	HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE,
+	HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATEREQUEST,
+	HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE,
+	HANDSHAKE_MSG_TYPE_SERVERKEYUPDATEREQUEST,
 };
 
 enum handshake_auth {
@@ -28,6 +32,13 @@ enum handshake_auth {
 	HANDSHAKE_AUTH_X509,
 };
 
+enum handshake_key_update_type {
+	HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC,
+	HANDSHAKE_KEY_UPDATE_TYPE_SEND,
+	HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED,
+	HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED_REQUEST_UPDATE,
+};
+
 enum {
 	HANDSHAKE_A_X509_CERT = 1,
 	HANDSHAKE_A_X509_PRIVKEY,
@@ -46,6 +57,8 @@ enum {
 	HANDSHAKE_A_ACCEPT_CERTIFICATE,
 	HANDSHAKE_A_ACCEPT_PEERNAME,
 	HANDSHAKE_A_ACCEPT_KEYRING,
+	HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST,
+	HANDSHAKE_A_ACCEPT_KEY_SERIAL,
 
 	__HANDSHAKE_A_ACCEPT_MAX,
 	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
@@ -55,6 +68,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_SESSION_ID,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 9c99a1f..e1d508a 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -35,6 +35,7 @@ struct tlshd_handshake_parms {
 	uint32_t	handshake_type;
 	unsigned int	timeout_ms;
 	uint32_t	auth_mode;
+	uint32_t	key_update_type;
 	key_serial_t	keyring;
 	key_serial_t	x509_cert;
 	key_serial_t	x509_privkey;
@@ -42,6 +43,7 @@ struct tlshd_handshake_parms {
 	GArray		*remote_peerids;
 
 	unsigned int	session_status;
+	key_serial_t	key_serial;
 };
 
 enum peer_type {
-- 
2.51.0

