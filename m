Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED032248B3
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883212; cv=none; b=il2QsG/WynEcfBm2q/OmuGBQwkcaOdvKQl7sW2wWrUYccSoJUNLWmaNFOhS5SseHd2ni6FGNHm7PhS6fWwhBSFZioFtwxqzTNmuPFBiXB7uIRVotxMhLRxrWGknGxIUZdTga7otn4YQibeIBuH3JnmZZU/NUntzUuvkcsGndUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883212; c=relaxed/simple;
	bh=dPmlogqSF3x91CEJq+G86ZMwTBqFlXyFWdTsnVs3Vl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8BjF6AZmpoVILAoXdluVGdn8umFGhYo0x3kMLWqzHYaIzsfS9DnQRgw+feAaMnQris48H8jJtuEf9yNipjB4ZeKY8wk/3NZetmmMKli9x6YtRuToU2QasHm0HhTMIlV9nypQSUe+0ZgoUSTp24MrZARvauq+9wZ5JK+NQtlHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEl/xqf0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEl/xqf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njA+hTMBn/k9kWyQkaykZqwF8RGh2m3Qf7ruOi453Qc=;
	b=AEl/xqf0vVD/wXpbQCH0NXSbExyann50q+o2GpU+l3MuPMpHkLvs626IZLyEMO+IxUb4PN
	Iu3/VAtXghFYiFcj/3KagP2+SuCfaDnni+s9MqE4DbCiivfMo2EalFLJshaY+rJaSgdTp7
	9nwokz5RegI1pbtyVJofpnzyAAFGboc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-p0QdbfLHMxOPHc127MpH5w-1; Thu, 08 Jan 2026 09:40:06 -0500
X-MC-Unique: p0QdbfLHMxOPHc127MpH5w-1
X-Mimecast-MFC-AGG-ID: p0QdbfLHMxOPHc127MpH5w_1767883206
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43065ad16a8so1952544f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 06:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883206; x=1768488006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njA+hTMBn/k9kWyQkaykZqwF8RGh2m3Qf7ruOi453Qc=;
        b=ta02dGk4tMxr/lFVBhMjVAjXb1UPZntcVDKRyRZ4RIvZwj+KWBNxySMHHftojHfYsA
         n78bik7tBv6Ie9G6VuSjNYdZnV+se8X1V1CRGeHx+kBPfLjMI1SzGjh2hn4MF7aIAXFD
         a9uuIpW/UZznJXssWudixMT7BHFtp83/6ac5+aE6dQd5yfKLjRp6zdBhIGxNUr4Kr57X
         jjdLrnQsYhw/TKDqM2/zjWHLV5+mglTa8x7vbc32ovrKYTSlr3W47iFu3XY0ye5n/Sc/
         x9LnXEX6TVaCpEJIpi1rCu6SjEukPRvd2nXfCA51tZo3i8YNzh6vVvkHZp0sDIDfT+qm
         DOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd/DgPhRGOX6kTg5fAKo9aXwaRm47lyaCvld75EjOu0WRLgl8muKzrXnoJtyxjHr+ZOVDcfCiI+tfBMG37Vq9fv+q6/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqSyXzUr1GWLSw6ExgR7ZjJ/3rkDH8Vj4IzzoZjBqrnXzUGbU2
	1kLDK9KKiIDq0sfgsmAbL2GtS0htW7JVeetLal3G1jsNWRj2PLxFmNXCdTItkV2H/P/gN38Ko1v
	FcIZossE0pXAPHXllo4FEqXKkrYGoGSsqs/X0f3zI5sH+W6nUZP1d1S3QsC7eN1nPcNiPtJ/O/O
	i2
X-Gm-Gg: AY/fxX6EzknxQT5nHCpr1HA/OULvyvuz/N27SCfA8P4Q7SAKiZLWVlVDUXf2PzcRhl1
	9MGjGgUgmHnZZVmzNL+85g3ZpzGQveTPUDfQv9k3qI73CwsXA/wDAN07Cmnbi0YbImFJXqktDmB
	ZSqOfHRvbOGDuROqeQt0byWRcVoAKquxsHSu2yOKdsiy0xMaj7kJzjsRQhrIsYGy8i2To8giS71
	Timq0tS5OXUbOfALiyk7CWJ+VTOvO5/l/Dy9V/HllDGO3F6Pc5WozvZ5RaYcrItq8aEdVzyJENz
	PCghhMrZDz1m3bxquDl5CcRTx2rE+ofSF17PSCIExlmNlyT2PUZbtYOmc/g2AXQ+VUmxQ0cVUzG
	Ar/bDGqMbwpO73g==
X-Received: by 2002:a05:6000:290c:b0:431:864:d48d with SMTP id ffacd0b85a97d-432c36282b8mr9097906f8f.5.1767883205630;
        Thu, 08 Jan 2026 06:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhrvE0E96qmKMPJwgFr/KgrUshlj3gNC/1jVjlfOFsD1VsRwzSKI/T+U4gkSRnW2fyKqjotw==
X-Received: by 2002:a05:6000:290c:b0:431:864:d48d with SMTP id ffacd0b85a97d-432c36282b8mr9097863f8f.5.1767883205167;
        Thu, 08 Jan 2026 06:40:05 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff1e9sm17531056f8f.41.2026.01.08.06.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:40:04 -0800 (PST)
Message-ID: <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
Date: Thu, 8 Jan 2026 15:40:02 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 02/16] net: build socket infrastructure for
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
 <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fB36XAk9zjwdXCU25QwLNR5FFpTCC6N4QzLHk7DEy-g_1767883206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +static int quic_net_proc_init(struct net *net)
> +{
> +	quic_net(net)->proc_net = proc_net_mkdir(net, "quic", net->proc_net);
> +	if (!quic_net(net)->proc_net)
> +		return -ENOMEM;
> +
> +	if (!proc_create_net_single("snmp", 0444, quic_net(net)->proc_net,
> +				    quic_snmp_seq_show, NULL))
> +		goto free;
> +	return 0;
> +free:

Minor nits: I think an empty line before the label makes the code more
readable, and I would prefer #if IS_ENABLED() over #ifdef.

Other than that:

Acked-by: Paolo Abeni <pabeni@redhat.com>

