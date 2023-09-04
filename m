Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F66E3D8B
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 Sep 2023 17:21:32 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 384AotkP026752;
	Mon, 4 Sep 2023 17:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=iKiLXWcDIllhjQHJ1Xy0rL9cn1j3mbfqwwFu0xQHDlI=;
 b=KPTfL7gKDzGk9UAZ3eprFy5V64RLqGOq6SPZNzD0Qs7N6DpoX2rE5K34XzTfsuJFiI6N
 9yh2DwQrecJmfo6rw1vdBfjw7CrSMHfGWBORNETaWJROSFhVahiqGF6ZiOjpduv9K3H4
 d8VHW86DIW4/2N3nabYIlXne1giIuNSxFHrdUQi+XzzQbVDJUxiEW+TSNFl9QP+XuC4p
 x7yUkmhQ30ppTS/h5D8iVLl1mOExb0x3iN8l6RFr2pyNELxlwq3DrbdKkRp7GjH/bi0I
 fT9ido+blbPRDFkD48kSLSuttihElBsDIJYxZWWVbyKpgQzyM1jBhprNZmENGhhjDHWq CQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3suvxakm3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Sep 2023 17:21:31 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 384Ewn55037086;
	Mon, 4 Sep 2023 17:21:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3suuga45gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Sep 2023 17:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImZ4I04PdDVBrR+ldRX5YXJ5Al5C8xT1SsPVCcM6k/tzeh4Cm1Wq1gi6HNIJAVos/NmQVvSybfOuGgk4msbE6bIdSYPZ/B6wcNgRlJ/n1QP/qa7EflWeiUPQsCftdqirUIqm1JuvUpDupt1c1wnxmVbW9kTWMA1OYV4iY37/3NUUNFdR/efMFeh91xuI87gCgPNMBtDbalpUZ4xeP+c5AbAfrkbhpdzyCkUVQliyxjoZegjGYxGLybrHt4ScQI01np8OCTA3P5rv2bDncCpSvFWO09GDeKY5U+KcgPKYjceB2kejJgxL4x9kUNfRURdcTIwR6TXqri6HkDlabS4Opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKiLXWcDIllhjQHJ1Xy0rL9cn1j3mbfqwwFu0xQHDlI=;
 b=gWRb9K9hvI57I6n3RkStRMcpetO3EMg3GW6cFt9eWB3XSQakr3H670cB1YhOe3/LPWvb4RyXuU3qRiYBrK8ox2yQt5BNovl8ZV5w8HAPgEqRs0Ce9SqJ8HRRpTHBjU2Utsi6BhY3/tp0Qx0UYo3hTWK/ecEWB7glWYRa0394aHdfHblFtETMFc5wS9YiLv8MgcSt7vVrqdBmH7TquVXtRtPxcL8sVz8hGDMaigOROBXhfQ3UcuhKryIioaW7z5/A8jHD9v2USHAmuSSppy2f8EpGwZp799hSouGF+MgjSn5SOyE4SC4AdcNtncleTBJ9Zp4/Y08cx4J6HwAZoLV+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKiLXWcDIllhjQHJ1Xy0rL9cn1j3mbfqwwFu0xQHDlI=;
 b=hd5sNC4btFjWGQd0ygV8u6jS09SjHsV9hfWzl9ICfV40oLANvVoToh4CYgR5ZEWGfxBf8LV+HygRmh+PKLJT8XtoKQXyRRsrOU1PG46KVR+mjZLfBEz1g4TqisudhvHMeM+Jnd5rx6gCwGkKRDx1Evgin7OX96cyfr6Y3g5CJAk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ2PR10MB7598.namprd10.prod.outlook.com (2603:10b6:a03:540::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 17:21:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 17:21:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: mount-by-IP-address with TLS
Thread-Topic: mount-by-IP-address with TLS
Thread-Index: AQHZ0HQSLL2A5ufNG0mtewRMKYgVa6/tUAgAgAAFUICAHbItgA==
Date: Mon, 4 Sep 2023 17:21:27 +0000
Message-ID: <186D1E2E-BF2E-4353-8E26-82CDD95046FB@oracle.com>
References: <9674EE10-AA24-4868-A2AF-2785C10A7BD3@oracle.com>
 <CAN-5tyELqRN0nqu_dxN_yhJssz+iFCM15nHj1b57OSg7rykRCg@mail.gmail.com>
 <69B5E5D3-A9CC-4C05-9860-5FF34343EF20@oracle.com>
In-Reply-To: <69B5E5D3-A9CC-4C05-9860-5FF34343EF20@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ2PR10MB7598:EE_
x-ms-office365-filtering-correlation-id: 51f48205-5c3d-4cea-5b79-08dbad6b5f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 V3jBYz8Hr/cwG6p6dOIovUenZa9/6mz5GKfxwmECsyfud3ct8jfLaWOSphSaMEMLVAlkBFT6tPpqLPbkKGaZbPdgQ9nwoOZSP+6K/o/kwJwCJZtJvxkUjrTEPTRKtM98Xpw17vqO5mWWvEh6sWqI2EGXMZq2Y2ZFatbf5PHqglrRPjImrYxwL+fdLZUKHMCYCbfFV5Ht1J+7s+kfJLu1XiPQ9tpaM9HGW5jp5Qo/Q2sRSbqIK5UN4QBXkA6jhu8fSsKtntrBMTbUmjvggvU9E6rfl2G1qjwR2SMHxE804KUD7/TDZmTujkz0Qt+1Z3/ztLr8j7SXVC9zUwbhMidMO3zRi8abUkF9cXAal/qm8HHDNn9kbWV8hyKVq7Mp2WyEO32J3mWDvm7t97+YucIqhhkVqSdS28I0uuenvrQ4k+9mAJ9ua+pzdQgyVqSZ54mojRbWTeNFLH4BeG1n1eWzFc6boR8hw1gUaz3QjpkTMluJ6L8piA1feiUZPwrTBy7HgGiDwBziB15LwdUMT/3C7xX1DMnU3J9GstvslBAuPDMjxhyYi8GaRMX7wWJAZCkVuRQF5MHG4tsBETCxeVVQPMO3syE94DIr2RjDFUH+6MWm4iGek0RE1RFvui9AaZMrQHOA3tpscBeRWCoFYMMJkkqAmVt+ew8UN/pOxUoc5Qk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(1800799009)(451199024)(186009)(8936002)(5660300002)(6916009)(316002)(66946007)(2906002)(36756003)(91956017)(66556008)(64756008)(66476007)(76116006)(66446008)(8676002)(4326008)(66899024)(41300700001)(6486002)(53546011)(6506007)(26005)(6512007)(38100700002)(122000001)(478600001)(71200400001)(38070700005)(966005)(2616005)(83380400001)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eG1OL0RPZEgrTkVQbTZLUTdzKzR2VG12WnVxL1pXdWxSMFVtMVgySUtYWmRK?=
 =?utf-8?B?V2kzT0x3bSt4VUNFNkFIOUxGcXk0Y2dXMGRBdE1LKzVaa3VOOU1UYk4wSDJK?=
 =?utf-8?B?clcxeTRQYkplVWZYTlgyRncrVUNKWHdaMjErd1ZYRFk0SVhaaXlBV1dGSHcr?=
 =?utf-8?B?SG9TVUNxRGRSSm1TQzdoVmpLSzJLOEJlSHA3S2R6Q1liMCtaSWdrYThvVWpl?=
 =?utf-8?B?c2xHU2hBRlFTRy8yTUZHQUpqUlJiNCtqNkJNUWtjWm1HZENEYmxHNTZZcEpG?=
 =?utf-8?B?WVQ0aXF5QnhVdk05VUkzdTVvTmNsMjU0RS9QdWtxclpzM0ZHU3NPazBVSVZq?=
 =?utf-8?B?Yms0SWVKeDJESDRrb1pBZ1hRZ0NrRTRwYVdWZ3RhcFQzRklhTXZqT2ZPMGhN?=
 =?utf-8?B?Z0V2ZmEydzlRV0s5V1F2YW9TUktEM2ZKMmJRWFQvRG83L29NWTJoMTBteTVJ?=
 =?utf-8?B?ZVluVFFnbnlDMFRscHRNOS8rQlFSQTdZZjNHNkFQMHVkSTgvVHVLclZLT1dw?=
 =?utf-8?B?ZlVNaGg4UURiS0ZYZDhwKzcyR1ZtQXh6YkVVZXVKWjdOYmo1bGtHejhlbjFv?=
 =?utf-8?B?OFBqOWdSNHBMYmQxRkYvUWk3a29mUUxYcjBTbE43S2JKOVlwUEl0KzFFQ3ZD?=
 =?utf-8?B?dGZJalNCSGc0V3BrQ2N0YzRDS285RWlQd2VBOWlLVWxlUUxuR1hQMVZnNzBG?=
 =?utf-8?B?NGNvV2hSQldpek1STEZxTFNxZGExaDNuVnZ5MTRkaFpjTjl6MHAwRnNFWXB4?=
 =?utf-8?B?N3RjTTV1amk4UVFUUVphZ3lEZWFNQnF0UWt4OVhvdWtoaVJQVGx1dmZLNGQy?=
 =?utf-8?B?T21RUGE5ZjBoZkZnejRIdzNBRFZTSFdJay9JUGxkQWs4ZlloZ0c3UnJmNjRI?=
 =?utf-8?B?WlN1b01tVVoyMlZDQmRpdG4wM0gxZW5rZGlUL09FUlZoK09UeGR4STN6YnFC?=
 =?utf-8?B?dEVOVU4wWGIrTEg1MU1jc21rNS9IK0xIVTFBaDUrUGhVemFRNnpBSnBTZ1ds?=
 =?utf-8?B?Y1djTFQ5TWQ0Y2xQdEZWQmxQUEYrQTExSElyb2htSGpmT05FZTIzR1hrNkU4?=
 =?utf-8?B?ZURzNDBKWDMzVmxEOVN4OERrbTlJSEJiYUM4RXdha3Y0S0ZRczFaWWlTTlhZ?=
 =?utf-8?B?TXRaQ1gyV09LelAwbElNMHpzamVTamhtOTAyWVk4akpPZUpMR1NWOG1BWFlS?=
 =?utf-8?B?cCs1czk2VDJqMmdpNUlJVG90NVlrcEIza0hWZElpVkpyQ2FYM1hhMitLeEIz?=
 =?utf-8?B?UTFaaUNRWUF3cjd2SFVPbUtzYVRMNGpVMk9nT0xRTjdFTTdpaWdEM2NEWGN2?=
 =?utf-8?B?aUtRdzhSYW1nTC9TQ3ZFdWpzc2dBUS9wRVI2NTZQdnVlTDBvRnUwdmEzOUM1?=
 =?utf-8?B?ZklaVENOYnBsTGw3b1Bhb2ZYUDV6WlNIby80UkZXTmM2SFpqMmhDRzZ2NEtE?=
 =?utf-8?B?SmtIWmU5V2xhK3EvSnczcUh4c0NYa3c3V3kzblA1MEJuNHRBUEtqRjhPbXZS?=
 =?utf-8?B?aW5QZlBvNGZ1aDR3b21IclJRZnpXTDZ5UnplaHdwSW5vKzQ4Zk0rYkUxVzFr?=
 =?utf-8?B?REU0QjFOVDlVcm5JMmhvRitCcXFiS1RhTGVwMDdVb2dVWGNGcHV2VWZWMUEv?=
 =?utf-8?B?c1NYZ20ya3NJUk03WU80UUxJQ1RRbU9SQ0wweVEwY0VXTXNYdHkzaXVYL3Ur?=
 =?utf-8?B?QnN0dTZIY0JRRlp3dnZKQUU1YWpQN3BTd2VUc1JCU0pEN2s4NFZoYzQ5dGNj?=
 =?utf-8?B?T3BIc21kanZ6UWFBTVVwQXE2MVBVa0FTK1Nwa3ZsRm1Bbjg1bHRBaUdSb1g5?=
 =?utf-8?B?L3MyNy9VRk95Tnd2Z3pTYzdGUUtSNUxTTm1CWnlyQzdXampNQU9HOXR0Q2N2?=
 =?utf-8?B?UWh4UllsQTJEU1plRW1lbXQ0ZVllL1pOQWdqZG5aVWIvUzY2Q1d0ZXJXNEM4?=
 =?utf-8?B?REtlNktYa0lTMGFNb2p1a3RDMitSdzBzY3JHY016c0NQVFVGUUl5djBqVGla?=
 =?utf-8?B?ZVRaY1c0RC80UUZZT2J1QUxjVTBMb0hBMUR5TG5CQXdYREJDVGMyY0drRkhM?=
 =?utf-8?B?eWVITHNNencxOEE0TVZPQUl5c1c5TTJtTERURFZ6SHFJNTBuRXVlMDJaU09I?=
 =?utf-8?B?UmpzaXZ6SVE5a2ZFMUhrbHJRcXUrSWw0L0dXU3RybVZ5dnhYY0s1RjVRM2lU?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C25033CB422E3D46B03B3C2094B7EAF0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EqVOSARxI/3Sc7c5zZLVC9j1Q0Lp4x2xKgqHw047NDFsdexi8koyT+xqHUGPnJq/Jw2JIb469tws3o5nI3qLwwexcoQ4n48rpYx467NpEzZUWTrgIUPtShef98Ac5yAN9Bgc3Qvp/66FjI3lsBrjoyxUSjRljzuaAIcfqEzDwosZBiVo3BKVCCOOaY/6GsGRXcb7t52pb386l///lUH035In4kgCgdnsNAykBAzrmuUzZPaS9rJxporQoMwm2S8tzhYQVp6sSYOz5gy3bWfITpWLXlj/L80NDVvcjEVcT5HnivooSDPPqpEQT1mTySt1OJLE0EqAo8zyIbNHDKMy9P7gltMOOYSHQrrC+kXLiJLu4VstqOVFMu1KjjTzLzV6Tn+oyipelMim13WuxQzfgCuZQGEXgk9lT1GnlpKkcSD58llPqIPXc8rtAeNHa+J79j4M33FW2aPpjLB2lhADEdSUSKw7MgkuVQu1YaNA9f2sMGkYc1fS34T3U1OvQSu40aQS9/R8PDzy9uOK/5dX+/0r7Exn0ZDW5DGQUOQl7Q4XCLnCth6+ZDZhufLxEBReT6aavhCyyGmx11y1UgLNINWauyzbp/QgmvVgCJrPi0Y4MRdUEjy2p8NvNv1DPSaaf6+g9P4kfto0LfmuMTzGfoHAlZOs+bdZ6+TCiN0l1FXbzkQSZmcz/yg4MvVbBN2BRCGZ4gubTk599ipXjl6mAsNRq4liL4mWC5enNYh3Av2gicBvPgwt4zL/k9OynnOELAvFnBk9gbqkWobJ6J/H4Ye8EK+q4aCFqHbCUaJqIhY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f48205-5c3d-4cea-5b79-08dbad6b5f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 17:21:27.6773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1G+Gbm8tAjpcY1oMK0F98deW33VN9tr911L1C28Kh6cSK3jISOONNxIvb8bMO2QmPYijnpPebZWMc6k6prXRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_10,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309040155
X-Proofpoint-GUID: _qbcgmJlbh-reLHwfLmEXDjYYvVvVJvW
X-Proofpoint-ORIG-GUID: _qbcgmJlbh-reLHwfLmEXDjYYvVvVJvW

DQo+IE9uIEF1ZyAxNiwgMjAyMywgYXQgMzo1MiBQTSwgQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5s
ZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+PiBPbiBBdWcgMTYsIDIwMjMsIGF0IDM6MzMg
UE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+PiANCj4+IE9u
IFdlZCwgQXVnIDE2LCAyMDIzIGF0IDM6MDHigK9QTSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxl
dmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEJlbiBIdXRjaGluZ3MgcmFpc2VkIGEg
Y29uY2VybiBhYm91dCB1c2luZyByZXZlcnNlIEROUyB0byBkZWFsIHdpdGgNCj4+PiBtb3VudC1i
eS1JUC1hZGRyZXNzOg0KPj4+IA0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFjbGUva3Rscy11
dGlscy9pc3N1ZXMvMjINCj4+PiANCj4+PiBNeSBzZWN1cml0eSBleHBlcnQgYWdyZWVzIHRoYXQg
dGhlIHJldmVyc2UgRE5TIHF1ZXJ5IGhlcmUgaXMgYSBwcm9ibGVtLg0KPj4+IA0KPj4+IFRoZSBw
cm9wb3NlZCBzb2x1dGlvbiBpcyB0byBmb3JiaWQgVExTIG1vdW50cyB3aGVyZSB0aGUgcGVlcm5h
bWUgKHBhc3NlZA0KPj4+IGZyb20gbW91bnQubmZzKSBkb2VzIG5vdCBtYXRjaCB0aGUgc2VydmVy
J3MgY2VydGlmaWNhdGUsIGVpdGhlciBpdHMNCj4+PiBTdWJqZWN0TmFtZSBvciBTdWJqZWN0QWx0
TmFtZS4gT25lIG9mIHRob3NlIEkgYmVsaWV2ZSBpcyBwZXJtaXR0ZWQgdG8NCj4+PiBjb250YWlu
IGFuIElQIGFkZHJlc3MuDQo+Pj4gDQo+Pj4gV2lsbCB0aGlzIGhhbmRsZSBwTkZTIGxheW91dHMg
YW5kIGZzX2xvY2F0aW9ucyBwcm9wZXJseT8NCj4+IA0KPj4gSSBiZWxpZXZlIGl0IHdpbGwgbm90
LiBHRVRERVZJQ0VJTkZPIGNhbGwgcmV0dXJucyBhbiBJUCAob3IgYSBsaXN0IG9mDQo+PiBJUHMp
LiBTcGVjaWZpY2FsbHkgaXQncyBuZXRhZGRyNCB3aGljaCBhcmUgSSBiZWxpZXZlIGFyZSBhbHdh
eXMgSXBzDQo+PiAobm90IGRucyBuYW1lcyk/DQo+PiANCj4+IHN0cnVjdCBuZXRhZGRyNCB7DQo+
PiAgICAgICAvKiBzZWUgc3RydWN0IHJwY2IgaW4gUkZDIDE4MzMgKi8NCj4+ICAgICAgIHN0cmlu
ZyBuYV9yX25ldGlkPD47IC8qIG5ldHdvcmsgaWQgKi8NCj4+ICAgICAgIHN0cmluZyBuYV9yX2Fk
ZHI8PjsgIC8qIHVuaXZlcnNhbCBhZGRyZXNzICovDQo+PiB9Ow0KPj4gDQo+PiBUaGUgbmV0YWRk
cjQgZGF0YSB0eXBlIGlzIHVzZWQgdG8gaWRlbnRpZnkgbmV0d29yayB0cmFuc3BvcnQNCj4+IGVu
ZHBvaW50cy4gVGhlIG5hX3JfbmV0aWQgYW5kIG5hX3JfYWRkciBmaWVsZHMgcmVzcGVjdGl2ZWx5
IGNvbnRhaW4gYQ0KPj4gbmV0aWQgYW5kIHVhZGRyLiBUaGUgbmV0aWQgYW5kIHVhZGRyIGNvbmNl
cHRzIGFyZSBkZWZpbmVkIGluIFsxMl0uIFRoZQ0KPj4gbmV0aWQgYW5kIHVhZGRyIGZvcm1hdHMg
Zm9yIFRDUCBvdmVyIElQdjQgYW5kIFRDUCBvdmVyIElQdjYgYXJlDQo+PiBkZWZpbmVkIGluIFsx
Ml0sIHNwZWNpZmljYWxseSBUYWJsZXMgMiBhbmQgMyBhbmQgaW4gU2VjdGlvbnMNCj4+IDUuMi4z
LjMgYW5kIDUuMi4zLjQuDQo+IA0KPiBTbyB0aGUgaWRlYSBpcyB0aGF0IHRoZSBjZXJ0aWZpY2F0
ZSBwcmVzZW50ZWQgYnkgYSBzZXJ2ZXIgZHVyaW5nIGENCj4gaGFuZHNoYWtlIHdvdWxkIGJlIHJl
cXVpcmVkIHRvIGNvbnRhaW4gYW4gSVAgYWRkcmVzcyB0aGF0IG1hdGNoZXMNCj4gdGhlIElQIGFk
ZHJlc3MgdGhhdCBpcyByZXR1cm5lZCBpbiBuYV9yX2FkZHIuDQo+IA0KPiBUaGUgY2VydGlmaWNh
dGUncyBTdWJqZWN0TmFtZSBtaWdodCBiZSB0aGUgc2VydmVyJ3MgaG9zdG5hbWUuIFRoZQ0KPiBj
ZXJ0aWZpY2F0ZSdzIFN1YmplY3RBbHROYW1lIGlzIHBlcm1pdHRlZCB0byBjb250YWluIGFuIElQ
IGFkZHJlc3MuDQo+IFRoZSBjbGllbnQgd291bGQgY29uZmlybSB0aGF0IHRoZSBJUCBhZGRyZXNz
IGluIHRoZSBjZXJ0aWZpY2F0ZSdzDQo+IFNBTiBtYXRjaGVzIHRoZSBJUCBhZGRyZXNzIHJldHVy
bmVkIGluIG5hX3JfYWRkci4gKHByb2JhYmx5IGJ5DQo+IHBhc3NpbmcgdGhlIG5hX3JfYWRkciB0
byB0bHNoZCBhcyB0aGUgcGVlcm5hbWUgZm9yIHRoZSBoYW5kc2hha2UpLg0KPiANCj4gaHR0cHM6
Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvU3ViamVjdF9BbHRlcm5hdGl2ZV9OYW1lDQo+IA0KPiBP
ciwgaWYgdGhlIG1vdW50IHdhcyBkb25lIGJ5IElQIGFkZHJlc3MsIHRoZSBTQU4gaW4gdGhlIGNl
cnRpZmljYXRlDQo+IHByZXNlbnRlZCBieSB0aGUgc2VydmVyIHdvdWxkIGhhdmUgdG8gY29udGFp
biBhbiBJUCBhZGRyZXNzIHRoYXQNCj4gbWF0Y2hlcyB0aGUgSVAgYWRkcmVzcyB1c2VkIG9uIHRo
ZSBjbGllbnQncyBtb3VudCBjb21tYW5kIGxpbmUuDQo+IA0KPiBJIHRoaW5rIGEgU0FOIGZpZWxk
IG1heSBjb250YWluIGEgbGlzdCBvZiBJUCBhZGRyZXNzZXMsIGFjdHVhbGx5Lg0KPiANCj4gU2Vl
bXMgd29ya2FibGUgdG8gbWUuLi4/DQoNCkkgcmV2ZXJ0ZWQgYjU4NmY3ZDk3Nzk1ICgidGxzaGQ6
IFJldmVyc2UgRE5TIGxvb2t1cCBvZiBwZWVybmFtZSIpLA0KYW5kIHJlY3JlYXRlZCBteSBORlMg
c2VydmVyJ3MgeC41MDkgY2VydGlmaWNhdGUgc28gdGhhdCB0aGUNCnN1YmplY3RBbHROYW1lIGZp
ZWxkIGNvbnRhaW5lZCBhIGxpc3Qgd2l0aCBib3RoIHRoZSBzZXJ2ZXIncw0KZnVsbHktcXVhbGlm
aWVkIGRvbWFpbiBuYW1lIGFuZCBpdCdzIElQIGFkZHJlc3MuDQoNCk9uY2UgSSBpbnN0YWxsZWQg
dGhlIG5ldyBjZXJ0aWZpY2F0ZSwgbW91bnRpbmcgdGhhdCBzZXJ2ZXIgdXNpbmcNCnhwcnRzZWM9
dGxzIGFuZCBlaXRoZXIgaXQncyBGUUROIG9yIGl0J3MgSVAgYWRkcmVzcyB3b3JrZWQuDQoNCkZy
b20gdGhlIGRyaXBzIGFuZCBkcmFicyBvZiBhcnRpY2xlcyBJIHNhdyB3aGlsZSBmaWd1cmluZyBv
dXQNCmhvdyB0byBnZW5lcmF0ZSB0aGUgbmV3IGNlcnRpZmljYXRlLCB0aGUgIlNBTiBsaXN0IiBh
cHByb2FjaCBzZWVtcw0KdG8gYmUgdGhlIGJlc3QgcHJhY3RpY2UgZm9yIGVuYWJsaW5nIHRoZSB1
c2Ugb2YgVExTIHdpdGggcmF3IElQDQphZGRyZXNzZXMuDQoNClNvIEkgdGhpbmsgdGhpcyBpcyBP
Szogc2VydmVyIGFkbWlucyBjYW4gc3BlY2lmeSBhcyBtYW55IElQDQphZGRyZXNzZXMgYW5kIGhv
c3RuYW1lcyBhcyB0aGV5IG5lZWQgdG8gd2hlbiByZXF1ZXN0aW5nIGENCmNlcnRpZmljYXRlLCBh
bmQgd2Ugbm8gbG9uZ2VyIGhhdmUgRE5TIGluIHRoZSB2ZXJpZmljYXRpb24NCnByb2Nlc3MuDQoN
CkFzIGEgZnVydGhlciB0ZXN0LCBJJ3ZlIHVwZGF0ZWQgdGhlIFJFQURNRSBpbnN0cnVjdGlvbnMg
Zm9yDQpyZXF1ZXN0aW5nIGEgY2VydGlmaWNhdGUgZm9yIHRoZSBiYWtlLWEtdGhvbi4gRm9sa3Mg
Y2FuIGFzaw0KZm9yIGEgcmVmcmVzaGVkIGNlcnRpZmljYXRlIHVzaW5nIHRoaXMgcHJvY2VzcyB0
byB0cnkgaXQgb3V0Lg0KDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
