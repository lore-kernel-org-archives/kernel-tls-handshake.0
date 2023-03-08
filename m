Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76B79CD
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 15:40:36 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328EO0xt007823;
	Wed, 8 Mar 2023 15:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=3xopQHymdJF3YY6dl4fdkui9HzeGR5qxrT5QmMpJrLE=;
 b=tM1URQi8y0LwI2QkNfADuZzNujDPapHjpFLo7kTDjvJvET7KaEXY55ZxacIdqvHG5RbC
 yu7M8w90p0evywYWI/GAyuq1Sx4p+0ZnX2cqaToP9JtbYfwkYyAIt9IWXqsTiakOqR4M
 b4U/DJKkhZw5otQC8hdFNW34iKVWoKO5Vs97xcagHxtkw9ZvR5NqeLi+lPsBw2lJxLEp
 NAyaxDrO/8ZjAKRB3HlXc/JvVI14wsww6nY/XaIY1nQMxHgsaB7mBh7D+EJ0T2yYBoYs
 50P/gAa79lKsx4ne2YXAw9I43/uZ+E/w9qjnh6uPSh8bG+rCYgHWmtyaALW6ioIkWo5M OQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168rea1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 15:40:35 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 328F7hOQ026547;
	Wed, 8 Mar 2023 15:40:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p6g9tv5e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 15:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMuUVhlfMwsUfoTY7u+7fByxnpNov8YXS+X1qjdbO4UhvbN94BhphFv1batSQ+F+dm2nhrM6jqaOyfwGhlxCnZJtFVagf3eBx8zRe1gr/8FDTXLMq1QkRmE9uuZRB1Z/m8oETsYp5OmjCPUEPZYOnkI1qayLRvRi9RO5ozQgxpO79Mljt82t5+KcPYzAjRSzkfzGBP8b/75biVYFaWPBh3XEKir4OfiNrsetZA9QQkgY5fKPmp4AVDNhbzvDSvApXuxIRM9tsZEspklKzcEHNyysIhiw+NR7RTjIhrO3G/Yi8t8pU9bWGHQdWg+ttpTxszq8i2UPAx107UrPqsCvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xopQHymdJF3YY6dl4fdkui9HzeGR5qxrT5QmMpJrLE=;
 b=HJDgkTrXaqM0KFxUhLHa5IgLVZMpL27sE9JfwqTvTrHDJHMvgdpGKWfZx9w++usnn+LVW+RkyEg17w6S2hW+9u1i6wpoN+kO2bIrwMvkD8i9pg3EawvctYBYF/H/t0CieGB50WSLL5+3xmNh57jfDnXCwS543DEq4vEBRInDNyqwNNbMeaI7pPEXVTg4ycidpBlvxY2vQUoCgXMrioad5uYUswh3vjYhDbjiIvLIUr1bAq/ugM1M3A3Kpvz+YyYMkOHvMSmtzYQ4sYaoh9iezQNL6iy4beeQMPlvpF7Nb2kRBFzXr/903yoLHwvIlrH6w2unlZ5XjxxO3gKhWslRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xopQHymdJF3YY6dl4fdkui9HzeGR5qxrT5QmMpJrLE=;
 b=aqkfp9p1jevGTXop8W9NMfly+AvbTuaTT/A6iQR49M/hlm9kUZwj6VTm7CPqfZTYmOhK3g1+SCEVxiHNpCy+kUkpFnGdvRP75xWb8ZmvZMxJ1xDU+fgFbBiPeQ4ubsaoCy8LSs1fuCa5GeMEh3BZRbnLajdUDKYeWaPDrVqgBwA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7281.namprd10.prod.outlook.com (2603:10b6:610:12e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 15:40:31 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 15:40:31 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: fput() considered harmful
Thread-Topic: fput() considered harmful
Thread-Index: AQHZUcFEoHLUIOt2hk6BHhAhP1frJK7w5EqAgAAg0wA=
Date: Wed, 8 Mar 2023 15:40:31 +0000
Message-ID: <59EF30C0-05F8-458E-8BAF-36A9CC757D00@oracle.com>
References: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
 <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
In-Reply-To: <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH3PR10MB7281:EE_
x-ms-office365-filtering-correlation-id: 69f41400-157d-4e3a-f141-08db1feb7308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y67O1AeFhu5Aw5G/vcBFU6gvOg3GffwVilFijRPoJSiVhQ5cpQJYhE/aYpNEsX5K6xUYtBBXK/h/awntQOdmXSydsoo0t6gJSnk69zbeRwnthNRVn0vRFBijvxeG7LnycAm4cNpTm1SQ7z7xED++ubLuyF05TJ0oUjhtEtPc2C0IibOW/nWB7HU9TRkdivfAXjPVFjTD+1Ml7846x/Irhc7t2cihp4r9XbKtykYEMmwLUgCQ+dsWulKanUtBE9XZBnm+jnXenVb8I4TAhzXC9GjtOHHT722OHB7mPmivY8WJzCf+Bt4PEIiH5q1451WOpll3yrWGxY0ewnPDt0c5cyleu/rTYiswLbsSCnvl4jN+ETNoGELi2Rl9hvyN49MUdAW3OeCRx92ecTRB07orDmi+oUmk5ArRH2YgXC2IaawuvnJatDYdaWW13zv+HzhxjkZ8ReLe/pwRS1lGNbf0JDKXrkECU2w+i5xRzZoQNBJpEKKkgH0TEbwy+yQ024RvMhfAa/HUjh0U0Ie54SXC7IpKDeAayLdB6UFZ8uq0KJopL+BPqW2KMSGoCfKpz5L1gNGbu5HKwe5cgqmZGAPoFA1NaTfZS/GdfiSBHmkkqdn7s8LFQbVYL0wo3lDBu4E1zxV7tzLGlsYrFvKp3WnJy2cQkJTnR++KguXIVusADTMlCansvIyWcGwRnmbxHUwED66FonpaRfDNV4It5Rd+ZkHopPGWN1XHhhZV0mGhSuU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(2906002)(5660300002)(76116006)(8936002)(41300700001)(66946007)(91956017)(4326008)(64756008)(6916009)(66556008)(66446008)(8676002)(83380400001)(66476007)(186003)(6512007)(33656002)(316002)(6486002)(71200400001)(36756003)(2616005)(478600001)(53546011)(6506007)(38100700002)(86362001)(122000001)(38070700005)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?P+hK/dL1kCkdamJT5dqpHwDH/ZRjJlzFcP7rHMz9/r3bElOik6zkGV/QxQgr?=
 =?us-ascii?Q?J338+CcAQkk7doInUpRjG2522PDk3WGXCrj75m+BmGCWuK88OrTQmmMbbVat?=
 =?us-ascii?Q?civnJ/ChUZ37DmyqOIFczkKJC2ZtMVfqG3iFT5Uz66v9Dp+jPZ2jj8fKZksT?=
 =?us-ascii?Q?F1JMfGt7pDL9eYNnxKDXFUeY+NRt8ECv5xPzX5Y9b5MkLvaxlSVWaug/UUZs?=
 =?us-ascii?Q?qIeQTmGMBLNJlRlOyWgvizFuVnVJf5DkSnnqi5K4bMKPx342MnSLhOf4rWUX?=
 =?us-ascii?Q?/oPd+sB3eiHawTjSEgF/CBNMTx1tRF8k4YB7IOvv+sGexpZcxuKRdr834G0E?=
 =?us-ascii?Q?130W4mFh/RKElW4PhkR14V0Md33HbPGc9Ah36qn9BE8hEk6egqKnvhpIkLK+?=
 =?us-ascii?Q?9bfhQrIN4a71pPNo5dQiqwyZt2/e+fdrgbXISImePpxcxu1OFy6dxr2GYVys?=
 =?us-ascii?Q?3xB/wiXfaZUf28Xm3HbTlrNC2y084zgaxfHOqT4s8sZsJ+F1X7GMK+SmNWb4?=
 =?us-ascii?Q?1hTrI2Ed3bu9bp/JdYdcWtAx8mNL/Vx3HsbCWcokHh1o5zAZnuFXfvanuz07?=
 =?us-ascii?Q?dQBOgouDz19uvctmrn+w+4wkDFlUZUg7XQIZ91mZ98oHZXr2XHp+VCTmMwIS?=
 =?us-ascii?Q?JwQh8wudATSeStZouFl7cX540Yb17+xEBiWgBNz/cUzlJS/QNy/74yTRthNs?=
 =?us-ascii?Q?o04xIValyghVlvJpwxHmOHC+Y8LQh2N9pEdd1GGuFLtwbnqBEHpmRs0Y/lwG?=
 =?us-ascii?Q?BaeYcowrhNWf3JTtqpkeXUA65rvoaUJC2dwMcT2qu61xFW0SFreHQdPstBQP?=
 =?us-ascii?Q?K1w9rPjmW/28VAWy/SItJBi0FvHqQSPBGJNENu4WkBq1tkcbANiFExQoFNd9?=
 =?us-ascii?Q?P5QEyzn9g6PhKeaVrBMY3Rhp6BdyL6y6d0NIxGm9Tipznd//UXFo9Q7F6bdp?=
 =?us-ascii?Q?qhFlRl30a/Y/iG8MiMV9jGc1vXyBxmcOaHEnUX5OQ4hRoGFpBTGnO1xwKSym?=
 =?us-ascii?Q?vqM7+PopyEYS5UAo+9z7AE/ixX4xSI7Tw6EL+QBgsaNi8fRmR8P7Ynn+58Qs?=
 =?us-ascii?Q?/rOal6d/Cn5dxuebFcn8ehKlKZbzmmbB8PVdYEzYyzzfWBkHTUmu6AMr514v?=
 =?us-ascii?Q?eOYAs7tPXEKjnaSE7Hf4ywWhRb0jp83CaHqMeNZ2eYWC8HqGKwcE2la6LTD+?=
 =?us-ascii?Q?PZCMwjXihnQik2vLvdkK+ql83CfC2o8Lznq9+aUODQkkx/rwmP7/+KXOvSwa?=
 =?us-ascii?Q?GWI/KMSDVTysHkMRnTYpqxNPgmos8uU5Jp0OW4OklJuBDvhc00RQ6mgfNX9e?=
 =?us-ascii?Q?8opZeZ8JwOWvHtYzex51bk6AYZGLlA/o/Jv88tRsu1d2vWV/92utBWXswswc?=
 =?us-ascii?Q?qHNWyVvQSmDV0Y6RFW8ssqdW+zAXCnpei1kyVl21YhIZ4g49JWYSZgMzoBAz?=
 =?us-ascii?Q?xDzG/Xnrwrq4TBqurJjXXQKnOzppo8TJl1ZzvfIf9fQegH5n4WieB4Dtdev1?=
 =?us-ascii?Q?2BOdJxlnwCgF5DpwMC+m6LCuWxGygjfFV5SLZCY3nHKVUDpQCuU2hzPfJJKY?=
 =?us-ascii?Q?BitO4cnz1uQ7iO4YK6yunoPBZrqSiEEUZOrM7GVlz3uf9vZZkftTCOPyTKaS?=
 =?us-ascii?Q?lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1EDCAD38676D034F927CAB65D31DFB5D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	phUFrSXbWdJLFklZ7tgPLs2kvmNC1I9rcvj1XFTOJg/hQfdPDW+zj5cJCIRTXbvtgsU3uto9iqHiQoKZwj+XB34oTZzCRu2kBpEQSTXCcNkv9LUx6bXgJpktrGRjA8/hsQpd8wTv9mnjLg9ePGKGswIGcxeowQ3Wsz7c3WrKlbfDdCMxPhtzbGUdIS7pQMMCNShyWu6ZgfWvA3I6+FKpj7gFcCcAa6xlAmWLHJyLCwFbY3VWAmRiE67DKPSnAsiLlXpBz5qKYdrDuv6KUzw6zbIzYyUqMrJDzxc+k3dc/EZedktHWw3CRXUfXvLQwVy/VP1d/9j2mRridmD7VmH4YlokJ2WRC5O8CSsg5qL3dp9B7LQ/yRHeJYoy5nputvRNvD7or5KLSBzBsQyZSh9wC7TBKCl3XQWatq1eOsDoa3tZ7IOjtSse1gDYTF+MRxZMCQrPeCUrlQfoGDcMoiFR+2A4LoddzzdXXXmREr4jdpnk1qAQ8G4GuvlQuGwvc/RvuMDSYVFSvlzXPtiN49fPeB+1rFldcOu7PK65rKjKG9elOSF70YHsUdma4KYJIDExGk5azxxdjMPB4Gm1NmMoZuZHByAoKICOw8UKLgcwqW+IyDVDI+blja5ZJE7jUjT/riDPyoX98ETWrMtOjpnl06ko/6W8ZLEDYbwsnvk+krZ+0XEGlmuB9n4N94pC4f50y8mUNS/4tNcxEpiiccQKej5o9dBFFykWQJ+iLV8XNcIBYjAdwTG/GwG+XyMrc7v8nBv9wJ/ilpgkF8v5m8P2iA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f41400-157d-4e3a-f141-08db1feb7308
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 15:40:31.0330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +C6xvhU0XYA5A23hUuYUPGFeIZZ3UvoK98sCJzIOuN6pITgN5GqGgLjdCemhiAnMxYi8o5CzX64OhVgOo8hZyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_09,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080134
X-Proofpoint-GUID: kyKF3eFnSr75v9_T_gJOpLXVWggEDLTJ
X-Proofpoint-ORIG-GUID: kyKF3eFnSr75v9_T_gJOpLXVWggEDLTJ



> On Mar 8, 2023, at 8:43 AM, Chuck Lever III <chuck.lever@oracle.com> wrot=
e:
>=20
>=20
>=20
>> On Mar 8, 2023, at 8:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>=20
>> Hi Chuck,
>>=20
>> I'm playing around with v6 and (again) facing really nasty crashes:
>>=20
>> [ 1662.912887] ------------[ cut here ]------------
>> [ 1662.913399] kernel BUG at fs/inode.c:1763!
>> [ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>> [ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G    =
   E      6.2.0-rc4-54-default+ #231
>> [ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS =
0.0.0 02/06/2015
>> [ 1662.915932] RIP: 0010:iput+0x1d/0x20
>> [ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 =
00 48 85 ff 74 0e f6 87 98 00 00 00 40
>> 75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 0f 1f 44
>> [ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
>> [ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 00000000=
00000064
>> [ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: ffff953b=
cbb23b00
>> [ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: ffff953b=
cbb23b00
>> [ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: ffff953b=
cb9d91d8
>> [ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: ffff953b=
83918cb8
>> [ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) knl=
GS:0000000000000000
>> [ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 00000000=
00350ee0
>> [ 1662.923568] Call Trace:
>> [ 1662.923801]  <TASK>
>> [ 1662.924006]  __dentry_kill+0xca/0x160
>> [ 1662.924353]  __fput+0xdf/0x240
>> [ 1662.924652]  task_work_run+0x67/0xa0
>> [ 1662.924992]  do_exit+0x343/0xb50
>> [ 1662.925302]  do_group_exit+0x2d/0x80
>> [ 1662.925644]  __x64_sys_exit_group+0x14/0x20
>> [ 1662.926039]  do_syscall_64+0x31/0x80
>>=20
>> Key problem seems to be userspace here, which (apparently) is calling cl=
ose() on the fd which we've passed from the kernel.
>> While this _normally_ is not a problem, in our case we have the problem
>> that the filedescriptor is associated with a socket (ie struct socket).
>> And that one is shared between kernel code and userland.
>> And doesn't have any refcounting whatsoever; socket_release() removes th=
e reference to the underlying file:
>>=20
>> 	if (!sock->file) {
>> 		iput(SOCK_INODE(sock));
>> 		return;
>> 	}
>> 	sock->file =3D NULL;
>>=20
>> ie if _another_ process (the kernel driver, say) is calling 'close()', t=
oo, it'll run into the !sock->file condition and crash in iput().
>>=20
>> I have been testing various things here, not calling fput, calling get_f=
ile() etc, but either hit a crash or kmemleak complaining about
>> the file not being freed.
>>=20
>> Have you seen similar issues?
>=20
> I have, and they all vanished with the introduction of handshake_dup and =
haven't returned.
>=20
>=20
>> And even if you haven't: relying on userspace _not_ to call 'close()'
>> on the socket seems to be a quite dangerous concept.
>=20
> - The kernel "closes" that file descriptor anyway when the process exits.=
 Is that not the same as a user space close(2) ?
>=20
> - The endpoint was created via dup, so calling close on it should merely =
remove that endpoint and not trigger a sock_release().
>=20
> AIUI the reference counting of the struct file * is what prevents user sp=
ace from calling ->release. So maybe NVMe needs another get_file() somewher=
e before it calls tls_server_hello_psk().

I added an explicit "close(sockfd);return;" in src/tlshd/handshake.c.
I tried it once with the close /before/ doing the handshake, and once
with the close /after/. I don't see any kernel issues on my server
system when a client attempts to handshake with it.

Based on what I've read here, the missing get_file() theory seems
plausible.


>> Maybe we need to implement a 'socket_clone()' functionality?
>=20
> The alternative is to create a unique set of file_ops for such shared soc=
kets, but that quickly becomes painful.
>=20
> I was thinking of trying to duplicate your set up here to help diagnose. =
Are there instructions you like to follow for setting up a small NVMe/TCP t=
est bed?


--
Chuck Lever


