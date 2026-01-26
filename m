Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FB336EE9
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Jan 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445756; cv=none; b=Z0cSQrGLVkAvpFLe6rUxl7vdFrcev5yboi1cHQiHVoZ/rHP6nQctMWMcnhikjf2Bxv3mmvsR70ibdF0a8s764C3Lc0cTZwDc0/ELmyRkcJWyCtrizdSAgF8DDFD+vNF5X9gsUq0KjATZx4ALaZ4gzI3cfWYsgNyNN9l5+8vp4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445756; c=relaxed/simple;
	bh=PK/1mFe+Y1PCntQKmtDgrO6kth6CSTZVeYWwFACDvgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa8QdZn6YayoB/Z2sNdSOs6r22HO3/l9RRJZkYZ7DNKa1TUpBZqxQqw61AMfDt0rMD9bOm0OGLCijV2FDumZjuVAJ6I5JivN9eTaPUeZDxmqFWoN4urRiNeB7oj60zlGGpMi5l5TaNN/mvpOuRIPB66lrPL2holcCN7U5PgpVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg1vOcrR; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg1vOcrR"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5018ec2ae21so53229431cf.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Jan 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769445753; x=1770050553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgw1aJ9gX/qBqI/fuJ5Hy9mEiYX5ZnOH7fScCTT4iY4=;
        b=dg1vOcrRS8miE3qhb2XfQYB+McPwQEHaoI34Ua90DeKKEo+wG0kPmGwEM6cnv0npVk
         wgFSIO2fwq97eL0zK1CJtmYnMU6tO17+sQc+cmKROyYu2Vj+ps7bKee1Q9ghLxkNevzx
         ppwF0JVeZuPLkwgETCbLD2pVAysafMHm4T0MhpLDqnoT2DCCQQBTm3seb0R1sPKF+QMk
         4AGGnZIueB2K00Edi3QkF9DIdE2Is4T/iU9eQ9BEaMiebuqF3KSnex2oEOh3sUU03aB0
         Ts829bmf88Sq0AJWjAAhmv0kNGpoDv16Z5BrHv/hy64j0GpbCjgszppCyfrdJ1SfobGa
         O3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445753; x=1770050553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgw1aJ9gX/qBqI/fuJ5Hy9mEiYX5ZnOH7fScCTT4iY4=;
        b=wmcEDYGR1LacrrDbgex8I1CTqsVYSmCjOs+nNLTv6QEu89gzlNOKweaNj3f8lqqnxW
         LoJw7Zyp9qCTxHqOM18dgdBcNgUpM7muzDfEp4cDhOW3uWUmMnfPAvMkIuDq1sHEvVvZ
         SQvzQLSCyA81znzbkUE5o7Jyil9Q5gQtGiNIR/UGnDceEe881DQ+Z5e3qrJQY5uSOT32
         k3Pko7Fozq/szjRJtsiT2/jun0oNHUwY9HVVnSxGuiEnITwx9DJYhzwi1SYqw1Q3LOGI
         Rwvf3Q9OsJG/Zp+UcSR6NEQOlFqJPGasWXL/Yc17Kkkg7MKlG5sP2OfAGscv+/bGgEpZ
         oTlA==
X-Forwarded-Encrypted: i=1; AJvYcCUQl4IBSdYxNkghuO74kKkpSQzSF4W9U1rld2k2SHfVd4WybITBbXANJXLkgGHy4d7Qfswafj6Ya8Qw+UweKxCZNpbRIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfklDD6td3DPGyx4G/Dla+NH4+adt8POBLj+PHcrXrXlRjbIgJ
	WRlsjtbTDzJQ2HxcDmftSIZZqshXvv+Y2YaFJ3DodH4LASWo/SkKi7xRBHmpDrQw
X-Gm-Gg: AZuq6aIvSikoNiOui4bMdgFWlgS7iHBcI8UPrRZ3l00/GXvCJO0YPPIl5SD8aksmF/w
	JCir9i8lBQhl3dZrnCH0itwvHiIwqWXhQnNc4nfo/rLVqdOv1Ib0w54XrPY9Ba61+V6NJUr6TpW
	MKlC+d9XO1iLS1PuVIP0V1rE6LAnkjEEPBSqlKF+SZmD04cyBTLQcbYyVynnD1Do7Kz6hV98MDV
	sQkIDMjgGEYs1UR/QAHegcXY+d78ewFHCN3wI/mkTlVgdeav0lEd1JZTRqwJ86Sk00WoNcJtQ9I
	bxIizVMNK/1AK3lRzunXLHrNvK8MSMuYDBdf4k8jlsafNcICPdtWzzfOHnWwRd0i2Bdy1FLoc7I
	hzpqP8vkOAIVO7oI1uaNGpIZmLdA00hiDz+G79mSa6FFyRlYFL/gvBmmmp0kG3WZDJKQyAZb0n7
	B56z3sJNDx1548jB1R5GGgq3Z6zEgjZbBrSq3uFXq3nAmEmDjIBZVO74fn35Bilw==
X-Received: by 2002:a05:620a:1906:b0:8c5:33bf:5250 with SMTP id af79cd13be357-8c6f96545b0mr521710985a.66.1769439182645;
        Mon, 26 Jan 2026 06:53:02 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d2422sm1018611585a.18.2026.01.26.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:53:02 -0800 (PST)
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
Subject: [PATCH net-next v8 04/15] quic: provide family ops for address and protocol
Date: Mon, 26 Jan 2026 09:51:02 -0500
Message-ID: <a6b82009a6135edecc3f5b10b9538fcd860df5eb.1769439073.git.lucien.xin@gmail.com>
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

Introduce QUIC address and protocol family operations to handle IPv4/IPv6
specifics consistently, similar to SCTP. The new quic_family.{c,h} provide
helpers for routing, skb transmit handling, address parsing and comparison
and UDP socket config initializing etc.

This consolidates protocol-family logic and enables cleaner dual-stack
support in the QUIC socket implementation.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
v2:
  - Add more checks for addrs in .get_user_addr() and .get_pref_addr().
  - Consider sk_bound_dev_if in .udp_conf_init() and .flow_route() to
    support vrf.
v3:
  - Remove quic_addr_family/proto_ops abstraction; use if statements to
    reduce indirect call overhead (suggested by Paolo).
  - quic_v6_set_sk_addr(): add quic_v6_copy_sk_addr() helper to avoid
    duplicate code (noted by Paolo).
  - quic_v4_flow_route(): use flowi4_dscp per latest net-next changes.
v4:
  - Remove unnecessary _fl variable from flow_route() functions (noted
    by Paolo).
  - Fix coding style of ?: operator (noted by Paolo).
v5:
  - Remove several unused functions from this patch series (suggested by Paolo):
    * quic_seq_dump_addr()
    * quic_get_msg_ecn()
    * quic_get_user_addr()
    * quic_get_pref_addr()
    * quic_set_pref_addr()
    * quic_set_sk_addr()
    * quic_set_sk_ecn()
  - Replace the sa->v4/v6.sin_family checks with quic_v4/v6_is_any_addr()
    in quic_v4/v6_flow_route() (suggested by Paolo).
  - Introduce quic_v4_match_v6_addr() to simplify family-mismatch checks
    between sk and addr in quic_v6_cmp_sk_addr() (notied by Paolo).
v6:
  - Use udp_hdr(skb) to access UDP header in quic_v4/6_get_msg_addrs(), as
    transport_header is no longer reset for QUIC.
---
 net/quic/Makefile   |   2 +-
 net/quic/family.c   | 372 ++++++++++++++++++++++++++++++++++++++++++++
 net/quic/family.h   |  33 ++++
 net/quic/protocol.c |   2 +-
 net/quic/socket.c   |   4 +-
 net/quic/socket.h   |   1 +
 6 files changed, 410 insertions(+), 4 deletions(-)
 create mode 100644 net/quic/family.c
 create mode 100644 net/quic/family.h

diff --git a/net/quic/Makefile b/net/quic/Makefile
index e0067272de7d..13bf4a4e5442 100644
--- a/net/quic/Makefile
+++ b/net/quic/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_IP_QUIC) += quic.o
 
-quic-y := common.o protocol.o socket.o
+quic-y := common.o family.o protocol.o socket.o
diff --git a/net/quic/family.c b/net/quic/family.c
new file mode 100644
index 000000000000..5914fc3c3e49
--- /dev/null
+++ b/net/quic/family.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* QUIC kernel implementation
+ * (C) Copyright Red Hat Corp. 2023
+ *
+ * This file is part of the QUIC kernel implementation
+ *
+ * Initialization/cleanup for QUIC protocol support.
+ *
+ * Written or modified by:
+ *    Xin Long <lucien.xin@gmail.com>
+ */
+
+#include <net/inet_common.h>
+#include <net/udp_tunnel.h>
+#include <linux/icmp.h>
+
+#include "common.h"
+#include "family.h"
+
+static int quic_v4_is_any_addr(union quic_addr *addr)
+{
+	return addr->v4.sin_addr.s_addr == htonl(INADDR_ANY);
+}
+
+static int quic_v6_is_any_addr(union quic_addr *addr)
+{
+	return ipv6_addr_any(&addr->v6.sin6_addr);
+}
+
+static void quic_v4_udp_conf_init(struct sock *sk, struct udp_port_cfg *conf, union quic_addr *a)
+{
+	conf->family = AF_INET;
+	conf->local_ip.s_addr = a->v4.sin_addr.s_addr;
+	conf->local_udp_port = a->v4.sin_port;
+	conf->use_udp6_rx_checksums = true;
+	conf->bind_ifindex = sk->sk_bound_dev_if;
+}
+
+static void quic_v6_udp_conf_init(struct sock *sk, struct udp_port_cfg *conf, union quic_addr *a)
+{
+	conf->family = AF_INET6;
+	conf->local_ip6 = a->v6.sin6_addr;
+	conf->local_udp_port = a->v6.sin6_port;
+	conf->use_udp6_rx_checksums = true;
+	conf->ipv6_v6only = ipv6_only_sock(sk);
+	conf->bind_ifindex = sk->sk_bound_dev_if;
+}
+
+static int quic_v4_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa,
+			      struct flowi *fl)
+{
+	struct flowi4 *fl4;
+	struct rtable *rt;
+
+	if (__sk_dst_check(sk, 0))
+		return 1;
+
+	memset(fl, 0x00, sizeof(*fl));
+	fl4 = &fl->u.ip4;
+	fl4->saddr = sa->v4.sin_addr.s_addr;
+	fl4->fl4_sport = sa->v4.sin_port;
+	fl4->daddr = da->v4.sin_addr.s_addr;
+	fl4->fl4_dport = da->v4.sin_port;
+	fl4->flowi4_proto = IPPROTO_UDP;
+	fl4->flowi4_oif = sk->sk_bound_dev_if;
+
+	fl4->flowi4_scope = ip_sock_rt_scope(sk);
+	fl4->flowi4_dscp = inet_sk_dscp(inet_sk(sk));
+
+	rt = ip_route_output_key(sock_net(sk), fl4);
+	if (IS_ERR(rt))
+		return PTR_ERR(rt);
+
+	if (quic_v4_is_any_addr(sa)) {
+		sa->v4.sin_family = AF_INET;
+		sa->v4.sin_addr.s_addr = fl4->saddr;
+	}
+	sk_setup_caps(sk, &rt->dst);
+	return 0;
+}
+
+static int quic_v6_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa,
+			      struct flowi *fl)
+{
+	struct ipv6_pinfo *np = inet6_sk(sk);
+	struct ip6_flowlabel *flowlabel;
+	struct dst_entry *dst;
+	struct flowi6 *fl6;
+
+	if (__sk_dst_check(sk, np->dst_cookie))
+		return 1;
+
+	memset(fl, 0x00, sizeof(*fl));
+	fl6 = &fl->u.ip6;
+	fl6->saddr = sa->v6.sin6_addr;
+	fl6->fl6_sport = sa->v6.sin6_port;
+	fl6->daddr = da->v6.sin6_addr;
+	fl6->fl6_dport = da->v6.sin6_port;
+	fl6->flowi6_proto = IPPROTO_UDP;
+	fl6->flowi6_oif = sk->sk_bound_dev_if;
+
+	if (inet6_test_bit(SNDFLOW, sk)) {
+		fl6->flowlabel = (da->v6.sin6_flowinfo & IPV6_FLOWINFO_MASK);
+		if (fl6->flowlabel & IPV6_FLOWLABEL_MASK) {
+			flowlabel = fl6_sock_lookup(sk, fl6->flowlabel);
+			if (IS_ERR(flowlabel))
+				return -EINVAL;
+			fl6_sock_release(flowlabel);
+		}
+	}
+
+	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+
+	if (quic_v6_is_any_addr(sa)) {
+		sa->v6.sin6_family = AF_INET6;
+		sa->v6.sin6_addr = fl6->saddr;
+	}
+	ip6_dst_store(sk, dst, NULL, NULL);
+	return 0;
+}
+
+static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb, struct flowi *fl)
+{
+	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
+	u8 tos = (inet_sk(sk)->tos | cb->ecn), ttl;
+	struct flowi4 *fl4 = &fl->u.ip4;
+	struct dst_entry *dst;
+	__be16 df = 0;
+
+	pr_debug("%s: skb: %p, len: %d, num: %llu, %pI4:%d -> %pI4:%d\n", __func__,
+		 skb, skb->len, cb->number, &fl4->saddr, ntohs(fl4->fl4_sport),
+		 &fl4->daddr, ntohs(fl4->fl4_dport));
+
+	dst = sk_dst_get(sk);
+	if (!dst) {
+		kfree_skb(skb);
+		return;
+	}
+	if (ip_dont_fragment(sk, dst) && !skb->ignore_df)
+		df = htons(IP_DF);
+
+	ttl = (u8)ip4_dst_hoplimit(dst);
+	udp_tunnel_xmit_skb((struct rtable *)dst, sk, skb, fl4->saddr, fl4->daddr,
+			    tos, ttl, df, fl4->fl4_sport, fl4->fl4_dport, false, false, 0);
+}
+
+static void quic_v6_lower_xmit(struct sock *sk, struct sk_buff *skb, struct flowi *fl)
+{
+	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
+	u8 tc = (inet6_sk(sk)->tclass | cb->ecn), ttl;
+	struct flowi6 *fl6 = &fl->u.ip6;
+	struct dst_entry *dst;
+	__be32 label;
+
+	pr_debug("%s: skb: %p, len: %d, num: %llu, %pI6c:%d -> %pI6c:%d\n", __func__,
+		 skb, skb->len, cb->number, &fl6->saddr, ntohs(fl6->fl6_sport),
+		 &fl6->daddr, ntohs(fl6->fl6_dport));
+
+	dst = sk_dst_get(sk);
+	if (!dst) {
+		kfree_skb(skb);
+		return;
+	}
+
+	ttl = (u8)ip6_dst_hoplimit(dst);
+	label = ip6_make_flowlabel(sock_net(sk), skb, fl6->flowlabel, true, fl6);
+	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, &fl6->saddr, &fl6->daddr, tc,
+			     ttl, label, fl6->fl6_sport, fl6->fl6_dport, false, 0);
+}
+
+static void quic_v4_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
+{
+	struct udphdr *uh = udp_hdr(skb);
+
+	sa->v4.sin_family = AF_INET;
+	sa->v4.sin_port = uh->source;
+	sa->v4.sin_addr.s_addr = ip_hdr(skb)->saddr;
+
+	da->v4.sin_family = AF_INET;
+	da->v4.sin_port = uh->dest;
+	da->v4.sin_addr.s_addr = ip_hdr(skb)->daddr;
+}
+
+static void quic_v6_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
+{
+	struct udphdr *uh = udp_hdr(skb);
+
+	sa->v6.sin6_family = AF_INET6;
+	sa->v6.sin6_port = uh->source;
+	sa->v6.sin6_addr = ipv6_hdr(skb)->saddr;
+
+	da->v6.sin6_family = AF_INET6;
+	da->v6.sin6_port = uh->dest;
+	da->v6.sin6_addr = ipv6_hdr(skb)->daddr;
+}
+
+static int quic_v4_get_mtu_info(struct sk_buff *skb, u32 *info)
+{
+	struct icmphdr *hdr;
+
+	hdr = (struct icmphdr *)(skb_network_header(skb) - sizeof(struct icmphdr));
+	if (hdr->type == ICMP_DEST_UNREACH && hdr->code == ICMP_FRAG_NEEDED) {
+		*info = ntohs(hdr->un.frag.mtu);
+		return 0;
+	}
+
+	/* Defer other types' processing to UDP error handler. */
+	return 1;
+}
+
+static int quic_v6_get_mtu_info(struct sk_buff *skb, u32 *info)
+{
+	struct icmp6hdr *hdr;
+
+	hdr = (struct icmp6hdr *)(skb_network_header(skb) - sizeof(struct icmp6hdr));
+	if (hdr->icmp6_type == ICMPV6_PKT_TOOBIG) {
+		*info = ntohl(hdr->icmp6_mtu);
+		return 0;
+	}
+
+	/* Defer other types' processing to UDP error handler. */
+	return 1;
+}
+
+static bool quic_v4_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr)
+{
+	if (a->v4.sin_port != addr->v4.sin_port)
+		return false;
+	if (a->v4.sin_family != addr->v4.sin_family)
+		return false;
+	if (a->v4.sin_addr.s_addr == htonl(INADDR_ANY) ||
+	    addr->v4.sin_addr.s_addr == htonl(INADDR_ANY))
+		return true;
+	return a->v4.sin_addr.s_addr == addr->v4.sin_addr.s_addr;
+}
+
+static bool quic_v4_match_v6_addr(union quic_addr *a4, union quic_addr *a6)
+{
+	if (ipv6_addr_any(&a6->v6.sin6_addr))
+		return true;
+	if (ipv6_addr_v4mapped(&a6->v6.sin6_addr) &&
+	    a6->v6.sin6_addr.s6_addr32[3] == a4->v4.sin_addr.s_addr)
+		return true;
+	return false;
+}
+
+static bool quic_v6_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr)
+{
+	if (a->v4.sin_port != addr->v4.sin_port)
+		return false;
+
+	if (a->sa.sa_family == AF_INET && addr->sa.sa_family == AF_INET) {
+		if (a->v4.sin_addr.s_addr == htonl(INADDR_ANY) ||
+		    addr->v4.sin_addr.s_addr == htonl(INADDR_ANY))
+			return true;
+		return a->v4.sin_addr.s_addr == addr->v4.sin_addr.s_addr;
+	}
+
+	if (a->sa.sa_family != addr->sa.sa_family) {
+		if (ipv6_only_sock(sk))
+			return false;
+		if (a->sa.sa_family == AF_INET)
+			return quic_v4_match_v6_addr(a, addr);
+		return quic_v4_match_v6_addr(addr, a);
+	}
+
+	if (ipv6_addr_any(&a->v6.sin6_addr) || ipv6_addr_any(&addr->v6.sin6_addr))
+		return true;
+	return ipv6_addr_equal(&a->v6.sin6_addr, &addr->v6.sin6_addr);
+}
+
+static int quic_v4_get_sk_addr(struct socket *sock, struct sockaddr *uaddr, int peer)
+{
+	return inet_getname(sock, uaddr, peer);
+}
+
+static int quic_v6_get_sk_addr(struct socket *sock, struct sockaddr *uaddr, int peer)
+{
+	union quic_addr *a = quic_addr(uaddr);
+	int ret;
+
+	ret = inet6_getname(sock, uaddr, peer);
+	if (ret < 0)
+		return ret;
+
+	if (a->sa.sa_family == AF_INET6 && ipv6_addr_v4mapped(&a->v6.sin6_addr)) {
+		a->v4.sin_family = AF_INET;
+		a->v4.sin_port = a->v6.sin6_port;
+		a->v4.sin_addr.s_addr = a->v6.sin6_addr.s6_addr32[3];
+	}
+
+	if (a->sa.sa_family == AF_INET) {
+		memset(a->v4.sin_zero, 0, sizeof(a->v4.sin_zero));
+		return sizeof(struct sockaddr_in);
+	}
+	return sizeof(struct sockaddr_in6);
+}
+
+#define quic_af_ipv4(a)		((a)->sa.sa_family == AF_INET)
+
+u32 quic_encap_len(union quic_addr *a)
+{
+	return (quic_af_ipv4(a) ? sizeof(struct iphdr) : sizeof(struct ipv6hdr)) +
+	       sizeof(struct udphdr);
+}
+
+int quic_is_any_addr(union quic_addr *a)
+{
+	return quic_af_ipv4(a) ? quic_v4_is_any_addr(a) : quic_v6_is_any_addr(a);
+}
+
+void quic_udp_conf_init(struct sock *sk, struct udp_port_cfg *conf, union quic_addr *a)
+{
+	quic_af_ipv4(a) ? quic_v4_udp_conf_init(sk, conf, a) : quic_v6_udp_conf_init(sk, conf, a);
+}
+
+int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa, struct flowi *fl)
+{
+	return quic_af_ipv4(da) ? quic_v4_flow_route(sk, da, sa, fl) :
+				  quic_v6_flow_route(sk, da, sa, fl);
+}
+
+void quic_lower_xmit(struct sock *sk, struct sk_buff *skb, union quic_addr *da, struct flowi *fl)
+{
+	quic_af_ipv4(da) ? quic_v4_lower_xmit(sk, skb, fl) : quic_v6_lower_xmit(sk, skb, fl);
+}
+
+#define quic_skb_ipv4(skb)	(ip_hdr(skb)->version == 4)
+
+void quic_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
+{
+	memset(sa, 0, sizeof(*sa));
+	memset(da, 0, sizeof(*da));
+	quic_skb_ipv4(skb) ? quic_v4_get_msg_addrs(skb, da, sa) :
+			     quic_v6_get_msg_addrs(skb, da, sa);
+}
+
+int quic_get_mtu_info(struct sk_buff *skb, u32 *info)
+{
+	return quic_skb_ipv4(skb) ? quic_v4_get_mtu_info(skb, info) :
+				    quic_v6_get_mtu_info(skb, info);
+}
+
+#define quic_pf_ipv4(sk)	((sk)->sk_family == PF_INET)
+
+bool quic_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr)
+{
+	return quic_pf_ipv4(sk) ? quic_v4_cmp_sk_addr(sk, a, addr) :
+				  quic_v6_cmp_sk_addr(sk, a, addr);
+}
+
+int quic_get_sk_addr(struct socket *sock, struct sockaddr *a, bool peer)
+{
+	return quic_pf_ipv4(sock->sk) ? quic_v4_get_sk_addr(sock, a, peer) :
+					quic_v6_get_sk_addr(sock, a, peer);
+}
+
+int quic_common_setsockopt(struct sock *sk, int level, int optname, sockptr_t optval,
+			   unsigned int optlen)
+{
+	return quic_pf_ipv4(sk) ? ip_setsockopt(sk, level, optname, optval, optlen) :
+				  ipv6_setsockopt(sk, level, optname, optval, optlen);
+}
+
+int quic_common_getsockopt(struct sock *sk, int level, int optname, char __user *optval,
+			   int __user *optlen)
+{
+	return quic_pf_ipv4(sk) ? ip_getsockopt(sk, level, optname, optval, optlen) :
+				  ipv6_getsockopt(sk, level, optname, optval, optlen);
+}
diff --git a/net/quic/family.h b/net/quic/family.h
new file mode 100644
index 000000000000..624a5d7a8471
--- /dev/null
+++ b/net/quic/family.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* QUIC kernel implementation
+ * (C) Copyright Red Hat Corp. 2023
+ *
+ * This file is part of the QUIC kernel implementation
+ *
+ * Written or modified by:
+ *    Xin Long <lucien.xin@gmail.com>
+ */
+
+#define QUIC_PORT_LEN		2
+#define QUIC_ADDR4_LEN		4
+#define QUIC_ADDR6_LEN		16
+
+#define QUIC_PREF_ADDR_LEN	(QUIC_ADDR4_LEN + QUIC_PORT_LEN + QUIC_ADDR6_LEN + QUIC_PORT_LEN)
+
+int quic_is_any_addr(union quic_addr *a);
+u32 quic_encap_len(union quic_addr *a);
+
+void quic_lower_xmit(struct sock *sk, struct sk_buff *skb, union quic_addr *da, struct flowi *fl);
+int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa, struct flowi *fl);
+void quic_udp_conf_init(struct sock *sk, struct udp_port_cfg *conf, union quic_addr *a);
+
+void quic_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa);
+int quic_get_mtu_info(struct sk_buff *skb, u32 *info);
+
+bool quic_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr);
+int quic_get_sk_addr(struct socket *sock, struct sockaddr *a, bool peer);
+
+int quic_common_setsockopt(struct sock *sk, int level, int optname, sockptr_t optval,
+			   unsigned int optlen);
+int quic_common_getsockopt(struct sock *sk, int level, int optname, char __user *optval,
+			   int __user *optlen);
diff --git a/net/quic/protocol.c b/net/quic/protocol.c
index 439b22d4e0f1..68b5fc821537 100644
--- a/net/quic/protocol.c
+++ b/net/quic/protocol.c
@@ -46,7 +46,7 @@ static int quic_inet_listen(struct socket *sock, int backlog)
 
 static int quic_inet_getname(struct socket *sock, struct sockaddr *uaddr, int peer)
 {
-	return -EOPNOTSUPP;
+	return quic_get_sk_addr(sock, uaddr, peer);
 }
 
 static __poll_t quic_inet_poll(struct file *file, struct socket *sock, poll_table *wait)
diff --git a/net/quic/socket.c b/net/quic/socket.c
index 784b8aaadb25..a0eedf59545a 100644
--- a/net/quic/socket.c
+++ b/net/quic/socket.c
@@ -116,7 +116,7 @@ static int quic_setsockopt(struct sock *sk, int level, int optname,
 			   sockptr_t optval, unsigned int optlen)
 {
 	if (level != SOL_QUIC)
-		return -EOPNOTSUPP;
+		return quic_common_setsockopt(sk, level, optname, optval, optlen);
 
 	return quic_do_setsockopt(sk, optname, optval, optlen);
 }
@@ -130,7 +130,7 @@ static int quic_getsockopt(struct sock *sk, int level, int optname,
 			   char __user *optval, int __user *optlen)
 {
 	if (level != SOL_QUIC)
-		return -EOPNOTSUPP;
+		return quic_common_getsockopt(sk, level, optname, optval, optlen);
 
 	return quic_do_getsockopt(sk, optname, USER_SOCKPTR(optval), USER_SOCKPTR(optlen));
 }
diff --git a/net/quic/socket.h b/net/quic/socket.h
index 9a2f4b851676..0aa642e3b0ae 100644
--- a/net/quic/socket.h
+++ b/net/quic/socket.h
@@ -11,6 +11,7 @@
 #include <net/udp_tunnel.h>
 
 #include "common.h"
+#include "family.h"
 
 #include "protocol.h"
 
-- 
2.47.1

