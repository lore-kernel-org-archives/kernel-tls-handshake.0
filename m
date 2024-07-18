Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99422EE5
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 18 Jul 2024 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721326355; cv=none; b=SJ1QYk4c6NFOPlxF41sn/a7Z47FObbTmLkelLuv9IbqbErBXQzeWFPL5fsP6wY96dOO5a7l9hxspj1bXMT2MBicEfbcWP8CFbPhGuTZIN/bfG4af05t46HvXHVW3ZZmLGrKNQlUc5NtqYSI1yEcR4SCtXKU6YekzCNacgjohU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721326355; c=relaxed/simple;
	bh=hz/ieI0CuuATN4pn/zhjFFXzdw3SfLXTr1QOQ/4hEe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TGEfVCHQN/n6iZQqEVoc4johe2BN2PZKaZjG2f9UKwFY0zeoWQb3QyvcCVbbwgDMVtAItN8s67U//oma3NAou2RjPj5DfMiCd1BEm9yxYFJBkb0uAABz6imAyjFy093TAPmoi3QtVnkXTqfxasMejHzJgUbJckhRiF78kCM4+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Twh837zk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Twh837zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721326352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2rmpI0GZhYU1js2clOgyLQ62XNQsgZEfExGLV26V8g=;
	b=Twh837zk2s/pdkVOdsj9LMvkO4cZVb+bMo/bECsi2i3BuKtUki92PNU4P46Hz+7IRzBeSM
	NU4lX4LNUAB9hDeMqa97/Rg5FkMlwFDUaDsBcpmQU4c82SHB9r9yYENQ7SxF2H9UlVpdue
	8wH2Weh2V+WOx22wyRC4Bbl3x4vJEaw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-crROozvENxOvIJks2Ngcig-1; Thu,
 18 Jul 2024 14:12:31 -0400
X-MC-Unique: crROozvENxOvIJks2Ngcig-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB29F1955D4F;
	Thu, 18 Jul 2024 18:12:29 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.32.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85C683000188;
	Thu, 18 Jul 2024 18:12:29 +0000 (UTC)
Received: by aion.redhat.com (Postfix, from userid 1000)
	id DCD101B764F; Thu, 18 Jul 2024 14:12:27 -0400 (EDT)
Date: Thu, 18 Jul 2024 14:12:27 -0400
From: Scott Mayhew <smayhew@redhat.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils project Kanban board
Message-ID: <ZplbC7nzUg5ITrfz@aion>
References: <1B8279CB-C5FE-480E-B6D8-7018EFCFB54B@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1B8279CB-C5FE-480E-B6D8-7018EFCFB54B@oracle.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 16 Jul 2024, Chuck Lever III wrote:

> I've created a Kanban board for ongoing ktls-utils work:
> 
> https://github.com/orgs/oracle/projects/14
> 
> I think it is publicly viewable, but I'm the only one
> who can modify it...?

Just confirming, I can view (but not modify) your board.

-Scott
> 
> 
> --
> Chuck Lever
> 
> 
> 

