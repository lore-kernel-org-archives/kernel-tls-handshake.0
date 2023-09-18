Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EA66FB8
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 13:48:41 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IA3ojt032011
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=Oi2uzc63k6eVUke0RyNknGeZA5povzk6m/iE3sdCbso=;
 b=pjwtLYuB/FhAPQrabiGsJ4TRLwlrlZ4RweMqDrWWnwfud+fGewf/CTmc/o/fk6IHKUtu
 8nfXb5bMwYA75JG/mR7Yx2KYPJW2MOY4TWSKWISEmGRt1oSvsRYNtrCb/J13l3EI9a2F
 aU4OBlQDexe5cDp7eAJtCcFFl1GiNRdKF4vSaCN1W1tRkLP8CQHzOjeCvkutw8e82gTl
 ywYfmq7HA3TLvdd9YkEB8IpjXyvyE6ZVwjAwWw2tZanPJ/0WRJ/dhGyg8onHfnHr1nCx
 1CGFVGfwKGe8XA8Ujyrug5jlp/8Lz8oojyGDFrsu4bhHTSHNfvUB7AZpVsmMF57v+2s8 kg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t54wujh0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 13:48:35 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38IDd58v030850
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 13:48:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t52t4a3hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 13:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra/pGX2yil+Wil9wrrv1+JTuv+eFtAVFHjBcmJ7zdTuKFnjnU2kQ9Xbdv0IxGNNFPbvBBKFBsi8HxMVsMsFGIrdWqHNeisSnc6x/vlcJcZJ7pIoMhYZIYL/IM/r7vpqC9UHqdJFiEztdouzlqNPZHUot0AM9Tud+whW9yRYG2/YXr777Wj28xw2K2wanP1m7HJT9Phbt4XGsWjukDDOCtX24LoEzckbeA8IUZDbHL0XXjlyDtToaZxtpA0SPwzxVrjpzo2BTzw/HNZ3h28qpcZcQTkGWIyoMq643P2vjPTLM+nY3CHUtmHS5dO+O5U64Q7umHrlseRhlTWkhT4n9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi2uzc63k6eVUke0RyNknGeZA5povzk6m/iE3sdCbso=;
 b=DgeBDyu28koWD1XHV61djDuRxPjveIZzno11tHDk/hD3MfenyakPLmu9+mjMafZC0XZZIENpVv0cFweiuXjAxcwQcctWjeKkOJHY3O1/EOd3JY8GDSZyJrAuoohhJqF8kspMwcp1y6kYSGUfxEUR9lfOTuendg/SkGqpynKliwluHgGdfIgnE4TnDQ/NyOp5H41jB+Ads/OjZATMnsAiVntTt/DIsXsJryPmpQN9suLNL6ksdJKyEwukg5/2cuQRkC+ra/cEz/3tpYZ1ddEVdfwioI9k1241Xcnbqe77kX8Pbc7S+I1AWX+tgTuwntAtj+8lIx528k1yOsPMSfqQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi2uzc63k6eVUke0RyNknGeZA5povzk6m/iE3sdCbso=;
 b=bLMBTZhkGbxpgqIRhOUUX8QDtdu2JcQcvTuu6uUktrPTSFVDno9SjDlctczPbktIqoE0Sd8UJPxxbm4lcp4/sqL+2q0Is9d49sFFmh2Up8nr5geKvzTBw808wOB6u9eoNkm5ATq2/i/UuNnSLPxUbdLdh2iEC/yzYk0lKIrnie0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 13:48:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144%4]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:48:32 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZ6jbPH+dsOQqNgEGwnowf7bowwg==
Date: Mon, 18 Sep 2023 13:48:32 +0000
Message-ID: <C1CF4349-635C-4BD4-A0C4-7811E23A179B@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SA1PR10MB5841:EE_
x-ms-office365-filtering-correlation-id: 6821c7ef-9ce0-4825-aef3-08dbb84df25f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Oyk21Z8CosPBZ0UwYSvYhEqVBFM5C4QYfWT6R8zuOi21LgvjvbhVk7zf9UalbCAkjLg34def5VGEwyWkULq7aexP+LmvnX2gPiJbuA90jx5KtV3SodEe2Sxj7aA/Ep/g00ozaIa1FgjEioY726qGFJFcw694soKzFUy5/3YYirEnuipMmwJtm6M3RIDgSIHdWq6JZS1oAL5XVGtZ4rSIV5GGEYh/3s1pyoTturW7TAlU7wbEpXTOG2q/PzYZp5GcU0z7Z0kWGy4gObg0DMnt1xWTQgnmWEa5MKZov15HQn6lkwEmnF5PAtGcVl8MOSEBUu34cv0GKwbRL9NWm+r1cfdOPxj2gj2EaYxoDpIgpettXBwzJVRH86UPejwv7LVlq3/EbNtha+XYxViL3EuZXsdUJhpmZzpYJJQOFF50KLG4raPF+AqYBuQRFGCiek4ZYx8D5JNNLbJ5UapP1o1WF1c/dkeb0/77ff6Tx0bFy9P5hQElQtj1OGSUd/SxB+sI/yLgLBFq7atZL9yujlkrPN4Tiy5ipEzoy04zvP/VRSdCUSRNhzpwi9XoYrwpZh8exrGqwxRVwMNmfqSHdVGIXX4BzDe9/MKvsa9oEqgClLHAxdkjLWmnv05hGHHSKIP6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199024)(1800799009)(186009)(6486002)(966005)(5660300002)(6506007)(86362001)(6512007)(316002)(64756008)(66946007)(66476007)(38070700005)(66446008)(66556008)(41300700001)(38100700002)(76116006)(71200400001)(478600001)(91956017)(6916009)(2616005)(8936002)(26005)(33656002)(2906002)(36756003)(4744005)(122000001)(8676002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZG1IYW8rc1N0bFRNd1Z4ZFpQSDQ1dEd4c013RytIbFVBT253OUxEMDlWS0U1?=
 =?utf-8?B?eEhnTGgwdG9Ec1RTR0NYbzI0Nm51WmYrSmRGWnUwcEVucW5PZjNPcytlczRp?=
 =?utf-8?B?VVhyTTJxNDhBUjdxNjNmQmtYWGtFTUVqOS9NZ2MrdlZjQ2NJZVZ3cm9KM0h4?=
 =?utf-8?B?cmJnWkJQb3RVb0RIbytpNnh6Ukh1bHVIYjRUQzdINXpYdEVCREhScWlxaFJ2?=
 =?utf-8?B?YlJTT2Q4ZEdBRmM1U2YxUmxhN28wcjhUc1hRZFBhT040K2RzVEVGQmdSdVkx?=
 =?utf-8?B?V1djN1ozbFgzY28yTUlUMWx2NEJDWG1hZTk2MGJXWHZTSzdiZEFHMGxPdUtR?=
 =?utf-8?B?L21UaTg0ZTNpUnhWb3R0NG5Jbml0S1RUbXFIQXZSa01CcWMyblVrWXMrY3RR?=
 =?utf-8?B?cnZIeHJ6dWVERHhia2lGdmt6Zzl6cm40NnZ0L3hnNmJ2ZVhGdVV5REJ6ayt4?=
 =?utf-8?B?Z2E3VFdGRDNBeE0vZTJLWEczNnA3YU9maGw2M3lmaEQvYlE1N3lBYXUrUEF0?=
 =?utf-8?B?eUtXc3JvRUlJNXFFMjVJSGZkZDlUOTFtaS81M0xjd1V1YlJ4R2NUMmx4a2xt?=
 =?utf-8?B?UGMwU0lxM0pONVd2amRYTUk3YmJkOE91VVpHZTk0eW5xM3JHMXlvQW51NTBR?=
 =?utf-8?B?Mmp1b0N2dUFTenlsdFlwaUtKWGRNSnBWc25Lb2poMW16TEVGNmlQVkthZUYx?=
 =?utf-8?B?Sk5ubk9sUmZaeGFhVDZUM2QwMjM2eXBXTm90aWhUZjBIVVk3bkRrU2xSYVA1?=
 =?utf-8?B?UmRUREI5ZE5oK3QrNXZEZlZZalZFR0NjL0xqY3Vock8zcnNBZ0hUb1pmQVpS?=
 =?utf-8?B?OEx1TDZpeVE5Y2U1SnBBejlXa0R3S3k2TXVCbVQwOFF6Z2VhNC9xRktRalRW?=
 =?utf-8?B?aDZGektsWVl3d2h4QUJDc2preTNVVVZLTnJ3RVBFYWFrNTBRdE9TL1RKREpL?=
 =?utf-8?B?OS9pcHAvMVhtcG05ejYvZ2FMekM3MU9OTExmRkJsUFFhdmN1WTF2dmtvejlQ?=
 =?utf-8?B?dVJHdEQ3ZUliNUw5RjFFQkkyR2hGYUhYU1JhUXIwU1NVc3F1dnA3Rkd6bUxF?=
 =?utf-8?B?QTNPM1orSW1vVnQyUkhLR0FqeW1LalRxb290ZU8wZGUrM1ZDYk9nMUFEdWRS?=
 =?utf-8?B?Z2sxNU5EbCtLbGVQbXE2TGFHUGYvRk1OVEw4djhVWFFvZ213RmpmVlh4Skpo?=
 =?utf-8?B?dkhQWnFkRWlXK09iNHFHTGpqbmhYL0VERTNPaEQvYVR3V1VNKzc5MEs3V2VB?=
 =?utf-8?B?QjhDNHB1dlZZL0VnV1M0T0dYN1ZkbEhXMTl2TGk2SkQ2aXIvaStXeC9tekx3?=
 =?utf-8?B?RXBhQXhud3lyUGJnMm9TVlZqMFhhcUxkWitnNzhpeTc3dHJhUjJSU2ptOHNG?=
 =?utf-8?B?VFYzbkZ1OG1EZnNWVUR5elcxSTFjN3J3Um1MbEpHZUtPN3NkSWZhZUVCUnhO?=
 =?utf-8?B?Z2xTUVpWRk50RFI1WXhaQTN5SGVPT3UreXRRcUlja2ozVEc0VFNGN0REbHdF?=
 =?utf-8?B?cFpxaDRlY2F5YmpLVGRnaTVNbEJYNnJVUU9zK1hMWXA0M2ZyNmJ6OUk3djRG?=
 =?utf-8?B?RXhFMmt6T3BWWXpnd2xGZGtRVm1oTEJqV1ZuK0JOd2VtczRuNTVDeDIyUEp3?=
 =?utf-8?B?ZU9MWmtQTEpiWjJwcFdTMTZNWmdaczJmNlJIcmsydndzN3RNazRZb0Z2WlQ0?=
 =?utf-8?B?OWlLT3FCWWl5MVFmakhwVkdHTlpaRjZSUzk4MTUzOFZ1cnlYYkpBN1BINHlB?=
 =?utf-8?B?N2YyUFcwTmdDb2tUL281aytwR1ZDTjBTdnhJeHVLeTVSREkyTi84M2pDc2ZY?=
 =?utf-8?B?TUt4b1RFUHlpLzlIQTdrUnhKb2hOZUEvQXcwcy9nMHhGcS9zR2JmQ3JSZXJn?=
 =?utf-8?B?MFI4cVVwWWkyRUtEUnVGK2N5L1djSmxkWFFrbEFYYm0yUmg4UGtqRGhqeXBu?=
 =?utf-8?B?aCtKUThicGRYaVpsT3FUVyt4RmZVQ0cwMGVHajVHZ3VLQm5hNTFlMEJjc1Jh?=
 =?utf-8?B?dWxBcWNqSjh3SVQ2QlV5cElmbnAyL0pueGc5bHdxRitZMzFFbjBlYWVSTEdv?=
 =?utf-8?B?TEw5bGRsNnNjc3JPK0hoTjlRMTBzdXh5b2QzOG1wQkpQUUZQb0JSbWNPUTNC?=
 =?utf-8?B?VEo3QlJsZWFiUTZaUklBL3BQUEFlRXJVRTFrSzc1TFJrd2tSc0lZOW1BMHlo?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F50FB2DA9603D44AAD1F0D6EEFA0B4D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/OOJi50n1h1GuLhC5k2TqTd7o8VPOTGNyNp34DL2FDZFyOMECFMsqYgJR68nu7fVpzMZV3YQ9cisTwT/T3bEIf8nwjiQMFCD73Eq2pHOprsaNbrQJeB/lJ3B9lT5MDh+poDt3N1PbdLGzVdO0tgZFulDffSq/ZFGDY06jwyNiGDLViduHcXFkwM0jG3Ba2MjUH75QvFRS1phtX4s9EbNpiZkrWptTGBouPL9YzJnTEvb0GSb6wyHu0p2ErGf0sb+YFICRpY9mhOpManPpi6OpMC7XdLAlWC6r/0KAN5Du7jC4rXUBuovQc38VsjXeifohAMYSGUTIzuq9+Di5IxAa9kaJUEGh4xZU6L7UpuvPieFPREyj3zZMeK+sczpzW9VAWTHMBfQxsTn9b7vt3+3re9+jNE5fAdcF3UZznlFkGA8iS4T80SigNizvR+kMfvIttkgAstxTqmDfS0z6lOVHwFMJWHzYoe3cnYh72SftG5dFwudhRsdcN6mTeWL4fbYLlhro0KENRLbJMx2PMIOFpdhP7RWehLmBYdvTgs/uK3OWq7sNrYPKI0myyJlWSjHmihEInJkZ1k13g4CeTXVylL1HO4W0DWjpfv8U0gOIPV4iFcIxo5HjSNt0RaXBSlBCaCQcer0w7MVEdxkyY9F+5Dvy9MEnJouBnUIWpmqF8540V0bIOLt/vgQyPdEPJ4guMZNRiAh8opewHVj10GiWcAiLxU3RpJKo6IYCRuspA69eMUPdGNuEZ6Q8Aj6XGa2JNKqpJM4KNu0uABrChlS/g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6821c7ef-9ce0-4825-aef3-08dbb84df25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 13:48:32.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bq6/hze8fasevM26DawsVtjl/2puFkuBiOx9kaxFJ3baqhP0lrA0trDyroiVg1qoeRX5i3LBeEx7JPZgp7HQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_07,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=854 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309180121
X-Proofpoint-GUID: xpReaC3yQhONpQByOj-bCU-qIkvQ-Yav
X-Proofpoint-ORIG-GUID: xpReaC3yQhONpQByOj-bCU-qIkvQ-Yav

SGVyZSdzIHlvdXIgZnJpZW5kbHkgcmVtaW5kZXIgdGhhdCB0aGUgaW4ta2VybmVsIFRMUyB0YXNr
IGZvcmNlDQptZWV0aW5nIHdpbGwgYmUgaGVsZCB0b21vcnJvdywgVHVlc2RheSwgU2VwdGVtYmVy
IDE5IGF0IDEwOjMwDQpVUy9FYXN0ZXJuLiBUaGUgWm9vbSBjby1vcmRpbmF0ZXMgYXJlOg0KDQpT
aW5nbGUgY2xpY2sgVVJMIHRvIGpvaW4gWm9vbTogaHR0cHM6Ly9vcmFjbGUuem9vbS51cy9qLzk3
NDU1MzgxMjYzP3B3ZD1SMFJ2WTBSUlJuSkdaVVZKYjFkTUsyTkJkVVJYWnowOQ0KDQpNZWV0aW5n
IElEOiA5NzQgNTUzOCAxMjYzDQpQYXNzd29yZDogODY4NzU3MjQNCg0KDQpQb3NzaWJsZSBhZ2Vu
ZGEgdG9waWNzIGluY2x1ZGU6DQrigKIga3Rscy11dGlscyAwLjEwIG5leHQgc3RlcHMNCuKAoiBQ
b3RlbnRpYWwgbG9jYXRpb25zIGZvciB4LjUwOSBjZXJ0aWZpY2F0ZSByZWNpcGVzDQrigKIgUGF0
Y2hlcyBmb3Iga1RMUyBzdXBwb3J0IGZvciByZS1rZXk6DQogICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbmV0ZGV2L2NvdmVyLjE2OTE1ODQwNzQuZ2l0LnNkQHF1ZWFzeXNuYWlsLm5ldC8NCg0K
DQpCcmluZyB5b3VyIGZhdm9yaXRlIGhvdCAob3IgYWR1bHQpIGJldmVyYWdlLg0KDQotLQ0KQ2h1
Y2sgTGV2ZXINCg0KDQo=
