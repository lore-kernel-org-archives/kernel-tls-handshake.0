Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F457E
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 May 2023 08:04:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3063208beedso1218340f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 02 May 2023 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683014670; x=1685606670;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GjW/Q6g7UOzoS+aS3tWwHjYMhU2glKnIHTMurdTi20=;
        b=IhIPSSf2FnbnozgclHcdlkoD+yeDUA6gzy7eYNNsnxXnr0IYF8t0zE5QeVvUmWO/Ui
         RvykLJ/yL3eaoukSmRaxd9jC3MyBF7a0GiGsR52gzay85/B5lioN//+SpyqentS5b9N2
         zdCYH/2Y9igep2/02FbKl4DqXRFHhusMikXNMJgcO58H3oCRmoOO7tH9ba1zBdMa6e7A
         hayzrQUDHRdPQAmemfb7Wl4NSQLYS81aS/TKQdLHkauouW4zOqwPt8YBm3GH7l7NNasf
         um4dbOzzBGbsvjB0uZAcJUR3/u9K54OFoT77BINgzy6n52lTFeYmTid8T1nA2HqvnmYL
         JWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683014670; x=1685606670;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GjW/Q6g7UOzoS+aS3tWwHjYMhU2glKnIHTMurdTi20=;
        b=Zf9gSZAmexAabERENGM+QiKdnLjusnHet+D9J3X9EefcCbnzu6efF+WuWPIVGFDcwz
         qg4obG73ZqVJyZ5T23eJZP3hA3rWfQ+3CldPWRDw/6JdeaPNzryWWANvufOx6sdSGmVC
         WUKp62mpvKWgH+5hwqh0SX+CQYjZbDz/ZejflJaG+DWWptJl3tAt3y60956fyVsiTpSC
         uZbmtNZGEk9N5qT2sVv18WI/msEKIzuvnB326krCSu0+mxmYf6RN+rmnDI7lspqTJtmP
         ooBDJZIg/wGlKyvsmzv85qQWJkDtikO0weAAaEWttXppX2eOlz7KEza6MKVduFlJErX6
         y70g==
X-Gm-Message-State: AC+VfDwna9nhJAfWTEA5UnrWmqPKa3bgPHABNzbnFzn845ANurwcf6Uh
	VtuATUVRUO4ZmDDfFPoUigZD2w==
X-Google-Smtp-Source: ACHHUZ65JT1OfykQmeT+EluvoI4KrcqXUjIRl8xgcOfVEtGlnSUXYwX72aJQvIJXZuaAkesRK//bzA==
X-Received: by 2002:a5d:6245:0:b0:306:3995:a123 with SMTP id m5-20020a5d6245000000b003063995a123mr458954wrv.27.1683014669991;
        Tue, 02 May 2023 01:04:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d5402000000b002da75c5e143sm30121071wrv.29.2023.05.02.01.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 01:04:27 -0700 (PDT)
Date: Tue, 2 May 2023 11:04:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [bug report] net/handshake: Create a NETLINK service for handling
 handshake requests
Message-ID: <f4e2ebae-c40f-4267-84e5-f3944d4d7f9f@kili.mountain>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Chuck Lever,

The patch 3b3009ea8abb: "net/handshake: Create a NETLINK service for
handling handshake requests" from Apr 17, 2023, leads to the
following Smatch static checker warning:

	net/handshake/netlink.c:153 handshake_nl_accept_doit()
	warn: fd used after fd_install() 'sock->file'

net/handshake/netlink.c
    116 int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
    117 {
    118         struct net *net = sock_net(skb->sk);
    119         struct handshake_net *hn = handshake_pernet(net);
    120         struct handshake_req *req = NULL;
    121         struct socket *sock;
    122         int class, fd, err;
    123 
    124         err = -EOPNOTSUPP;
    125         if (!hn)
    126                 goto out_status;
    127 
    128         err = -EINVAL;
    129         if (GENL_REQ_ATTR_CHECK(info, HANDSHAKE_A_ACCEPT_HANDLER_CLASS))
    130                 goto out_status;
    131         class = nla_get_u32(info->attrs[HANDSHAKE_A_ACCEPT_HANDLER_CLASS]);
    132 
    133         err = -EAGAIN;
    134         req = handshake_req_next(hn, class);
    135         if (!req)
    136                 goto out_status;
    137 
    138         sock = req->hr_sk->sk_socket;
    139         fd = handshake_dup(sock);
                     ^^^^^^^^^^^^^^^^^^^
This calls fd_install(newfd, sock->file) so we cannot trust sock->file
again after handshake_dup() succeeds.


    140         if (fd < 0) {
    141                 err = fd;
    142                 goto out_complete;
    143         }
    144         err = req->hr_proto->hp_accept(req, info, fd);
    145         if (err)
    146                 goto out_complete;
                        ^^^^^^^^^^^^^^^^^
This is an issue.  I believe it's better to leak the fd here and let it
get cleaned up later when the process dies.  (I sound very confident
here, but really I am just repeating things other people have said, like
some kind of ChatGPT nonsense generator).

	if (err) {
		sock->file = NULL;
		goto out_complete;
	}

    147 
    148         trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
    149         return 0;
    150 
    151 out_complete:
    152         handshake_complete(req, -EIO, NULL);
--> 153         fput(sock->file);
    154 out_status:
    155         trace_handshake_cmd_accept_err(net, req, NULL, err);
    156         return err;
    157 }

regards,
dan carpenter
