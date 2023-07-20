Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286B3D81
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Jul 2023 05:44:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E876E22846;
	Thu, 20 Jul 2023 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689831872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdzHoRIaX6DoNHcEK/3kW44XBPvVO/bKQ4pViaq7C6A=;
	b=QTJCdFdV7JChRMJTF3bQVgZJrUjZN3v4dQrDY9p5kM5rFaeAyMmSGL1dXPMtsdpDrxmWVG
	O3seUYV+ecL+bYLqQKXd5BpQCWF6K83xH2nQ60irakvLOoNbACAKXhimetOpqhAQCUjGuw
	ShuYWKm+BpweF3R2fW6WUR2ONxO1MEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689831872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdzHoRIaX6DoNHcEK/3kW44XBPvVO/bKQ4pViaq7C6A=;
	b=nlu6qUl3LZsnrfdMcheu2oepp9fkDsuQtOofd8htOdjta6lMgWLeMFp1YALfPzedxQ19hU
	0ZuBtgIYr831StBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66D291361C;
	Thu, 20 Jul 2023 05:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jFDjF8DJuGT1VQAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 20 Jul 2023 05:44:32 +0000
Message-ID: <497c5403-fdba-1f9d-5e7b-4aa32481413d@suse.de>
Date: Thu, 20 Jul 2023 07:44:31 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH net-next v1 5/7] net/handshake: Add helpers for parsing
 incoming TLS Alerts
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Chuck Lever <cel@kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <168970659111.5330.9206348580241518146.stgit@oracle-102.nfsv4bat.org>
 <168970685465.5330.12951636644707988195.stgit@oracle-102.nfsv4bat.org>
 <8c9399d8-1f2e-5da0-28c2-722f382a5a08@suse.de>
 <74209F42-2099-4682-9478-54040B1BCC1A@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <74209F42-2099-4682-9478-54040B1BCC1A@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/19/23 15:36, Chuck Lever III wrote:
> 
> 
>> On Jul 19, 2023, at 3:52 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 7/18/23 21:00, Chuck Lever wrote:
>>> From: Chuck Lever <chuck.lever@oracle.com>
>>> Kernel TLS consumers can replace common TLS Alert parsing code with
>>> these helpers.
>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>>> ---
>>>   include/net/handshake.h |    4 ++++
>>>   net/handshake/alert.c   |   46 ++++++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 50 insertions(+)
>>> diff --git a/include/net/handshake.h b/include/net/handshake.h
>>> index bb88dfa6e3c9..d0fd6a3898c6 100644
>>> --- a/include/net/handshake.h
>>> +++ b/include/net/handshake.h
>>> @@ -42,4 +42,8 @@ int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags);
>>>   bool tls_handshake_cancel(struct sock *sk);
>>>   void tls_handshake_close(struct socket *sock);
>>>   +u8 tls_record_type(const struct sock *sk, const struct cmsghdr *msg);
>>> +bool tls_alert_recv(const struct sock *sk, const struct msghdr *msg,
>>> +     u8 *level, u8 *description);
>>> +
>>>   #endif /* _NET_HANDSHAKE_H */
>>> diff --git a/net/handshake/alert.c b/net/handshake/alert.c
>>> index 999d3ffaf3e3..93e05d8d599c 100644
>>> --- a/net/handshake/alert.c
>>> +++ b/net/handshake/alert.c
>>> @@ -60,3 +60,49 @@ int tls_alert_send(struct socket *sock, u8 level, u8 description)
>>>    ret = sock_sendmsg(sock, &msg);
>>>    return ret < 0 ? ret : 0;
>>>   }
>>> +
>>> +/**
>>> + * tls_record_type - Look for TLS RECORD_TYPE information
>>> + * @sk: socket (for IP address information)
>>> + * @cmsg: incoming message to be parsed
>>> + *
>>> + * Returns zero or a TLS_RECORD_TYPE value.
>>> + */
>>> +u8 tls_record_type(const struct sock *sk, const struct cmsghdr *cmsg)
>>> +{
>>> + u8 record_type;
>>> +
>>> + if (cmsg->cmsg_level != SOL_TLS)
>>> + return 0;
>>> + if (cmsg->cmsg_type != TLS_GET_RECORD_TYPE)
>>> + return 0;
>>> +
>>> + record_type = *((u8 *)CMSG_DATA(cmsg));
>>> + return record_type;
>>> +}
>>> +EXPORT_SYMBOL(tls_record_type);
>>> +
>> tls_process_cmsg() does nearly the same thing; why didn't you update it to use your helper?
> 
> tls_process_cmsg() is looking for TLS_SET_RECORD_TYPE,
> not TLS_GET_RECORD_TYPE. It looks different enough that
> I didn't feel comfortable touching it.
> 
Argl. Totally forgot that we have TLS_GET_RECORD_TYPE and 
TLS_SET_RECORD_TYPE ...
But to make it clear, shouldn't we rather name the function
tls_get_record_type()

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

