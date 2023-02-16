Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989279C8
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 16:03:18 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GFON7g032305;
	Thu, 16 Feb 2023 16:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=HULw1Wz16A3tbA9VcsrTAzDi5f62tVSzDMCuMPaRgpg=;
 b=TBKENSvlKXKqXXh/GwSSxP5tB0wH5SVwXZlLbghZl/WurcJiCMhD7zyD8dq1+MJqRZP7
 B3FrC5Ve0Xb+rlKbRWO5fUVIu+Jx2aKgfPgNVax4RzC+e0tIn02rqqBGi+ZYDa4AFIFA
 JCXtMXOeK2KtS25a65m28IV0HIUGfctI23BWthY8upr4cD687wSjOGgsbDj2TRQvLSRO
 MlOwJP4FlHumt/UpdqKIX7SvRVzth2DKh7uw/DCT+ovhUlZLD/pymyTRSdRQHmcYB6ll
 KNPSC1HS6epp5cdgwz3NXImbI0VC+eGsqquRJCfIgdlZceIGBrfUPks3ika1kmGQcGe6 AQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1xbbj9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 16:03:16 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31GFkPUJ024648;
	Thu, 16 Feb 2023 16:03:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f9bc38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 16:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibI1Bg61fFSDV2XE8rQXTCwJ0vqRBGgm/5bRr2wANdibxFO352HlNVc9Rtl50E2wMHzop/ctxet0+u9sQY+Ev6dQ6KWg4Jz68jWJ9pQ1qabgc6Ai5Ci2mJhryXmZyEoBhuKElKlEMDdybbBBgjarF8Rwb9/5BONX2omBdry7M7tyo+YHTYSOmqUhsSliHxqWtUtBZ8i7Ag5dQc1FaPpJCQfXDOo9lPrdxGBS+qgwdii6Wt8nnfsUguD/9XiWzqfqK6/6hvtzhXLpeSD90PnjtNslQgJfVpaRJo86L8so5EwT3eU+LKg3q3/S/fjB7mN5ohxsDlBLiZ71ElXEnTlUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HULw1Wz16A3tbA9VcsrTAzDi5f62tVSzDMCuMPaRgpg=;
 b=g4zurNZ2927zI6yWb5Q1OeLilAMTtObMCTWAxf/y++VKmY9SsbjO1GhUizeDdVseklxHMHTETBD7WeXxSikM5HDkuqMT5nUnaQTQNUN3//ghQUBBW2sAKpHsIj54zcGigY1n92A4jnMt6kDQFk+d8jtz/iwjI+n16OYNLVzLBRWD0AkhkSrLgbg89uO75sti6fy5w2BNJrX5phNVEmF4hD7RpISZNrsg2m3kOI3vqgEsbWGvJEgGeXIUpoEWsn3HlO2yUyv0iRMYv8AJ4uCFm2axT9qYShpd610ccoOYcVzXF8pxpnqkGC4AFKCXdDShQm2oN7mObb1W9l0L9bFnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HULw1Wz16A3tbA9VcsrTAzDi5f62tVSzDMCuMPaRgpg=;
 b=zZ26xvg5lAdksGfmePifWUazzyAfSdwde6I4IL7ULOR1MhPSB+kTkLKmQiqC6zCmpfdFagQ1Zu7AYqDNDWOFDy5uLunW0v/LIQ/RWBw76XOW5IflPScVkQto9t4g6YOeQltTUi3pOKQkwW8RkezxeWQEr8nbhOJc+Z96qHjSI8k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Thu, 16 Feb
 2023 16:03:13 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 16:03:13 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Test results from v4
Thread-Topic: Test results from v4
Thread-Index: AQHZQh+Dx9f0SmrC/0yC4lLUT8Ke3q7RvBcA
Date: Thu, 16 Feb 2023 16:03:12 +0000
Message-ID: <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
In-Reply-To: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4784:EE_
x-ms-office365-filtering-correlation-id: eb599bab-1f5c-4386-980a-08db10374e88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZPrv9+UBeapu3vZkU89Zvk1THkvpUCwjAJyE7lNxiu2KSRfvrPfzUQzNJIrFAeinYYagj8NahIswZfPSRTxTRtMZPThHQmeLM54r/qMysoaj12kjXbTYuRwxFWjekygRQ53WTTUoqQStwN7AL2EMR7CGYU3fQAwgK3iKcXla5vsR4t9YZXxCVY878+bJ/6IcjEziM48LaKDl5r0vBEnxzhcrLpO9qe72RxTMDfkSMT7fF/cJ2n3/RSNxTmJP5fqY2vq7WHbU0ajvIR7tXk3f+pjccY2oQ8Bw84LVahL8HyTcXFvAVJcD2eNkbrAU2LgPWdy4ehg9ZfsikPekOZp3JZIjaS6TczHsuyy2FDi/7MRinqu3ifdU1HtEx5mrO+gYEVpWaM3qUzJrOj91l8YpB7R/XOznacjXEvIEzKrswOyzhKL0L2Q73L/hDVhaWc+BKvlISzDF2qt7WtxehoY5nlHt/yqUK+6lfmgOHTYlCoOZe0muTop/NWrzXV9yOvuN2QoX9RAmaRO3nYR87ON8lAHTUwlpPxsLizGCeOCrP19/bQBeJUhaPa1tlOK0ROHcFh1kX8zwEbzUu2eLKzYZZONRLiT1a1B0+O7EPtqDBNMbaCZH0J7yVy4DJqzqrRU8gsbVm1eCWpmG9T0NXSzlaTJdMtRYIcjuog59c3/Xsn3DWvKpbRZhKIq0i++2jyFe65FbHyv3yMS/s/vduawCJvC9rHsqnyv7VWyWErRlUA8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(8676002)(4326008)(66556008)(41300700001)(64756008)(66476007)(91956017)(66446008)(76116006)(66946007)(6916009)(36756003)(33656002)(316002)(8936002)(86362001)(38070700005)(478600001)(5660300002)(38100700002)(122000001)(83380400001)(71200400001)(6512007)(2616005)(186003)(26005)(53546011)(6506007)(2906002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7kA5997vtXLACEzbwkxeIqpQL4D4VZm2exh/bA4shZ5iQo4L7hG28DdW8shR?=
 =?us-ascii?Q?+nkt9qGeV2mg/44W2xB4FlgpM6gVNH5WCuQkTaMpDgV0a5JtWZh2fBvBQE+b?=
 =?us-ascii?Q?O9QQbIxan8okhIcLx0eK/0vm5JfqVqb7YgDKgw2iDJqEIBOdxenT7eg0YNfY?=
 =?us-ascii?Q?l1XzWohjkHiowhgUe7V6lUgrt2nsMko2JLV2EwA3sRk2G+HtiIZchop9WFuE?=
 =?us-ascii?Q?53AIqHfrfmaM7Ie+GiMthrK8TfA8Rev7/Q0ei3L0JTizBivdD1EL/T7XSxXp?=
 =?us-ascii?Q?h4O2nD8Oc78ns60lsFZ5at44TnBMxuDHjmnSkboKPdkrfGHh/Sx080BbSq17?=
 =?us-ascii?Q?Bvyn58kMPRbmLZyBrsLTc4atzhBq8t3+0YbRmjiQnEWn2SDoERZ2L7WGc3hM?=
 =?us-ascii?Q?myRUtKfacdW/fHG5EjEzWS7QOXZGHPbmbdfbTC/hH8zzh2bfl3EdyOWs/N57?=
 =?us-ascii?Q?rvG7Oqwy0OaQe1o1LvE0o+UN7oHFdy2QvptBBewPI3q10KxGrHMfyVG/s9NS?=
 =?us-ascii?Q?S+VVvK29ijia11XecmdNVVmKtuZgEPBfXacX7q/dZnwus/SwL3HvK3RKk+hm?=
 =?us-ascii?Q?oldgws2/5kDqECELkxEcPj+lgtaibNh8+K2CFYv7PjL2EMh2rxoIIwSeR9aK?=
 =?us-ascii?Q?Ppn4AEQZUS20G7E/ZZiUjpPWnpUCs/vGt/9XjUcIK7RPkO+Af0CsAXaRSXLy?=
 =?us-ascii?Q?WLeIYcfkPv44XDLWcEy9pIkilPgbE/17gOhFjC4qGn9YGBPTp94qAd/9XbOW?=
 =?us-ascii?Q?edv7kfRzP8UD6hiNA6Pkvr8VRH+1dygnh/8nSeHlg6+ZiZn0lSkFcUj1CgZH?=
 =?us-ascii?Q?uvx2J/js0kugKFjLaEG9e6BbFuV5zMG/N9lmUo44CxxDpMxwDqYkV4qHhu0N?=
 =?us-ascii?Q?bF875yrUgvjLc6k4FKz6EgmGOv1YgBDkHE+tF3hYLklm7mu2KiNu6T7vn+sh?=
 =?us-ascii?Q?VgRsJNofkzDjxXdKMMB33YKDshsSqoSpgROAlREyi7F/yiUY5BFP/sR9s33q?=
 =?us-ascii?Q?nGfEOwyxqjHWGLQ1pPgjNzTcjtga9g3zvdkXh1AMCdlVozVu0Zo0P8MYM57d?=
 =?us-ascii?Q?4i1sVIM0kqGuDamwjEeMDL5/CSvtU/kvA4ZJTJJPR+N4ztdVr+udZGYsrrMW?=
 =?us-ascii?Q?+DTlUUAiBasR3NFneSosXGvK5+T89dPdB04aJQEcmm+hP+NLTOGK+Ef/Tajv?=
 =?us-ascii?Q?UspmuBlNtDPnsAkUKbWl+UsrTiV3H4GJziHCuQdntXudO3tLoekSAQ1lXi7J?=
 =?us-ascii?Q?A8lzRE1nCHM720f2gIKSIIU69RnH2Lqm+W4X28pKS0O6HjW52wgPQsN9f75X?=
 =?us-ascii?Q?Ux5quPeiScQwGde+dQerimccH5NYLkwBEBsOdfOQNqOtuQrqGGQaPynooDPK?=
 =?us-ascii?Q?DK7UrrtmkKpOP4NU16gjV+nmMaJKEGxQL4Fg3zGdfc8gC3YRtwey9jjsmDj1?=
 =?us-ascii?Q?zzM6+b5gNlGmEuLQsP90wa3S7KEB9yuJiqnMCS73FT5bm8O0i2McSOsqa/vX?=
 =?us-ascii?Q?VQqcUfkZS3c6s9BY6Sqv90aW7TJR12CZpHjRzOx5tpxGgGxhBeGt19j+YCh8?=
 =?us-ascii?Q?VCHINpR0RDnm19YULfEHcDk4Q404zkpkt3bFgylQvZX66HnJ4ZCWtEIBNlk+?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <906E1D37AF13F7479FE72E7F915BA2F8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2Sf0XIb1kJ2EoxSCelnXg6dIXpzmnLleil5u6DUW/1knUfoYhO1dqVyUob9hyIuwBQGQXikzLPzGehH7x188n/Mu/eBCCogCP33xkjDtpWOsLaSiKph5ZQw0S+BzVDkjdPuUvi6ot2458GbH1Zys4NcJYQ4BhCbuP3Z6T3zkf/EQB7TC4qwprXgjVsyzCDrQi/isfCIuF7XiI/pDG9KV3H4+jyacyvlqRSgmHrUl1ahD2QpJIU4PX6jCG1aDj0fyhtCyGTDf8LmFSrd2Rr5v3t2f6RBnG594/63jcr8JVuYgEbAXR6iU2TMGMsVeefv0VVREtBm7/PMWG05WcGM5wKNlirH+L24y5NASTXj9CElZ3HO1EbLVf43Sk3/ayVCu/Xx/mbzVl0+FTEbGDUOfaybbtX7mttAEq4hMkg0jlvIonpMVnj+vw7jcgkyfUsqWqVtpj81YqWQU7bs9RRQeTbQs7FSK3etKtUfWeAPN9ytk2HR7D1NoYSKzdxea8qPP9FzsllI88R64bAP94a6EWNIVKux77AcP+2uWmiJFIndD2e94h5yEsFNTrZ3MsRE66pCKAvvpwMpJ650USkz39k40O1AZbF729M6tXAfo6eu7Wgfyx4Wkem4BZqwLZjxjVWoVENXTPGldoS2FwSuMuWAH7SwQTi45ASizxIjUYZGq4Y75v4QPkLyjlvP/4wwZ0HRZduWK491kqY8ApuApPGr4D/WiLqjs4U3D/QxGCeNdJuvBgbnR6ezh+X48ufdPkVP1vQVZ9pjJ/vIHnKDrQncv+AoypnCDQqFZqcYhxeg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb599bab-1f5c-4386-980a-08db10374e88
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 16:03:12.9408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhrNdanBaK3DW8YdX0gIcsZJZDJiq8W0J2KlBVt4XXPT84XsovSrEWC5C196cgqkhnZ8tWUMTW+N4sDibEc4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_12,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160139
X-Proofpoint-ORIG-GUID: kCZdHOodDiXWIk7V6Ol8-HD2MIHjUzdB
X-Proofpoint-GUID: kCZdHOodDiXWIk7V6Ol8-HD2MIHjUzdB



> On Feb 16, 2023, at 10:58 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi Chuck,
>=20
> I've given v4 a spin on my testbed, and ... well, things could've been be=
tter :-(
>=20
> Biggest issue is that I've lost connectivity to my testbed (openssl-based=
). It always kicks me back with:
>=20
> SSL routines:tls_choose_sigalg:no suitable signature algorithm
>=20
> for whatever reasons.
> I try to fiddle with the priority string, but it's _really_ annoying.

Haven't seen that, could be a PSK-specific thing?


> And also reference counting is wrong:

That's not terribly surprising.


> unreferenced object 0xffff9989c22a0018 (size 24):
>  comm "tlshd", pid 2332, jiffies 4294964098 (age 1513.848s)
>  hex dump (first 24 bytes):
>    00 00 00 00 00 00 00 00 a8 31 85 c1 89 99 ff ff  .........1......
>    00 00 00 00 00 00 00 00                          ........
>  backtrace:
>    [<ffffffffa00ad3e4>] security_file_alloc+0x24/0x90
>    [<ffffffff9ffbb747>] __alloc_file+0x57/0xc0
>    [<ffffffff9ffbbbc3>] alloc_empty_file+0x43/0xf0
>    [<ffffffff9ffbbcad>] alloc_file+0x2d/0x170
>    [<ffffffff9ffbbea7>] alloc_file_pseudo+0xa7/0x100
>    [<ffffffffa05158a9>] sock_alloc_file+0x39/0xa0
>    [<ffffffffa073594b>] handshake_genl_cmd_accept+0x19b/0x2a0
>    [<ffffffffa05d44e7>] genl_family_rcv_msg_doit.isra.19+0xf7/0x120
>    [<ffffffffa05d495f>] genl_rcv_msg+0x19f/0x2a0
>    [<ffffffffa05d3286>] netlink_rcv_skb+0x56/0x110
>    [<ffffffffa05d3cc4>] genl_rcv+0x24/0x40
>    [<ffffffffa05d277b>] netlink_unicast+0x1bb/0x290
>    [<ffffffffa05d2bc5>] netlink_sendmsg+0x365/0x4d0
>    [<ffffffffa0516e9f>] sock_sendmsg+0x5f/0x70
>    [<ffffffffa0517211>] ____sys_sendmsg+0x201/0x280
>    [<ffffffffa0519ca8>] ___sys_sendmsg+0x88/0xd0
>=20
> But I guess you've found these already.

Nope, I haven't seen that either, but I'm not looking for
memory leaks yet. My focus right now is to address netdev's
concerns, so I haven't enabled kmemleak (as it slows down
the dev loop). Not crashing is a higher priority than
leaking right at the moment.


--
Chuck Lever



