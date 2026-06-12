Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38336CDE0
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293066; cv=pass; b=I8HXjFyybV2pfphQVViUwoKiWV1wP8db99TxU4hVE/nwuLBSZ9dWon3tOacPdKL+Jln8qD4UQZhqsv85sn+pBAtSNOlsf9Iq8minpGEZvphpISy1WQUQTVzrsf9gSpImLCqK7JhXgL8FfpLeVZUv8wY5qIeoqYpVrEQEcdSCljM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293066; c=relaxed/simple;
	bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edLyCHGhXhztmVYf+tRLilQiq5ZfU9N7gLgDwP3Qs4/BjbPYUCYpog9Pca9PFxokWSr9of+xI1rpIZs8Abvhiyjeu5frx+uFqyq0rK2CBOdyo3H934SjKwg7RdrB9OSWghd2umqposT8mqAnWZxKD8OatSRwANeYFB/QN/OM2fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC4uXtCJ; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC4uXtCJ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423f236418so874445b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 12:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293065; cv=none;
        d=google.com; s=arc-20240605;
        b=FaDYZ3aK3JX9rTalXPSMg2v+rBw0DItwH/XHhApWKMOiA2IX5jwv16ZlCnao0KjT7t
         LxJKb1cyZ9dFyV9dgNH1CZO21mFgZ0yoVvVbfgr4CQfMfKqVLwEm8Vbcd7OeiENjxRYr
         AxfoAfmH8+tOhrtiN+6rhvEHZvxxc69wn+T14dIFTBLuJtQ7zG+/I4NTQ7yjm4CXfYBW
         0toW+Q9yIJJFw+Ho13PTLn82A4LWsKgs4D2MggLLFV01tStqbZxBVLTdcl4lVWlxglTO
         2J4AArdAuCZFS2HDBnZzXQpaUXvrR3gaYxd+EsYzxejMqh4m6j8G2D6LTKi0twVJg8ef
         MOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        fh=tZJ22lRTUtVIVWQt/1SJlXkVi6bFQG91HkCMaHxeqqo=;
        b=K59EZPcO+xLnoTxRqOwBh9Faxz0s2B94ufKGHCESSDCo7x+mzc/FAFIoeATldw729H
         lFtIrFiQsOUakLqLeG5ScypM1nUxup6d+TpvfIZlp19uwMR1idnB/OiAP/gKU6QN9HMs
         bn/i4RiFhZRfkaF6eF1v0kZCZyfyCT5ukPf70VUps+K0AXV8jCK1xnnBwdG/hPBPUFXi
         rm7YwWx3zOvdhv98W+Wy+Umjjxy6BiRYX7/Je/8Ta0U6LwWTGlOj29klfc+INo2C1S4k
         WsYKDHmcNY1QXdb6HAmNbNFAn5+h3k1hh+mQYUfIJ1QCJdBpDTHVFTrGh8yxf2q1tYjK
         3Nsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293065; x=1781897865; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        b=LC4uXtCJ/2D4jQFLjSe54KgoD7+36JDQTMrah3DneYITVLLb27PWYEy8ZThkPoI7Wb
         T1nx0Y/XnF8+BDOa77RlVdiW2dlY6q3SDYAztz/mxVnYNKH+/n4dbXIfkG7AKikpUKT9
         NocmGXnRCOiCCCgKU4UpGqCcwHeizIY3JuOKUleamQLrK94vd8782kYM6E0PYdOYDKHe
         nsvYXX0md8+eZl2NJDqbJkZJoIW64cqGssbZmHSWi/DZS5GLQGISpGnqihhuvO1PEk96
         4GrtWcrtJbMW5YiA6tAcLiHbOAsef9fB4MAD5cojQDfrB6s42uG99YVXsTOqg3kYJSCF
         Seyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293065; x=1781897865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        b=aLqVBXpQHFQ/7ruUXTOJFO1urV1h5cVupA8QVbFGMsKp/o41ikeqMVd/2gbOQPVuYB
         pbkn5FuCEyBf2ghTYURxufEdbLsJtm1I1SXXWo/0H7d1Q/76ExQpctjtMAdlECI2OS0l
         /S2p+3vJ8XBEKFvKI5RDe8U9b81E6henlHSgvz2vLRxg3/7ZZZrCcyYIUFJNigrH4TuJ
         brX5/8XCzBze+0gSUdGeYxSCCNzP1l/VNIsw3Ai8LUUVpLSfcTwJFRtO8mw1anb+9j+a
         mxDmt1r9dgfqWeCqYUWBiFYbyMpYXBl6Oc0qNOjG+L/ncjeijBojqX3hdcVfWC8bgZDx
         O7HA==
X-Forwarded-Encrypted: i=1; AFNElJ8sO/lUnhezqNqoI3+Ln9NBv4U4htwixS4ygNHd++p2pPNetxB2VraTLuf0tfbpDzjDgDwuERLVxrPk0zfnDf1ByofyIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlav/WQrIciSu/JVXTN/KjK0U+UY0WdELxQrxIlJ9s0Raa6y4t
	VOyh/eQ9MQa+qiJkZWk7sIhBXrjmT4zUxmkNRT6RV3KosdpWKkxDUfrHk9FzW5Le8Mam0cqAndM
	LaPI6ljZiy2v/p8p9i1GFtF6P0g5d+P0=
X-Gm-Gg: Acq92OFMUC09fNU/i3AHanI3PIvbWag/GOXUzI9pFR/G6KygDOXSWh3MWVJDp4apPts
	xHcFUrXMtZi6hw1X3pwONh2LE0PiIDQcU54nojO1nBOdJavNmREO7h41uffmU67fCBfkCspHNjj
	qrHgY5ilwnFY9QrbbMaWPmBOYQuKEJ8m4LYhVEZXCWf//gZG4aDgvp53eFn+mT+KFFBLa87nnKa
	DPNAUs/VGu1cHSX72yzsnRRhB7EYgsIgTmJPV0hu20s0wTC3c8iM2Zsx0vdJkZQPrwZTVrTM/+C
	sFMGbN/QxqDNh64+Lisgzq2nGKDxnz+hUq8/ct29hfcrMaAE6S/N/Myq55rLmmniu2CeJ91znuk
	I0ZR6yQ==
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id
 d2e1a72fcca58-8434cb01ac7mr4736200b3a.6.1781293064808; Fri, 12 Jun 2026
 12:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <465489e5fafa9326b4a21c4851e420d344bbfdfe.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <465489e5fafa9326b4a21c4851e420d344bbfdfe.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:37:33 -0400
X-Gm-Features: AVVi8CcBYZ4beNIIRotqS0HdShlGTPsplHhO3h8wRDUTXq00moRwOci60wjQJnA
Message-ID: <CADvbK_c_qBNuad6HkYTZe0MpgMSbMdYSsSAz62DhEYaEapaCTg@mail.gmail.com>
Subject: Re: [PATCH net-next v13 09/15] quic: add congestion control
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"

[sashiko-gemini]

> + case QUIC_CONG_CONGESTION_AVOIDANCE:
> + /* cong->window is never zero; it is initialized by
> + * quic_packet_route() during connect/accept.
> + */
> + cong->window += cong->mss * bytes / cong->window;
Can this arithmetic permanently stall congestion window growth or cause an
overflow? Since all variables are 32-bit integers, the division could
truncate to 0 as the window grows larger than cong->mss * bytes. Also,
if bytes is large due to coalesced ACKs, could the multiplication wrap
around U32_MAX?

This looks a legit one, will confirm and fix it.

Thanks.
