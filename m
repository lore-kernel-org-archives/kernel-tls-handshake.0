Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE719E96D
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465946; cv=none; b=B6lFi+XZgmlWGBxUwZi9HPIHzbveGV100h/SL8S2j88pwA2+Ezhhg6bkTKXZgeuSjrq0lDwHF0clB0Ly7AZClqOQ3hUX2QEfWSoS69+B0bTJXT+INWMjMiA2wZykH16AcuZE4vhKsRiBFrpfTZHjb/V4muksKelCeS8BmsoM50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465946; c=relaxed/simple;
	bh=Bl1TRunIta5QQDe3lRPwonbH+J8i9iNM2VxNxK/XmSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qf7KfD1yGc8ND4Cy+4MVHcftxZlHVuNC0jovSfDUqVdui62QtM4PYS/9JKyL8ymrs6ao2WC5VrW4C3AdkNePhPHmxKqh7vR0q8ibRO1hENjlmurWPU7HMtXtuTh8OswS0rONimlhL2CxjZkuCl7nEWFIIL0bc4dKSd4mWQrBCdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G40/dCJP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G40/dCJP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so1610060a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465944; x=1760070744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOV0qGYLCq+9ZQ//0z9A3z+3aG29/4P327MFfqw2xrc=;
        b=G40/dCJPKWADIyIaQ5bKNNGFyaPoW20TuW1Cpk6mKhz1jSblaglxD813NSEuvwmdKf
         YQk+JKUMkokAkzYkawhSYS0jTH1z3e6ZEVkoViZ7UEaXiJIT2Igd9GFWhaHfFaZReuHO
         V/i7xd5uOwB7Aj1TGLNMh03ILopgq4/KKMb+tytwBT66HXsaA9c3U4zGk3KNDMWZ+J0y
         tAOTlAYY5bIfOdWNh6gPeaH3XM9NIKabHNi3S//ZgtfUjsR/zQOYEg1vxE0XbTFukz0A
         JFtz5/IPB5+UIdzvLJ5mRsRsDll0x1S32hhhxl2yLp7/Sv+Pjq0PWMN9NwkY1klq2CPr
         Qaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465944; x=1760070744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOV0qGYLCq+9ZQ//0z9A3z+3aG29/4P327MFfqw2xrc=;
        b=DTYo9QuEU7QqmjupgV+6NeF4QlQtob8h+Y9XA1gL3LCgRgO3lEP5Cn5rpyDe8oxHg8
         oHNtAOeVyucJHrGZgocgXOwEvUtUHpxbIER8u+K1W/GoCGGu8bsVnls8UQagwVG5ziEm
         uOgoJ9GygRAPPLeLuzNkUF1tKzudhuSHuk626zUIr+TMPbKWP+HZ633tsJ4L5fFsjjSn
         ErA+/O4GVyuGdMs4kprGnOPj0pZCLmSCupoVxCABQeKY29yd3kTXQN9yX7RXieeL9zwI
         whBsV3P7mCdMvnKfq0RPH7FRXizOXk8UaiZ0w+jv68ZSawhzSd/RXQw4KAR7cO/S6lXv
         83dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAKqsBhWtaeWAYQ+oqz3UaOECUKnw9WjHqUbkUVLFwjyqrHkX1XAK0bki9vzIB0pksr38CVdpkjIl8xwmgvho9+9RiiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD6JYspjSogR3grg+UuQqxfhGNfrbfSgLoJpY8kicTvlwA1pWN
	vc2BCmXCYQw34facPY3ZDCY9ZnlQh55N49qKzvTKEtDd1WXOXyl91gve
X-Gm-Gg: ASbGncthxcMYlrTSczJ1ohlqsuXtM/2fg4j48R2U9H7QvoMB9mf6yGOCHEFtO2QWucG
	ejPtzZS0pguVh8Dhzy681o91vYMyh3D5bnLTXtSCJjqxF9HCXxaFmPis+TkcxpcXKymZ+6bo7sA
	R9UTbWZBl9ML7bMqZdpVIIyXWRUvnRl4whrgl2m4s8ciedpVw1t+/8WKd5xYeW4bAyy4yGjSZ73
	xWMtNyF2buAvsRAy/DK3aieUuWzGliEqADr7bh+zihMaXgxESRAHrRQaQDp2w6WZl99Vm/iaE8+
	50oFUftU4AQpX/DNTwd9Xk51bpho2mCuxSFb9hMyuIg+8PhTfyg5PX7DxW/Kd4jAjJ373J5z6+/
	SCsroDvFTz54CdbTaG/TJPV3iQ48Wmwi6vWYU3ftQsoxmXCQX3TmFZv3gOPg47h8ppPbEbmL12u
	JOe+pcflbnYgW3/4qBtcXkxReGmv9NlKYKw8OWNsm80mHGKmoqrHq5tGJodnpH/FY=
X-Google-Smtp-Source: AGHT+IGCDoUIKtDX/52HGaffkclK+hmjaIJ+Bue+zX3dUNN6Q+cAazG3rbJtO5YII+rQ/2wJMc8/6A==
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-339c264f452mr2016481a91.0.1759465944489;
        Thu, 02 Oct 2025 21:32:24 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:23 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/8] net/handshake: Ensure the request is destructed on completion
Date: Fri,  3 Oct 2025 14:31:34 +1000
Message-ID: <20251003043140.1341958-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003043140.1341958-1-alistair.francis@wdc.com>
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

To avoid future handshake_req_hash_add() calls failing with EEXIST when
performing a KeyUpdate let's make sure the old request is destructed
as part of the completion.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - New patch

 net/handshake/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 0d1c91c80478..194725a8aaca 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, unsigned int status,
 		/* Handshake request is no longer pending */
 		sock_put(sk);
 	}
+
+	handshake_sk_destruct_req(sk);
 }
 EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
 
-- 
2.51.0

