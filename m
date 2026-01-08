Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48F1F0E29
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887561; cv=none; b=PeOgjb/JuWzYoHZuPc+9FIzsfUq9t+4p/Xpw0zO1Nhk0jlVkrx9MksNbcDPWo35qbLHJ/v7xns+Hc0dQ5g9FneYP/EiJ5rDVJHq/1t8qf1UK7VFkv9EmPMrhTEuZN1/pJFOAxR8XFUSBxCx3I1igB5CW2eF9BU6ywG56bj9v85I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887561; c=relaxed/simple;
	bh=Ecl1PbKVRyx23lmWYgMZH9CBPlfIEVtqzYUAkJfKTuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkRHJjob41lb5r9uyBjDhO3NjIo9TO+lVguMVTFUvVNsdal9vPDigVIcrim10J8hPZzS1ohgXkbcwP1tg6ihYJCYfS099FvDADL6Y3XJvqnW5OTa9Ki28GDaDyl/F+cYM4bvFRa/v2tKh+zkK/6epKp8QiEKNQTP6ACoW7nfzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F7DhJdG5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F7DhJdG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767887559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74FrBsYB82BggKYVQEFS4TeWY2PiI4VLCk/K0yOsgeU=;
	b=F7DhJdG51RejkBBv6TG11JBxF2jkTFm9B7vvdcPrMHMESbLGoEKda03w7q/jG+p4oH2h/S
	o1G6/oDtbiXJuFOg9YBjP8zJc2ICdJK6tcQvZm42YhTpWyPBatnGvQbexH5hcesSIo+u3C
	eTQ1ge0fAhetbWIGwGC7yj2pgFOc95Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-zN2DFA2JOPStLbQ6lizBNg-1; Thu, 08 Jan 2026 10:52:36 -0500
X-MC-Unique: zN2DFA2JOPStLbQ6lizBNg-1
X-Mimecast-MFC-AGG-ID: zN2DFA2JOPStLbQ6lizBNg_1767887555
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso2166891f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 07:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887555; x=1768492355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74FrBsYB82BggKYVQEFS4TeWY2PiI4VLCk/K0yOsgeU=;
        b=uZiIH5uv4DG4SI8bHMZq0CKcAzXLJK1Xh5TTuhn0z5yS2mD3Mw7Vo2vHI94rDE/rWu
         JDs3UaWILETIzFgdkoljwusy9cAfkI4/1A5uVXYwXKQjOKuNswVc6RdBGnSzKjPqEpIP
         0QjuYRNM3F0PjwvF4PekJnLmAP48lNNyeo/VKNkl41k1bck0jiZXVuQITIp6rDQ1z080
         1q3QQBZEMEhGXNIwYimVoBDZtP1X45NGBtT6fPt7DSpdFyMCLimEeprDFLAt1jXgrYRR
         uSLmBlgc1MnPTwvO8O1hmM3/xZuELf+IEnvkD0Sjdu/GrbnP05VCEglDI3RMyp8UKz8N
         7BWw==
X-Forwarded-Encrypted: i=1; AJvYcCXePn2ie139Yf1NR5OG/fmwLpnhHKh2jB8+OduwJK7lrAgv1VUbK8/TR1oMra04i1A61ENYaLtwDWaY7BYc7FsqBhpE0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTC0hySBVrkI0DWiX+dUQDACgKrSP0iQawUWZx9yMIRVCKAUO0
	dRwm+9YxeFdPbjLhYIX/aX3pcBuIbcwhgVXAw4JZWs7rpqGNFys1JYaOlFYEk7wqJNu07PMeZJx
	IdFjGq0mjpbmpgzRP24yTuoZIdOdYAlcfdPnaz3CXQqOI4KBOy6Y8K6/wbYxkhEt4D8Nq/CB22z
	1h
X-Gm-Gg: AY/fxX4Js47vSDe4/jcO4uaKBNPV7P/W8ho00wvEJq8/DJtQcceiTQLfjpoOiXUg7X6
	Ce5G2J3T+uZ3e06CiE4yfAsi6XQdPUbc8lfosEYl+47aOP3ZOWQb5jQAQot3XIIn8TPUUTu86WF
	D/FxHck1WqoT5cIbO0aG9RmWYu/J7ZkVqn+Cljeua2FGPdK6Wb0G8DKs3rJARCZ4/Q8wOuEUXC9
	j5f/v3xME/NvLS/8uOZKxdvRoXContcwQ25pP/bIMMuiNXKU9br1SozN/tzrnEzli/q/9UHxSAr
	Pv96YFdYeeag3ULVHcUHblo5aZ1E5f2vIDJnIurWAJSvCCQ7RipWqKQQty8IOnIZKz1rtpnqw+U
	5Wgefz4+w0TzJcw==
X-Received: by 2002:a05:6000:4284:b0:432:bc90:2cfa with SMTP id ffacd0b85a97d-432c374f5b2mr9200063f8f.33.1767887554989;
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSKdamN7KlUBs3N2vJJPlmjw5J/9h4DJzDryl8KQLv679zn5HwyVK1QASMGXWGmNWePQJKlQ==
X-Received: by 2002:a05:6000:4284:b0:432:bc90:2cfa with SMTP id ffacd0b85a97d-432c374f5b2mr9200014f8f.33.1767887554566;
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm17169574f8f.43.2026.01.08.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
Message-ID: <ec28c852-e80a-41c9-94ce-a0fce8ee07e7@redhat.com>
Date: Thu, 8 Jan 2026 16:52:31 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 07/16] quic: add connection id management
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1767621882.git.lucien.xin@gmail.com>
 <79bf90a6e105c6e6ac692de21a90ec621af47cc5.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <79bf90a6e105c6e6ac692de21a90ec621af47cc5.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LLTUv6DLt2CbrjkOeKmTbUHaQsO23M8u6NwsaUb18r4_1767887555
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +/* Remove connection IDs from the set with sequence numbers less than or equal to a number. */
> +void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number)
> +{
> +	struct quic_common_conn_id *common, *tmp;
> +	struct list_head *list;
> +
> +	list = &id_set->head;
> +	list_for_each_entry_safe(common, tmp, list, list) {
> +		if (common->number <= number) {
> +			if (id_set->active == common)
> +				id_set->active = tmp;
> +			quic_conn_id_del(common);
> +			id_set->count--;
> +		}

Since the list is sorted by number you could break the loop as soon as
common->number > number.
		
> +	}
> +}
> +
> +struct quic_conn_id *quic_conn_id_find(struct quic_conn_id_set *id_set, u32 number)
> +{
> +	struct quic_common_conn_id *common;
> +
> +	list_for_each_entry(common, &id_set->head, list)
> +		if (common->number == number)
> +			return &common->id;

Same here, you can break the loop when common->number > number


> +static inline u32 quic_conn_id_first_number(struct quic_conn_id_set *id_set)
> +{
> +	struct quic_common_conn_id *common;
> +
> +	common = list_first_entry(&id_set->head, struct quic_common_conn_id, list);

id_set can be empty at creation time. The above assumes it contains at
least an element. Does the caller need to check for such condition?
Possibly moving the check here would simplify the code?

/P

