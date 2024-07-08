Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8999132132
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  8 Jul 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720460428; cv=fail; b=BGFq2DjhAU6JAmFU5LpEXPQUSTQR8VUXn5BSq4Qdh80R6UQQj9FEfPzhWFIp7XsKwoWahWv2hlNyuioAr4+YqVxWWn0BrKbMgtj5WzmVNB3wlNoiaXTstWqcGNDtNZ5GsrnlekWGg+WBYySWO5N3fi3C/0+BKOxGV0SSkuQLFF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720460428; c=relaxed/simple;
	bh=7Wnq3zg6dt35sQkh+8YCXi9HsrFvJX4zdbdjVg/R9vc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VeGSzfkN1GgvyHItiq9kNqr8I9nCKJbyYXW8yzW6dDPZqCKDevnG0OySSNzLQK8VDRx9RAty1cTgDdCKZ+BtF7yZgUyIVVer5XEikX4+AKVYUNL2QbMeofJtVUF2ZlovxtrbrZYHHBHRDNV2u0T9J4hH2X1bnjXfTvHWEd2fzzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TkWMQxLO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FhiJ5iJc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TkWMQxLO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FhiJ5iJc"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468HXWjW005993;
	Mon, 8 Jul 2024 17:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-type:content-id
	:content-transfer-encoding:mime-version; s=corp-2023-11-20; bh=5
	m8Dvc1kbe0zurQAQ4rvjnH7mafBnn8/hEpe0tKOTRY=; b=TkWMQxLOXOxwpADnG
	rY8UmS3qgClUys80JaN8I4W1smlN8BuTJTB8SJFEAXOID5PwJuAqtvmSgmGtV82a
	MPQ4Rfb/Cz7z3JIcw6ZVI4oN28+KUKOIW4wCl5HZkyo2SYBL16d1I6U/acxCo2qZ
	4FQajD61ULoWSe878hncvW09wetWwUyvctwhMRAL0UTNSfrLGMD7MG5Mw2sxRkP4
	GM3amUDJ7a1HMihGaGwxZywr4EXP5PTqz1fqSoXghNk+WZB3rFqlvGjebCDRSDm5
	ewPKifusXqsMoGvMlqoK/BpIDo4zJaH8XH2NSLZPM0TCgQSHnMDOgwBIYDkjEPoX
	Pzpdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 407emstkxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2024 17:40:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 468GH0nf014401;
	Mon, 8 Jul 2024 17:40:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 407txfr02f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2024 17:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9J+mN0hCSalKdzdDKJItCbbw/ZZkAlgtyN1MTQan1/sBGCTPmiAZ0Qua21SouGlh0Es/z/GM+RcjgbhszviEhnKMP5iYPBv5DdgFkmX0Jux7Tq0iqIGcJdZgUwfNsFyq0pU6B33xqqB41lGQMaf3opTtW6Rw1LAT/ViCP8sTMek1ZZCvdbkfmr0jOXl3V/7jDZ9OiSJI6+7FwoHfPwEfaKoQN1EStdVBxY8x0kuiPVmfaoXTUYa+X92oKIwIJcKlf1kHI/qa6bvhfWLH0yapwPdbWzKwsETeUQAXlhQf3iGrLyYQWmBcPe8rRnODetkrUItYgVd6KrfxpJCQL+TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m8Dvc1kbe0zurQAQ4rvjnH7mafBnn8/hEpe0tKOTRY=;
 b=ib0gSkZxiG1lr8qfL0lO+fgLzFero13KEUUhwoFD2u+o6zk/gIszVWR/rdvWiZaLCB6GHGKlQcSnMibEm882i1rRr8EKGRDNFeQ4bXcUCxQiKXY8HVujH7sVLbBVzlvxANFv0f28p5/NSiFW9v8yjNmIhAKk3VEjPbqIYAO7NFZZHY7BKKQJKZ7UO0NG/TUgGv3Ak5HhLfpER7qOW90yGhCSG0LqpdrlZ8qzFYT5Asqx+JWdK04udNPQpvf+322fFiDpxLWpmfUv0gtb0cdDbWvdZC5z5JpS5zfD1Gk1SnO9JvBMtIdE2MrFMI/Q4yFv42WRIB2iQG3IjuvbyQj7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m8Dvc1kbe0zurQAQ4rvjnH7mafBnn8/hEpe0tKOTRY=;
 b=FhiJ5iJc+ILzg3rHH+DFTYcHn3eX3TpKH86W36O36jZZ4/Wsg2ssu2gQWWknDQ5wJk7w5FpKrlE5iTt8Br9dJ6Zt2fi2FTXz9+aCsXucrJlEWWImTwttqc0mFjVEHKuij211Cy2VFWf9C2O/7RUD9Tb81nNIXhvWO7SckIs1TRE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6402.namprd10.prod.outlook.com (2603:10b6:510:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 17:40:20 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:40:20 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
CC: Steve Dickson <SteveD@redhat.com>
Subject: patch review for upstream ktls-utils
Thread-Topic: patch review for upstream ktls-utils
Thread-Index: AQHa0V3n0qHM0nMtk0iQL//czH+z0Q==
Date: Mon, 8 Jul 2024 17:40:20 +0000
Message-ID: <EDDA7FA4-FEDF-4687-A6A6-112D9CEC90FA@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6402:EE_
x-ms-office365-filtering-correlation-id: 29634e8e-52dd-4f3a-8bb9-08dc9f7509f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XfpCOY7BlE0KEq1Hwa0W2cXZVDJOJ0KDs8tmXd9Bg2BNoLP4sKwqVElFP/Tw?=
 =?us-ascii?Q?WzMowKzKZU3ynZxP+uelszEzznGGJvoYlzD0PLCVbUs8o6kKdGEGvFRV5Uli?=
 =?us-ascii?Q?vBwf5rgnS3VVEXHDGiyIhwni1vFLMZMMBi333v3jen/zRrpLju126FY+RN5E?=
 =?us-ascii?Q?mpyRnGV2OKlegqkSq3GGDXjoVrzLe2mcCgRxWczh/3xDRL1W9kJeXZjU9+Z0?=
 =?us-ascii?Q?hp2O4Vrgl4UXXjmwVezX9AI1cd4JSAxfTlbKxF67RtlGGnzbf+yrmIgCzSkM?=
 =?us-ascii?Q?q833+f+KdR2sy9BD61NUSnNQoNnYrQp7GySUjHslJBT8xiol1U8ikpnoAX1W?=
 =?us-ascii?Q?Tr120YskLqNpWyYbLWXRhJ7fphZYA6gBx46Ev9Zlh+RfsVH/VFOrGrUe7J/1?=
 =?us-ascii?Q?OnmFK/ytFqZ/0SAxeM1dFyla1VZ5fBbw5gHQL5wm/R5/kqdB+E0LVZyx18Rf?=
 =?us-ascii?Q?UL1rFKbTg4vdRaP4okTsUdrXV+Rp1exs33ictk4mrCehPj7QmYPYoddhXp88?=
 =?us-ascii?Q?krY+jNtc3XtqrcdRrWAbKCMx/emYB9h4HkE9RdZrv14PLm2QEl++PjrUQpzM?=
 =?us-ascii?Q?Bsx4enwT2bQj6hLq2yc2wBHeBPdiTcqD+7kD+BF2EGmpoQ/HgMqTzAPTrQEQ?=
 =?us-ascii?Q?4ztTY6IASpJYYuIQ6YZx2yYiaNzoknUBKDhIQPvVceU///7U1ssVbhGCftbW?=
 =?us-ascii?Q?roxd87SkfQpIVcCF7x7x7qpXfnK7y8H/iW/dwoWA6Dn03x8EqHfwdeYpIN31?=
 =?us-ascii?Q?oWryS1Eawm69sgglcrziYOHaWqaHtoIALYO7FcTPlXmSp3SW+3TXEcZQHe+0?=
 =?us-ascii?Q?wl8ppN5jZGbQ9nn51hZI9h9RFpEzBGL3OGhWWCveinxjvoMULQFfWCY1UVKG?=
 =?us-ascii?Q?ECUZGNN+6yatBtBRoJS1gxKvPAmTufLqMDHckHNsD3OIdFRfHBmv16XwXqBk?=
 =?us-ascii?Q?MGffESCaef50YPZAWPUWmhz3TUS3g4N616NhA6Cf9xFJ5Eddfp5lw3ddOJlb?=
 =?us-ascii?Q?7pmWRcbdEgOE0wl6c3Rx66mL5SIb5s5xEB2ma2LDTW9FmldlNaxQedthW4ro?=
 =?us-ascii?Q?bANPm59gWcEgkkewq1Isypu78WIWagVxJnTcmbYngFMGHSYFPcz42zzur0tr?=
 =?us-ascii?Q?2cp2NMdPJK6pbg6GQTuRbU+y0ztPQklveZvXqkwHSAf3vJwVucTGugCp90wu?=
 =?us-ascii?Q?KShhfo8GovfMLbErmJvDxwEzNSV+oaQWnwo0dlFVuMLct1Wrn4Vu0S33dIrr?=
 =?us-ascii?Q?3xHSJcvOBMQ2hYqzDNo5eAqBp+5XzdRu5PA4hf30HpO4yrgiavVxFOYAYxeW?=
 =?us-ascii?Q?wRClnhp6mohe0tChyoFXyHGeA7Xq+H8PG2YodQx5ig7S4IRO8xD7mOrPnk4B?=
 =?us-ascii?Q?8L15DXU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MAJa88LyAkkPxppNxTxHbBmotXUkzGhMYo8okoLmb+GYj294wUuBoJ8ZOYHK?=
 =?us-ascii?Q?fQumaDoPcgV3bykTQ8CGvKLA1GNgE5z3zU9FhmAKByGqsdMMSuaNaLqfX7or?=
 =?us-ascii?Q?ZV1mTQg+rudP3cjWqKyA32FU18QDf66kUwKiz7x3b/FZEB+PrY9a0B1X0rS2?=
 =?us-ascii?Q?CNZtRQvUf7EG6eKO7urN3f7F5W89f32fycR5bK9CxfMzydu3NEcDDqn7no2u?=
 =?us-ascii?Q?bXlSrifJ82Fg/WMZ9wxvd90LRay0Zd7q9UI6ykEYu23skTxBjATXJcP9B1tr?=
 =?us-ascii?Q?zNzQDMK0ULJ4iNy30aoUkh/7HGrR5TjU6jOuO84SiIE7xmyxSwtvZ0kjwZiB?=
 =?us-ascii?Q?eTiI86s9e10zEI8kRLNEYxyh0z7qaM0OCGK27s1sJBojV5Gu2/L6sSvj7X5Q?=
 =?us-ascii?Q?EIm8KbxAn6AqhgD6pJfbHTCKquelGobQBFfXpiu4lCyPdNVQIhX6L+o0/NLa?=
 =?us-ascii?Q?19BOX0y46xgH9wrv/vmUDlUVnvWvL7dLDb/XXbHBwJNi1hgdrXdCjfx+3/Jg?=
 =?us-ascii?Q?ELzsWWcZXGdAA4tautY0yfvV/j4KrI4Y3Glwb69UMAVwMyZnrS0XHf1VBSaP?=
 =?us-ascii?Q?vQQtEGTEvvIQQvpkfPDEZkLp8l5yqynxi9QMcf4HPI9MtjnDeD8dKJ1fxaNJ?=
 =?us-ascii?Q?LA6Yu5BGz4jXLnk2JJl+QRBuxh3CRf4sQZ04zptoQTYBvAWZoqVeIOtsZBYV?=
 =?us-ascii?Q?5yqe49ocCHgg8DH3KBoE5/CC3mJo+0znQ5WRhe8lzB5loOFCoasxkc6LVXmJ?=
 =?us-ascii?Q?WxABER3Mv8nHbagPEiq+vnVCXYLhXPcUq+nUyv2vdrvX1UwvRAODVChoSodJ?=
 =?us-ascii?Q?Rcx4uh9ijIvTcYsgC4zctR0VLKp6zNvXKUVffUC1Nm31stHQ9oghoZuLFllO?=
 =?us-ascii?Q?3pHXIDeaIIZl3vRDWMM2xv0FI9aqxhAS/LPs800C9xkOijg7o1XEOOrF11iV?=
 =?us-ascii?Q?JP52pr/oY59mttSTO+U84itH3btMGDxn+xDXzpmd+f3Ys7+lGtZDmV56XjxN?=
 =?us-ascii?Q?ZFxRxxEBuzg460MZPxSpWvn+AtZm2JeprTD3hAsXf0J3vyTpZ2ZC2eG5eyE5?=
 =?us-ascii?Q?nsuXXVAqC9IBkzuaNfKJXMcqeMAyA7cQo1uArv3oQmAZrR7+dNwVWIuxZNlE?=
 =?us-ascii?Q?j97Fi54Q++DRdGW35DKWErOrSCaZzm7pv9LSVGlWbEEcV6hNIw4vuSn6HHf7?=
 =?us-ascii?Q?TMw7N5NLYGY27bM7SVieGr5QwE2ewnm0YzOW+6M7h4OY4rS62h+iYmpMhdKk?=
 =?us-ascii?Q?QKsWx29f7/2weTWBe6gdTlnIWpINHsUtpUmJhmPkJZnmeEMKztel8RoKS19z?=
 =?us-ascii?Q?Ml0hNxydhCd4zB5gQch3ro3xIbAX+OcTv+4Gz6t2pYx4T6GYululmB/faJ4K?=
 =?us-ascii?Q?CFGKgMpJK8T0oupZi+ak5WsJGNLIbnoIhPy4zYYAvIEpXV10zS5lFI2JLRXq?=
 =?us-ascii?Q?OqiqmJFLXNszSVPOFqFJ2htMJIcfxC+zIygOQyV1gJMv6ugAiUeotJLlqZbA?=
 =?us-ascii?Q?FiKYS3B3PSPsOa543eSyWR9ZnChqLBjNg5JOrum0r7FmrBFBAW8fwD1SjSZP?=
 =?us-ascii?Q?6/BoMee5xKU9yjUfFWWYuBHffqXSvSBSUFEn6O0qVMkA+Jmfo1SCRjZs5yY6?=
 =?us-ascii?Q?yQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A93DAD4F789F44B813EF26116B0BA4F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+ICOhYO/Yc66vhNpFgDr+j/2J2OHE2zzgRxPoxHhR3C0bqo9Qrm/wrrud+t9IFwUeb+QXk8y5NhCY776mPYFO32+lXkflJjhWGsxaAsBhz64/vgG+el16/Vd/rMkmo/b6J1IYUGn/ALnw9PuR6/CmUKNwJ6gw9VCXZfc8Opw4USqGQn/cFMmt3bMdfY7GOy7taYv5xVOYFEQis4WZHI2pp4+/OZkS+LeNLSd9KK75Vfdh5JflCpHm7SnIhy1DGpRtBl5ZCIi9GN2c5epz52ip8HYXoSmw14cf8JsR96SflHlsk+fC/hoSC2v+mClx/Wf+MRBWMVtUs6T9G654eyVFTFFbdJz4ulOd8RZAu2BFONOuOig2SbIcq/IKuvg1cvhnZ2mpDPzAlAZntujDaR01YVfv4fikpPEHok5pXeJ37L8PUV2C2ca+Yu7eVQtP1s5kY3KSoj7QEr0oy9lYtAZSW+StHiANm/CBLgOvhLOZLXEi8IjGpWB5rW3v81G/Wmpbbb6xOH0fQ4P/mOTFbvdOLX9/jYlsQ+YO13z6O196jtnzAHDa5+CTPxQorHcRNfjh+kHU2C5ozGQzD3zF4Wp1SuhNmm+yVst9eDiu/0ID1o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29634e8e-52dd-4f3a-8bb9-08dc9f7509f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 17:40:20.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLmJEBvS3Mx3wn9hUETzjtIWf+MMx6k/LJH40kkt/8vSbULsijZcUK+sJQnXWPOnzD2JPlwZFQNEn20HdJq+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6402
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407080132
X-Proofpoint-GUID: Tc9_a9MB1bLdpvuIzyZNmhi794y8erZX
X-Proofpoint-ORIG-GUID: Tc9_a9MB1bLdpvuIzyZNmhi794y8erZX

Steve asked why a number of recent commits to the
upstream ktls-utils repo were never posted to this
mailing list for review. The answer is more complex
than I would prefer, but here goes.

The instructions for contributing to this code base
are here:

   https://github.com/oracle/ktls-utils/blob/main/CONTRIBUTING.md

It mentions creating a GitHub pull request. That is
the usual method to contribute to code under the
https://github.com/oracle project -- perhaps the
/only/ method to contribute to Oracle-controlled
repos. Indeed, even repo maintainers are not
permitted to use "git push" on these repos.

So for many recent patches, I've just taken the PRs
that were opened on GitHub. Once or twice, I have
emailed kernel-tls-handshake@ to ask folks to have
a look at the PR on GitHub.

For patches posted directly on kernel-tls-handshake@,
I apply them to a personal branch, push them to a
GitHub fork of oracle/ktls-utils, and then create a
PR from that fork.

Until now, ktls-utils has been "experimental" enough
that patch review has been a "nice to have" rather
than a "need to have" -- but that will be changing
soon enough.

I would like more review of work that is submitted
only via a GitHub PR. Towards that end I have
looked into setting an email notification that is
sent whenever someone opens a PR. GitHub does not
appear to support that. I still have to check to
see if I can set up a GitHub Action to do send
email for each PR. The usual approach for GH is
for people to Watch a repo (ie, opt-in to
notifications) and that's awkward to do for a
mailing list.

I'm reaching out now to see if anyone has other
suggestions or thoughts.


--
Chuck Lever


