Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA226AD3
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 16 Sep 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500781; cv=none; b=ZepqdgsTO7EBaTHFlEPsfMjw/YNOYiUkxObWgIQJ5vJg9lv7Ve2XYBGIOcF/I2YqndfUKixR++sKuscxfA+uBc7SX5lusHsDhqeHJLXCBRnsRtxMTPTc6tIo/EKjR2+dak4Q1nykbrCmsqQaSZGVvjd0xlwv1cJzis1NbG5BoAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500781; c=relaxed/simple;
	bh=zvcSW8EuY//F/y8pECjb1mh4ZJKhb1Rn1e0qwBOj/KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VobXG+zQ8hqGh2Xw+ETmRDldXyaaWy9ctBN9gSsaBhbtqXdtvPj2eThCrucELDB/AtNoUSMGd8ctmo2MRF8bczu/+SQshFgUb1irSuC0IQMchP0/vlWBfq234EZt9Y2znE1trmMZ4pm2DR45cAlboQU9TV0/raSWXllrIhQgLnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz5UTwn+; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz5UTwn+"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-82cdb0baf19so307150939f.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 16 Sep 2024 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726500779; x=1727105579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvcSW8EuY//F/y8pECjb1mh4ZJKhb1Rn1e0qwBOj/KA=;
        b=Bz5UTwn+SPNo1YmpDHP59Q1sMKX2oc3aTpbyQjb6R4Y2DRxW6+1EnMGQqkym3nFMhp
         4QMbohwZg8h46ppYqV8mG3uV2qxy1lAf+6tQuqHUXkHbyOzHKuR6SPLzDyN+bMIM8vR0
         M4nz9uSiJEKinp0Cn2gtHTx/viXd3Z0+qXVKOzRo+0OYp/enjkfpSIp4lQ9qiAwB3qV8
         rzU2R5eT4tfbozFZlrfO3NSS8qpojXATpv27dvs/RGQjCRmtrZMIWXoZ84uNYwWyutLy
         jakOpp6QYbt8AxWC6xAqlnCwuewjI2uBf1xqbHIVdDSI4/i0tdGNWG3nSo2hjNeWLVPU
         YYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726500779; x=1727105579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvcSW8EuY//F/y8pECjb1mh4ZJKhb1Rn1e0qwBOj/KA=;
        b=DVYkMUP8f0XH/yAEV9BVEenv6uSBAl8PXjK9UXe2KppEUDH+xjtfzX3BBB+wPhycqg
         7mDz5ct2fMj8RNH8VG/Q0441rorPUd/g43NoL4wBDuhNluT+/+o8CcHaAZa/mASjj415
         BM4Lw5s3Jhr9/sV9A47u/noikRDV3Wdjcz5AGSD/eJGfuiC9rKM0k+hvmK8m7v2GDz2+
         QgxDV4GySaeV9n1EBnAHxGfdFWQJJBIjwx6MY6KcL3+hLLz5IgcMWg75ck2XueyXtJSW
         owUQTQ6gA/IfE9aUc8RGJqqD6UkWj5Jbn1+xFlItkb1aDkA9TqzvypRFFCmktJxErqgX
         4DbA==
X-Forwarded-Encrypted: i=1; AJvYcCWY16Mq1l6IYK5aW6rYc4c+1l1KQ5m3DflPABcNwxOx0NrGkZBfvjGxzEGuKC2fWoD9zNw91UTxY//psDGDaGERh8YT+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYYfh/oN75W7f6dqgKtiPFBqj1FQ/uPQMXAXAuruEj0b+67L38
	PV+ieWpLFtC2O668Bwlc5L8uZ2Bj7AAklYJIv5ee1HQqBUXplacVc+ZKX/x1UeyAF6lYgv58J/Q
	c3CJBK2N1kVQOhFRD/z29j9dt6dc=
X-Google-Smtp-Source: AGHT+IEC9cLgnKA3gDBetNOTZAhcwp0v+aK0ZR8DiMugbaWpsZg4/Mdk0aDy+B+2x8CM1Ap0e/mzZNaYMz16xK8VxKU=
X-Received: by 2002:a05:6e02:1a8e:b0:3a0:4d1f:519c with SMTP id
 e9e14a558f8ab-3a0848b0589mr145306775ab.3.1726500778933; Mon, 16 Sep 2024
 08:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725935420.git.lucien.xin@gmail.com> <ZuThZdPILnCKpOmO@pop-os.localdomain>
In-Reply-To: <ZuThZdPILnCKpOmO@pop-os.localdomain>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 16 Sep 2024 11:32:47 -0400
Message-ID: <CADvbK_e0m=kWyJJMWMf_-9bg_OS9aBnsyuRSXpOc6DzZbS2gZQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] net: implement the QUIC protocol in linux kernel
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: network dev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgOTowNeKAr1BNIENvbmcgV2FuZyA8eGl5b3Uud2FuZ2Nv
bmdAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gT24gTW9uLCBTZXAgMDksIDIwMjQgYXQgMTA6MzA6
MTVQTSAtMDQwMCwgWGluIExvbmcgd3JvdGU6DQo+ID4gNC4gUGVyZm9ybWFuY2UgdGVzdGluZyB2
aWEgaXBlcmYNCj4gPg0KPiA+ICAgVGhlIHBlcmZvcm1hbmNlIHRlc3Rpbmcgd2FzIGNvbmR1Y3Rl
ZCB1c2luZyBpcGVyZiBbNV0gb3ZlciBhIDEwMEcNCj4gPiAgIHBoeXNpY2FsIE5JQywgZXZhbHVh
dGluZyB2YXJpb3VzIHBhY2tldCBzaXplcyBhbmQgTVRVczoNCj4gPg0KPiA+ICAgLSBRVUlDIHZz
LiBrVExTOg0KPiA+DQo+ID4gICAgIFVOSVQgICAgICAgIHNpemU6MTAyNCAgICAgIHNpemU6NDA5
NiAgICAgIHNpemU6MTYzODQgICAgIHNpemU6NjU1MzYNCj4gPiAgICAgR2JpdHMvc2VjICAgUVVJ
QyB8IGtUTFMgICAgUVVJQyB8IGtUTFMgICAgUVVJQyB8IGtUTFMgICAgUVVJQyB8IGtUTFMNCj4g
PiAgICAg4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSADQo+ID4gICAgIG10dToxNTAw
ICAgIDEuNjcgfCAyLjE2ICAgIDMuMDQgfCA1LjA0ICAgIDMuNDkgfCA3Ljg0ICAgIDMuODMgfCA3
Ljk1DQo+ID4gICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiA+ICAgICBt
dHU6OTAwMCAgICAyLjE3IHwgMi40MSAgICA1LjQ3IHwgNi4xOSAgICA2LjQ1IHwgOC42NiAgICA3
LjQ4IHwgOC45MA0KPiA+DQo+ID4gICAtIFFVSUMoZGlzYWJsZV8xcnR0X2VuY3J5cHRpb24pIHZz
LiBUQ1A6DQo+ID4NCj4gPiAgICAgVU5JVCAgICAgICAgc2l6ZToxMDI0ICAgICAgc2l6ZTo0MDk2
ICAgICAgc2l6ZToxNjM4NCAgICAgc2l6ZTo2NTUzNg0KPiA+ICAgICBHYml0cy9zZWMgICBRVUlD
IHwgVENQICAgICBRVUlDIHwgVENQICAgICBRVUlDIHwgVENQICAgICBRVUlDIHwgVENQDQo+ID4g
ICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiA+ICAgICBtdHU6MTUwMCAg
ICAyLjE3IHwgMi40OSAgICAzLjU5IHwgOC4zNiAgICA2LjA5IHwgMTUuMSAgICA2LjkyIHwgMTYu
Mg0KPiA+ICAgICDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCj4gPiAgICAgbXR1
OjkwMDAgICAgMi40NyB8IDIuNTQgICAgNy42NiB8IDcuOTcgICAgMTQuNyB8IDIwLjMgICAgMTku
MSB8IDMxLjMNCj4gPg0KPiA+DQo+ID4gICBUaGUgcGVyZm9ybWFuY2UgZ2FwIGJldHdlZW4gUVVJ
QyBhbmQga1RMUyBtYXkgYmUgYXR0cmlidXRlZCB0bzoNCj4gPg0KPiA+ICAgLSBUaGUgYWJzZW5j
ZSBvZiBHZW5lcmljIFNlZ21lbnRhdGlvbiBPZmZsb2FkIChHU08pIGZvciBRVUlDLg0KPiA+ICAg
LSBBbiBhZGRpdGlvbmFsIGRhdGEgY29weSBvbiB0aGUgdHJhbnNtaXNzaW9uIChUWCkgcGF0aC4N
Cj4gPiAgIC0gRXh0cmEgZW5jcnlwdGlvbiByZXF1aXJlZCBmb3IgaGVhZGVyIHByb3RlY3Rpb24g
aW4gUVVJQy4NCj4gPiAgIC0gQSBsb25nZXIgaGVhZGVyIGxlbmd0aCBmb3IgdGhlIHN0cmVhbSBk
YXRhIGluIFFVSUMuDQo+ID4NCj4NCj4gVGhpcyBpcyBub3QgYXBwZWFsaW5nLg0KPg0KPiBIb3dl
dmVyLCBJIGNhbiBvZmZlciB5b3Ugb25lIG1vcmUgcG9zc2libGUgYWR2YW50YWdlIG9mIGluLWtl
cm5lbCBRVUlDLg0KPiBZb3UgY2FuIHRoaW5rIGFib3V0IGFkZGluZyBpb3VyaW5nIHN1cHBvcnQg
Zm9yIFFVSUMgc29ja2V0LCBiZWNhdXNlIHRoYXQNCj4gY291bGQgcG9zc2libHkgY2hhaW4gdGhl
IHNvY2tldCBmYXN0cGF0aCBvcGVyYXRpb25zIHRvZ2V0aGVyIHdoaWNoIG9wZW5zDQo+IHRoZSBk
b29yIGZvciBtb3JlIG9wdGltaXphdGlvbi4NCj4NCkkgaGF2ZW4ndCBoYWQgdGhlIGNoYW5jZSB0
byB0cnkgaW9fdXJpbmcuIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIGl0DQpkb2VzbuKAmXQgcmVx
dWlyZSBhbnkgY2hhbmdlcyB0byB0aGUgcHJvdG9jb2wgc3RhY2sgKExpbnV4IFFVSUMgZG9lc27i
gJl0DQpzdXBwb3J0IE1TR19aRVJPQ09QWSBhdCB0aGlzIHRpbWUpLg0KDQpUaGFua3MgZm9yIG9m
ZmVyaW5nIHRoaXMgc3VnZ2VzdGlvbiwgaXQgc291bmRzIHdvcnRoIGV4cGxvcmluZyB3aGVuDQp1
c2luZyB0aGUgUVVJQyBzb2NrZXQgaW4gdGhlIGZ1dHVyZS4NCg0KVGhhbmtzLg0K
