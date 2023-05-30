Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750A21CF3
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 21:08:28 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b088947d49so5414051fa.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1685480907; x=1688072907;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uhXq3yu8i4teSdShs4/IswsdmQys59DEQcP59b88WIk=;
        b=iy+dT2WHJu1kN0KE3aVmv0tq5fn/p39a2QogPxeG3GuGSWd77I7RHp5UBSKCGjgjt7
         NvisIoe2YF/ULWo3VWmPs7oOecihgU0q+FzsW4srUz1t0U1O9M34wHsxLbSstffuvVT4
         314fCETOINiEt2CW6hl60kJ+uiGfcn19J7j3vIxqsC0LAKKhKaUh4xxRT6cQdfrQ84H9
         t0cq6y3GD6Z1afPSCcuiczzodcr9/kUmsFlf2pGkd5OS1sJG74RJ/ABsb1o6/kDccRLZ
         aHUc1OGXIWVXDtg9oMtF/3wJ2bh7hDk5bjTY1rrY02EKL1ZAEEnwGyNd7wleGJHoAJ50
         Sjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685480907; x=1688072907;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhXq3yu8i4teSdShs4/IswsdmQys59DEQcP59b88WIk=;
        b=G8+d144GUtQAyCA1uBLqGQMPJSFR2Li+kVvdg+7hlsc4D/MdxhSsadEPKk9ys65MH+
         Zl10JgE/yYjm+N33UCEaypxWu2WC2rSd1w59D8ZowCAxVn/Ob+UMGDzddqxjbhJdaL3G
         MAb3wlVisOQnGpboeNe+4XQBnm8IsygDj0eqodxWsAKA8qUsVDkmYvHwM5dR/160eEUL
         Rdpw3QrLkkkzFAIaLO5EtquHJLncME5W5DPMKSt0c3TFIP/Y5YQmeHwyFoeLEcg1LP4w
         YSK2den8fJzT0sKNZ8ZekO/g883OFalCq3eUFHfPnywUoaglkcIxpO9bCic1hRDIAPMa
         zCiQ==
X-Gm-Message-State: AC+VfDwe5Q5WxS7jQkfode5+I2RQjBtr1pPf+WMsPvDyHRj4a11CHMrL
	cPTc/1zun1vAKKVDwmGS0+EPmE/zoiqWnidHcF8=
X-Google-Smtp-Source: ACHHUZ4sA8wz0cZ9y5trxAZ0/PmeMNWqZeMHYMCUmEvh+9CxiWeoSfSDaxABBKjH/cR5ACdAW9yzZ/gBIyV1W4YG85w=
X-Received: by 2002:a2e:b810:0:b0:2ad:d2dd:7c86 with SMTP id
 u16-20020a2eb810000000b002add2dd7c86mr1115513ljo.2.1685480906585; Tue, 30 May
 2023 14:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 30 May 2023 17:08:15 -0400
Message-ID: <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
Subject: what should happen for proto=rdma,xprtsec=tls
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chuck,

I did
[aglo@unknown000c29dba616 ~]$ sudo mount -o
vers=4.2,sec=sys,xprtsec=tls,proto=rdma,port=20049
192.168.1.106:/nfsshare /mnt
which succeeded and then I did "mount" which displays:
192.168.1.106:/nfsshare on /mnt type nfs4
(rw,relatime,vers=4.2,rsize=262144,wsize=262144,namlen=255,hard,proto=rdma,port=20049,timeo=600,retrans=2,sec=sys,xprtsec=tls,clientaddr=192.168.1.119,local_lock=none,addr=192.168.1.106)
Naturally no TLS happens for rdma but I'm not sure if this mount
should fail? or If the "mount" afterwards shouldn't display/claim that
it's doing xprtsec=tls?

Thoughts?
