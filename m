Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446D749A
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 19:39:47 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id iw3so35406142plb.6
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680723587;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=42EpTHrEWfjv4l3gsOQ+9Xpz6zTy18j6x7TI1RSfVGo=;
        b=VUyVbLpkF2d8qhwOg+QoEZa/MBOwE0DSSH28BY/Fb8atdetuJRg2kdJjmFzqEvokAz
         2+wtpjazQTST03oyVLAfzYFqhqFqjXJ+NvVFf5OW6wjX6+qH40qAaTAEVYU3rPWRQt3L
         0Rplpg+GI7H7GzsOaZraq7Bc3RR/9iMHww8yCwjwWw1gOyCe1cB/v7F6nuvYJJA5sRUh
         M7q5SB+QlDlUwL03sPAq+5P/bh46hYoa+1xF8KDLFydGlMQLSps2NxR6scOBuMp8T8h2
         j6RuifzbJzl2jsnc138nfXXSQU9GvZtcim1/50KFBeDsTH9J/KG4mBxwWjkn/v1Vj/CJ
         MYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680723587;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42EpTHrEWfjv4l3gsOQ+9Xpz6zTy18j6x7TI1RSfVGo=;
        b=pKgzIpLjyV91yM5JI3Nm4dM0/tXblkZpVGWScqZul7Q1G3CgBW6tr3awTVkMDbiRw7
         tTL9vNrbuOy+1rMjXjdif9tH5kTMqTnkv3tCZ9XPIDBShqJKZA5wJISzLS4YzvOj6f4p
         D6HXjJiMl5uSpvGrrvpTevvMTxfLl7ADp+v+bP+G1tXcyw486XXyVRW+ebULM/FTTTXg
         x3JaM7gdvHNWADiv46FLKWjKrlkTMBvPPPkQ9xJtlwMi4lKuARC5zZUSxgg6bFO2RZbW
         gEyytOLkaq5Ej6RyxnK/QFAHs4SrUn6G3CiESOlZhTRIqD3Z282HybeGjitf1ZPdsIWS
         vFjw==
X-Gm-Message-State: AAQBX9dZgvu5ZlOZi3mYTkDJjCcQJvqe6t1MhX4Mk3nfH2pyexpJ7udW
	ovxsBCHikF47IGWTAlw6HBKQ8rw6v/IFtjt1H9NJPQosfHM=
X-Google-Smtp-Source: AKy350ZcbbyhnxQIvab7rszhAGFIC3zBL/fLwLyfHefPDSY1Uf4qxNnFgLQU9quJgiWc+76nbse0rSB+KA4vtgq1bDQ=
X-Received: by 2002:a17:902:f395:b0:19f:22b9:1f0 with SMTP id
 f21-20020a170902f39500b0019f22b901f0mr1580335ple.6.1680723586678; Wed, 05 Apr
 2023 12:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olga Kornievskaia <aglo@umich.edu>
Date: Wed, 5 Apr 2023 15:39:35 -0400
Message-ID: <CAN-5tyEhjsMW=GL5WJue3qPWx3+L2OLFxXSDzbH2y4e+aUJ23w@mail.gmail.com>
Subject: help debug
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chuck,

Can you help debug why an upcall isn't happening?

Client sends a null call tls, gets starttls response. But doesn't do
any upcall to the tlshd.

On the tracepoints it logs handshake_submit and then handshake_cancel.
There is nothing in "tlshd -s" past the start messages. Network traces
don't show that server is doing anything bad after sending the null
call reply.

Including the snippet of the handshake tracepoints (and whatever was
in between

   kworker/u16:1-6440    [006] ..... 10146.917766: handshake_submit:
req=000000008e5985ea sk=000000002dfa1873
          <idle>-0       [006] ..s2. 10147.035627: xs_data_ready:
peer=[10.63.20.131]:2049
   kworker/u16:1-6440    [006] ..... 10157.153020: handshake_cancel:
req=000000008e5985ea sk=000000002dfa1873
   kworker/u16:1-6440    [006] ..... 10157.153047:
rpc_tls_not_started: server=10.63.20.131 nfsv4
requested_policy=tls-anon

Any pointers to what might be going on or how to debug this further?

Here's startup stuff of tlshd.
[root@scs000128074 tlshd]# ./tlshd -s
tlshd[4564]: Built from ktls-utils 0.8 on Apr  5 2023 11:50:57
DBG<4>        lib/object.c:66   nl_object_alloc: Allocated new object 0xb56ad0
DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56b50: Allocated
new message, maxlen=4096
DBG<2>           lib/msg.c:518  nlmsg_put: msg 0xb56b50: Added netlink
header type=16, flags=0, pid=0, seq=0
DBG<2>           lib/msg.c:425  nlmsg_reserve: msg 0xb56b50: Reserved
4 (4) bytes, pad=4, nlmsg_len=20
DBG<2>     lib/genl/genl.c:358  genlmsg_put: msg 0xb56b50: Added
generic netlink header cmd=3 version=1
DBG<2>          lib/attr.c:474  nla_reserve: msg 0xb56b50: attr
<0xb578c4> 2: Reserved 16 (10) bytes at offset +4 nlmsg_len=36
DBG<2>          lib/attr.c:509  nla_put: msg 0xb56b50: attr <0xb578c4>
2: Wrote 10 bytes at offset +4
DBG<4>            lib/nl.c:343  nl_sendmsg: sent 36 bytes
DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a80
DBG<3>            lib/nl.c:845  recvmsgs: recvmsgs(0xb56a80): Read 164 bytes
DBG<3>            lib/nl.c:849  recvmsgs: recvmsgs(0xb56a80):
Processing valid message...
DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56c90: Allocated
new message, maxlen=164
DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
0xb56c90, 0 remaining
DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56c90: Freed
DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a80
DBG<3>            lib/nl.c:845  recvmsgs: recvmsgs(0xb56a80): Read 36 bytes
DBG<3>            lib/nl.c:849  recvmsgs: recvmsgs(0xb56a80):
Processing valid message...
DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56f00: Allocated
new message, maxlen=36
DBG<3>            lib/nl.c:897  recvmsgs: recvmsgs(0xb56a80):
Increased expected sequence number to 1680718792
DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
0xb56f00, 0 remaining
DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56f00: Freed
DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
0xb56b50, 0 remaining
DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56b50: Freed
DBG<4>        lib/object.c:221  nl_object_put: Returned object
reference 0xb56ad0, 0 remaining
DBG<4>        lib/object.c:187  nl_object_free: Freed object 0xb56ad0
DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a80


ktls-utils are at:
commit a00615232c0fc04caea066cd25c33f9ffc5d3fd2 (HEAD ->
04052022-v0.8-main, tag: ktls-utils-0.8, origin/main, origin/HEAD)
Author: Chuck Lever <chuck.lever@oracle.com>
Date:   Wed Apr 5 10:56:35 2023 -0400

    Release ktls-utils 0.8

    Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Kernel patches are at:
commit 46588cade103b446f74a7ee160a83cd2a80399e7 (HEAD ->
chuck-rpc-with-tls-04032023, chuck/topic-rpc-with-tls-upcall)
Author: Chuck Lever <chuck.lever@oracle.com>
Date:   Mon May 24 17:07:29 2021 -0400

    NFS: Add an "xprtsec=" NFS mount option
