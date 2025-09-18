Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0012ED85F
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 18 Sep 2025 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758235149; cv=none; b=cgfF1wnrMJn7pZxRmxTtVoJAW6bq32S907dL3msbOUxo+Pitjqni92/iixjLKQUAUUJM2WC/8wNypP/RhUn+nNJ1wNqP1HVE04ysSYW7ksvreF44y7gR5JuHSkOq6alaTzNoU+2Ga61lmcUYvW20mv1dIHgbCUoXtVLgs+KcLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758235149; c=relaxed/simple;
	bh=AXo1SVGHBK9qT4qVLa9ToApVKadhJSI2IuUi88Evw0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIzJFAP/ZY8jjPKh1L7QqETP185kAm0kGnBhzMKnMirLKeOTzFkBy7Yj1vy/8e/miOkYg3GV6xSzC7h7Tid8tfZpj1QRw/96/xb5QIaNEGGMM689XKaE2i3uTwg8dKWtb1XiH24PbVJ/NjmTpc8sAg7Du2Wxzo1mZb5ZeXYw7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7hPWoal; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7hPWoal"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-827ec18434aso148738785a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 18 Sep 2025 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758235147; x=1758839947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=i7hPWoal1pE0LxJf1nLbP1uaz/i0BgeWUXbbsVD5vVt3w80oeGYPYw5/dYgMwp7LsR
         edooRH/zpVb97c7hf+pUfam5JAn4XINBYy0rhNApPZrttG6jgd2riY+huJVmgOvoYNIR
         JsPRN8zco5SPAWr81Nd5Z0NmmvA4v6E5b8HyX67qnNAudtDDgtJNQiv/pwREC9x1Qy7v
         G3lDFSi8HtdMJrUgXi8//IrZWFNcBR9KRBLY+h1PUxxWm9zu70JWe3oBKmci75ywQRZj
         UrIgoA1O6tm3uXYSGxaUjpYhTjOhc8JAMmEMalgbUxKqkjpEQ9NJMVGS5NaDGFz7kXb0
         C4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758235147; x=1758839947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=mPYcW7PHyaiAX9nwM9k/kDPowdUTVzGUTPjZ76jo+aGJNkYDgnhveiu1QuMYyd0dj0
         i5XeCOQm7/rQs7SpS0PE9+6J6T5owniwmGR4vOdm9P0tBvGLGDqmv2fWSJ9fVLUEZa3n
         ZkjsSwsgE+27AqukWBjFKlTOQyK12X44X9pUt+x0W+y/2HRXcD61RhmrSa3muXAonsUK
         AuDWXSDvAGCcTYaM6E0tWFgHqPv/jtKOXtLH/dlqC2GSk4j9tQiXnSDSoR2UTqQTIX2D
         PhB9b2TqCLBZhQAHxxKNN9PYJTdt8o+jTpmME+MNvS0sgVK4w/8uJXzVZcSPERBDnsiG
         Sxpg==
X-Forwarded-Encrypted: i=1; AJvYcCXYehasGQV+T1ke1x+dGuiyXh6bP4XZdre/t++r+vTZTaZejxBY63KYYY4CGd1rDd1cbhxiQUCYWSPQU34+w+yI4y10Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxtjiRT8cJpjVKbCbJiwF3UCTNXAMATw9PDqKV3uTvGbOgKxNl
	OT1/C3rHzg80hiIaqZ9cYwWZInG5rYZZzP6Fa8k4zoWhkssTMHdIzWyu
X-Gm-Gg: ASbGncuPs94lv+n7bn8O/XAzcrgjtJbzh0NcWO3TDDUdXHZeLmVer62Awo4QZPP1ns0
	EEq54XBMXHnNgTFZFxLCfxKbQ+uc3Ka981b5q7pWlpEw6vxTgrK5Nw7HQQIa3aAind3KcQLaK7k
	Cv7TKIXIC6dD6nlgM6KrSTFcnTgC6G2ys8FiTiscBzRlySL+o1WYbewUZ6JOej3LpbN6dpfGnds
	2PTFuFcOxoWauDflFZqz/xWfQNdaaqYMAm9xUavxut9f1u14tEQdgw/rotzoNltk//Ut2eaWgF/
	SdUSWnSF5TnBfC3RR6BY88bQ8hlTUmuuL7WJqCSs8ZKLRLnSkqCCPB9Jiw3q2ORF+xJlugZ6Ias
	wpR2pW4AWSW9SI2zxJuKwEoU4ry1g56AH53KC0Rv9+jx7BN2YtM1GDRWsi0fewEkM6xXsDjqZpZ
	C+fRXM/FcfTICMP0Qz
X-Google-Smtp-Source: AGHT+IFLJPjYJgjIWzKGX74WDXjUp+q+FL8y/nBxd9QzDqyc1Qs/QJy+mr82Z3oWVcS1BUjOQ4TI0w==
X-Received: by 2002:a05:620a:8907:b0:824:ed61:3d84 with SMTP id af79cd13be357-83ba5f4b8ccmr138253485a.37.1758235146805;
        Thu, 18 Sep 2025 15:39:06 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83630481fc7sm244631185a.43.2025.09.18.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 15:39:06 -0700 (PDT)
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
Subject: [PATCH net-next v3 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Thu, 18 Sep 2025 18:34:50 -0400
Message-ID: <0ac39290eb8089b08482c94870acb928ebedb878.1758234904.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1758234904.git.lucien.xin@gmail.com>
References: <cover.1758234904.git.lucien.xin@gmail.com>
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

