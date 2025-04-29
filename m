Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E680D2FB
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Apr 2025 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940176; cv=none; b=Iy2PnFmKRUeBRCpQHLDn7H2gh1MnAqZDKBSLiR+1ur0F+4RnrtympLnwPq3MWU+XprkfYGmF0LN1v+LS3HrdSXh7to4ldf24ABZ8MXcNdLJeTWOgmLkunXViIq9ON0AUsr9MGNrep6jVkjxAbMwMS17jcDhZsa1m39xdeCVNMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940176; c=relaxed/simple;
	bh=3/dikogmpnIZToX1d8KEPa4vdbNFdXhKruFiiE5U8k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LikIoNB3DhcMzrXdnwrIy1vFQtw7mzb3lHDDK4UaBrzM2ESxuFe5beDA0MqcVaNfx9Kb94FIhk8naTpcqfs+vW9SbXGZNmenDNwEjq9KpgIGQDXLQSS97J4igs9xG7uCMla8CwLupN1M1pn6Yc1V9SMipWtvTgSkxhLP7S/rDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv215PjO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv215PjO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so9922910a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Apr 2025 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940172; x=1746544972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMHGmY9jx1nK5GVeT3TAnqQv1dpKtfLeGSN1Hs+mwo0=;
        b=Pv215PjOZySnYJ2TuCEkCqQulEbS/D1lPaheU1lgCVWqaS2zzkcmbXw51FdIvz5Hc+
         PlVKlCRcDgYK7XXiAkxbeXWB+Pg5UQrSsYB8TLXNxiAm29npxKwUuWu+dQIRNGfPcexf
         dFX6zqWk49TiBC66ioSgees7sFsNZVCJsuBqmYFRy1hrVVMeFTpkNflZXM0dtaNfxC/z
         HdBLO3QxWD7rhf6cpJICjTV6iaV6P7YKhIXGJy0aqKm4uF8UyMczFYloUux7d4ikAm0r
         DUxQ6hRc/p2D94RB5FW/IJ2B0SY0S9r9hN9Nqe2ZLhB4npmnXDKLSh9CghLa2csifY93
         Rfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940172; x=1746544972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMHGmY9jx1nK5GVeT3TAnqQv1dpKtfLeGSN1Hs+mwo0=;
        b=FucplksZcjAKQtkVBD94C/omqUth9cuhnYt79ndue6k7DEdy/q6swFx1/o3M/9KohN
         6JtYf7MveYTtcs5eQPhrtLRINcwgrnazVlapsefzkXv7gDxIrtGcR1l82u3G78FuxfOy
         p0A/+UIB4f0spZstUJXNcJfppCdljOgYqr7CzWwVIlhb1h4WJbdfwkCqJ9jXwrlRgjPI
         tTb8PqLwmAbdg5sf9AUGPQ0aVecOgyBm/KT1sJ5cOZwrlzD4KFeEDSEU8QEwa5t/gMAt
         lVoMBwX4Q/RIwFZB/ykay9LIJAou3CkiwwZK7vFPdqtdRVPgHkplD1n5KuDWDuGLvRc3
         Psuw==
X-Gm-Message-State: AOJu0YxhZqfESTfpmhCXtMHEMxY1RQm/KWwu7TITtYKILR914LsLc/u5
	emHsgWo4D4wMJWT5XQLBrhBltldBXU+6LMDD0S0+NiJmnSJWkQiMdkaGKWh0XeaK+2mhf3iZwXH
	mmcdZj4i3kJs23hKIfAA2dtpscydRmIwx
X-Gm-Gg: ASbGnctHMTL6p4UecfcNn9Z1XBOyAG+GW+wdFAof5S0f5rIc/0+xj+yHTYA9pSSGR9m
	rLY0AqWSS8LOcBJxLdfkT2I/UtRJHevgShH/vaWOnp0vq8Jy1loQCfzuxXYXdahGA+A80v2pyg9
	vzaQc6ApQ5yAxuR+jTufdOvLqXT2W5lxsv8ziIPiS59NMUszNv8cU9SmOX7Tg+5rGDZQ==
X-Google-Smtp-Source: AGHT+IGPmjNTBF3rp5CBko97MBXQnlHhmvNsoz7s3AKg1qMTqScebLfy8Olc8CNj/MUpaGjUuqVCZ0agA5ruVP6o0J8=
X-Received: by 2002:a05:6402:234d:b0:5f4:370d:96bc with SMTP id
 4fb4d7f45d1cf-5f83809e3c1mr3065826a12.2.1745940171986; Tue, 29 Apr 2025
 08:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
 <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com> <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
 <71f137db-f013-4530-a4c6-601fea874e1f@oracle.com> <CAPVZmxztn9qmi81ntcYNW0+jrM3rxRG2o8etD5TRpZCttD18yg@mail.gmail.com>
 <35503c1d-4170-4e3f-acbf-890572e7325f@oracle.com> <CAPVZmxxDA00bY715jgKJ80s8dbbtbLozj4qTzOb7_JwZEgZpaw@mail.gmail.com>
 <2b5b9a52-0ccc-4d1c-9496-860c8271c62b@oracle.com>
In-Reply-To: <2b5b9a52-0ccc-4d1c-9496-860c8271c62b@oracle.com>
From: Steve Sears <sjsorca@gmail.com>
Date: Tue, 29 Apr 2025 11:22:40 -0400
X-Gm-Features: ATxdqUHP_fPs1Sz6yss5cb1EFsoSvqV9NZUxUFlHC22ZdtOS7KZz7wIqPHJEkoc
Message-ID: <CAPVZmxyGW+yYw0p7LsNvCanWm49wsFOc68yqwZOpS9gZEhfDAw@mail.gmail.com>
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:40=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 4/29/25 7:04 AM, Steve Sears wrote:
> > On Mon, Apr 28, 2025 at 2:12=E2=80=AFPM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 4/28/25 2:08 PM, Steve Sears wrote:
> >>> On Mon, Apr 28, 2025 at 2:00=E2=80=AFPM Chuck Lever <chuck.lever@orac=
le.com> wrote:
> >>>>
> >>>> On 4/28/25 12:54 PM, Steve Sears wrote:
> >>>>> On Sun, Apr 27, 2025 at 11:35=E2=80=AFAM Chuck Lever <chuck.lever@o=
racle.com> wrote:
> >>>>>>
> >>>>>> On 4/24/25 2:03 PM, Steve Sears wrote:
> >>>>>>> Originally posted to the ktls-utils list and Chuck Lever recommen=
ded
> >>>>>>> this list is more germaine to the problem I am trying to solve.
> >>>>>>>
> >>>>>>> I am implementing the NFS server side of a TLS connection using t=
he
> >>>>>>> OpenSSL library. There may be a bug in my implementation, but it =
isn't
> >>>>>>> obvious given the data so I am reaching out to this list. Please
> >>>>>>> respond if the problem sounds familiar or if you have ideas on ho=
w to
> >>>>>>> pursue it.
> >>>>>>>
> >>>>>>> Here are some key datapoints:
> >>>>>>> - Using a Linux 6.12.16-2 client
> >>>>>>> - sudo mount -o xprtsec=3Dtls,vers=3D4.2,hard,acregmin=3D0,acregm=
ax=3D0
> >>>>>>> testmachine.lab.space:/share1 /mnt/share1/
> >>>>>>> - Looking at tlshd logs: the handshake always works. Always.
> >>>>>>> - The client will hang on the mount most of the time, but maybe 1=
/50
> >>>>>>> or so it works fine. And when the mount succeeds everything conti=
nues
> >>>>>>> to work great and tcpdump shows all TLS 1.3 packets, etc.
> >>>>>>> - The hang appears to be from an rpc_ping() when the rpc null rep=
ly is
> >>>>>>> not processed.
> >>>>>>
> >>>>>> Hi Steve -
> >>>>>>
> >>>>>> What does this mean, exactly? Which side is not processing the pin=
g?
> >>>>>> If the ping does not work, then operation on the connection will n=
ot
> >>>>>> proceed.
> >>>>>
> >>>>> It is unclear if I am looking at the right problem, I am still tryi=
ng
> >>>>> to understand how the client works. The client sends two rpc null
> >>>>> requests: an AUTH_TLS and an AUTH_SYS. The AUTH_TLS is received on =
the
> >>>>> server and a reply sent, and the client sees the reply and does the
> >>>>> TLS handshake successfully. This part works every time.
> >>>>>
> >>>>> The, the AUTH_TLS is received on the server and a reply is sent. Th=
e
> >>>>> bpf trace shows the null rpc being sent, but we see no evidence of =
a
> >>>>> reply for this one. Or perhaps more accurately, we see a reply but =
the
> >>>>> client doesn't think it is a reply to the rpc null AUTH_SYS it sent=
.
> >>>>
> >>>> That suggests the server's reply could be malformed.
> >>>
> >>> Thanks, that is useful. The first rpc null arrives and is responded t=
o
> >>> in plain text. Should both rpc nulls be treated the same? The server
> >>> currently encrypts the 2nd one, which might be the issue. Although as
> >>> I mentioned before it works 1/50 or so, which has me scratching my
> >>> head...
> >>
> You could add "-e handshake". I don't see the ping operations here.
> Perhaps the client is re-using an existing connection?
>
>
> --
> Chuck Lever

Rats, I had not noticed I failed to reply to the list.

Here is another trace from the client done immediately after a reboot,
hopefully to eliminate any cache or open connection reuse. The command
was

#  trace-cmd record -e sunrpc -e nfs4 -e nfs -e handshake

The mount command runs in another pty. The trace is stopped while the
mount is hung to eliminate calls to clean up.

I don't see much that is interesting. The only ping reference is an
xprt_ping, which obviously lacks details. I  confirmed with 'trace-cmd
list -f | grep rpc_ping' that rpc_ping should show up with sunrpc, odd
that it is not in the trace.

CPU 3 is empty
cpus=3D4
       mount.nfs-15294 [002]   171.966914: nfs_mount_option:     option sou=
rce
       mount.nfs-15294 [002]   171.966916: nfs_mount_option:     option xpr=
tsec
       mount.nfs-15294 [002]   171.966917: nfs_mount_assign:
option xprtsec=3Dtls
       mount.nfs-15294 [002]   171.966918: nfs_mount_option:     option ver=
s
       mount.nfs-15294 [002]   171.966919: nfs_mount_assign:     option ver=
s=3D4.2
       mount.nfs-15294 [002]   171.966919: nfs_mount_option:     option har=
d
       mount.nfs-15294 [002]   171.966920: nfs_mount_option:     option acr=
egmin
       mount.nfs-15294 [002]   171.966921: nfs_mount_option:     option acr=
egmax
       mount.nfs-15294 [002]   171.966922: nfs_mount_option:     option nco=
nnect
       mount.nfs-15294 [002]   171.966922: nfs_mount_assign:
option nconnect=3D4
       mount.nfs-15294 [002]   171.966922: nfs_mount_option:     option add=
r
       mount.nfs-15294 [002]   171.966923: nfs_mount_assign:
option addr=3D10.200.107.13
       mount.nfs-15294 [002]   171.966924: nfs_mount_option:
option clientaddr
       mount.nfs-15294 [002]   171.966924: nfs_mount_assign:
option clientaddr=3D10.200.107.14
       mount.nfs-15294 [002]   171.966925: nfs_mount_path:       path=3D'/s=
hare1'
       mount.nfs-15294 [002]   171.966945: xprt_create:
peer=3D[10.200.107.13]:2049 state=3DBOUND
       mount.nfs-15294 [002]   171.967066: rpc_clnt_new_err:
program=3Dnfs server=3Dfqdn-server.io error=3D-22
     kworker/2:3-1530  [002]   171.967070: xprt_destroy:
peer=3D[10.200.107.13]:2049 state=3DLOCKED|BOUND
       mount.nfs-15294 [002]   171.967085: xprt_create:
peer=3D[10.200.107.13]:2049 state=3DBOUND
       mount.nfs-15294 [002]   171.967104: rpc_clnt_new:
client=3D00000008 peer=3D[10.200.107.13]:2049 program=3Dnfs
server=3Dfqdn-server.ioxprtsec=3D0x1
flags=3DDISCRTRY|INFINITE_SLOTS|NO_RETRANS_TIMEOUT
       mount.nfs-15294 [002]   171.967107: rpc_task_begin:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3D0x4 status=3D=
0
action=3D(nil)s
       mount.nfs-15294 [002]   171.967108: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Drpc_prepare_task
       mount.nfs-15294 [002]   171.967109: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_start
       mount.nfs-15294 [002]   171.967109: rpc_request:
task:00000001@00000008 nfsv4 NULL (sync)
       mount.nfs-15294 [002]   171.967110: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_reserve
       mount.nfs-15294 [002]   171.967123: xprt_reserve:
task:00000001@00000008 xid=3D0x9cb6506a
       mount.nfs-15294 [002]   171.967123: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_reserveresult
       mount.nfs-15294 [002]   171.967124: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_refresh
       mount.nfs-15294 [002]   171.967124: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_refreshresult
       mount.nfs-15294 [002]   171.967125: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_allocate
       mount.nfs-15294 [002]   171.967129: rpc_buf_alloc:
task:00000001@00000008 callsize=3D56 recvsize=3D32 status=3D0
       mount.nfs-15294 [002]   171.967129: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x4
status=3D0 action=3Dcall_encode
       mount.nfs-15294 [002]   171.967131: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x1c
status=3D0 action=3Dcall_connect
       mount.nfs-15294 [002]   171.967132: xprt_reserve_xprt:
task:00000001@00000008 snd_task:00000001
       mount.nfs-15294 [002]   171.967132: xprt_connect:
peer=3D[10.200.107.13]:2049 state=3DLOCKED|BOUND
       mount.nfs-15294 [002]   171.967134: rpc_task_sleep:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x1c
status=3D0 timeout=3D0 queue=3Dxprt_pending
       mount.nfs-15294 [002]   171.967138: rpc_task_sync_sleep:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3D0x1e
status=3D0 action=3Dcall_connect_status
   kworker/u19:2-150   [002]   171.967145: xprt_create:
peer=3D[10.200.107.13]:2049 state=3DBOUND
   kworker/u19:2-150   [002]   171.967169: rpc_clnt_new:
client=3D00000009 peer=3D[10.200.107.13]:2049 program=3Dnfs
server=3Dfqdn-server.ioxprtsec=3Dnone flags=3D
   kworker/u19:2-150   [002]   171.967170: rpc_task_begin:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3D0x4 status=3D0 action=3D(nil)s
   kworker/u19:2-150   [002]   171.967170: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Drpc_prepare_task
   kworker/u19:2-150   [002]   171.967171: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_start
   kworker/u19:2-150   [002]   171.967171: rpc_request:
task:00000001@00000009 nfsv4 NULL (sync)
   kworker/u19:2-150   [002]   171.967171: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_reserve
   kworker/u19:2-150   [002]   171.967171: xprt_reserve:
task:00000001@00000009 xid=3D0x9671bd5c
   kworker/u19:2-150   [002]   171.967171: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_reserveresult
   kworker/u19:2-150   [002]   171.967171: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_refresh
   kworker/u19:2-150   [002]   171.967172: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_refreshresult
   kworker/u19:2-150   [002]   171.967172: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_allocate
   kworker/u19:2-150   [002]   171.967174: rpc_buf_alloc:
task:00000001@00000009 callsize=3D56 recvsize=3D32 status=3D0
   kworker/u19:2-150   [002]   171.967174: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_encode
   kworker/u19:2-150   [002]   171.967174: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x1c status=3D0 action=3Dcall_connect
   kworker/u19:2-150   [002]   171.967175: xprt_reserve_xprt:
task:00000001@00000009 snd_task:00000001
   kworker/u19:2-150   [002]   171.967175: xprt_connect:
peer=3D[10.200.107.13]:2049 state=3DLOCKED|BOUND
   kworker/u19:2-150   [002]   171.967175: rpc_task_sleep:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x1c status=3D0 timeout=3D0 queue=3Dxprt_pending
   kworker/u19:2-150   [002]   171.967177: rpc_task_sync_sleep:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3D0x1e status=3D0 action=3Dcall_connect_status
   kworker/u19:1-72    [002]   171.967235: rpc_socket_connect:
error=3D-115 socket:[89204] srcaddr=3D10.200.107.14:899
dstaddr=3D10.200.107.13:2049 state=3D2 (CONNECTING) sk_state=3D2 (SYN_SENT)
   kworker/u19:1-72    [002]   171.967236: xprt_release_xprt:
task:ffffffff@ffffffff snd_task:ffffffff
   systemd-udevd-770   [001]   171.967435: rpc_socket_state_change:
socket:[89204] srcaddr=3D10.200.107.14:899 dstaddr=3D10.200.107.13:2049
state=3D2 (CONNECTING) sk_state=3D1 (ESTABLISHED)
   kworker/u18:0-43    [001]   171.967469: rpc_task_wakeup:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3D0x1e status=3D-11 timeout=3D60000 queue=3Dxprt_pending
   kworker/u19:2-150   [002]   171.967486: rpc_task_sync_wake:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x1c status=3D-11 action=3Dcall_connect_status
   kworker/u19:2-150   [002]   171.967486: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x1c status=3D-11 action=3Dcall_connect_status
   kworker/u19:2-150   [002]   171.967487: rpc_connect_status:
task:00000001@00000009 status=3D-11
   kworker/u19:2-150   [002]   171.967487: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|CRED_NOREF
runstate=3DRUNNING|0x1c status=3D0 action=3Dcall_transmit
   kworker/u19:2-150   [002]   171.967487: xprt_reserve_xprt:
task:00000001@00000009 snd_task:00000001
   kworker/u19:2-150   [002]   171.967488: rpc_xdr_sendto:
task:00000001@00000009 head=3D[0xffff8eae9d27c008,40] page=3D0(0)
tail=3D[(nil),0] len=3D40
   kworker/u19:2-150   [002]   171.967504: xprt_transmit:
task:00000001@00000009 xid=3D0x9671bd5c seqno=3D0 status=3D0
   kworker/u19:2-150   [002]   171.967505: xprt_release_xprt:
task:00000001@00000009 snd_task:ffffffff
   kworker/u19:2-150   [002]   171.967505: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x14 status=3D0 action=3Dcall_transmit_status
   kworker/u19:2-150   [002]   171.967506: rpc_task_sleep:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x14 status=3D0 timeout=3D0 queue=3Dxprt_pending
   kworker/u19:2-150   [002]   171.967507: rpc_task_sync_sleep:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3D0x16 status=3D0 action=3Dcall_status
              xz-15292 [001]   171.968111: xs_data_ready:
peer=3D[10.200.107.13]:2049
   kworker/u18:0-43    [001]   171.968135: xprt_lookup_rqst:
peer=3D[10.200.107.13]:2049 xid=3D0x9671bd5c status=3D0
   kworker/u18:0-43    [001]   171.968137: rpc_task_wakeup:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3D0x6 status=3D0 timeout=3D59999 queue=3Dxprt_pending
   kworker/u18:0-43    [001]   171.968142: xs_stream_read_request:
peer=3D[10.200.107.13]:2049 xid=3D0x9671bd5c copied=3D32 reclen=3D32 offset=
=3D32
   kworker/u18:0-43    [001]   171.968144: xs_stream_read_data:
peer=3D[10.200.107.13]:2049 err=3D-11 total=3D36
   kworker/u19:2-150   [002]   171.968148: rpc_task_sync_wake:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_status
   kworker/u19:2-150   [002]   171.968149: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dxprt_timer
   kworker/u19:2-150   [002]   171.968149: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_status
   kworker/u19:2-150   [002]   171.968150: xprt_ping:
peer=3D[10.200.107.13]:2049 status=3D0
   kworker/u19:2-150   [002]   171.968150: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Dcall_decode
   kworker/u19:2-150   [002]   171.968151: rpc_xdr_recvfrom:
task:00000001@00000009 head=3D[0xffff8eae9d27c040,32] page=3D0(0)
tail=3D[(nil),0] len=3D32
   kworker/u19:2-150   [002]   171.968152: rpc_task_run_action:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Drpc_exit_task
   kworker/u19:2-150   [002]   171.968152: rpc_task_end:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Drpc_exit_task
   kworker/u19:2-150   [002]   171.968153: rpc_stats_latency:
task:00000001@00000009 xid=3D0x9671bd5c nfsv4 NULL backlog=3D318 rtt=3D646
execute=3D982 xprt_id=3D6
   kworker/u19:2-150   [002]   171.968154: rpc_task_call_done:
task:00000001@00000009 flags=3DDYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x4 status=3D0 action=3Drpc_tls_probe_call_done
   kworker/u19:2-150   [002]   171.968154: xprt_release_xprt:
task:00000001@00000009 snd_task:ffffffff
   kworker/u19:2-150   [002]   171.968165: handshake_submit:
req=3D0xffff8eae9f1c1e40 sk=3D0xffff8eae864d1300
           tlshd-15296 [002]   171.969156: handshake_cmd_accept:
req=3D0xffff8eae9f1c1e40 sk=3D0xffff8eae864d1300 fd=3D6
          <idle>-0     [001]   172.097756: xs_data_ready:
peer=3D[10.200.107.13]:2049
          <idle>-0     [001]   172.100410: xs_data_ready:
peer=3D[10.200.107.13]:2049
           tlshd-15296 [002]   172.100511: handshake_cmd_done:
req=3D0xffff8eae9f1c1e40 sk=3D0xffff8eae864d1300 fd=3D6
           tlshd-15296 [002]   172.100512: handshake_complete:
req=3D0xffff8eae9f1c1e40 sk=3D0xffff8eae864d1300 status=3D0
   kworker/u19:2-150   [002]   172.100532: xprt_release_xprt:
task:ffffffff@ffffffff snd_task:ffffffff
   kworker/u19:2-150   [002]   172.100533: rpc_socket_connect:
error=3D0 socket:[89204] srcaddr=3D10.200.107.14:899
dstaddr=3D10.200.107.13:2049 state=3D2 (CONNECTING) sk_state=3D1
(ESTABLISHED)
   kworker/u19:2-150   [002]   172.100535: rpc_clnt_shutdown:    client=3D0=
0000009
   kworker/u19:2-150   [002]   172.100536: rpc_clnt_release:     client=3D0=
0000009
   kworker/u19:2-150   [002]   172.100564: xprt_release_xprt:
task:ffffffff@ffffffff snd_task:ffffffff
   kworker/u19:2-150   [002]   172.100566: rpc_task_wakeup:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3D0x1e
status=3D-11 timeout=3D59867 queue=3Dxprt_pending
     kworker/2:3-1530  [002]   172.100573: rpc_clnt_free:        client=3D0=
0000009
     kworker/2:3-1530  [002]   172.100608: xprt_destroy:
peer=3D[10.200.107.13]:2049 state=3DLOCKED|BOUND
       mount.nfs-15294 [000]   172.100668: rpc_task_sync_wake:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x1c
status=3D-11 action=3Dcall_connect_status
       mount.nfs-15294 [000]   172.100670: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x1c
status=3D-11 action=3Dcall_connect_status
       mount.nfs-15294 [000]   172.100671: rpc_connect_status:
task:00000001@00000008 status=3D-11
       mount.nfs-15294 [000]   172.100671: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|CRED_NOREF runstate=3DRUNNING|0x1c
status=3D0 action=3Dcall_transmit
       mount.nfs-15294 [000]   172.100673: xprt_reserve_xprt:
task:00000001@00000008 snd_task:00000001
       mount.nfs-15294 [000]   172.100675: rpc_xdr_sendto:
task:00000001@00000008 head=3D[0xffff8eae9d278808,40] page=3D0(0)
tail=3D[(nil),0] len=3D40
       mount.nfs-15294 [000]   172.100725: xprt_transmit:
task:00000001@00000008 xid=3D0x9cb6506a seqno=3D0 status=3D0
       mount.nfs-15294 [000]   172.100727: xprt_release_xprt:
task:00000001@00000008 snd_task:ffffffff
       mount.nfs-15294 [000]   172.100728: rpc_task_run_action:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x14 status=3D0 action=3Dcall_transmit_status
       mount.nfs-15294 [000]   172.100729: rpc_task_sleep:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF
runstate=3DRUNNING|0x14 status=3D0 timeout=3D0 queue=3Dxprt_pending
       mount.nfs-15294 [000]   172.100731: rpc_task_sync_sleep:
task:00000001@00000008
flags=3DNULLCREDS|DYNAMIC|SOFT|SOFTCONN|SENT|CRED_NOREF runstate=3D0x16
status=3D0 action=3Dcall_status
