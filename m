Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FA48E9D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 27 Sep 2023 18:10:10 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RGu6mn021863;
	Wed, 27 Sep 2023 18:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=xl8lmTEONK0TEjM2paksUCXlpMXPRf1jdVRzGYn3GiU=;
 b=L1gU/BbSUW8AwFv5Gx/yeri+RPv5n8yDOD8pUohdxCSt3KDlYzfYRHTjBpScV+KPDMc3
 Wt7T6i+DtELyZaV/eq1GbG1sCtsTtHZM5TwLKnTTsjZ4NlLdRCmAf0UqSkyYTHB/cHts
 biYf2U1WQZjMbUzjViSpbTbVZZSsNA2/As9DjYnjPDt4QSwWOR3GHllUsNCKRLYEQypo
 SLbDVxSAHfpOjkxux01IhHRNXe4JdRAjbmillrsZMvpQlvPt9Lr/wQwwzLzw2DI3tlk/
 ipBn0vBJ4KVWXEZVVaOMKAKTDExmAHKCoytqpY2mfv5bmBQtKVD7K/Dh3Lw0tIBgRREc nA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9rjuj82c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 18:10:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38RHd49o034947;
	Wed, 27 Sep 2023 18:10:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pf8mg9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 18:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbFfTvncIRKsIGZmBaBkjdF8ttX1nejNA+dO9sb2S2KFxxuXSaSpYyglJF8XDq/veO/iukkY2iqvefybzUqjRg/ZsJ7E0kRLoB3IXbxNOtnSvGavBt+TiuXkH3hMj+ko/j0ho0uqJuY71T8H4oQzRhvLW3WqYSBCyg5JDOz+3f2D558Fc8c0oy4x0l2tiKXBL6GrL+mtRW/vxVytIhvk3/KxkWJrUfOYRKHimyYbZMMtMOzxF/LQmw+g/a64lq2POqMMrG9QdzmrM8QmVWU/P28AAxGpdMM/dgfPuctDBzCAH62nbuxEPMz5ZoujMe5rlRfcJS88+8YndTo3x9cwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl8lmTEONK0TEjM2paksUCXlpMXPRf1jdVRzGYn3GiU=;
 b=bq+k4AWod01D9P7qGCQXdcHlBGE8baqQvZkNKNWHjaIyBRP/U9EZPr5Bfa9wFsfXCD7gJdvGiQ114V2iyswPJzJCRQQE0IHuK2dV6Wu9RkadXw32HGiPFT1ILs+ojk068CA3lg2+kekY0W5WXx+0tX3RnKwWwUyQL4IdfLM6bsushZm9tnEirreo0uYQZVYG7858VgcNdKRCNPVm1XYME0ljqarlwfLK4S0rSrnIqKe7jVsJIJV4fC+EksQdv78Gb2qW526axCIzEEah560aqkKQYSvVsYznJwFTisfT/GaiGHvoVHe+IkcV36jGwWLZZSNmLUphiTmIHW3Y6KfSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl8lmTEONK0TEjM2paksUCXlpMXPRf1jdVRzGYn3GiU=;
 b=vKtue1z0UlyrUWLOHC/psSIh2sM4gngoi8qznFg2vE1RQ5eh/4OCLgdIdUL1b1p6lKMWDH+/zFUxahDDxMlTu4Y4jUXCK81SdTs1w5rIJWzjWyrFZrPKytcgd0hLEPQalmH2/WC7Qn5ijuGQ8ljP1m/Q+Kv9iaeR6ocsdhRDl1Q=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB5322.namprd10.prod.outlook.com (2603:10b6:610:c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 18:10:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144%5]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 18:10:00 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
CC: William Brown <william.brown@suse.com>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Topic: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Index: 
 AQHZ4Msr4xuGDwPB1kSaS5o2z7XRQ7ARWGqAgAAc94CABFeAAIAAEuoAgASLywCAFK5vgA==
Date: Wed, 27 Sep 2023 18:10:00 +0000
Message-ID: <DFF87F63-FC6C-4576-ACC6-E658543270A2@oracle.com>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
 <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com>
 <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
 <CAN-5tyFxX6j08Y3U59xRAPWvVJWy14QHgtdZTWRmCaPHCkMUDg@mail.gmail.com>
 <C4C14AF3-3942-44B0-A58D-AC5A4514D390@oracle.com>
 <F3F59F20-491E-4DBA-8DC7-44D05F5F3BC4@oracle.com>
In-Reply-To: <F3F59F20-491E-4DBA-8DC7-44D05F5F3BC4@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH0PR10MB5322:EE_
x-ms-office365-filtering-correlation-id: 3fef4bbc-bdf3-41d6-1449-08dbbf84f6f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YR2NMC6m56QMnUvQv8+AswtY7ODH0ka4q2HMr4/iEo+yKFHynXUUgGTjmV9ySkDdYJ45Z571RS8wZBgjUE1uQhJWA7aRkGyBprFMV+5tHb4aK6PTSU85vJF5BY7YhzoH6rk6yhwtySqpNOjlXC+R8+LwRv3vYB2clvm8Zxis1CrvkPPHE+0t+rUzDgi1NemQGhkw3zPk8Iz1gTFuxqdRrLhS4P6VtFPn/a1LaeljtMmc34KaYus3ju6FsbdelovyEeHCN95FsXEHm5MOUNBwEdw6rBZlMgGFrrRp8FrFWJVx9Tt6pC8tj1DtMUlQsn5RD+cfFNQmIrJJl5wt0uNXPeciPi1idNYQ7LvCAQbT6griP1Dgn5Pjd4kKAHYu4J373lZ46lTqS4vM4zxx9TUGdDxs6tkI20/kcGygHF4V3ITdRNax9elz7BI2WEj1X/UEDoI0JM1SWpA4lhLCNT6PrlImT/iNdr1BQMOIX34oaNx6RCwk/gkEf1QNPjH1YkU6kuisZmBw/4WkBSF9eJmbSA+wwtcHo5PQD8Dsu9n9QsJ6/wgNmS0rk4Jm3uB5Ng/yAJwIApYeq0OKTShnnxEBDuw7WzB2kDzXIgVnVDAERpdIodFGRFhjo+eVJgcJEU5pl1KEuEtQXKtFBvF292XqdPlx7ndH/9hFn4eqEdYoKgjrJ/00hjzSeSbzpL6Q/n+j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(71200400001)(86362001)(38070700005)(122000001)(33656002)(38100700002)(36756003)(2616005)(26005)(91956017)(2906002)(41300700001)(4744005)(8676002)(4326008)(8936002)(966005)(66556008)(316002)(76116006)(6916009)(66476007)(66446008)(5660300002)(64756008)(478600001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9/LeGKbuo4yZx7+2oFiLZwo0ITje3zoo1C/rEcdugUl54y2AzTfmMSNE40mf?=
 =?us-ascii?Q?dW4AjPTUUDXTviTuO0KYEa5iq7piARFFmo8S25UYGYpsyhbWKwl9K85q51l/?=
 =?us-ascii?Q?WdTZHmMv0IMin3S77xJ7Cr99U1DLBXbq1m6C0HZM2G/llIWiZvMH958SphAG?=
 =?us-ascii?Q?i4v2Mp47byyNE+d5plZq23GPsAqk8BZ4AIHkQhIIQ3Z96R5+eZ/fcm+lT7eR?=
 =?us-ascii?Q?jiHCRT+PO/qZgJ1xNYeGxd2F/B2DccnUHznBwFAsiD3d0nRHSoPiBQ5gQHNB?=
 =?us-ascii?Q?2w/Ov47l+q7syIO6P7fzjf/BItzgkFnGZcww2ffp3xC+V/dF+Eg/HaXgnrDl?=
 =?us-ascii?Q?sotWInbkLbSBWJwPzxVnSiMgcvRheyMNkDxaOz/a/PauEs28FXC6c8JC9JJv?=
 =?us-ascii?Q?867gjWcGUweQuDqJ95yVPYlfOd+RQ/lDoZEE9MMrcYH0NoWfCQj4T3fzScBN?=
 =?us-ascii?Q?KvcQVrJnjNoVoFI+01jcfxJwhc4WR1L4dxpKJT10x9NnD4ajJ30Z330bMv+1?=
 =?us-ascii?Q?TIKEO7IkJeqDziMfF3HzsDvHZU4bQhiwXawoMSkP40JVAIo3OwTknw12slLO?=
 =?us-ascii?Q?+NlqdIKSUGgh0q6DJ9L8ehOGrjUfv/5VdBaHHZaUCBJMzQEdlHQZ15hUu4Iu?=
 =?us-ascii?Q?vK1pg3B5cxdVbZ27OFlOyvVSisuOJ0OYAO1Y4wMUYyVZM43s9ydVOGPfvV90?=
 =?us-ascii?Q?SlyVp6S0MD5OWDApGKXhV+9oFTf/Kznls2s68x9Gv0+Z3EQC6Fdc2a/S1wB/?=
 =?us-ascii?Q?PqU/0qggwrFet07ooQQn/Bo61TVXTHRaPLl5LfjLYaVENy4fC925edA3VqkO?=
 =?us-ascii?Q?gmp7XUa9ihQDz1BeQkIfZD076WbCUK8PhQkr95D2mWXiDMBw4yvB07fOQCP3?=
 =?us-ascii?Q?X+4oM5p9kY9PNYpuAeH+E3UsO5S009BY7hpaqYZuNV87BhlccuIORuHDSvzf?=
 =?us-ascii?Q?wDP4HKsGYxAOCfsmA0jJ9xvaqYMoigyImucsgHDcx9RjQwf815cksf9Ydz70?=
 =?us-ascii?Q?QA/GLI10y3IfGWt8Yc/ozMuEQPtDy2aa1SSj+Udr4d+XCdZv6QZCUfxyXuat?=
 =?us-ascii?Q?V33nPOhj3iDEochZUl1wxoRObiOb0ju9qgzNG16wKmk1NCQMxw4gWTkQwcH2?=
 =?us-ascii?Q?k3mxBqB5JayEVuuJ5v4gfIF5jYR7oUYESQrZ2iwOQqcLkaFc5fjoFI8M8fOi?=
 =?us-ascii?Q?20eJiQumwvuRLIJa435btgSKferhw0nFcfrM+G61ob+unGJW33Jh4M211zp0?=
 =?us-ascii?Q?3O2Q8YjnYgNAJff2gA/ONIyv0xhY9VvLEoBao7+9wS7A2jCuu/NC4Ioc9ltY?=
 =?us-ascii?Q?C7oIT5wfwTq7C8yaIsd/4ofL8CrV6HplEv5KckFNmh8uSNlDeBSNq6PFia9+?=
 =?us-ascii?Q?8WS+tMXZxwVhjACyZq7dGILx2gEzQgPRML+wm5ikb7WS8z8XTRf/hrGZV/FB?=
 =?us-ascii?Q?y7R7xpxYb2mSDBum7NtYvhCUVRiBOwYjhjea0o/jTWVy9ofcRr4Oz3M0V2nx?=
 =?us-ascii?Q?K8yLZFrGBqkoCjS0FfsrGwqyxB8Kdm+//3uH4h9rXGlk8VQWTwWC8R2+270w?=
 =?us-ascii?Q?NhXiVVAAkMZmoAg3LCvSY2AANFpD9Z3tXTykVsqcLFJPA8+BzhLyUnpf5F/P?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE25759F87A91B43AE28CB6E052E2AF2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YC/AP3u+xcSDwNPjZuXEODYUi5/fH4ZPaUnR9vKBBqWZoadifr/7IuQWMP6DQCkPdqirEoNnRrOC+JVkKAYi45V8MkUajzFOIQCNYFuGijmCOsdq+VyDeQX0YNidPKQMTLWoJhMQufWwGWpb4XhKC1+ekrHUjNcYZbzQc6PxeFC2z7wTPGjQ0nMo24Ix4uwnNTwYiisl2b0FEPp1OHP1rGrM1U0TPW3J48KI0OCTrhuMg376zqXmAc/6VpxmFMpLJxnV3ITkvyPSyNG8/TbWT5fXeEDZCgs1EQMcHKdGCctRk+db1WH+YLt5Pf44rraF3VznJujCRmYpxtWD6FJ+G+Xz7tZD45ZXwQdwbCZKYYJmnYa/QVmvQiTmZEIGSF6u/g5qep5XEJmVkMFmc8EcFocjT/GArrTywunsq4C5Y6Kwlyxq+ufepkVMVuT9YJ3t4qLbHYdsNnBoHBrJCUpypJQ5L9XNK1z4LJdzGbmQtLAIGOAO33u4723yCwWoiUaT7+3mGsLvLg8uWnFQgEwHbVPdeLkYXxP0am4UE/CHqeEyrLoAF3FMU8Dd6l5fhzDnQ0K3RMrgqCRkA98t/lQoSAOdA2jW5wl1+9iwzTVos2KljJMBhbWSy1hnZQrRoAgGfDeuBb07/5rf8C94pFydHFkNXPYKbgYiQ5PQgJbYharfqnhTjCoeV01iY1XWNuU5p3DLkWI7plI4LkM+WyM905EH3aUtJcnM/IHfEgsQDiWrp0RBYFjtDWS1oHE05Tnl38Gg472J/6rccd+mIA39gNVZr3Vc4zNafndolKmgZMc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fef4bbc-bdf3-41d6-1449-08dbbf84f6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 18:10:00.2436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oEZbQo1Snh4jqsRTLrRu7NXJYLFYWz73AE7jN3t39tEKgACjRpYsq84qWBUPM8xLMUQkjv45W2hCI7yZNpZs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5322
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_12,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309270153
X-Proofpoint-ORIG-GUID: JF8i5AF3k0KU3sFXt7V54WSWyr3_RvU2
X-Proofpoint-GUID: JF8i5AF3k0KU3sFXt7V54WSWyr3_RvU2


> On Sep 14, 2023, at 10:20 AM, Chuck Lever III <chuck.lever@oracle.com> wr=
ote:
>=20
>> On Sep 11, 2023, at 12:55 PM, Chuck Lever III <chuck.lever@oracle.com> w=
rote:
>>=20
>> So to start with, we could mock up some wiki articles here:
>>=20
>> https://github.com/oracle/ktls-utils/wiki
>>=20
>> that talk about how x.509 certificates are prepared in
>> particular for using tlshd with RPC-with-TLS (care to give
>> it a shot?); and also for preparing pre-shared keys for use
>> with NVMe (Hannes?).

I've created an article with a sparse outline here:

https://github.com/oracle/ktls-utils/wiki/Certificate-Recipes

I might add some drips and drabs later based on the unclever
scripts I use for managing the bake-a-thon CA.


A PSK-based set-up article might look similar to this.


If nothing else, this gives us a shared whiteboard to scratch
down ideas for more permanent documentation.


--
Chuck Lever


