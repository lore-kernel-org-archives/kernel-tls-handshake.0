Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB4322B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 14:25:48 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VDxWKb017290;
	Fri, 31 Mar 2023 14:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=hC0dxeXscFhFXX5B3rk2vYfPDaw1EyQppR6vigOUpdc=;
 b=VisSrKATG+o+A0kWUVYFoUyW5xXdwyP7+gKhdlFVcb6eH5L9BbSETW8r6ZUJyPRtVTP5
 QsiNG2XKMSP3HgN2heUiPS1KByGAPSEuE29ShkvBpXHHxaf5BF9+g/M2pr1KN9HFvRvQ
 FORiMcPJbCgm3RCou5sJ79Kj+EMxh9L/6uDCuRVTzYP/Ae37QOS4SN5WjlH0btuSQNXi
 1qqG8dbQOR8m82vO3YEzTrT3Baq5DRqkgEIrJLS9EbCq+kDuAmLrzADKJs9lrdTw1oVz
 krjBuegyCJ1JyHwbj6M7xhatnWDuRrMhGvr4LyqhlLO5HrccgFJSIWpNEkjwEissLsXS 9g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmq53e3yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Mar 2023 14:25:42 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32VE6XHm001168;
	Fri, 31 Mar 2023 14:25:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdb5egc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Mar 2023 14:25:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0agcaju1cPsABo2ocVZ9leF27P1ldJaXU890Xk5+HpMFnmFE+rph67sh5gbZiJLhVJcVqZPZul01OL9FkVb03VNUd87nUeMPicO2ZmNiJaqUs86AUmFpE0A/2w8QY25qJcZLc/qstshpBqGiLlBt+cQvAMj6OVgqNU4sq8Ry3BScOuVlQKe42jNqBAcjBQXoTPwYoE95I6cpNixh53VETA+Qgp8ZRaka9zzmKk8ng4vqrkEHfVVRQmZ1foJ9jySiWDtYw/3uSesEe7ICG6WA8Fh7BlUwZotYF4xqbasaM4sea/Nq05ONfbHFw+ZWg36svY+l7oBtT3MX/N56iZKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hC0dxeXscFhFXX5B3rk2vYfPDaw1EyQppR6vigOUpdc=;
 b=dW3XNuihqJN0UqCdoqLt9nuw5TxhYH+S447tZ23mZLge+0c4FoRfbvMkJ7679jR8U1nTsXqreKMjICEGLBrVxDtONvDS6fRjEvLFHBU4he4sCVs52u2HNCi2e1AkmSIYBTFpDjuxxxHOFF+Wz83ZPqQzqe+m3S9dkfHekJiAUr4K5da5OVDwzPyWIYicx1YD20taLQOKaVAG2Yv5b3UQRfooRISFp0fc9OvrW4vjk1OpeqpOXNqof24xH5NiYjnS45l+mccJ9wL2e+8XgAsObAIfVFsmiQSIgtlLNCoMlqv56LcQv1HQiW5hdrdpAxc0TiGifs68piFyP21MkhNRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC0dxeXscFhFXX5B3rk2vYfPDaw1EyQppR6vigOUpdc=;
 b=ZPQOOirduzsDpqZb8JhpCkjI9ecQ7i9K58uPQ3q8t5VdcNJnw7iNAYzRf/PWtXpIXYstdB86pL48byPOs2WALpT8Z2mO5Xt1JGGusjwulMe8EcdGczZOgyi/lKpG/mgZZpJh2VfG0DHG4W0FfWhixdgdVGrCWGTHt+huGdUU+M8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN7PR10MB6619.namprd10.prod.outlook.com (2603:10b6:806:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 14:25:39 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 14:25:38 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: kernel oops
Thread-Topic: kernel oops
Thread-Index: AQHZY9xvGlmkK9m65ku2aq5pADNCwK8U8ZmA
Date: Fri, 31 Mar 2023 14:25:38 +0000
Message-ID: <C4C2EF4E-C877-4BD7-B77C-BE691B49E005@oracle.com>
References: 
 <CAN-5tyGvk=yrdA3edJu3SeoQeACMzaeKQDetvVxPQSDN8XTd7w@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyGvk=yrdA3edJu3SeoQeACMzaeKQDetvVxPQSDN8XTd7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SN7PR10MB6619:EE_
x-ms-office365-filtering-correlation-id: 2adf033b-79c0-4ba3-323b-08db31f3ccc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MWZEo+8REUYG4YnGUKCym1b9RzasSVG61Hr5g6xm2/t21WJPp+0YgXdvdvbfIr+tVMVFyloAzn/rmxOzcGnSruSkLNzN73dtSsjMXWAhqapm3UXoiPXp4mrUUs3hGggzMoDwGFkxXKQnMhI+cLgjb55Q42c/3+g1xn05JwGHvDhhpx2LOhn7nEAB4u3D5FCd5EzljU3TBDgQRoRpslYV5ilSt2gzQeHTVGsO6PWPLvCWlIHJkfRhcpOEO638IwLhCPaV2BLaSCi631GxNpjc2mNgBqz3yGC+Dz6/4RND+jNHRO/SWc14bEKWX1oH+E5l8ENxby0cGBfdDCbKIUi2B38lAyJVT4zKeRAoyIIV3CIy+Wr3I9JF0DWommzW93FkHIJ3G+SVcel53CYgGKiiRTwRXtffm4GUILJNQmgEBO6SBzU5Q3rbPei7Hrdtqmvvr5qPXArYI/f8yy55su96gLCrnkpz1FiDhx2gomnIPr/O/g5l5uyjACG0N51vGgjTY/jpPljEz3Pp74vpRaWkVXB6Q8i50ycZk9NImMydwv4r1wpFPSXMyZhfDFkb2cH0O/r5xGkyBvikhjEpaWHPghG9+lm8XLJrHwDyat9GjKdESCebg04nlbNpEiGvInrTiNox8Rw6lYoVK6OoOUBOiw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(6486002)(186003)(71200400001)(478600001)(3480700007)(45080400002)(66946007)(83380400001)(66476007)(8676002)(316002)(66556008)(4326008)(66446008)(64756008)(6916009)(26005)(2616005)(53546011)(6512007)(76116006)(91956017)(41300700001)(5660300002)(2906002)(6506007)(38070700005)(8936002)(7116003)(38100700002)(122000001)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wadsKoWaxm/ag5dzEJ5OIUM/CnAtw1L0LnOJt9ZfMgo6hJCf51DRbPogFQuz?=
 =?us-ascii?Q?rcqcqojNx2atvoV8MQosX1KD6MzmlYqdJCkEZQ2G4MIzRCcLm6KsCYdRVxfW?=
 =?us-ascii?Q?il8IhKpqr4lKLHrfB1+8Qkrm260DAXeXIvjpDrFn375QiKEGtM7PgdUhOMyf?=
 =?us-ascii?Q?6W+Kyb+TWzkeqKWnYn+Ex5GAC9q7M/KB8Y5UDw8f8zL8thR95mYfKEr8Kveq?=
 =?us-ascii?Q?dAUi9cvQ8QomP1uCv6ksRR+qSuAVbz/MbOaIpuVrswpFXkrbE5mgCOm4rLV2?=
 =?us-ascii?Q?Xll3vv5Qv1ojpYKISphngZYHSuDY6x77dQcUMlfVBuddRx8LZ+GkDezqI76I?=
 =?us-ascii?Q?XDR1Snd/IRT76r/aU7sc2k9FEQQplLWTynhcehHfYAYUMmIaqV/5w5FQCTHH?=
 =?us-ascii?Q?KTsoDtXkOxV+dg2k6/vnp8BkE4Qe+LmABEZkTEEQ0+m9c+haCDkQ3XAcgN02?=
 =?us-ascii?Q?8gHgDhpSoXo3j15ZE3+iYeD+UpwIgtK28SNLF7wJ6devn65WdbXj6AoPpxLp?=
 =?us-ascii?Q?kATgK6f4PFj8j5pFUx59IFpWYpqv1dlYxsbo6srNGmN2RmvW0i3vta7YGKf0?=
 =?us-ascii?Q?HFvqUXSvMkZ7Ot6CYx6np45xpporpjXY5g7DbjDPQ1ANfVa8Lf2ubbE7U6+P?=
 =?us-ascii?Q?JEbVnJxJcnb28NTwnyXmOV9QjEGzWdAoahG5JNHAIwBgyF4XgNlXdI4vT5iL?=
 =?us-ascii?Q?4LYp05bTN6VE8PRR28gJeTUc95E6Om9H9631b7FBSFev0OaFnvWPAVbT919b?=
 =?us-ascii?Q?XRIRNSt9h38QtS0gwkItMd/XP81VjIUc2Yj5QLrryhmtzFOqpCfSBwZMTlj9?=
 =?us-ascii?Q?kmqpUdGeSqYM79smnejNBrw4Kfl+SX3U3y2QCuC0ZQp6ahOgXno6a2ziTB95?=
 =?us-ascii?Q?VX+4rCGeFt33YvQ0OXDQ+cTe+Q2iC5fYU4x7bAzlOhnl6FsQmPcvFWRfKMd/?=
 =?us-ascii?Q?wRu6XtXpUkkI2inuK0GgMinSx5U4N6oo2A74n0BLoYL2AsShwWrfLc83hvRa?=
 =?us-ascii?Q?mZtrkWFRgZhzzRHh25xWSC7ADeEfVlI80WELJ5dXoA7b6DR4pGAdv5Ai8t6m?=
 =?us-ascii?Q?Bc17WzwZeDpPKFfmGgBAnzhvB2sTXGiDEFlKgnFvxrGBpC/0sw8V+Y09J4Qo?=
 =?us-ascii?Q?cKj/EWGiZxHYVg65o9oLPZAOnq/LnUaasw20BUZ6prceYxDTF/goCqNzVZ76?=
 =?us-ascii?Q?czDgH1PpY7KG0LKs1/RDKjLLzxIkCHzaYQ81DOL9yBREtapu0Ltnh2+iexkD?=
 =?us-ascii?Q?otlZLyuGU24sEVLA1Rso2UshZMJ5fEvOujF92kQU+/i8WyTzsZR/hfRDfWQy?=
 =?us-ascii?Q?sFq4sJqsSlf+WluzVZz7hBKOmoiDDKNXlLHdEM9eXbSa6iQ0Sxgf5pu+FQoZ?=
 =?us-ascii?Q?8glYdx2ohrn1Mb4jH97L9PHNtDMMS54Y8mCUzTVdmNtYKy5B3UrBZul6o/rM?=
 =?us-ascii?Q?s4mu2K5EGg7paCsb/s7CZxRCV/8KO3iy64D7mz6gQjvFqZ/TPe28v/AqpEbJ?=
 =?us-ascii?Q?4zHRQqoeLCtsSQbOibzZ7Q/qrK4oLdkz6o166XBLS1EIrQRKNIOs8LiJEVJI?=
 =?us-ascii?Q?An640QbhUq+EFd8+QohbJZqsQMHgv2Ypo6e7UI4urhgz6LkYjKoJJUB5YLyh?=
 =?us-ascii?Q?+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <021BECC423732A4288BAF5F8AF8774D5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F2lbiU0hrs77ZK5LTJVXaMtaFx1x6WkRHm2ImtvXN7IHtZxV2mqoTykJ8GUtbiIaIDeET8GJDFkxWweePQkjbdjtDqFq3c6iqIdLd322sEoKfPbiZ7RsQnSbiTClI2d09iIiIXssiEZrK4gKg5iqXNxz8EIyGD8ggoycUykk32c4liSHPIMkOdeSGwm3omYbMjik62BjOiNlP9AHmkrP6boFJddn6J4jsl2Dk6hVKXXHolHR8K0QOoM0xpmXANowrlmw+a+s3ztLpILSrnbNEyN7GQIAaIVEaxC59D7ekhtKgMZ6VTI7eKKCkK5wx3ugD4/kXrysBicssenlrwKlQhLCl1sgBDC69bVsgvoGigCOcf4lGxXESSgHiqE90m2YDcD60PRUlJjP3BG109w1gOTJc5PtQ3Qnd0CDUS5FdU1XvzlECWrJ8IKlMFARzlYpKrp9LbQwc0Yu3hO6dN64wQz7Sjh8oGAlpGA7/hZnX1aaSTICs4QDwinAw0ekkz49IDLOUPp4SpqLjaUBEYhw6nvXLymluo2uG5LVpX1lMXNK+gE3O47k2usMIUjNzRVjRSQdzp1uQaVKDUXhqqeHyvcunERXn/wP3ZDqnk5N+nz78LBxZjFAaYjKdU+1vQBEE02qK2oe39+pBJIaCIyOYLorXYCrLdsIB9J7BmsiPG8KEwZ0NEpwrhxAYe8Ai+PSu2B8gAUW87xiVpnOyDnJXMv+ow3qvfm+hOAFs7M469L1OkmX2ulNCDei7jTZRmSCy9cwHrbHvjTc4ohs08sMt6GFfiDU6AUP39aMS7FTbEA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adf033b-79c0-4ba3-323b-08db31f3ccc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 14:25:38.4790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGwqsbiqTtoEeNkvW7Z4sRvj80b+1gEpf5zVeUcWbB3fEEgjH6MF9egj9xXX9bGRjnVqkfSnF3+hU3Y6iBzRBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6619
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310114
X-Proofpoint-GUID: u_smnuAMamu_sWBPcopyjh1JKlcfEvEO
X-Proofpoint-ORIG-GUID: u_smnuAMamu_sWBPcopyjh1JKlcfEvEO



> On Mar 31, 2023, at 10:23 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> Hi Chuck,
>=20
> Have you seen this oops? This is not my testing so all I know was that
> it was an attempt to mount with xprtsec=3Dtls (against ONTAP).
>=20
> [  316.939747] BUG: kernel NULL pointer dereference, address: 00000000000=
00018
> [  316.939848] #PF: supervisor read access in kernel mode
> [  316.939914] #PF: error_code(0x0000) - not-present page
> [  316.939984] PGD 0 P4D 0
> [  316.940041] Oops: 0000 [#1] PREEMPT SMP PTI
> [  316.940109] CPU: 0 PID: 511 Comm: kworker/u2:30 Kdump: loaded Not
> tainted 6.2.1+ #2
> [  316.940181] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
> Reference Platform, BIOS VMW71.00V.16707776.B64.2008070230 08/07/2020
> [  316.940259] Workqueue: xprtiod xs_tls_connect [sunrpc]
> [  316.940463] RIP: 0010:xs_tls_connect+0x3e1/0x590 [sunrpc]
> [  316.940556] Code: ff ff ff 48 2b 83 f8 fe ff ff 48 89 83 00 ff ff
> ff e8 03 d3 ff ff e9 a8 fd ff ff 49 8b 97 f8 05 00 00 66 83 bb e0 f9
> ff ff 0a <48> 8b 6a 18 0f 84 fd 00 00 00 48 8d 72 18 4c 89 e7 48 89 14
> 24 e8
> [  316.940719] RSP: 0018:ffffa69d40f5fdc8 EFLAGS: 00010293
> [  316.940786] RAX: 0000000000000000 RBX: ffff9b0c46333e40 RCX: 000000000=
0000000
> [  316.940872] RDX: 0000000000000000 RSI: ffffa69d40f5fd20 RDI: 000000000=
0000000
> [  316.940940] RBP: ffff9b0c46350200 R08: ffff9b0cf7e31968 R09: 000000000=
0000159
> [  316.941008] R10: 0000000000000001 R11: 00000049c8887a40 R12: ffff9b0c4=
6333800
> [  316.941075] R13: 0000000004208160 R14: ffff9b0c44e18a00 R15: ffff9b0c4=
2dab800
> [  316.941159] FS:  0000000000000000(0000) GS:ffff9b0cf7e00000(0000)
> knlGS:0000000000000000
> [  316.941243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  316.941309] CR2: 0000000000000018 CR3: 0000000102e48004 CR4: 000000000=
07706f0
> [  316.941391] PKRU: 55555554
> [  316.941443] Call Trace:
> [  316.941513]  <TASK>
> [  316.941578]  process_one_work+0x1b0/0x3c0
> [  316.941689]  worker_thread+0x30/0x360
> [  316.941755]  ? __pfx_worker_thread+0x10/0x10
> [  316.941822]  kthread+0xd7/0x100
> [  316.941900]  ? __pfx_kthread+0x10/0x10
> [  316.941968]  ret_from_fork+0x29/0x50
> [  316.942049]  </TASK>
> [  316.942099] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4
> dns_resolver ib_core nfsv3 nfs_acl nfs lockd grace fscache netfs ext4
> rfkill mbcache jbd2 loop vsock_loopback
> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
> sunrpc tls vfat fat dm_multipath intel_rapl_msr intel_rapl_common
> isst_if_mbox_msr isst_if_common nfit libnvdimm crct10dif_pclmul
> crc32_pclmul ghash_clmulni_intel rapl vmw_balloon joydev pcspkr
> i2c_piix4 vmw_vmci xfs libcrc32c vmwgfx drm_ttm_helper ttm sr_mod
> cdrom drm_kms_helper syscopyarea sd_mod sysfillrect ata_generic
> sysimgblt sg ahci libahci ata_piix crc32c_intel serio_raw drm vmxnet3
> vmw_pvscsi libata dm_mirror dm_region_hash dm_log dm_mod nvme_tcp
> nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 ipmi_devintf
> ipmi_msghandler fuse
> [  316.942550] CR2: 0000000000000018
>=20
> Please note this was still on "commit
> caa52379f0046e974fd16585dd7ede624699d8e2 (HEAD -> 03152023-v7,
> origin/upcall-v7)". If you think somethings done to address it I'll
> have them update to the latest.

Update and retry. It has a familiar ring, but I can't say I've
seen this recently.


--
Chuck Lever


