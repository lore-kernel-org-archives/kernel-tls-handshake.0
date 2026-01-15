Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C33ACA57
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 15 Jan 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490093; cv=none; b=sFSiCFd7H6mlBA8dtwq+yzPqaclfR5ct1AoRNgwvqWW+NS8pFjtcNpcQprJi5MBIF76/mHsbAJ9HC/NdLcMxFQIR0jytZhvMHgXe/thncHfn3BJXV+QLRt+HMYWPxb+VebMoYO7j0mOhapxBxPI+PdURjRjxz/y0T6FPCZXR/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490093; c=relaxed/simple;
	bh=EmdrmrQatIkWYrWc3Tso6zV2W4IPfCbeSJjTG87cs5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKAQ7M5EBv1PfyRMBrSQI/wZ0tSd7xWg1OQtL73tboe0rtwokWeabckmcCTtspEQ/8cbPBJ4Z3O0a1YKbjOzUlh/g+HsffOcU6Xbsd08eYhRZnKIlDqbUEj5UO0nfTblDqgWqV86OY0++ceF+IqaH8XG8sgkHtfbht2pKdsMxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYp2+lWq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYp2+lWq"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a3d2f3299so9554136d6.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 15 Jan 2026 07:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490082; x=1769094882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=aYp2+lWqwWBQ5pww5+6BiKJ9U1KviEfwSeXfBcTctYG4MGrnrJJG/RkbtSXjf1iSDk
         nix2eL8vr9xPd2N5cK9I/zTDbQdYkdJeWJOzRgDb1LpcLZhgyjqGFiVUh5wGZf9D5ni3
         0+Ocmrn9BJXlnMub4MtvmzxxnMK37dAHZ1E8HcstsTxEf4TiGwmKBD78+4/FFdszsyEz
         nE21WXg716j8tmKnJ9pOOGJBsxoFqX0/BWEQ3GhdtNWZlrnxidPtSIJ4rZyKhwvwUqZ4
         FmglbQy7AiNSbSkUduIdVTTr3OZy9/34guER+kLPiqWg3DwEFPWK2GlJnDi+xP3UtO3Z
         twkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490082; x=1769094882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=QP9LjH5h+LEn1VBnJAp4VeI80e0nCxS2wA01MMv7UfHt48D/5q0i7Je8Jm76IJP7zE
         Ck2fh0x9Nloq/suGwCcIEsr552+P/FfaOKOBxmJug+Qvq9UHO8umQCERbXkB/SdMFAtD
         X+3Lp2jPpQqRoW5sDkmrkZkBOqGYHzXO/AJW1CSCnBThDVttVsVgcQ5BpV1PO2gT8vSR
         pF0AaMZR0ULYsX2Zz4rbdz61NzTAFrVBBEy9elbN6KQpqbB/8+j0uRBhBLXguLCyJXKw
         sJfwaDR33Np78gaXP83/wjXic5msOWFsQXKeDBRODzDsSyqIF/Pbl+vM6Zkgq2yOv1rW
         163A==
X-Forwarded-Encrypted: i=1; AJvYcCVu4rOPBrVUXSOXUzZamTIa+nATN8U4V+L55Wb2CfuAW/Colk5q7dKvjkzKWZa5m/+MBCvAoHl+W5c9O75RZpbfj63Pew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFplLJ9BcsVuUKSI17Lw2KVgai8BadWdx3VHLy9vXS+GHwf78d
	lW8T/6kiyru958raPQ8kJSbMkijLPRhO46ii3V4LR/A5TRsvFYb7Emc9
X-Gm-Gg: AY/fxX5y2mI7rQfyExBZ9LtQ4YfJ4nYvAVhUmo0jBCKNE6zlH56vs+DAiAVUPcPHeuG
	iO9Q1QXRtCf3SVlnrdCvtNsrhpSHuw8sZRfovRubxbwgZNMeU5GsEBFYcmVA5mutUm17l3fKBbV
	Aa11CL4lMkHJ7TAprnTyXFt4KRqJQPo6qOn95Wnz0SjL4cZFWDZTLwxdB3PAu7xMpljNu0WDxAh
	TO8K8AjYg0qzoHml+ebXp93Eiev/FrcXqoX+eVetn7gix4OQBoS9OJezZc5d8CK6kQhxIZMFvBB
	akMjMuG6OW0PnTgbOLCiH8fzahcHQe5gfh095zzDj2X0yUhltJMRCVl8VJdsFY+MxukWThz/0it
	hcKHQ2bUs+VCu5Ik4r3x0yz/Nz7JzUUY7EX/b6qGp8FteGoyLjhbnsHhSuEqys2Eh/VHiBcu0OZ
	LidxrOYyrcna+UhdA6ROU1EEM1b9GB85xFf/2S4R3Ak3ReLTDgA7s=
X-Received: by 2002:a05:6214:4003:b0:890:58b4:3e7c with SMTP id 6a1803df08f44-892743ded60mr90739606d6.33.1768490081454;
        Thu, 15 Jan 2026 07:14:41 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc6edsm201030056d6.4.2026.01.15.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:14:40 -0800 (PST)
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next v7 01/16] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Thu, 15 Jan 2026 10:11:01 -0500
Message-ID: <87ccdbc3b8abe4fb1df5a97c0baf39d2b943eeef.1768489876.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1768489876.git.lucien.xin@gmail.com>
References: <cover.1768489876.git.lucien.xin@gmail.com>
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
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index ec715ad4bf25..dc80de8d8c50 100644
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

