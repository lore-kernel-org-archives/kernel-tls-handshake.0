Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC23171A2
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 16:14:50 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3357ea1681fso456535ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684340089; x=1686932089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDQFQalS16Q0GQim6Xr1s0trA0wvDRAdUkfkdCDLnGU=;
        b=ngmKs7o8pd44GveVx875/F7jFtstp2dQDvVxOVTdlLq7nhg0h0T/Pg5M08RNB0s8WB
         P5CBCu7J8qM27hzjtg4iGcNcys2aySHJezbHQVbGILh200FiQxL02E6Viz4JAVOnHtC3
         dQR/BKF8LtHD1+lz5LPsqeGeeeTc0HVQHGFhacqjBfT0SQdvUX6rmnII4wbPG+whQKUe
         EHxNTUYo8g6OAKolnajkPR/iVtP0XwoNxkeKFTZRJdReS/lgK40QDcwCUFDR3XtlV9IH
         LV2RW9TFfgl4D4n0A+OUVDApZfXtH9X0Q9/tfQYnfS2X8YmK3SQ2A94PG4dVkgtaD4S7
         rfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684340089; x=1686932089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDQFQalS16Q0GQim6Xr1s0trA0wvDRAdUkfkdCDLnGU=;
        b=VSSVOWEdkYIZcmdxn3ZGmJhJNGhvJZ7o/SXjgSy4zY54xiG5iiA5uDWfTY4kJK3FZ1
         vahxq202Za7CAx42FyqL3coSb/i/T2IdcKGJeCmWf7JADfFIgUXTmqmrCs3EP9dV0h+/
         Q3bCqsfbNtpCDyi/fU6yxOBULhOo1aRGQ/I53xXVRB89v2XCwey5n6ZoCBKMiheyZ2n8
         +tKjeuyz0ghItpbbjflNDd5oOrhwzX7AoBIoMUG22Ul5adyPbiT65pSyK1FC/WrgSqEM
         aOC+IWWMgScvqrhRp2kebfrl/gFU9HduVqdQ+fZXz0v/EPW7jn063QqkHHGThFPay+Ei
         bEbQ==
X-Gm-Message-State: AC+VfDxYBdApT/BZ1uKvVAOoxYFTtgP55+j7Dxq04KRpDe2yWbMPlId3
	cfgO+8Ts6xVXb4M6e6MUtXaKSOp8BMo=
X-Google-Smtp-Source: ACHHUZ7MQPr1r7mohkL1VdzGev4XS+bE4wotmCN9wlyqikcGoO4J61e0OmPn++Y9ffrtnqiKbN+f3A==
X-Received: by 2002:a05:6e02:349d:b0:325:f635:26c5 with SMTP id bp29-20020a056e02349d00b00325f63526c5mr1960585ilb.3.1684340089135;
        Wed, 17 May 2023 09:14:49 -0700 (PDT)
Received: from kolga-mac-1.attlocal.net ([2600:1700:6a10:2e90:4da3:8f72:4139:7d5])
        by smtp.gmail.com with ESMTPSA id bg9-20020a0566383c4900b004167a9e0ff3sm7360324jab.61.2023.05.17.09.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:14:48 -0700 (PDT)
From: Olga Kornievskaia <olga.kornievskaia@gmail.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [RFC PATCH] ktls-utils: Add minor error checking of gnutls functions
Date: Wed, 17 May 2023 12:14:46 -0400
Message-Id: <20230517161446.35825-1-olga.kornievskaia@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Olga Kornievskaia <kolga@netapp.com>

Add error checking to non void gnutls functions and log if we failed.

Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
---
 src/tlshd/client.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 6a16263..5fcacfa 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -233,7 +233,13 @@ static int tlshd_client_x509_verify_function(gnutls_session_t session)
 		gnutls_x509_crt_t cert;
 
 		gnutls_x509_crt_init(&cert);
-		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
+		ret = gnutls_x509_crt_import(cert, &peercerts[i],
+					     GNUTLS_X509_FMT_DER);
+		if (ret != GNUTLS_E_SUCCESS) {
+			tlshd_log_gnutls_error(ret);
+			gnutls_x509_crt_deinit(cert);
+			return GNUTLS_E_CERTIFICATE_ERROR;
+		}
 		parms->remote_peerid[i] =
 			tlshd_keyring_create_cert(cert, parms->peername);
 		gnutls_x509_crt_deinit(cert);
@@ -278,9 +284,17 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_transport_set_int(session, parms->sockfd);
 	gnutls_session_set_ptr(session, parms);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
+	ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS,
 			       parms->peername, strlen(parms->peername));
-	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
+	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_client_x509_verify_function);
 
-- 
2.39.1

