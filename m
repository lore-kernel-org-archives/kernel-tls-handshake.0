Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3C15E5AF;
	Fri,  2 Feb 2024 19:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706901770; cv=none; b=d9bpVKdqzXixyJGu8Mkf/dg7MdTP6dXzXiqTA0ah48Yw3THHdBrDi7E7EnPvh8J9ctJvyyul5laT0yO+w4LRm5uLFgwB6wTTWqAWokOZejbW0hu0hu/j8cejq+cTPTVzE1SqPWpwI6teqEV9GQMIreVA1H32ZvubqQ92raO0b+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706901770; c=relaxed/simple;
	bh=V3kaQg+NArWG0vA3dsZqjgsHs9QDv1kjIrU7FQWv/vM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkA5v2IvTmYeYuRWfiYlnda12xwHhsMH4AzLDLk114Y5nnVj7RTNvvNtodknIjcSc7LkBzixAlv3svFBcpGXnEXschwNiTo4jwUtjDHyT+EbXA4Nb9Dd6SLttmZNWtpFEiuSBteo/AJ8tpEaxwRZAlmaZr9SReBVM/KeEMGzu4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocLy2aZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocLy2aZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C208C433F1;
	Fri,  2 Feb 2024 19:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706901769;
	bh=V3kaQg+NArWG0vA3dsZqjgsHs9QDv1kjIrU7FQWv/vM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ocLy2aZizLLxiVJxS+kDMWHuplT5mq6wVwwMoDmh/IKAks7y/pzwMX0av/n1X/NlO
	 QVNuA4LmdcjRL7rQ6zn+x3hyV4OC1udHZxVSlxhS54v/+x7p2zL3BMUKqp0BO41IZo
	 +ckB/6bQgfDzCo3iivWsouB4kGfJAaRozqulGo4JuHTP/QC5hPF2x2OFl65EZAjCMl
	 anFczYaqr7qnFWtjyrFrzIkffi7zYE4dD2GSpYhN3WNqoMQCsjSsWx75/vruWG6IAS
	 Dum4Hq9JNUQqRqYUrhJXAVDSdyrJT1TdM7/TvLnbayW0XftoVkXunhVPgSJU3WLcXo
	 1m/JlXZEleJIA==
Date: Fri, 2 Feb 2024 11:22:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: Persistent problem with handshake unit tests
Message-ID: <20240202112248.7df97993@kernel.org>
In-Reply-To: <b22d1b62-a6b1-4dd6-9ccb-827442846f3c@roeck-us.net>
References: <b22d1b62-a6b1-4dd6-9ccb-827442846f3c@roeck-us.net>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Feb 2024 09:21:22 -0800 Guenter Roeck wrote:
> when running handshake kunit tests in qemu, I always get the following
> failure.

Sorry for sidetracking - how do you run kunit to get all the tests?
We run:

	./tools/testing/kunit/kunit.py run --alltests

but more and more I feel like the --alltests is a cruel joke.
