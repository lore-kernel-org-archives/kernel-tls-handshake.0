Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4450B20DD42
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222733; cv=none; b=r115wziCa/4p4uqnDI2deGHxmqR/B4LMJlED8KEK0OV+Pie0plQ4E1c6jTjLkdmTOHf1kRN9dNmS1NmAYpu6JqgxM8ZnwNzbWL/tO10twc9DJPw1W3tA9ZkjYRinKi6+rdDD1tonceiNCIlxWlhLa+XG9phlj9Cm9e4YanxZJN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222733; c=relaxed/simple;
	bh=5OcusZLYSMLBttsEgZEYLFnxubBmuslZrNM5s4Zitk4=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2OtYINCU9dG5ls8D05KMbVg+2hm+vuOk0cUBXWjtklamcb7nwQWwWCb/5MNT/NizJ4ZuEW7uzHXk4sWnWUzW9IY4UC+dbcj9n1gp1DTOm4GQeiI9OwpJDfT0l78/eXpa/eHyY4zbyTWMOagjtQre6y0q6aV2nT3D72dOMWkbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltxA0KWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltxA0KWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0076C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222732;
	bh=5OcusZLYSMLBttsEgZEYLFnxubBmuslZrNM5s4Zitk4=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=ltxA0KWWIeuw9rMgvu5dgBftWPLhKNb9HrzMT4plsCd1xEefrxnElLeh1zRldNcmH
	 UeAR/c5U7s2AMviGrWo1bvUgWCaIEXlJJgG4dkQhMRgKVplKmOhmzX+O3007wWOMLO
	 4t2t1VS2Jam8eUvlbvTsgpgFl80dBNiNPZJiXip3vJvneVi1ojCtOOcJHpHyWk+PiQ
	 g4yEjc7ulRne6UfXzIxlf8SDdtIaAoUjd8aAXzHJFnGJger2m7rHuWPO+5hJG0YauU
	 jPPss7wDUYbFFIOZ7o1Bthy78nyMtbjdtkEUx6PiDgxpoBB6cUOs9YlAUpEjQuc/7R
	 T1I0mF3WwHu0A==
Subject: [PATCH v2 10/11] tlshd: Update netlink.h
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:52 -0400
Message-ID: 
 <175622273195.6197.13195590196579599495.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

Add the definition for the new "tag" attribute. Copied from the
Linux kernel's include/uapi/linux/handshake.h .

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/src/tlshd/netlink.h b/src/tlshd/netlink.h
index 662e7de46c54..06e4e91c17f2 100644
--- a/src/tlshd/netlink.h
+++ b/src/tlshd/netlink.h
@@ -55,6 +55,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_TAG,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)


