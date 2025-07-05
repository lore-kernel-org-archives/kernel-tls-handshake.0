Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4D215175
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  5 Jul 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751744329; cv=none; b=aciFu4ilCSs280tQhRbyugc/4bl5cWNf6pQF2JACiQbww/Pgel2JKdbsAH709mZqBdBq8iVHkUtQ0TZX6XEuqLtLeQyuYZkK2kWvwE/Yh6vWKWvatPwMs6++4l/yz/2Cjx7/p2rA8vKmjGPsop4pUEfC4qY9JLK4TyyFt97M2Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751744329; c=relaxed/simple;
	bh=AXo1SVGHBK9qT4qVLa9ToApVKadhJSI2IuUi88Evw0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0ZHY5sDVAyXEeEs8poEhQicul498QgrSkXlWkjWM8gWR8431I9OXk+H36tNYUWoVmdDHqNEDYxRNIfgSXA6rNRgbuw8opbM4INcu2FNt9aqKCh+Li6gDiL0bcRsDgOXYysN8nMS+pRb3hiMh59h/XIBI2Fn6NV753sksIhMd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWZ66u4Z; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWZ66u4Z"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fa980d05a8so20985806d6.2
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 05 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751744327; x=1752349127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=kWZ66u4Zd+PW7dkMMGYtWStQIc+6JHd1mvxO/Sfd1owQav4etiq+6138mPy3dDNlUB
         nAlI3HdVZcAAcjLjFZd9xtQ/yQiHalzgjidEFkAE1HC11dLHfM4KDenBSnF78W2y86Rr
         JO1axKXmFcNB+0DknIusPiQC7ZGQZJ0CMxytByJPaXkLAkpJ3mMrQYHjy5tuvlPvw9cq
         4T5XCEx9s7kw5C8egU9ml4Q1dJRPhNCt2ZCVJJ/0SpJV95IcrxYSO5v9PbPMCcRtWIeN
         HG5saUe1p/DhY/rKlNIfRwSleN4GAmbBzUBbhLTIigyrKBbVLLBUpc38uHNSSmZQtNja
         8YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751744327; x=1752349127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=DM4/E/zLyYr0fGXrNEpVxP8717emnTsJlXYoI62eWtlK+cg7qNyEVB3MQ9YLPru78s
         CuXJqdATxiHifFnpOoynzSiF+VA3lD1CFgYcIHovwAsrAwjjDYq4IJTKJ7HcamTTV/i1
         2rCJy74pTkfsi+DsqSm1b+fAhf6TgKD4wRDfz8d4PL89DYlivQjMbwsIYLzuXHK0Z+xN
         U2qvRnzbllsM8oDd7lIjcODHev5DBcufR+xEnakDNqBY6LebiJG9AipV6bHoCsM9t3r6
         AW/40VXsBnZtWyfR1eQ1/rIQh3H88cD1MDHyDF5IyqXhQvxOQ/H7cptl4VYL3EGaD+8R
         Z06A==
X-Forwarded-Encrypted: i=1; AJvYcCUPpq49Be4YmpjLHKZUh+dxXSphhX2H+bNpXRQrwvKilWPVDrQp74yOqJ9mXi7uVDa7NoXCTdLC852tTOhlip8VSPHcew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk9KDNaTih7PWNzMlAcLsKO5bmxiRRVf6xMCi8lnSAJBzrBt1R
	8x+6fTZGwVto2OZZmDDTHCW0u0+BaAHM+JTWWygaCfWm9ecZkYr+ocno
X-Gm-Gg: ASbGncvms/AMBjmAjbakQ0YejwqUtR64DrTjjHmrLQkevgPfRpWh9p16HjMfuchbL3L
	3aR7+pInH+wD0uKAJRdmNhUfA1cLebT8PE8x/OGTJwpxbSMpNtYkQyP7FkPMS4e18dYhH2NclTl
	5R5v1HcbK8Hr/hW2MwQuLOC8I16/QRlvR5erxH+gy2BP/xLF6ZYoMykUwU+Zqosfhgx0+iUxfRG
	QmOv7+IMbcanx8rggTvwekWF0Hna7cyuuAbxTMPpWEHq+docjT8Re099Wku4MDRvz25gD/Aosj0
	QFRrfu8o39/v4/UHg+MQPI2Xr7n/pUKAZrC1q1Rjo7rBIpr0LiDR/RlutzDLVCMdiAhBGV4RDzG
	nMXz988uUIpe7Vmv+wHaYOxYyPCY=
X-Google-Smtp-Source: AGHT+IEdiBxD8IhSzegliZ7lg0v5y7M1Waev7k/rLUdBJz9W7FEuUWnrco5GH6CjIuAy99BitTUOJQ==
X-Received: by 2002:a05:6214:440b:b0:6fd:75e4:982b with SMTP id 6a1803df08f44-702d16b4f52mr47781956d6.33.1751744326971;
        Sat, 05 Jul 2025 12:38:46 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6019csm32999146d6.106.2025.07.05.12.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:38:46 -0700 (PDT)
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
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sat,  5 Jul 2025 15:31:40 -0400
Message-ID: <c845d376a23ac03370dd26f96fc006f6cc8070e8.1751743914.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1751743914.git.lucien.xin@gmail.com>
References: <cover.1751743914.git.lucien.xin@gmail.com>
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

