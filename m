Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388A31716B
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526813; cv=none; b=S+PYHJRBiPg4atAneWmsfnTTmpsTciGlPNphVjF4OBi2/x/42Nwqu3qv4h+8Ukqbf7JdQXsuQjWIxmWGJr1QLMG6K/q9q8ikX7Xf0+MFImB3jMJp94hUdlUvBWUB++vqKs/f61wzaIImACA+Zh1WoDZlWRMBxdDzDO1yG00CsWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526813; c=relaxed/simple;
	bh=7e1yDpYF6SGz8bqZAjDOfP6guXaqYXTCYT8R/l9fM+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=nC2knCCGB3VtLGd22fPdfnzYQ1zKBLRTVtmj1Iqjtik8SVgBoRRWlBKCLmF/32f0UbuQD9e96BpvZw0/0r7n7iSiWQ3hGmKhzguVOHlTQBPXCjTvSRxq5IhWlo0AlqlnjIDldWQCzqbZieVZ6OGkANVj4Wgxv9ytNobQWKmTwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewBjsdh4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewBjsdh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772526811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyaeLaLjzjr3AXwTXjTh2ueQGfSZ87YiwHi2MuZIbh4=;
	b=ewBjsdh4iAUAHCZLc1QjzYQfpDicZwko+fuuykoyxfJUQjjXWmqGpsbuzMw/NS9xEQhWjy
	izwCbW93D5xoVvl8o5Cisldjm7x3vs2L2s15Q1s3kTpua/hK8l7wdkfOG95dUICQ5imb03
	pR6bWaGBTdkkvBxokaUbTE1V6cumaW0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-BEbWcH2JNuq0HiwotdlvBw-1; Tue,
 03 Mar 2026 03:33:28 -0500
X-MC-Unique: BEbWcH2JNuq0HiwotdlvBw-1
X-Mimecast-MFC-AGG-ID: BEbWcH2JNuq0HiwotdlvBw_1772526805
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21F3F19560B2;
	Tue,  3 Mar 2026 08:33:24 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.134])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 744E61956053;
	Tue,  3 Mar 2026 08:33:13 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: lucien.xin@gmail.com
Cc: hepengtao@xiaomi.com,
	kuba@kernel.org,
	jlayton@kernel.org,
	metze@samba.org,
	davem@davemloft.net,
	kernel-tls-handshake@lists.linux.dev,
	horms@kernel.org,
	hare@suse.de,
	aahringo@redhat.com,
	tfanelli@redhat.com,
	mail@johnericson.me,
	andrew.gospodarek@broadcom.com,
	linkinjeon@kernel.org,
	dhowells@redhat.com,
	matttbe@kernel.org,
	xiyou.wangcong@gmail.com,
	dreibh@simula.no,
	jbaron@akamai.com,
	quic@lists.linux.dev,
	pc@manguebit.com,
	marc@fiuczynski.com,
	edumazet@google.com,
	pabeni@redhat.com,
	alibuda@linux.alibaba.com,
	steved@redhat.com,
	illiliti@protonmail.com,
	tom@talpey.com,
	marcelo.leitner@gmail.com,
	sd@queasysnail.net,
	linux-cifs@vger.kernel.org,
	netdev@vger.kernel.org,
	mbuhl@openbsd.org,
	smfrench@gmail.com,
	chuck.lever@oracle.com,
	daniel@haxx.se
Subject: Re: [net-next,v10,12/15] quic: add crypto packet encryption and decryption
Date: Tue,  3 Mar 2026 09:32:55 +0100
Message-ID: <20260303083255.35354-1-pabeni@redhat.com>
In-Reply-To: <3c6ae7299c2fff0fa689d4dcd43ef916e5697d65.1771986861.git.lucien.xin@gmail.com>
References: <3c6ae7299c2fff0fa689d4dcd43ef916e5697d65.1771986861.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: rwqgJRDsqCucbLpr0etJqe0NctCNwODcyENG6a6ud7Y_1772526805
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
quic: add crypto packet encryption and decryption

This patch adds core support for packet-level encryption and decryption
using AEAD, including both payload protection and QUIC header protection.
It introduces helpers to encrypt and decrypt packets for secure QUIC
packet exchange and address validation.

> diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> index a9de418e604e..a84fd8d7bf93 100644
> --- a/net/quic/crypto.c
> +++ b/net/quic/crypto.c

[ ... ]

> @@ -231,6 +562,137 @@ static struct quic_cipher ciphers[QUIC_CIPHER_MAX + 1 - QUIC_CIPHER_MIN] = {

[ ... ]

> +/* Encrypts a QUIC packet before transmission.  This function performs AEAD encryption of
> + * the packet payload and applies header protection. It handles key phase tracking and key
> + * update timing.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int quic_crypto_encrypt(struct quic_crypto *crypto, struct sk_buff *skb)
> +{
> +	u8 *iv, cha, ccm, phase = crypto->key_phase;
> +	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +	int err;
> +
> +	cb->key_phase = phase;
> +	iv = crypto->tx_iv[phase];
> +	/* Packet payload is already encrypted (e.g., resumed from async), proceed to header
> +	 * protection only.
> +	 */
> +	if (cb->resume)
> +		goto out;
> +
> +	/* If a key update is pending and this is the first packet using the new key, save the
> +	 * current time. Later used to clear old keys after some time has passed (see
> +	 * quic_crypto_decrypt()).
> +	 */
> +	if (crypto->key_pending && !crypto->key_update_send_time)
> +		crypto->key_update_send_time = quic_ktime_get_us();
> +
> +	ccm = quic_crypto_is_cipher_ccm(crypto);
> +	err = quic_crypto_payload_encrypt(crypto->tx_tfm[phase], skb, iv, ccm);
> +	if (err)
> +		return err;
> +out:
> +	cha = quic_crypto_is_cipher_chacha(crypto);
> +	return quic_crypto_header_encrypt(crypto->tx_hp_tfm, skb, cha);
> +}

This function calls quic_crypto_payload_encrypt(). Looking at that
function:

> +/* AEAD Usage. */
> +static int quic_crypto_payload_encrypt(struct crypto_aead *tfm, struct sk_buff *skb,
> +				       u8 *tx_iv, bool ccm)
> +{
> +	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +	u8 *iv, i, nonce[QUIC_IV_LEN];
> +	struct aead_request *req;
> +	struct sk_buff *trailer;
> +	struct scatterlist *sg;
> +	struct quichdr *hdr;
> +	u32 nsg, hlen, len;
> +	void *ctx;
> +	__be64 n;
> +	int err;
> +
> +	len = skb->len;
> +	err = skb_cow_data(skb, QUIC_TAG_LEN, &trailer);
> +	if (err < 0)
> +		return err;
> +	nsg = (u32)err;
> +	pskb_put(skb, trailer, QUIC_TAG_LEN);
> +	hdr = quic_hdr(skb);
> +	hdr->key = cb->key_phase;
> +
> +	ctx = quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> +	if (!ctx)
> +		return -ENOMEM;

If the kzalloc(GFP_ATOMIC) inside quic_crypto_aead_mem_alloc() fails,
this returns -ENOMEM without rolling back the SKB modifications. The
SKB is now permanently enlarged by QUIC_TAG_LEN (16 bytes) with a
modified hdr->key.

Compare with quic_crypto_payload_decrypt():

> +static int quic_crypto_payload_decrypt(struct crypto_aead *tfm, struct sk_buff *skb,
> +				       u8 *rx_iv, bool ccm)
> +{
> +	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +	u8 *iv, i, nonce[QUIC_IV_LEN];
> +	struct aead_request *req;
> +	int nsg, hlen, len, err;
> +	struct scatterlist *sg;
> +	void *ctx;
> +	__be64 n;
> +
> +	len = cb->length + cb->number_offset;
> +	hlen = cb->number_offset + cb->number_len;
> +	if (len - hlen < QUIC_TAG_LEN)
> +		return -EINVAL;
> +	nsg = 1; /* skb is already linearized in quic_packet_rcv(). */
> +	ctx = quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	sg_init_table(sg, nsg);
> +	err = skb_to_sgvec(skb, sg, 0, len);

In the decrypt path, quic_crypto_aead_mem_alloc() is called before any
SKB modifications. Should quic_crypto_payload_encrypt() do the same to
avoid leaving the SKB in a modified state if allocation fails?

[ ... ]

> +	/* Similar logic to quic_crypto_payload_encrypt(). */
> +	memcpy(nonce, rx_iv, QUIC_IV_LEN);
> +	n = cpu_to_be64(cb->number);
> +	for (i = 0; i < sizeof(n); i++)
> +		nonce[QUIC_IV_LEN - sizeof(n) + i] ^= ((u8 *)&n)[i];

This isn't a bug, but there's duplicated logic between
quic_crypto_payload_encrypt() and quic_crypto_payload_decrypt(). The
AEAD nonce construction sequence (memcpy nonce from IV, XOR with be64
packet number, set CCM byte) appears in both functions.

In quic_crypto_payload_encrypt():

> +	hlen = cb->number_offset + cb->number_len;
> +	memcpy(nonce, tx_iv, QUIC_IV_LEN);
> +	n = cpu_to_be64(cb->number);
> +	for (i = 0; i < sizeof(n); i++)
> +		nonce[QUIC_IV_LEN - sizeof(n) + i] ^= ((u8 *)&n)[i];
> +
> +	/* For CCM based ciphers, first byte of IV is a constant. */
> +	iv[0] = TLS_AES_CCM_IV_B0_BYTE;
> +	memcpy(&iv[ccm], nonce, QUIC_IV_LEN);

And in quic_crypto_payload_decrypt():

> +	/* Similar logic to quic_crypto_payload_encrypt(). */
> +	memcpy(nonce, rx_iv, QUIC_IV_LEN);
> +	n = cpu_to_be64(cb->number);
> +	for (i = 0; i < sizeof(n); i++)
> +		nonce[QUIC_IV_LEN - sizeof(n) + i] ^= ((u8 *)&n)[i];
> +
> +	iv[0] = TLS_AES_CCM_IV_B0_BYTE;
> +	memcpy(&iv[ccm], nonce, QUIC_IV_LEN);

The AEAD request teardown pattern (EINPROGRESS check, kfree_sensitive,
memzero_explicit) is also duplicated. Would a shared static helper for
nonce construction reduce the risk of the two copies diverging during
maintenance?

[ ... ]

