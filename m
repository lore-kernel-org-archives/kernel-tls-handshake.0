Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270F1482F5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Apr 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859291; cv=none; b=NC1I634Qv4SQOirJTCmWmoOAFJbeeljP7OhpGX4CcqswM/54DJABi2YPmlSrY88ccwtGg7huKy3SPlkR8WdK0uGmYvNACq/nR8oN6J/hziAvUUWRmAvflvOMquIRq7mWuBD+LMA6wWF494GZqMKB2MtnUNb0BCuzzlLQJgUBe4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859291; c=relaxed/simple;
	bh=UpMua/Cz4v78c2nWv9lnXH69pqQovknb/esvgUtNFpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lV2br4RGYwN+fXzektufnktl/jFjHOdtdSenkKcjuVfI/gDNlIyNQQ9Wt8Y/prehVtd7TeDFXF/F/dID7mUMs0vais7kwzWRA1a/tqRFC7uy0OaTGchqIgVkLT7nNItxb68XDziJ1ci1HJfMMoTfLVX5KdXALIINyLWiOitS9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7zDhy6L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7zDhy6L"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so732368366b.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Apr 2025 09:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745859288; x=1746464088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X/8c1KcwUhYVp302lATQkHc5QV5gyWGXBiGbCCBVjI=;
        b=e7zDhy6LeWPHiB4ukdIwP7aQr+spN0CFKi0wPGOiqfhdK30mLW/0yB6kDVR2mIkafP
         aqtXnS9MhrrTjiGGsyCRZjfoVU0T5xQwUk59Mdk5WrXUo52ejL+vFhZ5k6J1aWWTIkmO
         WZUMlDI3bAaT2x9UlWwJTcilu273YzsG1JgiOuH+dFKresZMFssi1fVQQmtddevbDll5
         0S5z8rW+wUQ4AsQ/MIS0kvJhTLi2aWRcs+vBeYUETu9u9n38PCPN0fSqTfp8NfOnQl7M
         RBqouKkEn524Mfi3jG3iO8ObASdOH2DzQPH05a5HYp27U6o/t7vUdEAmK/mbzkoxzjjq
         VfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859288; x=1746464088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X/8c1KcwUhYVp302lATQkHc5QV5gyWGXBiGbCCBVjI=;
        b=Kxdf18PZQ/4+MW4N9MN0CCydba4D6zrxJO4O1/n9HeX2TUo/GP9LvWsOf5SIPYw6z4
         9jNdPlAlXsc8OmBMKKgztpKd1ruLlfxapw5SHKjQHCluF2EpXytmYOsf2GHSmeCEibB1
         EpE80hUadjMeFy2bTfgBHYUlAzSaW28ItrGCcVJCmHjVZCR8GHqWtxOjYfwt1Q2pGZr+
         JjhjPfP08glTqdltXL3cI/j2eczLxmpNO2yKZK1WC4L+C7aNr8NUCO7kSW2yUyjuxiA9
         z7/Z9Zja/QfMMsdp3nXtn66CNmaxE21baTVA78Ng3Pz7QJgFlGmlNuV6hW6O+gst5slr
         Cjuw==
X-Gm-Message-State: AOJu0YxueNUVzezqvwekRowbmfCfmDhP5WzIQZG84rBpcQx2tkZ/CbbR
	BJn4bUVUJ1Pqi7Frlgma8v7fJHf7UWltZ9fGlSDBjzAlyZ7z/F20Nif2YaXDGzT3wgsZsZba3KV
	2IONuQWAANGVDRp8Ej70SbjAVJjY=
X-Gm-Gg: ASbGncsCy4cE6XpUVkftAO4GrPwdkJPtdo2yT5sy6MXNzUexetFp5VIS5HjxBcj6w7I
	DcsaRCuAAbAifb9KICNMS54IkdHN5D5hSVhTTvSElKSOKJTq65fBRKHw/lrQJUPJCYYwcG6uvYX
	zMTQR0o7j8ZULybWrJx36VKPMzJ6QdfhPiltULmiyvjS1C2bC5vOYpspQ=
X-Google-Smtp-Source: AGHT+IEBcifif4NYM0/Onl4lg4ikp4leGtP6E16N4feFO0N2XqTunse2KtDKCHlnP2+W2xHdPVicSlwTT3isSY3b1ic=
X-Received: by 2002:a17:907:720a:b0:ac7:391b:e684 with SMTP id
 a640c23a62f3a-ace84afbd42mr797730466b.58.1745859287643; Mon, 28 Apr 2025
 09:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
 <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
In-Reply-To: <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
From: Steve Sears <sjsorca@gmail.com>
Date: Mon, 28 Apr 2025 12:54:36 -0400
X-Gm-Features: ATxdqUG5PErkA6NyHemUVdP1aM4Kr5dE81nc__NALciSeb0ICKJleq42ycGvOr8
Message-ID: <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 11:35=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 4/24/25 2:03 PM, Steve Sears wrote:
> > Originally posted to the ktls-utils list and Chuck Lever recommended
> > this list is more germaine to the problem I am trying to solve.
> >
> > I am implementing the NFS server side of a TLS connection using the
> > OpenSSL library. There may be a bug in my implementation, but it isn't
> > obvious given the data so I am reaching out to this list. Please
> > respond if the problem sounds familiar or if you have ideas on how to
> > pursue it.
> >
> > Here are some key datapoints:
> > - Using a Linux 6.12.16-2 client
> > - sudo mount -o xprtsec=3Dtls,vers=3D4.2,hard,acregmin=3D0,acregmax=3D0
> > testmachine.lab.space:/share1 /mnt/share1/
> > - Looking at tlshd logs: the handshake always works. Always.
> > - The client will hang on the mount most of the time, but maybe 1/50
> > or so it works fine. And when the mount succeeds everything continues
> > to work great and tcpdump shows all TLS 1.3 packets, etc.
> > - The hang appears to be from an rpc_ping() when the rpc null reply is
> > not processed.
>
> Hi Steve -
>
> What does this mean, exactly? Which side is not processing the ping?
> If the ping does not work, then operation on the connection will not
> proceed.

It is unclear if I am looking at the right problem, I am still trying
to understand how the client works. The client sends two rpc null
requests: an AUTH_TLS and an AUTH_SYS. The AUTH_TLS is received on the
server and a reply sent, and the client sees the reply and does the
TLS handshake successfully. This part works every time.

The, the AUTH_TLS is received on the server and a reply is sent. The
bpf trace shows the null rpc being sent, but we see no evidence of a
reply for this one. Or perhaps more accurately, we see a reply but the
client doesn't think it is a reply to the rpc null AUTH_SYS it sent.

tcpdump confirms both rpc null messages are sent and replied to.

I have the same bpftrace output for a working mount, unfortunately
without flag bits I recently added. In the non-working case we see:

15:32:57.391762 [ 56273/0xffff8e9b80b70000        mount.nfs]
rpc_create_xprt(args=3D0xffffb53c87ceb710, xprt=3D0xffff8e9c259bd800)
sa_family: 2  port=3D264 addr 10.200.107.13 xprtsec policy:
RPC_XPRTSEC_TLS_ANON flags=3D0x2a0 auth_flavor=3D1
15:32:57.391786 [ 56273/0xffff8e9b80b70000        mount.nfs]
rpc_ping(clnt=3D0xffff8e9b81951e00)
...
15:32:57.391896 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
rpc_create_xprt(args=3D0xffffb53c9503fd70, xprt=3D0xffff8e9c259be800)
sa_family: 2  port=3D264 addr 10.200.107.13 xprtsec policy:
RPC_XPRTSEC_NONE flags=3D(nil) auth_flavor=3D7
15:32:57.391932 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
rpc_ping(clnt=3D0xffff8e9b80a53600)
...
15:32:57.392697 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
->rpc_ping (rpc_create_xprt) return 0 [(nil)]

An rpc_ping is sent with an AUTH_SYS flavor. Shortly thereafter
another rpc_ping is sent with AUTH_TLS, which completes relatively
quickly.

This part is the same for working and non-working, the trace shows a
set of nested rpc_pings. However, in the working case a reply to the
first rpc_ping is processed by mount.nfs once it starts running again.
In the non-working case mount.nfs never wakes up from
rpc_wait_bit_killable().

>
>
> > - tcpdump shows everything flowing as it should: after the TLS
> > handshake an encrypted rpc NULL is sent to the server, which
> > immediately responds with an encrypted response.
> > - For kicks I played with timeo=3D but it still hangs, until the timeou=
t
> > of course.
> > - Verified the encryption algorithm being used on both sides is the sam=
e.
> > - The data suggests a race condition, and the order of some events
> > shows lots of threads competing.
> > - I modified openssl to enable "openssl s_client -starttls nfs" and it
> > successfully does the handshake with my server and waits for further
> > commands.
> >
> > I put a bpftrace script together to track what is happening in the
> > kernel. It may be incomplete as this code is mostly new to me, but it
> > shows some interesting things. You can search on the sk addr within
> > the traces to see the flow.
> >
> > First, this is a typical failure. The exact order of mount.nfs & tlshd
> > changes but does not seem to make a difference.
> >
> > 20:02:04.080574 [2087568/0xffff8fbbd7bc1b00 tlshd]
> > tls_sw_strparser_arm(0xffff8fbac3c99300)
> > 20:02:04.080585 [2087568/0xffff8fbbd7bc1b00 tlshd]
> > tls_strp_check_rcv(strp=3D0xffff8fbb4a20cc58) sk=3D0xffff8fbac3c99300
> > stopped 0 msg_ready 0 stm.full_len 0 copy_mode 0
> > 20:02:04.080606 [2087568/0xffff8fbbd7bc1b00 tlshd]
> > tls_rx_msg_size(strp=3D0xffff8fbb4a20cc58, skb=3D0xffff8fbae0a37300)
> > 20:02:04.080616 [2087568/0xffff8fbbd7bc1b00 tlshd] ->tls_rx_msg_size
> > (tls_strp_check_rcv) return 255 [0xff]
> > 20:02:04.080619 [2087568/0xffff8fbbd7bc1b00 tlshd]
> > tls_rx_msg_ready(tls_strparser=3D0xffff8fbb4a20cc58)
> > sk=3D0xffff8fbac3c99300 stopped 0 msg_ready 1 copy_mode 0
> > 20:02:04.080872 [2087568/0xffff8fbbd7bc1b00 tlshd]
> > tls_handshake_done(req=3D0xffff8fb9ffce96c0, status=3D0,
> > info=3D0xffffba1144697888)
> > 20:02:04.081035 [2087562/0xffff8fbb55303600 mount.nfs]
> > ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
> > 20:02:04.081047 [2087562/0xffff8fbb55303600 mount.nfs]
> > tls_sw_sendmsg(sk=3D0xffff8fbac3c99300, msg=3D0xffffba1155e2f5b8,
> > size=3D0x2c)
> > 20:02:04.081053 [2087562/0xffff8fbb55303600 mount.nfs]
> > tls_get_rec(sk=3D0xffff8fbac3c99300)
> > 20:02:04.081063 [2087562/0xffff8fbb55303600 mount.nfs]
> > ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9eb80c800
> > 20:02:04.081069 [2087562/0xffff8fbb55303600 mount.nfs]
> > tls_push_record(sock=3D0xffff8fbac3c99300, record_type=3D0x4040)
> > 20:02:04.081127 [2087562/0xffff8fbb55303600 mount.nfs]
> > ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
> > 20:02:04.081181 [2087562/0xffff8fbb55303600 mount.nfs]
> > rpc_wait_bit_killable(key=3D0xffffba1155e2f690, mode=3D0x2102)
> > 20:02:04.121474 [ 0/0xffff8fbac0321b00 swapper/2]
> > tcp_rcv_established(sk=3D0xffff8fbac3c99300, skb=3D0xffff8fbae0c96900)
> >
> > And there is a variation that is equally baffling:
> >
> > 20:17:01.400240 [2109186/0xffff8fbbe8928000 mount.nfs]
> > ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9ed70d000
> > 20:17:01.400245 [2109186/0xffff8fbbe8928000 mount.nfs]
> > tls_push_record(sock=3D0xffff8fbac3c9e880, record_type=3D0x4040)
> > 20:17:01.400272 [2109186/0xffff8fbbe8928000 mount.nfs]
> > ->tls_sw_sendmsg (__sock_sendmsg) return 224 [0xe0]
> > 20:17:01.400288 [2109186/0xffff8fbbe8928000 mount.nfs]
> > rpc_wait_bit_killable(key=3D0xffffba1143713750, mode=3D0x2102)
> > 20:17:01.400863 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tcp_rcv_established(sk=3D0xffff8fbac3c9e880, skb=3D0xffff8fb9ce618c00)
> > 20:17:01.400876 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tcp_event_data_recv(sk=3D0xffff8fbac3c9e880, skb=3D0xffff8fb9ce618c00)
> > 20:17:01.400880 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tcp_data_ready(sk=3D0xffff8fbac3c9e880)
> > 20:17:01.400885 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tls_data_ready(sk=3D0xffff8fbac3c9e880)
> > 20:17:01.400887 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tls_strp_data_ready(strp=3D0xffff8fb9f085ba58) sk=3D0xffff8fbac3c9e880
> > stopped 0 msg_ready 1 copy_mode 0
> > 20:17:01.400911 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> > tls_strp_check_rcv(strp=3D0xffff8fb9f085ba58) sk=3D0xffff8fbac3c9e880
> > stopped 0 msg_ready 1 stm.full_len 255 copy_mode 0
> >
> > In the second case it looks like something (the rpc null response?)
> > was received on the socket and discarded or ignored.
> >
> > In both cases the mount command is hung. ^C works fine to terminate
> > the command and will show various return calls as it cleans up.
> >
> > Now compare that to a trace of a successful mount:
> >
> > 15:25:55.912868 [1847598/0xffff8fbb46ea1b00 tlshd]
> > tcp_event_data_recv(sk=3D0xffff8fbac3c9e880, skb=3D0xffff8fbb3c06db00)
> > 15:25:55.912875 [1847598/0xffff8fbb46ea1b00 tlshd]
> > tcp_data_ready(sk=3D0xffff8fbac3c9e880)
> > 15:25:55.912879 [1847598/0xffff8fbb46ea1b00 tlshd]
> > tls_data_ready(sk=3D0xffff8fbac3c9e880)
> > 15:25:55.912881 [1847598/0xffff8fbb46ea1b00 tlshd]
> > tls_strp_data_ready(strp=3D0xffff8fb9cca31958)
> > 15:25:55.913076 [1847598/0xffff8fbb46ea1b00 tlshd]
> > tls_handshake_done(req=3D0xffff8fb9ce43f480, status=3D0,
> > info=3D0xffffba114252f668)
> > 15:25:55.913151 [1782955/0xffff8fbac2389b00 kworker/u19:1]
> > rpc_wake_up_task_on_wq_queue_action_locked(wq=3D0xffff8fbac93cf000,
> > queue-0xffff8fbbc1283258, task=3D0xffff8fbb7401c900)
> > 15:25:55.913173 [1782955/0xffff8fbac2389b00 kworker/u19:1]
> > rpc_make_runnable(wk=3D0xffff8fbac93cf000, task=3D0xffff8fbb7401c900)
> > 15:25:55.913306 [1847595/0xffff8fbac083b600 mount.nfs]
> > ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
> > 15:25:55.913318 [1847595/0xffff8fbac083b600 mount.nfs]
> > tls_sw_sendmsg(sk=3D0xffff8fbac3c9e880, msg=3D0xffffba11425475d8,
> > size=3D0x2c)
> > 15:25:55.913359 [1847595/0xffff8fbac083b600 mount.nfs]
> > tls_get_rec(sk=3D0xffff8fbac3c9e880)
> > 15:25:55.913369 [1847595/0xffff8fbac083b600 mount.nfs]
> > ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fbbc1286000
> > 15:25:55.913376 [1847595/0xffff8fbac083b600 mount.nfs]
> > tls_push_record(sock=3D0xffff8fbac3c9e880, record_type=3D0x4040)
> > 15:25:55.913415 [1847595/0xffff8fbac083b600 mount.nfs]
> > ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
> > 15:25:55.913470 [1847595/0xffff8fbac083b600 mount.nfs]
> > rpc_wait_bit_killable(key=3D0xffffba11425476b0, mode=3D0x2102)
> >
> > 15:25:55.913661 [1816987/0xffff8fbb40755100 kworker/3:2]
> > tls_strp_check_rcv(tls_strparser=3D0xffff8fb9cca31958) stopped 0
> > msg_ready 0
> > 15:25:55.913677 [1816987/0xffff8fbb40755100 kworker/3:2]
> > tls_rx_msg_size(strp=3D0xffff8fb9cca31958, skb=3D0xffff8fbba6a53600)
> > 15:25:55.913686 [1816987/0xffff8fbb40755100 kworker/3:2]
> > ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
> > 15:25:55.913690 [1816987/0xffff8fbb40755100 kworker/3:2]
> > tls_rx_msg_ready(tls_strparser=3D0xffff8fb9cca31958) stopped 0 msg_read=
y
> > 1
> > 15:25:55.913699 [1816987/0xffff8fbb40755100 kworker/3:2]
> > tls_strp_work(work_struct=3D0xffff8fb9cca31978)
> > 15:25:55.913702 [1816987/0xffff8fbb40755100 kworker/3:2]
> > tls_strp_check_rcv(tls_strparser=3D0xffff8fb9cca31958) stopped 0
> > msg_ready 1
> > 15:25:55.913717 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_sw_recvmsg(sk=3D0xffff8fbac3c9e880, msg=3D0xffffba1145fafd68, len=
=3D12,
> > flags=3D0x40, *addr_len=3D0xffffba1145fafc2c)
> > 15:25:55.913724 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_rx_rec_wait(0xffff8fbac3c9e880, (nil), 0x1, 0x1, (nil))
> > 15:25:55.913728 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > ->tls_rx_rec_wait (tls_sw_recvmsg) return 1 [0x1]
> > 15:25:55.913732 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_rx_one_record(0xffff8fbac3c9e880, 0xffffba1145fafd68,
> > 0xffffba1145fafbc0)
> > 15:25:55.913736 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_decrypt_sg(0xffff8fbac3c9e880) 15:25:55.913748
> > [1830424/0xffff8fbbd7bc3600 kworker/u20:3] ->tls_rx_one_record
> > (tls_sw_recvmsg) return 0 [(nil)]
> > 15:25:55.913752 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_strp_msg_done(strp=3D0xffff8fb9cca31958)
> > 15:25:55.913754 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_strp_check_rcv(tls_strparser=3D0xffff8fb9cca31958) stopped 0
> > msg_ready 0
> > 15:25:55.913766 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_rx_msg_size(strp=3D0xffff8fb9cca31958, skb=3D0xffff8fbba6a53600)
> > 15:25:55.913773 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
> > 15:25:55.913775 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > tls_rx_msg_ready(tls_strparser=3D0xffff8fb9cca31958) stopped 0 msg_read=
y
> > 1
> > 15:25:55.913781 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> > ->tls_sw_recvmsg (inet_recvmsg) return 12 [0xc]
> >
> > When successful, "mount.nfs" does not start running again within these
> > traces, but kworker threads handle messages correctly.
> >
> > Any insight would be greatly appreciated.
> >
> >
> >  -Steve
> >
>
>
> --
> Chuck Lever
