Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E38465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680013392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8pv//1OtSN/WaQHqQwa2LtOxtqVDcaV8LhrdSwg08aY=;
	b=eRio0lU6OIlRBrCP7FZVishltCCObesgNZYH49p9NKhyXdSdrWZQxFKR/r9wQU7tCROa4w
	i0Rya9MOozvBCp87GDyMyqHQblZf+x7aMTbFQ/PmyusohzZCZPQoyPvv82afgwI5v/9M8p
	RWAJ1j+zenSKpzmc88RtXNiJZtg9OWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-0Boe6RcbPD6ZHtNq_O_dqQ-1; Tue, 28 Mar 2023 10:23:08 -0400
X-MC-Unique: 0Boe6RcbPD6ZHtNq_O_dqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A8E2185A7A8;
	Tue, 28 Mar 2023 14:23:08 +0000 (UTC)
Received: from [192.168.37.1] (ovpn-0-18.rdu2.redhat.com [10.22.0.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D43C92166B26;
	Tue, 28 Mar 2023 14:23:07 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, kernel-tls-handshake@lists.linux.dev
Subject: Re: problems getting rpc over tls to work
Date: Tue, 28 Mar 2023 10:23:06 -0400
Message-ID: <73CE5559-5DEB-443B-8633-5BDC92D720A1@redhat.com>
In-Reply-To: <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 28 Mar 2023, at 10:04, Chuck Lever III wrote:

> I'd like to find a way to make self-signed work seamlessly.

You can add them to the trust store, or bring back the option to skip verification.

Ben

