Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3237A82E
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Jul 2026 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147526; cv=none; b=V2+acWqfNHgvy3u3XBIZHz6iA9GQnfVZzzFB6JIwLwvczsaff57VLOfTaPMxbaPxD3BSVgMp+xz5lC9tPmVoAGbGrYaMx7PlNpg3rFoNI2ZX2jtQO1j1PWOrWjon9Y3OMW4e196wjsJ5OTb2oWdN9X52Vp31EWJlSNCFZXv7qmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147526; c=relaxed/simple;
	bh=+WVprUCU/4+i4zgkUbeM5Zx1SxzVovafBUP+ZokRC1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJk4vPl9VmEDaKsvU9iEgEE+80LCZ0LeIr8GsVupEn7a/4NkVZhfEtntmInNZeQ7oSZh0g7PGYIMe461CGmXTnR66mBkjxGn+W0FQAJCBgNY3/+xxywIuMsbP9oK9S6qEAYirNCuMRvm0qWhOmGcZD/kkMnUwPvGidRBo4dzYWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/HVce2/; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/HVce2/"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so51112396d6.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Jul 2026 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784147522; x=1784752322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPU3Bo1+xBc66sD6n9dZSyoyYNjeW81XMMVUXjEGtzM=;
        b=F/HVce2/naGfMEUTl5Gm2OshNAF6pZ90yGA+tnnsO7oBdIZznGcupER5dGTpDM0J0C
         rsV+y3DQtOvSNFape4ZfS88grCHQ6ZiwM02rigXIjYxB1gb9dBS4fJmGB+9f5k89gDL5
         O58fxS+7QqdN2TsxQb1+XX3WUYwGEkPZ9b+pt/J8I6pew7rxdo/etUb401ASl/5uMuau
         O8W3g187u3It63lWzc/Av8rI2XRUo4QmaUqzohKt7Y+UeMS//E5oV2Hx59CF8OCM0CtW
         Xy0xiJ1RuKXniEHqpRK3TIn0/5a7bogpNiISnF4961Gc+fVck2J9R2eHdKzGAhdVuWvr
         eXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784147522; x=1784752322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPU3Bo1+xBc66sD6n9dZSyoyYNjeW81XMMVUXjEGtzM=;
        b=DdCZbyYj5irW0a6xaOoORmXG+u2DbS7KEJcb3CaeJLVUbU5N1q44J4t89nsyz6RjhA
         RtvE+YOy14lJjnIfl6VoyWKS9xV5TlSyi5EwWENYUFiJ3ED4dBh8gBxpwv5GURaykUpl
         YJr8wQqfiBZG3/7VoiaT5MlkTp7Qu2C0GinFO9trWFB5dopPw3B2FZdr/mCNbht2Pz0Q
         GPbSKMyPKyKludDGj4et48ByLXiQm9OUERXBJC6LyY1QfxQU1dgF7Oqf2jHkrK73RTEm
         SO0e5pxqCJQnWsqHMPqdcwtsoE2Qa55Tv71iYi0Szi3Yhwwqi4qS5oKdbxoDkDfEAD7b
         /LIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8GHJdd5DTFsqw5mG1JaClbdhJIQX8L2mtxfSYciloZCS6pTd8/E+9IfBt+z48q9XG8pYHwFEVOHYwGmPXvZOitDRVug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhv2P7KtFinQCIubVTkocdXnAdYitilAe8kjEnhA67Ey9gsPmt
	RLxHV01pXUrgkL+llgfhGFO+9s/Fcz+YFJep/Xnyg8l/Kxh6y0oEvCgZ
X-Gm-Gg: AfdE7clCnPlYLOe5Zbu+lR3nGfysBuLWZbknAysMLuKRD1d/OqnEBLjzIuXshijAF3j
	Czi0RUAvcnILEJxgzZahNvJRcmbHCv7vMrG470xCZoI+xNsjokqNrOMoOvfetbhd9Yu292JyLpG
	L3GE+rhEkoDti85emyWQbRfamSbIwWYElRBFZf3imwQ28iBfdLFX7hZrwUbZcdmr0m6YK1AEB0H
	PzjyorxI3tfNullsrNhzZwdXyo92puX2FYeuB3TCRDSulpsRHDxU4VicDuMHj0wcMGdAkP6/KtS
	KFLnq4BS6mYnVtlNYQ6mZE3oGMvjvx0voEBTeWfYywCfRdWMcF8K/J+UxVDiHUNBRlifLOZ7li0
	il23uGUOKtszUvsc/16DekLMVHzR0VBI9oBMJXR3lZYEPakdqnbbdDDrB2WOM5WteeVasRyyjod
	H3ZBOELFXWQZZhoWuApFOV9rfDyyds4nTS4QPzMlx/PAWCWB3udJliyTxd0FiR5YAP2wZBr8uZ0
	Ge9IT7ufCsvU/nfUrsBnGqJ8yKClSmbFSt7japm1fC0OGQT+OwR782bGu0WQzhFtw==
X-Received: by 2002:ad4:4eee:0:b0:8f0:9d9c:52c1 with SMTP id 6a1803df08f44-90758df4b08mr48950066d6.38.1784147522440;
        Wed, 15 Jul 2026 13:32:02 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd248e666sm201326506d6.0.2026.07.15.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:32:02 -0700 (PDT)
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
Subject: [PATCH net-next v14 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Wed, 15 Jul 2026 16:27:04 -0400
Message-ID: <79a0a6de4d79fd46b0e6911ab90d9dbe9cb3b87a.1784147238.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1784147238.git.lucien.xin@gmail.com>
References: <cover.1784147238.git.lucien.xin@gmail.com>
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
index 2a8d7b14f1d1..9d6ec1b2c50b 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -400,6 +400,7 @@ struct ucred {
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

