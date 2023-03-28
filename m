Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4D2F3E
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 12:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E3C4339C;
	Tue, 28 Mar 2023 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680006468;
	bh=Unk/uy4RYITOHwaUeghbIm9ua9YCAy3wuJD1MXMpngA=;
	h=Subject:From:To:Cc:Date:From;
	b=gH3RjnuYyeIHjot29xJH2ZXogWemF0d+CW+lNJLGz6zrUqBB+AuukzdW/22gQbrap
	 i65sOPFWVKBDOBdnFkNdSN9RdRCopptx8z3ZpxB416+yRgpYjxK8J9KP+JHoV27EJ4
	 c9hOgrubM7rE4UAtXscy6PTqDITVw6FMdil94jxPsQBXSGqeljdEGl8Ji6unr+UijY
	 3g7D6j7jKecF3tWw9SvvXaeQhRuPsRXTknqhqhhjGI0tnE7Owq+oeVUzAKN2gim73t
	 AZnkONAt0/JG/OY9T2llw3lmpm/R3f6LBstJt5yMotepKyszwbiASE6r4wXYYwGFAm
	 suFp8H5ju+sFA==
Message-ID: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
Subject: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 08:27:46 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Chuck!

I have started the packaging work for Fedora for ktls-utils:

    https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151

I also built packages for this in copr:

    https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/

...and built some interim nfs-utils packages with the requisite exportfs
patches:

    https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/

I built a kernel from your topic-rpc-with-tls-upcall branch and
installed the kernel on a client and server, along with ktls-utils and
the updated nfs-utils on the server. I set up tlshd to run at boot on
both hosts. The server exports with a bog-standard set of options:

    /export		*(rw,insecure,no_root_squash)

I then tried to mount it with tls:

    $ sudo mount knfsd:/export /mnt/knfsd -o xprtsec=3Dtls

I see the initial NULL requests go out, and then I see the client send
an encrypted frame to the server, and the server just shuts down the
socket at that point (FIN, ACK).

I assume that I must have something configured wrong. What am I missing?

Eventually, after a couple of failed mount attempts, I also hit this on
the client:

[  375.561304] BUG: kernel NULL pointer dereference, address:
0000000000000030
[  375.564637] #PF: supervisor read access in kernel mode
[  375.566439] #PF: error_code(0x0000) - not-present page
[  375.567930] PGD 0 P4D 0=20
[  375.568733] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  375.569993] CPU: 2 PID: 9 Comm: kworker/u16:0 Tainted: G            E
6.3.0-rc2+ #151
[  375.572214] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.1-2.fc37 04/01/2014
[  375.574538] Workqueue: xprtiod xs_tls_connect [sunrpc]
[  375.576087] RIP: 0010:handshake_req_cancel+0x12/0x1c0
[  375.578255] Code: d0 5b ff eb 92 0f 1f 00 90 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 0f 1f 44 00 00 41 55 41 54 55 53 48 8b 6f 18 48 89
ef <4c> 8b 6d 30 e8 35 fe ff ff 48 85 c0 0f 84 3e 01 00 00 4c 89 ef 48
[  375.583180] RSP: 0018:ffffb87540053d28 EFLAGS: 00010246
[  375.585416] RAX: 0000000000000000 RBX: ffff970289cb4800 RCX:
0000000000000000
[  375.588226] RDX: 0000000000000001 RSI: ffffb87540053d00 RDI:
0000000000000000
[  375.590389] RBP: 0000000000000000 R08: ffff970280e544a8 R09:
0000000000000001
[  375.592601] R10: 0000000000000002 R11: 0000000000000001 R12:
ffff970288985480
[  375.594885] R13: 0000000000000000 R14: 0000000004208160 R15:
ffff970289cb4800
[  375.597051] FS:  0000000000000000(0000) GS:ffff9703f7c80000(0000)
knlGS:0000000000000000
[  375.599810] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  375.601625] CR2: 0000000000000030 CR3: 000000010aa04000 CR4:
00000000003506e0
[  375.603785] Call Trace:
[  375.604754]  <TASK>
[  375.605651]  xs_tls_handshake_sync+0x14f/0x170 [sunrpc]
[  375.608998]  ? __pfx_xs_tls_handshake_done+0x10/0x10 [sunrpc]
[  375.610900]  xs_tls_connect+0x14a/0x5f0 [sunrpc]
[  375.612530]  process_one_work+0x1c8/0x3c0
[  375.613907]  worker_thread+0x4d/0x380
[  375.615189]  ? __pfx_worker_thread+0x10/0x10
[  375.616631]  kthread+0xe9/0x110
[  375.617788]  ? __pfx_kthread+0x10/0x10
[  375.619091]  ret_from_fork+0x2c/0x50
[  375.620347]  </TASK>
[  375.621242] Modules linked in: rpcsec_gss_krb5(E) auth_rpcgss(E)
nfsv4(E) dns_resolver(E) nfs(E) lockd(E) grace(E) sunrpc(E) ext4(E)
crc16(E) mbcache(E) jbd2(E) snd_hda_codec_generic(E) snd_hda_intel(E)
snd_intel_dspcfg(E) snd_hda_codec(E) snd_hwdep(E) snd_hda_core(E)
snd_pcm(E) kvm_amd(E) snd_timer(E) kvm(E) psmouse(E) snd(E) evdev(E)
irqbypass(E) virtio_balloon(E) soundcore(E) pcspkr(E) button(E) loop(E)
drm(E) configfs(E) zram(E) zsmalloc(E) xfs(E) libcrc32c(E)
crc32c_generic(E) crct10dif_pclmul(E) crc32_pclmul(E) crc32c_intel(E)
ghash_clmulni_intel(E) sha512_ssse3(E) sha512_generic(E) virtio_net(E)
virtio_blk(E) net_failover(E) failover(E) virtio_console(E)
aesni_intel(E) serio_raw(E) crypto_simd(E) cryptd(E) virtio_pci(E)
virtio(E) virtio_pci_legacy_dev(E) virtio_pci_modern_dev(E)
virtio_ring(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E)
dm_multipath(E) dm_mod(E) scsi_mod(E) scsi_common(E) autofs4(E)
[  375.646698] CR2: 0000000000000030
[  375.647894] ---[ end trace 0000000000000000 ]---
[  375.649403] RIP: 0010:handshake_req_cancel+0x12/0x1c0
[  375.651062] Code: d0 5b ff eb 92 0f 1f 00 90 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 0f 1f 44 00 00 41 55 41 54 55 53 48 8b 6f 18 48 89
ef <4c> 8b 6d 30 e8 35 fe ff ff 48 85 c0 0f 84 3e 01 00 00 4c 89 ef 48
[  375.654664] RSP: 0018:ffffb87540053d28 EFLAGS: 00010246
[  375.655447] RAX: 0000000000000000 RBX: ffff970289cb4800 RCX:
0000000000000000
[  375.656436] RDX: 0000000000000001 RSI: ffffb87540053d00 RDI:
0000000000000000
[  375.657425] RBP: 0000000000000000 R08: ffff970280e544a8 R09:
0000000000000001
[  375.658392] R10: 0000000000000002 R11: 0000000000000001 R12:
ffff970288985480
[  375.659360] R13: 0000000000000000 R14: 0000000004208160 R15:
ffff970289cb4800
[  375.660324] FS:  0000000000000000(0000) GS:ffff9703f7c80000(0000)
knlGS:0000000000000000
[  375.661479] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  375.662285] CR2: 0000000000000030 CR3: 000000010aa04000 CR4:
00000000003506e0
[  375.663278] note: kworker/u16:0[9] exited with irqs disabled


...faddr2line says:

[jlayton@tleilax linux]$ ./scripts/faddr2line --list vmlinux
handshake_req_cancel+0x12/0x1c0
handshake_req_cancel+0x12/0x1c0:

read_pnet at include/net/net_namespace.h:383
 378 	}
 379 =09
 380 	static inline struct net *read_pnet(const possible_net_t *pnet)
 381 	{
 382 	#ifdef CONFIG_NET_NS
>383<		return pnet->net;
 384 	#else
 385 		return &init_net;
 386 	#endif
 387 	}
 388 =09

(inlined by) sock_net at include/net/sock.h:649
 644 		__rcu_assign_sk_user_data_with_flags(sk, ptr, 0)
 645 =09
 646 	static inline
 647 	struct net *sock_net(const struct sock *sk)
 648 	{
>649<		return read_pnet(&sk->sk_net);
 650 	}
 651 =09
 652 	static inline
 653 	void sock_net_set(struct sock *sk, struct net *net)
 654 	{

(inlined by) handshake_req_cancel at net/handshake/request.c:281
 276 		struct handshake_net *hn;
 277 		struct sock *sk;
 278 		struct net *net;
 279 =09
 280 		sk =3D sock->sk;
>281<		net =3D sock_net(sk);
 282 		req =3D handshake_req_hash_lookup(sk);
 283 		if (!req) {
 284 			trace_handshake_cancel_none(net, req, sk);
 285 			return true;
 286 		}


I'm guessing sk was NULL in handshake_req_cancel?
--=20
Jeff Layton <jlayton@kernel.org>
