Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C930E0E5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Jan 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439180; cv=none; b=utRPTH22RN2yM+msgpWOJz+qSz36+cIR3wjZkX0SvXhQY8b46r5YBe+HWZU6vsx2ukcJxCx2ixDaOV4pJJNKFbRo6Z3RRrgFt9VnPI4U/7SlbMjIesUXcZZnlUFCMkASLYUAtXlgLsCq0zvid6/i9XtOkNfiak7h3AOk32nfrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439180; c=relaxed/simple;
	bh=EmdrmrQatIkWYrWc3Tso6zV2W4IPfCbeSJjTG87cs5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOQvnipxgC5yqQnoUBaYHNwXB4tspOcTF0tqQG/17fI7/uiJ6UteQ9Flq4A5f3jFo8lkz+4WED91Y86anysTRf3/XBKnjHTukCYcdkG/59owp75mZPWXb/Ih0pYx5+Lz6Wqvrdx1GPcXFc2sL4VMDoSNrRAukzxZt298Wtjhcq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/YYIX5h; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/YYIX5h"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c53198a65fso477734685a.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Jan 2026 06:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439178; x=1770043978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=J/YYIX5h69pORPlJzOIEF6DK08/SmIFYt1DSyOTOPwEAhzO6oS5DRDAuGK384EujJ2
         rnd+UZLJWXrJwohwb/dZwotxYtNEH54TRD7CwwUlCAmqjz48Z0ddaCu1TZZW3WzOvUdW
         KXbpzV0f04O5XMYotf8VUfOHl9Aqu+W+cwABspf8NqvvI8vA9Rss7/GUtA6+xfrnM8S2
         v8iIAky7edWFrso1mRy1Lx2y6f4XaSRPoKpz95hi7C9lLNzkT3wVobxGDZTWOLaqxWlB
         PNqWuutKPKnJ2qtygReCOCJnknPaiX2L7e3ebIacQpIh2PUPb6GsEp82JrUKAyiov/fC
         ADZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439178; x=1770043978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=i9405eYrOEil/nsCG4mR51dlRR+J5OMKoKD/u72cmI/34CNxFRZV/PLxlbU0ZbI8L3
         Xpj20Os86o7zE6/YYRoI1lUYndPo0N5AmV+7yp1feo57G4yiiypuVbMQft7yGautdFCl
         dB+QEa1h3KCD57rpeigurnQB0lZnn78+SwidAHpSYVsvOL7oPz/oZwBr8t9kQz5q84v0
         m+QGEe09VVCkS0jgk0z3eG6jxuUeJwYRwKIdDeEBOwvRxWjJhl8vjaJ/zIIwgUp3k4jF
         dXzHMBnZHCkqmdqW6iWD6N4DBdzExvkPjpqp5igTCLtIslVVGSXgnbj7qpIeRaRzlgrS
         gOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+NRoNtsAhdMAV4SLuFcecC2qJWrTGowmcpS6MnOxawa+m2EtfWxdnwUTiHaHtwIXIps3mmp5HqUeqzmXdYhRSr2Pcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDLe6Gy3em3/m1xseU2KhzvN3qow5XM39XXegcSbOPeS4LgGBN
	ViRFCh7k22JUDp00u0a08xbygUN6L27UTRqgrQ59l9dtJcuC2J+64Ibk
X-Gm-Gg: AZuq6aJtzu8jpfNNwr8mct9m+kH+QZB8TYGixSfeN4zlyOEtp1luPu7T2O0px9q96w5
	D4prrmEpb7VjzQakRWuSymXKe6AsV9LLFSkSAw2uAgIxKg2C5jK3BcktPPQ3blJKFAMyjIRaMNq
	+F0dlHbVF9usdipylXeQnqs0x9Uc0jWN+ENSbZxZYEd+k+SPa8ArX38cK2rNGiJg/2qvjVar/0S
	BlX/JJVGHb61Pk9BN53u8zBB3LNCXYlDjAoUksQseOW4gxqHrnNrCxX0HRcJQhXvr8TEMFS23fu
	BlOmQG3lVi0zgJjHt1kcnIsgHEzigmEyPXKfNGQuyDUayIjgec5hJTKox3XfWMxI/S3c85nhfy9
	iEnST72wX7bY+DCQfHUs95B5oADh0u0A7pZ+bAWGhczR3r4Nz/0+7OpqZKw7fVaiKUzJ5iHNej9
	Nm/p3JHPuT3cgTRNn+b0WCap9yDgdUudxuv4tf1t/mb0mLAClyANQ=
X-Received: by 2002:a05:620a:2a05:b0:8b2:eb66:c64 with SMTP id af79cd13be357-8c6f95c5255mr555017185a.29.1769439177669;
        Mon, 26 Jan 2026 06:52:57 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d2422sm1018611585a.18.2026.01.26.06.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:52:57 -0800 (PST)
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
Subject: [PATCH net-next v8 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon, 26 Jan 2026 09:50:59 -0500
Message-ID: <d774ce5dc1fdb45b2d68b63fed3975da91c1729f.1769439073.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1769439073.git.lucien.xin@gmail.com>
References: <cover.1769439073.git.lucien.xin@gmail.com>
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

