Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF7285066
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Feb 2026 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771986937; cv=none; b=rY4kyZunUo6slXuooyNsVRJHbZQWaYRAaXeCMjsKju4MJpw5YKnNp49YmunmKcoZbkn1NBuV9MV4DAxsD0ycDUMUbf/elAlbGJCqCMjg+h2va+TEM76/SpLyKae8Ai5nPELIq80BV/kq8ICby8FsJYDpN39Xuh1oSv1cl9UjGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771986937; c=relaxed/simple;
	bh=EmdrmrQatIkWYrWc3Tso6zV2W4IPfCbeSJjTG87cs5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3bz8yc182sWN+Etl9X0rVoshAO2maZn3yOlLxzSSVDylHIK1xUGyXK76CHt6okq5Ubj9fizv3/2sW+PD7U/tpdGxh11am/tacxYwstylJoGHGi9A40kDYEg0/WBQMU8ewVfmIqae0/SdvJn/lZuzu7RWbvT09MyWz1LXzEVXWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzfdM3UL; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzfdM3UL"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-896fb37d1f0so43887766d6.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 24 Feb 2026 18:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771986935; x=1772591735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=DzfdM3ULd1DmHfsSuUlG4EVBUOAEq45wYoeJwk1b/B4fQYumv+P3qDlO7nfBNiXjlm
         2l5d4+WbNI7bThE51IOa1EqN7gf2tkwPQcPDXPdZQ3ZB4EFwoPoI+tjn4hnIa2MxzR1P
         DPLfVWSUY8ycmRKUFmORbdX92mQkuVmz0aPF5qlQ/miUH/7MUEYEYMOPpATih5e9fE9f
         U6VxM3+ylPORarJZKSjcgPHkSbPAuxGOHTPkvfUawQxilmrNYOsVADtarpIjrbKs0ySo
         MchCfb4o/0GFn6PXbCa68ZwG1qk/Ox4R0Y0mbXlYOTTkM/+WzAOrUsa6gUgjzO4pW49V
         W3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771986935; x=1772591735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=Uprxt91/jbh8zwWbGcLI7XyyxpLMh0EohzQpVxZiquyiBLZzx0a7D4NJCPwyRHRav0
         dyE2WZoIj4x1fjTyjB/bWRZ2rnHJcYoGN4w+grDguJ/kaBJkdsSOztkHM9YZJyvhCpW8
         qgPA7AcGOinh9eSlyjObVQHwTD3U66P9t/AnrrgMULbwLFD8LPdx+EYul8RnW+irBt4o
         14nuYNTz6rIxJ7WsWzTG0dbPQzzH6r5976GI1IrJXcQ3EiaGn6zrhWAOggJOlstgdizN
         Dkec2VcFp+Ejhi8LpnAkx6naoPnVkHCc94ICWTcwFEI86ChbWZGR3K5/yBsxOqoxoldi
         jTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW3a/qvapwSFezjU0Zra6UtDNIPYsvYiT9NctBw3eJROLXwihpfivfWX/CM7wJlOUqe8aZ0X8F8iNGNQhS0k9Lt1/wIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YymF53qk94o2HGzdvsJiFG0k9FmxQJ2ErRi/eXt6QIGSrPQLVkr
	+3VPOzcNSJlP6TsoSvoDq7Bxi5rz8EeR9dSQLMm+8k/7rCumHwaWrepJ
X-Gm-Gg: ATEYQzzqlk9w6GuXQDqYrERe9jskjYb873KlRDY2wo7Q7rUjTCXxg2JUrcCXYKyk/b6
	qXh6OrzI5SzmmjAF7ssLjHfhCV8RkAA/HCo/qd4wVCl8Q9wOmRx0hR0Cunysj5pabnAcjRhxWWo
	5JGgMx6TeLiUm/rL6PKrUpBDVWLC3+UduDZ8C7M6tae/XUjxkW4uo/Hgcm4mxkUARRJN7PZE/su
	XeeeulIaaMM3+w0A98dsW2IDfdsrV/fGj1t51ulxG9UV4ECVbiMZMy/VNuAn3QP/V5x/ArCsDjr
	AJ8XlEKUPafwF31mBUcUI7OTsHEQ3wXazayaoTO/DDkU85KUh/mkOeq5PKfDGR5gm/1Kyizq7h2
	LYLjacqy2dFnJvdvA/T9MAeEbysFyypx7fcqKInCiVnbciD9u5o7tdDDQyaHZzWTT0jiU1/xdjU
	Dk8avXKvMfstWPUNM7KQJtTSuV7OhIzhJOjN/n3QU9faAA1wsUfQbMtwht7ty2MBP590DeTngJA
	BpWGjSE4hzDJxVBOIyXxH9uIETORoEZk5FY98Ku9k6V+CCIW8LrUTzPRwtk8BBJww==
X-Received: by 2002:a05:6214:e4e:b0:87c:2c0d:309e with SMTP id 6a1803df08f44-899b8c1ee0bmr10279896d6.37.1771986935317;
        Tue, 24 Feb 2026 18:35:35 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e62f453sm112363586d6.36.2026.02.24.18.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 18:35:34 -0800 (PST)
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Subject: [PATCH net-next v10 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Tue, 24 Feb 2026 21:34:07 -0500
Message-ID: <d2fd583ab20f2c8fb9ed91bd4ef1afb1d75a8797.1771986861.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1771986861.git.lucien.xin@gmail.com>
References: <cover.1771986861.git.lucien.xin@gmail.com>
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

