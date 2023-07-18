Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48843D52A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Jul 2023 15:11:47 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36ID7aFn007119;
	Tue, 18 Jul 2023 15:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=6MpoYbz5MgkQbZw6L2OMy9KaY94VBdgIUeb+GZCbXYg=;
 b=tyqAZANnpxl5xXcOUlObky0MjOcfJI0JcKQ0qSF8ab4EWZYsCSIC5mELFZt2yJ+qdpUi
 vMO8sHWAhYMwQM8VrcnrjiBE6KeLam3bIq0PJpkKRRUarACG3qk+tOoECTb0qkDLEh2+
 TRTfYajt6FSRtyue0gJvTbAgwJdxm4x56tbtwDYuEFU9ZEcW2HXXghg7Gxg/x43O+EwA
 02kZiittYcsMxzeZjj5MjJBHBk95cHkRiqXLJUfqpNku635/xlwWe4hi8DNroY5gjHNS
 9TOgcRJR6gn2J+tSCMx5XbMFrMmRHbwWrjvoRSILDqWveuq66N2Sld49A7cLXGgYPuSI ew== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3run88nc3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 15:11:41 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36IE4GvN017373;
	Tue, 18 Jul 2023 15:11:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ruhw57h6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 15:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyuxE+1EsA90784MVO1rjOzbiqMF4CmCnT3tXBLBS+6sChFIElVZWZEGShFcVSgynIZtGL3L1BtaZg7z2KCyOqEocDnKCldYnLU40Z0vD2kVkjnZidTEjtz3yHaGZoO4x1SH6gTo+ZaWcYovYox1ej3xJn3Z588Il7KIBl6vixinIWAg1PcUEHNshBF8jJIkjhjXaWBf+3JCTzbi3XcWkBPzNc3Gcdw71uwrC0QsePp5XM/xosTI3iF6A1YfkBU0ZgUl9p+1d1xTn12D42KEUS8zmcU4EWm7oPJKjUk+gy6OhsjbE8lRFUv/0Z0o1X6eYqzjF3Wm8e+UztyUSv2g8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MpoYbz5MgkQbZw6L2OMy9KaY94VBdgIUeb+GZCbXYg=;
 b=W5SsGzm/2VLL3ci9BdnRxSV9yxImHE6rglOkuhzgJfPt8Ce5k+RJFq1unCOLb2+fiYHMT2RlbM5/W0QpAoReCRpHi2izZYxYR0IE18dU4IoTX1V6OV16an2oGtS9KAIelvD9+Q0StWZZM+/LvD6lODk/dYFC4NsdwjKg/AIcDplDyVdfmLH4REbn/pcVVjFVPNCLoEmdyM7myGuSS4R7bE1qv57MRnlJpYjN1ZVvI8p1fbW3FsxAtOhvZR1JvEIMwZ6rWCkeV40OcmLo0RUno3tMUIvpO0Egkspul20frZShFv51hNLb4oH3B2Z7ay/9wmUjsRKvr6IQgKfuIGKDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MpoYbz5MgkQbZw6L2OMy9KaY94VBdgIUeb+GZCbXYg=;
 b=PirhIRMv2WkpRZ8SNdDa8jsXpI16xIf//uAB+SH+51w2EUlZ/4XfvG5zmDerQ/ZLXyWDfBhAN6xjQfctltCgICCPjGHdKu3THG4deP3vNz2pA5xgbxhHNyrI7SY2SEbQVs5mwGbiLxWOa9GQvcIBnbnujlp9UDh3BQKEf1syJMI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6529.namprd10.prod.outlook.com (2603:10b6:510:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Tue, 18 Jul
 2023 15:11:38 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6609.022; Tue, 18 Jul 2023
 15:11:38 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils package now in Fedora / EPEL
Thread-Topic: ktls-utils package now in Fedora / EPEL
Thread-Index: Adm5iiZdqGLRBtIcZU65/eShNLATyA==
Date: Tue, 18 Jul 2023 15:11:38 +0000
Message-ID: <1B3EB67C-24F2-4AB4-92EC-E5C71D451DAA@oracle.com>
References: <7a91c77f7dc184c9e357af57c7a667014bb72f75.camel@kernel.org>
In-Reply-To: <7a91c77f7dc184c9e357af57c7a667014bb72f75.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6529:EE_
x-ms-office365-filtering-correlation-id: fa31a975-2a87-404d-f396-08db87a148d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rXE1yWhxiUc3XmP62noVh9puwrsG1DwL+QXIw3Fsyst5uIFJQQvrnK/sSk/umu+MKpTGzjC+/kd1eVGU2CvDyGIa3iUtuhEPb/o7J96GPvpbh9bslHy/b1GUp6uC6UholYD7l7SfdlNqHhaFJqUVGqdFz4AyU7fChfHCBACaKzGHMB8a2iNsDLRjBSx5X6asVfXZgtejRXL5/UZqRIy8gyuycoZfqAfK0DW5wbjmy4dowuJRYCntYwTMTyRUptIvil3NjLNQwPn/v2+ZcohKN7MCYDyfu42yh8ZIG7vMOyOiUxLpMzEPyC9L3LavU9FGtUwDFg1jP7ZP+7vOdxj1qXHy2+gTbcfzFk/nQe0mLeYAsObIViSkjzOzRSg+EwUPsMi5cfzwSJQ6DSaVLi5pjhBxrzkHmxFxWIjmVst48v8/9IYogwzmrK6F5W71c0q2pygWdmrKFSDTjbqlyqdauPCNxcrgjlvGdg5ESmXw4iYYwKdDlMNoQJ+H+OC+ho3RF+k22in0eZiKqiqjk8HzFhG0jb28lb74XE5DlF23ZsoM+iFq3DW6OpgtgkoyRoGgbyW4eCxzgDK9/m0ZATJhDZsj0Y0UjrhJYZ3oZCL7jjzhR8K3mQ+ZSUKUQHsTrh4TiyGltjcqdfF5tKywpfa7tQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(8676002)(8936002)(316002)(4326008)(6916009)(66556008)(66476007)(66446008)(64756008)(76116006)(91956017)(5660300002)(66946007)(122000001)(41300700001)(38100700002)(4744005)(38070700005)(478600001)(2906002)(2616005)(26005)(966005)(6506007)(6512007)(6486002)(71200400001)(86362001)(36756003)(186003)(53546011)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZdaS89d635Z6BA6LzqBhRxkcZhIOOdv+yeq1HQhJYp04fX4nktOhr7EheFuv?=
 =?us-ascii?Q?XXNWM7MSIhzKT6xv3o2PkmUWBD51bs23lmspGDkhbBsFxk7cfw3ejn3olbe8?=
 =?us-ascii?Q?4bPYo8vgupUKpRpwoHWDt1wUVVa5Mv22OlDcwJdX97dAxIHjqH5o7X1Y3oUV?=
 =?us-ascii?Q?+mhlCo5MsgTh1fHWOHtu7PEXCjgmGftWpXmBO+dDDGIMMzZAIGKOyRuGtHsQ?=
 =?us-ascii?Q?kzTDpdorZjrBaWX9pGC79cgtH1YBmSMDakMNc20+Sv5djNP2+xzEnZsF79u2?=
 =?us-ascii?Q?3QlZH3JvXGNgVqNsNheWcVQjqnFCLsV8vPvLRCj/ZoibPvoej4ylb8lH9XDz?=
 =?us-ascii?Q?x3xxdXF/c3KAZfSpVEwL94ur1DXv+mhjcZ4kU9ECSrCU/UkG2B8CacWo1MA9?=
 =?us-ascii?Q?btqqEBumDcyEkfF6TsoDg1mVoIMSIR8zUeu59z7PDtSHHQamB0Bve5wzo45u?=
 =?us-ascii?Q?XicY28Q4VKqc3td57FCW2f2qlmdOQNgXLyDMaSu9B9/e0G+vW0ThHYQmb7U4?=
 =?us-ascii?Q?sA0DDlIwp0jmoNLu3CUkK6bWQ/lG30C9HePQ4hCfAf2je5/0Iv9qRW5xp15T?=
 =?us-ascii?Q?0JwrwEKLlBFyBMhtbTV/OZZ/rVpMiyJRvBexSZ4gZtctEy8Os+2HU4gMtbcF?=
 =?us-ascii?Q?M9fxg9emLUCLdmPYyvCQMWgxV4YidLZxzq+z/Lx0//G06d8A3UQzCBy7CWL2?=
 =?us-ascii?Q?x5JgUDBQlLPPkXWEzWMc81Ve4B2PKC8YdVoyn3wH52kPvHbfBjdscrNnQQGA?=
 =?us-ascii?Q?oB7AdcrJIFUcXV0jgaLp+QiMvf1J3HxQge8+DenV0VDAiWf2MBHghY6rKwrp?=
 =?us-ascii?Q?pXjLUxIZYIZJrpCzkqopPpjwabygUHLQ9k0o1tH/UmIMAQIUfy+0SXivGvY2?=
 =?us-ascii?Q?0AY9YYiAEx+n8dvMD6e07xQ76HsO4Ae6dStF9X+W65QFx97aUE84L++uoKOM?=
 =?us-ascii?Q?Te5zd/xhyZINX/14+Bd489dsz5Vmjl7gk8MJoXQqOBDZvAF54Lua06rYSsCB?=
 =?us-ascii?Q?ICPGOaeLyO/4JvO2d/C7PAjNM/imdt7JkYtWlmJoo+WdA90Z/A1uclhN+uKF?=
 =?us-ascii?Q?eeQgm1WR9etEQp01gLxwETueWDNC6g9/LUDQBOThx/8wDpE4Gv0i5T8oppfO?=
 =?us-ascii?Q?wdA+2rmwEXQFcj0jDFjmBo6ohzpR0+dv7TOykQjAkta8MVRC8cZMCzmtReIo?=
 =?us-ascii?Q?jho3/giej4W9LvKilbr8yoZd40yfTETkNClyTC76mvP5okB2HcI39Whdv75+?=
 =?us-ascii?Q?DXyxMTSMhGzFdmf6PFlq0W6wP4rDqU+jK3JKWujRV+ARrhV/OE+k7ezww5+Z?=
 =?us-ascii?Q?EZWZJL4sHJohdznE8kcUVnroxICfIg/tWNLq9BJR2mp2yMNtLFkt8yYcAJpm?=
 =?us-ascii?Q?/Jhya9rN3rqF+Dohvch7g4VshRDJUKJrIyVPbS9lHIpKASgVNDiOaTjcaSAG?=
 =?us-ascii?Q?YQVOn3KoMfJeq5n5RxktY01Ks4vlwSYNcOHl18tm2UE8KbQhEtRLsfTeGwIi?=
 =?us-ascii?Q?aat/KtgCt7LgsME8SimUQ9l11FBd/cMAuzbdcR6TacuyuW7EdgGegeEJnujw?=
 =?us-ascii?Q?C66DNpgTCyyvUkXpBaG8u6xoHyUGc9NlSOnhJc2GuQru1osCdZwptczKRcIn?=
 =?us-ascii?Q?gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBCF1EBA7E775340B0F3A17CD54EB7E9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/VQnkQDLQrwBgkdAWd9ytPcRYuzK7JkGp5o2mhz1oeQQ2Rkx9Cbz3fWNMa12Gljvu4yZ3jJlX0Dvy5iNFT7MV2iSkzjOrW+zmE5YuHJFQ2Ws10PY1lo9a35sASC5e7CIomIrUdgAQkdsp8CfgQXr4I4oO8kB2ZeeRjVgI9GalMPrC4eCvh6HzbrM9/NVHGHsKMMcipAZJrew56KqTnfvd/byv8tAa0oyPrNC+yRU4JHez/ozF6aoI3PVEvvWTLy/Ov6+DUlXn6KaMrU8E04CmA6KJk0Qdwz7ynW/Qwehifb7xSnt6faEKFHEDnrC4km/7Dn3J2FYj29DiX4pXfe8GRdUhzc1V63GKdUkHYpJ3reRyoO5IzvETYuhtTd8VEKe5XWxmeCH8Ezub92gu9Oli2NUXIzJmTNWFWQA2Ut8KsXwX6H9yxnnjH9uuP9Zizg0krpLmh2lJ6ov8OYDIDFvtMiCvIg39UXxzkESipubMw5LBBGOUZMESvquz4fxrgXIdAIOXE9UkTRAR706wYl9ery3C7m37NLHBiImDaUTgFJ2QCq1y0fKQlw5KNSLwyM93xk803XFIueJXxyGFNLQO/UoIo7kAgo9U7TYxjXzXyA8IPKNFTFF1HIckJBa3LraoZQjrQpQ/2uy+jcw8KPr+vPBkeQtMYe3Q7BmaVWHekuplPu3fUrrWKIyruX46ttXnzsomqino5kLPTM543781/bser03z4Ht54Fk2zEn17t2/poAc2VAHuqDqI3YE3e2Kwu+n6oKxz5rKDmdgiQMkQW6PlFjoV60PZilc1pwxBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa31a975-2a87-404d-f396-08db87a148d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 15:11:38.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVei68KsHQ3ACEtHcYkW5tci9lqIGaCEXuiyYpJvzenB9x8LirzmpKlqWyl7U7pRjGxgiSV/SaOrA6ZUUw4WLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6529
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_11,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=878
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307180139
X-Proofpoint-GUID: bFJ2F0DmH6ROQVLIUMieQw7zmwk6gLH4
X-Proofpoint-ORIG-GUID: bFJ2F0DmH6ROQVLIUMieQw7zmwk6gLH4



> On Jul 18, 2023, at 11:08 AM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> The ktls-utils package is now shipping as part of Fedora 38 and up:
>=20
>     https://src.fedoraproject.org/rpms/ktls-utils
>=20
> It's also being built for EPEL9, but the kernel backport for that is
> still a WIP.

Thanks, Jeff.

I think F38 is not yet shipping a 6.4-based kernel, so the server-side
pieces of RPC-with-TLS are not yet in the Fedora kernel, if I'm not
mistaken.

Client-side pieces went upstream in the 6.5 merge window, so those will
not appear in Fedora until it ships a 6.5-based kernel.


--
Chuck Lever


