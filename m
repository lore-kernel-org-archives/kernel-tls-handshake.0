Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040DD322B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 14:23:55 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id x37so13502359pga.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680272635;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++k0hPtVlrUdldvdpRLyjZMaVYM0t+97lpVXKzJJWSM=;
        b=UNqOS1g5KAIFKbry1B1VOLsSEg/GChIDtAxaGl6jlh0+m7/IuLs2x07kM6I8txR3yV
         NU0RKOHId4xm9KkRC0K8g3+z2BF2VHCJUrcDrf6mj2cirDi0Quee+wyyrqxw93Y6HP8k
         ej9mgVxZ0Ux654EGV+XvnJ8lm5+I6xdfjHZGZ8QZfIAgL3y2PgHPWMC23dAERAnZ45FH
         LeMXKY/pqnK/4M70i0LJleV5TtYXKXGo3bIHuKKN6ydMOCTrTwaVR0Ir96XAF98MNhE4
         8HbYNvkFflMk42PLS7KfPzZsK+bueKTes90WR6aB9VDINNkJl45rLwR0w4nf8CviVAig
         R8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++k0hPtVlrUdldvdpRLyjZMaVYM0t+97lpVXKzJJWSM=;
        b=gj66867T920Fg4fWaItC3v0AbFxxytR7Ua/a3+V2uNi5OfHW1sS0sOCryG5gMVXiP4
         33KVwZrTtBZv2JI7B+jaDueO0NmPhS0E8iFR/LWQJted6JenAr8My+IRceT5k3S9aP1h
         gOidxTOjd2efyEOAIBJbtWZmahadP7KjIykw3imUavIuYTJnjfv3VGc7hR5fCnJnp6ho
         rTqrmSRq+349bsiy6DJdgP6a18n+Kn6WZbnOTIN3AEnzj3xtR3jfVXBIX86fadplNfKx
         G2KL71SfKRoWEUx45iL8TLRwwzIX/Q7Gc7nbcGhJC0B77eBShcQgFD+exVQnSGBk0LZi
         vBOw==
X-Gm-Message-State: AAQBX9e3+SwaWF5RsLK0G3cjkP7kDpXx9L9Ht1jSuwRVghXwSMofRYBO
	B5PF9ClvIidykRJWHP8n1nmLPUpcl+J8aKQmjRw=
X-Google-Smtp-Source: AKy350ZeaB0iNdCPR2dNLtOA1LNyjboqljxEqkMs9o0w3gCoY3qnMbbDptXiixjSDhPHJHX38i/eDEymbD1UUK2VY74=
X-Received: by 2002:a63:1b61:0:b0:50c:2b1:7a8f with SMTP id
 b33-20020a631b61000000b0050c02b17a8fmr2950239pgm.6.1680272635152; Fri, 31 Mar
 2023 07:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 31 Mar 2023 10:23:44 -0400
Message-ID: <CAN-5tyGvk=yrdA3edJu3SeoQeACMzaeKQDetvVxPQSDN8XTd7w@mail.gmail.com>
Subject: kernel oops
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chuck,

Have you seen this oops? This is not my testing so all I know was that
it was an attempt to mount with xprtsec=tls (against ONTAP).

[  316.939747] BUG: kernel NULL pointer dereference, address: 0000000000000018
[  316.939848] #PF: supervisor read access in kernel mode
[  316.939914] #PF: error_code(0x0000) - not-present page
[  316.939984] PGD 0 P4D 0
[  316.940041] Oops: 0000 [#1] PREEMPT SMP PTI
[  316.940109] CPU: 0 PID: 511 Comm: kworker/u2:30 Kdump: loaded Not
tainted 6.2.1+ #2
[  316.940181] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/2020
[  316.940259] Workqueue: xprtiod xs_tls_connect [sunrpc]
[  316.940463] RIP: 0010:xs_tls_connect+0x3e1/0x590 [sunrpc]
[  316.940556] Code: ff ff ff 48 2b 83 f8 fe ff ff 48 89 83 00 ff ff
ff e8 03 d3 ff ff e9 a8 fd ff ff 49 8b 97 f8 05 00 00 66 83 bb e0 f9
ff ff 0a <48> 8b 6a 18 0f 84 fd 00 00 00 48 8d 72 18 4c 89 e7 48 89 14
24 e8
[  316.940719] RSP: 0018:ffffa69d40f5fdc8 EFLAGS: 00010293
[  316.940786] RAX: 0000000000000000 RBX: ffff9b0c46333e40 RCX: 0000000000000000
[  316.940872] RDX: 0000000000000000 RSI: ffffa69d40f5fd20 RDI: 0000000000000000
[  316.940940] RBP: ffff9b0c46350200 R08: ffff9b0cf7e31968 R09: 0000000000000159
[  316.941008] R10: 0000000000000001 R11: 00000049c8887a40 R12: ffff9b0c46333800
[  316.941075] R13: 0000000004208160 R14: ffff9b0c44e18a00 R15: ffff9b0c42dab800
[  316.941159] FS:  0000000000000000(0000) GS:ffff9b0cf7e00000(0000)
knlGS:0000000000000000
[  316.941243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  316.941309] CR2: 0000000000000018 CR3: 0000000102e48004 CR4: 00000000007706f0
[  316.941391] PKRU: 55555554
[  316.941443] Call Trace:
[  316.941513]  <TASK>
[  316.941578]  process_one_work+0x1b0/0x3c0
[  316.941689]  worker_thread+0x30/0x360
[  316.941755]  ? __pfx_worker_thread+0x10/0x10
[  316.941822]  kthread+0xd7/0x100
[  316.941900]  ? __pfx_kthread+0x10/0x10
[  316.941968]  ret_from_fork+0x29/0x50
[  316.942049]  </TASK>
[  316.942099] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
dns_resolver ib_core nfsv3 nfs_acl nfs lockd grace fscache netfs ext4
rfkill mbcache jbd2 loop vsock_loopback
vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
sunrpc tls vfat fat dm_multipath intel_rapl_msr intel_rapl_common
isst_if_mbox_msr isst_if_common nfit libnvdimm crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel rapl vmw_balloon joydev pcspkr
i2c_piix4 vmw_vmci xfs libcrc32c vmwgfx drm_ttm_helper ttm sr_mod
cdrom drm_kms_helper syscopyarea sd_mod sysfillrect ata_generic
sysimgblt sg ahci libahci ata_piix crc32c_intel serio_raw drm vmxnet3
vmw_pvscsi libata dm_mirror dm_region_hash dm_log dm_mod nvme_tcp
nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 ipmi_devintf
ipmi_msghandler fuse
[  316.942550] CR2: 0000000000000018

Please note this was still on "commit
caa52379f0046e974fd16585dd7ede624699d8e2 (HEAD -> 03152023-v7,
origin/upcall-v7)". If you think somethings done to address it I'll
have them update to the latest.

Thank you.
