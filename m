Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516492;
	b=wdQGu/HlFp0LnagupMT2tq1N/8EFIlZza2JSkESBhGBv5nyBmUE+Z2rvU2JdIGPLQCJ3
	 uzZdVR7rc5ubpOM40yj7BsSiwb0B9F9i0Hpx1jzr8hXMu+UPkKrDhQX3qJyI4bILTu/QH
	 MS84nX6PtYebMNpmXfJkfilk9B4DZZZu5aDPlpG4s7z5RiJOvsyiT8+VuE+EBKNNQNohD
	 BlgIgwQ7VPGcnWmbd4wVwZo6hkCIJRYCs37KTS88G/GXcPwKhRt1lAB3tEjMJktJ/43Bi
	 WZTF/GqwNnBwmAnvVI6Ik9LCTOTrsQk2sJes9cWqGafsMdKzbPYAhOHBc7m5ev5sfqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516492;
	h=Received:Received:Received:X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:
	 Feedback-ID:Received:X-Mailer:MIME-Version:X-ThreadId:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=texl07TNv/dsJGqOdMaDmjy1Wb9v7mXR7/MUMT0zPo0=;
	b=Ro4si3S5877k7lo5y3KHG/W7bCkCgX2VcdAY8fvsgST1ubBH9cf0tUabauckwgFlXezi
	 200XMsFW0u5G0e96pvZ+kuDaBCQAMl7J84eX8+L08ZmMvwANAyjHhESw2mlTIiSi0W534
	 pF1sCn4RN7oB/XzDMBM3RChhwTjSNoH6WehBJ62+IPwdGGBk/uox7w6lczchT2KbMlLyG
	 zMfHUBlbLcbZ5QyvwAxofYYSjmjMr4oKR2SDTwRHYjTU/TKFWVAFvra5k4XOXc45GNSxL
	 2Rev/JxnOmUk3L/Y5YJMiPmgEFT1/h4Q6n3Hhu8rJ0DsdjaoaDndVkkDuMinWnRVkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD476606A319
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 17:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343A11F000C9;
	Tue, 20 Oct 2026 17:14:51 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 85099F40068;
	Tue, 20 Oct 2026 13:14:20 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 20 Oct 2026 13:14:20 -0400
X-ME-Sender: <xms:bKHXapV6BEQQrmYNNFSbLbKUMguCnNSQ3ccWRaSV4tLBUlOLH7UICA>
    <xme:bKHXakbj9A5h3R0hWXfUwFvMPaDGwRSKfANi74RR5M7sEYibCNKxS2IB4oyKFf1Oz
    _MieD2hs1PjtlkUru5cpFISYMb3MH5iEADxDJcXltEJRPQql1exxLad>
X-ME-Proxy-Cause: dmFkZTGWgsmwe19x+x4hlufCIDGJsDf6SMvG/mTyhh7p4duadVhA0GYTDp8vLis4jS/sMQ
    fJMnV/NP5XMtn/kmOPzZczc9crISU4xa09ZQ8QdAdwKb1sBkkox5Z/+1va00nWe16MHmmy
    OYAPOTGaTmHBNwrfesJ3Vc6b0Kp/Io6cYR8SPved79Zf+hULX8zVIycGvmuGp4PYspr28r
    Ef2tx7Vm8CQg5LK5h3+BW1UneAAcJ6kXwHdsu1OIlI9ppN0zN5AohF9vL5KMad5Fo+fw9I
    AKIR5K/BFKpoKHNTigVDa91YSokAviCZtyIhGKMrcFZpqmSJ9TFafSstDT1MaTadkz4aJe
    7OIwVcWVo4lSw/3MW2L/deKwmslS9zAYCvF8Jfr3VyEkcZ7pOLq4wyllxTHLTnBxOcn+w6
    NGLXZ20C6G8IonayjX1edlBLepBPMCxWTG0J4ZHEmAauOesvTyRILKf4ZJaNcsF4mRmZqR
    f4KX7iwmcr55dLkehOWBem2Q1ufZtqFt6otkIRrAmwOLC1d5Cn7QZTxOFRDwbxEhEY94Cz
    nW61QNHYZqvMIQQCX5I4uGE1nTgLvY9qhTYog++CRfNXwLPbfv556julkVFREVcNffDOtY
    cYgRc0c8PRpNIhfpz5U5hSUvjGS94A+9oeGPhn2GIWOUP+87+rrh9WG+DzJw
X-ME-Proxy: <xmx:bKHXaoQwT1cjnACH5ZvkRBKeuZNHp0oI11gvbEk5UEqhbPnq1MHG4A>
    <xmx:bKHXatjDyGwEUDNHfo70sMHIljrBap89m25mE-K4TsDb3yOm68Z6lg>
    <xmx:bKHXao7u8PbyGzWElEUxze4UlOlgj6nd1LCg18P_OkdPlXquKdjAwg>
    <xmx:bKHXaqCnYrR9D2qRwPfQdihZ6Bh8X3xfB8Jq8QgY0DSPvYRMaZ0EKQ>
    <xmx:bKHXavYo7iXV2MzGOXQj3Qgko7LeBcJ6k9FOUURLCXE3gWBE8XBSu8eX>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6869978273B; Tue, 20 Oct 2026 13:14:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AikR2skN0iZ7
Date: Tue, 20 Oct 2026 13:14:00 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Xin Long" <lucien.xin@gmail.com>,
 "Andre Sieber Arens" <andre@sieberarens.com>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <8cb4b955-3227-471b-895a-46664707c582@app.fastmail.com>
In-Reply-To: 
 <CADvbK_cmUWecya3hshFb6WqZWcqRsXY05X4YiQ11eDRm5hw87A@mail.gmail.com>
References: 
 <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
 <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com>
 <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
 <CADvbK_cmUWecya3hshFb6WqZWcqRsXY05X4YiQ11eDRm5hw87A@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous QUIC client
 path
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Oct 20, 2026, at 10:03 AM, Xin Long wrote:
> On Tue, Oct 20, 2026 at 9:40=E2=80=AFAM Andre Sieber Arens
> <andre@sieberarens.com> wrote:
>>
>> Thank you both for looking at this. This is my first contribution to
>> ktls-utils, and my first patch sent to a mailing list, so please bear
>> with me while I learn the process.

> The v2 patch in the attachment looks good to me.

Hi Xin, can I add your Reviewed-by to this when I merge it?


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
