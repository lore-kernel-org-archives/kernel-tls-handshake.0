Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A08B22333B
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465978; cv=none; b=VuERgu0/+yvejQXRJH12Pragvfanzm9AhzShsO1VNu72aB+elI5cEIggY4dtXr9/AGmHUtvuvxiq6X2ymetEvtOUMWh9Up+p3yOAotbB8hm35j2Lq1CHkBPoT4laEyRH0FS9itcniE5me9IFnhKdTIllLQ1vyf2P6G7hgxFRetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465978; c=relaxed/simple;
	bh=/TjxyRjXn5vKm7N0CPYK5CIrgVeXHkM5aYlhADtKSeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgRoDPwJmIjQu2kjdgyMGiHs4L8gKDQMAbRNyvsHYRTUfdYooNvt50SzfOSaPXpwkwibB8AO47uTQd4XKCHAh1fJTq5U4/L6JspxbwrVrHPB/97WfBWl0QKrYLAymJu1x8QvcpvYC4WMH2DQKZah2DL3QN9s7T5sTQ3Ztmrujqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHon/sdX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHon/sdX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781206cce18so1583304b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465976; x=1760070776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RfUYBKsuo8ddTyCuM4jvFb8g3qBzZAb/Bm18mx0r0I=;
        b=lHon/sdX4z5p86/MmFkOBPUCSKhJRniDprGTd6Y8q7WMZrQ6Fugi5YsVI9ZeDwKafK
         91HGUo60ln6s/Xwsf87rkdUseUOgBepTNJTwehKJlgohg5hX3c+AZmi0cu8qg7aIa57T
         juwvJv+XzSMvc7HTuSJej2pMDKe5B73YQq8hrczLoXADoEDOBKNL+PghpvR9mOqrtrEa
         AnmOuImO+MVobaXXzJkivlSdlEPFBEU7GMbynt9cw8h29E662r8E3UwK5P6JhaGjHy11
         MQdRuD2uVVCN1GbPHAMeU2dKGeq8yqWxnW/VJIVAFroZcfSTBbpqk6jYLMrfazpuGp/I
         U3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465976; x=1760070776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RfUYBKsuo8ddTyCuM4jvFb8g3qBzZAb/Bm18mx0r0I=;
        b=uxIWOiveAu7+i1ofCiZjgrWBTxTwQ0mkRJZ8qlNk2zD6Ov0mvZjxCzvW9RA6Biiprn
         Hla3opCpQKXxgSNoiUpXyegjDtd7zyxDY+SQG8Mq/4M1LyifWJ0cPWNx+LgCNYrgmQtU
         bY+/Pe1klawPcmPPS7QP7SWHxjnmIHFtOBJ7BrfFpnmQwBMKEuVIKOHx0Hp0OhUaGAcq
         jcO1Lu+AeRlSG7t8mluLFkjBZy4OHfsKO9XXLAGI/uIZCV8ygPQXblsuV6UkSqw3aYW7
         qoQBDbCvpHeP92rD1vaMEVpolUDo3b0yr5tQnHCaBm+CC9xHu2CtJy+H0zSIE6bKTUAF
         V0CA==
X-Forwarded-Encrypted: i=1; AJvYcCU4MNwCfo0d3d5i+DDO4Ixym/9V7/HNRc4tWtY05o1LOmQmsl9uKqsPEO5g6dj+96EUjsPG3J2Z9Pv4fhqtJUU9JOrmDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9mKMeq0kNchHkFi2u5cC887y/meDYFww6oeD6t+xnKgyvi+bW
	TKCWrtqQCcfMm71v13nh4ItTTRR4w6nK/o90idJ2zyQZgu1luwlK1wm/
X-Gm-Gg: ASbGncumGeQR/+qi3x+WGZVrAf2ch48YDpzpNvrxpnI5rsUMch5MkP+Svx1ymVJ/asY
	R3xPpqF3snv38ZLUojXpo+FrfxuzVb2wpZswKaWIBH2OVdna76cw5YLVdF8GFV7nh3SYNW9UcPr
	Ge+xESYqQiHYoVaBi6KFvnrBiC4gnrgFqGiG2hVb35yEVKMM3x9lo6veHqFrzuwy8861sZgcmnf
	DNel/4hbgNVdMrp6gWBUUrMvYRbkaqOigHAPwpMvb04DdHyaEzoxdW9sv48SN2w68kW5T1/aG8K
	32X+Bm6abEfL4bqOTD7cPoMya0n377UOQcQA9uYyn3lYD8D9RvtCSMuKitZ0GuNTPbNNkLtSDsj
	IUbs59o97xB7fkpMqHDDXsusv7MbybHghDvc/54O8GR+pHDg5Chp5Szkx+55SU8MMNSnwsusKEN
	vogTwPigyj2Rmm17PNoWZFnCuj0ersiTbQ+1SNsANSWaoGv4uBJGu7kTONr9J62vk=
X-Google-Smtp-Source: AGHT+IGGX+e0auRKkNgRCpHofPZBmDCRUu/ZNBz9qUrUPtdZIEwSRDXKxeRRWzhaVI2evV9MhLLdHA==
X-Received: by 2002:a05:6a20:729c:b0:2da:f4be:c8c2 with SMTP id adf61e73a8af0-32b61dde689mr2200196637.31.1759465975599;
        Thu, 02 Oct 2025 21:32:55 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:55 -0700 (PDT)
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
Subject: [PATCH v3 8/8] nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs
Date: Fri,  3 Oct 2025 14:31:39 +1000
Message-ID: <20251003043140.1341958-9-alistair.francis@wdc.com>
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

Allow userspace to trigger a KeyUpdate via debugfs. This patch exposes a
key_update file that can be written to with the queue number to trigger
a KeyUpdate on that queue.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - New patch

 drivers/nvme/host/tcp.c | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4f27319f0078..8c6d18727e90 100644
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
@@ -1432,6 +1433,75 @@ static void update_tls_keys(struct nvme_tcp_queue *queue)
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

