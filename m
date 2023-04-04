Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEFCC942
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Apr 2023 19:11:51 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id q191so3005637pgq.7
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Apr 2023 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680635511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+mIzDt3EJzxicSngKkzpSswi/kznjUaXT55dH8mVOY=;
        b=MJS/Oa5L7EMYFXka/9CZG9SfZ0OF8WiNNp0JmPwqtCp0qJqtwCCbnFH21BBiqyWS7B
         WM2Uz10qbZpfS0pzcz+x/NqtQHrmqEBwxYKbZI4oZyZYtFfSrOJ9HNsMFQ6To9D7mIIa
         mltoCM3U4kpt8CPUAVvl9vcVh1hP8DZmI2y58LL3sYRP09BLm2x60fIqD1AE91AmuOCp
         jxl1HzjZHQrPzm/Bn73bHCscZNM8o1qse+d/tLGbFpInTwhK13D4dOipHVRT5XlQ7A5o
         e9emrxDawCQujmCIodGCIByfPujSZEmLebGwRFXleuhQ1XQ0KQ9DXdW8wU94uC2GXxXq
         k+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680635511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+mIzDt3EJzxicSngKkzpSswi/kznjUaXT55dH8mVOY=;
        b=mpozLAAI/jk5x3IL5vmnuHprxKBOeFR+9/UiS61QCS9Gr+MxOxsqDKD76CXgsVuP7l
         pCEBzAvRx9T6vqzFB2qUUqe7p9JW8Y1DfsUNX/cDFQeYcqiz+eMhNeXmF7Eo1n92kayr
         ZUguc3KEFqAVXSPoYZateYV7QmvsOmaAmSJ0il6j31BcFa6SrTyZGnO8JXGcnRPWxu+E
         1isn/bRh4J0y15dpS0i4LHndgPBUR+RMo2/KWHeRnhY/fiNjBid+0uH7Gnw9xyyReYgR
         13WbU8tvaqz9mLRQCRZDZQTPoaSPPFeqUxwgZ8sW8jvn2NBjayTmkMtQwoD94zDRqYwA
         KyPg==
X-Gm-Message-State: AAQBX9fh0HN8NTQYkHAoiTtJhuyJxvD5rbt4SVC30YUXOukVnWYish2g
	pee/4p1PRMVUaQ5R4djegG562dcTkEjs50jvED244ImG
X-Google-Smtp-Source: AKy350bo4eN5iy4cBo7FlQGqy7Ei6/hTY0Ev7Pdw6YQzcD+/pCywd9k2fg7aWqoy9n5XN6trn1pY/dPtcqNkq5eUj/Q=
X-Received: by 2002:a65:588b:0:b0:514:cc9:e013 with SMTP id
 d11-20020a65588b000000b005140cc9e013mr121773pgu.6.1680635510902; Tue, 04 Apr
 2023 12:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyGvk=yrdA3edJu3SeoQeACMzaeKQDetvVxPQSDN8XTd7w@mail.gmail.com>
 <C4C2EF4E-C877-4BD7-B77C-BE691B49E005@oracle.com> <CAN-5tyHyerwy2kQtG7rHk=5BOdB89PtNOnZM7LjnedexVCJJoA@mail.gmail.com>
 <6B4F534A-3D98-4AAC-8537-2D78D4EFFEA6@oracle.com> <CAN-5tyEzFjZx41bExgdLKuty5y7+59CJnf2vJm9=9dyAFV=H7w@mail.gmail.com>
 <2F8C7CC4-157D-479B-9DBB-51A4D39EEA96@oracle.com> <CAN-5tyGeKZB25=M=Gs1yC-O8xkKQ6xcXRxrv0ckO8aFEBuEq4Q@mail.gmail.com>
 <F5EB5B76-2BD9-4830-835E-DD9A1D2E7A8D@oracle.com>
In-Reply-To: <F5EB5B76-2BD9-4830-835E-DD9A1D2E7A8D@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 4 Apr 2023 15:11:39 -0400
Message-ID: <CAN-5tyFQe38ys8eed1bqNSqfHkf=EGS9u0+mhuRsDTTs8CVqaQ@mail.gmail.com>
Subject: Re: kernel oops
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 1:28=E2=80=AFPM Chuck Lever III <chuck.lever@oracle.=
com> wrote:
>
>
>
> > On Apr 4, 2023, at 12:15 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Tue, Apr 4, 2023 at 10:54=E2=80=AFAM Chuck Lever III <chuck.lever@or=
acle.com> wrote:
> >>
> >>
> >>
> >>> On Apr 4, 2023, at 10:44 AM, Olga Kornievskaia <aglo@umich.edu> wrote=
:
> >>>
> >>> On Tue, Apr 4, 2023 at 10:32=E2=80=AFAM Chuck Lever III <chuck.lever@=
oracle.com> wrote:
> >>>>
> >>>>> On Apr 4, 2023, at 10:24 AM, Olga Kornievskaia <aglo@umich.edu> wro=
te:
> >>>>>
> >>>>> On Fri, Mar 31, 2023 at 10:25=E2=80=AFAM Chuck Lever III <chuck.lev=
er@oracle.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> On Mar 31, 2023, at 10:23 AM, Olga Kornievskaia <aglo@umich.edu> =
wrote:
> >>>>>>>
> >>>>>>> Hi Chuck,
> >>>>>>>
> >>>>>>> Have you seen this oops? This is not my testing so all I know was=
 that
> >>>>>>> it was an attempt to mount with xprtsec=3Dtls (against ONTAP).
> >>>>>>>
> >>>>>>> [  316.939747] BUG: kernel NULL pointer dereference, address: 000=
0000000000018
> >>>>>>> [  316.939848] #PF: supervisor read access in kernel mode
> >>>>>>> [  316.939914] #PF: error_code(0x0000) - not-present page
> >>>>>>> [  316.939984] PGD 0 P4D 0
> >>>>>>> [  316.940041] Oops: 0000 [#1] PREEMPT SMP PTI
> >>>>>>> [  316.940109] CPU: 0 PID: 511 Comm: kworker/u2:30 Kdump: loaded =
Not
> >>>>>>> tainted 6.2.1+ #2
> >>>>>>> [  316.940181] Hardware name: VMware, Inc. VMware7,1/440BX Deskto=
p
> >>>>>>> Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/=
2020
> >>>>>>> [  316.940259] Workqueue: xprtiod xs_tls_connect [sunrpc]
> >>>>>>> [  316.940463] RIP: 0010:xs_tls_connect+0x3e1/0x590 [sunrpc]
> >>>>>>> [  316.940556] Code: ff ff ff 48 2b 83 f8 fe ff ff 48 89 83 00 ff=
 ff
> >>>>>>> ff e8 03 d3 ff ff e9 a8 fd ff ff 49 8b 97 f8 05 00 00 66 83 bb e0=
 f9
> >>>>>>> ff ff 0a <48> 8b 6a 18 0f 84 fd 00 00 00 48 8d 72 18 4c 89 e7 48 =
89 14
> >>>>>>> 24 e8
> >>>>>>> [  316.940719] RSP: 0018:ffffa69d40f5fdc8 EFLAGS: 00010293
> >>>>>>> [  316.940786] RAX: 0000000000000000 RBX: ffff9b0c46333e40 RCX: 0=
000000000000000
> >>>>>>> [  316.940872] RDX: 0000000000000000 RSI: ffffa69d40f5fd20 RDI: 0=
000000000000000
> >>>>>>> [  316.940940] RBP: ffff9b0c46350200 R08: ffff9b0cf7e31968 R09: 0=
000000000000159
> >>>>>>> [  316.941008] R10: 0000000000000001 R11: 00000049c8887a40 R12: f=
fff9b0c46333800
> >>>>>>> [  316.941075] R13: 0000000004208160 R14: ffff9b0c44e18a00 R15: f=
fff9b0c42dab800
> >>>>>>> [  316.941159] FS:  0000000000000000(0000) GS:ffff9b0cf7e00000(00=
00)
> >>>>>>> knlGS:0000000000000000
> >>>>>>> [  316.941243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>>>> [  316.941309] CR2: 0000000000000018 CR3: 0000000102e48004 CR4: 0=
0000000007706f0
> >>>>>>> [  316.941391] PKRU: 55555554
> >>>>>>> [  316.941443] Call Trace:
> >>>>>>> [  316.941513]  <TASK>
> >>>>>>> [  316.941578]  process_one_work+0x1b0/0x3c0
> >>>>>>> [  316.941689]  worker_thread+0x30/0x360
> >>>>>>> [  316.941755]  ? __pfx_worker_thread+0x10/0x10
> >>>>>>> [  316.941822]  kthread+0xd7/0x100
> >>>>>>> [  316.941900]  ? __pfx_kthread+0x10/0x10
> >>>>>>> [  316.941968]  ret_from_fork+0x29/0x50
> >>>>>>> [  316.942049]  </TASK>
> >>>>>>> [  316.942099] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfs=
v4
> >>>>>>> dns_resolver ib_core nfsv3 nfs_acl nfs lockd grace fscache netfs =
ext4
> >>>>>>> rfkill mbcache jbd2 loop vsock_loopback
> >>>>>>> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
> >>>>>>> sunrpc tls vfat fat dm_multipath intel_rapl_msr intel_rapl_common
> >>>>>>> isst_if_mbox_msr isst_if_common nfit libnvdimm crct10dif_pclmul
> >>>>>>> crc32_pclmul ghash_clmulni_intel rapl vmw_balloon joydev pcspkr
> >>>>>>> i2c_piix4 vmw_vmci xfs libcrc32c vmwgfx drm_ttm_helper ttm sr_mod
> >>>>>>> cdrom drm_kms_helper syscopyarea sd_mod sysfillrect ata_generic
> >>>>>>> sysimgblt sg ahci libahci ata_piix crc32c_intel serio_raw drm vmx=
net3
> >>>>>>> vmw_pvscsi libata dm_mirror dm_region_hash dm_log dm_mod nvme_tcp
> >>>>>>> nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 ipmi_devintf
> >>>>>>> ipmi_msghandler fuse
> >>>>>>> [  316.942550] CR2: 0000000000000018
> >>>>>>>
> >>>>>>> Please note this was still on "commit
> >>>>>>> caa52379f0046e974fd16585dd7ede624699d8e2 (HEAD -> 03152023-v7,
> >>>>>>> origin/upcall-v7)". If you think somethings done to address it I'=
ll
> >>>>>>> have them update to the latest.
> >>>>>>
> >>>>>> Update and retry. It has a familiar ring, but I can't say I've
> >>>>>> seen this recently.
> >>>>>
> >>>>> Hi Chuck,
> >>>>>
> >>>>> I've updated the kernel code to the latest  commit
> >>>>> 46588cade103b446f74a7ee160a83cd2a80399e7 (HEAD ->
> >>>>> chuck-rpc-with-tls-04032023, chuck/topic-rpc-with-tls-upcall) but t=
he
> >>>>> client is still crashing but looks like in a different place. This
> >>>>> happens when the server terminates the connection (immediately) as =
the
> >>>>> tls handshake happens.
> >>>>
> >>>> Why is the server doing that?
> >>>
> >>> I'm not sure what kind of a reason you are looking for. I think the
> >>> server can send an RST at any point in a TCP connection and the clien=
t
> >>> shouldn't crash.
> >>
> >> No doubt.
> >>
> >>
> >>> But the real reason is probably because the server's
> >>> code is getting developed and they ran into some error and resetting
> >>> the connection.
> >>
> >> That's what I was looking for. I wanted to know if it was
> >> Linux NFSD doing this.
> >>
> >>
> >>>>> Here's the stack trace:
> >>>>> [  677.274299] BUG: kernel NULL pointer dereference, address: 00000=
00000000030
> >>>>> [  677.274424] #PF: supervisor read access in kernel mode
> >>>>> [  677.274517] #PF: error_code(0x0000) - not-present page
> >>>>> [  677.274609] PGD 0 P4D 0
> >>>>> [  677.274689] Oops: 0000 [#1] PREEMPT SMP PTI
> >>>>> [  677.274785] CPU: 0 PID: 518 Comm: kworker/u2:29 Kdump: loaded No=
t
> >>>>> tainted 6.3.0-rc4+ #13
> >>>>> [  677.274881] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
> >>>>> Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/20=
20
> >>>>> [  677.274981] Workqueue: xprtiod xs_tls_connect [sunrpc]
> >>>>> [  677.275137] RIP: 0010:handshake_req_cancel+0x2b/0x3b0
> >>>>
> >>>> scripts/faddr2line on this RIP
> >>>>
> >>>> Which pointer is NULL?
> >>>
> >>> I apologize I don't have that info and I'm working on trying to figur=
e
> >>> out how to get this information to you. Lab kernels are built with
> >>> CONFIG_DEBUG_INFO disabled and thus I can't do faddr2line. I will
> >>> attempt to build on with debugging enabled (has been problematic
> >>> before for the lab machines so not sure if that'll be successful I
> >>> might have to hack the linux kernel to simulate the reset).
> >>
> >> Jakub asked that NULL checking be removed from handshake_req_cancel,
> >> or at least that's what I read into his comment. That choice is
> >> definitely flushing bugs.
> >>
> >> So this crasher is familiar. req_cancel is getting called in some
> >> scenario where the socket or request is partially filled in. We
> >> have to figure out how that's happening.
> >>
> >> If debug info is a problem, then just add a sarcastic quantity of
> >> NULL checks in handshake_req_cancel, rebuild, and it should tell
> >> you exactly which pointer is bad.
> >
> > I added a check for sock-sk null and if so return true.
>
> If it returns true, xs_tls_handshake_sync() probably completes
> successfully.
>
> Perhaps handshake_req_cancel needs to return false in cases
> where it can't find a pending request.

I'm not sure if you were suggesting me to do this but I tried:
if (!sock->sk) return false;
and that led to a mount not crashing but timing out.

>
>
> > I thought that
> > would "prevent" the crash but it then proceeded to crash elsewhere.
> > Sorry I'm still on non-debug-symbol kernel (as I thought I'd add the
> > checks that that'd be enough :)).
> >
> > [  284.368211] AGLO: handshake_req_cancel sock->sk is NULL
> > [  284.368249] BUG: kernel NULL pointer dereference, address: 000000000=
0000018
> > [  284.368320] #PF: supervisor read access in kernel mode
> > [  284.368363] #PF: error_code(0x0000) - not-present page
> > [  284.368411] PGD 0 P4D 0
> > [  284.368438] Oops: 0000 [#1] PREEMPT SMP PTI
> > [  284.368473] CPU: 0 PID: 521 Comm: kworker/u2:30 Kdump: loaded Not
> > tainted 6.3.0-rc4+ #14
> > [  284.368523] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
> > Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/2020
> > [  284.368580] Workqueue: xprtiod xs_tls_connect [sunrpc]
> > [  284.368720] RIP: 0010:xs_tls_connect+0x3e5/0x590 [sunrpc]
> > [  284.368844] Code: ff ff ff 48 2b 83 f8 fe ff ff 48 89 83 00 ff ff
> > ff e8 bf d2 ff ff e9 a8 fd ff ff 49 8b 97 f8 05 00 00 66 83 bb e0 f9
> > ff ff 0a <48> 8b 6a 18 0f 84 fd 00 00 00 48 8d 72 18 4c 89 e7 48 89 14
> > 24 e8
> > [  284.368973] RSP: 0018:ffffba17c0f67dc8 EFLAGS: 00010293
> > [  284.369010] RAX: 0000000000000000 RBX: ffff963143c1fe40 RCX: 0000000=
000000000
> > [  284.369051] RDX: 0000000000000000 RSI: ffff9631f7e20840 RDI: ffff963=
1f7e20840
> > [  284.369091] RBP: ffff9631463d8a00 R08: 0000000000000000 R09: c000000=
0ffff7fff
> > [  284.369130] R10: 0000000000000001 R11: ffffba17c0f67bb8 R12: ffff963=
143c1f800
> > [  284.369175] R13: 0000000004208160 R14: ffff963143f6f600 R15: ffff963=
143c1e000
> > [  284.369259] FS:  0000000000000000(0000) GS:ffff9631f7e00000(0000)
> > knlGS:0000000000000000
> > [  284.369319] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  284.369367] CR2: 0000000000000018 CR3: 0000000102d12004 CR4: 0000000=
0007706f0
> > [  284.369458] PKRU: 55555554
> > [  284.369483] Call Trace:
> > [  284.369523]  <TASK>
> > [  284.369583]  process_one_work+0x1b0/0x3c0
> > [  284.369633]  worker_thread+0x34/0x360
> > [  284.369668]  ? __pfx_worker_thread+0x10/0x10
> > [  284.369704]  kthread+0xdb/0x110
> > [  284.369736]  ? __pfx_kthread+0x10/0x10
> > [  284.369767]  ret_from_fork+0x29/0x50
> > [  284.369808]  </TASK>
> > [  284.369843] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> > dns_resolver nfsv3 nfs_acl nfs lockd grace fscache netfs ext4 mbcache
> > jbd2 loop rfkill vsock_loopback vmw_vsock_virtio_transport_common
> > vmw_vsock_vmci_transport vsock sunrpc vfat fat dm_multipath
> > intel_rapl_msr intel_rapl_common isst_if_mbox_msr isst_if_common nfit
> > libnvdimm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel rapl
> > vmw_balloon joydev pcspkr vmw_vmci i2c_piix4 xfs libcrc32c vmwgfx
> > drm_ttm_helper ttm sr_mod cdrom drm_kms_helper sd_mod syscopyarea
> > sysfillrect ata_generic sysimgblt sg ata_piix ahci libahci
> > crc32c_intel serio_raw vmxnet3 libata drm vmw_pvscsi dm_mirror
> > dm_region_hash dm_log dm_mod nvme_tcp nvme_fabrics nvme_core t10_pi
> > crc64_rocksoft crc64 ipmi_devintf ipmi_msghandler fuse
> > [  284.370300] CR2: 0000000000000018
> >
> >
> >>
> >> BPF might also be a solution, but I'm not sure if it relies on
> >> debug info. Might be only BTF is needed.
> >>
> >>
> >>>>> [  677.275269] Code: 0f 1e fa 0f 1f 44 00 00 41 57 41 56 41 55 41 5=
4
> >>>>> 55 53 48 83 ec 28 48 8b 6f 18 65 48 8b 04 25 28 00 00 00 48 89 44 2=
4
> >>>>> 20 31 c0 <48> 8b 5d 30 48 89 6c 24 18 e8 97 15 5f ff 4c 8b 25 50 2e=
 70
> >>>>> 01 41
> >>>>> [  677.275474] RSP: 0018:ffffaed400f6fcf8 EFLAGS: 00010246
> >>>>> [  677.275570] RAX: 0000000000000000 RBX: ffff93f085b33800 RCX: 000=
0000000000000
> >>>>> [  677.275663] RDX: ffff93f085b33f08 RSI: ffffaed400f6fd18 RDI: fff=
f93f083aa6700
> >>>>> [  677.275756] RBP: 0000000000000000 R08: ffff93f137e32968 R09: 000=
0009d9663fa40
> >>>>> [  677.275850] R10: 0000000000000000 R11: 0000009d9663fa40 R12: fff=
f93f083aa6700
> >>>>> [  677.275943] R13: 0000000000000000 R14: ffff93f082999e00 R15: fff=
f93f085b33800
> >>>>> [  677.276049] FS:  0000000000000000(0000) GS:ffff93f137e00000(0000=
)
> >>>>> knlGS:0000000000000000
> >>>>> [  677.276154] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>> [  677.276247] CR2: 0000000000000030 CR3: 000000010797c002 CR4: 000=
00000007706f0
> >>>>> [  677.276355] PKRU: 55555554
> >>>>> [  677.276427] Call Trace:
> >>>>> [  677.276521]  <TASK>
> >>>>> [  677.276605]  ? wait_for_completion_interruptible_timeout+0xfa/0x=
170
> >>>>> [  677.276725]  xs_tls_handshake_sync+0x14f/0x170 [sunrpc]
> >>>>> [  677.276850]  ? __pfx_xs_tls_handshake_done+0x10/0x10 [sunrpc]
> >>>>> [  677.276967]  xs_tls_connect+0x14c/0x590 [sunrpc]
> >>>>> [  677.277086]  process_one_work+0x1b0/0x3c0
> >>>>> [  677.277209]  worker_thread+0x34/0x360
> >>>>> [  677.277303]  ? __pfx_worker_thread+0x10/0x10
> >>>>> [  677.277396]  kthread+0xdb/0x110
> >>>>> [  677.277527]  ? __pfx_kthread+0x10/0x10
> >>>>> [  677.277619]  ret_from_fork+0x29/0x50
> >>>>> [  677.277731]  </TASK>
> >>>>> [  677.277803] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> >>>>> dns_resolver nfsv3 nfs_acl nfs lockd grace fscache netfs ext4 mbcac=
he
> >>>>> jbd2 loop rfkill vsock_loopback vmw_vsock_virtio_transport_common
> >>>>> vmw_vsock_vmci_transport vsock sunrpc vfat fat dm_multipath
> >>>>> intel_rapl_msr intel_rapl_common isst_if_mbox_msr isst_if_common nf=
it
> >>>>> libnvdimm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel rapl
> >>>>> vmw_balloon joydev pcspkr vmw_vmci i2c_piix4 xfs libcrc32c vmwgfx
> >>>>> drm_ttm_helper ttm sr_mod cdrom drm_kms_helper syscopyarea sysfillr=
ect
> >>>>> sd_mod ata_generic sysimgblt sg ata_piix ahci libahci crc32c_intel
> >>>>> serio_raw drm vmxnet3 vmw_pvscsi libata dm_mirror dm_region_hash
> >>>>> dm_log dm_mod nvme_tcp nvme_fabrics nvme_core t10_pi crc64_rocksoft
> >>>>> crc64 ipmi_devintf ipmi_msghandler fuse
> >>>>> [  677.278383] CR2: 0000000000000030
> >>>>>
> >>>>> Network trace from the server:
> >>>>>
> >>>>> [kolga@scs000085536 ~/pcaps]$ tshark -t ad -r e0d_20230404_084311.t=
rc0
> >>>>>  1 2023-04-04 08:43:28.027546 10.235.232.77 =E2=86=92 10.63.20.131 =
TCP 74
> >>>>> 727 =E2=86=92 2049 [SYN] Seq=3D0 Win=3D64240 Len=3D0 MSS=3D1460 SAC=
K_PERM=3D1
> >>>>> TSval=3D4059503415 TSecr=3D0 WS=3D128
> >>>>>  2 2023-04-04 08:43:28.027645 10.63.20.131 =E2=86=92 10.235.232.77 =
TCP 74
> >>>>> 2049 =E2=86=92 727 [SYN, ACK] Seq=3D0 Ack=3D1 Win=3D65535 Len=3D0 M=
SS=3D1460 WS=3D256
> >>>>> SACK_PERM=3D1 TSval=3D2256845073 TSecr=3D4059503415
> >>>>>  3 2023-04-04 08:43:28.027813 10.235.232.77 =E2=86=92 10.63.20.131 =
TCP 66
> >>>>> 727 =E2=86=92 2049 [ACK] Seq=3D1 Ack=3D1 Win=3D64256 Len=3D0 TSval=
=3D4059503415
> >>>>> TSecr=3D2256845073
> >>>>>  4 2023-04-04 08:43:28.027952 10.235.232.77 =E2=86=92 10.63.20.131 =
NFS 110
> >>>>> V4 NULL Call
> >>>>>  5 2023-04-04 08:43:28.028301 10.63.20.131 =E2=86=92 10.235.232.77 =
NFS 102
> >>>>> V4 NULL Reply (Call In 4)
> >>>>>  6 2023-04-04 08:43:28.028563 10.235.232.77 =E2=86=92 10.63.20.131 =
TCP 66
> >>>>> 727 =E2=86=92 2049 [ACK] Seq=3D45 Ack=3D37 Win=3D64256 Len=3D0 TSva=
l=3D4059503416
> >>>>> TSecr=3D2256845073
> >>>>>  7 2023-04-04 08:43:28.331181 10.63.20.131 =E2=86=92 10.235.232.77 =
TCP 66
> >>>>> 2049 =E2=86=92 727 [RST, ACK] Seq=3D37 Ack=3D45 Win=3D0 Len=3D0 TSv=
al=3D2256845383
> >>>>> TSecr=3D4059503416
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> Chuck Lever
> >>>>
> >>>>
> >>>> --
> >>>> Chuck Lever
> >>
> >>
> >> --
> >> Chuck Lever
>
>
> --
> Chuck Lever
>
>
