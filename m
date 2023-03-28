Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4804F79C5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 13:29:58 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SDPjWi021465;
	Tue, 28 Mar 2023 13:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vJSg0E5eAR5e5YEV4/7ZiieGPpMIDU4PHON+gMVOVfA=;
 b=dgE3y0ZOS32Kk8gyTasFEtNTzSWIA7Iqtr8agConE/YQe8DbATEaILKlBCLkN/JYeo5S
 A3q1e62Kb9eWPxGI0Qb5KRoeI87mEDJZaxq++IWyYt/a9i9Fgw5Zo67opf3ehG91fdER
 cIN19IC9D716NTBMJ7kJMWz4G1gFdbP7psGYMb23HxdhcggD08zB8K/inFHecb6IwXdF
 fmFQA3jo1RdSxQ5OxqLrWv/AbzjFVpbaaSwUSvuip4N2j47u9LBbTqkxqrBZsL6IpGvp
 XnzTD9nbPT1pILDVpDHsKzkn75NHp5w2vVGLPE3h5JPWG93ZuHIvUF96BNekVyG3SV4J oA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm13q80gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 13:29:55 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SDJHbX027209;
	Tue, 28 Mar 2023 13:29:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd6d7kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 13:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgXAwwJJbCw3bfH716Pcv4xE3zAg6BpMfduaqzz7IWgAiBZdihQ0o23iibVMYC9gpDcNBf2rcI9CPhsqEJm4H1cP50tT/0dHOWT0wv+kjc579RiI+pE92a/7oy4PsT9t+kPgIzEFHn0vR/jHIEwuHDHHJlMeYqv/hrYf5D/LGmgyqVDXw1hliwoHhZNyoO35XUh7oBAhUpSsDAqnMnnvBCgJY2Eb4Abc/jdVQwN/OuY15EfPvpDciDd2GhcFHtG2COO3MS2w3On642czziMqUcBupZlzHEGewhNVlUrNL5NyjRxGcmZu7So3L4tVCj/xZrgNsFTKlOZz15af0lXj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJSg0E5eAR5e5YEV4/7ZiieGPpMIDU4PHON+gMVOVfA=;
 b=NvgoM0SXnq6PswehiqJbqkDMx7DmfWnjq+jKOMIEVXHPVVxDgt4szaMYvZdj0JkXBfh/boygrNtQJwPq1etF173RxwAXKHFZ/4fC0Y0KSy9WJYg3RCJoiKjWaLZukqMNXXC7obRAqX1Vb10uzO9ZRLisdcJGTfAc8WC6O0Unzpw5rj45ArV5txueq1BBg+INVnpBaST0zFdtO1lrQQU2TaSLtzts2LW9Qs6z0aTQUedUsq9mTqWovV3QbhE1dUtLITKEWTWZXxVGdjULDg/5Hokbvd6HkH4cxAGzq+IoIlmeh2Yt4FKXXHMtu8WDoh9SylYHf2XbSBC6AAoL5aMFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJSg0E5eAR5e5YEV4/7ZiieGPpMIDU4PHON+gMVOVfA=;
 b=SV13gJlNHgZAGZyEoQZHCh+nt6w4Afc3DPPosHtA65cC+C8MznDNQJD97TYYbfruAF0n3plmDXklbAHahOdKPxv/+5YIfkuJ1bJeLsTGLlmOJhmJLS2sA3WOwr4xmmKEH5TfIlntnE00Kd2CWJFxFiX1hxlw7E5I0wgmjsK/H3M=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6035.namprd10.prod.outlook.com (2603:10b6:510:1fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Tue, 28 Mar
 2023 13:29:51 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 13:29:51 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QL9wA
Date: Tue, 28 Mar 2023 13:29:51 +0000
Message-ID: <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
In-Reply-To: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6035:EE_
x-ms-office365-filtering-correlation-id: e5818be6-b288-4da2-c05d-08db2f9082cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ltdne9Cdr7Dr7UpSp3iPjR8U5qf4R/QaQjMSOap3lUkfAf5KKWN0eZYAqB3C4OwcKB693isnrfwFdcdXWTVFzkxtfepcVnXhsxKUKOzREBYTcgH6xlPJQX8JJz6+0qXk/lAXWG+N6gCGXNkNyfPCFrpm69HVK5YniIsWYaQrAtgkl2a/BkEHp+tJ/MR2sqC4CPXYHuRUAnivoeeYrC8ikR/a30AZxrLUkNkGjimVhNtjxgkmZCbTyeMe9UyDhwmUUcyfxhjhK/IX1ZtSwZxPb0jkfwCQlRl8i026iqRa6Ne6kIIyKLX9nA4nM/G9mdh2EkQDjdJFbpOUIz3EAhAPAsslKWH2rb8Q6sIqAQXP0DFSqIBa2mh2iprk1g/sdWLwhjWC+nzhlN61NHoH/SUnGX78kB/OgpRcuUXjJeVPGK5H5gbw2zBQvUJqxrHAsONzYLwAzpUn8ydEuUQ1oE/HvCeZZNefKqoxO5MH2j/M8XlKsN2PHcTE2cyz77vxbwmuAtKNUsCql8uOcOxI7kNgdNdybitIbUkwwQ4rtI2KvfisuYXlZctJH+E/EUONB0q+Tq78xpt9vDbVzcNAUPwwsBkjkg/Tx8Sr4ggvL8h/+5xCXFZSHhAAOwbxKUnozeeJp384WGweA5zbxaBPGKfo7w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199021)(76116006)(66446008)(64756008)(8676002)(186003)(66556008)(6916009)(41300700001)(66946007)(33656002)(86362001)(38100700002)(91956017)(38070700005)(6506007)(36756003)(66476007)(122000001)(6486002)(2616005)(83380400001)(8936002)(26005)(45080400002)(316002)(5660300002)(53546011)(6512007)(966005)(4326008)(71200400001)(478600001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?i9XBEP+mW1eH4GHQAs+gRWsjrj62cRMqgce3QckLYLcts4jtSjXcper0n9qu?=
 =?us-ascii?Q?f4AUfXVtei/ftwDFu2JnY7vFFQ+xMRKgP+MlV8RkPXhGlGqKZZrBWIrkVtzy?=
 =?us-ascii?Q?yPksKy0Uis0Oh+0NRXhP2y3hQl0z2s5B0Bzv4PAzN/0K8V2dgPN5KuY7Pvim?=
 =?us-ascii?Q?JlvXNPKU/Noqu0PZKfoBJxJSEHFGUgW1YTyyNfbs7kLLS5APrZIS3VwE2HmB?=
 =?us-ascii?Q?mX+Fi13NssUbZ/T/sZw6+SOLcgcRyuVI0RqO/J5Z6qbPxjLOpi/7YnlD2JaM?=
 =?us-ascii?Q?RC5EE+FCMWx9J3QAAvRn7ZnOujKMsWJgy/I8fx+bV/Mkvkpqcpw7cTmLxgAb?=
 =?us-ascii?Q?+2pMhRC8vThRo6N/PGuy10EnMuyeYDvxnV6kM4vtCr2t6SeDvmOm0q8mKrGX?=
 =?us-ascii?Q?bJAWBxwjbKtZZo8p/T4kWhmLbyzN4jyJODt07tOzjkQR83Gu1bUUmJauY7Un?=
 =?us-ascii?Q?xXbTr/U66srq20BSl+6rCos5pTInoDuOKsXXQL8/A9EpiOtOYJG0KVL01ZRa?=
 =?us-ascii?Q?JcQcAKoo3vPKYjvxnze6gmkFXO1/MsrLQnW56tHUI2ExGtul8BdLTcXW7RD9?=
 =?us-ascii?Q?2+9Twq5h0u/DXl0HQWhf6KObOrh+IwmUTYYb8f6cOk4OwfQoBUwSz7vsh0Be?=
 =?us-ascii?Q?o6UI9lq/lzz7G/kbAenEFcXvhLFGv4vtYTmXSJH73x4L08gmg1OiEOIyTE0y?=
 =?us-ascii?Q?lDNfefsD7EN4yHg3onaYDFfBE+Miui+qY2Tsd/pOAY8pW+uOKnSjAolhGdJ2?=
 =?us-ascii?Q?hYknrZWGkL4cS8Uh9zU9d4DnIVCkPqKbI5104fi+W6lkAsrhoWb6iPFG0o2h?=
 =?us-ascii?Q?vhTIDwzPH1Xh2VTeXnRB1kXYQqQLNH0KDyeFW8D/LSUvEU00cDxdefKnbIV8?=
 =?us-ascii?Q?RpgX6kTHcUqlKRTDSLJ8eg9ie43F3iN6fb1hAfk6qh5/THfsoQuvJavtGMEV?=
 =?us-ascii?Q?6Ei4+izVMgbqOgKidRvH5BBMuhEmLZlayMLsFb3BCUCZRuqukNeH/rZsD1hd?=
 =?us-ascii?Q?Mm9Du7Wy9kgecWhsUvs1dfetXQZkg4tcGnqJWTKtBCxCJmMPq53LI44bmmDF?=
 =?us-ascii?Q?/gIvZbGqcHu/sOCKtjKH2RyBSeuuFr9a7YyK+IN50KtZw8c9k1H/iYBIuY0O?=
 =?us-ascii?Q?UtvHF6wnOPK7Aac59VuKObdTTyx7rhoZagV3fCsQi/N31ldt/erWBK4MNAMB?=
 =?us-ascii?Q?UrWR9LvxrO71f6L2c/JGEYCtbaljPCoQlTML27TnUeGdWbKj09v9IKvJWIVW?=
 =?us-ascii?Q?eHHfnodkSYf5+Vwz2JicpTrnWcXBRMr7TuAKy7RVlPvlPn15TKTNcMKnTpmX?=
 =?us-ascii?Q?0i/8G62lnZatB0a2XGdxLQEJhpXNh+U9tgS3VWyUTwnJ63MaWD5omcw/+N83?=
 =?us-ascii?Q?Nt3kzZF2MV3D+6Ey6FvLKlpsv7PG704OzrYzHeP1s5K5jWux1hSJX38gpyYd?=
 =?us-ascii?Q?bT/mnnmmks2N47MP1mDxQrHdk2RVaMeOLYSYlJPmnbPdpwo79geFL4+uEBjB?=
 =?us-ascii?Q?pyQi1/rGe/y9B6XbmZYunU4qjQNQPCsAJbbbCVsaRNwUtyDKVp+FA3QSm67R?=
 =?us-ascii?Q?wCd/qn/kBB5GS8SOeGLoNY7gNrNJ65YYUzxBo8kIC6inVCZDQnWirE8fFLe5?=
 =?us-ascii?Q?8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC67FB5F0EA8084DB9AD47B01F5CD06E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uTMnQvQB1PJpiwQyzChUCtuzUXpyj0AUJd6YfdlEdsnrWDXdJ8lWEyQUp5f4VwGR4oSv4lEk9nlJJR36H1ixuCveA2kmfZEqYHsEs3wj+Dz/lt++SDcwXH1Znzk/0ts/lhIxU9g2RZYm0EGTJji0f1sONqpi78Yt4u2XlrJ8Xs3RgPxEeTuWnwY/Kqzv8cqNoppUCkIS4Kv9ACcG7M0KVozXNCDU8YCbLPVXTEBJAX2qaetPuaXleVsjRdlodR7fy5FykkMnJAkt7grpl+XH3KR1L9gLbYgWNc/oDD6TNPU8laPmiqR1Nj0m97LZ1rKSuiItb7M+C6UHaoEVcyySAjeFN2ETP8KkdhcNdbv/KOThEw0bZebAM1/J36i/FqnYNTTch9DOYPgG1AaUgqS4P5ex7EE/05qn4xaRpJvn5EqtiIAqxnSagocMcioJXtT0Wn46R+hLmc5F4p6d6Tu69PvcgkRhJUzoRAkm5prj0Z6OqSDgPb65sr1CT978SPHPAZwMjJe6gq4TmIgVYRWCrvk7rkxp2woVuDrWe7PVqOhSIz5SxLIxWWmvmZw+XoQELf6DxIlvQ6tkWjcWRigow/DEBDBjQx240KyfCYSbHKAdz7EPBwtd8R0zlnLOP7Ot2NFLD59+NrE7FUfE+aUSXBP7Vv/WzRUQwMfxB2JDtVqt8S8TOtVcAULEP4n4OmV1IeqcgiPDaN8ReMD4cKLQ7RYcqFbA+fa760T65k4hpom/HirN+Lc7LNuHJLbDBNE/ohp6YdrLwyi+HO1Dls8cIcv+/qOa8L0B4PnspWK4qS0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5818be6-b288-4da2-c05d-08db2f9082cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 13:29:51.9206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsJeDvo8bMXwChJQsJcl/WmDYX+62vQij9722vhsMe1JCqPQsls3Si0GzTKco5nyozwf2bi0ya+dxgPba32nrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6035
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280107
X-Proofpoint-ORIG-GUID: ZXMxx1CCBlcB_OXmTSTjqpXb18ttVWeE
X-Proofpoint-GUID: ZXMxx1CCBlcB_OXmTSTjqpXb18ttVWeE



> On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> Hi Chuck!
>=20
> I have started the packaging work for Fedora for ktls-utils:
>=20
>    https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
>=20
> I also built packages for this in copr:
>=20
>    https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
>=20
> ...and built some interim nfs-utils packages with the requisite exportfs
> patches:
>=20
>    https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/

Note that the nfs-utils changes aren't necessary to support
the kernel server in "opportunistic" mode -- the server will
use RPC-with-TLS if a client requests it, but otherwise does
not restrict access.

Client side also has no nfs-utils requirements at this time,
since the new mount options are handled by the kernel.


> I built a kernel from your topic-rpc-with-tls-upcall branch and
> installed the kernel on a client and server, along with ktls-utils and
> the updated nfs-utils on the server. I set up tlshd to run at boot on
> both hosts. The server exports with a bog-standard set of options:
>=20
>    /export		*(rw,insecure,no_root_squash)
>=20
> I then tried to mount it with tls:
>=20
>    $ sudo mount knfsd:/export /mnt/knfsd -o xprtsec=3Dtls
>=20
> I see the initial NULL requests go out, and then I see the client send
> an encrypted frame to the server, and the server just shuts down the
> socket at that point (FIN, ACK).
>=20
> I assume that I must have something configured wrong. What am I missing?

The starting move is to crank up the debug settings in /etc/tlshd.conf...


> Eventually, after a couple of failed mount attempts, I also hit this on
> the client:
>=20
> [  375.561304] BUG: kernel NULL pointer dereference, address:
> 0000000000000030
> [  375.564637] #PF: supervisor read access in kernel mode
> [  375.566439] #PF: error_code(0x0000) - not-present page
> [  375.567930] PGD 0 P4D 0=20
> [  375.568733] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  375.569993] CPU: 2 PID: 9 Comm: kworker/u16:0 Tainted: G            E
> 6.3.0-rc2+ #151
> [  375.572214] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.1-2.fc37 04/01/2014
> [  375.574538] Workqueue: xprtiod xs_tls_connect [sunrpc]
> [  375.576087] RIP: 0010:handshake_req_cancel+0x12/0x1c0
> [  375.578255] Code: d0 5b ff eb 92 0f 1f 00 90 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 0f 1f 44 00 00 41 55 41 54 55 53 48 8b 6f 18 48 89
> ef <4c> 8b 6d 30 e8 35 fe ff ff 48 85 c0 0f 84 3e 01 00 00 4c 89 ef 48
> [  375.583180] RSP: 0018:ffffb87540053d28 EFLAGS: 00010246
> [  375.585416] RAX: 0000000000000000 RBX: ffff970289cb4800 RCX:
> 0000000000000000
> [  375.588226] RDX: 0000000000000001 RSI: ffffb87540053d00 RDI:
> 0000000000000000
> [  375.590389] RBP: 0000000000000000 R08: ffff970280e544a8 R09:
> 0000000000000001
> [  375.592601] R10: 0000000000000002 R11: 0000000000000001 R12:
> ffff970288985480
> [  375.594885] R13: 0000000000000000 R14: 0000000004208160 R15:
> ffff970289cb4800
> [  375.597051] FS:  0000000000000000(0000) GS:ffff9703f7c80000(0000)
> knlGS:0000000000000000
> [  375.599810] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  375.601625] CR2: 0000000000000030 CR3: 000000010aa04000 CR4:
> 00000000003506e0
> [  375.603785] Call Trace:
> [  375.604754]  <TASK>
> [  375.605651]  xs_tls_handshake_sync+0x14f/0x170 [sunrpc]
> [  375.608998]  ? __pfx_xs_tls_handshake_done+0x10/0x10 [sunrpc]
> [  375.610900]  xs_tls_connect+0x14a/0x5f0 [sunrpc]
> [  375.612530]  process_one_work+0x1c8/0x3c0
> [  375.613907]  worker_thread+0x4d/0x380
> [  375.615189]  ? __pfx_worker_thread+0x10/0x10
> [  375.616631]  kthread+0xe9/0x110
> [  375.617788]  ? __pfx_kthread+0x10/0x10
> [  375.619091]  ret_from_fork+0x2c/0x50
> [  375.620347]  </TASK>
> [  375.621242] Modules linked in: rpcsec_gss_krb5(E) auth_rpcgss(E)
> nfsv4(E) dns_resolver(E) nfs(E) lockd(E) grace(E) sunrpc(E) ext4(E)
> crc16(E) mbcache(E) jbd2(E) snd_hda_codec_generic(E) snd_hda_intel(E)
> snd_intel_dspcfg(E) snd_hda_codec(E) snd_hwdep(E) snd_hda_core(E)
> snd_pcm(E) kvm_amd(E) snd_timer(E) kvm(E) psmouse(E) snd(E) evdev(E)
> irqbypass(E) virtio_balloon(E) soundcore(E) pcspkr(E) button(E) loop(E)
> drm(E) configfs(E) zram(E) zsmalloc(E) xfs(E) libcrc32c(E)
> crc32c_generic(E) crct10dif_pclmul(E) crc32_pclmul(E) crc32c_intel(E)
> ghash_clmulni_intel(E) sha512_ssse3(E) sha512_generic(E) virtio_net(E)
> virtio_blk(E) net_failover(E) failover(E) virtio_console(E)
> aesni_intel(E) serio_raw(E) crypto_simd(E) cryptd(E) virtio_pci(E)
> virtio(E) virtio_pci_legacy_dev(E) virtio_pci_modern_dev(E)
> virtio_ring(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E)
> dm_multipath(E) dm_mod(E) scsi_mod(E) scsi_common(E) autofs4(E)
> [  375.646698] CR2: 0000000000000030
> [  375.647894] ---[ end trace 0000000000000000 ]---
> [  375.649403] RIP: 0010:handshake_req_cancel+0x12/0x1c0
> [  375.651062] Code: d0 5b ff eb 92 0f 1f 00 90 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 0f 1f 44 00 00 41 55 41 54 55 53 48 8b 6f 18 48 89
> ef <4c> 8b 6d 30 e8 35 fe ff ff 48 85 c0 0f 84 3e 01 00 00 4c 89 ef 48
> [  375.654664] RSP: 0018:ffffb87540053d28 EFLAGS: 00010246
> [  375.655447] RAX: 0000000000000000 RBX: ffff970289cb4800 RCX:
> 0000000000000000
> [  375.656436] RDX: 0000000000000001 RSI: ffffb87540053d00 RDI:
> 0000000000000000
> [  375.657425] RBP: 0000000000000000 R08: ffff970280e544a8 R09:
> 0000000000000001
> [  375.658392] R10: 0000000000000002 R11: 0000000000000001 R12:
> ffff970288985480
> [  375.659360] R13: 0000000000000000 R14: 0000000004208160 R15:
> ffff970289cb4800
> [  375.660324] FS:  0000000000000000(0000) GS:ffff9703f7c80000(0000)
> knlGS:0000000000000000
> [  375.661479] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  375.662285] CR2: 0000000000000030 CR3: 000000010aa04000 CR4:
> 00000000003506e0
> [  375.663278] note: kworker/u16:0[9] exited with irqs disabled
>=20
>=20
> ...faddr2line says:
>=20
> [jlayton@tleilax linux]$ ./scripts/faddr2line --list vmlinux
> handshake_req_cancel+0x12/0x1c0
> handshake_req_cancel+0x12/0x1c0:
>=20
> read_pnet at include/net/net_namespace.h:383
> 378 	}
> 379 =09
> 380 	static inline struct net *read_pnet(const possible_net_t *pnet)
> 381 	{
> 382 	#ifdef CONFIG_NET_NS
>> 383<		return pnet->net;
> 384 	#else
> 385 		return &init_net;
> 386 	#endif
> 387 	}
> 388 =09
>=20
> (inlined by) sock_net at include/net/sock.h:649
> 644 		__rcu_assign_sk_user_data_with_flags(sk, ptr, 0)
> 645 =09
> 646 	static inline
> 647 	struct net *sock_net(const struct sock *sk)
> 648 	{
>> 649<		return read_pnet(&sk->sk_net);
> 650 	}
> 651 =09
> 652 	static inline
> 653 	void sock_net_set(struct sock *sk, struct net *net)
> 654 	{
>=20
> (inlined by) handshake_req_cancel at net/handshake/request.c:281
> 276 		struct handshake_net *hn;
> 277 		struct sock *sk;
> 278 		struct net *net;
> 279 =09
> 280 		sk =3D sock->sk;
>> 281<		net =3D sock_net(sk);
> 282 		req =3D handshake_req_hash_lookup(sk);
> 283 		if (!req) {
> 284 			trace_handshake_cancel_none(net, req, sk);
> 285 			return true;
> 286 		}
>=20
>=20
> I'm guessing sk was NULL in handshake_req_cancel?

Jakub asked me to remove the NULL check there. But I think
req_cancel needs to handle this case, which might happen
due to a race.


--
Chuck Lever


