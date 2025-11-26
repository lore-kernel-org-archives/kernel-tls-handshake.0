Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A594A0C
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 26 Nov 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145902; cv=none; b=ffNfcryVQRmI87a20MWQY0NTWDIJKGcp5gLporZopDu2d7r9Oz6SRZ0JA9NbhJRZioUm8pr7fqFu5PIYaAZfJAi/07aO8YZjD9h44HyHMg6oH2nhWwGZ/u8Wz1CXX+q3LF4BUDJtO0Obl5hn1HP3rdBlopu96oRLfLt9+CjHn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145902; c=relaxed/simple;
	bh=oWs10GaAD0l2G7OxCjpenTqJLwpX+tOgDRCkySsE+h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwYC/hcE7ur5IX7nQdUKgxMXCGe8bYPYfamH1zS9QPR42vDtmtc/y3Vq95GCq+MjISNNIe1O+t/5EbWOOerjFdAhDQH36NV5FTX+I+JLC2cGWYijWHz8pLDVrbsD7OJtDuegqDCVo8nTphcz3rbnHGbDiiIRa2OBdjj2dIK6t1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C64Faq6M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C64Faq6M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so45052725e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 26 Nov 2025 00:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764145898; x=1764750698; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Hfo+TaWQZ+RvWi7kFhtWtk02HBS9jHPgUxpaFj7rG4=;
        b=C64Faq6MmgPmdaBLksrvo7TI1LbBDpxjc1EbP8z6WmMnqLEtrVHykJTWJwrN+olzok
         EaKDpMBu+3gj+qyWo1fmvyMRSrZiAzhC3g41Th/kKLVmPTWOCI5PVnraAiEt1jQD8pY0
         KCBhVtK+IhePiuf/jR+FGxIJS1n1QtQ9x0dmKZnZcscNMLxslccz+M1Kj2KvldY9+j6I
         M9Ux+yaiwFkFMlIxcUxqMF0Dpi5VzOO/RMfsvuE9qf/MwDl5DBRKwEMdsYYGagO4Alo6
         Hz8s3jqiyxHhLL9X39JtnJfQWoze6XVNA7UpbI+6zYiv3zl++zaMbgM5sM7MO1Mb9JoH
         mhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145898; x=1764750698;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Hfo+TaWQZ+RvWi7kFhtWtk02HBS9jHPgUxpaFj7rG4=;
        b=BrZTQFwmGHbL49L4X4mbXLarGZ+scA6SPEVoOvCLCAZ1Qld9Rq8I7goNaVajqe3i4V
         ITTow39ExwDVZ+GnkYQu5Rt6x35KC1ofrEPY03+hcKCJyK+h2clxyZBkNMUstwRU1Mxt
         W5oaW/XdOKzLPwZqnHz20pmp2jXLi00f4ONp8q/Awuy66UfeXE/DFjra6jCWP6AG7Zxd
         NdyqjabJNvBs4RUV8L6b5JHbkRL/hAGrq6UfGj/j803KkMo9tFraJUAJy8Z3D+bUSrAu
         sfs7g9znsTPDqtHw5vc6vhS+ZDQWXxJFdRNVgMCLhSH3PWr/b9VJaOegC6KtcKjsaSLT
         nx2w==
X-Gm-Message-State: AOJu0YwXc5FmXNU4ud14xEQtnKVg//sDHNn7QxCFXY0REATcbxRmRbwp
	gCFkd4Pw5WwGoNGCXg6ECS83ZQlgqaPTDx30jeRoTM2CLb+3330f61krcpD5wqN7PKs=
X-Gm-Gg: ASbGncsX1fm+C4QoHnysJfrMgptHMNJy9wd6A/1rWSfpVkG+R3CDo2krXa3EizVi9AK
	KhzSjwFotW/dbm+++HQJz/0htpzVgC0asImxl/aiKynh97EmXrbBjFG8GmmeGaKQnTH9MLRkPCc
	AMYrFdTw8Fwzpe7JAHJAOrywI/8rxtCIFXRsgfdzrPjq4Cxzb9KmxSamx9/hUXfWh8yaFgPX190
	uF1N8CJosv8WkykJZwiBIhidOqKC2fkOPdbR2+qp8Piw8xQWf8yymZxA/S7Zu1VUbuCth/pnM5l
	qQCzNIG0sqyccvRXSfJyjOFyxgUVFy1PX1/1BNInwRQXzBXXUFjVHOGLAMfPs5aArteNW8zXp5O
	19G/b4JV2IUy0oUe4PeNB7RhglTPGFu7lUvNLecBvyi0WreVaaBQkRQKmh+LOkclZFs3kDeZ/YH
	pTS1J85pCVerPcG1I=
X-Google-Smtp-Source: AGHT+IEZzDxPBvDutujEF1OO7a+inqzoQ6OYlliQ4X7o5KeVOnq88u50IOF9U5XOXZQAczlglRMvjQ==
X-Received: by 2002:a05:600c:354e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47904ac4380mr49718765e9.5.1764145898095;
        Wed, 26 Nov 2025 00:31:38 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0cc186sm28249975e9.13.2025.11.26.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:31:37 -0800 (PST)
Date: Wed, 26 Nov 2025 11:31:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [bug report] net/handshake: convert handshake_nl_accept_doit() to
 FD_PREPARE()
Message-ID: <aSa65GzoGY-E6OYt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Christian Brauner,

Commit 214ab7edf554 ("net/handshake: convert
handshake_nl_accept_doit() to FD_PREPARE()") from Nov 23, 2025
(linux-next), leads to the following Smatch static checker warning:

	net/handshake/netlink.c:128 handshake_nl_accept_doit()
	error: we previously assumed 'req' could be null (see line 109)

net/handshake/netlink.c
    90 int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
    91 {
    92         struct net *net = sock_net(skb->sk);
    93         struct handshake_net *hn = handshake_pernet(net);
    94         struct handshake_req *req = NULL;
    95         struct socket *sock;
    96         int class, err;
    97 
    98         err = -EOPNOTSUPP;
    99         if (!hn)
    100                 goto out_status;
    101 
    102         err = -EINVAL;
    103         if (GENL_REQ_ATTR_CHECK(info, HANDSHAKE_A_ACCEPT_HANDLER_CLASS))
    104                 goto out_status;
    105         class = nla_get_u32(info->attrs[HANDSHAKE_A_ACCEPT_HANDLER_CLASS]);
    106 
    107         err = -EAGAIN;
    108         req = handshake_req_next(hn, class);
    109         if (req) {

If handshake_req_next() returns NULL

    110                 sock = req->hr_sk->sk_socket;
    111 
    112                 FD_PREPARE(fdf, O_CLOEXEC, sock->file);
    113                 if (fdf.err) {
    114                         err = fdf.err;
    115                         goto out_complete;
    116                 }
    117 
    118                 get_file(sock->file); /* FD_PREPARE() consumes a reference. */
    119                 err = req->hr_proto->hp_accept(req, info, fd_prepare_fd(fdf));
    120                 if (err)
    121                         goto out_complete; /* Automatic cleanup handles fput */
    122 
    123                 trace_handshake_cmd_accept(net, req, req->hr_sk, fd_prepare_fd(fdf));
    124                 return fd_publish(fdf);
    125         }
    126 
    127 out_complete:
--> 128         handshake_complete(req, -EIO, NULL);
                                   ^^^
then this will crash.

    129 out_status:
    130         trace_handshake_cmd_accept_err(net, req, NULL, err);
    131         return err;
    132 }

regards,
dan carpenter
