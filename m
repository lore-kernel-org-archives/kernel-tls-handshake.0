Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB42D530
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 20:06:24 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LGnBS5024758
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 20:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=OHROx0QHfBJmzVln5BDLoZzvO254jmMviHLHnejbgOc=;
 b=dmkrKIIL/kEPWICeFYlewIBMyNg4uJf6xUWI8qpJpCHEYx87QFz/U8DQ3LkE8sT+KPcV
 JzkkLIM1SVkLv1Nppz1bo2tcspC/RyWnfiUszAcLk+h3ZwTJQ3OnMM4e0yrGeqE9QLOc
 lHavRjPFyQubZ/dsGePTjWOnRKKSgfx7QYjcX4xW22dOBaJy2jq0ccbHMbBPSimlpQCC
 Uzw5oFbJKHU5qEGKxiKzlqSfPQ7qPWq9gQoyguF7sMCC95IEPflOMRyfw+RVwDcsQssc
 1P/mxdNjDBjmxcKPlR9IsOV+IKoJBXEH+K19dk23MQuOnIltoo+KoOwCRVB0TRSh/MwY og== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd433qcv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 20:06:22 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32LK400R021880
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 20:06:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pfk9t837g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 20:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0JO4Lh1zd462hjIVS+ro8k4+sIFg3RlvlkVW1oWQwC0XIDxqap0xtUlEHB9JNfNjDXlpCrGx0jZSrLPTLdXOS3qtmN7FJPfIJOZmJhlOAklyrj0iiC5/6/ygQM3N2KVfW6QE9nZjDKznSbVM+S1laYQSKeISHke004NeVt52hRtb//yoPaYYtRg6kQpCPpmRrz9aDeXNRao8aiZWZgnfSwHPuuheamh8e3zSh4OEd+w1TvurexUzdMNZqyiZ88AK1agjBPZfpxC4ItVOgW6uqJaAZyNIJy5xKBNpPzCqGj2tFV2ThdfmkGu8GQVF2fBjbqiMYw+U6fF3BnSAjSsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHROx0QHfBJmzVln5BDLoZzvO254jmMviHLHnejbgOc=;
 b=cDCm1E7u9MXsdnF6nb9pWLpQf1QWH611the+yeodOraHmnBtkFg0lupfUvfdN9MjdAKbnnb/TUeCe75zroYxGjq7sJcKP7J8QEUX9Zw5nqCO/9/HNpz7myQxXo+KzNkkHFP7DB0F6dkbIn/X0uJw6VNh3wexff1SAkTROOvZzvHddIITNClShuahRf1kHLyq3yb/Z5qUYhkSdsUaMMGGmB9VxyLb1dk32IMu4Udc1ZjiSVPjoc8+Obx7uHrMPXKlhaw17iFJcMSqNJQxf6OFGdZuiyH+wFqvXW2we0A74zScSOyLI3+HHG/pgtgJv/wqVr0tN09ut8nOYxjvMWblvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHROx0QHfBJmzVln5BDLoZzvO254jmMviHLHnejbgOc=;
 b=k1UgoopgFZSG0bTefChHiGru/FVM7SVmlQ6dBz26oOE5gV5SP8Sa9nx77V6q8ij7HZEV1NO2k/CHFCVHyn7n6D8DfF1KuqAshTS/iz8x6VDcqD9N8L96dTJcWs60EZkTTMCEonzUdBkGMA3FwnyUcJFrfhaEnO2vsOeqlb/EcGc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 19:55:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 19:55:45 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Fwd: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
Thread-Topic: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
Thread-Index: AQHZWbVGJzLbQ29BsEW987typvYRig==
Date: Tue, 21 Mar 2023 19:55:45 +0000
Message-ID: <D043CBA0-6D20-496A-BD37-6461BB8A6CEE@oracle.com>
References: <3dc6b9290984bc07ae5ac9c5a9fba01742b64f84.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB5217:EE_
x-ms-office365-filtering-correlation-id: 79467025-5901-4114-c706-08db2a464259
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KXsgWyX6my8vqZi5HirI3L1mOgwpqtASUZpLOwAMKsb1J5t62CqijuH7RBxQJtVT11fYq1DIiAwlpCkUr/Wq5gBqMBTXjHHMecCyrUsU/gP3DfmVssf2p1ZjBLoV9fZJPBcwqdkMxvs4GnSoi5/wzsUvq+s5zjQjGdYkZ5/9Ltsv2IEYK7l3x7U1px2evqTVzFJRE2ICflJj1EGbgYNkwF03uWXjiKBrleMgkBEczEMtgGNRbTj6Nu//eypIHrQasyNd2Wjn7p2YQ/CWw4qYQEBR7Nc2obQ/BIIVq1hSju1GLvy7OxKQ3lWapMlgZXTcCejGksKmSpEGUo7Q36/jioMwv5qWSq8zHbK/34IiC3NFPLiT9O4ZU0VJRi4k+iI1JQgXUy7tML0tu5NKlf+kagGZ9UCLrGE1KTp5AmPOROUSGHZgV0NsB2XpYkhK03tiKWDMAT/UAbpMKpvOJBnp3at/EHIqQI/DGF0Rxuy1BC92myzsDc+AoMTfO5q9D4i5xMczg5o7ISBy64hpi0hZa98v5KSTeSvd2KhH5lSu8Z1kZkkKSjRdz8eGJMFbUoQm9Fv3RcCEOhiuQLmstMTlufAnQn3GhMp8oT+7LUs4H7WMDjsfNVFA+6xIXQN6bQiqGY67DWfegMb6bxXNGIXJbOKSkS8cq4NWHABaQ9AGw87Jf8nqvVticV3fEUrkehGJxsqKKBUncrJSJbBrLkimzfwNuTSj69ZHZXBEVaECnfI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(66899018)(2616005)(83380400001)(6512007)(71200400001)(26005)(5660300002)(33656002)(6506007)(6486002)(186003)(316002)(478600001)(122000001)(86362001)(38100700002)(91956017)(38070700005)(66946007)(4744005)(76116006)(41300700001)(2906002)(8936002)(64756008)(36756003)(66476007)(6916009)(66556008)(66446008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZbdFV7e2cK0Ap6v2JBQkgfBXsfBrmBQn/E/C3SzXJXt9xRjt9+g01Frn62++?=
 =?us-ascii?Q?4pUJlePU2ImeKBYQxjB5R7tvITLmXcP1XrMJt0uVbo1OsfCge9Ug4qZWT7kr?=
 =?us-ascii?Q?dRW2ICcwtYJU/LnuN62HVocR36AXoc/VaSjU+ufpY3Z2aafHWW0ph4/qCBF9?=
 =?us-ascii?Q?SVCHRp0U7aZPWuLq7inrdouLMhicDenC+dF+aDoq5iK88QzVWsCgiDbnfYYU?=
 =?us-ascii?Q?ybkaAkScdDHmxiHaI4fXSzVUXcfn4NME4ry8sO/1koX6wafUELN6VCp/pk6s?=
 =?us-ascii?Q?jc0+rtHV5970ftPzUUI59dmyM1kRXEO7gGMQ21XA3YtfOG+FYaxB2QAsafnp?=
 =?us-ascii?Q?AiSuMlyqzhnMSIR0rQAmm6HkOPAvqYI/Vc/9PC2re9l1vECgOiWrpC+orWlm?=
 =?us-ascii?Q?cOYNG/q2ZNdjosPF2j2CuQMEQyfLjhvjlA24uaIjOOuUCWpM+VbbSVxA/K+y?=
 =?us-ascii?Q?np/o1vPaXc6IVQ587lbMBQ+I1mosvKxjv8L6NQo8kO4QGaALIJlpxaseQMRc?=
 =?us-ascii?Q?gGOFGXkHxJTmjuHDYv8d/nGCTmq/0KiHPx6LupXhc9ZCDeFPNNa30xnEJk1W?=
 =?us-ascii?Q?bdzhQbS+FTjS/6vSJnaaiwkDxu4Ude3OZSX8jyMTcKsLOMqJ/1F72wqZhCkm?=
 =?us-ascii?Q?M2kpEODWItHj4oaUSsV8HxIOrJO4GFwjXvXzDliJokC6l9pbILgY5/kHpDZm?=
 =?us-ascii?Q?bM3alObxu1o6TV8ffbMZqRuDYOwVzbLrcwu3tW2uR/t4elNM2J5A950Svct+?=
 =?us-ascii?Q?tanU2nggspCcPpqU/jf+4hvWrrc/XYUZ2xO/xaJTqscetEFzTjb6RsOE7x8t?=
 =?us-ascii?Q?TAJmJ1KJ9BLZwMSDDVBEMEjORBKNAamktUvAaZvmDjFbBlxK9e0siorMl50h?=
 =?us-ascii?Q?YCP2YdPP0qJlDzE5Tbxi7We0sQzq2tCOPhLQt5Wm6L0UmokrTzPFu0eJ1fhu?=
 =?us-ascii?Q?Hf9tuzOkUzqdR4mTFuSPKLZYbjem2qsskGGZGx0Gnl9gwRo5G4X63hfyUJ6X?=
 =?us-ascii?Q?cspk1h+Z/2SOEU/dIU3qnFePY3hh+jd8JWsiescfdeDeJbBShOqtZiqOllQE?=
 =?us-ascii?Q?0SHogzAcebgRfLL9+1U047BpmiBWS8NqVsSrxgG0xahsUDWRlVVYWVE46o0x?=
 =?us-ascii?Q?tQPOaKZe62qQKL3OVh4KjzVtEtuERyc57E5GAY4k+vePpIguiosDJ/qX6Oxx?=
 =?us-ascii?Q?0nEIld28diuxv2wBRUbGW5BVwIJROSxjIWFxy6AFU1yx8Qwr5NeFW4UJyBuD?=
 =?us-ascii?Q?ccSCJAhhe9GnS57FX6GfO3vAYMNXijjnAI2XL07TlY/TNwij/Y0NxobLH6cE?=
 =?us-ascii?Q?KDjXU/5pTUNOnffwcBbUDcNKeRYSOW0PUliXfix93J517YmwPC3a2jNNLGcY?=
 =?us-ascii?Q?uXX+sFhzt4LKC4QF7aojhsD9qRUc6C64bwV9i6bEoMvOHzgrRDu8EZc2wpeO?=
 =?us-ascii?Q?8QmrPElce4Rfq9RVG3QuYzI+aBfcVF31FXUGjy1gFTj+rSYIcFUYYhQNrUN3?=
 =?us-ascii?Q?uW0Mq7BecaUsc/KuOnWopiB8DZSJl6birq+1kMUCbqW94FYPwCfLpvPlmKlW?=
 =?us-ascii?Q?utq8kMYARUlSsqt8LDdx4y/AWi641GvSe0bOF/45iAY/5kR0ikNtHjCCmsHj?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35EE083416A0ED4F8F63D3D064481111@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ceJsFQ05ixEkbYuOOZGUqoUIMHqV12Ar3QEUDs9fvl1MKLXIrEBrdlxXPc//5lBwJnpQJke4MuCC4Ir+pHY8ZeAhkXZOW0YPUOlRDD8NTDxXEh1HD/r51duA+VhNxwq+zhBWuQVDbC6vne91maeNdCpomemHfDW42OWsZIQfh81yKU5EHMj4ZSlIs9vauc7YVjnkEIiHv3M8RdjRMpBKgzUpgVR58iWb4f2oxiSH6QiPeWFaPcdLf+7+YhX6gC/qvDRt9WHMXoCgHuFvOlL61campWXHIRW28JknuRntrPlvjDui6pvbkzsjaV2G8y7pjCCs1GfHerqN7QO65E//+v+43hAydNyVstdiqqer9rONJWJNfhv0Nc5GHkI9/MhK92RjEdddKCfG/1XQJA94Kb4JXw0c+f0+UnC78YauDGKaUNNdsYB57R9HCRdFANp3zdNTDCPUTjE0NvJkKUTvOg3OlJ+5MNlaBDTJxPw7lN0HMmaEhSbGib6l8NQ440ll0d01wHM3uMbLA6xDya4C/Hk8LJMrhqq+Og4/rmQE0zP9zHDSdWG9aWqcWEC17UIni9umnmZNbIU2UNtAePIbwHHs0pUTfFwuGvj9+uq6+jfU6p3TnyjRt7NdhONiKBPVkpqPleKwqkGukR48YtI3wcjTgws7spXV95gvWy7/yZKgTKUY3Lopg2Jbzl7bBMvFg0XxwGfHzfQqgF7UZvwvKdXJ+zs8pTO+MqEhD/6Z80avALCp4CR726EhMumrsSdyQ6vhfmdq8Wbu9rQwZRvXFA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79467025-5901-4114-c706-08db2a464259
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 19:55:45.1672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCxrysL+a9kTu5V0xVuM70ej/BWST28uLVvUYjFl7/OJKS0/kzTGICMBXJ2uCXM8sNFs6MCryLuPFTyfWHI39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210159
X-Proofpoint-ORIG-GUID: aiI5JZs4IuYqZ2oZOy67L-QJMxKsQn60
X-Proofpoint-GUID: aiI5JZs4IuYqZ2oZOy67L-QJMxKsQn60


> Begin forwarded message:
>=20
> From: Paolo Abeni <pabeni@redhat.com>
> Subject: Re: [PATCH v7 1/2] net/handshake: Create a NETLINK service for h=
andling handshake requests
> Date: March 21, 2023 at 7:27:54 AM EDT
> To: Chuck Lever <cel@kernel.org>, kuba@kernel.org, edumazet@google.com
> Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, john.ha=
xby@oracle.com


> Side note, I think at this point some tests could surface here? If
> user-space-based self-tests are too cumbersome and/or do not offer
> adequate coverage perhaps you could consider using kunit?

Anyone have inspiration about what kind of unit tests we should add?
I don't mind adding some, but I'm really at a loss about what to test.


--
Chuck Lever


