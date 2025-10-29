Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D142BF3CC
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Oct 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748771; cv=none; b=ns8874p2UP1Cv2npvWMvN0+QADQCK4SVcH08p8PuROKG0oYup3rpVvsjPzZJ2IRHXK4Wtm2uSqeJ6crIVuw1bAdJQf4XlM5ZJylgsCd9yrcTERB76GjOsfZ/JIkFsHK9Kdj0fQx2aJzDvOqs9G8Uyj4l10S2BLubA9pkgac9OFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748771; c=relaxed/simple;
	bh=AXo1SVGHBK9qT4qVLa9ToApVKadhJSI2IuUi88Evw0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5mS+RIK/caL7Ba5nqjt+TFx1G85BNogzSxTN0P6gJi5in5M2/KU3xuP94oQoEXTgI0eAr5wR8NNLBnc8pAOp/BEG7ZXsEW+O66oiRJQGESXMW7fWUCkZ+ndWiFz68L5vInoR1tdGQ8a6k6iF/X/qUQ+iboK5XSZ4VLkzZO3Ov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J64rqYPV; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J64rqYPV"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78ea15d3489so64384646d6.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Oct 2025 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761748768; x=1762353568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=J64rqYPV76bLN5XKA5k9AazxNjn4+54eUWXCvvrIKqz69XAGyyB8W4JT/WtqLOe1Hb
         9w59SZe8NjoMHcmA/DiZm7fNPdwV6mXUjwIFAg/Nxuz+wl2GbNKZe2vuxSwNahWOVTIh
         cVGWQPJ0TVajlEi+KdOYCJeOkmFW0UaGgdwLHPa2sliwMa1c9jTIwdsqp8nlkLV1Jikj
         thjERxTz3VnpKHg7JPAvz3cLvDGKJovWovNd5ywgCBN3UxpigYAwgd2buY76krZ0J0Kk
         8pNTO/3LwKEx2k+UovMES+8IkTTGOrrwpf6wvf11js3c0ZbDh4Pz+yit2jzKUKCThu1/
         8ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748768; x=1762353568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=E77j6thTT0IO/lrsPjan6tGTkSoGO4NssAbJ8JbhzHCm64JOBlNF7UkqHLuh+tYyHm
         dhmu3ge44N0qyVl06j5qGkbDie4lvN/m9XPDSrhjkjkl7QpTdh3MjXXAr+3L1pTqn3jb
         NCgW+EPkMuB87K7cAOFP3/MwXAaMTAY2rbSWQBlFRsrE/HjOtbUsRZumk92VsE02bgS4
         suHMei0ZQqnnOTh1MSyPyh94blp0P3rGmDQT5/I4WDfsWCd7M9wiA1DA6A+TT6kZGKCG
         XlojbZ0dFSVuJpvqePO0ZL/NTnyGQsWFekulPlTzrwVCJcRQdqYS6Ljsa2qOH3cJU/AK
         JxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHv/F1h3j9VXRzhQuVzFOyZpwGdXjAhLuk8cAIQ7uFlo2mcAkjHgrKziF0PwhB1/I4ieeTUmeCodvXNg2NF3Bja0jqJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUrDJZLrGEcppV86ZlGnr3XDDcddkVSGwe0cF7STln1lCEPCZT
	6rZGUnVx4y07M72t7qqHFhKyCLj6Xi7R6paOpBmIfCCIrEPvPpa6vr6e
X-Gm-Gg: ASbGncuIOSMSGRAOJgtelh0uC/90SRFaWMdMxQBT9N43B4Jfk010GUPoR5k6mkjPvAI
	1Ij14m5Tvt1txsZO6Cn2z/Wv3wjwli/P7ffvskiB74t9FnnZGn6XQcVthPjdJyY2f4sQQcZ8iPr
	66MdlDjBZXWGTRC2OZ6BpUYXAcf/b+UelBiuk21tt/VNWbailjM4lZp4zbONmZJ5Q0XTb6G7Qz9
	0F0w/UWv21Y8JO1Y5hWBe9TzW6GwJHXSWPO6A4M7x6KxA0Jud0Uypn0FDx2XUhbUc1m2VJXcZUD
	Nm4TgmpccNg7La8muJqu6xY5xON+ALKAD5QTIVh6Lk3CDU6XpupTPlDV52E86SSOrWpTW5z3DPW
	cwAMGFt0NxwqmFnx657S8UcgraoAPUYmaiA58IRyEIp0zCPiUIoMw07QHVaDRI1kgZy3jsSgkz7
	Vorp4lwhfTz0eylC8xM5SucNa/LLsq/tGQthiJt3Yf
X-Google-Smtp-Source: AGHT+IGyzU3okljrfBCf/3gBF/UjoS6yWE5KKQezp4IEEcQDSObh9/ucSBvOo47HR55wvw5r0njlKQ==
X-Received: by 2002:a05:6214:242a:b0:856:d1d4:d127 with SMTP id 6a1803df08f44-88009ad5454mr40989826d6.4.1761748767895;
        Wed, 29 Oct 2025 07:39:27 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8bc4sm99556176d6.7.2025.10.29.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:39:27 -0700 (PDT)
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
	Benjamin Coddington <bcodding@redhat.com>,
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
Subject: [PATCH net-next v4 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Wed, 29 Oct 2025 10:35:43 -0400
Message-ID: <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1761748557.git.lucien.xin@gmail.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
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

