Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB0211C81
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 11 Sep 2023 15:47:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2be4bc1ae53so14704731fa.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 11 Sep 2023 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694447246; x=1695052046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i512xCD7uImAa8PGoiIPi7FRn7aZWzj3CXAdlFTQU4s=;
        b=lQtzH3tvc6oBzK2nf3J/oD2BW/SYNvbYCQyAqbSpttN98hUDAmuJ076Gt27OyQLkaR
         dUKvbeDShdb2BpC0n2/1MrXchfTHYp4DjiOU/FWKhlHbXJ0+1BfiscMSVlLfD7MYywRe
         B2sNvZqU9W1siJmDHp9x4hWKYqQItCADd9u538f4ryg6tTjUF6l71ordBwEpXk7MGgcu
         9nHbGPxbod74/1abtao13+JqdJREs0C5MIReVQHcaPBrIpLPJvP3pIGgxEGOEs35lzqP
         rRf1IFqxqOd0bHOgcx5xMIGoPM/PJgSl6vDNzrzi/STrWAvSf1w4NCsQLupGy3o6u2K7
         CA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447246; x=1695052046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i512xCD7uImAa8PGoiIPi7FRn7aZWzj3CXAdlFTQU4s=;
        b=Cvcp1MzH2gaaaDsVvPPwcOBFKfxu0P7sw+QnLNO8CmHg/5PbAUU5ch7EMU8/lSeJAz
         H0Z5xPgjoyrPjztGSs55VpH7QVYVoKVBF97midiER2211q8JGo0yFYlWfQogt+bJrpjh
         FCF9GuYXsp8sohRi9PRm/oXyZVgMPab7cUHYH49xSI3SZsQfUmBrDzyhxoz1PkpInCnK
         ao1c7+rKcfS6nlztWJ12/K8FG9I8Mf/+SyD+BpM9msv1k0q7xQXTvOj1SNnBkCYv8WRY
         O5aM/j56CMIj22NgLMZ6zQaOSxA5wY+TvTTSplq+SZkORAYjTBBLkL3uMc1oIXHas07o
         KPBQ==
X-Gm-Message-State: AOJu0YxUJhkZK3WSzYKDHaHnLC+CSKr2vzYzfOoZCMJ99RSJVxPSWDNk
	b7oPUVCEa8ooQToC5dsOeX8h2w2EQuoqOwUTbCGb9rWO
X-Google-Smtp-Source: AGHT+IEDdvkNFf2TuPuzZecInGwpHasxqFT+chCa1vW63x6NyAnDzgAUslS1BqEo5GvngDA46wOssz8r1F34upACgNc=
X-Received: by 2002:a2e:3909:0:b0:2bb:7710:1cea with SMTP id
 g9-20020a2e3909000000b002bb77101ceamr5523400lja.0.1694447245715; Mon, 11 Sep
 2023 08:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
 <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com> <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
In-Reply-To: <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Mon, 11 Sep 2023 11:47:14 -0400
Message-ID: <CAN-5tyFxX6j08Y3U59xRAPWvVJWy14QHgtdZTWRmCaPHCkMUDg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 5:29=E2=80=AFPM Chuck Lever III <chuck.lever@oracle.=
com> wrote:
>
>
>
> > On Sep 8, 2023, at 3:45 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Wed, Sep 6, 2023 at 10:05=E2=80=AFAM Chuck Lever <cel@kernel.org> wr=
ote:
> >>
> >> I've been collecting a few patches for 0.10. Here they are for
> >> review. There are two that are controversial:
> >>
> >> - "tlshd: Revert b586f7d97795"
> >
> > Is there somewhere we document the requirement for the certificate (ie
> > that server's IP address MUST be present in the cert)?
>
> So far there's nothing that documents what goes into a
> tlshd cert. That's a to-do.
>
> Also, there's no MUST. The current server certs work just
> fine when mounting by hostname.
>
>
> > I've been struggling trying to produce a certificate with a subject
> > alternative name in it.
>
> It's actually pretty standard stuff. Unfortunately there
> are a few different ways to do it, and every x.509 tool
> chain uses a different syntax. All of this is unwieldy,
> and it took me some time to figure it out.
>
> The two-step approach with openssl:
>
> 1. You create a certificate request:
>
> $ openssl req -new -key private.key -out /tmp/host.csr \
>   -addext "subjectAltName =3D DNS:fully.qualified.domain.name, IP:a.b.c.d=
"
>
> "fully.qualified.domain.name" is the FQDN of your NFS server,
> and "a.b.c.d" is the server's IP address. You can add more
> than one of each to this list.
>
> The more typical way of dealing with that list is to put it
> in a config file, and then put that file on the command line.
>
>
> 2. Then the CA creates the certificate:
>
> $ openssl x509 -req -in /tmp/host.csr \
>   -passin file:mypass.enc \
>   -CA intermediate/certs/ca-chain-bundle.cert.pem \
>   -CAkey intermediate/private/intermediate.cakey.pem \
>   -out /etc/pki/tls/certs/rpc.pem \
>   -CAcreateserial \
>   -copy_extensions copyall \
>   -days 3650 -sha256
>
>
> I have not tried creating a self-signed certificate with
> a SAN, but I have no reason to believe that's impossible.

Thank you Chuck. That was helpful. When I googled "how to generate a
self-signed certificate with subject alternative names" most of the
recommendations were having a template file which I was trying to use
but it wasn't working for me. The use of "-addext" on the command line
was sparse and confused me as it had a dns name in it instead of IP.
Anyway, I given that the code requires the IP I think having something
as minimal as below would be needed

diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 2fb3618..dbc4c5a 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -87,6 +87,8 @@ In each of these subsections, there are two available opt=
ions:
 This option specifies the pathname of a file containing
 a PEM-encoded x.509 certificate that is to be presented during
 a ClientHello request when no other certificate is available.
+To enable mounting to by IP, the server certificate must
+contain the value of the IP as a part of the SubjectAltName.
 .TP
 .B x509.private_key
 This option specifies the pathname of a file containing


> >>  This one removes the reverse DNS query done to make SNI work for
> >>  mounting servers by IP address. This query was noticed during
> >>  security review as a problem. Instead of a reverse query, server
> >>  certificates can list their IP addresses in the subjectAltName
> >>  field.
> >
> > I'm still unclear what the real issue here. Is the object that if we
> > are mounting by IP then to create the SNI, the client needs to do a
> > reverse lookup and that's not secure?
>
> Any dependence on DNS during the certificate verification
> process is considered a security exposure.

Ok. Sure. I can't argue with that. I think I would rather see the
above statement in the commit vs "to make SNI work correctly"
implication. What I was trying to get at was "IF" the reason for
needing to do the reverse lookup was to get the DNS name so that we
can set the SNI extension correctly (with a DNS name vs the IP), then
I was saying that SNI is an option (not a requirement) and when we are
in that situation then don't add/implement/invoke the SNI extension.

> > So why not just not use the SNI in that case.
>
> To use SNI, the client will need the server's hostname.
> How does it get it?
>
> The DNS reverse query is what /enables/ SNI on the client
> when mounting by IP. But it's wrong to do that with a
> DNS-acquired hostname, according to every security person
> I spoke with.
>
>
> > It's an option. SNI is supposed to be help for the
> > server. Now when NFS client mounts by IP it's unlikely it's talking to
> > an NFS server that's servicing multiple domains (for which it needs to
> > be pick a certificate for).
> >
> > If we are mounting by IP don't do SNI but don't require certificate to
> > have the IP in it's subjectAltName.
> >
> > I currently spent over an hour and I still can't figure out how to
> > create a certificate with openssl with a subjectaltname. ok perhaps it
> > speaks to my own abilities but I didn't think I was that bad.
>
> Try a different tool chain, maybe? <shrug>
>
> I find openssl to be a Swiss army knife. Like git, it's
> nearly impossible to use without some kind of porcelain
> and a good chainmail glove.
>
>
> > I still believe requiring IP in the cert is not a good approach.
>
> From what I can tell from my conversations with security
> folks and from looking at x.509-related web articles, this
> is the correct and preferred approach, and the DNS reverse
> query mechanism has to be reverted.

It's more of a worry that administrators would forget to re-issue
the certs when the IP of the server changes.

I understand the security concern/threat. Yet we live with it in Kerberos.

> Do you have a proposal for a replacement? If we document
> (or provide a script for) a recipe for creating server
> certificates with a SAN, what operational difference will
> it make?

diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 2fb3618..687190b 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -87,6 +87,11 @@ In each of these subsections, there are two
available options:
 This option specifies the pathname of a file containing
 a PEM-encoded x.509 certificate that is to be presented during
 a ClientHello request when no other certificate is available.
+To enable mounting to by IP, the server certificate must
+contain the value of the IP as a part of the SubjectAltName.
+An example of creating a self-signed certificate using
+Openssl: openssl req  -nodes -new -x509 -keyout key.pem -out
+cert.pem --addext "subjectAltName =3D DNS:<dnsname>, IP:<ip>".
 .TP
 .B x509.private_key
 This option specifies the pathname of a file containing

>

>
> --
> Chuck Lever
>
>
