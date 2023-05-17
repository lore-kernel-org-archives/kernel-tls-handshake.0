Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7762C10966
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:11:07 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HE52UV001772;
	Wed, 17 May 2023 18:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=7j0xr4SsPB1Wc5Tm5cIzlFb8uGXcBUs/JCJGQ5Jpdj8=;
 b=AnoT09uQzGc3gP8laupDmtrqhqwWtmRfsQdjZklmOPTgLWIOHjRhEQfm8eFcDNtX2o9A
 RntGxx2HZuUCIWC2LGNXOmz87spgbkjdM0CZnnmnfUNm1u433pPaLX5RsYL8kCHhToUS
 Qari+TwSqCjMXtutztDoAZnEQ7nvQTIC32XBAFn9bnqZbs8HcSxbtEFKe0ROv9Q7vxTS
 WJLgNSBrAi4SJ6KwJlIoCD9Vkc1+rTk6w5iZ7Au3REDcEQRN3mb2ukHZMCnBqnR3s3Q9
 PrcMS4DBTp5OHmTJbHQcMaYhHuF3B2GMDTkDHWU73WUuEiZ4VXuc2K1/R4oW1+McNgo8 HQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qj33ux6eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 18:11:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34HHHjni033918;
	Wed, 17 May 2023 18:11:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qj1068r8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 18:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDf3RTCS7CjuOhMMxdz0SPGmx3FqenODrQP6ZIm0QXataWgfHyCLa/yi/40UDI7EOw4gHLDkH6n0w8eT8cgMotVkzuj2rDuiFVPj3i+3IbQC8wxLObJEFQy+iYycWm9SjB8lc6LQle72V6/lbSPuqGRlsvC6fkTyR/2YQuAbNDfw2FP8dG2vd6NHM4esEsML9WTgU0axgt9BdnUK7/4yvBoClkggwWUEZMHB/nSdGIoWBxFEwm5CRuX/Lg0QZgecc4w8WfRhRajpFsrhSZ6Eiq8uSxt5TeYY5SG71rCP/ZiTdJKmRDPcKvxmgOJX/lR0Cy/hCOXL52nDjZWnbkt6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j0xr4SsPB1Wc5Tm5cIzlFb8uGXcBUs/JCJGQ5Jpdj8=;
 b=RoUKunb5bkaomtLORJRyGxtSRXfFDjP+mkq4E8jDrvtn25tWSyWXDaS66nSC9/uVOq8Luhz81+trDcgiGapFoCifj1Adhfyzg1jt10sHmPJ+WuWTDjK0FHZrsyHNRMhx8EhnAHsoQRyGCrbhXUsXvBEw7zuwE77gful269HEJiT/ZHA/iQPYwVN2CFRAY1UMbbaF5GqaSKHeH5qNDD4ykw8oIS7oZrFLQFbAJwURjzZQ1IH1Oo7nHaMeyuRMoLQQqiDJisxGh1r+0ns9iNANvC+yrYNINRZz87p1xwGuo2ti0hwrda5VtYsdQkQJXMJjYhbOvAldFV4T4Nxo0v+TSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j0xr4SsPB1Wc5Tm5cIzlFb8uGXcBUs/JCJGQ5Jpdj8=;
 b=PVEp7lijeOGw8msnQfpEmhD18Tuls8gIGu7nbaYRtC+dxAVP3llBefVN647+FRIWeoLhBeBO9Dx+lXQKtaeOPYWpri11uZ7i1lx1SFRI0jrnKM/IbFTTCGYAFgmoSTbTJnqWkZU1cmttWXk3QcZVgDI6qMVFpLcMGd1p43I1Ajo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 18:10:57 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:10:57 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <olga.kornievskaia@gmail.com>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [RFC PATCH] ktls-utils: Add minor error checking of gnutls
 functions
Thread-Topic: [RFC PATCH] ktls-utils: Add minor error checking of gnutls
 functions
Thread-Index: AQHZiNq5ZL/cLv4pBk+XLYXq+s2bJa9exBgA
Date: Wed, 17 May 2023 18:10:57 +0000
Message-ID: <D032DEDF-98DE-40D2-88F9-A50E6A776895@oracle.com>
References: <20230517161446.35825-1-olga.kornievskaia@gmail.com>
In-Reply-To: <20230517161446.35825-1-olga.kornievskaia@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4734:EE_
x-ms-office365-filtering-correlation-id: 3709eac4-5e8a-4593-c8e5-08db57020fdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fuf5aHyz8R9kZj7HLN8MSXddp6KZYAqzDb9a6jidDBx8PyjLgnc/+U8lRBW/zRdui5wvyzDuZnPCuLD8+Crp3X+V6cA1Bl9BO5xSU+d4gBbkFMh3EWT5e57VrQtyAOQJ1uB0+BZvyBoZszqUTYhgjMJp6/HuDZuHEQXtpI3FwSdKJPF0yYIEZHN+l9nwyp5vUpAOQpedbHlPTsLxkpPmFxerqdTH2Ig6g/POOHJ2YmxdQCG2iGWJZPS82vc3nPvbb9BVNRPYcHOFxX3JBbJ5tOYbF6fVJV8iYWrKJ5xgwU0r4c4DqoRYpiCi3si+6kMpzchMxvoWY5w89rQBCi0pOQiIDOFn4uYTOqgD7cMS7k668pniMeYKwSxN6Vt/O5/fPoHvKy3Ol3cgo2yOad0NgC1ORpzHe4b28dWlUmbUKwvcuGh6AJ1Vnj01kBBFSrP/rtv3betXEy0sjStIw+cANVt3kELPmCED2ADDet9mR4JjjYC5lpjxqQBy2Y94KLDejd8ecoYSH4KDcfRlRPusfboKhJEalKkHwqnFbweccoFOT2nJN7VQbTgIYcs3Ze5NxP+SOX7sO+DfimAgw9jCwNuuwyks9Uazib2XFgR7sILhzwJ4J/HIzDTQVZxErACTLGq8HTEs3+PMBeD8XYGTKg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(6916009)(316002)(66946007)(66556008)(66446008)(64756008)(4326008)(66476007)(76116006)(478600001)(91956017)(33656002)(36756003)(38070700005)(86362001)(83380400001)(6506007)(6512007)(26005)(53546011)(71200400001)(186003)(2616005)(5660300002)(41300700001)(6486002)(8676002)(8936002)(2906002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eyF8Ma0xA1V9ePVSh7TtDApzla2/ToIYd1scp0Scvp98Fo1tssJjqtUYeSjL?=
 =?us-ascii?Q?xeSXJLiSGVR5SDW+AVb20AxILacmF7eVF74tkzEPdXeQXIIzIFavMYiD+cks?=
 =?us-ascii?Q?lDDTxhsCCceapPa1WG9bH5xss5MS0TwrK5oMutibEx2OLVZ+Wg1Z2yOl0DfP?=
 =?us-ascii?Q?++BS5I2QJUYp+7CE45kAL8uKxynfleDlFe9pXm+/b+1Sk3tAE2FLVtx4aSU9?=
 =?us-ascii?Q?Xffwo4x4zOZF67IU6j/hdbOWsj6/icCuK7eeoUHTMXdFetIah7uKghZveQJU?=
 =?us-ascii?Q?ViGDzF+MEPypk/xrb0buGhLsYBZuXKjSgHHIMMkf2mIHpgNbMSVVBwPtbzk7?=
 =?us-ascii?Q?6OCHOYbyHgxfcUElvRgUkUH0scEFSCKeIZ63bcR16P0V1otqtY40kegG2Ev3?=
 =?us-ascii?Q?B6Uj+PMLqt9pN3qdd0pUFnx/qKwDcFFLGTGKS237PG2wAEJTwKAUdPD9hFZt?=
 =?us-ascii?Q?5gRwONGAT9/mKU6awfFMegNRMgj1d754NW8LZyYSRvIlctkRngMiQUFDoKJE?=
 =?us-ascii?Q?tqf/X1akESANbfI6UJ8NcVwjuP/Ns00UEyhAUhJZwIgVBXgYSk2v0SXHPB5f?=
 =?us-ascii?Q?e9U67XCNeH3pw6TiJVAB+REBbze8EpZAkJUwXdUs5SX75jOpIQWo2+VRn70J?=
 =?us-ascii?Q?EY6cfXOAYlpEWYh2vmSegdgWyudadx4sMELrpdi6D3VQ5R2cACzxFnRtNiGb?=
 =?us-ascii?Q?dPlxlRunMqZVwL7LgrSQljXR+RrAyaHfeRE/WpG0jdH6fSOhFEQszUbXExvy?=
 =?us-ascii?Q?jwj736UdZh5BGEtcuy0Eoz9Qok8sGvR01iuQ3iBPqzaRkLrOpEYOE1UJlBjy?=
 =?us-ascii?Q?d+gCYYbPKAZb2X2gHngs3aHKua6jLC9RaQFrfzc4/xEEwTa6OfMYMSG+jr/q?=
 =?us-ascii?Q?bhbb8rJed1yzn3+55Sq/ZKLGBblK/6rxFz9eTDu/ifv/pV0+Wdp4Yztb0nPN?=
 =?us-ascii?Q?KYsbYoiM/8RVxI2kQGAkX0QxM1qbxVtfP8cJMSXsTBEoXQwGgQHdxquCx+8O?=
 =?us-ascii?Q?jF7V9Od8Jj7Rgmg9tKug9timWXgkWp+OutKxXKUUGdceKYtHez7ylx3VO2dz?=
 =?us-ascii?Q?ylQl0OtxYTj7ckJwyWAslzIJpqs5wBZe81hLzd6wNiDK/B2B5Vehp2Y761qj?=
 =?us-ascii?Q?+tC0IsOFMucpf5A9IOvYARd+eB6zipPWpS7ZZCAOgfjUsT/MS8weGLUVEdk+?=
 =?us-ascii?Q?U0eG9BdlE1Jet3V2tbYgMStd5xKKcTD9ieOEBndUD46spL8k22YPmGVzv9lT?=
 =?us-ascii?Q?FRFWU6FoMxNFuaLpP65MZK2PIF16kIKUYCXCpEK9jpWPhvyJJC9xCgLnf+LU?=
 =?us-ascii?Q?tOu4WRU5sT6c9qKbAeMdeYqh0Uq2nC6Z6RScgChg1TCFIrOp9XSTuREOGWkI?=
 =?us-ascii?Q?eE5WtGzMAyOwT04MPdR2dVJhVnQKAKxGmSNtk+gZ/M4sP5lQ01MRQFhHH04Y?=
 =?us-ascii?Q?ib2BKn7QawxPu4q+vWf+nBiJR2+ecZ1IsM7F5MwDypgTgf8gcTosRG9yXzbk?=
 =?us-ascii?Q?XF+KlFbeCr0u4NaomEGhdemMaatUjVmEEjv1jQciehvuFAXNFzW7QnDhlL2x?=
 =?us-ascii?Q?eZvdtpWnkS/kxpWYeIvjjg3henRFU5WeTV7sm5g/w9KOkseH7rS8+UIJAWai?=
 =?us-ascii?Q?Rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2DEFE2AD8B19894495266B79D9D316CB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yDdhCx5JrnnUCk+ioFeUFSVLbS2VqwLBtPogkaiUNx+fUZIntJkocyEGVbSN6WGhyTWuvfIb5z6CXuNRtTanWk9U+E0wv0im1Wt5L/21touu6ui6lV2I4sv8GH8vHk4Il+pgIrLCtmtvkFuyviMl4G+btXMMvF9QAYABo00v2zDzcYw0ePpYgDhYBpO4Ez8XypC1CtUVijjVL7iPTKPTfzUl5It44zqY2R5YDt8ripeBGiu6XQ7xKdsiGu9hBU/lGkdRXjYWWarvto/2ZVK8jOPGEfRkEPi0ZldVifc53uo1enNNGYSId0OWQvVT7hRoeaI31W6XZLv0vcnfFMvLQhEP3C3aD0+HNd+uv4bs7iDE2djjvtsx6lTjlRT5BIi4vMBsXnQ9CPvAembe9ew5g/zUCtFm2SJWub3OEBq/ZvMxyxF5ziRXjrGoO78ezVzjCsKzZUS+GG8AxTHA9CJkLwiQvI83mkSwolKbF7elQHiAJk31ccr7Sx/Jz4q49nhhj6acVb5TazvMqR2wnqaaKFwRF6unNQKeeILsfF6FIuHIIi8Kf/VaI6q9ml/58lca66Y+w6+ooiFUx5ri9ZqWlkn3Fai+/ax472nRQbQ4BTL0tHFwRwqFeS5YY6zQ/keZZm0V6wP0fRtBnkYAeMzOv6mSw3W3UoFQAQyE5ubqyg5U5YljOECpTdlpeHWiiM4iAObIdYcsAotHV9He0qUuOYl1TygmlgSJQ/0eR4m6Fk/yy1aSZ25vOhyQBtxuV8z3XLt+wuUY6TOgJe6B+aj84yQKt7rkIwBLYYLh/QvqDAE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3709eac4-5e8a-4593-c8e5-08db57020fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 18:10:57.0360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmLfKXHEIJUMVPnibYeXDjTtYaKmUfGbq3wJC8dVtDlnOvPyY0jXhT0x/LthqS4g8WGB5l9FSXxTg03w3VLDRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170149
X-Proofpoint-GUID: HC2YszMRfc6ukHhp05K3Q_d8Rv3FNe8g
X-Proofpoint-ORIG-GUID: HC2YszMRfc6ukHhp05K3Q_d8Rv3FNe8g

Review comments:

> On May 17, 2023, at 12:14 PM, Olga Kornievskaia <olga.kornievskaia@gmail.=
com> wrote:
>=20
> From: Olga Kornievskaia <kolga@netapp.com>
>=20
> Add error checking to non void gnutls functions and log if we failed.

It would be better if there were a few sentences that
explained why this change is needed. For example, what
errors are missed by the current code? Why should
verification fail in these additional cases?


> Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
> ---
> src/tlshd/client.c | 20 +++++++++++++++++---
> 1 file changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> index 6a16263..5fcacfa 100644
> --- a/src/tlshd/client.c
> +++ b/src/tlshd/client.c
> @@ -233,7 +233,13 @@ static int tlshd_client_x509_verify_function(gnutls_=
session_t session)
> gnutls_x509_crt_t cert;
>=20
> gnutls_x509_crt_init(&cert);
> - gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
> + ret =3D gnutls_x509_crt_import(cert, &peercerts[i],
> +     GNUTLS_X509_FMT_DER);
> + if (ret !=3D GNUTLS_E_SUCCESS) {
> + tlshd_log_gnutls_error(ret);

I am wondering here, and below, if a more actionable message
can be emitted. I can apply this as is, but we should review
all the error reporting to see where it can be improved.


> + gnutls_x509_crt_deinit(cert);
> + return GNUTLS_E_CERTIFICATE_ERROR;
> + }
> parms->remote_peerid[i] =3D
> tlshd_keyring_create_cert(cert, parms->peername);
> gnutls_x509_crt_deinit(cert);
> @@ -278,9 +284,17 @@ static void tlshd_client_x509_handshake(struct tlshd=
_handshake_parms *parms)
> gnutls_transport_set_int(session, parms->sockfd);
> gnutls_session_set_ptr(session, parms);
>=20
> - gnutls_server_name_set(session, GNUTLS_NAME_DNS,
> + ret =3D gnutls_server_name_set(session, GNUTLS_NAME_DNS,
>       parms->peername, strlen(parms->peername));
> - gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
> + if (ret !=3D GNUTLS_E_SUCCESS) {
> + tlshd_log_gnutls_error(ret);
> + goto out_free_creds;
> + }
> + ret =3D gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
> + if (ret !=3D GNUTLS_E_SUCCESS) {
> + tlshd_log_gnutls_error(ret);
> + goto out_free_creds;
> + }
> gnutls_certificate_set_verify_function(xcred,
>       tlshd_client_x509_verify_function);
>=20
> --=20
> 2.39.1
>=20
>=20

--
Chuck Lever


