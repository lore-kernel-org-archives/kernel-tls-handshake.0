Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309583E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292922; cv=none; b=gV3F0rMTGXJ699y94B0SnLcJyvWZj8woCfu3N8YmAr7aY8ua+DW0Hla1DLYbKL30x+UUoMLCVEMbbmTdykV6hI8NE9Z5lXL/b14jZcVOB0d639k+yhHohSnjaIwJOWE/yTPuOVlB+VFZHXVV97Dc36Xcf5NO5QE5KFUbtJsmTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292922; c=relaxed/simple;
	bh=90nD797g63EUZyvNcCTTF0STBU/RhrucTxant+yDm5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkB+DC0Db6VPgAB/4yUaYbY+3dgTrBd778G4RJNuJUiuYOJG9b1LTaMiouLPm0/f/v2IeuTrL+5WmUpv1Ls5J1+wuviEvWLN9moKkDuIIVBbg2jyqr7CCqdeLbq7vu1dz82dRAxeoniUfYpSQTNNLpCqL4vSyQ30yuUEqU3lb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIx/+ckj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIx/+ckj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-267f0fe72a1so52423935ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292920; x=1759897720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfDdBKq4TUNrOEvc1SRK8IRJeddSvU4fVt5RIWN4xKI=;
        b=cIx/+ckjcrpOxpQhNmtoHtLjUqRcGawW6jfeOFHiZxTUTRafmXkxmjByV/tVuRPlUx
         FREH/LcpgBLeobPK9Kx6ElWYTR+xlA7ZJzx1ja5JaIP9wyIglyVjmBQTem6lrruSQ8Ou
         cPnASSr51QVvwoDF/+J/+gcjSbTmi1ad+Yz1OgudxZgFUInyyrFc4+bkwKPeTljyo+mN
         BrsQQnryrX+uJ9kh5CuSmihk2WHdatBr6dS8xoeXr+qglQqlmhrNsyEVm62AjtBhEEWV
         P+EPoo2BDak5yx3k4Ud0GbSlzapfQ7VKi11yF7JF6wYszYE647qPyCkUUvNVHq2fBs1M
         pY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292920; x=1759897720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfDdBKq4TUNrOEvc1SRK8IRJeddSvU4fVt5RIWN4xKI=;
        b=MWoEAdKeyxXmPmQ5QAlLDPhiMY7K7XXnqWDbp00hzZe3DRA1fVo1a2iWJQjkHNTUXq
         1vNynm0K4D2avApgKsGDjKmbGrwo9VUt66P115rfMi8OqPL3KEvzX9WYHsTGlEHjkeDK
         h5y7i14nWu/pGSej5cKdJzd5TFSawmNQgGWv+g+rqQGlc3XV/M68OgxEZdX1ir2kS/Sh
         FlPrgZvoaKTu6kSPmNv3jDNr/1gKWgYW4vyFU/Vh3XD89wx1Uh7NQp/JUksnKh3T6wFR
         HTCIGXxq9dI9QL3DvcGC+mFIpM28RkbK0hmKjzb56ohOVCMBExQVPQPX9zDHqY6HdG7R
         GfKw==
X-Gm-Message-State: AOJu0Yy/BAcRUGAjBAL7LhBtPiuZHrd3Zha2QP//DzJXPEYz23qfyE8Y
	7AAKKWI3OjxdPGv0263cODpzfXmQruGNq33CWk0YRoaA7lsYSPHtIn9Y+WGrcQ==
X-Gm-Gg: ASbGnct4o9DImIBsgJCkCSSwaapbXotOqyCrDpCoJ4rxJtTTjwK92qzV02uvu/to9zS
	vNUxRT0wvF1EObTdX4tA4pNAsjc+UCD0S4NmXibXlFR5JvDAbE/QKjTCizpuV5uXb32dIYi7h0E
	DERaSjwYcQVlcaevDk1fVnK+z0+kj3oVOF44E23097AEvi5q6DWGT8BR2wJfxUMkxaGs7XE3BNF
	5Z0dMAnE5mwXBGxeYCJZ8Y+Ya6/91K6PnGHWAnJ8rVFUss/fCi7Oti+XWQyLYa0vIFqMLGJgYZ4
	q8gdqN60u0zIEKu12TZiMeAIS3WF/79yecb21enD1UKiLQ848xbU4kcMqMZgcipmUck21466BUb
	34lhmXr8oKtnnl/iSa6+JCPFMLp2GDEH0K6dAImRnXGt2ReS5T2DBJpme5qVTAh2BxiRNWVVif9
	7yBB4JkrbzcqAFUg/osoRxgda9hmu1opxfvAnAy9oaqDMVUNa/Wgsf
X-Google-Smtp-Source: AGHT+IGrDNXWtYypyeOnkGTxThF6W81pP0NJrLom1mnnCxSmwAyw7DmOFtuZYdpgU0zypvvEZ5//KA==
X-Received: by 2002:a17:902:e78e:b0:259:5284:f87b with SMTP id d9443c01a7336-28e7f2a2f48mr23915305ad.16.1759292919956;
        Tue, 30 Sep 2025 21:28:39 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:39 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 6/8] tlshd/handshake: Copy in msg control code
Date: Wed,  1 Oct 2025 14:27:32 +1000
Message-ID: <20251001042734.17307-7-alistair.francis@wdc.com>
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

Copy in the handshake message control code from gnutls ktls support.
This allows gnutls to send KeyUpdate handshakes via the kernel TLS
session.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/handshake.c | 88 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index 1e5a622..398d58a 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -38,11 +38,99 @@
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
 
+#include <linux/tls.h>
+
 #include <glib.h>
 
 #include "tlshd.h"
 #include "netlink.h"
 
+#define GNUTLS_HANDSHAKE 22
+
+/*
+ * This is copied from the internal gnutls function to support ktls
+ * https://gitlab.com/gnutls/gnutls/-/blob/master/lib/system/ktls.c#L942
+ */
+int _gnutls_ktls_send_control_msg(gnutls_session_t session,
+				  unsigned char record_type, const void *data,
+				  size_t data_size)
+{
+	const char *buf = data;
+	ssize_t ret;
+	int sockin, sockout;
+	size_t data_to_send = data_size;
+
+	gnutls_transport_get_int2(session, &sockin, &sockout);
+
+	while (data_to_send > 0) {
+		char cmsg[CMSG_SPACE(sizeof(unsigned char))];
+		struct msghdr msg = { 0 };
+		struct iovec msg_iov; /* Vector of data to send/receive into. */
+		struct cmsghdr *hdr;
+
+		msg.msg_control = cmsg;
+		msg.msg_controllen = sizeof cmsg;
+
+		hdr = CMSG_FIRSTHDR(&msg);
+#if defined(__FreeBSD__)
+		hdr->cmsg_level = IPPROTO_TCP;
+#else
+		hdr->cmsg_level = SOL_TLS;
+#endif
+		hdr->cmsg_type = TLS_SET_RECORD_TYPE;
+		hdr->cmsg_len = CMSG_LEN(sizeof(unsigned char));
+
+		// construct record header
+		*CMSG_DATA(hdr) = record_type;
+		msg.msg_controllen = hdr->cmsg_len;
+
+		msg_iov.iov_base = (void *)buf;
+		msg_iov.iov_len = data_to_send;
+
+		msg.msg_iov = &msg_iov;
+		msg.msg_iovlen = 1;
+
+		ret = sendmsg(sockout, &msg, MSG_DONTWAIT);
+
+		if (ret == -1) {
+			switch (errno) {
+			case EINTR:
+				if (data_to_send < data_size) {
+					return data_size - data_to_send;
+				} else {
+					return GNUTLS_E_INTERRUPTED;
+				}
+			case EAGAIN:
+				if (data_to_send < data_size) {
+					return data_size - data_to_send;
+				} else {
+					return GNUTLS_E_AGAIN;
+				}
+			default:
+				return GNUTLS_E_PUSH_ERROR;
+			}
+		}
+
+		buf += ret;
+		data_to_send -= ret;
+	}
+
+	return data_size;
+}
+
+/*
+ * This is copied from the internal gnutls function to support ktls
+ * https://gitlab.com/gnutls/gnutls/-/blob/master/lib/system/ktls.c#L942
+ */
+int gnutls_ktls_send_handshake_msg(gnutls_session_t session,
+				    gnutls_record_encryption_level_t,
+				    gnutls_handshake_description_t,
+				    const void *data, size_t data_size)
+{
+	return _gnutls_ktls_send_control_msg(session, GNUTLS_HANDSHAKE, data,
+					     data_size);
+}
+
 static void tlshd_set_nagle(gnutls_session_t session, int val)
 {
 	int ret;
-- 
2.51.0

