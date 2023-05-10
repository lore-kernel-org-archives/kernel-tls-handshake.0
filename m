Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34182362
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 10 May 2023 00:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709D8C433D2;
	Wed, 10 May 2023 00:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683679645;
	bh=Sm4bqVFvF/nkgPPA/vc9xjZVyLcIYSr+EKYT7klqGb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VfjKj5P0VuM8wOJ2Sr1i9e5cpetfpvQO4umyJ68hKw0EZO7JCV3pTbL5pKoAl7u4i
	 JE+1wgQiOGkFnY/ZpHxvLYG2l6mS2UB5kIWGy8uBjrUyOEcx7aDa8Y8vFt0ag2kws/
	 KetAqRh9XmlKazdyX8fMjvvNNeptotGVDVuNUaA4K6DIubMsY5VAd/I1DtmxaAUbDt
	 OmQQUaL8Yq+ImqUbxtjWOkeSjeX6dmGTjP2Mx7GHKtXNnpChIaEL8D5ZiglaN4cKZ3
	 ximqTKorAdM5tbolCAhFX4pQlXFfJg36iJhEczzOFAURnu/zgBswxslLOE522v6Gx2
	 /HJuGRFSyJ/1Q==
Date: Tue, 9 May 2023 17:47:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, Chuck Lever
 <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev, Boris
 Pismenny <boris.pismenny@gmail.com>
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Message-ID: <20230509174724.4a198306@kernel.org>
In-Reply-To: <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
References: <20230419065714.52076-1-hare@suse.de>
	<20230419065714.52076-7-hare@suse.de>
	<da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 May 2023 16:30:03 -0700 Sagi Grimberg wrote:
> Can we get an ack (or review) from you on this?
> 
> The only consumer of this is nvme, and seems to at least
> work on the limited testing this series has seen.
> 
> We can take this piece from the nvme tree or not, whatever
> you prefer.

Let's get all the TLS patches posted to netdev, reviewed there,
then we can put them on a branch on top of -rc1 and they can
be pulled into both netdev and nvme tree.
