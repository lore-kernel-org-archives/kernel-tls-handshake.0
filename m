Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2EE23AB88
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815608; cv=none; b=IP8QiYPupYo3BXw+SB5/i3Uo4fD6c86BRwuijTk6W/f4BbLoXEWrRswNYwxZMIoG2TOa35NvMKcdakTKGYvX2YFA/fanjuUwA4LKnmJm1aR2vYelwnkjeh8YYwusYUA5KWmZaNXIk2eThMIemx9PPNCzdt2fipGhfmFrpHDoi1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815608; c=relaxed/simple;
	bh=uhrnl9/zry7673UysahyzBHHm2J/Poy7duc6OEBGMA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkL4RIHMXpF1nixr3exAixOWzbVpRzrRVuU4VZAxLGjmEj0afXXlOjNgcJpDwBunjy22747fErwB6S0QuXmL+/FMXZCfuNk71Z9Vh1fSOI6gJgdAiNUiF4LATg6RuX2rtlZcjaqUS+aLNQcoAXOeSa+Sh3Ma9WYoRyHilFJmA5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHRV2qJl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHRV2qJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758815605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OrJvNgCuQzdfzmUeCSm/G5uSYVaKQkZM113wfPJo/0=;
	b=cHRV2qJlqJQXSPYZ6I+SPNeOk4km5AoFiik6Wgf76IIm8Qt2sGqroQVFws5+RgQR5SRgKC
	k4a3MNizHdbNFjefXK/xx+EDS23K0y2t3QsetOguq43VwXBVceRewJSijnavgUagas/Zvf
	nVXiXVY3fUHbkmV4qGkR4/YQCEl9i28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-xgsYv7owOfaZK7RwIgSbAQ-1; Thu, 25 Sep 2025 11:53:23 -0400
X-MC-Unique: xgsYv7owOfaZK7RwIgSbAQ-1
X-Mimecast-MFC-AGG-ID: xgsYv7owOfaZK7RwIgSbAQ_1758815602
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e1e147cc0so8648865e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815602; x=1759420402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OrJvNgCuQzdfzmUeCSm/G5uSYVaKQkZM113wfPJo/0=;
        b=XU82SdVobUQfT40PWz1ytgrAeexe39L8UgroGyIDcrVhglz2CovF9LpkZnnMJ3jjTv
         Hk/8XJzpDVelReKjykU6IYi8kvdL7SWTLzuKJXgMo4g1r11vWVeJSL0Q75b11MI0DgnE
         uqILU978EaLs6bxo6ZgFRejDwH5zSlBduafnFtUErVQnOd2Q7BMNwxmSzsbKaSnQzcGx
         20GN9xMQ5d6c2N14aftxpIRtkw1hryad+FSHr8k2EZfgpk19+jRTsBG1+2KsvQJJUQlk
         NBvGJpEHKSJbtarLkc4dkEBaMxbQPxzrpIC3f6fbD8BYJ24KoecgkVwKzJDW4wOCt1BM
         W29g==
X-Forwarded-Encrypted: i=1; AJvYcCW2uSXmRPEbWlN/uK5X+zA1rjSA2Q5S9WYF+D08OT3fDPrpLHTHA10y/Yt8+LL4/S9GjFojnOz7gjg3IuN+Ouf5XZnvIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypbrXREUT2rXiwi2QgcwJX0Sq7TincflPfpPQOTjuJhD+b2+Sz
	pGIGYA2IyUAf9/J1xsiL2bcltReKwumfshSxsIBD2Po2GURPin1XN5IAY05Mj9vJ0BamkYSeJFg
	4Oura4uhKsGxm26ykMOGvq2/bmEzSskUPAXG6h7FOYcxCv2YLgxANX2sD8oqOUTtcsAv033nD1Q
	4T
X-Gm-Gg: ASbGncvuuXkkS+3jcxsN1czRufWcuT8NRPd5D7+FAHu2IGrdiwKsM5RddaVElNYnw3A
	jsEbbT9T/Tr52z4HBrsjcGUU6HCiBcFXvmqE/ltPvcnqnMt9Nzqy3uwRZ/tyTiYd1w3fb6v8hr5
	nnsdnny2VIjGh6pCYZt/xJ8irzSaCdOoKe7OB9DigdHLmK/RQXniJUp9/9DkSZsEzb8WxcV7xR7
	yo5/l5Ag0QxCgB9XIMJdwxNAHQ8W9UwFkx2LF3iT/r12ySoUZw1Sa84hb+1iFZbTzFqAN6QeMkH
	0Kpf0T9SToXKGfOhcwUxQ/u3kBPi8cR4oz8M2EhXJDXaXonShv90wb+3ksI/whMzv/2bZJFpaPS
	SNLx/xQz7ERmu
X-Received: by 2002:a05:600c:4fca:b0:46d:45e:350a with SMTP id 5b1f17b1804b1-46e329fb93bmr51962625e9.17.1758815602296;
        Thu, 25 Sep 2025 08:53:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd/YGP++P29xvYlWaHsbhyiic8rLVGyrhoHU5/VBmu8xkfMajHVZFOJ8S86WjXkLBx18y+pw==
X-Received: by 2002:a05:600c:4fca:b0:46d:45e:350a with SMTP id 5b1f17b1804b1-46e329fb93bmr51961875e9.17.1758815601737;
        Thu, 25 Sep 2025 08:53:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab48c28sm81521455e9.18.2025.09.25.08.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:53:21 -0700 (PDT)
Message-ID: <ada89946-b0c2-4679-9918-1c89cf2be0c6@redhat.com>
Date: Thu, 25 Sep 2025 17:53:18 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 02/15] net: build socket infrastructure for
 QUIC protocol
To: Xin Long <lucien.xin@gmail.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev,
 davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1758234904.git.lucien.xin@gmail.com>
 <b55a2141a1d5aa31cd57be3d22bb8a5f8d40b7e2.1758234904.git.lucien.xin@gmail.com>
 <7fa38c12-eece-45ae-87b2-da1445c62134@redhat.com>
 <CADvbK_dxOHmDycm1D3-Ga4YSP7E2S91SQD1bdL+u2s-f+=Bkxg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CADvbK_dxOHmDycm1D3-Ga4YSP7E2S91SQD1bdL+u2s-f+=Bkxg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rct2iy8w1rdsc2iTwdrPsHpHH4Ix4fuNcGq6PUhW3c4_1758815602
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/23/25 5:47 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 7:07 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 9/19/25 12:34 AM, Xin Long wrote:
>>> This patch lays the groundwork for QUIC socket support in the kernel.
>>> It defines the core structures and protocol hooks needed to create
>>> QUIC sockets, without implementing any protocol behavior at this stage.
>>>
>>> Basic integration is included to allow building the module via
>>> CONFIG_IP_QUIC=m.
>>>
>>> This provides the scaffolding necessary for adding actual QUIC socket
>>> behavior in follow-up patches.
>>>
>>> Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
>>> Signed-off-by: Xin Long <lucien.xin@gmail.com>
>>> ---
>>> v3:
>>>   - Kconfig: add 'default n' for IP_QUIC (reported by Paolo).
>>>   - quic_disconnect(): return -EOPNOTSUPP (suggested by Paolo).
>>>   - quic_init/destroy_sock(): drop local_bh_disable/enable() calls (noted
>>>     by Paolo).
>>>   - sysctl: add alpn_demux option to en/disable ALPN-based demux.
>>>   - SNMP: remove SNMP_MIB_SENTINEL, switch to
>>>     snmp_get_cpu_field_batch_cnt() to align with latest net-next changes.
>>> ---
>>>  net/Kconfig         |   1 +
>>>  net/Makefile        |   1 +
>>>  net/quic/Kconfig    |  36 +++++
>>>  net/quic/Makefile   |   8 +
>>>  net/quic/protocol.c | 379 ++++++++++++++++++++++++++++++++++++++++++++
>>>  net/quic/protocol.h |  56 +++++++
>>>  net/quic/socket.c   | 207 ++++++++++++++++++++++++
>>>  net/quic/socket.h   |  79 +++++++++
>>>  8 files changed, 767 insertions(+)
>>>  create mode 100644 net/quic/Kconfig
>>>  create mode 100644 net/quic/Makefile
>>>  create mode 100644 net/quic/protocol.c
>>>  create mode 100644 net/quic/protocol.h
>>>  create mode 100644 net/quic/socket.c
>>>  create mode 100644 net/quic/socket.h
>>>
>>> diff --git a/net/Kconfig b/net/Kconfig
>>> index d5865cf19799..1205f5b7cf59 100644
>>> --- a/net/Kconfig
>>> +++ b/net/Kconfig
>>> @@ -249,6 +249,7 @@ source "net/bridge/netfilter/Kconfig"
>>>
>>>  endif # if NETFILTER
>>>
>>> +source "net/quic/Kconfig"
>>>  source "net/sctp/Kconfig"
>>>  source "net/rds/Kconfig"
>>>  source "net/tipc/Kconfig"
>>> diff --git a/net/Makefile b/net/Makefile
>>> index aac960c41db6..7c6de28e9aa5 100644
>>> --- a/net/Makefile
>>> +++ b/net/Makefile
>>> @@ -42,6 +42,7 @@ obj-$(CONFIG_PHONET)                += phonet/
>>>  ifneq ($(CONFIG_VLAN_8021Q),)
>>>  obj-y                                += 8021q/
>>>  endif
>>> +obj-$(CONFIG_IP_QUIC)                += quic/
>>>  obj-$(CONFIG_IP_SCTP)                += sctp/
>>>  obj-$(CONFIG_RDS)            += rds/
>>>  obj-$(CONFIG_WIRELESS)               += wireless/
>>> diff --git a/net/quic/Kconfig b/net/quic/Kconfig
>>> new file mode 100644
>>> index 000000000000..1f10a452b3a1
>>> --- /dev/null
>>> +++ b/net/quic/Kconfig
>>> @@ -0,0 +1,36 @@
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +#
>>> +# QUIC configuration
>>> +#
>>> +
>>> +menuconfig IP_QUIC
>>> +     tristate "QUIC: A UDP-Based Multiplexed and Secure Transport (Experimental)"
>>> +     depends on INET
>>> +     depends on IPV6
>>> +     select CRYPTO
>>> +     select CRYPTO_HMAC
>>> +     select CRYPTO_HKDF
>>> +     select CRYPTO_AES
>>> +     select CRYPTO_GCM
>>> +     select CRYPTO_CCM
>>> +     select CRYPTO_CHACHA20POLY1305
>>> +     select NET_UDP_TUNNEL
>>> +     default n
>>> +     help
>>> +       QUIC: A UDP-Based Multiplexed and Secure Transport
>>> +
>>> +       From rfc9000 <https://www.rfc-editor.org/rfc/rfc9000.html>.
>>> +
>>> +       QUIC provides applications with flow-controlled streams for structured
>>> +       communication, low-latency connection establishment, and network path
>>> +       migration.  QUIC includes security measures that ensure
>>> +       confidentiality, integrity, and availability in a range of deployment
>>> +       circumstances.  Accompanying documents describe the integration of
>>> +       TLS for key negotiation, loss detection, and an exemplary congestion
>>> +       control algorithm.
>>> +
>>> +       To compile this protocol support as a module, choose M here: the
>>> +       module will be called quic. Debug messages are handled by the
>>> +       kernel's dynamic debugging framework.
>>> +
>>> +       If in doubt, say N.
>>> diff --git a/net/quic/Makefile b/net/quic/Makefile
>>> new file mode 100644
>>> index 000000000000..020e4dd133d8
>>> --- /dev/null
>>> +++ b/net/quic/Makefile
>>> @@ -0,0 +1,8 @@
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +#
>>> +# Makefile for QUIC support code.
>>> +#
>>> +
>>> +obj-$(CONFIG_IP_QUIC) += quic.o
>>> +
>>> +quic-y := protocol.o socket.o
>>> diff --git a/net/quic/protocol.c b/net/quic/protocol.c
>>> new file mode 100644
>>> index 000000000000..f79f43f0c17f
>>> --- /dev/null
>>> +++ b/net/quic/protocol.c
>>> @@ -0,0 +1,379 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/* QUIC kernel implementation
>>> + * (C) Copyright Red Hat Corp. 2023
>>> + *
>>> + * This file is part of the QUIC kernel implementation
>>> + *
>>> + * Initialization/cleanup for QUIC protocol support.
>>> + *
>>> + * Written or modified by:
>>> + *    Xin Long <lucien.xin@gmail.com>
>>> + */
>>> +
>>> +#include <net/inet_common.h>
>>> +#include <linux/proc_fs.h>
>>> +#include <net/protocol.h>
>>> +#include <net/rps.h>
>>> +#include <net/tls.h>
>>> +
>>> +#include "socket.h"
>>> +
>>> +static unsigned int quic_net_id __read_mostly;
>>> +
>>> +struct percpu_counter quic_sockets_allocated;
>>> +
>>> +long sysctl_quic_mem[3];
>>> +int sysctl_quic_rmem[3];
>>> +int sysctl_quic_wmem[3];
>>> +int sysctl_quic_alpn_demux;
>>> +
>>> +static int quic_inet_connect(struct socket *sock, struct sockaddr *addr, int addr_len, int flags)
>>> +{
>>> +     struct sock *sk = sock->sk;
>>> +     const struct proto *prot;
>>> +
>>> +     if (addr_len < (int)sizeof(addr->sa_family))
>>> +             return -EINVAL;
>>> +
>>> +     prot = READ_ONCE(sk->sk_prot);
>>
>> Is the above _ONCE() annotation for ADDRFORM's sake? If so it should not
>> be needed (only UDP and TCP sockets are affected).
> I will delete it.
> 
>>
>>> diff --git a/net/quic/socket.h b/net/quic/socket.h
>>> new file mode 100644
>>> index 000000000000..ded8eb2e6a9c
>>> --- /dev/null
>>> +++ b/net/quic/socket.h
>>> @@ -0,0 +1,79 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/* QUIC kernel implementation
>>> + * (C) Copyright Red Hat Corp. 2023
>>> + *
>>> + * This file is part of the QUIC kernel implementation
>>> + *
>>> + * Written or modified by:
>>> + *    Xin Long <lucien.xin@gmail.com>
>>> + */
>>> +
>>> +#include <net/udp_tunnel.h>
>>> +
>>> +#include "protocol.h"
>>> +
>>> +extern struct proto quic_prot;
>>> +extern struct proto quicv6_prot;
>>> +
>>> +enum quic_state {
>>> +     QUIC_SS_CLOSED          = TCP_CLOSE,
>>> +     QUIC_SS_LISTENING       = TCP_LISTEN,
>>> +     QUIC_SS_ESTABLISHING    = TCP_SYN_RECV,
>>> +     QUIC_SS_ESTABLISHED     = TCP_ESTABLISHED,
>>> +};
>>
>> Any special reason to define protocol-specific states? I guess you could
>> re-use the TCP ones, as other protocols already do.
>>
> I know TIPC and SCTP define the states like this:
> 
> enum {
>         TIPC_LISTEN = TCP_LISTEN,
>         TIPC_ESTABLISHED = TCP_ESTABLISHED,
>         TIPC_OPEN = TCP_CLOSE,
>         TIPC_DISCONNECTING = TCP_CLOSE_WAIT,
>         TIPC_CONNECTING = TCP_SYN_SENT,
> };
> 
> and
> 
> enum sctp_sock_state {
>         SCTP_SS_CLOSED         = TCP_CLOSE,
>         SCTP_SS_LISTENING      = TCP_LISTEN,
>         SCTP_SS_ESTABLISHING   = TCP_SYN_SENT,
>         SCTP_SS_ESTABLISHED    = TCP_ESTABLISHED,
>         SCTP_SS_CLOSING        = TCP_CLOSE_WAIT,
> };
> 
> It should be fine to keep as is, or you have more and better
> examples from other protocols.

IMHO the cost/benfit ratio to re-define the socket state value is in not
enough to justify the additional LoC. I guess it's subjective, but the
patch series is big and anything shrinking it is IMHO a good thing.

/P

