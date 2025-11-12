Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13EC33C53F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958290; cv=none; b=gFYLkYH4uQUij6+zecfAErytppp+2hOhjal7dDT3sTuCIUPEfci8HADdLGHjxM5bPMZeXw+01noDwhAOjgq1bB1FIGqbJHgVtvY7iDlm9/0AKjAmG3zzLagn/49AqKJaCpASd5zifIboJ6cTcFsZhR2ysVdZZA+tR+KSRP6D06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958290; c=relaxed/simple;
	bh=rMOqIBnKrSZ+2Ceh7Yn6v1Naf0N2rV1tk6qX8O9f5wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJGjCCJWGfQubecByRUi5M2p3cu/hjqezKgy7GjOh8wFP4c4EZz/IvcvKs4flan6eRmh0Dx9+cilwrWfpVxkM43oNrmWJqOSADSmfMBROYIQwZ8nAWTMVhsP2xa/ASqXH9TAigNJXAmofhQ2FF+ZkONaiuMpc2S2hLlFHtAKWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7D20D227A88; Wed, 12 Nov 2025 15:38:04 +0100 (CET)
Date: Wed, 12 Nov 2025 15:38:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, alistair23@gmail.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org,
	kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me,
	kch@nvidia.com, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v5 5/6] nvme-tcp: Support KeyUpdate
Message-ID: <20251112143804.GB2831@lst.de>
References: <20251112042720.3695972-1-alistair.francis@wdc.com> <20251112042720.3695972-6-alistair.francis@wdc.com> <20251112065925.GF4873@lst.de> <f7dd4e03-352f-48ba-8a0d-ab9e793ef385@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7dd4e03-352f-48ba-8a0d-ab9e793ef385@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 12, 2025 at 09:31:35AM -0500, Chuck Lever wrote:
> But it is correct style for net/ .

Maybe.  But why would non-net/ code care about their odd preference?
