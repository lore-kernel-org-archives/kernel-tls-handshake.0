Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106CF79FC
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Jul 2023 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689444465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iamKAJgwJgdTwW02X5OuZ3rqyMMNbIZBCLF/DQ4FzlY=;
	b=KdGEIxqHMLUdsn7sA+fJZgu8rtJeUB0IAIocgYeOQ9Z8ay801I6J2X4v0V1f0bICK9YwfC
	MQDlwIKxE00PCNtS1Igkh7iovnVWODGMS0pv75eTFeZWNCYfKVfVR0/WLI9ooSV05wxiiK
	2c7AQxI6cBKmH+7XHcYEmrAaEXa+rfc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-DDPmdRKyMbGWPkeeaqSi-A-1; Sat, 15 Jul 2023 14:07:44 -0400
X-MC-Unique: DDPmdRKyMbGWPkeeaqSi-A-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-639d9eaf37aso7131076d6.0
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Jul 2023 11:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689444464; x=1692036464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iamKAJgwJgdTwW02X5OuZ3rqyMMNbIZBCLF/DQ4FzlY=;
        b=djmKSX2vGG8XLqJQBd1hp0GQ0W1UTxIZdbh5vIHIBvsSYcEDMMbEjyu07rhGBjKb1q
         Y7lPwftW8dUJSnG/ZuPlULkDJf/V215SerBP778HVa2NZWxQ+BcGfnRHBGX7ZIwyG6Xy
         eCakj853+sjjMi5MiqijbKc8uLFJJTv5ZtqpTi5bd8PRyuy6x+pVtQ+2PoPF+emQg4fb
         Jc3jH0oEF0ma/Pb7S4YCp8pWlhAPlXbeLxmQv9n4CRxli5tMoCLJpF4pcdU1Z3fCFnRd
         pPxwFDPI2QKg2BHMGCYn29jVtqB2uCimB9OOYk5U5p74tYC0RVefaJwgjscwD0MXOCXx
         DL4w==
X-Gm-Message-State: ABy/qLaFipIVmy5gqbSBF4GQRMG35PjJi5tSu48VerLbPT0zmDW6Oz8v
	wRqCEepoLTaBPweEWlLlmxJII9zz9MwbM9pfmD4DrDUdsLBQCzrmEMrb2PA3vu7Ak10fi8vzz3l
	QUWRZjdtbtcNPaDJ/dqyM5jb8wgmk2BG0knw=
X-Received: by 2002:ad4:4eea:0:b0:634:cdae:9941 with SMTP id dv10-20020ad44eea000000b00634cdae9941mr1009541qvb.0.1689444463954;
        Sat, 15 Jul 2023 11:07:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHpFiktFMhrHpBHw2rfuvkyjIDtNfi5r6thvCZQjcPC2IoRqJ9U6ucmHnqseKI8om42XgXByQ==
X-Received: by 2002:ad4:4eea:0:b0:634:cdae:9941 with SMTP id dv10-20020ad44eea000000b00634cdae9941mr1009526qvb.0.1689444463631;
        Sat, 15 Jul 2023 11:07:43 -0700 (PDT)
Received: from [172.31.1.12] ([70.109.163.31])
        by smtp.gmail.com with ESMTPSA id e20-20020a0ce3d4000000b006375f9fd170sm5052947qvl.34.2023.07.15.11.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 11:07:43 -0700 (PDT)
Message-ID: <a6e861a1-1609-11fc-219c-88dd8d90b526@redhat.com>
Date: Sat, 15 Jul 2023 14:07:41 -0400
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

Hey!

On 7/14/23 2:36 PM, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> More information about RPC-with-TLS and some brief set-up guidance
> are to be provided in a separate man page in Section 7.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Question: commit b5e4539f already add this RPC-with-TLS
update to the man page. So do you want me to revert b5e4539f
and replace it with this patch?

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

