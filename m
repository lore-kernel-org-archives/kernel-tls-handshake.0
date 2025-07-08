Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6040A15746E
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  8 Jul 2025 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969530; cv=none; b=WzSY8bIcNNHLUPal9seIq5QvkLd1zvPm0iX/OqXEdafCUTuvzx/6nfTZOQY24J+eTu9sEkcAGV3CPbPNPsgpQLO4TPkNpnV7oKkUBKW3lEf0bvEv3QMa6NfAickNV+IHMnmRnHGhBii9ETw5XqKreR19hIJr9txJxC5/CnmzbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969530; c=relaxed/simple;
	bh=/HQa1z1jN3PpAa++723aUcYRHiwy+TUMDJs6S/qMvW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dg6ieddT+9yNUGwLO5rz2l5HDHRGtl0NHrCM2Sz93AtilyybyZwwCKFxLI6fgfXQHEza4kiSNAsrR572O78PcXdmF7MzGeuxK1sQBWXqxoMFKSe++yERfQNlBIf4OvqEeYjnSsZ+xaG6oNOyGq7lNvTmzJimjehLSxwT/UzB6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhAsWk7A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhAsWk7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751969527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VckvREiCdKgjlwTR0uzox8k7xIiq/bs/ylaonm/G3bc=;
	b=hhAsWk7AbeQZd5JSFYY6ZnLEwXv9C2bmV8dIqdcSULch63ElXog8AjBWYaeLBjc5FKkoCG
	mrJQ1mNNZ1nRjMdnrvEifhc2vnfMbPBARsl84czWFRxy07BEU+QKbk+1Vs7bWDRvzI83KE
	8Mb+Mud2dV1kEicY5XOfYofscdsjoj8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-atpYWMHmMTS4jy0ING4-Yg-1; Tue, 08 Jul 2025 06:12:06 -0400
X-MC-Unique: atpYWMHmMTS4jy0ING4-Yg-1
X-Mimecast-MFC-AGG-ID: atpYWMHmMTS4jy0ING4-Yg_1751969525
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso20233785e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 08 Jul 2025 03:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969525; x=1752574325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VckvREiCdKgjlwTR0uzox8k7xIiq/bs/ylaonm/G3bc=;
        b=kgSmHZUGAFrXTJrnjMyz31J2HNtcemaFjV5E55wyU6LnHPJ6PLaIBi460YNUqQJYHW
         ePfUXzXCMTHNoWy3CMJ9laZonvHlvLdZs2Zbimufq60E/hPReht0NLugU9QIh54KiCB3
         9WJ7l3PgW+kPxUn4HgTbwKIcMmcYsmFj0u54jZj9nHTNrDBav724NG2+YNeJoBZKm57I
         3xIWdlai+VilVOJ2tfcmjvnWCHxtG1iN4/tACFF/zk7HMtHCz3IYxElNBEVszCVIJ3n9
         f1NtTXLIoHmfixtx2xWKOp1HEMxYIb5Ek7RQmylll1CpRYGckX93Wvn4l7jpteoRkP80
         5KJg==
X-Gm-Message-State: AOJu0YwRdlFP4vZ/5YfqBwwC9ygju0k1HPfydu+Vx9PqQVeOOXJMkZ4z
	soBL38XncXVt8a7EwBgasfUYGKOO7N4Vj0JB8d3Nd9cy3Jdm1B4oZiUE53odE1FY9AYgxlzYUpl
	WAgFrj2ZLU23l10qkoec5A20N3Q9jN251nuQxWgAIDcGD7av/1drTLo7boifBvRwns5ap9NcsFM
	jc
X-Gm-Gg: ASbGnctS8u3mzMVLSJRThnad2TYwSv1DspvVrwZjl2oYMaXLiS0QwvYcLCq79rGL2Ha
	M1p7tcUQpJsYIhWOqRBxumE+uEWpt8BUez7sfOeMhi+o4byoDkvkh1pgyuQzqkwkO/nKvJbCe/X
	HsxzijOn6QCEbXSn2VX+yaQ18xp1LO23RVnclTOkRiycxDaWuraXC6qnA+1tfjDE3hBExG7tIvX
	6Kxox1hwWcDagcqv3aSySTbVpJp0jSGO+RhbQSwn37wZAmzactIrgc9OVsysiMGVlVBAEFgibXX
	79mkC0ls2NyUixs0NThzu5x3Z3P2+AROKQOqUZpH/tQhfSP5dqRtVkvfVmVOSErBsA2aDQ==
X-Received: by 2002:a05:600c:8217:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-454cd4bb133mr25933405e9.10.1751969524774;
        Tue, 08 Jul 2025 03:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv2EXOVvGkJ5cBb0UY2EBrYXftEd6mDal9FJ3lqO+qaygdclYdtCf2yd+Q8hcc5IGZWIbqJA==
X-Received: by 2002:a05:600c:8217:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-454cd4bb133mr25933005e9.10.1751969524261;
        Tue, 08 Jul 2025 03:12:04 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd3d2661sm17889835e9.19.2025.07.08.03.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:12:03 -0700 (PDT)
Message-ID: <59259094-7eb8-42ce-aebb-c5b286a4f31b@redhat.com>
Date: Tue, 8 Jul 2025 12:12:02 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/handshake: Add new parameter
 'HANDSHAKE_A_ACCEPT_KEYRING'
To: Chuck Lever <chuck.lever@oracle.com>, Hannes Reinecke <hare@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, Hannes Reinecke <hare@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org
References: <20250701144657.104401-1-hare@kernel.org>
 <20250702135906.1fed794e@kernel.org>
 <5c465fcd-9283-4eca-aef4-2f06226629a3@suse.de>
 <df7a3f18-3971-434e-9222-6744d5b77f83@oracle.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <df7a3f18-3971-434e-9222-6744d5b77f83@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -BFUMg93PZ6G4XuHxU1BbyeIE48K7qdX9ATaNwBlyyk_1751969525
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/25 2:55 PM, Chuck Lever wrote:
> On 7/3/25 3:10 AM, Hannes Reinecke wrote:
>> On 7/2/25 22:59, Jakub Kicinski wrote:
>>> On Tue,  1 Jul 2025 16:46:57 +0200 Hannes Reinecke wrote:
>>>> Add a new netlink parameter 'HANDSHAKE_A_ACCEPT_KEYRING' to provide
>>>> the serial number of the keyring to use.
>>>
>>> I presume you may have some dependent work for other trees?
>>> If yes - could you pop this on a branch off an -rc tag so
>>> that multiple trees can merge? Or do you want us to ack
>>> and route it via different tree directly?
>>>
>>> Acked-by:  Jakub Kicinski <kuba@kernel.org>
>>>
>> We are good from the NVMe side; we already set the 'keyring'
>> parameter in the handshake arguments, but only found out now
>> that we never actually pass this argument over to userspace...
>> But maybe the NFS folks have addiional patches queued.
>> Chuck?
> 
> Currently .keyring is used only with NVMe. I recall that hch has plans
> to make the mount.nfs command set .keyring as well. However, nothing is
> queued yet, as far as I know.

I read the above as we are good to apply this to net-next right now...

/P

