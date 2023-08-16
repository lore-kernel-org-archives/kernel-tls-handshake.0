Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A017737
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:52:17 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GJKIEm023813;
	Wed, 16 Aug 2023 19:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=x2J1sI7tF1jevst/vMu+4uEjpoZkmItj/XDWllMhtSE=;
 b=o9IeG4MoJihXiFTJb484mpOiBlD6ZccYWhoBEuQMX/Thme1im5/FCO4h2cnl43O9maOJ
 dt5EiTsBLc8ltYBrEFyA4edNDdEu9x6MgCRNDmXNRBmpjkbTSv1BnfuRJtzcVqzE3X5q
 roYwuSQsKDN17ufnsbXOULgTlvgt/GXI6qKeYbAxjuCaeUBheLrnQrbmyOv7aou/zN2J
 zkY1VvSTZGJSxQwlz6vpEyyqGIlfoqdO3ogg4GANA7GXFY5+QhFxCzUzicx6jRwiI6QX
 lXubmCoecEVCIoXgAFjPtoPttt31Wm68EcJxXk5UCypFUr2cEP1/B7YMJMQEo+ZoOTjf vw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3se349g033-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 19:52:16 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37GJQ6dC039513;
	Wed, 16 Aug 2023 19:52:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3sey71x19e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 19:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TW0Xb5TTsCMbKU54A3cIrITXZlRUMxVdPTFwX3yN+cb3LBWULLRQCp419dQQHX67g6HYGtbdO2wmMeZZKkLvVSf5I7xKGPmAqpFgF0HkBAZjinhQOADORFttk2imJe4gfcX058RterZu2QsxGoDyC+/uj3bnxztwFXDOKA/xFXrmfyTIie5Wp7BZMf+V7xonWn7VHUOqf5+h2o8+dlqE+hZTrZiFmPBjFvISs2K7AIKgS5I+ozp/dInLdrQ5WcGhnu06voSlPr2N+vhDGV90jf5wyA5Yo1DCCgUNbAajQKCR/2WW5gE/OljEoXmnwAw+fixNQyq3cwMAeWWHpHfj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2J1sI7tF1jevst/vMu+4uEjpoZkmItj/XDWllMhtSE=;
 b=gsdv2GPDyUjqAGV2MvqNOGX6M2LrAfIYIqb+N+Z4UwWfyxuySOcno1FEzJfadZLDTwbZtpOqTBvk12/+OXQyjl8uXHTFTkisHKfx98SiXIw9o8tWxN0UQSe3Lhnm51kei7ptpfzcstD9UvXUHfkRFMHsFKMB9G6gJhN67L65lQQjlu6QfgTgit29XrwqUVMQXL7LZT0S9/ziX4+7oWxW+Jo9UyaeOBKjdREvX3NgKcdVLwB80xsK1K8CltcvBW+x6jcDkd9bcOCPB5/OA76n+PMIUgWdzoTnp+kem4q7hpLcZC7reyFgeaH59kIVRLpp/7BJqkDMu+v/ms3DMdTU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2J1sI7tF1jevst/vMu+4uEjpoZkmItj/XDWllMhtSE=;
 b=cyP8JiMYD74JLTQxzuQCQ6WwN/3EqAIrpRpF5ImLWFfo45M6gwcakU1DglFBLWhBfW9rhsk6tn18sWDkqntchcDFX0mqPETFmkio5+bjpA+gDIlOWIEGpB3BYjOPoxGlL54ssT6nhHxpDXuBkp8govjp3PLOMKMwlmN5Mw3c1yk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB6770.namprd10.prod.outlook.com (2603:10b6:208:43d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 19:52:13 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 19:52:13 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: mount-by-IP-address with TLS
Thread-Topic: mount-by-IP-address with TLS
Thread-Index: AQHZ0HQSLL2A5ufNG0mtewRMKYgVa6/tUAgAgAAFUIA=
Date: Wed, 16 Aug 2023 19:52:13 +0000
Message-ID: <69B5E5D3-A9CC-4C05-9860-5FF34343EF20@oracle.com>
References: <9674EE10-AA24-4868-A2AF-2785C10A7BD3@oracle.com>
 <CAN-5tyELqRN0nqu_dxN_yhJssz+iFCM15nHj1b57OSg7rykRCg@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyELqRN0nqu_dxN_yhJssz+iFCM15nHj1b57OSg7rykRCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA0PR10MB6770:EE_
x-ms-office365-filtering-correlation-id: 075a0bd1-2bd7-4722-55bd-08db9e924935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kbJLyWIB4+UaWTsAJO2RYrGOeXtD4B7lcJB24Y/igIrGz42VVpKXMRZaDhK74t+0sBnWGpG0Rf/sKRM/x3nFzV7Fch+37hjzlAkVtzSOMSrrEzvxN5oAcM6ZcX1h/RdC/YPl85XU8iG/4n6tIh2+370cdn6hb/5VrfOhm7Pya1k8o4xO9BUB1tkTTdy6p3Ct1Zy30TTwcvbV7jmV2R/czHtFPczj5NvcyAwnt8FI24Qd7VC+sL5jkypfc8pv5MSdWoOYwxwPkn3RjkQfmrqJKfoMiLqa2fiAi/Fav5ca/IRx87T8vU/o3uk6NYPymZRJ82BhDVTEIPEq3JB9x2EquKyuPVJtoEYtGw1beo7mvikt/dPKFSupLpCU3EGKhMET2vJfl92Oav0+dEbMPXY2UL36rwp+oORVSAyPJi+p4uRFovVck9DaApH9J4BbfsDMTvaw2GN0igcpSuqZiZwDec/Xb+L2YwwTI1OI526jHtwmmFo6rRdl+aHXZGZBEuNpzGUqHfxOSiPY2Oa5OhFphjWiSKvPj2kjrux/mNKlLm7ACWYJBrVgtK9USeeNv5vAzMrB4w2v4qUDKVltFYbM3gF2+H/7dez6IVu1KEfAvLvQ8WtO33YoTw9ZAACd16BvfCEETT8YL5W4TBp1yOtBJOgA/Gp9nEsSsBThZ+7FtXs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(76116006)(6916009)(66946007)(91956017)(66556008)(66476007)(64756008)(66446008)(122000001)(966005)(5660300002)(41300700001)(38100700002)(38070700005)(8676002)(4326008)(8936002)(66899024)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(33656002)(6506007)(36756003)(71200400001)(2616005)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmNLb0RuUXBPMzRNMTBoMnZXY3NQUWFoWGJHNmhpNU8vQytvbEpaSkVjUXNS?=
 =?utf-8?B?Qm9GVWFOVTl2Y1o5cm5kdjBOaHBWN242VlVZQld5M2RxRXNyek1FQnUwWk9T?=
 =?utf-8?B?RjRYQWlkQ3ZxZFhGTDBYNHh5M20xRWtaVmpaakUwSDdOd2hlZjF5c2tKMWFC?=
 =?utf-8?B?NzZwejhaRko5Z21iU1lSM0hETXJXVk92ZHlnL1BNU0F4Q1doSjBBMWROSnZ0?=
 =?utf-8?B?S1I5NE9sb016eEY4RzR0cHdCZVZDd2UydHU2SXd4a29CZEpPWWp2cjF1RVJI?=
 =?utf-8?B?ODFpMU9GR1FaTXpQK2RjdmxKbFYrMGNLc2xiOUNkWWpkaTJmZStwellPM2JO?=
 =?utf-8?B?Q2Y2S1JiRkY4dlBDb2dGM05rTC8ySDlUT1NUcDRTYWpjYlpvQjZ3MGZKQjZ2?=
 =?utf-8?B?SFI5anQ2WXlYRHVsUm42VHlXQ3EyM2hKREt4NlZTdGFXZS80U0JCMEpKMnll?=
 =?utf-8?B?VEFoMEYvMDBTbnJrTFJ2S0M4Ymc0SGpHZWk0SDQzbTVTdGRYLzk3bmgzNHFv?=
 =?utf-8?B?V0tGTDdKdUJTTG8rYjJuODFzUmJZa2w0aWZSTEdiU3Zrc09WV0dSNWtkQXo3?=
 =?utf-8?B?VTdtaXpWY2l2Q1ZNSjZ3NUZyTTZOeU1pbXduOVRqOWlSc2djeEZISXh0WjFS?=
 =?utf-8?B?ZkZxN1VwZ2hacUhRbkYxbGZQVFdsakZ1UGJmd1I5Z1BoU0hQai9ua01qTzQ1?=
 =?utf-8?B?UXFmSEIvdUFIak5NMVRObFR4a3htNFhsVWdIMzlqRG1jMC9qR0NjTlp4NWhn?=
 =?utf-8?B?WjhVY2U5b25EaWVWZitVckI3U1ZVWjQ0NjNGaFBGckJHRnczdDFUS0I4eGw5?=
 =?utf-8?B?YXhaaXd5dTBDalZnUVljMG1JQVhRaVgzNW5UUWxJMmQweW02REc3eDBFbHJy?=
 =?utf-8?B?UFlaTDh5OHQyMkVTUmtyL3RQcDFrV1hoK2tSQzRxMDF6V1RzbGg0cWQ1c3Uw?=
 =?utf-8?B?ODE3U2RQTS9VUWdBMVVSWWp6Y1ErZ3FEZHFKSXpXaVZZUy8xOTMzREQ3cTBy?=
 =?utf-8?B?ZnZRVU1jSmsvYUVKTEkwRTd5S1FteExNNEpEb1MvSnF2UjJ6NThxd0ZpenlQ?=
 =?utf-8?B?cVIzS3g3aExWeldjZFZQMldwL0VKSGR3R0RsM09uZWdCdVZsK3ZXamNRV2hX?=
 =?utf-8?B?Y2V0RWdKUmZyMkRZL1JJRkhQMlBLUStpSjdzSjVpQ0ovNnNWMXpNa1l2ZVd2?=
 =?utf-8?B?ME9oY0k5Zkl1MTY4UW8zUkplRERCblFvQjFDYkdNMG0rR0FYZXVIdjZ6cUdO?=
 =?utf-8?B?Z2VCMm02NG10aEZiWFZOYXU0ZFA3T0wvbHAxWHpIeVF4cXJsV2FWVjEzR254?=
 =?utf-8?B?ZExpSHZqRk9PQjgrVGhpMlJBUFIyeC8zMzZvZUZ3QkFlVENDUC94cHRuTW5u?=
 =?utf-8?B?cE82cFUyREdTQnNtNnpVblhIZG4zS0hwSjY3R0J5a0Z0MHZ4L1Q4amk4STU0?=
 =?utf-8?B?YWVBcnNQN1l4QzJOcTVWS1IxaERCU0gydDEzQmVtRkZYQmdDSU5ITTQxMDdE?=
 =?utf-8?B?alh2NExCZzhZMVRnVkw0RHRKYjUxN1RGYnR0ZjFHU0t0bTFpQW5pb3FRZFdz?=
 =?utf-8?B?ZGlsY09RZXNhVWtKaGVHYkhoQUkvZFdIejQrdWI1aW9wWDRwTFZPVkQ4Sllk?=
 =?utf-8?B?M3BLODRqMmptT0RoS2N3K1lMNHhoajN1d1R5OG5uTlkvOFNMU2x2QzQ0V2VT?=
 =?utf-8?B?b3UxbVFvMVg3WGY0SHVEVzM0cHBmYjhPZlhoRGtuT0F1VHRvMUxSbFB2SXd4?=
 =?utf-8?B?WE5rNCtHZW1oaVJ3RHJWR2ovMlNsd2VXMWNzVXFma243azZRclZaS3pGMG40?=
 =?utf-8?B?ZGxGMWh6Ty9tUDBxcTVNcEFzV3B0dVRJYmVFMkZRN1FFVXY4WmY0NDV4L2Ru?=
 =?utf-8?B?YktaK012RDhUSUNKVmtWMXBPQnNrbi9sVlpxdEhDZGx6RmZtdTVJcXJXZHBN?=
 =?utf-8?B?MndLTzlCaFU5ZlFSZWM5Y2dGeThhTnFwNnI1eHpHMGRaMGt3Q2NQeVpWSHBI?=
 =?utf-8?B?UWMxM29jY25WL0R3Qy9NTXZ2VVQzRjBDQkxBd09tTms4SzhkWS9iTUZGZDkw?=
 =?utf-8?B?elpVbjlwVFdOV2RxUkw4ajNtMGVaTkozREVsdDkxS0RJNmxnRklzdC8xQ0w0?=
 =?utf-8?B?SDNaME1ML3NnMUNHNm1teEFpdUFFM3dvWEZGbUZJYVZ3OFpYb1ZGbktOOEN2?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <393838F5635BD348855E4AF19FDFC90A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SUsIL0awAAvbsdFXPaS/c2s/RNEJ5RJuTmz2jOas5MD9RNCCHXRagNkyY/kkN0jSl7G0YIVhtA7Un7DrO+qJK7Lo2Fgqd469i63toisLtGluWVgY8CPQCFV9UWYf+AB8jLu9hoOg8Q64LBC8rlbRQY5khoNzHbMKJmavNuc+xbY9aR8IJ1nSL45TnV9s4zX4DjTHpbXwFVjSGd6i8KeelbMX5X0CSBDN0gjApRtanW8wSfIgYwbJcW6wKpIq9iqpDbUWpPv96UUWKViBRX68hdxfitao6rTQZKD2v+g+ooDYqzi48IpANApe3hiSGO2ytHazIbtTTen66QVkSXO18TDcfO4RQX7zEkLlLjLTP3S4xl/q1gjxrC1XjKRhysneH+ivAwAjd8v7gDmRSimzeuyS+2VSkjvZqXDQ/G43DLkbP4+Ju8tGSQnkpJ5mGi1C+VSndLavAIYRY9WRi4IEGytzincbz5eIq6mn2Ph1RcNOG/EVHVt/ZjHHv89k7fQMZPqsknH421cYgATOlLFDjRgqrvqGF+zAAjtFt16ISbrFixWAkxnIVRoWwO+y9sK94/nI43hpCiZyc+WrWhZkqcRpP75qPCslxS0bj+O4zCO/VVjXW/uSmz8TfClLvfIFAZD97kpJzOGqDc4KkN/JoIBt+cRs9MwWKZV5X++vyq3JRp02Z+aD5wJGAJIkfU7MwPRlKkLAR1mKfrgqjfIa1BlEvvtB9Vbvr/0q0CrW2Bj0pPzjaYLn4qtnFJRX/BM7V2Qj/jabTAA32SllZIpAd0cYfzTnwvED/VuGVjpX5Do=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075a0bd1-2bd7-4722-55bd-08db9e924935
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 19:52:13.3197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2sdHmkzo0IcoKW851sfowZFUKL1//+HvjHKyRnAHFrWbPkDQ7mQhgw0qV/RCCEyAZ5SHRIOUkpUjM8b1C65y3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_18,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160175
X-Proofpoint-GUID: LLgtSVoEAqRT26vE128AI4zJH11vLS9t
X-Proofpoint-ORIG-GUID: LLgtSVoEAqRT26vE128AI4zJH11vLS9t

DQoNCj4gT24gQXVnIDE2LCAyMDIzLCBhdCAzOjMzIFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWds
b0B1bWljaC5lZHU+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzowMeKA
r1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IEJlbiBIdXRjaGluZ3MgcmFpc2VkIGEgY29uY2VybiBhYm91dCB1c2luZyByZXZlcnNlIERO
UyB0byBkZWFsIHdpdGgNCj4+IG1vdW50LWJ5LUlQLWFkZHJlc3M6DQo+PiANCj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9vcmFjbGUva3Rscy11dGlscy9pc3N1ZXMvMjINCj4+IA0KPj4gTXkgc2VjdXJp
dHkgZXhwZXJ0IGFncmVlcyB0aGF0IHRoZSByZXZlcnNlIEROUyBxdWVyeSBoZXJlIGlzIGEgcHJv
YmxlbS4NCj4+IA0KPj4gVGhlIHByb3Bvc2VkIHNvbHV0aW9uIGlzIHRvIGZvcmJpZCBUTFMgbW91
bnRzIHdoZXJlIHRoZSBwZWVybmFtZSAocGFzc2VkDQo+PiBmcm9tIG1vdW50Lm5mcykgZG9lcyBu
b3QgbWF0Y2ggdGhlIHNlcnZlcidzIGNlcnRpZmljYXRlLCBlaXRoZXIgaXRzDQo+PiBTdWJqZWN0
TmFtZSBvciBTdWJqZWN0QWx0TmFtZS4gT25lIG9mIHRob3NlIEkgYmVsaWV2ZSBpcyBwZXJtaXR0
ZWQgdG8NCj4+IGNvbnRhaW4gYW4gSVAgYWRkcmVzcy4NCj4+IA0KPj4gV2lsbCB0aGlzIGhhbmRs
ZSBwTkZTIGxheW91dHMgYW5kIGZzX2xvY2F0aW9ucyBwcm9wZXJseT8NCj4gDQo+IEkgYmVsaWV2
ZSBpdCB3aWxsIG5vdC4gR0VUREVWSUNFSU5GTyBjYWxsIHJldHVybnMgYW4gSVAgKG9yIGEgbGlz
dCBvZg0KPiBJUHMpLiBTcGVjaWZpY2FsbHkgaXQncyBuZXRhZGRyNCB3aGljaCBhcmUgSSBiZWxp
ZXZlIGFyZSBhbHdheXMgSXBzDQo+IChub3QgZG5zIG5hbWVzKT8NCj4gDQo+IHN0cnVjdCBuZXRh
ZGRyNCB7DQo+ICAgICAgICAvKiBzZWUgc3RydWN0IHJwY2IgaW4gUkZDIDE4MzMgKi8NCj4gICAg
ICAgIHN0cmluZyBuYV9yX25ldGlkPD47IC8qIG5ldHdvcmsgaWQgKi8NCj4gICAgICAgIHN0cmlu
ZyBuYV9yX2FkZHI8PjsgIC8qIHVuaXZlcnNhbCBhZGRyZXNzICovDQo+IH07DQo+IA0KPiBUaGUg
bmV0YWRkcjQgZGF0YSB0eXBlIGlzIHVzZWQgdG8gaWRlbnRpZnkgbmV0d29yayB0cmFuc3BvcnQN
Cj4gZW5kcG9pbnRzLiBUaGUgbmFfcl9uZXRpZCBhbmQgbmFfcl9hZGRyIGZpZWxkcyByZXNwZWN0
aXZlbHkgY29udGFpbiBhDQo+IG5ldGlkIGFuZCB1YWRkci4gVGhlIG5ldGlkIGFuZCB1YWRkciBj
b25jZXB0cyBhcmUgZGVmaW5lZCBpbiBbMTJdLiBUaGUNCj4gbmV0aWQgYW5kIHVhZGRyIGZvcm1h
dHMgZm9yIFRDUCBvdmVyIElQdjQgYW5kIFRDUCBvdmVyIElQdjYgYXJlDQo+IGRlZmluZWQgaW4g
WzEyXSwgc3BlY2lmaWNhbGx5IFRhYmxlcyAyIGFuZCAzIGFuZCBpbiBTZWN0aW9ucw0KPiA1LjIu
My4zIGFuZCA1LjIuMy40Lg0KDQpTbyB0aGUgaWRlYSBpcyB0aGF0IHRoZSBjZXJ0aWZpY2F0ZSBw
cmVzZW50ZWQgYnkgYSBzZXJ2ZXIgZHVyaW5nIGENCmhhbmRzaGFrZSB3b3VsZCBiZSByZXF1aXJl
ZCB0byBjb250YWluIGFuIElQIGFkZHJlc3MgdGhhdCBtYXRjaGVzDQp0aGUgSVAgYWRkcmVzcyB0
aGF0IGlzIHJldHVybmVkIGluIG5hX3JfYWRkci4NCg0KVGhlIGNlcnRpZmljYXRlJ3MgU3ViamVj
dE5hbWUgbWlnaHQgYmUgdGhlIHNlcnZlcidzIGhvc3RuYW1lLiBUaGUNCmNlcnRpZmljYXRlJ3Mg
U3ViamVjdEFsdE5hbWUgaXMgcGVybWl0dGVkIHRvIGNvbnRhaW4gYW4gSVAgYWRkcmVzcy4NClRo
ZSBjbGllbnQgd291bGQgY29uZmlybSB0aGF0IHRoZSBJUCBhZGRyZXNzIGluIHRoZSBjZXJ0aWZp
Y2F0ZSdzDQpTQU4gbWF0Y2hlcyB0aGUgSVAgYWRkcmVzcyByZXR1cm5lZCBpbiBuYV9yX2FkZHIu
IChwcm9iYWJseSBieQ0KcGFzc2luZyB0aGUgbmFfcl9hZGRyIHRvIHRsc2hkIGFzIHRoZSBwZWVy
bmFtZSBmb3IgdGhlIGhhbmRzaGFrZSkuDQoNCmh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtp
L1N1YmplY3RfQWx0ZXJuYXRpdmVfTmFtZQ0KDQpPciwgaWYgdGhlIG1vdW50IHdhcyBkb25lIGJ5
IElQIGFkZHJlc3MsIHRoZSBTQU4gaW4gdGhlIGNlcnRpZmljYXRlDQpwcmVzZW50ZWQgYnkgdGhl
IHNlcnZlciB3b3VsZCBoYXZlIHRvIGNvbnRhaW4gYW4gSVAgYWRkcmVzcyB0aGF0DQptYXRjaGVz
IHRoZSBJUCBhZGRyZXNzIHVzZWQgb24gdGhlIGNsaWVudCdzIG1vdW50IGNvbW1hbmQgbGluZS4N
Cg0KSSB0aGluayBhIFNBTiBmaWVsZCBtYXkgY29udGFpbiBhIGxpc3Qgb2YgSVAgYWRkcmVzc2Vz
LCBhY3R1YWxseS4NCg0KU2VlbXMgd29ya2FibGUgdG8gbWUuLi4/DQoNCg0KLS0NCkNodWNrIExl
dmVyDQoNCg0K
