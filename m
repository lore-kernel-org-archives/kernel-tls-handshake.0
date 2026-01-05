Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EEE335090
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  5 Jan 2026 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622094; cv=none; b=M/1Jin7ST9/6OFhprxNCAVYR8Wq0RpapwdHhiMO2zuO71QEB8Dk90BK04gyKftG0qavPYK/I/g5w0EVPrhDsAge5UgfGf/P7v8p4Ac5BdjjxqtbqG4rXr5J4ngvkSvKcFMQBL45VWWWUcIC7m2ykYp+lfHSFehdaLgtCFouk4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622094; c=relaxed/simple;
	bh=zEN3doId9UKmo1rLmAoDue2BHiaeEn8l3OYvCK/ydP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/S0XvLhF8rc3votNnihmgBWDZB+hkDRJr+0yu13r1rLKI4EHm+5uUyRFug12RLGHAj2pT/hP3sXhfe48wnRj9TWK1R5TFb5+LRUz2su9k+s27jz/m6/YGLJxPxWEzu1INjaoFNfg6HhqWQ4D8/WSH+MRYn/EgwD2J4cKlqo7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5xZ/UdY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5xZ/UdY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee1879e6d9so165334401cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 05 Jan 2026 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767622092; x=1768226892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+6m+RaUAFXaTtrp8udufW/i4uBYkmLcVK6S66Yx8m8=;
        b=m5xZ/UdY18plsIzXTL1Rh8l5GEkrMtzcIKwutnn4Gzwq6hFKOkEr4alzWsxWDK8dgl
         g+Qr29rI1j3VDemYS8BmTU32ZA/1S4GlMY7l8tBjwVMcthfGWo3041ilEnOJ21/9GY51
         9kNTnoRWfMkLM6lRJyohA6aLApicp+Ww2CWHS3h0SZu/U69imbN7xVkaYKAbPN2wumfQ
         zOZsXCcwEVFg1INI2AVTz8OgPtW4+fJ1WS3pvvwA+syW3BX45WgZ7hl0FBUz+T7bJNq9
         DMn3GZEYDCbRok5+GY0eZMGE5d12/Y5Cee4Kych4SgLxvp/bsRd0I9A9Gw4TRIziw7I4
         WdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767622092; x=1768226892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+6m+RaUAFXaTtrp8udufW/i4uBYkmLcVK6S66Yx8m8=;
        b=a12EGSaC8DpSc8v6Kgi15Ojqs9Hc+AxXNGywrK2Ol7iHhMdf0SEvcKDNq9Jntb9g0r
         7KxH1T5DQmaZG90N0TRbngpe1KfXHcHVd9jQG2NBkElh2K90OJ/QKFsglXWw1xMsjiAr
         ixHCPhR77yaZ0UCivUx/7I6Rbw0finKzYpG+tEnFiwyxLW5AYsHGfA0tQIWy4xV4Apo9
         fmSGtgkjgPcSQqx0wLsl6qY/KOge5nx8cJ+6Jik06HuvaFq/qz5Um42Em1Y0YrILRB6D
         bP7I+wKza6ExJ5muuKjOYL67sWvhkelPun2rqMLgdHg3IMzkMgHa2krV3yZaMQ1rmbIT
         eAeg==
X-Forwarded-Encrypted: i=1; AJvYcCX1XgzM55oETHTEYreaqC2H2W8B/N+T+ydeXk+aW1E38Q0TxOP4SdBZIAADcOpVS0fRm9iO2tySYSfaC4quh3LBCdE7bA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQJNzYN8wTUGilfMh4gb5Whc9e027rWaQ8gnjn7nVWkXqWOivn
	PUgSNMyQDUQHF3YVbBN0b2uYYxwtJGeMq8I5UCTMVlhvWyeqM0lm/wNH
X-Gm-Gg: AY/fxX5KrHO8aVNyTjr1l+s4kRCJIYncCIrtOFV1QDmf42iMotTHOlAVo1TQJpTo7nl
	DxJNp7EACtyDbZNH11Co6eR2J0B4XfpOV/k46x6ynqoirkLe+nJ/wmQ0RtYfFN8rOD+jKFf6Ncg
	8VKd8I4D1ZSpG/D3GHn7qD1gel27cido4kSm4TkguFnyAf6oYrOeu9NSKXZ1PBNly+WT/XcJAtL
	VuHBKVAEMcb/Jmv/TUDT684WDYp1SdijOQBaN384QIj6ZePf7N9EGHmacsbbpsk/fKHtxpXLWJI
	UEjxbiUMMTKJaCm5OJPa6SRL+uJ35JbW5/tweALfjO062taT8zQg+mJ8tiqt/o5EMmDr+DpOug2
	E3b7GL0v/cU0rfqnsgB5kJ4+LR9pOBDdXu8zF57nY1xReC+uHGjNlQaQ5/6Cgrl4Lsc/nTXVwBf
	0Rv7Dq5kz8e+9agNFt8b3SqLgC1j7oX0L25SlGoZEdYJkteAsoFmo=
X-Google-Smtp-Source: AGHT+IEHuRM2+t5qnRSVI0kl/We7szrHGppbL3OLinZ2JFHLaZJDDk0NxAF77vZNPlpHu38oz5oaFA==
X-Received: by 2002:ac8:5914:0:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4f4abceebf3mr885961071cf.33.1767622091533;
        Mon, 05 Jan 2026 06:08:11 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64a47esm368957221cf.24.2026.01.05.06.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:08:10 -0800 (PST)
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
Subject: [PATCH net-next v6 01/16] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon,  5 Jan 2026 09:04:27 -0500
Message-ID: <d04504f267ed7dbc7075b96e0da08feb3c301d8a.1767621882.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1767621882.git.lucien.xin@gmail.com>
References: <cover.1767621882.git.lucien.xin@gmail.com>
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
index 944027f9765e..b4563ffe552b 100644
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

