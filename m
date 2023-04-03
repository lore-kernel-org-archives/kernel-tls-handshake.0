Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776A882F
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 22:36:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b20so123304122edd.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 15:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680561375; x=1683153375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCRq1DTHGtVBTQJoDR0JwSt/krJ9xvX8WNwgXlKdvaM=;
        b=orWfyZNeVKimJg/OVlXTo0pi/wLOUS/UxYaPcwfLis/nvrTf7hq4kcvsSQ6qWPkP5R
         SyiyRXGRJUdBJHVKyG3ZTW7Alo5MskWck0LOiK7F/R+KDwBgUQRNAXtSjC16/rByqknm
         ADgurehLSimbcXf07kSagdBH1iWZXSkDc44Y9fcPayql1nxmVqUa7f73n53NO47xI1a1
         EWCHkKTZ/w/MdpWTPUTOcBlk6x8Y6+l7pqG96D5bMD9np4ZK5+vHvxSSeKwrOpvJfhWO
         JBi7vp8fVNmk1KgK4dq2hfWg+RY8Vi7y1szK4NrHCxHiT7BfkWyi/dJHjJiqpa2UUke4
         bYjw==
X-Gm-Message-State: AAQBX9d5PG0KWVZp759vwuaci75N+jxBHIdqtnd8+THWEYtDu7VVrp9t
	Rkl1fIELKM/aFG2LaOS8vgE=
X-Google-Smtp-Source: AKy350Yj9cdwFejMnGHyvP+jrUhICombvO6Omof3QfNzroLlnMkhoWjiDvKAlOXIXOh5flZmEGahag==
X-Received: by 2002:a17:906:c:b0:931:4285:ea16 with SMTP id 12-20020a170906000c00b009314285ea16mr202891eja.7.1680561374628;
        Mon, 03 Apr 2023 15:36:14 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090612cf00b009222a7192b4sm5054386ejb.30.2023.04.03.15.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 15:36:14 -0700 (PDT)
Message-ID: <6b4fb6d0-7090-96cb-c780-87c65c2d71a7@grimberg.me>
Date: Tue, 4 Apr 2023 01:36:12 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/18] nvme-tcp: fixup send workflow for kTLS
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Boris Pismenny <borisp@nvidia.com>, john.fastabend@gmail.com,
 Paolo Abeni <pabeni@redhat.com>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-11-hare@suse.de>
 <634385cc-35af-eca0-edcb-1196a95d1dfa@grimberg.me>
 <20230330224920.3a47fec9@kernel.org>
 <7f057726-8777-2fd3-a207-b3cd96076cb9@suse.de>
 <44fe87ba-e873-fa05-d294-d29d5e6dd4b5@grimberg.me>
 <20230403075946.26ad71ee@kernel.org>
 <c7a07e1d-b300-dd1d-1be6-311666387820@grimberg.me>
 <20230403114835.61946198@kernel.org>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230403114835.61946198@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/3/23 21:48, Jakub Kicinski wrote:
> On Mon, 3 Apr 2023 18:51:09 +0300 Sagi Grimberg wrote:
>> What I'm assuming that Hannes is tripping on is that tls does
>> not accept when this flag is sent to sock_no_sendpage, which
>> is simply calling sendmsg. TLS will not accept this flag when
>> passed to sendmsg IIUC.
>>
>> Today the rough logic in nvme send path is:
>>
>> 	if (more_coming(queue)) {
>> 		flags = MSG_MORE | MSG_SENDPAGE_NOTLAST;
>> 	} else {
>> 		flags = MSG_EOR;
>> 	}
>>
>> 	if (!sendpage_ok(page)) {
>> 		kernel_sendpage();
>> 	} else {
>> 		sock_no_sendpage();
>> 	}
>>
>> This pattern (note that sock_no_sednpage was added later following bug
>> reports where nvme attempted to sendpage a slab allocated page), is
>> perfectly acceptable with normal sockets, but not with TLS.
>>
>> So there are two options:
>> 1. have tls accept MSG_SENDPAGE_NOTLAST in sendmsg (called from
>>      sock_no_sendpage)
>> 2. Make nvme set MSG_SENDPAGE_NOTLAST only when calling
>>      kernel_sendpage and clear it when calling sock_no_sendpage
>>
>> If you say that MSG_SENDPAGE_NOTLAST must be cleared when calling
>> sock_no_sendpage and it is a bug that it isn't enforced for normal tcp
>> sockets, then we need to change nvme, but I did not find
>> any documentation that indicates it, and right now, normal sockets
>> behave differently than tls sockets (wrt this flag in particular).
>>
>> Hope this clarifies.
> 
> Oh right, it does, the context evaporated from my head over the weekend.
> 
> IMHO it's best if the caller passes the right flags. The semantics of
> MSG_MORE vs NOTLAST are quite murky and had already caused bugs in the
> past :(
> 
> See commit d452d48b9f8b ("tls: prevent oversized sendfile() hangs by
> ignoring MSG_MORE")

Well, that is fine with me. This may change anyways with
the new MSG_SPLICE_PAGES from David.

> Alternatively we could have sock_no_sendpage drop NOTLAST to help
> all protos. But if we consider sendfile behavior as the standard
> simply clearing it isn't right, it should be a:
> 
> 	more = (flags & (MORE | NOTLAST)) == MORE | NOTLAST
> 	flags &= ~(MORE | NOTLAST)
> 	if (more)
> 		flags |= MORE

I don't think this would be the best option. Requiring callers
to clear NOTLAST if not calling sendpages is reasonable, but we
need to have this consistent. And also fix this pattern for the
rest of the kernel socket consumers that use this flag.
