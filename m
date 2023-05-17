Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CC8830
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 07:54:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 76E4968C4E; Wed, 17 May 2023 09:54:44 +0200 (CEST)
Date: Wed, 17 May 2023 09:54:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Boris Pismenny <boris.pismenny@gmail.com>
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Message-ID: <20230517075444.GA30685@lst.de>
References: <20230419065714.52076-1-hare@suse.de> <20230419065714.52076-7-hare@suse.de> <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me> <20230509174724.4a198306@kernel.org> <0097e7c0-351a-b922-dd77-ab414b53170b@grimberg.me> <c711fc3b-08c4-6673-0f22-f73bf377a072@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c711fc3b-08c4-6673-0f22-f73bf377a072@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 17, 2023 at 09:53:10AM +0200, Hannes Reinecke wrote:
> Problem is the MSG_SPLIC patchset from David Howells; that essentially does 
> away with ->sendpage().
> So I'm not sure how to go from here; wait for the patchset to land, and 
> rebase my patches on top of that, or proactively switch away from 
> ->sendpage() and resubmit directly.

I'd wait for it.  It should make life a lot simpler.
