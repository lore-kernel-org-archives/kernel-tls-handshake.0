Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713863AE
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 15:33:48 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335Cx0gm005144
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 5 Apr 2023 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ijIuYU0hdnImbPMoAY7vXSS1U+2DTVRVpRA9ajPJhs4=;
 b=i9JVYfA1qNVYIuyM6TvTcsj2qfn+8ThDsa9Pb1aOrXWvti+MTZOZYDXlK6AfoFAwXpG2
 ojK0BoJfCnCgn8WPDgIyz0QGFn6YN0BeFiKxrevSyW4wbC/5FEhAeRH4pxpZxrC+mFRn
 xCO8PMrbEP5EwUJ87tbuAkHBMfYTfIBA5sX47qB2M6X6lf20M/D0Zcx0O6X5GAWEmm0K
 /QTbalwbxdf3MymrKyL0soWFVGksbaPU1VsxAzzs+M9WyV+cR0ORUwLqS8C7Hk+pDzCf
 A7+tgT4UuB1SlLBesj966fNU/PwDrkhqYlym5Zsnm3aeChiJzlzOKEP/5iv+LbpHX98f yg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppb1drnm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 15:33:46 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 335F5hZU037964
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 5 Apr 2023 15:33:31 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pptjtsvqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 15:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFGopkTWF+n8/P4fkEPkYP7TBGEMncwb7Aub3MkzBDpit+6Xvy8352mIcIS2sz7sBJXXGAdCXOOPOz4YgZvUWsH7uIzsscRgVfNTWkG4rX/jT1c1kKADHYzbLaccJcjrMvMFrCtKftx2WW/OwXxT8LG+NwyhexCGW1sc66JF+aJpoQXrFQaCathPQjDdZSbgAnDCZcWJ8ZQshEzypQ/Fen2/N/te/og43n+S4HoG1rDo+6dlc9X7FhW2bgWvrZdKwAeo+dkyUzPRtxd7gXtRlHULSCB9ePLDAwm91OOrOcmUrCoCF/Wz3eUuAG1pwxEK6hsYDvrkKJDB9TDO9y1kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijIuYU0hdnImbPMoAY7vXSS1U+2DTVRVpRA9ajPJhs4=;
 b=NvUFaFnUrQqhD8DxQohO0B9EkO9f+it+V1GmJ28Bq3jrSnLNJU+MmNKgOYiV7vyA80iP83yajyo7DCB3sT8on8qU2wl1vIGb9xtV84CFWT98O3ATLmrqadm6nphfWQaz3M4g7CuKeZ64VEIpWDOUbsOtbwlwLsPJd6kzjGZCao2BZLoBURQycHe8bbKaFcOIxf3N6aXFueaLCdFPRVpUz5rHIr3UjejvYPNlcp1jRebPGK3AAC1XqFb1HLmMNg84kWlP5dGiOlhOZSoLe5kJJcYLnHtSp7J6Z2Tm333+ukwjenRaRcWS4EJJvs1RA/FGZOrfm81V2n986Ve5PfTpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijIuYU0hdnImbPMoAY7vXSS1U+2DTVRVpRA9ajPJhs4=;
 b=uCVQcr7jeSTtkiqcV91OYrrcRC2bemddgkJPnvD0am4SJmyRACvxdZWeTodVX9rKzNsBWaBE0J4JMLb4V5DQxSo2PqThAwf4PrQn1M164zjJBRZf3dVZMXWNpEJ9DotNDjlttCKQSh1IuBQ7cv9N5YADsCPPOpahY1QcMowSnzM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7356.namprd10.prod.outlook.com (2603:10b6:610:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 15:33:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 15:33:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Fwd: [oracle/ktls-utils] Release ktls-utils-0.8 - v0.8
Thread-Topic: [oracle/ktls-utils] Release ktls-utils-0.8 - v0.8
Thread-Index: AQHZZ9MHdrqA+lPSvEuiPmIErQ3kJQ==
Date: Wed, 5 Apr 2023 15:33:27 +0000
Message-ID: <2DB753E8-F31D-4743-835C-FF5A69C39787@oracle.com>
References: <oracle/ktls-utils/releases/98209506@github.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH3PR10MB7356:EE_
x-ms-office365-filtering-correlation-id: 41b1bec8-b757-4860-ea0f-08db35eb19ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Il0Jux6+mIUeTaS8bgSuGgCcCPKRANkEz2klQtITHQ+Wb2aYkTK/2WRm+rRjO+ZHcmASGeK+Jsoz4xI3c0LkNRhylKOTvM1zZKF1SUK88Pg1E4QBUhgD1Pbfqj4w6Igi9EuKIkEK3Kq4kyLnjq7ailwCWGRHr/T/UCOzP7TwH9Hd9HfmXmcaXBdmxFZAyKJ3YsEjKdzDB5dX9uEL5/6NFfskJkQCMK/OVM1/T7zClUmVdGsQXmYLYHh3UuHugZW7IPeglTjxJ/bA3w2yvmFLdrwY8f5bXUxPBsU1fIiBDttBioqjP48ava7HeEfwtvzu+Pn0JCMf3g/GMs2N/wkUQCDX5a8uny1b7kBkhmHsQBfCnlrVREdlX2gBq28uXBWH8UKFIhbGxRcMRrrSk8WHuy5JA/eBxbLBTQbYwZzZVlnhOCbh5p7IJqEtezUwnp5SsMNROrVNqZP3msKPiaoIG5hbi30eT88/bP5u/M3JgrdCpxJo/+H3wjTL1uQ2P4iYSYhNDNe5VpXkOzd4/YEWS45W2Pvkz/Z26FsO3lOT63NXBLO3gWKjpekz7FqlHeGpI2FCSlz2odv4/VBBe4K/kgi7GwnGWQqlHeF/ioeGufoI62FBLAVQGWwAG49I6uglbBgwzPzDcLjXDx0k2Y1LRw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(76116006)(64756008)(66476007)(66446008)(66946007)(8676002)(66556008)(478600001)(6916009)(122000001)(8936002)(316002)(4744005)(5660300002)(38100700002)(41300700001)(91956017)(6486002)(83380400001)(186003)(71200400001)(26005)(6506007)(6512007)(86362001)(2906002)(36756003)(33656002)(38070700005)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TWdqZDhITkxSY1FycVcyaXdzZGd2alhaMjZPOEJnZENmYmNiY0haWUVaYUVE?=
 =?utf-8?B?S2xnLytUWXZDSFMrMndnSERmcVF5a29ycVI3cndWbnZzcW44VXF2SmRXMnVB?=
 =?utf-8?B?RDZBL1hpUG96dGNpNWhWQTRQUXN4bDhGakQ5MjVFMWdvZjRpRWV0eEJiV2hS?=
 =?utf-8?B?aERwcFhHZ3J2THJoWkZqN29QK3pCTFp6VGlJR1hsTjlQZVFueHNXSDh2Nk1W?=
 =?utf-8?B?cUlvUXg0bU1DMCtNaVJteDB1TXUxOFZKT3JQTmhPalREQytVSDZxcjdKTG9I?=
 =?utf-8?B?anBXMW91ZzhiRmxlcFhwWWNDWG5WTnJPSDVwWURBL00xQXNPZDdCM2RKV05z?=
 =?utf-8?B?dmhXOXhtWWNRNGt3RVMwNXQ3eTdBWXpnQmlUbTJTYnFacmVXeG9HS2pNM3ZN?=
 =?utf-8?B?aTJ5SWpxc2ZEM2pjWXlBQ3JKL2pmaWk1QW5CMlRKajhqNWlUZmxjUkxaUlh6?=
 =?utf-8?B?YW50NjVkSzNXR1ZLS2tmT0xvYUNnRGtGT2t6ZklUa21pbnFVRnMzbW04ZE9E?=
 =?utf-8?B?dzdnU1dMMkp4ckd2OWJKejk4a29ySDU4Y1JOdXd6RUs5dUNXM0F1S1g0Sm5L?=
 =?utf-8?B?R1VNM1poU01QRndQMzdZVG1OWFo0TC9sQ0xVamRGWmNMYzA3OXFvQXNURWRG?=
 =?utf-8?B?MjFwMjdlR1NKWDZLS053SElLd3ErTXdXM1ZwdGhveGRxU1VEc1l3MllXNHpv?=
 =?utf-8?B?YThObFlDRjl2cUpPUzZvK2dJcDVSVUIxWS9XK0pNNEhUYlMvSTAvME13aDJq?=
 =?utf-8?B?MjRvNHlpK2xIWklTM0MrdlZSWXZpZ2ppcmZpbXNvUGplRzZ0WkZUK3pZUVNz?=
 =?utf-8?B?cGIrd2tTME50MWRVZUJna0VlR3ZIQlgzVUlZYVMvRHh6cmxjQlIxZ3hpVmNx?=
 =?utf-8?B?Zmh5VzQ3SThXaWJBd1ErTGJ0OEx3ZEo5NTJKTDFjd0J1czN2OU1STWNXZGN1?=
 =?utf-8?B?bHptdWxnaS8zUFpWRzBCRXVxOXdxTTFSWFVPWkl4T3ZUVmxzN3JBSHFGOFVO?=
 =?utf-8?B?ZlN4SGxSTUJyZXRvS3RkMXlxdEZ2QXhtYjZIbGZuaGQ3dk5Oakh4NHNIczQ3?=
 =?utf-8?B?U3ZyNjlJTFppY09TZUE5bnhCbmYzbGY1MWFNQzBvS2xuY1k2ckpETHdOWm9N?=
 =?utf-8?B?NHJhUTdYYlB4N3dJYmlZNHpTNStMWHdob1NzSDFQdXE1bDhYVFc2QlJ6Y1Bj?=
 =?utf-8?B?dmtZZVUyY0MyUkdGK2h6UEpMS3dvbytjaW9OMVFlaXVQcmVCdW5abzNNWDhH?=
 =?utf-8?B?MzJIMzd1MVZXNCt3Rk85bkpaZ0xyTXlONFhXbjVQZUVCVnBqa1lHQkpSVG5a?=
 =?utf-8?B?ZEJFYkZHa2NqUjlSUldldEpicjlyNVJraTU1M3F2S0g0OWtGOHJYTkh0MW44?=
 =?utf-8?B?LzZ6WEdJc0VuOWpHSmZSMmlFazEvMlkvb2lyLzdCN2F1MFU4bFVzM1pXOWc4?=
 =?utf-8?B?NGxPYTZ0dUg0cTliRTJZNFpBU3grSGFCYUFLQnY4eUU2OUg3cElaQmkwQ1pl?=
 =?utf-8?B?eFR3Q282Qnd3WDBWTURHbUNPUW03MXgxUEFSUk9NUGxXeWpCV1NUKzhJOERL?=
 =?utf-8?B?b0NUVDRzenBHWXNTd0pkck9JWjFJUURkdUpVTC9udnJFVzFhTkFCMWZ0YVN4?=
 =?utf-8?B?MC9zRFFyaERRY21CVWxSR2VkMTV0VWoxL3VKc28vcmo3NEVSVkJvT29kVE40?=
 =?utf-8?B?TVQweGpheGl4S2lXLzQ0UmJlQXJ3eVJtYVgrODc0eWdlYnJ4NmpuZHI2TGNn?=
 =?utf-8?B?QTM0OGlSem8wSDMxK2hDRHBvZmNqem1XTkJhcmJRdm1NcW9YRk43dUQ3L25h?=
 =?utf-8?B?Zzh6YXVvc2lLRVI5WnBJTzlDWnkzR3J4dlNkK2RYZHhIQ1VybWNIcml3eHBm?=
 =?utf-8?B?VW5hbHNCejdUWlRWbVBJcUYzSnh5MVpJeUZLRVBxbHBSbDB5VWxmN2dROUQx?=
 =?utf-8?B?OG56Q2g4VDlySm5LZ1VJZ2twdTFOcXZNNSsxdlNVMmNzZDZtTldUSkt5NXVS?=
 =?utf-8?B?OVh5Z2xvbmgyYXB1UWxUYldrWGdhbTVkMC9KOGU5cTZWSW1CdW04ZStLUEtS?=
 =?utf-8?B?NkJNNWp1WUo1NVRHaHBUZ1l5bHlyNVludWZVendrOGlKZm1ySHNwUW9xSGY1?=
 =?utf-8?B?d00wdC8zNDEvZDJaMGFSYnpGRFJVc2d6cjJ5UXdyYmVUMlk1N0hWZDQyQVZK?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <009D8F0071ABE642B0A8BE83411F88AD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uKwxx/L6pyuHiM1wI6VmXbysIV+4T8+J3VVd5tlNk01WO7NyqYEZT2I41HQZopgVEQ/jz6eizpO2gFbAG4BKvbg5xnGxIt9aLvNq4VyKAUcHohRKS59QuLCE77RGVVrO+dV8VG677+N34cehnNfT5f/ByV4eZKxq+OAJbni9+xVXYDBmZ6oegiMHC7JOYnge+2nc+ePZNgUfszNyRxsrw7TdKFQvoG6qyGpbpPdsEkT3pqg61AVuVtWrYjTflRRahovDnW/cJdtyKeIspV/XgSl42iJ/hfuNIVmLhgsFlLYlivrda3+eH5JwlGZa81N0+N5XBL/z3VZ7CYqJQkp19Zx9A96nhrn57EKkowwMPeFSxYtQtNkUxL27jWoeLgnVbYqt3WarwFWuVjnmkJBL+rZY4XEi4/LTebC+KWGrv0fQ/BOYpC3zyg5scBK304NUECAbKuI2lx9WoJe2Nqt4BYyy64Lrc0ZSHJeFPjnVcaEgP/8PQ/Hw6pDX3TokmMhtq9TdYe6C8h9cBmlQ3m6mAIxeE6VuxX0yOdMBZVtx/TUEF+ZvFk/lPQuxMpjvTEGnOwc6I2EuTfCs2X8cN+9Is00VGnV4vbE51R1rh9Byq4OhhVEpWl3gZn5Iv50LKAvQtv/vGYVLH0XVDKEW2ZirEPdtnyZ3xOaBhInXPt6IyJoEWP/ftN8okoSD9hBorVPcACk++XZLwBwYG/R0WIACEfN3oE13jc5pWr9T3a1y/xIFAyXNQxzGxPxfxYdUuWq4
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b1bec8-b757-4860-ea0f-08db35eb19ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 15:33:27.1274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guZKQvQ/OdXGC6iCa8ZdsYoO2F25R6V2gqfaoJyPuk0Z8xB6AK61b8OC5spZb7i3fDzVerG3+7FERWq6azua1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_09,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050141
X-Proofpoint-GUID: yL7N4tBhcYZz7BiVHIz0PsWTJDEgJ7Ij
X-Proofpoint-ORIG-GUID: yL7N4tBhcYZz7BiVHIz0PsWTJDEgJ7Ij

DQoNCj4gQmVnaW4gZm9yd2FyZGVkIG1lc3NhZ2U6DQo+IA0KPiBGcm9tOiAiZ2l0aHViLWFjdGlv
bnNbYm90XSIgPG5vdGlmaWNhdGlvbnNAZ2l0aHViLmNvbT4NCj4gU3ViamVjdDogW29yYWNsZS9r
dGxzLXV0aWxzXSBSZWxlYXNlIGt0bHMtdXRpbHMtMC44IC0gdjAuOA0KPiBEYXRlOiBBcHJpbCA1
LCAyMDIzIGF0IDExOjI1OjI1IEFNIEVEVA0KPiBUbzogb3JhY2xlL2t0bHMtdXRpbHMgPGt0bHMt
dXRpbHNAbm9yZXBseS5naXRodWIuY29tPg0KPiBDYzogU3Vic2NyaWJlZCA8c3Vic2NyaWJlZEBu
b3JlcGx5LmdpdGh1Yi5jb20+DQo+IFJlcGx5LVRvOiBvcmFjbGUva3Rscy11dGlscyA8bm9yZXBs
eUBnaXRodWIuY29tPg0KPiANCj4gDQo+IHYwLjgNCj4gUmVwb3NpdG9yeTogb3JhY2xlL2t0bHMt
dXRpbHMgwrcgVGFnOiBrdGxzLXV0aWxzLTAuOCDCtyBDb21taXQ6IGEwMDYxNTIgwrcgUmVsZWFz
ZWQgYnk6IGdpdGh1Yi1hY3Rpb25zW2JvdF0NCj4ga3Rscy11dGlscyAwLjggLSAyMDIzLTA0LTA1
DQo+ICAgICDigKIgUmVwbGFjZSB0aGUgbGlzdGVuLWJhc2VkIHVwY2FsbCBtZWNoYW5pc20gd2l0
aCBuZXRsaW5rDQo+ICAgICDigKIgSW1wbGVtZW50IHNlcnZlci1zaWRlIGhhbmRzaGFrZSBzdXBw
b3J0DQo+ICAgICDigKIgSW1wbGVtZW50IHguNTA5IGNlcnRpZmljYXRlIHZlcmlmaWNhdGlvbg0K
PiAgICAg4oCiIEltcGxlbWVudCBrZXlyaW5nLWJhc2VkIGV4Y2hhbmdlIG9mIGF1dGhlbnRpY2F0
aW9uIG1hdGVyaWFsDQo+IOKAlA0KPiBUaGlzIHJlbGVhc2UgaGFzIDMgYXNzZXRzOg0KPiAgICAg
4oCiIGt0bHMtdXRpbHMtMC44LnRhci5neg0KPiAgICAg4oCiIFNvdXJjZSBjb2RlICh6aXApDQo+
ICAgICDigKIgU291cmNlIGNvZGUgKHRhci5neikNCj4gVmlzaXQgdGhlIHJlbGVhc2UgcGFnZSB0
byBkb3dubG9hZCB0aGVtLg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
