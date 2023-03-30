Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0298C02
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 17:37:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C0B3219D0;
	Thu, 30 Mar 2023 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680197875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5AsUhZrjXWafpMHR8yfmBJoKmAuql4y7NmkAZ1SBs=;
	b=CF9cdBHyOuU+ciK4m1tVf8s6SKbIYZaik2B/upVdGsaNQZvFr0h6GpoW5u2NUzG8VvXt2U
	JoleP+VVMhx1YxnL3N4QY/FqNBNgrog0Cisyrz2AKkdZwE+a8w5LoDqomBXnpYzfPLvIj7
	pi0w+o4j8aQM92B831k/jxjux1C3Dk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680197875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5AsUhZrjXWafpMHR8yfmBJoKmAuql4y7NmkAZ1SBs=;
	b=s6nCStUL3AO9hfgEXNfZECdkZy2uJu3t6qYCNcj6b1KWMzNMMGcnrirhcXTTf+5wD08VgV
	jRB6PvWhCyTzQoBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 229DD1348E;
	Thu, 30 Mar 2023 17:37:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4TjXB/PIJWRIDgAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 30 Mar 2023 17:37:55 +0000
Message-ID: <cf08232a-fa99-0261-853a-4a0aefbaa8ea@suse.de>
Date: Thu, 30 Mar 2023 19:37:54 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 14/18] nvmet-tcp: allocate socket file
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-15-hare@suse.de>
 <1dfb48db-0d3e-6283-04d0-0481470174d2@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <1dfb48db-0d3e-6283-04d0-0481470174d2@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/23 18:08, Sagi Grimberg wrote:
> 
> 
> On 3/29/23 16:59, Hannes Reinecke wrote:
>> When using the TLS upcall we need to allocate a socket file such
>> that the userspace daemon is able to use the socket.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/target/tcp.c | 51 +++++++++++++++++++++++++++++----------
>>   1 file changed, 38 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
>> index 66e8f9fd0ca7..5931971d715f 100644
>> --- a/drivers/nvme/target/tcp.c
>> +++ b/drivers/nvme/target/tcp.c
>> @@ -96,12 +96,14 @@ struct nvmet_tcp_cmd {
>>   enum nvmet_tcp_queue_state {
>>       NVMET_TCP_Q_CONNECTING,
>> +    NVMET_TCP_Q_TLS_HANDSHAKE,
>>       NVMET_TCP_Q_LIVE,
>>       NVMET_TCP_Q_DISCONNECTING,
>>   };
>>   struct nvmet_tcp_queue {
>>       struct socket        *sock;
>> +    struct file        *sock_file;
>>       struct nvmet_tcp_port    *port;
>>       struct work_struct    io_work;
>>       struct nvmet_cq        nvme_cq;
>> @@ -1406,6 +1408,19 @@ static void 
>> nvmet_tcp_restore_socket_callbacks(struct nvmet_tcp_queue *queue)
>>       write_unlock_bh(&sock->sk->sk_callback_lock);
>>   }
>> +static void nvmet_tcp_close_sock(struct nvmet_tcp_queue *queue)
>> +{
>> +    if (queue->sock_file) {
>> +        fput(queue->sock_file);
>> +        queue->sock_file = NULL;
>> +        queue->sock = NULL;
>> +    } else {
>> +        WARN_ON(!queue->sock->ops);
>> +        sock_release(queue->sock);
>> +        queue->sock = NULL;
>> +    }
>> +}
>> +
>>   static void nvmet_tcp_uninit_data_in_cmds(struct nvmet_tcp_queue 
>> *queue)
>>   {
>>       struct nvmet_tcp_cmd *cmd = queue->cmds;
>> @@ -1455,12 +1470,11 @@ static void 
>> nvmet_tcp_release_queue_work(struct work_struct *w)
>>       nvmet_sq_destroy(&queue->nvme_sq);
>>       cancel_work_sync(&queue->io_work);
>>       nvmet_tcp_free_cmd_data_in_buffers(queue);
>> -    sock_release(queue->sock);
>> +    nvmet_tcp_close_sock(queue);
>>       nvmet_tcp_free_cmds(queue);
>>       if (queue->hdr_digest || queue->data_digest)
>>           nvmet_tcp_free_crypto(queue);
>>       ida_free(&nvmet_tcp_queue_ida, queue->idx);
>> -
>>       page = virt_to_head_page(queue->pf_cache.va);
>>       __page_frag_cache_drain(page, queue->pf_cache.pagecnt_bias);
>>       kfree(queue);
>> @@ -1583,7 +1597,7 @@ static int nvmet_tcp_set_queue_sock(struct 
>> nvmet_tcp_queue *queue)
>>       return ret;
>>   }
>> -static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>> +static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>>           struct socket *newsock)
>>   {
>>       struct nvmet_tcp_queue *queue;
>> @@ -1591,7 +1605,7 @@ static int nvmet_tcp_alloc_queue(struct 
>> nvmet_tcp_port *port,
>>       queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>>       if (!queue)
>> -        return -ENOMEM;
>> +        return;
>>       INIT_WORK(&queue->release_work, nvmet_tcp_release_queue_work);
>>       INIT_WORK(&queue->io_work, nvmet_tcp_io_work);
>> @@ -1599,15 +1613,28 @@ static int nvmet_tcp_alloc_queue(struct 
>> nvmet_tcp_port *port,
>>       queue->port = port;
>>       queue->nr_cmds = 0;
>>       spin_lock_init(&queue->state_lock);
>> -    queue->state = NVMET_TCP_Q_CONNECTING;
>> +    if (queue->port->nport->disc_addr.tsas.tcp.sectype ==
>> +        NVMF_TCP_SECTYPE_TLS13)
>> +        queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
>> +    else
>> +        queue->state = NVMET_TCP_Q_CONNECTING;
>>       INIT_LIST_HEAD(&queue->free_list);
>>       init_llist_head(&queue->resp_list);
>>       INIT_LIST_HEAD(&queue->resp_send_list);
>> +    if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
>> +        queue->sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, 
>> NULL);
>> +        if (IS_ERR(queue->sock_file)) {
>> +            ret = PTR_ERR(queue->sock_file);
>> +            queue->sock_file = NULL;
>> +            goto out_free_queue;
>> +        }
>> +    }
> 
> Why not always allocate a sock_file? Like in the host?

Wasn't sure if you'd go with it.
But sure.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

