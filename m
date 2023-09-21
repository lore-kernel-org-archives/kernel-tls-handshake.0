Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF09CA57;
	Thu, 21 Sep 2023 21:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB590C433C8;
	Thu, 21 Sep 2023 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695333398;
	bh=Wpp57ufkeo2BOxTu1oY8alqL7fdUWfQ9ZHnmfMHpyZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJ7V63Uukk2lynSRs7RVx2hEPaK3aT3LotGjxBDz5a3ladQw2dW06GVEftzGvc8pc
	 InPHL1q55VU5bT1UdQfaCfvl4zwPh7J3OxZhnlzC5mMcs0AVnEEkdtaWjZzvYBGPIp
	 OkeruOrpt6aYW+HZ4IefcE3dL5N4fjESMsh0XUJ/pRCQ6t7HYRscvIsHCdl1N8xAgG
	 HDhc1ZqU6k+ppLdBRAkwebSPiyaKgOBwzeGoKzUVGPwmoNcm/XCZkAoxIGs972FG3K
	 lllvtoAAJZdnBiqjFlnChSX7sInaJg0zh372S0sZoqW2HMFQNfelr6cDjakhNtpeTK
	 CFVyaOSGWDmoQ==
Date: Thu, 21 Sep 2023 22:56:27 +0100
From: Simon Horman <horms@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH v2 0/2] Fix implicit sign conversions in handshake upcall
Message-ID: <20230921215627.GT224399@kernel.org>
References: <169530154802.8905.2645661840284268222.stgit@oracle-102.nfsv4bat.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169530154802.8905.2645661840284268222.stgit@oracle-102.nfsv4bat.org>

On Thu, Sep 21, 2023 at 09:07:14AM -0400, Chuck Lever wrote:
> An internal static analysis tool noticed some implicit sign
> conversions for some of the arguments in the handshake upcall
> protocol.
> 
> ---

...

For series,

Reviewed-by: Simon Horman <horms@kernel.org>

