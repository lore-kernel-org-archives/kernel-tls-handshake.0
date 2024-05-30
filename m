Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDD7EEED
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 May 2024 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096705; cv=fail; b=c+CjNM7N9j01SA1ZSIAYRPNnM5UBNVzEUkLjZ5TN2DQS22CExACgsufx+X9jCh1cLktP3Xje5qc3qyS07rx66VBMETvqkvmp35vdWsmzipMQ47/mfB78JIJFxWuaGCust/BXs2MC2Xo5kGBjtXwzaMUjMV5qTaocC9tu1DxuR8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096705; c=relaxed/simple;
	bh=QnqtTsDOWzdlBWKLxAu15J01ExPbH1rgM6eWun8XZ8c=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d21YrHbq8iDIDYrZbJVSd7rR4F2gW1FhxGGiPuXXlalSCyxboo/4+AeuB4f5gjRgLGAPdkdx5XhfF87iD8z0goU4mshcsSfxmHSIb3SujeGW28tbtnZz8iAAoHlmHrznp8aMQl/aye8zgn7BrE8lKu+VW4yDmCpWltqOj5shhhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44UEf0cQ001870
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 May 2024 19:18:22 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-id:content-transfer-encoding:content-type:date:from:?=
 =?UTF-8?Q?message-id:mime-version:subject:to;_s=3Dcorp-2023-11-20;_bh=3DQ?=
 =?UTF-8?Q?nqtTsDOWzdlBWKLxAu15J01ExPbH1rgM6eWun8XZ8c=3D;_b=3DIoDqaVWIgCVM?=
 =?UTF-8?Q?aCSeHmVOfrnZi3tDC32D0BJEwCb850qGqBbgWfQymgnS/swYNGdjNjdp_tKMZtp?=
 =?UTF-8?Q?MnH1D1AqP6iG6flsdIpwKA6eEOuZRrfPGNu6zrhiuuihkY9OrAOe72CJYiRRpq_?=
 =?UTF-8?Q?AtMgqtG66oKeS5s6X+g0vwKGUphGFQLp6CfcuuL6ECQV5RwolUVErPraDi1Itde?=
 =?UTF-8?Q?jUbLe_brFXzuNNMYYHPicIj9xWB5JrziVSyeq0++aS7Z3g7pMrU5luYMQ/TXgJR?=
 =?UTF-8?Q?Rj0GcbZ7Edg_dMd6mGhkSGhLwthNF7sSP4koTUp7u+lAiRl+mOP02ioCmhn7+Ot?=
 =?UTF-8?Q?3fnBYm83ZP9yG8X5r_jw=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8fchsyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 May 2024 19:18:21 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44UI4195024190
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 May 2024 19:18:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yc52ea1uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 May 2024 19:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgLUY6GyTkq97NZVAknv8iL0K/SgcqflDBNnnm7rruA0Ru0UqGO5Ad3m/0/Q1zOiMERTHhUevmn8XTyxb7TH/GOz0MLF7HxfYQgP43hVNf5c42AMT9SIGWt/YAarEwPBCOECCnAkVkI7os7lzqKKukVh1wlT9Hjchdl2AjBJKQqXW2KZsCgUMk0shqxG9lnYOnR4W9UFsAOvovHrCyGv+Q7LduVKE41N3OjFpl8ToK3CV2QOgWgQI5IRNk7GEqROHIh/mNjXoJQ/Z97uG7keDGjO3GPnHKf4iKacPAXJzgKafrY4nYqaXU/EWcDeWApXerHDidm9ibgRo+5dEt5M6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnqtTsDOWzdlBWKLxAu15J01ExPbH1rgM6eWun8XZ8c=;
 b=RMAfnm3DBYBL+d+9wyy352gpMth+D1j+p3OS/H5i/zMBy9Ps+hBh3cQ0eGLCfZONcai5ECXSAvofBcIricG/0WAz6Vdyb1glauK9zmI3A+gkhZOsdTlNiX4sNwIlUASbfCY3trDPlDP34HMZSotgdKGYaT83GlqX5v6uZ47c7R13Oh/2Rv1j4MnfcFExHQiGweW1DHj/GCe7knHrI0Uu1tCER1cfsDc34PSB3mxlhX321zlxsCjVKwviYkdLJXFswk9yzaqYz8eEpw/vgiuOKSik1hnvIDyN1A9uPjznNk8ihjvAYjh2gjiI3wxJfuSbqfojZEGsbfbjYAxeHWZ9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnqtTsDOWzdlBWKLxAu15J01ExPbH1rgM6eWun8XZ8c=;
 b=a+jjb4oT3dPY2+KDTWMYsGvFxb+Gm1zz+pL8xPdmXRB73nswXt+Q8PUqZJwJ+u67PoRfDPzM6GMfAWd5jG9kESHTH0+HCH6L89h6QbcCHNelVXNSYYVzPRRLsR4mvXnEoqaIoiNK6HiFz1n8a3bSCfDidiUej8XqWMl+suhcskA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ2PR10MB7734.namprd10.prod.outlook.com (2603:10b6:a03:56f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 19:18:15 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7611.025; Thu, 30 May 2024
 19:18:15 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: populating keyrings at boot
Thread-Topic: populating keyrings at boot
Thread-Index: AQHassYee8lGzxmop0KwLfG+1DBsAQ==
Date: Thu, 30 May 2024 19:18:15 +0000
Message-ID: <A5F0FE09-E9EC-49D6-8D84-610EC801B877@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ2PR10MB7734:EE_
x-ms-office365-filtering-correlation-id: 7eb0c2c4-a3f7-45c8-b53d-08dc80dd4164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?I404ayvIXROWlFKJ0vYW595vFgAsI8TR+ciEsRWbBr4wXFLU0sMyjQdwkgLh?=
 =?us-ascii?Q?jPxq41UVCMM1gGjDDf3cL1j4W458nrHk2P7phRi5BkSCr6Hjf2b5CCttQZBG?=
 =?us-ascii?Q?qsEfOKa8wOU29PBJ3kwdKYXcK0xCrInkRBIXqWImTO8uLmUL/y8Kqo5Cfvvh?=
 =?us-ascii?Q?WTScEZTxSGGlVuWTtTlDGUls+RMKry6QXBLdLaDSE9bcgX1Rn+N08MRC8Rro?=
 =?us-ascii?Q?Wrs59DK5N1Ikd29alcWkKOD4iVW7GFn9DxpPHVwuI4iY5+T4lPAOo8feMZom?=
 =?us-ascii?Q?57Z5QacWj+22rYWz/wxFQIv2LENPxg+Qj0afYm6G3l8TCER0eNjKDuP+UD4n?=
 =?us-ascii?Q?m1+HdN11KsXVN2aZ/IJgyxS3kAY1ttrt2LsXzDjZ1dpc7NUo3kXh2JwGJ8s1?=
 =?us-ascii?Q?2BbGFTbxfoyJTGWYAu3qKkAW6Jms+cAIa/q3Z9ouHH4M/8LTMYqzEJ/KVQlM?=
 =?us-ascii?Q?ClgE7LK4Od/8vvJCrTrAu9AVrKnvv4jUFWlIX3SA0LoBzpGvaWXL5ADtBc1f?=
 =?us-ascii?Q?yJZvDahmQdVHMUacyiweBtx69jrpH3vcDaRuR+YrBSVgo7NkXOdaiAjY5l6q?=
 =?us-ascii?Q?fJHfNa8eUjqUAtVeOP9uQXlDk9HSZY60gLcOVlgFN0Gr90rRknzJ1+Muioy6?=
 =?us-ascii?Q?df0w5u5NCz3CFSl26r4qELN79qyN/waLB1iy2xNsZQTIS2H5SFWWA5jDVi6c?=
 =?us-ascii?Q?GbK8b20Zf7rwvLF50KiqdScrYMGEJ2NI4CgkmPzRHwYaXbcqyD7pbLlcJFkr?=
 =?us-ascii?Q?vABZAX76LUmlWL1fUw2+OyT4z5CJ7G3hlQHn3pngVU1FF+epTGRVldCBQWX+?=
 =?us-ascii?Q?3zl3VzREdeZNmAFU9uDUd60vspXVtw0ptqh3sIRhlFdxmJ9ZpyPtRQYFL31X?=
 =?us-ascii?Q?N690uJe62lWlww3Ak76S0Modj56BsSvXM745t+5Kg+tHWJYugLcPmeaEMghe?=
 =?us-ascii?Q?FuBVRjV/9CywgEgmewDS42K5M/nH7gR574W0oJCXSZTPurJom6CyP+W3+ijm?=
 =?us-ascii?Q?2E4IyhvZ8nzNc/ke/vXjprP4KrsHs9jWyPdF2cQkI+5ZKHhebG6tm86KB6V/?=
 =?us-ascii?Q?Wg3xf2x1cQ/AZRjFP4dkQTWX0dHEVx7S8+CmE/247mrSED4tKHI/L/pspkQO?=
 =?us-ascii?Q?R2wgfnJfxjynkpaEqTtepYSYVdHaJeAdeQnn/anGVcnMCsPgZBDcr5IaZu2X?=
 =?us-ascii?Q?wmtaSXQ9Vzh4HlcWLs5XLLxRpkvCnMg8dXbbE8HtmwA77jdWN74ZvUZ6/mC6?=
 =?us-ascii?Q?jKYyB4OnCWnWZOcZEDOCqS+VVb3OE4tn/dk+Mrk/LA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2B5TRRRrqkcCNOf3iQp/1Qv3qhVq7i5td0yHMWeyy/n2XW1ngR57QeaHOHzE?=
 =?us-ascii?Q?iHQGifgvRKicFk3J85Y360dPMui32nf515BDwkKsvh9wsz7/BfILKVuH9L+D?=
 =?us-ascii?Q?/71r5KphnPN/3UNIbp6qas/ZBTESB5HJZee9sd7iotvAFckmg67gZ0b0df4x?=
 =?us-ascii?Q?c0J76QZU/Ip4yr7EaBmf1Ln3+y1SCAbFE1IVrFTIwuVWbPmzZJKA2Bq/L3K1?=
 =?us-ascii?Q?yZBN9A6H5SD8aCrebw7D9m488dPPmOn/KqwCKmSmauNhdvTkll+SlvVInhqE?=
 =?us-ascii?Q?5Php5VmGmB5p2tLwe0lHQZuhEsK6obOvF98vwT1Mx76u2f5a3cFQH0UBo4Ty?=
 =?us-ascii?Q?N+bI9HXbS8S84uzzjYGzRnj9RW1By1WLXDeQKE0TvSby6XSpjS2ZKnoq9VKQ?=
 =?us-ascii?Q?+8iC1lkdoEwnibDrUaZuPbJphopXJmEtx7K+Tj+6OwtfxBm3f1VTihHNjVn8?=
 =?us-ascii?Q?euBMBUkoLWb7Y6dIAs9Lhq89IHuWi0x7X/IqKzSGSMAB50PNnkEXcKtD+NQu?=
 =?us-ascii?Q?isObG+4ZzwMv/j0SSyRGtb+Ovy0s4lOo8szRuY1TtVQTOQ5yY3HgBljKnGQM?=
 =?us-ascii?Q?ADrUaY/1jmoacpVAr1jPZ6xIRF6p3WLTUoimkMKQAF1UKu//qH1amBPVPAmG?=
 =?us-ascii?Q?/g9x2wxsTrFYuCYO2eaRSB9E9+N6Q8BFGnyPcuzoKfVu1Mty8CB6Yu0veoNY?=
 =?us-ascii?Q?wVtBGm8R64RJree8Rx4xwxSXDun4D1LzF3fM/qD8LRjdGuZk2ld9e3lU9hhd?=
 =?us-ascii?Q?wEfm5VnYLtoU9qTZ0dQtYB+gFaAsYanY/PUYa6sCFyZtSSXY3O7MT65WDs/V?=
 =?us-ascii?Q?oPyW7PEE3y7N0XI4tgWupXHpHXwHqaR/iQbUFCcNvEbAXL02Tc+AaSViwTEr?=
 =?us-ascii?Q?3HODMY4eC/NKCK+yI9YVPGWJvoFQV9xjlCpBkA4cn8ZxH6zzg3SxMPb2Nivd?=
 =?us-ascii?Q?2CSYeJ4VTxRMKa16p145UJkymInIMcW7qj9t7/wZv3RI2V/w3HfMOvnMXqiz?=
 =?us-ascii?Q?m6gpNdNrpeAjO0EcIZJCO1Av4iXIupbCgD/Jz2ZM0coscW9jcF5uVT+EUGis?=
 =?us-ascii?Q?m4D0hDcZh9i9pXaVk0ke6achVlNVQkXJSY+4iqNtWt1w+F3nUBzL66icQu6K?=
 =?us-ascii?Q?WN7YPx1m+Wx1B8/OhA9Z2Jw3szl+Dp0Nq9/E19c5eyrg00RYIBOdRi/1OLnr?=
 =?us-ascii?Q?fcmXT0pIgbD4qjx9e0iaNp4A8uHC16q51MYHhNpqQPSMyWvGy4+ojHrMj3X+?=
 =?us-ascii?Q?I1HwPKF9ToaUffTCgAcCZ9ic8gIL2SfjWuKA136dUTAGz+qkF6ykCta91bWR?=
 =?us-ascii?Q?eWTduI6EQdmkPkFgGveIBY/Ag2S0OaN7NqiCnThoBRnwA5E6nx/+wZ7k/awZ?=
 =?us-ascii?Q?0tORxrY1z1c7n6SfAK5ShU64VLhHc804K8HEUBkXAswjDjyiI1G/+nsyeceZ?=
 =?us-ascii?Q?ebWmkz8mOsMNvb5eHRbxokG4YPQgg9N6Ur0SgncYPs0KzJKDtn+K8GirINHw?=
 =?us-ascii?Q?Q/UDSB7gjiXF03Si81KfS8sQkftEnqRWAKOyoqCxf3Q4/+jYF7l2ZG21KfQY?=
 =?us-ascii?Q?pclpVwOACZ3igcM8iGqbfoPwkeG19hzeKX4R6rWuY6XFNdtd5CFA+tnzDzvA?=
 =?us-ascii?Q?8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD82F06987C9374F945DE81B1DA512CF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7NQzhGKnnxrN9norzSf8LFarQcvdC7AAVg5cgFCAEY8al1dQ8odoLtLyO4Mu5rlXiX0xuWlf8ACdrt9SwGpnrFW3HQdiZBDYA0tvtxM/9qfVAZ9eLES3g711o+lbi6E2HL2Sz6bMYDQtc+SYxHx2LYL/PtSRnJV3KhvY1tn7DYZOw9ZZfd8ojjwDMRuZoFobJ7FZaXxMXWtY9pWbv/lpz2YK/ckMj8bpopmt/b+MtjnGa1yFRHTUZLCa9ZkQWVBv34L7K60CHx1/HWTiXpXooCBFmwvq7foVNiDS1yRnUZD4uZ0Jy7juYgsZHgVRbPhJ68VwKq1SBGZPmvWAzoETM8bgahpaCtWulVEfU41U8l7lueofUEVE+3sr8DGs0QvXViwiFdfXK//AvPmTfm51Uv7USt3upGpFljHgGThDOzItzxPJykJMYheQRhMCjJWsBPo1RUSzTDQzIGhS1fTLgCzOu+wx6dNpQ+s9iDWba3MS96jY94zPxZ/nrfHkCWaFREsb9BS6Q3Szquv60SPQqrz/XilUweA1xlF5FUdMIgwvIGZzICRiBvV8tFB1CCTatFwi+ZFqLsP+DawKs1dA03Vcu2W5m+72n3UWd4nyd8o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb0c2c4-a3f7-45c8-b53d-08dc80dd4164
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 19:18:15.2958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/YaISo675W+eynZKQP0l5wOuOuoLO0gUQBTganc71XvVLCgMMUM4y16k8G7ebyJWsZsXGye3Qp12SRvz8jwRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7734
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_13,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=801 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405300143
X-Proofpoint-GUID: a8xVBqz8uZQ1qGK_D0IkvKc9F6agETTb
X-Proofpoint-ORIG-GUID: a8xVBqz8uZQ1qGK_D0IkvKc9F6agETTb

Hi-

Had lunch with Lennart during LSF, and he suggested that
we could store keys in the UEFI firmware, and have systemd
load them into a keyring during system boot.

https://systemd.io/BOOT/

We would then need some mechanism (yet to be invented) for
admin tools like mount to find the right key and keyring
to hand to tlshd, which already supports reading certs etc
out of keyrings for a handshake.

Thoughts?


--
Chuck Lever


