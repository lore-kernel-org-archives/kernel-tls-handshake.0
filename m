Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021D7EA
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 01:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2815C433D2;
	Sat, 15 Apr 2023 01:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681522274;
	bh=QYG2kH1HEpd094NaB0WJOMtWh18mr0SfGY5BbhdM+rQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JLqICkbyhyQbMz1q3Pn4hxec8N6tXP+/UQKjCc7iyMfKbjUlMxrrIXF8cdajO/eb1
	 bAvOXk4ReZnMc4ykSXkDSs9bfycE40P8U0I2gS1aPUGNmhdyL4haxrSSY7b7EZ6ykW
	 X4PoY5YsC8npiZk7qreepw5HmLjLbNzklHB+A0mDRfQw/AExclqBg6clMhGlGelOPd
	 q/EBWovCIJ9FzD4pDHREbFV4bcPtnjMrLLCQea7CAacO5Q6jzy3RNFgaG5QEM4PAKw
	 mtidfRa4PoFogHTQWzeNcE/wBccgnSATUAEnLqDxUd/UisktIJJyykv0lFNP0sMqCj
	 k7zzSITtXU9OQ==
Date: Fri, 14 Apr 2023 18:31:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v9 3/3] net/handshake: Add Kunit tests for the handshake
 consumer API
Message-ID: <20230414183113.318ee353@kernel.org>
In-Reply-To: <168141324822.157208.14911977368369619191.stgit@manet.1015granger.net>
References: <168141287044.157208.15120359741792569671.stgit@manet.1015granger.net>
	<168141324822.157208.14911977368369619191.stgit@manet.1015granger.net>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Apr 2023 15:14:08 -0400 Chuck Lever wrote:
>  net/Kconfig                    |   15 +
>  net/handshake/.kunitconfig     |   11 +
>  net/handshake/Makefile         |    2 
>  net/handshake/handshake-test.c |  523 ++++++++++++++++++++++++++++++++++++++++
>  net/handshake/netlink.c        |   22 ++
>  net/handshake/request.c        |    5 
>  6 files changed, 578 insertions(+)
>  create mode 100644 net/handshake/.kunitconfig
>  create mode 100644 net/handshake/handshake-test.c

We're getting:

net/handshake/.kunitconfig: warning: ignored by one of the .gitignore files

during allmodconfig build, any idea where that's coming from?
