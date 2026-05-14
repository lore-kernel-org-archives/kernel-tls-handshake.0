Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24EF3DFC78
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 May 2026 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771342; cv=none; b=QwBWkT4LdFmYygi3F65EEDUzcefYmFp0VIz/ezZUFLwpQCk1I8WzzyWDd1/wiRjl91Ww3n7jzKVB7+/8Gocic+WqFNCE8UwnD2j75hldGdiNRI1jTjv0CCC6YFq2iMEE8IAEYY5QhBb21eVaAMHqSZo8c1br3wH2WbKMAazsNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771342; c=relaxed/simple;
	bh=g/JC5WBmN/pQiTiAqX2Hd3AHi3K9BWzImhYECieHJfc=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GuYFk/w3E6BYx7t/SvpCOnVdZZdp4rK0+MvAtz779IbLd042LmEkUeO83S15c4qbaa0sWStfHhlq8x86Hz5l4Mdn/dPySe+pf0ktslxLGxDbx/Pk3EgN1pZ+BQpOD2Zhk9hdIDrMtJ0tO9TSVZnRQ6szXFEleVCjN06MBofrCCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS0Wh6F4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS0Wh6F4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66991C2BCB8
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 May 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771341;
	bh=g/JC5WBmN/pQiTiAqX2Hd3AHi3K9BWzImhYECieHJfc=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=oS0Wh6F4yb+tx4oblEliTJycJeTtZPGZaPB1VFXtMzbKizikspSExK9+eAoUi508P
	 ZCOmP3pEcQWxn+kEACqh5RHT5KTJwycoV+sp385BFA7d1CTuVp3LKvfY2cRlfc0OrD
	 eOw1cccApUT+nx6EkJyjG0j984oQjDCrGa27iKreGxUbnFB2WxIPJJD79FO47teu39
	 euqxSasDMb/40ErD2X+Ebhykh1kxz+1u+FY7HtCMshXIYkUnar1qJwzu/D1pn8bZdK
	 Bv2ETqofa2671i/Ky3IVxjaRH17+ThUVeMaB/CFBlANBTvV3U0alOhPkeCvYy26hYb
	 laQaD2WQLNVfg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 80695F40068
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 May 2026 11:09:00 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 14 May 2026 11:09:00 -0400
X-ME-Sender: <xms:jOUFauJQOJ_QLOR3XLImuAw1AS3BEBb-3-rMeq3YAjdK39rqHR2fEg>
    <xme:jOUFag9QjMvTpaAdxZyEBiIhBNWEDZtb6Ox2jmxw22jvyEz9C3MT8tzCJXNgWFQoF
    H1mPNlI5NSPDsnS8oXOlNff1Ke-UpqlBb0YEeb8s5n3nqKWKV0Y23o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedfvehhuhgtkhcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghl
    rdhorhhgqeenucggtffrrghtthgvrhhnpeevieekveehudeiledvueevkefgleeffeeiud
    efuddtudekkeeuhfffleduueevudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghhuhgtkh
    hlvghvvghrodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieefgeelleel
    heelqdefvdelkeeggedvfedqtggvlheppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrih
    hlrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehkvghrnhgvlhdqthhlshdqhhgrnhgushhhrghkvgeslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:jOUFasbFMOzMXt3JgPdD8kgR9dvbsxK6URVQR2d-lr4BlM6K_FOsyg>
    <xmx:jOUFanWacdGQG3Cb6tC2TW4XDFo68njfHAyNu_Gp6qpuKaVYaWprXA>
    <xmx:jOUFaj3XJLkT1lFO25MQ3Q9Cu3n9f_Sl1behV0LFY-uqsG2wsST4dQ>
    <xmx:jOUFauZf9wHzN4P19Ru6WP2Bl1ox_lY9B4doN7EWEU-2reP2x0_h6Q>
    <xmx:jOUFamqCgwH-SB86EJtAbsdm6nun2VPOlJyGVRX9je4JYZ2_eA9dtRuA>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 60E71780075; Thu, 14 May 2026 11:09:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AIzCGia1teGo
Date: Thu, 14 May 2026 11:08:39 -0400
From: "Chuck Lever" <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Message-Id: <9f728094-4bd9-46ee-84eb-c0c4dc862504@app.fastmail.com>
In-Reply-To: <232eab54-6aad-4b95-b1b5-97874644619e@app.fastmail.com>
References: <232eab54-6aad-4b95-b1b5-97874644619e@app.fastmail.com>
Subject: Re: Fwd: [oracle/ktls-utils] Enable and prioritize post quantum EC groups (PR
 #147)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Ping? Scott?

On Mon, May 4, 2026, at 3:06 AM, Chuck Lever wrote:
> This proposal needs some review / comment from people who are closer to
> distributions than I am.
>
> ----- Original message -----
> From: Leo <notifications@github.com>
> To: oracle/ktls-utils <ktls-utils@noreply.github.com>
> Cc: Subscribed <subscribed@noreply.github.com>
> Subject: [oracle/ktls-utils] Enable and prioritize post quantum EC 
> groups (PR #147)
> Date: Monday, May 04, 2026 7:20 AM
>
> this patch enables and prioritizes post-quantum elliptic curve groups. 
> (i.e. those which suffixed with `-MLKEM768` or `-MLKEM1024`)
>
> &quot;store-now-decrypt-later&quot; attack conducted by adversaries who 
> have access to quantum computers could be mitigated by enable 
> quantum-safe key exchange algorithms, which strengthened security for 
> RPC-TLS.
> You can view, comment on, or merge this pull request online at:
>
>   https://github.com/oracle/ktls-utils/pull/147
>
> -- Commit Summary --
>
>   * feat: prioritize post quantum EC groups
>
> -- File Changes --
>
>     M src/tlshd/ktls.c (9)
>
> -- Patch Links --
>
> https://github.com/oracle/ktls-utils/pull/147.patchhttps://github.com/oracle/ktls-utils/pull/147.diff
> -- 
> Reply to this email directly or view it on GitHub:
> https://github.com/oracle/ktls-utils/pull/147
> You are receiving this because you are subscribed to this thread.
>
> Message ID: &lt;oracle/ktls-utils/pull/147@github.com&gt;
>
>
> -- 
> Chuck Lever

-- 
Chuck Lever
