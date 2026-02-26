Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19117736
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 26 Feb 2026 00:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064309; cv=none; b=AtIWbKCwodNkAlBJ92fD5Q3rbLT1A1TFLc0o1Xdq7zUJWcaibXI0tVF/95uofadQm+tgELuCGs84sZVW1uG/0q0aXvH2osRlu1TbNxnZ47olubHe8iDLY+uYKGJuNTaM2e+cJWb2xDVqltLMtg4hIQZ3ExVaIFVFUKrhWJP59fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064309; c=relaxed/simple;
	bh=YZehy9s56FWNSb3Pf5eTDIK64u7tA+L61r81m1GERPw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P9ucjPR9GGfaQ0bZWYul7+9fkevCDwkq+Gr3n+KHj4PDHsXCaPGCnx07/Yb1tsh53LWJcZh4Ka9USVwv8ghvI2bgk4V99OmN6HqilHLu8yry7+WdKUoHpztb4ZkVT5zwN/poSIzyvWdT9V0RlmyM6bluL6memy5OH24yj9UR29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HRsgHMBv; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HRsgHMBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772064300; x=1772323500;
	bh=YZehy9s56FWNSb3Pf5eTDIK64u7tA+L61r81m1GERPw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HRsgHMBvEZYgBplu3iyoFwJ7Q3yLZBnJVZEKozwsnCH9+ZJ/j+ydQ7QHvCPset6Hn
	 EgQiuQ65rE90ShUEJ6IPLJFtBJzjcaDxDOXWfUXoY0Ikr1p/SgTZNRgVHN8VegX4Ic
	 /DMQeGPHB90wUhar7R2n/jFGCGOinULoZRYky2ztM2DtMwzJIAS/pOoiKaRytfxjoT
	 9bvp9/H4j2+9yTEE8a30FGtORY1rcz1p7JNv5iE84wjDDJNrUAHZgYmI1J/7ZZAPD+
	 uO+0bJbZYGSe9i1rCgmdN/PqEycjBRk15xRgQoo1xS7fLLbPD/KuOlazA29tlj2PQ+
	 pwcbNccW9EU9Q==
Date: Thu, 26 Feb 2026 00:04:54 +0000
To: john.fastabend@gmail.com
From: Leon Kral <leon.j.kral@protonmail.com>
Cc: kuba@kernel.org, sd@queasysnail.net, chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Leon Kral <leon.j.kral@protonmail.com>
Subject: [PATCH] Documentation/networking/tls-handshake.rst: Fix of minor grammar mistake
Message-ID: <20260226000915.27898-1-leon.j.kral@protonmail.com>
Feedback-ID: 184191534:user:proton
X-Pm-Message-ID: 322c60e1bbec04ea3cae28319ea7f3466915e1bf
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The word "a" was used instead of "an" which is grammatically incorrect.
Fix by changing from "a" to "an". This improves readability of the
documentation.

Signed-off-by: Leon Kral <leon.j.kral@protonmail.com>
---
 Documentation/networking/tls-handshake.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/net=
working/tls-handshake.rst
index 6f5ea1646a47..4f7bc1087df9 100644
--- a/Documentation/networking/tls-handshake.rst
+++ b/Documentation/networking/tls-handshake.rst
@@ -7,7 +7,7 @@ In-Kernel TLS Handshake
 Overview
 =3D=3D=3D=3D=3D=3D=3D=3D
=20
-Transport Layer Security (TLS) is a Upper Layer Protocol (ULP) that runs
+Transport Layer Security (TLS) is an Upper Layer Protocol (ULP) that runs
 over TCP. TLS provides end-to-end data integrity and confidentiality in
 addition to peer authentication.
=20
--=20
2.53.0


