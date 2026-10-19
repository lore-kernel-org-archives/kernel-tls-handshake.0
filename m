Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E664FD790
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Oct 2026 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420305; cv=none; b=uNvc0NdhSLh1jCXUzgITxg/4VHUd97dVDHOIc/q4ZXiwnxJEKUtzlai6Vk84wWsewlG2+Jv4g9YVnz39pdMQHCqEq6gd3GNbSccUQL3lMEC3FrgOqzF/N5z7FP+CXJELva7V+OE5Acb/w2C7gsWfJTI7g0Ta6N3lTqOHaxuNVtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420305; c=relaxed/simple;
	bh=wTmC5fFzM/18X4ibvhsgGAZME9qKhaT/m9nU3iUYfPA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EzcHO0fLS8Lzj6pybeWsvlVENzehhj0XmL9EW2WRJquvk3MXfaq29SBoEbg5ywZZ5wCbp0vhrydgQzxEYEW8J6jXEU/gvulsuHns3zdOLnlXd4WmFv3VcUzfsH0nGN9yZFYKefPCPNrkvN8V7MVK5JYhZlYiYglZkKGKefQqB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgEVrb51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgEVrb51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158711F000C6
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Oct 2026 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420304;
	bh=eSJrYnJd5+lGHiaIVNcBlhy6wzyVLckNxQzXmacuE54=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=TgEVrb51ZzdavNQfcc24Pl0QqFvI7mtS5nLbt3wElx678bT1/vEBr2WhgX6fZ/Jne
	 ZrIUTC048u8UMbCBHBTA0efJnDDH55prT7sad2t3R2VSVyyAtj7XlGf/kwB0NX6K4x
	 q5d5dGRev0JtstsUaIxo0jyptr+vMdoIshP69oY5bh6Lv32Y+rrEOrOCYPg4aq8SHZ
	 t+wWgdQ4w1FxEWsoUAUeT6P7+A92kgkRrDKo0N45h0sLbTk8K5L0AFzuIgWNZaLGlX
	 4SkFDzomssFwhmOgZ5ToLqEakuiNV3Up0um97HXzKT7E7tJiccBrM9I6u/mg6xBeeO
	 jZXy14tOcnAjQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1EEC2F4006C;
	Mon, 19 Oct 2026 10:31:43 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 10:31:43 -0400
X-ME-Sender: <xms:zynWamiTEzq3y-7mSChDlI5wAU-ttZ9-J-tulWf-ZuvKQp_rf4vUrA>
    <xme:zynWah0HNEAmsCOlACU9qkySgnNSA3XPducIbJRc1y-tUkoDhDeE1kj21LGeESkKk
    Sxvv7llvPDA52aH4baPSkjDLrqW113ml59sgKLHKcZlTQidCmRn4n2s>
X-ME-Proxy-Cause: dmFkZTFR0pt3qiHGhVRUvCDLXW9vAEzp1BO+EaE6GxiM9KFSUNqzekzZXBBjYAhW+p0RSx
    3hCrOSGDhWM6fWCgGye5ZcFDQsAMRvkI0IKSX7WZeGxvMR/azISVZfae3GTGHeYbbwWYBz
    zFxUdti2+jd4C5WtBHZUR5/uJ8XTS+SOItTwtUeFC/Jx8it+LJD/aO8IvqdGmlk2lcoXDF
    0eR5cTR6CJd3KRqpuLu3d8VN4q5hASe4CvBBwcJEwEVQBxvQGJIIronkNaOR9ihIGCjrMV
    06/bBC2NOqnSsmIwooJcW4wcja24fK5uBXWpUelQh7x0FQ0UOR1GF7AwhiM0xgxsmu6xXa
    GAPupL8g10R37hlcAJfBXLAXIpZZzE910Wy/znMsn1oOIfAhAUlm9ZITVqfrZb3DIDkphv
    v/CCyaI/0Kw+pIzcKQvyuEdvllNH5597z8dfR2YIo/3O90RNZsPJuhkX2LHYr/h5eJp/Ot
    JAoUjWsaHcDbO0+qEdZIybdXSowh7YHGI+bjdWKnPi7FiY0aMcPTsRbQyThdyUGhInLYzu
    Yg9bvx23k9Y8JKSje38np10d/5FjA9E8AsjItFNGkgMneHOLGg9jkaSr1oDZM7tHOAjQiy
    BYntzbF493IZFoRG3xb1KW8pHIZSyzIyEbLFBdg3K922CxGsScaxor39Q8xQ
X-ME-Proxy: <xmx:zynWan__nYuiwDAnhRKQVGe0RerXckjnm2qzO5j_4Gevq9D7oN8psw>
    <xmx:zynWardmsPmYzVYvYIXtEcEwfAj_J0IG8jTI6lZD4tv9YGf8izEVbg>
    <xmx:zynWaoGheZmdWFz7f7COgMV3hoUYcV2SsE_dkXu9shxz8VaHXjz_wQ>
    <xmx:zynWahcrYWv1swz7LwGuLDOwU-FAId-NPnw7Py1nTJf1KINKb7p_9w>
    <xmx:zynWaqEMHR76htlnp0u4BA-wfKAptcwFTuP4vYcdCK34uhuaBzYSyKNl>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0052978273E; Mon, 19 Oct 2026 10:31:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AikR2skN0iZ7
Date: Mon, 19 Oct 2026 10:31:22 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Xin Long" <lucien.xin@gmail.com>,
 "Andre Sieber Arens" <andre@sieberarens.com>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <27bb3dab-6489-44f5-9eef-4f5b0d15844e@app.fastmail.com>
In-Reply-To: 
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
References: 
 <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous QUIC client
 path
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Oct 12, 2026, at 12:40 PM, Xin Long wrote:
> Hi Chuck, this repo seems inactive. Is there a new repo for ktls-utils?
>
>   https://github.com/oracle/ktls-utils

https://lore.kernel.org/kernel-tls-handshake/4b423b72-14ad-4f5e-ae5f-7e7ef6df7c0c@app.fastmail.com/

announced that the repo has moved.

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
