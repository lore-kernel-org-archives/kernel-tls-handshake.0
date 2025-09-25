Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71534307ADA
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818338; cv=none; b=K98ZnOSZgwHX8BIbiT+aOTGMrSltu7vuqB+KCStDJTaeLPE+vJDXDyHdVu4gk4FT9JbyuPPIrw2JoUWd3o1eyIALgmRXFyo0b0acUxof8bHPs7eWHW2x/YvCmz5STqlVnB/9TxsvOeo/nmZdkrXGuzbHz8XqxlsezQ65PcZyP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818338; c=relaxed/simple;
	bh=FJjz7t6tLSkTLgZ2gUMWir8kvJx4+tL++L0qW0xEH4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVJvMSM+KxQ4fW8EMRMim+GsrR7mMmv5sqck+UHpEmaKFTwUttbsfmpdUNDWkCCpOVXJZ78frB3NIsXpatbSem54iuecrGYqEW9+5a7bCJ1g6PcWwv4cG3GWpk7j/S+005DGwSVfcEIWpxEWEwEx0BUe5EsOgiDorT4ynFgMEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEGaIV2y; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEGaIV2y"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b7a8ceaad3so11149231cf.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818334; x=1759423134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGHj13vLu5VtrLsuXYIMwQB56n+78nLpd4rQyIrByvc=;
        b=WEGaIV2yPPkM1xYM2cEuQJKd8LjMyZYaB4gKxncfxA3vddiWxdoc1VxiR2BN8Perlt
         SLXDXuc66Fk4z0RYHqW8qUnRxUyup4axUzkxgrveCZ9fzG+MryjKbFynl0IIDEFoa4WS
         cYJhC/ro1/UlxXne1iWYsE/tn9ERyLeYVK6l75mky3awgQWEwT3zBnD9fhh9P19CMMSf
         E7704iEIAenUL7qPpHQOVqzYf0K852bkUbCEvSG7jQZE6QCobyyW7Hple3szPJK+jgU9
         QzcvuXzNZ+TcenWs49UeEb/p0DWvqLU0b98b2VHHL43Um26Nb/jlqtY8oB5a4ENz94aH
         IdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818334; x=1759423134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGHj13vLu5VtrLsuXYIMwQB56n+78nLpd4rQyIrByvc=;
        b=O4gV3wdgWmzla8rcDWaYw2Owl1ySJahGkILlJFkJ1VXSRa+H3RJrgr0CWKsR/oMDLE
         eqa4nuRBYbk/cjF6hVfOE9k1SFii8mb2Ir6g26vMzeqWsaqBxXoX4KLJiCbDPPMRmWdB
         8EVY8kuzcaLv6q2/ByTNalDXgP4dcg3hd7rC8RkYe+aFs2o+BO19aY/zE22Pcu5SKFKw
         v87LU+wpj1dUK05TDHoi1/hEzR310IkLy89/YNELSGYdGBDbpwQhF5GN6HC8EcbP3QJU
         zN6uLAv9fJHSFpe6mxyBiCNWQyPkyAW0o8deya6e8m8vGRDk/tslc5eaTVhGXCvy8W2D
         Ucjg==
X-Gm-Message-State: AOJu0YwWMfS6DTrwOYQipkbgtOZyGvFSjOtZ4aA+z4PAhacxknfxfqON
	ZXyCPUzmJiLFn/ckQBWDQqBiTf5T/Ahm0bip60BlWZylSLHdCrCh3Qs11B/n0Q==
X-Gm-Gg: ASbGnctOAzNPBnPY9waZ25tD24sF5uuggYXALJzyLT8fsygLJY19S6rdeVtKmH1ZoAR
	alzCYF1je2i8lwE+80jOl9Gv3ZScaUvRIcREeA06rV0kfbXQP/RFpds6u2xGoi8x9blae4XQRJK
	prAu7lj/zSM2XqCVTcB+2IQJzkk3/PFu0ruWvp35gG5BTO1XngNnWYKIwhO62TiJ9lPa5fvhjIY
	2HWU+Ge77B40ccbKBeBJOzjgSjsnHNBuXmfI7z7H5Db4MM8n2u+9aoFEVl2vrpps3r3tgaKyFAe
	t4crcMcbkvr66XcGG02rGm4It/UUtNLrNeedwurwm52YRwCNNnHXhOf6gPfljWARU6a/K6q2FAg
	YLecQriqoJ1a235FWrpY90tFbw32cUs5oB2kI7se6oNN9nGtHAt6IsSwKFPyBtG4=
X-Google-Smtp-Source: AGHT+IFG8axKOT0+sTrMr2PKq6JX+xGo8wuRQhcvQG105gqO+yNrvkYylxCLyWfn+7XTe49aGYsAFA==
X-Received: by 2002:a05:622a:14d3:b0:4b7:aa00:1e6d with SMTP id d75a77b69052e-4da4deaf5f3mr59286921cf.76.1758818333946;
        Thu, 25 Sep 2025 09:38:53 -0700 (PDT)
Received: from wsfd-netdev64.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db108726a2sm12764951cf.34.2025.09.25.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:38:52 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 0/2] tlshd: do not set conn errcode to GnuTLS errors in QUIC handshake
Date: Thu, 25 Sep 2025 12:38:04 -0400
Message-ID: <cover.1758818286.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns QUIC error handling in tlshd with the TLS 1.3 code.

- On GnuTLS failure during session setup, log the error and leave
  parms session_status = EIO.

- On GnuTLS failure during handshake, log the error and set conn
  errcode = EACCES.

Xin Long (2):
  tlshd: leave session_status as EIO on GnuTLS failure in QUIC session
    setup
  tlshd: set conn errcode to EACCES on GnuTLS failure in QUIC handshake

 src/tlshd/client.c | 42 ++++++++++++++---------------
 src/tlshd/quic.c   | 66 ++++++++++++++++++++++++++--------------------
 src/tlshd/server.c | 29 +++++++++-----------
 3 files changed, 70 insertions(+), 67 deletions(-)

-- 
2.47.1

