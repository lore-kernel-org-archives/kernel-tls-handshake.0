Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37741C32
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 14 Sep 2024 01:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726275945; cv=none; b=QxzlmwgYoxxyEsevnaLj75aHafRBzCuEZQXMUO8JCrvFB6rH91AcgTrGkWQyAIxbQ5OLb8Z0ROZ7yBIs2JcINXryFA+GPpQ+49PKEbPX8GjwLrM8c8ATEpD9J/n4HL2SqDfcKYR3Awjds1o3/wn2Du9HRSSp5lgRLshuHS+1Rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726275945; c=relaxed/simple;
	bh=9gy7LiB1QQHwZI+Pdhi5cz/26o44zIsBi1OE+6liICY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLccan7ezcv1/NJIVUGQkkijt0qTpuZ8tnSlW7NZN4WzBOw5TTlnnA8vOceroufi2lcBfa71QzF94Q+IOR9uu2OnHR02mvM3L3uaLEkReCalTrwWJoYfYcVXfAc5ykA9gD9scid6JG8qVP4NDnijrPq9Jfz+pMwlwdD/B3igJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ9Qv5DV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ9Qv5DV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2068a7c9286so16224735ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 13 Sep 2024 18:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726275943; x=1726880743; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkiDsRe4AiGLxd5SW64hD1FIKOllYw7LyinEu6P1pMI=;
        b=UZ9Qv5DVW/aWeFdgeFJFsgyknht22a5esgEEMqM2YqtznOyljcsxmNlzSjir5FO1yA
         qChzzG9gYegxaMniQnmAbBlv6CTM3v2yr1A8VmlBq13g2SgXPLVjNJ44fCOnZXqDoALD
         BGPjZfF6KHjn7HPo7BMxX/OBTfAb/CApNbZR5mgI0eVmA/8083tRe6oOYdGuzVaDBXPv
         Rwpg90LJCHnFpJ9pxOLu/+yED/KKP0ecZ2XZXr5X272F756C3ZJIHLLiJC7kpN9mN/1L
         3yc1YJeazINwCHDudGGfrMFq9/gYMC25yt2SgFO9pHpAJIcUlbAEOTziqLYHo0x5vfFa
         C9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726275943; x=1726880743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkiDsRe4AiGLxd5SW64hD1FIKOllYw7LyinEu6P1pMI=;
        b=ahK+DutaElfICOq9tQP4AtpVaxOL07u6zXcYziZW4uz5XBD3NbNI5+wQGYRtxBl+0P
         edmLH5fg3JQfOfOsE2zYSCpuW/sI19C6pdys40fvDvQENB1kYpgIvOd90BGzHn2e/U4L
         vwkYRyWPr9+86wSO8ASf185uwIRhINhXbD2eyQhFC+YjGk0IK0T9Hp2rGjI7wzdR7Dzj
         BI3nmDAxL6cLG/qUiB/l+5DdnMhQhp8sJxIe0xskrXdu5Z7LAGNKLZ5sK8oZTbkkQ46C
         KBxHIFLSafoRntLTHP4oiNPT0pf1kMPnAfCCnrHRM+FBgNzqzflaE0Oiwk0cO7S1+Ybz
         BTEA==
X-Forwarded-Encrypted: i=1; AJvYcCX9D8UEX7o38c1iXQ9/a5KnrVO5HCOlnvlFGsv8OWI9wcgvdLYwlFcSYKP4WoMSkC2r8X3AgRgEdGkVLC7CfYQSEetLpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiJPptLE/SAicn0fatSXLmNgJXPFayo31aK7S4TWhdFnYPQCxn
	oT7JJ5xxU+DZcmOJ4TJldrF7ziEFTgGx119wiLXs+Y0TvXBEUCdx
X-Google-Smtp-Source: AGHT+IFumMGTNCHfWNRCOO+XP+esgYojDUGb/+5tHXyYx7D6FCQQ/vya83X52c7WIjgKSX/L0q8ryA==
X-Received: by 2002:a17:902:e84a:b0:1fb:57e7:5bb4 with SMTP id d9443c01a7336-20782a69aa5mr67763765ad.37.1726275943018;
        Fri, 13 Sep 2024 18:05:43 -0700 (PDT)
Received: from localhost ([2601:647:6881:9060:97be:e4c7:7fc1:f125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207947365ddsm1937725ad.283.2024.09.13.18.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 18:05:42 -0700 (PDT)
Date: Fri, 13 Sep 2024 18:05:41 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: network dev <netdev@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: Re: [PATCH net-next 0/5] net: implement the QUIC protocol in linux
 kernel
Message-ID: <ZuThZdPILnCKpOmO@pop-os.localdomain>
References: <cover.1725935420.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1725935420.git.lucien.xin@gmail.com>

On Mon, Sep 09, 2024 at 10:30:15PM -0400, Xin Long wrote:
> 4. Performance testing via iperf
> 
>   The performance testing was conducted using iperf [5] over a 100G
>   physical NIC, evaluating various packet sizes and MTUs:
>   
>   - QUIC vs. kTLS:
>   
>     UNIT        size:1024      size:4096      size:16384     size:65536
>     Gbits/sec   QUIC | kTLS    QUIC | kTLS    QUIC | kTLS    QUIC | kTLS
>     ────────────────────────────────────────────────────────────────────
>     mtu:1500    1.67 | 2.16    3.04 | 5.04    3.49 | 7.84    3.83 | 7.95
>     ────────────────────────────────────────────────────────────────────
>     mtu:9000    2.17 | 2.41    5.47 | 6.19    6.45 | 8.66    7.48 | 8.90
>   
>   - QUIC(disable_1rtt_encryption) vs. TCP:
>   
>     UNIT        size:1024      size:4096      size:16384     size:65536
>     Gbits/sec   QUIC | TCP     QUIC | TCP     QUIC | TCP     QUIC | TCP
>     ────────────────────────────────────────────────────────────────────
>     mtu:1500    2.17 | 2.49    3.59 | 8.36    6.09 | 15.1    6.92 | 16.2
>     ────────────────────────────────────────────────────────────────────
>     mtu:9000    2.47 | 2.54    7.66 | 7.97    14.7 | 20.3    19.1 | 31.3
>   
>   
>   The performance gap between QUIC and kTLS may be attributed to:
> 
>   - The absence of Generic Segmentation Offload (GSO) for QUIC.
>   - An additional data copy on the transmission (TX) path.
>   - Extra encryption required for header protection in QUIC.
>   - A longer header length for the stream data in QUIC.
> 

This is not appealing.

However, I can offer you one more possible advantage of in-kernel QUIC.
You can think about adding iouring support for QUIC socket, because that
could possibly chain the socket fastpath operations together which opens
the door for more optimization.

Just my two cents.

Thanks!
