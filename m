Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79538CA4
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 13 Jun 2023 18:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B779C433F0;
	Tue, 13 Jun 2023 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686679388;
	bh=A3DoD+w5nBtt/Eqi9Ef0QG0u5vL1Y7DfzNhYoMqpUM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NsZxGGcGMtLq7LjWXeqFjHEW0lsQfw+h/6VTQbXQe6zazanFGpezufYBvdYWjMesk
	 mqoLD3vwfw6Ubex0VuXqfDiM69dASroUZjBObKOrZpFDDs1sD3Xinnn1cjfT0fQ8C1
	 SCCryOPEkNLm/8GRy3wMHj1PLtwzqzq60aKoLBJ+0R/94ECq41zhWjkSab+BLbQI+9
	 URRKlO/Ao7rENs7Y+4afaqAqC9TtI/BYS8a6yCUDiEr/uemoLUrnSr+bF8C/srljyX
	 8T1XXDSV0FtwFW+GtdUUHiw26SvgyJlCNoY8jP/9gnvAlPTzxHDYXOAJEfWgK/wBB5
	 XZA/qDIOV70RQ==
Date: Tue, 13 Jun 2023 11:03:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com,
 kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v1] net/handshake: remove fput() that causes
 use-after-free
Message-ID: <20230613110307.2e46cd6a@kernel.org>
In-Reply-To: <20230613083204.633896-1-linma@zju.edu.cn>
References: <20230613083204.633896-1-linma@zju.edu.cn>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jun 2023 16:32:04 +0800 Lin Ma wrote:
> A reference underflow is found in TLS handshake subsystem that causes a
> direct use-after-free. Part of the crash log is like below:

Thanks for the patch, could you repost CCing netdev@ ?
We need that for the patch to make it to patchwork.
