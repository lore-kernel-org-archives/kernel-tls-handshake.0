Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF40FBF7
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  4 May 2023 14:58:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-2f55ffdbaedso423108f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 May 2023 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683212298; x=1685804298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFhF7FYTBsyiAf07jWtXlnNDSmFLUuXZtpIstvg+wpE=;
        b=T0xfZ38bHWTw8mJ+9IMeVPYeVM7EialRCeVyKm1g/ZZ25oLfoUvnmSjV76h2XNMMj6
         JRUd2bUx/RvjuzZhGNnxx6n6SRlJojuDJF85ghhP5ZokJgha3nS4VopyLGVL0qDugZjB
         8la0j0QgzNqjraCxzx+YaDtNpLXOkMSlYJ4vx1ws0jIdFO+cadFAcZbZKA2k87QrohTY
         Z0B39ptRhkXCFr4wTBJ4bbZFx80Qkhus8AIsLYhQLet7oocqdI85mPBRSZ54OLEQXiec
         zrknG4kk22s0ZcFLDur+q3s30deyjcYROccVw2Y8ROaVklGuR5Tq1DrmXDXgb+MLMLGI
         Fetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212298; x=1685804298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFhF7FYTBsyiAf07jWtXlnNDSmFLUuXZtpIstvg+wpE=;
        b=GH0+oEDEC7WkG+BN1hsb9JMUfbrqrsMGKjNnS/GNSZyNfL06Wgb3/mvixVgjQjItwW
         Wrl2oEGTMQOz/fh7gI59d/7h9x4szCjRstKdabRf1NlsJTD9KJn+j8KyUcXaEU0fq2LX
         /deAWPhi97D9XEmRxWNRbCCNkPC1m5znaWgnwlVE8Uzf/6pm4wCU1IuUWrTA4ORP3RLL
         Ho+Vh/VZ/Ip7LXsJhAZrmlfL+CIwg+ScEVA7KlN20icSrz5cKOB5MjLROaOXwwerTTTu
         qisGSTepeIsLK7735i8nyjn1OTRffNfBAiFJaT/Ggi6fzfuBfXvd/6f+fMwR387ZLBPw
         nudQ==
X-Gm-Message-State: AC+VfDy/uswcs1NfPu2eHUa3FqbVqhYJCfmt2CfxO/Ms8gFhrftWrCRc
	/fu3oqFRSvtFJlLgNUh99HoKfA==
X-Google-Smtp-Source: ACHHUZ6FbnsHrKXd4qe0ePV/pe3Ag8AsoTn6hxRw7HAo1Eihotl84P4K5QnX2daTH3t2EJihwAkpTw==
X-Received: by 2002:adf:f40f:0:b0:2dc:c0da:409 with SMTP id g15-20020adff40f000000b002dcc0da0409mr2751274wro.27.1683212297998;
        Thu, 04 May 2023 07:58:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe10f000000b00304832cd960sm27162769wrz.10.2023.05.04.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:58:15 -0700 (PDT)
Date: Thu, 4 May 2023 17:57:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [bug report] net/handshake: Create a NETLINK service for handling
 handshake requests
Message-ID: <3fb2bdde-cddb-4884-b217-90472ceeb524@kili.mountain>
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

	net/handshake/netlink.c:195 handshake_nl_done_doit()
	error: uninitialized symbol 'req'.

net/handshake/netlink.c
    159 int handshake_nl_done_doit(struct sk_buff *skb, struct genl_info *info)
    160 {
    161         struct net *net = sock_net(skb->sk);
    162         struct socket *sock = NULL;
    163         struct handshake_req *req;

uninitialized

    164         int fd, status, err;
    165 
    166         if (GENL_REQ_ATTR_CHECK(info, HANDSHAKE_A_DONE_SOCKFD))
    167                 return -EINVAL;
    168         fd = nla_get_u32(info->attrs[HANDSHAKE_A_DONE_SOCKFD]);
    169 
    170         err = 0;
    171         sock = sockfd_lookup(fd, &err);
    172         if (err) {
    173                 err = -EBADF;
    174                 goto out_status;

goto

    175         }
    176 
    177         req = handshake_req_hash_lookup(sock->sk);
    178         if (!req) {
    179                 err = -EBUSY;
    180                 fput(sock->file);
    181                 goto out_status;
    182         }
    183 
    184         trace_handshake_cmd_done(net, req, sock->sk, fd);
    185 
    186         status = -EIO;
    187         if (info->attrs[HANDSHAKE_A_DONE_STATUS])
    188                 status = nla_get_u32(info->attrs[HANDSHAKE_A_DONE_STATUS]);
    189 
    190         handshake_complete(req, status, info);
    191         fput(sock->file);
    192         return 0;
    193 
    194 out_status:
--> 195         trace_handshake_cmd_done_err(net, req, sock->sk, err);
                                                  ^^^
warn

    196         return err;
    197 }

regards,
dan carpenter
