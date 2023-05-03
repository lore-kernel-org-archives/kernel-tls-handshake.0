Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DCCEA3
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 May 2023 07:15:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f315712406so11495145e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 03 May 2023 00:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683098105; x=1685690105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75JML44v4O/pXfgViiZ+9iWnNXg6te30UQeFUT4C6B8=;
        b=acH/yBcErUvYa9UD/L8gdJ+bwh22/09Lypt4NKzgVDIsTTPbhI3RYvb3kRKTgycisD
         MPT7lDopVdGwHs+Kem2FzD8V3pw0gamkIVsXd6y01NgXC4Ak/GnEketUlUsHLMeS8TGv
         hi14wehw/tHekpouvoqs81eZA+U/K1W+qM+lunU19d4jWpFggEBwqEBvrTsVhy2uBupe
         0yVHi7f+OqtaikzBE0NOSlBgm3+2iySwmXFXGC6xQH/OI+Tc6lnqg6ZfF0AFM58D/oi+
         eGTGUkpyQo/Pz/tCzPnr95vq7JUEcdRowaC8lcrufS4vN2SNtZexZE2msy+mZrmDZvDZ
         4xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683098105; x=1685690105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75JML44v4O/pXfgViiZ+9iWnNXg6te30UQeFUT4C6B8=;
        b=e0OvfeO+KI9AxzlAPR8/9CycekRvycDiNJdy7mbixsVUZninA55HCk9phAaJBo1Q9w
         vsYtcTFPmgWqSiY/6mEzvz3QcWoVAxN56ru73V8znNvABvrYjUnMRqQJsDqo1MTi0PPQ
         Qib450mI9o68nhTEfAvUxR7xT+GorMZ88NUiFjL+KgtVFZC3n6AjvTm5axc6TFl9fZhI
         /Lt5AHd6WoFRBAryVZSWG0cLFMWOMk7HJSK4ljyFKtj7TxI6tnEvGx1pEnEikqKv2WWk
         k3eIGATEwPcKMqwtdMpHTRobtTGh6KXChVnsUj7LXm8xkaqFFpZLRaSqz4O72nDYx+B0
         JtlA==
X-Gm-Message-State: AC+VfDxKRASJVCgJpargHOC9lQVPiEo/PlYpwE6Eecmix0BCOA2jY6rB
	9Rx7DRQu6KhJun+j8uZWNjikxg==
X-Google-Smtp-Source: ACHHUZ66qNNCKuY1NRo0argZkZ4pcOPcQdIyNV6APsETvIifSSYaXBMMxwfSaXNxS358R4RKzb859g==
X-Received: by 2002:a5d:6341:0:b0:2ef:d0de:e8a4 with SMTP id b1-20020a5d6341000000b002efd0dee8a4mr811482wrw.25.1683098105598;
        Wed, 03 May 2023 00:15:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k9-20020a5d6e89000000b0030629536e64sm9056795wrz.30.2023.05.03.00.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 00:15:03 -0700 (PDT)
Date: Wed, 3 May 2023 10:14:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chuck Lever III <chuck.lever@oracle.com>,
	Mathias Krause <minipli@grsecurity.net>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Subject: Re: [bug report] net/handshake: Create a NETLINK service for
 handling handshake requests
Message-ID: <96b2652a-2316-4a1e-b47f-adc821c4dcee@kili.mountain>
References: <f4e2ebae-c40f-4267-84e5-f3944d4d7f9f@kili.mountain>
 <FB3B84D0-2148-43D9-A0E1-153718BA07DC@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FB3B84D0-2148-43D9-A0E1-153718BA07DC@oracle.com>

Let me add Mathias Krause to the CC because I don't necessarily remember
the rules perfectly.  Mathias, is there any way you could take a look
at this in linux-next?

net/handshake/netlink.c:153 handshake_nl_accept_doit()
warn: fd used after fd_install() 'sock->file'

On Tue, May 02, 2023 at 09:18:38PM +0000, Chuck Lever III wrote:
> >    138         sock = req->hr_sk->sk_socket;
> >    139         fd = handshake_dup(sock);
> >                     ^^^^^^^^^^^^^^^^^^^
> > This calls fd_install(newfd, sock->file) so we cannot trust sock->file
> > again after handshake_dup() succeeds.
> 
> I don't understand this comment, or the Smatch warning.
> Can you explain more?
> 
> 
> >    140         if (fd < 0) {
> >    141                 err = fd;
> >    142                 goto out_complete;
> >    143         }
> >    144         err = req->hr_proto->hp_accept(req, info, fd);

This code exposes the "fd" over netlink...  I would have thought that
Smatch should have printed a warning for this even though it's a false
positive.  Let me change that.

> >    145         if (err)
> >    146                 goto out_complete;
> >                        ^^^^^^^^^^^^^^^^^
> > This is an issue.  I believe it's better to leak the fd here and let it
> > get cleaned up later when the process dies.  (I sound very confident
> > here, but really I am just repeating things other people have said, like
> > some kind of ChatGPT nonsense generator).
> > 
> > if (err) {
> > sock->file = NULL;
> > goto out_complete;
> > }
> 
> That field is owned by the API consumers. I don't think we
> should set it to NULL here.
> 
> 
> >    147 
> >    148         trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
> >    149         return 0;
> >    150 
> >    151 out_complete:
> >    152         handshake_complete(req, -EIO, NULL);
> > --> 153         fput(sock->file);
> 
> The point of this is to remove the reference that is added
> by handshake_dup. There are a handful of other fput() call
> sites in netlink.c -- the idea is to hold sock->file until
> DONE is complete.
> 
> If anything we are double-putting if get_unused_fd_flags() fails:
> the code invokes fput() once in handshake_dup, and once again
> in handshake_nl_accept_doit().
> 
> Perhaps that fput() should be removed.
> 

Huh...  I can't remember why we wouldn't trust sock->file.  Maybe at
the time I got confused by the double put bug as well and thought it
was related to not trusting fd_install() stuff but actually it's just
about reference counting.

Here is the information about fd_install() but I think it doesn't apply
in this case.  It's just the double put bug.

c72ea2050361 ("iio: buffer: Fix file related error handling in IIO_BUFFER_GET_FD_IOCTL")
46963e2e0629 ("misc: fastrpc: avoid double fput() on failed usercopy")
a0f90c881570 ("drm/vmwgfx: Fix stale file descriptors on failed usercopy")
f1ce3986baa6 ("nitro_enclaves: Fix stale file descriptors on failed usercopy")

I will make Smatch warn about this same line but as a use after free
because of the reference counting.

regards,
dan carpenter

