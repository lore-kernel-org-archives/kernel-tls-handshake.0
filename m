Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0F6D17
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 14 Jun 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749866633; cv=none; b=NizpFo6iSWnrrJNIkRPwTYEOF5yKyaR9gWtvmZSBZgBDZ2qpMxA+IAEBllsqkHsCD/FPLhIm/Ithnu1iXFpwyCqb9v+EmHYRyorJkxhLIaW0CBCwHSbOKUg9c6MqQhlrscVIIZmJw5MJqro+QseetNadpXbv65BBXXjEXtJ/p8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749866633; c=relaxed/simple;
	bh=HbNsFtaYJ0nHSWWe+EH/lnDrH82j5urrGsUrekpRRf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gi+cutVNv1blGJm+rDnDyi9RDBUyobT8ALPirtNvLyPjUS5KtxtLMFHf7PGiYR9Y/7Wd2yBnBPXsh8aAGOo1pQIqUrDdTIIlaycDgZCTsBkNSef6WENgdy2rd7aJHO3dX7GnZcrGLt2eY8iNXdUEoxMuhcpKFbZiWBwIWedecmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsqUqtPf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsqUqtPf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a51481a598so1605540f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 13 Jun 2025 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749866630; x=1750471430; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HbNsFtaYJ0nHSWWe+EH/lnDrH82j5urrGsUrekpRRf8=;
        b=SsqUqtPfWR6d32fq6bmq1fR6nxOfc1wv2AezPJ6AxH2xC855ZhPyWVDmm16v4NyFSc
         qYg/SGoYmqvfWbB/u2d3xLPy0s1yp4SxV1D6nK/xLCfac1L8gMAHZ1cJvo662a5n/V2Q
         8IpS45NaIEyz0tHLS0f8ZLiHGadguLs2u+L/qlKLOTnfCprsRZpVN8D7r80NxbnegufQ
         ukzS6lB6BYKbRSjPl2m8HwY9ubqix6KhPhLQuMcNHFgX9tv67v7dFXuB3mlhZcRUF4hB
         veUCrhH6Isr6FgL7HBDGkN+8peY3rAkLXarMI5FYjv3WWS3Si+nOBB6ygzXpca2Pl8Jp
         UE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749866630; x=1750471430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbNsFtaYJ0nHSWWe+EH/lnDrH82j5urrGsUrekpRRf8=;
        b=wR8MJyGnhGRSPd538IY3CCNiW3as/BzX7AqV483tr6t1DHlgrci5CvdcxxOf5FwfRG
         flIfq/SaSq4HCDY18hDAKPIZ3CdTC3fKYmI3oQdDit4ztM/sLQGGupK4kKaANCU/8b4/
         wVIKSHNxrYKGgwrMHArabhgDH6JDcleiJTPpIrHIKgsL8oWgSQ/9GnTWvawWAXlY5BGv
         H05g12uziGJ8ZRCj6n4R4lo7NflOSFKxrFUjgQiK0N85rdar9rpVDQF+5JNvledkagCR
         hFICA0I9NKH5s139EOxNm+MmupLRxx5JWwmc0bk4DmQElXOvdkxk7PwusgyEe4Bf26jC
         WExg==
X-Gm-Message-State: AOJu0Yw1+kJ1Dbz8cV9+XpAAnLgurkgA8cdHTe2dk+XVCKur/n2SQuyY
	iBXZcq1Ir2ishRX7hC2EZyTkogrsmXMXuGh9ROmdj/N4QYDqaHYaSqmJ
X-Gm-Gg: ASbGncvamjDpdlDBxNswvipq1eP/7N8wcktCPp1kcy1+Vr8sLJ6Xj/hd4EVnmyXHBID
	/ys/W8WrZk3l+ajkJAPU9UluB/7HSf3++iNo8UylAK+sSMAkKv2jBw7P5S0HWqTGaqML4GCm84I
	a83Fbz0hgeykcGP7bOIGugUbLCumQFOuqOCdiX9hhg1mvp1r3lOLLeSABN+cMNRgRdfCjAnRsyk
	J5YSDowVxN4hjgpI4gaTZxpP9QEls1XKVhSDek/GdjkCAa259evZ9fPy15JyZyhrAHY7lJuqqNF
	RCaOPNHSyRCPyqZthyx7zuhWp5jppKhEpWTq5gNi1DtE78lZaCAyANunevo9c6GWHAxQyBYbZ5r
	a5HymIZsQ0stlQtAmty8=
X-Google-Smtp-Source: AGHT+IGsxKZF0DM58Bmb6TrVzLj9wWFOb2b8yf+huvurs5FEkoRhpkjJXJLoX/A53TPsGx/lFPyVww==
X-Received: by 2002:a5d:64c9:0:b0:3a4:f900:21c4 with SMTP id ffacd0b85a97d-3a57237dd6fmr1874788f8f.26.1749866629838;
        Fri, 13 Jun 2025 19:03:49 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm3987030f8f.14.2025.06.13.19.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 19:03:49 -0700 (PDT)
Message-ID: <542ac720-c526-4d08-b7cf-d7169f433462@gmail.com>
Date: Sat, 14 Jun 2025 03:03:48 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
 <07ebad41-0c74-4fc0-9e34-d2dc959a1d7b@gmail.com>
 <6b62e314-02b1-4914-a6e1-ddf7a24ad644@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <6b62e314-02b1-4914-a6e1-ddf7a24ad644@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2025 01:40, Chuck Lever wrote:
> When mounting an NFS server, the server's DNS label comes from the
> client administrator, so we assume trust in that information. The server
> does not have the same benefit with regard to client DNS labels.

In case it helps, I'd like to provide a bit more detail on my use-case, as a
rationale for why I developed these patches, and to show what I would hope to
see covered in a future release of ktls-utils which supports certificate tags
or suchlike.

Suppose I have an NFS server with exports configured like so:

# /etc/exports:
/srv/foo foo.example.org(xprtsec=mtls,rw,sync,no_subtree_check)
/srv/bar bar.example.org(xprtsec=mtls,rw,sync,no_subtree_check)
/srv/baz baz.example.org(xprtsec=mtls,rw,sync,no_subtree_check)

Now I give each of the clients foo, bar and baz their own individual private
key/certificate pair and add all these certificates to the trust store on the
server.

I find that as expected, the exports are effectively secured against access
from random clients which have not been enrolled on the server.

Note that host foo is only meant to be able to access the /srv/foo share. But
suppose that the administrator of foo changes its IP address to match that of
host baz. The admin finds that they can in fact mount any of the shares simply
by adopting the IP address of the other clients. This is something that has, of
course, always been possible with unsecured NFS. But adding mtls actually has
not improved this aspect of security at all.

When I discovered this, I was quite surprised. There's nothing to warn about it
in the man pages relating to NFS and mtls. I expect I'm not the only person who
missed the fact that mtls simply doesn't protect against authorised clients
impersonating each other *even if they have different key/cert pairs and do not
divulge them*.

For my use case, this rendered mtls pretty much useless. I want each client to
be policed individually wrt the shares it gets access to.

Because the hostname(s), or address(es) of the permitted client(s) is/are
explicitly mentioned in /etc/exports, I realised that tying a client to its
certificate effectively allowed me to enforce these share "permissions".

With my patches and verify_peername=true, if host foo attempts to connect to
the baz share by spoofing its IP address, it will be rejected because it does
not have the baz certificate.

Now for this to be watertight, it does require the server admin to ensure one
of the following holds:

- All authorised clients are assigned static IP addresses and these are listed
in /etc/hosts or similar. Or,

- All authorised clients are assigned static IP addresses and these are used
explicitly in /etc/exports instead of DNS names. Or,

- The admin has control of local name resolution for the example.org domain.

What applies to host names above could also be applied to subnets/subdomains
with care, so all sorts of flexibility is possible.

Now I agree the above requirements will be unworkable in may scenarios. But
they happen to be fine for my use case. I've gained the ability to lock NFS
shares down to individual clients, or groups of clients, at the cost of having
to control client naming/addressing. I've found this fairly easy to achieve
using an IPv6 ULA subnet specifically for NFS mounts.


If certificate tagging gets implemented, then I'd hope that this can be used
to tie client certificates to exports in a similar way. But presumably that
would require another change to the NFS export syntax, and a change in the
kernel netlink interface?

Eventually I might hope to be able to do something like this to achieve the
same effect without any reliance on client addressing:

# /etc/exports:
/srv/foo foo.example.org(xprtsec=mtls,tag=FOOTAG,rw,sync,no_subtree_check)
/srv/bar bar.example.org(xprtsec=mtls,tag=BARTAG,rw,sync,no_subtree_check)
/srv/baz baz.example.org(xprtsec=mtls,tag=BAZTAG,rw,sync,no_subtree_check)

Where presumably FOOTAG is mentioned somewhere in foo's client certificate.

In the meantime, it might be helpful if the NFS documentation were to
explicitly mention that mtls does not discriminate between clients for the
purpose of granting access to mounts, and therefore does not protect against
cross-impersonation attacks between "trusted" clients.



