Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18626FBF7
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  4 May 2023 14:58:55 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3023a56048bso538455f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 May 2023 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683212333; x=1685804333;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4v+n1pJ5F0+6XHeR6nwttzAUXT3ccV3EzPCUDlQG8II=;
        b=D47aNkwsT1vvdgk3Be1Zq3PbH651ixPdwP+7WIfhzAohJCHYW9Wqhu1DJxJiwH6fkz
         2KmZpVkwGbhlznhTv2AnRLaOPuT/nIxwS75OhKPAx5fWKfV4b2LvfqbJiW0ArCtCQo2J
         fdDR7dyk0pd7wHihB+fDLh2K9iyAeuBKnRqJFV7hzMJpY1EW28wwbPMoMJA0ZczEp83i
         trrtMwK6FhjJiXoQHz711gmrb/ZurakpudAxhcU2Yt9mGnIcOPvFKQ38G16RweHNXYSf
         b+cVCF2W6QvhcyANJaakW5eq8022mVT0c/NcYVjY5uj5fbzeN+4SV0sZ/vwRfsLmxKjR
         K9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212333; x=1685804333;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4v+n1pJ5F0+6XHeR6nwttzAUXT3ccV3EzPCUDlQG8II=;
        b=hIYIDyJ7st5J2EuWyqBS2iD5IXZv+abfYolH8NdFppOgGDQTQSjW3Ud2ZhJ3Weup64
         O+UmOpmgDh1Gy/fTUwAtWO6ywFN2YBUXxju6Er26vaP2Z0kSwktJXIeLjk+/R+TAxJGf
         ovHl+5Lk0di0fwsPT733GntesO+hRPQv1wRV7FQnFvH3Bh6eh4s84tNN+oizpCKATjwW
         B4J8nyFGLwz3plcQbR5PmBzrV7ihyro7qmKqxb75aUMIOBd6taYFIe4eQXO42kHZeJJ7
         ib6g1EnqdQZnmk+XvfBolBpHgUuPrvSSNLyKJ8Nwf4W+ob/kFHiNyUxSKyOdra5wN//v
         LU6g==
X-Gm-Message-State: AC+VfDyc30T2JPkukx8md20BSdmz2h4LQu20G7vrsRwoNLjaT2RU6WdU
	YlxGj+BA94ERQG+FSGo6Kqu6vF2GH7mPgcUPJKI=
X-Google-Smtp-Source: ACHHUZ69zHHtOYmJdH3Eym8Xe0GXvbaXSYHnaFy4VNGEhiIK1GJMR4VJ/+ZE0E6KVWiacgZ9+jWdGA==
X-Received: by 2002:a5d:5007:0:b0:2f6:519c:6aa6 with SMTP id e7-20020a5d5007000000b002f6519c6aa6mr2651660wrt.9.1683212333271;
        Thu, 04 May 2023 07:58:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e14-20020adfef0e000000b003063938bf7bsm7544763wro.86.2023.05.04.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:58:51 -0700 (PDT)
Date: Thu, 4 May 2023 17:57:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [bug report] net/handshake: Create a NETLINK service for handling
 handshake requests
Message-ID: <8ab80ee4-968c-49d7-9ce3-faf9b40bebff@kili.mountain>
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

	net/handshake/netlink.c:51 handshake_genl_notify()
	warn: use 'flags' here instead of GFP_XXX?

net/handshake/netlink.c
    37 int handshake_genl_notify(struct net *net, const struct handshake_proto *proto,
    38                           gfp_t flags)
                                 ^^^^^^^^^^^

    39 {
    40         struct sk_buff *msg;
    41         void *hdr;
    42 
    43         /* Disable notifications during unit testing */
    44         if (!test_bit(HANDSHAKE_F_PROTO_NOTIFY, &proto->hp_flags))
    45                 return 0;
    46 
    47         if (!genl_has_listeners(&handshake_nl_family, net,
    48                                 proto->hp_handler_class))
    49                 return -ESRCH;
    50 
--> 51         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
                                                       ^^^^^^^^^^
should be flags?

    52         if (!msg)
    53                 return -ENOMEM;
    54 
    55         hdr = genlmsg_put(msg, 0, 0, &handshake_nl_family, 0,
    56                           HANDSHAKE_CMD_READY);
    57         if (!hdr)
    58                 goto out_free;
    59 
    60         if (nla_put_u32(msg, HANDSHAKE_A_ACCEPT_HANDLER_CLASS,
    61                         proto->hp_handler_class) < 0) {
    62                 genlmsg_cancel(msg, hdr);
    63                 goto out_free;
    64         }
    65 
    66         genlmsg_end(msg, hdr);
    67         return genlmsg_multicast_netns(&handshake_nl_family, net, msg,
    68                                        0, proto->hp_handler_class, flags);
    69 
    70 out_free:
    71         nlmsg_free(msg);
    72         return -EMSGSIZE;
    73 }

regards,
dan carpenter
