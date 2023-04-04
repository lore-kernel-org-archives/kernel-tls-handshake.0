Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6282FAE
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Apr 2023 14:44:37 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id fb38so21623138pfb.7
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Apr 2023 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680619477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4txPisi18kJNYLHGY7sW6TcOvZzEHFWBOqORNVvutJA=;
        b=HBnUQ48fl7RtrySKGVlc/f6m0+m00iOyqd/rm21UEOapxivRYbMN3OB7kgaN5Q/ruO
         g0ccVhzmzZvL8YXceGE571JuqqiilIfdeo1y7U0CCdsDoz6hfsGI+7khd8voz35srS2O
         zzRV6m9jHZqDMIQ1dLbJhlowumh77D5gGmkvTtRQb38xH+kikM1LJkP4K6rO8vBuzerF
         nKpT4ovto23KOg2r67br1eYDogZVZjhFW1j1ZNzbEpSxx8w69/rjfIMPjnsn/htxRhgN
         MTDku4OvlIBR3b8mVA6tBIvLyvWk8z15iP8ynbRbA0vdvDt0MdlFiFjDk+n9FhrJh0CA
         sixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680619477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4txPisi18kJNYLHGY7sW6TcOvZzEHFWBOqORNVvutJA=;
        b=3z4iUCQ7LsfhRtxuSl8j94+E9rDhPR4FSt4ldVjlhHBp2WoI6uFHveCZaF2bMo4IsA
         mGYm/c9SpxGvgcQfnwSYa9hJCNUpXzjCCjDVps/DHCB3E+ENR1fpfLECAjko+z2mxJmZ
         lytNkE7qKfXxj6Mi8dpQ/4CJqiYTgkjMYrc5jjoS5PmBOnT5DgUQPrrhtwMmdAggsCOh
         zsJ+RztxyL/0adZIMdLTh68pqvWxNO9TF08N0/zxYqm5Q4hJGK8xHNXWl22hUJ7YqANq
         MDlV4+HbSToUrrBAWz/kIl6H/bjWh4Youekc0NXQS60Gumg+VWvM1T51HyEtduWjfao/
         X/Vg==
X-Gm-Message-State: AAQBX9dxZvuD7G/RwI2XLWIAuhUuyeobZw/lzs4ibH85K+fLaILlkbjq
	PzPyhWAmCxs0PcXJwCSWs9V0SFX8FLnglzknRdQwNT7bESc=
X-Google-Smtp-Source: AKy350b9Ae6waBi14F026+JplsYQveVEDJTUEaurxHu6ZSlSbFZhXHN7oowgv6p137XGJ7Wm3UKFo/awbmFyToB9rEs=
X-Received: by 2002:a05:6a00:999:b0:625:cda5:c28c with SMTP id
 u25-20020a056a00099900b00625cda5c28cmr1416625pfg.6.1680619477163; Tue, 04 Apr
 2023 07:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyGvk=yrdA3edJu3SeoQeACMzaeKQDetvVxPQSDN8XTd7w@mail.gmail.com>
 <C4C2EF4E-C877-4BD7-B77C-BE691B49E005@oracle.com> <CAN-5tyHyerwy2kQtG7rHk=5BOdB89PtNOnZM7LjnedexVCJJoA@mail.gmail.com>
 <6B4F534A-3D98-4AAC-8537-2D78D4EFFEA6@oracle.com>
In-Reply-To: <6B4F534A-3D98-4AAC-8537-2D78D4EFFEA6@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 4 Apr 2023 10:44:26 -0400
Message-ID: <CAN-5tyEzFjZx41bExgdLKuty5y7+59CJnf2vJm9=9dyAFV=H7w@mail.gmail.com>
Subject: Re: kernel oops
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 10:32=E2=80=AFAM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
>
> > On Apr 4, 2023, at 10:24 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Fri, Mar 31, 2023 at 10:25=E2=80=AFAM Chuck Lever III <chuck.lever@o=
racle.com> wrote:
> >>
> >>
> >>
> >>> On Mar 31, 2023, at 10:23 AM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> >>>
> >>> Hi Chuck,
> >>>
> >>> Have you seen this oops? This is not my testing so all I know was tha=
t
> >>> it was an attempt to mount with xprtsec=3Dtls (against ONTAP).
> >>>
> >>> [  316.939747] BUG: kernel NULL pointer dereference, address: 0000000=
000000018
> >>> [  316.939848] #PF: supervisor read access in kernel mode
> >>> [  316.939914] #PF: error_code(0x0000) - not-present page
> >>> [  316.939984] PGD 0 P4D 0
> >>> [  316.940041] Oops: 0000 [#1] PREEMPT SMP PTI
> >>> [  316.940109] CPU: 0 PID: 511 Comm: kworker/u2:30 Kdump: loaded Not
> >>> tainted 6.2.1+ #2
> >>> [  316.940181] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
> >>> Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/2020
> >>> [  316.940259] Workqueue: xprtiod xs_tls_connect [sunrpc]
> >>> [  316.940463] RIP: 0010:xs_tls_connect+0x3e1/0x590 [sunrpc]
> >>> [  316.940556] Code: ff ff ff 48 2b 83 f8 fe ff ff 48 89 83 00 ff ff
> >>> ff e8 03 d3 ff ff e9 a8 fd ff ff 49 8b 97 f8 05 00 00 66 83 bb e0 f9
> >>> ff ff 0a <48> 8b 6a 18 0f 84 fd 00 00 00 48 8d 72 18 4c 89 e7 48 89 1=
4
> >>> 24 e8
> >>> [  316.940719] RSP: 0018:ffffa69d40f5fdc8 EFLAGS: 00010293
> >>> [  316.940786] RAX: 0000000000000000 RBX: ffff9b0c46333e40 RCX: 00000=
00000000000
> >>> [  316.940872] RDX: 0000000000000000 RSI: ffffa69d40f5fd20 RDI: 00000=
00000000000
> >>> [  316.940940] RBP: ffff9b0c46350200 R08: ffff9b0cf7e31968 R09: 00000=
00000000159
> >>> [  316.941008] R10: 0000000000000001 R11: 00000049c8887a40 R12: ffff9=
b0c46333800
> >>> [  316.941075] R13: 0000000004208160 R14: ffff9b0c44e18a00 R15: ffff9=
b0c42dab800
> >>> [  316.941159] FS:  0000000000000000(0000) GS:ffff9b0cf7e00000(0000)
> >>> knlGS:0000000000000000
> >>> [  316.941243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> [  316.941309] CR2: 0000000000000018 CR3: 0000000102e48004 CR4: 00000=
000007706f0
> >>> [  316.941391] PKRU: 55555554
> >>> [  316.941443] Call Trace:
> >>> [  316.941513]  <TASK>
> >>> [  316.941578]  process_one_work+0x1b0/0x3c0
> >>> [  316.941689]  worker_thread+0x30/0x360
> >>> [  316.941755]  ? __pfx_worker_thread+0x10/0x10
> >>> [  316.941822]  kthread+0xd7/0x100
> >>> [  316.941900]  ? __pfx_kthread+0x10/0x10
> >>> [  316.941968]  ret_from_fork+0x29/0x50
> >>> [  316.942049]  </TASK>
> >>> [  316.942099] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> >>> dns_resolver ib_core nfsv3 nfs_acl nfs lockd grace fscache netfs ext4
> >>> rfkill mbcache jbd2 loop vsock_loopback
> >>> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
> >>> sunrpc tls vfat fat dm_multipath intel_rapl_msr intel_rapl_common
> >>> isst_if_mbox_msr isst_if_common nfit libnvdimm crct10dif_pclmul
> >>> crc32_pclmul ghash_clmulni_intel rapl vmw_balloon joydev pcspkr
> >>> i2c_piix4 vmw_vmci xfs libcrc32c vmwgfx drm_ttm_helper ttm sr_mod
> >>> cdrom drm_kms_helper syscopyarea sd_mod sysfillrect ata_generic
> >>> sysimgblt sg ahci libahci ata_piix crc32c_intel serio_raw drm vmxnet3
> >>> vmw_pvscsi libata dm_mirror dm_region_hash dm_log dm_mod nvme_tcp
> >>> nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 ipmi_devintf
> >>> ipmi_msghandler fuse
> >>> [  316.942550] CR2: 0000000000000018
> >>>
> >>> Please note this was still on "commit
> >>> caa52379f0046e974fd16585dd7ede624699d8e2 (HEAD -> 03152023-v7,
> >>> origin/upcall-v7)". If you think somethings done to address it I'll
> >>> have them update to the latest.
> >>
> >> Update and retry. It has a familiar ring, but I can't say I've
> >> seen this recently.
> >
> > Hi Chuck,
> >
> > I've updated the kernel code to the latest  commit
> > 46588cade103b446f74a7ee160a83cd2a80399e7 (HEAD ->
> > chuck-rpc-with-tls-04032023, chuck/topic-rpc-with-tls-upcall) but the
> > client is still crashing but looks like in a different place. This
> > happens when the server terminates the connection (immediately) as the
> > tls handshake happens.
>
> Why is the server doing that?

I'm not sure what kind of a reason you are looking for. I think the
server can send an RST at any point in a TCP connection and the client
shouldn't crash. But the real reason is probably because the server's
code is getting developed and they ran into some error and resetting
the connection.

> > Here's the stack trace:
> > [  677.274299] BUG: kernel NULL pointer dereference, address: 000000000=
0000030
> > [  677.274424] #PF: supervisor read access in kernel mode
> > [  677.274517] #PF: error_code(0x0000) - not-present page
> > [  677.274609] PGD 0 P4D 0
> > [  677.274689] Oops: 0000 [#1] PREEMPT SMP PTI
> > [  677.274785] CPU: 0 PID: 518 Comm: kworker/u2:29 Kdump: loaded Not
> > tainted 6.3.0-rc4+ #13
> > [  677.274881] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
> > Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/2020
> > [  677.274981] Workqueue: xprtiod xs_tls_connect [sunrpc]
> > [  677.275137] RIP: 0010:handshake_req_cancel+0x2b/0x3b0
>
> scripts/faddr2line on this RIP
>
> Which pointer is NULL?

I apologize I don't have that info and I'm working on trying to figure
out how to get this information to you. Lab kernels are built with
CONFIG_DEBUG_INFO disabled and thus I can't do faddr2line. I will
attempt to build on with debugging enabled (has been problematic
before for the lab machines so not sure if that'll be successful I
might have to hack the linux kernel to simulate the reset).


> > [  677.275269] Code: 0f 1e fa 0f 1f 44 00 00 41 57 41 56 41 55 41 54
> > 55 53 48 83 ec 28 48 8b 6f 18 65 48 8b 04 25 28 00 00 00 48 89 44 24
> > 20 31 c0 <48> 8b 5d 30 48 89 6c 24 18 e8 97 15 5f ff 4c 8b 25 50 2e 70
> > 01 41
> > [  677.275474] RSP: 0018:ffffaed400f6fcf8 EFLAGS: 00010246
> > [  677.275570] RAX: 0000000000000000 RBX: ffff93f085b33800 RCX: 0000000=
000000000
> > [  677.275663] RDX: ffff93f085b33f08 RSI: ffffaed400f6fd18 RDI: ffff93f=
083aa6700
> > [  677.275756] RBP: 0000000000000000 R08: ffff93f137e32968 R09: 0000009=
d9663fa40
> > [  677.275850] R10: 0000000000000000 R11: 0000009d9663fa40 R12: ffff93f=
083aa6700
> > [  677.275943] R13: 0000000000000000 R14: ffff93f082999e00 R15: ffff93f=
085b33800
> > [  677.276049] FS:  0000000000000000(0000) GS:ffff93f137e00000(0000)
> > knlGS:0000000000000000
> > [  677.276154] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  677.276247] CR2: 0000000000000030 CR3: 000000010797c002 CR4: 0000000=
0007706f0
> > [  677.276355] PKRU: 55555554
> > [  677.276427] Call Trace:
> > [  677.276521]  <TASK>
> > [  677.276605]  ? wait_for_completion_interruptible_timeout+0xfa/0x170
> > [  677.276725]  xs_tls_handshake_sync+0x14f/0x170 [sunrpc]
> > [  677.276850]  ? __pfx_xs_tls_handshake_done+0x10/0x10 [sunrpc]
> > [  677.276967]  xs_tls_connect+0x14c/0x590 [sunrpc]
> > [  677.277086]  process_one_work+0x1b0/0x3c0
> > [  677.277209]  worker_thread+0x34/0x360
> > [  677.277303]  ? __pfx_worker_thread+0x10/0x10
> > [  677.277396]  kthread+0xdb/0x110
> > [  677.277527]  ? __pfx_kthread+0x10/0x10
> > [  677.277619]  ret_from_fork+0x29/0x50
> > [  677.277731]  </TASK>
> > [  677.277803] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> > dns_resolver nfsv3 nfs_acl nfs lockd grace fscache netfs ext4 mbcache
> > jbd2 loop rfkill vsock_loopback vmw_vsock_virtio_transport_common
> > vmw_vsock_vmci_transport vsock sunrpc vfat fat dm_multipath
> > intel_rapl_msr intel_rapl_common isst_if_mbox_msr isst_if_common nfit
> > libnvdimm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel rapl
> > vmw_balloon joydev pcspkr vmw_vmci i2c_piix4 xfs libcrc32c vmwgfx
> > drm_ttm_helper ttm sr_mod cdrom drm_kms_helper syscopyarea sysfillrect
> > sd_mod ata_generic sysimgblt sg ata_piix ahci libahci crc32c_intel
> > serio_raw drm vmxnet3 vmw_pvscsi libata dm_mirror dm_region_hash
> > dm_log dm_mod nvme_tcp nvme_fabrics nvme_core t10_pi crc64_rocksoft
> > crc64 ipmi_devintf ipmi_msghandler fuse
> > [  677.278383] CR2: 0000000000000030
> >
> > Network trace from the server:
> >
> > [kolga@scs000085536 ~/pcaps]$ tshark -t ad -r e0d_20230404_084311.trc0
> >    1 2023-04-04 08:43:28.027546 10.235.232.77 =E2=86=92 10.63.20.131 TC=
P 74
> > 727 =E2=86=92 2049 [SYN] Seq=3D0 Win=3D64240 Len=3D0 MSS=3D1460 SACK_PE=
RM=3D1
> > TSval=3D4059503415 TSecr=3D0 WS=3D128
> >    2 2023-04-04 08:43:28.027645 10.63.20.131 =E2=86=92 10.235.232.77 TC=
P 74
> > 2049 =E2=86=92 727 [SYN, ACK] Seq=3D0 Ack=3D1 Win=3D65535 Len=3D0 MSS=
=3D1460 WS=3D256
> > SACK_PERM=3D1 TSval=3D2256845073 TSecr=3D4059503415
> >    3 2023-04-04 08:43:28.027813 10.235.232.77 =E2=86=92 10.63.20.131 TC=
P 66
> > 727 =E2=86=92 2049 [ACK] Seq=3D1 Ack=3D1 Win=3D64256 Len=3D0 TSval=3D40=
59503415
> > TSecr=3D2256845073
> >    4 2023-04-04 08:43:28.027952 10.235.232.77 =E2=86=92 10.63.20.131 NF=
S 110
> > V4 NULL Call
> >    5 2023-04-04 08:43:28.028301 10.63.20.131 =E2=86=92 10.235.232.77 NF=
S 102
> > V4 NULL Reply (Call In 4)
> >    6 2023-04-04 08:43:28.028563 10.235.232.77 =E2=86=92 10.63.20.131 TC=
P 66
> > 727 =E2=86=92 2049 [ACK] Seq=3D45 Ack=3D37 Win=3D64256 Len=3D0 TSval=3D=
4059503416
> > TSecr=3D2256845073
> >    7 2023-04-04 08:43:28.331181 10.63.20.131 =E2=86=92 10.235.232.77 TC=
P 66
> > 2049 =E2=86=92 727 [RST, ACK] Seq=3D37 Ack=3D45 Win=3D0 Len=3D0 TSval=
=3D2256845383
> > TSecr=3D4059503416
> >
> >
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
