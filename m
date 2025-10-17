Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7EB310771
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Oct 2025 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675051; cv=none; b=tOxsg/5ry0hmeacNFNRBZhpuvvgyJtgxbSeSiEYNJlz0urC5RXpc+Zui3xWxtjlu/EJYV7jCDN2ITmIPcP87lztCmEFTjk3b5W1gr5tBvq2e6Ep+m3IfGMNKfgc9kdDnVTBfERVDGP/3qHVnanuyCFxNGFCzX9niGz4/Hv00h7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675051; c=relaxed/simple;
	bh=5mK2M0hVJGfdiN3VSfq9BCNgQdVTn70R+CbJkNedk+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eqg4jp6VG8UZQ6XgcNrgOlbA74iqKVby0CMlIRZWZDzHsYo10jQULg5zLJizj16eGcy7qICSu119cPBJvdJURkyiSqbPCJC5y/SpZBsKtLaTkdJxMffz1ix6iYK+QDR5A7nvAnHzqHFREZsFyRSVfmPSjNchvrg7qeoThpLaczI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8Yg0sRY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8Yg0sRY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-290a3a4c7ecso15799175ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Oct 2025 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675049; x=1761279849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29Lq2xnZtj+6Sy2WBmqrd6RHyzvurjh80XYGtTuJrGI=;
        b=d8Yg0sRYM33S5oT8nBdoGnPJkeQ4OamrtRR1cyn4PAUwQFJR+fHrALe401tHTV/bbj
         itbIHEU/YF7wwqqZ6290ar8xndC+M/wTvR3ReAQBx2Egw8wzrZ7apLKdYR4h+bc+pqau
         NIU+gRsImXMakMId2tdPHiOz24UcMFiYTegrNPpuD7KMfdtrlJjpuv/9vIuPCckZCUCm
         XvkXiCNURRvJRMFT6uS0vOCOIKx+s5k9xbgkd37nLeZH3gJ6I+9SX/77GX2306FWtGUR
         3/i/CDgDu19cs1inny4yWv67U3hVdi/xZ56yQcriKyOJZ/i/7GsUkUDPb9WpqPk4Uicm
         QO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675049; x=1761279849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29Lq2xnZtj+6Sy2WBmqrd6RHyzvurjh80XYGtTuJrGI=;
        b=JXAOpJogmKgO96P0lTyx4yO7PeAubGPg03hQ0Hk8oz8YtaZtLvI3X9c5D2tF1k5Vx7
         t82zFnwIly1BWCXrQ8uV55Grgg752bXTKqjm/KQU0Du1b4qfLjgsharYXdRVW4lFnh24
         /SZ63O/K60GEMfq/T1lf4dXXDG6mB6UoV//B4Ik/WoFRc3s937Vr3kJ/R/ZjBihVoave
         ej4eY/ZX4pGrHr1eTmna49VSfTVPTn4bFKfLsJNVXY0U2ugr4//N3MzA56S+WTVpevCy
         k//uT8bqMy3z4Jg6xmEqQJkkcguB78MbQibc2SKPdHtInqcyz0ESine+gEsjd0WnjFpt
         1EWA==
X-Forwarded-Encrypted: i=1; AJvYcCV40DCuV8ZkwY5Q+EwpMqfqub9cqMStXjWa4FE+iEEnXzS1f7NiQH/SCIhWH0RKXAvgI3rQInqQtWNi+Rnu40+ES6/Akw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8yP2GvzuyrJgWaL43Y2g6OB7plZCpHuPpITQONTW75viSryBx
	YtLOC3chDBLT5Gf99mi/R9XnWO8JLl/JMvoVTtmp+0VmjopeydRdyd5D
X-Gm-Gg: ASbGncuo3w5FFJEFjPBiWzIqjgjEUPTn9dwSsuMlbA8kjrK8LxsR7qRgxhy3bZwYP+w
	r82+7Y//IMHX10Knanl20gd/AACc4K3yfVbI3GhF2yEVYKO9EDExjIUEKI0BaD6eyO4Lw5ZlxEs
	U3Xy8TmDJLrW5BahhpvZ2rWirQIUDhN3EjeZHsHsn4EtfZh7ATtwxWVJvPDfj7F15MOxjB87tle
	4m874t51aIhqAEN7+UPouVn/z4dvQk1MD0GSAHxlBKTddUj4Y8xxcs50mxF6rGtLCSkWx//yEWl
	VVVa0LyoBCLa8YHyIGBeVymnFekTdFxUcazJkW09jE5okjoPlLH0B61F0nmPn7QpnWQUuSRPdpr
	6I1bTbNpy+gIWgsEasP++jtN5zP3tCr7p8cxSt/mz2SY20CeBbzl3+oexCsexyr6Rbh++m2h/W/
	Yq9fg4u7y/8/j6FVVdLNolUKpPYfiM6fjNkGq9r1EDdB6iOjkgsbXBzcIGmP6UuYYyrXxW62TMH
	zDqDzVEsZogqtZd3CBU
X-Google-Smtp-Source: AGHT+IE3Loe/21tReTiMC1KE1PN6nnxQShPQ2aeX3VGqy1tfwwjN0OSJDK1WmyW+Y1kgS8QPEPO/LQ==
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-290dd1f3fc8mr6269945ad.51.1760675048710;
        Thu, 16 Oct 2025 21:24:08 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:24:08 -0700 (PDT)
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
Subject: [PATCH v4 6/7] nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs
Date: Fri, 17 Oct 2025 14:23:11 +1000
Message-ID: <20251017042312.1271322-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017042312.1271322-1-alistair.francis@wdc.com>
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Allow userspace to trigger a KeyUpdate via debugfs. This patch exposes a
key_update file that can be written to with the queue number to trigger
a KeyUpdate on that queue.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v4:
 - No change
v3:
 - New patch

 drivers/nvme/host/tcp.c | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 791e0cc91ad8..f5c7b646d002 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -11,6 +11,7 @@
 #include <linux/crc32.h>
 #include <linux/nvme-tcp.h>
 #include <linux/nvme-keyring.h>
+#include <linux/debugfs.h>
 #include <net/sock.h>
 #include <net/tcp.h>
 #include <net/tls.h>
@@ -1429,6 +1430,75 @@ static void update_tls_keys(struct nvme_tcp_queue *queue)
 	}
 }
 
+#ifdef CONFIG_NVME_TCP_TLS
+#define NVME_DEBUGFS_RW_ATTR(field) \
+	static int field##_open(struct inode *inode, struct file *file) \
+	{ return single_open(file, field##_show, inode->i_private); } \
+	\
+	static const struct file_operations field##_fops = { \
+		.open = field##_open, \
+		.read = seq_read, \
+		.write = field##_write, \
+		.release = single_release, \
+	}
+
+static int nvme_ctrl_key_update_show(struct seq_file *m, void *p)
+{
+	seq_printf(m, "0\n");
+
+	return 0;
+}
+
+static ssize_t nvme_ctrl_key_update_write(struct file *file, const char __user *buf,
+					  size_t count, loff_t *ppos)
+{
+	struct seq_file *m = file->private_data;
+	struct nvme_ctrl *nctrl = m->private;
+	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
+	char kbuf[16] = {0};
+	int queue_nr, rc;
+	struct nvme_tcp_queue *queue;
+
+	if (count > sizeof(kbuf) - 1)
+		return -EINVAL;
+	if (copy_from_user(kbuf, buf, count))
+		return -EFAULT;
+	kbuf[count] = 0;
+
+	rc = kstrtouint(kbuf, 10, &queue_nr);
+	if (rc)
+		return rc;
+
+	if (queue_nr >= nctrl->queue_count)
+		return -EINVAL;
+
+	queue = &ctrl->queues[queue_nr];
+
+	update_tls_keys(queue);
+
+	return count;
+}
+NVME_DEBUGFS_RW_ATTR(nvme_ctrl_key_update);
+#endif
+
+static void nvme_tcp_debugfs_init(struct nvme_ctrl *ctrl,
+			    const char *dev_name)
+{
+	struct dentry *parent;
+
+	/* create debugfs directory and attribute */
+	parent = debugfs_create_dir(dev_name, NULL);
+	if (IS_ERR(parent)) {
+		pr_warn("%s: failed to create debugfs directory\n", dev_name);
+		return;
+	}
+
+#ifdef CONFIG_NVME_TCP_TLS
+	debugfs_create_file("key_update", S_IWUSR, parent, ctrl,
+			    &nvme_ctrl_key_update_fops);
+#endif
+}
+
 static void nvme_tcp_io_work(struct work_struct *w)
 {
 	struct nvme_tcp_queue *queue =
@@ -3065,6 +3135,8 @@ static struct nvme_ctrl *nvme_tcp_create_ctrl(struct device *dev,
 	list_add_tail(&ctrl->list, &nvme_tcp_ctrl_list);
 	mutex_unlock(&nvme_tcp_ctrl_mutex);
 
+	nvme_tcp_debugfs_init(&ctrl->ctrl, dev_name(dev));
+
 	return &ctrl->ctrl;
 
 out_uninit_ctrl:
-- 
2.51.0

