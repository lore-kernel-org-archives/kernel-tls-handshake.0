Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792518097;
	b=VWVDLFtOBrqqgmcJEy7+IEAMIHiF/KKXEFeNm8xljfKGkR+zkpOL3UGyoQMRMn6t8DEK
	 8S4YWijHAVb8QG0FPz3H/BBZyZFfVCBG36fTh8eHupjT6tYXGuP/zHiYCb/itUa6DdJBg
	 A5I8aM0yQwwn8miu523O0sZ3mdUzNyiVVFfEtzh+JyOldTA3FDvmoI4cq1FTLRo8ydfsS
	 TMGdh5VzUagmuGpnVF56wkMulgAi67y+EDKBXtRxpKYAuZW/3x4PQ5Zhs7tr1FrkIQZQO
	 r/afuS75M0BE8L54VJNlRjEpOMcyn1a1EtcSPOfZ9HnI0p0fHK7VfJA1shzznH43e4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zDx89fBWHjLDPqlJn9Sjh2KY/EXbncE4wtlmv6dssr0=;
	b=FfzjK41BW4cP5djXSROH8k5J0WLZbwI/q0IH7fKuiedm3sxFHMA2dlS/6GtLE2A1JhyU
	 urfKeJ9QmC7Fw1aKB4RgM1743nIp2Dzq9/oUA9bzl7lZ5HUHdOltrnsAMQeO+ma/5SXM8
	 tFmWtHfepFy6nVSZO8j6RBie30AijzKcbJj3+1ucSI4mSbCdkoc2jplEbvtCCraAgBywb
	 M0oPfRhLxhLfPBRQN+1QoQ1Ot3FTtH4FaNxu7YZH68i6ZbvmHAJ7Nm5jYVJ5rCX15hfkl
	 VDzbkHdPFp24ZoZNiaetg5NlfjEpOq8A52qmm36aW0/Y0GXRcvavuiJz3vWR7VqVmwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFVJl9Dx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71160A2612
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 17:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B71160A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFVJl9Dx
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so1186584b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 10:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792518096; cv=none;
        d=google.com; s=arc-20260327;
        b=A4W7Bd3pAIG4rQvebimHaSlja6N/tQ9Ztecu8UXS1JordLSn6jzA786nAcAh7T4UkG
         vR4EY30UWncHNX+RlZVt4xZyCIPDVxAOlsrBG32J+wBBW8P108XxnqoOfETVjdWX4snc
         5G4F86D4xx02ofE7Wf+cJvtr7lisYTjSv7CKn3WIgig10LCtr2eqVoGfpfx3tX8aRYtx
         om/QVdCVqWpybNVgnrmw5Pnuvl9WDoLO/qLttsnOrHEyZWEKkyjG9QYf7TFIXaSGblzB
         SYT+K4AO7km8zx6rHMhuAju/vjsBKKRlGNC2xFbxnmkcknpLSEHC2GP95cpRJ6FfSp60
         vw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDx89fBWHjLDPqlJn9Sjh2KY/EXbncE4wtlmv6dssr0=;
        fh=wb4M/lAI9CnEpZeCMWNn95MzWtq0gYYXQIZnRIkWUe0=;
        b=SQ+TxgP/DNOyGa2ATFgWjMZN6a7ewk81jpKoU2Up+vVp9nnQQrN4tSIAyJTW11TGKp
         nhxgPaEns1+mciRY5XfGK10F9OIzk4D29qZqh6w7fW6v99kedmHjW1xvtzReJZIf6nx8
         QI6w2iOacvq8o4LwkGNlqIZlYoHFl9Nn7caooOhNQCmX9Hc2Sai2Aj2UeJUJePXUGSgY
         jxkpd7bk4uFt6kvM+ESGjr2InVQRFRc8vyVjCV2NXywDbdFSm3FLuv+okDa2AmuPgnNH
         NBIqsK54akUkr/kGtwF5CyIWK5BXYAfpx5l2i/uwJl0C68Yu6LCFkbU4NxSCeGMBx+3L
         SyuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792518096; x=1793122896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDx89fBWHjLDPqlJn9Sjh2KY/EXbncE4wtlmv6dssr0=;
        b=KFVJl9DxDqlBCCR60vtBfAXGwd9sA/SoHMLLwOzj72MhPXxDoAeSVTKlARcnz6Cqcy
         3V1r6HBzBUV5YkquMD2v5nzcupAyhF+qAPc7Ufv8YPwPjsDVXAEDudXobL4Bb6xVomBx
         l+rMvWbEQh0cNGnaSj8QspUFSdNxMRrNyyROEVFbzick9klzBzwLe1cXQAuBl3Ssbpwq
         7Bbekb7DidYMvECqpf80gefty8gbObpnP+waHNQVH4NTzwYC9GGaSd2fQmnVB/4h4tlF
         a+1ReqyKrsmyM+jZ9VZc0xaBwbwuNpAJBgqg5Ct4iMbcJ9h3/UqzOirADptVmCsbe5Z6
         514A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792518096; x=1793122896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDx89fBWHjLDPqlJn9Sjh2KY/EXbncE4wtlmv6dssr0=;
        b=puZGoq39yZNpPMnom0fKShj5s9l6rlw9FTzHEslVVhm0EsMH8MOusuUY3RZCFFXy/R
         IjlU++QvRoJGFoIqHn35kcQIziJN0VQgINzSaP3OF3+m5lNqVFOhOMkMDN2HRC5XW8Gl
         vUFtr9iDNlD2pvbBgb+4r8FM+7SzwF0RynBekWof1s+nwXUJrCrkc34eub3s+m7uip2V
         bLcmiNqNjW7XHTh0coSYOLg8nAKYfN5ASLfuoj+wyXSOISwj5dk5ldv6DhLPPVLl0ZkU
         BPcAevUw6EoO6qt+a+csZauqtBLeU39b6rPe0N9icWHBbuOQRr5ZqxkCgbjM952GCUlo
         QxBg==
X-Forwarded-Encrypted: i=1; AKwUvBzOkudbi5ddMvKr5E+Urhk8XI85DQUx+CZovUlKCwLxL9lC7noIbiNkLVxLX2lxAjNgQfBj3egfg7WKTOgeBy7bR+1Yxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLyETsVhkWEBjITe/QJ/CPDFoeeJWsJvL3eQG6bFEa2q8Gnif6d
	8MI6qdEVaPINqBifuUCtPvS/9p8hcCNvrhCohM/wp2FdqY3VG2ZQ465E+KWlnZ+K8E72w6LpqfF
	PxPawP1ekVe2lMJ+lX1h9ajnS9n8dt9E=
X-Gm-Gg: AYBFou3x2PouPuU1GEhaGDaoqEexahsp0HmHT8rAJpIKyOmJLrv8EKGPhH0vFa+hJ9j
	zkWuNPAscImIqlJGdhBVzSTGe0JFEb5WEfUxvzRvI9q0ezmQT+uAJ7xtkLqzWEQoGBco1hF2PV5
	0b5EH3xg2R7kYgmvbY6EYSD+8JhYzRtxeprzQes7zDYAeUfsdyWEnpPsm6n1gJjb9ndgegxb+Ij
	71D6JdpwZ9nyGzgV62hIhNDkqZpMYmhEacc3Tk7q4cJREDDwi+3f3fitUbEdWiBjSD4v6lLuxpz
	IDHJlNv3/FJF+4oqdqOxTFDtGBr/JWlZFKGffxEXiNKf6CtLuyK2ZEn0s07iCJ2LYgryn83PNmp
	cv1Ra+mZjKlX/QLcApQ35Ln8NidmaDoCn5PRBtqmAkn/Og69DdNz/13C5VdMRVFvYQWlCfCjMU3
	n6v74w0pW3saHj
X-Received: by 2002:a05:6a00:3d13:b0:89f:521:8089 with SMTP id
 d2e1a72fcca58-8a04b8074a8mr9425423b3a.19.1792518095963; Tue, 20 Oct 2026
 10:41:35 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
 <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com> <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
 <CADvbK_cmUWecya3hshFb6WqZWcqRsXY05X4YiQ11eDRm5hw87A@mail.gmail.com> <8cb4b955-3227-471b-895a-46664707c582@app.fastmail.com>
In-Reply-To: <8cb4b955-3227-471b-895a-46664707c582@app.fastmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 13:41:24 -0400
X-Gm-Features: AclHuK-JBYhgwqmvqlH_GGFi4UaTEccniUDIBHxvgJ66HoGmKfPGUQOO6xb4XFg
Message-ID: <CADvbK_chGTotxWGpkN=wS3xLnzxB-TcG2XmDKOkN2iHLwP4vGA@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous
 QUIC client path
To: Chuck Lever <cel@kernel.org>
Cc: Andre Sieber Arens <andre@sieberarens.com>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:14=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Tue, Oct 20, 2026, at 10:03 AM, Xin Long wrote:
> > On Tue, Oct 20, 2026 at 9:40=E2=80=AFAM Andre Sieber Arens
> > <andre@sieberarens.com> wrote:
> >>
> >> Thank you both for looking at this. This is my first contribution to
> >> ktls-utils, and my first patch sent to a mailing list, so please bear
> >> with me while I learn the process.
>
> > The v2 patch in the attachment looks good to me.
>
> Hi Xin, can I add your Reviewed-by to this when I merge it?
>
Yes.
