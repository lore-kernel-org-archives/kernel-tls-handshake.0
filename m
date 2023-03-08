Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46278462
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 17:54:19 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328HiGl7011096;
	Wed, 8 Mar 2023 17:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=IF/JmcilcM7mgER1um7H7RC5CATr3UHcax20nnQhtcg=;
 b=wL7W0YGJEMpiCDq/wMJMza57OK1HCzKhns18uOttYW2TwYjUu0gyn4Ef3cLZ5XAUNj5J
 Z2J/A/8M/OaosTqtbdFy76v8OQyJIGYP3lO7cSuajXFt/NPNzjEbPFsB+tJv+FlHGFaa
 VRo5CX8+upWl1lmikpL5e1iNyMu6iAdEtO40IuuTXcVPF6YwNQHp2rbw6IlU6Dsx4Ukt
 NaxsJ3oJjnsYnBtfYktVnX/ELDS/yfhf3Ta/ZO47aC5j0z6zflNQHFxfApx38+pGmpzr
 fzfjKWBP2xS6G5rpyAPq5aglp/L74WoUL2JZC+nYuxN+t6Ih/rBqUnCzNCStCv63MR2U 6Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cgsf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 17:54:18 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 328HcASO015518;
	Wed, 8 Mar 2023 17:54:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p6femkn7p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 17:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az1F7oHN7KMqcgxFLFXLyM2moR12mcfd4DMwc8a2z2urvbupZNv+lfPTj1NXAu6PKrCVoLJYG4BPN4SNd5+w595a7lPM4FWsvviVHltJcOC9/xEzyl9Qxvb0zzW6/3WVR3MVNfJJTDRoWwSS53m06TxwObKw8SD16g436Wiqt0nAW1j/ZdToa+uPKVJRG1ak1UHUbO9A+Qe0/ggOrfHyjREtD/x0BMqeRqGCPyFohRW2PD7mHTiYIU/18sZnldV/GJ6+qwxH5M6tEGcsmIaVmO6GFT9wwu+Fpmh0CRa7u1TodMmWKit1XpgjZS70FLm4a1FZRwinxAAmyhrgVTjgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF/JmcilcM7mgER1um7H7RC5CATr3UHcax20nnQhtcg=;
 b=P0ZCPU7ooPlGSsWyz5v00B/5GM5NuJr1eh3ZV1xax0CUeIzLMNp0O/YwlSC36hBlxN4E5JQOW8MR63b48e+s3PbiArnzPRkVRDJKKv8RmU6/Ofoosly2WoO/hni50P2d0G5qkjnx5KmkXQmmcM96T2rBTpT3bS3qJu1Rlkz2M7e1VKKJ0r2pACmXidv/xVDaUubDBOn6NLYhYFDOEFeXRkahdRRYVl2aF7Vh4dUnSTOBpZXT8UDeBUbv/9UxrjxryLv6rQ00vQ0yQGu3IThBkwIHVg7AcuEcGN2LpcA/huomsbcV1gXUYxpAShYYM6ua1UljIqtFMvQaRVBccUKc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF/JmcilcM7mgER1um7H7RC5CATr3UHcax20nnQhtcg=;
 b=KygR5nS9xg2E+OQQPxdY0WeXF5pcigkNcVXjioPWGVC3ndr3917GKwNmu51mSkglgcrZh85oHRFu1Bes38dm9e/C2PO8S5E84iRXxGB7wnVomw1uVypfaVuz7pT3MR5oBiUFSp0KgdODMKeAZztzWvMgYb/UQqeICjjz1FYE6dI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY8PR10MB6561.namprd10.prod.outlook.com (2603:10b6:930:5b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 17:53:56 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 17:53:56 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: fput() considered harmful
Thread-Topic: fput() considered harmful
Thread-Index: AQHZUcFEoHLUIOt2hk6BHhAhP1frJK7w5EqAgAAg0wCAAAapAIAAGNqAgAAFxIA=
Date: Wed, 8 Mar 2023 17:53:56 +0000
Message-ID: <F9515338-1733-4DE3-9132-6DE49C0B50CD@oracle.com>
References: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
 <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
 <59EF30C0-05F8-458E-8BAF-36A9CC757D00@oracle.com>
 <c519d883-5e08-0d28-dee8-89f1a7f197e3@suse.de>
 <0ab549c7-d482-1b50-5630-c604e4c92179@suse.de>
In-Reply-To: <0ab549c7-d482-1b50-5630-c604e4c92179@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CY8PR10MB6561:EE_
x-ms-office365-filtering-correlation-id: 01910580-90b9-451c-6fd0-08db1ffe1693
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MuMmlHiIaOksH3lyLlaSc9kxvGanBsBFF4YPPQPaJm4uiVGlLfYDXmeX7376F03ishUGYty7hD5/2rxbGBZjNTfco9wey3IOATOaOyIMxHTwpKhK2ZVHgyjH/UdEsXXu5kt4zOIZzYHzWNZ9j5EOZIbwgN7DXbUvH64sOhCaHQmbZVnNpMrqddru9v3O2VgFaYCbt2HeA0+TPfwKNnJHaSObmENK01DYYbNWhlljgDEbEu2fgUUB8mFQcjHS+NfufK29cRcowFKDO7aEeceOb1f5f0Zoxg3DoHDFZz/dlTdDAaFqhsPg/cHBR+dzE2PBjXs1+6XHrcQNGxJDCDEmniOwnMdJcV5ot6JFe3ll2+90xNxLE+gshLExb+U7A3P/dnd/TyAG/mrdIw/pVFwtSBykku8zCJpTBhCttJN+/GG9ejtkfsh6hkZDuJllz1Rbt91sHfWf9Q66qWqvwgXXRPzBnJQeSD93iCd+E83RPHtbkscI5oIJ1IIr3VpS+seGruW/B6Y0dnorvxCfvF8t6Yw0HYraecSDgc+Q3abtYOhI7alk5uUOCLbTSWZouu8F5i92toYDKFpYyvRAKoRPT+RzjQbepVIvZr3GOsh1oMHpRbfucmmr9onU7j4luEouoApiduTuUKK+TTQhgQuFfXmS3Vd/RQKTD0KvZyrEJePG80ydvbiS8nWh4Mq7KPQrBhxIOGNOrZWL+JHWy+atjrUoqQO4ZzM90dTqb0p+XzE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199018)(5660300002)(478600001)(86362001)(36756003)(186003)(71200400001)(26005)(6506007)(6512007)(2616005)(33656002)(53546011)(2906002)(6486002)(316002)(76116006)(66476007)(66446008)(66556008)(64756008)(66946007)(122000001)(91956017)(8676002)(4326008)(6916009)(38100700002)(83380400001)(38070700005)(8936002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DHfKS0ZE30g1k/8oegGS5PmsZbeeXDP3/zOCTThs491Aast2aMiQiADqoceZ?=
 =?us-ascii?Q?ldMTYJ713bobvsi9MSmEj8NFdubW/oKtqJVlWZzVx/kW4zd8dMXj6sDZSbij?=
 =?us-ascii?Q?SDT5D89IbCVZIdoPwQPqU5uu4FW1flB7kZ0SgpmQCpRgmfyAchE2tRhW+f0W?=
 =?us-ascii?Q?/ROdN0WrMez6hhlodLJWdE60vQrLn9CRzdr0+S+JmCysVXUvXKt+K8+svE6s?=
 =?us-ascii?Q?LGDxfPQd6+EsI2SdaqC1Z80lzqxJorrkOfpZgK2bcL5LJ6yXqlqr6X6Xen+T?=
 =?us-ascii?Q?okZgYAjmqawQ2p3DIMd5lJmhiJ1PO32pW/89sEIfV6yk0XhOMrBM5z9E+dCO?=
 =?us-ascii?Q?MT/Zgdv4nSzb2pvyEyi0E78oe9ila5iu7z+ElWd4ThoO+xt6mL4CdLv4d6fZ?=
 =?us-ascii?Q?ygdpLRzknBtNXt1xlA92BjjXxLKSwG0/LRGW3Hp/Ue8wJTJjV7bgebPQMjad?=
 =?us-ascii?Q?PzQdcL+pS+D1pcc+s6JUAYNhHr3Y9DvWeSee6unoZyoY/lymn22DHj1sqjLH?=
 =?us-ascii?Q?DgUYUchOIPYDoiUUARD9Si1BYAm2AbKesNBnSMo4ADEhLrwi2Iiaw4rvXgDs?=
 =?us-ascii?Q?T0382NLI0GDZIthEOu0QJymAh5+F9LU8+99iZXioRWnq1zM4TPe9Ue0Rlzzd?=
 =?us-ascii?Q?bkIzOfqZMFbvrrSV20yeqJ8xFVHMcHVTjUJaW/zfmu83UhK/RAE7NkFhpQwk?=
 =?us-ascii?Q?7ATs/Gzq5D0JQbleLnXqWKxiAY1SxPLj08/SatNKnu3z7UfgLGjhK0WI/xwx?=
 =?us-ascii?Q?j2ONQClxCkXTemfl4+txffR2ixIzcMAIOPTo8UFN8LcmE6oEOJRX19KP05UP?=
 =?us-ascii?Q?QDI5J9mq0i1H+yn41rBHwa20ToRsGdXli5dLsWjI0UdV6Ti61qiIn+fSQWJt?=
 =?us-ascii?Q?heLvLu0DNP6AU2ZvfjPGOAeqanSP5iIgTHSbLKz77l6qvNEeVo/bn1a4vzYZ?=
 =?us-ascii?Q?y/k3dNBHmlgPAXA+rv12Zjlg+iVm/p2uukWXrHxMoUuboUpaiGo78PtjDu1p?=
 =?us-ascii?Q?5NuwgUOZnU8wCvQ4ok+koni2020t6a23VYAX6+KPGYOY+czQ9VFHq+WoxipE?=
 =?us-ascii?Q?jQBHJ8sUlbRr5dP6B0ajrvbAJqlSBKSOYYsh2BIQ2cHl+yVTTra4NdHoS5ry?=
 =?us-ascii?Q?xDMNKQmk6mEdg9hVIpAlxNPEO71OnrY092T6620EYXDI8StfyTN+2Xy1LzHQ?=
 =?us-ascii?Q?/5+2iF9dpe6T70HofKo3rRFIQqqDb7BI9BdRHpqgZlmrhuLQSx8/y8QrGsvT?=
 =?us-ascii?Q?V+O/NjYckjBiWHQqrdXKzIt7WdbnAcCIpnEXMbm4UILGYDjpnuj85Ohe66g4?=
 =?us-ascii?Q?1wUhqMjn1bzge/wogLKHrmJ3ZA5xHK3Je4skqv9k32gNhVkqpWLcbchEcdgG?=
 =?us-ascii?Q?hUWoX/QK7LKRticbiCzyPfzb1I2lWjFeqaRjC6wtxNPPjQgGFVKiPSsxaTia?=
 =?us-ascii?Q?wldEfm702gCxOSaTTY8qPPPUUJtyakgX/89j3aNtASyxm1/7g4Da/bqTxCry?=
 =?us-ascii?Q?ZDtOokVqGqDr3ugamexcV4jfdm7P64387RF2/wRDUDNuYpfAWxwNzb/n3GcC?=
 =?us-ascii?Q?I/myEt9q5trXnrW8XH9K0BPFcp4G0PPnFMsK7Jzk6RWnlWPmaU+0zW5kN7nZ?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A80106D0E0710E40AEDE29A4F07CD7F1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vNbGJzpA4HSouTi5LYkpp3tQuN40Fy863ejzqrdTPMoqdF/Qthv4aZvqXzuNtFAzIS6wg9eS5+SP60eKov77y9VUsIcp8+Ewk+T8YEaTz9a1fIkxAOj1kb37ILOiV1JXOqeMsWCQ9G4lWuEl5yPDb1s4tmZ5rewlj0omGAas0scjzfe2ZGEJj7m/QIoE/KGSBM+T8r8rwc+lHlSIptNgAsChiWHPhaN1nNTxizZojt/48FCETXCIv2nEy4LxKUftGA/rRpzEqRFaLbSHf8YNxO5nXFZj7lqnSRwHoDmeCrm6WpBKkAjqg4ziYOFzfb/34/ilbW7/hhBeJriJTrx0iK0TC4Mg3TPu4UOg7d0XL/Db3CxJNolG7bGphHYSEfMKydGN15KR9P3smMjK1GsIBnNehrQhm5pKOE5jZjBWrdHqHhPCf+QnkWfHn+LViQoA39obUvZrSjJZxqGAYiyCPc0gc2bs8OxDT4sqe7TKWfd7T2PiR9HICLyGdNiAnXcSw/+AZgkjqwejndqYCgk6sXfDJJuf6iKb6r7l4VKM91Fh7gznFAA96PxCjYnMnetoZso2PXWenB9OUXqP1EVIcdVwMQGqwUOPhRnj00yyZNsAuV8yEGDcTh5m3z9y1/vc7O+iHJwCsreZq5+s1LsN/EOOET6tH49o8Hx3LIYqlMTXpm5IyUOybbbqwDZG2Y/lzrzdDgvUCX7tyx5jZp8Zje/OosvH7fSDRxLKlR338wfpSSQYpMl2TUQdCqttJg9z6I4FjfUrV00jQSbAB3jgAA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01910580-90b9-451c-6fd0-08db1ffe1693
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 17:53:56.3816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fiIw4i0DpG0rVyowArrNkPOSRmpMWVggDMHvJe+E8ZOplEyGZh8OIT0fBiwH4VBumxZfwnVbHyd3xUNps8Wlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_12,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080153
X-Proofpoint-GUID: W0kZkpFkk7AviaJCpKCwpR2RovLgy3V_
X-Proofpoint-ORIG-GUID: W0kZkpFkk7AviaJCpKCwpR2RovLgy3V_



> On Mar 8, 2023, at 12:33 PM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 3/8/23 17:04, Hannes Reinecke wrote:
>> On 3/8/23 16:40, Chuck Lever III wrote:
>>>=20
>>>=20
>>>> On Mar 8, 2023, at 8:43 AM, Chuck Lever III <chuck.lever@oracle.com> w=
rote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On Mar 8, 2023, at 8:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>>=20
>>>>> Hi Chuck,
>>>>>=20
>>>>> I'm playing around with v6 and (again) facing really nasty crashes:
>>>>>=20
>>>>> [ 1662.912887] ------------[ cut here ]------------
>>>>> [ 1662.913399] kernel BUG at fs/inode.c:1763!
>>>>> [ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>>>>> [ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G =
      E      6.2.0-rc4-54-default+ #231
>>>>> [ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BI=
OS 0.0.0 02/06/2015
>>>>> [ 1662.915932] RIP: 0010:iput+0x1d/0x20
>>>>> [ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 =
00 00 48 85 ff 74 0e f6 87 98 00 00 00 40
>>>>> 75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 0f 1f 44
>>>>> [ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
>>>>> [ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 00000=
00000000064
>>>>> [ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: ffff9=
53bcbb23b00
>>>>> [ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: ffff9=
53bcbb23b00
>>>>> [ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: ffff9=
53bcb9d91d8
>>>>> [ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: ffff9=
53b83918cb8
>>>>> [ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) =
knlGS:0000000000000000
>>>>> [ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> [ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 00000=
00000350ee0
>>>>> [ 1662.923568] Call Trace:
>>>>> [ 1662.923801]  <TASK>
>>>>> [ 1662.924006]  __dentry_kill+0xca/0x160
>>>>> [ 1662.924353]  __fput+0xdf/0x240
>>>>> [ 1662.924652]  task_work_run+0x67/0xa0
>>>>> [ 1662.924992]  do_exit+0x343/0xb50
>>>>> [ 1662.925302]  do_group_exit+0x2d/0x80
>>>>> [ 1662.925644]  __x64_sys_exit_group+0x14/0x20
>>>>> [ 1662.926039]  do_syscall_64+0x31/0x80
>>>>>=20
>>>>> Key problem seems to be userspace here, which (apparently) is calling=
 close() on the fd which we've passed from the kernel.
>>>>> While this _normally_ is not a problem, in our case we have the probl=
em
>>>>> that the filedescriptor is associated with a socket (ie struct socket=
).
>>>>> And that one is shared between kernel code and userland.
>>>>> And doesn't have any refcounting whatsoever; socket_release() removes=
 the reference to the underlying file:
>>>>>=20
>>>>>     if (!sock->file) {
>>>>>         iput(SOCK_INODE(sock));
>>>>>         return;
>>>>>     }
>>>>>     sock->file =3D NULL;
>>>>>=20
>>>>> ie if _another_ process (the kernel driver, say) is calling 'close()'=
, too, it'll run into the
>>>>> !sock->file condition and crash in iput().
>>>>>=20
>>>>> I have been testing various things here, not calling fput, calling ge=
t_file() etc, but either
>>>>> hit a crash or kmemleak complaining about
>>>>> the file not being freed.
>>>>>=20
>>>>> Have you seen similar issues?
>>>>=20
>>>> I have, and they all vanished with the introduction of handshake_dup a=
nd haven't returned.
>>>>=20
>>>>=20
>>>>> And even if you haven't: relying on userspace _not_ to call 'close()'
>>>>> on the socket seems to be a quite dangerous concept.
>>>>=20
>>>> - The kernel "closes" that file descriptor anyway when the process exi=
ts. Is that not the
>>>> same as a user space close(2) ?
>>>>=20
>>>> - The endpoint was created via dup, so calling close on it should mere=
ly remove that endpoint
>>>> and not trigger a sock_release().
>>>>=20
>>>> AIUI the reference counting of the struct file * is what prevents user=
 space from calling ->release.
>>>> So maybe NVMe needs another get_file() somewhere before it calls tls_s=
erver_hello_psk().
>>>=20
>>> I added an explicit "close(sockfd);return;" in src/tlshd/handshake.c.
>>> I tried it once with the close /before/ doing the handshake, and once
>>> with the close /after/. I don't see any kernel issues on my server
>>> system when a client attempts to handshake with it.
>>>=20
>>> Based on what I've read here, the missing get_file() theory seems
>>> plausible.
>>>=20
>> Hmm. Let's see.
>> I must say the lifetime rules for 'struct file' (or 'struct socket') are=
 still somewhat beyond me.
>> Currently I have to do a
>> sock_alloc_file()
>> _and_
>> get_file()
>> before calling tls_client_hello_psk() to avoid a crash.
>> One does wonder why; typically the refcount is initialized to '1',
>> so the extra 'get_file()' shouldn't be required.
>> But what do I know ...
>> Oh, grand.
>=20
> sock_alloc_file()
> get_file()
> tls_client_hello_psk()
>=20
> gives a memleak for the socket/file.
>=20
> sock_alloc_file()
> get_file()
> tls_client_hello_psk()
> fput()
>=20
> crashes in handshake_nl_accept_doit()->fput().
>=20
> sock_alloc_file()
> tls_client_hello_psk()
>=20
> crashes with
> kernel BUG at fs/inode.c:1763!
> on tlshd sys_exit().
>=20
> Guess the only way of safely handling this is to
> keep the socket file around until tlshd has
> exited.
>=20
> Sadly that's the _one_ thing I cannot do; I've got a
> on-shot process 'nvme connect' which tries to establish
> the connection and then exits.

SunRPC client does much the same: a kworker is spun up to
perform the connection, then goes away once the connection
has been established or rejected.


> And exist calls 'sock_release()' which will forcibly
> remove the socket file.

I think sockfd_put() might be better. That way the process
that connects can increment the socket's reference count
to prevent it from vanishing.


> I could try to disconnect the socket file before exit, but
> that is ugly as hell.
>=20
> Any ideas?



--
Chuck Lever


