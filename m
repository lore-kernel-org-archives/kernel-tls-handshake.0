Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAE6D1BF
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jan 2024 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mEn3czty";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vbE+E86+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40CDOBRK030184;
	Fri, 12 Jan 2024 14:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=06gAC9kgrDTSZrpHju3Th4whF9bspfdkqhGYPX2WcTs=;
 b=mEn3cztyhdlRL63GUDxziFWKpOaZdWBqsDqBtDma/LWnPqTUchGmrwqTfI9GIo8W7mjO
 7qi1HKJtJbpCbcdO3bILnuet5o/iVsrw2avtll9wpcWX53BOfHkHN0C5uWkpmXEC/t7M
 s+gPv7FBatXcoq4kgsJSp/C/U3S5gH103jTgKzz1MJHPUpCGNSGeRln6hKQLK3ZvvezL
 oEE8v1P0S3n5LFg7JMStYcqSZDPB+K1/9dSfrZFqE/IhtZJ7SlWZhPsnyRnDKLy202f8
 r2H2pMfnyONuprSGnMcuzYQwQL4OmgHGhBQ3FpjjK0U1X5D+5OpqKnPiEv7CEQpyY+mN tw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vjcbkkk1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 14:06:07 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40CDGUZW008832;
	Fri, 12 Jan 2024 14:06:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vfuupragn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 14:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyGasx/IFp3bcyx/YPp2TDgyQHrtMmEcgdxjTYb+KW7myWo3sRIWmk1gp9fHddEzEW7Q/L+Cqtjv66PVFwhTM1hgGzKFITLk+S0fhGXcf4s5rUo40zYtOhyZxGugE19KyvZ7t0JjurU2tX8dd3J1aix1mb9ppSBIXBzYZS+rWxJC4uR0DfvgVR0h6Q9G4ZUd8CD7epXZIGU/2JdnYtvN3u7rkDP+iQe0gOae/4DIKo0Wzrhl75rlPLihSAFRZLNN/zBnja/Za/+nw5F9L1EajT8LTmzooZu77bG/wf1vcMk5Kby1Cvsu6Fs7iqwaAuR/U3Vcrw70/4psZblSsamEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06gAC9kgrDTSZrpHju3Th4whF9bspfdkqhGYPX2WcTs=;
 b=MV7Q/H1ljozF2vU9LFHcMjfvfDXDDbgiYq7/mujJ8Qb6QWD+td/Zzej0Nvp7mgX106L3N4jJkQ9N1axVtK3zg2lZ9EheaZ3cDdVFWP406uIoaL6fIU9/lr6m5tJ/QAqjawJnLRn7i+b4925fML5cxvy8C09fuE8lmqcJLnzDK51DOMXe7zojCAiVKSJ/Fx+IhZo9zxx8AHlbE5YPb2XtHBHEY5twvcT7s8KxmssmvCX6+73LX9gZy3L82mmZBJg+M82kDk7lHCW11Jd26hMTWGwduUYpL4/UOA4DCBn3JBlZZTMmoBqt0vA7riPE0YPIK/EGoFhoNPFePsDlb9sWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06gAC9kgrDTSZrpHju3Th4whF9bspfdkqhGYPX2WcTs=;
 b=vbE+E86+GI8zqlk5ScMWt4NZFHwuVNCNFjNLsWFC2pYcDl1Or88U/6T+u/9b5l8IEDGK0NatNfNjaMA7Ao3t633aU74KVmlBRinAzkRKPSrwXxJ0hsvr5Yz+woZtCyLbZKg8VurMJlFA/wS9jWvHQtF+011T/I96QhTjitj7m2k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH2PR10MB4280.namprd10.prod.outlook.com (2603:10b6:610:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 14:06:04 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4027:2de1:2be4:d12e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4027:2de1:2be4:d12e%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 14:06:04 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Daiki Ueno <ueno@gnu.org>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils and gnutls
Thread-Topic: ktls-utils and gnutls
Thread-Index: AQHaRTNAg8RteErk7kS/VCFd++G4vrDWNoMA
Date: Fri, 12 Jan 2024 14:06:04 +0000
Message-ID: <565BE265-C1C2-4AF5-A668-C5087D258017@oracle.com>
References: <878r4v6j0t.fsf-ueno@gnu.org>
In-Reply-To: <878r4v6j0t.fsf-ueno@gnu.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH2PR10MB4280:EE_
x-ms-office365-filtering-correlation-id: 418bd428-b555-449b-a39c-08dc13779d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +RXTthS9QeuhPgeouZ9Ee+V1H8/tiwaYo92SE1kxNsoWdhiUZzjiZ5AZ3Paka6Qu8aASCV+eUC+R4x/2aHptKfgXg6RMVbG314VrTOqHk7cMc2eUC5zUI8oEqqEuPGT1DhBNNMGYR/PEdL0VJfWE2FJKQlgzYyAvK7NKR4OCF31kmDBmCTelmzb4Hx034eXhzdHizzB5uTToO/rjjdqDa+1VP0LznaasDftAvWb8Bk9f++XtQ9NY5XI5dfUVO2HUm1mrZQwZl9J6GO60gccErN+DXkFOqOuLNsZbd+M3qEPtzS10wxHespxzlIUqIRQjio2cyrmj7CeaGKTto77ARjUIohQ9MK/gCGD2zo0uucWzA+N1/HxuBTsU1OsGxNV3H85rVOESaUpF2BcI0wLn+QkzBozfZ/8dcN0d+tCYI+sFk9zjflfaGuDcm6QywK70x8YF8QD4vNHrVlm7HLYHUd7OiVAzZkAY7gntu94bgcgdJj1ykdsgXiA31vSiDJwAf4mmDxbWFeSlQWCNxFqGDaMW3Lv8Sal7TKQAjQG9e4rif3Sq1KeqvjfBG+dJAM78wy1u0iALyyfMXwgnMQkgoK7krcTeZ/zhfGgkSNpzi++1BogweVe0KlBzmXLUWNoVm0UCwnFZA6x6yse3DQiDA3ynr5rddzhXxNd3+NJUmjs/oPS/QDUeii3LOHHaAT8/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(83380400001)(86362001)(2616005)(53546011)(6506007)(71200400001)(966005)(478600001)(26005)(6486002)(6512007)(4326008)(38100700002)(36756003)(122000001)(33656002)(66446008)(64756008)(6916009)(66556008)(66476007)(66946007)(76116006)(8936002)(8676002)(3480700007)(316002)(2906002)(5660300002)(91956017)(38070700009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UUlDd1B5c2ZIRWo3WEtMNHNYbmxnbkp4NEo2VDdXSEZNRTNzRENpSTcxdWk3?=
 =?utf-8?B?MWNRZ09QclRQZ3FPOG9LYWdxQ1hsd1YyNVB3Q1B4Y3BxVC9UZ0J6eXh2akdD?=
 =?utf-8?B?NVBZUlJnQXUyMFkvcTZ1cEpjYXVKeHUwV05jQlJGUXI2TmdOVEVWL3d3bWR1?=
 =?utf-8?B?WUdKQm9DenZ3UnBQUzliYm4vVUt0N3dEV1d2OEljcEcyNWgybVc1MmpyT1Nw?=
 =?utf-8?B?NFFxT0Z3OUcwRncyTm96cXUzL2xsYXAxLzA5WVZ3RytFdEF2U0Y5bnBCTWEy?=
 =?utf-8?B?OVNoRFRTWkJXM2pTMm01dGRzOVMrdzFhTXdwZ1ZOZDVhYmxZMTIwZkdneVBs?=
 =?utf-8?B?NURiekoyNEhZc1JvRFZ4NWgwSUdaZlF5bXA0OFdxaGp6WjhsZlU3RFc5QmN2?=
 =?utf-8?B?M3UraU41bVlUVTlqNkE1TnBXOTM4TG9FZ1N4OGg3alpENGhVL3IrbzBYZVNp?=
 =?utf-8?B?czc0Q2xobmMrVkNJa1haYXFuWE5YNjZqWVFMQzRIUHhXb0JUaFRnSVNJTFFx?=
 =?utf-8?B?b0YvSEtXTk1YZ3pyUDAvalZwNlAvVUNkUnU5TjliZTdNb2hZTFNWMVgrSlVC?=
 =?utf-8?B?bjlZUUlNTXJuVU9URDdBNzY3c1NKS0lJQkd1bnNvN3FpRE5HcWE3UC8vZENY?=
 =?utf-8?B?aVJ4bDdoa3BqMDRvdHkrZ2NvK0wvTHNiZkF6YmZkZWU3T0hGSTdPK1p3dWE4?=
 =?utf-8?B?emFkeHhoRzhXS0o0U3dGWnhZcFpCRWV5VHVqcC9sV2dYQ2hQRnA3WjZyc1Nm?=
 =?utf-8?B?bkRDRW12NDNKbFZiMmdQTWFscHlyRlc5MTh1djdVTkczTWlyYitoWmUzUFNw?=
 =?utf-8?B?VGhRbmE1SUdiZHJ1RytoZjhVNWRjZjEvdmNnYVoraEdqalpQL1g0WGR2blNI?=
 =?utf-8?B?bFZrTEd0QXZxRDdBTzZRZVIzdUd5VU1ycU5KeDZueXIzZGdKYU5IRkJTcHJE?=
 =?utf-8?B?QmI3cjNqUVpybFFBMGMvVjZUa3Jva25pbU1sbGhGcHk2eG82ZmRJZGxKVFdV?=
 =?utf-8?B?ci9yQUJabG5mSVZuejdRb3Z6VjM3ekN4T0hnTkFhUlFzM1hkS0JqYklRallw?=
 =?utf-8?B?ZU9DVnB4TFJLY293RVFESVAxOVFXK0trRHEzNXRJQ1F0UGJtQ3JMVkdZc2ZW?=
 =?utf-8?B?NWtqWDVaMGgwWGJ2SVZDMFVHVkZmQVVSZ2gycnFTaVNVaGNsVkd4WkE1QW9D?=
 =?utf-8?B?R1hETTI5SFN0Rk02LzYyTGpyV3I4RG9DWldJNGwzRUtYLzkrcUdhb2NWNm4r?=
 =?utf-8?B?YW1NbUU5R2RrVUhlNk4vckNZaktibFNaZ3pwbTkyeGRKb1JwV3U1YlpEdG5r?=
 =?utf-8?B?ZlFKL2d2WmRaN1d3cUhyeHZVTXB6WWxvcFcwdi9iYThsNTRSRWVhUi85bFd1?=
 =?utf-8?B?L2dlRWswWm12ZDB0ZmZ3NUhOUjhVQzd3a3JDN2xFRStueVZIbjFZQXdKdlBq?=
 =?utf-8?B?eXlvMDZkYndFNHUxclp2T0x2ck1zK2xrcXdoRytjQ0RGcEV0NGRzQVNpRHRF?=
 =?utf-8?B?eERndGdZajkxcnZsdGpJNkdYaUZYVTFEbFVSdDJvcmlvMGl3UHU0Z2VTTlhk?=
 =?utf-8?B?N3BSVG9OSDVCbytYTEx0VDNiWWVvZTVmbHN2WjdDNHVSREFRUWd4M201WXpz?=
 =?utf-8?B?Q1hwZHlJSktNWk54L1lPNUNscHlpeC82UHFuMi9uRTJrbEtya0ptVVd2OUs0?=
 =?utf-8?B?cmxlakg2TDhMKy95dUJWSGxjc1p5ekJIYVUvTG5KellMbmRGenN3WXNjb0p3?=
 =?utf-8?B?T0tuVEZtRG93bXk5VTQ4dWRaczlzckVqM0I4TzFXampmZ2Ztc0V1OGNuRmdZ?=
 =?utf-8?B?TllPeisxcWdHMm1FZWl5OFZGdjVvQWU0WHFiVC9PT3ZJcUNMS0Vsb0hRenY2?=
 =?utf-8?B?NTFSS0NVeXpwRHcwS3RhMmtzUUkvNUFPSGVyTEttKzI1bGZDbisrYXgvVnU0?=
 =?utf-8?B?ek1IaCs4Q2o4MFZWeXdLZVh3NjdxS09iR0ZWbGRDeURIQnYzTkJsdDF0ZGFD?=
 =?utf-8?B?UHk4TER4dzdVUTdnSVZhTTh0OFJoVzJJZXEvc0tVUTBuckxsSlQ5QWR1eVhm?=
 =?utf-8?B?Umg3K1p1VmdHWnM1MDNWN3dFeGFSWjNVNTNFUVBmSjQwZmVrWmd6eU11RzBn?=
 =?utf-8?B?TC9qZUd3MzRsK2dXa1dKVlFpakIvUDd3RFNlL0J5SW91WUN0UjYweWErNm9q?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D205F05EDEC2945950B2A5C1600510D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ha6EFf/SGAU+XPga07egGHlkzo9ckYq8vfp+0lGQchbukVNEcM+jowwmdAsJQTrKNr1Mo50wAp9XpvztzyREekYSp38OG/GSXhnRCi/gHky5wfcSlzDK2qslTGOIwXPSga5T0y/zyjGXwcheXekslUgfUMudZnqsQVW/FJpCvCWf/wlpbRSuuQUZorgERiQ4+iWGhGhf2E/fG7KP2cQx0LqznzxylgFr+rxP4n7FRBoC/65DyAQV6qpQeI69H2NHtzKTMmUUBHPUbiLq+WBhAKJEuWA2PhiOSFZ0GkzKXJX/iQ7maNjF1cMx/hJBK1TItYcKItQ5HwjjDubxYAtojZ6Ef0g47OEHDN3rn65JIak96LID9wJ6TPLDF0+bAsAmRzmEEx7BAkNI1lExaPPcwGUAgdXowXrTjq6WBj4tEpFtZD4nDOyhCOIBYq2F1z4JAFhSneKGOG1bygvbWqDUCx5spIZy4J0TUNS3AuHF0XGZOikGBrCBAqwxY/7OWna/OixAZd+qX6iHhlNDQIisMSNfKw2w1xXJK5c/Zilex8jYjqtaikkpjh4uI3yZgSh3YJ0B8ifOPLPZgM6ifQQ+Bl9/lpgJ2BKRKVaESgoYDk4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418bd428-b555-449b-a39c-08dc13779d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 14:06:04.2611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8budBVBURkK9ztapx1dn498AyRsffTmGakK2bH5dsVf5rmYbwNlv6eKhmzYlvhnXujIOhjTLyOeRPPu8OXxVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4280
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-12_06,2024-01-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401120110
X-Proofpoint-ORIG-GUID: Pro8BUZ1Pa-CogFzMkHNkyf0xY6lR-HQ
X-Proofpoint-GUID: Pro8BUZ1Pa-CogFzMkHNkyf0xY6lR-HQ

DQoNCj4gT24gSmFuIDEyLCAyMDI0LCBhdCAzOjQx4oCvQU0sIERhaWtpIFVlbm8gPHVlbm9AZ251
Lm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbyBDaHVjaywNCj4gDQo+IEkgYW0gRGFpa2kgZnJvbSB0
aGUgR251VExTIHRlYW07IG5pY2UgdG8gbWVldCB5b3UuDQo+IA0KPiBXZSBhcmUgY3VycmVudGx5
IGNvbGxlY3RpbmcgcHJvamVjdCBpZGVhcyBmb3IgR1NvQ1sxXSBhbmQgSSB3b25kZXIgaWYgd2UN
Cj4gY291bGQgaW5jbHVkZSBzb21ldGhpbmcgcmVsYXRlZCB0byBrdGxzLXV0aWxzICh0bHNoZCks
IGFzIGl0IGN1cnJlbnRseQ0KPiB1c2VzIEdudVRMUyBhcyB0aGUgYmFja2VuZCBhbmQgSSB0aG91
Z2h0IHN0dWRlbnRzIG1heSBiZSBpbnRlcmVzdGVkIGluDQo+IGdldHRpbmcgaGFuZHMtb24gZXhw
ZXJpZW5jZSB3aXRoIGJvdGgga2VybmVsIGFuZCBzZWN1cml0eS4NCj4gDQo+IEEgY291cGxlIG9m
IHRoaW5ncyB0aGF0IGNvbWUgdG8gbXkgbWluZCBhcmU6DQo+IA0KPiAxLiBtYWtlIHVzZSBvZiB0
aGUgR251VExTIGhhbmRzaGFrZSBBUEkgdG8gYnlwYXNzIHJlY29yZCBsYXllcg0KPiAgIGludGVy
YWN0aW9uIGFzIG1lbnRpb25lZCBhdCBbMl0NCj4gDQo+IDIuIHByb3ZpZGUgc29tZSBleHBlcmlt
ZW50YWwgbWVjaGFuaXNtIChrZXJuZWwgbW9kdWxlPykgdG8gYWxsb3cNCj4gICB1c2Vyc3BhY2Ug
YXBwbGljYXRpb25zIHRvIHVzZSB0aGF0IGZhY2lsaXR5IHNvcmVseSB3aXRoIHRoZSBQT1NJWA0K
PiAgIG5ldHdvcmtpbmcgQVBJIChhcyBpbiB0bHNzb2NrWzNdKSwgdGhvdWdoIEkga25vdyB0aGF0
IGl0J3MgZXhwbGljaXRseQ0KPiAgIG1hcmtlZCBhcyBvdXQgb2Ygc2NvcGUgb2YgdGhlIHByb2pl
Y3QNCj4gDQo+IEJlZm9yZSBhZGRpbmcgdGhvc2UgdG8gdGhlIGlkZWFzIHBhZ2UgSSB3b3VsZCBs
aWtlIHRvIGhlYXIgeW91ciBvcGluaW9uOw0KPiBhbnkgc3VnZ2VzdGlvbnMgd291bGQgYmUgYXBw
cmVjaWF0ZWQuDQo+IA0KPiBGb290bm90ZXM6DQo+IFsxXSAgaHR0cHM6Ly9naXRsYWIuY29tL2du
dXRscy9nbnV0bHMvLS93aWtpcy9Qcm9qZWN0cy1mb3ItbmV3Y29tZXJzDQo+IA0KPiBbMl0gIGh0
dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjE4MjE1MSNjNjENCj4g
DQo+IFszXSAgaHR0cHM6Ly9naXRodWIuY29tL2VuYXJ4LWFyY2hpdmUvdGxzc29jaw0KDQpIZWxs
byBEYWlraSAtDQoNCkkndmUgY29waWVkIGEgbWFpbGluZyBsaXN0IHdpdGggbXkga3Rscy11dGls
cyBjb2xsYWJvcmF0b3JzLg0KTWF5YmUgSGFucyBoYXMgYSBzdWdnZXN0aW9uPw0KDQotLQ0KQ2h1
Y2sgTGV2ZXINCg0KDQo=
