Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63BB1474A7
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161595; cv=fail; b=cNDrhsrLFy/2Lgdh0qPE50wu9iIfAgZLl85LKZqiWMrPjNbDX76KfgjYNyKX8BzqdLx8wqINqi3tT8IZaJb9e+jL3LO761rKJL7iG15NhBzEbs6l6pRx/5Kev/MnKSHx4sTdVPf3bw2J5ylELQiEejxTI5P0heh87kNJyeMUJx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161595; c=relaxed/simple;
	bh=ioba+NJXB/ijDCSGmXdOo3tV41RQa+BOvEZEsU1EOjs=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=cALbS78+4dkHDMOPQ7QmtXf3NJsG+DAsulER/RVjLQrakibOeTKx3aFobluCG8nmz83OXxgsZ2QL4b3vEOgljTJlgsyWmoDxCetDEdwxQdFvknRxabkalGeRJsjAnSxv0CxxGR4XVdD3Ow1vXs2oM4ePC069vie+61IZb9EvS40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gq16Ypdi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y8rLTApv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gq16Ypdi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y8rLTApv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEXk6J006548
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 14:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=r8VnclF1+aw23/2s
	/zCySuda7FKUqzDPG2Ls/ojC5FA=; b=Gq16YpdiEXszid+1ZhyPz/srqvpFyQ2G
	hektt6o63nPGtz/YLlHTUdjKvr9mfeub3SPR3TCDvZmP5qhPjhZmBdt5YkK1vW45
	VagLltOeLVFO+iwxV8bGFBPdHbYtV0kaItXcdqJAikXjPf/0fmBCoY2SGIfMsHWk
	tON6TDFiYz3zo+k48cJE8ve0QWPZUchhQe3S9m1iiZYUJ01GKf3frc4XI+LPF0tM
	b4fiCfJcwpjoyc5msvCtpRy7IPP0yWzHFGObPe0bHkMm+Ty9orAMr5U7LFyTacwX
	3mRBVlnLIjZtuYdwyIQB0tUCMEDsUB3pSQ5a6Vq20Wq9BuZY9EtKAA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fmf808ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 14:39:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TENKSY005412
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 14:39:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9vxqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 14:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psXwZ2S58QlrBbjcdhhBbg8JekUsAKiqUxpmmW9EtApbS+HGbHP2krWTfqbijG9aY/1qeSknYgdmDB9r4ZqWtuuEBGBl/yWG2igwDYuSCfqWGxXs/im7fYaO+/+dhHIsYo2MUIBHpL/KsqPoYh54LR37eZL3zP+IoTVqtlnpluHoC2OqXfJjtRj9EknquTpHcusrxI+pUYm5qfYnWOv/9RiYCoKyf9kV9u87pa16ynizfxssONBS+tQUXNnlD/nRVScgpJIpRDZZ74AdnSXnwZmsOUnVn2POxk1HNkW2PLfTuz0gcjf1lBPVjB+o91KwFB+WmPdGPKBzwBvu/PTs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8VnclF1+aw23/2s/zCySuda7FKUqzDPG2Ls/ojC5FA=;
 b=xiebRYW2yk2WLbnaQ8p1gpkwNOk2uI8V5p29JIRXH0yg0xOexDSEJEIRHinuCByj0L4T3T4nvaPxaWsvoFJkIvaiE1XcAzxbyN190gxAS52cjDrjyFVSoP9P3lSvbXpB59ZZeMuHRyfv5kvyeEjugty1I67fuqyzzhJzksSyRcMF0ODXrOqZC9jANDZbduJy9uAgdF12Qv+0LCtbcytffAHoC1fBKB4jHFCvKjzmTs9jTltPDY/qw+C4NbHxpCbD+c023mmQHVLsul80y+uyE7CfUmTpcLzgSkIhOfWYx9d6A7F7qZ4klBXWj0J9PulEmiY7A8YlUM+7rx4MeIBmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8VnclF1+aw23/2s/zCySuda7FKUqzDPG2Ls/ojC5FA=;
 b=y8rLTApvxbcSD/D9P8+vQnwkm2j2j4LMQyGYvcRnRZGERZ6ValM/jqiPJ/JVWJsHS/hbWAaRpwBoGJzBPtTT60OhWaESJDbZmSUv6vFiWUcmXrlUlR0WboftWl4vg9hh7JUzL1j9SLDIJMgIoh3dqyanveGpkvc9HiEfE1lJkpo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN6PR10MB8046.namprd10.prod.outlook.com (2603:10b6:208:4fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 14:39:49 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 14:39:49 +0000
Message-ID: <77ac012b-0ad7-4aa4-8b27-7a837c6c03be@oracle.com>
Date: Wed, 29 Jan 2025 09:39:47 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: Preparing for ktls-utils-1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:610:53::30) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MN6PR10MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: d91e7931-aa68-4b54-3b4f-08dd4072c865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUgwa0xQYWdDSUV0cVlBYTI3QnZYNzlmd0kxS3czc1NTTGlCSGwweWlkeU43?=
 =?utf-8?B?VjVjLzZoVGlTYU9WZ2hBS2tsVk0zWFFaV3pYNXRpeGlSZG00cTNaekRUS2Nx?=
 =?utf-8?B?UjZsNWhmRTFtTkxHNFIrb0VzWm52M29RNTRTQjAyRjh0NTRpa3FUOG9mcE9C?=
 =?utf-8?B?aDQ3YU5Ca2Ixa0NDMTRIc2pkUHpmWXB1Vm5OOEJjcXdGZFA0Unlzc1VJVmgz?=
 =?utf-8?B?bVNyMjlKTjROeDBOemp6Y3BWcmViV1I4cEhkQU5nVzZBQjRSVWJ2RDExaHFn?=
 =?utf-8?B?UHJydEdhVTJQaTBJekIrNndtN25OMThyYjQwdXNURk83d3J4NnVzSVE2UFhy?=
 =?utf-8?B?TVFhTURRYVJ3TGRaSzBiOXhNdVFvYmp0NTA5bzMzU1BpenM5WTh0SGlNcnU5?=
 =?utf-8?B?T2RGOGVubldQaGRnaEdrYXBOZERCZ09UTVo5NWxSVlZxWkRqQjU4MzREMStB?=
 =?utf-8?B?ZSt0WmRiNlZWZnc1R2FaZU5Jc21YTjB4S05rQmNEdmNUVU41WE5IVVlQMlRM?=
 =?utf-8?B?TWRKT0h1NzI0V0FxelpBTjhkOU1jcHRsYTcxUzRLZDFTVkNuSVNZa0RjRVA2?=
 =?utf-8?B?dHNLWEg2N2F6S2tSM0NYaFVSSk0wZkdhRlRtdU9oNTgrTzN1cCt3cEtwYW03?=
 =?utf-8?B?WVkvVHpUMEZ5UWlhQWxRS3VTMHlLK2xqUEN6LzFpc3locktMQ1NMSUt2OEpu?=
 =?utf-8?B?UyswY082T0p2bWRBSUs1bXlJYzJnVlk1eVNIVG1idTg5MGFua0QvbDgzT3dH?=
 =?utf-8?B?VjRBa2FFMFppR1k0S1AyN3JiYlBNWjBBWDRNdXVXSExWSXFvd3ltQ2M2VWxi?=
 =?utf-8?B?MW13WTlhMmJYYzdFd1BzU29UZTNPdzhCZk9CNnpMWVhUUDU0dFJUci9vdmRv?=
 =?utf-8?B?RnFEZ3NwNmhBN1gyNVZMMERjOGdCMzRhNk9xSU5VNWhtdnNrZ2xBc05sT3po?=
 =?utf-8?B?OUExK3FIVXFDT2ZDanNmSEkwbHRsODVZbEdEaVJ0clJjdkFySm9zcE1tTUYv?=
 =?utf-8?B?Y0VEM05FVEtwVmhSRkM3K1htM0J4SmV4NjA0R0tjQWlUcTdxcy9lNlRGRFBx?=
 =?utf-8?B?emhKZUhNcWtENElWWkZjOVNVMXZYK2psTStWMzlWeVJvUXpadERBK1lIcWRj?=
 =?utf-8?B?NjNxZFdhNURBOCtSNktkMFZydElpUUFpWHE2M3R4V29FM0hkT1dQU0wzTTU5?=
 =?utf-8?B?NVowUmtzbDFKWS96aE1BZnhEZXVWT3RYV0EwaG9LTmNQSTlHTkVhcVpHREZI?=
 =?utf-8?B?UndKTnRLZDJrdHd3TWRhbW94enpyTzVUVDlZVVNob0t1amxrellPVVZSWVBk?=
 =?utf-8?B?YVBqV1dOb3pJWXl4ajI4YmN4SVpNOW0zOHBwUmlvOThWL21pRFNqZW9Kc2xK?=
 =?utf-8?B?RUNTaVpxZFowV1UxalhhbnRJZ0pWSXZOUUFjV2h2RXpHbnd6ODNvcnE5YmFs?=
 =?utf-8?B?THVvK1hhNXQ0THF2YjVaUnhjMWtjM1JyckszQ25TZ1pGMW9SeGNKZ1lxazdQ?=
 =?utf-8?B?WHdKQmpMMC9KZ2J1SXg3b3owd2NGSXU0bGJZSWFpY1Q2eHBMTDk3eC9EWTNU?=
 =?utf-8?B?NHlDaE1rdjZiWXNYYk5nUzk0d0dXTUNYU3JPcUtaYlVaQ3ViUDhZTGIxOXlG?=
 =?utf-8?B?TnV6NDhLNmVaVzlFemE1VWdXMHR5RUJ4eHhyTTZ2endLTUxhTmFLTHZqb0ZB?=
 =?utf-8?B?OFE2UVd3MW12T2N5WG8yTXhrdzlTTnZER215bkRTN0pSOWdDOWV0NVMwdm1L?=
 =?utf-8?B?bXBVaFJtbkdua3JmZ3hCbG5qMnFYSU9paUVBbWpYcTlPbnEyQUw2cU5UdCtB?=
 =?utf-8?B?d1R6cmE3UUhKWHhWRU5DK0JVZDUxMlN3TmxUYmlPdFFBSG5Hb0NuNFpjVUxy?=
 =?utf-8?Q?/PtWh+1VOt0iW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djA1Yk9Fbm1mMTVMa0NDMUJ0WlcrL3JVUlFHanB1SWNaTjR6bnZHWk5YL0lD?=
 =?utf-8?B?VlA2dVdFT2o1UEpmOEZuZGlZeW0zOEpEcUE4TnhJUHYyQXZwOCtFZXQ4TU1N?=
 =?utf-8?B?dHZUVXNOa3hJVlFLRTBCbmF2WURXbGV1YzV5R0VQallrOVpSNXdvbWhCMEVD?=
 =?utf-8?B?eE9Ua3lXSDZaM3BwSEtnV0N6bE5yN240SUxnUkpJeHhjMStsR1BEQWpuczJl?=
 =?utf-8?B?VWREcDdGYk5FeVcyZncveG5zck5vcjZrbVh4OXVUU0l3RTFSbUhGWmpLR3or?=
 =?utf-8?B?bkVlZVhNN3p5eGpvRExDWUNKTHl4NGNkZFhTTmEyT3JaQUw5QUZNVGlJTnpT?=
 =?utf-8?B?SnFUaEJ4aHdwUFRTU0hpbkczemNwbDVod1Z4QjZKMVhWUThBM25iaWJXWWlx?=
 =?utf-8?B?Ym5PTWR0QXJuSnhVWjJ0YVpLQjZBdXlaNmZlVnd6aklTVmNxNXJZUFFJY3dO?=
 =?utf-8?B?aXBucVo2Vm85MDdKNFBvRitUSUF2cWZWcGUwZWkzTHd5dWRPbkkzanI1dVVN?=
 =?utf-8?B?RHlxR3Z6Tm1KZU1WRkVOc1BFR1NQR0RQYWRsKzJiYzRhMWNHc0hHTk55MmRD?=
 =?utf-8?B?OVg1S1pWb3VISFY3Z0J6NGZUWVliTCtDb0xMa3VuUlhJa1YxM2wxcStLVDdw?=
 =?utf-8?B?cWtzNEJKMHk3UTVwZHJROHgvZUVWVS9YWHNwTTJQV3JyQ3VqZW5kNFFFb3U0?=
 =?utf-8?B?UVJFMkRKQmoxME9GREFGd0dRcm55WW9rSXpvUDVBeC9McDJZaWl1ZDFpL3Jt?=
 =?utf-8?B?VmtCWmQwNTBqbWg1aytMMjBHQ1JzR3hsN3d4c0IwUm5OYlBRS3RMbnl3aWZr?=
 =?utf-8?B?QjNoaWY3andxaCtIdW1NZGptT3lyZytEV1M1akdWR0JXa2V5NUhlUzR1WE9Z?=
 =?utf-8?B?Ryt2T0RsYzhBOWVqVHAwUGtmSGR4aUdRcDVYUGxiRXA5aUZnc3Z6bEZacHN5?=
 =?utf-8?B?Vk5mVmhidi9haHpZOHVRckU1Nm05MUNoNEw0dmlqN3FFRTVUTmQ5Z0ZtOWNh?=
 =?utf-8?B?UUwwN05Oamx4YkQyN3NobENFbkFTQngzQk0xM1ZvWEVIbGcrYjhnN2ZMSVR2?=
 =?utf-8?B?NTdUN0NaV1ZUUnhwMldOOXdZZE93d1E2NExqMnNQdEZac2dZV1h4Tmp1aUlp?=
 =?utf-8?B?Z3JENjhFVHlMUVlqcjUrTlJESVN1cS9Wbnl6UHF2ZkJlOEdtSHBtZjFXYXND?=
 =?utf-8?B?aWtJRnZWK1d4Q3ZCNnJIZmRNaVowYnJ2aFpOaTd5SzdhRmtzN3dCNHRoMVVH?=
 =?utf-8?B?d09KS2JJNVQ2aGlXbmNUemI1UGE1TFpWL0hLako2ZzRMOHFHYUJJTzVid1Ix?=
 =?utf-8?B?My9mRDlicWUrUHhNYVRUWE5xbktNS214MVB6WGtRMmVWRUVMYjhMVXBRRnF5?=
 =?utf-8?B?MlIxM21sMG9IaGlnQnRhUjN0WUNtcUVGeGhjejh3OTc3NHBLZlFLd0k2ZFRG?=
 =?utf-8?B?TFQvYmR3MXdSN1lnQ0ZzbS91dVB6YlpGTFpjWmU4RVdCK09ySVhKTTh5NFdm?=
 =?utf-8?B?bGJwaDVOVzFvMmFUaVE4TG1WTWd1aDQyeEt2ZWlLbDBRZ3hoYWRNRzBEMmRQ?=
 =?utf-8?B?NHc0ZDBCczdDWmtkRXhUVU5nUkxxZy9MRXZRMllDYVJmVnNPb09IS0VhS2kv?=
 =?utf-8?B?TEZiUVlBTjhaVS9Mc3RETWcxUVdYSHo0RU0wdUdZT3ljdUlaSXppWUE4YkFV?=
 =?utf-8?B?WUlOUkVjSytJMEd1aTJzZC9zTmgraXYxVUd6MFFJN0JrVVpueFdEcXVVdVNn?=
 =?utf-8?B?bVdBalBMNU9YZlJLdHFuSzlQZVc0NHFGemNlTmRBOWJWUkQ0RzBkVGdVYUR3?=
 =?utf-8?B?eVRyRUdJdUFEMzJsTnUvOG1BM0dwK0JRcUlLb2RnQlRXQll6WnAvZnUzazRl?=
 =?utf-8?B?c2hsY1cxc3gwQllwUnFJNU56RHljM2tnNmpZc1VVdFIvV2tFRGdGajl3WnhM?=
 =?utf-8?B?UDRjVnRjZ0hDd1hLWjdITWhtbUFDYUJjQ3R1RG5OQlltMlFTVlNWK3hxMmto?=
 =?utf-8?B?UE1lSzZVQXdhWDBJdEFqWlQvdDhYSy82UnJ1a2dwSDNBMW1ReDJ0ZG9RdnRn?=
 =?utf-8?B?QitDSzZTWSt4UHVEY1BTdXZ3b09UODBKdXJmSE9STmhXdEUrZkZObnJ1VjlT?=
 =?utf-8?B?L1F5Nkc2YVBSRVBKOUJhSGR1QmtTVW1DRTNNY0hSR2FYMG5TdXNyUms5eFZ4?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wWkwIr1Wiv4O4/vdWZ6WnX3HmLjvEWERtwkOl6Euun6PBmQdj/p0ks+kittbI40swJo69tuvVbNx/J0oDt4xgrISzlNT1n6PxrA+7hfyUSbN7Dd3wAvHdwFx0yeJiswAB0+tYpOE3gGXATKXJituk5vx8Dw+QrerQRd4zLtVvIu+obuiX+VlEwtnDjGftj+5UjbjdSOU6UeLFmUScDENfgNrQZe8nv6eWSwxR74dGPCamrzgVSsBsN0FNnvIbjrZd0CgiHsjRhpz+JUURfRNahTHn1aAOJuwZus/XOVFCeZnIpEGU2k/GwBEC/KcAlDYAaOvjf07BwNO6yHjlypiDeiEoagKI6zbIJqKwyuTDlpXEsji1Xh3GgoAo9hSe+EO8r0JUYnOhBwIwMnInvUOueYG8dIQdDPGxbGNLYvfRHH/1UN+Ho9rJfGGwsCTsQ/uNbIUBjKNkEzDsxDPCEdUVKUiYPHL8eo++C0ELKq7VrY1aK2FWJ83zaT+6GlUlxJvPzNMP0Z328ahIC/tczh7lwkFmAlbnuci1ocL/Y+H+8ibn3s5Zu13RY5fqiXZnMycf+VnaFOqFFkx6eNrcaDvCema3g+OPfPztLXnYgkDXAo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91e7931-aa68-4b54-3b4f-08dd4072c865
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 14:39:49.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wwjBiOt6OG83US4O0zCq9oMhkofSI+vQya9DZmva8lCUsoLSDPNxodOr+uRVrGHkum2tAsO/29o78ibyr//jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=787 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290118
X-Proofpoint-GUID: 86fj0-h2ynAwosvOkt4HKogyLt1bqUMZ
X-Proofpoint-ORIG-GUID: 86fj0-h2ynAwosvOkt4HKogyLt1bqUMZ

I received a request to publish a fresh release of ktls-utils.
My thought was this is an opportunity to release a 1.0.

I can request a Parfait run on the current source code. I've
never gotten Coverity to work. Any other analysis tools we
can try?

Are there any other features that should be in this release?
All code review (or re-review) is welcome.

-- 
Chuck Lever

