Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A13BA45
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:14:02 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HAndkK020316
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=zWSHWepxTgDpjH2kQZSvvXyKOrx28gbDWJBh4qHlkVs=;
 b=EFaS/LW4JrlZPyqXhfBfmBNCNWU/RWmyoVQHNznonr5mDQ8gSXNPIUiyW2GUhdPPw3V8
 KpnufTn1qgIoGsq5qs7lNF2ps6nvqkFjtfdFDQISVaUjT4V0tQ9SPh4eI136PKk+pec/
 whBxUvZsMj4XXTAmfH9ltQYqI/JWkgZYx9NAQYOG2QNmlpM3vpb2o43bBPexsq9OP5gV
 tLKDb/MteqM+kMgAK6yXpuzB6jsDCXrdovIg8QebnxaqEUfsf6PUM/Wo4lx0C6HR8QB9
 iK4BvtxViPEx8zil3OsaJWKbBCDkDpYr8NH2SnimDgoMPebiLMjayU4JD9Tg6JhqMR3F Kw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3run8a2sw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:14:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36HDF7Ra000832
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:14:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ruhw3q0xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Jul 2023 14:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBHAXKNS0bVFwsN4xtwUdOE3dU17i/IVljQ+u6PoQs7eLmh3EWF0yCjh3DyWkvTMW21whZw6f9lrtIGfj52HgS2engwG2IVUtxQN9yvQJTS9H0zpU745k/IvA3XmXY5fwXYFosS2oaLNc/P49L1Mrqg6HyBtmCH2jD7fA59fHZPmhSW4u5N4zeF8xj/43VLrgh0RztZ9PtGesrkI+s1aqEBWbJ3/ZHQvyTv5T8zJtdQcPMwIwK/0ucGQSoavQgiWYGe5f6izXTaD6HYBmNZ3n3uGsR11hbKz4Ws0EDdEdouaHEHrsxJ7YFe/b3HjGqEBqvaHmFMg+zk1Qm2iCvhdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWSHWepxTgDpjH2kQZSvvXyKOrx28gbDWJBh4qHlkVs=;
 b=CkftuzLwj5HkvvgROvbd/BCgaJirW65L+K2RN7IGpx9L7RvqltsnREhQxcd9jbBkt9VR8gW9Nma+dnseXKondUlC7dQXxFszC3ISdv2QwgQlWjZYUaJYdYrFwM6d+N/FzwKOF5rexmZJoEnUd2KOgKWAXx3FGqORs9jhdmAYnnHd76SGHZ+MR+r7fomZd0nHbrpjn4kjWB8frK7kNUglbmNGKn4baZTw738WTRwSgTgJ8tHGsagBaizWrJFEdS6sb3uRYb4dDyQEog7GGp6QT5ATnMzKruqb1NTFYm1Y7uDpm3++3B8i2fFy/TjvZ541PebKesUL9nKvmJKYz9EO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWSHWepxTgDpjH2kQZSvvXyKOrx28gbDWJBh4qHlkVs=;
 b=WIFU5ChLRU+DsUT6n92H0UDFw6iOOS0i2MgHkbJOQqLZ9hgS//9+oMcU5e+JClEUgsBw7TD6znd+AL0z+d1Yeqz1/p0ybTMhpW2NUsK7eKTHfNmZo7hod7VvreOgGtLr+gFvuHYuVdcPb21ZzI0VwPprZf726xP5qD+P8D5oo/4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 14:13:57 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:13:57 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZuLjtdOUnZjEqcEWP3omL6lEY7w==
Date: Mon, 17 Jul 2023 14:13:57 +0000
Message-ID: <1BE3873B-B293-42D4-8E13-BB5273A747CE@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6506:EE_
x-ms-office365-filtering-correlation-id: cde4c95a-eafc-4430-4918-08db86d00fb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3mtwVH05+UiI89m3bseTwtyUllu4+Q8yjDiR7YyccBxHzVLC9iMN9ODA8O0BpGl/gTkZIG+CXe2vIRMNARZCmw2Vwlre3AnKNXmm1HhatKZof4vuaFocBWarTwyg+wGFnyA+/Bn2vinGkY/xGdYWgpoKxxxBwfdW9Qrr3DPyxjnn76Cncf6cAxzd+XAiwGA3ndCswkQxLABh50gvreh1/SdNsbZGHzG0ZE7ob/V+jJnRk6WqhKQTY8Xzfcb+DhatkYGr9rDnmmMlL74EkgOFi4BITcaWDXeYk4jQ3/c51AHPVRTuQz0DDjTYiiGlg/M2rw63GKi8mNpdPF6VUXLVhMQ5Sx5sUlBvNQDmQZ+Kb6nUC/rFvP3ThnpIHPBvXQuYXBDYlE5egQhUz+def9xDfIyACN0BnGzZbl+jBSVkqlVIqm+bCsbH7aCFTHHldp5sXHL/nyWd//4ukMD2IiARrUfohNsa2u1ZjiFbUr3EitRXpJfvXbMSVR32dXfmGXVAF7GenA3FRRJkx5ukAH8E1gnvs7EMa18ZHstrVvhHPMadGVb6vwfFqX41gUahWVuqNbVv/+jvVSVwGmOWHuChig9rFSkrAkInQ6xu1rxpMeq/wTmvtHVCqhBF6RNt9+1HBFMBY7Nn/wkpm6p8+2a0XA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(2906002)(38100700002)(86362001)(6512007)(122000001)(83380400001)(2616005)(186003)(26005)(6506007)(38070700005)(966005)(33656002)(5660300002)(66556008)(36756003)(4744005)(8676002)(8936002)(478600001)(6486002)(71200400001)(316002)(41300700001)(66476007)(91956017)(6916009)(66446008)(64756008)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXY5UXd3MFppaFhMcE4yRmxXZnYxOUNOeFY3NWthK2lSUXNwV05OT2FxU04x?=
 =?utf-8?B?aURGZ0FkZFpSQytROHdqdllhN2JRaVpqUUY0b0RyU1hoZzFKaGFGcUV1c3R5?=
 =?utf-8?B?YWhiWHE4dmJvUEVpZWJIRXVxUlN6YkxYQWFvT0dtb1Jhb3N1eVFlMFJRU3Y3?=
 =?utf-8?B?V0lRNjBZRWQ3U1NWRURVY0VUVmNZbWNybUNoUWdvR3g2bnZ1eHdiakhhQmZr?=
 =?utf-8?B?b0lOOTZEWW5LenN2bytFdlFtTDRMTmM1b1ljbWlzbjVFa2FjYkk0a1l5bFFs?=
 =?utf-8?B?NHRBUHdsT2s2MldvdVlTTFFCc0hxQ04vT2xJZEpaY2ZYQUpWSXMxTzNRREVv?=
 =?utf-8?B?ZmV4OHFYcVo5Vmg3RkZ6T2padXlwdGI5UzkrcTUxQWNXL3EyM25IbXdhWlBF?=
 =?utf-8?B?L0M2RFFxb2NyTnNVMFJsOUYxaXBwcW1OMTdLOUY4MkZIdS9DZkdLTVRYcDNG?=
 =?utf-8?B?U1k0aGN2R0FCVDdzK2dNVnIzVC9sUTlpd29pVHczOVFTRFFBVkxVSEUrU1FR?=
 =?utf-8?B?SHVNSS9iMC94ZDk3d3YzWGRyWEJ5RVNyb3pnMVhJZ1ExU0gzNlI2VVN2RW9V?=
 =?utf-8?B?QVJvMXo4MDVRS3ZEbVRqNWEyendlRWtITkdSVkI2YUhkc2tpTFNpSWd6OE1j?=
 =?utf-8?B?VmtJNVJ0eFBHZmtVeVFZdVZGVTlIbisraWhValQ1bWpqSlhpMjAydnRhckFu?=
 =?utf-8?B?dG1ycnM4eklqSzVpR0F5RTZkQmZoNVRyVEtMbWJWQzY4VktETXlIei9LSyt0?=
 =?utf-8?B?ZldjTGVwZVR2Y2g5eFRNVElsRDdEWGZyNElvUEhlV24xTXpEbGRTNng4RXBs?=
 =?utf-8?B?am5sTjEwYWdFclQvZDZmOU0yUnpTaUtmZjhwSFVCWEQrYkxaOEp2UlZ1VWhP?=
 =?utf-8?B?amczd0haTmxEb1R2UlorMHpDMTkyVjJ3dUg2VExBdkY4SWh6MFc0dHVVc1g4?=
 =?utf-8?B?OGZyYUVtVXZ2VnA0TThaRFBDWnloSCthb3A0Q2VwU0RXZ2pnem5MbDJPOGRI?=
 =?utf-8?B?dmpibk1ESTBxaWpXY3ZLTERzZ0NTZitXb0IycDU5WGZOYnlJYnpvR29SdTBv?=
 =?utf-8?B?N2lkNjNUM0ZWWTRpVHFESVdaSkt5N205azJqTGNPV3VTNXhIUWZLcVhOTitG?=
 =?utf-8?B?b1ZkVEpvd1RzZ1BxYXU1M3hJdERRdElYWmp2VGtMaTJ0QU9YdzRRdVlZMTBK?=
 =?utf-8?B?ME5kNkRCZVBxeThMbUdKZTNXUlZ3SndMeU1iMWRrTWh0aExMSlhxQlN1WlAy?=
 =?utf-8?B?STdyMHZ1K2t0cW16THZhQXpxWmV0eml5VDJ2ZEovTUlLVDluMTdyZkJWQm04?=
 =?utf-8?B?TDFsMkcvcVRiYVFJVW9YUWs3eCtiNm5tL1YxencvSXRQbDNmR1RreTBEU2gw?=
 =?utf-8?B?NUhPLzk0Q0VvY2M0QzM4dmR4MHY0RllnQWduSTBaam5tWEkwaXBuUGQ3cndv?=
 =?utf-8?B?ZURJUXFoeUo3cEZuVXhQVzRtdDRYSHVKbmdYWFM1dHFtb0Y0eEhiU1BKOFhY?=
 =?utf-8?B?QStSL3hmZjJHeko4RGl4QU9rVUR0Vm1WWUJIRC9wa2pSZHBYYnV2aDlFc2FL?=
 =?utf-8?B?RFBBSXo5cXJURUZ1N3dydTlxbnpqOHhLRmhXcGRwUVZ5WExXYjA0aVNCV1BR?=
 =?utf-8?B?Z05HanNlQzd3SkF1TzVTbVNZY1BTR3BDSlAwMnppUVVWWTh0WDNpdVVsOE82?=
 =?utf-8?B?V3piOE1KQ1FCeDZGaGtSWlRnWm9rMDh5V1UxQVBaMDRyMlV4bEdIR2lMMTha?=
 =?utf-8?B?ZnV6Z2dpR0RXNFk1QldtbWc5WnJRTzFnUHVDcG1aRWF2OEhsMHhuNGY0SUpo?=
 =?utf-8?B?MW5PWllkM3B2dWNpNnpNQUc3UHh6b1JnWnd4Q0c3K3AzYW5LN0xwd2VQK0Rj?=
 =?utf-8?B?U2RhMzd6ZEVCcnI3SmQ4VzBiN1VMcFlpOTZpTjA0RkV5UUpiMndvZlJ2K1ox?=
 =?utf-8?B?V1AwM1Zybno5YmFib2dmd0IvSjJQMmc1NnFDQjZ1YW8zQzZON012R3NPWjI5?=
 =?utf-8?B?RmJ2TVlvZDFFS2RPRkt6K3BTYzZPYldLL005UFh0ZWs4cVV2aDBnak96bHZ0?=
 =?utf-8?B?eitnWUJZdjZHTjBESWh6MUpnY0Rrc2tDcXlSeEUxZTEreWtKMmlUNlNWZ3M5?=
 =?utf-8?B?M2pnUEM2RmpHMGd1bEU0d0dmNW1DWHFXVzArTkNmWDhWdHVTS2E1N2V0RFFU?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF836EED64FF5341B1AA0CCA459FEE8C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qOFJBtOhkKGzSJF7sTVW8yVx2dgq+Z0ltCqI9+yFlqh9I2hjb+YsFz8BIPKjEm6dKMVS5EgH4a7LfXrykr3MQ85uhwEHCBUKDxS+Vvef8vtJNUpyBUiTU53uvgW6lxC9dCWX6KdCTmdwBJLQIiCkHiXzCtOGCpr0Cmjt20aeiShqit3DR6U7YEjFBn4nBpLlZaDbN0T47io+iWu3hhVSLVe8n1qs7HAEsqgvkSJhpMrsl5dfwmjHcmNsucyeIHu4W0OTsP3o8c1zclPPCR67+wsioUOserc00FcNbWZrACtzQAPHz0VmfCaB68OjBqZF27nqCb/nfsRJmfV1zFzYe7uvNoK3VOp/+WnWcCJrKw4n/uVlsGEU7YWhP9ovS2jkmDBf7BpqNR27OpJLUW4j94NHcnxXcTX5v+P5pKmH9lAIGmBub1DwXDpWPZNA5qHfYb0+GMMscZVw8YZxKpWARSePU3HTF6kcYrY7qJKZlteimbCVE2lTPKynko+B6YV7yWwe1tS8B9QfkGfI4tVJkecK5e5Iat3+K9x8aBdav89JH8ZR9Ed/E14cB09u7EUeRHV4Txrm9ZZUEPIg05xd/z5flqDjKWWYvG8Bh7SHjdNE8U2YtgswzsDKkrKKrMo7ns6QnlxBX6Ax93r2ytWRwXtI4w8KtFTrTco3to3PDZtLr/Kf6sxz4rj/ZPR9Kmxwf/rY3J3O95dJMRN1hJIq/522sIWbBB66XWZxgjXoY8UY7T/KvNV9zGjLW8Rkq9tbW1ipujA9xQP8GmKjsRV2EQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde4c95a-eafc-4430-4918-08db86d00fb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 14:13:57.7378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUyr9NtD6hkIwWZR19A26wt2aqlUhQTGG9l0xbWh+On2G1Wcz4OW3SCpW9uevTuDSBG7WxKNd8v6B0CucF051w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_11,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=890
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170130
X-Proofpoint-GUID: XRLnAivveRS5vNIUrkKf6sZ5ncNZDLvo
X-Proofpoint-ORIG-GUID: XRLnAivveRS5vNIUrkKf6sZ5ncNZDLvo

SGVyZSdzIHlvdXIgZnJpZW5kbHkgcmVtaW5kZXIgdGhhdCB0aGUgaW4ta2VybmVsIFRMUyB0YXNr
IGZvcmNlDQptZWV0aW5nIHdpbGwgYmUgaGVsZCB0b21vcnJvdywgVHVlc2RheSwgSnVseSAxOCBh
dCAxMDozMA0KVVMvRWFzdGVybi4gVGhlIFpvb20gY28tb3JkaW5hdGVzIGFyZToNCg0KU2luZ2xl
IGNsaWNrIFVSTCB0byBqb2luIFpvb206IGh0dHBzOi8vb3JhY2xlLnpvb20udXMvai85NzQ1NTM4
MTI2Mz9wd2Q9UjBSdlkwUlJSbkpHWlVWSmIxZE1LMk5CZFVSWFp6MDkNCg0KTWVldGluZyBJRDog
OTc0IDU1MzggMTI2Mw0KUGFzc3dvcmQ6IDg2ODc1NzI0DQoNClBvc3NpYmxlIGFnZW5kYSB0b3Bp
Y3MgaW5jbHVkZToNCiDigKIga3Rscy11dGlscyBuZXh0IHN0ZXBzDQoNCkJyaW5nIHlvdXIgZmF2
b3JpdGUgaG90IChvciBhZHVsdCkgYmV2ZXJhZ2UuDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
