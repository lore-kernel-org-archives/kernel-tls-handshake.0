Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57D3FF886
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 Oct 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400296; cv=pass; b=Otfb4Ce2xKwBhWp3T08n3xVnh6QDwoHrqm4y2LgMBADkWbE/ea/n+9Y1m/awziRvdZu0nph7wvEzuVaUn2VpLW4bWtAt2TMIHhlreDn8cExSDTPoARu8xfyT+5oY0VFPYSZpipw1y/RuvfhCUccRKese1XwUsVqe6Rfk07rjMNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400296; c=relaxed/simple;
	bh=Uq+eWqyZKvJSNIM97AyXs9y1buFMWnLvNK6oWzLSQrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFM852i94iPKUH9ojCHPyhYGYc6MpwAO4+4SCkUemY9PEZJLla8AmTgUl4EwteG0+Fdl0H9tuZs7GlMW3y2QN8rhF8+Mag9Bu8AgG/oazLJw+MwLvfCaBkdhsUx65Ltz6qfVeB5R/07fjXm6GOfdmkqHW+uOrrZfC4oe4aIHGpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odL7TQVY; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odL7TQVY"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88aea027391so2309637b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 07 Oct 2026 12:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791400293; cv=none;
        d=google.com; s=arc-20260327;
        b=Phytu7XucDV8ohazwAVyRcWMPbjHQd6A/Kf2WO24alY2lOcG4r0v8tbOB1DslLk2Z1
         e8KH6qYNhj5eKdS/B+sqZHqt49vf2fpFvljibFc7gM1H8vwFRP+02Ta27VYA9M50XvC9
         I7yg6FIbavv3BYvgHHXF6MRvkmU3PLYDmY0mQ1WLvFp0LQ6i4vAU1m+VqFb/iyKuQQyF
         1OFcGC0UQYGXbKblWvCL0ZnuIjXWmYcO/rVaGg1BAgyuGygrm8p9MgOfB0SE6SL2Db1w
         eTf5Rsx2Ro3ceRfFVhPIaZLanDNco9hugT5MsAeQckENfhaebdjlIkF1LHLGwWKMyInX
         xxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KIvA3hMcUdZD52MC6T9uWgxqmVRzVjTIoN5FN/ouXGg=;
        fh=616giAGyn+sjsx8BfhNY3AzRbiTfzI4ftqsK5EJxMZ0=;
        b=fnDs+5Ke94bLgLK9NYjQy7vqsCuJx8PumxfdKUViuXVxaxIEBVBUdWff1oyDhRizwS
         pZfNy/GJYDX3xkSZYTBk9Id8hp0lvgzke6Nb2MR5GxiE4ulpUHQFQWdip4MLLIFhIabN
         oGEcKTY7ycU8kx/3+TR4yBAqVL5PD0LpgKxFiDGPx/f5cHq8x+PSxXjdnMeAyd5KvuMX
         x+tuveGDGoJb2S2pbRJKgZBNHtGfu3GdhwN+n7BlTVQnEUkaDJl2m+Ev0OuVcEiaWAfC
         39r+EW2UwTDi65TsZIlLNMULc4k3w5dS2huhKHITF0ImENy1aQTtlE51VDDymDjIv8NR
         XJaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400293; x=1792005093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIvA3hMcUdZD52MC6T9uWgxqmVRzVjTIoN5FN/ouXGg=;
        b=odL7TQVY7SCNNS5M0JIrIKXQGR4fzjJVLjrOLQdkz1yaXQI2ILKGFU92ZnslUOfv3l
         yeb7wnuCC8TynZGzaJCPZJjzfUdS3VykORwb+Ggq0oO8/XnZJWpVXRadswcWAiXNHAJu
         e2wij2CV+yjatsNRH7sN0kziS0gkmB4P1mrQ2XrzakCyXysskoAg4hvjN4DQJ6KdcR6G
         I5ioUgcH69wu3vl7YNO6zCLjGUR0D5V0JdcCIZN9rsu3JujlEd+ynV5ZTkKU9PfqZPXE
         A642LPGB2Ks9ft/e60CSvJ0WmZSZ3ft3FOv6VR6+gXG24qLjqrS5w4RVK+9C+kSJe0HY
         KZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400293; x=1792005093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIvA3hMcUdZD52MC6T9uWgxqmVRzVjTIoN5FN/ouXGg=;
        b=QzjQbEPqvyZZ91LDuoDM226nwnYZ0H4PfWH2hkNpEGqidJ+J5p1tHfHlUQzV1fRJTy
         sdVvnwoC99RpldYoWN5c7910blwALnVKoaDzS7VqKPYQ18E3nzqN4l1DQ4QMIec3RRUg
         DDbiuC0qHbrIDkYa8lNkG3VAb56p16+BaIfuNR++6PLrwXXjGtCz3Wd/6sKDPG8i0h/5
         eWsP1iJW8nSYSnT1weiiX5AmHIHpe3b66yWecvBB0lX93iUi/RcPr0v3JanzpuanYdTM
         Mv5uZiGvv4Vbr2thie9BBW8cvo3nSP+if0uWxS0Wl02ZkqirEv7QPStqS3VB1h3ZuL0H
         4a0Q==
X-Forwarded-Encrypted: i=1; AKwUvByUBUzGO5kAkQDBNr4YHx1aqVgPkvKeJOG8F2JFeP7IGXag2zyThGpzPdydFTEhM2rPDD1QY30OmBeuKvQBKeNwXZZX6g==@lists.linux.dev
X-Gm-Message-State: AFuF++ksK2AvnDPJaQO1p+Ttonib4N5YL1xGmCngh7ChUdbjv4sznx0f
	E6YQxeniIxCtRCdjJE+u0ueodzZTz0zHsptJ7maMaBl/PdFOqTa1NUClJwhYNLJnRB2ms9aH7K7
	IslgU97VObX5jDqpQCgnGUb519TM6Zo0=
X-Gm-Gg: AYBFou2n/FCo6XsKraot78jl77orgKZOpmUibrbPlRn1m1NQODn6uNCsqtLd/9OVnQY
	J5YpMg8SoiuIi8xtQl7I2SvBYd/eIBy4zyTo9GyBtTJWrNHOE9/UjYNeUQmyG56IdC8X5GjXhDy
	ygsBL7hpn6RBSMRfZsejGg/pfVqQMTYHbGk/E55XqMSlzYZqFfch/JGI61TkdRt+S3X/J4uPc6+
	FeUWwISxgs0R9ymEhiLK1GEnjetUrp+YjUJKFUR99PyPLF0Gr94ivR/GV3Dc3FIJOBg7nnWnECg
	7xwyfgi6gTojpVknaQOgG2JELGBXzHVVB56VINIAdOPwpOc1u6MHRZoo8eUMllqTiri2ogEAhMb
	+CgromToQLDxv4oZG0crP11Qa5iPNaAzHqQ1e++uAESwKEmV3KVhzKUx4Hvci/V5TrjzLWqY+F5
	hJPa/J2rc3pwh4
X-Received: by 2002:a05:6a21:394b:b0:3e0:c2be:5b71 with SMTP id
 adf61e73a8af0-3e134061fc9mr2682854637.29.1791400293376; Wed, 07 Oct 2026
 12:11:33 -0700 (PDT)
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
Date: Wed, 7 Oct 2026 15:11:21 -0400
X-Gm-Features: AclHuK8wx5QvJWTuIEr0cxNSBa7WL00bfKIgEfBuSjmBXOBZiQvO3Vk6f_HL3EE
Message-ID: <CADvbK_fEQk5M8V+A-WE=_g6PPhD27QwqM4+_-cHmjP8j-JKijQ@mail.gmail.com>
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
True.

I was expecting one netns refcnt held until udp_tunnel_sock_release().

It looks better and clearer to fix it by holding one netns refcnt for
quic_udp_sock than releasing their kernel sockets from pernet exit.

Thanks.

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
