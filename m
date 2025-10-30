Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77B83043CB;
	Thu, 30 Oct 2025 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.82.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823773; cv=none; b=TpQzxBH96sh4UTsunscx82VbteCTBuE8JOoNX/pqX8EFAh0uGBJBnrShF9zaRwK+d3kk6k39kbXE7Ys7nvicq7An9R2ZZR+A+f5frhZ0DfefhiNFxEYTq/y2gPrZwvqA7JxgjRr3JnleeyQfNZwrznLrnb+7a5xrC4ZQX8CmjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823773; c=relaxed/simple;
	bh=Vg1RclMKwLXIQctClTssZ3YshNVF1nRgmjvcREBF8KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAmuH4yV06tFv2eKLeKoPVAbxVJHBqg/Uum8+6RmkZ3b8lg1wa9ByDAT60Fq15VTEEjn5ZlGjOrlt1fQWrHleRGRi64V9Osxu6FX903EbImB5itm2lP0ID9XFPEV4ahHJEh722ckgR0xNdZ28m/wAI3arxoQOMaezIVA16AYZV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org; spf=pass smtp.mailfrom=samba.org; dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b=sa75eb2v; arc=none smtp.client-ip=144.76.82.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samba.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b="sa75eb2v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
	s=42; h=From:Cc:To:Date:Message-ID;
	bh=5QFe1PcxdhQD8+b/3dcbPrjy4iFh/n+xDlvxK7IFMQA=; b=sa75eb2v0WwLjrgwMRrlNmIE1p
	ARPDxaw9qfdwJf34zoW4+lTAOTAHHbFITlrYj3xDUBRf+WwfdYD1JrkcfB4Gzmy658kXu08tfGpLQ
	/tmnSxIx9qzDhaKYMYGn2A4n6taVIYxpY0OrpOGnIL7T1EMXYGQPtauOTOTgwHB3iafAj+UkabuT+
	CN6HB7rkYWy1ddCr/RX+PYFdA5MnqGspe7KlP1cvB4BfrGJhbnuWQrP+NKhUPJaD7CNE3TGv8focA
	D+Yr53AcgFxxkGdy2leEumg9R5z/JY1I3IUEudsozQCUMemgfN09NoR8gJGuJnpiVVFjKgONiJ3DI
	uHztp+WvMThcxtpT/JFSd8PRq7dgh78+vwt0J4ABqM7XEjX+wKL3JdiWp65Iq+3M7xCiXSuNgNLuH
	9Hk/uLITkypDa1d8tK/Kaj+t1rM8vWeg9qDEq7AshCeQc4RnL/PxjEv7SZ0m695nfkf527u/FYtmA
	Hm0+IjS5iQNURF7S4Bq+WOqT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
	(Exim)
	id 1vEQqG-00Bphs-0C;
	Thu, 30 Oct 2025 11:29:20 +0000
Message-ID: <b9300291-e828-47fa-b4d1-66934636bd7b@samba.org>
Date: Thu, 30 Oct 2025 12:29:19 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
To: Xin Long <lucien.xin@gmail.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev,
 davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org>
 <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
Content-Language: en-US
From: Stefan Metzmacher <metze@samba.org>
In-Reply-To: <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 29.10.25 um 20:57 schrieb Xin Long:
> On Wed, Oct 29, 2025 at 12:22 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Hi Xin,
>>
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
>>
>> ...
>>
>>> +module_init(quic_init);
>>> +module_exit(quic_exit);
>>> +
>>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET) "-proto-261");
>>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET6) "-proto-261");
>>
>> Shouldn't this use MODULE_ALIAS_NET_PF_PROTO(PF_INET, IPPROTO_QUIC)
>> instead?
>>
> Hi, Stefan,
> 
> If we switch to using MODULE_ALIAS_NET_PF_PROTO(), we still need to
> keep using the numeric value 261:
> 
>    MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261);
>    MODULE_ALIAS_NET_PF_PROTO(PF_INET6, 261);
> 
> IPPROTO_QUIC is defined as an enum, not a macro. Since
> MODULE_ALIAS_NET_PF_PROTO() relies on __stringify(proto), it can’t
> stringify enum values correctly, and it would generate:
> 
>    alias:          net-pf-10-proto-IPPROTO_QUIC
>    alias:          net-pf-2-proto-IPPROTO_QUIC

Yes, now I remember...

Maybe we can use something like this:

-  IPPROTO_QUIC = 261,          /* A UDP-Based Multiplexed and Secure Transport */
+#define __IPPROTO_QUIC 261     /* A UDP-Based Multiplexed and Secure Transport */
+  IPPROTO_QUIC = __IPPROTO_QUIC,

and then

MODULE_ALIAS_NET_PF_PROTO(PF_INET, __IPPROTO_QUIC)

In order to make things clearer.

What do you think?

metze
