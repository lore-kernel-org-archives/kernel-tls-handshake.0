Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8E3164C3
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Dec 2025 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575585; cv=none; b=EgceusKflM5jlIuwjk7vv+JfhDv4anZV5T4ZBtCSCUVuKmgTEhodfhDHoOkOy+CjuE8DTm0V53YaQWX9C1HXnssDWXZdRNgpuecEXRTiOy0xqnU9wtt3Z/K2TZ5/RnwGSh5o4Fh0+w4mQZRF1ezmh6EDfeNJrS+2UDoO8OW0+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575585; c=relaxed/simple;
	bh=IaQBJ05qmtJ281ETg3IynFRG+qzyX9aBxbhbOREqdU4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TfcdZ+Xt020bb3zixyI1Atjy86nww64y9Wbf9ao93Q2T6/RbFof1ELNKZ/9oeH6QymXflMtOLUBqfHc8F/15UZGODWQoYWdBnftDZgAzaKxezUQ+9vbI9G8iRbcwUjCUm2x3Z09wZagcEyMJR+6iXUYFBT4D3+ybVmuyYlrgzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-656cc4098f3so9399758eaf.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Dec 2025 03:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575582; x=1767180382;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hbV8wPjusvHvwdrxWRBREEzkHQlFtKm2cv7V17viZA=;
        b=Qy3VkkuTtFdB4QOCsbvZnXdOD/zN+W0LUs3qc47bqLqux5CeplklwXlR+Uf/IYP0J7
         lSR8AYH8TlOF5IxlVXOfilS4zvZwON7TbXmubl0WYu/T55WDIHUG4ltuqyXSL5MOsIaa
         Thhv08SYfI5tLm/iUBxeAPWhhqb/BpQ/lLU0A+8BrXrM8A0prJMoR9T89BQUxdflCxlP
         N20PXJGwxWZUyzPj6jeMuJt+WEpg0uklbj/hVyXQVN57cZVU/zkYR5rQ0Fo0M0wAPYDU
         O0SPR6f+q2wYgyHjhkoNc2JFrAVSCETjjE3GCbqh4SA4e5mjKplNDB3sWOKhjTYYT7l2
         4++g==
X-Forwarded-Encrypted: i=1; AJvYcCULo3mrsyp+pgAsl5idHiEl4ipTnExa10Dba1BPeEI5bFg3JU3ySz37ZniEgOYi6/oXtDRP95VHzTvKuXv1QYva3z3erQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybIJHFu9RB0tUPpLf6XDHQj4OpWQp+vWnuB6mZEhVeft7PoEjI
	OJaboqqbyqkXvR6QMBBPl1PNL0AldSeL/ds9vcjrAggNtUgNv5BVejAeHb/A/3IyeEE7FhgqXt5
	PGH5TsUsnnIc0bEZ3zWvduvA4GzIm1nISwN/ItYO0jcwVglUwY1FqSTEZPwY=
X-Google-Smtp-Source: AGHT+IGjed8fAn9pFaNGrDkIGQ04215WCTQtN4hdNAxJDdgDQ5seGJHOnaEv4Du4fgGtnvglEYNWX0SrFy5rh88lEdoWzxUhP/dn
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4401:b0:659:9a49:8ffa with SMTP id
 006d021491bc7-65d0ea78479mr5930937eaf.39.1766575581901; Wed, 24 Dec 2025
 03:26:21 -0800 (PST)
Date: Wed, 24 Dec 2025 03:26:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <694bcddd.050a0220.35954c.001c.GAE@google.com>
Subject: [syzbot] [tls?] general protection fault in handshake_complete
From: syzbot <syzbot+dfffb6c26ee592ff9e83@syzkaller.appspotmail.com>
To: chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92fd6e84175b Add linux-next specific files for 20251125
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1416c57c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8705ffbbff9235f
dashboard link: https://syzkaller.appspot.com/bug?extid=dfffb6c26ee592ff9e83
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17df4f42580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1418a612580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/504ec57bbfb4/disk-92fd6e84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/90731c1057eb/vmlinux-92fd6e84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7066fa5b18b8/bzImage-92fd6e84.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dfffb6c26ee592ff9e83@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 1 UID: 0 PID: 6046 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:handshake_complete+0x36/0x350 net/handshake/request.c:288
Code: 54 53 48 83 ec 10 48 89 54 24 08 89 f5 49 89 ff 49 bd 00 00 00 00 00 fc ff df e8 05 5b 6e f6 49 8d 5f 28 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 ab ab d4 f6 48 8b 1b 4c 8d 63 30
RSP: 0018:ffffc90003447300 EFLAGS: 00010206
RAX: 0000000000000005 RBX: 0000000000000028 RCX: ffff888025ee9e80
RDX: 0000000000000000 RSI: 00000000fffffffb RDI: 0000000000000000
RBP: 00000000fffffffb R08: ffff888027a57103 R09: 1ffff11004f4ae20
R10: dffffc0000000000 R11: ffffed1004f4ae21 R12: ffff88807867a150
R13: dffffc0000000000 R14: dffffc0000000000 R15: 0000000000000000
FS:  0000555565002500(0000) GS:ffff888125b41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000000 CR3: 0000000075f40000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 handshake_nl_accept_doit+0x3c9/0x7f0 net/handshake/netlink.c:128
 genl_family_rcv_msg_doit+0x215/0x300 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2550
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec+0x18f/0x1d0 net/socket.c:728
 __sock_sendmsg net/socket.c:743 [inline]
 ____sys_sendmsg+0x577/0x880 net/socket.c:2626
 ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2680
 __sys_sendmsg net/socket.c:2712 [inline]
 __do_sys_sendmsg net/socket.c:2717 [inline]
 __se_sys_sendmsg net/socket.c:2715 [inline]
 __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdd1638f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcd38a9ef8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fdd165e5fa0 RCX: 00007fdd1638f749
RDX: 0000000000000000 RSI: 0000200000000000 RDI: 0000000000000003
RBP: 00007fdd16413f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fdd165e5fa0 R14: 00007fdd165e5fa0 R15: 0000000000000003
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:handshake_complete+0x36/0x350 net/handshake/request.c:288
Code: 54 53 48 83 ec 10 48 89 54 24 08 89 f5 49 89 ff 49 bd 00 00 00 00 00 fc ff df e8 05 5b 6e f6 49 8d 5f 28 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 ab ab d4 f6 48 8b 1b 4c 8d 63 30
RSP: 0018:ffffc90003447300 EFLAGS: 00010206
RAX: 0000000000000005 RBX: 0000000000000028 RCX: ffff888025ee9e80
RDX: 0000000000000000 RSI: 00000000fffffffb RDI: 0000000000000000
RBP: 00000000fffffffb R08: ffff888027a57103 R09: 1ffff11004f4ae20
R10: dffffc0000000000 R11: ffffed1004f4ae21 R12: ffff88807867a150
R13: dffffc0000000000 R14: dffffc0000000000 R15: 0000000000000000
FS:  0000555565002500(0000) GS:ffff888125b41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f52cc6e8286 CR3: 0000000075f40000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	54                   	push   %rsp
   1:	53                   	push   %rbx
   2:	48 83 ec 10          	sub    $0x10,%rsp
   6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   b:	89 f5                	mov    %esi,%ebp
   d:	49 89 ff             	mov    %rdi,%r15
  10:	49 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%r13
  17:	fc ff df
  1a:	e8 05 5b 6e f6       	call   0xf66e5b24
  1f:	49 8d 5f 28          	lea    0x28(%r15),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 ab ab d4 f6       	call   0xf6d4abe4
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	4c 8d 63 30          	lea    0x30(%rbx),%r12


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
