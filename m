Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548079D8
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Mar 2023 15:28:59 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 323EpjcE025887;
	Fri, 3 Mar 2023 15:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vHn33LNkoX8rTN4rdwOe4W3YhdHqAGCs9D5xzgsYAss=;
 b=z+655AAL4E9rysS3g7sf4wmV86aIuxe89Tbt2YADyXvsuSCT6bTutkBE8bI+xeLIaR2/
 C1RuJ7d6GHX4k9bdv/MS6SSpxwg+lod5QJqXNrT8uMOlYH8paFGU30VHnECa6DEMXs+k
 S6j0GpNACt9uZCBpSPKFk/0c18moTpcEhb4lew6AL06oV/WATfItTR55fEUM6gLo6xse
 rnbsvJHef1As3Nl3MjL3q+WJBd8ewC4m6iSj7/qgeYwc64d9De937CBRro1aVoPNjuS3
 ttO2zqtUT0brHpCPYGCksv8CO2AxCDGbeG8JEr/iIZmmQtLCVLag+X7goM7Uh5agK4WI Xw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9apjry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Mar 2023 15:28:52 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 323E1t2b034814;
	Fri, 3 Mar 2023 15:28:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ny8shqgky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Mar 2023 15:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYsaX46GBvBqfJhWMAXAZVz5CQVa+msEpUSKhI5jNxuhePPg1TeHkIECdfcQRw36OAz9YqQMtlpFNBDu5KysW3/zzCvPG0v4oKqVXbCJUrV5GUrj7hZBNVdhyPvMjaRwqY2cR6Q/IvT5THB+deKRYJV57Tooap40Qv9JXTTBXXsgjzgB//D5K3unf2S/o6s7IboAcZPPWCN/m+BuYhRLWgV+ThXstL1OLcgpGTvXApyFxTBLwgbvXHrhKKKHdqOmozHzlKIyDHdcGK9dOdA597jBaDKOeEoZpJ5n6deN29e52lfA8q920bQZAWbDDj7kjZ9kHTytvOwhVDzzUHtkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHn33LNkoX8rTN4rdwOe4W3YhdHqAGCs9D5xzgsYAss=;
 b=Rfwb4ij5Zh21qyLnDBYGQc3AAjWOPX+/5OhAYXQ/pDOBMkkkNQe4sZt7jxKPVpr+pzyuC2fpQlHRYcy2EKff7DjwwNyFZ7JOt1FfoVV9+8VkHg8QNIZwD+c+2vaq+wP8FFDXxOhMSK3rd12T8LaH21MyYG7Bc/bpRNqrcT4U6l+bMv6uKaCLKvAu/xNYl2not898ndeCV1D9plNEVMAiLxHJRpqH+xIvKehJydY+LTV/h2r8UOP0CxiKzEhVXlCA/sTGDNi0AGFkOE43mAOTE121qMBMu4x15L/cwiF6hIlUgjeIyxHH81Wxzeo09pVB3Mx+1YenqYvS7YME8Ts7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHn33LNkoX8rTN4rdwOe4W3YhdHqAGCs9D5xzgsYAss=;
 b=e7ye4MabjsNfVgXz8TXVyxUobOam8YvoxlROEhIv+7vC58LnzBDYBeBLezkAo/QJXdag+Yt2fPz3PDYb+wFpZM1VNJKct0BYiUulFAIdWTaSKcrHI5piOMTmbosKYtB0hmoTwNxX8k/LcUXSCfqblbFmVNjRzXS4dSlkWHGuvLs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB5263.namprd10.prod.outlook.com (2603:10b6:5:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 15:28:48 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 15:28:48 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Misc fixes for v5
Thread-Topic: Misc fixes for v5
Thread-Index: AQHZTeISc3LK6Bb+xUy34ep23ZeGlK7pLe2A
Date: Fri, 3 Mar 2023 15:28:48 +0000
Message-ID: <7E06F1BD-7429-431B-8EE3-C495AC3CC723@oracle.com>
References: <ee1e9c66-40b0-c373-25ee-ed5bc38203f5@suse.de>
In-Reply-To: <ee1e9c66-40b0-c373-25ee-ed5bc38203f5@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB5263:EE_
x-ms-office365-filtering-correlation-id: 58f91ec6-b35c-4d43-a68f-08db1bfbfbfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 88vL9cEvswCOTS2tjPblhSzsQrAnSLYgUX3LkPmC2CGLlBOTHqA+jwczW21UCh9olTmPwe8XebcfEFZzuhwnDfJmhKBezgUPHuXTHffyWzyC9cTAHj01g5cR01ej+lfkkh4mbjFYEHhvZysmdVmG4p0BAl3QQVxO4BOB4ykcj14SlrxDaERuCG0H3tvhpWtpBI2quCO5qPKHqvtkBz+SGNsJ8DMTpfVUsIV/ss2hg1Gz6gatGS2mF37CaU7IcLcpFEcqGCi+/dG/n8Qdghb5mE4Ry97MuD8lTd8UJ6uvNRkAmHGKOMjvqbx0YNqZvpI/11jybW0VZSY/j8HUZQEla+F+GewJVtVceDCWw7EBt0wCyaPgdt3VtVBujYMoaimNc52BHeVSd3NzgZax25T9PL5Y3z4njg+LRSdIWf116sIq9A9OFvpXgbxYd/9ryj+k5qxLvZojibBcLv4btPci3QSC43y/Vk7Hvj4n9CafZsvU8PCixVvFs7aO32Sx+S2LyZyL/KhEEvfpzztoBE0fCt/8VNnat+M7D6Bzs6gzyV5Hlurz/6ep/2PJk/n3fDVxaC0nU+tyuUEJIVdpuA38CWG/lhuKNQu7M23p7/RqFRHpAJQDG8R4Xlf0a7Ln5NcFxIPFFoNqcdKRUOzG4u+aRpFoBI6ApbcIcIGOiuFiYVpdThggaI8KJqZLCkmG/d3JY9JFBbTs2ylNBeKIvha3a0Yv4+kRtIIL5Sb5Saejwyw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(122000001)(2906002)(33656002)(38070700005)(38100700002)(86362001)(478600001)(6486002)(71200400001)(53546011)(6506007)(66574015)(6512007)(26005)(186003)(36756003)(76116006)(64756008)(66476007)(66946007)(66446008)(4326008)(6916009)(8676002)(66556008)(83380400001)(316002)(91956017)(5660300002)(41300700001)(2616005)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzdodlQyVytBSXRTNWpwenhxcG5jRkV2VGZ1dXB4TG9LSFRCZ20raWhUZmZW?=
 =?utf-8?B?amR1MEYraytHVUxZNDREYUtPUTNIUXRmQVF5eXBRRGRkRVBXeDBsWk4wcXZK?=
 =?utf-8?B?VmhBU254RUdKWXI4a2NCckphN09ra2o1ZTFTOXQyWmtDMmlaanlxcGVMaFZS?=
 =?utf-8?B?MHFEdzhWTStuQ0JqUCtQSjltMWpML3R4VnRudnRuZitMa0wwK3B5N0hPQ3RM?=
 =?utf-8?B?VnhaOWphbUs3RTVQL3JUVnUvMFV5Vm1GRjloWGxvaVE3SkZHZkpwZjgvdWxZ?=
 =?utf-8?B?NjNDZ1hCQ3UwSnFMK2RpYWg3K25zWEVUanYxTDE2VGZRWGl1T1Y3dzFIby82?=
 =?utf-8?B?MnVQK1JVcG1RWGZnVW1EaDYrR2FmZ0JsL09BZzhnY1pqdHlsR0tObDFiNFVM?=
 =?utf-8?B?WmUycEIwVnNLNExuRUQ5UER4WGEzb1ZuSVc2UUVxNDlCQ1kwb1lmQzZPOGdW?=
 =?utf-8?B?c3dyZHVndWJYdHdFeXdJbXdaaXllNFhaUEp2b1BoNFdWV1VtM2dZNGg5S2dV?=
 =?utf-8?B?REd6aGxFdE9RSGpRd2VrSnJGKzkrTmtLSFREWGoxR2J6Syt6MC8xTWxLTnJa?=
 =?utf-8?B?RmR1NUNSMzJrOGo3QnRYSVhBb042cGhpMGNuaUY2TDZjS0tFN2pqU21JTmpH?=
 =?utf-8?B?T0t5aHJ4VWpMUzNud0JqMFF5QmY5YTg2YnhYSnFMNUcrby9KaHBNNm9KeDN2?=
 =?utf-8?B?cCtZcWdHVGU3Rm01T2doNUw1amQ2UUpxTDZEeGFQMlkxcDhOc29lMkp5OVFN?=
 =?utf-8?B?Q2dVUnJicE9EMGREMU1NSml5bmd3TWR5ZW9xbFNwWmw3bVlKVUQ3aFV1cmNY?=
 =?utf-8?B?VnZaWG9WbUswNUlXSVpFdFVPYysyUEZQWTNIUDlyT3BMODFxM05ZOTltbWFZ?=
 =?utf-8?B?aFh2dXlxMEw2cU9JcXkxeEFXRGttSXNsOWxjellHdjI5enh5eE9uSVhFMjlh?=
 =?utf-8?B?UlpmRG05WVRXWStKdEJtdUQ4RzZTcEdXcEhSR0VYYisrcktTKy82UWdpUnRF?=
 =?utf-8?B?ZGJBeFRMUHB2azdiaTZndFBDTVcvQjJtd3oyeDVlZkJyTlRzTXJiOW5tWmVW?=
 =?utf-8?B?TFdNYWZ4K1FCYkNjZUV2WXJzT3h6MVlXUFFNNFRBQTJab2FjM0hDRHgvUmtH?=
 =?utf-8?B?alBsV2tacGE2eENpZG5VeEw0QmVaYlVvQ1BqcFNIWm1TaU40Q2J1Zmc5dm1O?=
 =?utf-8?B?b1hFUVJVMzFEb3c0bURvc0JvWCttYXlWRmpJOGhQYUZEZy9UZm91NXpWOExX?=
 =?utf-8?B?N016QTlOdWdRSGxXNFAzS3RIRTErVkdNM1MyWHZlZXUyUWxCUnlRV1V1Zy9Q?=
 =?utf-8?B?WGYydWlGNWFEVS8rWVdWUEJLblNOQlBTNk1Sd0M0bGtnRXNzclorR1FIV2kr?=
 =?utf-8?B?K1Qrd2RQSloyaFZRWkl1c1krZDdUM3lVNjVMR2pCcUxNY3dZcTFMUkVYeTNz?=
 =?utf-8?B?UXhBZmhqR0pOV0h2MUNpYlY1bElNSkJtYkVuQVJiMk4zV1JxeEYycnlSdWIr?=
 =?utf-8?B?cUpVVHpyakl5UnY2RmYxT2Nydm03T25DRmpyWXBkV3hubjIxc1UvQjh3RnFu?=
 =?utf-8?B?VkR2eVFFdnZHcE9PVlFJQ0NlK1FvRzQ2TTVtKzhhd1NYblgvUE5EeFFHdTJQ?=
 =?utf-8?B?Nk5vNk9JUjZ1SmVUdjc1WHZsdWNKOEE4TzVRZmVTM1NjZGxtd3FmMTBYNW9r?=
 =?utf-8?B?R254Y2trMC96VjVTdlZWSFdsakpOQVZPOTUyZGxDdkU5NXlROUQrU1pHSzI5?=
 =?utf-8?B?OU5RVnorODhjUDdXUHVNVWY5YmRNZks4L1JWVmROTHI0UEZKejJhc2J5Ump1?=
 =?utf-8?B?dWcxSlJjb0JQY2VUZ2xSNzhhb1I0UU1HU0s4eE9qUmYwN1lZaTdoemlHaWNP?=
 =?utf-8?B?cU8xeTNQTTU0d1RoQ2UxSTFOeHBZL0ZsWUlvOEZlNXFxWFRzNTRNczBxZVJ5?=
 =?utf-8?B?cFl3dG9HQnN1VkZkS0lOcWFWMkNCdVpseWpRTXRqZTlBTzhtYkhubWg1Mml2?=
 =?utf-8?B?T1hKdFltZnIrQUtIREM1RTdZZTRnYXpzV3RmbjR0SUMyQzk4bXVtRGVpanV4?=
 =?utf-8?B?TDRXS0gxV291MHZKbm5NeUJ2bHdkRXVyL2pjUTdMcTdFZkJUV3lUamVzem5Z?=
 =?utf-8?B?Q1pNWm92Kzk4SERQbW9HVUtYS09QWHdwYXJ5SDhhWlFPdWdoY2NhL0JDRHFC?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97243A302404074689CF315803EB4475@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4YpXv9UH+GVITuagJffK4AV7C8ao2UmVOCF70YYHGOkkNnk6t6QjmBTkwMFmdaxyLSR9Aa97duAJJ8Yr8EZyKuS15s5cTlI8T1MlNHV+Fz6PsSQkYrVG9oREhh2GTyd64cOlAMpJW8TkOM7ri3oQ9sS3fW1DURB2SYT1A4DFq6fPd+VfBfI0gNdpy/w7fRBIN5/1K4trRKPY7CB5hOyp9wHGnte80BtJ4km1kz0XABNa6OA6GPALGBGuuZqaSqi1F4Z9n+XdfXniVo/WmCdG6s06Oygj1H8rlcwCVPdRyiaFIvmKkYD+HGDjejAfQ0f9DGAbRt24MmGZ9e5OKE7CZnWeYE8VvqL5i37u4hj80nKBt7/zxSqHBn2qgqaCUinIqfCnmBhD/uDYXPRMMYBSx/oE77l9otSNvdZZa8+5lX0jpmK2hqPbxX9msGqiKf47/vN5Hg1osj0sqJRpCdlYq6l4hv4y2nPwh0lHnab8qGL3fh3kVLe/M1FpXmAmFCjmUQSep+A1MxvIeAdjVcA5CnmIw2QUHAdKDgNiK+KtO5xmxSAtARS1gNt+aEn9EA5Cd25/Ht/P+YmHbkt8zfIHnGYxoKXt59hbTqGvg6M3MhKqZ8qY17iWMLAsw83tG5/DBO1A0n9uXruY9s/PhD4JRpcqAbWL864M7TS5QhdW0ILAScUf1GgG2Q42UYpxj0Luu/swzk+yqHQPKyOGkPEd796HHhfCUKI7uAheSW61wQGc8QIPa2JyiLCCrI7KQXLVyoSekoIwV+CVsJAg/TFzpA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f91ec6-b35c-4d43-a68f-08db1bfbfbfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 15:28:48.0806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbheza7eR3uBDU3eFjW/Mhsu/ambK6P3aEWCxI5K2Dq3rLamiX6XrQ7zV0nkVM/AbknupRJjb3oH2dkaPwRAzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5263
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_03,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030133
X-Proofpoint-GUID: ouIRH0pPW9mu0MMJkVuWGYVejJwDHBeg
X-Proofpoint-ORIG-GUID: ouIRH0pPW9mu0MMJkVuWGYVejJwDHBeg

DQoNCj4gT24gTWFyIDMsIDIwMjMsIGF0IDEwOjA4IEFNLCBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaSBDaHVjaywNCj4gDQo+IGFmdGVyIHNvbWUgZmlkZGxp
bmcgd2l0aCBuZXN0ZWQgYXJndW1lbnRzIChhbmQgZXZlbnR1YWxseSByZW1vdmluZyB0aGVtKSBJ
IGZvdW5kIHNvbWUgaXNzdWVzIHdpdGggdjUuDQo+IChjZiB0aGUgYXR0YWNoZWQgcGF0Y2gpLg0K
DQpJIHBsYW4gdG8gcG9zdCBhIHY2IHNvb24gdGhhdCBzdXBwb3J0czoNCg0KLSBhIHRpbWVvdXQg
YXR0cmlidXRlDQotIGtleXJpbmdzDQotIG11bHRpcGxlIGNlcnRzIGFuZCBwZWVyaWRzIHBlciBo
YW5kc2hha2UNCg0KSSBzdGlsbCBkb24ndCBsaWtlIHRoZSB0aW1lb3V0IGF0dHJpYnV0ZS4NCg0K
LSBIYXZpbmcgdGltZW91dHMgYXQgdHdvIGxheWVycyBpcyBhIGtub3duIHJlY2lwZSBmb3IgdGVh
cnMgYW5kDQogIHNvcnJvdy4NCi0gVGhlIGtlcm5lbCBjYW4ndCByZWx5IG9uIHRoZSBoYW5kc2hh
a2UgYWdlbnQgdG8gdGltZW91dCBhbmQNCiAgY2FsbCBET05FLiBJZiB0aGUgYWdlbnQgZXhpdHMg
YmVmb3JlIGludm9raW5nIERPTkUsIHRoZXJlIHdpbGwNCiAgYmUgbm8gaGFuZHNoYWtlIGNvbXBs
ZXRpb24uDQoNCkJ1dCBpdCdzIG5vdCBhIGhpbGwgSSBjYXJlIHRvIGRpZSBvbiwgc28gSSBhZGRl
ZCBpdC4NCg0KVGhlIGhhbmRzaGFrZSBuZXRsaW5rIHByb3RvY29sIG5vdyBzdXBwb3J0cyBtdWx0
aXBsZSBwZWVyIElEcw0KcGVyIHVwY2FsbCwgYnV0IHRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5v
dCB5ZXQuIFdpdGggb25seQ0KcHJvdG9jb2wgc3VwcG9ydCB3ZSBzaG91bGQgYmUgYWJsZSB0byBt
ZXJnZSB0aGUgdXBjYWxsIGFuZCB0aGVuDQppbXBsZW1lbnQgdGhlIGFjdHVhbCBzdXBwb3J0IHdo
ZW5ldmVyIHdlIGFyZSByZWFkeSB0byBhY3R1YWxseQ0KbWFrZSB1c2Ugb2YgaXQuDQoNCg0KPiBB
bmQgSSdtIHN0aWxsIHN0dWNrIHdpdGggdGhlIHNlcnZlciBzaWRlOyBTZXJ2ZXJIZWxsbyBpcyBz
ZW50IHRvIHVzZXJzcGFjZSwgYnV0IHRoYXQgdGhlIGRhZW1vbiByZWNlaXZlcyB0aGUgcGFja2V0
IG9ubHkgYWZ0ZXIgYSB0aW1lb3V0IG9uIHRoZSBjbGllbnQgc2lkZSA6LSgNCj4gDQo+IFNvIGlm
IHlvdSBoYXZlIGFueSBpZGVhIC4uLg0KPiBDaGVlcnMsDQo+IA0KPiBIYW5uZXMNCj4gLS0gDQo+
IERyLiBIYW5uZXMgUmVpbmVja2UJCSAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0
DQo+IGhhcmVAc3VzZS5kZQkJCSAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4DQo+
IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgRnJhbmtlbnN0ci4gMTQ2LCA5
MDQ2MSBOw7xybmJlcmcNCj4gTWFuYWdpbmcgRGlyZWN0b3JzOiBJLiBUb3RldiwgQS4gTXllcnMs
IEEuIE1jRG9uYWxkLCBNLiBCLiBNb2VybWFuDQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZyk8
dGxzLWhzLnBhdGNoPg0KDQoNCj4gZGlmZiAtLWdpdCBhL25ldC9oYW5kc2hha2UvbmV0bGluay5j
IGIvbmV0L2hhbmRzaGFrZS9uZXRsaW5rLmMNCj4gaW5kZXggODg3NzVmNzg0MzA1Li44ODJhOTc5
NzJiMGIgMTAwNjQ0DQo+IC0tLSBhL25ldC9oYW5kc2hha2UvbmV0bGluay5jDQo+ICsrKyBiL25l
dC9oYW5kc2hha2UvbmV0bGluay5jDQo+IEBAIC0xMTQsMTkgKzExNCwyNSBAQCBzdGF0aWMgaW50
IGhhbmRzaGFrZV9zdGF0dXNfcmVwbHkoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxf
aW5mbyAqZ2ksDQo+ICAgKg0KPiAgICogSW1wbGljaXQgYXJndW1lbnQ6ICJjdXJyZW50KCkiDQo+
ICAgKi8NCj4gLXN0YXRpYyBpbnQgaGFuZHNoYWtlX2R1cChzdHJ1Y3Qgc29ja2V0ICprZXJuc29j
aykNCj4gK3N0YXRpYyBpbnQgaGFuZHNoYWtlX2R1cChzdHJ1Y3Qgc29ja2V0ICpzb2NrKQ0KPiAg
ew0KPiAtCXN0cnVjdCBmaWxlICpmaWxlID0gZ2V0X2ZpbGUoa2VybnNvY2stPmZpbGUpOw0KPiAr
CXN0cnVjdCBmaWxlICpmaWxlOw0KPiAgCWludCBuZXdmZDsNCj4gIA0KPiArCWlmIChXQVJOX09O
KCFzb2NrKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJbmV3ZmQgPSBnZXRfdW51c2VkX2Zk
X2ZsYWdzKE9fQ0xPRVhFQyk7DQo+IC0JaWYgKG5ld2ZkIDwgMCkgew0KPiAtCQlmcHV0KGZpbGUp
Ow0KPiArCWlmIChuZXdmZCA8IDApDQo+ICAJCXJldHVybiBuZXdmZDsNCj4gLQl9DQo+ICANCj4g
LQlmZF9pbnN0YWxsKG5ld2ZkLCBmaWxlKTsNCj4gLQlyZXR1cm4gbmV3ZmQ7DQo+ICsJZmlsZSA9
IHNvY2tfYWxsb2NfZmlsZShzb2NrLCBPX0NMT0VYRUMsDQo+ICsJCQkgICAgICAgc29jay0+c2st
PnNrX3Byb3RfY3JlYXRvci0+bmFtZSk7DQoNCklJVUMsIHNvY2tfYWxsb2NfZmlsZSB3aWxsIG92
ZXJ3cml0ZSBzb2NrLT5maWxlLiBBbnkgY29uc3VtZXINCnRoYXQgaGFzIGFscmVhZHkgaW5zdGFu
dGlhdGVkIHNvY2stPmZpbGUgd2lsbCBub3cgbGVhayBpdC4NCg0KVGhlIGtlcm5lbCBjb25zdW1l
ciBoYXMgdG8gY3JlYXRlIGFuZCBhc3NvY2lhdGUgYSBmaWxlIHdpdGggdGhlDQpzb2NrZXQsIGp1
c3QgYXMgeHBydHNvY2suYyBkb2VzLiBJJ20gbm90IHN1cmUgdGhpcyBpcyBhIGJ1ZyBidXQNCnJh
dGhlciBhIHJlcXVpcmVtZW50IGZvciB1c2luZyB0aGUgQVBJLg0KDQoNCj4gKwlpZiAoIUlTX0VS
UihmaWxlKSkgew0KPiArCQlmZF9pbnN0YWxsKG5ld2ZkLCBmaWxlKTsNCj4gKwkJcmV0dXJuIG5l
d2ZkOw0KPiArCX0NCj4gKwlwdXRfdW51c2VkX2ZkKG5ld2ZkKTsNCj4gKwlyZXR1cm4gUFRSX0VS
UihmaWxlKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBubGFfcG9saWN5DQo+
IEBAIC0xMzksNyArMTQ1LDcgQEAgc3RhdGljIGludCBoYW5kc2hha2VfbmxfYWNjZXB0X2RvaXQo
c3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqZ2kpDQo+ICAJc3RydWN0IG5s
YXR0ciAqdGJbSEFORFNIQUtFX0FfQUNDRVBUX01BWCArIDFdOw0KPiAgCXN0cnVjdCBuZXQgKm5l
dCA9IHNvY2tfbmV0KHNrYi0+c2spOw0KPiAgCXN0cnVjdCBoYW5kc2hha2VfcmVxICpwb3MsICpy
ZXE7DQo+IC0JaW50IGZkLCBlcnI7DQo+ICsJaW50IGZkID0gLTEsIGVycjsNCj4gIA0KPiAgCWVy
ciA9IC1FSU5WQUw7DQo+ICAJaWYgKGdlbmxtc2dfcGFyc2Uobmxtc2dfaGRyKHNrYiksICZoYW5k
c2hha2VfZ2VubF9mYW1pbHksIHRiLA0KPiBAQCAtMTc3LDcgKzE4Myw2IEBAIHN0YXRpYyBpbnQg
aGFuZHNoYWtlX25sX2FjY2VwdF9kb2l0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBnZW5s
X2luZm8gKmdpKQ0KPiAgDQo+ICBvdXRfY29tcGxldGU6DQo+ICAJaGFuZHNoYWtlX2NvbXBsZXRl
KHJlcSwgLUVJTywgTlVMTCk7DQo+IC0JZnB1dChyZXEtPmhyX3NvY2stPmZpbGUpOw0KPiAgb3V0
X3N0YXR1czoNCj4gIAl0cmFjZV9oYW5kc2hha2VfY21kX2FjY2VwdF9lcnIobmV0LCByZXEsIE5V
TEwsIGVycik7DQo+ICAJcmV0dXJuIGhhbmRzaGFrZV9zdGF0dXNfcmVwbHkoc2tiLCBnaSwgZXJy
KTsNCj4gZGlmZiAtLWdpdCBhL25ldC90bHMvdGxzX2hhbmRzaGFrZS5jIGIvbmV0L3Rscy90bHNf
aGFuZHNoYWtlLmMNCj4gaW5kZXggMzcyZTY4NDg4YWMwLi5mNGFmOTY4MDE4NWQgMTAwNjQ0DQo+
IC0tLSBhL25ldC90bHMvdGxzX2hhbmRzaGFrZS5jDQo+ICsrKyBiL25ldC90bHMvdGxzX2hhbmRz
aGFrZS5jDQo+IEBAIC0xMDUsNyArMTA1LDcgQEAgc3RhdGljIHZvaWQgdGxzX2hhbmRzaGFrZV9k
b25lKHN0cnVjdCBoYW5kc2hha2VfcmVxICpyZXEsIGludCBzdGF0dXMsDQo+ICAJc3RydWN0IHRs
c19oYW5kc2hha2VfcmVxICp0cmVxID0gaGFuZHNoYWtlX3JlcV9wcml2YXRlKHJlcSk7DQo+ICAJ
a2V5X3NlcmlhbF90IHBlZXJpZCA9IFRMU19OT19QRUVSSUQ7DQo+ICANCj4gLQlpZiAodGJbSEFO
RFNIQUtFX0FfRE9ORV9SRU1PVEVfUEVFUklEXSkNCj4gKwlpZiAodGIgJiYgdGJbSEFORFNIQUtF
X0FfRE9ORV9SRU1PVEVfUEVFUklEXSkNCj4gIAkJcGVlcmlkID0gbmxhX2dldF91MzIodGJbSEFO
RFNIQUtFX0FfRE9ORV9SRU1PVEVfUEVFUklEXSk7DQoNClRoaXMgbG9va3MgbGlrZSBhbiBvdmVy
c2lnaHQuIEknbGwgZml4IGl0Lg0KDQo+ICANCj4gIAl0cmVxLT50aF9jb25zdW1lcl9kb25lKHRy
ZXEtPnRoX2NvbnN1bWVyX2RhdGEsIHN0YXR1cywgcGVlcmlkKTsNCg0KLS0NCkNodWNrIExldmVy
DQoNCg0K
