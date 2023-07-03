Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5440FBE0
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Jul 2023 14:05:37 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 363DTSS6011671;
	Mon, 3 Jul 2023 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=IMDbT7GCSSmRGgzMFlM94d9EDr4ZkvPVRnmBlHsoHFQ=;
 b=cKSLlAi9clcFbF6O1AQNXPU4No4AilKfddnRvJmBR0vWzH3SPFzTdhPizt8+nAunlMkY
 RiqeAGSwQESiGbBA9xX8dANgYbX1bVNPLyrKKEnBxfNo8HF3suBTHbw9lKh2x3NNEfWD
 0xM4EYJ3CKr7FkT6w7jmKsHUEdrsUyvOJwttOP4VI4GNalCoTaOtYBd+hD78N7HIHirY
 vXybPgfNmLPhO+kltSk4iJ91lwtJaartYOjsoYDXbDpC3lpBOwnXXQlY34YmF7jpdvwQ
 Ecb4IjMZou/wpU6As+sAnBMbNHC8fFZWIxv88c499VW6U3QzfWJt+hIEhk2sA2idQiDg 1w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjcpuap3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 14:05:31 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 363E28F0040265;
	Mon, 3 Jul 2023 14:05:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak94kb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 14:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgV5NzN+DFGDWqbCEhK0dwk8kqnBVcu+cKo0Mmi8LCDDtEIJdeoHpjlSM31oo7K5PhteITM4JI+HabPGL4dhDYM/KoHMyuRzkVd3Dx0NzVUxJyIwHWuA68elQVtJK9M8kR2fMHTd0H8tbqJ1U2M6kk6S45UbVAv3X/BmMnGuoy5PClATZ1A78zwmoD0iiM/TRpOcb+kUAMKs8qZ9iBVYC7jrkoAinDvECtrxBQI/NNarrbhP4RnquwpWo7qdo+B0uHiQ+T3mP7vPh47rCCByGvBAWiPDQ3leM79IVKR+/965tz79hwEKH9QqO7Xng2K8wyvw/QAj9zthc0qVIazfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMDbT7GCSSmRGgzMFlM94d9EDr4ZkvPVRnmBlHsoHFQ=;
 b=Oqjhlp4caMSf5yRyPTztvAYXkuA0/spyqrej9QZvIGzxB6++s0fiW1u71J+//7eC7XEMRkpCek6Q1MhKfX0Y/WsL72GT/5g1cLFnHcFExJ1w1jmrexdEdkAVDu4wIuVIXQqqbe+vS/dDu9rbYFBwC7wwxZSQHp8LpXrlTcj0Elmatv2Xj2ISgvHmatXDqUAcrn87kE0m6I99nTiGLFhHfFE1ytg+LfZ0lpcdPxBhgwfDs2cuxWxRTzMKKrvtot5qe8Byq9i1Xhq9LlhulgfbFoS2jI74UmNz6VbyDDVzmi//DRwBjVMza/VKPgm+To7p8vbsXNyhOGJDyNGeMhOP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMDbT7GCSSmRGgzMFlM94d9EDr4ZkvPVRnmBlHsoHFQ=;
 b=PDeGTLnNl/YCbCgw4glOtJSzayP+8iKTK2H0oWPxbmvPHQh6NDFBuBHTgvDvKwZGj5M9Xary89R0zw6d4Dlw178TyRfjqjwj0ZxKbn0KaLB2Jpq2oLp3TD2jTvXlxbQAHi5AqmkkchTt4bUsKjD0V6145OVhNDBNWlp+dqIGvn4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB5148.namprd10.prod.outlook.com (2603:10b6:610:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 14:05:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3%4]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 14:05:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: OpenSUSE package available
Thread-Topic: OpenSUSE package available
Thread-Index: AQHZq/iTMTE77XyMzE2aTHzQrYUKKq+oFtiA
Date: Mon, 3 Jul 2023 14:05:27 +0000
Message-ID: <6C532238-6EEE-49C4-A724-33D382DE00EE@oracle.com>
References: <84d5d1d7-58f6-e7e3-9e96-22144ad3a71d@suse.de>
In-Reply-To: <84d5d1d7-58f6-e7e3-9e96-22144ad3a71d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH0PR10MB5148:EE_
x-ms-office365-filtering-correlation-id: 5b33a6eb-5b32-400a-27ef-08db7bce8dc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lYIq7wQ2oEkVti0wkoRUN3T7aY1UP7H0UK5ZOskn5J1aoPNLUuqYwOY1ESlFj/I9tmigOVla5FkBz0eduChyLKc0Lpscb0O+13TnFAHLdUk7r2TvBwVlkDd/u8O17GatmF1xzSFDQfyt5pFlQ1XUPK4C+MJ1DuqsDNbss1ES6/qq/LZ2fVpyo6RRmTUurgRfoBj8qxCn9YWOzFeRHiQvCevCEMMFVkaCtssmZIt/BNG+vFlxFXRtzAFv3L0g7vGo031suxdFSwULVNi+WWu8jyM2/CNxIIPhphpXyPcxNxcKpStyFi/g9n/nGGMJB8GZ0gRpWb6f1GYDc2hGBw+rv54gPZ6EkX3L81q5hfLTmOQQ6OB+FegMLo4aROfEC0W1UJ1c+foNcpvX+fQRpF26TYKWvM2cH/VWtH3Boml7WOgaUQwSYzxSV5s5RwlfKeJJlbFGe3gzw8n/8uKb6AC1XgrT7HJ67zNr1Tf5x7YL1BbNZsujDbvRyoHrLXpCmIwR7ThPfXFrvMlrmbXF7gyTQ5vLQgsrBSQeHRTeds03LPL/3GedoWp5Rj+8v6W4UHQxJw42W/kD4RPST2gb9JOSqD1G/VpZkT5AWwZ3DHtEN+kaCyqdfuqoml9cI90cC/v5QXX8OV11/bYRc1LWbt336g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(3480700007)(8676002)(8936002)(7116003)(478600001)(26005)(41300700001)(33656002)(36756003)(966005)(6486002)(86362001)(2906002)(71200400001)(5660300002)(4744005)(316002)(66556008)(66446008)(76116006)(38100700002)(4326008)(64756008)(6916009)(66476007)(122000001)(66946007)(38070700005)(91956017)(53546011)(6506007)(2616005)(6512007)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?G0qotOWOuIOutFczOHgpSzH+76rQ/yqAniuq/Ej2sDxO3Kt9lcUF5POd3080?=
 =?us-ascii?Q?YiQJFMu42ZKXwUeR0f/o368FCXi+q8ZBLSmRXivOzkZWUnLy8Yg10zGE5URf?=
 =?us-ascii?Q?4xH7bKDFhn6Tl/hrYW2z2r0cSsrnXN1AYEzgeLpdsK5FrBounwCbqPl3sPjP?=
 =?us-ascii?Q?ZA7red48pUiEsm8pro1Psyg2uJK9Lt5ZkjHC1lKeEMMpbu/EtMHYu0fRslrq?=
 =?us-ascii?Q?Kbbl6fRh26i066cfKcwVtiSAXZ6HoyO1olfkE1BAXpmHceQEbX15eciiQtoV?=
 =?us-ascii?Q?cL0x7zV1Rm7LgxNjm7d7PHk5kIwyQNnPbgA/FWqMH/vhSMWqWbWpeyKY8KuP?=
 =?us-ascii?Q?AvblsDbj6T868WFbICnyDY4XylWuIvYU9nrFdV0aQp298tklk0qw7ddDSVEk?=
 =?us-ascii?Q?UVOXp7fq7Kk4gmC11eP1buZeL/qShYVbPNyuC0ElcTpp1fi8mMV/D/iZEpK5?=
 =?us-ascii?Q?ZzpyUj7IZpmTay6RVeYbxPIvJRETKfwSdB9+rghjrDfdMY3VMUekKtB7bwHk?=
 =?us-ascii?Q?19OmP444vMJYrHETgGzEAZBfmVmIvRZrTUj/Z3vQZP0blfqpsRVlJBEGGD3+?=
 =?us-ascii?Q?iUlGcTeuO0l+ztjjflUqNqoPhrBri5YnEVSdjHEQf53CJTS3z6bqeJjAizPv?=
 =?us-ascii?Q?iaoqB/ZHsVtr3tF4sJ6qH+VuUpUWx1zCEQwcwX03s7jEVkKW4tefBScBw73o?=
 =?us-ascii?Q?X560auJQ6M/NhFrmuMp9+a4yk5AaGRiBICadwFyTF6nN/+s/quuzJhUA6c4o?=
 =?us-ascii?Q?Sy06wsGKXe/pwOZcQwlvzXgmsL3fwtkxok+du4SvhyrHJeXZ9mbEnoFb04gm?=
 =?us-ascii?Q?eyCNrxUwehICuBfiXZyOQoYdXc2WEYER0N+Y5BXTUFYNFGhVClUrLrQV4Ekv?=
 =?us-ascii?Q?iGf+Os2s0sYaKy8sZR9R7CdG4wQdwFOA9W7qKsZusYE7fVh1S32nUG7N9XWZ?=
 =?us-ascii?Q?wBuqRxyREgXfM+1Fou+Zja5DC/jik4Rg3x1lP78yur+uIOM4bDfANf8ZI8a/?=
 =?us-ascii?Q?28jRD+/hYx/6tx6YYsQvfLvZChuCsW1pFNURtKfXeJjBYxQ/AqOo8gOT1Npk?=
 =?us-ascii?Q?OE9+Pz1C0ro8npLTx/baV7jnZb1QgQOTaGDL2DBDk7zlgcJyYRyxFyQcAX15?=
 =?us-ascii?Q?nn/K9jwhboX/W9hePUrZ6Lv4dCxomB8hOFXMhK3UcuiOWyeLRI+SGO9vCyKx?=
 =?us-ascii?Q?wr/1+EuZjXQp2yQFb/Uu+qtWempGRjfNRqiL6qNedwQqtht7UlPFN1F+TXQT?=
 =?us-ascii?Q?MlaLs1h2T7mK5QM8G2xcU1rpyhHEpBuvIj7D7aeTW6SdmW5QmH3PXkiglouM?=
 =?us-ascii?Q?QIp/HKUQd5nXlRubkT41mkgloeu90p8mgO2/myfQ2UPpyY2NhnPhd2Aaw1Dx?=
 =?us-ascii?Q?PsDAIRqOmNkkXjwj9bCpqOKGvPlshi5kc+FDqx2jh753E6fGFJiVAFo6XgPy?=
 =?us-ascii?Q?2DUTlFyi2LbeDXAryM+LxeqGfDG5t7o5d1AFQ9Fm/onOI6Q/7cu8FrinSJWI?=
 =?us-ascii?Q?LX7wvlKcwzKRPHMk2hJtmpQRalI5NNpDcir7RZZdhM2ePh2ca0b5j4Wo92H0?=
 =?us-ascii?Q?ZOMZJp+tTq6oq5RZ98M1uuYXFIJ2S44j1f81RhF2HRrEtDweUFjZstZOM8yO?=
 =?us-ascii?Q?ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61BCC8524E246C4D84BE6C173B76B987@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	G0UJ7fZWO9BPq8zl6XolS5/Gw8B/BiNPvnueDbwadBqOYW3nt1jWisyggxPYfRp6w2sfQllhwREtw324oPydBdsA7sG/W/HHBat/1ZbhXeHf/O0t/8YwttXzAdYXSX489uYokuF/ACbD/wWkI9+QTgQWqiSa9R1wCSdehnSLQjob3BPP3jgvnQzru6mv2ngGEkwhUUhq/ip/uIZtLv0jcSH4YwT15eRu17DdLPAu/CbrM0aTmbxWuvc2uQNbxaDTANHzZkPXiAouH0NLmnGaFRN8u4N7PZuzQ4ciCBtLjZyAG70HSNoXkZZTMFPI55oT5DS4t1bwUkuxIfhHZefm90ZWXa7emKjTHoH90B12c4H2aA1DFMC9IBRQtWbaiJu2YtDfdA0upzJD6tIViaaIWg/4Vv3pRHe4NghKK5LNOf5WSuwrywHgXGg5hAeiNGC6udeUcjXyRfNm0PxOMyhT7vsP+GOWv6RzF+Gvm/P8tM0JsVsfW30khKigpfXEZarCXzrJje0tyO9opPq1qm5AQxadO2RPfjMcj3Qm/B7nPmBZk05/p70xaN3bpc6ovxnrgR2Wm+exTjbehz0yFok92+uw2b+dgpyL3P/Eww9cRCus0kxdMBd86DEpujVGNPmtju3JIcdxPPQZJ/M54omuz7lKIjKKs/oUEoEQnyjFLIpcGEXyvVwViPC+mGELXWdYIThGf2/hPOJtK/SD/oIOdRVDs2VGtzm9kgLBqhsKNwptt8Qn2AzPUiUGrPrrgkORuxm3XDkBWP6KYBHAlzWAiA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b33a6eb-5b32-400a-27ef-08db7bce8dc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 14:05:27.4820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmbpEkX+51JvldBAEmR/xZavXne8E3hhVAHd9D/Ms6xgpt9XGglMagWEyFQd/hq5YFlpa6lwjQ6NGYPT23TfsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_11,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030127
X-Proofpoint-ORIG-GUID: XGso470l5zYIPQ6IQpKSEtBOuap1N4P0
X-Proofpoint-GUID: XGso470l5zYIPQ6IQpKSEtBOuap1N4P0



> On Jul 1, 2023, at 4:46 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi all,
>=20
> I've managed to create an openSUSE rpm for ktls-utils:
>=20
> https://build.opensuse.org/package/show/home:hreinecke/ktls-utils
>=20
> As there's a change request open with our product management I guess it'l=
l be appearing in our 'official' repositories for Tumbleweed and Leap in du=
e course.

Thank you for the update and the effort.

Jeff tells me ktls-utils is now in the the Fedora testing
repo, so it's wending its way into RH-based releases as
well.


--
Chuck Lever


