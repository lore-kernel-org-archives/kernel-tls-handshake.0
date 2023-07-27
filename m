Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26586ED5;
	Thu, 27 Jul 2023 04:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F247C433C7;
	Thu, 27 Jul 2023 04:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690432813;
	bh=77+QBt28mCkk9/gozgsYBBnXcI5g2wna3KRf8mGIMBQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gu7RhACuFKXTXS50ueAoNX7tjAsLPIXEeNhZxvy+r/H6WCx985VXJWfijHAEYxVEC
	 3TAZWOFenJVO7mQ8WuiawXgieC6GGl1QTb0dlm+urJYZJ0ZqAQl+LfUUTAMN+BoLHg
	 eYx7dw50fF9b6PeqToAXCuK+0E1tudxRP+ehxBm5cc7I49S5/1yu9m4cREeaivOvhM
	 4QzqQ6W6geaIz2P43OzQxAIYMgcKMmemiR17959uEvXV7nWXN6891+Uu3POtcjE0fs
	 f2ZvzagCb+7riR99/MG2E3x7JKtZqu5C6zQ4XuiAZz16siJMSqrj7PJ7vv2r/CwJlI
	 FcX5DB2bnxcYA==
Date: Wed, 26 Jul 2023 21:40:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH net-next v2 0/7] In-kernel support for the TLS Alert
 protocol
Message-ID: <20230726214012.7fa320c6@kernel.org>
In-Reply-To: <169031700320.15386.6923217931442885226.stgit@oracle-102.nfsv4bat.org>
References: <169031700320.15386.6923217931442885226.stgit@oracle-102.nfsv4bat.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Jul 2023 16:35:24 -0400 Chuck Lever wrote:
> IMO the kernel doesn't need user space (ie, tlshd) to handle the TLS
> Alert protocol. Instead, a set of small helper functions can be used
> to handle sending and receiving TLS Alerts for in-kernel TLS
> consumers.

Couple of nits, if you don't mind, otherwise LGTM!
-- 
pw-bot: cr
