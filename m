Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9E1F934
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 May 2023 19:34:50 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f3b03358e9so50822e87.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 May 2023 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1684870488; x=1687462488;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=liasAi82MxSI1BPD9ZRrVZWVOrK6lRN3F501C2myhTc=;
        b=SzQ9lxya80RclHLhgMAWQnvLWir7+2V0Ee7375CJhydT/WkArvWwJSUTGVpT3pXecr
         U3nT4U1PZT09xmeC2dXux15MppqJirhXc/9dlzM/5Sn5YYP+NWYeYzrdU3tX3Vhjzwik
         xO7zp9D21Q2PAVvUSOVpIXwjVMXGxM/QpK7W55OHyC1a+yJVIyiH1X6EbShX4PZWDWRu
         tZvh5Bh38GIGKWdRvpxVUd+4ruqkPsASUsCj04zBMjU2M559l8TJZqqSidfRjDkOov+a
         End1VT2LlyAUGmEv7o+cdbmY2+34TU1CWDqBgx+1PaYHfFcXxxfDnmvle/CnV7iF6tjy
         5P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684870488; x=1687462488;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liasAi82MxSI1BPD9ZRrVZWVOrK6lRN3F501C2myhTc=;
        b=ZczqDWsMdmww/5A6MlIe+0RNiR6Xx41y+01Bh/d4o0JS53gGV38Ssual+Zre6Tu5zi
         fqp3bN8So8emyn+8aPVoy9BKLWhPoW1DhuLL4kyhmjxIp+wyM4adrmhTZCD5L2JbM9S7
         0T04jm8OXxxOrqw7cwdnJyqRmUhT+JMXzGEBkNFAY2w4gQlM+V1lmEWDhjcLbksoyeFb
         dI1IhOypV2+MjLfeIam2R7MO8mK+wog3rrfeTT3p4hFB0lDzRVqdXOqOd/pc27y1jovs
         UEXdNUKGsTg2utfIC3vpAAddkajoakoN6EEq2Z6Ju1n9+Ld/N5uY10woDy/pr+s9jhPe
         xsxw==
X-Gm-Message-State: AC+VfDwLH0hAd5kl3AVvRumOpDG1LKtHsdUBZnwe8aWnT6bLH/bWrqlG
	/rsdAThvLppNMpO2R7Moxza8CLY22oBaEgKf58E=
X-Google-Smtp-Source: ACHHUZ5PI+GjkCWaik9rUuQ2mlnvBAkRkRVZq4y6cbmECPjH0fA8cIe3D4iLQ9Kf/zZHyXFuFrVreI7zFv76GU/LXvM=
X-Received: by 2002:a05:651c:2ce:b0:2a8:cfa9:a2b7 with SMTP id
 f14-20020a05651c02ce00b002a8cfa9a2b7mr4841015ljo.1.1684870487552; Tue, 23 May
 2023 12:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 23 May 2023 15:34:36 -0400
Message-ID: <CAN-5tyE=czkdkXcG=X7T=6R=DrB-6wfqFSh4AFWRJEYAZVJaYA@mail.gmail.com>
Subject: handshake_nl_done_doit oops
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chuck,

I'm not exactly sure how I hit this but I'm sure I can't reproduce.
But going backwards. I had the latest kernel built. I did a mount
which failed. Then I updated ktls-utils and then, once built, started
tlshd and that produced this stack. I tried various things that I
thought might trigger it without success.

Again I dont know how relevant this problem is since I'm not sure what
actions led to it.

[ 1371.937602] watchdog: BUG: soft lockup - CPU#0 stuck for 1088s! [tlshd:3211]

[ 1371.938083] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
dns_resolver nfs lockd grace fscache netfs isofs nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink qrtr
vsock_loopback vmw_vsock_virtio_transport_common
vmw_vsock_vmci_transport vsock sunrpc vfat fat vmw_vmci xfs libcrc32c
nvme crct10dif_ce vmwgfx ghash_ce e1000e nvme_core sr_mod sha2_ce
sha256_arm64 sha1_ce drm_ttm_helper ttm drm_kms_helper cdrom
syscopyarea sg sysfillrect sysimgblt drm fuse

[ 1371.940520] CPU: 0 PID: 3211 Comm: tlshd Kdump: loaded Tainted: G
          L     6.3.0+ #3
[ 1371.940921] Hardware name: VMware, Inc. VMware20,1/VBSA, BIOS
VMW201.00V.20648489.BA64.2210180829 10/18/2022
[ 1371.941354] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[ 1371.941661] pc : fget+0x7c/0x188
[ 1371.941821] lr : fget+0x6c/0x188
[ 1371.941964] sp : ffff80000e1e70e0
[ 1371.942110] x29: ffff80000e1e70e0 x28: 0000000000000003 x27: 0000000000000002
[ 1371.942420] x26: ffff00008b94ee50 x25: ffff00008b94ee20 x24: 0000000000000006
[ 1371.942732] x23: ffff00008b94eda0 x22: ffff00008b94ed80 x21: 0000000000000006
[ 1371.943048] x20: ffff00008b94eda8 x19: ffffffffffffffff x18: 0000000000000000
[ 1371.943364] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000021b74690
[ 1371.943676] x14: 0000000000000000 x13: 0000000000000001 x12: ffff600012a024f8
[ 1371.943991] x11: 1fffe00012a024f7 x10: ffff600012a024f7 x9 : dfff800000000000
[ 1371.944307] x8 : ffff0000950127bf x7 : 00009fffed5fdb09 x6 : 0000000000000001
[ 1371.944633] x5 : ffff0000950127b8 x4 : ffff600012a024f8 x3 : dfff800000000000
[ 1371.944972] x2 : 0000000000000007 x1 : ffff00008b94edb0 x0 : 0000000000000000
[ 1371.945293] Call trace:
[ 1371.945417]  fget+0x7c/0x188
[ 1371.945553]  sockfd_lookup+0x1c/0xa8
[ 1371.945721]  handshake_nl_done_doit+0xd4/0x3c0
[ 1371.945916]  genl_family_rcv_msg_doit.isra.0+0x144/0x1d0
[ 1371.946147]  genl_family_rcv_msg+0x284/0x2f8
[ 1371.946329]  genl_rcv_msg+0x74/0xe0
[ 1371.946479]  netlink_rcv_skb+0xd4/0x220
[ 1371.946647]  genl_rcv+0x3c/0x58
[ 1371.946784]  netlink_unicast+0x44c/0x4d0
[ 1371.946951]  netlink_sendmsg+0x32c/0x630
[ 1371.947120]  sock_sendmsg+0x90/0xf0
[ 1371.947270]  ____sys_sendmsg+0x2e8/0x3f0
[ 1371.947436]  ___sys_sendmsg+0xf0/0x158
[ 1371.947600]  __sys_sendmsg+0xb4/0x128
[ 1371.947762]  __arm64_sys_sendmsg+0x4c/0x68
[ 1371.947934]  invoke_syscall.constprop.0+0xac/0x138
[ 1371.948137]  el0_svc_common.constprop.0+0x198/0x1b8
[ 1371.948344]  do_el0_svc+0x3c/0x68
[ 1371.948486]  el0_svc+0x30/0xc8
[ 1371.948618]  el0t_64_sync_handler+0xb4/0x130
[ 1371.948799]  el0t_64_sync+0x17c/0x180
