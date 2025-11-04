Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00739308F34
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249096; cv=none; b=cEDzvFLPZ1bfd6yecih6z10kl0kpTCbtNUCzrUooOFIZ0blrzmiUpO2y70xT3f4b/kcolLs6YngqAEIyrcVq+cob26h60vCjHJOToYKvhf5eM/pLKReHVjnDN5k6+9vRH84E1PTAq7LmCzgoclqJDLG3z/tDdwT5FA/L0T1iSc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249096; c=relaxed/simple;
	bh=ArUnwMfmIEzmSnA8EtwjQrV26Mp15GPDfG/Jc+Af2u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq17A+YPYTlVmP4NjOKJpTkAckSqXTNBnaCr7Y7ifkhetrQAFWvg//t8m4D2lzM2768qfpRzlmvbhYBHxDC3Kgbn50VHex1J12wfzY7V+0OtoWnogjNf3lNB7pX3uDZbEauzUrSM2xPCYED91NxZTPafGFyTLSKhI/go5HHtqIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWoBoyHG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWoBoyHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762249094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pyvHBDgoa9Lgk2kT7iDSPcIKDbs+wNswe6QWBYpGLg=;
	b=bWoBoyHGu7bGgESBWqxdzEiJC3Bo6UkEGAFpS+/PJC3fh/yqim6s8xMKUtbv8yEtAC73pn
	5wryZwXZSMt92a4mQKdV6aHYG21sYUkQugtReGvs6t+md7s/iRjBCHKkSjhMPu1R8OdQHJ
	jDIJPnQy6x1owZNK5GIo5fs2Gl4HPak=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-qsfHFH9bOROewiLBhDTc_Q-1; Tue, 04 Nov 2025 04:38:10 -0500
X-MC-Unique: qsfHFH9bOROewiLBhDTc_Q-1
X-Mimecast-MFC-AGG-ID: qsfHFH9bOROewiLBhDTc_Q_1762249089
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-475de1afec6so18505705e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 01:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762249089; x=1762853889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pyvHBDgoa9Lgk2kT7iDSPcIKDbs+wNswe6QWBYpGLg=;
        b=ZE4WJrbcfd9zUeSnrZ5IpDOmGtYR62vd+FunXhKaztPAzkWwfjSdcFQpU6xlaSKqDb
         1cdRCx4+f15T7c73++heV4/8Cmrxl+NTb9JUEaRGYjTfig79FKApBWIZu08aujmGwTkj
         dChTPJjB2UzjcFqGD3Wgt7HCzlmexDQOCy8FWYXwHbyYF7+UXF0a68Enew390Rr6TqWx
         4NG8jTecYBlgjdT+BTaB1QxKSAPpaRndGXQMUTQxb7BEfnpem/Rc3CJu44oH4ghxa6YA
         gCdaYQCPqEDOlpH66e19BOXHmFkhPE9/EUaP/p4OdnGgCXSiRO38nttO68z7y9UvsGUc
         bAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUcN37SIvo8n/OGbCGzKIfflxoNY4fajxjVZU7aic8QseRNEOdDcAt+e7YuLreFD6fhqRcwd2xDGpdYA7W3y4N++D5ECg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVM+1AmDfu6a1MYlBPegoJo9H9jm447Umx1ChTnHCqf1WDlyp4
	fZCSvodpSLDKzJGBaKxY1qZ4FTieHGuSAYA3ll15Hi1KCtx23N9Ut7d/UWD/Y4JsP4Gv5cWrI5J
	soIRZpAsAIRKiiC5GNTKS7A2BxIixRZi5Ttk3IYEpI30gW7U5ZDupKfJSd2c7db4fIsiQX4FF6Z
	YX
X-Gm-Gg: ASbGnctz8zA6viaC6krHUMDivhbH5ybgpaqEyT6AFJwCm+PREOWydKmCv+xdUJ4EYcJ
	t3MAHJnk5CD0bW3f6kD777gwo+m+z4OKJUqstCOuTEwdQouzn2EXsk4MhtGRTvG5V4eUXE7wb3C
	BX1JOnukF8yfcG9f6tWgsPcY8htlpWRi+v4UiEXDBulKr7sD7M/fMPGlUDUYd1kt2YzUXjwpExF
	H+jAQMP4fig/ndRezfWzHosPA/+Zf+0eKVugL7HG3/9NhRgPwXaR1hT/3Ya5GqKCMyg7hUTUDel
	aD++jtpbVdM85oENxHLrSIp1KtFCMVjNJd4mg7KYaXPY2zmarJd3DSn2AnlXjY9qpi1tCQyMsVe
	694MExhNY8zoDGc6shpov/7ejYMs1Xq/Q+XTQx2j3Jagr
X-Received: by 2002:a05:600c:a4f:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-47754c451bcmr27965185e9.19.1762249088939;
        Tue, 04 Nov 2025 01:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG80tPo4mrfA3siN/+q+3zHsJR+5U2uhmtdOUUiclztFGU6pmZw6TuGG8AfTCenVCWwmNLdzA==
X-Received: by 2002:a05:600c:a4f:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-47754c451bcmr27964725e9.19.1762249088492;
        Tue, 04 Nov 2025 01:38:08 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c383b75sm248333615e9.11.2025.11.04.01.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:38:07 -0800 (PST)
Message-ID: <ffe0715b-7a60-49a4-802a-a2bd75c7dac4@redhat.com>
Date: Tue, 4 Nov 2025 10:38:05 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
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
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GzJJhFBeZqJAUWLYR5H0e0iPrPYCkJkNbcX-5L9Hjv8_1762249089
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
[...]
> +static struct ctl_table quic_table[] = {
> +	{
> +		.procname	= "quic_mem",
> +		.data		= &sysctl_quic_mem,
> +		.maxlen		= sizeof(sysctl_quic_mem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_doulongvec_minmax
> +	},
> +	{
> +		.procname	= "quic_rmem",
> +		.data		= &sysctl_quic_rmem,
> +		.maxlen		= sizeof(sysctl_quic_rmem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec,
> +	},
> +	{
> +		.procname	= "quic_wmem",
> +		.data		= &sysctl_quic_wmem,
> +		.maxlen		= sizeof(sysctl_quic_wmem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec,
> +	},
> +	{
> +		.procname	= "alpn_demux",
> +		.data		= &sysctl_quic_alpn_demux,
> +		.maxlen		= sizeof(sysctl_quic_alpn_demux),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
> +	},

I'm sorry for not nothing this before, but please add a Documentation
entry for the above sysctl.

/P

