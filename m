Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63E1C84AF
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 24 Apr 2025 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517843; cv=none; b=QZ/dIK4rJ7DVQ2j1BqMX2lPEH7VLbSmxHE3AXyTeQtd0ltztSqdPOFWnkKde1C3Zg9PIIwBwnbaQlc4jf0ZY8XRgcG0IL/HMKjFb4sSFK/CX250A7iDc+IbYdG0lynW1F5fJGa96CCaBTfMtFQ6ZQK561IT8gaFLsf8qfkec0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517843; c=relaxed/simple;
	bh=BqAyCCNYh7ks3R/MBwZ7cb2LZ95S2THfnpvgDw6PfMg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RW6lF1JRaP+uFbVW8+hETPDbYrEgeM8UlAodwkS7ML6dzeIi3DIto1pCo+s4G0BcgDbgAvC3oTPLACXZ3j1L8i41/g/J8qQZMTFo2nzAS7XhpsoAGe/J+H0ULxCti7Pnrr1lRoyaW8ybfLy1r1QrQQw3WF9a5v1ERulpytdz+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeMnHkDQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeMnHkDQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb2faa9f55so171956066b.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 24 Apr 2025 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745517840; x=1746122640; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqAyCCNYh7ks3R/MBwZ7cb2LZ95S2THfnpvgDw6PfMg=;
        b=UeMnHkDQw2vrptf+az6p5zmjn60eWcorDaPg6G+6DeUy323JqHMCSb4HCwvcKT849b
         Ymgn7uwKncGTHNJj43tavpDkXHh8oGjAmCaHp8j2ZVt0mfy5yoVoxD5YpFaebRHbkxEE
         axKynjy4TW34sx/rA7dScb4/IpN5gtEF7BDlNu2nQVpcj5p8GSfwf3gRNcrFbAj1K2FG
         JokPF/UVTnOpwD118B01N7m3JctKPwnkx6NdTQGabIh6MOCuqd6NdjezDKfVlVQvTqoJ
         sEaVJcCPTuqoOckL77hU7fJ2Ph0OSqwm0pqo1SZtF3Tjm3ngniHzpKdPW2Uki4gVo0Ku
         VLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745517840; x=1746122640;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqAyCCNYh7ks3R/MBwZ7cb2LZ95S2THfnpvgDw6PfMg=;
        b=vEPGzXcH6Uq+BVDfqzEtm7ekXQGZc36D672L8XSNwzbJWxq2Yf1d6TJVORmxKZ7Wcg
         pSI12BKZdPSenWSG9X3fi0Kwntfti3F6rKBhgevz6U1v0M+cHCiCA4UqVrWoZvgrVrnI
         wt+z+tPQaTJRrQh+I1svtZcmoZYQy38fvT3uTZ0QxEXE9mnZbX8xfaia/NhI7yWwtxu+
         iT8M7hEGEAQUAuONs+2JkGjBWUFHmzZhNClhD+zPZywtP5UyfZeBNUi6HukewPqxuGNw
         ZUSCAR4PmuBR+hyP/G+aMJXbPiB+rTmp7+WZLQaHF8U5tmQAF/QZYhXo4RpZ/7dW+53W
         0SeA==
X-Gm-Message-State: AOJu0Yw1MoyZZ1HUEJLlTrPZKUZBLZBAXCZ+7fHoRAKU9zDkehhdTwFF
	RLVvRXvPbm6LJzIFe701IhMJ1OSzHig8aH6xiErYA5RFVQBjabAYb2vFD8/NXfRAtXrWYUcblDH
	21/M8mvF9mNDqeEDfsICijA7kq9+/PEWH
X-Gm-Gg: ASbGncsrQuvpMciJdHTgHtZscaafpauEf4KEbE36vI5GOVlfKGYRyLBZ+oX80W3J4Ka
	h+9AfOKtR1JY4ZPRq99lCh7EtsclFbhewOD/p8spYUA06k1JKDTYTJcEf9XGY5+UIAJDKeu8b09
	HWei8ppxxmSdnWg4Jjp9BBQF49VFKz7nYhJGmhthP5JD7nliOIFhNdtbw=
X-Google-Smtp-Source: AGHT+IG27T3Jyax3DNzHIEjepp0G1M0jdNkojzaTjiRCgnIk7VbyOmk3zXWSw9E04pBS55szS+q9ueVubq22RCScMCI=
X-Received: by 2002:a17:907:3e1f:b0:ace:3a35:43f2 with SMTP id
 a640c23a62f3a-ace6b358dbfmr46736266b.6.1745517839654; Thu, 24 Apr 2025
 11:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Sears <sjsorca@gmail.com>
Date: Thu, 24 Apr 2025 14:03:48 -0400
X-Gm-Features: ATxdqUFhvMyTJ2UmISjVrcmdhBP7QO7KCkM-pCfVSj2pZ4WKnOhKP_DTOkYlTiY
Message-ID: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
Subject: Missed rpc NULL response leads to hung mount command
To: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Originally posted to the ktls-utils list and Chuck Lever recommended
this list is more germaine to the problem I am trying to solve.

I am implementing the NFS server side of a TLS connection using the
OpenSSL library. There may be a bug in my implementation, but it isn't
obvious given the data so I am reaching out to this list. Please
respond if the problem sounds familiar or if you have ideas on how to
pursue it.

Here are some key datapoints:
- Using a Linux 6.12.16-2 client
- sudo mount -o xprtsec=tls,vers=4.2,hard,acregmin=0,acregmax=0
testmachine.lab.space:/share1 /mnt/share1/
- Looking at tlshd logs: the handshake always works. Always.
- The client will hang on the mount most of the time, but maybe 1/50
or so it works fine. And when the mount succeeds everything continues
to work great and tcpdump shows all TLS 1.3 packets, etc.
- The hang appears to be from an rpc_ping() when the rpc null reply is
not processed.
- tcpdump shows everything flowing as it should: after the TLS
handshake an encrypted rpc NULL is sent to the server, which
immediately responds with an encrypted response.
- For kicks I played with timeo= but it still hangs, until the timeout
of course.
- Verified the encryption algorithm being used on both sides is the same.
- The data suggests a race condition, and the order of some events
shows lots of threads competing.
- I modified openssl to enable "openssl s_client -starttls nfs" and it
successfully does the handshake with my server and waits for further
commands.

I put a bpftrace script together to track what is happening in the
kernel. It may be incomplete as this code is mostly new to me, but it
shows some interesting things. You can search on the sk addr within
the traces to see the flow.

First, this is a typical failure. The exact order of mount.nfs & tlshd
changes but does not seem to make a difference.

20:02:04.080574 [2087568/0xffff8fbbd7bc1b00 tlshd]
tls_sw_strparser_arm(0xffff8fbac3c99300)
20:02:04.080585 [2087568/0xffff8fbbd7bc1b00 tlshd]
tls_strp_check_rcv(strp=0xffff8fbb4a20cc58) sk=0xffff8fbac3c99300
stopped 0 msg_ready 0 stm.full_len 0 copy_mode 0
20:02:04.080606 [2087568/0xffff8fbbd7bc1b00 tlshd]
tls_rx_msg_size(strp=0xffff8fbb4a20cc58, skb=0xffff8fbae0a37300)
20:02:04.080616 [2087568/0xffff8fbbd7bc1b00 tlshd] ->tls_rx_msg_size
(tls_strp_check_rcv) return 255 [0xff]
20:02:04.080619 [2087568/0xffff8fbbd7bc1b00 tlshd]
tls_rx_msg_ready(tls_strparser=0xffff8fbb4a20cc58)
sk=0xffff8fbac3c99300 stopped 0 msg_ready 1 copy_mode 0
20:02:04.080872 [2087568/0xffff8fbbd7bc1b00 tlshd]
tls_handshake_done(req=0xffff8fb9ffce96c0, status=0,
info=0xffffba1144697888)
20:02:04.081035 [2087562/0xffff8fbb55303600 mount.nfs]
->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
20:02:04.081047 [2087562/0xffff8fbb55303600 mount.nfs]
tls_sw_sendmsg(sk=0xffff8fbac3c99300, msg=0xffffba1155e2f5b8,
size=0x2c)
20:02:04.081053 [2087562/0xffff8fbb55303600 mount.nfs]
tls_get_rec(sk=0xffff8fbac3c99300)
20:02:04.081063 [2087562/0xffff8fbb55303600 mount.nfs]
->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9eb80c800
20:02:04.081069 [2087562/0xffff8fbb55303600 mount.nfs]
tls_push_record(sock=0xffff8fbac3c99300, record_type=0x4040)
20:02:04.081127 [2087562/0xffff8fbb55303600 mount.nfs]
->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
20:02:04.081181 [2087562/0xffff8fbb55303600 mount.nfs]
rpc_wait_bit_killable(key=0xffffba1155e2f690, mode=0x2102)
20:02:04.121474 [ 0/0xffff8fbac0321b00 swapper/2]
tcp_rcv_established(sk=0xffff8fbac3c99300, skb=0xffff8fbae0c96900)

And there is a variation that is equally baffling:

20:17:01.400240 [2109186/0xffff8fbbe8928000 mount.nfs]
->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9ed70d000
20:17:01.400245 [2109186/0xffff8fbbe8928000 mount.nfs]
tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
20:17:01.400272 [2109186/0xffff8fbbe8928000 mount.nfs]
->tls_sw_sendmsg (__sock_sendmsg) return 224 [0xe0]
20:17:01.400288 [2109186/0xffff8fbbe8928000 mount.nfs]
rpc_wait_bit_killable(key=0xffffba1143713750, mode=0x2102)
20:17:01.400863 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tcp_rcv_established(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
20:17:01.400876 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
20:17:01.400880 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tcp_data_ready(sk=0xffff8fbac3c9e880)
20:17:01.400885 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tls_data_ready(sk=0xffff8fbac3c9e880)
20:17:01.400887 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tls_strp_data_ready(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
stopped 0 msg_ready 1 copy_mode 0
20:17:01.400911 [2109207/0xffff8fb9e6aab600 systemd-udevd]
tls_strp_check_rcv(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
stopped 0 msg_ready 1 stm.full_len 255 copy_mode 0

In the second case it looks like something (the rpc null response?)
was received on the socket and discarded or ignored.

In both cases the mount command is hung. ^C works fine to terminate
the command and will show various return calls as it cleans up.

Now compare that to a trace of a successful mount:

15:25:55.912868 [1847598/0xffff8fbb46ea1b00 tlshd]
tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fbb3c06db00)
15:25:55.912875 [1847598/0xffff8fbb46ea1b00 tlshd]
tcp_data_ready(sk=0xffff8fbac3c9e880)
15:25:55.912879 [1847598/0xffff8fbb46ea1b00 tlshd]
tls_data_ready(sk=0xffff8fbac3c9e880)
15:25:55.912881 [1847598/0xffff8fbb46ea1b00 tlshd]
tls_strp_data_ready(strp=0xffff8fb9cca31958)
15:25:55.913076 [1847598/0xffff8fbb46ea1b00 tlshd]
tls_handshake_done(req=0xffff8fb9ce43f480, status=0,
info=0xffffba114252f668)
15:25:55.913151 [1782955/0xffff8fbac2389b00 kworker/u19:1]
rpc_wake_up_task_on_wq_queue_action_locked(wq=0xffff8fbac93cf000,
queue-0xffff8fbbc1283258, task=0xffff8fbb7401c900)
15:25:55.913173 [1782955/0xffff8fbac2389b00 kworker/u19:1]
rpc_make_runnable(wk=0xffff8fbac93cf000, task=0xffff8fbb7401c900)
15:25:55.913306 [1847595/0xffff8fbac083b600 mount.nfs]
->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
15:25:55.913318 [1847595/0xffff8fbac083b600 mount.nfs]
tls_sw_sendmsg(sk=0xffff8fbac3c9e880, msg=0xffffba11425475d8,
size=0x2c)
15:25:55.913359 [1847595/0xffff8fbac083b600 mount.nfs]
tls_get_rec(sk=0xffff8fbac3c9e880)
15:25:55.913369 [1847595/0xffff8fbac083b600 mount.nfs]
->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fbbc1286000
15:25:55.913376 [1847595/0xffff8fbac083b600 mount.nfs]
tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
15:25:55.913415 [1847595/0xffff8fbac083b600 mount.nfs]
->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
15:25:55.913470 [1847595/0xffff8fbac083b600 mount.nfs]
rpc_wait_bit_killable(key=0xffffba11425476b0, mode=0x2102)

15:25:55.913661 [1816987/0xffff8fbb40755100 kworker/3:2]
tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
msg_ready 0
15:25:55.913677 [1816987/0xffff8fbb40755100 kworker/3:2]
tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
15:25:55.913686 [1816987/0xffff8fbb40755100 kworker/3:2]
->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
15:25:55.913690 [1816987/0xffff8fbb40755100 kworker/3:2]
tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
1
15:25:55.913699 [1816987/0xffff8fbb40755100 kworker/3:2]
tls_strp_work(work_struct=0xffff8fb9cca31978)
15:25:55.913702 [1816987/0xffff8fbb40755100 kworker/3:2]
tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
msg_ready 1
15:25:55.913717 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_sw_recvmsg(sk=0xffff8fbac3c9e880, msg=0xffffba1145fafd68, len=12,
flags=0x40, *addr_len=0xffffba1145fafc2c)
15:25:55.913724 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_rx_rec_wait(0xffff8fbac3c9e880, (nil), 0x1, 0x1, (nil))
15:25:55.913728 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
->tls_rx_rec_wait (tls_sw_recvmsg) return 1 [0x1]
15:25:55.913732 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_rx_one_record(0xffff8fbac3c9e880, 0xffffba1145fafd68,
0xffffba1145fafbc0)
15:25:55.913736 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_decrypt_sg(0xffff8fbac3c9e880) 15:25:55.913748
[1830424/0xffff8fbbd7bc3600 kworker/u20:3] ->tls_rx_one_record
(tls_sw_recvmsg) return 0 [(nil)]
15:25:55.913752 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_strp_msg_done(strp=0xffff8fb9cca31958)
15:25:55.913754 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
msg_ready 0
15:25:55.913766 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
15:25:55.913773 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
15:25:55.913775 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
1
15:25:55.913781 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
->tls_sw_recvmsg (inet_recvmsg) return 12 [0xc]

When successful, "mount.nfs" does not start running again within these
traces, but kworker threads handle messages correctly.

Any insight would be greatly appreciated.


 -Steve
