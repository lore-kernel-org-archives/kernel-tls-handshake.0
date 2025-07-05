Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C91E5B95
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  5 Jul 2025 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751744329; cv=none; b=CxITID1lmoXk9AzSsUEBEJsuOpBIdqqZoJrlC5p6qGatAn6y5u5ytzaeTkeZe81GTibdzgdITAxZxVutIOkwpDitBjoX6of7Vxu6+uVjy/o/vA++uIqpy/MKvFN93W04g1KZEX9XV7J84m8iOD6KRczZlG9vhzJPU6oc2UkiP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751744329; c=relaxed/simple;
	bh=36sm89o+0VpGkTlPq0AP8Xv0v15yeMvxWbGJZow6bPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KQnjOv7xQOdxmcdwo/BnfvRprX+SM1ByncgoK1Da7TAILMBGe4/8dFsrHTRZL/LROPyx1OMJo6K74Qw/Zd7DGDmTUnSW76IZddAAh2qB9EmW/ECaBnak8GozLx32Z1zNZPIqXm89ei2BAwKkbfciNht008ctbsPMxqCYNzDvqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBgik/RV; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBgik/RV"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d21cecc11fso407823285a.3
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 05 Jul 2025 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751744326; x=1752349126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FW+TfYRnZOAormj2kW4oFaSY0R0lZLB2fsJJy86p+l0=;
        b=SBgik/RVdNTXfBUgCJviroMlBAM+v+L8U6+mlR8heMfHv8VQjt6NiRPIE6V9iCb1QQ
         gMj9sz0ZVkRNUIivvULh0pVdieOhR8WEiiyhjbaM9SSihE6C/w30jDYx/Ts2RGe3CNrD
         jrSA1Vb6fW3BQWdEnxJZ2kvYuKujH3RkDRMLOGzsoOVyCqlzXrzl2NylGa3ce4NA+80U
         B07Mb/JmJzwRDrh9gAzMJpU0UnQlC7tUe9svhLGnyVIvBwIa/QAmN7XtNrdRB1k7+Me9
         ZpO3GBlQoatS+pkPtDgYIfPdH8GAl2/rNwDmAIq+UPOLwyYZrTT7zRjn4iyY4gJss8yk
         XfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751744326; x=1752349126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FW+TfYRnZOAormj2kW4oFaSY0R0lZLB2fsJJy86p+l0=;
        b=tlkCGF8jG9DEIfA5FeYWG/uakxPPuGQt3LzpxyrAI6Z1kXzVoHoWxWnTnAjPEVBqDN
         EiNpfbS9hPsz0gy5vyzR2lIDdoC6icN3t6RsfgVW+pjU2/J4J8Hdz3H+L+0ESWa2OHLn
         0XyHffQkWAyyXNcoNIUq6ehvmv2sbziE0oDulddNSGCcz8Kbc7RjhgtVWj+PM1d36nVq
         lRfZ1PiUDk1JEqMOlU9/zcM2zaBAYfvjFlmOAepXUMt5qeDNfOli6CQtFmtAzPtZHj/t
         IEDCbL+uBuWs1fBOGND2A5M2HfbCoZP+gZ7amokl0bqJ/niWdF2FBginMsIu6h4qLdLt
         HMmA==
X-Forwarded-Encrypted: i=1; AJvYcCX2vp2BbV+ZGM6iHyzloQ2gPEJmx/nrC2NA2eE1lsZIS6TGzmXSTuaaOSVAwMeX3SqUlf8V90eyhbmn1VwNlXOp8HDHdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL6riesD6hRg+H3bMO6X8d4U1Bk2sEZgAFh+wVzG89b4qJF48r
	dotPoCJxgZDX/4pxCEJmfmsq4RRvBlN8RNqD8OieH58NJQ0/l1RxIern
X-Gm-Gg: ASbGncsKVwLwJKu8ATZU/pMvzFgqrA+MSimd8HqSgTFi2vjLT/0Ud0M8+lczqZ1iLs5
	NOlZyeIPbsmDXxFRwKBbXDjVzZ48YixVk/SqkMNQGsEy+KrzDr99SZDg+M/SRs2WqClx4OXbUhM
	N1o6c79bTJDzXHprekOSZC4KEatpBNHEr2kGFL3xNM/gWEoV1YNCyzyNbHYgSQyEWWIbX2nBqBe
	1gMoU0/ehhaf8Y53s2UVLYi1Kf9ENeANU+T1zn0scEnYcyVRTl/RTXoskuA84kx2cJnAWOHiFuf
	I/QZNiRrBJi+AdXangOjYPJjwgoP4wzKj7vXNJS6sRHI+63B61X05oazimc5jWpxqxUCbp0FBOb
	h5oFXlOr0kO6vyw8TxITLgy9t6cG7LMXkfLTNDA==
X-Google-Smtp-Source: AGHT+IHgoW8PPd3g4MokcVGHwypEUMNXEus29rsnLY7pXmAoDcwKJaN6U7RAa70caicbLSachIdyBA==
X-Received: by 2002:a05:620a:28ca:b0:7ca:cd16:b433 with SMTP id af79cd13be357-7d5f11f2dbbmr384910385a.31.1751744325888;
        Sat, 05 Jul 2025 12:38:45 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6019csm32999146d6.106.2025.07.05.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:38:45 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 00/15] net: introduce QUIC infrastructure and core subcomponents
Date: Sat,  5 Jul 2025 15:31:39 -0400
Message-ID: <cover.1751743914.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduction
============

The QUIC protocol, as defined in RFC9000, offers a UDP-based, secure
transport with flow-controlled streams for efficient communication,
low-latency connection setup, and network path migration, ensuring
confidentiality, integrity, and availability across various deployments.

This implementation introduces QUIC support in Linux Kernel, offering
several key advantages:

- Seamless Integration for Kernel Subsystems: Kernel subsystems such as
  SMB and NFS can operate over QUIC seamlessly after the handshake,
  leveraging the net/handshake APIs.

- Standardized Socket APIs for QUIC: This implementation standardizes the
  socket APIs for QUIC, covering essential operations like listen, accept,
  connect, sendmsg, recvmsg, close, get/setsockopt, and getsock/peername().

- Efficient ALPN Routing: It incorporates ALPN routing within the kernel,
  efficiently directing incoming requests to the appropriate applications
  across different processes based on ALPN.

- Performance Enhancements: By minimizing data duplication through
  zero-copy techniques such as sendfile(), and paving the way for crypto
  offloading in NICs, this implementation enhances performance and prepares
  for future optimizations.

This implementation offers fundamental support for the following RFCs:

- RFC9000 - QUIC: A UDP-Based Multiplexed and Secure Transport
- RFC9001 - Using TLS to Secure QUIC
- RFC9002 - QUIC Loss Detection and Congestion Control
- RFC9221 - An Unreliable Datagram Extension to QUIC
- RFC9287 - Greasing the QUIC Bit
- RFC9368 - Compatible Version Negotiation for QUIC
- RFC9369 - QUIC Version 2

The socket APIs for QUIC follow the RFC draft [1]:

- The Sockets API Extensions for In-kernel QUIC Implementations

Implementation
==============

The core idea is to implement QUIC within the kernel, using a userspace
handshake approach.

Only the processing and creation of raw TLS Handshake Messages are handled
in userspace, facilitated by a TLS library like GnuTLS. These messages are
exchanged between kernel and userspace via sendmsg() and recvmsg(), with
cryptographic details conveyed through control messages (cmsg).

The entire QUIC protocol, aside from the TLS Handshake Messages processing
and creation, is managed within the kernel. Rather than using a Upper Layer
Protocol (ULP) layer, this implementation establishes a socket of type
IPPROTO_QUIC (similar to IPPROTO_MPTCP), operating over UDP tunnels.

For kernel consumers, they can initiate a handshake request from the kernel
to userspace using the existing net/handshake netlink. The userspace
component, such as tlshd service [2], then manages the processing
of the QUIC handshake request.

- Handshake Architecture:

  ┌──────┐  ┌──────┐
  │ APP1 │  │ APP2 │ ...
  └──────┘  └──────┘
  ┌──────────────────────────────────────────┐
  │     {quic_client/server_handshake()}     │<─────────────┐
  └──────────────────────────────────────────┘       ┌─────────────┐
   {send/recvmsg()}      {set/getsockopt()}          │    tlshd    │
   [CMSG handshake_info] [SOCKOPT_CRYPTO_SECRET]     └─────────────┘
                         [SOCKOPT_TRANSPORT_PARAM_EXT]    │   ^
                │ ^                  │ ^                  │   │
  Userspace     │ │                  │ │                  │   │
  ──────────────│─│──────────────────│─│──────────────────│───│───────
  Kernel        │ │                  │ │                  │   │
                v │                  v │                  v   │
  ┌──────────────────┬───────────────────────┐       ┌─────────────┐
  │ protocol, timer, │ socket (IPPROTO_QUIC) │<──┐   │ handshake   │
  │                  ├───────────────────────┤   │   │netlink APIs │
  │ common, family,  │ outqueue  |  inqueue  │   │   └─────────────┘
  │                  ├───────────────────────┤   │      │       │
  │ stream, connid,  │         frame         │   │   ┌─────┐ ┌─────┐
  │                  ├───────────────────────┤   │   │     │ │     │
  │ path, pnspace,   │         packet        │   │───│ SMB │ │ NFS │...
  │                  ├───────────────────────┤   │   │     │ │     │
  │ cong, crypto     │       UDP tunnels     │   │   └─────┘ └─────┘
  └──────────────────┴───────────────────────┘   └──────┴───────┘

- User Data Architecture:

  ┌──────┐  ┌──────┐
  │ APP1 │  │ APP2 │ ...
  └──────┘  └──────┘
   {send/recvmsg()}   {set/getsockopt()}              {recvmsg()}
   [CMSG stream_info] [SOCKOPT_KEY_UPDATE]            [EVENT conn update]
                      [SOCKOPT_CONNECTION_MIGRATION]  [EVENT stream update]
                      [SOCKOPT_STREAM_OPEN/RESET/STOP]
                │ ^               │ ^                     ^
  Userspace     │ │               │ │                     │
  ──────────────│─│───────────────│─│─────────────────────│───────────
  Kernel        │ │               │ │                     │
                v │               v │  ┌──────────────────┘
  ┌──────────────────┬───────────────────────┐
  │ protocol, timer, │ socket (IPPROTO_QUIC) │<──┐{kernel_send/recvmsg()}
  │                  ├───────────────────────┤   │{kernel_set/getsockopt()}
  │ common, family,  │ outqueue  |  inqueue  │   │{kernel_recvmsg()}
  │                  ├───────────────────────┤   │
  │ stream, connid,  │         frame         │   │   ┌─────┐ ┌─────┐
  │                  ├───────────────────────┤   │   │     │ │     │
  │ path, pnspace,   │         packet        │   │───│ SMB │ │ NFS │...
  │                  ├───────────────────────┤   │   │     │ │     │
  │ cong, crypto     │       UDP tunnels     │   │   └─────┘ └─────┘
  └──────────────────┴───────────────────────┘   └──────┴───────┘

Interface
=========

This implementation supports a mapping of QUIC into sockets APIs. Similar
to TCP and SCTP, a typical Server and Client use the following system call
sequence to communicate:

    Client                             Server
  ──────────────────────────────────────────────────────────────────────
  sockfd = socket(IPPROTO_QUIC)      listenfd = socket(IPPROTO_QUIC)
  bind(sockfd)                       bind(listenfd)
                                     listen(listenfd)
  connect(sockfd)
  quic_client_handshake(sockfd)
                                     sockfd = accecpt(listenfd)
                                     quic_server_handshake(sockfd, cert)

  sendmsg(sockfd)                    recvmsg(sockfd)
  close(sockfd)                      close(sockfd)
                                     close(listenfd)

Please note that quic_client_handshake() and quic_server_handshake()
functions are currently sourced from libquic [3]. These functions are
responsible for receiving and processing the raw TLS handshake messages
until the completion of the handshake process.

For utilization by kernel consumers, it is essential to have tlshd
service [2] installed and running in userspace. This service receives
and manages kernel handshake requests for kernel sockets. In the kernel,
the APIs closely resemble those used in userspace:

    Client                             Server
  ────────────────────────────────────────────────────────────────────────
  __sock_create(IPPROTO_QUIC, &sock)  __sock_create(IPPROTO_QUIC, &sock)
  kernel_bind(sock)                   kernel_bind(sock)
                                      kernel_listen(sock)
  kernel_connect(sock)
  tls_client_hello_x509(args:{sock})
                                      kernel_accept(sock, &newsock)
                                      tls_server_hello_x509(args:{newsock})

  kernel_sendmsg(sock)                kernel_recvmsg(newsock)
  sock_release(sock)                  sock_release(newsock)
                                      sock_release(sock)

Please be aware that tls_client_hello_x509() and tls_server_hello_x509()
are APIs from net/handshake/. They are used to dispatch the handshake
request to the userspace tlshd service and subsequently block until the
handshake process is completed.

Use Cases
=========

- Samba

  Stefan Metzmacher has submitted a merge request to integrate Linux QUIC
  into Samba for both client and server roles [4].

- tlshd

  The tlshd daemon [2] facilitates Linux QUIC handshake requests from
  kernel sockets. This is essential for enabling protocols like SMB
  and NFS over QUIC.

- curl

  Linux QUIC is being integrated into curl [5] for HTTP/3. Example usage:

  # curl --http3-only https://nghttp2.org:4433/
  # curl --http3-only https://www.google.com/
  # curl --http3-only https://facebook.com/
  # curl --http3-only https://outlook.office.com/
  # curl --http3-only https://cloudflare-quic.com/

- httpd-portable

  Moritz Buhl has deployed an HTTP/3 server over Linux QUIC [6] that is
  accessible via Firefox and curl:

  https://d.moritzbuhl.de/pub

Test Coverage
=============

The Coverage (gcov) of Functional and Interop Tests:

https://d.moritzbuhl.de/lcov

- Functional Tests

  The libquic self-tests (make check) ran on all major architectures:
  x86_64, i386, s390x, aarch64, ppc64le.

- Interop tests

  Interoperability was validated using the QUIC Interop Runner [7] against
  all major userland QUIC stacks. Results are available at:

  https://d.moritzbuhl.de/

- Fuzzing via Syzkaller

  Syzkaller has been running kernel fuzzing with QUIC for weeks using
  tests/syzkaller/ in libquic [3]..

- Performance Testing

  Performance was benchmarked using iperf [8] over a 100G NIC with
  using various MTUs and packet sizes:
  
  - QUIC vs. kTLS:
  
    UNIT        size:1024      size:4096      size:16384     size:65536
    Gbits/sec   QUIC | kTLS    QUIC | kTLS    QUIC | kTLS    QUIC | kTLS
    --------------------------------------------------------------------
    mtu:1500    2.27 | 3.26    3.02 | 6.97    3.36 | 9.74    3.48 | 10.8
    --------------------------------------------------------------------
    mtu:9000    3.66 | 3.72    5.87 | 8.92    7.03 | 11.2    8.04 | 11.4
  
  - QUIC(disable_1rtt_encryption) vs. TCP:
  
    UNIT        size:1024      size:4096      size:16384     size:65536
    Gbits/sec   QUIC | TCP     QUIC | TCP     QUIC | TCP     QUIC | TCP
    ────────────────────────────────────────────────────────────────────
    mtu:1500    3.09 | 4.59    4.46 | 14.2    5.07 | 21.3    5.18 | 23.9
    ────────────────────────────────────────────────────────────────────
    mtu:9000    4.60 | 4.65    8.41 | 14.0    11.3 | 28.9    13.5 | 39.2
  
  
  The performance gap between QUIC and kTLS may be attributed to:

  - The absence of Generic Segmentation Offload (GSO) for QUIC.
  - An additional data copy on the transmission (TX) path.
  - Extra encryption required for header protection in QUIC.
  - A longer header length for the stream data in QUIC.

Patches
=======

Note: This implementation is organized into five parts and submitted across
two patchsets for review. This patchset includes Parts 1–2, while Parts 3–5
will be submitted in a subsequent patchset. For complete series, see [9].

1. Infrastructure (2):

  net: define IPPROTO_QUIC and SOL_QUIC constants
  net: build socket infrastructure for QUIC protocol

2. Subcomponents (13):

  quic: provide common utilities and data structures
  quic: provide family ops for address and protocol
  quic: provide quic.h header files for kernel and userspace
  quic: add stream management
  quic: add connection id management
  quic: add path management
  quic: add congestion control
  quic: add packet number space
  quic: add crypto key derivation and installation
  quic: add crypto packet encryption and decryption
  quic: add timer management
  quic: add frame encoder and decoder base
  quic: add packet builder and parser base

3. Data Processing (7):

  quic: implement outqueue transmission and flow control
  quic: implement outqueue sack and retransmission
  quic: implement inqueue receiving and flow control
  quic: implement frame creation functions
  quic: implement frame processing functions
  quic: implement packet creation functions
  quic: implement packet processing functions

4. Socket APIs (6):

  quic: support bind/listen/connect/accept/close()
  quic: support sendmsg() and recvmsg()
  quic: support socket options related to interaction after handshake
  quic: support socket options related to settings prior to handshake
  quic: support socket options related to setup during handshake
  quic: support socket ioctls and socket dump via procfs

5. Example and Documentation (2):

  quic: create sample test using handshake APIs for kernel consumers
  Documentation: describe QUIC protocol interface in quic.rst

Notice:: The QUIC module is currently labeled as "EXPERIMENTAL".

All contributors are recognized in the respective patches with the tag of
'Signed-off-by:'. Special thanks to Moritz Buhl and Stefan Metzmacher whose
practical use cases and insightful feedback, which have been instrumental
in shaping the design and advancing the development.

References
==========

[1] https://datatracker.ietf.org/doc/html/draft-lxin-quic-socket-apis
[2] https://github.com/oracle/ktls-utils
[3] https://github.com/lxin/quic
[4] https://gitlab.com/samba-team/samba/-/merge_requests/4019
[5] https://github.com/moritzbuhl/curl/tree/linux_curl
[6] https://github.com/moritzbuhl/httpd-portable
[7] https://github.com/quic-interop/quic-interop-runner
[8] https://github.com/lxin/iperf
[9] https://github.com/lxin/net-next/commits/quic/

 include/linux/quic.h      |   19 +
 include/linux/socket.h    |    1 +
 include/uapi/linux/in.h   |    2 +
 include/uapi/linux/quic.h |  238 ++++++++
 net/Kconfig               |    1 +
 net/Makefile              |    1 +
 net/quic/Kconfig          |   35 ++
 net/quic/Makefile         |    9 +
 net/quic/common.c         |  482 +++++++++++++++
 net/quic/common.h         |  219 +++++++
 net/quic/cong.c           |  700 +++++++++++++++++++++
 net/quic/cong.h           |  120 ++++
 net/quic/connid.c         |  218 +++++++
 net/quic/connid.h         |  162 +++++
 net/quic/crypto.c         | 1201 +++++++++++++++++++++++++++++++++++++
 net/quic/crypto.h         |   83 +++
 net/quic/family.c         |  666 ++++++++++++++++++++
 net/quic/family.h         |   40 ++
 net/quic/frame.c          |  558 +++++++++++++++++
 net/quic/frame.h          |  192 ++++++
 net/quic/packet.c         |  889 +++++++++++++++++++++++++++
 net/quic/packet.h         |  129 ++++
 net/quic/path.c           |  507 ++++++++++++++++
 net/quic/path.h           |  162 +++++
 net/quic/pnspace.c        |  224 +++++++
 net/quic/pnspace.h        |  150 +++++
 net/quic/protocol.c       |  404 +++++++++++++
 net/quic/protocol.h       |   58 ++
 net/quic/socket.c         |  424 +++++++++++++
 net/quic/socket.h         |  221 +++++++
 net/quic/stream.c         |  549 +++++++++++++++++
 net/quic/stream.h         |  135 +++++
 net/quic/timer.c          |  196 ++++++
 net/quic/timer.h          |   47 ++
 34 files changed, 9042 insertions(+)
 create mode 100644 include/linux/quic.h
 create mode 100644 include/uapi/linux/quic.h
 create mode 100644 net/quic/Kconfig
 create mode 100644 net/quic/Makefile
 create mode 100644 net/quic/common.c
 create mode 100644 net/quic/common.h
 create mode 100644 net/quic/cong.c
 create mode 100644 net/quic/cong.h
 create mode 100644 net/quic/connid.c
 create mode 100644 net/quic/connid.h
 create mode 100644 net/quic/crypto.c
 create mode 100644 net/quic/crypto.h
 create mode 100644 net/quic/family.c
 create mode 100644 net/quic/family.h
 create mode 100644 net/quic/frame.c
 create mode 100644 net/quic/frame.h
 create mode 100644 net/quic/packet.c
 create mode 100644 net/quic/packet.h
 create mode 100644 net/quic/path.c
 create mode 100644 net/quic/path.h
 create mode 100644 net/quic/pnspace.c
 create mode 100644 net/quic/pnspace.h
 create mode 100644 net/quic/protocol.c
 create mode 100644 net/quic/protocol.h
 create mode 100644 net/quic/socket.c
 create mode 100644 net/quic/socket.h
 create mode 100644 net/quic/stream.c
 create mode 100644 net/quic/stream.h
 create mode 100644 net/quic/timer.c
 create mode 100644 net/quic/timer.h

-- 
2.47.1

