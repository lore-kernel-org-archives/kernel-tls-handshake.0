Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4848BFB
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95EFC4339B;
	Tue, 28 Mar 2023 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680018483;
	bh=ea6DxahUouIGbGNovmFxqbJdOdM2JupjgeLF74AzOPY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ASnVnjvSsdEnJMIRchD+zcuIQwPqKRCXg9thlDyAlXFzcitenQhLKCPWnaPOD+NLs
	 mfyFHXcPl/LzOr9CuheYJ9mKcXn4a7P3Vf1RvulUmzbrnAqU1wzPlqZT7HEfaZvx+6
	 NG30/+WlZolp8Ss1tMy6cUFEenIZsavXhK85mlHCjhUy2yjeqemz1qUuQakZFQ9oHb
	 W+287SBJniazaMrf9pFvSwfNM7ojkbC6A8h15YfKk9fnBHAurHzR7W8KPVjZTfX+IX
	 zShcdnRsYYmAzBiGVt2VkPU595ZbboEoz//ea8GKcWntKUC8Ar2B28scedCdkZZdW3
	 dUbgGuvOPFa+Q==
Message-ID: <fb72ac57e1afe372cdec36fc6e6998cf8179e959.camel@kernel.org>
Subject: Re: problems getting rpc over tls to work
From: Jeff Layton <jlayton@kernel.org>
To: Olga Kornievskaia <aglo@umich.edu>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	"kernel-tls-handshake@lists.linux.dev"
	 <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 28 Mar 2023 11:48:01 -0400
In-Reply-To: <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
	 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
	 <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
	 <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
	 <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com>
	 <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
Content-Type: multipart/mixed; boundary="=-/fGmmx7IJ/3Ln29T8V1u"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--=-/fGmmx7IJ/3Ln29T8V1u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-03-28 at 10:38 -0400, Jeff Layton wrote:
> On Tue, 2023-03-28 at 10:25 -0400, Olga Kornievskaia wrote:
> > On Tue, Mar 28, 2023 at 10:14=E2=80=AFAM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > >=20
> > > On Tue, 2023-03-28 at 13:55 +0000, Chuck Lever III wrote:
> > > >=20
> > > > > On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.=
com> wrote:
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > > On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> w=
rote:
> > > > > >=20
> > > > > > Hi Chuck!
> > > > > >=20
> > > > > > I have started the packaging work for Fedora for ktls-utils:
> > > > > >=20
> > > > > >   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
> > > > > >=20
> > > > > > I also built packages for this in copr:
> > > > > >=20
> > > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
> > > > > >=20
> > > > > > ...and built some interim nfs-utils packages with the requisite=
 exportfs
> > > > > > patches:
> > > > > >=20
> > > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
> > > > >=20
> > > > > Note that the nfs-utils changes aren't necessary to support
> > > > > the kernel server in "opportunistic" mode -- the server will
> > > > > use RPC-with-TLS if a client requests it, but otherwise does
> > > > > not restrict access.
> > > > >=20
> > > > > Client side also has no nfs-utils requirements at this time,
> > > > > since the new mount options are handled by the kernel.
> > > >=20
> > > > In case I wasn't clear:
> > > >=20
> > > > This was meant as a suggestion. If you want to simplify your
> > > > test set-up a bit, the nfs-utils piece isn't needed at this
> > > > point. But feel free to include it if you like!
> > > >=20
> > >=20
> > > Understood. I needed to build it for the server side anyway, so I
> > > figured I might as well. Eventually I'd like to set up a Fedora COPR
> > > repo that has all of the packages we need to test this, but I need to
> > > sort through the certificate handling here first.
> > >=20
> > > Are there docs on how to administer gnutls? For instance, I guess I'l=
l
> > > want to set up my own CA and issue client and server certs. How do I
> > > make gnutls trust a new CA?
> >=20
> > Hi Jeff,
> >=20
> > To get self-signed certificates to work you need to (on the client's
> > machine) copy your server's cert.pem file into
> > /etc/pki/ca-trust/source/anchors and then run the =E2=80=9Cupdate-ca-tr=
ust
> > extract=E2=80=9D.
> >=20
> >=20
>=20
> Many thanks, Olga! That got me further:
>=20
>     Mar 28 10:35:05 nfsclnt tlshd[1498]: Handshake with nfsd.poochiereds.=
net (192.168.1.140) was successful
>=20
> The mount still isn't working yet, but I think I'm getting closer. I'll
> keep poking at it.
>=20

OK! I cranked up the debugging. Here's the kernel tracepoints during
this time:

          <idle>-0       [007] ..s2.  3657.494946: svc_xprt_enqueue: server=
=3D0.0.0.0:2049 client=3D(einval) flags=3DBUSY|CONN|CHNGBUF|LISTENER|CACHE_=
AUTH|CONG_CTRL pid=3D1051
            nfsd-1051    [005] .....  3657.494980: svc_xprt_dequeue: server=
=3D0.0.0.0:2049 client=3D(einval) flags=3DBUSY|CONN|CHNGBUF|LISTENER|CACHE_=
AUTH|CONG_CTRL wakeup-us=3D45
            nfsd-1051    [005] .....  3657.495071: svcsock_new_socket: type=
=3DSTREAM family=3DAF_INET
            nfsd-1051    [005] .....  3657.495085: svc_xprt_enqueue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL pid=3D1050
            nfsd-1051    [005] .....  3657.495086: svc_xprt_accept: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL protocol=3Dtcp service=3Dnfsd
            nfsd-1051    [005] .....  3657.495092: svc_xprt_enqueue: server=
=3D0.0.0.0:2049 client=3D(einval) flags=3DBUSY|CONN|CHNGBUF|LISTENER|CACHE_=
AUTH|CONG_CTRL pid=3D1049
            nfsd-1051    [005] .....  3657.495095: svc_xprt_dequeue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL wakeup-us=3D158
            nfsd-1051    [005] .....  3657.495101: svcsock_marker: addr=3D1=
92.168.1.136:818 length=3D40 (last)
            nfsd-1051    [005] .....  3657.495104: svcsock_tcp_recv: addr=
=3D192.168.1.136:818 result=3D40 flags=3DBUSY|DATA|TEMP|CACHE_AUTH|CONG_CTR=
L
            nfsd-1051    [005] .....  3657.495111: svc_xprt_enqueue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL pid=3D1048
            nfsd-1051    [005] .....  3657.495112: svc_xdr_recvfrom: xid=3D=
0xd1e2303e head=3D[000000005f040892,40] page=3D0 tail=3D[0000000000000000,0=
] len=3D40
            nfsd-1050    [007] .....  3657.495121: svc_xprt_dequeue: server=
=3D0.0.0.0:2049 client=3D(einval) flags=3DBUSY|CONN|CHNGBUF|LISTENER|CACHE_=
AUTH|CONG_CTRL wakeup-us=3D44
            nfsd-1051    [005] .....  3657.495125: svc_tls_start: server=3D=
192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CACHE_=
AUTH|CONG_CTRL
            nfsd-1051    [005] .....  3657.495128: svc_process: addr=3D192.=
168.1.136:818 xid=3D0xd1e2303e service=3Dnfsd vers=3D4 proc=3DNULL
            nfsd-1051    [005] .....  3657.495132: svc_xdr_sendto: xid=3D0x=
d1e2303e head=3D[000000005ccd151e,32] page=3D0(0) tail=3D[0000000000000000,=
0] len=3D32
            nfsd-1051    [005] .....  3657.495133: svc_stats_latency: xid=
=3D0xd1e2303e server=3D192.168.1.140:2049 client=3D192.168.1.136:818 proc=
=3DNULL execute-us=3D21
            nfsd-1050    [007] .....  3657.495146: svcsock_accept_err: addr=
=3Dlistener service=3Dnfsd status=3D-11
            nfsd-1048    [004] .....  3657.495147: svc_xprt_dequeue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL|HANDSHAKE wakeup-us=3D42
            nfsd-1048    [004] .....  3657.495151: svc_tls_upcall: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CAC=
HE_AUTH|CONG_CTRL|HANDSHAKE
            nfsd-1051    [005] .....  3657.495163: svcsock_tcp_send: addr=
=3D192.168.1.136:818 result=3D36 flags=3DBUSY|DATA|TEMP|CACHE_AUTH|CONG_CTR=
L|HANDSHAKE
            nfsd-1051    [005] .....  3657.495198: svc_send: xid=3D0xd1e230=
3e server=3D192.168.1.140:2049 client=3D192.168.1.136:818 status=3D36 flags=
=3DSECURE|USEDEFERRAL|SPLICE_OK|BUSY|DATA
          <idle>-0       [007] ..s2.  3657.651316: svcsock_data_ready: addr=
=3D192.168.1.136:818 result=3D0 flags=3DBUSY|DATA|TEMP|CACHE_AUTH|CONG_CTRL=
|HANDSHAKE
          <idle>-0       [007] ..s2.  3657.655648: svcsock_data_ready: addr=
=3D192.168.1.136:818 result=3D0 flags=3DBUSY|DATA|TEMP|CACHE_AUTH|CONG_CTRL=
|HANDSHAKE
          <idle>-0       [007] ..s2.  3657.669552: svcsock_data_ready: addr=
=3D192.168.1.136:818 result=3D0 flags=3DBUSY|DATA|TEMP|CACHE_AUTH|CONG_CTRL=
|HANDSHAKE
            nfsd-1048    [004] .....  3662.666590: svc_tls_timed_out: serve=
r=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|DATA|TEMP|CA=
CHE_AUTH|CONG_CTRL|HANDSHAKE              <<<<<<<<<<< TIMEOUT HERE
            nfsd-1048    [004] .....  3662.666602: svc_xprt_enqueue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|CLOSE|DATA|TE=
MP|CACHE_AUTH|CONG_CTRL pid=3D1051
            nfsd-1048    [004] .....  3662.666630: svc_xprt_dequeue: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|CLOSE|DATA|TE=
MP|CACHE_AUTH|CONG_CTRL wakeup-us=3D5171655
            nfsd-1048    [004] .....  3662.666631: svc_xprt_detach: server=
=3D192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|CLOSE|DATA|TE=
MP|DEAD|CACHE_AUTH|CONG_CTRL
            nfsd-1048    [004] .....  3662.666689: svc_xprt_free: server=3D=
192.168.1.140:2049 client=3D192.168.1.136:818 flags=3DBUSY|CLOSE|DATA|TEMP|=
DEAD|CACHE_AUTH|CONG_CTRL

It looks like it timed out waiting for the downcall. I cranked up the
debug logging in tlshd at the same time and attached it to this. It
looks like it all worked, so I'm not sure why the kernel didn't see the
downcall.

Thoughts?
--=20
Jeff Layton <jlayton@kernel.org>

--=-/fGmmx7IJ/3Ln29T8V1u
Content-Type: application/gzip; name="tlshd.log.gz"
Content-Disposition: attachment; filename="tlshd.log.gz"
Content-Transfer-Encoding: base64

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
vRiGAAA=


--=-/fGmmx7IJ/3Ln29T8V1u--
