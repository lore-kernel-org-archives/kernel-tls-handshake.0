Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F491FA1
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Mar 2023 16:38:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F16A21D51;
	Fri,  3 Mar 2023 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677861531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Vvj01XbvRHLdXt+DwjIKCx+GzC2tY5X/OLhZoeRbPU=;
	b=Mu7UhZgMiqFoq+D63MceGUXY9BTTJB1Q8fOKUsA4Emv72L39ZVihrr0IQgz3TpqS1K52ZA
	1LGWNGGj75woXP5AnjIqU1xRG45MqWmyqMhPfusatGut4enC+/fzmDmQLfDR4ePXKIzs5+
	GUcRNPL9U3b8YSTQeZWmYYCNUE8tX/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677861531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Vvj01XbvRHLdXt+DwjIKCx+GzC2tY5X/OLhZoeRbPU=;
	b=W0ruPbkDH8a6oYAWjfjtUaVKeTI4Njp1ewzEqMpoW1feoplLmQJfc46ZtcfyuTx2UY1NKA
	EcosoFHrbKmYM5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CE651329E;
	Fri,  3 Mar 2023 16:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PsI2CZsiAmQJXwAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 03 Mar 2023 16:38:51 +0000
Content-Type: multipart/mixed; boundary="------------0L54aPhic0AgNt6hgBCKV8Wm"
Message-ID: <c9c2af40-b5fe-a49b-ce58-dc90d0dbe199@suse.de>
Date: Fri, 3 Mar 2023 17:38:49 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Misc fixes for v5
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <ee1e9c66-40b0-c373-25ee-ed5bc38203f5@suse.de>
 <7E06F1BD-7429-431B-8EE3-C495AC3CC723@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <7E06F1BD-7429-431B-8EE3-C495AC3CC723@oracle.com>

This is a multi-part message in MIME format.
--------------0L54aPhic0AgNt6hgBCKV8Wm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/23 16:28, Chuck Lever III wrote:
> 
> 
>> On Mar 3, 2023, at 10:08 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> Hi Chuck,
>>
>> after some fiddling with nested arguments (and eventually removing them) I found some issues with v5.
>> (cf the attached patch).
> 
> I plan to post a v6 soon that supports:
> 
> - a timeout attribute
> - keyrings
> - multiple certs and peerids per handshake
> 
> I still don't like the timeout attribute.
> 
> - Having timeouts at two layers is a known recipe for tears and
>    sorrow.
> - The kernel can't rely on the handshake agent to timeout and
>    call DONE. If the agent exits before invoking DONE, there will
>    be no handshake completion.
> 
> But it's not a hill I care to die on, so I added it.
> 
Yeah, and that's the point where the socket is closed; once
the userspace daemon finally gives up it'll close the connection
(for reasons still be to figured out).
And that typically happens while the kernel side is trying to
send stuff on that socket, leading to interesting crashes.
So yeah, the only safe thing seems to be the close the socket
from the kernel once the kernel detects a timeout.

> The handshake netlink protocol now supports multiple peer IDs
> per upcall, but the implementation does not yet. With only
> protocol support we should be able to merge the upcall and then
> implement the actual support whenever we are ready to actually
> make use of it.
> 
Oh, good; I've already updated the PSK interface to provide several
identities (see the attached patch).

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

--------------0L54aPhic0AgNt6hgBCKV8Wm
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-net-tls-allow-to-pass-a-list-of-identities-for-tls_c.patch"
Content-Disposition: attachment;
 filename*0="0001-net-tls-allow-to-pass-a-list-of-identities-for-tls_c.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjNGU5YWM4OTZjZTVlMGEyZjQ5OTAxMGZmZjExMDExNTkwNjE3MDQ4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4K
RGF0ZTogRnJpLCAzIE1hciAyMDIzIDEyOjM5OjQ2ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
bmV0L3RsczogYWxsb3cgdG8gcGFzcyBhIGxpc3Qgb2YgaWRlbnRpdGllcyBmb3IKIHRsc19j
bGllbnRfaGVsbG9fcHNrKCkKCk5WTWUtb3Zlci1UTFMgYWxsb3dzIGZvciBzZXZlcmFsIGlk
ZW50aXRpZXMgdG8gYmUgcGFzc2VkIHdpdGggdGhlClRMUyBDbGllbnRIZWxsbyByZXF1ZXN0
LCBzbyB1cGRhdGUgdGxzX2NsaWVudF9oZWxsb19wc2soKSB0byBhY2NlcHQKYSBsaXN0IG9m
IGlkZW50aXRpZXMuClRoZSBuZXRsaW5rIGludGVyZmFjZSBjdXJyZW50bHkgb25seSBzdXBw
b3J0cyBhIHNpbmdsZSBpZGVudGl0eSB0bwpiZSB0cmFuc2ZlcnJlZCB0byB0aGUgdXNlcnNw
YWNlIGRhZW1vbiwgc28gcmVzdHJpY3QgdGhlIGxlbmd0aCBvZgp0aGUgaWRlbnRpdHkgbGlz
dCB0byAnMScgdW50aWwgdGhhdCBpcyBmaXhlZC4KClNpZ25lZC1vZmYtYnk6IEhhbm5lcyBS
ZWluZWNrZSA8aGFyZUBzdXNlLmRlPgotLS0KIGluY2x1ZGUvbmV0L3Rscy5oICAgICAgIHwg
IDIgKy0KIG5ldC90bHMvdGxzX2hhbmRzaGFrZS5jIHwgMjUgKysrKysrKysrKysrKysrKysr
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbmV0L3Rscy5oIGIvaW5jbHVkZS9uZXQvdGxz
LmgKaW5kZXggZDc5MmUzZWFiMDE3Li4xMTcxZWI3ZDk0MGEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbmV0L3Rscy5oCisrKyBiL2luY2x1ZGUvbmV0L3Rscy5oCkBAIC01MzUsNyArNTM1LDcg
QEAgaW50IHRsc19jbGllbnRfaGVsbG9feDUwOShzdHJ1Y3Qgc29ja2V0ICpzb2NrLCB0bHNf
ZG9uZV9mdW5jX3QgZG9uZSwKIAkJCSAga2V5X3NlcmlhbF90IGNlcnQsIGtleV9zZXJpYWxf
dCBwcml2a2V5KTsKIGludCB0bHNfY2xpZW50X2hlbGxvX3BzayhzdHJ1Y3Qgc29ja2V0ICpz
b2NrLCB0bHNfZG9uZV9mdW5jX3QgZG9uZSwKIAkJCSB2b2lkICpkYXRhLCBjb25zdCBjaGFy
ICpwcmlvcml0aWVzLAotCQkJIGtleV9zZXJpYWxfdCBwZWVyaWQpOworCQkJIGtleV9zZXJp
YWxfdCAqcGVlcmlkcywgdW5zaWduZWQgaW50IG51bV9wZWVyaWRzKTsKIGludCB0bHNfc2Vy
dmVyX2hlbGxvX3g1MDkoc3RydWN0IHNvY2tldCAqc29jaywgdGxzX2RvbmVfZnVuY190IGRv
bmUsCiAJCQkgIHZvaWQgKmRhdGEsIGNvbnN0IGNoYXIgKnByaW9yaXRpZXMpOwogaW50IHRs
c19zZXJ2ZXJfaGVsbG9fcHNrKHN0cnVjdCBzb2NrZXQgKnNvY2ssIHRsc19kb25lX2Z1bmNf
dCBkb25lLApkaWZmIC0tZ2l0IGEvbmV0L3Rscy90bHNfaGFuZHNoYWtlLmMgYi9uZXQvdGxz
L3Rsc19oYW5kc2hha2UuYwppbmRleCA3NGQzMmE5Y2E4NTcuLjM3MmU2ODQ4OGFjMCAxMDA2
NDQKLS0tIGEvbmV0L3Rscy90bHNfaGFuZHNoYWtlLmMKKysrIGIvbmV0L3Rscy90bHNfaGFu
ZHNoYWtlLmMKQEAgLTQyLDcgKzQyLDggQEAgc3RydWN0IHRsc19oYW5kc2hha2VfcmVxIHsK
IAljb25zdCBjaGFyCQkqdGhfcHJpb3JpdGllczsKIAlpbnQJCQl0aF90eXBlOwogCWludAkJ
CXRoX2F1dGhfdHlwZTsKLQlrZXlfc2VyaWFsX3QJCXRoX3BlZXJpZDsKKwl1bnNpZ25lZCBp
bnQJCXRoX251bV9wZWVyaWRzOworCWtleV9zZXJpYWxfdAkJKnRoX3BlZXJpZHM7CiAJa2V5
X3NlcmlhbF90CQl0aF9jZXJ0aWZpY2F0ZTsKIAlrZXlfc2VyaWFsX3QJCXRoX3ByaXZrZXk7
CiAKQEAgLTY5LDcgKzcwLDggQEAgdGxzX2hhbmRzaGFrZV9yZXFfaW5pdChzdHJ1Y3QgaGFu
ZHNoYWtlX3JlcSAqcmVxLCB0bHNfZG9uZV9mdW5jX3QgZG9uZSwKIAl0cmVxLT50aF9jb25z
dW1lcl9kb25lID0gZG9uZTsKIAl0cmVxLT50aF9jb25zdW1lcl9kYXRhID0gZGF0YTsKIAl0
cmVxLT50aF9wcmlvcml0aWVzID0gcHJpb3JpdGllczsKLQl0cmVxLT50aF9wZWVyaWQgPSBU
TFNfTk9fUEVFUklEOworCXRyZXEtPnRoX3BlZXJpZHMgPSBOVUxMOworCXRyZXEtPnRoX251
bV9wZWVyaWRzID0gMDsKIAl0cmVxLT50aF9jZXJ0aWZpY2F0ZSA9IFRMU19OT19DRVJUOwog
CXRyZXEtPnRoX3ByaXZrZXkgPSBUTFNfTk9fUFJJVktFWTsKIAlyZXR1cm4gdHJlcTsKQEAg
LTEzNiw5ICsxMzgsMTYgQEAgc3RhdGljIGludCB0bHNfaGFuZHNoYWtlX3B1dF9hY2NlcHRf
cmVzcChzdHJ1Y3Qgc2tfYnVmZiAqbXNnLAogCQl9CiAJCWJyZWFrOwogCWNhc2UgSEFORFNI
QUtFX0FVVEhfUFNLOgotCQlpZiAodHJlcS0+dGhfcGVlcmlkICE9IFRMU19OT19QRUVSSUQp
IHsKKwkJaWYgKHRyZXEtPnRoX3BlZXJpZHMpIHsKKwkJCWtleV9zZXJpYWxfdCBwZWVyaWQ7
CisKKwkJCWlmICh0cmVxLT50aF9udW1fcGVlcmlkcyA+IDEpIHsKKwkJCQlyZXQgPSAtRUlO
VkFMOworCQkJCWdvdG8gb3V0OworCQkJfQorCQkJcGVlcmlkID0gdHJlcS0+dGhfcGVlcmlk
c1swXTsKIAkJCXJldCA9IG5sYV9wdXRfdTMyKG1zZywgSEFORFNIQUtFX0FfQUNDRVBUX01Z
X1BFRVJJRCwKLQkJCQkJICB0cmVxLT50aF9wZWVyaWQpOworCQkJCQkgIHBlZXJpZCk7CiAJ
CQlpZiAocmV0IDwgMCkKIAkJCQlnb3RvIG91dDsKIAkJfQpAQCAtMjk0LDcgKzMwMyw4IEBA
IEVYUE9SVF9TWU1CT0wodGxzX2NsaWVudF9oZWxsb194NTA5KTsKICAqIEBkb25lOiBmdW5j
dGlvbiB0byBjYWxsIHdoZW4gdGhlIGhhbmRzaGFrZSBoYXMgY29tcGxldGVkCiAgKiBAZGF0
YTogdG9rZW4gdG8gcGFzcyBiYWNrIHRvIEBkb25lCiAgKiBAcHJpb3JpdGllczogR251VExT
IFRMUyBwcmlvcml0aWVzIHN0cmluZwotICogQHBlZXJpZDogc2VyaWFsIG51bWJlciBvZiBr
ZXkgY29udGFpbmluZyBUTFMgaWRlbnRpdHkKKyAqIEBwZWVyaWRzOiBsaXN0IG9mIGtleSBz
ZXJpYWwgbnVtYmVycyBmb3IgcG9zc2libGUgVExTIGlkZW50aXRpZXMKKyAqIEBudW1fcGVl
cmlkczogbnVtYmVyIG9mIGVudHJpZXMgaW4gQHBlZXJpZHMKICAqCiAgKiBSZXR1cm4gdmFs
dWVzOgogICogICAlMDogSGFuZHNoYWtlIHJlcXVlc3QgZW5xdWV1ZTsgLT5kb25lIHdpbGwg
YmUgY2FsbGVkIHdoZW4gY29tcGxldGUKQEAgLTMwMyw3ICszMTMsNyBAQCBFWFBPUlRfU1lN
Qk9MKHRsc19jbGllbnRfaGVsbG9feDUwOSk7CiAgKi8KIGludCB0bHNfY2xpZW50X2hlbGxv
X3BzayhzdHJ1Y3Qgc29ja2V0ICpzb2NrLCB0bHNfZG9uZV9mdW5jX3QgZG9uZSwKIAkJCSB2
b2lkICpkYXRhLCBjb25zdCBjaGFyICpwcmlvcml0aWVzLAotCQkJIGtleV9zZXJpYWxfdCBw
ZWVyaWQpCisJCQkga2V5X3NlcmlhbF90ICpwZWVyaWRzLCB1bnNpZ25lZCBpbnQgbnVtX3Bl
ZXJpZHMpCiB7CiAJc3RydWN0IHRsc19oYW5kc2hha2VfcmVxICp0cmVxOwogCXN0cnVjdCBo
YW5kc2hha2VfcmVxICpyZXE7CkBAIC0zMjMsNyArMzMzLDggQEAgaW50IHRsc19jbGllbnRf
aGVsbG9fcHNrKHN0cnVjdCBzb2NrZXQgKnNvY2ssIHRsc19kb25lX2Z1bmNfdCBkb25lLAog
CXRyZXEgPSB0bHNfaGFuZHNoYWtlX3JlcV9pbml0KHJlcSwgZG9uZSwgZGF0YSwgdHApOwog
CXRyZXEtPnRoX3R5cGUgPSBIQU5EU0hBS0VfTVNHX1RZUEVfQ0xJRU5USEVMTE87CiAJdHJl
cS0+dGhfYXV0aF90eXBlID0gSEFORFNIQUtFX0FVVEhfUFNLOwotCXRyZXEtPnRoX3BlZXJp
ZCA9IHBlZXJpZDsKKwl0cmVxLT50aF9wZWVyaWRzID0gcGVlcmlkczsKKwl0cmVxLT50aF9u
dW1fcGVlcmlkcyA9IG51bV9wZWVyaWRzOwogCiAJcmV0dXJuIGhhbmRzaGFrZV9yZXFfc3Vi
bWl0KHJlcSwgZmxhZ3MpOwogfQotLSAKMi4zNS4zCgo=

--------------0L54aPhic0AgNt6hgBCKV8Wm--
