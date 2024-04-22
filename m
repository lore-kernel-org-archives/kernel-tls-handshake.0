Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E89224D5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713801337; cv=none; b=p8HvBMKCgFkqtptrMrla0iG6aLXilwlNmovlhk/LXrtGm2hdwT8XUoFVPmDnhtVWcmbAxNRu5Pgfgs+ctJPcrJHLtFGROZzSXkJnik2EvREhfRsgvVa4+6pNAM5OOcB0TxoFeCIhQkf/+P8+gO2J97U+UhgxsURpOUgz0SjFUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713801337; c=relaxed/simple;
	bh=v4hrMFBLYZu2JRt3T/u7uDAeZfouZqWmfKbTYDCHe58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0nun89GVOYumsa9WiFSNQUFVNZz/UkADf3XLjZEWfq7rWWM9uezviCgYUjTbjSzhKAYLhIdTMBWUyUC0BqfaQ5eP1KM+0ONeWtzTQ7Fd1gY1to4V4HYo8rwp4BllvDyA1fpE9FQS84NF9ghuQTCIQN36revTAw+jJJi9ENKP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=VJt2PO4I; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="VJt2PO4I"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2dac627e62dso4156391fa.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713801333; x=1714406133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4hrMFBLYZu2JRt3T/u7uDAeZfouZqWmfKbTYDCHe58=;
        b=VJt2PO4IH6G64vcUj1GvMFdP2LBIaZQ6rtWJY/6tfMW5pujzdIqRVGejlAJ0cwuTA9
         HSJeQCEdrHc0YDj4lIy6Fu335/DdQl50Hd7Lj85iU/D/NpqC7zibZOA1e7/EcDN8+BTM
         Hq/uIBpyXUCayPZC1KAYiRna869jM80Z34fn1KpL/LAX5fI0Dqxmo6SP0LBIVJ7WZ9EN
         mWe81xaV6OCXkla09Cfze0+2MG8f1WfG3tqqo63Da676hNIUp7cH0HaVaaYcpElwwdEz
         wu/5oM26zPeZVK38rtYb8fYq/L55CBoHIJnbXjYlkd9qvCKSYL1YRx52RAHvcdkdqV86
         ffMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713801333; x=1714406133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4hrMFBLYZu2JRt3T/u7uDAeZfouZqWmfKbTYDCHe58=;
        b=cFupYxh0JRXZ9AOlSfC+C9yGh5NmVwrWm5n5S+JSqCiUzR1WCkUhoE6islZjTEqr3L
         sg6h0J8G2e4zGngbOYlzQ1KYc4NZJ3mN80JT6+Qp1H0fgDNACHMyfKfQjfv4EP9c7BRU
         w0k9ZMPCunLZcQv0M3473vBpa0fqMq0qebniReFlfFs2YHoe35eZoq140SQydj626m4j
         fMcy/SlWab337TkxBbqPG3pyr34j768+vJTwjkwb+TRj6fW3I4PyaHSYCmEHvtP+73Sg
         evn4hChaou5ew8jLZTD+00B+JgIYKplUggWVZWBnRYkB/TcJjrg5cjPeCc3QKs4HAP3h
         rjTA==
X-Gm-Message-State: AOJu0Yz/yvZMIVlEWDPtkCUGCyYo/WOSuYbDXsx6+G4QatQME/Lau2V7
	U42GvVty5oK0AU2rdDmWnNikNpJDfh3+gzJm3Tw2iOHzjRKwajJ03jufBkGthk8yrGs1fbDUfTI
	ryuHFX+k1SM9CrsbTGQmmNoBTQpY=
X-Google-Smtp-Source: AGHT+IF1YitMAJEdHasTqyGNM4Vq2NiNNwT8US8sAATq1AYwRSIzvCoikhEz6Ht+pNkt6kKSDw/uqsM1fY7ghMpD4rw=
X-Received: by 2002:a2e:82cd:0:b0:2dc:d26e:5e7 with SMTP id
 n13-20020a2e82cd000000b002dcd26e05e7mr6002545ljh.0.1713801332824; Mon, 22 Apr
 2024 08:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
In-Reply-To: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Mon, 22 Apr 2024 11:55:21 -0400
Message-ID: <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
Subject: Re: ktls-utils PR needs review
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:16=E2=80=AFAM Chuck Lever III <chuck.lever@oracl=
e.com> wrote:
>
> https://github.com/oracle/ktls-utils/pull/54
>
> I seem to recall a similar command line option that we
> removed because it was insecure.
>
> At the very least this needs a man page update, but I'm
> not convinced this setting should be allowed.

I agree.

Can we have this only available under some strict usage? Like it can
only work started in the foreground (with some -d flag) and it=E2=80=99ll o=
nly
run for 10mins and then it will exit=E2=80=A6 something like that would
prevent somebody from using it on a permanent basis.

>
> --
> Chuck Lever
>
>
>
