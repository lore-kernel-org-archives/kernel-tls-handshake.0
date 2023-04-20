Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AA8F44
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Apr 2023 17:42:00 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Q2Q2S4q2rz4xrr0
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Apr 2023 19:41:52 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by laurent.telenet-ops.be with bizsmtp
	id n5hl290011C8whw015hlzL; Thu, 20 Apr 2023 19:41:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ppYCp-00HJNO-Ep;
	Thu, 20 Apr 2023 19:37:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ppYDj-00Fpe1-JL;
	Thu, 20 Apr 2023 19:37:23 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Chuck Lever <chuck.lever@oracle.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net/handshake: Fix section mismatch in handshake_exit
Date: Thu, 20 Apr 2023 19:37:23 +0200
Message-Id: <20230420173723.3773434-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_NET_NS=n (e.g. m68k/defconfig):

    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_exit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    ERROR: modpost: Section mismatches detected.

Fix this by dropping the __net_initdata tag from handshake_genl_net_ops.

Fixes: 3b3009ea8abb713b ("net/handshake: Create a NETLINK service for handling handshake requests")
Reported-by: noreply@ellerman.id.au
Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/14912987
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 net/handshake/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 8ea0ff993f9fba50..35c9c445e0b850d8 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -249,7 +249,7 @@ static void __net_exit handshake_net_exit(struct net *net)
 	}
 }
 
-static struct pernet_operations __net_initdata handshake_genl_net_ops = {
+static struct pernet_operations handshake_genl_net_ops = {
 	.init		= handshake_net_init,
 	.exit		= handshake_net_exit,
 	.id		= &handshake_net_id,
-- 
2.34.1

