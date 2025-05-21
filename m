Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD721324E
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844012; cv=none; b=BLTYR8d3mvH1qh47E4eZwbU0koNtw4Arsta2bNQmSMKfPNXzFK3NyFpvu+eJix2oKecMxXOZKSH4VaoM5iXO2uI+g57Q4f9vIrXrMYuq1D/QQ7LWbduHyQbwKXY2IRvGa7eTtTsWKWQUhZmjrqPEdMW0xGIN9y0kGGl0RBSkYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844012; c=relaxed/simple;
	bh=D4R9mLwN/mipJXLZAPO8F2ID5kBBjBQBGv+NuuYuAH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPHFYbS3BhtwNXIEdXXEa9OjKxcCy+eaOiZT/rJLk0USY1nW1vT6Fpny8Xwvo58RcOACAJu0+fIFvDz+ZQvW5eOpeLlazPYNWj+NJ4SRoEv8yF6tc7Qy4/b1lEW2VdkMcYlehQ2VYJtOTgwFpu6vlbhgMve5unyslrqDWEgiKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKrRvGdn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKrRvGdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747844008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4R9mLwN/mipJXLZAPO8F2ID5kBBjBQBGv+NuuYuAH8=;
	b=OKrRvGdnhXlIVaJLtSk5+LfZfyN0J728TpQUwussRLzSRxzCROwU3YPDyF6f/NGROEO8Ra
	/6/RiFmOPP7u8QhGA6we7Oeawa4CTuhKslsiSo8QNd1GJG1DLEXqlbkc0gbRz2XwAdGYQU
	I043cw80r5w2ae6a5iIqz1ghNJ8xiLI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-67uQ1FDhNsuBIvO1_SVFsA-1; Wed, 21 May 2025 12:13:27 -0400
X-MC-Unique: 67uQ1FDhNsuBIvO1_SVFsA-1
X-Mimecast-MFC-AGG-ID: 67uQ1FDhNsuBIvO1_SVFsA_1747844006
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47b36edcdb1so5753321cf.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 09:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844006; x=1748448806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4R9mLwN/mipJXLZAPO8F2ID5kBBjBQBGv+NuuYuAH8=;
        b=VTT7F1tOfAQe7GD62WcJz1EdvlECEGihhUKGENxZm/7zC0hRKihIVBt8qxxRnJ/Yai
         8XW0SMF9lNxfPqAI3KyZvIpnxUOic0sudbxRqCbqCQKcTme4xxppQAF6YpjKzL6HVl5s
         bOeJ0KvHvkVN6rnv/qZtJO9xYAUQvCgL3e0GdGO7Osj2aPGy1ZFbYVx0NT46aCCncqF1
         AJap27eUkjtu2K5bynikN44pS1KY6xJfjx1RzXMmyvEo3PUk0aaUatSWGagXEZ7Ot8ct
         O4T4VDZVqsym79yjSdTu9wLpXpFiNHeoLTQdSMkMvUhNQ4CmC1u6M0F/l0pCIRchRseQ
         S+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXlRIF4+3RHt7/VjlCED5Ygll+TJ33UPla5KkoiPnyHfZluTNqQkScOHTPrv25OFUz4MiC4t1AriKKSG2LavnwCPANPLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS8ywzOVHdXQ+8TCLPgrbfd/L4ACPqG2tKiXq428A7LR/eHiV4
	FHzsei/MoCg9BBj/o6i4apoDw2DHNTjAST8yccPzHSa6uRZ2w6UfRPtL+x0wolravPs7pzVd7BM
	fGcs+UbmaUPrP7Od1s1lMyGGHAtmbNOGdOl6RMHzdHUpIuPQmSJ09Sor0Zzb/g3g21h70Jy+ErG
	5sdE/E86gLlBaRpp3mxZUbcGhvH1GxqPZRQ6CSgveaZEa/0gXxPgc=
X-Gm-Gg: ASbGncu8PhTZ7Pa8Jeq6+5bIDBvyU6x1wwnpnu3h6QIK2ZcLFgfBwB65SqCQe1uk8Bs
	G/Glf+SmTIcqC8JzFvm5WmluTrsMyg7W2ALsOlp/OnlkBpx5NgD71/niBD4NiJJhJQ35x3TA=
X-Received: by 2002:a05:622a:5592:b0:494:84a3:77c8 with SMTP id d75a77b69052e-494b09861fcmr385511241cf.50.1747844006304;
        Wed, 21 May 2025 09:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkA61tfncoNkPLhay5w1IBfmErH2Qp4RvqoIjXZSkuEF+YvwJCLU3wpEph60gs63ZmFBMIKkR6tUBTi0+5XMk=
X-Received: by 2002:a05:622a:5592:b0:494:84a3:77c8 with SMTP id
 d75a77b69052e-494b09861fcmr385510741cf.50.1747844005930; Wed, 21 May 2025
 09:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de> <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
 <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com> <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
In-Reply-To: <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
From: Long Xin <lxin@redhat.com>
Date: Wed, 21 May 2025 12:12:50 -0400
X-Gm-Features: AX0GCFvM1IGN2PZvuErODh5aHyiT21hnU6DAKjv6HE-VyUZG_CYlN3-D9BEw2Ic
Message-ID: <CAMApiK9kHsP+ytFwred=jTLOGcgk+283bt+7USCgWp0iOZXJiQ@mail.gmail.com>
Subject: Re: KeyUpdate Support
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, Hannes Reinecke <hare@suse.de>, Alistair <alistair@alistair23.me>, 
	kernel-tls-handshake@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dK7sRKkiTfezVlXnPTpA80Br4FBQuisKT7P0bOy6eTo_1747844006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:13=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 5/21/25 10:50 AM, Benjamin Coddington wrote:
> > On 21 May 2025, at 8:53, Chuck Lever wrote:
> >
> >> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
> >>> On 5/21/25 03:00, Alistair wrote:
> >>>> Currently tlshd uses `fork()` to fork the entire process after the k=
ernel
> >>>> sends a netlink message. tlshd then calls the `tlshd_service_socket(=
)`
> >>>> function from the child process and exits.
> >>>>
> >>>> This provides a high barrier between different handshake requests an=
d
> >>>> ensures everything is freed when a handshake is complete.
> >>>>
> >>>> The problem with the current setup is that it makes it very difficul=
t to
> >>>> share information between `tlshd_service_socket()` and the parent
> >>>> process.
> >>>> For security and system resources that's great, but it has the large=
 down
> >>>> side of not supporting the TLS KeyUpdate.
> >>>>
> >>>> In the future we would like to support the TLS KeyUpdate mechanism, =
which
> >>>> means we need to maintain the `gnutls_session_t session` information
> >>>> for a
> >>>> connection to allow us to issue a KeyUpdate later on.
> >>>>
> >>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
> >>>> we need
> >>>> to store it somewhere. We could pass it to the kernel and have the k=
ernel
> >>>> pass it back. But `gnutls_session_t session` is gnutls internal stat=
e, so
> >>>> it's not fixed size making that tricky to do. Plus it will break if
> >>>> gnutls
> >>>> updates between a handshake and KeyUpdate.
> >>>>
> >>>> The other option is to pass the session data from the child process =
back
> >>>> to the tlshd parent process. The parent can then store the session d=
ata
> >>>> (maybe in a database?) and use it as required.
> >>>>
> >>>> I submitted the first step towards supporting that as a PR [1]. The =
PR
> >>>> changes the current `fork()` multi-process mechanism to a
> >>>> `g_thread_new()`
> >>>> threading mechanism.
> >>>>
> >>>> In the future this will allow us to maintain the gnutls_session_t se=
ssion
> >>>> in the parent process, allowing KeyUpdate support. This could also b=
e
> >>>> supported with `fork()` and IPC as well, but that is clunky-ier.
> >>>>
> >>>> My approach [1] hasn't been accepted, so now I'm trying to see what
> >>>> ideas other people have for supporting KeyUpdate?
> >>>>
> >>>> 1: https://github.com/oracle/ktls-utils/pull/95
> >>>>
> >>> Hehe. I knew it would come up.
> >>> The reason we didn't implement it for now is that there's an overlap
> >>> with session reset. In NVMe any error will be causing a session reset=
,
> >>> which then will trigger a TLS handshake. And, what's more, with secur=
e
> >>> concatenation we even generate a new set of TLS PSKs on every reset.
> >>> All of this is transparent to the upper layers, so they will only see
> >>> a (hopefully short) delay.
> >>> Additionally, with the current in-kernel TLS the connection will be
> >>> reset when the IV values are being changed, which again would trigger
> >>> a reconnect on the NVMe side.
> >>>
> >>> So not that easy.
> >>>
> >>> But if you insist on doing that, why don't you use the keyring to
> >>> store the temporary session key? That is persistent, and required
> >>> to be present for tlshd to work ...
> >>
> >> I was about to suggest something similar. Depending on what APIs are
> >> available in (or might be added to) gnuTLS, preserve the session's
> >> metadata in a key ring, and return the key's serial number to the
> >> kernel as part of the handshake result. When requesting a KeyUpdate,
> >> pass that serial number back to tlshd.
> >>
> >> It would help if someone could review gnuTLS to see what is available
> >> now, and start a discussion with that community if we need a capabilit=
y
> >> or API that doesn't already exist. (Eg: translate a gnutls_session_t
> >> object into a JSON string; translate a JSON string into a
> >> gnutls_session_t object)
> >
> > I believe gnutls_session_{get,set}_data will serialize the session obje=
ct.
> > It would be trivial to store in a key.
>
> Oh, very cool.
>
gnutls_session_{get,set}_data() is for session resumption and used
on client side, it's been used in the quic handshake code in tlshd.

It would be surprising if the session resumed could be used for TLS
keyUpdate, and I'm also looking forward to seeing the test result.

>
> >> The other aspect of this is that tlshd will have to prevent saved
> >> session state from growing without bound. Probably the kernel will hav=
e
> >> to notify tlshd when a session is terminated so that associated saved
> >> session state can be discarded.
>
> It occurs to me that tlshd doesn't need to be involved in this aspect.
> The kernel can delete a key by serial number when it notices that a
> session has been permanently terminated.
>
FYI, for the gnutls_anti_replay_t in early data transmission, which I
try to support in quic handshake, it's another object that needs to be
serialized.

gnutls_anti_replay_t is opaque, gnutls provides setters for all its
members *expect* 'start_time'. Otherwise, I could simply recreate it
for each handshake.

Thanks.

