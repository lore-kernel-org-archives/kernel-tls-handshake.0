Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643627F00
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Jul 2023 16:52:02 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LEFuxl017456
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Jul 2023 16:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=GjqgevUPw60xMFl8ZPsvbjwwKlYqMtAT4zF6znCkelI=;
 b=lQo+y2YAggEtfgWkOoXrYVvVbBqNPJN/lngMSuQxTL4dlNqFtdYu5rG6lObiSrdc8fTS
 qTU8XGQyQ2Othc1QZE5vAVHc8GP80BKwPaPW8BYQqcMVd7k1HH/JMKgRGQnyRLjBZj3l
 J/uh/cADjXRnaccRZ7HE3asVF4Jq3hyTv3r8wPdksKmO6nEzaN7pAkw0rVIeEUnJl3zm
 WTr4jJAgWaI2NVNdVDfKC1eQO1iHmn9nu46iY4mukd9Ug3Pf6hkijegD/PdtEYceFdg3
 hH5tWPC9VPi6eGGNOVfL2hdOawcKW1j8O1EKyQzjsLDWLZR7zxS6mIawR/8tdEqTsJFN 8A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3run88vf09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Jul 2023 16:51:55 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36LFNJSX019283
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Jul 2023 16:51:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ruhwapt6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Jul 2023 16:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igP5VChu4/4g8WZc55fczWu72VywoFp3FS14HGaoVISEN5mTi7xD/DpH5pSkI5jbkSlMK0bJdPysioAmhcSmqRnDVAP3RVrhvhyPRpUsOxYOdzDyxaa0+5eokPQyx95PakGjRaqLLdPrYXnSp49HNnpU5PlpQq2zXGzKNXbMU/MN+zLqlqdSTbhYQsS5v4gRFUsOcLHavJzmmvh7jVKBlpKiJrHmvJ0A4lkIgRrMJ/dbO2UNneemJ86Pdkv76g2U9q1YKlgiHxGd8vbP8HKw7XaMoIVoXWhuIqzT55r/rE5DEJXDwV6B7wIIRrNqetc1GPB+c5ItDlVPqfJoEWdeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjqgevUPw60xMFl8ZPsvbjwwKlYqMtAT4zF6znCkelI=;
 b=HPTcocntzn0L0MGzP3Tjn2UQxLSB3g/+ImYeNfL2HyfNwGewPmh5LiD4M9R39DCWtFARKTBwVwA/+3rVNwtZ91yF8kq0vNJ5QQL3AXpW41fwUDUz+uQiJJ1klY89eClNcOjZoqeJdiBSxoOgrCarDQMp+QGnVcTddjkZrdg7VaTWOfRVNHHDlLdDAXP3Hh/BoDe5HhnXWsslUD77mfhooj3oOywDPWqHPiwFGbopkz+BAjs+VHZHzI1hpSClLiTySj/oBEk8VpSUgMxVQLq65Ia0MloRwvaSwKlcXdowDazHXOlu/kH8cbHvpN9uSqOnhoySkxtOEBgKgxKK0e35LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjqgevUPw60xMFl8ZPsvbjwwKlYqMtAT4zF6znCkelI=;
 b=aKRZQM/bfsYD2t53aFhgB5pIll/XA5/oF4JaFI1OPEwqjPiWJ1vcPwxG2VVHQ/4IHOit9eDWxYFkOoipHbRR/Eem7lYTP7gDQ6v5YWHwJqDkFNJOnSJYpwZei5sKXOSU4xMe5CuF58dWhSirXH2UV6eEWg0RG5f7Et43OStfgK4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB6244.namprd10.prod.outlook.com (2603:10b6:208:3a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Fri, 21 Jul
 2023 16:51:52 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:51:52 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Fwd: Bug#1041643: ITP: ktls-utils -- TLS handshake utilities for
 in-kernel TLS consumers
Thread-Topic: Bug#1041643: ITP: ktls-utils -- TLS handshake utilities for
 in-kernel TLS consumers
Thread-Index: AQHZu+6MPASJwGgWNk+gFjhiOtnQWg==
Date: Fri, 21 Jul 2023 16:51:52 +0000
Message-ID: <ADC46E5F-E8BD-4E94-A57C-F1D24F3B8E15@oracle.com>
References: 
 <168995592203.722785.16312336193263056143.reportbug@deadeye.wl.decadent.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB6244:EE_
x-ms-office365-filtering-correlation-id: de30cffa-3d69-4ce5-9f43-08db8a0ac89a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9aEphNan9ZdB2rqM8Kgb1VM2v0JQy9aUPe4cxWYRPmAaQAS72hakU6TZp9cFXBXd7NiUYmy6ohdRbWW1GhaJHHwNmD1k0Zk0t/H4rTkbXi2lTpppIY5JQTLW5TQOCljKT1DtWOy3l+ao8MkHrGrGmNngfgEadMUVchVV1yd9GlSiuYv0K1ERGNFtpQx3IrUj/C9RtIueXxLRkGEhk/QZq4Bd6DWCsYHrVAj+ub7GwnYOxTglWibk+WkvBrehCX1SMx6G2jZpwCu/G/JajHkNwYHt8DN9FTjpKFu980n6MItwV7ichhZIkPktVJ9LJxViyLl/SNgTROVluQ20PbOG724bja1a4hZw5uRtjeP9BRgOmLTmhg/C2d5sWWIzF/BwunNXujedRr61OgATNR3IJBiJ7LF084Fn9BeGm/h2/tmD29gv1nRHDronh4wqDKfWroEzlb5DUPJ6qD/IV8wZTqybTwxFC4wQm5q9Alnih1v6pt5vJU8z3NG7hp9WFQ7+/SVH41dVNb87Qe/UEu8jfR2eRsLPZKh1OVmCLoq/ov5NT7jFXR6wSNGZ/LMT36MFG+N7Is4E3MekbyW2WPo520/h+JxLqOKUTHReTHhQLLeR40aPeKYHVO8ug2vJMGpecdYzusaB2IbduU1AhXaeBQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(86362001)(2906002)(36756003)(38070700005)(33656002)(966005)(186003)(83380400001)(6512007)(6506007)(26005)(122000001)(38100700002)(71200400001)(6486002)(66446008)(2616005)(66476007)(6916009)(66556008)(91956017)(76116006)(64756008)(66946007)(316002)(5660300002)(41300700001)(8676002)(8936002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?s93NKN45JsOH6Z/8o9YwLS2i1Sfqo21Bhle0P0HaPCuRd5vbksp1QeGEtJ18?=
 =?us-ascii?Q?AWwh9cPlnVx4lWX4PHYPx6W3HHABYstnLP3pVrsCqL7VQfZQPVYSfgft7QR6?=
 =?us-ascii?Q?dDSxzxKvBPaFRonqrnCce4ehAiRCy/JdZaob8DT13A37JB4+2UK4rhRySxwM?=
 =?us-ascii?Q?6ObrzegQcpQMFBIdH6W90q8cFslXOB1U+CkwNcF+4Z+Jpeuj3UCPOWDl5UBO?=
 =?us-ascii?Q?IiPKQMlNna1uno0F0Dxtw4uSdENASXLqkyQg+y0P6uVWJkAHxbVyu7seJ99s?=
 =?us-ascii?Q?BuIOPJFlrSt5T0gOTr8T/oZnUGfvSdXOqpz5dJlzlxqdOF9rtzSNq8LTEi+P?=
 =?us-ascii?Q?aVTbsFmdwrcvUACWPm/JthurQ3rAsHmk/QE7XZrL/jWiMLOe/1sFSC4wnRiY?=
 =?us-ascii?Q?dTKgy8xwFG0hMP7+VPPnkYao9nilQlD+5ymv5pCUZIwmXvKWDztMEbt6C1Ye?=
 =?us-ascii?Q?gwCA/KNyd9CJas3Uf+CqSqLz7/9XHbxnnNgxowBQvtkLiy0P0fHzWMAnLnev?=
 =?us-ascii?Q?IeKoB263k/kNuWDeKamkPFy/IqVodyQO1x+MSV1iCf2hNi7iwXNtCJLUPBRb?=
 =?us-ascii?Q?SWFaSkcwo7759LKlqsWcNOWq3A3GqjXXZDGvdjhF6I0X/3uYR2VIt040aMdh?=
 =?us-ascii?Q?gzKYl9EF9Y3EkUjro/gzQPMzxcJqB5tq1QFAEGASdY/bDeSm3l3gWM+ALr7D?=
 =?us-ascii?Q?DM7WQ9rPoVQ5cFLNYj5b+KFQ1BmrlDg+Go1KAjAxY79B/HRMXmoxO84bZbaY?=
 =?us-ascii?Q?z5J5k1piJ/f8DT+rbggHnRmbAzTYN7WXetlC4NB/DP8ls5emz4n1X6LSEkJ6?=
 =?us-ascii?Q?hbwQQTy/GCMZUUdVTA5D2saq8Ff9+UV2t2IPW7i8sGmatMnwOTyfRm4QGTHE?=
 =?us-ascii?Q?m47mxY6VtDawqcGvJFd8AJyfVPlysfq49jgRoRs8pALrt07saOZGEFfZ+UpD?=
 =?us-ascii?Q?etcvAkBAXTTsnbBiRKTzFioIjfUqFkdJgyt5micBt+tvewBtDeJWaMWkwIIL?=
 =?us-ascii?Q?Wsmo5ArdN2yKksPJjZ5MvAgM22UKlF8l19uu8nbLE+hMj/pNtdefIvMHFxTJ?=
 =?us-ascii?Q?7RiHNL9P1cWeuIMtHxtzwqcK9nE2DDQvYixR2/KuVZjBNZLzujUKjnggz9+F?=
 =?us-ascii?Q?sbPxjAQ6/IpqA6JSMLUkKjgN2oW1CG0UJBihp8VcQB759XrmGTQ9vBoVTbOc?=
 =?us-ascii?Q?lsrmouHwpifQg3o+VEiDocxtJtU9FT6X2DYsj57b0inipsom107MZ/TZrTat?=
 =?us-ascii?Q?fUP3+BsE8/qk11jeQYsBolsj0vCx5IWETl8uRM4QZ2SF0a0GkCwgaETMWt6R?=
 =?us-ascii?Q?FZ/eY5MoDl2vI7qdf0+CC+3i3Jgvadsvu6CoQCYF7gsMhfed0tShUt3rD3PN?=
 =?us-ascii?Q?hn10jIc35sIa5A09oxr8Y3Fg+yOGrSPIO5ZAt4JPIicnDXe0ed2IIU1768j3?=
 =?us-ascii?Q?yZ8Ma1kCENXKw6++Y16D6sN8mv4R7uZi8xji+4dhSTLrL+OGQCYHFqkTTwAh?=
 =?us-ascii?Q?Nxsnxs8dkxzcVVuQ/yr2ZQ1YMs4C66RVl2EA4rnqaW88nZolB926R/BRpWJd?=
 =?us-ascii?Q?i/EIWmJHY4pcwDdSDmDjaj1udxv7vRKppQ2c+NesizcmuGXGuV5NVrSffZNN?=
 =?us-ascii?Q?rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F0BB1DE04FD164B971DC8EBD8E2FF24@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	obWWL/YA/vdZdrIl0gjh6q0qTttCM6XNuF2EUuWRFLJrP60+MUzOsZSrZmoWOHl9AZPXyZ6uHNBgpr9gRMdEkZIhtvltJzfJmAIPO81NLzlzxIVo04TyYXHsU8OMt2YrMr1HBF+8YUSACIOsFk1pqXu28NqcNYS85/aLdj7yY9uNFImSYADh0nU6ckJVpe9H5u7+QAs5BqccwIx2KHnA5Sf4srJhvCkGEtxIByros5oW4sllKu3tuy5o26ZhVlYNGKM90wJgIy6skFKGlKJS8JbMZ3O1cdxLC1XuJZq1WrIy3hata0r9jezuVzHonSGOzlMT9BfvMFnjUzXGSF/mzscti46mNeWoRwpe6SSIVc3hfUAbL+ufeHSlUbgfDMiMWBnWiRIOSWr0Z9z8Ha/RysmdbXw4QZA9RdMJCITe8/UEt4VeAFZ8/fYCC+Lr6rxaMTwX661sxqR7yfJJ0idekV4OthdzZDYz1pvIuF9J3a4+rNs0G3fOR5VmC8kBARpHDI9l5TlXR8YII8iRztAsPhedjPx7BaVi6oEBl3Jm6ecHnGefvsDR0tBLVkDSEtixSPxRjQ6uvD8X3+OXNU8TqztmtuMhKSmDvtfWF3BEK/9Zfy3MCmfjCNJia1B64HwGTeTQqhbu/UgrXQ7LznCUmk1x/4CrAYYpmALUISoKksKQ6az1S3AN3OqUL8kq4W1r89BqHCRKdKg+lNZfNfq6ua72oYhs05i/jWeteZGZ0tP/yv4a2vRkrjindkIpQ4O7/5HuSbYRHwwEfPS7oJ8RlQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de30cffa-3d69-4ce5-9f43-08db8a0ac89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 16:51:52.2884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbTtOpc3Fg8hcwN1RLE3VU3Ovy8HkeGApAWgHDehWZ7o0himGzu0fQJY7KluIK/OdEfei6uKuZJld+QhzMXXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210147
X-Proofpoint-GUID: 5Cxg7UOQz2hcVOBoAjMpY7AJ85klnjSg
X-Proofpoint-ORIG-GUID: 5Cxg7UOQz2hcVOBoAjMpY7AJ85klnjSg

FYI


> Begin forwarded message:
>=20
> From: Ben Hutchings <ben@decadent.org.uk>
> Subject: Bug#1041643: ITP: ktls-utils -- TLS handshake utilities for in-k=
ernel TLS consumers
> Date: July 21, 2023 at 12:12:02 PM EDT
> To: Debian Bug Tracking System <submit@bugs.debian.org>
> Resent-From: Ben Hutchings <ben@decadent.org.uk>
> Resent-To: debian-bugs-dist@lists.debian.org
> Resent-Cc: debian-devel@lists.debian.org, debian-kernel@lists.debian.org,=
 steved@redhat.com, chuck.lever@oracle.com, wnpp@debian.org
> Reply-To: Ben Hutchings <ben@decadent.org.uk>, 1041643@bugs.debian.org
>=20
> Package: wnpp
> Severity: wishlist
> Owner: Ben Hutchings <ben@decadent.org.uk>
> X-Debbugs-Cc: debian-devel@lists.debian.org, debian-kernel@lists.debian.o=
rg, Steve Dickson <steved@redhat.com>, Chuck Lever III <chuck.lever@oracle.=
com>
>=20
> * Package name    : ktls-utils
>  Version         : 0.9
>  Upstream Contact: kernel-tls-handshake@lists.linux.dev
> * URL             : https://github.com/oracle/ktls-utils
> * License         : GPLv2
>  Programming Lang: C
>  Description     : TLS handshake utilities for in-kernel TLS consumers
>=20
> In-kernel TLS consumers need a mechanism to perform TLS handshakes on
> a connected socket to negotiate TLS session parameters that can then
> be programmed into the kernel's TLS record protocol engine.
>=20
> This package of software provides a TLS handshake user agent that
> listens for kernel requests and then materializes a user space socket
> endpoint on which to perform these handshakes. The resulting
> negotiated session parameters are passed back to the kernel via
> standard kTLS socket options.
>=20
> This will be maintained by the kernel team.

--
Chuck Lever


