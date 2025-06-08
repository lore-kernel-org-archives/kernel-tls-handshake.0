Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4E3FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404606; cv=none; b=II34Z50AB8bGH972l4PoRvqGaDpK9PkgQeRg6UJc24xFWGcwqd8G5hzlxnQJ2NCR1xdFqayQ7Ws76dGwmHrAhBQjSytvErW+TcLu31RyXrpNQWZWRmXM6xamkE14bXeHw8cvAu/FpBAZpy/JvIDal+IMtUbsH++n5G+ScPnJTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404606; c=relaxed/simple;
	bh=h3RpbVTwZpmWYrHuWmg6zWWdD41vnZ2t42Z++v+Bm3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=K+pK+DfkwBdH6IXgFgesf8UkjMeSw9jKgeqFSIMghoag5/pABLtSPmR/Wxuo5NXwUswXHYsn1MQDVB3j7cJn+zu0RMaBwzzFrEP+HDz0C0R2+s6nskM/oEgn2IoQSn3xuifBeGXpiAjKqulrFnfdeGJZudu3HGwO2CI3sH0unKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs/+XO5m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs/+XO5m"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453066fad06so5618125e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404603; x=1750009403; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejPIG+IVpmgWG1J/JH/igqTNSJr1Ic4dSrfrSYYkDxk=;
        b=Bs/+XO5mPsgEkRzOfnfxH3SGG0JElOtywjHsBf/kSPs0SnPiE4sKgRW5Pz6nyZ1D9k
         gzRHKVZwacnVCMrmR+N/F/LAi/pIRYCS6xNsh8J4z8yeQL35xBnWxGbwP1Nae376t054
         ZYWRFrX2u7KoQkpWcm+8oYMxL1nlPXz2gUjwE4IduoIHswtVOLtvi5s3H4E3AayvYuFM
         AgwrYagcz9bprEIqI0moUFQtY0wb1vhIZ9kmsdLJqSFlcal+JNhn3BVB1kvZg4nk1i4J
         qFYW8OeipMkHPW+gawM55+wx/7cyU920CafZQuO9YZDuTocoLB8I606haMgHKgwyU7iU
         oQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404603; x=1750009403;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejPIG+IVpmgWG1J/JH/igqTNSJr1Ic4dSrfrSYYkDxk=;
        b=s4vFOwcrkZUtlbiAZ6sQXyuBhb4uS+pMI0G1Y5SPR0T7T+FhHBZ9BH0naix3dG/vuw
         SjGRoGWRXXQnJsKgl8KsPidwv0Wra1UMpR93nrxewQI1lajxnSA3+RA+QYcLBBLOEHY5
         G7WdaBM3S6WfSYWtd9mPZSSyTAJRieciNF9r2LKTYktbYdtBqP8iQKE98tsaOSjIDUD6
         +R4HU+wOMHbwvEEx+Iz1W0qgZrQ1vksfuFYgW4P6LCzpCahvZUKFtMC2GBOIn1nLK9bH
         pU+F9H/lBtBIINkF8N0FsYIZ1BCiATo92HngEckLfIF6szTXRjAek2JnzztaoVNkIWi7
         XMng==
X-Gm-Message-State: AOJu0YzpXRGH8CmPQmiUkaTrJgVutOkye5UVCXzoDBGupqNGr1GxQ44Z
	rchvBKT6slItdf49u9Bolyz6onB/Ficfdk6Hx4nVAnc9Av57nbtNJaqVZlwjNA==
X-Gm-Gg: ASbGncuEvI5AwQkb/FJBWQbBUhm1yq/M5H/gs0IenEOIG8Rou2tTD5fM+H2+EmSyVDw
	+ifz1RkKNOsheKnq1GFJrdJhcAw1G6MnuJFnjUDxuw+sPXKxXfeefbSBiiBri+Ac4kgGWCBLBke
	cVrFZibIv7gI63mXF9Btb0wvFpyQs3LzWvAvuQquiHD89HiOCcowWg5O1ifJ3d+xncojX+9RBlL
	2/KMTAa9ngKHvW1gLgM/VCEIu5Pq/n3iWWF566h6GebTrhCRiDpYFaoEm4DBpSRP/P5ac7MS+yY
	Uiy7+IpF6eIUhY9Q5dAInj0ZmmfvPOAPt9LWu7EqX/1EZ63+qwURdXLl+AhYasBuOKFctiJodiQ
	SzHwEc5JV/M6wrbem7HY=
X-Google-Smtp-Source: AGHT+IH47c/z4g+TGgBcxF0dX9wgyA0fIUtuCYcV5EOh+MrMkNdz8oEnTuwddh4CO4lxbkgGumI4hA==
X-Received: by 2002:a05:600c:a08d:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-452014d4449mr107367815e9.31.1749404602993;
        Sun, 08 Jun 2025 10:43:22 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d161csm86039305e9.37.2025.06.08.10.43.22
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:43:22 -0700 (PDT)
Message-ID: <1f1e31ce-84fd-4db8-8873-68ba69019f67@gmail.com>
Date: Sun, 8 Jun 2025 18:43:22 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 3/7] tlshd_handshake_parms: Use an empty string, instead of
 "unknown", for the default value of peername.
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

"unknown" could conceivably be a valid hostname.

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/log.c     | 6 +++++-
 src/tlshd/netlink.c | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/tlshd/log.c b/src/tlshd/log.c
index 3594d52..77e2d29 100644
--- a/src/tlshd/log.c
+++ b/src/tlshd/log.c
@@ -57,7 +57,9 @@ void tlshd_log_success(const char *hostname, const struct sockaddr *sap,
 	char buf[NI_MAXHOST];
 
 	getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
-	syslog(LOG_INFO, "Handshake with %s (%s) was successful\n",
+	if (hostname[0] == '\0')
+		hostname = "<unknown>";
+	syslog(LOG_INFO, "Handshake with '%s' (%s) was successful\n",
 		hostname, buf);
 }
 
@@ -75,6 +77,8 @@ void tlshd_log_failure(const char *hostname, const struct sockaddr *sap,
 		char buf[NI_MAXHOST];
 
 		getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
+		if (hostname[0] == '\0')
+			hostname = "<unknown>";
 		syslog(LOG_ERR, "Handshake with '%s' (%s) failed\n",
 		       hostname, buf);
 	} else
diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index ce8e981..0f4a797 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -223,7 +223,7 @@ static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
 		parms->x509_privkey = nla_get_s32(tb[HANDSHAKE_A_X509_PRIVKEY]);
 }
 
-static char tlshd_peername[NI_MAXHOST] = "unknown";
+static char tlshd_peername[NI_MAXHOST] = "";
 static struct sockaddr_storage tlshd_peeraddr = { 0 };
 
 static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
@@ -289,6 +289,7 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 				  NULL, 0, NI_NAMEREQD);
 		if (err) {
 			tlshd_log_gai_error(err);
+			tlshd_peername[0] = '\0';
 			return NL_STOP;
 		}
 	}
-- 
2.47.2

