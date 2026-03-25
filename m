Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282E2DFA4A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Mar 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410566; cv=none; b=Wvp1XhAfVlRbPO0xiVxB5nevq/tI6lyi7MfQsmJcVHEBrgI70Y6uu6+s5seT5l0yzPOqbUUjcHq7oHhZcgQeooI3YsJWTr90eAotbtyRFLnRjs4PthCox+HNtQEWKRdsqNxKudcoi+OKYLMVPwLrlxnGqxaVw/iaNPKEtiCyCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410566; c=relaxed/simple;
	bh=+r3tYa1O4nzHNXgUenOGoOEDKkt9r6oEsRxV2HklKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIIhQ/u7x2T9mjKflKWLQcH/kOikMMU8X48f0RDMxyO5wa9DLT8IaLABphNcvE50trPWjjyItwo+3JDJ+JdWN7Kw6z3R5FJ0eh2JDEQ7FrCqJOC2ZhOO/KaVsCkqQiVhzn3sI9LC4GhOg3D/R/MMUPzznNF5bSjh+YhSPo7E8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVtjhIxJ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVtjhIxJ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfc1aced74so710119085a.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 24 Mar 2026 20:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774410564; x=1775015364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=fVtjhIxJubnRLgUZWKqP1lhIigpsKXcVkmbuBJyWnpmDd+jYYDBiJcpgReCI8M27ev
         i0hB4EIdZqM74R+GkZXqk5VP60312z73HgBQcffLO38ctcFExybGjoTiAgTX9FkcDBnl
         13JocrpeF0LHD0aVvZ7FB99UjIWhavM2zOu0HHUihsTKUTDt1uzqQ44gMUPFi2JF+/J/
         ivZDdf1VMsyOjq00XGf3v9W8ij614/hyv5v8DWB/2hPnbvN7CcJLxyrUV/3ScCCcY00l
         q7HMunPo8WTGyyXpo2214yNtZJ0POE90pnOXgmM/jrNVwoQ8L5sh6tBRTOWe8GlG2E50
         zODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410564; x=1775015364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=Tr3xZnS7r+BaL5z1WYoCmKrp01Z5jaq5NNBYMQtpZvUbUfrRDpqOHK+IGjL++hb9i0
         XsvDw+iuUPD1o02vJnynrQwrgCwuY9bR32RWc3ZqD+bruRUizKD4bR8ZVheZsncowPau
         +7nhdgvyLus3QM8o9HS6zUf8JyRh4FjAU4ReWPr5RSZ2ec8yYU781wbZtVgX6AOVImS1
         NoC/X370WHlbjTl0C5iIe42BD87RzljT6BejvxVm4MXTPHdW6KpLR9Q6yiFEwfFG5lD1
         n3iv+uVZSYPGTqXwy0B7klz7fWUJqXEXHG50qyXu1YxAAcVhfG7GBwQ01ItbW8uNF8dk
         Xzbw==
X-Forwarded-Encrypted: i=1; AJvYcCWUKNpG0821BkDF+Kdgdq2AROAFohQtK6XcWpGhZNXbUXHB7QYu9QegPLjowlr3m/FG788l0NBZBpBJ45H0g2Y4o60VOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+QTJj+pNiM64aR07PPrgtfyYZOLRHq+sFU4YzPWbvsyabK32
	r1jASeWcLR4xnpYX/iSfZO5+675ZnMP+2H+3vsSfsmLS5Wey4pU6zXlF
X-Gm-Gg: ATEYQzzwt3+huU/I2utbKVcU8V9zRKM6TRD1urBX3ZTwNxgwyaYh0xiJYca6lWtGXRq
	4PGfdw/egE4kMYNd5/h55a4Z3GSHtpjltf4B2FMlv7X4pF1+uUBtk/ggaypnEGI7ieNrseTG4kz
	STJTk3pYwjqFjEd7Huu1cLlXiELQVtnsQ1Lz5F/wHeg59Vl9df/A9pyXpDyCA3F+ssZHmyts04w
	verBtnPp6BmPb2yHWlbQ7gdIykyVCRgdyMUtxtN29awkMU6Crnkr7A2+qEugBMmiGbYSI8FVSfl
	1MaMqX33nzpo/716hAZi7JGTNyNz3y3jF7d7tLd3E5HSASrosZcT/ymEZIpJ/8/YcSWwymRkcyD
	0/GFs3KCmA5eh8pALZyqhJdfnOBZ9vMWsMs/fXtGEjHk5dAe+PzFRiUCTbU4jI2avrUrPnbWlxP
	IXcRcPrAjcwOkEd2WxWFZyN/pSMRhthGvfQ9/pzTpicgkEkjJej3vEwXAf4aX+2VfQ4e0oeXQe9
	Gf8xSoyCrdt2Qk+pXX2/MCGUpn9/Dyhe0Cn12N2r+iv3Cq6fAcUU8QmF2ZtzKacXg==
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr29039691cf.62.1774410563747;
        Tue, 24 Mar 2026 20:49:23 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb2e29sm150093001cf.1.2026.03.24.20.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:49:23 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	John Ericson <mail@johnericson.me>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Subject: [PATCH net-next v11 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Tue, 24 Mar 2026 23:47:06 -0400
Message-ID: <e5cb44e7a6ba57b63a3b13f853947ac88ec97335.1774410440.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1774410440.git.lucien.xin@gmail.com>
References: <cover.1774410440.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds IPPROTO_QUIC and SOL_QUIC constants to the networking
subsystem. These definitions are essential for applications to set
socket options and protocol identifiers related to the QUIC protocol.

QUIC does not possess a protocol number allocated from IANA, and like
IPPROTO_MPTCP, IPPROTO_QUIC is merely a value used when opening a QUIC
socket with:

  socket(AF_INET, SOCK_STREAM, IPPROTO_QUIC);

Note we did not opt for UDP ULP for QUIC implementation due to several
considerations:

- QUIC's connection Migration requires at least 2 UDP sockets for one
  QUIC connection at the same time, not to mention the multipath
  feature in one of its draft RFCs.

- In-Kernel QUIC, as a Transport Protocol, wants to provide users with
  the TCP or SCTP like Socket APIs, like connect()/listen()/accept()...
  Note that a single UDP socket might even be used for multiple QUIC
  connections.

The use of IPPROTO_QUIC type sockets over UDP tunnel will effectively
address these challenges and provides a more flexible and scalable
solution.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
v11:
  - Set maximum line length to 80 characters.
---
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index ec4a0a025793..9b6c3cd766ca 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
-- 
2.47.1

