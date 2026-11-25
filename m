Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620926;
	b=bosbBmxmSUOS9fS/C9SB9IAfxVX+Dllxf6a3pnhfElsIZUn9wx5FomLfhgL+cXYMLAIV
	 Yi8BvoDWNoklljgXbht6QL9AZ1q27KX1sx8uOXch3CqAe3mWW2R/r9+5U7ngwskIR8rkG
	 R3yGgOKVEOMA5Fb3DtbpdEcUB7o+4LgCOZUBHgLr80Z5YuRKCu2/11aqg86hTHVrplovo
	 Bfv9MvD2OdlVHQlDyzsfgyRvYK4f87i0OM/movi3+GCe7FXSAI7gQrbRQEyHE+acT4Eyt
	 g323NB0LP7qkvcHtPMOEGMCGQNop7bf3D2Fwo3biHGCkz83BCRIc87D3BCbD9asRDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
	b=MsPkVISJad/w4s3hGbbZ/XIt38kH13kBB8NhipH9agyp11vwyD5mC2nyRwva+IEgVv0G
	 hU7lTuYQUu2Nq2Ne6qBCMdBkVU2+Go0V7zHZY2ll0CzovY88SX7fYeuBHF4DLEobJr/LP
	 +rwoQExIqnIsAFxNzJCSbuy7Y31G+Kgxyk7lV4LGJZ42JQa/HSHYJ1+9fb2vdQj3x3xpi
	 GISRNwetNendnc1P4SGyM8xYtgKZZjX3zQRLb0jyafZji/aBcc6jFbLlS/tkwXhQFOfQQ
	 RPZDbn5yArki0LaPFMwFAjasDVaonsRXsJltBM7+VdDcurNE6ob7dRgm5lU+4l8QS/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=urzxxUUm;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98CD606A33B
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98CD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=urzxxUUm
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so56591835e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620923; x=1796225723; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=urzxxUUm8T9VqkCGDGDjNc8uHokYZXKa0sO69Tcxr9tRv3bEqUisgTzdRubsk5Vt/2
         x1JSQ+5DMbKsadeOWMObDVodNPsOnndyre7Tsiqj/26yqxzCSGnqGtKJZEvPAQrRlzNy
         Uid5ex2dhTB6LL6m3bucmK3E6KOAaYoo6mMJJr+i9jnkK7WkTY5/1gFvlyTzAsSLvnO7
         Kyt/ShDtvFCZJEnQYG0CsOZqoqBXfQQO+ZhlyEzxEdKvECqJd+vRJ1Xdu/9rgl/F7EkB
         EWJ1BAv+2ezQ7IRPzEc2oYPTlunMSide+8/yIg6yKcC2ixQ4Nxf/b0eFC1WS+Xm/+UU0
         Vhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620923; x=1796225723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=GsqlAmYlY7fra/GbrDELT4V0qJvjT8KdM3yN93fHZrsMXBMAE1MdPZ2mv+X4mPpG4t
         IrOJy1b+bqkrq0X2VqwPE+InVxvMJun8xhb2wz/3WEnRyei2Q9zP1Y0BnHOhkgLo7tyH
         cIzEDWmbS66X7FtWz7YWpu4ROt+7/MbDHxEDi8P/XDlq+UsQGgsRFOLpZUOIllP9FcTD
         /VbroopMvXT8rC08A0oJTh06uIOkQ+sZpRh2hPkDmqOtvQeWvK/RtBxRX/J63HUVaanL
         wY9LGVHS1Tza5W4TevV6Ei3H9gVVABChhyynQQJfVpMRA/E6EQFdqyw9Kvh+fD7eHYvU
         LVqQ==
X-Forwarded-Encrypted: i=1; AL+hErE0rlPJ9OBTlbH1mlwOE0wy7WkTJo0JDJUzwARU+cIGCZTr3togBtc6GwH/xDPlU5U7r4X8i9JR08xv1BuaUO6AYTtuYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z85aELuDlJO7YSVvXMs2GGniPHqbsuPp0EZaPOZPBB4MRP6j+Mn
	e4mg2+K5Ok3daN4rlWwPOXkyI2jyEAieuMbd7NehfDCYbzKO1iz0lulk88DGEeKfLrc=
X-Gm-Gg: AZFdTZcPfBjranVYutbIlxG2vQPUOzzJhzFkCQxJrabH2pTPWce4Y1ZeAgIOaUG/bZz
	rNhn+lavW3mrASoZ23iyUA7fIfzEhvPZuyHd6AnUslJZJkndv8sgO/x/GbPC7p4qkV8epSZyK9r
	BN6EXsEIh0MxGZXpS/RAHWa+VyIyhMNEN//UQtDaWwHsXiFPSB0I3u30zIrOOpNc3kRIzDETVz5
	YtPXqBbwk1DsLgAs7Xy9SWqddl0g+mlzHLVyJtYR5u3sDIPHJ6Ao5ML89XOTw4t6JN3x6+G+3QB
	hz9gOJojxbsopTrFyNDD0tx3XOebEDEjgjpCjN+wju8eNwejvLOFH4mtQuc3u8HbTBZ2x6yFYMN
	VFMXw1CY/Q0F1enE3mwPXWlW1wkTLEe5QrtiuEkj59qf9D8J13Cz+znAcaYk9+283B0yAYn7LLk
	ju8cyMJhW+dSOhCj0UyN7UEJW8Ou6vJNhh7zR8eUhOP7M06VrG48Y6TEwH8kmBHS+FFqezWweQ3
	3E75TxZsqKBh4NzWAlkLoDy0ykKA7BH9bvXlnG9ZoMaumYrAxSjZpXnCi1hWq+kidjk/edv9sS7
	am8kHBtwZzcOOlnouRyc5DgUoc22ZuhedtlbLooUWiDKFl3881AS++PT4kPvtRtK16tnG/n8xH9
	3PagAXSh1ou4kVSduVNA=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr364067455e9.10.1795620922993;
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH v4 06/21] net/handshake: allow the DRBD TCP transport to enable NET_HANDSHAKE
Date: Wed, 25 Nov 2026 16:34:56 +0100
Message-ID: <20261125153511.3060599-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NET_HANDSHAKE is available only to the subsystems it lists: the SUNRPC
client and the NVMe/TCP host and target. The DRBD TCP transport uses
the handshake API for TLS-encrypted replication in the same way as
NVMe/TCP: its BLK_DEV_DRBD_TCP_TLS option selects NET_HANDSHAKE.

Add BLK_DEV_DRBD_TCP to the list, as NVME_TCP is there for
NVME_TCP_TLS. Otherwise that select would enable NET_HANDSHAKE with
an unmet dependency.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/Kconfig b/net/Kconfig
index 76ab44aa439a..db53f7474b7f 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -92,7 +92,7 @@ source "net/xdp/Kconfig"
 
 config NET_HANDSHAKE
 	bool
-	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP
+	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP || BLK_DEV_DRBD_TCP
 	default y
 
 config NET_HANDSHAKE_KUNIT_TEST
-- 
2.56.0

