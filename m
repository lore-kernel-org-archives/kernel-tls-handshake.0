Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7B1E32D3
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839048; cv=none; b=DyI14Zu70dFqHmX2u0ekZrQZeFFuc+iKN/9jQlWCXgBZKPlpetMWBq9VT7DRezX19xZHN5/gBNbbKLte8XiWluQfb9B6VOmWTwIT5hLK/KcHu4ohZCs1jw2frh3VEG8xAxDaEX5ZlqoK6LEb45tHB8w9YLNGeyr8nO5iU/WMUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839048; c=relaxed/simple;
	bh=uZrwSI9M6MstvA2xAtLsYxKxrk+IQ+B5wwMLl01Q6LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw51Si+B5lsijRtN6+pUsLzcJ/RvixXM2SVsy/rpzt/kvMVW9cjtgsbqT57LCeqtrHSxEZjRp3UPuQEEIUZoAgpIOMENdl4Q6e72b4F/zQf56KbZCTIJ0YrWFtUNS5/Cc8YHSoN9pcyMKImjJqCHdVUPtF0kFlTNqwi6juT8ewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuXgR9ML; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuXgR9ML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747839046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uZrwSI9M6MstvA2xAtLsYxKxrk+IQ+B5wwMLl01Q6LE=;
	b=VuXgR9MLpeCcTvlSWnJNU11RVx5ci5dYiIi0lFnXvI5PEyXzORE8erWZ3NUIVmP+IRqcaE
	BaRiirpnO8E0QNIv8eYxEQ6RMSSbifMMOXq2DH4wiYDnTGdzIrxeec4qrA7oiuaN5IBiSX
	LQG2rVjoTCwRNvbKgTeXC+sDqbIMOd4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-n_S7x1waMM-TpWGa2NW9pA-1; Wed,
 21 May 2025 10:50:42 -0400
X-MC-Unique: n_S7x1waMM-TpWGa2NW9pA-1
X-Mimecast-MFC-AGG-ID: n_S7x1waMM-TpWGa2NW9pA_1747839041
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4E271954B1F;
	Wed, 21 May 2025 14:50:41 +0000 (UTC)
Received: from [10.22.90.1] (unknown [10.22.90.1])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54A4F18003FC;
	Wed, 21 May 2025 14:50:40 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Hannes Reinecke <hare@suse.de>, Alistair <alistair@alistair23.me>,
 kernel-tls-handshake@lists.linux.dev
Subject: Re: KeyUpdate Support
Date: Wed, 21 May 2025 10:50:17 -0400
Message-ID: <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
In-Reply-To: <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
 <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9u1UNbBW6QScY5nOOT1cYn2neUxMTw9mqDiOC-jozJ4_1747839041
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 21 May 2025, at 8:53, Chuck Lever wrote:

> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
>> On 5/21/25 03:00, Alistair wrote:
>>> Currently tlshd uses `fork()` to fork the entire process after the kernel
>>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
>>> function from the child process and exits.
>>>
>>> This provides a high barrier between different handshake requests and
>>> ensures everything is freed when a handshake is complete.
>>>
>>> The problem with the current setup is that it makes it very difficult to
>>> share information between `tlshd_service_socket()` and the parent
>>> process.
>>> For security and system resources that's great, but it has the large down
>>> side of not supporting the TLS KeyUpdate.
>>>
>>> In the future we would like to support the TLS KeyUpdate mechanism, which
>>> means we need to maintain the `gnutls_session_t session` information
>>> for a
>>> connection to allow us to issue a KeyUpdate later on.
>>>
>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
>>> we need
>>> to store it somewhere. We could pass it to the kernel and have the kernel
>>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
>>> it's not fixed size making that tricky to do. Plus it will break if
>>> gnutls
>>> updates between a handshake and KeyUpdate.
>>>
>>> The other option is to pass the session data from the child process back
>>> to the tlshd parent process. The parent can then store the session data
>>> (maybe in a database?) and use it as required.
>>>
>>> I submitted the first step towards supporting that as a PR [1]. The PR
>>> changes the current `fork()` multi-process mechanism to a
>>> `g_thread_new()`
>>> threading mechanism.
>>>
>>> In the future this will allow us to maintain the gnutls_session_t session
>>> in the parent process, allowing KeyUpdate support. This could also be
>>> supported with `fork()` and IPC as well, but that is clunky-ier.
>>>
>>> My approach [1] hasn't been accepted, so now I'm trying to see what
>>> ideas other people have for supporting KeyUpdate?
>>>
>>> 1: https://github.com/oracle/ktls-utils/pull/95
>>>
>> Hehe. I knew it would come up.
>> The reason we didn't implement it for now is that there's an overlap
>> with session reset. In NVMe any error will be causing a session reset,
>> which then will trigger a TLS handshake. And, what's more, with secure
>> concatenation we even generate a new set of TLS PSKs on every reset.
>> All of this is transparent to the upper layers, so they will only see
>> a (hopefully short) delay.
>> Additionally, with the current in-kernel TLS the connection will be
>> reset when the IV values are being changed, which again would trigger
>> a reconnect on the NVMe side.
>>
>> So not that easy.
>>
>> But if you insist on doing that, why don't you use the keyring to
>> store the temporary session key? That is persistent, and required
>> to be present for tlshd to work ...
>
> I was about to suggest something similar. Depending on what APIs are
> available in (or might be added to) gnuTLS, preserve the session's
> metadata in a key ring, and return the key's serial number to the
> kernel as part of the handshake result. When requesting a KeyUpdate,
> pass that serial number back to tlshd.
>
> It would help if someone could review gnuTLS to see what is available
> now, and start a discussion with that community if we need a capability
> or API that doesn't already exist. (Eg: translate a gnutls_session_t
> object into a JSON string; translate a JSON string into a
> gnutls_session_t object)

I believe gnutls_session_{get,set}_data will serialize the session object.
It would be trivial to store in a key.

I could test, but not until next week.

Ben

