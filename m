Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28672175D4A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Sep 2024 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725935517; cv=none; b=e3AxFpnK+jDSPDX0AoBkZ0uQvUABdPF25eZ3Lo2DwRxJ2Q/lXVgm2mBiwLL2e/VEL2WBi6UURIglAjW2YoLgDHK6DTvOn5BQPXfN8kUroL8csAI9ZEwitHDPSbXOdW9vG5I96/WpjQekob29BATrntzD1jQJj/cIZbMIKZ+T6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725935517; c=relaxed/simple;
	bh=v8N7gGh5VHzWk/PLIveuXu1b8AiQbdtu4C+Tc920UKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q15m1gEd0P4k3GU1R9lK5qO7XFT7wC5O4/1Yj0EhoBiiQAmvafAZQ6kpzcHRvN7cYJkZBKPvzGmeFnI9lVygvfUqUEdqwiqAXwrehBLL3er+C/ARA0gMhM0Yy/FW+sPGZ7h4Lo3rsQfrDSyuZEmZs6zC2bn9Eg9SzZ3LAKyoquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqE+eNOy; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqE+eNOy"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a4df9dc885so393848485a.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 09 Sep 2024 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725935514; x=1726540314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glCv2UPk1vfL0Pg7onmm7ZTagJVD9TAE1YcTqtVpNSE=;
        b=mqE+eNOy9GjdpBOIxxzLiIYkddnBn6WLuzpn4yY7GKRx0mPj8PS1pGn9QNtiIxDUCG
         nlGx/pjyQftOFU5tscC4zqPz3bU7LrtsG5J1/ngr8LkFgNAxMBYdVGM8Q4bi9b+NswrA
         XLAAbijheGtW8tB89WVfnnFgjxKrE+3rvkxpVPRBQwAEuAZzlu+VKE9MQ1R7w2aBwCcQ
         H7ah6RjVeumkq53/Kd4SqyAGAb9ZGRNwvFaNCael2THke7flfXcThNcpaDSE+eHTPKef
         /6yJ3FZhWeM5xcNutb5I19ZnuGLLrdFgtUaQGysBaL9eCRTgEJ3O7/XCmXU6x5zaB2w4
         6XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725935514; x=1726540314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glCv2UPk1vfL0Pg7onmm7ZTagJVD9TAE1YcTqtVpNSE=;
        b=Xn0gq/Q0VzQIlZOLzRT+W0IAT5xRJpPl81Bd6yDYg4foaC+6spSP1wHUlBCP5P9xB/
         X4SpZqe0WpYLiTdY77TDcGvicrwzk6e/yI/RwbZK3jQCX2H+AFxqdeJpjqJwOSZV9gM8
         dOWAediMPUcT94GGjmbTByLTPpwiS0zyiZpXJS66ahSe7Dh/QUowxWHCcYnaJ8jW4BZy
         KQ24bMw1uKzWmAZK5QTdTtRatqmvAGRf5NkIhQf3DyYsS7wi0s4r6MX5fRooZK/cKZnx
         TXYN7kEVg1dDXWLBabIkRIbD+6d3wvEbL1YSl+yIC4otU8hhlS6TvMfo+57VvMWy7hpB
         cNzg==
X-Forwarded-Encrypted: i=1; AJvYcCW5W0/w5y9Kf8+gc8yXZchT6vpGo3F4TkPpbNlbJCi6uyj2UcaCBoqSTNkOB/eD6ISV+2sbBq3TY0+dbMh5OVesXr0U1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVKvSsgW0aEkzgIkuXn0a5jMhXxYnsftvBbJSUpozCBhRkF3DE
	vmM0avfAdArQ9BICiBEhzJS7BlImmfXWBnK/wvWt3giSssybdQ72
X-Google-Smtp-Source: AGHT+IHJCznt/z0iSUC9Y50Fvxe3vfR3foELbEkBuz99C4kQQHVSNPPhM84HaaSdnY3253KQqJueJA==
X-Received: by 2002:a05:620a:450c:b0:7a7:d6f2:95f8 with SMTP id af79cd13be357-7a9bf9acddamr300109985a.20.1725935512310;
        Mon, 09 Sep 2024 19:31:52 -0700 (PDT)
Received: from wsfd-netdev15.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a1f594sm270429885a.121.2024.09.09.19.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 19:31:51 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 5/5] Documentation: introduce quic.rst to provide description of QUIC protocol
Date: Mon,  9 Sep 2024 22:30:20 -0400
Message-ID: <36790cc2aa374d098bc0ec40bcca4ee43e071e46.1725935420.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1725935420.git.lucien.xin@gmail.com>
References: <cover.1725935420.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit adds quic.rst to the documentation directory, providing
comprehensive information about the QUIC protocol. This new file
serves as a reference for users and developers seeking details on
QUIC implementation and usage.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Moritz Buhl <mbuhl@openbsd.org>
Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
---
 Documentation/networking/quic.rst | 178 ++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/networking/quic.rst

diff --git a/Documentation/networking/quic.rst b/Documentation/networking/quic.rst
new file mode 100644
index 000000000000..461eec9c504d
--- /dev/null
+++ b/Documentation/networking/quic.rst
@@ -0,0 +1,178 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Linux Kernel QUIC
+=================
+
+Introduction
+============
+
+The QUIC protocol, as defined in RFC9000, offers a UDP-based, secure
+transport with flow-controlled streams for efficient communication,
+low-latency connection setup, and network path migration, ensuring
+confidentiality, integrity, and availability across various deployments.
+
+This implementation introduces QUIC support in Linux Kernel, offering
+several key advantages:
+
+- Seamless Integration for Kernel Subsystems: Kernel subsystems such as
+  SMB and NFS can operate over QUIC seamlessly after the handshake,
+  leveraging the net/handshake APIs.
+
+- Standardized Socket APIs for QUIC: This implementation standardizes the
+  socket APIs for QUIC, covering essential operations like listen, accept,
+  connect, sendmsg, recvmsg, close, get/setsockopt, and getsock/peername().
+
+- Efficient ALPN Routing: It incorporates ALPN routing within the kernel,
+  efficiently directing incoming requests to the appropriate applications
+  across different processes based on ALPN.
+
+- Performance Enhancements: By minimizing data duplication through
+  zero-copy techniques such as sendfile(), and paving the way for crypto
+  offloading in NICs, this implementation enhances performance and prepares
+  for future optimizations.
+
+This implementation offers fundamental support for the following RFCs:
+
+- RFC9000 - QUIC: A UDP-Based Multiplexed and Secure Transport
+- RFC9001 - Using TLS to Secure QUIC
+- RFC9002 - QUIC Loss Detection and Congestion Control
+- RFC9221 - An Unreliable Datagram Extension to QUIC
+- RFC9287 - Greasing the QUIC Bit
+- RFC9368 - Compatible Version Negotiation for QUIC
+- RFC9369 - QUIC Version 2
+
+The socket APIs for QUIC follow the RFC draft [1]:
+
+- The Sockets API Extensions for In-kernel QUIC Implementations
+
+Implementation
+==============
+
+The core idea is to implement QUIC within the kernel, using a userspace
+handshake approach.
+
+Only the processing and creation of raw TLS Handshake Messages are handled
+in userspace, facilitated by a TLS library like GnuTLS. These messages are
+exchanged between kernel and userspace via sendmsg() and recvmsg(), with
+cryptographic details conveyed through control messages (cmsg).
+
+The entire QUIC protocol, aside from the TLS Handshake Messages processing
+and creation, is managed within the kernel. Rather than using a Upper Layer
+Protocol (ULP) layer, this implementation establishes a socket of type
+IPPROTO_QUIC (similar to IPPROTO_MPTCP), operating over UDP tunnels.
+
+Kernel consumers can initiate a handshake request from the kernel to
+userspace using the existing net/handshake netlink. The userspace
+component, such as tlshd service [2], then manages the processing
+of the QUIC handshake request.
+
+- Handshake Architecture:
+
+  ┌──────┐  ┌──────┐
+  │ APP1 │  │ APP2 │ ...
+  └──────┘  └──────┘
+  ┌──────────────────────────────────────────┐
+  │     {quic_client/server_handshake()}     │<─────────────┐
+  └──────────────────────────────────────────┘       ┌─────────────┐
+   {send/recvmsg()}      {set/getsockopt()}          │    tlshd    │
+   [CMSG handshake_info] [SOCKOPT_CRYPTO_SECRET]     └─────────────┘
+                         [SOCKOPT_TRANSPORT_PARAM_EXT]    │   ^
+                │ ^                  │ ^                  │   │
+  Userspace     │ │                  │ │                  │   │
+  ──────────────│─│──────────────────│─│──────────────────│───│────────
+  Kernel        │ │                  │ │                  │   │
+                v │                  v │                  v   │
+  ┌──────────────────────────────────────────┐       ┌─────────────┐
+  │ socket (IPPROTO_QUIC) |     protocol     │<──┐   │ handshake   │
+  ├──────────────────────────────────────────┤   │   │netlink APIs │
+  │ stream | connid | cong  | path  | timer  │   │   └─────────────┘
+  ├──────────────────────────────────────────┤   │      │       │
+  │  packet  |  frame  |  crypto  |  pnmap   │   │   ┌─────┐ ┌─────┐
+  ├──────────────────────────────────────────┤   │   │     │ │     │
+  │        input       |       output        │   │───│ SMB │ │ NFS │...
+  ├──────────────────────────────────────────┤   │   │     │ │     │
+  │                UDP tunnels               │   │   └─────┘ └─────┘
+  └──────────────────────────────────────────┘   └──────┴───────┘
+
+- User Data Architecture:
+
+  ┌──────┐  ┌──────┐
+  │ APP1 │  │ APP2 │ ...
+  └──────┘  └──────┘
+   {send/recvmsg()}      {set/getsockopt()}
+   [CMSG stream_info]    [SOCKOPT_KEY_UPDATE]
+                         [SOCKOPT_CONNECTION_MIGRATION]
+                         [SOCKOPT_STREAM_OPEN/RESET/STOP_SENDING]
+                │ ^                  │ ^
+  Userspace     │ │                  │ │
+  ──────────────│─│──────────────────│─│────────────────────────
+  Kernel        │ │                  │ │
+                v │                  v │
+  ┌──────────────────────────────────────────┐
+  │ socket (IPPROTO_QUIC) |     protocol     │<──┐{kernel_send/recvmsg()}
+  ├──────────────────────────────────────────┤   │{kernel_set/getsockopt()}
+  │ stream | connid | cong  | path  | timer  │   │
+  ├──────────────────────────────────────────┤   │
+  │  packet  |  frame  |  crypto  |  pnmap   │   │   ┌─────┐ ┌─────┐
+  ├──────────────────────────────────────────┤   │   │     │ │     │
+  │        input       |       output        │   │───│ SMB │ │ NFS │...
+  ├──────────────────────────────────────────┤   │   │     │ │     │
+  │                UDP tunnels               │   │   └─────┘ └─────┘
+  └──────────────────────────────────────────┘   └──────┴───────┘
+
+Usage
+=====
+
+This implementation supports a mapping of QUIC into sockets APIs. Similar
+to TCP and SCTP, a typical Server and Client use the following system call
+sequence to communicate:
+
+    Client                             Server
+  ──────────────────────────────────────────────────────────────────────
+  sockfd = socket(IPPROTO_QUIC)      listenfd = socket(IPPROTO_QUIC)
+  bind(sockfd)                       bind(listenfd)
+                                     listen(listenfd)
+  connect(sockfd)
+  quic_client_handshake(sockfd)
+                                     sockfd = accecpt(listenfd)
+                                     quic_server_handshake(sockfd, cert)
+
+  sendmsg(sockfd)                    recvmsg(sockfd)
+  close(sockfd)                      close(sockfd)
+                                     close(listenfd)
+
+Please note that quic_client_handshake() and quic_server_handshake()
+functions are currently sourced from libquic [3]. These functions are
+responsible for receiving and processing the raw TLS handshake messages
+until the completion of the handshake process.
+
+For utilization by kernel consumers, it is essential to have tlshd
+service [2] installed and running in userspace. This service receives
+and manages kernel handshake requests for kernel sockets. In the kernel,
+the APIs closely resemble those used in userspace:
+
+    Client                             Server
+  ────────────────────────────────────────────────────────────────────────
+  __sock_create(IPPROTO_QUIC, &sock)  __sock_create(IPPROTO_QUIC, &sock)
+  kernel_bind(sock)                   kernel_bind(sock)
+                                      kernel_listen(sock)
+  kernel_connect(sock)
+  tls_client_hello_x509(args:{sock})
+                                      kernel_accept(sock, &newsock)
+                                      tls_server_hello_x509(args:{newsock})
+
+  kernel_sendmsg(sock)                kernel_recvmsg(newsock)
+  sock_release(sock)                  sock_release(newsock)
+                                      sock_release(sock)
+
+Please be aware that tls_client_hello_x509() and tls_server_hello_x509()
+are APIs from net/handshake/. They are used to dispatch the handshake
+request to the userspace tlshd service and subsequently block until the
+handshake process is completed.
+
+The QUIC module is currently labeled as "EXPERIMENTAL".
+
+[1] https://datatracker.ietf.org/doc/draft-lxin-quic-socket-apis
+[2] https://github.com/oracle/ktls-utils
+[3] https://github.com/lxin/quic
-- 
2.43.0

