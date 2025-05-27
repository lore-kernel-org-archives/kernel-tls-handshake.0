Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4127FD49
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367297; cv=none; b=CuhuhF64rbMVY9I/TKMt7GLRQY/lcmowP/MD0GtMFrF+mTDchjEYLqJsqB/7o0aHFvnGb9yJ5JRnWIzXbS9vt/axOWyRDVnewwE8Df9X9etbMEuaRZA9XOWo2UAQ0e2dTh7lkIPo/cB8LaNFrUEO2YdaYytmAmXLGyWOPqfBpXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367297; c=relaxed/simple;
	bh=EOElSrBzgeiYgGcBrf738UNSbly+LjYJ4idgfwGKOZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6WVY8zxojCd8xGxlhSJ6raqHZA7xGjKDKsM5uYe4hXL9higTrwWx1kt3ONn5wZgVZJAYGCVc5Is122F2U5BI6eCKKxIvD/PU2IhU5hGoPBfCW7pRAJYqvCocpdZAADwwt/P2vwxJBY4IxqMNcNTFKCA1uwquw1HJ7dibd0LeO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=afv58z1w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="afv58z1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748367294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lM8h4y4oGaI68bIWXZdoZ/03oI7p2DxcQrpi2J67aZk=;
	b=afv58z1whJUotiHG5j8VSG3P3i0uWg1cTJGgi611258aL3vXQ5/krH2YURKPJt1fyuG/4M
	q7jKrf0Du8ZtvAlewndlCaxQWeDvZauqVpDmdaar3EULUyDx/E742NxZ4bRLF36urBnQvi
	E8xaFAqrWDzhc8UPsgMmHdPW4ga4AoM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-KVnX5cdsNiODyXuDNIGxqQ-1; Tue,
 27 May 2025 13:34:53 -0400
X-MC-Unique: KVnX5cdsNiODyXuDNIGxqQ-1
X-Mimecast-MFC-AGG-ID: KVnX5cdsNiODyXuDNIGxqQ_1748367292
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7471319560AB;
	Tue, 27 May 2025 17:34:52 +0000 (UTC)
Received: from [192.168.37.1] (unknown [10.22.58.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9DECD180049D;
	Tue, 27 May 2025 17:34:51 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: Further changes to contribution process
Date: Tue, 27 May 2025 13:34:49 -0400
Message-ID: <23F7204F-02CB-4335-974E-EDF5FF01F03F@redhat.com>
In-Reply-To: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
References: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QSIEZ9iQd0UcJhj0s1ppboF8XhMAL93ou13UfRUGP8w_1748367292
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 27 May 2025, at 11:23, Chuck Lever wrote:

> Hi -
>
> Now that first-time contributors no longer have to sign the OCA, they
> have no need to interact with GitHub at all when contributing.
>
> I've heard several requests for ktls-utils to change to an email-only
> contribution and review process, similar to the one that the Linux
> kernel and nfs-utils uses. I've heard no comments in favor of staying
> with the GitHub PR style of review process.
>
> If there are no objections, I can merge a change to CONTRIBUTING.md
> that replaces the "GitHub pull request" process with an email-only
> process, and then as maintainer, I'll eat the steps of pushing
> each contribution to oracle/ktls-utils.
>
> Does that work for everyone?

It works for me - one thing that was nice the last time around was that I
could see the automated gating tests for the MR pass or fail before having
to harass or request help from anyone.  I think you'll lose that part of
the workflow, or be forced to handle it yourself.

Just .02,
Ben

