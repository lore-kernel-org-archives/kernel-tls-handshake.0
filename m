Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284E3D52A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Jul 2023 15:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597F4C433C7
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Jul 2023 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689692920;
	bh=ezmUdHWUV/xvLUbqpATEYb27qq7utOgKqEKy6DYCPyg=;
	h=Subject:From:To:Date:From;
	b=AcqQX7YWZXyNWtASRmSZ5vsQcKZC6QltnNG3YIxFwz4mJt5kH0MGl6Sz6WddoaYkq
	 tS6V39sXf1a4UVzrBvnIM5Pfl8TiiS5kVQZYS/JqsJM3uyit7NHMHJtqNRPl/l/ELx
	 jfNQht/vsjwcv+MH1yXj0RKxAluNwaSopbU3hG4TeZJNBHZiPRs6Wkxk9CIZnYSNfn
	 fa0qxcWYqsio7iQcw5mAal+7Qoc9vRXOF4xPjFMBz9d9zZPlpLjBuV+OIV2+dohkMs
	 TwJ3HQJnVsMHK2No1EOR5Mq7HVJNnBnPopk2YIwUujYVA+aSkavXkKuWmr5YvZDV9g
	 4zftap3aqAezQ==
Message-ID: <7a91c77f7dc184c9e357af57c7a667014bb72f75.camel@kernel.org>
Subject: ktls-utils package now in Fedora / EPEL
From: Jeff Layton <jlayton@kernel.org>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Date: Tue, 18 Jul 2023 11:08:39 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The ktls-utils package is now shipping as part of Fedora 38 and up:

     https://src.fedoraproject.org/rpms/ktls-utils

It's also being built for EPEL9, but the kernel backport for that is
still a WIP.

Cheers,
--=20
Jeff Layton <jlayton@kernel.org>
