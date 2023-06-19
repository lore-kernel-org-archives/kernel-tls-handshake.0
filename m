Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F7AD3C
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Jun 2023 13:23:25 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nZ5j013652
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Jun 2023 13:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=sbLNkXY+v8IuAkbCUVGLAqJmcvQk/FOTW1QkZ+xRVuE=;
 b=h3LLc7wuwJEXBxBBJB01tIam/Lh0eei5278Jv17MG/sV4slP8x2KIo6oc6YhfL+K10v9
 vHEAkZH0rjuH0Jum9f1rb+m1SB5Qhk6spSmSoc9+q0MBPkRaw0QWAGez5dnBNfqkNy01
 ZVMERQQ8m1TGcqS5FY47lpeWTV5Y6aRC7NWJLm3u+8+RLosIQxPnd15GjBkz71xqUphB
 +wbJAsswOeNFC4QqNHed58FBbu5tinHU0XKMpuonlKRMtS5f4/bOsmNwLmL0nre8kFAQ
 0jUxNWQj644PjudZL2XhJVRxnl/09BkNazjaSTZ5a+nus35D/L2yACpD93WoB/E/dEKh kg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94qa2q94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Jun 2023 13:23:24 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JCvATM033037
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Jun 2023 13:23:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9394durn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Jun 2023 13:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvC5+w1rwSuuGZPOokCcwcYmAaz1msFQKIYNokHtdtbdat7PYzMZq/dAuIA08RH6e9d9iiseJcbkrcv21StZOWh7FSJhbkR1UslJlkufZyG7fWaNd5kTDNIr8kaYjF9SfLzNTM4N02gN9hCH8NlTyZAx08OIBCCWsRMsxlQsYlcKOafKDf1mmpP3794D4rWRHVVR3EYlcOpJtH8tex602l0qeVT99oW2c1WUv202fcpArQgyjpwgM1NjDBMpp87asB61y0DHwq3YmcUOEtzTammmbq72HtpXkKRj3Ueipyxftdz8pmm5R5F+mBYfkmJQnMm7dB3awICYXSZHH+CXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbLNkXY+v8IuAkbCUVGLAqJmcvQk/FOTW1QkZ+xRVuE=;
 b=g/TkY7ihOYAHyBzZGfGY7q2i18pJDzOnD8EaLByRmVj8QD9sFEP1ZVkZuMvT/AL+hAjv6nY6n2mDt1qA2QrY/MQuOO+bVPePlLWZmSNTdQJBhbMGRtSeaIc2EfXGMzISs8eO2FFT0SGVYgBtfYLVLp155fNnaClId53N0cM9bE/SdSvR00y4P4ZlgHiOZwO/DyVP1Twii6ipzf8Wfa5bsFpBmUjp2TGS174fK2XeiRLx3v+0G1t68G9f1x+IaJ7yeMRrgkwfBvJkDrZQHbppJD4eE2ADXojQ8JUTJeEJ6/AyVeEv94R+z7m7eh0Zj8hCMekxYYVaUKuGkWl80wA/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbLNkXY+v8IuAkbCUVGLAqJmcvQk/FOTW1QkZ+xRVuE=;
 b=rdw6vbkno7rf910gVylCMxAuyckkbrkqBTJH57m50BxLdQMc9zOQUdbZj4gEKvvbUBiFOBdvmGZkf2dH+YxPwQ7TvJECYwMyCad20/a1Gn5gGxbzsGuRJI8CxC41+kWgmjCV8o8LNxH1BM0z2XSVq+tnLz2v5n2GzyPX6xpXirA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH8PR10MB6359.namprd10.prod.outlook.com (2603:10b6:510:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 13:23:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 13:23:17 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZorE1Ud6c9lE7v0mcvcYO47isNA==
Date: Mon, 19 Jun 2023 13:23:17 +0000
Message-ID: <ECDEE175-27AA-4A17-9082-3F4F44902455@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH8PR10MB6359:EE_
x-ms-office365-filtering-correlation-id: 51df3086-ffdb-4ecb-5e92-08db70c857bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q1MvMTNAHAoHFJiapOMv8xThQ4swJmMo4uRdXXQR+zH7j094+QPm9j4cRX+36YokWe/qo1nZmcEEa7OZCuSCRz1PHnPfDllikdamkaJmli41kwEvFptFLMTeWuN1uEOXcXB//C7w2ScSw7SR01ZWQiaaWDqi0D6KrV8K6VgS1nWO7AqXJeIg1QJtVgleEOlKfoVIohHyYaSBqMonZbc2Ft6ljRl8ufWaMU8yTM3Oo4gJ8oBzQBcEmjqF94HuCGWCvA7yDM7TtgKNekz9zCqSZ8UtbxOM6QnDHEh9v9JAU4JNbseQ2qZNnIhqBYEceyjhifuriYY3TwTBrl9ckEgiUQLy8ecudbNqaRn3+Xq7mlMrc2820kqET8YHe8wG0M/C8N/ZPSF5IEPEucUo6VVpC+f6yAsgyi0kCsDOHN1p4eioO7+CulHvbjxWTgKWuonV0P+5b3c8k5LtNlV6FO3Yq4JzMBs9W2mvJBaklpo61xhr/P+RuMaEQv6FpAlOcvuyOxvlsw1kwnWan+CJPnvickV47f/s4lnc2SS99OZ1KlDS60QDA82HuL2LBZv8rB0To3by2f2L7CIvD7VfngOWJAu7cN/RIHgI2ROqqbDsZ/oNYY1GNMG2kV+t2GsNIGx7e7qwhpoBOPyEQqJXT6ZY7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(478600001)(2906002)(4744005)(966005)(6486002)(2616005)(86362001)(33656002)(71200400001)(122000001)(38070700005)(36756003)(26005)(186003)(6506007)(6512007)(8936002)(8676002)(76116006)(66446008)(66476007)(66556008)(64756008)(66946007)(5660300002)(91956017)(38100700002)(316002)(6916009)(83380400001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d01vczRMWTV4dlh1SmFENE9uM0RDYVo5Z0d0aTRiRm85V08rMk5aZisydWZT?=
 =?utf-8?B?cDJ6WFIzbXlqTDRpblJLUEk4WkNvU0VuS2NsVVovNVJsSWltSzF5M0xLektO?=
 =?utf-8?B?RFN5OW9HM3c5ejB0dTFSRWQrSElSU3BnUlFmSjFlSE42MklFaHVFSW02WUph?=
 =?utf-8?B?cGM0OEdRR0ROcEdyV0FNUnFQQmxRV2dxWm1oMEZPVXFJWmEvaGtITmt3bmZ0?=
 =?utf-8?B?dUtDY0xaWU1HcnNFbm12Y1R0bFBKa0xoMmFrZ0phazVOelNuOHZ6RDBWSHF3?=
 =?utf-8?B?M0tMWnJsd2JGS28vRXV2czhBNjhMN0NjNWFRSlV1TmdOTkVwbkRBT1pVRkZM?=
 =?utf-8?B?YzZnMFlmc2l3M09SbFgxaVJpSWIva0srUlkwK3dOS1JhYkI4KzRrRnhlMmtL?=
 =?utf-8?B?ZjRNRlVIcnBRZXp0Yk9xYzdGMkVjZlorbjJsaml4QURHVGoyajh1ZklYcHZl?=
 =?utf-8?B?RHA4T2VvRW5aMVM0NjA2aUgrTWYwOWVVL1lGMytYMFV0a0xCWjJTVGY4V2Jp?=
 =?utf-8?B?VzRMaXJjUHFVS3FTRTYvcHN0emtXSTQ5SHRGUVVCUnZzRVdmR2VEVDc3OXRt?=
 =?utf-8?B?ZkMwVWpDaDdPRUZzemcyTnZMUW5Uai85SE95d3hpamFKandsQW94YUlNTXg0?=
 =?utf-8?B?VnJwbC8rcUxDanpsYTJKc2RBaHMvOUlZQmV3aDROazA5bExSczVNbWJqcDJi?=
 =?utf-8?B?YVFwdHBCMkNVdmpHMlY0Uis5czZwYm9KSWZkaFN1NEtHWXlrSG5uUi8wbTlD?=
 =?utf-8?B?QjYyZmdBbFRMOThaYnJzZ0tUYUtBSmQ1dVRVcEFxdE5FUGJBMFllU2FiNVpK?=
 =?utf-8?B?dnQzSlk5dkhPdGVFTTdpOWNZeTQ4dDNrNUhCbmorQ0tsSFZTWENFVE9TM3Zv?=
 =?utf-8?B?MGwzeWQ0VjNQNWNtTzAvNlRXd1JUaENuajNYRW4vcWk2L3Nkd2tPQ0llLzNI?=
 =?utf-8?B?SFRhTDgrV0NUUFU0eVpuZ0MyWGcxeEwvZm5MaVpCb1hITndyamZCZTFxUTBL?=
 =?utf-8?B?MEh2ZVdOK2t6NlYxZTFHelh4R1c0KzVmUHJTa044eUlIUzR5RmUzeDlIbWsw?=
 =?utf-8?B?bDQvYmxKZkZNVU82aGFQVzZqMnltUlZHdjhCTlpjODl0V3ZGa2QwTkwxaGtN?=
 =?utf-8?B?eXRYWU5lRjFqK2xRWGtQYjUveDFkTWdDMDFxK0FnQkExNzNaeTJibVZGb0ww?=
 =?utf-8?B?RVJnd3hPNC9zaTNNcmcwQ1VzVEVsVWNjRGRHTHAyM1FnNytURnhkSnlrcmww?=
 =?utf-8?B?RXprNGdrZVdEMEZFeEJiWVBsejFqcHNHaDMzUVJXVVJUcCtzRGdwVGFQTk5V?=
 =?utf-8?B?VDVHT21vazJzZU5BTDB4eFpNNUZ4VUplSnoyOTBzWmJvdkFKaEk5VzRiM2Fp?=
 =?utf-8?B?ZGtWTHQ5aS8zSG13cWI3NlFTazJCZnpvMjdPUmNrS3VUb3pDd0F6VEQ4c091?=
 =?utf-8?B?L1BQZUozblBkMjdFaXNIbFExcmQ0eWc5UDl5VWF3MCtWVHNndytFaWVZc3pF?=
 =?utf-8?B?VGkrQUdrSnEzZjlBQ0hOTjJrN2pVeE9lQkN4V01mdXVKcUxHQitIbnJxVnVB?=
 =?utf-8?B?TlRncnN1R05CSW4ra1haYnQrT3U4YlY2cldzcG9weGpxcGdaT2FmMjQvajBs?=
 =?utf-8?B?cUZZT1ZNY1ROUndnQXlJYmxrL3hpQUg5N20raC9wT052WU1JS0RhZy9objR4?=
 =?utf-8?B?RjRPWE9oVTkvOGUwS3hxbHFROEtPeTdQSjVZZk1CWGRSWmFVanRuMmJuQ05D?=
 =?utf-8?B?d2RCQWZWL1BnNjBlQ1pzY0lmU3E1eHYyTHBsOU9QZ0RudnhuSVUzL1N3MDln?=
 =?utf-8?B?bFJqQmF5ZXpJNDBDVUhKUFpoeHgxQU1UQSs3czBuVDVad094SzR0aEY1Rjl5?=
 =?utf-8?B?UUZuMDdZNTdOb0FWUkJDUmxsaWt4UUZFb293cVRVQ2RpUFJWVU8va1JOTXlQ?=
 =?utf-8?B?YnYwRHlDSWcrdk94YXFRK080aFc5bjJJVUxJQmpmMlQ2M2ZSNm54RGNkcnNR?=
 =?utf-8?B?SXV5N2FoUVVqKzROQXhOVXVjazFZdlB0N05IT1R3bGNWb0w1d1hYbjNRc0JJ?=
 =?utf-8?B?cHBBdlJFazFIdzM5QkpzcDF5Y3JUTlYrN3k2bnczYWdlQ1BSQVBjbzZ4bzlx?=
 =?utf-8?B?cWp3Y0dMTXZuQ0Eyc3NyaThqUXord0U2Zm4zTjQvb3NoYW9vMHVaTi9EL0xi?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8825A4E1829D44C80DED3C1B8C324C4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d83ExXOzYoKhZ9tpRHFFrh5WqpNXVZDg9cyjAm+dCH+sedU5TLmraVgDzj5sXKxSps6zX9sija65q+1LEqMPhfQBI2Qufht2vGO+eCilK7ponRELj8XQtVA/UST72fFSMzlfvwn8sPquUfA2qApQS7QpFLWKCgOjoCTYWdTaL6Iqbk6duhrpUj5j3uiNiU/xvdOLsEyjjdXUrAOYJiAk5y4ckciJMVFbLhRza0a4sn79Cl/7ltokSYG5K3BEhrA/MFUl/39U0W90PoTxsfmH2/6HPrWFjgfTkYDLuCOrYsRx/63Si6CkJg7867OhwDy+PdpvzVsNcfK/MZW+PllOVMjfUIWzKcXDT2l8iFKQwcw+AAwCZ+Q2jg9F4gXOas8bYA0vXYPf2MRjPWNuAmV1ZELfbpHUMyVLicjzAMhlSuKtYiErd10WbaqqsNJzGqPKK4BNyUs6A9WTgk2Jux8BvgkVuw4aSkzAFTwTwEdoImB4pROaFA00gHMzN6dZrUiPbw7ylnEhSRF+1CO4EjcZvnOwf6Ed3Yv7bmVcjyURPRoU1m2LEIGYxn59RdY4GQ5TD6G+uLgoTukggiv/Y0JbsalHvy6O8UtY73aVg5lFaOl+8bqMEY/vZVLMCFyOA7F6nx2bBHtcjyZNNYzZSHSt8aZdjGKQ/emyHOWNeD7cUWHhdREpjj4TXF67PqL1GXlRDZ20tyoRXh99rA23zFB945UxvFuHV21CuxPdH8BgsKE4Rrx2Ps9+2fsU6EDjdtKnUtREXexveWkkGyxy57qb9g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51df3086-ffdb-4ecb-5e92-08db70c857bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 13:23:17.0672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLlbnyQN8sFJ3LTiEpUrPzOPAm3Arpf81V/SldFddPKJeG0eyEIOtdQVtwIJGYSP4+xnLVFwT41bK0uKBLv83A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6359
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=894 phishscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190123
X-Proofpoint-GUID: Eb9mWZE43dnU3OnTZ4Z9BBEP4TWDeAKn
X-Proofpoint-ORIG-GUID: Eb9mWZE43dnU3OnTZ4Z9BBEP4TWDeAKn

SGVyZSdzIHlvdXIgZnJpZW5kbHkgcmVtaW5kZXIgdGhhdCB0aGUgaW4ta2VybmVsIFRMUyB0YXNr
IGZvcmNlDQptZWV0aW5nIHdpbGwgYmUgaGVsZCB0b21vcnJvdywgVHVlc2RheSwgSnVuZSAyMCBh
dCAxMDozMA0KVVMvRWFzdGVybi4gVGhlIFpvb20gY28tb3JkaW5hdGVzIGFyZToNCg0KU2luZ2xl
IGNsaWNrIFVSTCB0byBqb2luIFpvb206IGh0dHBzOi8vb3JhY2xlLnpvb20udXMvai85NzQ1NTM4
MTI2Mz9wd2Q9UjBSdlkwUlJSbkpHWlVWSmIxZE1LMk5CZFVSWFp6MDkNCg0KTWVldGluZyBJRDog
OTc0IDU1MzggMTI2Mw0KUGFzc3dvcmQ6IDg2ODc1NzI0DQoNClBvc3NpYmxlIGFnZW5kYSB0b3Bp
Y3MgaW5jbHVkZToNCiAg4oCiIGt0bHMtdXRpbHMgbmV4dCBzdGVwcw0KICDigKIgTkZTIGNsaWVu
dCBuZXh0IHN0ZXBzDQoNCkJyaW5nIHlvdXIgZmF2b3JpdGUgaG90IChvciBhZHVsdCkgYmV2ZXJh
Z2UuDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
