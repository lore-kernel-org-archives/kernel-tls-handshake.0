Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B328F7
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  4 Mar 2023 20:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE628C433EF;
	Sat,  4 Mar 2023 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677960069;
	bh=XHUkjlGl6YMveNo/D5NHcDsDijIjGM/aC5XPwcQueN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wp/c9I9L3/I7Q/kouNmWupSrMjxag1Np3yWjwPD7FPRGDdz4xDPwRj7G2Rn6AGj3k
	 JyT2JSIdQ2Ne/5H0QO1yMgymFQM8ZYe4VnI4uvbyFL1/7HhqFv/EgMMJ0z6pmPLfgF
	 qzOYxu2P/0Y1sKs+c4uGAFP16lDuJI+brjLMnTTILLimWQu8Z9JuxM2kHlzPUhmI/b
	 D3RI8BUsA1pHyZFAfh7dgH2/7SLKV8kg34KFYipXPOLNfDGf6UsqrRzp1E0fRlwWsm
	 N7FBXwgOQ4OmiJUEsfN7OHVWB7mXBdOvh7whzEeJjxl9tgyeAjnQ+LxoQZPMQT2WNA
	 mZ1cPZpmR1ttA==
Date: Sat, 4 Mar 2023 12:01:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Chuck Lever <cel@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, "open list:NETWORKING [GENERAL]"
 <netdev@vger.kernel.org>, "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>, John Haxby <john.haxby@oracle.com>
Subject: Re: [PATCH v6 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
Message-ID: <20230304120108.05dd44c5@kernel.org>
In-Reply-To: <C236CECE-702B-4410-A509-9D33F51392C2@oracle.com>
References: <167786872946.7199.12490725847535629441.stgit@91.116.238.104.host.secureserver.net>
	<167786949141.7199.15896224944077004509.stgit@91.116.238.104.host.secureserver.net>
	<20230303182131.1d1dd4d8@kernel.org>
	<62D38E0F-DA0C-46F7-85D4-80FD61C55FD3@oracle.com>
	<83CDD55A-703B-4A61-837A-C98F1A28BE17@oracle.com>
	<20230304111616.1b11acea@kernel.org>
	<C236CECE-702B-4410-A509-9D33F51392C2@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 Mar 2023 19:48:51 +0000 Chuck Lever III wrote:
> >>> 2. The SPDX tags in the generated source files is "BSD
> >>>  3-clause", but the tag in my spec is "GPL-2.0 with
> >>>  syscall note". Oddly, the generated uapi header still
> >>>  has the latter (correct) tag.  
> > 
> > I was trying to go with least restrictive licenses for the generated
> > code. Would BSD-3-clause everywhere be okay with you?  
> 
> IIUC we cannot generate source code from a GPL-encumbered
> specification and label that code with a less-restrictive
> license. Isn't generated source code a "derived" artifact?
> 
> The spec lives in the kernel tree, therefore it's covered.
> Plus, my employer requires that all of my contributions
> to the Linux kernel are under GPL v2.
> 
> I'd prefer to see all my generated files get a license
> that matches the spec's license.
> 
> You could add an spdx object in the YAML schema, and output
> the value of that object as part of code generation.
> 
> To be safe, I'd also find a suitably informed lawyer who
> can give us an opinion about how this needs to work. I've
> had a similar discussion about the license status of a
> spec derived from source code, so I'm skeptical that we
> can simply replace the license when going to code from
> spec.
> 
> If you need to require BSD-3-clause in this area, I can
> request an exception from my employer for the YAML that
> is contributed as part of the handshake mechanism.

The choice of BSD was to make the specs as easy to use as possible.
Some companies may still be iffy about GPL, and it's all basically
an API, not "real code".

If your lawyers agree we should require BSD an all Netlink specs,
document that and make the uAPI also BSD.

> Sorry to make trouble -- hopefully this discussion is also
> keeping you out of trouble too.

I was hoping choice of BSD would keep me out of trouble :)
My second choice was to make them public domain.. but lawyers should
like BSD-3-clause more because of the warranty statement.
