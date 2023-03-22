Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A4184
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 00:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679444294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/jWDniPiD3ArKxuqWUYL+U69T82M+y4H2QrzlqkdHAY=;
	b=EKw4hw6aKa7LJWrfQ+yBE9/NBXC+WPfiCuww2j+cAaTbfTEYZjApyI4IXMZoywGcpQGJ7w
	qhKc801sIJUjPdJIIFvaLaDgstvM665uhxrOsz5G8v8UTrLQoo5Ge3wMC0D3lUD6WB4Jlw
	GKE9teBEMf9++O6FMNspIMN0ozRqmOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-vCb3AvyeOO2aOqpdADWFDw-1; Tue, 21 Mar 2023 20:18:12 -0400
X-MC-Unique: vCb3AvyeOO2aOqpdADWFDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 031E4101A531;
	Wed, 22 Mar 2023 00:18:11 +0000 (UTC)
Received: from localhost (unknown [10.2.17.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C421340C83A9;
	Wed, 22 Mar 2023 00:18:09 +0000 (UTC)
Date: Tue, 21 Mar 2023 17:18:08 -0700
From: Chris Leech <cleech@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 06/18] nvme-tcp: call 'queue->data_ready()' in
 nvme_tcp_data_ready()
Message-ID: <ZBpJQENvFoyGortp@localhost>
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-7-hare@suse.de>
 <d868b752-1d8b-1236-3543-c9ef82e42f23@grimberg.me>
 <3bd2c6b4-b276-b882-6f28-998118f96650@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3bd2c6b4-b276-b882-6f28-998118f96650@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 21, 2023 at 03:09:06PM +0100, Hannes Reinecke wrote:
> On 3/21/23 14:44, Sagi Grimberg wrote:
> > 
> > > Call the original data_ready() callback in nvme_tcp_data_ready()
> > > to avoid a receive stall.
> > 
> > Can you please improve the description to include what is the stall?
> > For example, does the stall exist today? If it is, I would like to
> > separate such patches from this set and include them asap.
> > 
> That is actually particular to the TLS implementation, as it uses the
> 'data_ready' callback to produce the data which can be read by eg recvmsg().
> 
> Without this call there's no data to peruse for recvmsg().
> 
> But I'm not _that_ deep into networking details to know whether this is TLS
> specific or an issue with any data_ready callback.
> I assume the latter, but then again, who knows.
> 
> Hence the slightly vague description.

This looks like the socket callbacks end up hooked in the wrong order.
Ideally it would be tcp -> tls -> nvme_tcp, while this currently looks
like tcp -> nvme_tcp and then this call back to tls for decryption.

I'm not quite sure how to untangle this; nvme_tcp can't just set it's
own callbacks before initializing kTLS, becuse that's being done by
tlshd which is going to need the userspace socket API callbacks working.

- Chris

