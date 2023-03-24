Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1843525F
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 24 Mar 2023 11:29:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CEF6D1FE1E;
	Fri, 24 Mar 2023 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679657363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upl3usAPEmW0mAD8vfTgvaAXyk4EM0DMz6fBW/jRlq4=;
	b=KVKeDHt2epaKC9Pje9YC965XYuIfIY8ZSJU5t//S5epwPp1me3NojxgiGHLuDhF287LPZK
	AwlMReWhUsiUDvrKuXOvbCnQHny9396SwIlp6hrV1zHMdai0MAhnhN1z1XReoMY22NtrTj
	u2YXQRx6px16DWx2JmxWESDYsUrsGLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679657363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upl3usAPEmW0mAD8vfTgvaAXyk4EM0DMz6fBW/jRlq4=;
	b=m9IzOz6UWUpWtKgn+rSjUqCxIEN/nk96KykJhHtdEushlERqZ1bLvyF5agbmPCR1otkQKc
	/46ATYiYldtZ6+Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAD8F133E5;
	Fri, 24 Mar 2023 11:29:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tPwJLZOJHWTPZAAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 24 Mar 2023 11:29:23 +0000
Message-ID: <3ad50302-6b3c-6d6a-669e-0b11c2df6a6b@suse.de>
Date: Fri, 24 Mar 2023 12:29:23 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/18] nvmet-tcp: enable TLS handshake upcall
To: Sagi Grimberg <sagi@grimberg.me>, Chuck Lever III <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 Chuck Lever <cel@kernel.org>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-16-hare@suse.de>
 <6f69983c-17bd-dd72-b941-95f55db10180@grimberg.me>
 <b8a2e1d4-3571-447b-25c6-c6dd25fbad02@suse.de>
 <a1af3f6b-ec9e-4e91-ad70-57fcc9010a91@grimberg.me>
 <c426d104-b7f2-e736-c23a-b94fda54ed37@suse.de>
 <e0620d94-9729-014c-2cb8-8ff826ebbefa@grimberg.me>
 <e016af81-f77e-2eba-a805-838f62ba50f7@suse.de>
 <68AA3629-6B88-4098-AA03-BEDF614F8D0B@oracle.com>
 <ea181844-69f5-66eb-e64e-e9871916532b@grimberg.me>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <ea181844-69f5-66eb-e64e-e9871916532b@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/23 08:21, Sagi Grimberg wrote:
> 
>>>>>>> The 'data_ready' call might happen at any time after the 'accept' 
>>>>>>> call and us calling into userspace.
>>>>>>> In particular we have this flow of control:
>>>>>>>
>>>>>>> 1. Kernel: accept()
>>>>>>> 2. Kernel: handshake request
>>>>>>> 3. Userspace: read data from socket
>>>>>>> 4. Userspace: tls handshake
>>>>>>> 5. Kernel: handshake complete
>>>>>>>
>>>>>>> If the 'data_ready' event occurs between 1. and 3. userspace 
>>>>>>> wouldn't know that something has happened, and will be sitting 
>>>>>>> there waiting for data which is already present.
>>>>>>
>>>>>> Umm, doesn't userspace read from the socket once we trigger the 
>>>>>> upcall?
>>>>>> it should. But I still don't understand what is the difference 
>>>>>> between
>>>>>> us waiking up userspace, from the default sock doing the same?
>>>>>>
>>>>> No, it doesn't (or, rather, can't).
>>>>> After processing 'accept()' (from the kernel code) data might 
>>>>> already be present (after all, why would we get an 'accept' call 
>>>>> otherwise?).
>>>>> But the daemon has not been started up (yet); that's only done in
>>>>> step 3). But 'data_ready' has already been called, so by the time 
>>>>> userland is able to do a 'read()' on the socket it won't be seeing 
>>>>> anything.
>>>> Not sure I understand. if data exists, userspace will read from the
>>>> socket and get data, whenever that is. >
>>> That's what I thought, too.
>>> But then the userspace daemon just sat there doing nothing.
>>
>> I haven't been following this discussion in detail, but
>> if the kernel disables the normal TCP data_ready callback,
>> then user space won't get any data. That's why SunRPC's
>> data_ready calls the previous sk_data_ready and then shunts
>> its own data_ready callback during handshakes. Without that
>> call to the old sk_data_ready, the user space endpoint won't
>> see any received data.
> 
> Yes that is understood. But the solution that Hannes proposed
> was to introduce nvmet_tcp_tls_data_ready which is overriding
> the default sock data_ready and does pretty much the same thing.
> 
> The reason is that today nvmet_tcp_listen_data_ready schedules accept
> and then pretty much immediately replaces the socket data_ready to
> nvmet_tcp_data_ready.
> 
> I think that a simpler solution was to make nvmet_tcp_listen_data_ready
> call port->data_ready (default socket stored data_ready), schedule
> the accept_work and only after the handshake bounce to userspace is
> completed, override the socket callbacks.
> 
> Something like:
> -- 
> static void nvmet_tcp_listen_data_ready(struct sock *sk)
> {
>          struct nvmet_tcp_port *port;
> 
>          trace_sk_data_ready(sk);
> 
>          read_lock_bh(&sk->sk_callback_lock);
>          port = sk->sk_user_data;
>          if (!port)
>                  goto out;
> 
>          port->data_ready(sk); // trigger socket old data_ready
> 
>          if (sk->sk_state == TCP_LISTEN)
>                  queue_work(nvmet_wq, &port->accept_work);
> out:
>          read_unlock_bh(&sk->sk_callback_lock);
> }
> 

Nearly there.

The actual patch would be:

@@ -2031,10 +1988,16 @@ static void nvmet_tcp_listen_data_ready(struct 
sock *sk)
         trace_sk_data_ready(sk);

         read_lock_bh(&sk->sk_callback_lock);
+       /* Ignore if the callback has been changed */
+       if (sk->sk_data_ready != nvmet_tcp_listen_data_ready)
+               goto out;
         port = sk->sk_user_data;
         if (!port)
                 goto out;

+       if (port->data_ready)
+               port->data_ready(sk);
+
         if (sk->sk_state == TCP_LISTEN)
                 queue_work(nvmet_wq, &port->accept_work);
  out:

As the callbacks will be changed once TLS is activated, and we really 
should not attempt to run if sk_data_ready() points to another function,
as then the sk_user_data pointer will most likely be changed, too,
causing all sorts of issues.

Cheers,

Hannes

