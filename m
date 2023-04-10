Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E26FB4
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 22:25:49 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AJuOwN014424;
	Mon, 10 Apr 2023 22:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Da0QgSw8zmF0gWqK01HGQ9/tP1mABNl/fBkbDqq5zJA=;
 b=iT9qomxcTS7whomQIvRHWcnzXA54RuPm51YC/ph4ntj7xuEOwS1sWfvMuSWbBxtGsMOS
 oLQGhVMx5qVPYqrlD+Y1zVI9Mo2LL6+MfaqNuqFzO3UStai1WH1zThf8wK2zwq0Konha
 V9yILw01G2Bk1l9jPJmwJPi3oH1gQBOEooA+lrMgO/YDHV8NhRvBEKyujU1SvRM38+ly
 CgRdzleQ1ibEwrdD35+mKqS+EZAUz+0e5MQ9PnKOj8fjtpFdzBGHIaWsKNqnMoJtFDRp
 oNv0/6mb0nmxL9z2Y8vLAIdOt03gT1vRdnjrExv8qDDyXp57bR/m0fZaQQT4wH2GbnNV 4Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0b2uxha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Apr 2023 22:25:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33AMEIdn038389;
	Mon, 10 Apr 2023 22:25:47 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3puw85pjk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Apr 2023 22:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdSSMv1Kkkp+gSfZm6t9QyUnzgNAaAdZuC+r2RkX8PgBmNMLFhNmkD4WFnPvrXPsQneX48Ue8bjgVoY95ApuISgNVBYLy+JpZX0OIOaXKU9uECD/9Ry6lwWneeGOLZRPQdd2Ez0CH82sLDXQj9LwJqoAnjuVg3kW7R+uQjdpmH/2ZdOx//UXoDSKz2b8dv7I2wAJ9pg/l55RtBKxJVKl7ZaTcgSHCtgfc2WUArJuYcWkerpQI13EZFHoDkH2jXsYVkMQyEOe4TjvzgopTL/pdW61I7xiNd+20WPSsvfQLrwMXac9X4nEwshWynivVIrl74443ni11iEh7EECEknuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da0QgSw8zmF0gWqK01HGQ9/tP1mABNl/fBkbDqq5zJA=;
 b=SnWCIIBprImJu9dBoz/VboOaFj+GCITNo+JzIhADRwfDkJTRFSkypK2wd69vQNfEiGsvz2IYh8r7drJ+iMr8Uhn8SycoabA06Wf/kV6o3hcWCZ2Nt0OZFzV/BarUphqL4JJ2nuBXNXSB1+bb12ufVI8z0JXWUXFEvGB4lVfSn3ikiOst9+pGymoviIQXMEzlV5qprs7VDlbleS+hs/5cxQYkPXiqGUGESqbi3a0YDAOvt+K5VAT0IOSXrsBU66hsHK6a6psTBMBkY8HCyfJj1gKE/yk/YEAtkjc3xeJjdfLPV9onISFClSsanq89jjgNrjmsEI81KO3d3Tr8+sIk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da0QgSw8zmF0gWqK01HGQ9/tP1mABNl/fBkbDqq5zJA=;
 b=uJ/bLasCsfawI1cxhw1CM/1+V7mv46LeqvEKIlVnyvPhhN2LZUgraQes+D7GTBdvj/5xaaynXyMzwigdAblGhCZ7L58KsHC6JmwsrESMW85JR7MohOOoSRrmr/z0nxhnbtVfhHyF+6vsljLLv2ftvx+ODx0e4F9s1X/R1DxSVsg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB5814.namprd10.prod.outlook.com (2603:10b6:510:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Mon, 10 Apr
 2023 22:25:44 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6277.035; Mon, 10 Apr 2023
 22:25:43 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: pre-release of netlink v9 kernel
Thread-Topic: pre-release of netlink v9 kernel
Thread-Index: AQHZZ/3HzAdQBG0JeEaCk2n1lw2eVq8k9kKAgAAY9QCAABeGAA==
Date: Mon, 10 Apr 2023 22:25:42 +0000
Message-ID: <B40DBA4C-C335-4343-87EA-282C9F34F968@oracle.com>
References: <F800AEFD-7E3B-4133-BADF-6FAF610A2827@oracle.com>
 <16EB9884-474D-4449-9F81-2DB1A77B7DC7@oracle.com>
 <CAN-5tyFi+Jf+Ur_h82MzcMcJniMbcuUCMNFtX6Pt=2WF0dQ3Ww@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyFi+Jf+Ur_h82MzcMcJniMbcuUCMNFtX6Pt=2WF0dQ3Ww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB5814:EE_
x-ms-office365-filtering-correlation-id: 526bdfd8-7130-4338-d1c6-08db3a1285b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cGyog0Uwb5+M96KiwRZ0wfzV8Tbc2glGBQSWtv9IGVaUHWDNOg+NVaXjDL1fUZwy0PdyQQCAkXD+y8L6lpPOGw8NLLNN0DcWv7Y9IHUPA5yOd4xg+HlrgfhvWGrjEzukHjjGY85fw/tGFpOX2GR4M2Vj6PWhYSc8+2Yl8DwRbN2iQwL2RwLhkmy20c97LjinGw+UQVwjCEwMGqNAsHZv1KEmKe62+/1lcx/95gVznYhyzTbaKrELOI0KrWKEZHVr70HCYxndwWc1uEDxDcctDi0EFlzISl9iQif8SdntWzufW3YvJjaIB3kyZUKPxVwNb38rBN3TdYpFiwU8LJybETTy/RqFgxClEEfq9gjZ2VANskIWxsAvoi1X+8HRmfLy8Shnhpx49tX1fFfxRXJerodAxZ+O/rvMDO3bpli9IkmFcvzV/PVmVCPVP2XspHAN38nehefrfZYwmQlvhHqoBRT9IRv0+5/B2mHB2X+YC16BEK1kDn7dJX/peRigh0+SEE/ukPgKTsszfLOVGYa9ob8dbW1YGSVGJboznRK/XOIpURW35hG44sIE0KU0Yvo7gw1gWTYfCW2AkNvRIFGqMdrGhcSxaRkHq6NPEztCUjKuHNYclaWoM0tLVazCVhSqjR1LKYOn+iZnUdZmOhbVLueVzmxDsOczKhSAvnRk4qQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(33656002)(86362001)(36756003)(53546011)(2906002)(26005)(6506007)(6512007)(186003)(83380400001)(2616005)(478600001)(91956017)(66476007)(64756008)(8676002)(66446008)(71200400001)(4326008)(76116006)(66556008)(66946007)(6916009)(5660300002)(41300700001)(966005)(6486002)(316002)(8936002)(38100700002)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1ZrNWlTUlNSbldHcHdOUXNWenVnMFh4OGx3a1BUY1JpSXBNN1FKVzJCZVNB?=
 =?utf-8?B?WmczMngxOG9oOC9aVk8yeGpPUEZtYm9DRlByVEU5YlZobWNiRiszSjZ0OXk4?=
 =?utf-8?B?L0lXbW05V0ZOUDFlbnhXNnc1RitMTG1KTWFsZDg2T0grZDFzdUlmaHE5N21y?=
 =?utf-8?B?czI1Vm4valcrMDVERitKa29xdmg2MlEvdXFQSktpNzMwSWwrYWgrTVhzMTAr?=
 =?utf-8?B?UWYwVjNPTVFlRGltc0ZqWWJmS0FXSGx6dmVjMXU5cGU3dlc1UkdrOWNnQ3lI?=
 =?utf-8?B?dlJPR2psYjA1UnBXV2g3Uk9McndBbFIrNEtTOGxxTUl2Yk4zeTZaVWc2STdP?=
 =?utf-8?B?SDdTN2huQmp4M1Y1TnVuS3lqV2p3VTNXQWFKajdCZGhpRHVXL3RCQ1ZvaWh3?=
 =?utf-8?B?NkNOWHU0SXVRT0dzb25ITGVsS2R1THRsWHpBZzZVYU1XcHVwUlg3VlgyNXdX?=
 =?utf-8?B?eTI1bG1lMjNGYnJQZU15SllidlV0YVQ3cXg1elJHZlBqaHJ2eHFPdzR1WU84?=
 =?utf-8?B?TEdqaUwxVkNzdWJ2T2NZZFdZOU5IOUd1ZmNyMTFvcHNpTjQ1UEFSbmJNM2th?=
 =?utf-8?B?dHRFS0I0d2Y3UDR4Z1ZzQjJENEY4cjlnQXBxaklCMkJwelNsWDZrWTVZNmla?=
 =?utf-8?B?dTJQWk5Mb3FXYVJlb2NyelhGczNqTkhRRDRmQ3NWZllGd084UTc1UUkxTjBS?=
 =?utf-8?B?NCtyZXdSZDhaV1F1bGtUeC80SDhsa2NJQnBmUGNQNEFHVFRIMm04dnJVaXp3?=
 =?utf-8?B?U0M1NzlHQjE0YmFnUU1pRm9GMzd4SHZSbUxrcVd5LzVMMno0d3B5Z0RNR0Vh?=
 =?utf-8?B?a0NnMmVVNFBjNDFkczlGb2ZhSjdWT2pUcGhIL1JoQlZUYmdQdisxRUxIb3M4?=
 =?utf-8?B?MVFkZXByeVIwK0xwNWE4WXB4cllJM0hTakJFUEJWODRmTGhkK2RQREFycktY?=
 =?utf-8?B?bGhqK2FFR0RHQUcra1FGZlF6TEI4V3J4b0pFcXRvQ0R5dmFtbDV6ZCsyMmlL?=
 =?utf-8?B?eWVNd01FRGJtTVgveStLUXRvUG5WKzlaTnhCWndPbEh5N3ZoYmdKMy80bEQz?=
 =?utf-8?B?US83NVFuYmNyV3FWZWU0bWFkeXZycUV3ckUvQVBsTklsM3U5bmtWRkdtMDJJ?=
 =?utf-8?B?WlVEdVd0Y09tc3pkc3ExTmNQck1nMHNqWnZtMEtQRURzcWxRemF1Sk04V0dT?=
 =?utf-8?B?emlsVlIyZVVzQ0tUaW1qNmdZOTEwT285cmlMUjVMWlJNaEptVWpjdHZPL3c5?=
 =?utf-8?B?eXF3NkFucjEwYnRuUHFHN1RrN2RvUTJndXg5bENwbS9EMzR0WXVUaWo5T2Zx?=
 =?utf-8?B?cnZQNWxpWGROU050Q1d0Q2lCcVhEbFB4SFdzZmRYRmpRbk9pZ205OUdCWEF4?=
 =?utf-8?B?SmcxeTZRN2RUV2xpTDJ1djVTV3gxcjhoVnFYR045Q3pHWXJMMTZjWm5UMXhM?=
 =?utf-8?B?SnNxaHAzNzdjN25XdktWR1l5UlBZQTZYY3NTQ1NacHJFdlkwWW5QYjBmbnJQ?=
 =?utf-8?B?U0hFS3NYc0grQ2NtQjM2RXFWZW53UzQ2TGxGVUEyL2MwbkZQYnIzTUh2RU15?=
 =?utf-8?B?WXVFbHlWTlZ2VHBobmRUQUdTMENmbEs0S3Q4ZVRlNXVxNUZoeTV1aUdSR3My?=
 =?utf-8?B?ZmNkODFxdSt2Wnk4UGJKZ0JQeTNBemlVMXROWHRWQmV6cUlIV2xOWlNjMGVz?=
 =?utf-8?B?UGxXMm5Zc0tCUGc3UzNENlg1Z0RQSUFrS2RxOTZ1MityWEZhTFU0SXFrZHJn?=
 =?utf-8?B?VlprMVJvN2ltTWU1djlBK09aRkVtQTZPUkx3aElQVmNzS0RUaGZKOExEZFBv?=
 =?utf-8?B?MUllaS9lN0Z1U29RWmp6SEhpaDNWZVc5bDZ3UG4yUjlFckRUaHdlUEFJOXRn?=
 =?utf-8?B?c2VMK0lCcG43clliU1dPdDY5MDN5bGl5NjgwWjJpUTJremtwUnZXSzYxNExB?=
 =?utf-8?B?WVp0ZXlabm91eEh2YVhTazRUam5OMnlVU0I0K0Q1T0hHU1dMd0szSDJKamJ5?=
 =?utf-8?B?VmYzbzdwUXY4NHZFOWpCbk9xOW93VXc2Z2ppVnBJQ3dJVzZFa09VLzJpUFZj?=
 =?utf-8?B?RlBoQndlYitPMTQrWXVZQmhrUGNWcE42QWtCMGNpem92OWxGWkpTQjlvZ21Q?=
 =?utf-8?B?R01YSG53c0FTbXVTY0dPb3owbEJWVExuM0F4MXF0RHpOYmRZYVpqSjllOVZY?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C229579446BB6408716BE90E9242C70@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IpEg6zzxUpvUwiyZORdRSQWKSRDfjjafTjUUXn857TfMtiisPSWe3pw17oMbsQncxb4upBLu991zpfU0d6fC+cqf7hk/4hra8xJlNk97lmftz1KPa6G+MrvHq/t1H4/ya/SOnuH5JZ6cdpcSfrdJuBQdwpSXkZv1WHEL9A3m5eHplTKboBVlD862CaMMoXH+yhH8M2VEUuBc3PjKIioEBE+Ffib7hiPUBtwONgcE1avickpm5b+80L58jmLcf7SCcVA1YuZEeE6I/2x4PnOUrCys1g6kbZBrBenUorFtPVzB3u5SAjGZjuEe+0E3mVDQ3O0PLlLh44VJnY2CQ0UixjByTAShw6yI48IBMF4vPIk2/N/J3mHPXKlDiyiAftSuLB9IQtnTTFjYScDrs6KoJAhsZZnNc5YZl1dZwdkBvp9G39EzEzyILoBlgZQi9tLs26jvrArkMJkeTxgUwtH8AfdHdbA2PyYaGD1NQP2+OQTz6iVHRu33p47DbOiQMyA+OQBk7117BQNi+bfrrQfVUdLNDgncMnNJdv8E5nwwN/srwBeU+GXkkhsDRttW/lSHdD05HSohN3K1klYPCCJbKa9EHXpdQdbGzfxJXNcBP/LrFUyK56kxyWFgy3VqGkEhutKqtWD10MKMypwbuxtdaktlB85Oyqde9WPKjVHqaJf2b7pwg/1SyHtGCWEyGqyTlF0BJWFVV6Hp+8jPR8+lMB1IR36rAkpDAibzjbEguWLsTwdd9tqnHfj7bvSBFEsvdFEP2j4anobjeGeow3KlU1QPPkmgvY9NPMny0yg5cEU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526bdfd8-7130-4338-d1c6-08db3a1285b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 22:25:42.9474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pc8YFOJ8PCtE/dr4DME8F1gY9fgBBdIHIjM/x7/xT3KdF5MfPrwS6NEFZG9C0eRuH0z9M39DQ7sHEAURRHiiaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_16,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100196
X-Proofpoint-GUID: ghXLxLKvIYmoFfwwklVW5G2FoZG-GfQB
X-Proofpoint-ORIG-GUID: ghXLxLKvIYmoFfwwklVW5G2FoZG-GfQB

DQoNCj4gT24gQXByIDEwLCAyMDIzLCBhdCA1OjAxIFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWds
b0B1bWljaC5lZHU+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgNDoxOeKA
r1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IA0KPj4+IE9uIEFwciA1LCAyMDIzLCBhdCA0OjMyIFBNLCBDaHVjayBMZXZlciBJSUkgPGNo
dWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEkndmUgY29sbGVjdGVkIHJl
Y2VudCBmaXhlcyBoZXJlOg0KPj4+IA0KPj4+IExpbms6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NlbC9saW51eC5naXQNCj4+PiBUYWc6IG5ldGxpbmst
dGVzdC0yMDIzMDQwNQ0KPj4gDQo+PiBIaSAtDQo+PiANCj4+IEkndmUgcmVjZWl2ZWQgYSBjb3Vw
bGUgb2YgcXVlc3Rpb25zIGFib3V0IG5leHQgc3RlcHMuLi4NCj4+IA0KPj4gSSdkIGxpa2UgdG8g
cG9zdCBhIHY5IG9mIHRoZSBoYW5kc2hha2UgdXBjYWxsIHBhdGNoZXMgdG8gbmV0ZGV2QCBsYXRl
cg0KPj4gdGhpcyB3ZWVrLiBIYXMgYW55b25lIGdvdCB0ZXN0IHJlc3VsdHMgdGhleSdkIGxpa2Ug
dG8gc2hhcmUgYmVmb3JlIEkNCj4+IGRvIHRoYXQ/DQo+PiANCj4+IChQbGVhc2UgcHVsbCB0aGUg
bmV0bGluay10ZXN0LTIwMjMwNDA1IHRhZyB0byBnZXQgdGhlIGxhdGVzdCkuDQo+PiANCj4gDQo+
IEhpIENodWNrLA0KPiANCj4gQnV0IEkgZG9uJ3Qgc2VlIGFueSBzdWNoIHRhZyAodGhydSBteSBn
aXQgY29tbWFuZC4gSSBkbyBzZWUgaXQgb24gdGhlDQo+IGh0dHBzIHdlYmlzdGUpLiBJIGFza2Vk
IEFubmEgdG8gc2VlIGlmIHNoZSBwdWxscyBzaGUgc2VlcyBpdCBhbmQgc2hlDQo+IGRvZXNuJ3Qu
IFNoZSBhbHNvIG5vdGVkIHRoYXQ6ICJJZiBJIGZvbGxvdyB0aGUgInRhZ2dlZCBjb21taXQiIGxp
bmsgb24NCj4gdGhlIGdpdHdlYiBwYWdlLCBJdCBoYXMgYSByZWQgIk5PVElDRSBUSElTIENPTU1J
VCBJU04nVCBSRUFDSEFCTEUiIi4NCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvY2VsL2xpbnV4LmdpdC9jb21taXQvP2g9bmV0bGluay10ZXN0LTIwMjMw
NDA1JmlkPTZhOGQwNmRlY2ZkZTg2Y2M0NjRlMjdlYWRjMjllODQxY2RhNzkxNTENCg0KVGhlIGZ1
bGwgd2FybmluZyByZWFkczoNCg0KICAgTm90aWNlOiB0aGlzIG9iamVjdCBpcyBub3QgcmVhY2hh
YmxlIGZyb20gYW55IGJyYW5jaC4NCg0KVGhhdCdzIGJlY2F1c2UgaXQncyBub3Qgb24gYW55IGJy
YW5jaC4gSXQncyBqdXN0IGEgdGFnLg0KDQpUcnkgImdpdCBmZXRjaCA8Y2VsJ3MgcmVtb3RlPiAt
LXRhZ3MiLCB0aGVuICJnaXQgY2hlY2tvdXQgbmV0bGluay10ZXN0LTIwMjMwNDA1Ig0KDQotLQ0K
Q2h1Y2sgTGV2ZXINCg0KDQo=
