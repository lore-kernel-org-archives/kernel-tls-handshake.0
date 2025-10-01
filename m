Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832F4AEE2
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292928; cv=none; b=AEYoGrgtfBf2yHkk0lFA4yBYBDQ2G6sfLNbGJQM9J/pN7Ynet73l2KEWKAQNYkUQ1eXVtMBLo8i0Dd720CauPMvADceAAQB8Bhm+AAI54Cy3Hj13EiND8wI4OKnWm5xq71fc8SW2uIX4Za6YP4/M48SW7eR/B/0geuvB4Rv50rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292928; c=relaxed/simple;
	bh=Cna+0dqka+jB2P0JQIx8kKssuaGfyMyxjkx12CUMcaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl9jKST7Xgl3X7qpfFq5cxeQ1fhDx2l+KNOB1yW9dTktgBt+5XF593VzgbPHJqyOIiAZbu0qbCkKL25KNnigCXyUQ3HTQl2vcNJ+/EJ1RvI0iSTneeS+Odryr5z9PjXwITA8eu9Mao9XRz/AguLa5pHW0G5WXdwLCvIjLtqGGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2JyQd+P; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2JyQd+P"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b5579235200so4854537a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292925; x=1759897725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOejNDQWiBYXheqDhgv+ggSUkR3tZO/lrLus1vGF5Fg=;
        b=Y2JyQd+PHDluVwLmJa0KK9Tc5Yv5yHyThVqvimfd98n3Rw5ihR29c+Cn1al4LlXcZB
         RsWlMK+17WG8efpd2HqC1j42GHm+DKbvKVzhfXz4/1sG1h3CVR6UR8oR6jNWcmIaoxZi
         R+h2KI6ywPjfUKcNk8WV2D90QBbUL+Uk/4yK3xufWY5YXzNuwSR0lOtLRn/puEaZxoqT
         7hDroZPcxfqACl+xT8ljIjLIyxJdhj8AfP9dKj5JGHvCs1R/q1A3Mz1V0CJqtbu/ea6w
         9pX1zNZx0n0LXHoaDhgQicDyYkdMAhSjMmruVHAHVbJu5DON1gaXkk3fplF1m1pqYlR6
         fa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292925; x=1759897725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOejNDQWiBYXheqDhgv+ggSUkR3tZO/lrLus1vGF5Fg=;
        b=pjESg92y4WXwvQohRoIKQlCWdxy0tu/XuVqwHqI+lLEXrKoC/74VSuG+OIi/j/r2eO
         peM1yqNtOf0Q9qRXrKF/qYlMUU5vgtt6xgByZ0BMCQY+kvx8Phcae13JzRz24IEuX2Ua
         ZSr5ct8Gt5CyZ8o+tOy7VlZxckFbSsbtdorHu+UqBuQSzo65eeTX6/nl3squD52EWLBv
         BYyi7CkOgLW4flFEfy3ifRPebjSDiEI4/FXqij6byWnRK24eS4qgnTeJdyGcRD1+kCzx
         g2bEch/1Ad1ySdeictlGQOiK06I2GWZPLOHV42lLsVl1NGys3VWuBmpYsXhcilPatjF6
         KdGQ==
X-Gm-Message-State: AOJu0YzNozxeoQb9wSXf+TR0gEheAwQU4X8tTMo2NBZlJcwSNajBjPll
	oGl6xRXnlu/pBythDnHJGk4D4zM7R40AHGT0euzb3qiyDRESxiYhbvhffrz5pg==
X-Gm-Gg: ASbGncssMotokyukjvV0kJwzVE78T3QVs5QdOA7ncMO9JKQhbMRCPCKwDGsShWdH2PZ
	5wz8XuyDyBE1u64KQz3X4EEV2pT/PPRDHAjtKXlue+99H9OKiYztbIrs/0OnW7eX4Ot9VP9a9DS
	BaptxwZ/QVgmQ6kfVQxw2v/r8155tH7imC0Sp4PmGYXJp8Kk/iHFgGnLcvg1T5pMkKcYFo+A1Ow
	ZuVXpSr1eVJyID8EupqOIyp93G/ZGJnpRR0rI64CdBte2yLeAORnXc3v8DaHcs9S8mswwSyn5ls
	2YNOcw6uE/iAr5TR+IFAHDJYU7wa2ij1c/aoKsz117WEFw0rxEJK3GxlAWhDFW/07u6kI2T4vQt
	duzC5FyN6MHrF80zril9L2sIQnSNwyeHdMV/yYdf9dIfug4f/SjZkNHyyBOM2ueSDE5a5JQMzeZ
	Ntwe25wTl/ouBQ0/7GPmLpga4UHiCy+JGX2j+O+Zv2Nk5y1xCrB1Oh
X-Google-Smtp-Source: AGHT+IHFgoMfuiYUphB2QDBCnWcx5pZGX6I0mXj4F34pvAxjXJEJ0rLDtvqugIHt0SR6yqJYR2GjPQ==
X-Received: by 2002:a17:903:2392:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-28e7f4a1ce0mr26105565ad.45.1759292925503;
        Tue, 30 Sep 2025 21:28:45 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:45 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 8/8] tlshd/handshake: Support KeyUpdate
Date: Wed,  1 Oct 2025 14:27:34 +1000
Message-ID: <20251001042734.17307-9-alistair.francis@wdc.com>
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

Support KeyUpdate handshakes from the kernel, updating the keys and then
reporting the new keys to the kernel.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/handshake.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index 398d58a..464b323 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -200,6 +200,8 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 	gnutls_free(desc);
 
 	parms->session_status = tlshd_initialize_ktls(session, READ_WRITE);
+
+	parms->key_serial = tlshd_keyring_put_session(session);
 }
 
 /**
@@ -208,6 +210,7 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
  */
 void tlshd_service_socket(void)
 {
+	gnutls_session_t session;
 	struct tlshd_handshake_parms parms;
 	int ret;
 
@@ -245,6 +248,66 @@ void tlshd_service_socket(void)
 			tlshd_log_debug("Unsupported ip_proto (%d)", parms.ip_proto);
 			parms.session_status = EOPNOTSUPP;
 		}
+		break;
+	case HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE:
+		gnutls_init(&session, GNUTLS_CLIENT);
+
+		gnutls_handshake_set_read_function(
+			session, _gnutls_ktls_send_handshake_msg);
+
+		gnutls_transport_set_int(session, parms.sockfd);
+		gnutls_session_set_ptr(session, &parms);
+
+		if (!tlshd_keyring_get_session(parms.key_serial, session))
+			goto deinit;
+
+		if (tlshd_restore_ktls(session))
+			goto deinit;
+
+		gnutls_record_set_max_size(session, 16384);
+
+		switch (parms.key_update_type) {
+		case HANDSHAKE_KEY_UPDATE_TYPE_SEND:
+			/* We don't expect a KeyUpdate response */
+			if (gnutls_session_key_update(session, 0))
+				goto deinit;
+
+			parms.session_status = tlshd_initialize_ktls(session, WRITE);
+			break;
+		case HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED:
+			/* We received a KeyUpdate and the peer doesn't
+			 * expect a response
+			 */
+			if (gnutls_handshake_update_receiving_key(session))
+				goto deinit;
+
+			parms.session_status = tlshd_initialize_ktls(session, READ);
+			break;
+		case HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED_REQUEST_UPDATE:
+			/* We received a KeyUpdate and the peer does
+			 * expect a response
+			 */
+			if (gnutls_session_key_update(session, GNUTLS_KU_PEER))
+				goto deinit;
+
+			/* Only update our sending keys, we expect to update our
+			 * receive keys when the server triggers a KeyUpdate
+			 */
+			parms.session_status = tlshd_initialize_ktls(session, WRITE);
+			break;
+		default:
+			tlshd_log_debug("Unrecognized KeyUpdate type (%d)",
+				parms.key_update_type);
+		}
+
+		if (!parms.session_status) {
+			key_serial_t peerid = g_array_index(parms.peerids, key_serial_t, 0);
+
+			g_array_append_val(parms.remote_peerids, peerid);
+		}
+
+		parms.key_serial = tlshd_keyring_put_session(session);
+
 		break;
 	case HANDSHAKE_MSG_TYPE_SERVERHELLO:
 		switch (parms.ip_proto) {
@@ -260,12 +323,73 @@ void tlshd_service_socket(void)
 			tlshd_log_debug("Unsupported ip_proto (%d)", parms.ip_proto);
 			parms.session_status = EOPNOTSUPP;
 		}
+		break;
+	case HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE:
+		gnutls_datum_t username, psk_key;
+
+		gnutls_init(&session, GNUTLS_SERVER);
+
+		gnutls_handshake_set_read_function(
+			session, _gnutls_ktls_send_handshake_msg);
+
+		gnutls_transport_set_int(session, parms.sockfd);
+		gnutls_session_set_ptr(session, &parms);
+
+		if (!tlshd_keyring_get_session(parms.key_serial, session))
+			goto deinit;
+
+		if (tlshd_restore_ktls(session))
+			goto deinit;
+
+		gnutls_record_set_max_size(session, 16384);
+
+		switch (parms.key_update_type) {
+		case HANDSHAKE_KEY_UPDATE_TYPE_SEND:
+			/* We don't expect a KeyUpdate response */
+			if (gnutls_session_key_update(session, 0))
+				goto deinit;
+
+			parms.session_status = tlshd_initialize_ktls(session, WRITE);
+			break;
+		case HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED:
+			/* We received a KeyUpdate and the peer doesn't
+			 * expect a response
+			 */
+			if (gnutls_handshake_update_receiving_key(session))
+				goto deinit;
+
+			parms.session_status = tlshd_initialize_ktls(session, READ);
+			break;
+		case HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED_REQUEST_UPDATE:
+			/* We received a KeyUpdate and the peer does
+			 * expect a response
+			 */
+			if (gnutls_session_key_update(session, 0))
+				goto deinit;
+
+			/* Only update our sending keys, we expect to update our
+			 * receive keys when the client triggers a KeyUpdate
+			 */
+			parms.session_status = tlshd_initialize_ktls(session, WRITE);
+			break;
+		default:
+			tlshd_log_debug("Unrecognized KeyUpdate type (%d)",
+				parms.key_update_type);
+		}
+
+		gnutls_psk_server_get_username2(session, &username);
+
+		tlshd_server_psk_cb(session, (const char *)username.data, &psk_key);
+
+		parms.key_serial = tlshd_keyring_put_session(session);
+
 		break;
 	default:
 		tlshd_log_debug("Unrecognized handshake type (%d)",
 				parms.handshake_type);
 	}
 
+deinit:
 	gnutls_global_deinit();
 
 out:
-- 
2.51.0

