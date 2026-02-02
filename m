Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54136A033
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  2 Feb 2026 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042595; cv=none; b=dgqwsgIQEGAiD2QEgJ8CAemXg8o1cUObtAqypI4HmPujIfA/S6Ojinh1WzbtNuubR5yv+3QTWpOUfbDgzxaB5a9y9HQHDD3I+fKo7pCfBR91hlUzBxwEQ9ZNng+Xodl2h0Ou+jpagQuHzORBELu728bfxJUlT1b6PU/1P6HQbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042595; c=relaxed/simple;
	bh=EmdrmrQatIkWYrWc3Tso6zV2W4IPfCbeSJjTG87cs5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNwKHkuVqWxlya5V/FSH9T92vqLUoRUbCJWPLd1YNROcRSq8hwVJtHC9h6pZqHFxXK0OL6k2L29r2uQRdxLGiOkMMLOdQq6H4eFopuAr9t5w8oLReHm0J7ojYAE75g9utg0QDZEcef+Wt6sGUSor5SDhaLz6SDWH5EJSOUuj+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9NdgTuQ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9NdgTuQ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-501488a12cbso55178071cf.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 02 Feb 2026 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770042593; x=1770647393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=g9NdgTuQwrtAeMG5mynIdbPXyIVgBOddSKZPHHzJo1dC0DIJhaXYbJnxzaRaFiEJdO
         ATYG9D86uf7TiTJTWBjHTFqh+nDkxBGrvo9H01qyzTIHYZtrKGHr3+SjmJGGVsgXF3e3
         kAt6yN/8rCYA9ELQFAW/JxsK+d7sw05o+sFQnkVFxZhS8+iz+p+mogtd7peKZHSxsjhO
         T7ojS9Bv7FZdIyGqNAtJX4ius4oSjFymMEWVd7zEuS0r/ITOhRAbsMOeVq0MLDd0AGt7
         MH3d3YV0ybMfjYl1UnGK1OhG4DaYDKropS1m8831xAerq8lPsrcsiUgOY46dPY06oADI
         nyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042593; x=1770647393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=GFWLRt3k2O3uzgpj8U2rVQTmOzOUykh1xLysVCmiQyH4z0EiVCDYlXIzSPKcO7HRod
         4pHBFwP4PsM8F2TTKDzB6ay88I9YTjsjVn3keKk4KjJz00vBMkc3P8+gP1NtiHzKD0W9
         VUdO7lbCg+JYvL8Ks6W4cHn+TGGeF+XUvYjnJWNlI+/5yewN82ISuNWRKBQYadE1ZtXm
         CArYCiZDzxSQfUYOTZix+PR58Abknq6G3pKzzTu97IbXFTyYhNj+t4MHxU2nofnI8aHe
         LbgmznLiPpTfFM4PamEwijHDt95EZNBVsqXPJvvhifFUhH324PAQDaK15jlqqHWVyi63
         uXOA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6UhSD2HVjMgFWSQxRVo46tjLOrDQQjL/Mh06JiEXA4Tsdk47cwi/XCzMM+/AGCZqnWw8o8L59y75kWar56CCNPxVyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoNTtE6PyV2sHSrj3uOwrKm2taiwzgn4OcS+dSjFRI679S/MOL
	BGC4Z0sfZaDSVouD8umWHv1YUkFS47VmmgdB7j+9m+JzHsrz+fx0B5y1
X-Gm-Gg: AZuq6aI0B9UgnfyzFGAcccaKBibC27wk0DEtTx/NqZqju9gkKF0Xmp/GknplhDyYj2E
	xNP5peQQ5JhT3trHBhlFEy3VCfDxeGEqe/OERIvTukwCUb61S7lA5yZz3z2SOIysxhJhhXBzYEV
	8Wq2vd6HXBEJzKrnMeUm+9FcI12Kw5RjFGDMCWcPxGTr8MsRbexkdQAJIEA1rlz4gSw8uI9Uq9R
	6NMsW3uHvWcsQQLJ4dt+8yJXEjk+DT8IZUsBJisMYOfZUywsVkEhrh2X7y9kZal2F9gE4ueY7wG
	s8drpc8t4pb+suewtyi+rDrBAfBQv3ZAMQU8c1XshVVupCcXYkk5Atg86LppX+PXGQrFiHK20e1
	C/0nLFmTo+GSyitmlVU5IRGyMTcckmQBz67TYPkQ2bFgTb28jn29N6x28ZUBJPPb+ElOmg8K6vo
	C6Cz131tE6Pjt834Wik6IykfX13LOkW3Td3bl9Led3nH55bCm2eBo=
X-Received: by 2002:a05:622a:110f:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-505d2288fd0mr169731871cf.56.1770042592748;
        Mon, 02 Feb 2026 06:29:52 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337ba3981sm106865171cf.16.2026.02.02.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:29:52 -0800 (PST)
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
Subject: [PATCH net-next v9 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon,  2 Feb 2026 09:27:27 -0500
Message-ID: <d774ce5dc1fdb45b2d68b63fed3975da91c1729f.1770042461.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1770042461.git.lucien.xin@gmail.com>
References: <cover.1770042461.git.lucien.xin@gmail.com>
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

