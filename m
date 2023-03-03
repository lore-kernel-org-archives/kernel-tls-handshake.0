Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132779D8
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Mar 2023 15:08:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 75F632052D;
	Fri,  3 Mar 2023 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677856128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=FRLB0WoCjd2vwafaYhCuGn0VGweMy/RwGf55fcRkUmk=;
	b=hgCefWR5OjF9OaSUlvCXInGQZgI9uux7402yDdG9snM+2tnT1IBXK8Y5pnlgYHo+thbeh9
	Yx9rlwsLXMZONLRLjfEVGXwF8kFsPKn/gYM4u3k+ZoOD41jhcWNGDh6lsWbMe/t6oSV+/Z
	uQJl1Ofo3cX84OrK4ZS30JPOnk0+/VE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677856128;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=FRLB0WoCjd2vwafaYhCuGn0VGweMy/RwGf55fcRkUmk=;
	b=a0Bi0uXfatiAV4gp41VnQifMZmLPvm1eDfQ1xT0Cun8F1QBl9lM2SwZwk+GbdRfYHptz4I
	1c3QXxd7CMVE62Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67282139D3;
	Fri,  3 Mar 2023 15:08:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XGoJGIANAmRCMAAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 03 Mar 2023 15:08:48 +0000
Content-Type: multipart/mixed; boundary="------------TDiIj0nATb6NCo40l7MMchq0"
Message-ID: <ee1e9c66-40b0-c373-25ee-ed5bc38203f5@suse.de>
Date: Fri, 3 Mar 2023 16:08:48 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
From: Hannes Reinecke <hare@suse.de>
Subject: Misc fixes for v5

This is a multi-part message in MIME format.
--------------TDiIj0nATb6NCo40l7MMchq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chuck,

after some fiddling with nested arguments (and eventually removing them) 
I found some issues with v5.
(cf the attached patch).

And I'm still stuck with the server side; ServerHello is sent to 
userspace, but that the daemon receives the packet only after a timeout 
on the client side :-(

So if you have any idea ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)
--------------TDiIj0nATb6NCo40l7MMchq0
Content-Type: text/x-patch; charset=UTF-8; name="tls-hs.patch"
Content-Disposition: attachment; filename="tls-hs.patch"
Content-Transfer-Encoding: base64

Y29tbWl0IGMzYzU4OWIxNWEzMGE2Mzc2ZmQ2OWI2NjEzZWQ2NGJkOWRkNmIwN2QKQXV0aG9y
OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KRGF0ZTogICBGcmkgTWFyIDMgMTU6
Mjc6MTAgMjAyMyArMDEwMAoKICAgIGhhbmRzaGFrZSBmaXhlcwoKZGlmZiAtLWdpdCBhL25l
dC9oYW5kc2hha2UvbmV0bGluay5jIGIvbmV0L2hhbmRzaGFrZS9uZXRsaW5rLmMKaW5kZXgg
ODg3NzVmNzg0MzA1Li44ODJhOTc5NzJiMGIgMTAwNjQ0Ci0tLSBhL25ldC9oYW5kc2hha2Uv
bmV0bGluay5jCisrKyBiL25ldC9oYW5kc2hha2UvbmV0bGluay5jCkBAIC0xMTQsMTkgKzEx
NCwyNSBAQCBzdGF0aWMgaW50IGhhbmRzaGFrZV9zdGF0dXNfcmVwbHkoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqZ2ksCiAgKgogICogSW1wbGljaXQgYXJndW1l
bnQ6ICJjdXJyZW50KCkiCiAgKi8KLXN0YXRpYyBpbnQgaGFuZHNoYWtlX2R1cChzdHJ1Y3Qg
c29ja2V0ICprZXJuc29jaykKK3N0YXRpYyBpbnQgaGFuZHNoYWtlX2R1cChzdHJ1Y3Qgc29j
a2V0ICpzb2NrKQogewotCXN0cnVjdCBmaWxlICpmaWxlID0gZ2V0X2ZpbGUoa2VybnNvY2st
PmZpbGUpOworCXN0cnVjdCBmaWxlICpmaWxlOwogCWludCBuZXdmZDsKIAorCWlmIChXQVJO
X09OKCFzb2NrKSkKKwkJcmV0dXJuIC1FSU5WQUw7CiAJbmV3ZmQgPSBnZXRfdW51c2VkX2Zk
X2ZsYWdzKE9fQ0xPRVhFQyk7Ci0JaWYgKG5ld2ZkIDwgMCkgewotCQlmcHV0KGZpbGUpOwor
CWlmIChuZXdmZCA8IDApCiAJCXJldHVybiBuZXdmZDsKLQl9CiAKLQlmZF9pbnN0YWxsKG5l
d2ZkLCBmaWxlKTsKLQlyZXR1cm4gbmV3ZmQ7CisJZmlsZSA9IHNvY2tfYWxsb2NfZmlsZShz
b2NrLCBPX0NMT0VYRUMsCisJCQkgICAgICAgc29jay0+c2stPnNrX3Byb3RfY3JlYXRvci0+
bmFtZSk7CisJaWYgKCFJU19FUlIoZmlsZSkpIHsKKwkJZmRfaW5zdGFsbChuZXdmZCwgZmls
ZSk7CisJCXJldHVybiBuZXdmZDsKKwl9CisJcHV0X3VudXNlZF9mZChuZXdmZCk7CisJcmV0
dXJuIFBUUl9FUlIoZmlsZSk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmxhX3BvbGlj
eQpAQCAtMTM5LDcgKzE0NSw3IEBAIHN0YXRpYyBpbnQgaGFuZHNoYWtlX25sX2FjY2VwdF9k
b2l0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBnZW5sX2luZm8gKmdpKQogCXN0cnVj
dCBubGF0dHIgKnRiW0hBTkRTSEFLRV9BX0FDQ0VQVF9NQVggKyAxXTsKIAlzdHJ1Y3QgbmV0
ICpuZXQgPSBzb2NrX25ldChza2ItPnNrKTsKIAlzdHJ1Y3QgaGFuZHNoYWtlX3JlcSAqcG9z
LCAqcmVxOwotCWludCBmZCwgZXJyOworCWludCBmZCA9IC0xLCBlcnI7CiAKIAllcnIgPSAt
RUlOVkFMOwogCWlmIChnZW5sbXNnX3BhcnNlKG5sbXNnX2hkcihza2IpLCAmaGFuZHNoYWtl
X2dlbmxfZmFtaWx5LCB0YiwKQEAgLTE3Nyw3ICsxODMsNiBAQCBzdGF0aWMgaW50IGhhbmRz
aGFrZV9ubF9hY2NlcHRfZG9pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2VubF9p
bmZvICpnaSkKIAogb3V0X2NvbXBsZXRlOgogCWhhbmRzaGFrZV9jb21wbGV0ZShyZXEsIC1F
SU8sIE5VTEwpOwotCWZwdXQocmVxLT5ocl9zb2NrLT5maWxlKTsKIG91dF9zdGF0dXM6CiAJ
dHJhY2VfaGFuZHNoYWtlX2NtZF9hY2NlcHRfZXJyKG5ldCwgcmVxLCBOVUxMLCBlcnIpOwog
CXJldHVybiBoYW5kc2hha2Vfc3RhdHVzX3JlcGx5KHNrYiwgZ2ksIGVycik7CmRpZmYgLS1n
aXQgYS9uZXQvdGxzL3Rsc19oYW5kc2hha2UuYyBiL25ldC90bHMvdGxzX2hhbmRzaGFrZS5j
CmluZGV4IDM3MmU2ODQ4OGFjMC4uZjRhZjk2ODAxODVkIDEwMDY0NAotLS0gYS9uZXQvdGxz
L3Rsc19oYW5kc2hha2UuYworKysgYi9uZXQvdGxzL3Rsc19oYW5kc2hha2UuYwpAQCAtMTA1
LDcgKzEwNSw3IEBAIHN0YXRpYyB2b2lkIHRsc19oYW5kc2hha2VfZG9uZShzdHJ1Y3QgaGFu
ZHNoYWtlX3JlcSAqcmVxLCBpbnQgc3RhdHVzLAogCXN0cnVjdCB0bHNfaGFuZHNoYWtlX3Jl
cSAqdHJlcSA9IGhhbmRzaGFrZV9yZXFfcHJpdmF0ZShyZXEpOwogCWtleV9zZXJpYWxfdCBw
ZWVyaWQgPSBUTFNfTk9fUEVFUklEOwogCi0JaWYgKHRiW0hBTkRTSEFLRV9BX0RPTkVfUkVN
T1RFX1BFRVJJRF0pCisJaWYgKHRiICYmIHRiW0hBTkRTSEFLRV9BX0RPTkVfUkVNT1RFX1BF
RVJJRF0pCiAJCXBlZXJpZCA9IG5sYV9nZXRfdTMyKHRiW0hBTkRTSEFLRV9BX0RPTkVfUkVN
T1RFX1BFRVJJRF0pOwogCiAJdHJlcS0+dGhfY29uc3VtZXJfZG9uZSh0cmVxLT50aF9jb25z
dW1lcl9kYXRhLCBzdGF0dXMsIHBlZXJpZCk7Cg==

--------------TDiIj0nATb6NCo40l7MMchq0--
