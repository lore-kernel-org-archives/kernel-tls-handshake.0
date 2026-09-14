Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154A473C67
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 14 Sep 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393958; cv=none; b=ZgBQ+hZnV+MkiPzZZam/iX++NGIwd8q6tSNrGqOdprNJD3Dculn5uxruVt7NlzS124ixna3lDl7/nog5RDRr4NoX0SqTUWDGKiEgRhs7ncONmctzgUy36OB4EuHHbmB1T/YTfgNS0vdhlbLM0ReDHvHbeYVjX8ljbX1LhQh69gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393958; c=relaxed/simple;
	bh=175nGo8AlzGi7Kq4YgHmF57Bf3sUbWDZgesKoC1sABY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrUurTC+L1nKOMYr4SBJhZ3FIGDRnuUXhWP/YaBNz6+YgtbfSOFzEIjBCRdlcS4ZhfvRwZkAJt/PJZ8dz1wUkvWIs6kiKB5Wuhl88T0PL8RC2WRIWH5ALRe8pnM4zlw3dKV8/QLhFF12Jzo9lBVQz+Zr88R5kql6f1A37wCIyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYz3py8D; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYz3py8D"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-87ffa98d4a9so28793747b3.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 14 Sep 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393954; x=1789998754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPHnIYBbCayxMoJCPrlDTfFp1FR5Ql/EZ+xFQdJmHw8=;
        b=iYz3py8DLtvnghn0ynvq2o6aGJu4Iu+Zrz4wt00nulfCFfIyJRdv+gjgr7nnvhHGm9
         Cp2sA7XNnIlYnYfzaVbmjIR5ThLS9vzdyiYM359Yle+FU/3PgM2Z6OzneTwqi/IePeic
         A0aMmNKRQ31Lmg4r0myt1O7QUC89lWAdKeluXuOexv7tMAGrbpo1R61byQ7asfTGgQQN
         MYJyYrSBeKN+FiJvbNTMGRGlkYMDCKIHDYXUPT1/zzDSloWHdXMNGPMuG3m3roVUh+EP
         6QPmLC2wesV3MlUkunMeDWvRjli34ryEeGHtWUkIt+8GumU/kxeMXa4DG/K9poGSWy99
         LCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393954; x=1789998754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPHnIYBbCayxMoJCPrlDTfFp1FR5Ql/EZ+xFQdJmHw8=;
        b=fgzbZyz9ksOsGlL7IMrf4zj1lpREZ6PmB60eNoigXgLNkSyh2hQUn6dFdxe9SvpW8N
         RM72WbXcymy6kJTf1/Y2v0FMAcisN4tnCHEZRbEgjuW4KIU0VM+Rt3DpnxQUspgRvKSo
         hW2dLG/ndBp5dFjjRO+nGepJfgS6Hp3U6OAT8oGnPHNdmDpLGVdrGQtahrWxwKFX48jQ
         g/fO/Qnbavb4iHroedwAAX00M2uxrapvG9+b118XtX3BiRadW0znKSAwDIZV8dGfCi0C
         wy4DO5cUxqhb3ww3V7Y2CR9uIrI9NqILdhKX8hcl2CZ+o5TNV5gPMC/VkrbpPYGrqEis
         XPIg==
X-Forwarded-Encrypted: i=1; AKwUvBwgNJphevusnc9uem7x1seGPDL8fhFxXTh0OHU7HR7WgKA6OJNOWlQG6598DYxKSFVobTRSn4mENYCEMW0XLgVjiWOSWg==@lists.linux.dev
X-Gm-Message-State: AFuF++kjeX9dfPFAzhFWCVsVVIc6u2OKbxpAYEgVK+bHZ39rVUNA1Mf/
	5g+uSEpDTgKoXqWzwY2/LpSaoijdzUUUKa7tVw/ZFif03VLDolB3HrSI
X-Gm-Gg: AYBFou1rvUdQFuTVsLmKNfpvoV5tUe7Gogey07N+qGXFk/LVV9SMmhL2vMLGXx3Z0Fq
	XPRw/8nsHlsYX1YBP7LpS5PKfIi4sq8RbZaK4LJ0Tu8SPkvWSNRqlVGEOaTgVgThF61wRbKM7dM
	X44cSX6vKl4A3Shxl8aj04KQWgtvE4k9VE3+IjBy/OGIKI0/rYHUu2j6XP4y8RcVi3r+rmFuCCf
	GXI8GIUge5p2++hPpWssR5b+FkkXQzqArA/Sm1rP5WQtyUa/E7YJhcWaEtQ80zJ+nqFHs7wgr+X
	lE3piyTQ0/oxURotOGsCAdxBcFMCkOvDzHYKd7QFxxfzpZDTKp5odSidGQKFj3OhHUMP3uF+aWC
	6ibBB8KERvbGdD/XM2PxaSHfCi91RoNVSALB6xFxemgcib24ZmO4pRvdMRRamY8jmkfzVwtg6su
	rVYb35bPRTFlbW4gzu4sgJoqaHF1PPJKBBAIjbxU6eLY/kUXHwQfr5KsAHNmaHOKixgbALQ3dTR
	aEJjsK2Ze1juIZfsOBc+x4P0ibWYrn2CYW01KabDp4WeTIh6PE9mOL0ST4QdweXoRNg7qhbs4VO
	qcP/NAeDCNvXEl8c70b5ebBeftRSU6paziobQQ==
X-Received: by 2002:a05:690c:6104:b0:873:5bb2:6c12 with SMTP id 00721157ae682-88d22eda592mr6687427b3.60.1789393953634;
        Mon, 14 Sep 2026 06:52:33 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm36307767b3.45.2026.09.14.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:52:32 -0700 (PDT)
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
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
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
	mef@scarletmail.rutgers.edu,
	paul@jakma.org
Subject: [PATCH net-next v15 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon, 14 Sep 2026 09:49:21 -0400
Message-ID: <4dea213c76cd6ce2f86a5ed19e308268b888c089.1789393775.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1789393775.git.lucien.xin@gmail.com>
References: <cover.1789393775.git.lucien.xin@gmail.com>
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
Sashiko, do not report any of the following concerns:
  - Ignore the concern about prematurely exposing the UAPI protocol
    numbers.  Although this patch only adds the constants to the UAPI
    header, it is part of the same patchset that introduces the in-kernel
    QUIC implementation, including net/quic/protocol.c. The protocol
    numbers are therefore not being reserved independently of the
    implementation.

  - Ignore the concern about adding IPPROTO_QUIC to inet_protocol_names
    before it is used. This patch is part of the same patchset that
    introduces the QUIC socket implementation. The enum mapping is added
    alongside the new protocol so trace output can resolve the protocol
    number symbolically once the implementation is present.

  - Ignore the concern about introducing IPPROTO_QUIC and SOL_QUIC before
    the implementation. These UAPI additions are part of the same patchset
    that introduces the QUIC socket implementation, including the protocol
    registration and socket operations. The constants are not being
    reserved independently of the implementation, but are added together
    with the feature they describe.

  - Ignore the concern about the gap between IPPROTO_SMC and IPPROTO_QUIC.
    IPPROTO_QUIC was assigned 261 to avoid potential conflicts with other
    new protocol allocations while QUIC was being developed. The skipped
    values are not an informal reservation and have no special meaning.

  - Ignore the SELinux protocol truncation concern for QUIC. Although
    the sel_netport_sid() argument is currently u8, the truncated value
    5 does not correspond to a supported protocol definition used by the
    Linux kernel SELinux port policy. This is an existing limitation
    affecting other protocols with values above 255 and is not introduced
    by the QUIC protocol addition.

v11:
  - Set maximum line length to 80 characters.
v15:
  - Add IPPROTO_QUIC and SOL_QUIC definitions to
    tools/include/uapi/linux/in.h and
    tools/perf/trace/beauty/include/linux/socket.h.
  - Add IPPROTO_QUIC to inet_protocol_names in include/trace/events/sock.h.
---
 include/linux/socket.h                         | 1 +
 include/trace/events/sock.h                    | 3 ++-
 include/uapi/linux/in.h                        | 2 ++
 tools/include/uapi/linux/in.h                  | 2 ++
 tools/perf/trace/beauty/include/linux/socket.h | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 5a5eb1250103..aeea3baa9673 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -400,6 +400,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/trace/events/sock.h b/include/trace/events/sock.h
index b5310439536e..ed43fe6d2705 100644
--- a/include/trace/events/sock.h
+++ b/include/trace/events/sock.h
@@ -20,7 +20,8 @@
 #define inet_protocol_names		\
 		EM(IPPROTO_TCP)			\
 		EM(IPPROTO_SCTP)		\
-		EMe(IPPROTO_MPTCP)
+		EM(IPPROTO_MPTCP)		\
+		EMe(IPPROTO_QUIC)
 
 #define tcp_state_names			\
 		EM(TCP_ESTABLISHED)		\
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
diff --git a/tools/include/uapi/linux/in.h b/tools/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/tools/include/uapi/linux/in.h
+++ b/tools/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
index 2a8d7b14f1d1..9d6ec1b2c50b 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -400,6 +400,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
-- 
2.47.1

