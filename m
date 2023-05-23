Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63806C131
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 May 2023 23:09:25 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NM4SlV001390;
	Tue, 23 May 2023 23:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Xt65IbEv5p527Y3ttSwz5jCbqssmjcA5Oop0pDL7q9g=;
 b=o7VDTI4Me4EPBowZ1QqQM9QjtqX7xtfrMrvNiVYiX/YAD4tSNNt8FozzM033mLY2tGlt
 0knV3qfoUNLQE33Y1iqGfrLl+C6f2vo7VIjWEhlsz4ODhJe/4Xr2bj45F7h8nV9TnEES
 R8Mum00okX8R0V5KlbeoveUNJDVuyWWrhGdtht10zT+fny9bDXsNFYy46XAntbD/l+mt
 wg1rgOBKAnspMBysLimAvoHqbx4+MCHO49Rh6BxWRymHhimSr564nQTfYHnV5gxwX/cI
 lVqiOWTZ0Bxtgse7PPr9tySeOhRDrNyK1NEi6gTWhJmc7emfx+4pX7TyVa4PdVcLq5Tu IA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qpp426dr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 23:09:24 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34NMElIN027122;
	Tue, 23 May 2023 23:09:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qqk2e7jmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 23:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmkQtAPvPe4zmDD847UMUgZ2m1dCPRJG+EBlckNpRDV+YksG+czfwwktJxu3/AdlyhPS90ZnPKnLVXPSzAERjacDBoC/Y6Bzx7jExKQP7UEBF+CUKUJpE7KLzuFtJ/8yK6r20XJvbvutPbGi+yzMruCkyywtEVpDbZS0OkK2OO75BbBiK/s+MUclpIhWY/O4CGDxQ3oq7j32Zpn3PQ1Iu3Rjo0XkpfEsQSa8STC59Ui6undw2Mi+tSthEKqDMTmsqMt0o1hrHMzZOVyYUu1dmRfgFs/y48aumLwlgzxaJV5VsUhSblYT/gYhxkktyxOnWULJsJMhnE7xoOCAtww/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt65IbEv5p527Y3ttSwz5jCbqssmjcA5Oop0pDL7q9g=;
 b=AnamUER7qZGaI8Rr8w2f9MTFOrmXjTqL8z/Lje7zfrlEZKAL/8xv29iUJqSOpVoeFPwPHlZPPqQSlmxXMzA/DXIvT8JF9cpg+0/pMR5Nly3Y0b2+fodicXByxHmBwcViroDamhWCQyeTatD/HS9tSDVfq4weCO6VX4GT751Znd3RxvkahDCqdjD4nG9MZl/9DUla3pdSTP3eXKk5aoneX8CQv8ijjE2tKvqPvbnbnTGZDGVMwFUfjbR3b3OWSPrbOkecvrJLyYwssSJVJqBbKj4n9cm617n75iSFRM33V2qwjj/dar5YIun+EjLHeDtCtwWSaLrMXjiamCkgLeBztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt65IbEv5p527Y3ttSwz5jCbqssmjcA5Oop0pDL7q9g=;
 b=wCw0LQsoyp0du+useVTxVcVMBAXGmvj1q2/P+vr2R+tDI9EC6chY57LY8FViYDVLs9egTmozU3TwdCCsPpS/XJGPelngbb3csGNp95N1u+HgxIzKcGF0rZ4LFdrH0UVvegQk1c6ZURqig65BPVv9o57qrSvlhQQIIZ8MZH24g8Y=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH8PR10MB6360.namprd10.prod.outlook.com (2603:10b6:510:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 23:09:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 23:09:21 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: handshake_nl_done_doit oops
Thread-Topic: handshake_nl_done_doit oops
Thread-Index: AQHZja2pJxeRUma26UK7/vqWLduzbK9oe84A
Date: Tue, 23 May 2023 23:09:21 +0000
Message-ID: <9F7C44CE-6D17-4093-9130-9D4B23E518F6@oracle.com>
References: 
 <CAN-5tyE=czkdkXcG=X7T=6R=DrB-6wfqFSh4AFWRJEYAZVJaYA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyE=czkdkXcG=X7T=6R=DrB-6wfqFSh4AFWRJEYAZVJaYA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH8PR10MB6360:EE_
x-ms-office365-filtering-correlation-id: d319f4a0-5e0f-49bb-3eb7-08db5be2be20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zkyB1X7Yv5kIOuaobWSnOhxj33ayDbbMgI+ga9T0l+t49/ttEuLRC8zs3KAS/AnPntrwLdVLfcfc9ppvBSQZRN3qxl7gujbLgC81nVYbxF8Q8ufBOqLrt/o94pEe2n0lhAO3M7jy8i4RtrlnCfIzMJWJgp/lxUEMWU16hdOIrsddAxgrLDJnBFbuocR8rFpiNSKw6Dl7Fs08LPGfQV8AiVPRT8YGGehm9ujtmEZfP31z2tc3yW+xl49H5vZZ1qoENS6dryChe8LVPEcTZ+jBv/R4ws8XQm5k521G2GCg7+CGoebau+nTKgAuQoiaoMcZxvRcLgImtFEV45zp1gVyen0QnSugevRNCyRbGSAJrLgwtKlj4AKqKFAf2xU1Z+VIz8RYTLMBaZfe2pc2si9oCBxJPRFiNYyy7Xk27PdgEWpkgKkWzZ6ZyMdLBS3fkZ54zVyaLC4xQ75gshu9nWuWXNouaKNk5e5XoGOewrN/94b8bMEtvRfnuWdXHT+JP8ZfOIuTkbzKfK95y3LjLYksTczVe2zd5NxxjhdJvkYSLqk0HdDcXOTWsCQ1ioVpClDXvQub0XVSIwgxGP2qsqRf1wsKGvxU76h98hhmS9p7LYbItcX123JQisCkUec44J3Uxte0tXQBQG9Px/ALsWPZyA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(122000001)(33656002)(26005)(186003)(53546011)(6512007)(6506007)(38100700002)(2616005)(36756003)(83380400001)(2906002)(6486002)(41300700001)(316002)(71200400001)(86362001)(478600001)(91956017)(66946007)(66446008)(66556008)(66476007)(64756008)(76116006)(6916009)(4326008)(38070700005)(45080400002)(8936002)(7116003)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DHNUgO+/KI57r2TaC2D7TxawMmuBr7Nl7QYADuODK2g+Ed4NxU2DhdVY5iAn?=
 =?us-ascii?Q?vwmzleZ0wQsk3J83zCifrctA0Atwxjx8NyFpsBl8NAP5I5Mz5U5YkGrXQO3A?=
 =?us-ascii?Q?i2+hmi6cmW7A37QjI+C1XRMfv1z/uffkzp8UTZ2GNccWNZ8WrKW1q18jnyic?=
 =?us-ascii?Q?L3N77QJdXt+vTc35vr0c/DfHAVTDDMXCAPJ9PC8Jd1tywXxvz1NQwktQhf5W?=
 =?us-ascii?Q?McyzgIDB4MmD6AvGEztHOElMDug905icSLOs94Tmg0P959enCQSJpfGHOL3M?=
 =?us-ascii?Q?+i3Lx+mfJSOY2LZurPER23PFUs0CHtDTV68pBJ3F/ulzeyyuyjZ1HX9voTVM?=
 =?us-ascii?Q?hsuJS4qGj1lMb87UQlB2vAZ3sUjLiPhV0OKmWxKM2cHGYnN8UNaf30AkiTwe?=
 =?us-ascii?Q?4jXhncw8l67on0iMiV6+Mj5gyVdT5DV99G6q4ri0YpUkShVOiSria/W4YGQK?=
 =?us-ascii?Q?SmKgfTNoo/gagP+H0Aux2mxGX6nRVvrPEbRCvhsZNND13o7t3dUI8nUb6jxN?=
 =?us-ascii?Q?5QqtsFwXJO6Tb6OFhSrRxv8ew+rprpAzegKQ3aUFhW1fu6mJ8RpuSiCOf9Ds?=
 =?us-ascii?Q?/hZKIDWQRAClftklWSlHPZc7Ecidy4h0L/11ie2uf45XAdoLaX2EKYbCVV52?=
 =?us-ascii?Q?oHdPFkI1rvvhOGJHcLy6oIbxdbM4mgcLvaNxl6DnxZXsSs/ufNOLyI8UfgjV?=
 =?us-ascii?Q?YzehGjDFjTZqeXa7h6DPK/OuhJOYP3CW5xSkgY5HlTNrPeareOWZAW9jZOkO?=
 =?us-ascii?Q?K+KCAcmsd0qj21EVSZzUUU58VmImKHb3nSzkczNTz3tgrr/LMgh5YIH14kyV?=
 =?us-ascii?Q?Uis1SMDfff0o+oKqvDImhYiluglR44xVLt/PRCJDdGll3+gEbPcp1O/hlz6x?=
 =?us-ascii?Q?RaVsHK5bPFZA9LtdZOtGKWXtKicxq/3UFKwmRwoxTsUquubS8vCqQwBolZR9?=
 =?us-ascii?Q?JOv1Vv0H3pPBqIj+GXX3yrJSjPppyGzgTuD3d6eQvxNWq6AogbcWyfSREYDw?=
 =?us-ascii?Q?3jJ4Ye4DvQP15BYBwUQEI8ZXd6VP7UKcthEtvyc5GysbpQZeWJO9t8vODwZz?=
 =?us-ascii?Q?tUoMsN3fgwfPczKixSxQsy7ESGHwOv9xboLg4lpApnHRZdDe/nDIUFqt8vEN?=
 =?us-ascii?Q?ETmNFrKO8aI119JQ8o9BSi6Z+zoMqx+f1Ajif4qdEOEOxW9eQpdaDJ3R2lqQ?=
 =?us-ascii?Q?7U5yW+xGtqUzsQnwlvCBIUA7QuAPrIxTz4sODr9QVGU90WM3Only23N+xQuP?=
 =?us-ascii?Q?lbbZvfMclzxxzs6gWZ3ld2lHHebxcbNMXJlDN5BDOIN1G1poUJG+p2watNp8?=
 =?us-ascii?Q?kTBf1Iwv6aBDeLQ9xRO7wEv7QVjusOrrztgCPjvowYF0X5rM0Vc4xvcbuWBB?=
 =?us-ascii?Q?hGzMcLCP+MY2geWCmVmNTPILL2s8t6/X2l4LEHcgtSUgN1CijEAeyLr3Pen5?=
 =?us-ascii?Q?DesknSmSyHceKM8t9zw8TulIZMfAc9GixdFcYlqBM/ebI1h5cd7b7NXI6ZwH?=
 =?us-ascii?Q?ecjEftYitJN8T+VTm62lCxo/T9mIP1zLbDuPdWEuBq9RYfCjjjCLoG50xcj7?=
 =?us-ascii?Q?hOeA54J2Hg9EtuaWpf+nQDhTlho6KYgueGqvqG4eVd3ZRkrQWd9froe35efe?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F514E15C6F78E47B45BE33F3866E417@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iG++4ctez2qg7StJbBpzhmbq2mex96rYlZ+0/snunhnxOFyMY9zs4gBwi2vgDuYtjQiViTNFtfORJOAC4ftHzp0yBUUDyVncUHNX8Yx5vJeM88cuk4msbDpqamb2JCAa6m5kHRU+CKZrTsihmvrtscS80zpcqv7vvJZEY99v077L0eTn+w5iIkXvhhnNNjt/oziLE1sA4rL6d6FYHQvOZPWu2Gf40Hl0dIDvlvps/F+GHdBhU5IXTuFGHBF4qmrflrLkm1VwR+XcdERp/+pbuk9xS+cLFBnbhoNlEmVMfPOB+ApcwLbq/GkJ1Zx4uknieMmGJw6Uc/daCsrukvKqyhrALrgp1bXktJyYW0j/MmX+LuT8AP5Qf6KZiE/sC6zEnjwqPZyEtb7sVHsQEmCTABBGCUqHzDi/UG2vdIAY6NblnKe86OjSAeQPZPGVclOgHeYDbATGlhilbvFuJfkGyZ9rEbmqJUF41YuzG/WihfPemkq9Vrnwi9GHhYIRTcQUCLJ3w15k/KYCD84uvIz+ai/WghdAGizjI2E8xxSwQi+ytZqc/lGODJ6islo4f/RcMZIqslS5fPc7Vmqvp4g7w5TW/LHpr3bPJKytj5w/X6jjRGK7lmUHr7/7birEmAG2CyCjkZo5ysyPh2YT0jekO1Oece6Y2PRNNQacq1bX0xLlGC96gJFI6sy/ya26VmKXHCrkmNyggpxjaFKtzSkf5Y3rBFv5PnWPKtdT8fXb5XwCqwm/iTwE27YybVBAHSEmmcza1nk0jtapxP+vHWdXYKekz7gtlIxAUAvWLasfVkk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d319f4a0-5e0f-49bb-3eb7-08db5be2be20
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 23:09:21.3256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5079LxiNtBHgKCx3ciEMXguruPcOI7izJS64zDybyHKSENoe9ultXgcp8ZEi0/jIzSdk3oBd9SyQ2QcD/gr/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6360
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_14,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230186
X-Proofpoint-ORIG-GUID: W-PGa88tooaeA2Te14IZRVs1fZj4KaR3
X-Proofpoint-GUID: W-PGa88tooaeA2Te14IZRVs1fZj4KaR3



> On May 23, 2023, at 3:34 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> Hi Chuck,
>=20
> I'm not exactly sure how I hit this but I'm sure I can't reproduce.
> But going backwards. I had the latest kernel built. I did a mount
> which failed. Then I updated ktls-utils and then, once built, started
> tlshd and that produced this stack. I tried various things that I
> thought might trigger it without success.
>=20
> Again I dont know how relevant this problem is since I'm not sure what
> actions led to it.

soft lockup suggests __fget_files_rcu() was spinning.
My guess is it found the fd but its reference count was
already zero?


> [ 1371.937602] watchdog: BUG: soft lockup - CPU#0 stuck for 1088s! [tlshd=
:3211]
>=20
> [ 1371.938083] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> dns_resolver nfs lockd grace fscache netfs isofs nft_fib_inet
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink qrtr
> vsock_loopback vmw_vsock_virtio_transport_common
> vmw_vsock_vmci_transport vsock sunrpc vfat fat vmw_vmci xfs libcrc32c
> nvme crct10dif_ce vmwgfx ghash_ce e1000e nvme_core sr_mod sha2_ce
> sha256_arm64 sha1_ce drm_ttm_helper ttm drm_kms_helper cdrom
> syscopyarea sg sysfillrect sysimgblt drm fuse
>=20
> [ 1371.940520] CPU: 0 PID: 3211 Comm: tlshd Kdump: loaded Tainted: G
>          L     6.3.0+ #3
> [ 1371.940921] Hardware name: VMware, Inc. VMware20,1/VBSA, BIOS
> VMW201.00V.20648489.BA64.2210180829 10/18/2022
> [ 1371.941354] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [ 1371.941661] pc : fget+0x7c/0x188
> [ 1371.941821] lr : fget+0x6c/0x188
> [ 1371.941964] sp : ffff80000e1e70e0
> [ 1371.942110] x29: ffff80000e1e70e0 x28: 0000000000000003 x27: 000000000=
0000002
> [ 1371.942420] x26: ffff00008b94ee50 x25: ffff00008b94ee20 x24: 000000000=
0000006
> [ 1371.942732] x23: ffff00008b94eda0 x22: ffff00008b94ed80 x21: 000000000=
0000006
> [ 1371.943048] x20: ffff00008b94eda8 x19: ffffffffffffffff x18: 000000000=
0000000
> [ 1371.943364] x17: 0000000000000000 x16: 0000000000000000 x15: 000000002=
1b74690
> [ 1371.943676] x14: 0000000000000000 x13: 0000000000000001 x12: ffff60001=
2a024f8
> [ 1371.943991] x11: 1fffe00012a024f7 x10: ffff600012a024f7 x9 : dfff80000=
0000000
> [ 1371.944307] x8 : ffff0000950127bf x7 : 00009fffed5fdb09 x6 : 000000000=
0000001
> [ 1371.944633] x5 : ffff0000950127b8 x4 : ffff600012a024f8 x3 : dfff80000=
0000000
> [ 1371.944972] x2 : 0000000000000007 x1 : ffff00008b94edb0 x0 : 000000000=
0000000
> [ 1371.945293] Call trace:
> [ 1371.945417]  fget+0x7c/0x188
> [ 1371.945553]  sockfd_lookup+0x1c/0xa8
> [ 1371.945721]  handshake_nl_done_doit+0xd4/0x3c0
> [ 1371.945916]  genl_family_rcv_msg_doit.isra.0+0x144/0x1d0
> [ 1371.946147]  genl_family_rcv_msg+0x284/0x2f8
> [ 1371.946329]  genl_rcv_msg+0x74/0xe0
> [ 1371.946479]  netlink_rcv_skb+0xd4/0x220
> [ 1371.946647]  genl_rcv+0x3c/0x58
> [ 1371.946784]  netlink_unicast+0x44c/0x4d0
> [ 1371.946951]  netlink_sendmsg+0x32c/0x630
> [ 1371.947120]  sock_sendmsg+0x90/0xf0
> [ 1371.947270]  ____sys_sendmsg+0x2e8/0x3f0
> [ 1371.947436]  ___sys_sendmsg+0xf0/0x158
> [ 1371.947600]  __sys_sendmsg+0xb4/0x128
> [ 1371.947762]  __arm64_sys_sendmsg+0x4c/0x68
> [ 1371.947934]  invoke_syscall.constprop.0+0xac/0x138
> [ 1371.948137]  el0_svc_common.constprop.0+0x198/0x1b8
> [ 1371.948344]  do_el0_svc+0x3c/0x68
> [ 1371.948486]  el0_svc+0x30/0xc8
> [ 1371.948618]  el0t_64_sync_handler+0xb4/0x130
> [ 1371.948799]  el0t_64_sync+0x17c/0x180
>=20

--
Chuck Lever


