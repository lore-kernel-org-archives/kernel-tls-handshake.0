Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAB20EB
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Oct 2023 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="B/Pd0gX3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b95622c620so1357253166b.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Oct 2023 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1697720411; x=1698325211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8Ms0yNFRQJK9861ZM5MWFRhg9RkBb72jPqvrqjteFk=;
        b=B/Pd0gX3EKczhUmxi3eT6Wf1hnWAsiG6x0QbVIYXEFCJETVgt2oMYdEQgdJT6wHoRS
         HLQbDjATb+/4ZSlvbB0xUUuryqJTLJtz55slvURxY3uWB4f2YUJGpj6WRZCZRt4GXbaG
         2GDfcx7ic5I2txojT1zs7dV5SUnubl6sbFAHcY+UDIthiYRnc85X5ZHY4fJSqPM0wzTq
         0NssCL56m7drQIu5hUjy5rf59+knukmTGmaglrykTg0R61UNj6NPspHCGVWlXEXhktGo
         GiFwHHaiwq4WaQ461OEi75q2QlVUMJLC7F7pWrTjoD9ySDohJTX9sfWVHzn/jlYN4h3H
         IRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697720411; x=1698325211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8Ms0yNFRQJK9861ZM5MWFRhg9RkBb72jPqvrqjteFk=;
        b=fgURTO+iuDWodE45zG/VnapP+IUNnE6uSZWL7KDHmZqmSiGlBWON4+Bn5vNTEzVBU7
         DAzrZXbBQuoUPt/vOnTmoSHO94M7Of1uQTVLYweD5WIamqnq/hl8faGa99jbpR5yObaS
         Luqm7/0FifjtZ7XrBo2BH2MM2/2Q5U0Kxb97xmM6Of17LEsEQbx98IpgwalUtED0FECo
         UXTbSiJBs/zjzymto6qpW0qVsRLoIuoDOxuyVE+jgpMkq+pYk04MxYPIeAyMSf4+hBFG
         x6kP/ZUZWTT6PnEqAA2+bqbPz4/oyN/0dplu8GvF2OcWBccpajUJfYFqSXyHxp+Ykf/1
         lAIQ==
X-Gm-Message-State: AOJu0YzGlcGs8eSCFg0DeIehNCnD+LaV+yyMspIwP69z00tf95SRUMhH
	kXB1hXVEebTS7Ak40XZBziIdMQ==
X-Google-Smtp-Source: AGHT+IFEsX/rmUK3axy1+vj7JHvPLXTOSHGyV7XlPdMRtNw5zB3qQtNj1ewyE6Ej8rQgjfky4LOJlw==
X-Received: by 2002:a17:907:36c5:b0:9b2:b153:925 with SMTP id bj5-20020a17090736c500b009b2b1530925mr1821535ejc.21.1697720410816;
        Thu, 19 Oct 2023 06:00:10 -0700 (PDT)
Received: from localhost.localdomain (2a02-8388-1ac6-6200-94b0-27b3-1dd9-8373.cable.dynamic.v6.surfer.at. [2a02:8388:1ac6:6200:94b0:27b3:1dd9:8373])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906081000b009c4cb1553edsm3510463ejd.95.2023.10.19.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:00:10 -0700 (PDT)
From: =?UTF-8?q?Moritz=20Wanzenb=C3=B6ck?= <moritz.wanzenboeck@linbit.com>
To: netdev@vger.kernel.org,
	kernel-tls-handshake@lists.linux.dev
Cc: chuck.lever@oracle.com,
	=?UTF-8?q?Moritz=20Wanzenb=C3=B6ck?= <moritz.wanzenboeck@linbit.com>
Subject: [PATCH] net/handshake: fix file ref count in handshake_nl_accept_doit()
Date: Thu, 19 Oct 2023 14:58:47 +0200
Message-ID: <20231019125847.276443-1-moritz.wanzenboeck@linbit.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If req->hr_proto->hp_accept() fail, we call fput() twice:
Once in the error path, but also a second time because sock->file
is at that point already associated with the file descriptor. Once
the task exits, as it would probably do after receiving an error
reading from netlink, the fd is closed, calling fput() a second time.

To fix, we move installing the file after the error path for the
hp_accept() call. In the case of errors we simply put the unused fd.
In case of success we can use fd_install() to link the sock->file
to the reserved fd.

Fixes: 7ea9c1ec66bc ("net/handshake: Fix handshake_dup() ref counting")
Signed-off-by: Moritz Wanzenböck <moritz.wanzenboeck@linbit.com>
---
 net/handshake/netlink.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 64a0046dd611..89637e732866 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -87,29 +87,6 @@ struct nlmsghdr *handshake_genl_put(struct sk_buff *msg,
 }
 EXPORT_SYMBOL(handshake_genl_put);
 
-/*
- * dup() a kernel socket for use as a user space file descriptor
- * in the current process. The kernel socket must have an
- * instatiated struct file.
- *
- * Implicit argument: "current()"
- */
-static int handshake_dup(struct socket *sock)
-{
-	struct file *file;
-	int newfd;
-
-	file = get_file(sock->file);
-	newfd = get_unused_fd_flags(O_CLOEXEC);
-	if (newfd < 0) {
-		fput(file);
-		return newfd;
-	}
-
-	fd_install(newfd, file);
-	return newfd;
-}
-
 int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net *net = sock_net(skb->sk);
@@ -133,17 +110,20 @@ int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
 		goto out_status;
 
 	sock = req->hr_sk->sk_socket;
-	fd = handshake_dup(sock);
+	fd = get_unused_fd_flags(O_CLOEXEC);
 	if (fd < 0) {
 		err = fd;
 		goto out_complete;
 	}
+
 	err = req->hr_proto->hp_accept(req, info, fd);
 	if (err) {
-		fput(sock->file);
+		put_unused_fd(fd);
 		goto out_complete;
 	}
 
+	fd_install(fd, get_file(sock->file));
+
 	trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
 	return 0;
 
-- 
2.41.0

