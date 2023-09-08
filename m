Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF530FB5
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  8 Sep 2023 21:46:53 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388LfwxG020205;
	Fri, 8 Sep 2023 21:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=tKGX8Dw4h1D86TdAOy6d/4ewvi7fnhCaQ0FdYlAXkxU=;
 b=vYU6jWYhr5GUnz6MFSSBL0po1AOje8mQ9S+F2oywAZ67hWlg12QMIKLdF+YnYmaKr8mB
 o7kukoMXZW7XnRmSJvrp3sPhLj4eYak0I2u2+8R9fQ4dw2Nh4cRX9GnZ7CB6VD6XFEKm
 3Xl18nUE3Zh1cGBcJehU3dI+XsSI5I6NcRyJFd3xRAe2TeI9CAK5wu8c7yz/yI1rNUg2
 69uPd0t6DZzSUClY2h6Pt3yTe2SUScOiJUeEkwQLHyskq2RZ6k7oa6Pjk+56GiXgkDjj
 Sa3TKcIUaWZJq4glGn3qK7PgNUjjgy9GAS8cMIPRm6gpfHvZ2YNpf2keUQzgIB3u4DaC JQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t0bk3g0s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Sep 2023 21:46:53 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 388KJ7dL025380;
	Fri, 8 Sep 2023 21:46:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3suug9p7kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Sep 2023 21:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huT9RLiSHH6gOPl4Viy52TrHJRzMJdZW5rhjImmM6+1x4eTIp8R2kFwD6X8D+ddqLjJTcNG7oGkEpTb3lQNKDaNDzVeu1KlPVYMrkX0jW3k5R+Uf88bXkN9LkITVEW1HE8RC6S3ltzxNBncXTuswwJAU8m7h7nBnmQX0m7uKJIXTbyVEfKgGYWZxOcyp8jfvZ3uZRlrPJK/qJFj9kiaOhEsuBCEKyXJtpRNpOt2q0dTpvdDE9nHJaXr9ipN0AtLucxK/IGacU5mvg77dXqlaojwjld0W119LaRLegaXLgpzUitb3wrY7XtFuBCwDUxSBlKbGxrCo5roge884bCHj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKGX8Dw4h1D86TdAOy6d/4ewvi7fnhCaQ0FdYlAXkxU=;
 b=nKwc5F5xmTsXjQZFcy7+KI5icQHZslVI5+1aIUos3Ph6LWe8QSIdSFtTPLsw6JFyOcLqH0Tn1DW4smpP41x6PA8t7IFJ8U0//ufQg3UI41Ie0zaBEG5OliIEA9f3bRo6Bz0ZeXtc4cn8g8Q7ZkzLW2VCiMzamO6IHOTZd/7Vi6d18YdhkBprj+Ma+2/MNWUK1su1Ey5iia8983P4+tdwebBTnyJjBDKU21wlK9nFWqoDRH9XPDbmjBkbFFG1OiKSDL8yBtZUclse1+c9T8I88NmPXxkG0505HlgSdGe6NsTfc9RE2D60Am4C0bSC5cp676bCL6v/we7ZngW2ZAgwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKGX8Dw4h1D86TdAOy6d/4ewvi7fnhCaQ0FdYlAXkxU=;
 b=rNKHBPdIRqfeeGcBYjKI0i3Nc+mfor1GPPV0eJYOR01ig11ag6WsHakekk6zTFiyGTB9XM75k6O0caJe77hSFm/ndPBTYv2Usuh8nraGJGSXLhSiFIX04Dd6HfQdCXnw4+Yf/5iSjsnnJS5RW+KEMqo0BlZN0ArafMJzcW2Y+XM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB7462.namprd10.prod.outlook.com (2603:10b6:610:188::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 21:46:50 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 21:46:50 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Topic: [PATCH v1 0/6] Fixes for ktls-utils 0.10
Thread-Index: AQHZ4Msr4xuGDwPB1kSaS5o2z7XRQ7ARWGqAgAAc94CAAATygA==
Date: Fri, 8 Sep 2023 21:46:50 +0000
Message-ID: <8800E936-9525-4EF9-8CFE-1F50C295F73A@oracle.com>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
 <CAN-5tyFHM-M9GCRxmnDobkv=htwbFSUiN57nTSvhdiLFVu2ztA@mail.gmail.com>
 <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
In-Reply-To: <7B848732-857C-47A4-9F48-A03D4B29B43E@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH0PR10MB7462:EE_
x-ms-office365-filtering-correlation-id: fac194e8-6832-492d-0753-08dbb0b51b8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eODWFZM+WvmGKOtTLgwTr/2YpcXp1MnXu0j4pMnfzh8ZANrpQkpPAE5wdO97B4h9bhXoenlGOidSoi0Ny9eczwF0nmPanBnjsGTXLl80TueL92kaAXMLmKAbCC1jEw+ZUB6WYu/wCEcHCycN20Bgcwadpylal88+HFPrAq+7JZs04dgVm+BHNqdoJmS4082Q0N7wRmZnsq2yfR+UeAraq5B7hgq9/p5SD2tqndP0012Atqi5IGICPU5/GTZs093SG2YbMp4GS47NvxZnEk7zNusRMpTdRel3eQ05qOHMpwiI8cc+XTToMpas4OCJDc3f4wJ0OvfAMoAKAQOee/1qcfGNqmpN7ZDKvjcY2g/QryEdtQ+suNaWZ2BLcYvg/KQNZJj56v85XUtHJcGdJJzN5ZfJIc46ob6whZehzIRpBM6WwJtGAkSNsmi66EdToIceOQvnqfywmuvRsNncLZVyFpq0x8+6LikSmqYnvnDhvhlUYnlJMhRt3H9WvnHNoNHHLEwGr59KMP6In68sCttzyCexGvMwlPVTmjJKnvT1ft8zgVLXfKTt309iJFrh7xd9Z/yAAQzAX3TIK/XSQTKakeL6rcgqq5dggm9Wdj+7QiulEZgkgGSx/4zaxCpkA2iu2cYQc5YgM9ahT+GuB01SrQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199024)(1800799009)(186009)(478600001)(71200400001)(38100700002)(6486002)(6506007)(6512007)(316002)(6916009)(4326008)(5660300002)(2616005)(8676002)(41300700001)(26005)(91956017)(2906002)(83380400001)(8936002)(66556008)(38070700005)(122000001)(36756003)(33656002)(66946007)(64756008)(66476007)(66446008)(53546011)(86362001)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckVVTi9lcUwzRjNVY2NrcEQ1UlMwMkFFaUptY1NFZzhtZGhqS2JYZzNNdk95?=
 =?utf-8?B?RkZOeG41ZmRNcEtqQk55SGdFZm1OTEM2M21waEM5ZHJTQ0JzY3lKL3ByQU9p?=
 =?utf-8?B?YXV0NG01VjZ0SW5YR1V3ZGZJRllNbnJLNXFLYmY0NFpRT29YUTByQjBLWHdU?=
 =?utf-8?B?NHBueEFQR2luWHVNaDczWGZDSGloMjBMamdZN1NuUWNXWHo2TVBpaG1GNXI5?=
 =?utf-8?B?MWNNanpjOXFSei9pY0xrSithV3ltUlpBWFdjTHBLZnkrWFdCdTN0L3hmU1c2?=
 =?utf-8?B?eFBKSEpYbVVkQ3hwR2RvY2tSOVVvdFU3UmhsTllzN3J1Z1BhV3ErOXIzcnc5?=
 =?utf-8?B?eHZGV1RkTzZwc3hiMDk3UldaY3AvTmx3b0RHRlJNWXFDYXhJcWJ0NGdlaEtZ?=
 =?utf-8?B?WDhnbmRKREZlTGFyVHdnZVZBRk1xTG5DVmZoSG4waUZmKzJlbUZBTHhtSFdp?=
 =?utf-8?B?VSsybituZ2JRdUNpZkx1OWtUSEhHZnQzcXdoalVKOEdYbVc5L0IzekRwSmZ3?=
 =?utf-8?B?M2xvRU5VNTNGMWczTkRXVFBibW9YcU1qOWFYMGZvc1N5ZXJnYmIzSStlRHhM?=
 =?utf-8?B?ajhMdnlCSEVWNGp1TlUrSnFwT3NvMCtrZnluSUsrSnpqMVR1NVV3UjN5WVUx?=
 =?utf-8?B?TmhVc3o2Z01KZzZKekFUNXFXbXJweUVOSjk2M1ltQjNlR3E3OTU0Kzc5Rlgx?=
 =?utf-8?B?QnBKS0hnSGExVkwyemJ0RklKS2FqeE1paFNkdFVJdFNreGdxZEJ0SDFTeHVO?=
 =?utf-8?B?R3p0M0dsaE85Q2w5bEVOcWNaNXpORzJoYlhjQ1hRWG1pajFFcTBSSzB2dTVC?=
 =?utf-8?B?b1R0M2hUNU5kZTQxY0RNK0VsOTZGOWhyWCtNUDVSbk1qT3hQU3YrN3ZKaC9L?=
 =?utf-8?B?bU1xOUdIQm5ZYzNKTXNicS9lWlZ4OEdwK2RaaTUrNC81eHlEbzNPYWh5WnBp?=
 =?utf-8?B?N2dGNlBvcHFBNVFuclVaMzQ1VnVwOTNoWk1QZlRnRGIwT2ljOGRrUS9rQTZO?=
 =?utf-8?B?NGEwODM0MFUvTHZLcDl3NTZBclYyampBcmpqRDdNNmxITy9HY25LdTdUMXFt?=
 =?utf-8?B?akRNeGhOUHlla2pMb0U2b2tJVjZIUG5ZTUZkNTFZbTc1MmFaQjRFVWhyTnpM?=
 =?utf-8?B?aHkzdTBPbzBmM0pNcXVRSHFaSW1nUWlaMmVEZVBPeWZ2ZEphR24xUEFCUGtY?=
 =?utf-8?B?OStXL1ZCTUx6dmZVT2NpOWhGdm96Y2NScFhoNUVNcWl4TG44NlFjZk9VeHVz?=
 =?utf-8?B?SFdPckIvV0pXMHVlT1NSRyt2ZTB1SVQ4UmJickJ6Z0JDaWlWZVlGMk8wb1dO?=
 =?utf-8?B?NWRjcGVSZ2hSS3lRNVorWTk0SU5uOEpaRi9NS0FSbW10V2pZVUx6amR6MEhR?=
 =?utf-8?B?QVgxb3FsWGNXVnROOUNycjhtaUVucUR2ZHBxbDRsa1V4dkozdGlFelQrZlZk?=
 =?utf-8?B?UWpMd1R4M0lyK1RJOFJGK0RvcXZGT25uN2N1M05NOE9XU0tXSE1BbGQycEsy?=
 =?utf-8?B?cUo0RDZZVTZmN3Z2Q3NHaUdnQ3pPYXJOZEUxZWY3WE0wWTBKSDVocXlQUkFi?=
 =?utf-8?B?L0tWS0x3RW1hcGlKNTlDSm9ZYWNOaFZpVzFzbFZwbHlpS0Jha1V4UjhSaytR?=
 =?utf-8?B?SEx0blNYYllsMFpRTVJFb1M0UE14ZXh0U3JDcHl1cktWL01mQ3BXbFhqbVo1?=
 =?utf-8?B?Nnk3ZmZNRm84SFFtQ201UEVxUW5lcXFDTFBJY0toRHR1clRWZVJvVWpCYUZy?=
 =?utf-8?B?cks4UmJGN3VKRTQyVUhDQXFzbkd5U1hadFNuazdvcGRTUFY0MWoyTFgyOHV4?=
 =?utf-8?B?Y3VGcmFFSDZ3WHFiSWlFRFBNS3FlbUtVMTlmR3VlOGtEaGFCNVhEdHNST0FI?=
 =?utf-8?B?V0I2MUJPM3ZMalQ4cno0V1ZCaEJESWtPY1V0dXZGZElpdy9NQ2crUWVYaXFZ?=
 =?utf-8?B?N1JGL3JDM0RLSXVLVFJxQWNDWjdWOFh4QzIva2ZTQisydkxRNndhaHZFdEd5?=
 =?utf-8?B?NnlFQWpBek41R3JneWFlWHVsUlc1R2VnMGovSWZEem5FSDRTU3oxN2ZBOGk5?=
 =?utf-8?B?ZzBDNU9EVjJDOVZ3bUN5akhTYmpySm1FK2NBSEtoSnUvTnpXeGFKODlUV2J1?=
 =?utf-8?B?R1dJelVuaW92WGpsQm5sYWs3c05jeHhiS1NSZW45aHlyK0RwMTc4c3ZpOWgr?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB130798B8FA484BA55D72004A4D443F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bIjRraS0tUZJ1eP00UWNx0yW2qzSKA/6yGjeA4crUCzbrO2jQXT/b4edLjmOIwEzsk81QKsbCQJLVlvCpiCP8FAL+7qZKoLG3ejaXAq3VTZA1xooVkwLS4KS59N3OOWYFw3IJzCgGxGRFsDjXQj6E14ypfctllEVTVWlphBcQ3zTIN4Ofp/Cwj9SdNjkA2zSPXncctumCnFcUmBlw78z/BA2BxOPSsdAvp+ET/8GBootHCuoZZV/xDrqTr2BxoIuoFMyox9HYH/zu9yBLCIH9J3eZstLA6Gjj0TxiPgpByb1e1zlQ8ZTo2YH3wgT/NAO/SGD/yoisWyWsKy366zMk6paYq/NbdSe69cO8M6nVhYriFB46M6V3DhfKMvWXkBR3nXFDVIc6f1TjFcz08nXHGfTS9NIbU9B02KB/0ONfdqGt3Rsm1s4Su5p1WhY+7m8tmucuYk90Oo3nHkf8qliHuzEPPN6ZPgcdEfjUpkGI/lbtFLCXGK4CV2Yc2VzdUu8SkybrVIqnzJG5ih5yBApjB8986TwW3TYIxTsFBqXj5QhtlFoDkCY4pc9BKQ2O677/LruVUIAhyTx67+bY0ndmb4ypl9QwxkCr3+j+86F7+9UpnPuFtHi/ff2DfAvpqVr5V0NDI5vl25RVjuU48suaqpWbt/R97Ym+0bqsSYwNgSxZLLfRMg1uWJr7AtRrd0TpgFbQZpr9OZUtQP0XTgAIyS1LWpe9uGFbI7PYhi+5JgupMVePu1CzJWel5nEwJt+w7/7vf/4KH2OLneG/CjvHR3iGDEIzcWfkgQJUuX6UnI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac194e8-6832-492d-0753-08dbb0b51b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 21:46:50.0715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JIWB8Wa4HqpEbZjv6+1TfOruSITsfylFkDM7t5qGZRJt3ISKE5ywB/0HBU3D1ntu7kLyKWxK07ooEAVgqfLK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7462
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080198
X-Proofpoint-ORIG-GUID: IBCjvz3EbLAx1HDavEraG1gE9mqQb-NX
X-Proofpoint-GUID: IBCjvz3EbLAx1HDavEraG1gE9mqQb-NX

DQoNCj4gT24gU2VwIDgsIDIwMjMsIGF0IDU6MjkgUE0sIENodWNrIExldmVyIElJSSA8Y2h1Y2su
bGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiBTZXAgOCwgMjAyMywg
YXQgMzo0NSBQTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+
IA0KPj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxMDowNeKAr0FNIENodWNrIExldmVyIDxjZWxA
a2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSSd2ZSBiZWVuIGNvbGxlY3RpbmcgYSBmZXcg
cGF0Y2hlcyBmb3IgMC4xMC4gSGVyZSB0aGV5IGFyZSBmb3INCj4+PiByZXZpZXcuIFRoZXJlIGFy
ZSB0d28gdGhhdCBhcmUgY29udHJvdmVyc2lhbDoNCj4+PiANCj4+PiAtICJ0bHNoZDogUmV2ZXJ0
IGI1ODZmN2Q5Nzc5NSINCj4+IA0KPj4gSXMgdGhlcmUgc29tZXdoZXJlIHdlIGRvY3VtZW50IHRo
ZSByZXF1aXJlbWVudCBmb3IgdGhlIGNlcnRpZmljYXRlIChpZQ0KPj4gdGhhdCBzZXJ2ZXIncyBJ
UCBhZGRyZXNzIE1VU1QgYmUgcHJlc2VudCBpbiB0aGUgY2VydCk/DQo+IA0KPiBTbyBmYXIgdGhl
cmUncyBub3RoaW5nIHRoYXQgZG9jdW1lbnRzIHdoYXQgZ29lcyBpbnRvIGENCj4gdGxzaGQgY2Vy
dC4gVGhhdCdzIGEgdG8tZG8uDQo+IA0KPiBBbHNvLCB0aGVyZSdzIG5vIE1VU1QuIFRoZSBjdXJy
ZW50IHNlcnZlciBjZXJ0cyB3b3JrIGp1c3QNCj4gZmluZSB3aGVuIG1vdW50aW5nIGJ5IGhvc3Ru
YW1lLg0KPiANCj4gDQo+PiBJJ3ZlIGJlZW4gc3RydWdnbGluZyB0cnlpbmcgdG8gcHJvZHVjZSBh
IGNlcnRpZmljYXRlIHdpdGggYSBzdWJqZWN0DQo+PiBhbHRlcm5hdGl2ZSBuYW1lIGluIGl0Lg0K
PiANCj4gSXQncyBhY3R1YWxseSBwcmV0dHkgc3RhbmRhcmQgc3R1ZmYuIFVuZm9ydHVuYXRlbHkg
dGhlcmUNCj4gYXJlIGEgZmV3IGRpZmZlcmVudCB3YXlzIHRvIGRvIGl0LCBhbmQgZXZlcnkgeC41
MDkgdG9vbA0KPiBjaGFpbiB1c2VzIGEgZGlmZmVyZW50IHN5bnRheC4gQWxsIG9mIHRoaXMgaXMg
dW53aWVsZHksDQo+IGFuZCBpdCB0b29rIG1lIHNvbWUgdGltZSB0byBmaWd1cmUgaXQgb3V0Lg0K
PiANCj4gVGhlIHR3by1zdGVwIGFwcHJvYWNoIHdpdGggb3BlbnNzbDoNCj4gDQo+IDEuIFlvdSBj
cmVhdGUgYSBjZXJ0aWZpY2F0ZSByZXF1ZXN0Og0KPiANCj4gJCBvcGVuc3NsIHJlcSAtbmV3IC1r
ZXkgcHJpdmF0ZS5rZXkgLW91dCAvdG1wL2hvc3QuY3NyIFwNCj4gIC1hZGRleHQgInN1YmplY3RB
bHROYW1lID0gRE5TOmZ1bGx5LnF1YWxpZmllZC5kb21haW4ubmFtZSwgSVA6YS5iLmMuZCINCj4g
DQo+ICJmdWxseS5xdWFsaWZpZWQuZG9tYWluLm5hbWUiIGlzIHRoZSBGUUROIG9mIHlvdXIgTkZT
IHNlcnZlciwNCj4gYW5kICJhLmIuYy5kIiBpcyB0aGUgc2VydmVyJ3MgSVAgYWRkcmVzcy4gWW91
IGNhbiBhZGQgbW9yZQ0KPiB0aGFuIG9uZSBvZiBlYWNoIHRvIHRoaXMgbGlzdC4NCg0KQSBsaXN0
IG9mIEROUyBob3N0bmFtZXMgaW4gdGhlIFNBTiBmaWVsZCB3aWxsIGJlIHRoZSBvbmx5DQp3YXkg
dG8gaGF2ZSBhIHNpbmdsZSBjZXJ0IGZvciBhIG11bHRpLWhvbWVkIHNlcnZlciwgSU1PLg0KDQpB
bm90aGVyIHJlYXNvbiB3aHkgSSB0aGluayB3ZSBoYXZlIHRvIGVtYnJhY2UgdGhpcyBhcHByb2Fj
aC4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
