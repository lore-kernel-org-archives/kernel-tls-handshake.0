Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F53915B8
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  4 Mar 2023 02:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08899C433D2;
	Sat,  4 Mar 2023 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677896605;
	bh=s4miJmxjtujT5gBHB5LZd4GOoH0uO/tsMwEEkMOdPyE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W7VxcmS+fYBcEIc++ogiZbeSB7eEdLiwJDR5zCEYxPb9n2nd+pqZLrzLEhfqW8Anc
	 0QDbZUQH6bQUg3yCtFhW53Vz3t61E6hdEJ2b4UHZ7c1F8dK+5hG66M37C7VHHOed9s
	 HaxMyYsZSv2Z8zh4njNfYInVP0JpoGbMTl18AI6U9Ia7Y2m8XIuPd4wmwV4gDUSlRb
	 bLQ19p9GwVlGSJ4XYermTVxM2nvZajX2DzKAxGdET5TmG8AA4DgCwhNPbz1keoVyas
	 UDDhw+kzEcsLAEPDmjEInPcfwJkqMt7IK/9t/IF1rpDWCQ85QYkAfNkILbVvkMu11d
	 HCYZYFb8G2kIA==
Date: Fri, 3 Mar 2023 18:23:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev, john.haxby@oracle.com
Subject: Re: [PATCH v6 2/2] net/tls: Add kernel APIs for requesting a
 TLSv1.3 handshake
Message-ID: <20230303182323.73575671@kernel.org>
In-Reply-To: <167786949822.7199.14892713296931249747.stgit@91.116.238.104.host.secureserver.net>
References: <167786872946.7199.12490725847535629441.stgit@91.116.238.104.host.secureserver.net>
	<167786949822.7199.14892713296931249747.stgit@91.116.238.104.host.secureserver.net>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 03 Mar 2023 13:51:38 -0500 Chuck Lever wrote:
> +	ret = -EMSGSIZE;
> +	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_SOCKFD, fd);
> +	if (ret < 0)
> +		goto out_cancel;
> +	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_MESSAGE_TYPE, treq->th_type);
> +	if (ret < 0)
> +		goto out_cancel;

feel free to do:

	if (nla_put_u32(msg, ...) ||
	    nla_put_u32(msg, ...))
		goto out_cancel;

we assume this helper can only return -EMSGSIZE or 0 in so many places
it's unlikely to ever change..
