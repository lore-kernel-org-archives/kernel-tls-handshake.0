Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614201B142D
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 Dec 2025 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655355; cv=none; b=OonFQIdV9nbG1x38zofF6EP48D213KN7NQzm5zZSukjG5WjdspSrahjFG+JKjPvmK+75dJMyaLTqshEX/je3MPDcD4pr9+5TnV61iD56gcHHNXcgoB8XbDgbNN8b6ysa5GzDcl62ECRcWS3rD3i8OwlYgRbeijNNT3FmKMSOkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655355; c=relaxed/simple;
	bh=OyysEu/J+ScV3qS2ObWgUgg5U1GtYhIvr8slrV+F/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7nAQgynpteuwxHN4sNrFATZ52K6EZ4DMrFOx/QLH50vRczb23YfoYaxbytshSkF0UbQZnAmA6Mr0UkPxREjdiAiXZM6+miYdBwaMu9sL7k14ckF+CXSax8kWduJNWrQq22nur9VzwByOfT7EiZHumKDi29AykjfWEawaud9y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2C4A868AA6; Tue,  2 Dec 2025 07:02:27 +0100 (CET)
Date: Tue, 2 Dec 2025 07:02:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: alistair23@gmail.com
Cc: chuck.lever@oracle.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org,
	kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v6 4/5] nvme-tcp: Support KeyUpdate
Message-ID: <20251202060226.GA16055@lst.de>
References: <20251202013429.1199659-1-alistair.francis@wdc.com> <20251202013429.1199659-5-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202013429.1199659-5-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Dec 02, 2025 at 11:34:28AM +1000, alistair23@gmail.com wrote:
> +		if (unlikely(ret < 0)) {
> +			goto msg_control;
>  		}

This should drop the superfluous braces.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
