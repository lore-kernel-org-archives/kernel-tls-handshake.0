Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59956522B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 13 Jun 2023 14:00:21 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DDO9Yf016393;
	Tue, 13 Jun 2023 14:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=cYNcg/KVCgbx5/AnaAvY8unQQg429M6sl0Ymm06LGo8=;
 b=K0uEyeRQtxFqpqMXqc+68NP2JXza20ItS+nuDkWxY029fxtQeiYYn8UkcqeG3qu0z75z
 lToDBe6OJAFVvycpG5fojUMByk9ZBEyGUXNc399htWVNPhK11lUUrWcK4E/KIU1EYP1x
 aTY0D2fVT+/a71kegOJy8crXhhcw8yYo8//EzE2D1jWkLUrBsFtPpG8y2hU0DwBiBWrw
 OYypnyq/GajTfHWtRL78w8KZMEBjSjZygHH9GfhX9VybXNbCr1R38JUpnVOVNbjRULVP
 xP8NAzJ7Ze+/OvYHRgvRVXTddcjruMiAHhaZYsrFSh6YhTrweDg/coL+BKxWalkRoD8x NA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fkdn7g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 14:00:10 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35DCcbUJ021578;
	Tue, 13 Jun 2023 14:00:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm470a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 14:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEOaCUo7ebTJZCiixoTRNS+HzqgKO0d3hYNVQSRNobWPCVv5DFtiwXWk5POUwMP9Hk6HA/VW6QHJmbRfsTeUgIF9CIqm7yacmokQVYcATJdF6klrdKHwkfl73TfC6iYMvBVowqs2K7qNe1L2liwTCZJhBxVoVvbt2nlyQ98SWvRjRPCHt8pB9ThmbgeXSaYuoYVZUcO3v5fadIOc7ZvEMF1x249ecqbQrloYZzCwRw9q3mJ1Bwms4OTu2lPnCEUacOr1E+mCYQI1Ix9EWNNLkqfXFdX1MV3TeOjVAyZSswhQiBGl98HHHT8AkaaJpiNBVEQK63LPxnrkP3cet7Y0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYNcg/KVCgbx5/AnaAvY8unQQg429M6sl0Ymm06LGo8=;
 b=Ss/1IPoKJF4DiXdWXie9ToNC8GXK55sirhs4ZIJKpAHRwSq7sfUpb585YGBVW4YOTzyy4JocUzZWskhR38wCNjDxH3qscj3V6JNQ0L6qz1eaMjoUCAOylRlgakDVo/eVSosRRVwVb2iJIFK7yotTQM1XXd8dk9w10PATLMFGeDr6r9QOITQmZTjD2JmQmwVL7Z8ilu3HviyeLRKrg43xU/4TNyTuV9p41heiBF7FNug9v+ndp6Dj3OmMFXm8Wp/wQHaHkJGtZlQvVRHrjZ1FsQhqp9cHoFt5NoyXAPT4SqD8aVgJsf5md5l8Sb2rof7qnuxyCjv08qQwAMunPQvV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYNcg/KVCgbx5/AnaAvY8unQQg429M6sl0Ymm06LGo8=;
 b=JCssICxso2bSb588JHc8lw8maDFxP85zEdlKxprZy+TR3eOb0yG18BANOWhNGJgqoYD5ENTMr+lfC123W/vrFMaVIv2to/fmL8opLA8NhJJcYw1FxO3AKSy+/FsITrPHXplg6F/SBlDVxCkn3C0aYtTWqWgeXGObxsN4X/LjX2k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB6173.namprd10.prod.outlook.com (2603:10b6:8:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 14:00:06 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 14:00:06 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Lin Ma <linma@zju.edu.cn>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH v1] net/handshake: remove fput() that causes
 use-after-free
Thread-Topic: [PATCH v1] net/handshake: remove fput() that causes
 use-after-free
Thread-Index: AQHZndGfTcvTXbq4oEm0LGW1UE26Za+IwwaA
Date: Tue, 13 Jun 2023 14:00:06 +0000
Message-ID: <092BF1A2-C15F-4B90-A825-057749CC77AC@oracle.com>
References: <20230613083204.633896-1-linma@zju.edu.cn>
In-Reply-To: <20230613083204.633896-1-linma@zju.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS0PR10MB6173:EE_
x-ms-office365-filtering-correlation-id: da53d98a-83d8-4892-09a0-08db6c167dee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w7WOnTYifWD2QNy7YREiNFz5iarLwqZM41hJK17PeZ0YZ6a6HZfVWDjG1M4uYmwTIjEC1cgcvHXt5WBFio+4XUEh2CWT2IbPqt2cwwelcMymVoe75dj8v2WQNZ5Kc2hi3vsSjwwqMT+kE934Fc25t6/n9eH9iQ3KxuUDIRNUp8lg+qhPd8VxQ82+177EMhmTblsFMBNM5LiYf1wbtiqQUCrGsNBVAOS/19s6+qq5JPtsqQbIPgYiIkbyK9/0kyAFZsIdp8Y6GPSVoUes2AicsLkbPRCiYz2KegF1FQhwnwVTyEChndjKKlGSTOBpi7FtwEZV5Go+GxUeMSwIa+4RWpqUl1tQYXER8unHudWBl4eTfdVubNJegZFFs4Les97lPK9Ywvj3WNC9RrfQTRISMwOapguJziOiyFu8N4l8D87Dg2UID4ya/8TBY+0uh8zPSjVDgg7CSKrL2vtZOVW/chx3GIY13ll+qPA6ExdTzBqeAw1bEDvRrAk2dQNi/vRY0CTpYwl+d3/uBshq/pTXVhVYkkr+4O8AoBfipLoM+8UbBpK9hiQ25hdPf87Tcpmp/1YtETdVH0nrTrMIDPpk3uv2K3obEp06T/nWQ4eEnvc5PuYTwfDyF5CO0eE54wbmNaPyXjKEZ+ddGDdkBisKxw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(2906002)(2616005)(83380400001)(122000001)(86362001)(36756003)(33656002)(38100700002)(5660300002)(54906003)(6486002)(316002)(41300700001)(8676002)(38070700005)(478600001)(71200400001)(66556008)(64756008)(66446008)(66476007)(53546011)(76116006)(4326008)(6512007)(6506007)(6916009)(66946007)(91956017)(45080400002)(26005)(8936002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WnDK1j3pgIZI6Tk39wBZWwIPhH2fjHm4dMedG8KZlS1/ySzVU1LbT1++H0a4?=
 =?us-ascii?Q?tuTqCDDmxKzjehO/XpT+spvqbyfuNBjng/LjVoOFfYWVQwqNnsvEBl4nNObq?=
 =?us-ascii?Q?tWC38agE+GYaxPEpI0O3WRHDEGADq3cS9aLB6YRFPk+w0yEWuaUDWmtHJn+y?=
 =?us-ascii?Q?l5eORJKik3tURX6SM8sQmmd6PC4MwIUHeYG6yHEaUEemcTOeHaaIgk2lFu7q?=
 =?us-ascii?Q?0w2Mt/TVq6UmpEnH+jGjpMOEadJYkGynN1A8nhRl+kuYYNI+TXi7PTZbLO1C?=
 =?us-ascii?Q?0PY0z4XR5HxWl2SfzS7GOuEzTNIgUtA8X3PMeQH9Xv4HUpd04xrW+U4Wc7ZJ?=
 =?us-ascii?Q?8geVIuCIQnelc9B9exxYSPDJ6sEFkjJgj675ftsRqmYBSL6t7Ds7DmoDRqH9?=
 =?us-ascii?Q?T8qE23aGH/u7/vg3rBNErVbBMcbZ91ooKZ5sVH0YYyKzsfZS+zBqgH5dtVMs?=
 =?us-ascii?Q?wAVau3rtbbOq2sjfzARGzI4eeQpdkPlNhV36mwBeNeGKRU4SiYgrfB45nP5U?=
 =?us-ascii?Q?fuEWwMlhWC9LxYciWkhdcJO2b89wc5ntMEa2v/u5PMdwbLCQwPeBUMYODSkd?=
 =?us-ascii?Q?vdTleY8mGTKs10QK5HwFlKkyT6bPamDViNaIhjPZQmVmHCG8zzNsnNjDP1Pv?=
 =?us-ascii?Q?+9uDYaPaRXIe0ZBRqbuB8W7ZoLxwd+whzyonPQ+2R8gfkdRIbRKYQa7U2ZD7?=
 =?us-ascii?Q?/GLT7/v1u8QeSApkjKFrk8phEmp98t25eebjWgvk4qsSkIwDvBFu4OE+LW4e?=
 =?us-ascii?Q?TG0w9dDHmudVyPtwjl6KfUiRwRo+ZEU+j3Sg3nH/XDRH1Q3nonrmFIfNvaqH?=
 =?us-ascii?Q?FTtLYRbKke3ZAWIcXPTg3hlKPYjeJ1l7pA/Zw9DKCBmHse6kdmeDNb2vMKYN?=
 =?us-ascii?Q?AfbXsGQJnqQtt1ICx+N7W3omXvmge4Uq7QGDN7ho8deE0Yj9Q1hS6/5s1dpr?=
 =?us-ascii?Q?fdNAoymD3InH7+1nHGhIhZkvyLUCXGx7C9P8P91RfvdkqSc7QjnePX+WB8QV?=
 =?us-ascii?Q?0lI+tPVRmZu9eVUj36p91vAafLis3ncLUgbvuwZ2+BNrC8QUPPH/YexoAJGc?=
 =?us-ascii?Q?fobmZp8JIoxQL2ZrHCDkksh7nXUIAjZ8WVYA8zNqei8+Vv53qM3OvJegJtm8?=
 =?us-ascii?Q?wq6lNPVNmjOOtwf991rW9GC5FPcmki2r5RHHqOrwmLMvavFT09Dy7xH21VmN?=
 =?us-ascii?Q?6TPkZHyTx7f6UOL1ObmyUrypzi/uwhJhiBzcWwuHPhLAgSi+h6++ESFqZIpH?=
 =?us-ascii?Q?E5JgKbXmamnxW3UsDS2ONObFSaV62NZtWzR9Mgb03aElMLhLVjkavVkVmV/I?=
 =?us-ascii?Q?vR1ifrrbdlQSdqBO0Al9sXZ9nNa5GGvDVxMRXTzajtojC+2Yib0z+Xq4G8gx?=
 =?us-ascii?Q?efT2FOE0qCONM9QzTUhqpft0nKlhdXdE5Dhdq/lwzqVyLLtuVr1dD7BLfR/q?=
 =?us-ascii?Q?Ry9XDyopp275w6sqqVvd+3Z49BUXzpVEUJwfpB+PkvEsjyQHScE+W6WAhHqO?=
 =?us-ascii?Q?9AJ93m8ATMKzhfa3uKvs1V4WiIyGKLTkHyeRgkvfyYrzKanEZZ8mJtLjRmcC?=
 =?us-ascii?Q?JU/+FS+43/fbDuGLNJZ0MgLCwqPq/LqhjAMr+dJbhvaKKP3M+JpyoNv6KSmx?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AB1483A89535D449E612B41A7CB5FC7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EKogYw4/uC5xj2unbjZ3WWgdNSZ1LgiNNyCvTDxOQoXbAaV8wQQ85dojOJcemSVMwFKCw/5YbMw1bmt7fZh7ugGrU7IE/peSookrgUSJM1Ze5NgogRKw9YJxDAc8S5iqhxVeeGWMTM1kQPv8CM4/M46QSTZWhalOmf+W89Vxsbh8N0+JcGe777WG1ZGiZv4EAsZMgQnzfLZP3DrJOfl2KgwnBzUA0aoPOHHu5/nhj7LI0jDZLqGDUrgS3NDNI4AG6a8ATKr04HkHHg4cB9HLcBEHSm2/5cvPD8Uf3OMoXwOpcW2mH636bsWW5Y4WhP7lk3/36yjixSwLsl/mhItVwSjeVdeQ9nuTRjm8ZUptHA4ZdVFfcSZ32F4ZPaW6OBv4AS7Epha4cqISAe/ZuksorD2VC+X6/LN85ALehReimWtXpY+jjFud2GXKnReaVCVAikNmtjUDzgVaTO/unR/oni8vfjNQmwGp1roGWZeGX+qqLv/pmN2cygn4/UdqpG4SE2RcwLwaGVo1Dd9N8naB988bdoHhoDH/9oNeZ2Lazl1y2R+fU08kNB8SeO7MGxBtLdouryEb8btIU63fSxGvFO7Ww64oCnYiXOkgtfZfoaiwhRm98EfXr8aKfbsS2HRXJe6u2Zu+xHn4l0gbxaPIk83D4axbwJbDMsb1+guXXEkzxAy9qB2+SHsg4+OOmxnu+uF+44NWHkEmynmvIrPzPDZOCvSHoz2jhRZHRPSU80mL/GkCgVnzX/wutdRGyVrUxh0bphMcr/whvA1YvKqFxj0mzbcN+IGdZcCY9HqqjVu0LzZJzeYa02PHl/zz/BfxHcFTsn1yfluE8i099++eQwPusOzLa6V2GCHqp+X55vPTSm4p5xe+TRe4raUAOnj1
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da53d98a-83d8-4892-09a0-08db6c167dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 14:00:06.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZ8aRJIbfuGtsy/jSwgaiYEguY3cPNjn7pXCPMlHWFrCUKjNb5iKoJ+To+97YOcpHVuIHN2f4iIR8bZfx5BkSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_16,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306130123
X-Proofpoint-ORIG-GUID: Q69DpPWlfmiQwA3mSIta7ZJu3GG3CifN
X-Proofpoint-GUID: Q69DpPWlfmiQwA3mSIta7ZJu3GG3CifN



> On Jun 13, 2023, at 4:32 AM, Lin Ma <linma@zju.edu.cn> wrote:
>=20
> A reference underflow is found in TLS handshake subsystem that causes a
> direct use-after-free. Part of the crash log is like below:
>=20
> [    2.022114] ------------[ cut here ]------------
> [    2.022193] refcount_t: underflow; use-after-free.
> [    2.022288] WARNING: CPU: 0 PID: 60 at lib/refcount.c:28 refcount_warn=
_saturate+0xbe/0x110
> [    2.022432] Modules linked in:
> [    2.022848] RIP: 0010:refcount_warn_saturate+0xbe/0x110
> [    2.023231] RSP: 0018:ffffc900001bfe18 EFLAGS: 00000286
> [    2.023325] RAX: 0000000000000000 RBX: 0000000000000007 RCX: 00000000f=
fffdfff
> [    2.023438] RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 000000000=
0000001
> [    2.023555] RBP: ffff888004c20098 R08: ffffffff82b392c8 R09: 00000000f=
fffdfff
> [    2.023693] R10: ffffffff82a592e0 R11: ffffffff82b092e0 R12: ffff88800=
4c200d8
> [    2.023813] R13: 0000000000000000 R14: ffff888004c20000 R15: ffffc9000=
0013ca8
> [    2.023930] FS:  0000000000000000(0000) GS:ffff88807dc00000(0000) knlG=
S:0000000000000000
> [    2.024062] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.024161] CR2: ffff888003601000 CR3: 0000000002a2e000 CR4: 000000000=
00006f0
> [    2.024275] Call Trace:
> [    2.024322]  <TASK>
> [    2.024367]  ? __warn+0x7f/0x130
> [    2.024430]  ? refcount_warn_saturate+0xbe/0x110
> [    2.024513]  ? report_bug+0x199/0x1b0
> [    2.024585]  ? handle_bug+0x3c/0x70
> [    2.024676]  ? exc_invalid_op+0x18/0x70
> [    2.024750]  ? asm_exc_invalid_op+0x1a/0x20
> [    2.024830]  ? refcount_warn_saturate+0xbe/0x110
> [    2.024916]  ? refcount_warn_saturate+0xbe/0x110
> [    2.024998]  __tcp_close+0x2f4/0x3d0
> [    2.025065]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [    2.025168]  tcp_close+0x1f/0x70
> [    2.025231]  inet_release+0x33/0x60
> [    2.025297]  sock_release+0x1f/0x80
> [    2.025361]  handshake_req_cancel_test2+0x100/0x2d0
> [    2.025457]  kunit_try_run_case+0x4c/0xa0
> [    2.025532]  kunit_generic_run_threadfn_adapter+0x15/0x20
> [    2.025644]  kthread+0xe1/0x110
> [    2.025708]  ? __pfx_kthread+0x10/0x10
> [    2.025780]  ret_from_fork+0x2c/0x50
>=20
> One can enable CONFIG_NET_HANDSHAKE_KUNIT_TEST config to reproduce above
> crash.
>=20
> The root cause of this bug is that the commit 1ce77c998f04
> ("net/handshake: Unpin sock->file if a handshake is cancelled") adds one
> additional fput() function. That patch claims that the fput() is used to
> enable sock->file to be freed even when user space never calls DONE.
>=20
> However, it seems that the intended DONE routine will never give an
> additional fput() of ths sock->file. The existing two of them are just
> used to balance the reference added in sockfd_lookup().
>=20
> This patch revert the mentioned commit to avoid the use-after-free. The
> patched kernel could successfully pass the KUNIT test and boot to shell.
>=20
> [    0.733613]     # Subtest: Handshake API tests
> [    0.734029]     1..11
> [    0.734255]         KTAP version 1
> [    0.734542]         # Subtest: req_alloc API fuzzing
> [    0.736104]         ok 1 handshake_req_alloc NULL proto
> [    0.736114]         ok 2 handshake_req_alloc CLASS_NONE
> [    0.736559]         ok 3 handshake_req_alloc CLASS_MAX
> [    0.737020]         ok 4 handshake_req_alloc no callbacks
> [    0.737488]         ok 5 handshake_req_alloc no done callback
> [    0.737988]         ok 6 handshake_req_alloc excessive privsize
> [    0.738529]         ok 7 handshake_req_alloc all good
> [    0.739036]     # req_alloc API fuzzing: pass:7 fail:0 skip:0 total:7
> [    0.739444]     ok 1 req_alloc API fuzzing
> [    0.740065]     ok 2 req_submit NULL req arg
> [    0.740436]     ok 3 req_submit NULL sock arg
> [    0.740834]     ok 4 req_submit NULL sock->file
> [    0.741236]     ok 5 req_lookup works
> [    0.741621]     ok 6 req_submit max pending
> [    0.741974]     ok 7 req_submit multiple
> [    0.742382]     ok 8 req_cancel before accept
> [    0.742764]     ok 9 req_cancel after accept
> [    0.743151]     ok 10 req_cancel after done
> [    0.743510]     ok 11 req_destroy works
> [    0.743882] # Handshake API tests: pass:11 fail:0 skip:0 total:11
> [    0.744205] # Totals: pass:17 fail:0 skip:0 total:17
>=20
>=20
> Fixes: 1ce77c998f04 ("net/handshake: Unpin sock->file if a handshake is c=
ancelled")
> Signed-off-by: Lin Ma <linma@zju.edu.cn>

Acked-by: Chuck Lever <chuck.lever@oracle.com <mailto:chuck.lever@oracle.co=
m>>

Thank you for the report and fix, Lin Ma.

It's becoming quite clear to me that running Kunit with the uml helper
is entirely different than enabling Kunit to run at boot time. The
former is an inadequate test.


> ---
> net/handshake/handshake.h | 1 -
> net/handshake/request.c   | 4 ----
> 2 files changed, 5 deletions(-)
>=20
> diff --git a/net/handshake/handshake.h b/net/handshake/handshake.h
> index 8aeaadca844f..4dac965c99df 100644
> --- a/net/handshake/handshake.h
> +++ b/net/handshake/handshake.h
> @@ -31,7 +31,6 @@ struct handshake_req {
> struct list_head hr_list;
> struct rhash_head hr_rhash;
> unsigned long hr_flags;
> - struct file *hr_file;
> const struct handshake_proto *hr_proto;
> struct sock *hr_sk;
> void (*hr_odestruct)(struct sock *sk);
> diff --git a/net/handshake/request.c b/net/handshake/request.c
> index d78d41abb3d9..94d5cef3e048 100644
> --- a/net/handshake/request.c
> +++ b/net/handshake/request.c
> @@ -239,7 +239,6 @@ int handshake_req_submit(struct socket *sock, struct =
handshake_req *req,
> }
> req->hr_odestruct =3D req->hr_sk->sk_destruct;
> req->hr_sk->sk_destruct =3D handshake_sk_destruct;
> - req->hr_file =3D sock->file;
>=20
> ret =3D -EOPNOTSUPP;
> net =3D sock_net(req->hr_sk);
> @@ -335,9 +334,6 @@ bool handshake_req_cancel(struct sock *sk)
> return false;
> }
>=20
> - /* Request accepted and waiting for DONE */
> - fput(req->hr_file);
> -
> out_true:
> trace_handshake_cancel(net, req, sk);
>=20
> --=20
> 2.34.1
>=20

--
Chuck Lever


