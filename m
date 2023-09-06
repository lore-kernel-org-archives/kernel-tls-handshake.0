Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0C107B1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 15:38:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386EiqH2029145;
	Wed, 6 Sep 2023 15:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=OLBfcIr7gGtUAVMitAVUT0sMPlf9I/eLovQDyvA9Qvs=;
 b=fnCFzn9JEok93AaKikfcsvCjHcgAqAciRcanPR/GpqGST4pzxriRUHalzrY1Y9b8MM4h
 IdNLHcfnqygRyvv//cGKOfh+qICcCKGiFxP2/gkbOqc+zvUqOJJWbpsVF6xQiuuw8QVc
 X9g+YoX7r6OQELiNZlmm1yCvslci24zy8P3poyVL/YPnGxTJsgNVsKZ+0avOPOtfeMsf
 McGqJcSVzgRp1gWt0J3uZgBHjV4DxriUiI63/ZNQ9PX0PTsyf+edfg/wqtN6joSWpLhm
 ipliHIJCVCZ0IERQ2Hb6c1b3ltLEK5TjVj2nKVxtz1yQxxT3malc6zuevawIq27A2u+X gQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sxueyg6rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Sep 2023 15:38:34 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 386FD89J010380;
	Wed, 6 Sep 2023 15:38:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3suugcnunx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Sep 2023 15:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUNabEbFO75IAflOHlYyuVbjxGUORG9bNmNPpEuPCNnSb+Xiww9e44AfaOErTOHWkF5AtzqLZ9XNknkWbup5bvkYhbq/OQ6IGDN2l6EXHq1C0czpYGig6VLhzvnOMQTj1JQkVbdK/aPNTbPx5lRLqFBN7Ng9fTE2VKjVxDX1FEAJHti+Jv6wrbByIvkYLIy3iH7Scb/i2lf8nYxbOY6wJTRAQQ5EEb+VfA8HwZi4N0ZWOKwsj5XnOMBJ6iW/ycTh02DXi1n3SG4iW7L6JChIOrGR9or0x6HPqst/w47C9eTzTI5OtoT4OwDLHHymETZJ7KTCEjuc8PY0zu1GfHiCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLBfcIr7gGtUAVMitAVUT0sMPlf9I/eLovQDyvA9Qvs=;
 b=L8dr3d2dCDFYY/M7aiBSeAYU55YUzp0qa/HHwG6Eb9lM1+fHW7hcF4PGk44yXh91E1LqqYf7sUJLzmRtbAKTSwa/Fm5qBKRS6Pw/jduy9kuKdhDXJAqbRAGlWsdTyYMjDFeRY25IDouZGmAfftNp51He6UwTag2raMligyuEFFEZ3lAqUt+uTG4bwwsqkU5E/wtP7DViQoe5T+H/xt6b1AzB95+lJlUglx8X6XEe2XetDd5hQk3zWxbjMkJSE/gF7f5ws79wOvpyp83MJp/m3VBCZ0OkrleUCOF7/U9X5fSD90kb2iIdvRp0ks5qpZld6o2WzGRuU2l1Fv57iMqWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLBfcIr7gGtUAVMitAVUT0sMPlf9I/eLovQDyvA9Qvs=;
 b=TNj/yVJZEcPJDk64Sck7azz7EzOIBTDCdLWpJvV0kR0+Kugfcnz0P6htlT5UA6zcOiquYqna+Uatc6tLSUS/7N7CMCCN2Fm0UPx/vdulltVCMT0enFFR3xuImR1mkHGQ60YVq84mVny01byuM6Uufl+2aZWYA+/BWxiH4K+DvmE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN2PR10MB4381.namprd10.prod.outlook.com (2603:10b6:208:1d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Wed, 6 Sep
 2023 15:38:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 15:38:05 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
CC: Hannes Reinecke <hare@suse.de>, Olga Kornievskaia <kolga@netapp.com>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Topic: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Index: AQHZ4Msr4xuGDwPB1kSaS5o2z7XRQ7AN7p+A
Date: Wed, 6 Sep 2023 15:38:05 +0000
Message-ID: <1F39C954-2C22-45D8-B986-EBB699063B7B@oracle.com>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MN2PR10MB4381:EE_
x-ms-office365-filtering-correlation-id: fb134be8-18c0-44d6-ff98-08dbaeef439d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 byV77crJ3GJPkDyp7aIJfEz36ifUb7vAvpqbSboZJatoXGUMV1mGLiLnWEut7mztMVAzinPJ14fQGN/3PYWg8ijvqpKgHrJcEP6tURVa4mTxv+W3SxQEnulahrCOc+qAmSSKet1xZS5hmNYpYj/nyx4FYOWNQYv4stNrKBUmGsRkWGtESUvKWCyBApSNOUvF3ZKfvQv4B8pV6mv27gQj9llPGA0VTVf6AnXQ0iBQ8FGsdmrcf3MFpVzILwoChoYhGRTR1SCT5OcVcs1KrZDT8f3b3N5oo3eZ+vFL5n3dTzGmPzX7by4DKle58nEkAkuwBntuPoTBHm1Ic6Z4KHqWLbwcKQpr1zAlUkT5Lx6XX4otTwU3m/XN1Urm22tfty5LmI2SmJ8dcoCpVD5H4wATa+iXWmboE4MdnzFDCR4CyiWTg/STMX9eNgr+DWGCRa2zaMrKRJ1wRils/NoS9KXpJv3HILg4vvsnUIPXTSTf3Kr6XazEQCClFSn+eSc4ybNQlxOWvW5+LSE/ZvRUWWNf+Zs1l0nyplkKEmgRRz0pxfGX5xsF9entSSeGL/uHNMc3sm5iW7TUolZ4gc4ZnwGTJHDA8kQgBCCxTdviFVnQp4QMtfjKhtSVRDsePj7jHBTJzy/shuHMbttYKCgqGPVO2Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(186009)(1800799009)(451199024)(38070700005)(38100700002)(478600001)(966005)(36756003)(83380400001)(6512007)(53546011)(6486002)(6506007)(26005)(122000001)(33656002)(2616005)(71200400001)(6916009)(316002)(64756008)(54906003)(66446008)(66476007)(2906002)(8676002)(4326008)(8936002)(41300700001)(5660300002)(86362001)(66556008)(76116006)(66946007)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?B1A/PCwZcOCiuFuuQ5qDtYPU+4uyy0uBJaNrQvi7dUDvWqvcNbrgD7q2D1Zp?=
 =?us-ascii?Q?zbp35vLHvOX/131uXyqj+Lw4ome7oaJqwceQNSMmCLHYwI+rIK2yl5rlsvDd?=
 =?us-ascii?Q?RbefR75eUG21zGaM+UgHWoPkZyaTMxc3xqxbd7g/aISHT8RgK8hbGptR8hpy?=
 =?us-ascii?Q?J8yQAHgGkjLjZ15Sl4t8/jVObl0O2/majiVIJoBODPBUurkC41jZfWOsOdgw?=
 =?us-ascii?Q?XM8eI3gRTY90DqzBPEI7U4bQhZO+VaNiOBbn6UhMcIc3NjtXqJbW9Fkzzmsp?=
 =?us-ascii?Q?7unXo4sYFxPvWO7hBfQqWIBhhJZdl1lwmgnFKWlZt7CNXu5RtWSwQOVmrRVS?=
 =?us-ascii?Q?Dt3mOriKowPq9qRSwjREPPs3tA/Rivor3W/shiESIzudzXYZunL4k5yCtjJd?=
 =?us-ascii?Q?xdDJg/zrCXR6+LcLABx245HhFdk7vSdCDN15GftR3CfONsEt3i0Obe86AXJQ?=
 =?us-ascii?Q?scCHn7lNdo9NKM75RACFfCvgoSAqhgfTEu0Um84Sv2y3XoewBzVcw3vA9Sh/?=
 =?us-ascii?Q?66vJYIGtqmSrI8BUr2Kae5V3NnE91ZNWA6bkE/IR1m7FiwAM14/Smb6lk1Uz?=
 =?us-ascii?Q?XuZFgaHXW8VMTbJXsPOQr99uBu3HH5cFESBlfKdDsXLg7gTOZoGI8OvhURjD?=
 =?us-ascii?Q?37YrwCox9O6WA9DDUTsibsjWMlRIZQYf1s8epCK6H7KuVujCYFnIo26c/EIv?=
 =?us-ascii?Q?XSbUX/xD0GDAu8HDPe1j8t/G+rihtlwancH66iJMBmM2bvNSIrOhCl7D1yEo?=
 =?us-ascii?Q?eyj/SxV8lFwhcXnAhwQAFSkkzjEUcweOlo/vCI8GXXesadBpq1psWgKatVb0?=
 =?us-ascii?Q?NzOt/FKbdo3Z1tOB45+mz6hnqbwEQF239ANlqdRwCHSEVBh/1j9Ntt5i81Ds?=
 =?us-ascii?Q?oEny2YnMv4g7q2OL1g+rtRSwViOhIdLiD67uNw7Hmmn2QUoiCKNhpiP9mfjn?=
 =?us-ascii?Q?UW7iGtUuWGdfaoZaNiej0YE6S4wibFWe7qas50USGKorORGWe0/RrLLvJKvg?=
 =?us-ascii?Q?1xeXkfODs+McCCzEhOUzFK3A0Df85cxGrsPCRAEryM6P1kgebgMIy2ayDyuV?=
 =?us-ascii?Q?9whoYBTmhvN9CMFy7sJsOQuI/z0fZHgdoY4ci+y+8pSaxq/2uHQnkyvmeDE0?=
 =?us-ascii?Q?OEfvO8nzLDwo2uIoa98bSOd4IwmSuKeEs64n9WnRw6eYXmqJrS8gsVHR+fwS?=
 =?us-ascii?Q?QdJzhhw/EPYBkpz0E1zAcZtxDDtt5xoZMFh6nu1c69AN3PAlblSZve32tGD2?=
 =?us-ascii?Q?cbSOzChXjLeNw0BjFKbONzOpUcDS1T/rSU6n2bH1xA/r6UcRYpGU7b0uIK5l?=
 =?us-ascii?Q?P9Q9TZXsQrBASvtL5SALj9e7FsAqemUgEcg16bdcNmmBrT7kIDs0ecPi0HQ8?=
 =?us-ascii?Q?Z7N1Y59zea+t6S2bNhohHzWvLkKEup84t2GTNbP/XCfcge4jc9KXfqb31nmF?=
 =?us-ascii?Q?Z8UmPInoz1yP9xOiOTt+BGszOHHDNGqU/uA8hgjIN2raumhswf85ncSoNhgv?=
 =?us-ascii?Q?KO4BgJGfMwyWxxPthmzrg5QfdpTAFFaigSD/Ouv0NQwx34MfTz7FFWXam+g0?=
 =?us-ascii?Q?FZOPOFbh/51zl9WRMUcU62D5nieDbY5gkhOzgpSnB65PkmMtzEXwSuEL9eig?=
 =?us-ascii?Q?UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1506FBA499359C4DBF32D02050EB5F33@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XqvfZiXWJDwCR86itcgl+/O9Gt9/73Z8+vuxDeWPJsDmJmYK9a7/+kRUvXH38kxQidqmghNsXy/oVuvEXWIT8ddTJ6gL9Mh4y6Mp7a5oIQhlTQxPdJpurrNc2KlelPUZpbHBGJnwhB/tM2xYbe16lllSNgRBlVSSpAxzWL5TuCPrsGj2Gr/g1SMdjKgkcfNVPGbrfsBCEIUrFfSxZR6C6TmlJnnjc0KUkxTdDqZNZuHs884QcGwPVtCkdEu6aNNkkzk3llG8ud3TzzSdoG6NN/xGpZw7PD7YJWCcoUQSbMBeuRx8ajDD1YGY5KShkJJhGP1Z8sRLFFmUB5wSc69wEpkGvyChgINPmEom4lt64SU5s2+35K7iNsDV4OvSmSLZYIZfMlGZt1fL0EpCEVlJXaHrCck32hqye6z87szqRe+6ADaBMbDXwtpIX7bjI99x5D9f8MwfYf0X8tsQvJr5JHhigOysRCgcHN2aIvzSxh4QLpxAjL6UOCpLo0svf6nMOZntBhwZIxgIPooP3djX/ypVJQzdP+fy1wW5bScQ4qjq9LkKYeOHA4kGTXXS64c3yNCe9pppF6yaauizKW7LAgk2nVCeRePx9FwNrJtOJ13hBT1u5gNCoREqaWnxyMd01/HQ0+Yy+MMeH462rLBxNOcpCRfxb2aBnc+tpRTEnJeaJw5Xp04z8gnb/M/HvYaLRIkrO3nQDYi9xWssqGp2MxF2pu6/VY6FgAqkb5OOyfNOHg2fOyCaZTnENP08MGNQa7F9eNt6qgmqFuMmbl6C6yb53gr/gks7TBgopoHSZd8HbwkEhHXja8jdajrCYsc4
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb134be8-18c0-44d6-ff98-08dbaeef439d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 15:38:05.7329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Inyo/vbp0cLsX6YNXGKQr5nrtPNQEXuDaMx4uReUl/NaLqs5tm8gwP/tKvS6Z3WQvA3+swj8YRnes/0cwKzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4381
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060136
X-Proofpoint-GUID: W14OpBPNkaeBM1aNavh7fDxkalVE2KR8
X-Proofpoint-ORIG-GUID: W14OpBPNkaeBM1aNavh7fDxkalVE2KR8



> On Sep 6, 2023, at 10:04 AM, Chuck Lever <cel@kernel.org> wrote:
>=20
> I've been collecting a few patches for 0.10. Here they are for
> review. There are two that are controversial:
>=20
> - "tlshd: Revert b586f7d97795"
>=20
>  This one removes the reverse DNS query done to make SNI work for
>  mounting servers by IP address. This query was noticed during
>  security review as a problem. Instead of a reverse query, server
>  certificates can list their IP addresses in the subjectAltName
>  field.
>=20
> - "tlshd: Reorganize tlshd.conf"
>=20
>  This is a user-visible administrative API change that I wouldn't
>  do if ktls-utils wasn't clearly marked as PROTOTYPE. Let me know
>  if there's a better way to go about this.

I forgot to include a link to the repo with these bits:

  https://github.com/chucklever/ktls-utils


> ---
>=20
> Chuck Lever (5):
>      tlshd: Check return values of non-void gnutls library functions
>      tlshd: Ensure tlshd_peeraddr is initialized to all zeroes
>      tlshd: Revert b586f7d97795
>      tlshd: Reorganize tlshd.conf
>      tlshd: Demote missing options
>=20
> Hannes Reinecke (1):
>      tlshd: add 'delay' configuration parameter
>=20
>=20
> src/tlshd/client.c       | 22 +++++++++++++++++----
> src/tlshd/config.c       | 23 ++++++++++------------
> src/tlshd/netlink.c      | 26 ++++++++++---------------
> src/tlshd/server.c       | 14 ++++++++++++--
> src/tlshd/tlshd.conf     |  9 +++++----
> src/tlshd/tlshd.conf.man | 41 ++++++++++++++++++++++++++--------------
> src/tlshd/tlshd.h        |  1 +
> 7 files changed, 83 insertions(+), 53 deletions(-)
>=20
> --
> Chuck Lever
>=20

--
Chuck Lever


