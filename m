Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DE3B784
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Sep 2023 14:59:21 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38JE7GbZ002654
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Sep 2023 14:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=DLUFXvhPpUcMK7YRP4XJu0YXbdJ1d40W709WrjQw53o=;
 b=Vs1a6TxXb1HY6d85d2a2SWX0O8FCqPr+hucZtHt1791oJFcemfXf08pWWl4NSDvXOV4m
 76haji8tIMVCMdQ5AfWREOGuBnhPp00F9Jv0HTN+Jkro5UQdFCY6iukkA/0dzV6he+LY
 1Uf7UBHjuJNHZUMlKQV9btDbf9rXxYAz3uYecDLYctJHRk+CxvNvW8KogaGl8qdcPrLu
 YXttzM8b2FireKYrXDIjtJW5G3L5Y0+Pkcgepiab/dWD6S/JLKuZvp617eoDgBfS4ta8
 d7yLsyQ7rMlISPTMXSQzLJfkkdmj3On5NMuxvXZ8W72tW3Nfi32anx4ju9tH5ariW2m/ rg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t548bd1gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Sep 2023 14:59:15 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38JDeqbp002129
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Sep 2023 14:59:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t52t5h634-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Sep 2023 14:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCZRvTFm13yNXZQm7k61ZZNKvR5idJNqIMuvSVwlGLoRr7WAph79yDU+hxqK/Cy91chTKnw6zYI+/DlmCDXTbHIiL/GDdlFcb2+AMTZOUtHeiQxyTc/K5oI807SVeFg1PzIKA46lE46wum1XZPQfJ4iEvsARMslu44IbDxY/J5AiqJmO6yBKttL7AuUuwL5lSIdbRRb+7zrMt+BILJIyFyF3xcQxC9gyktYvzPuoRpMEL9GD2Hk2jvawPWEm4SHATZF+IEZ4OM0Gg10fdabo/EMi01JsY01ZfPZyEOyqpyQoOMX1OyMdYMh89QFz5HCtaskdEVfqmu8/F5L9H7eX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLUFXvhPpUcMK7YRP4XJu0YXbdJ1d40W709WrjQw53o=;
 b=WYVsxMLCXyw4UKY5G6J+rfpcFfUagL1iTUUFsvg2YCSbs0zm4W9YQD5DKzIctu1+DkGRAc7tRVRCOdrgAv5NVCJ0/OEVi38DCHf1CfiYQBkuaB7c2bK11xy8pcRL369CyoVFrzKe5AwkYx/en02ZKYeo25qPqRV5EqKKXXuiQDRuApI4BE7AFbzoqfYm7VimxM5j5qPT7Zz4kvZ7jVtfxBCVYP0Exe4aNqVdUREt1Zjj2x0jDuzfAnIfBCj2FBGHYUJArMjsQcGX4eyV9kTU9G4oi998lxe7OWH6uXZMbfP63qXQhSxftqnpQ4VDNOtwSJ+UJ1DU7UkPSvIC2Q/dZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLUFXvhPpUcMK7YRP4XJu0YXbdJ1d40W709WrjQw53o=;
 b=PI6BwqZGXavF/3VLHpvYKsVs4UOPOQbMVNvfDjY7YJ/DrNRMaU6EkDf9ATfxVSV4+6+x47hzGyNUKeozw2Fveq9dVcHhHwFWZZkqPo+78o0xZFWai8DBR6AVwYfiXCfSZtrCfjWC45rcjRqYE+Z/sd7CjEJmaCfozyIPwpdjP4o=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5026.namprd10.prod.outlook.com (2603:10b6:208:322::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:59:12 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:59:12 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZ6jbQbitlX5TA4USQcnf7UIFmLLAg2IsAgAFmrYA=
Date: Tue, 19 Sep 2023 14:59:12 +0000
Message-ID: <B3563F33-FABE-4D71-86C8-7E96E0DDDBF7@oracle.com>
References: <C1CF4349-635C-4BD4-A0C4-7811E23A179B@oracle.com>
 <08cae189-0697-428f-a2e8-27ffd95c32e2@suse.de>
In-Reply-To: <08cae189-0697-428f-a2e8-27ffd95c32e2@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB5026:EE_
x-ms-office365-filtering-correlation-id: f68f7fc8-f9d8-4bed-bfb5-08dbb920fc15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Cput/C0Km+tahb/qE9L3ukY+3GXeW9jpJ/lf/uRH3nGTbs3VvIWatXJb995eTxIdWxhlo0QvYYGy5kwIijTt1ak7q2QnsYzcD0yy9Y9WvQu6T84w/0KMHy/pGNh+PNKjwdBTsHFctMlOnAAjRw3vUMILqek8x0ABrb7ppL6DCVMzACj2FWXcsx2otWvQdPEXLOao6zzyqERL3o2W10VLVk1C9ieEhiWL4PV9wvaC1uuBqSM5mgzWcqWJQhmO4ts+H3Q4URYxgWV4RokJ9IMOGxb+zoanT4R8RmQT/WK2PrBcrlEltBqmXPo1yNBYUbqlDX/5quE6gooY/FtyTJ3S/mMWQrH6lozcNUb3zrXTPmMGhMDCZlp/7yXkuVHVMkZO+0v6v2diyaRgiZYmaxOZG9mnVj2tDEnOTdg/kTyJMo1AYI07xJ3DY8W8m/HBFXTRaBq4qx1Ld/za4PXs4fuHE7XJ6lopf3AUnQhCiqDQR7IR8UUj7q/DTWoDSvruOPQgIAb1y8sCgaov+05hsGPwA6Hndpu99ScSoXwEfb6jq0vGlGtmyZs8qNtBkI5UT5z4jgEJrqiorzGsr2HNjt1oz5LHzWjiauDZj5z43h5QpDsnwt0A9b/QYYKbKbw/goheJG5aTgxn/U/3KUFq1V5U2Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(26005)(2616005)(83380400001)(6916009)(64756008)(66946007)(5660300002)(76116006)(316002)(66476007)(66556008)(66446008)(91956017)(8936002)(8676002)(41300700001)(2906002)(86362001)(38070700005)(38100700002)(478600001)(33656002)(966005)(36756003)(6486002)(6506007)(6512007)(122000001)(53546011)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dm1kS0s3bTdZOUpDN0pENHl0Tmt2eUlXY2orUXBsamk0enROZnlKeURyOEZN?=
 =?utf-8?B?NmZ6TzZ1aytiLzJsN0ZmdFFCcm1JVE92VHkrb2NHbU5FWnUrSHpoM01Cd3F3?=
 =?utf-8?B?REExS0xOOFRDTDVTS1hUVGxKb0xnaC80TWlvSkFncEcvLy9TM3VXVld0T01k?=
 =?utf-8?B?Q0JMMCtDQi92UDIzVklScWdNNDF5WjNPbUNiQUc0STZ1UDRaYlUyQWluNVFz?=
 =?utf-8?B?UFd0L0Y2d3FtMXNKR0VoVjJ2NzlTTThvYUpuSGY0eDhkNURrSjljVHprNm5y?=
 =?utf-8?B?cFg3bW5NaVRZUE9vb3psMVlHc2FyR0doZUgyWnhNb2UzTTE3SWN2UkUvZHN6?=
 =?utf-8?B?TktVTURQZkEyNmNoSmZjRmlBNmo3akxvcldleFlHNkh3N05tOWlPSUF3a3dz?=
 =?utf-8?B?d1gyVjdCMmFvcEtSeXExNEh6cUc2V1ZzTkgvVEsweVpwaFZDWEdORDZORjBL?=
 =?utf-8?B?MTVpRkYwNjR6SlZka3RjNStYd1hkc2xJN2tSVVBoVlhjNWtWZnkweCtDb1Y3?=
 =?utf-8?B?L21OdFAzdjFSdXBBMUFhaWVQUWN0V1lPV2pNSWxITCtsalpVUnRUemZQOTd6?=
 =?utf-8?B?c2JtekRseEovSmI2anFBWVZEdU4vNyszU0Y2QisvYVZmR3dYajNaMHk0ajVI?=
 =?utf-8?B?V0VoM2hVSkEvT0svSk9ESTRtam9YL2cwaWJKY0lPa0lsK09hZ2lmMGV0YzRK?=
 =?utf-8?B?OHhRcFNnb01JNmtRaDBMTGFZbUZlcmJ5YVRPTVNHZjVpVGtNcXpnWi9nb3R4?=
 =?utf-8?B?WWFtT2pjaTVIU3lHTmhKTnErUFRYdXFhVDBzZHJzK1puR2tTcE94dVgxNm1K?=
 =?utf-8?B?WklVb2p5WUVOTTFETStYMGhpVlJuNldkY2dCakpkRWVWTEw4dHd2NCtJdlhv?=
 =?utf-8?B?QmoxcnFnbCtaVWZmZm1jeFJsSkFVYUZ2ekY1NXJhMFN0Sk9ySDN5M3FyYWZh?=
 =?utf-8?B?Z2o1UVJpMjlCMVpyaTJlYXY0K2NKbW1XNVUzYTBuZ1I2a2V1OEN3cVlYYXFp?=
 =?utf-8?B?R2FIcWVYSG1Hb0FVN3RDWmlEdGJyMDBCQnJrc29Idy83Q0RiOWY5Z0hMSTJX?=
 =?utf-8?B?TEVoN1JsMG1FZnYxNEVpQWg5YVBVUFJxVmFZamo2QmNJYTNqL0VLTGNZYU44?=
 =?utf-8?B?dkRQSUtya0NDVFNqM1BXaHFKT3YzWnhHUXNXRDh4aVQxUS8zblQ4MjI3L0hV?=
 =?utf-8?B?SFJ3NitmeU9rak5mOHo0d0xYUFdqb1RjRWFBcGZzNmZjSmxESlI4Y0R4RHVu?=
 =?utf-8?B?MXJIcDBTN1A3b3RkcWk0UkpOYmpuNDhheEEyM1ZKbjVNTjZHaUM5ZDl2ZUM2?=
 =?utf-8?B?dVhmemtqRGVUT3dPY0VnQmtGMmd1VGhPUWpmdFZBZDc1TjVzbGZlb3NyWTBB?=
 =?utf-8?B?ZEpJd1FsMVBxZW96OEhNUlZ3ZEpzYndUclo0MkkxQkEwR1Bjc1dUeDdpZEsy?=
 =?utf-8?B?RFpadmlOK2N0bGk0clNoK1Jwei9pYzJqN0N3UGFqcWVkMkxMOGk1bm5jb2ZJ?=
 =?utf-8?B?MWpYK3k1eVB6M0JCTWZSeXZ3TG55ODBZY2ZOc0tBK25QV2NGOUdOMXQ0eG1W?=
 =?utf-8?B?ZGtiR2RmcGZsVHhsVGU3M3g4Y0FSUFRid1hBbzhReTluMnh2d1dKMHNZc2sy?=
 =?utf-8?B?bW5KYkM0eGdwcEJuNElZd0IzSHVXbXRaSFQzOGhkUmxTNXFpaFVvVU5ucGIz?=
 =?utf-8?B?cmphbVJqS1BVZjQyNXV2ckE0UzJVeHFtNW1JY0VVZUhoeUtQYVRMemFtdGR6?=
 =?utf-8?B?Ukt1bm9hc2lBUTJmUnZ2bzU2SlBadVE3WW5zaitFampJdUEwZlFlTnhNYmVL?=
 =?utf-8?B?MkVxeWwrVWFDbzF5RGJraWF5M00rN1UxM2JjNTZaZHA2V1Bzc1cwaG4xRU1E?=
 =?utf-8?B?YXF6NXlmMWF1eWVSVkdmQXpqaUlVb1JMRG95ZU1kOUtlbDBSWVIzRnIyUklT?=
 =?utf-8?B?Y0Y1YkxRSVNOUHdESStRUitKSUVJQnlJcmZZVWtFUjF0bk9YWUZsd2lqZENJ?=
 =?utf-8?B?ejJqZ0ZnTnFtd3ZCbnc3NlJUNzhYblhFWFJqK2w0MEFEcVBsczRmbi9nQ2Ro?=
 =?utf-8?B?eERFTkdnNFNjRWlQWkhIRmV3ZmozbzhWRGttamJQZlpmUkZEZU5qYjM5VUdo?=
 =?utf-8?B?eDJCbEdBRi9qekFiYWpabmpraGpFaDNCalRlVmcrVWd3RHJFTjFwSXRwRFdq?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1B92A5C3753BF49AC3BD55082A1CCB5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wFpE5NvSey4t/zQkeXHMZawm5YBt/9+t5El+etdLsMmwS0s6XszqgSK3h7Vyon19tIkZDQEZYMoT0KDfh91aL6+Cq/Mt/KVc5OTEAGSCUvCuFUMZvgHdVGO/Q80XT/ZB0er1LewtWYrCZpUXrqbgiLbk1KH4Pqte9XNkcfcIIjtsudD2P6KdTLNVYYBVEdd95Aj9q/RYhkyOLTG4eTDcXYvbWqS3CFofp+sHOPBP1DXPIgW6yRQdy2gCiZcHjBNSvm3Av4JZZRjkeAcqhhM4+i5rwdndl/w4f6k2MdaDCISJAKskv0c46I+L5Qc66lnhh5DMMbZha7En0QiTEQ0gnn8LT1dsIX+PLb2TfRVmv6CUy8IlfcVvsNrDfLNo2yW0A3xKotyK82i9nYEEZINt02WuNSzcA/b+QM1QsB8Rf8AJM0/nrCqhI2jvgoktd5WuiwAgcXawFq2ofSlJLUubVEfEW5rmxH90athJ5BknCWk+ZlabQo/FFSKMlQcBXkG9AvhjZvw2aqr8xthHzjQfASydY4bJgEnPt5rtaAv0KRoqBYOjygXxFa96Z3glUs9OmsxXgs5vbfHIKCZl6oepW+FKgL19ddVj8wr4dZsCHsB8DMIwF54MnB3p9RqQjAbGPSK4g9xcHBSaFzNojnC39bjinZpv0OJSn+LYuWb7+SdYlBmChktSSENa8fzothA4b/UIDZIlHz0tW8w9wrpU1LjvEpKKFLEW6uGEcsNaoDuPhuw28fZbWdOuX9nwiIPatdNiVoA0GxoyYggNzENUaw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68f7fc8-f9d8-4bed-bfb5-08dbb920fc15
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 14:59:12.2144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22yVigOij42NzpRWla3O6xmVlZZYVQiX6dJxoa4nlwcJ8lCK/5vp7mh2wIUSrGnF1tXWxBUdvHwRC31vRXKJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5026
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190129
X-Proofpoint-GUID: g6R1OnPscGnKlRhyfFPwFn72S0wSiDCz
X-Proofpoint-ORIG-GUID: g6R1OnPscGnKlRhyfFPwFn72S0wSiDCz

DQoNCj4gT24gU2VwIDE4LCAyMDIzLCBhdCAxOjM1IFBNLCBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBPbiA5LzE4LzIzIDE1OjQ4LCBDaHVjayBMZXZlciBJSUkg
d3JvdGU6DQo+PiBIZXJlJ3MgeW91ciBmcmllbmRseSByZW1pbmRlciB0aGF0IHRoZSBpbi1rZXJu
ZWwgVExTIHRhc2sgZm9yY2UNCj4+IG1lZXRpbmcgd2lsbCBiZSBoZWxkIHRvbW9ycm93LCBUdWVz
ZGF5LCBTZXB0ZW1iZXIgMTkgYXQgMTA6MzANCj4+IFVTL0Vhc3Rlcm4uIFRoZSBab29tIGNvLW9y
ZGluYXRlcyBhcmU6DQo+PiBTaW5nbGUgY2xpY2sgVVJMIHRvIGpvaW4gWm9vbTogaHR0cHM6Ly9v
cmFjbGUuem9vbS51cy9qLzk3NDU1MzgxMjYzP3B3ZD1SMFJ2WTBSUlJuSkdaVVZKYjFkTUsyTkJk
VVJYWnowOQ0KPj4gTWVldGluZyBJRDogOTc0IDU1MzggMTI2Mw0KPj4gUGFzc3dvcmQ6IDg2ODc1
NzI0DQo+PiBQb3NzaWJsZSBhZ2VuZGEgdG9waWNzIGluY2x1ZGU6DQo+PiDigKIga3Rscy11dGls
cyAwLjEwIG5leHQgc3RlcHMNCj4+IOKAoiBQb3RlbnRpYWwgbG9jYXRpb25zIGZvciB4LjUwOSBj
ZXJ0aWZpY2F0ZSByZWNpcGVzDQo+PiDigKIgUGF0Y2hlcyBmb3Iga1RMUyBzdXBwb3J0IGZvciBy
ZS1rZXk6DQo+PiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2L2NvdmVyLjE2OTE1
ODQwNzQuZ2l0LnNkQHF1ZWFzeXNuYWlsLm5ldC8NCj4+IEJyaW5nIHlvdXIgZmF2b3JpdGUgaG90
IChvciBhZHVsdCkgYmV2ZXJhZ2UuDQo+IE1pZ2h0IGJlIGEgdGFkIHRyaWNreSwgd2hhdCB3aXRo
IG1lIGJlaW5nIGluIEJpbGJhbyBhdCB0aGUgT3BlbiBTb3VyY2UgU3VtbWl0LiBCdXQgSSBzZWUg
d2hhdCBJIGNhbiBkby4NCg0KV2UgZ290IHRocm91Z2ggdGhpcyBhZ2VuZGEgaW4gMzAgbWludXRl
cy4NCg0KSmVmZiBhc2tlZCBpZiB3ZSBuZWVkIHRvIGNvbnRpbnVlIHJlZ3VsYXIgWm9vbSBtZWV0
aW5ncyBub3cgdGhhdA0Kd2UgaGF2ZSBhIG1haWxpbmcgbGlzdCwgYW4gb2ZmaWNpYWwga3Rscy11
dGlscyByZXBvLCBhbmQgdGhlDQprZXJuZWwgaGFuZHNoYWtlIGNvbXBvbmVudCBpcyB1cHN0cmVh
bS4gTm9uZSBvZiB1cyBjb3VsZCB0aGluaw0Kb2YgYSBuZWVkIHRvIGNvbnRpbnVlIG1lZXRpbmcg
cmVndWxhcmx5Lg0KDQpTbyB0aGlzIHJlZ3VsYXIgbWVldGluZyB3aWxsIGJlIGNhbmNlbGVkLCB1
bmxlc3Mgc29tZW9uZSBoZXJlDQpjYW4gdGhpbmsgb2YgYSByZWFzb24gdG8ga2VlcCBpdC4NCg0K
TWVhbndoaWxlIHdlIGNhbiBzZXQgdXAgb25lLW9mZiBab29tIGNhbGxzIG9yIG1lZXQgYXQgY29u
ZmVyZW5jZXMNCmlmIGYyZiBpbnRlcmFjdGlvbiBpcyBuZWNlc3NhcnkuDQoNCg0KLS0NCkNodWNr
IExldmVyDQoNCg0K
