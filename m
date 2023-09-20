Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401D405FC
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 20 Sep 2023 22:16:12 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KKJdtx031818;
	Wed, 20 Sep 2023 22:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=m4N/I6WddWSL/x1XkNSfRRRIc6Y7Zj/mfr4qLmeK5EQ=;
 b=MSllBDXY7lFdXDUIw1QIPJfB7Vu4APYrBfyO/qsxVH6ASQXCpcEZNVOWyleiblXo7wsJ
 I+NM6uiIGYFcI33yY/fVIWh+1zXQSCDOCLHmxAzw3IbAXzav5UGDt6re//9l7zpkiJPW
 a30/ri6AC+nD9sosXGYVUKD0xULfkYvxM4xxHmBKkMzzwaXkt4cVsRUjGEC5oU7S59mK
 mELVDXQqpETDeYjddPVVQdcDq+JZ/fqx/p92pgORNIRgrVa/wJKlmwPKHuCXire+bvPh
 zZDZSKELsEtwWEMyUmphk17vTLueEKR0e8USXR4o3udqT1Obf4Vg0+1u13s713+QFAi0 pw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t54wurexy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 22:16:06 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38KLA4iL030778;
	Wed, 20 Sep 2023 22:16:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t52t7q0k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 22:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRtooD35dRxrHL6vxxkR0d7+4uoP4HSArydCOulSv2+YtRFRVmInXf4lJVvaqxTaG/Y0JfxP7UgYmHfd7YIzDkqzarM2bh3vOKXpiIuxa3Moe2+kyniDfMiD5QehTLmcsACVQKc7SfT97nW7rwH90T8yqiCf73a9WhcUpjo7TuARA+CpWdq3klh+p35DbNLRwBDg/LQehqcc6dxomKQgQURReFqMJOZxz1SVnweFoaSh/KMFrQytUkoxsNInVujAQCqz/LEvXtQAQUamrsG4rb4X3d2J46erAzjNeU2wHxkl6/PkYnTdcFSqNiqkCyrP29p9wLHJxikRgKcsP4uSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4N/I6WddWSL/x1XkNSfRRRIc6Y7Zj/mfr4qLmeK5EQ=;
 b=jh/gGnIM3GbrF/yE7twtLdGN26PPWHhxhsre/WoK8WsfS792HZiqsG0Wh5dLhUQlGnRCSl8NKh2M7EGzbbkITWiIlwvptd3Fxre6+os74b8qkyKnuhEeEqFIPoezFrkpb8q6hiSSguTBKIc1dheMwbrFI0qFUsM7aSJMUlLTwZFtuKGVi2fda6rMOEmgAWXGXjH6+pZ32qd/JAQ8jaTJvelu5Z9QFeEeKK+2GyztM+o3FBZZgzjL44LOwIUWrxVkUh05ZS1ZEjWStJF7FRB0i/Ao/ikMjg+3mtW5hPh54yylrJZ9LQoBqGzXatTaoXC66z+luOuURDkacgiDwwmlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4N/I6WddWSL/x1XkNSfRRRIc6Y7Zj/mfr4qLmeK5EQ=;
 b=tV2dk5j7GrW6HYFQFyZD9QEGeH5n3rUG7Sv1MMO4i5toGbgpCsk8NiWcmzMjv7ShQHPi4X+8zlMgRT0F1ZyieHp3OkvKUOZ/8mTTrFnaOJPSj61AiQA5VuUhCnah/GIFOi7JBsAm+OViZGm14Baf0negmykcIYifNL+b03lPSac=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB7914.namprd10.prod.outlook.com (2603:10b6:408:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 22:16:03 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 22:16:03 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: William Brown <william.brown@suse.com>
CC: Neil Brown <neilb@suse.de>,
        kernel-tls-handshake
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: NFS with TLS
Thread-Topic: NFS with TLS
Thread-Index: AQHZ7A1gXNhscLp/2UmYzq02cB6clLAkR++A
Date: Wed, 20 Sep 2023 22:16:03 +0000
Message-ID: <78A87FA4-2BA4-41A7-B80B-3539DBE582AB@oracle.com>
References: <A58E8D82-DA15-4319-A4BE-13C7230819D8@suse.com>
In-Reply-To: <A58E8D82-DA15-4319-A4BE-13C7230819D8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|LV3PR10MB7914:EE_
x-ms-office365-filtering-correlation-id: 13be2ed9-53b4-4fc2-52d4-08dbba272d98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wNWs5QTE5ps+Any2hgJX4EwQTo+tz7YAKz8fMQJ31AAgJIQXE0eECAxspbPg+/DuInEGHmoebheEkYkxztKuGk+yYmBkY174ezW0BYSwhGkmm226A/XlN04IIujPSNv+6zvFirptaQbxfLHfGMHgcMn/2LFAX2008cpUObiF1/8v9BqDp54VaSF+DpN5UtrNWb/tHPznQ+p+ndsati6YkiaOViqFhCdYCfOs3Pzlcjx4ozpOROw13UmxyaI/AfS+vsAS/PJeM5Q6c+5QYztN5yqECCyxdGNugjjOM1buy7VTzKXae7HnmB9WoxFnlN4tQNNEG3wlz2alZ32kUtf32OqAMKxOHP6QRqOQOSQEsiUwAAuCuEjdMQU8p7KZJLL1n4NECZOWatgccJz+fyjfIm2vWtv04Zj6A+fjcdB112d/DjYNefH8EMCk8iGl3AYTcQKOA3mBc7r9T5F3S9Q/8qlSjBTbqrX3AqrGB4aaJ8ALemeG2Fh+AX9zdHJntNaCORamVUZbwKQyUJcIrXB3iuOCT4qUWCi2+3CHWAh/Oatpwmp2UXilKPhmCkHA1FX3h9Hg84HHXFFajkU7Js2TZSDn8uSToNn92LCcwdiOMbXbSs62LiYWJ8XSpJfsrMBj/s4f7CuJqvgXvbHb/aUsUA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(53546011)(71200400001)(6512007)(478600001)(83380400001)(8936002)(2616005)(2906002)(26005)(8676002)(76116006)(316002)(64756008)(66476007)(6916009)(66946007)(66446008)(5660300002)(91956017)(41300700001)(4326008)(66556008)(966005)(54906003)(7116003)(3480700007)(36756003)(33656002)(86362001)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0tq855j6xMsmOmIT6Ibq807Msy/lnJggzckwpBzu38sU38b139KwZ6jT0/cN?=
 =?us-ascii?Q?PvwPCErjD73/e154eVGeGzpELiuxFbk6J4kkZKErHzfbFPgfa8bYf/I+T/f2?=
 =?us-ascii?Q?G+2t+b2DNjSVyuFUt7PxIopXLAagpjH3/Z6hPbrMOMVywyKLCeL47NPtESwu?=
 =?us-ascii?Q?utN7pMhHZBIM96xCmB6+DwnXS1bxSVQf3Pr/Lkhzb3QZ4ymMgZcKgYmF8wyQ?=
 =?us-ascii?Q?xHtuZcNZMkoRMBUtcC7RfjF0Bh3mAeCthRQeo0l3twZoHjf6sXMb0k+VgVug?=
 =?us-ascii?Q?WNGUMO7R+bER2UUdl3wqBu6xhQ7HmmntNo7G40lyidshc0EmGSLG+tZhtQsv?=
 =?us-ascii?Q?AUJ7vr+gAhdvQye8/yjHetIqP8gLGuBMtZ9CWmeWfrsTlnpgb/4Gx+bejwlJ?=
 =?us-ascii?Q?qUEP3yrmyoRFmNQuvzqbD6syUrzmWPA8wQ/2CTTmNRVqwkJaFAIbGgxUeYdz?=
 =?us-ascii?Q?8YaTXCEUbEN/dNa7z8EOQZhxFawUxQI70ZPXqzlAUy+Ytg9IRv3bM+jMsIYQ?=
 =?us-ascii?Q?MnfyZEmUXCYcHCaxKTGwPh0Rjt8tKM3CmRtRllmQlBJ+JlMzDZMkAadhnwEz?=
 =?us-ascii?Q?qLbGkoA5E0gVbwLpzqiACMRNfyY75YUnTMKyv/KswPg0WVNmyJYUKF7svCmY?=
 =?us-ascii?Q?GPa03d2Omguwe8G5/AyurAvtJs6Y4sRnMjwulsoDcUVtxVQkiMfE8X+54SmN?=
 =?us-ascii?Q?ApvDyki/MkBFL/7frpCbLvspuZwICwztybG4gpjbC346Yp7NUnREbcblRz57?=
 =?us-ascii?Q?EXADfirwUbrOBGlY71YEKtFrfApjATnftSFyYi/dYqnKzUUBvSeliRYzfrS2?=
 =?us-ascii?Q?7C46fXy+3CmPon8wOoE0AH5OW/QCDTuQnu7Xv2YtHuJbpqK3TFBlPCPdpBXT?=
 =?us-ascii?Q?tnAz8zZTYrTAzVnnhODFGztO+Csfg0J68fhqiPjHZ8oDZHNEwyXJkjhLtn49?=
 =?us-ascii?Q?JZ/M0UOVnPLQJgYtJq09Cv8c2gUO7wE1DKhVVSUfJulBNnJ6m66wofIKhI9Y?=
 =?us-ascii?Q?hcAgbWYRIO9k/YkUTYZeXkbLuWpDeVkmNsrX3Ev0bRGtUc5gU9KagZWP2pVg?=
 =?us-ascii?Q?o1xBbZo02CRDWjoPjWAfnJOxOJSAIx3kpJgeQaUkgpFGGpN/LwZuG7Nz0gww?=
 =?us-ascii?Q?ORUxurjrEDOuFn1GTdIFK7lp+lNwsIZU/iZ07QUFPiXURemye5ZwD0qANmd2?=
 =?us-ascii?Q?brrvYj2vEBV0a4zaWUVYx9ZhrUT8QPNkuCgK6DKb06R7YMtBZTBlGaOo4O6Q?=
 =?us-ascii?Q?v7L6xfuwCAaq4Vx4svXzHD/DSqlc5cTtGus43BOBufvdn7S0Sd/aaCDx9Xq3?=
 =?us-ascii?Q?pO4ddjU3y4Jzygiql6w/ClS20hIe6iJ8RKyh4Xz6uwseMz6V9Ef8VSLYbmp/?=
 =?us-ascii?Q?EMzsaIXaNKCk/M2pv0BNecWaJjRnrdMHvlBH/j1K7b7bpao/EoDlZV/nxRoB?=
 =?us-ascii?Q?saD8Gh/HYkcrFbtUptQlCsl3yG7rTo8YypZB4aRJm3n01BQvbm+7B4R41cE3?=
 =?us-ascii?Q?h7bvdaXb2+MpuoL/e3Dy0OofF9JP/4XQT0E3mccZvic1/YTAF7MWhsGcLJ+4?=
 =?us-ascii?Q?ITeSrV3IQd0kE7ILzfazSSiYNjSlJdBZAQq2p6pV4iQ/IkIuSEi30hb+BvmQ?=
 =?us-ascii?Q?wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3890B1AF6B313A449327DB4E1B801C0A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QXN6iVNyl+cZ9Uv/6sDzgfCIqapIrU34Xb7pCVoQOHccAlSfPYLrPhHCvaTwflYZ/8R3AVF8VWynw3me3OYhatRmEAqSLA6W6RrnrUc+K4QtiTOTaQMsAx8KK1UMAjDV2KfLI8qVbcAv93NEV9apRbSA5Ou9TiSUsqp2EZ1nE33AO3bljbP9GWYGcXF5oCGgscJUUE2U/U87dJroT+w76EzoI3AM7tfLqwoyd/GruvfOx0+VN/h36WWVU4pJCQgXkF7FZRAc5wtRUpn/Pov+Iic8eMEIDlGxHNQS8LyRyFhJJ8CScW1r779vtocl2fU51g96qj7Fr0uHkOYnjgXmMoLtwU8s4JCpNkp2uIdop8qtR2hfz4nzk/IPWH8fOHXSJ2QiGHych+M6+1WyCq8+e0fqGdxvMDoTWROwIa958pWLiQU2kujOTM02IzPeopWU16p37r8fiqZmdRvW7NeiIQ9QAfLINaRGiwgcAKp/x5jcMBJyiQmWQbwXWumB5RVD/h8Z5zIIUI6w7FmImtKXWP3fukiJsWaOye7g4r0l9NiaGuph7AmfnKfYTtqn8q1GPMxIkRk9ezEeJvONXXU1cAXeoNZsNflr/zwCJ1lbqvXDdLztE7b015qCn1dpijRpXNxy9olW7Ww2TtpO5RnJOhR86buAxmsvhnn3YZEC/g9jlrSzJEta3+yRd/Ed9u16ptUtuq8UWx91Inia9zOZBPVMSHEiISJHG6W0qI59R+SEaMbvq/dnLJ9HxIMdcTqs8QzvpLNJ9SQFObsVD8hqnmSYIYspSM0lnIfeBd2QSpIYf7l9fDx3CSzjMIuPS95u
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13be2ed9-53b4-4fc2-52d4-08dbba272d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 22:16:03.4282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpxUjq86kX1H+P8jfxwOoNpPPORKXI+b3K8mZDlXzyD1o59jWsM4Txts1SSUszsCibNeNqzgY/VvMzDNcG13Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_11,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309200186
X-Proofpoint-GUID: 9xAc3OYgLtStr5-Xp5ZvqC1csQQ2KQ51
X-Proofpoint-ORIG-GUID: 9xAc3OYgLtStr5-Xp5ZvqC1csQQ2KQ51

[ Adding kernel-tls-handshake@ ]

> On Sep 20, 2023, at 5:56 PM, William Brown <william.brown@suse.com> wrote=
:
>=20
> Good Morning,
>=20
> I've been remotely following the NFS with TLS development, and Neil menti=
oned you may want assistance from testers. If you had some docs/setup steps=
 for testing NFS over TLS, and especially NFS with mTLS authentication, the=
n I'd be happy to give it a test, give feedback, and report some issues.=20

At the moment, we don't have anything more than man
pages because the administrative interfaces and feature
sets are not completely nailed down.

Have a look in the man pages here:

https://github.com/oracle/ktls-utils/tree/main/src/tlshd/

http://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dtree;f=3Dutils/expor=
tfs;h=3D53acaa07ee2e3a0ee18c146d35053cfc3abb4f3b;hb=3DHEAD

http://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dblob;f=3Dutils/mount=
/nfs.man;h=3D9b4bc9c9cd4f0dddd016173ea3efa20645106ddd;hb=3DHEAD

Fedora, Debian, and SuSE should have ktls-utils
packaged and ready to install. v6.5 kernel I believe
is the first kernel with both NFS client and server
support for RPC-with-TLS.

We're about to put together some informal recipes for
creating x.509 certificates that can be used with NFS.
They will live here for now:

https://github.com/oracle/ktls-utils/wiki

As far as I know, anyone with a GitHub account can
contribute to the wiki or file an issue in the tracker
for the ktls-utils project.


--
Chuck Lever


