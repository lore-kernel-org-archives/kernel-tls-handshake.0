Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A191868
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 20:09:19 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33FHpLIN025704;
	Sat, 15 Apr 2023 20:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=I9euAo8bOabQjKHGxFTS072XWD/w0FynU3aFAht+7eA=;
 b=3q/YS+7qQiViUrZ86bp9CX53Se1E+W1rh8Yy2GLF8k6l1znBKArYVamDaQOEtc3kcPmK
 JdeNdkozOcgZjqazIfZIDnDF6zQgO1Bys+JnxHzZvu850YpJ5dvqUY7cZQUks3PABPQ4
 EDaD96xExE4oSqUYJtD9mkX6X71iN3ZxTHojwShYZmJrpmVJ35zC9mxXTRjjbi4Nt99b
 j0+9z/NaiFEvcai2oAoeKCQc6VQ2RFG4WSbgymu9qXOv+RPoQHoW/mucQ/bkd4THHmZr
 EYpTcfLtPMpr24Iw+poIvByY3/xzEaJBEJUhT0ADtmvwt4QShqO5EBDHtK4Uzc9xst/X Tg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykhtrqrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Apr 2023 20:09:17 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33FG0kuW027735;
	Sat, 15 Apr 2023 20:09:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pyjc8re3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Apr 2023 20:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9PPuT32deW2qoS2gY4GgjM3jzroOY63DzGSpPXLEPXka8ZIwXHBsQU3WKfWdDDzKv6ziZ7s7wizT/xBPOeJ12v9A1NUyNwYpDfMGy1F4Zdh1VtxmmlT2aZuApBtExbXdksRjkRC9xY1SWfZI43MUrt0Vl9OQ8d3wXntZr965iiR8mqDe5RNnLShX90Y2kmC6tL44jk5Wcgwy0fWQm2CIL9yqoA3j3hzGNTMkoVhUUdyTnxPucaWE5TcinWWJkGa4u512PSQj5r3+yBWw97kuxCa0k2Nhh+2T+6jjfdQbzxYj7qhvenSrcNoYglsZcPoI4Mtue/OAtbi0MpCypAXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9euAo8bOabQjKHGxFTS072XWD/w0FynU3aFAht+7eA=;
 b=fozPoFQdclMF8GoKFiFXPRmM9TfTEfjeRlYCKmrGZp+2ulmlFYgQHcc6PZfZwSXPxBoeD81LLpHQG93CC4rNfHlObnBXlCGsqpzUpHZd6htEIPVWUlgT9j/TBSBPI6S4bwxq3OZ8euH2Eq8tTRK8R9Ynl2ZZtQV5nhjKfWoKBBkZrP3OTXNNOJh5JJtcxqf9KJUyPw4c3FU8YNeRC31KFyMkd1hM07El2cpERap1nL4GiIyHlfS37iCyO3J8IwCGfYKo35DuFgaLqD/cbzLzyvVK7zWsR4fmaz+hF72lOVxbsGp69XLxCUzEJC0DiQzM8fgnyIjpkM6AXmGmiOgfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9euAo8bOabQjKHGxFTS072XWD/w0FynU3aFAht+7eA=;
 b=uBBH+S+SRUKoVWqSQaC2yTntLhEocjqvwvb4QLp0SygAqxnyuRAVNyofkK4RSi9uFMT8O4R5A9P90X04QCrb83Zy04ZkJdgc6rg1kFBBZ0+DcRYJsMC9b7w5XPkKF75YwsilFvNXBAtOO/r+1lxkLDrVO+x8Lz5WJc/m/ZT4MnE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4623.namprd10.prod.outlook.com (2603:10b6:a03:2dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sat, 15 Apr
 2023 20:09:15 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 20:09:15 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: advice on kernel configs for NFS with TLS
Thread-Topic: advice on kernel configs for NFS with TLS
Thread-Index: AQHZbw3ReqyVHyuJYk2stoCneux3Sq8rRQMAgAAJeICAAACigIABfwcA
Date: Sat, 15 Apr 2023 20:09:15 +0000
Message-ID: <99E0BBA5-B7AA-4FAB-86D8-D125689211B9@oracle.com>
References: 
 <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
 <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
 <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com>
In-Reply-To: <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4623:EE_
x-ms-office365-filtering-correlation-id: a0219be9-3c02-4ab1-bd21-08db3ded496b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XAzcpx3dg7vxGJAS1rSXHiegl0mLrk6/Zi0iv4ZT/NTa+P90/vKlNW+8mPoZpMqPiUtecyx9Hrz4t5ez0jXkfLd1ux2ExlYKKmg9Vf1bYuacsQIeJitCk557pWyBiDYVI5H0nAC3Ce1ZO9XDPWOYQivN+l6OfEssHKnWZHKib+beMA+ugzsH4SGAdU2CvrZfDZfwWrGINu56C4zbe71dbdOL578BjP9rSb8fNYmKjWxNsA7fB/bp3bap6tt4x3mcgYjGfNHo56g5ePMOIST1jzsDNNCZarFwbfiUoAbg2Bl4o0loJvNwxBFKI3v/n0DvA0Xk1X+LV/rQfioOYzoCRmRfHdnlt2iB1v0TQvlK/2At3J946TqM4TOsXSYhnPvSpABXWMw8FmJJgD6AfUGpsKZdPmcHuf1TOjZq/GzlgLTD8B+PycyTOajRMm40jPmHvUxYhQGFw5PyjE8RMTzIiURTwOujNbsNmMP23V82KntenoUiHVPK3d4JIRG3i1xg5JNUuxkJlmWRbbFQpLv5yfJxJBDu14hTgvhcWazcemQ2XicDKGhQyQSHN6v8Bt6NjfTftCxlMyvM5Mc/pIQoO0haZ9kxHvmlPthqR4xvu25+aWANbruNPvUw1Nndr+bH/kS+WjER/yfnFDtG4Gab/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(5660300002)(71200400001)(6486002)(66556008)(6916009)(66476007)(2906002)(66946007)(4326008)(91956017)(76116006)(64756008)(36756003)(66446008)(86362001)(38070700005)(122000001)(41300700001)(33656002)(478600001)(38100700002)(316002)(8936002)(8676002)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z3NBaFpvTUo3ZHFXcTFVaDlOeDFOeUZpc2xHYis4ZEI1VEpGNGVtV1UxUUpi?=
 =?utf-8?B?USsvUUZPYXQ4elA5SFAxR01pRUt0ZnVSMDlYNG9iSnhiTzU0Vkd3bGg0Rkli?=
 =?utf-8?B?TXg0MVZ3VERHZm9QWjY3UU9xSmt6UUdEL1JXRnMwMDNiaEtuclZHTjBDdUVO?=
 =?utf-8?B?K2RUUS82VzBWWXRwbzFyUjNUWFFuNXlCTldsQzhuN2kySkZJV3dOUFRkQVds?=
 =?utf-8?B?YjI4SDdhNVgyaGwxbFY3SnJ2RVdqOG5oMjBBL2pJRk9ZRkFVNzdzekU3Zzlj?=
 =?utf-8?B?NUVaMmFia0I5MUxpSS9DMUlkK2dHYmtwWHJPVm1zZ3BKS2RtRVBhakVwWFI1?=
 =?utf-8?B?ZjBDQ1BZTWZzdTlGOFFaNS9WTWxFUjNkeWYzaVRpUFN4UUZuVWtTekpLY2JJ?=
 =?utf-8?B?dFRhWXNySXdURUw3UDAxeGtuNnhHNjcrcjFpUlEzQk1lT2Zod0x4REZLYVdD?=
 =?utf-8?B?a3M0L1g5YitzQWxnZE44aTk4UDlsdEgweUtJbEYwMWUyeXBzYWJZT0I0WkI0?=
 =?utf-8?B?UmtSRjhWOFFvbzFKaWpGN3h5L3d0UGViSHBpK1AyazJ5dmlpbzFESUhaaGE5?=
 =?utf-8?B?VmpGNXBBeEJiTUVpYTdtWjBxaG1NM3BROWh0dlVtb28vYTk0M3JOeXdraWdG?=
 =?utf-8?B?YmRCRFgwRFJYM2NBRVZ5S0VLVjdGc3BTZDcxSnF4YXpQREdSblkwaGh4ZVgz?=
 =?utf-8?B?aHdNOCtvZjdSMWpxK1F4UnE0MzVZR0orRk1SNWNqc1ZIaG5SNWJmK2YvVTNh?=
 =?utf-8?B?cjZ0UWFldGh4S1lpWjVNZkRHQTZXNXByK2prMGFPTXo2NnJhTi9DVUNNcFlz?=
 =?utf-8?B?ZjVvNVBwcGdNL1gzVWMwdG1uT1NHeVl1VlVwZCs2cEZJdk13VWZQaUZNZHV2?=
 =?utf-8?B?WFBYY2RkTU1VS25qUlowc2NhUEJKTjhpRkhKZkJLRVc4RXVyQXRUUE5MWDYy?=
 =?utf-8?B?N3RmWFcwU0piTXBvVk9JaWNKNmJsMmZLblQ5SDdJdHZnUkRISG1yQXVGWm1O?=
 =?utf-8?B?aXlDME4vK3NhM2Vva3NWQkFRNnN5YWNuV2ZWUTBPTXNTTnV1MUNpcCt6d2J0?=
 =?utf-8?B?WHY3Qk4vRHpGMEo5VXV0UEJTbXQraHR1K2NHdE42OGZZcjFGeFJqaGxXQ0gr?=
 =?utf-8?B?eGJ2a0F2SkptN0dVM2M2Tzd5bml6R0N0cXplNEF1cFBGZjdDVlh6cVN2WTJ1?=
 =?utf-8?B?T1VkWWloSjRMYkhsY1lXNThrN2xMRHBaT3d3WlNPZ3hHUldHekMzcHRYY3lO?=
 =?utf-8?B?LzZHVDBTVWpyNTJJQnVVcnVJaTBnM0tDYXZQdWJCbXdoOVlyb3VHcFUrbTRK?=
 =?utf-8?B?M1BmSFU1WEJ0SGptTGFlZFYvdS9aWTdvdWRML3RvSEsxb3VoaU9MelVKSFRG?=
 =?utf-8?B?eGlodDNGN01XaU1NYkd3dmsvck0rd1c5VU9oUktxSUM1elBPSUhlS21TYWVH?=
 =?utf-8?B?OVU5WWIrSUtabXNNM0FjZ0h0UzhycGNGT2NmZlZXQ01pK3o4dHYvWlNYakxz?=
 =?utf-8?B?SitnNXNVTGh0bzEycFZpZFQ1WTZHdFQreEhOMDl1QlpHa25rQS8yVElLOS9E?=
 =?utf-8?B?SVVXTnlqWW5LT0V3NG1zT2FVbzloNVgrWWo3WTRFS1RrdEw4anVCLzNZSUdt?=
 =?utf-8?B?RmNobW81cW1UamRxbzZVLy9sL3ZDdmZ1OEQ2Q0lmNVliNnMzaE9aYzlaUElX?=
 =?utf-8?B?dTlISHpRc2x0ODdJVDR0eVYvNkdyQ3plM3JPMTBHS2hsczhSVkRmMWZUSFh5?=
 =?utf-8?B?SmJQSnVhV2RneHJ0TEZKcnR6cUVZSmFsQVU0REZTWHdOTWR3RTBCVmlzZGJr?=
 =?utf-8?B?U3ZLUi9hMEptd1VqZnZId1Y4K21XaGM2TVhsZEN6Zkt1Z0J1MlVQMm92U2FO?=
 =?utf-8?B?ZVhpZmtxdFk5Yyt6UGtZbHdtd0pGeXJLL3ZsckM1aUtFaUdOU3c4akZrNW1K?=
 =?utf-8?B?MG45bzk2bkEveHRodlpLTmNhYTZVMEE1TS9uK2FSdUZDS0V3ZC9icDBxd3dT?=
 =?utf-8?B?Tnp5L3l2aTZUUVk2TlVhaXFpdzZQVklkVnhDTERjWmR4RVUwa05JZVdNRFF6?=
 =?utf-8?B?Nml3L0VNZ2JRZ1FGdUNLcmpIVmRSU0pGZU90RENsWEtvUVNMS1NQUmV3M2d6?=
 =?utf-8?B?ZXRwb0JMSjVWa3l3QUlESWJRVWRzU2lrSTFyZXZkTHpmakJxc0dCYndITEZ0?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4035BB70B8B004CB089B106495CBC15@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1VrRybGJKxVgR0Lng+3e2y64ixW4z4LuHkA8KJ0ziy2hRC484FoKSM8g94rupyzQxILt/EBykeZN598IaOPQgsYtcsiowERxv3upmU/NeOov3aykES2tx/JxgiB1pcY4VBf6GoBH4BHqFi4jXwQEGEr7iy1/A5hoZBw9fEBl4RBVVd8eABHAZ0wDlFJrJBaeiPEObB8BlDLqjWVeMio58h51glBiT+fsQ8m9hk6/lBWZw+msFJH87xytrhZp1O34bjSq4+CgtEdVlNXihK29hsi2ZSHYYw3JrRTiaffoVWa8ALVc6elNdnNnvt16Q7hDtq1zbehOPtyT+bvTxHCCWP/+m1uo/Uohf/xb1FQdlbJQeEWYJezRvoK2lAE9pNC4Z+wIVQvVzf2H0UHk/Shz2R5pycrp0m43h5EwD/TH0p8SVav+2wfB1VlQzHIGzwgwY8O4qRCOkPDBCgCNH3HL6VMqLC4t1xpTgBoafX4KUdMIjSrEwxMrmVv0Rdc139WWJgBmkz6xE5zVZ8ITpjDUjMUOopToz0YY21m6xN0EirIkk4d4IXqQSwoW+p1HiSCqWww3YAUfrjR2DKeYBSgtpf4TKSeSz7sXDuKvfljyNa5L79SEojHL6T8HfmMDNW6NM1y4ekioloL1WMteeXH77c9C5KS9tR8w5XHZTl+bAz97YKff8mBqh0LYx2uXxQ9HgN7d9DdencoHDdz+WP13VpCE+sYP2wNj0Jo1zcD0gJnnXQGfqOjJh4QTQ4sZ2mL70tOZsKoVM88gsxUR/UXg+2AvSpVoiv9jiZmSnQN4mZY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0219be9-3c02-4ab1-bd21-08db3ded496b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 20:09:15.0946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8FqEo/XgxHHDuBmPPLQBkYN9vbCw6ih1UIH5Rjti44wmGDMLfDvXLoRJEi4bZnagZw4L6M8bhlZLp55aT8h4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4623
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-15_10,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304150187
X-Proofpoint-GUID: xLM6FAYd01u8iWVQPgncP5FCVz5IDNGQ
X-Proofpoint-ORIG-GUID: xLM6FAYd01u8iWVQPgncP5FCVz5IDNGQ

DQo+IE9uIEFwciAxNCwgMjAyMywgYXQgNToxOCBQTSwgQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5s
ZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+PiBPbiBBcHIgMTQsIDIwMjMsIGF0IDU6MTUg
UE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+PiANCj4+IE9u
IEZyaSwgQXByIDE0LCAyMDIzIGF0IDQ6NDLigK9QTSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxl
dmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+PiBPbiBBcHIgMTQsIDIwMjMsIGF0IDQ6
MTQgUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4+IA0K
Pj4+PiBIaSBmb2xrcywNCj4+Pj4gDQo+Pj4+IERvIHdlIGhhdmUgZ3VpZGVsaW5lcyBmb3IgaG93
IG9uZSB3ZXJlIHRvIGJ1aWxkIGEga2VybmVsIHRoYXQgd291bGQNCj4+Pj4gc3VwcG9ydCBORlMg
d2l0aCBUTFM/IEFzIGluIHdoYXQga2VybmVsIG9wdGlvbnMgYXJlIHJlcXVpcmVkIHRvIGJlDQo+
Pj4+IHR1cm5lZCBvbiAoYW5kIHdoYXQgb2ZmKT8gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24g
dGhhdCBpZiBvbmUgd2VyZQ0KPj4+PiB0byBzdGFydCB3aXRoIGEgYmFzZSBSSEVMOSBrZXJuZWwg
Y29uZmlnIHRoYXQgd291bGQgYmUgc3VmZmljaWVudC4gQnV0DQo+Pj4+IEkgYmVsaWV2ZSBJJ20g
d3JvbmcuDQo+Pj4+IA0KPj4+PiBGb3Igc29tZSByZWFzb24gd2hlbiBDT05GSUdfS1VOSVQgaXMg
ZW5hYmxlZCBpdCBsZWFkcyB0byBhIGtlcm5lbA0KPj4+PiB3aGVyZSB0aGUgdXBjYWxsIGRvZXNu
J3QgaGFwcGVuLiBUaGUga2VybmVsIGxvZ3MgdGhhdCBpdCBkaWQNCj4+Pj4gaGFuZHNoYWtlX3N1
Ym1pdCgpIGJ1dCB0aGUgdGxzaGQgbmV2ZXIgZ2V0cyBhbnl0aGluZy4gSSBkb24ndCBrbm93IHdo
eQ0KPj4+PiB0aGlzIGtlcm5lbCBvcHRpb25zIGxlYWRzIHRvIHRoaXMgYmVoYXZpb3IgYXMgSSdt
IGF0IGEgbG9zcyBob3cgdG8NCj4+Pj4gZGVidWcgbmV0bGluayB1cGNhbGwuDQo+Pj4gDQo+Pj4g
aGFuZHNoYWtlX2dlbmxfbm90aWZ5KCkgaXMgYSBuby1vcCB3aGVuIENPTkZJR19LVU5JVCBpcyBl
bmFibGVkLg0KPj4+IA0KPj4+IE5vdCBzdWdnZXN0aW5nIHRoYXQncyB0aGUgYmVzdCBsb25nLXRl
cm0gYXJyYW5nZW1lbnQsIGJ1dA0KPj4+IG5vdGlmaWNhdGlvbiBpcyBkaXNhYmxlZCB3aGVuIEtV
TklUIGlzIHJ1bm5pbmcgc28gdGhhdA0KPj4+IHRoZSBLdW5pdCB0ZXN0cyBkb24ndCBkZXBlbmQg
b24gaGF2aW5nIGEgdGxzaGQgcnVubmluZy4NCj4+IA0KPj4gVGhhbmsgeW91IGZvciB0aGUgZXhw
bGFuYXRpb24uIElzIGl0IGZhaXIgdG8gc2F5IHRoYXQgdG8gaGF2ZSBORlMgd2l0aA0KPj4gVExT
IENPTkZJR19LVU5JVCBtdXN0IGJlIG9mZj8gSW4gdGhhdCBjYXNlLCBKZWZmLCB3aGF0IHdpbGwg
UkhFTCBkbyBhcw0KPj4gaXQgZGVmaW5lcyBpdCBieSBkZWZhdWx0PyBPciBkb2VzIGl0IG1lYW4g
dGhhdCBoYW5kc2hha2VfZ2VubF9ub3RpZnkoKQ0KPj4gbmVlZHMgdG8gYmUgcmVpbXBsZW1lbnRl
ZCB0byBtYWtlIHN1cmUgaXQncyBuZXZlciBhIG5vLW9wPw0KPiANCj4gSSBkaWRuJ3QgcmVhbGl6
ZSB0aGF0IGRpc3RyaWJ1dGlvbnMgYnVpbGQgd2l0aCBDT05GSUdfS1VOSVQNCj4gZW5hYmxlZC4g
SSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgYW5vdGhlciB3YXkgdG8gZGlzYWJsZQ0KPiB0bHNoZCBu
b3RpZmljYXRpb24gd2hlbiBydW5uaW5nIEt1bml0IHRlc3RzLg0KDQpVc2luZyBhIGRpc2Nvbm5l
Y3RlZCB0YWcgZGlkbid0IHNlZW0gbGlrZSBhIHBvcHVsYXIgaWRlYSwgc28NCkkndmUgcHVzaGVk
IGEgZml4IHRvIHRvcGljLXJwYy13aXRoLXRscy11cGNhbGwuIFlvdSBzaG91bGQNCm5vdyBiZSBh
YmxlIHRvIGJ1aWxkIGEgd29ya2luZyBSUEMtd2l0aC1UTFMgc3lzdGVtIHdpdGgNCkNPTkZJR19L
VU5JVCBzZXQuDQoNClRoaXMgcHVzaCBhbHNvIHJlYmFzZXMgdGhlIGJyYW5jaCBvbiB0aGUgbGF0
ZXN0IG5ldC1uZXh0IHRyZWUsDQphbmQgYXR0ZW1wdHMgdG8gYWRkcmVzcyB0aGUgd2FybmluZyBh
Ym91dCAua3VuaXRjb25maWcgZmlsZXMNCmJlaW5nIGlnbm9yZWQuDQoNCi0tDQpDaHVjayBMZXZl
cg0KDQoNCg==
