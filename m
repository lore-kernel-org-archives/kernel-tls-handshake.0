Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43898468
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:04:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SE4JvK010945;
	Tue, 28 Mar 2023 14:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=sQsR9NXupMDtY/uGArVCxx8hHxl+QwZujCOnEGuGWZ4=;
 b=M9oh9bQP+FRW173Ht1Inx9Bg/1sIWWocGWfkrcf+xCbuHwdzWynJ5iRwPaennl/ZeJ0e
 rcefSD5hhJmqUBjjTLSVcIaEj4ad1LJli0ywT3bRMaY9ykxAbu6bS1zq5rV4FmFO/XpL
 t/HIpWZiqzaybARutzfRtPm/2LEew8TkFiVpp93AoaC9VJGGUV1NE4J9+LXRi/tj7KAo
 bgT/8fKo0a0W5mirr/rc+re4Ft+0TWXD4ehb8+OS90bssJhN7KnXkTRTNU2WedDqmiGy
 yejYXalezSCtCofVqyiErsvCarqei+nF93Fr9A5oSmig1rDOIkr+ik2soAefnmCfdfwT Wg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm1p6800x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:04:24 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SD3HRV026744;
	Tue, 28 Mar 2023 14:04:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdcyp3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU9uHawHBPf/fN5PK6XDYIksy/27AidTe6W9GnTyK1DsRJroy2UoCoDq/TXrXVXLhzkLNG4USiiGVnv5CKDi3JCd5ICyp6v0BpMzHKs68R24KtsF+Az+HK73a0O93RwuCEF5FK6GCBysR0WJHvQY995FQgwx4FhoiSraxWhRTjfBs/8WhcEwp6NpPIXh1XpP1Qfw1bo6Z0wnOer4Lu0+sr4/M/buDgSwCfmTfXGnDK4F/NQMsZ0vrazFBmtqq1ik4aUWW7OMLXKoKKU25Cu/aqep2jOjAM3niTOJQfKqY2JRcnPa9qNOYe18Y+JcNBANz00iXAPuXs60YrZkvTI/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQsR9NXupMDtY/uGArVCxx8hHxl+QwZujCOnEGuGWZ4=;
 b=fa6LnqAdHUTgaj9SPNGOImiXjg/iLB+xD3zIIOF7abYO+DVdoER0eBj6B8TbyCWA7vNiLWCQcLnu/Knm8PWn+wzSrDCnU8pavOZs27nLElRyJDppbQe9D67Cl00KU5LT5vWZkoqGHPLbdIQJmk/ye5kItBu4DWuZhLD681Wj0Z7cqRLXPFSijomhQAUfVvXfgjxkf1nYKeDImQ/rAdGWfx8N1S5AhiyxfqRvMtFWww3oFp2I5IcgoASTOPWPzzTI8O9dxDLW8YvtffSr32RGUbOuy8BvxMa9ENyZywAOtccWIffljBGw/134Rxr0i1jMY7mwrHzNubXksYqFAsL0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQsR9NXupMDtY/uGArVCxx8hHxl+QwZujCOnEGuGWZ4=;
 b=LS8B+z/tpBQlLo0zQyfB23N08i4xL0U4fk38smswYCF5VdG8eDAQnBcP2JLnnoEqg40XoRe3qgSzMCoHMH3sPTmfQdeGIdyniIiXe6IghYh1Zq0eQC4ryvU0PSu4H3ndxLVnYhJHkDk+a3mcGSnqMiPcyjHXXdLgO+Rs5Uh+dOk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB6724.namprd10.prod.outlook.com (2603:10b6:208:43e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Tue, 28 Mar
 2023 14:04:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 14:04:21 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QJjIAgAATTgA=
Date: Tue, 28 Mar 2023 14:04:21 +0000
Message-ID: <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
In-Reply-To: <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA0PR10MB6724:EE_
x-ms-office365-filtering-correlation-id: 7bc47887-8111-4e56-6276-08db2f955433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8pDw2h9rYP9yV27sBIfXU5WK1s0rtGlYlVnF+UD+mOSaUUbch3Y0SPinqROBEUPbjl6g3bAEjArzxc1xY01YWA5G0oKKtKTs/4fzP5F0BBEimxdHhf/2Z0dEbHucQN0d0CHH/ICeDW/H7TE0yjA08aGB7ucQeHaz7aGxkea7LstNRXlq7uIxwzqATa2qGrI6Rj5xUBcxt/X5mS7kTphByKmMp1amVjF16uDaVKEjrXUkAJZDGrtQghf6UngUb+UGHX1eP3dasj5zKfuma8ezErq0w6HP9/AsnQzRsgeR2PUNO8hfbcIP0Ra5C5o/xspJioX5IYFxfn5uSgtM9xNZiHhLLwJGNP2kh/Ygadp1hQegyrFfDicZcLUTeOs3EgB3cVDCJ8VTOR25beKpLFkKCVzYI2KQp4HVucW4JxbcujnsSnsifbwB52a29dDfemrjKYvrGMnvWh2I5DGtAbmBaTwHy2i5QqZuF5VwylyEG2h5THE7ZsCXjkOWNKpbwE94b3c1hFedJWB2eHo8NW81g6tNbEbd9cik/uAwxdrLtZqCZ1BzSO7UZEa9gFtESsOLNHtOXAet4GEdADlVhW5e8VkTxhvBPHpaKIb6L9oM35UUSOBD1ybk8vSG7Cq+Ypppd8yO4L85mw5UOMPYxf+9Xw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199021)(66899021)(6916009)(6486002)(5660300002)(478600001)(8936002)(186003)(38070700005)(316002)(2906002)(4744005)(26005)(38100700002)(6506007)(71200400001)(36756003)(66446008)(66946007)(6512007)(91956017)(33656002)(64756008)(66476007)(66556008)(4326008)(83380400001)(41300700001)(76116006)(122000001)(53546011)(8676002)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1eY1DO3RU8gODdnRwSRpG3oufbyCV8qq1osZpKqfiGgq7sIfEB7Hs29Dz6ks?=
 =?us-ascii?Q?bEYWquN7I5nutvnoxZgRf5tTYzj7PJ7iXkO87itUDAyLmGC9LvCxZ5inX0Mq?=
 =?us-ascii?Q?+k/gLSWbV7AAOkrqaCXhfiSzXVF4kbMPPgy7KKZQX68yR0jd0lZR58uJVUTv?=
 =?us-ascii?Q?AY0HfVNnsZpJ7M/xJZ6k1+9Py2Vd4jq8/C/90e/+CRuRsyI1AcAX8NrEFbXC?=
 =?us-ascii?Q?ELY61JI4aw/ts0HffEdYH/3iNjZ+Zca8X0Ibq5hUvBIfWpi7niRHIcCe0V/R?=
 =?us-ascii?Q?F1Wl6z6PhI5ogWQM0ckUltfI472Uu2ohCUqIKbfUFhj9SRSdeaf329lAnwBu?=
 =?us-ascii?Q?SmJo5CJIWMN+sHNMOOY7/AaTSUOxRHYbSeGTwHF2+0m9C+y6ZFP9kNI5lzKY?=
 =?us-ascii?Q?S2UjDFwtoGhHBYbzuWAOaGma87IUrcesdNmeitEgmlzga+hPSmJ/1rTDckwj?=
 =?us-ascii?Q?mdCeQ18whGKGXOBoqdknR+d59jc9FgjLRxxy+qEQpvVS7Zsy0YX6tfBN+mmf?=
 =?us-ascii?Q?0Rd409pzzZOrE4Ypz1CVXLsyGAsu9MIJzvLSRuFV1n+dWagIsk6QXhdIewxi?=
 =?us-ascii?Q?0bJrMiWMoGA5LZOXz8/xEqJGlqNorhUWAt7P5ZenLL3wJM3mpwrR9qTTYq3a?=
 =?us-ascii?Q?/UujXdlVEu7Bit3Lv9MYu2VbpjgVGTEVUDT4fGe56y7SIWRFYpOD+YZC9Q0j?=
 =?us-ascii?Q?CElKLlC/F0DbSGr9ti97Bjfwwo/HalI8HYVWa+3orwaxFCgk3w82ueyYPc1Y?=
 =?us-ascii?Q?QERvgaNBJt6se35HMtvMKOAQyH/SXAJBoe5L9r+i58ZlVR3Z1gx1pxOCsRuv?=
 =?us-ascii?Q?blnFMbETnoNFErh+l9FHp1FxgBl5PsY7ng+aa/RlycXSwghLqwzz/WlnaIS5?=
 =?us-ascii?Q?7v4rWVrcoSHNhL0v5Fa3GzXeYN1sEFZD2EuVifL+a5BCmnSOyk5a7DI9386q?=
 =?us-ascii?Q?aQM8vR53aMo5U6KwzCjM92JBBjW90pP9pdTKD6U8Fcy+mbSoQhtDbaoX3GhR?=
 =?us-ascii?Q?bPId6CoVDTGi/keYBaR/KybUU8PJTGNpJSuD9kTwMHbn/TC4GSeCGMnW5J40?=
 =?us-ascii?Q?x/UmFeeLplygSXVugH0wDwxq3OH7+JHOS6ESKCo+MfBON+A5vPiBqQhz7wpP?=
 =?us-ascii?Q?a9tWPbcEVjfUkOEF3tBVQOT6EY6gXoAOBM8HKrcJhSndwH8QVGiwahobT6rr?=
 =?us-ascii?Q?A8SUCa35gRhJEckjpAK4BgKhFL3UeplBdjE6uFVGeXw8azy0e3tpDGewcJ8D?=
 =?us-ascii?Q?c/oW9XqEUZcmr0s2Qs7ecj3uwoSzA6ZpQhu7BRrQ2RZF9GzyzSHhiHNrR8If?=
 =?us-ascii?Q?hGkpyf7Ui+A5U+rffcC7z+GBPqVRMsZ/XBmdS+J/lT0G9MjaN4txHZ01ZHFE?=
 =?us-ascii?Q?xfMluBliLO95avx99GOtCJpJ9UZMWa/64fymuJGXOxTD7qbyELzQW9qHGPCp?=
 =?us-ascii?Q?ON/Bh8qVyGw7Rsq+DjvWrw5aSvHU42UmI2v8TrIDaKPhNVYeArVfVLuUnRX1?=
 =?us-ascii?Q?1ehCNy324rkxUx1BfJ+CXOL5XkwdG1WzxGPXLSaQmWnxloS4kGpWiPUv8i4X?=
 =?us-ascii?Q?g9BBetvqgpircspJYpQdjuN5aVKy3eQ9HyBUqzmXrVB1gJHLQW55QaNKFnWZ?=
 =?us-ascii?Q?/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B6CDD74384AC2842B332D7278D3F5184@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2L6srZf4H2IVnolRgY824JeV8hQa7PqI36QGtjv5sXjm9nbDouvyEJo5wfxn0TxIlUgSVidI84Fp0sjTfiyziwvqH+1nw/h/8m33+kBHpIDi861BnC5fXve7fuWnRvUHN03Zygj2YFh0BLkOH1JY9G3H4yVamX1FPIpUyHfZFl7alAt9fYXQvVcdarTIJLwWAz76A+ZJ878sgbgfgT7fxSnzoF7xXUm9glGsDlOpSESuo1pEYKp7eQdu9KbNsgnRzB8fSSZCVN4OlYEUQhQ5trzE6qEESZUBH1+1pP0MxnTv78xIYku67NetTob5Xp0dYSLndwAEGe8fouPCfCpXMKwspbvGvzk809Z9YR2n9GrStsGdmzFvB+W4tFicC+ZC759HjuzX5x6jpmNVc6ZUMUTHEkO2OG5GxTcil4ZhtmvzzR8t8FSJGse64C1HUgbITN4AWgO7zL2qa+hgrlyuh4+P5gO/Pb2j4WroGhQ7+c2IRr0PoDc6+K0xFUbFkSBlCz+rYAum23gTTWH+G1GwfUGcZMfWzIoW7UAEP1tNk+ABBCgUZ3/nwVA3IOHSx06phE6YNwzHomtGraE+VlkzjrLRFEFr2FB+pLeN1a/OfvJFtkTSvl2H2uM1arT32ocZfzo0a0qeBUe6LvBMzO+dDQGh/gAaMAet8df6jd3LNMos1n3K+gnS2NjEVt7Sxw5lPSpTu8k4kvkjveB+0iIPR++4bOnRjvOCLYf8TRAzdceYx9YBgcyLWEMh4r54GvMmjsZKOwPM5AlD+cGx/7Amp4cMAUsQiJqwFWY+/87dLYs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc47887-8111-4e56-6276-08db2f955433
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 14:04:21.1744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhpXLeOluAjgSPgyS7a3msE+pVpOwCw1Y6X8Kz0JnKu13c0SYeF6OxlHntKay628S8DGSoGAFsqD7NLoYXvvFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6724
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280111
X-Proofpoint-ORIG-GUID: nI53tcNW7hULFifOU6vHf6w1S7kbDzUJ
X-Proofpoint-GUID: nI53tcNW7hULFifOU6vHf6w1S7kbDzUJ



> On Mar 28, 2023, at 8:55 AM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> I wonder...should we have the ktls-utils package install a self-signed ce=
rt by default?

So this idea is intriguing, I had some similar thoughts.

I'm not sure what the security implications of all this are.
We'd first need to look at other certificate-based packages
in Fedora to see if they offer a similar quick-setup. The
cert would have to be created at install time.


> I created a self-signed
> cert and tried to use it, but the client rejects it with this:
>=20
>    Mar 28 09:01:20 nfsclnt tlshd[1092]: Certificate signer not found.
>=20
> Is there a way to make it not try to validate the cert chain?

Olga also found that self-signed server certs are not
working as we'd like. tlshd had a mechanism to force the
clients not to check the signer, but it was removed
because it was deemed insecure.

I'd like to find a way to make self-signed work seamlessly.


--
Chuck Lever


