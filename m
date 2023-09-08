Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6197730FB3
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  8 Sep 2023 21:29:42 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388LNhjj023541;
	Fri, 8 Sep 2023 21:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=pgDHjNzh2zq5uvRj1nOwqBx/sm7FBjAcBzWZwqZQTN4=;
 b=HYlfBZG7GknSD6hqtbgxZ+5vyLtBV3AfFnIRci7EOLHklNdsorHJkq9LlCitaEYzzz2x
 RPNe8Bix7YwPaRAabjyg6eidQloKwczyrdin2hJdBvLt4OhqUO8dyiIAWdOrXsPNqgAN
 JGqfWmJQg3RvZkyI+wdyRO+qmtjfZG3E6dHS6U/KphJ69vb126iI1HMIQNwwEClZzwaw
 sjA8nHbe+ldmrrwLSEX6tp0ptBaDzdjSjhJVgOftS+jdYs0XpeShcP1Im+0JhX+rhCnq
 zg4YknKOESNnMq8zygCU/jlQOIPwyJ2DyDy8oP5kjQOLdJiRkB6PGvoPOySI1ohBase8 jg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t0ba1r10r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Sep 2023 21:29:41 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 388KRcVg016694;
	Fri, 8 Sep 2023 21:29:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3suugfxc8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Sep 2023 21:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFhmkgCqqcGX/wCvycx5FHn2dV9JvVU3Udar8IvzjNMLXbLCo7aUNX4/dSOT3g0oevW54n5U9YbT5DhYU4+3fv/1ChmpARvUG5iz1aKq5MV/+UMHe6S+7q5+kpspFzS1f08vinLT9uh1X1fi5Pr77+FBy4BuMG0uBXYN1MEB0FwYB70v07qn2f5d8vjsEkbs1rnNlSFREkGDM4ksV0J9KDbXMlFzpHxVDi4BxtQk7ZYSA0U73LVia3PUbAsi0Nti8FGeFzMq7CScN2rGCohLY5skHap1esjfEG8Y3BkcGkmHgvd+I9TKOSnMwF3eU9jBSHlZ3JSmBfkztlFfSXirXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgDHjNzh2zq5uvRj1nOwqBx/sm7FBjAcBzWZwqZQTN4=;
 b=jJ2KJ5USnYT4KIG1Ve0N1ZZSsiHKtjMhHm+bZhraimERvvBaBIC6+maJujK6remMNSea37aTrt+1HWeNmGz3N6g676YnRhh76SztiiLS9hnY8qnWoSKJ7qkFCdNCybajmWqAbmUHU9o1I1/oVZPdD5ClkP7rfRiI8D44QfkGgWdAsF+UM0J2gRNc7EU77NYHr3Ogt+eBe4zZF/UFm5ZYzyTgz9wtUB3cDmPEy9EnbYk57h7Hxt4X944t7dRulHL3JyvOlzUOkQk6extLKkuxCQ2ilRcBM7sz8xYVFlzpTdU+I6D3HTMv8TqfwH0Cze5E0oxm4JEoMKLD/oCDIuGKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgDHjNzh2zq5uvRj1nOwqBx/sm7FBjAcBzWZwqZQTN4=;
 b=UsbNdKqKNIJbS4WVkkk4a9CJ2CfRTEiyIFz298pcHgNUPwHP98G6oIcCG7N5y6ApaI+nQ5CaytMq1IMgQHCLcAHuMnoqHtNAnLwnIR5jxKSbMgjoZeBdPRQ69a2YE9cEv37k4UqiEvK3c0PR1lNpaMw/1yCPZroigZf9CSK8i8s=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5363.namprd10.prod.outlook.com (2603:10b6:208:334::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 8 Sep
 2023 21:29:12 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 21:29:12 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Topic: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Index: AQHZ4Msr4xuGDwPB1kSaS5o2z7XRQ7ARWGqAgAAc94A=
Date: Fri, 8 Sep 2023 21:29:12 +0000
Message-ID: <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
 <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB5363:EE_
x-ms-office365-filtering-correlation-id: c84139ae-0c84-420b-1eb0-08dbb0b2a522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6RugTpmaOJ01tfa4jNVBYQrR29HbIG0pSw0kA9EP7Q7HH4/zLeI79wVKwCS3v6qemOoRaddZfpjHziubneRkf4WWxSs5pQTU2IrJZPI4ZyQ6yonNuIpTcDcxjhFd02sptinCoNEhucN2VXpK53KesPI2ISWxfpQisLoRSVCZJmMRtDxcgmBJakyAu8sJ9ZHqyma0Nc1ppPbTxgS9TfmiYxkFaN2F5gKPg2V6mZGnZ0/Bu0fouK9V/GaXG0cgDT2/xwOZBt4MedM3tubct8s/TfFYP5G9CZQuTkUgrppsK3/ChLLKT1s6gTfBVnYoATlCq2k0DSeXBHDTW68FUqlIOJ6juC1QqNnquzzokCDGNLYpq2JlKM4QPxuBGAMgCL2nacKeisVboRdWiF+BBwU3HYex8HlrFMJLhTENAZ8AfBLFZQm/cF5HfUgL4nY6bMRM2bT8J4vvoMgYT+zBDg8jWlFkHn29dPnVkUlHjUpXeb6Remb9VbNs/KbLjakhZwAT4VPRRrJhwI11GNe4Ohw44qMnRItMspa+rEkfJ27oHwN5dynxQ0X+REExgr4xn8FoUnfjgOFvio29zVn3Ep29gAWG52jEOOaUD4mKuCh3Dv/c1CTgwtU5yJXVje1MdWJgGN7DIrri2+FepwfFPvFBvg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(186009)(451199024)(1800799009)(2906002)(86362001)(66899024)(53546011)(2616005)(26005)(71200400001)(6506007)(478600001)(6486002)(33656002)(6512007)(36756003)(83380400001)(38070700005)(38100700002)(122000001)(8936002)(41300700001)(4326008)(8676002)(6916009)(66446008)(64756008)(66556008)(66476007)(76116006)(5660300002)(66946007)(316002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ektBWk9CZlBHMHd5VFoyekNzWG1wMnd4QmV6MTZsVkVVbVBHQ1FlQXFHRTFj?=
 =?utf-8?B?UnNXY2t0WEVHSVNLa2k0cloxNGsrRU5oVDlxcTJ4dU1kWlhPNUVkanBHSWFK?=
 =?utf-8?B?QnVMbjhJOStMak4rN2NQTnBGcVRKQ0Jia0piQ0JTNlIwTGZKM01GNXM0SlBv?=
 =?utf-8?B?a0ZFSC9CQnJ1TkU5S1dVMmljU3BqbUZlalNtYzBqc1FNaFM4ZXNmZU1qemV2?=
 =?utf-8?B?bWQxWXZsNEw0SEVkakRHMmJXTlpjWG1HemRaRzlWeFluQlJvcmZ4eW9SZmZM?=
 =?utf-8?B?aXBtdHdUdEJ2U1FOZU5JQ1hYTTlqVnVXeFNjOXNRMTdtVG44d3hzcjBRVFht?=
 =?utf-8?B?QXFiK2EyRHRiVk5YMGRuVTBzQ3dUSlorM01hbm5jdm9KWFJmSWVlbDl4dVBr?=
 =?utf-8?B?Nm82NnZDVi9VSVNNdFFrdjM3b2VuaTlyalJmN1A2NWxiT2lkUEhQMFJPUU82?=
 =?utf-8?B?OWlVY211R0RuRGhWMkVqNkMyUDVieVlqWE1yalFaNjlKZmZxdGFzVGpMQW5I?=
 =?utf-8?B?VmNBK0NMblQ0Y2VoaXJsYk5SSVpJNkFSR0MvSkM1RWs3V1ZoQlBJMDF6emhS?=
 =?utf-8?B?TXNQNnlONUhBd0pBOTQ5Rkt2aVZMa29ZZHBvRGZLOXRSSUM3TllNOTV3NDVZ?=
 =?utf-8?B?Wm1WcVBCdDBabW9tU1dtV0dTWjE2Vk9Jd3poZHNYL2Q0N01BcVhqSFAwOFRD?=
 =?utf-8?B?U3RSUlM4S3RPSE5rcVFRTmtsNTN0K0ZHOHNtQmhWSGkwSEY0ejEvNXZiaGZ3?=
 =?utf-8?B?NGxNYnd0bGRWbGdwb2pQTVdJaEM1UzFjeElFNjNIc3pXRU5UVDRHbUw3RmVa?=
 =?utf-8?B?VkxPTGlFK3hTNVZ0Z3FIS3QwQkJGREp1MHZDNlQ5SzlFTy85KzBpQTdDUmE2?=
 =?utf-8?B?RVkzbEplZUVIM09EbE4xaG95ZE9uV1IwT25DU2plMFFSYlgzSkoyTDdtWkRq?=
 =?utf-8?B?cExnK3BCVGI5VWZwbkUxUUlML1pSY2tnOXBWZDlWaDY5bnNTekhiVDVLZ2p4?=
 =?utf-8?B?YWxOeHZmTjVicElENm4zYmNxWFp2bG82eWt6NXFBTXNPK05NRFhMaUxCckJ0?=
 =?utf-8?B?QTBXTitlV3UvSWwrUDJmY05nMVlQeXFabUMxVW0zWmxXOUxYcC84M0ZsOWsy?=
 =?utf-8?B?Z3RIc29Bd3VZaW5IbExEc0VxbVFkM2dCVWlnUmM2aStQWVNBcGpuWk9VT1JL?=
 =?utf-8?B?dDQ3QWt6UDRESzhuWC9zYXVsVGl2RWhKaVFicjhRZVlvQ0lBcXRyME1qNzJt?=
 =?utf-8?B?RzE2MW9WUVdzL05nQkdBdSt0ZlFqWldTODRxWmlubjBaUlZWY1ZsaVgxMml4?=
 =?utf-8?B?emdPNGxzN3JWZDhIbUd5WForMG9Danh2bTByKzJIMk9WOWs0UHZjbDkzNUda?=
 =?utf-8?B?c2NabEYrS21HUmMwVyt2UWIxRHNjMXFQZ3Z0YU1iR09GRHEvcUdpSEpJb2ov?=
 =?utf-8?B?aE5qOC9xeTlsWkRnSmdKSnJKWmk4R0ZXWE5TdzRwVHZTeHpEVkxFWnlaNmt2?=
 =?utf-8?B?L2lDNUZvdS95ZVVHL2VxalF5U0h2SUhPYWFsbTZzcCtETnJxdHk3MVVQSEkz?=
 =?utf-8?B?aDhXRzZBMkx1V3BuamJqN2EvWlhxQTlNTmFRVVV5eXNubDhZelpnN0J4bXFp?=
 =?utf-8?B?SlRyTW9DZThmMGlvTDRlcThiOU04Y2lvSFE4cDkrTWlkVzZnTE44eVJtUHlr?=
 =?utf-8?B?QW1SczYyOVNvZ1FueVVyQ2ZIQ1h6TUNHY2RKc3dmWmZGdHNUK3U2UkczNUdC?=
 =?utf-8?B?enEyRllYTzB3MmJkVkhGQ0U2amxNZHcyckxBTHNuRGp3MFlpNzdrNmtwNFE4?=
 =?utf-8?B?R2VwaGdRc21OUVY5NXZGNGY3QkRIS1FaRUlpbFJ0eTUwU3pyeVF5cnRocmt4?=
 =?utf-8?B?ck5lTWkxL0prdWlmYW91VTMxVlpuU3ZZM25CYVZMUUxmTlIzOFA4eCthamNz?=
 =?utf-8?B?ZnJuaVNFQm1PamE5N1ZJeUU4SnRZR2FxbWRVSFVHZjZtaDNnaTZONFBQaG1X?=
 =?utf-8?B?VG8vcXBRMVpWQjdlOUEwZGRiK3dteXNlSmZLckdmSURSdi9SeFNEQ05kcXQ1?=
 =?utf-8?B?ZDRBMk05Sk9KWFMrMmpwc2drTDU4RHJBTEJDbGJVdXF5MWhaMzFzcFMwSFN2?=
 =?utf-8?B?cEFMa1U2dXQ3SHd3MUFrK2NiRjhqMGJOZ2FpMWYyTHBIWExTRDZDV1FqZEc4?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C02932E65B7254DAE32ADDFC2AB9524@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	l25h7MDElcfw9N1N44kuZboYkj4MM2E/STCZmkKRY+aRqgGdnQos/a6Qd6TbJ1jahTkq7xGt1gorjR679Lwq8gkBve3Il8HBLCmcDAJGhB9RRZHIlXez2UtMZfWNQK8PdvYnBp6xginO/Go0haZkH7BueeRN3AOVTZXT+TFyAy+AOQqMCjkauvwmU9SNldhxRt78oYxM70kdTYIi56f37dUbmmQtAYKXCYhqOSXw29R2ovaZZ7zK+NJ+aU8xM/8SKXyfVR+Rty5lsk7oczsTWVxpfEIKlIUBjkWOv1D2V5Mk70N4LnjRVs7XsKkrVGCCh1Wco8yy3z9RDEJUofX79zMogLWuOubM1M0Gajge1ss/LQncvgG6MBPpedBSimzQD4bFYzKa3hrIfGzVdzEVI94QiqDyr2sXzrTcIiV3sOxaOr2vIn1yFo1Zs2iUwTFl7d0bmI3ZWtkguz/TD7FbT/87TekrUQkDFaWWZJlMpnXoN+EuqaShnUK3kamljW5XjTHMuEP5uAuRN5gCSNONViB52hy8NkqjeoSKrr/ncMGnGyTJ0XphVnT5XoF/IdrD/qfCuNPD0rkXYK3IBGlV2Nhhnf6T5GULiQ6eLBT3uKF5xvQgk8HK3rFmWGWcBPOg91Jn6t8VVo2QHpMZt1ouwwqiONKcE2fhMMiyl52NaICgG6wuTpY34VUsW6z0p83zluYsySNvyjcgwtMpyS6phMOpAhGuwW3bndrkRKdV/hNRI+u1wI67rTimBKg+mccF7zY18e+NkZOEX5TAqEsG+55epQG8XRZvn8vQ5r/5HWk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84139ae-0c84-420b-1eb0-08dbb0b2a522
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 21:29:12.3971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2M22MCjDuO9nDaRhgfknsUI0vWDC/YFGKhuOn5aZ21WUvtW6P/IiW9YPGSnRoUd2v1yln5jPhjQtqHs6i75OzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309080196
X-Proofpoint-GUID: z7JhoBqssCh2oFoTnQWXHoN0pAdQDB-4
X-Proofpoint-ORIG-GUID: z7JhoBqssCh2oFoTnQWXHoN0pAdQDB-4

DQoNCj4gT24gU2VwIDgsIDIwMjMsIGF0IDM6NDUgUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xv
QHVtaWNoLmVkdT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDEwOjA14oCv
QU0gQ2h1Y2sgTGV2ZXIgPGNlbEBrZXJuZWwub3JnPiB3cm90ZToNCj4+IA0KPj4gSSd2ZSBiZWVu
IGNvbGxlY3RpbmcgYSBmZXcgcGF0Y2hlcyBmb3IgMC4xMC4gSGVyZSB0aGV5IGFyZSBmb3INCj4+
IHJldmlldy4gVGhlcmUgYXJlIHR3byB0aGF0IGFyZSBjb250cm92ZXJzaWFsOg0KPj4gDQo+PiAt
ICJ0bHNoZDogUmV2ZXJ0IGI1ODZmN2Q5Nzc5NSINCj4gDQo+IElzIHRoZXJlIHNvbWV3aGVyZSB3
ZSBkb2N1bWVudCB0aGUgcmVxdWlyZW1lbnQgZm9yIHRoZSBjZXJ0aWZpY2F0ZSAoaWUNCj4gdGhh
dCBzZXJ2ZXIncyBJUCBhZGRyZXNzIE1VU1QgYmUgcHJlc2VudCBpbiB0aGUgY2VydCk/DQoNClNv
IGZhciB0aGVyZSdzIG5vdGhpbmcgdGhhdCBkb2N1bWVudHMgd2hhdCBnb2VzIGludG8gYQ0KdGxz
aGQgY2VydC4gVGhhdCdzIGEgdG8tZG8uDQoNCkFsc28sIHRoZXJlJ3Mgbm8gTVVTVC4gVGhlIGN1
cnJlbnQgc2VydmVyIGNlcnRzIHdvcmsganVzdA0KZmluZSB3aGVuIG1vdW50aW5nIGJ5IGhvc3Ru
YW1lLg0KDQoNCj4gSSd2ZSBiZWVuIHN0cnVnZ2xpbmcgdHJ5aW5nIHRvIHByb2R1Y2UgYSBjZXJ0
aWZpY2F0ZSB3aXRoIGEgc3ViamVjdA0KPiBhbHRlcm5hdGl2ZSBuYW1lIGluIGl0Lg0KDQpJdCdz
IGFjdHVhbGx5IHByZXR0eSBzdGFuZGFyZCBzdHVmZi4gVW5mb3J0dW5hdGVseSB0aGVyZQ0KYXJl
IGEgZmV3IGRpZmZlcmVudCB3YXlzIHRvIGRvIGl0LCBhbmQgZXZlcnkgeC41MDkgdG9vbA0KY2hh
aW4gdXNlcyBhIGRpZmZlcmVudCBzeW50YXguIEFsbCBvZiB0aGlzIGlzIHVud2llbGR5LA0KYW5k
IGl0IHRvb2sgbWUgc29tZSB0aW1lIHRvIGZpZ3VyZSBpdCBvdXQuDQoNClRoZSB0d28tc3RlcCBh
cHByb2FjaCB3aXRoIG9wZW5zc2w6DQoNCjEuIFlvdSBjcmVhdGUgYSBjZXJ0aWZpY2F0ZSByZXF1
ZXN0Og0KDQokIG9wZW5zc2wgcmVxIC1uZXcgLWtleSBwcml2YXRlLmtleSAtb3V0IC90bXAvaG9z
dC5jc3IgXA0KICAtYWRkZXh0ICJzdWJqZWN0QWx0TmFtZSA9IEROUzpmdWxseS5xdWFsaWZpZWQu
ZG9tYWluLm5hbWUsIElQOmEuYi5jLmQiDQoNCiJmdWxseS5xdWFsaWZpZWQuZG9tYWluLm5hbWUi
IGlzIHRoZSBGUUROIG9mIHlvdXIgTkZTIHNlcnZlciwNCmFuZCAiYS5iLmMuZCIgaXMgdGhlIHNl
cnZlcidzIElQIGFkZHJlc3MuIFlvdSBjYW4gYWRkIG1vcmUNCnRoYW4gb25lIG9mIGVhY2ggdG8g
dGhpcyBsaXN0Lg0KDQpUaGUgbW9yZSB0eXBpY2FsIHdheSBvZiBkZWFsaW5nIHdpdGggdGhhdCBs
aXN0IGlzIHRvIHB1dCBpdA0KaW4gYSBjb25maWcgZmlsZSwgYW5kIHRoZW4gcHV0IHRoYXQgZmls
ZSBvbiB0aGUgY29tbWFuZCBsaW5lLg0KDQoNCjIuIFRoZW4gdGhlIENBIGNyZWF0ZXMgdGhlIGNl
cnRpZmljYXRlOg0KDQokIG9wZW5zc2wgeDUwOSAtcmVxIC1pbiAvdG1wL2hvc3QuY3NyIFwNCiAg
LXBhc3NpbiBmaWxlOm15cGFzcy5lbmMgXA0KICAtQ0EgaW50ZXJtZWRpYXRlL2NlcnRzL2NhLWNo
YWluLWJ1bmRsZS5jZXJ0LnBlbSBcDQogIC1DQWtleSBpbnRlcm1lZGlhdGUvcHJpdmF0ZS9pbnRl
cm1lZGlhdGUuY2FrZXkucGVtIFwNCiAgLW91dCAvZXRjL3BraS90bHMvY2VydHMvcnBjLnBlbSBc
DQogIC1DQWNyZWF0ZXNlcmlhbCBcDQogIC1jb3B5X2V4dGVuc2lvbnMgY29weWFsbCBcDQogIC1k
YXlzIDM2NTAgLXNoYTI1Ng0KDQoNCkkgaGF2ZSBub3QgdHJpZWQgY3JlYXRpbmcgYSBzZWxmLXNp
Z25lZCBjZXJ0aWZpY2F0ZSB3aXRoDQphIFNBTiwgYnV0IEkgaGF2ZSBubyByZWFzb24gdG8gYmVs
aWV2ZSB0aGF0J3MgaW1wb3NzaWJsZS4NCg0KDQo+PiAgVGhpcyBvbmUgcmVtb3ZlcyB0aGUgcmV2
ZXJzZSBETlMgcXVlcnkgZG9uZSB0byBtYWtlIFNOSSB3b3JrIGZvcg0KPj4gIG1vdW50aW5nIHNl
cnZlcnMgYnkgSVAgYWRkcmVzcy4gVGhpcyBxdWVyeSB3YXMgbm90aWNlZCBkdXJpbmcNCj4+ICBz
ZWN1cml0eSByZXZpZXcgYXMgYSBwcm9ibGVtLiBJbnN0ZWFkIG9mIGEgcmV2ZXJzZSBxdWVyeSwg
c2VydmVyDQo+PiAgY2VydGlmaWNhdGVzIGNhbiBsaXN0IHRoZWlyIElQIGFkZHJlc3NlcyBpbiB0
aGUgc3ViamVjdEFsdE5hbWUNCj4+ICBmaWVsZC4NCj4gDQo+IEknbSBzdGlsbCB1bmNsZWFyIHdo
YXQgdGhlIHJlYWwgaXNzdWUgaGVyZS4gSXMgdGhlIG9iamVjdCB0aGF0IGlmIHdlDQo+IGFyZSBt
b3VudGluZyBieSBJUCB0aGVuIHRvIGNyZWF0ZSB0aGUgU05JLCB0aGUgY2xpZW50IG5lZWRzIHRv
IGRvIGENCj4gcmV2ZXJzZSBsb29rdXAgYW5kIHRoYXQncyBub3Qgc2VjdXJlPw0KDQpBbnkgZGVw
ZW5kZW5jZSBvbiBETlMgZHVyaW5nIHRoZSBjZXJ0aWZpY2F0ZSB2ZXJpZmljYXRpb24NCnByb2Nl
c3MgaXMgY29uc2lkZXJlZCBhIHNlY3VyaXR5IGV4cG9zdXJlLg0KDQoNCj4gU28gd2h5IG5vdCBq
dXN0IG5vdCB1c2UgdGhlIFNOSSBpbiB0aGF0IGNhc2UuDQoNClRvIHVzZSBTTkksIHRoZSBjbGll
bnQgd2lsbCBuZWVkIHRoZSBzZXJ2ZXIncyBob3N0bmFtZS4NCkhvdyBkb2VzIGl0IGdldCBpdD8N
Cg0KVGhlIEROUyByZXZlcnNlIHF1ZXJ5IGlzIHdoYXQgL2VuYWJsZXMvIFNOSSBvbiB0aGUgY2xp
ZW50DQp3aGVuIG1vdW50aW5nIGJ5IElQLiBCdXQgaXQncyB3cm9uZyB0byBkbyB0aGF0IHdpdGgg
YQ0KRE5TLWFjcXVpcmVkIGhvc3RuYW1lLCBhY2NvcmRpbmcgdG8gZXZlcnkgc2VjdXJpdHkgcGVy
c29uDQpJIHNwb2tlIHdpdGguDQoNCg0KPiBJdCdzIGFuIG9wdGlvbi4gU05JIGlzIHN1cHBvc2Vk
IHRvIGJlIGhlbHAgZm9yIHRoZQ0KPiBzZXJ2ZXIuIE5vdyB3aGVuIE5GUyBjbGllbnQgbW91bnRz
IGJ5IElQIGl0J3MgdW5saWtlbHkgaXQncyB0YWxraW5nIHRvDQo+IGFuIE5GUyBzZXJ2ZXIgdGhh
dCdzIHNlcnZpY2luZyBtdWx0aXBsZSBkb21haW5zIChmb3Igd2hpY2ggaXQgbmVlZHMgdG8NCj4g
YmUgcGljayBhIGNlcnRpZmljYXRlIGZvcikuDQo+IA0KPiBJZiB3ZSBhcmUgbW91bnRpbmcgYnkg
SVAgZG9uJ3QgZG8gU05JIGJ1dCBkb24ndCByZXF1aXJlIGNlcnRpZmljYXRlIHRvDQo+IGhhdmUg
dGhlIElQIGluIGl0J3Mgc3ViamVjdEFsdE5hbWUuDQo+IA0KPiBJIGN1cnJlbnRseSBzcGVudCBv
dmVyIGFuIGhvdXIgYW5kIEkgc3RpbGwgY2FuJ3QgZmlndXJlIG91dCBob3cgdG8NCj4gY3JlYXRl
IGEgY2VydGlmaWNhdGUgd2l0aCBvcGVuc3NsIHdpdGggYSBzdWJqZWN0YWx0bmFtZS4gb2sgcGVy
aGFwcyBpdA0KPiBzcGVha3MgdG8gbXkgb3duIGFiaWxpdGllcyBidXQgSSBkaWRuJ3QgdGhpbmsg
SSB3YXMgdGhhdCBiYWQuDQoNClRyeSBhIGRpZmZlcmVudCB0b29sIGNoYWluLCBtYXliZT8gPHNo
cnVnPg0KDQpJIGZpbmQgb3BlbnNzbCB0byBiZSBhIFN3aXNzIGFybXkga25pZmUuIExpa2UgZ2l0
LCBpdCdzDQpuZWFybHkgaW1wb3NzaWJsZSB0byB1c2Ugd2l0aG91dCBzb21lIGtpbmQgb2YgcG9y
Y2VsYWluDQphbmQgYSBnb29kIGNoYWlubWFpbCBnbG92ZS4NCg0KDQo+IEkgc3RpbGwgYmVsaWV2
ZSByZXF1aXJpbmcgSVAgaW4gdGhlIGNlcnQgaXMgbm90IGEgZ29vZCBhcHByb2FjaC4NCg0KRnJv
bSB3aGF0IEkgY2FuIHRlbGwgZnJvbSBteSBjb252ZXJzYXRpb25zIHdpdGggc2VjdXJpdHkNCmZv
bGtzIGFuZCBmcm9tIGxvb2tpbmcgYXQgeC41MDktcmVsYXRlZCB3ZWIgYXJ0aWNsZXMsIHRoaXMN
CmlzIHRoZSBjb3JyZWN0IGFuZCBwcmVmZXJyZWQgYXBwcm9hY2gsIGFuZCB0aGUgRE5TIHJldmVy
c2UNCnF1ZXJ5IG1lY2hhbmlzbSBoYXMgdG8gYmUgcmV2ZXJ0ZWQuDQoNCkRvIHlvdSBoYXZlIGEg
cHJvcG9zYWwgZm9yIGEgcmVwbGFjZW1lbnQ/IElmIHdlIGRvY3VtZW50DQoob3IgcHJvdmlkZSBh
IHNjcmlwdCBmb3IpIGEgcmVjaXBlIGZvciBjcmVhdGluZyBzZXJ2ZXINCmNlcnRpZmljYXRlcyB3
aXRoIGEgU0FOLCB3aGF0IG9wZXJhdGlvbmFsIGRpZmZlcmVuY2Ugd2lsbA0KaXQgbWFrZT8NCg0K
DQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
