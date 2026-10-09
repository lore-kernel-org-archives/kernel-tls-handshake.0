Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453C2D7DDB
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  9 Oct 2026 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509849; cv=pass; b=k97rRZ0sDRTLobtql3+1na/rRpmzyzbiJYC1qbXcK3IymstNvDM7I9Yya7bN/pGqFQIYIooY119rSwl5afBwH+/XVpeQSBa6EcBSNSubTI7fs2gvUTSashoYDLU6hDJijUsH4IRXZAgLoBq6K05M38S2vZibaMbZGEODtmG5CA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509849; c=relaxed/simple;
	bh=qqrGdSenX4SVSj1K5f+rL/qP4RwvggCoy+ql2fHSYTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP4kIWI/TCTCsmZWSkpKhQV//fsHdpZk5ocPd+aZ46znlSrv9gOMbAWUBUISB5NFSNCkV0dW8U68rA5HBrcDEn8P9YnSlJxLRpsfM0wZoOE7g0HlfJIcRMF/ksX5pRHv4JSW8ezugVhU1WeiR25zB91t/Ami0iSE0AeekZZaFCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ud5ATOr9; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ud5ATOr9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-873a4edb243so4247748b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Oct 2026 18:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791509846; cv=none;
        d=google.com; s=arc-20260327;
        b=EHK+EBqLhaDJsindvcQXOn92qw7BEMOlZ67N9gt7t8bYEhSScv7Q3zuTfnYW7wy9ex
         0fAgl9GwMYX5hxcbwdOZk3i0ZBGh8g/Qh1dBprVWdjTB32n53gxf5rkSf1ybIJJH+9pn
         pxDdkZyDRWZ4vzDSeTtqUQdpwfpov83Gfu+SBXYWrd9DuWIByBb5bLDjuq9wD1NvHvI+
         d0XJqyihxUVbxaBQa4pizodO3+GCkYIZOjusdETT/8ACKqY5CWIK0yjP7VvU0TtU6NjC
         8VqhQt7H8UTvybkyGLJ8sxPI77ajTKTyozvPFX/7jrmnT3OhAqjBj2P6h5aAcAZyLhNB
         F8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYTfTihuDNu0+MHHnRFjtBs9vXdp0XPGsbVC8uxkTIg=;
        fh=Or7O5wQx+JYxlhdAGDrHyCinrC9dpEziIZ9c1ht6uc4=;
        b=rKIHu4HrjAlN0d/5uJyg6OoiqZFNUvTqc4fKfJxVpYj+CtyApx5rWD1fOTigZLFjXn
         0i1E0od2apYlvu1lZ8r9tjrY1CFxVQuDUbU6MJrZAXF+Nvt6kXiggPiR7agvtC6JQnhZ
         f9G/DgDRChhR4beVsDwE5HkOkuU5eraVZnm9tSmjEf8Uej+eoNwQ1QZy8/3/3rsl9q0N
         bju5akUuC6IJ8kDYwKejgGAdc5FGs7uvensjtF7/Y6KwSzMQKBCptgCTv11Ynp/E/0sV
         qSCSXounjmBHYYTDrXvw1n7VuYnm78OaxWGETz3R5qSe6O70NOxNz4kk7Xic4vNe878r
         knBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791509846; x=1792114646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYTfTihuDNu0+MHHnRFjtBs9vXdp0XPGsbVC8uxkTIg=;
        b=Ud5ATOr9Cui3vO5DWOPFm3zcravHWoLQPzhsRdiJaSybefTPXuB+j5IoHL1bENU1zh
         3aIq6tRNQh9yoYhDTRbUI0PulY/4IxySRUeznuCYnWC2FV+Hyp7Ki7ea5tvUwOMGB6tX
         SQ56Ym987lmCeOQc56sZoBgR//gKdo1Kh8HLXbr0+wya4MTIs2Xs4qPes/FW4UGWahd6
         spS48bs+ZN9Iv+kxA8oMJUkHm86n7rRvEfVKbDon/fL2pEO3X+F96P0Jw3a3hceZtkHw
         JxNlemCMTJmdNv7DP2cvWcdKnE/OvG0AOh7Ic1T+U31Ysk3c0R3ptb+4OgkPCB2MiNnN
         w5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791509846; x=1792114646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYTfTihuDNu0+MHHnRFjtBs9vXdp0XPGsbVC8uxkTIg=;
        b=BkBCqMwzJfC/TPyKe4F5MufZJItlC2V2Quc+0HucUbv3TqTDVB1Z5ZYnpYfccIctX6
         J783ErdK2UVoN7PJG/PhfMysJymiiaevr1P4TvDT5LrV4gNKL5vF7nl6MNdJXhKZZAIJ
         9pGxcNwbloR73ZOmTognaIo6UXjr1sRA5jXWjavt5buTDGnihVgyiOaX+G0mOAMi1qzk
         bXX9jrYOgi2VMn4sJgU6Jy8MwOseigL5XLtLOOX90wXVFZiXHDmAL4ND90GlD2Ndv4cs
         vG3Znw1zsWweU3WnmcJuG6tPlb7WFnQZbXMfsOOWoATQRmzmLrcxLOdGPAxs1dPomFKv
         fMMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyr31c9fi43Csbut5wxGeIV7ngjAcmRKD5ncTfcsHYJPsc4NIJMRoz9tDdz3Kl/MihH1J9/YMNwCXHct9p2mVoFFqxOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJa+7hzBPPfWlGKxV8qS5ZrrlZI4C/DP5DfvzG6bvoov6pZC94s
	2PZ769ref6WB1ixoCTxtlKpPuRFWrOsHW9Vu4nr/bKLF3x4JRQO9ApoXZnUkzxe+xG2gK45T1aH
	dVZbmHf/nAvSvtWeoB/o6ev9mXSMio9g=
X-Gm-Gg: AYBFou27U/gkyzFCruNngTx/BsvwWNTQQ6mjcCSd1ORn2EWbiEuhfoH0JM7hbtdG61I
	IXtZrOvCeOnOd3q/PoWBcgtgLxOJV3nZ1BFqOhxoOQHioLrIjaRUZ9jpQjaqrmCHiQcRQweVXoe
	2gfVPvVy9l3jts0MUQM97lXABt3vKoKJhLGkEjq7ZVOxzOnyZwnfa5PWkBUWeMpsAGWGqtu5vqk
	zjs+nzDVm3WWULhxyeUdEm31j2uPEtio+9p/RNZVVns6mVV3IGTtEA5KPuUvbc2EIDh24kOQaT9
	vdPbIuPCRUpMUh+pd2exHTsiguRJV02XhulJu1xbDEvZWy4H57E329wYdeLuArgr4vwkWqHhsUD
	AtmlMFb+KppkoDOfo73vNix2Uu7fzEh5of1t9r4mKMBQb0F1441oS
X-Received: by 2002:a05:6a00:4fc1:b0:878:3783:8a88 with SMTP id
 d2e1a72fcca58-897c81b63fdmr284406b3a.52.1791509846329; Thu, 08 Oct 2026
 18:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ab05ff56b186e6aa6fcef9ad292b79e7ab8d5020.1791227050.git.lucien.xin@gmail.com>
 <179133511349.434549.8476083447465312043@kernel.org>
In-Reply-To: <179133511349.434549.8476083447465312043@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Oct 2026 21:37:14 -0400
X-Gm-Features: AclHuK-kRaxAlwalmgzg5rRdj5N_Lo8XSqcs8B7WSOEnGMv1nB4r29FhIqrB5aM
Message-ID: <CADvbK_fweayTqok27G1iMwKu3BsDP_0w63ZW1MvpPE51Aj0czg@mail.gmail.com>
Subject: Re: [PATCH net-next v16 08/15] quic: add path management
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 9:05=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 9 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 4 =C2=B7 Low: 4
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Pending UDP tunnel socket releases are not tied to netns
>   teardown, so they can write to freed per-netns memory.
> - [Medium] quic_udp_sock_create() does not keep an explicitly disabled
>   IPV6_V6ONLY setting.
> - [Medium] A dual-stack QUIC socket can reuse an existing IPv6-only UDP
>   tunnel socket.
> - [Medium] quic_udp_sock_create() ignores IP_FREEBIND (and
>   IP_TRANSPARENT) set on the QUIC socket.
> - [Medium] quic_path_bind() uses two different ideas of 'owner' when
>   deciding who may share a tunnel.
> - [Low] quic_path_bind() reads sk->sk_uid and us->sk->sk_uid with plain
>   loads, bypassing the sk_uid() accessor in include/net/sock.h:2162-2166.
> - [Low] The commit message contradicts the code it adds.
> - [Low] The quic_path_detect_alt() comment says it 'Returns true if a new
>   alternate path was detected and updated' and that it 'updates the=E2=80=
=A6
> - [Low] quic_path_pl_toobig() prints its u32 pmtu argument with "ptb:
>   %d".
>
> --
>
> quic: add path management
>
> This patch adds struct quic_path_group and struct quic_path to manage up
> to two paths per connection. Each path is backed by a UDP tunnel socket
> that can be shared, is wrapped in quic_udp_sock and is kept in a global
> hash table. It adds bind, unbind, swap and alternate path detection
> helpers, plus basic PLPMTUD state handling for probes, acks and ICMP
> Packet Too Big messages.
>
> > - quic_path_pl_send(): state transition and pmtu update after sending a
> >   probe packet.
>
> [Severity: Low]
> Is "after sending" accurate here? The kernel-doc for quic_path_pl_send()
> added in this same patch says:
>
>  * Called right before sending a probe packet in QUIC Path MTU Discovery.
>
> The v16 changelog says the "after" wording was inaccurate, but only the
> code comment was updated.
>
> The probe_count / QUIC_MAX_PROBES accounting assumes the call comes befor=
e
> transmission. A caller that follows the commit text would be off by one.
>
> Several lasting changes are described only in the changelog below the
> "---" line:
>
>   - the module-wide quic_wq workqueue and its init/exit handling
>   - the path_seq seqcount write side in quic_path_swap(), plus
>     quic_path_init()
>   - the port sharing policy in quic_path_bind(): same uid reuse,
>     -EADDRINUSE for a different uid, -EAGAIN during teardown, and
>     CAP_NET_BIND_SERVICE for privileged ports
>
> Could these go into the commit message itself?
>
> > - quic_path_detect_alt(): Determine if a packet is using an alternative
> >   path, used for connection migration.
>
> quic_path_detect_alt() also writes the candidate addresses into path[1].
> This description doesn't say so.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..b6bea7d2f2673
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,593 @@
>
> [ ... ]
>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk,
> > +                                               union quic_addr *a)
> > +{
>
> [ ... ]
>
> > +     quic_udp_conf_init(sk, &udp_conf, a);
> > +     err =3D udp_sock_create(net, &udp_conf, &sock);
> > +     if (err) {
> > +             pr_debug("%s: failed to create udp sock\n", __func__);
> > +             kfree(us);
> > +             return ERR_PTR(err);
> > +     }
>
> [Severity: Medium]
> Is an IPV6_V6ONLY of 0 on the QUIC socket kept when the tunnel is created=
?
>
> quic_v6_udp_conf_init() passes the QUIC socket's setting:
>
>     conf->ipv6_v6only =3D ipv6_only_sock(sk);
>
> udp_sock_create6() only acts on it when the flag is true:
>
>     if (cfg->ipv6_v6only) {
>         err =3D ip6_sock_set_v6only(sock->sk);
>
> Otherwise the new kernel socket keeps the default it got in
> inet6_create():
>
>     sk->sk_ipv6only =3D READ_ONCE(net->ipv6.sysctl.bindv6only);
>
> Take a netns with net.ipv6.bindv6only=3D1 and a QUIC socket that sets
> IPV6_V6ONLY to 0 and binds [::]:P. It gets an IPv6-only UDP tunnel.
> quic_path_bind() succeeds, but IPv4 packets would never reach the
> socket.
>
> This stays latent until quic_path_bind() gets a caller.
>
True.

Will set sock->sk->sk_ipv6only =3D 0; after udp_sock_create() unconditional=
ly.

> [Severity: Medium]
> Can IP_FREEBIND or IP_TRANSPARENT on the QUIC socket have any effect
> here? udp_port_cfg has no freebind field, and quic_v4_udp_conf_init()
> copies only:
>
>     conf->family =3D AF_INET;
>     conf->local_ip.s_addr =3D a->v4.sin_addr.s_addr;
>     conf->local_udp_port =3D a->v4.sin_port;
>     conf->bind_ifindex =3D sk->sk_bound_dev_if;
>
> udp_sock_create4() and udp_sock_create6() bind the new kernel socket
> right away. __inet_bind() then checks inet_can_nonlocal_bind() against
> that new socket's own flags:
>
>     return READ_ONCE(net->ipv4.sysctl_ip_nonlocal_bind) ||
>         test_bit(INET_FLAGS_FREEBIND, &inet->inet_flags) ||
>         test_bit(INET_FLAGS_TRANSPARENT, &inet->inet_flags);
>
> Assume ip_nonlocal_bind=3D0. A QUIC socket sets IP_FREEBIND through
> quic_setsockopt()->quic_common_setsockopt()->ip_setsockopt() and binds a
> non-local address. Whenever a new tunnel has to be created,
> quic_path_bind() would then return -EADDRNOTAVAIL.
>
> The patch notes say quic_get_user_addr() will accept such an address
> based on that flag. That check and this bind would disagree.
>
True.

But this can't be avoided until a parameter is exposed to struct
udp_port_cfg for it.

> [ ... ]
>
> > +static void quic_udp_sock_put(struct quic_udp_sock *us)
> > +{
> > +     /* The UDP socket may be freed in atomic RX context during connec=
tion
> > +      * migration; defer the release to a workqueue.
> > +      */
> > +     if (refcount_dec_and_test(&us->refcnt))
> > +             queue_work(quic_wq, &us->work);
> > +}
>
> [Severity: High]
> Can this deferred release run after the netns pernet exit methods have
> freed per-netns state?
>
> quic_destroy_sock()
>   quic_path_unbind()
>     quic_path_set_udp_sk(path, NULL)
>       quic_udp_sock_put()
>         queue_work(quic_wq, &us->work)
>
> The QUIC user socket is then freed and drops its active netns
> reference. If that was the last one, cleanup_net() runs the pernet exit
> methods.
>
> quic_net_exit() doesn't flush quic_wq or wait for this namespace's
> pending releases. Nothing orders quic_wq against the netns cleanup
> workqueue.
>
> So quic_udp_sock_put_work() could run after sock_inuse_exit_net() has
> done:
>
>     free_percpu(net->core.prot_inuse);
>
> If udp_child_hash_entries is set, it could also run after
> udp_pernet_table_free() has freed net->ipv4.udp_table. The work then
> reaches:
>
> quic_udp_sock_put_work()
>   udp_tunnel_sock_release()
>     sock_release()
>       inet_release()
>         udp_lib_close()
>           sk_common_release()
>             udp_lib_unhash()
>               sock_prot_inuse_add(net, sk->sk_prot, -1);
>
> That writes to the freed percpu area and takes hslot spinlocks in the
> per-netns udp_table.
>
> This is a separate issue from the lifetime of struct net. The passive
> reference held by kernel sockets keeps the struct net allocation alive.
> It doesn't stop the pernet exit methods from freeing these per-netns
> pieces.
>
> Other kernel UDP tunnel users such as vxlan, geneve, tipc and rxrpc
> release their kernel sockets from pernet exit. Later in the series,
> quic_net_ops still has only .init and .exit, and quic_net_exit() is
> unchanged.
>
> [ ... ]
>
> > +     hlist_for_each_entry(us, &head->head, node) {
> > +             if (net !=3D sock_net(us->sk))
> > +                     continue;
> > +             if (a) {
> > +                     if (quic_cmp_sk_addr(us->sk, &us->addr, a) &&
> > +                         us->bind_ifindex =3D=3D quic_get_dev_if(sk, a=
))
> > +                             return us;
>
> [Severity: Medium]
> Could a dual-stack QUIC socket end up sharing an IPv6-only tunnel here?
> When both addresses are AF_INET6 wildcards, quic_v6_cmp_sk_addr()
> returns:
>
>     if (ipv6_addr_any(&addr->v6.sin6_addr))
>         return ipv6_addr_any(&a->v6.sin6_addr);
>
> ipv6_only_sock() is only checked when the address families differ.
>
> Suppose QUIC socket A with IPV6_V6ONLY=3D1 creates a tunnel on [::]:P.
> QUIC socket B, same uid, with IPV6_V6ONLY=3D0, then binds [::]:P. B reuse=
s
> A's v6-only tunnel and quic_path_bind() returns 0.
>
> IPv4 lookups skip ipv6_only_sock() sockets, so B would never receive
> IPv4 traffic. The same bind on plain UDP sockets would have failed with
> EADDRINUSE.
>
True.

But the same as the 1st one above.

> [ ... ]
>
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
> > +                     if (!uid_eq(sk->sk_uid, us->sk->sk_uid)) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EADDRINUSE;
> > +                     }
>
> [Severity: Medium]
> Are these two uids measuring the same owner? The tunnel's sk_uid comes
> from the kernel socket created in quic_udp_sock_create():
>
> udp_sock_create()->sock_create_kern()
>   sock_alloc():
>       inode->i_uid =3D current_fsuid();
>   sock_init_data():
>       sk_uid taken from SOCK_INODE(sock)->i_uid
>
> So the tunnel owner is the fsuid of the task calling bind() at that
> time. sk->sk_uid on the QUIC socket comes from its own inode at socket()
> time and is updated by fchown().
>
> The two differ in any of these cases:
>
>   - the QUIC fd was passed over SCM_RIGHTS
>   - the QUIC fd was fchown()ed
>   - the task changed fsuid between socket() and bind()
>
> Then a socket owned by the original owner gets a spurious -EADDRINUSE.
> Sockets whose sk_uid matches the first binder's fsuid are allowed to
> share.
>
True.

Will change to check (!uid_eq(current_fsuid(), us->sk->sk_uid)) instead.

Thanks.

> [Severity: Low]
> This isn't a bug, but should these reads use the sk_uid() accessor? It
> is documented as paired with the WRITE_ONCE() in sockfs_setattr(), and
> quic_v4_flow_route() and quic_v6_flow_route() already use it. Without
> it, KCSAN would report a concurrent fchown() on the QUIC fd:
>
>     if (!uid_eq(sk_uid(sk), sk_uid(us->sk))) {
>
> [ ... ]
>
> > +/* Detects and records a potential alternate path.
> > + *
> > + * If the new source or destination address differs from the active pa=
th, and
> > + * alternate path detection is not disabled, the function updates the =
alternate
> > + * path slot (path[1]) with the new addresses.
> > + *
> > + * This is typically called on packet receive to detect new possible n=
etwork
> > + * paths (e.g., NAT rebinding, mobility).
> > + *
> > + * Returns true if a new alternate path was detected and updated, fals=
e
> > + * otherwise.
> > + */
> > +bool quic_path_detect_alt(struct quic_path_group *paths, union quic_ad=
dr *sa,
> > +                       union quic_addr *da, struct sock *sk)
> > +{
>
> [ ... ]
>
> > +     if (!quic_path_saddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_saddr(paths, 1, sa);
> > +
> > +     if (!quic_cmp_sk_addr(sk, quic_path_saddr(paths, 1), sa))
> > +             return false;
> > +
> > +     if (!quic_path_daddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_daddr(paths, 1, da);
> > +
> > +     return quic_cmp_sk_addr(sk, quic_path_daddr(paths, 1), da);
> > +}
>
> [Severity: Low]
> Does the comment match the return value? path[1].saddr and daddr are
> only written while their sin_port is still 0.
>
> If path[1] is already filled in and simply matches (sa, da), this
> returns true even though nothing new was detected or updated.
>
> [ ... ]
>
> > +u32 quic_path_pl_toobig(struct quic_path_group *paths, u32 pmtu,
> > +                     bool *reset_timer)
> > +{
> > +     u32 pathmtu =3D 0;
> > +
> > +     pr_debug("%s: paths: %p, state: %d, pmtu: %d, size: %d, ptb: %d\n=
",
> > +              __func__, paths, paths->pl.state, paths->pl.pmtu,
> > +              paths->pl.probe_size, pmtu);
>
> [Severity: Low]
> This isn't a bug, but pmtu is a u32 taken from the remote ICMP or ICMPv6
> Packet Too Big message. Should this be "ptb: %u"? Values above INT_MAX
> would print as negative numbers.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1791227050.git.lucien.xin%40gmail.com
