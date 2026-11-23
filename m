Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393802;
	b=DmGt2TLHK1AdM1/TBXwgBA+wpwog8lAHKrXc2Kzlrj2mSuP/pZapA1cRJHDr23bmh2Yd
	 FPKHVVXXMCymJiGfr+AUXW6IV448eJYjyKjBFLEQFtZnTabeuLWvpJChFOu5nRydim3q/
	 rkubb0LxwzGLkIQpX0F+9MmF0gneCgGFrIvhxsPwXyd8osckh1xlJo/gpvoLpM8KJRQeQ
	 lqXNQhIe8Q6YTwA+SIkfMl3iJupVMx0pQu9T3nMkijYtEKbIr3E9/hT5KK7np24bxc8/s
	 p+/L172fQlXBzzsyTyJQAhnydub70Id15KclC4q8JAUrT1/T10DTj3PE4wqHexf6lwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
	b=d1+yA5LTuCVK48e7+O8oU2D3Tu1NSP9IOTl8pV3mk9/x6HaQfjYdAVokdImGGN9EZ/Js
	 b3JKFH2YgvXGpqt/EKcT5G0rKRVwrijcRKMKdRTD/F9FiiiY3VkWCeSQ9rZ9X2r9HEyrc
	 BWMQnc984DXWyqY/K4mSEV8u4xEE0S3KHiLbu3nAa7DlhGv9IDn4fV3752QOE7xxN0oPL
	 BSazCSvD8AAyiU5FEfymbb0JRnr1B4w8MeySOIw3tlpKDDy0S0iTY43hG/DHlZk23ozUS
	 EcK4CvDsQKj5J7qWdGTCOsKicLqfrGPefIEIZqbMBndvTZBaz/Szgx3iBc2T+BWqHAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b2j6Ie;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED0606A339
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 23 Nov 2026 00:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62ED0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b2j6Ie
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5364648ae07so29651201cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 22 Nov 2026 16:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393801; x=1795998601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=Y8b2j6Ie8giKwnPNQ6MNzmWtECkWISwQEZ9XSVs8tphck7l/2phk+YLd5NMEd5G3np
         QhJ0bBoTIbNxysipCwvtMV4s5g42Q773mg9Ttv276fJ+cqsNZTbEITp3DdYpA/ElyBsI
         Mty4mga/YQMs9La7iKVJYYiHm3a3A6i0yifFjB4uNuVl5ZI0NdvMwpszOi3AktA8298z
         zRHwU/W+b/6UVODQO7Lh+FH2rGJYN719sXH9n0P9v4LRI/qFZMxJXglK9cLtPg7AfT3R
         2wEANxPdLvWJ9AS4kpJ2/ie2MlqKu9wMUzm2v1wU3Xvl81VMVrMNu4EJLb8czcOqchCz
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393801; x=1795998601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=gqmp9lD0MOf/VSwZ6aq3uK1/l6tBxTeTwSpcBCoQFeJj+o91lUbKYe2BM4wjsMRmBi
         e5pWK4NipP9T7ZgVFtfajnFubjzgpdXNhMTZasz8F1aRadA57f8JJqcSjJpJlcaujDdg
         rVRQyEuHUyAGdqeHdnzElJEtmzMLMU9qvUaJTm80IAH70gVhDnr91QKXBhlIXehQptV6
         bOMLVZQluLDnpZHnoIOj7f5XCxvTZnb+UfZNGvtcRPyNjs974CBh/9rMP8j3K4N7wGjg
         +c1UPP9Fm4NkAu3ZmG2vKu7JQ4ihtlCYjhXZ76Pq96dr7p7pJRo75FKV8Y3SR/WU5RKZ
         EqKw==
X-Forwarded-Encrypted: i=1; AL+hErHIQOcvTvhNA7s4rQqksUZESbpHH4CRQ4QJifcIyRe7rK82VHt1ZrJf+Mjq6yyHVR0I4Dt32gKQIYtdjapmNgF1N9ectw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+U7CJiS7Rm7FmBrEAHYuGNp4fZdGsCgrsNloka/nFMbu8CgUHK
	PyTZJ2e4JEp5vBNwsFe5mn2dGSTTtzOBOogPfUEHRfKN/doLWPO4zBR4
X-Gm-Gg: AZFdTZdpWEJXsJUTVr3qwHRhM39i78/EeLjWsZl45ojaKp1YpxrcVoMwkforMGpvlW2
	ww/aoaQX6hmLI+Pu0+A8Z7Fsvw/uauMzWPr4URXu59fsp5xV5ffZNz+AJNA90b/YczSWvj5QTen
	xnVElOabGRi/gtsbN9Pr/kqn+eaGizYwNDrUwc0aZgv51iIfq+/77wJ6UjKpFjqcldPGgITAVJl
	lZUzVhS0P6/nBRWYT1y3hOUz8Kq5Uux/bud81X8Z3E8a+QoOHW/Xgz9f6ghjr9OUkUEjwxu6Vcv
	lyvRrZZf5YD7H79bfJLGnuTH2P708IRqO4pCmjvKiBAEPcDwpCK6RG0spxGeitDm8LwiSGbXDgJ
	QiuXAdiqFsoaLj9F6tecFcOK/Q9iDM6tinN1RKLCCxXW1zU5janfw8xdPoWfOgeoEir50ZW+u5m
	pyhGzp7B1c+gIEzxOlhv694pbcF8jvvuYwcsGKtXLyqTxYJSqBOTxZwLinZJOBScq5z1n2GzMeH
	ib6/railNxW5NwmghaVIz08kYxzouy8/JzuHDFA4E5rodpU5LGMtO91lyhGrQtaGympKDUUJO74
	VVUrbgKMMFI54tIg1SQ9AncJkx4Fa+RWo8FnXNqyHgxhouUXIezkNmIX4qzOyTbndATqZFWk6AH
	n87aX6mDMoqbxZnmyik1PAxlfvdVc+fB40H0qFllzi/NImEa+SZIFqaaV6chcJ1b8rKpUWkA=
X-Received: by 2002:ac8:59c3:0:b0:55d:3201:308f with SMTP id d75a77b69052e-55d768a4864mr185506171cf.9.1795393801238;
        Sun, 22 Nov 2026 16:30:01 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm91433716d6.21.2026.11.22.16.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:30:00 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
	Jamie Bainbridge <jamie.bainbridge@gmail.com>,
	linux-cifs@vger.kernel.org,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <cel@kernel.org>,
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
	paul@jakma.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net-next v19 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sun, 22 Nov 2026 19:27:57 -0500
Message-ID: <ba1d4f03926411d4e61a7587e41a12b0b423d841.1795393691.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1795393690.git.lucien.xin@gmail.com>
References: <cover.1795393690.git.lucien.xin@gmail.com>
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
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
index 37ddcdfc0377..b8569b5bc060 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -402,6 +402,7 @@ struct ucred {
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
index b17fdb7d38a7..7677133953ec 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
-- 
2.47.1

