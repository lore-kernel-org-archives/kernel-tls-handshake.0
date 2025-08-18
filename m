Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366803376B4
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526343; cv=none; b=qqq/Ybo5vzmTdTIWQR5SbgoLvtlvaV5WNA6hokDFRrRbIv+PQ7ieTR7bAtQRUKKI6DxVPn+nCnzz4mzdvRbcbxZ0vxHeGTi+tz7K1DcpHs6iBWqfTXGFbFXLPND3IXGwS1pKo7BncrTt9eMg9ffOokWl7221EJmIYRu7cjz0F1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526343; c=relaxed/simple;
	bh=AXo1SVGHBK9qT4qVLa9ToApVKadhJSI2IuUi88Evw0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGX+jGY2LOQSi3y5iM405z+MdHzHT0sCNb7YJupMRdGiw0MCDs5Kfl3D29o8OOsHRcUK6lw97Ci93kyuJ9U3k2Ubdcga5mzHxh49sWiM5Ha7HHYl7+FAV05kvQoTPF+2aYAh6a/UZL58j4ypx7/9A5BHDKOzfLiC+qL9I+NxagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEpvGlsd; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEpvGlsd"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e932ded97easo2695659276.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755526341; x=1756131141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=dEpvGlsdG5ts0Eh1IxNANKVHw61Ox4FhHUgdbGnzJKLj/uYvqX0D1dLVkwS+8Bxqhi
         mInELZTqbxz46HodLqrgkOfX/00OIl0i6VjJGEi8oG6iVjMF4XQrn67g5Eo0nGJAEMXt
         WgFXGk1NQAYs7eo4lHw8D8ZGvG/SyMpZiqo+vSQkf6vmtUYdzHFF+2WwVV4uyfuciy2T
         YhthaZ2f+qmsVz5FJj8geBmyD8WXSuw3xIGQB9LucA33XmXSMbAoNJgd0HOWWeMDJh+5
         9mX/2NPCD6cuH3JO7DwLSScUs38XdX6LWhWpnAbzLcVc7KAiR4q6xmLJdiYnwqY+e7zv
         /+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526341; x=1756131141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=UUZE0CEaDLP8P25ads5b0wDc6v49Hdml/mJK7RFoGpZVzBQE+cqXdGrpT0zlJxlzxk
         OdK7Jw/NnFrf6W6CxueMK8WPuipRYDjauqeIb5xUuBeJ9n512XNINp5lz8qxONpJtA4b
         l/h1l2CqYxmv4qIF8os+nq8oqSXbk1IVWI/jHMJlrsvn2MP57tdl6AVd+W7xMZujb/ac
         QiXMrbw0q85Ecb8s4jU4t0fDjjfGzRP98bWXzgRRlSoWTfU2+Ay8iR+G0dJcTslB7A88
         SCZ95uBA7woYL3UA38jwujpUNelFinct6AN1/6ujCANw+JmWlKa+vWe3ZNrvcBsOEsE+
         IIZA==
X-Forwarded-Encrypted: i=1; AJvYcCU3vZxTOsU0sbywRra4rFa/mF9TEdlC93wlKvYI8bf3lWgCOjqjW1zSZ+ARb2iW3LPR3mgpGX+6il8ghu0454CgxOC+iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOJt17luVwOcO8KJqDk1tiRdpsTCUj+QIZDpIIA6qwdnQ1fsjt
	5D8qgClN0/QYzlPuKbi9HRcGjam9PEXaiQ7ganvqcnzwBt4sUd++WLmv
X-Gm-Gg: ASbGncsqbZkCAxbGGKjr6wAUFBHD8Ey9RFUYY6hgyOHqMF5IE/olB8YJ5qnVHyJgnqJ
	VdTvcP+xa+33XefjnetKOjZ5Y7EgRvZh33hqme1sfxHhXNls/huGSSagU3X4xoN3GM7RBUR26ID
	x983+FDB3Pf0GIDKdSsiLsUABbuNoGDAfkERTo08XKfL/SK9k57Wbm3vbbeC0sta72eEKpxNpug
	hFN5y7QHYkrzs8Yk1tl3kcvyTL2gPX8gs/x+T/k6viKitf41poxUTLqCZS0Bp0yr/O4bGYYa6dr
	Wf0r1tlhgTvumGaqnD/HP8t/OjcQChJSXNJzV4psVrINMKBEF1rV8yMLzOOIJ43QHQPUPZ7jcju
	7e4a4y6w1PqRjoCA6v77R27nqWXHateVm+fxp0ktIAlt41Fbu8ctmoGBA4DaRsBD7qSgoGNw/Yw
	==
X-Google-Smtp-Source: AGHT+IG8HKunRKRbgCe+XL/NaaHMh3wfAZKIYILVWX2Ompn9UMBJB17qEcA9PFqPOHmRrPLA6THDAg==
X-Received: by 2002:a05:6902:2002:b0:e93:4a3f:9e65 with SMTP id 3f1490d57ef6-e934a3fa476mr7593654276.12.1755526339129;
        Mon, 18 Aug 2025 07:12:19 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e933261c40bsm3157451276.8.2025.08.18.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:12:18 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next v2 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon, 18 Aug 2025 10:04:24 -0400
Message-ID: <50eb7a8c7f567f0a87b6e11d2ad835cdbb9546b4.1755525878.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1755525878.git.lucien.xin@gmail.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
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
---
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 3b262487ec06..a7c05b064583 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -386,6 +386,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index ced0fc3c3aa5..34becd90d3a6 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed and Secure Transport	*/
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
-- 
2.47.1

