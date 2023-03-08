Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3179F5
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 16:51:28 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328ENlb9004930;
	Wed, 8 Mar 2023 16:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=EBiPwCg0x02TLiZ8eX7tTGoWtERuvoiUpGM2F+FeNSM=;
 b=iNG9/nNYusjvwk/Wucl7elquC29HG53111W8P5j+1paaC5PpWM7TxPzSo0v4YdEPCaoi
 at/MJCHyG3IessTL0SH2je9FcK1cKXyi8XT0X/YNRb88cX5p/VsiTCJsjyUdU4O4+Was
 kvMqTkiUSUE76EB4Aq57lVpVGCGMZ244IQQ7QQrHyODATau9+soZkpZVksp75VrIKlNC
 Ko/6gRJh/uQrzKkqTOHIY0UERtbFU2tDP3PhEA8wouRPWZ/JTPvF4Qn47Su7eEvH7Mty
 v/ycjXEhMKovByI7YVgpb13cjfiLZV4UJTm2r2AaKvjsI2EeKcILMf1dFqPXSg3/A8kP yw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j0p86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 16:51:24 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 328GXxAf036526;
	Wed, 8 Mar 2023 16:51:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p6g45r01w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 16:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc9zvZLo6+A3IuW3qPtvOjASV+/5D8tyPti33vwdJQoX7E5xqVmoXS8SBPRMv9GGuYziczk18Jjcg9iMHyOkCLbnUhmWeBQjiK5SacdYi0kDhZ2jSOtnS8p+yJUJjA/sj7ROPcIrgRT1icCdNhB/NHtDvCAYeUlFM6Cj0MPwfFMK47vmV+tiGfzmZRo5bjojJ30ONhW4/Na70KO7kM8XLREiXQhlQShYWp1x7unfcLL88gsYcmp+t4HPMrG16QxDgbHpGIyCvpGdzPChlPbvexoUeKyEcAvQduRyNfAwKB5h9p04Slr0yxZiHCELs5bv/qZz3zDETrSsAzncTtAa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBiPwCg0x02TLiZ8eX7tTGoWtERuvoiUpGM2F+FeNSM=;
 b=Hy/uOSLoPPRD1u3H1O+yL1pk4xJFt0mgo/JAvhFpKnqfVBTZQdPZ0rcXvViL4y3ot8kyFnxtt8mtzWafZObkZLKyFHe8u5KXF8UePmuHFeO9m6Gsa954g9vBnU2Dil27Th+vqgycAs9HrZWCFNfgW6AXQEc5croWaQxIEbb4k4UScH7BK3jXUzOFU8F+/sAzlZIzFIObfrietl3XSPm78S8B1wjNkuAsD/UNmZaTfD53kUDLnK0gQvDeC4iA/36SxZJYrBfbpGdA+3IQhu9Dn0dwsGinqERziTCe69KSIzRaj7Vbg0NDkMegMsCenww8qVagN26OUBdBGq6WnThqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBiPwCg0x02TLiZ8eX7tTGoWtERuvoiUpGM2F+FeNSM=;
 b=hQQdq4UKfCu1F7AyR/gNkWyy5C5Bd8pDUg5h7ZDqQtZBgRuEay7WPZmMS7caFSJL5dtTZ4JmRci2bqGyl/eR0HMhUV8+cXDKyRtIBm+zZ2IdXi5FmZlRef7t5PDyiqU86WNAxKFGQvdJn1LWgKeSwbuVUIc7xtHCoGuVV/XquAg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 16:51:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 16:51:21 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: fput() considered harmful
Thread-Topic: fput() considered harmful
Thread-Index: AQHZUcFEoHLUIOt2hk6BHhAhP1frJK7w5EqAgAAg0wCAAAapAIAADSEA
Date: Wed, 8 Mar 2023 16:51:21 +0000
Message-ID: <5D61EE61-EEB0-4763-B60F-0A2601D92FE9@oracle.com>
References: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
 <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
 <59EF30C0-05F8-458E-8BAF-36A9CC757D00@oracle.com>
 <c519d883-5e08-0d28-dee8-89f1a7f197e3@suse.de>
In-Reply-To: <c519d883-5e08-0d28-dee8-89f1a7f197e3@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4734:EE_
x-ms-office365-filtering-correlation-id: 4fb74c09-6cde-49f7-e124-08db1ff55842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VJRUABJzYzSxLQhs/EhisAj4ODFV0XFFRQyRk0FjvB3nXhsqworWEdZ94dCm/psmGWXn2b0idP2PcukQ3UUh+rG0C1OooGVKIfgktH/llXzXWBN00PqGQXKuKdhnQXenl1a0g0D6Qp+X7FOXrclxiXDvRgXZKYSgezEM0XVeiArcmPH2WnyFyQgCWChISc6XsPirU6bm3q0Kxzl1aZBKRVXbUoP2cvyJEVtywGkcr8pS4rzRLgS21uvY3kFrO/SbrqW5bsbgzdsQuuj6yRM9bwhkUEOzvM5k4hBvK9YuTSLAySqaenibINEmld7AbTcrc2oQFF9QYAEt6EgZ9rs+ogLnkz6wu+CONqhPEGx8gbmUSXwIDjzzidbHDpjtIzUzlLsolDiykqDfdU87vYqZnR3BtIZR+JE7PkIG7UHqzeAB1cfKP5R1HrFGShdf5vNBAUxz8ry0x4OBBAHUCN8sKvJWgd51RMLlswKbIHiR6SbVjeCYDwxu3EvektmkuZtAx871X+d4v6kf7e6sIZfR2KGEL8CLWrOQkjbjSJ2oBCQacP4XKiaFL0HaIG3X0F20WigShuFY18EUzMtRpA4v1jh1TtnvXlEAhZ5eCPmr33VCNrvqLY3AYt063uSw0Ud4qq/c8ItXzETvKfk+QWlLZQIFKW/vegeZG0/p3LQElr81kps0foF/skOFreK+qV4qmMAhgUxIOjR/v6aWTEVYF7L7QtAvIU9o+ZqN0GEAryQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199018)(122000001)(2906002)(2616005)(83380400001)(91956017)(66446008)(6916009)(64756008)(4326008)(66556008)(71200400001)(66946007)(5660300002)(66476007)(8676002)(186003)(6512007)(26005)(76116006)(41300700001)(8936002)(36756003)(53546011)(6506007)(38100700002)(86362001)(6486002)(478600001)(33656002)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7AUhaCfrk0pRmXaLG1ASN2ahswllt6noRuJmN8kzZ5qNpm8j6GJaUb9/76h4?=
 =?us-ascii?Q?I6YW4xuIO/RHqUoYQnzwIjOA8Mi/kGFuZkZ3zhgZG+4MgwK+fKzkSn+cL4/K?=
 =?us-ascii?Q?k6VIYwfvmzLzmKtwC6C9GpInOyzWs8LpJD7WoYUQpzlDvULrOq+aVB2cU9nE?=
 =?us-ascii?Q?FXXz0XX3TjOW55Dkv162UcBvWF/6q0Ok5FKqWGuUZWg9LcQ4Oyh2zmb1eT2E?=
 =?us-ascii?Q?iajv+jNuQbuHdElZ51Nnnff7MCxt2XIQpeFUb4xRmv+NMoq72I8mUbJF1gd8?=
 =?us-ascii?Q?40VQxbOOHfzf4ce2D4G6/RfkCbdRulR4Bc2AcQdKQGSt1CvaMjPkG6y9OFof?=
 =?us-ascii?Q?ns0+/tKsi7GeLVoYoK3BZJQD8XQyIw9+3zZlp1YcHYQh77GZNTbAEq5tqWtV?=
 =?us-ascii?Q?kN2co0UtoRFvK9Oyh0C9dgU0F6q5/QQfjPd/WvcN3WdwlF7tBXyX4WISs+jT?=
 =?us-ascii?Q?DfXM0B24SRg8lfEI0W2+2ZNzQO8FTVYVv+rBGNQU6gH2kFPtmobEvWbbr5q5?=
 =?us-ascii?Q?u5xZWyrILR8fh2jbfrjA4i2GqHM4Oy0bmy3eOyiOB9jFdqnQCvvru+ITy2ZF?=
 =?us-ascii?Q?faUgazdFHeDLoYsnxkJdLGDyLU7yIGraALVGmfFzIdaVGxhI+9pSBUIbmPv3?=
 =?us-ascii?Q?DtZz0onwfBYlIAHdIJMI5/YIz+0834xGuciXLZ7Ygkgzpv1WG86v43y+Degt?=
 =?us-ascii?Q?CzDMR01wIqnYqfZurn+3c/0yIfgIjuKxNDIeoWK5yg0fxhQOC1p+FA7FjhVB?=
 =?us-ascii?Q?48Vml2HiHppRDvyVZJcwnyPoUR6jpOMWulaSLVT38vLS7NtDUDV0sCXdMh/Z?=
 =?us-ascii?Q?Bf4RSZv6yy+7ZyvRJI9Y09TeJg/1YKesJVwgxH5S/RzVdJuscW8xlRxO4s7z?=
 =?us-ascii?Q?ScEe+2TgMZ41QrL2y3jE7+QWqc7N6NyY5gk4EkZz4jHgmH/wM1d7oPPVBmEM?=
 =?us-ascii?Q?foVb7gKInXY7BPOaDNYOoo9q3k9gjpl6HDWAGvYcTXmvAfVRIGPhEcIa6X/L?=
 =?us-ascii?Q?k4SbncTI0udJCf/UA5XEVG5faudhRu2covvEZptsJhOs4CI+qJXj888JSqW+?=
 =?us-ascii?Q?gW/HpBW7J5FPgPKziZ8TGyRMqEVyYJn1rPH1DHLP/IOPAoCcUiX4fjPmTUG+?=
 =?us-ascii?Q?NcDx2R4/2kDwHViGLGR99+xrmTUOzgXJ4tYXTdMv0B0MVFFE8hiI3CGU++GI?=
 =?us-ascii?Q?ahNAzFmdNKIGS6btuVNb5wNf+c80PiMrviBIo7n4h/9Iu7uVaJL4SUtRlGmL?=
 =?us-ascii?Q?vvS/gA4Tu0UcIGyNcfS429z/pRk/snmgwrpqGqnRB7Lj/PHq2JsWp3MTe8re?=
 =?us-ascii?Q?B+EdwbSYAuzJM9SFM9bWcNg/7PJ37ZTVYkErpEdqsm1A0xhRfFJzsbZCnjS0?=
 =?us-ascii?Q?sPGw+xdGv4CiNvxJ81cdPg4yx1Fqk0ft7LJEwtcgu1Y9bH7FMCfTYaFke/2D?=
 =?us-ascii?Q?T6URuBk/j0/X5uroa3n7oA/NUM/2RtAHj19nwVVfanNTttaNvRmhi1zYyJXA?=
 =?us-ascii?Q?tbeEWtCpo0/7jDmGKyR04YLPTkc/E/pr7Fsf7d4qV7pRfqY004sBtqOpgWnL?=
 =?us-ascii?Q?++n1L44rkDL3TThJXwYs326tUn+CUCnK+86qig6NnglkiGMYvgAv9EcHjirv?=
 =?us-ascii?Q?Lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6859C91E7BD68142A7E5C4BA5F4D60F9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q4GoVazAl1020rS8N6VpTlDyakDits2X/Bb2Z3pt56hFHW3fLlbdU+qrxazKThwRQf+N9UstBBJ7IZlhlK87kZteZBKoPvFSOxqrJQ27aHABCw9abyz2JCrU+9g+gY9SWUse68T2XnRY/ku7BrLUMhqkyqSpd7oxghCNZx7xf+hiE8WfJpxkc+ouhYTM6Xmweb5w/4iRAl3cJV0LMf3Gc8yCOIlRDQh4JtWcEujhR4PqK0s6ju10iNPdEpm/b/XjD7Hq+7FGrPxlO4ddjXL9GxAaIwJFZNs5yciD7U0whYqMHHAsXL4+tAAwjYx8NKBvE754fkD6aC1ADu6lSOy9l42+4VcKscXdQLfxmPrwfaasBYF7o/grMlBYkqBw+ehTBdUczl7zFQfXp5ikaPKcBMBb8Wcft4DpOK+cFbNFj/4Tld5TQiKiwdI9Sm8s7OBDieImsy9HPa8DeLNIq+PRCUzxLJffIvxbzuDrWAzZogz54rpsEAB4Kq/sl1PIlhPUCA06JGJSdB9UnXmsLG50Q9q35c2FZwBtkqfKy1Lfb8U1BHgAaP2V7M5E1SYEicxd5FF/K8TtYd2u4Wn36qoqNoJwktW1b73yw/oZpFsZKHjX6PLLoTNQbpO/vWF2lDKXWabshAjtsdez2mrc9Z41IA4Y6PuVz2WiuB/KwbUYTKeBhRmmJPet0s7Asth3P4eW/v4iunrNIBjpmg/waKo9Cpv9Uo7MPyKz1/Tu4qzhl5xnYcL4nF5m3e6OHo7Nxh+6Y+arMFW8CEFVHFQIaI7o0Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb74c09-6cde-49f7-e124-08db1ff55842
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 16:51:21.0658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5Pp1FhNFKPxq/SMCD9YWeLHodPjAjaq/qS/v16IdNUxthgq4tmxVyTET5CFwQNTSUfPKCaFE6XO0HztOKShQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_10,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080144
X-Proofpoint-GUID: 3Uh8vJUmZl8tfdwxWntXQiOo0C9EpwuC
X-Proofpoint-ORIG-GUID: 3Uh8vJUmZl8tfdwxWntXQiOo0C9EpwuC



> On Mar 8, 2023, at 11:04 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 3/8/23 16:40, Chuck Lever III wrote:
>>> On Mar 8, 2023, at 8:43 AM, Chuck Lever III <chuck.lever@oracle.com> wr=
ote:
>>>=20
>>>=20
>>>=20
>>>> On Mar 8, 2023, at 8:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>=20
>>>> Hi Chuck,
>>>>=20
>>>> I'm playing around with v6 and (again) facing really nasty crashes:
>>>>=20
>>>> [ 1662.912887] ------------[ cut here ]------------
>>>> [ 1662.913399] kernel BUG at fs/inode.c:1763!
>>>> [ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>>>> [ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G  =
     E      6.2.0-rc4-54-default+ #231
>>>> [ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIO=
S 0.0.0 02/06/2015
>>>> [ 1662.915932] RIP: 0010:iput+0x1d/0x20
>>>> [ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 0=
0 00 48 85 ff 74 0e f6 87 98 00 00 00 40
>>>> 75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 90 0f 1f 44
>>>> [ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
>>>> [ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 000000=
0000000064
>>>> [ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: ffff95=
3bcbb23b00
>>>> [ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: ffff95=
3bcbb23b00
>>>> [ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: ffff95=
3bcb9d91d8
>>>> [ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: ffff95=
3b83918cb8
>>>> [ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) k=
nlGS:0000000000000000
>>>> [ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 000000=
0000350ee0
>>>> [ 1662.923568] Call Trace:
>>>> [ 1662.923801]  <TASK>
>>>> [ 1662.924006]  __dentry_kill+0xca/0x160
>>>> [ 1662.924353]  __fput+0xdf/0x240
>>>> [ 1662.924652]  task_work_run+0x67/0xa0
>>>> [ 1662.924992]  do_exit+0x343/0xb50
>>>> [ 1662.925302]  do_group_exit+0x2d/0x80
>>>> [ 1662.925644]  __x64_sys_exit_group+0x14/0x20
>>>> [ 1662.926039]  do_syscall_64+0x31/0x80
>>>>=20
>>>> Key problem seems to be userspace here, which (apparently) is calling =
close() on the fd which we've passed from the kernel.
>>>> While this _normally_ is not a problem, in our case we have the proble=
m
>>>> that the filedescriptor is associated with a socket (ie struct socket)=
.
>>>> And that one is shared between kernel code and userland.
>>>> And doesn't have any refcounting whatsoever; socket_release() removes =
the reference to the underlying file:
>>>>=20
>>>> 	if (!sock->file) {
>>>> 		iput(SOCK_INODE(sock));
>>>> 		return;
>>>> 	}
>>>> 	sock->file =3D NULL;
>>>>=20
>>>> ie if _another_ process (the kernel driver, say) is calling 'close()',=
 too, it'll run into the
>>>> !sock->file condition and crash in iput().
>>>>=20
>>>> I have been testing various things here, not calling fput, calling get=
_file() etc, but either
>>>> hit a crash or kmemleak complaining about
>>>> the file not being freed.
>>>>=20
>>>> Have you seen similar issues?
>>>=20
>>> I have, and they all vanished with the introduction of handshake_dup an=
d haven't returned.
>>>=20
>>>=20
>>>> And even if you haven't: relying on userspace _not_ to call 'close()'
>>>> on the socket seems to be a quite dangerous concept.
>>>=20
>>> - The kernel "closes" that file descriptor anyway when the process exit=
s. Is that not the
>>> same as a user space close(2) ?
>>>=20
>>> - The endpoint was created via dup, so calling close on it should merel=
y remove that endpoint
>>> and not trigger a sock_release().
>>>=20
>>> AIUI the reference counting of the struct file * is what prevents user =
space from calling ->release.
>>> So maybe NVMe needs another get_file() somewhere before it calls tls_se=
rver_hello_psk().
>> I added an explicit "close(sockfd);return;" in src/tlshd/handshake.c.
>> I tried it once with the close /before/ doing the handshake, and once
>> with the close /after/. I don't see any kernel issues on my server
>> system when a client attempts to handshake with it.
>> Based on what I've read here, the missing get_file() theory seems
>> plausible.
> Hmm. Let's see.
> I must say the lifetime rules for 'struct file' (or 'struct socket') are =
still somewhat beyond me.
> Currently I have to do a
>=20
> sock_alloc_file()
>=20
> _and_
>=20
> get_file()
>=20
> before calling tls_client_hello_psk() to avoid a crash.
> One does wonder why; typically the refcount is initialized to '1',
> so the extra 'get_file()' shouldn't be required.

Especially since handshake_dup() is supposed to do that
one for you. Could be someone else is doing an unwanted
fput()?


--
Chuck Lever


