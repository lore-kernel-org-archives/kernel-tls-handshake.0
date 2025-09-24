Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E02E6100
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758712945; cv=none; b=QouPi4l2490LOsnlNeiB99EUdpcocnWWpSkEoC6SqPf3AoaVgasdupQH9aoOTrEAUmb9j4akGrUWCLJgLoDEOt2WsWI3X2vt8yoxDefKppNjPblAk8Z7NGbaL0X9pg9kQ3381ZgBwiNGgOyMVml0fnkc0oDnB6f+uSXUSzgUDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758712945; c=relaxed/simple;
	bh=UfrllfJI5Q4IYjSi3VB2WzBnRecDJ5sUxnx+4z7OIqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4/8giAmI6JS16fe0QRgkwLjDPFB+dg9uagiIHDXwakWr1AgzthT/RxkXumn2Q1Dt/vwP1AT3VHfCpIYSsxE8Oae2gNYE/f5BRk1K8bC5PysOIOikIVgymZSV6JP6aosSbZNpCgiZpPTnkoiMBvNtnqNGSpO/jF6J4FbcIzJzTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdNLJEH6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdNLJEH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758712939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UfrllfJI5Q4IYjSi3VB2WzBnRecDJ5sUxnx+4z7OIqU=;
	b=CdNLJEH63WUnEBQ95GBRYQO1tbcyTBTiG36x52e7WMbBi8pPZYGEOQHpmB6Sy+j25VVV7H
	V6VkPrqQEOOsUzF4o5KsfPlL4U4/PRiYVug7OF1N6BplyitwcpfzhBXTuNbmEEtobcthAE
	t9ZgJ4Zus1EVwYh9305Ey67RLRkPFDk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-dJzLjiSqNTKQCTRPw3cjUQ-1; Wed,
 24 Sep 2025 07:22:15 -0400
X-MC-Unique: dJzLjiSqNTKQCTRPw3cjUQ-1
X-Mimecast-MFC-AGG-ID: dJzLjiSqNTKQCTRPw3cjUQ_1758712934
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A7F819560B0;
	Wed, 24 Sep 2025 11:22:14 +0000 (UTC)
Received: from [10.0.1.177] (unknown [10.22.74.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64AFE3000198;
	Wed, 24 Sep 2025 11:22:13 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever <cel@kernel.org>
Cc: Xin Long <lucien.xin@gmail.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH] tlshd: Clean up logic in tlshd_start_tls_handshake()
Date: Wed, 24 Sep 2025 07:22:11 -0400
Message-ID: <7B5B554A-1F4A-42BF-8606-195DECA0CB88@redhat.com>
In-Reply-To: <20250924000134.2429264-1-cel@kernel.org>
References: <20250924000134.2429264-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _NHAtO6hYLYxrFmFhwCTSBFwFsNjLaXb_XvQygUtVLQ_1758712934
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 23 Sep 2025, at 20:01, Chuck Lever wrote:

> From: Chuck Lever <chuck.lever@oracle.com>
>
> gnutls_handshake() is supposed to return only a GNUTLS_E value, and
> the session_status field is supposed to contain only a positive
> errno.
>
> GNUTLS_E_PREMATURE_TERMINATION is -110. It turns out that on x86,
> -ETIMEDOUT is also -110. Make sure the correct symbolic constants
> and auditing functions are utilized.
>
> Fixes: b010190cfed2 ("tlshd: Pass ETIMEDOUT from gnutls to kernel")
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Its better!

Reviewed-by: Benjamin Coddington <bcodding@redhat.com>

Ben

