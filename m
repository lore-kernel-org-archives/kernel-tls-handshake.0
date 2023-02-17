Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780245692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:56:54 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7htL9001495;
	Fri, 17 Feb 2023 11:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=LxRz07EL++KRlHXxSxZm19LFczi54771Caaf28TYZV4=;
 b=aDjMKoxDljrUpwEpp9rzwIR0vXC4k7Lw1M5FONObSna2hpT8lkEegaivldrLkn/K8cNj
 habAJ7fRMZu9cPcqP4Cl8CHd8lLwGOqFNdjgXT0YCYNLFrMdP1m6R1PIJT5mNA3/w1kG
 Pp6vkD5oxWnzkLfAEKDXEUi66YG7OAJg0jgkPChK6yyOlPJJcZujkRUr3Mcs1AzriylY
 4lRD7kQvYvZbTx85XrGROZcQoufmk0/hcD8b5rb+ZCY3ITYNMvUURJy6RzTWOJUTGdOF
 4eLOD2lbq9Ip9AXSupwzTXAyMgqXcl6dkAbm7A/GKZoJ7v//PA2bK9WqQsQwGTggEv42 Iw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1ednm2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:56:53 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31H9QhWq019925;
	Fri, 17 Feb 2023 11:56:52 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fajgkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgEwDcDqblsB1HAh+q30Y19AEtKho+pXDvabAHNPUuvnrgYGOn6MQqsROESAY2SOOkEsy7DVMRR0xcjH3xrZ8aswaZObeQ72ioaTQo7asGRl+wJLQmnsUA5oUaqNHPjZsFN5ZwITRdq6ndW1N0Pw2yU2JfjEEaRptr2qjSZNp+rdot48NMdZXTC1w1v7hfU/5X9+4IerUMfcyjX6QGcQiZ0uuGA332tI/kRov/XQ+yyv9tyFQZZ5/2sQmim4qwT9Ukf/gQ/WLyQa2Kpjl6fTnVyx1PJwAfiMM2EE9Hxxi74frZseJS+CAQJ0c/F6halaM8epeX2ZtdkzQVPH8krvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxRz07EL++KRlHXxSxZm19LFczi54771Caaf28TYZV4=;
 b=U+53QVYoNDfn5mSlICEIHahOPe4jPE6O8Gh2SBunxu8z7uBoq1PCW1Yk9Q7WzmwcpEu0KeQcZ5w/UeK8iNtewSaZludn1xqdfWcQA/h48SrZ/hcNxdkpdO2LtaUO+nolmaxe6GMeh8/2yr7e80nUS3nOVIeSdN/DyX0YSVsd8e05Cq6vZgty50sWPyau69nuug241AKJ6dvOkxuQdtdSfIFzGiSPcrIidkmFGZ/zzkfUDBYHGsC7pIxuzZwZy0VoIBQaeTPC4Hl6Dv6/V8KiQFMEs3SkIFYehtD0yqOVO5qZJgqRIfxvtO6QAauBUoNg4Igkn80IWZgyAX5bL0Koow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxRz07EL++KRlHXxSxZm19LFczi54771Caaf28TYZV4=;
 b=mBqCUoiFcwUvePFTaO5/SjfWK8QmwDMtqIwQnspZoudXxgbK33ByepX72Ybw87jm/0TvW3S1DnUUOYxyjdRyjgIm9x+UG/yC9ulKKbzBQUQr6G90BPl4bBmZ9GFP41vesp37bU+ASyNNfgO+gAwsHy4fFIhtySHpHC4Y/b0e6uc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB4877.namprd10.prod.outlook.com (2603:10b6:5:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.13; Fri, 17 Feb
 2023 11:56:48 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 11:56:48 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 0/4] tls-handshake: server-side support
Thread-Topic: [PATCH 0/4] tls-handshake: server-side support
Thread-Index: AQHZQsNuZpAHRcXW2ku5CQFcJ+v0kK7TCEuA
Date: Fri, 17 Feb 2023 11:56:48 +0000
Message-ID: <BF959E70-93EA-42F0-99E7-93018F26EE22@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
In-Reply-To: <20230217113145.18916-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB4877:EE_
x-ms-office365-filtering-correlation-id: e8d3d285-8f42-46e2-3292-08db10de0cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eKW/j43RJAGGmT4BxkreHPFpZin99HcpWE4r63iox7EMaTmRRnButG91FkM7Yf9NoELB6YSVXSSLuCrSWW7A9we4eCFVnRvtGh0nEeLH32Be7zKUVYxAECDc2L2JT1cc2eZmmdnqiJJecsegY3vJ0aMw1/bhql8OJdR09J/ffAT1vY6SD7Ew9v0yrSAMORUgEXDcdv9WCCbTghjAL5L7ifEnwO6fmDu9C8W96/+vS1598nLEdk6SdcZSOb2K3tJmjv3qxVpL2j7zmfNyMKQp224GMuhGb0tmK5+6wyxmjcn0oqbqPMaO8fnQJt8l5+xbryhsSpa9JVXEX85pmjX2eRQXBkS6a+MgFwUyBYKrZkwfN0KrZSr62bXDAsfybCEHDU34tR3dJWqMRxKeWxqQ0tpOXxhjTdH8lyR3ozbYUjifu7yUhUFSgV0gBTBPyRWRIO13RSjq1VHFA9tg+qd0dBWVz7vGhI9xiz3vbVT1xDmfEZDY4hnvq9ZaLcfBnnTXhR8WhGPax1yzkiOqslPMaeSOw+ceTpVLaKi9YPyjGhpFuxLEItqSs8MlxQruzy8moaqxwcoN1bsKTpGYw3NNG8i9pOu2yI0ok8rDYuQmYUQT8I2Wu9tFAqAPOL1Zb/4JLF/Vg/nqefHB2u9EaNVnTRZjTvhx+5CLZJW/ZFzKPIjR0Rov1IISmRhYN7VGZtsCwhAzfdS9X64j7cltmERGoNv2DyRX5X/4uOPqsJBRH5c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(38070700005)(71200400001)(122000001)(2616005)(83380400001)(5660300002)(41300700001)(6486002)(66446008)(36756003)(64756008)(6916009)(66556008)(66946007)(66476007)(4326008)(8676002)(76116006)(86362001)(33656002)(91956017)(316002)(4744005)(478600001)(8936002)(2906002)(38100700002)(26005)(186003)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uHc5m8cNdjO8BfD25UWOO1z6Det1AsEr3Aer7Oc/utNyTAjGgffkTCPlrxBx?=
 =?us-ascii?Q?U9nnH3gWNZx/E/VVpzu/j58wykqT4Ii8PqtNG7bwze2i2bB2fhV4oYHxMcBF?=
 =?us-ascii?Q?vc7f4YGExcazJ3rIltUBc1iVRGxiSw0R807dQQJH/lGkSVB30BjVTuGnUZA3?=
 =?us-ascii?Q?1Bxc0+PLysvdufdE/vkLkQGmxqGgWmucwK40ImvzbiU6rV+99tx0BKzRxw3f?=
 =?us-ascii?Q?XlBfQEPiJIfu/SOGtbfxuxgbzC4sgZx0SqG0+M9E8iCi6wgu3pfd+3EUBDoW?=
 =?us-ascii?Q?dO+irEthRb2/X+HlCE3hy90K7mE4+o8+v9C2vMV/2E3MeeGSRwATo1DeBju+?=
 =?us-ascii?Q?57zcZqR6SJLZ6eJtTcqE5nCZFXpkl8S2J/SzQFH+le+NgsIXHLrqK/vR5/dT?=
 =?us-ascii?Q?6TSXUNulipIYjujz0b/jBrEqCetig1oJ7uGpE1aHLgfuYYasqVCSNNJltueE?=
 =?us-ascii?Q?srzw3qUZfgIlOB3Nm1em86BbelTTPXKoBwkn2Bx/hsCgJA8/a/TsDrZPR9p3?=
 =?us-ascii?Q?sFdvrcqc8BmF3dNvhYz9TXVJ+ZhwS9IgPobfAVIEbw7J6Xgl6xB2VzFyHyPn?=
 =?us-ascii?Q?c8GXqfiQiIVv4wsf44Nr1OV36a0DUUMP+s7mFFbyv6bKfKfQLUUfUbMaA6gN?=
 =?us-ascii?Q?pDQac3ue1z8/CTQ/fJ526E4RQx/iqoAUXUUAnbMIX8DJDX7ea7J7TSgH/Cnr?=
 =?us-ascii?Q?7Y7a7C0p5XXdqJM00LfMJcF/gKdVKXNmk3ysbsdJWMrbFO/DhVFVRXxGMmxL?=
 =?us-ascii?Q?0Dwru+384BeOhXpI6ErkYTUXJgI2sPx+aU9ZHhNKgVFpSHBQMjFufjQxkXML?=
 =?us-ascii?Q?ht7vJLt/P2X4p2QM+kuDVJDL/+S7zJ9VrJCL3Qq9dKRQrDGicuTgVquCKwXh?=
 =?us-ascii?Q?S6poi7XJ4oHWn8SSrHgRmzaM0/YeL8CawCraQ8g78L7KlvN0OZr4o28AW4C3?=
 =?us-ascii?Q?raKtnQy6O6f/STpoCUi0ZiZ6paVOswtcpsuH9XaVQkuw/cT8RzaoEP8tAt8G?=
 =?us-ascii?Q?/vcRRW0ZtmbzjOId9GUFO5L8oY0QHvAXpHgCXr5KOHGzw5MUdV6ZJiolI8cz?=
 =?us-ascii?Q?MtDRDX2boQKlslahHHkovDYtpaIwU/kBblRyQP4tufqUGGJqAghs0E0LdFTL?=
 =?us-ascii?Q?Sj+GOXK24iLUPxxo3L1BZ2XZLNtmMe8QRjni0h2RHKPazt4q9mZGes0Tl52D?=
 =?us-ascii?Q?wKpRqJh7+nTklww+DDOIQFxQSpch2yebrJ1bVj60Q5Fii+a6TtoSjT5AaOqY?=
 =?us-ascii?Q?mi409wrk0KgIIB6syepoDBQ0Lis6Z9puYk8n+4aNVszFRpwHU4m76x5k5gTT?=
 =?us-ascii?Q?1z9Lxc9sMYU7C2eUB+EVE9P6bPhvemU9D5qphyZq5YC8mwG66gvWTLeBgYEg?=
 =?us-ascii?Q?w1Fxo9Il4IYTXVeseZO+kyy4TeEPQLsNVMahQhJPrdR4GrIIUChxanAWXGZA?=
 =?us-ascii?Q?jBf0eBhDR71l5A4lblWHWNud25CCRvG/0iKKg8bqfgnUVuFihrOJ4REdTZCJ?=
 =?us-ascii?Q?V3d7UDfL1WbdH3iQTQgDGiwklEQN7d2uTQlKKT1I2eXp6wfPk2jN2EqhPmFB?=
 =?us-ascii?Q?IAMpiyn24tKQUp4Bi59wDdn+I6bHEu+loWPmxx8ErJ3zaywlnW4NOVwLQROq?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <031A0D617A35B24A8B33E458C5EF285C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	t5dtPzgkJxGcyeTkalA+8zVqJ6vA5iq3TIs/bmacPOnXKs0YP/ojxeuolREL/pNqstVCBKRU3FHnjEbpldmUkT3Jf0qZxkBSlDGaCNPtz9zZ/cTTIGC02cl2k1Y6ThhrKLwWL9P34MC9IuRdi8OI0cMEE2pS/AAagBc6/Txv3qG+GROUnLXQa08PfVsG8FMSWJBpi9Znajy3gWzcYPwBG/xtXNvPGILp9cZrSnS4Jlxm9Ki+hLgthF0o6+l+psMmnHhV9pkXTfunEwp+xtYMXIHrKrGt2GQ21cLGGXxWctDEKBntMfuCaMJb+bhcTdomSXN8Xc5eJlVS/L55+1E8fhVJAuioztIVi59Y8ufJGLZeb9Zs1Fs5g1wWqlswtXqu3uTYumYkleVVB3sdpjCZp3vWSkW0x50UEukESz/eq+GpgH5DmMUAFskQGl2uhp3wQiyDmHKIP5472C4KnRnbwkHdAhtdLAzsgHKeGbg6CRUU3D7d+7KPUeZBV18i5H0+Wv7D4JFWfGM2oejMjrKZwP8ZuzO5N7zkkqjWMUGMPGr0Qce2wxHXwmBczzRxEGliJtSjNaAnNSMaxrECOr3WMsLfDcR/Qg2nON3bOqsxdAXjTt2J4WDCJzg0QQudq4uc8MgZPwyXA0oWWcCL2CPbds+zO66QpfoQ6m7CO0Pov6qzhXRLMLWbTUMwY2kPk+p5xsGlL0TeRgnVnvlkSWKfv8e9JczSEe2YyprXw/UCMxjsyITxmmimsvPp4YNpbIEKQF/ZW+YPriw+9UdsLYR3Il8QcoplZje10WTku0JTDWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d3d285-8f42-46e2-3292-08db10de0cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 11:56:48.4362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VT63UdZ8Z1lRv5Ikrrw4l60BmqAUWXMCluJwOIVkBfcjCjnnUdFQBo+lifSOZmipiBNCECR6LPgeeF8iw7K+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4877
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=998 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170107
X-Proofpoint-GUID: R5CDZxlh_yvEL5VHron4MXLpLgQOUgDp
X-Proofpoint-ORIG-GUID: R5CDZxlh_yvEL5VHron4MXLpLgQOUgDp



> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi all,
>=20
> here are my patches to get server-side for PSK up and
> (well, not exactly) running.
> Pretty trivial, really; just adding two more netlink
> attributes (showing the power of netlink; I really like
> this interface) and split server_hello() into two functions.
>=20
> Based on v4 of the tls handshake netlink patches.

I still need you to sign the OCA before I can accept
these.


> Hannes Reinecke (4):
>  tls-handshake: add 'timeout' netlink attribute
>  tls-handshake: add 'keyring' netlink attribute
>  net/tls_handshake: split tls_server_hello()
>  tls_handshake: add 'keyring' argument to server hello
>=20
> include/net/tls.h              | 18 +++++--
> include/uapi/linux/handshake.h |  2 +
> net/tls/tls_handshake.c        | 97 ++++++++++++++++++++++++++++++----
> 3 files changed, 103 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.35.3
>=20

--
Chuck Lever



