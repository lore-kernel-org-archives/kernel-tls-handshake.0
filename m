Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD43D410C
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295712; cv=none; b=ujoxxOH8yWSH4wcFCIKfyHaMWiwwbdIDcoG4nfI2YpdY5ATAGM7LliNFCQPq7nNn+5fAMp3xRkVhawu/daA4JgTE5/UK7e7ZOfj82RQOt9Lm14PnouZCGCq4uDjb7ykgGKsg5Wr8dQ9+wtpQN9mJO06juJ7fDb7YgiDc/ra0VmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295712; c=relaxed/simple;
	bh=mIAhPyVOqRDwJMq/L+Fm+xDHGGiSnfR1mZdXuRd6K0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBSTSWAoLUQOvRZPKPg212a5nt2N4hRGyGWM4I5qBxFfVhTRT1e3xlQbKZRiuHYx2GkTJaJ/Ocq5q9VwAyFdQaUKAooyMVVsFZ1wX1VOERCkFw7QwL38fUETzDBQh+zVMKGV6+CSi8cEfo8BuNhexuzq+DLi5N9qH3LGkoly1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GB1ptutZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GB1ptutZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770295711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd7quC0GtIREsRfL2ubD1yE2knY7YDhEMVXNy1vPWY=;
	b=GB1ptutZ1J4wlaADRs3Y45xy90jxbTXndVQBgB6/4xdk3Uw6omBPmL5q8C9l6qv29OmvJR
	q9ePtfySVV4Sfz1TdZ3wqcumw33gCTWUtVnSW0kpGlvqAFHAvg/eTfGffMpQI3Vyy0CTHI
	hYKBxmIaoti1DM+WUmq8S7o/+aTQEN0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-4gPhrYhWOby_crSxljiEuQ-1; Thu, 05 Feb 2026 07:48:28 -0500
X-MC-Unique: 4gPhrYhWOby_crSxljiEuQ-1
X-Mimecast-MFC-AGG-ID: 4gPhrYhWOby_crSxljiEuQ_1770295707
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4358f90fe8dso644199f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 04:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295707; x=1770900507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWd7quC0GtIREsRfL2ubD1yE2knY7YDhEMVXNy1vPWY=;
        b=eriq/QEIb8Sm+Z28w2R7ntjh3kmAJfKu+TLCegjEHzNEjpaMCxu98J13Oo8B6lChMA
         2UFI1b2AuvMWcNf88HIzMxh9lP3GqyMIbWOTII3XBaQIaWMglBitiQqEOXCLmIplapcf
         2yTYRSojrZVdtx03HfXtLPhAOWBAV9mUInL1cNrfT86OZD2F/Yjrh8pxSQiJPeFIBYFi
         MNGDF6BgmhzHnpgdgYTqpVZLFBS4v0k9KRiwQEHk58fLrZ75dsOz0SOH6RN2sZ+NOn7u
         pGyA8ueks+4HMq0vnuKCeYNsymG6HOnwLQByPY8KbsB6uv1LE5j825ZmirByWkriW2hO
         EjeA==
X-Forwarded-Encrypted: i=1; AJvYcCVRqMPiM3QB2MNAQOOg5Sht/yCYsUm1iIErorSeDicnL/T1BH8a5JbHpmWs+FbhmYtJO6/MkVhRqqEKc+08BS7ZB1DVAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvGX9L2yFdSkbXhxOs+j6AXlfJVrIDh3JS9T/ivZZLQtvm7Dav
	lJL93qQtViRIMVYfgXgmfoqoxsXbaBkoUIdghPeoqQ84dRxUtleApfZJiiBNohLiw4W1wjfI4xV
	RNvaV54sE5aYuFu5CNg6xRalhgw1aNz+FPPcmtn/5xftKjm10DWoi9ZiX9lm52sKFta/cbABnt7
	Fl
X-Gm-Gg: AZuq6aI4bBYmxEPJfJMzG98pryrJIrGk5WVwJc41pcc8HthApgmvCfwF8QGrl8JzB1X
	YahRjnv0XxuHGu74cYuJJ/V9F/ZnspJojpPfXcBlPbDHbF/HXwXj+goZr5/lNcNymMrZXpDeqWi
	EWTPLEA17dm4XYfFIiH1k7uZeGV5ZaEEHWchc3XzhkjYGYsGfSBXvxycK6HgGjeIEwi9AwIeZ5o
	YYAHpZcmvbBMx9XUAex4VUmPwu17ExiUF5hudobTcNozCix97budiIR1TiMr6x8Zum2uPtYH+1o
	NYIcYTF/cV/9tk9ckVOB4F+JJA+o/lWVNGHU3Bf7LTKZS/VN7aJtcemIpetElYbomw9IQ9PCKkr
	CFZKsQWwpl+4B
X-Received: by 2002:a05:6000:4212:b0:435:dbbb:992a with SMTP id ffacd0b85a97d-43620987791mr4703653f8f.6.1770295706653;
        Thu, 05 Feb 2026 04:48:26 -0800 (PST)
X-Received: by 2002:a05:6000:4212:b0:435:dbbb:992a with SMTP id ffacd0b85a97d-43620987791mr4703595f8f.6.1770295706171;
        Thu, 05 Feb 2026 04:48:26 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25cefsm14701496f8f.9.2026.02.05.04.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 04:48:25 -0800 (PST)
Message-ID: <e9b073b0-60b7-4a45-9b6d-85c15b51fb4f@redhat.com>
Date: Thu, 5 Feb 2026 13:48:23 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v9,02/15] net: build socket infrastructure for QUIC
 protocol
To: Simon Horman <horms@kernel.org>, lucien.xin@gmail.com
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com,
 alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org,
 tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se,
 quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com,
 dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com,
 pc@manguebit.com, kernel-tls-handshake@lists.linux.dev,
 illiliti@protonmail.com, xiyou.wangcong@gmail.com,
 andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com,
 matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com,
 metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com,
 dreibh@simula.no, davem@davemloft.net, sd@queasysnail.net
References: <28a1e36188b1a84193ef2d78f12ecbc0e43ae7f1.1770042461.git.lucien.xin@gmail.com>
 <20260205115423.2195277-1-horms@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260205115423.2195277-1-horms@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -iUM_hgE_batyOFsjaiqc99z57rEMBpC3FrZ5FNkp2g_1770295707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/26 12:54 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: build socket infrastructure for QUIC protocol
> 
> This patch lays the groundwork for QUIC socket support in the kernel.
> It defines the core structures and protocol hooks needed to create
> QUIC sockets, without implementing any protocol behavior at this stage.
> Basic integration is included to allow building the module via
> CONFIG_IP_QUIC=m. This provides the scaffolding necessary for adding
> actual QUIC socket behavior in follow-up patches.
> 
>> diff --git a/net/quic/protocol.c b/net/quic/protocol.c
>> new file mode 100644
>> index 000000000000..6ab81f1c50cc
>> --- /dev/null
>> +++ b/net/quic/protocol.c
> 
> [ ... ]
> 
>> @@ -0,0 +1,369 @@
> 
> [ ... ]
> 
>> +static int quic_protosw_init(void)
>> +{
>> +	int err;
>> +
>> +	err = proto_register(&quic_prot, 1);
>> +	if (err)
>> +		return err;
>> +
>> +	err = proto_register(&quicv6_prot, 1);
>> +	if (err) {
>> +		proto_unregister(&quic_prot);
>> +		return err;
>> +	}
>> +
>> +	inet_register_protosw(&quic_stream_protosw);
>> +	inet_register_protosw(&quic_dgram_protosw);
>> +	inet6_register_protosw(&quicv6_stream_protosw);
>> +	inet6_register_protosw(&quicv6_dgram_protosw);
>> +
>> +	return 0;
>> +}
> 
> Can the return values from inet6_register_protosw() be checked?
> 
> Looking at the implementation, inet6_register_protosw() returns int and
> can fail with -EINVAL (if p->type >= SOCK_MAX) or -EPERM (if trying to
> override a permanent protocol). The calls at lines 234-235 don't check
> these return values, so if registration fails, quic_protosw_init() still
> returns 0 (success).
> 
> More critically, quic_protosw_exit() unconditionally calls
> inet6_unregister_protosw() on both structures:
> 
> static void quic_protosw_exit(void)
> {
> 	inet_unregister_protosw(&quic_dgram_protosw);
> 	inet_unregister_protosw(&quic_stream_protosw);
> 	proto_unregister(&quic_prot);
> 
> 	inet6_unregister_protosw(&quicv6_dgram_protosw);
> 	inet6_unregister_protosw(&quicv6_stream_protosw);
> 	proto_unregister(&quicv6_prot);
> }
> 
> If a protosw was never successfully registered, its list field remains
> zero-initialized (NULL pointers). inet6_unregister_protosw() calls
> list_del_rcu(&p->list), which with NULL pointers will dereference NULL
> in __list_del_entry() -> __list_del(NULL, NULL), causing a kernel crash.
> 
> Note that inet_register_protosw() returns void (cannot fail from caller's
> perspective), but inet6_register_protosw() returns int (can fail). The
> code correctly checks errors from proto_register() but not from
> inet6_register_protosw().
> 
> Should the return values from inet6_register_protosw() be checked, and
> should the cleanup path track which registrations succeeded so only those
> are unregistered?

I think it's easy to infer that that such failures are impossible, but
since a repost is needed please drop some sentence in the commit message
to help AI see the point.

Thanks,

Paolo

