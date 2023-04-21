Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6F198
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Apr 2023 00:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD2FC433EF;
	Fri, 21 Apr 2023 00:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682037383;
	bh=tYjaWzcLiDxjvx2RsIZxgTM3l+Fu+bf3C6VF6D/N83Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3R2Cne1HUPNq7sIqLNQC08+Sp3EHMuZIHemlErWrKDXIvuehdgkaOvHvsGMpQ9eK
	 QknmRNFEcw6MQtsNTCKdGKZQbYt4JhBPrvoFI6GCAUF6QUmwdQ8kTXD2PTSbvePRLM
	 RtcYONY04/DAhw1+Y1Hu8vwsmfU2k/zbiRVTXCn4NDhEdnc3GA8EcEXRlhVAHqztgz
	 ddE3TTp8UoVTQQ+ir3buj156yFyHgOAzJGpiQhqXDLVgjFaDtZwnzZEBZLdVldbXGX
	 XTjx4wf+Q/2hcLdi3PlvBU267McDJ46/DDo8EM87CMiwhzTI8lP1FvsBK1v/cT/7d6
	 aY6DqRXkfbTvw==
Date: Thu, 20 Apr 2023 20:36:20 -0400
From: Chuck Lever <cel@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net/handshake: Fix section mismatch in handshake_exit
Message-ID: <ZEHahFowL+7Pc3Jm@manet.1015granger.net>
References: <20230420173723.3773434-1-geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420173723.3773434-1-geert@linux-m68k.org>

On Thu, Apr 20, 2023 at 07:37:23PM +0200, Geert Uytterhoeven wrote:
> If CONFIG_NET_NS=n (e.g. m68k/defconfig):
> 
>     WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_exit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
>     ERROR: modpost: Section mismatches detected.
> 
> Fix this by dropping the __net_initdata tag from handshake_genl_net_ops.
> 
> Fixes: 3b3009ea8abb713b ("net/handshake: Create a NETLINK service for handling handshake requests")
> Reported-by: noreply@ellerman.id.au
> Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/14912987
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>

> ---
>  net/handshake/netlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
> index 8ea0ff993f9fba50..35c9c445e0b850d8 100644
> --- a/net/handshake/netlink.c
> +++ b/net/handshake/netlink.c
> @@ -249,7 +249,7 @@ static void __net_exit handshake_net_exit(struct net *net)
>  	}
>  }
>  
> -static struct pernet_operations __net_initdata handshake_genl_net_ops = {
> +static struct pernet_operations handshake_genl_net_ops = {
>  	.init		= handshake_net_init,
>  	.exit		= handshake_net_exit,
>  	.id		= &handshake_net_id,
> -- 
> 2.34.1
> 
