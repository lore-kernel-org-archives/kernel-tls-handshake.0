Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33730F541
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 19 Sep 2025 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292936; cv=none; b=Dl6b741sboLAKSGTvLEm9ms1Zzs09Hwv7xwZE62OZSzxYU2xvnb4ByA7eIeYldr9frt9hM/s7MGJ0td2evawJogVfp6YJCgLWHWtish9d8yIDs6Jk+zxj+YF+nvF5GMt5D4GpQ5zmyM8kzNBbr1muBXmqxoVQxfeMtO3o3GJiG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292936; c=relaxed/simple;
	bh=HZlHpTpdK3mBVkCcSAL9bV9vZzv/zqfoBlqlG5Frizc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVVYXK7+nFgQ344ZTUP+rvNnlCqcaqHh69SqiriGUiipKO6/ljhYrxQob5LDeYl0RNF4Tc//8+VZZPcDNkZFb0YJjANVk3jT+CPkaoVYszKaZ3fKFJFw8s/xgJJiSGlO1yWhcSI3i0ta2etDHDz6KysqHiWJDxnRAcZipDtUC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRHX0D42; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRHX0D42"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1541547a91.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 19 Sep 2025 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758292932; x=1758897732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZlHpTpdK3mBVkCcSAL9bV9vZzv/zqfoBlqlG5Frizc=;
        b=gRHX0D42tsENttPQN63ZUz4W0f+tsnd8AZcPA3hvgga29v5MDB0Tl+LRfaeytdbjP7
         g/FiP5o0vUI5l/DW4H0NsfC3epvfddyCqG3pko7n1q4SqyskHoA3J6G6k05a2cy7ebnH
         24k2ehriwdEq5mIRuKo/B9wrwiK63bFnSZg9LvMgUZ5JdoOAOvupsFUZKfE7mXy1YVxA
         Mmad9hoDEXbmVq20sjduSSA9KOBErHWSDxYHVWZLkE2155fqbVXL81jJnEh/1rpacXea
         NN+MVJiDKJHKHppKFZfuZR+CB9em0rRTX1HzFywZ4fYToyrtPafaNyWaDftPNjBjjcIL
         fplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758292932; x=1758897732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZlHpTpdK3mBVkCcSAL9bV9vZzv/zqfoBlqlG5Frizc=;
        b=tKITEPNj4q2q7Eg1PNeuGmvmmygNfd0In9FvgMRwRWM9pe6LnpeIPdv2rOPBWvuR6w
         eRcnFMm//y+aoz/uDfYDN+yZEzG7xNitIg57wdOx27ZSHRnLJA7jvDboaTnaLveZrbBR
         p98tiVaKsOuZqPcCU7Xe7Cr8jVF3cxNL0VNF5zE7F6IFIyRL+HUctJMkSco2ZYNncl1y
         cNsx9PVg/TeArNnPjGycPgvpoJqugCtSaZa5dlweFR1nSQmP/Ng9EUeno6CvseCEe1PG
         e6I5rOOpjauGG+qBBxfIo6s6FfoXXYdW4t9R8BAhEIyzGjuLfHQiH6uJqmxzkiCOJID3
         WQbA==
X-Forwarded-Encrypted: i=1; AJvYcCUD9BCSSgjvbrF1f2frz44ggnN7v5nefCuEOlPJ2AF/otALL7oT5omJ2jy1Pal/8ejR/Z/eDVD/h9rKw+5Ij+B5PWP4Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfypEHLU6OkT+9wNa2L/4LTnywibDbKX10ZjHvbvGBukXNAuzl
	M8As1s9LYiUoVuuT0gjsLeKiySMMiIyCT6atrWl7ap28x3SKTXCU4BCr/OLUMc/tBXmTRm9egi3
	Kc1Lqns3wE40QJIqlowf4utDOAeEuWYg=
X-Gm-Gg: ASbGncsXUjRJTKzlJMeXQjp+GWaiPOs9wQaZV47iRoGCLGm1Nk9uKe4cO9VWXI1al1B
	sZvemEO7MmELF7HFFjTIJuLc0LcQknV0bdu1lyJqo+M/9+p7vbIaVmdRJKRH0YRngB6RWUZU/Ax
	a2IpK8e+Erh98QkNg6tRWUzbYU9rlf7sNSj379lPtqLw6uNPvsQ+4b6pflMoxVaxfYsQsIPTwrF
	SF4YpM=
X-Google-Smtp-Source: AGHT+IGo9OakPjgwrSXJF/qJMVUBdi/e7cF1r+aV53PwjCNFN9R0QdCmHkVhEX7Lqj+jz4p4vZqIYSn6l+tyCyIEnog=
X-Received: by 2002:a17:90b:1a8c:b0:32b:d8bf:c785 with SMTP id
 98e67ed59e1d1-3309834a0c4mr5086454a91.20.1758292931548; Fri, 19 Sep 2025
 07:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <c64e0dde-ce6a-4528-ad11-bfe3a90c2623@suse.de>
In-Reply-To: <c64e0dde-ce6a-4528-ad11-bfe3a90c2623@suse.de>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 19 Sep 2025 10:41:58 -0400
X-Gm-Features: AS18NWCO3T47VA_L1EGQq0v2eLMYVU-h3utg8wzRNRsnOhBYSQghROeeV9IDBfk
Message-ID: <CADvbK_d1fuyoG_F8jXNSyuicFqDxmbwSp06mkE1GvgTFkYRm5A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Hannes Reinecke <hare@suse.de>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMjo0NOKAr0FNIEhhbm5lcyBSZWluZWNrZSA8aGFyZUBz
dXNlLmRlPiB3cm90ZToNCj4NCj4gT24gOS8xOS8yNSAwMDozNCwgWGluIExvbmcgd3JvdGU6DQo+
ID4gSW50cm9kdWN0aW9uDQo+ID4gPT09PT09PT09PT09DQo+ID4NCj4gPiBUaGUgUVVJQyBwcm90
b2NvbCwgZGVmaW5lZCBpbiBSRkMgOTAwMCwgaXMgYSBzZWN1cmUsIG11bHRpcGxleGVkIHRyYW5z
cG9ydA0KPiA+IGJ1aWx0IG9uIHRvcCBvZiBVRFAuIEl0IGVuYWJsZXMgbG93LWxhdGVuY3kgY29u
bmVjdGlvbiBlc3RhYmxpc2htZW50LA0KPiA+IHN0cmVhbS1iYXNlZCBjb21tdW5pY2F0aW9uIHdp
dGggZmxvdyBjb250cm9sLCBhbmQgc3VwcG9ydHMgY29ubmVjdGlvbg0KPiA+IG1pZ3JhdGlvbiBh
Y3Jvc3MgbmV0d29yayBwYXRocywgd2hpbGUgZW5zdXJpbmcgY29uZmlkZW50aWFsaXR5LCBpbnRl
Z3JpdHksDQo+ID4gYW5kIGF2YWlsYWJpbGl0eS4NCj4gPg0KPiBbIC4uIF0+DQo+ID4gLSBQZXJm
b3JtYW5jZSBUZXN0aW5nDQo+ID4NCj4gPiAgICBQZXJmb3JtYW5jZSB3YXMgYmVuY2htYXJrZWQg
dXNpbmcgaXBlcmYgWzhdIG92ZXIgYSAxMDBHIE5JQyB3aXRoDQo+ID4gICAgdXNpbmcgdmFyaW91
cyBNVFVzIGFuZCBwYWNrZXQgc2l6ZXM6DQo+ID4NCj4gPiAgICAtIFFVSUMgdnMuIGtUTFM6DQo+
ID4NCj4gPiAgICAgIFVOSVQgICAgICAgIHNpemU6MTAyNCAgICAgIHNpemU6NDA5NiAgICAgIHNp
emU6MTYzODQgICAgIHNpemU6NjU1MzYNCj4gPiAgICAgIEdiaXRzL3NlYyAgIFFVSUMgfCBrVExT
ICAgIFFVSUMgfCBrVExTICAgIFFVSUMgfCBrVExTICAgIFFVSUMgfCBrVExTDQo+ID4gICAgICDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCj4gPiAgICAgIG10dToxNTAwICAgIDIu
MjcgfCAzLjI2ICAgIDMuMDIgfCA2Ljk3ICAgIDMuMzYgfCA5Ljc0ICAgIDMuNDggfCAxMC44DQo+
ID4gICAgICDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCj4gPiAgICAgIG10dTo5
MDAwICAgIDMuNjYgfCAzLjcyICAgIDUuODcgfCA4LjkyICAgIDcuMDMgfCAxMS4yICAgIDguMDQg
fCAxMS40DQo+ID4NCj4gPiAgICAtIFFVSUMoZGlzYWJsZV8xcnR0X2VuY3J5cHRpb24pIHZzLiBU
Q1A6DQo+ID4NCj4gPiAgICAgIFVOSVQgICAgICAgIHNpemU6MTAyNCAgICAgIHNpemU6NDA5NiAg
ICAgIHNpemU6MTYzODQgICAgIHNpemU6NjU1MzYNCj4gPiAgICAgIEdiaXRzL3NlYyAgIFFVSUMg
fCBUQ1AgICAgIFFVSUMgfCBUQ1AgICAgIFFVSUMgfCBUQ1AgICAgIFFVSUMgfCBUQ1ANCj4gPiAg
ICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiA+ICAgICAgbXR1OjE1MDAg
ICAgMy4wOSB8IDQuNTkgICAgNC40NiB8IDE0LjIgICAgNS4wNyB8IDIxLjMgICAgNS4xOCB8IDIz
LjkNCj4gPiAgICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiA+ICAgICAg
bXR1OjkwMDAgICAgNC42MCB8IDQuNjUgICAgOC40MSB8IDE0LjAgICAgMTEuMyB8IDI4LjkgICAg
MTMuNSB8IDM5LjINCj4gPg0KPiA+DQo+IEkgaGF2ZSBiZWVuIGZvbGxvd2luZyB0aGUgUVVJQyBp
bXBsZW1lbnRhdGlvbiBwcm9ncmVzcyBmb3IgcXVpdGUgc29tZQ0KPiB3aGlsZSwgYW5kIGFsd2F5
cyBmb3VuZCB0aGUgcGVyZm9ybWFuY2UgaW1wYWN0IHJhdGhlciBmcnVzdHJhdGluZy4NCj4gQXQg
dGhlIG9uc2V0IGl0IGxvb2tzIGFzIGlmIHlvdSB3b3VsZCBzdWZmZXIgaGVhdmlseSBmcm9tIHRo
ZSBhZGRpdGlvbmFsDQo+IGNvbXBsZXhpdHkgdGhlIFFVSUMgcHJvdG9jb2wgaW1wb3NlcyB1cCB5
b3UuDQo+IEJ1dCB0aGF0IHdvdWxkIG1ha2UgdGhlIHVzZSBvZiBRVUlDIHJhdGhlciBwb2ludGxl
c3MgZm9yIG1vc3QgdXNlLWNhc2VzLg0KPiBTbyBvbmUgd29uZGVycyBpZiB0aGlzIGlzIG5vdCBy
YXRoZXIgYSBwcm9ibGVtIG9mIGFuIHVuc3VpdGFibGUgdGVzdA0KRm9yIGZhc3QgbmV0d29ya3Ms
IGxpa2UgdGhlIG9uZXMgSSB1c2VkIGluIG15IGlwZXJmIHRlc3RzLCBpdOKAmXMgZXhwZWN0ZWQN
CnRoYXQgUVVJQyBkb2VzIG5vdCBvdXRwZXJmb3JtIFRDUCtUTFMgYXQgdGhlIHRpbWUsIFRoZSBt
YWluIHJlYXNvbiBpcyB0aGF0DQpUQ1AgaGFzIGRlY2FkZXMgb2Yga2VybmVsLWxldmVsIG9wdGlt
aXphdGlvbnMsIGluY2x1ZGluZyBmZWF0dXJlcyBsaWtlDQpHU08vR1JPIGFuZCBldmVuIGhhcmR3
YXJlIG9mZmxvYWQgc3VwcG9ydCwgd2hpY2ggSSBkb24ndCB0aGluayBRVUlDIGNhbg0KY2F0Y2gg
dXAgZHVlIHRvIGl0cyBjb21wbGV4aXR5Lg0KDQpUaGF0IHNhaWQsIFFVSUMgc2hvd3MgYWR2YW50
YWdlcyBpbiBvdGhlciBzY2VuYXJpb3Mgd2ViIGJyb3dzaW5nIG9yDQpzaW1pbGFyIHdvcmtsb2Fk
cy4gUVVJQyBjYW4gb3V0cGVyZm9ybSBUQ1ArVExTIGJlY2F1c2Ugb2Y6DQoNCi0gRmFzdGVyIGNv
bm5lY3Rpb24gc2V0dXA6IFFVSUMgY29tYmluZXMgdGhlIHRyYW5zcG9ydCBhbmQgVExTIGhhbmRz
aGFrZXMsDQogIGF2b2lkaW5nIHRoZSBleHRyYSByb3VuZCB0cmlwcyBvZiBUQ1DigJlzIHRocmVl
LXdheSBoYW5kc2hha2UgcGx1cyBUTFMNCiAgbmVnb3RpYXRpb24uDQoNCi0gTm8gaGVhZC1vZi1s
aW5lIGJsb2NraW5nIGFjcm9zcyBzdHJlYW1zOiBRVUlDIG11bHRpcGxleGVzIG11bHRpcGxlDQog
IHN0cmVhbXMgb3ZlciBhIHNpbmdsZSBjb25uZWN0aW9uLCBzbyBhIHNpbmdsZSBsb3N0IHBhY2tl
dCBkb2VzbuKAmXQgc3RhbGwNCiAgdW5yZWxhdGVkIHN0cmVhbXMsIHVubGlrZSBUQ1AuDQoNCj4g
Y2FzZS4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIFFVSUMgaXMgZ2VhcmVkIHVwIGZvciBoYW5kbGlu
ZyBhDQo+IG11bHRpLXN0cmVhbSBjb25uZWN0aW9uIHdvcmtsb2FkLCBzbyBvbmUgc2hvdWxkIHVz
ZSBhbiBhZGVxdWF0ZSB0ZXN0IHRvDQo+IHNpbXVsYXRlIGEgbXVsdGktc3RyZWFtIGNvbm5lY3Rp
b24uIERpZCB5b3UgdXNlIHRoZSAnLVAnIG9wdGlvbiBmb3INCj4gaXBlcmYgd2hlbiBydW5uaW5n
IHRoZSB0ZXN0cz8NCj4NCj4gQW5kIGl0IG1pZ2h0IGFsc28gYmUgYW4gaWRlYSB0byBhZGQgUVVJ
QyBzdXBwb3J0IHRvIGlwZXJmIGl0c2VsZiwNCj4gZXNwZWNpYWxseSB0cmFuc2Zvcm1pbmcgdGhl
ICctUCcgb3B0aW9uIG9udG8gUVVJQyBzdHJlYW1zIGxvb2tzDQo+IHByb21pc2luZy4NCj4NClll
cywgd2UgY291bGQgYWRkIFFVSUMgdG8gaXBlcmYsIGJ1dCB0aGVuIHRlc3Rpbmcgd291bGQgbmVl
ZCB0byBpbmNsdWRlDQpwYWNrZXQgbG9zcyBhbmQgZW5zdXJlIHRoZSBDUFUgaXNu4oCZdCB0aGUg
Ym90dGxlbmVjaywgd2hpY2ggbW92ZXMgYXdheQ0KZnJvbSBhIGZhc3QtbmV0d29yayBlbnZpcm9u
bWVudC4NCg0KVGhhbmtzIEhhbm5lcyBmb3IgeW91ciBjb21tZW50LiBJ4oCZZCBiZSBnbGFkIHRv
IGhlYXIgYW55IGZ1cnRoZXIgaWRlYXMgb24NClFVSUMgcGVyZm9ybWFuY2UgdGVzdGluZy4gU28g
ZmFyLCBJIGhhdmVu4oCZdCBzZWVuIGEgY29tbW9uIG1ldGhvZCBvciB0b29sDQphZG9wdGVkIGZv
ciBpdCBmcm9tIHRoZSBjb21tdW5pdHkuDQo=
