Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F319CCEC
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Aug 2024 22:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724711097; cv=none; b=EEachsWTPhXPSQjeo1iTWB+xSMSu8w1BnI0prcWvX1alLdNXP68S8ng+vEkZ12IeI4mpay0IfeZHGNNWpeySYZRjRe1QEb1ghl55GKmv94LUWRmvG336q/Luri5MeLZEl39OkNpWk7hYgBn2I5mDsQZmi8ypJcpK7BTrjoNjK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724711097; c=relaxed/simple;
	bh=4UTNtLs7LGNXibjzKWqWHDbXqjgxjioqz3nwsCN9q8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En78ZgKSJ4J2iOhAYA4AeMm5GXst7ZOfnuR5pZ/8/RgEPkGzUIQIo/6IzdjnTJjrwIYc8/mx/vTiQdHMehZKsHQ/wdQr/1di4LMah1QLL83/6Y6ouHOVrf8UQFQFXE0K7at6VB4eX5j+jeHFt/xm3pV0mwA35Q1SpsQNHnBj2gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fFYXV0WU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fFYXV0WU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281c164408so41135915e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Aug 2024 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724711093; x=1725315893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UTNtLs7LGNXibjzKWqWHDbXqjgxjioqz3nwsCN9q8M=;
        b=fFYXV0WUe/AlBmTOcD8n+3r6UGfvbXge/txPPBhMTmhwuE4myDbz7iVdSMHVY/Pe2k
         UJ7yYtv+hDzL50dpIAA3nkxOUdttVRPQJGHJzg/rP9BenJmQuO/1i/iztxWtawA84PzH
         MVYaT3rYUlvnOJX2ghqGUad/8n0bDqz8wJSM3ZQs7+UynsmETS0kHn70DG6hurVvf0PP
         qbROaScDEFVFpxG8+TmgiU3NEPBoyhc8EJT8LIL2R2r95NESWKDYoL1Ior3+GWQIpawC
         fPScFNDFL7AD5MnY5zGTs28TpG2yJUE1jYFSmOl6QGl+oB+VGzjj+44vr7o95sMl6hy9
         4VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724711093; x=1725315893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UTNtLs7LGNXibjzKWqWHDbXqjgxjioqz3nwsCN9q8M=;
        b=AAExsYEYmuyb8zj7KFkBSfvuXGv7zJyCaD2GE4F9BDAtEpV3n5UiJXMHPphNzm/dwa
         4vrQHuuqPlNaI3+I7weUIxnjOMRIFJhB6KP1JjuhVCCTqrVklmNiKcwU8uNB/8KdrOeK
         7e7Pds9kQhe1oQ/S+cyaY9EEeRN0V4d0B/kEsy088wo6ypm8Z6veVMjk19MKJM9DXGbi
         tVk+jmLB0tmGizSEhlGn+OLYsiDzpIazl4Ny+eENDHcyqhc4D1TvOjIAydT2OsbO73ok
         aq7vKLv59uvCoykwsZkM3riZcZlnIqzwMK9rD/jz2EOrRSFtdyJW3tRM5fkYLKxYq6Zc
         O9fw==
X-Forwarded-Encrypted: i=1; AJvYcCXjvtd42wqeSeXFzGlzLvVBtHk4zspDAQa+bKd7MrqzBKx9F6oZzJOW5chQFksBQdGSsf1f/aWFr98XiCdVFmvNvViehg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8WigsmPHb4ePUzyPGukm1zMUIhWZwgsAFq4gB94epLa/IfKlD
	Uq1LH7PkZRib+e/aHZWBbC2AW4OawlBhm3EY1bEaAblC0/JeH8P5Y/00LhUUA++0MiGGJblsDT4
	wMUZ2dBFvCfwfuNfjJ9tmTjtPLwNDwyCnJdYr0w==
X-Google-Smtp-Source: AGHT+IEHgC9SqV+MdNyFfbKX3S68MACIHZxKW7hMxFeh5od79ZNXMcKnEA67rAkBAWkokoplxM5KjkT5BjBp0XjHYgE=
X-Received: by 2002:a5d:6885:0:b0:371:8bc9:1682 with SMTP id
 ffacd0b85a97d-3748c7dcc10mr577790f8f.33.1724711093497; Mon, 26 Aug 2024
 15:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240826182652.2449359-1-a.mehrab@bytedance.com> <ZszNJBRScwD6pXPB@tissot.1015granger.net>
In-Reply-To: <ZszNJBRScwD6pXPB@tissot.1015granger.net>
From: "A K M Fazla Mehrab ." <a.mehrab@bytedance.com>
Date: Mon, 26 Aug 2024 15:24:42 -0700
Message-ID: <CAJKDkqhpxQpMjsSBLb5hdbrN_uZJLAxf17A_JAhcnscTfEsfew@mail.gmail.com>
Subject: Re: [External] Re: [Patch net-next] net/handshake: use sockfd_put() helper
To: Chuck Lever <chuck.lever@oracle.com>
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 26, 2024 at 11:45=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> Hi-
>
> On Mon, Aug 26, 2024 at 06:26:52PM +0000, A K M Fazla Mehrab wrote:
> > Replace fput() with sockfd_put() in handshake_nl_done_doit().
>
> The patch description needs to explain why. Lacking any other
> context, I assume this is a clean-up for consistency with other
> sockfd_lookup() call sites and that no behavior change is expected.

Yeah, this is indeed a clean-up and no behavior change is expected. I
will be careful to add more context in future patches.

Thanks!
