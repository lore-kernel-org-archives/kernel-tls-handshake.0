Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60D63DC
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 20:15:08 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-62e102cadc7so1720826b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1681503308; x=1684095308;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XuBkTm+/9YKH1UzsZB99kJLmDQzFyHA3Sg5iIRd6ebE=;
        b=sZPojzeIwJ+pTWJ91pLevhymGADSO0kR9WVVS41TjtI6fOEa0z9iX25vKFTj3yLMrm
         cmPAC7i4Rm0SUQRjTvTX0RXx/KYmy2rbNNTWcDY4NjrypjiDgeFv8ebR5zn+4s9f/Bh9
         cP+/JpFo07R0MRACgG1t+1kGt6A8I5oOwcv1/7tWa/j9FukRJy6oi/IftLAF0EeRxEV4
         twDQI/owI5w+V6wdJbiDsK76/dvGUx8O6leC+B0s5Df/kxcsoQXVVMzJNt02DtzPLeHn
         JO0IRyTRzGcqRh3GMPJfBdMyLW+6QzgZsa3CEX1qE9ZnCLrkJzss+qezUrMjDh2kkvuU
         inZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681503308; x=1684095308;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuBkTm+/9YKH1UzsZB99kJLmDQzFyHA3Sg5iIRd6ebE=;
        b=XQLzlxBDi9+RiMNRJKGu9vFju1Ryueh7bXfysE5ar89oLuJzqM42qo9CaZaBTZDTdo
         VebV4pl9bocLQBfyF146RGz7VCO4wBdQInVTPSngI0SLGNxooldrLpgf9Jk4swQ5WP9K
         QvxC0BWWPfcmj4T5U2UdSpkcDzGsIapYJsWj31xMzhUSpoIcBBMKnly6G2xMqZCkCJES
         aFwjgRxQrPRe6Dy3g981OfoF7D59MNjMhbOR+dcfAWrYgvJNWd8FHFIgU/fzIh9GDe1X
         MDywqsfsF0T7wTnYYvq7dh1/8qz6k7uYEum/3DpIVZnAuZhCApli024t6z/rYk3NXw8q
         L9Qg==
X-Gm-Message-State: AAQBX9cBh/xKnloTkK/3JxA17IsPWC8XPTOLv35ECbYsqt7tj4c/Eadj
	sFcQaZG5vf1WqidgB/oADyzOdao1AcrZIaqVzTU=
X-Google-Smtp-Source: AKy350aE/KT2Hjc9Mp3eUH7hlga/Qv6HEqUJ15t+zxJEoIzXQBD/uRWwN51ADXB519Df9M6d09zSp8AMA4kQmIPjkWM=
X-Received: by 2002:a05:6a00:1a88:b0:63b:6fd3:93eb with SMTP id
 e8-20020a056a001a8800b0063b6fd393ebmr1198688pfv.6.1681503307933; Fri, 14 Apr
 2023 13:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 14 Apr 2023 16:14:56 -0400
Message-ID: <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
Subject: advice on kernel configs for NFS with TLS
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Do we have guidelines for how one were to build a kernel that would
support NFS with TLS? As in what kernel options are required to be
turned on (and what off)? I was under the impression that if one were
to start with a base RHEL9 kernel config that would be sufficient. But
I believe I'm wrong.

For some reason when CONFIG_KUNIT is enabled it leads to a kernel
where the upcall doesn't happen. The kernel logs that it did
handshake_submit() but the tlshd never gets anything. I don't know why
this kernel options leads to this behavior as I'm at a loss how to
debug netlink upcall.

Help?
