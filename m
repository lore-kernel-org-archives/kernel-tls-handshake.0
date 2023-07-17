Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDA5107B0
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689630599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccmrDravX+l8BnwK6ZugjyBUfbAn5Q5vDrg1z9gSlUo=;
	b=HOVt5Z5BI+nqwtRi53ogEPR8QHqqWc2cRWbOQaLhE7uw+zw8MJilcNeBjgtc1z5YzXzL16
	81bidKOXoPQd6/vPnxdPU8vKvQZ9hZGjSOyjbczBLt0E2HYvjwxSnsG5o75TcFGUkreDZ7
	T1MRL5V6ID8igz2PdxgUft6q02Bqm4s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-SgnaKs65PJqOEOpmiy_raQ-1; Mon, 17 Jul 2023 17:49:58 -0400
X-MC-Unique: SgnaKs65PJqOEOpmiy_raQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635eb5b04e1so12570246d6.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689630598; x=1690235398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccmrDravX+l8BnwK6ZugjyBUfbAn5Q5vDrg1z9gSlUo=;
        b=Haok8xuBTco8NYPvXiAWDjpwgsYPJJe73zaYlHSXRZUUzanGeTpvBAQH6Hce/o1dEu
         IBgwt50iqUTGbjo3Bz/2ouI/S7mRXOr0T+M+ML6XNzjrjzJZG1uHTLkxo/SkyWIujH+3
         Pj9aLb0J2i1K5Yo2+7Un7wx2kLRUSWdY6znjgLTEQnEiDyw5XhCcER0xvgUUg2av9kiw
         sPgx93+Rk9B3WehwUcz/4JtEGePzN9VDjocQuS3une9aORojAKw8cVxBgCzzjUcc3b7n
         umpTnFL8Q1S0Y8yc3xQfU6UPe0es1pF90tG2t2XLtrLqeMyvuXnJmmPe/YRyfoQOLGCU
         LKOA==
X-Gm-Message-State: ABy/qLbC10rqyRPkEjpKpWmQjQwfZ5VJg5lnjSKYM1gnkIPJR49kE3nW
	p24OzqzjDkFcd57563dO5miTas8BWLiAL7jwRgDzkwns/lxUIREsruRtyjTt2YRn4iTrZBIcUt+
	ed6QZASD3VRYZiRNuUFZvlEtwhAM12uYOVV4=
X-Received: by 2002:ad4:5de2:0:b0:636:e4f:6b88 with SMTP id jn2-20020ad45de2000000b006360e4f6b88mr14551173qvb.1.1689630598155;
        Mon, 17 Jul 2023 14:49:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcxdZMpFQNuKsb/uCBhcCKRYz1VF08xdYyYv43Aj4LGTL2/w8t9NpTP9YR5UZQHmOSEjxBQg==
X-Received: by 2002:ad4:5de2:0:b0:636:e4f:6b88 with SMTP id jn2-20020ad45de2000000b006360e4f6b88mr14551163qvb.1.1689630597887;
        Mon, 17 Jul 2023 14:49:57 -0700 (PDT)
Received: from [172.31.1.12] ([70.105.251.231])
        by smtp.gmail.com with ESMTPSA id u12-20020a0cf1cc000000b006360778f314sm177712qvl.105.2023.07.17.14.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 14:49:57 -0700 (PDT)
Message-ID: <31b09cc8-e34c-00b1-dfff-38c806f2c35e@redhat.com>
Date: Mon, 17 Jul 2023 17:49:56 -0400
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] nfs(5): Document the new "xprtsec=" mount option
To: Chuck Lever <cel@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
References: <168935977873.1850.8214830433103692090.stgit@bazille.1015granger.net>
From: Steve Dickson <steved@redhat.com>
In-Reply-To: <168935977873.1850.8214830433103692090.stgit@bazille.1015granger.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/14/23 2:36 PM, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> More information about RPC-with-TLS and some brief set-up guidance
> are to be provided in a separate man page in Section 7.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Committed... (tag: nfs-utils-2-6-4-rc3)

steved.
> ---
>   utils/mount/nfs.man |   38 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/mount/nfs.man b/utils/mount/nfs.man
> index d9f34df36b42..dfc31a5dad26 100644
> --- a/utils/mount/nfs.man
> +++ b/utils/mount/nfs.man
> @@ -574,7 +574,43 @@ The
>   .B sloppy
>   option is an alternative to specifying
>   .BR mount.nfs " -s " option.
> -
> +.TP 1.5i
> +.BI xprtsec= policy
> +Specifies the use of transport layer security to protect NFS network
> +traffic on behalf of this mount point.
> +.I policy
> +can be one of
> +.BR none ,
> +.BR tls ,
> +or
> +.BR mtls .
> +.IP
> +If
> +.B none
> +is specified,
> +transport layer security is forced off, even if the NFS server supports
> +transport layer security.
> +If
> +.B tls
> +is specified, the client uses RPC-with-TLS to provide in-transit
> +confidentiality.
> +If
> +.B mtls
> +is specified, the client uses RPC-with-TLS to authenticate itself and
> +to provide in-transit confidentiality.
> +If either
> +.B tls
> +or
> +.B mtls
> +is specified and the server does not support RPC-with-TLS or peer
> +authentication fails, the mount attempt fails.
> +.IP
> +If the
> +.B xprtsec=
> +option is not specified,
> +the default behavior depends on the kernel version,
> +but is usually equivalent to
> +.BR "xprtsec=none" .
>   .SS "Options for NFS versions 2 and 3 only"
>   Use these options, along with the options in the above subsection,
>   for NFS versions 2 and 3 only.
> 
> 

