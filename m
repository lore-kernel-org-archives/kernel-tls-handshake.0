Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF486328
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 May 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629481; cv=none; b=GwAzA6iHFwj7Nsd8vtBtKjmEmAMYxIqkdaj3frlxCmBMbrRMByvOc7MOrg+mKjJtgwR4fk5AT+/VuoG1Smt7IYwKm6kZFMwwI5YCSLJA++DfVN1y52r84nYeaJLq3twTPCH+fHeWC0jvBHuYWyE6PJ1WtIi2Wi0yCaNzsZdl7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629481; c=relaxed/simple;
	bh=NPA5fWeiy+CdF2Izc2yyx1/a1+9Qt6WzEAMq3XypOaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mic1BRBxL7wYOBt/A5CXy4b/oDRCDVwMRrZfnCzpu/dIuBMHaMbs1TozH4AFUUaXXfmeRDwPm2D9gF9C8EMTdS1qW0MtzxByno4R2qyhXRN5XlRS9YIzkhCOZjhVTxIRigNj82Oio4WU0j1gYmRl4ijejLDj//Ci0hpXiN52YU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so1049620f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 07 May 2025 07:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629477; x=1747234277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=834ecun7GkIpcfgOiJfl+krcWKVVEZ53RPy+KA72j+8=;
        b=GTvc0hG1D02oemO2dkWWCBUW4jawG+WVTVYPPAfDGjbVZ797w0A6YeO5XDoW6XPtAi
         EmfVn1RXIEuJ1OQR9eHDU/ZEzx30NNyC4obnrYA3Dzw7GyV5LqwSp9quQnyvlqvLxumj
         YQN4eYKU7hE0mg3CfT6wlZkTcqGgrytqFha8TYmIA92g7EwzD53EMZA0FCKTKDrC5JPX
         UMjI/FvqMr1gB2NNvTh2QQNGLMK+dho7eskxAVqg3z+dV+V8G01K5NxE5snmuS+8Og+2
         9uGzf7CwAQB/H8GKKeiwDqxiU+l4/mimD1BdiAPKHrRaRQNNCPRiBcMoQqDDraJKRR41
         9Lgg==
X-Forwarded-Encrypted: i=1; AJvYcCXVcZuUZK4/uxK50+rGm/iakOAZAnavhd11cZghL8D4trhj1jhsSrxanLp/62tr71bw3kCWIv6SQ5XJmINLWPx+bSEhew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpROGVAPg/Pi8XKncnmkyo5hoKsmPlQCYVoemXUsRyJm7UJOqG
	oOw+7zo/6RQO/nj5NagHMc41ngsHv98avLLRTCyGlnjNd2lriVUt
X-Gm-Gg: ASbGnct0lA7Nfpa4zLH4pEqg2AVdQl9PGDz65RYqxxDqfiwtCWVng6kRqvxaA2VXInJ
	YwfFw27ZEIxP0nyVyNCNedGF9KQ8K0ZNzcHtiDis+uXjbQLAGzl8/y9ki1YYb5C5L7lBnnr8Yhr
	8xTIaop1fOKxI8cQbhIqBHDipBnOBs/88VJgeocxajHv2EjVmgd5auw2CGxf4omzpVrm5CBNDRa
	VU909LAsAP2v5P9McN8CoKRCWKkpAx7Htce4YoQ+EmMGId0BPEWOaBTkniS0r/+u+7+S9n7dy/S
	6XmqVnDEilk8PFe0fKls6CxC++Du0z7TBjwCfs6/jffSCYpmXmJK/qHsTq5a2bNj5yCj4k8jIL3
	z91BRK8NV0aI7S4Dk
X-Google-Smtp-Source: AGHT+IFoRriMU6u/G78ePtFV+Mux25cjZQlxF2bl1IUWwvPj1gOeuLmcuec2LPLUjNg6YlnXe/SfYg==
X-Received: by 2002:a5d:64e8:0:b0:3a0:809f:1c95 with SMTP id ffacd0b85a97d-3a0b4a6868bmr3113188f8f.53.1746629476779;
        Wed, 07 May 2025 07:51:16 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm17377865f8f.54.2025.05.07.07.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:51:16 -0700 (PDT)
Message-ID: <778e6327-f77a-4f14-a243-197058ed278d@grimberg.me>
Date: Wed, 7 May 2025 17:51:14 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nfs: create a kernel keyring
To: Christoph Hellwig <hch@lst.de>, Chuck Lever <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 keyrings@vger.kernel.org
References: <20250507080944.3947782-1-hch@lst.de>
 <20250507080944.3947782-3-hch@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250507080944.3947782-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/05/2025 11:09, Christoph Hellwig wrote:
> Create a kernel .nfs keyring similar to the nvme .nvme one.  Unlike for
> a userspace-created keyrind, tlshd is a possesor of the keys with this
> and thus the keys don't need user read permissions.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/nfs/inode.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index 119e447758b9..fb1fe1bdfe92 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -2571,6 +2571,8 @@ static struct pernet_operations nfs_net_ops = {
>   	.size = sizeof(struct nfs_net),
>   };
>   
> +static struct key *nfs_keyring;
> +
>   /*
>    * Initialize NFS
>    */
> @@ -2578,6 +2580,17 @@ static int __init init_nfs_fs(void)
>   {
>   	int err;
>   
> +	if (IS_ENABLED(CONFIG_NFS_V4)) {

xprtsec is sunrpc, meaning it is also supported with nfsv3.

> +		nfs_keyring = keyring_alloc(".nfs",
> +				     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
> +				     current_cred(),
> +				     (KEY_POS_ALL & ~KEY_POS_SETATTR) |
> +				     (KEY_USR_ALL & ~KEY_USR_SETATTR),
> +				     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
> +		if (IS_ERR(nfs_keyring))
> +			return PTR_ERR(nfs_keyring);
> +	}
> +
>   	err = nfs_sysfs_init();
>   	if (err < 0)
>   		goto out10;
> @@ -2653,6 +2666,8 @@ static void __exit exit_nfs_fs(void)
>   	nfs_fs_proc_exit();
>   	nfsiod_stop();
>   	nfs_sysfs_exit();
> +	if (IS_ENABLED(CONFIG_NFS_V4))
> +		key_put(nfs_keyring);

Same comment

>   }
>   
>   /* Not quite true; I just maintain it */

