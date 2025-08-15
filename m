Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239A2BF009
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234182; cv=none; b=AQiWmSGuNI1FsbzliASzRbAI9Mtai8kIakq1juzFv8B3jBhJEiGoZsuhUlBlWI6C8Y2lhqroOZmSsxG+bU85Sfg9EP8nGmcknNrnrAC2OgPSWk0XqXTQPi1l8z8fy7tmbflhRUX1NuscPpGDhS4UsJk7kz6qYy7o3LmHkC6UJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234182; c=relaxed/simple;
	bh=mxfjGVRdFypJIneNgJQfCt5r3cUJE/yR+JCsjk/Oi90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmlUh6aFDdsamk0QFjTSp64/KuLY1g9ernMo7R2zZ0VhPS8DDBREoXqeIhvHzcP2rROYQfBA+gONwWXSrhJxyCl7Ri6uAni09mTJNrAUMK62wBO2VwZIAX8dFIlQTRojvuZHsxf0Qn5tSFCtlZ1bV/T6kkoI8Z3cTi5EqjPZTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6Mzr1iy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6Mzr1iy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24457f3edd4so12290375ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234180; x=1755838980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi5PFbe1K4XbqRUhP6Ms3ZRXGTgHp0ZImPelGcEgGdY=;
        b=H6Mzr1iyjLDXiaFDu7REtc4L96Wk2G6rXLzVwE8/rorZhS25jbhZWw64xFqKT9OHEq
         3FRSymc8QlI9Q1CXsGeL/gti6E8t4m74GE5M0T5A4JNfTEI+SJeeEmtg09bxM3x4N3St
         8E3ClOSRK3g3I1Sda6YTdYI4WE3VNaxqeYBX/2aOV0FwhyQclC/Qk1eaeYxqUOeh5tqh
         g0cR4mfk8CpniELkjv06wl/J1ZR1wM2OYO91TrEjhDqZtLdimLKG4R4chRcX3shgZvio
         o+4uG/XuylgQa2+NLinhckMm4LDELrKLZRTlEHNHvaElgn1RTxO8lubt7On2LLRaWRND
         kvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234180; x=1755838980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi5PFbe1K4XbqRUhP6Ms3ZRXGTgHp0ZImPelGcEgGdY=;
        b=sGLqWfTO+D2kAlwc1zlPbEpYLmAoqoJPqs1A4lr9Vm0zyOk6Rgn1jSkN0qVVgf2sI4
         zU7/fQw48LFbiuM7pmF1SsQqxdFkQB5QGfQgG4p7nkJq+TUSGHFcBrQbbUJQ8I5gLlh1
         Y0AUykblTgoS9NajMarK61aFVjPZtPoA1HPDxIQ+XBb4WT1ZlqP5bEpkZG4ZmQh6qZtv
         KKLKOEUxdfuSVg+1xAr+uTIguCmR2JHe8ZWF8HdX/i7TH5OdtYru/gDiT+YTKbcce9O6
         QIclSvnrusfEUTiRoy7gUQTksVtPZs5e4ENW6Z67Qlygai9a2zYiqDDqu8iq2zoYK3d6
         FTvg==
X-Forwarded-Encrypted: i=1; AJvYcCWe5yy6wWMFpXg3k5IXolo2ZMxNs0S9Fowb0u9XAfgPOGDJnNXsUvtdBgP0f/IK7bZv9jZ9RoJZxnMOU3rirA6PJ5lB3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8vom4yXHzo3KFn0NCm3Y3iIjc192A5E7/Yjs9KBvvWJHSdFG0
	L7LVz0rjPcnUznIGKwzIqFZYJurYDP14kCMzuPBsnBhS7Wq3p1d7NS2Y
X-Gm-Gg: ASbGncvw45o3eXON06W1sO8M2v+9vvCCbiGeWRkf9J9Mtykp3YKcz863ZH8egFWVKpI
	woZXhnqsuEYfGwWE+emFsUCUPg1rIKgicnnzuNbrTf4QSHlnvYUEjdYPMImUg4MkhxTDWdkfsZ4
	foGWtI2n6++BTMjF2hHT9qxmFOeSroHykGbyMWYxFb/jY4c4zLYAaIVWbsGy7BXaMcS1aOxqDFp
	0J3tUaj0XR50leL4gmvammshC6mTWxGQSQ+e2hBc1EK8BNNRhmT+cqhJ87uw3QniIJwHTxrV0at
	433sEy0o1XISv/FanW8zgm2jsqFDQhPeqNCPJj8td4FkE7yrUsuGPPkJty9A/pqgRHgNOFMTjJX
	AQXe5QJwEvbdhwbkiPYseh7cCvLKaEGPq9dPV+8AuDI85K5aRL9JTUwbEFrsM4huuBtZaBw3psO
	QswNEFK8ar3LtXEB/lSgAH0YeVaeY=
X-Google-Smtp-Source: AGHT+IHfW2tMpo7JSMRUfWuqJPTI95KykdEA+sXXbpzW28CCs6+DYKpACzkzoqJ7Hv9T5S6Ux64oUg==
X-Received: by 2002:a17:903:1ad0:b0:242:b315:ddaf with SMTP id d9443c01a7336-2446d6eeb19mr12372625ad.7.1755234180198;
        Thu, 14 Aug 2025 22:03:00 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:59 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 7/8] net/handshake: Support decoding the HandshakeType
Date: Fri, 15 Aug 2025 15:02:09 +1000
Message-ID: <20250815050210.1518439-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815050210.1518439-1-alistair.francis@wdc.com>
References: <20250815050210.1518439-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Support decoding the HandshakeType as part of the TLS handshake
protocol.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/net/handshake.h |  1 +
 include/net/tls_prot.h  | 17 +++++++++++++++++
 net/handshake/alert.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/include/net/handshake.h b/include/net/handshake.h
index 8f791c55edc9..d13dc6299c37 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -54,6 +54,7 @@ void handshake_sk_destruct_req(struct sock *sk);
 bool handshake_req_cancel(struct sock *sk);
 
 u8 tls_get_record_type(const struct sock *sk, const struct cmsghdr *msg);
+u8 tls_get_handshake_type(const struct sock *sk, const struct cmsghdr *cmsg);
 void tls_alert_recv(const struct sock *sk, const struct msghdr *msg,
 		    u8 *level, u8 *description);
 
diff --git a/include/net/tls_prot.h b/include/net/tls_prot.h
index 68a40756440b..5125e7c22cb3 100644
--- a/include/net/tls_prot.h
+++ b/include/net/tls_prot.h
@@ -23,6 +23,23 @@ enum {
 	TLS_RECORD_TYPE_ACK = 26,
 };
 
+/*
+ * TLS Record protocol: HandshakeType
+ */
+enum {
+	TLS_HANDSHAKE_TYPE_CLIENT_HELLO = 1,
+	TLS_HANDSHAKE_TYPE_SERVER_HELLO = 2,
+	TLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET = 4,
+	TLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA = 5,
+	TLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS = 8,
+	TLS_HANDSHAKE_TYPE_CERTIFICATE = 11,
+	TLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST = 13,
+	TLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY = 15,
+	TLS_HANDSHAKE_TYPE_FINISHED = 20,
+	TLS_HANDSHAKE_TYPE_KEY_UPDATE = 24,
+	TLS_HANDSHAKE_TYPE_MESSAGE_HASH = 254,
+};
+
 /*
  * TLS Alert protocol: AlertLevel
  */
diff --git a/net/handshake/alert.c b/net/handshake/alert.c
index 329d91984683..7e16ef5ed913 100644
--- a/net/handshake/alert.c
+++ b/net/handshake/alert.c
@@ -86,6 +86,32 @@ u8 tls_get_record_type(const struct sock *sk, const struct cmsghdr *cmsg)
 }
 EXPORT_SYMBOL(tls_get_record_type);
 
+/**
+ * tls_get_handshake_type - Look for TLS HANDSHAKE_TYPE information
+ * @sk: socket (for IP address information)
+ * @cmsg: incoming message to be parsed
+ *
+ * Returns zero or a TLS_HANDSHAKE_TYPE value.
+ */
+u8 tls_get_handshake_type(const struct sock *sk, const struct cmsghdr *cmsg)
+{
+	u8 record_type, msg_type;
+
+	if (cmsg->cmsg_level != SOL_TLS)
+		return 0;
+	if (cmsg->cmsg_type != TLS_GET_RECORD_TYPE)
+		return 0;
+
+	record_type = *((u8 *)CMSG_DATA(cmsg));
+
+	if (record_type != TLS_RECORD_TYPE_HANDSHAKE)
+		return 0;
+
+	msg_type = *((u8 *)CMSG_DATA(cmsg) + 4);
+	return msg_type;
+}
+EXPORT_SYMBOL(tls_get_handshake_type);
+
 /**
  * tls_alert_recv - Parse TLS Alert messages
  * @sk: socket (for IP address information)
-- 
2.50.1

