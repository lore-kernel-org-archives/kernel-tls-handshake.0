Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190D23DF
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  1 Jun 2023 19:29:09 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351E3xqb005422;
	Thu, 1 Jun 2023 19:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=X0Clu71AKva3XfY6yvMhVUQg8q1/0FL6SFgBeQzHkMI=;
 b=DST07H6FrF9yRe/TA9LDaC3KkFsw95Qb1inpHktqSdOazbPenjyvlRzrYXuedccWALQj
 bLyuiLSpgYnTHXqHTUxc6Z76F8u6sjUjNB1ar5B3Ib/vfoBGToqXOPBQsfdVGRs+dnG0
 NAM0Ll8EHe+TFYNUVVzAeHP6yq6rJW/IkyuoEGdw6JhCvEZTypGOrSy6ihEmbibC6ny+
 WpYHSqzeIYGWM8R3TmA5JXfglIhE8onb79NRofkgxGJQr2k9GL2phqMqZ2fSybiPdaNL
 D+FY30by9xAO74uc5djk0mapEQRXzJuCEFqWwyWUQkhdEyq0X/w1pL22napQVSRqW+oo 0Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhj51hs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Jun 2023 19:29:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 351J4NmJ030008;
	Thu, 1 Jun 2023 19:29:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qu8a8cq1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Jun 2023 19:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IddvSB0SQ1YJ4LLMpyC+9fIAU1H0UeBfGy7zN3sds1RUEXTSiV33qVFJof7XZr4OK/4RF5X3BKbe7vDK4yLGgt+zltZHq75D6zHe+XL010YwiFr1z00fqTcmtq18JEKWLH4DDF2gVohifq4AJ5wJ5zlXf4DT3NOTkqWKV7Qobz7jnjcNvneJ9g9rUceFDhxP4J+9VY6zSsz7T2qSTbX7pA1LqPuPfy68k2U2PU1YAL1k1Z94l6d/2q7EWpJQ38/3n/JUGn/lTsykU5xrYYQDde3r0M9+6WkAFUNy6DA3Kp8TXzsd5cRE1V3LnvSvrtUuWjjsL+d2SZrzW0meARVMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0Clu71AKva3XfY6yvMhVUQg8q1/0FL6SFgBeQzHkMI=;
 b=Uqj00FeHMxjhMqZ/Ia8HEi7QnfRvbUn1OhyG75FyqOSQCBBMewnHvqVvEvzceUO9ep4JJikCuP1Ab84wJZur+s8gVwOYEULkAtjTvxsIw0Kom5Mk3/jIgY4XzsbRB0nbusOSuB9HeMPgbEKLhQOG/m72uC7IF8f6xxgGtwudpeNgpae+NG8/xrwrkc5CKOMQiYUcq5xTiYYkWlp32aKBVMZSDO/snOQHXjH2WJnewnbSBWmMtUyikeWvWJVjSmLNr3r1e2+u7kfJiw416d+nagJsiQkzqP5Mt5JBWPlGcHH/p144x1b6edyaQbhqKW9xyMOruVWNf8MG7WT2rwSl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Clu71AKva3XfY6yvMhVUQg8q1/0FL6SFgBeQzHkMI=;
 b=ND//873oLMpau4j76d204XMgAt2EYOuxi//cwUQ42Har8MufhyjRKxjFyYqvY76bkUJobpXGrdQiadJAwqR+7WOOVHlLM480wXcdD/cDUgBrD3nSBL8ru4knpimuUS6gqZCSqSMdIFjbteJA77zZJFYmkmXB95l0BA3mI/5qZws=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY5PR10MB6238.namprd10.prod.outlook.com (2603:10b6:930:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 19:29:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 19:28:59 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
Thread-Topic: what should happen for proto=rdma,xprtsec=tls
Thread-Index: 
 AQHZkzrk6rAEvRS9WEuMQJIn/kwPgK9zT9YAgAAFcQCAARVtgIAAChGAgABHx4CAAZuSgA==
Date: Thu, 1 Jun 2023 19:28:59 +0000
Message-ID: <6BD3F10C-8859-42D3-9035-A23D8F3EB712@oracle.com>
References: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
 <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
 <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
 <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
 <F44356CE-9A7E-4D6D-ADC8-AF9407CBAD1F@oracle.com>
In-Reply-To: <F44356CE-9A7E-4D6D-ADC8-AF9407CBAD1F@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CY5PR10MB6238:EE_
x-ms-office365-filtering-correlation-id: 67bac7d7-4239-4f27-1193-08db62d6733d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Yy92WwcBLPdIoouESchTnecvNkupRS0gMTALEjRJ3xqod+EpsWyWpNH+1zgCH3bAqI90WV+1/zChlwvStn58A5exmg4uIJa2dp+ArgT8w1fs4HPhZC5mmKCJ4RFK0J65/Z1hMM35tCKv+1bq+dzUJ32uqqAhN30sUmex0yElSLl29dWdjHBgvhf6s4IL81LsGzbDOTCs/rLbJ/1FWEzXDZTuTHx3nacnoCzCbiWqYi8hfHHA0siVmCCM12pRURpJpW5JE4nfgNoc5PLtWIs8kmtePYCu379Nie+9f+hHBijpzf8uzSVrYxX5KplUcjTAbxSksrwpSsmAlHN/lnW6Oy2hno+gU3jZYY3G5I11CQGsMxVNmywB0gF7UxtF+2e9EoqY2NVLGm/nxdhSMYPXy0xZgQaS1FjTtgRzKkhXxS3olhRSWf4p0Q+1zuFWXqh1XmWT12ourU1ic/Z4M5+xZ6y/lMtih463VfA90VE3fD3R5WCiDwMqujLj6z3hlEynriA0sWLBMKrVV5+LPRH5Ks2J2TpiDi7Bpjp8CSHvU7zz84gEVEv+X0EzhIZENVUMC1VzL/fu0fNeFui19Gwg59bzMc4laZFmgXA4LEYse05QkClPFiN3KOgrwjLFoEwjEJUWILcHzPQ6jFOff16F6g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(71200400001)(6486002)(86362001)(36756003)(83380400001)(2616005)(38100700002)(38070700005)(53546011)(33656002)(122000001)(6506007)(6512007)(26005)(186003)(2906002)(76116006)(66476007)(66556008)(4326008)(91956017)(66946007)(6916009)(64756008)(66446008)(8936002)(8676002)(5660300002)(41300700001)(478600001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YlhMWUt1QWNRQ01nNktzMHBoOW92YmgyRk01elVWY3BBaUV2bVJIbGFuR29x?=
 =?utf-8?B?ZmRFeGtJcndqOCswbk4zUXhIUjFLZGxuTzZoRHFKZ1VCZG1LVDJ5aUdvaG1j?=
 =?utf-8?B?QWJqSVlqQUtINGVuU042OVdPOGFXY1paWDBoOGNmVUU4c2RuRENucjNvYkRy?=
 =?utf-8?B?cVZCZU5Db0dJaDlXZUplclZhM3JDM012bURia29UZWMrakNpUVY0M0NsNU9G?=
 =?utf-8?B?cW9CRnA2cHB3K3pKd2dlQXVNY0ZVaXRmNGhyVXVTL3lhdlZ3UVlUVG5xeXJF?=
 =?utf-8?B?SkIxeVhGVnRmOWhUQ2dYRzc1UTg3UjFUWXVrN21NaGRRbnlNZEkxM1pPRk4x?=
 =?utf-8?B?Y0N5SVRuSU9za3dSSklDNXpPV3g2VGFXT1NuRVR6ajZEbHNwQ0pxN0lWU0d1?=
 =?utf-8?B?bnZoSWI0TnJtQTgzNVBaekkrdk9GL0N6bU4zSFZrcGswZFRLYnVWYkNOdm1s?=
 =?utf-8?B?MjFHSFp0REI1WVkrcHJzUzgzQ0dHS1g1Nld6N29sdVpoeUZ2WEI4MFVFUEJm?=
 =?utf-8?B?RUwzNk9qZEs2TGJ0V3FjdFIwTjQ4OG93SEZPVVNQOTl6N01MNk9VOS84ZHlp?=
 =?utf-8?B?OEEwbDlseHo4a2hnNkhybTZyUlNqRzdEeWVvUk5qaUJndis2MXYxZ0dxV1Nu?=
 =?utf-8?B?Z3NXQ1kwZm9aVzkrVy85SmlWWjRZVmluTGZBbGlVdkxHUWNhWEMrcStWRDNW?=
 =?utf-8?B?T254aFdhWjY5TG4zbm82OGxiNi94d3dVL1dSYUFaVENIRTJqRzJzSFQ1dTVq?=
 =?utf-8?B?azVwSEFOM3BhWDZQeDA0VXFIc0ZCNUNGbFhXVEFZeHJJZkJHWjg4T0p1dU9i?=
 =?utf-8?B?eE4wNlA0bGF1UHVMaWJ3aHVhdGFFWVlRTmo4M2JnRmNRYUczQzhkQy95RDJw?=
 =?utf-8?B?aVErU0tvZGRsTEJoU2JRUUlnRVRIM3VZV2dNaTFadzcyenpVQzlvV215dWN4?=
 =?utf-8?B?Ly9kN0JIZFlxSXAyNzc5YTUyOUsveFozT2FQazJsM0svakpjQm1zUXBzZHgy?=
 =?utf-8?B?MkRSK3JPa2lqeE1mUlZzcnpENmxGdzVVZ0Y4SHhzMUczakFVWEpHajBpbE9k?=
 =?utf-8?B?Mnp3Z1ErdkFBYlVDSnZyVHU4L2daVkx5YXdKWFY0dUVjdlJxUUpuWmVudTZh?=
 =?utf-8?B?c1JRUE1Pb3BWdWhRREhJMjJVN3lMMUEyYU1JNXNxMFVvVEQ3TVpYZ0dZR0ti?=
 =?utf-8?B?NDU4YzlPODZ2cy9rZGNCM1RYM2JUSnpXTzBGQWJUaUd2ZXdwb0Y0SnJtRnpL?=
 =?utf-8?B?Ty9RaUZZWDkrNlY5Y0ZZNDFXUUFKeHF4OXdueUhNWmV2N0ZUOFpCNHpmZTR0?=
 =?utf-8?B?U29zNnBmdW8wcjNmQ2dUV3hlcnNBalprMXhLbUxmbTk4clkwdkE0ak1GOHlR?=
 =?utf-8?B?RHc0SFBMOXRvVGxleEU2Z2U3cFp3UlVzMlBIY1oybncyMzhCQjNRclVuSDVw?=
 =?utf-8?B?a3VGK244ejBlVlVzeFRhajltRE1YaVo4aW01aS9EdmRWNDBkbXZ0dWtEakM5?=
 =?utf-8?B?YlBZK0toQS9IVzg5Yk94TVEwZUxLaThNc05NeStUeEp6b0RGdFJJWktlU2RG?=
 =?utf-8?B?bkxIUW1RMTR1Qk0va3dORC94NmZPdmttNmhIMytNSFZVODVGQ1grTDRxVW40?=
 =?utf-8?B?aHl4RlRpWUlhc29CRGZTVm1qc3JKdnd0NzBHT2ZUQ0RQRVBZSWo3RFZsVzdG?=
 =?utf-8?B?dWFTVytreWdBM2E5QXJQSDMxZHlOYk5PN0lZZUsrRzFmNkZwMnRtUEpydmVN?=
 =?utf-8?B?MWNhUWFFenhOczgxMWgwUk1tUCtISDRSUjVMTk8xcm9ZYnpXaGZUenBiMFhR?=
 =?utf-8?B?eWtoY0dONGxhQ1hoWUp2YnRydDZoNGJsUUVyNGVZSDh6cmdFRHJhWjY0RDRL?=
 =?utf-8?B?REJUVlA2eWtDVm96L2V5cDBPWXdLR3NVYXR4UWJDcnphazFMaG55S042QUw2?=
 =?utf-8?B?MlNMSjdJQzJQQ1REc3hBN2p6UXYwSU1KelVNVTlVQzlTTkhHeC9yR0NGWXBl?=
 =?utf-8?B?bm1vV1M5ZDhXUk5EdElsREl6S3VlTVFuNFVNcDFxclJDa095dkZJcnAyVDI2?=
 =?utf-8?B?eEtCeTVWS3NiNHNGYnZMdnZpclNiTC9aTUpBYmZTa1V2YVkvTThSZk9FN1hB?=
 =?utf-8?B?S2c5dDIxQ2dUcHFweng1Umh3bnZIbnBtUEVna3gvOUl0QXNrTWd5bWYyNG1H?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A6ED3CFC1A9584F85BD42DBE7D6AF72@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TyXTLfVjqYbmFwAW4JchJSVbu9bZmH2KLl7NYhd9tQoPmldC7QyZLiQk5R/84GT0zz45GsKBW849Q21fApo2EGJym1CLiyIgqA7Gy15V2PYmodolEE9lFq7d8DGYLKbRSgTqr2aZcQb0T0k7TG6Zyg3igkyl6euJNWUaxb57vQRUIhdv7lwM6r4s1tn+v4AbV45hs5t7ec5OMZyWIFC0/hojuPZ54EDdJiURffuilO/IFzhdsFOz78r/Cs0XIM71QCA6T9p+JGYoGTEDwN+t5cWVtyaCrfTxddO8wzOotDVPyHODZJoNGSgeiolTBijyoJ2RniH8+lBZ3eHosD65/1jCyVhnTXanBtRPDvKONUY/LFlF1v0eKJSuEg9S2R0cXJp4E90q1d9KNK+VOCFnzGKqAcrj5yNxpOy7RBdOi2GYouGYBTeQkBEGpYP9snHnRgff3rCHJmga+1ETig5lPnd+RRRRtcFwoRV+NUVmgphDDMroYU+d1mTJTLrY8xaPdtIplHn1eYo0/E1Ll9nE9rnG8U+70p8VZZiLyx0hy3O2b+J2AbWsDtoaQoJcTsF797uVaZOHnFlJ8WGXgK2DupiHDDKcN9xIkiW+NfPZ6zSIBBI2+WkxbFVA3hkaNRSLv7Pq4QgPtmMtJsqTIEV8GsYvNS635KlAQFtJpiDqGeqoVaC9vVfPy50G/yAwV6nIJQ2OXjgD6SmsA/RsXCuDZ/FDnLJCuLAfOEHgF+DAPIj4ajjHdMfiSyac5D6HD21Ahr7405NUaz2U0TQlN4BcW4ava+oLCAMkcgtNbNP6r8I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bac7d7-4239-4f27-1193-08db62d6733d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 19:28:59.8841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LY/Wzq+d45UeIq7Gh0fqRHF5hIIk24FC8TfS8ZE7IY7ZYU27FBXlp+Gmj9nSL1X3purb7YVaSq90WI9rKSOpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010169
X-Proofpoint-GUID: sotVfZ3PnBmmtnxYoU_WPizvZXxPEBOi
X-Proofpoint-ORIG-GUID: sotVfZ3PnBmmtnxYoU_WPizvZXxPEBOi

DQoNCj4gT24gTWF5IDMxLCAyMDIzLCBhdCAyOjU1IFBNLCBDaHVjayBMZXZlciBJSUkgPGNodWNr
LmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gTWF5IDMxLCAyMDIz
LCBhdCAxMDozOCBBTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToN
Cj4+IA0KPj4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTA6MDPigK9BTSBDaHVjayBMZXZlciBJ
SUkgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+
PiBPbiBNYXkgMzAsIDIwMjMsIGF0IDU6MjkgUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVt
aWNoLmVkdT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiBUdWUsIE1heSAzMCwgMjAyMyBhdCA1OjEw
4oCvUE0gQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5sZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4+
Pj4+IA0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiBPbiBNYXkgMzAsIDIwMjMsIGF0IDU6MDggUE0s
IE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+
Pj4gSGkgQ2h1Y2ssDQo+Pj4+Pj4gDQo+Pj4+Pj4gSSBkaWQNCj4+Pj4+PiBbYWdsb0B1bmtub3du
MDAwYzI5ZGJhNjE2IH5dJCBzdWRvIG1vdW50IC1vDQo+Pj4+Pj4gdmVycz00LjIsc2VjPXN5cyx4
cHJ0c2VjPXRscyxwcm90bz1yZG1hLHBvcnQ9MjAwNDkNCj4+Pj4+PiAxOTIuMTY4LjEuMTA2Oi9u
ZnNzaGFyZSAvbW50DQo+Pj4+Pj4gd2hpY2ggc3VjY2VlZGVkIGFuZCB0aGVuIEkgZGlkICJtb3Vu
dCIgd2hpY2ggZGlzcGxheXM6DQo+Pj4+Pj4gMTkyLjE2OC4xLjEwNjovbmZzc2hhcmUgb24gL21u
dCB0eXBlIG5mczQNCj4+Pj4+PiAocncscmVsYXRpbWUsdmVycz00LjIscnNpemU9MjYyMTQ0LHdz
aXplPTI2MjE0NCxuYW1sZW49MjU1LGhhcmQscHJvdG89cmRtYSxwb3J0PTIwMDQ5LHRpbWVvPTYw
MCxyZXRyYW5zPTIsc2VjPXN5cyx4cHJ0c2VjPXRscyxjbGllbnRhZGRyPTE5Mi4xNjguMS4xMTks
bG9jYWxfbG9jaz1ub25lLGFkZHI9MTkyLjE2OC4xLjEwNikNCj4+Pj4+PiBOYXR1cmFsbHkgbm8g
VExTIGhhcHBlbnMgZm9yIHJkbWEgYnV0IEknbSBub3Qgc3VyZSBpZiB0aGlzIG1vdW50DQo+Pj4+
Pj4gc2hvdWxkIGZhaWw/IG9yIElmIHRoZSAibW91bnQiIGFmdGVyd2FyZHMgc2hvdWxkbid0IGRp
c3BsYXkvY2xhaW0gdGhhdA0KPj4+Pj4+IGl0J3MgZG9pbmcgeHBydHNlYz10bHM/DQo+Pj4+PiAN
Cj4+Pj4+IFRoYXQgbW91bnQgcmVxdWVzdCBzaG91bGQgaGF2ZSBmYWlsZWQuDQo+Pj4+IA0KPj4+
PiBTbyBwZXJoYXBzIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0
IGEvZnMvbmZzL2ZzX2NvbnRleHQuYyBiL2ZzL25mcy9mc19jb250ZXh0LmMNCj4+Pj4gaW5kZXgg
ZTQ5ZTNkMThlZjg4Li41ZmMyMjlhNzY5MGIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2ZzL25mcy9mc19j
b250ZXh0LmMNCj4+Pj4gKysrIGIvZnMvbmZzL2ZzX2NvbnRleHQuYw0KPj4+PiBAQCAtMzM0LDcg
KzMzNCwxMCBAQCBzdGF0aWMgaW50IG5mc192YWxpZGF0ZV90cmFuc3BvcnRfcHJvdG9jb2woc3Ry
dWN0DQo+Pj4+IGZzX2NvbnRleHQgKmZjLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dF9pbnZhbGlkX3RyYW5zcG9ydF91ZHA7DQo+Pj4+ICAgICAgICAgICAgICBicmVhazsNCj4+
Pj4gICAgICBjYXNlIFhQUlRfVFJBTlNQT1JUX1RDUDoNCj4+Pj4gKyAgICAgICAgICAgICAgIGJy
ZWFrOw0KPj4+PiAgICAgIGNhc2UgWFBSVF9UUkFOU1BPUlRfUkRNQToNCj4+Pj4gKyAgICAgICAg
ICAgICAgIGlmIChjdHgtPnhwcnRzZWMucG9saWN5ICE9IFJQQ19YUFJUU0VDX05PTkUpDQo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ludmFsaWRfdHJhbnNwb3J0X3JkbWE7
DQo+Pj4+ICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gICAgICBkZWZhdWx0Og0KPj4+PiAgICAg
ICAgICAgICAgY3R4LT5uZnNfc2VydmVyLnByb3RvY29sID0gWFBSVF9UUkFOU1BPUlRfVENQOw0K
Pj4+PiBAQCAtMzQyLDYgKzM0NSw4IEBAIHN0YXRpYyBpbnQgbmZzX3ZhbGlkYXRlX3RyYW5zcG9y
dF9wcm90b2NvbChzdHJ1Y3QNCj4+Pj4gZnNfY29udGV4dCAqZmMsDQo+Pj4+ICAgICAgcmV0dXJu
IDA7DQo+Pj4+IG91dF9pbnZhbGlkX3RyYW5zcG9ydF91ZHA6DQo+Pj4+ICAgICAgcmV0dXJuIG5m
c19pbnZhbGYoZmMsICJORlM6IFVuc3VwcG9ydGVkIHRyYW5zcG9ydCBwcm90b2NvbCB1ZHAiKTsN
Cj4+Pj4gK291dF9pbnZhbGlkX3RyYW5zcG9ydF9yZG1hOg0KPj4+PiArICAgICAgIHJldHVybiBu
ZnNfaW52YWxmKGZjLCAiTkZTOiBVbnN1cHBvcnRlZCB4cHJ0c2VjIG9wdGlvbiBmb3IgcmRtYSIp
Ow0KPj4+PiB9DQo+Pj4+IA0KPj4+PiBbYWdsb0B1bmtub3duMDAwYzI5ZGJhNjE2IH5dJHN1ZG8g
bW91bnQgLW8NCj4+Pj4gdmVycz00LjIsc2VjPXN5cyx4cHJ0c2VjPXRscyxwcm90bz1yZG1hLHBv
cnQ9MjAwNDkNCj4+Pj4gMTkyLjE2OC4xLjEwNjovbmZzc2hhcmUgL21udA0KPj4+PiBtb3VudC5u
ZnM6IGFuIGluY29ycmVjdCBtb3VudCBvcHRpb24gd2FzIHNwZWNpZmllZA0KPj4+PiANCj4+Pj4g
SSB3YXMgZXhwZWN0aW5nIHRvIHNlZSAiTkZTOiBVbnN1cHBvcnRlZCB4cHJ0c2VjIG9wdGlvbiBm
b3IgcmRtYSIgbm90DQo+Pj4+IHRoZSAiYW4gaW5jb3JyZWN0IG1vdW50IG9wdGlvbiB3YXMgc3Bl
Y2lmaWVkIi4gQnV0IGlmIEkgdHJ5IHRvIGRvDQo+Pj4+ICJwcm90bz11ZHAiIEkgZG9uJ3Qgc2Vl
IHRoZSAidW5zdXBwb3J0ZWQgdHJhbnNwb3J0IHByb3RvY29sIHVkcCIgc28NCj4+Pj4gSSdtIG5v
dCBzdXJlIHdoYXQgdGhpcyBuZnNfaW52YWxmKCkgaXMgc3VwcG9zZWQgdG8gZG8uDQo+Pj4gDQo+
Pj4gQXJjaGl0ZWN0dXJhbGx5LCB0aGUgTkZTIGNsaWVudCBzaG91bGQgcGFzcyB0aGVzZSBvcHRp
b24NCj4+PiBzZXR0aW5ncyBkb3duIHRvIFJQQyBhbmQgbGV0IHRoZSB0cmFuc3BvcnQgdGVsbCBp
dCB0aGF0DQo+Pj4gVExTIGlzbid0IGF2YWlsYWJsZS4NCj4+PiANCj4+PiBJIHRob3VnaHQgUkRN
QSB3YXMgbWlzc2luZyB0aGUgZnVuY3Rpb25zIHRoYXQgbWFya2VkIGl0DQo+Pj4gYXMgc3VwcG9y
dGluZyBUTFMsIGFuZCBzbyBpdCBzaG91bGQgaGF2ZSBmYWlsZWQgdGhlIG1vdW50Lg0KPj4+IEkg
bXVzdCBoYXZlIG1pc3NlZCBzb21ldGhpbmcuDQo+PiANCj4+IEFoLCBvay4NCj4+IA0KPj4gU28g
aW4gdGhhdCBjYXNlIGhlcmUncyBhbm90aGVyIChmYWlsdXJlKSBvbmUgZm9yIHlvdSAtLS0gbW91
bnQgb3Zlcg0KPj4gVURQIHdpdGggeHBydHNlYz10bHMuDQo+PiANCj4+IFthZ2xvQHVua25vd24w
MDBjMjlkYmE2MTYgfl0kIHN1ZG8gbW91bnQgLW8NCj4+IHZlcnM9MyxzZWM9c3lzLHByb3RvPXVk
cCx4cHJ0c2VjPXRscyAxOTIuMTY4LjEuMTI1Oi92b2wxIC9tbnQNCj4+IA0KPj4gMTkyLjE2OC4x
LjEyNTovdm9sMSBvbiAvbW50IHR5cGUgbmZzDQo+PiAocncscmVsYXRpbWUsdmVycz0zLHJzaXpl
PTMyNzY4LHdzaXplPTMyNzY4LG5hbWxlbj0yNTUsaGFyZCxwcm90bz11ZHAsdGltZW89MTEscmV0
cmFucz0zLHNlYz1zeXMseHBydHNlYz10bHMsbW91bnRhZGRyPTE5Mi4xNjguMS4xMjUsbW91bnR2
ZXJzPTMsbW91bnRwb3J0PTYzNSxtb3VudHByb3RvPXVkcCxsb2NhbF9sb2NrPW5vbmUsYWRkcj0x
OTIuMTY4LjEuMTI1KQ0KPiANCj4gSWYgd2UgZXZlciBhZGQgRFRMUyBzdXBwb3J0LCB0aGF0IHNo
b3VsZCB3b3JrLiBJdCB3b24ndCB0b2RheSwNCj4gdGhvdWdoLCBhbmQgdGhlIG1vdW50IHNob3Vs
ZCBmYWlsLiBJZiB5b3UgYXNrIGZvciB4cHJ0c2VjPXRscw0KPiBhbmQgdGhlIHRyYW5zcG9ydCBj
YW5ub3QgcHJvdmlkZSBpdCwgdGhlIG1vdW50IG5lZWRzIHRvIGZhaWwuDQo+IA0KPiBJJ20gZ29p
bmcgdG8gaGF2ZSB0byByZXdyaXRlIGFsbCBvZiB0aGlzIGR1ZSB0byBUcm9uZCdzIG1vc3QNCj4g
cmVjZW50IHJldmlldyBjb21tZW50LCBzbyBJJ2xsIGJlIHN1cmUgdG8gdHJ5IHRoZSBvdGhlcg0K
PiB0cmFuc3BvcnRzIGJlZm9yZSBzaGlwcGluZyB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpUbyBzdXBw
b3J0IHVzaW5nIGFuIHhwcnRfY2xhc3MgYXMgVHJvbmQgc3VnZ2VzdGVkLCB0aGUgTkZTDQpjbGll
bnQgd2lsbCBoYXZlIHRvIGNoZWNrIHRoZSBzcGVjaWZpZWQgY29tYmluYXRpb24gb2YgbmV0aWQN
CmFuZCB4cHJ0c2VjIHBvbGljeSwganVzdCBhcyB5b3Ugc3VnZ2VzdGVkLiBUZXN0aW5nIG5vdy4N
Cg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
