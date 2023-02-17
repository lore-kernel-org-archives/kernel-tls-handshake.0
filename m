Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CB5692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:59:13 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7iIJO009577;
	Fri, 17 Feb 2023 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=NCUhPfuRzF3LbtzbAWpNrFxk3WuAd+M0N7XKKUdL4sU=;
 b=ZQ9Kpn4Ml9RbhNhe/Weh5bbTMdb0awrR9V+o/8b8CtThhVwPqvbHKFQgKRAaSfky63nO
 ZvozWpqL7/91kYA6yn+vPvMPCwAQiafURKDBkjWysIIaYjZox55hA9qk1sPN8amsWRKM
 9sbJeXo3tfasrQm+eviolP2ly+hjUxWayyR6rIQdSyjSGsIYcXH97376+mPAmG20s56S
 eSQauzhC1uJcZuWvneCEr6Y2JKisH9A+1qGCyKoqyQGa6SEzA9mku6Kethy+1YVlBq+/
 KjaqG4d+MVZkUV0+eGTCK2k+SJLilA/Oq1PUdCRak1aC2JGKHX7J3dFZ6FRVlWB+1Hv4 Lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1xbdr5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:59:07 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31H9qImq013838;
	Fri, 17 Feb 2023 11:59:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f9qgxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO57NW9NNZ+t1aUx/RJfRbSX5vTX8MBQfPsCRKhj+IfLsHslEcRwKgy7LNfxOKtstB4kgzjtvmb716Kl61npAaRXAHJXseMB3dk+TFrMIKZVxBM/0De/oTsvy1LaHP3SGEPPgripy51a5s3beCU1R0L5CxnOkKLcuBnYQ0uh8SM/rLV7OM5ASMrbTKWVWGqsUgds1ReMUl0XcX38F0TGXM5IjJKcWnFCQ51Rem/hPGtJzRDZVfiCS6eAnmiLs1+kPJSkmNBgkJPWjJVMTbSm6JII4Zfsk3p4diUMODluKsqFJ5XGBw3Vb+GYNcDfvAUYsRg83WjruUj/vxpig82tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCUhPfuRzF3LbtzbAWpNrFxk3WuAd+M0N7XKKUdL4sU=;
 b=hYQjSmBez6Mf+yfXpH5qi3/n2qRLzxbCWgU90qoJDnL103U0fJETpvZPqyVyXc/qmbzRpt1OJDEN/ECRsnYPV/S4u41JPsz6VDvq/Rh0281LajZSgSXrkL5BNNXIuKbEGLrz1qH6lweXp+7n4mf5etMUWNUYHSVpcDt/zCz1wIDHKCO3uCK7d2+BFNMeoEyEt9WJai3eCPgMAVN4bhb9/RfAH/1QaiT6f/OaXpeW4bE+yrqQVIkGXA01akhHRpYHCQwXUEtAC4IIqALPK1AbM00IwS3ROQ/AfgngXH3KchD86MwGM+h2wVKK7YKt2q+LZoKhJvE0OLLGc9StJWjCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCUhPfuRzF3LbtzbAWpNrFxk3WuAd+M0N7XKKUdL4sU=;
 b=UvB4Pnl4q98HQlomm/6WqWzGZJazavZVxHu04B4S7eMj/it3YWZUt+lFrRAXF43USYVyFy11DZKFqD2rPJlPe6JfYa682JXwe8hbNKps7A0tmwvR1Fjmar+cheGCrbW79vmhs3K5fHR6OIKRnokzvnEcUcRzTAfMDtBZCs+YeKA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB4877.namprd10.prod.outlook.com (2603:10b6:5:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.13; Fri, 17 Feb
 2023 11:58:58 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 11:58:58 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Topic: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Index: AQHZQsNvcqwDi8CCoUGJ+FCjN2no0K7TCOcA
Date: Fri, 17 Feb 2023 11:58:58 +0000
Message-ID: <DAF4B451-D056-4309-BDA5-5C20D38A3121@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-2-hare@suse.de>
In-Reply-To: <20230217113145.18916-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB4877:EE_
x-ms-office365-filtering-correlation-id: b68dafff-3dcd-404f-fce6-08db10de5a49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KMmhQVIdcRCXitycaCBp10IfNKo9JLxa4vSxXDWZQIIfkJMlbtAU7Xj50qpFyxRVqkah1jQ0VQTeaJ+2ZB/Kbw4WTOC8i0Z3dHbyjwPIfWBeHrL4YXKcz+FKgy+r6fN0WgAqQjIRe5+TXRdZyeV8h8Sw9DofpaP1wlbdCvttGcXAcxZjLbq2/2uPeCF8/iPkvRHsGLlWnGbFI4CrUQgYr6H2wMiTPXiQEqUBLtoparJAwbTGqQeIlHge0yZKnlT9bYp1t29Xnr0Z3ccqrhmgOOv5kCR3Bd7Sp7vRgvP3iFWuyXHhuGijxBn5COlOUfjlgrQfB9EtG6AyKGd0HHHPc3QM9PYBthOfjUEwu7PI2JuKuVW6r+07ryEeIBVt20bYziL4ntZWYFU1pJleYBQxkCJ/YG+unbPQOqgxjYAEb65hfjKGTVscbGvy7GODFYMYKqPm3SiY7BTAMntlcQ+mth3ZRbO1qaSlCOwd1WdLd9T8AHscSuDngupptoumA08/+b994fQAzmzi4maIPAEleeOFOmcdLab4y1/jcuHP5+UJqQE/305hQ/nPf1Wza5NOXDF1NvcFoGzeudU5ouwl7fJ+wLer1M/FTfLOeBPXtZC+lkUBlHKyEFCLJ1fkKuUfcLiIjEU/eNJItKUoYEAlf8syAY7K5rHwjcX0jLPpHQRRrr4EBnQ8gG/JORf+9o3Ltif9hu7ZzQDVMalcROhKt0tAw/nQJobWv/edec+cz3U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(38070700005)(71200400001)(122000001)(2616005)(83380400001)(5660300002)(41300700001)(6486002)(66446008)(36756003)(64756008)(6916009)(66556008)(66946007)(66476007)(4326008)(8676002)(76116006)(86362001)(33656002)(91956017)(316002)(478600001)(8936002)(2906002)(38100700002)(26005)(186003)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iyocKvw4xk6ITgce6AkWL2aC+gbw29kD1ulAjvTB5+GLs7etQaXKZSYvkbZz?=
 =?us-ascii?Q?awMRC9KtZZ0AEO+FynSSbXckS3iydYSrtvY3g961ODHSmz9p9DcVJ5g82sYt?=
 =?us-ascii?Q?ERY3ZwmFulVC+I9F9bmGHbpIFehux9qOalE7riTyAr4a8TvZq9Q/5azFRqET?=
 =?us-ascii?Q?tLTpsqzTXuam5zCdLZ0Hc6f29XoBhlhnszC8jV1DOFfmqGZzfuKyoTvvzOlN?=
 =?us-ascii?Q?Yt0db4o81+xCh0uFeydR1yRhOC+SXbKruU8xxZZ/w0Q/YsAcq8I6AX1xUANN?=
 =?us-ascii?Q?Wm9usuhWebDxq+IIHt6odsrBhuteG8wsIv3F3oB5lvcS9KeXxOHqMU/l2vfo?=
 =?us-ascii?Q?srI+PfsjVY39WduxlbhumdWIz9iiSTsZQYOKJ5tE/ozDw7kd/hUEJaWYsGYl?=
 =?us-ascii?Q?M7K/jtNFGGXuo1S0UvCxh+XlSsA/E7r8owaXn3ju1jpDGfz4O7Ly+mZhivxZ?=
 =?us-ascii?Q?A+jDT6wijd9Kr3x71UsVeZC+iBGJURSeooEsdaMVkxJXAk2XUkBbJAPmpgG+?=
 =?us-ascii?Q?PrafYgV5sRyfdOepwfgKpzyxP3mpmQq+4tcMD2rN+i4mpZZX/Ov1Tr+bZt0y?=
 =?us-ascii?Q?41KqvA8JX2Gsaqsb43HFYdKQYGr6PrSNx+kKsbB2+lYFTPp3gFJnxMEhLZQu?=
 =?us-ascii?Q?EIaazBjgQImLDOu81/RfbKTSlorrMXp3HzKk1d0zTRP18fyDbZKxJ7QIy0UI?=
 =?us-ascii?Q?YrMWInr6knE87X5OrvCUrWpzM08j0Xh+fM+539IjrIwfOlgVRVeTYe5g2tq5?=
 =?us-ascii?Q?BtoslmRmi+AqD4B2wvU2qbPdmVZd7R5BxISK1kUz1T3gkXTMP0939SOoKIYR?=
 =?us-ascii?Q?JZqnPSo5RgAblPEU3Cb/ZrA4LiD26TmM/2DFQEoybQBh7ZiMQiGhoMV/6XKl?=
 =?us-ascii?Q?oQE+uKaUKD4relQy1DpYE5mu/EUNdrylxPXu/dbcTq1LFMPI9q3oGQsl0jvp?=
 =?us-ascii?Q?QFW011oPg4myh1ypv+y5j0WDq3pKNhFAyKFwXqW+FlWqZhqlYsbeR/5L2FCX?=
 =?us-ascii?Q?+oehN1O68Kp6DbTEFr7kfYCdsSg3Kmd7vH3Vky3RVyK6KstbEPYoyqBbPwAE?=
 =?us-ascii?Q?2nMy2uIBpbKiBBDLzZ+2/bMia8XCcQb0EU95Xr8scM+49oC3wZ1xlpmiZgpm?=
 =?us-ascii?Q?lSipNUWQXTZWLFw/6GxVUNqn1N5WACJVJJWJJdZHJWPaFQbM+pRxsMCn1YI6?=
 =?us-ascii?Q?yYWKUU8XEpCDvgpUKrWqUMRlk4+sHhwVPbrwRFSsoRgI+eyPxlo+C8OzS151?=
 =?us-ascii?Q?5sQ+1hbuf4LtCMoq8qTce1m+KIQ4pBTFZHhw83mD9Nc5+Bo36S4k70Cf2YZZ?=
 =?us-ascii?Q?3qYr1Nxy34dM5K6t37CrcMnXgsz9NyBFrWrFSElmTHbfqde0gMNLDsgMIW4T?=
 =?us-ascii?Q?vvthnzgTMd1ayjI69tn+H0vN5iovg1XpFVxtZvOU4UF89Rpe6+PEAlVSzLJZ?=
 =?us-ascii?Q?cGpu7+IBZbWfmxkQqTZiYuH0Ktnax5AME06Hgvc/nBNQWcOEV9gPkQHIX97z?=
 =?us-ascii?Q?uD4QOABaHgeJc0fU/ZMEHefWWNQI+HXy4C4YhF2texfuhbrvwIoHW7qYzmEv?=
 =?us-ascii?Q?J61911FyjHvzJnY9Nu8zUfARMon9yPPcZ1ZLRNwmIPvGoAJuFiAebUVKy97g?=
 =?us-ascii?Q?1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5612BEF58AE2474B85115284BBC0EBE5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RyGGi+cGkqfCdfwYQrZ7C/mJJ51lVSaiGFriDFCqWAetAXiN7Oa21x+Lb/tT6kb304WwZmKInwp03bpCfZInhfGUM8d2Uf3/9mZ6WwQgl+G0WlGREIdDYxeqdmEWOyF1hwVklDjrTDB3tnLEJCXC3XwIdEZeVnrNm9G7T8MtBmXRmOd/OBBYc4Foi6dbaz6fdzCkJjyfQd7emTj2SjH8fCx8QYx8pxihIU8TeHhd0DTAqmzoH+2APR4ASl3h1dwoD7KQy6tz6M+xudkkfqCbK+RrgzGpzft9BkRbDSb4urt7TznodLYyiGzqkHN6wWiDrvpP4AIIQiz/0Dei6vmGQQTl+IZL5f2hXMuM0tNC+gzqPHJUBuqUdyptR6X6kDk6wMEJhjKQPZ4iknwM0pNynRBUPI5GQzC59bVjgEjUXrQaA4MscbdjkLbO95ai6kQtpG3TAD1RGNgKqzxzgZOkGOLlDUBlfefzqYajHkVesF6xoN0V8EHwWrdlXJsmDmjafEd22688XWw7qQADfpLQ1dReFl0CDfvB6QAt++K/Ssh42sHHt//hIWA/6fp+r6KrgEJF6EXq+mklkf9UErDntojW9AXMn49QAhEACX4cmYgtsgUi+MNyWkTc/b0YM5/vD7ENyVEqEEyACi/7MtN/gFK4TEyUopnOGhyKjVebz9b5jXDQscEuAXL8AVcPGVk3JaLA/u5ScZZT1tXBqZLI2zbkVtgwHWq3K8sinqaXA480606D2qRYKR8dhMN+j+bcY8RsvA+enYd8cokCfS8i0yWAO+SzKHEUAIueWwPWvPA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68dafff-3dcd-404f-fce6-08db10de5a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 11:58:58.6326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9aEduUULaMo9dBdzeusRT9yAf6aEDu5r9AwhUm5kqzIUF79ZPms6isGv1otHHQLaxzlWZBSmRtPFjbVyM9Ll+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4877
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170108
X-Proofpoint-ORIG-GUID: 3UhYGNRS66nVFSclk4LXgzX1y8sx1LE7
X-Proofpoint-GUID: 3UhYGNRS66nVFSclk4LXgzX1y8sx1LE7



> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Add a 'timeout' netlink attribute to the 'request' netlink
> message to allow the kernel to communicate an internal timeout
> to userspace.

Can you describe the use caae?=20

I'm not clear on why we need to parametrize the handshake
timeout. Why would it need to be changed? Why would, say,
a PSK handshake need a different timeout than x.509? And,
why doesn't a timeout wait in the API consumer work just
as well?

Last we left this, you were using the timeout to work
around some socket reference counting issues. I think we
need to address those first.


> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
> include/net/tls.h              | 11 +++++++----
> include/uapi/linux/handshake.h |  1 +
> net/tls/tls_handshake.c        | 30 ++++++++++++++++++++++++++----
> 3 files changed, 34 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/net/tls.h b/include/net/tls.h
> index f613feb64da8..51bf5a083cce 100644
> --- a/include/net/tls.h
> +++ b/include/net/tls.h
> @@ -523,20 +523,23 @@ enum {
> 	TLS_NO_PEERID =3D 0,
> 	TLS_NO_CERT =3D 0,
> 	TLS_NO_PRIVKEY =3D 0,
> +	TLS_NO_TIMEOUT =3D 0,
> };
>=20
> typedef void	(*tls_done_func_t)(void *data, int status,
> 				   key_serial_t peerid);
>=20
> int tls_client_hello_anon(struct socket *sock, tls_done_func_t done,
> -			  void *data, const char *priorities);
> +			  void *data, const char *priorities,
> +			  unsigned int timeout);
> int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
> 			  void *data, const char *priorities,
> -			  key_serial_t cert, key_serial_t privkey);
> +			  key_serial_t cert, key_serial_t privkey,
> +			  unsigned int timeout);
> int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
> 			 void *data, const char *priorities,
> -			 key_serial_t peerid);
> +			 key_serial_t peerid, unsigned int timeout);
> int tls_server_hello(struct socket *sock, tls_done_func_t done,
> -		     void *data, const char *priorities);
> +		     void *data, const char *priorities, unsigned int timeout);
>=20
> #endif /* _TLS_OFFLOAD_H */
> diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshak=
e.h
> index 33c417cadfcb..b007e346cfc8 100644
> --- a/include/uapi/linux/handshake.h
> +++ b/include/uapi/linux/handshake.h
> @@ -64,6 +64,7 @@ enum handshake_tls_accept_attrs {
> 	HANDSHAKE_GENL_ATTR_TLS_X509_CERT,
> 	HANDSHAKE_GENL_ATTR_TLS_X509_PRIVKEY,
> 	HANDSHAKE_GENL_ATTR_TLS_PSK,
> +	HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
>=20
> 	__HANDSHAKE_GENL_ATTR_TLS_ACCEPT_MAX
> };
> diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
> index 007308727395..66adac8d660a 100644
> --- a/net/tls/tls_handshake.c
> +++ b/net/tls/tls_handshake.c
> @@ -42,6 +42,7 @@ struct tls_handshake_req {
> 	const char		*th_priorities;
> 	int			th_type;
> 	int			th_auth_type;
> +	unsigned int		th_timeout;
> 	key_serial_t		th_peerid;
> 	key_serial_t		th_certificate;
> 	key_serial_t		th_privkey;
> @@ -72,6 +73,7 @@ tls_handshake_req_init(struct handshake_req *req, tls_d=
one_func_t done,
> 	treq->th_peerid =3D TLS_NO_PEERID;
> 	treq->th_certificate =3D TLS_NO_CERT;
> 	treq->th_privkey =3D TLS_NO_PRIVKEY;
> +	treq->th_timeout =3D TLS_NO_TIMEOUT;
> 	return treq;
> }
>=20
> @@ -162,6 +164,12 @@ static int tls_handshake_put_accept_resp(struct sk_b=
uff *msg,
> 		if (ret < 0)
> 			goto out;
> 	}
> +	if (treq->th_timeout !=3D TLS_NO_TIMEOUT) {
> +		ret =3D nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
> +				  treq->th_timeout);
> +		if (ret < 0)
> +			goto out;
> +	}
>=20
> 	ret =3D nla_put_string(msg, HANDSHAKE_GENL_ATTR_TLS_PRIORITIES,
> 			     treq->th_priorities);
> @@ -233,6 +241,7 @@ static const struct handshake_proto tls_handshake_pro=
to =3D {
>  * @done: function to call when the handshake has completed
>  * @data: token to pass back to @done
>  * @priorities: GnuTLS TLS priorities string, or NULL
> + * @timeout: TLS handshake timeout (in seconds)
>  *
>  * Return values:
>  *   %0: Handshake request enqueue; ->done will be called when complete
> @@ -240,7 +249,8 @@ static const struct handshake_proto tls_handshake_pro=
to =3D {
>  *   %-ENOMEM: Memory allocation failed
>  */
> int tls_client_hello_anon(struct socket *sock, tls_done_func_t done,
> -			  void *data, const char *priorities)
> +			  void *data, const char *priorities,
> +			  unsigned int timeout)
> {
> 	struct tls_handshake_req *treq;
> 	struct handshake_req *req;
> @@ -260,6 +270,8 @@ int tls_client_hello_anon(struct socket *sock, tls_do=
ne_func_t done,
> 	treq =3D tls_handshake_req_init(req, done, data, tp);
> 	treq->th_type =3D HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO;
> 	treq->th_auth_type =3D HANDSHAKE_GENL_TLS_AUTH_UNAUTH;
> +	if (timeout)
> +		treq->th_timeout =3D timeout;
>=20
> 	return handshake_req_submit(req, flags);
> }
> @@ -273,6 +285,7 @@ EXPORT_SYMBOL(tls_client_hello_anon);
>  * @priorities: GnuTLS TLS priorities string
>  * @cert: serial number of key containing client's x.509 certificate
>  * @privkey: serial number of key containing client's private key
> + * @timeout: TLS handshake timeout (in seconds)
>  *
>  * Return values:
>  *   %0: Handshake request enqueue; ->done will be called when complete
> @@ -281,7 +294,8 @@ EXPORT_SYMBOL(tls_client_hello_anon);
>  */
> int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
> 			  void *data, const char *priorities,
> -			  key_serial_t cert, key_serial_t privkey)
> +			  key_serial_t cert, key_serial_t privkey,
> +			  unsigned int timeout)
> {
> 	struct tls_handshake_req *treq;
> 	struct handshake_req *req;
> @@ -303,6 +317,8 @@ int tls_client_hello_x509(struct socket *sock, tls_do=
ne_func_t done,
> 	treq->th_auth_type =3D HANDSHAKE_GENL_TLS_AUTH_X509;
> 	treq->th_certificate =3D cert;
> 	treq->th_privkey =3D privkey;
> +	if (timeout)
> +		treq->th_timeout =3D timeout;
>=20
> 	return handshake_req_submit(req, flags);
> }
> @@ -315,6 +331,7 @@ EXPORT_SYMBOL(tls_client_hello_x509);
>  * @data: token to pass back to @done
>  * @priorities: GnuTLS TLS priorities string
>  * @peerid: serial number of key containing TLS identity
> + * @timeout: TLS handshake timeout (in seconds)
>  *
>  * Return values:
>  *   %0: Handshake request enqueue; ->done will be called when complete
> @@ -323,7 +340,7 @@ EXPORT_SYMBOL(tls_client_hello_x509);
>  */
> int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
> 			 void *data, const char *priorities,
> -			 key_serial_t peerid)
> +			 key_serial_t peerid, unsigned int timeout)
> {
> 	struct tls_handshake_req *treq;
> 	struct handshake_req *req;
> @@ -344,6 +361,8 @@ int tls_client_hello_psk(struct socket *sock, tls_don=
e_func_t done,
> 	treq->th_type =3D HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO;
> 	treq->th_auth_type =3D HANDSHAKE_GENL_TLS_AUTH_PSK;
> 	treq->th_peerid =3D peerid;
> +	if (timeout)
> +		treq->th_timeout =3D timeout;
>=20
> 	return handshake_req_submit(req, flags);
> }
> @@ -355,6 +374,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
>  * @done: function to call when the handshake has completed
>  * @data: token to pass back to @done
>  * @priorities: GnuTLS TLS priorities string
> + * @timeout: TLS handshake timeout (in seconds)
>  *
>  * Return values:
>  *   %0: Handshake request enqueue; ->done will be called when complete
> @@ -362,7 +382,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
>  *   %-ENOMEM: Memory allocation failed
>  */
> int tls_server_hello(struct socket *sock, tls_done_func_t done,
> -		     void *data, const char *priorities)
> +		     void *data, const char *priorities, unsigned int timeout)
> {
> 	struct tls_handshake_req *treq;
> 	struct handshake_req *req;
> @@ -382,6 +402,8 @@ int tls_server_hello(struct socket *sock, tls_done_fu=
nc_t done,
> 	treq =3D tls_handshake_req_init(req, done, data, tp);
> 	treq->th_type =3D HANDSHAKE_GENL_TLS_TYPE_SERVERHELLO;
> 	treq->th_auth_type =3D HANDSHAKE_GENL_TLS_AUTH_UNSPEC;
> +	if (timeout)
> +		treq->th_timeout =3D timeout;
>=20
> 	return handshake_req_submit(req, flags);
> }
> --=20
> 2.35.3
>=20

--
Chuck Lever



