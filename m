Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60316EB65
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Sep 2024 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725935513; cv=none; b=D5bgp+HSffzOOGIS3VdDveAXXokYzyTujK53FGor5XFQYz2ClzpvfQk9eEYcYiT8EMKpzz1kZvJ5s+PqzdJMmcv33txKihpyjHsOyFvmQrMMkKLdPw/5aIUy6ZtDymkBnwbZF0JEeanuJiaqNmUyvps4q+T4N9md7zd0bJ3yluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725935513; c=relaxed/simple;
	bh=whdQSjZneoPJNZAGMkzH4Ot3vxOcc8FUgllwm3sy+G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVd5dXqW4iOKjYlMxRZlYpGq7jqW25S/Yb9sJbwTz3Ngvc0vvu7ncA6j8IXw/U5up3y9z2U+Sf1EnO0FZ1y3y1pqjpe4ldWL0pZRkB5E4B7yNgl16epdiuffdoVhDqBK4jCq9nMOiAcw/Kvmsj2G2runHGT/OQyPc0j1o7177hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXkrMYaY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXkrMYaY"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9a3071c6bso233228485a.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 09 Sep 2024 19:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725935511; x=1726540311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCv8AVDIqwg8TKHkrL3M4Scd4I7xNNdeDOFxfgf/ie0=;
        b=PXkrMYaYbwZEzpey4HiH/SqAicfTX5fFjtYcNprXbKvsKcOtTLu1e5mQtSNfUuMU82
         8C9qlpm21Bzii+t1jrXtrh0L+l7DfRI3ac2OlPbqJPCTAjePau97w+gFXo9J9ILtj/Rr
         HWP8C0dPGjFnRgNvUkDg296erjfurMrGtntkLgJhNW6NW/7uELvK1S+VLK35jNL4dJIF
         unh41FAOLfcjGi3kBdiyW0W466P7K4wueQuiG9O5SchT/wMkcvnQpAKrkjppiLy5sf2+
         wCF6UuCMnDacRUZywv41pqp8XnEUty+B84nOW/Kfs8LA8F/Np1hu1E5+6qP8ZYMbCY3F
         TRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725935511; x=1726540311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCv8AVDIqwg8TKHkrL3M4Scd4I7xNNdeDOFxfgf/ie0=;
        b=FJ8GbvRNUECTS7GB7QG2S+HYlMqxf7uFlczHswHIbtMY1JW/xrhfkWV2Ah0pOZWvec
         vxorEg67HbOZEXfFAslTHz51A5gCG/CBQLWmlEqfQy7Bl8iHdMSCulh3IC6ojLOwmzs3
         0QVfj+8JWmn6+zyoGfAVU1PJqmmEPbPHUCqT2SVjS3uV2PBURei+ZlatXLzeYo6CdXmp
         ULnMxx4IAtQ9yOqbK/uTQqk6RCVA7QBWDn4Dz1iIh8lY+HMUL8vpvzgZz3QE8cDnRcxk
         WBKtUo//1h4GE5A4vokkG4zPpKkccjTy83tX6Xyxcfu6gkOhhZIl0ncSmnvbYMvcz32W
         m30g==
X-Forwarded-Encrypted: i=1; AJvYcCU+XXTjh7L6H7sQswjvGstbWPxTXBILQZSCIulO/+VzrN7ysjMOnbr8FIVFMoWfmxa0G9J5C8ZgmuxCIHD2umG5RuPGvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxySpzqvZFb+QyOovcoYMSlODYpoDD3kt1fUVzeGIUhNdKsPZ6k
	n6fk1ZFsP0Xuc+rbF13tst3bXjJamo0CwKqfw/mlu3LOJZYqAL+d
X-Google-Smtp-Source: AGHT+IGjoeZGZj/rB8b5OrvL0VAMQm0rGpQR+O3EGn/f30y8nqU0upAsIO4wxffd1KC9eQeL26LPIA==
X-Received: by 2002:a05:620a:4304:b0:79f:41b:aaa8 with SMTP id af79cd13be357-7a997340b37mr1549104485a.29.1725935511337;
        Mon, 09 Sep 2024 19:31:51 -0700 (PDT)
Received: from wsfd-netdev15.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a1f594sm270429885a.121.2024.09.09.19.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 19:31:51 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 4/5] net: integrate QUIC build configuration into Kconfig and Makefile
Date: Mon,  9 Sep 2024 22:30:19 -0400
Message-ID: <887eb7c776b63c613c6ac270442031be95de62f8.1725935420.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1725935420.git.lucien.xin@gmail.com>
References: <cover.1725935420.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces build configurations for QUIC within the networking
subsystem. The Kconfig and Makefile files in the net directory are updated
to include options and rules necessary for building QUIC protocol support.

To enable building the QUIC module, include the following configurations
in your .config file:

  CONFIG_IP_QUIC=m
  CONFIG_IP_QUIC_TEST=m

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Moritz Buhl <mbuhl@openbsd.org>
Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
---
 net/Kconfig  | 1 +
 net/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/net/Kconfig b/net/Kconfig
index d27d0deac0bf..3bbea4138c58 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -238,6 +238,7 @@ endif
 
 source "net/dccp/Kconfig"
 source "net/sctp/Kconfig"
+source "net/quic/Kconfig"
 source "net/rds/Kconfig"
 source "net/tipc/Kconfig"
 source "net/atm/Kconfig"
diff --git a/net/Makefile b/net/Makefile
index 65bb8c72a35e..0562e72482b9 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -44,6 +44,7 @@ obj-y				+= 8021q/
 endif
 obj-$(CONFIG_IP_DCCP)		+= dccp/
 obj-$(CONFIG_IP_SCTP)		+= sctp/
+obj-$(CONFIG_IP_QUIC)		+= quic/
 obj-$(CONFIG_RDS)		+= rds/
 obj-$(CONFIG_WIRELESS)		+= wireless/
 obj-$(CONFIG_MAC80211)		+= mac80211/
-- 
2.43.0

