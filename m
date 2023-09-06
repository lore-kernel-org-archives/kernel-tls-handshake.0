Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1B10796
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C004C433C9;
	Wed,  6 Sep 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009263;
	bh=/unzjuFbMPuZSnUvi6cQe0wmAZthqUeqnlCsw4U3Dks=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=a/iMaQSdUt4e9e84192cJpWCo64KKrOF6evFAEHbc5nVzjI0LAj3zyIt/7ZjYPU2A
	 cxUVTGkYUKipYOs6xpLnslIssT44HTMIRHK76d5LmkunBDVHhwG3Jy3Ss8mPevH12W
	 UJ9NFjlf+2u3qYCtVq6U9EDH8V8qyXo1jgf+a0/h6VDiVO4quUGeAeCZbl9RFgizzf
	 WNqbO12UQp0/CxIPU8SxNw6G2Os8JEi/Bxtsil/qsh6o969xrqcT1wBQ8GFFv+CLYu
	 lPKJ/5aBY0sIAraHVm9BpUf36rfDjgZk4VbPnELSqVcRIYGScV/++JeGZl7TNnT3jI
	 esHI4DCJk2L5A==
Subject: [PATCH v1 6/6] tlshd: Demote missing options
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:07:32 -0400
Message-ID: 
 <169400924193.10079.16239711194180964109.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

The truststore, certificate, and private key options are not
mandatory, so it is not a full-fledged error if tlshd cannot find
them in tlshd.conf. This commit reduces log noise when the debugging
level is zero.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 26b9686267c0..eb8e80c0b394 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -203,7 +203,6 @@ bool tlshd_config_get_client_truststore(char **bundle)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
 					 "x509.truststore", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Client x.509 truststore not specified", error);
 		g_error_free(error);
 		return false;
 	}
@@ -235,7 +234,6 @@ bool tlshd_config_get_client_cert(gnutls_pcert_st *cert)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
 					"x509.certificate", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Default certificate not found", error);
 		g_error_free(error);
 		return false;
 	}
@@ -279,7 +277,6 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
 					"x509.private_key", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Default private key not found", error);
 		g_error_free(error);
 		return false;
 	}
@@ -329,7 +326,6 @@ bool tlshd_config_get_server_truststore(char **bundle)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
 					 "x509.truststore", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Server x.509 truststore not specified", error);
 		g_error_free(error);
 		return false;
 	}
@@ -361,7 +357,6 @@ bool tlshd_config_get_server_cert(gnutls_pcert_st *cert)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
 					"x509.certificate", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Default certificate not found", error);
 		g_error_free(error);
 		return false;
 	}
@@ -404,7 +399,6 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
 					"x509.private_key", &error);
 	if (!pathname) {
-		tlshd_log_gerror("Default private key not found", error);
 		g_error_free(error);
 		return false;
 	}


