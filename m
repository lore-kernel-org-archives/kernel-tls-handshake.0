Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C728507D
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 Aug 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754333970; cv=fail; b=bmIZzvpvOFjIRlSAMelv5I/mnAWrh03+TMBn/dqNqzH6B99QokHG9jxUZ7vruP9/5dZi8S9B5Qlz+embQEmuEyiZg5oh01IbRY0G/jPzBFSeIaDjLECRFsZRDtJlg8tt44cql4WBiVb/Ofj+ikB7klmdGKUKkFaQ/zk2kzADqzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754333970; c=relaxed/simple;
	bh=9czJdf78c8Njop+IMz0WlegEy+S/QCrXzDyL3sz/6dQ=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=kMijNtYMzu2GOKqJuDVw+TrFNULtRv9CIR4hpTHa9MOFRKbl5C+zree8tLi7cyOLSawKXHf6JXndWGa7HDGnNq6J7gbNQoDvM0BRFqHlL+Nc7Lgw7+b7pmLuqQzbXDmIVNap1ZpvWKMovoGZQPHmFyqastjudcsNTmIZVh7YtEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aOsDpfoo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=McwnhFJC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aOsDpfoo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="McwnhFJC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574D7Qx2015828;
	Mon, 4 Aug 2025 18:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=q+tW8puSYGBH+Urm
	HWgkpwqHcIZ8eavKAmroMekKmqM=; b=aOsDpfoo78/kNcAsweek1PKzHulX1bNn
	2H3A0YA+3PDvCCq4n0pc0CpRWBJG+hze2BvDZuZR1CkhLJAuqhJm2KcRAOhjigLh
	siaRSzo8MFnbyNWrio5kEOzOfhxcDwp+3+aimFVWzaiYClqVYE5p9o6PdHTVWhi+
	kJltkkU0KRHjB1wIZBkAlQsi5iEQsIoulPnHAR602SyIBvX1brPqtWkHWQzwh58j
	kgJdoTquVUUAbtuwQm+LcDxJpt8EYthDaj4kFI9ozA8dUOHwzSrur09CH+30kliC
	cEy24Bo9L81rhL4Is2Mvxf7NR307dptBAHw7WE6ZszE7Ip3JVe18cA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 489994kav0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Aug 2025 18:59:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 574IexQk025350;
	Mon, 4 Aug 2025 18:59:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48a7jst0ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Aug 2025 18:59:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeE0I4gsTX/3TrM9DhnJ99syEQsIyfdcygi9feiEJAP+9JibE2qSpbjT45Bwft1VLD6PHx0zrlO5oJoyF3zzAsPRXEhJMKgMnqbgBCYGwuHTN0gF3FWciLcd++v03N4S3A7s2l43xU7gjQxi9QjjUHX9tA0/uQ5V3udfcvslQDurdfHaAv4CCYjkEkDzWBhBA/9XviY+pzAN/VacBLcay4dEk+ff+0cPoAsR7bitjSbXAbSqtSHoyqXlEagQ7kI5wziWVuN1rInSuNc51b70MuMhjHm7181KQdty/vX49D2TQmZM38fA6oOYk6SuzhU5psIM8iBcIMO63DjXwxV2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+tW8puSYGBH+UrmHWgkpwqHcIZ8eavKAmroMekKmqM=;
 b=rTsGTceVnFKnthhHu93uRfMemeBMAGv6BMAkpQz7Ih6nUhhVPSKWS/t0J7HDd2krudlArYFgK6NzQo08Wsiqg80IrJj7SRgnWgKwdZ7KiB7KUxG1LkJZhdG+M6uXyzp9LNow0napXbqSSSljiOosAPToB8vOKEGYHxMVr6BcXsy0auqSvHsmXU5BdyFklRyHjC15u0hoy8uiDWv9lg0qmdhiXPn3DWsoPDnRbfK2+zgJQkgqmD4fENCRSm/bDhuU0Ut/BXQPMp7a7iFROSAliNrADyDiwJmele4JcncTG6H0EnHOhuoue1qfmKTJthZjFP8zWXjdo/ea7FfzROzUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+tW8puSYGBH+UrmHWgkpwqHcIZ8eavKAmroMekKmqM=;
 b=McwnhFJCx09JCw3YlLwyjznziPmozg1HAwd30tE3lDo4SfFlHi/w/Ovxz485/+gKtpxREp9nCqamHqH/zLPFBGp26U44IkhoDsgG6No0Dja3BVQjVOdZlozN+9aHf5uemX4SXkQh7IWWm/i2sOZBwQwrG3R5z3kpKcohKoVhJKw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4161.namprd10.prod.outlook.com (2603:10b6:a03:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 18:59:25 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 18:59:25 +0000
Message-ID: <960f5f19-7062-4c90-bcc6-f3abdb503008@oracle.com>
Date: Mon, 4 Aug 2025 14:59:23 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: David Howells <dhowells@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: client's peer certificate not recognized on my NFS server
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::14) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BY5PR10MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: d1028c64-402c-4cda-6883-08ddd38907b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXlkZXhFV3FXRG82L0V3UEtTRytWYzE1MkQxaUZyMVpvQXNVU0FaSVkyY29G?=
 =?utf-8?B?b1RuSkJaeGx2bUtpRXNLdWthZ0x5dTh4VlNNc1YxNFpIbVlqRXRqY2p2U3kv?=
 =?utf-8?B?VUtSMDI1cEdRMTJtQWN0ZElES3dBRUlXYTY2bnRUVUxVQVo0RWJIK2lmaWh5?=
 =?utf-8?B?TnNLOW44a3ozdjM1VEQyUXFXYlcwSzZwUEYxRXh5TE41RWpCZkVDVUdweGJl?=
 =?utf-8?B?Qk83Y2VJZzJYV2M1VE9BQmUxeVNtb084WURRRG9CeFQwVTQzNVNvTktISjVn?=
 =?utf-8?B?MjNvN0RIQlJabnRhZTlUc1AxL256bTc4dXJnbEJ1WUJkQllKaGI3K2NiNlY0?=
 =?utf-8?B?ZWU2bEFyY2VJcVhiRWtEN3cyc0Fxb2ppSnh5b0RxOWF1VTVOemdTTXJLQWh5?=
 =?utf-8?B?bUZPYWU2aWlYclUwQytEOG9NS09FbE1IWnNMeFNnSlpKbFEyNXV0Q05Oaitx?=
 =?utf-8?B?Z0JaUlFwMElHdDhpdXZuL2thUUpoUkFoaEN6NXUycmZ1Wkcwc3dicE1HeC92?=
 =?utf-8?B?WDdwMk9sUVM1ME1zZ3BBbTZEdDlZQ2J4UCsxUHNYR3RrVXE5ZFRONUVwLzdS?=
 =?utf-8?B?QkN1ZDJrR1hUYWlFOUxuVHNscEhubUhDOW55UVZ2b2dYMTBnNVh6OVJjRHVH?=
 =?utf-8?B?SW15dTJmTkxTSW1YYlJnUHBWc1g0SU9KU2I4azVYV2hlV092ai85dURQbnVF?=
 =?utf-8?B?WWE1ZUhxVWVmSFJxUk9peEVERTA5eUhsN09OcG5zT0N1VnUrM2tTQmQ1bjZL?=
 =?utf-8?B?UEJHWmI1UFRzakY4YVhmK1hDSHlDREM1Z01GU0ppeEoraHo3Z2F6MW8wZGdp?=
 =?utf-8?B?dTVRTE56YXpJbVc0OWVXRm91VHFDZFZoWXZ4VHk4MFhPOUVwNTZkZmMyRFpD?=
 =?utf-8?B?bW01dkNza0J3YndsV28yaFgwblBYWE5kcTBxYmoyc0V2ZXJaZE0vcFBVZWtG?=
 =?utf-8?B?c3hCUnhjRzIxOUJpNStvZlV5anJ1UHQzU0VGd1l4ci9nOVdQTWpjaGlJV2pD?=
 =?utf-8?B?bVNtQ0pocFp6eVBZcitaVHNLaXFNR3NJLzhNcWpObjFVM3d1UDBiTlZMdXdX?=
 =?utf-8?B?dzRWZHB1bXZwWmpWNU5HYWlZZU9wTlBTa0NRdFUybmI3NkJFbU00SUxqNFVo?=
 =?utf-8?B?SnhvV1BESE9XT2t4ZkwyTFRXblVsZGxDcnJHVlB5WnRET2xVUDZyRnFySkh4?=
 =?utf-8?B?YllBWVNzeDROcUlWTU4ydW4xZlM2WUl1UDBqQXZRbGRaZWw1NDBvQUdGYmww?=
 =?utf-8?B?bU5mZS8xNGpUb29EeUZTeVZDS2k4NlJ3MFdlV25pa3lBaE51NUFOVE9ZQ3JH?=
 =?utf-8?B?aElHK3kvTnVjRThTc2hwMmFBc0hobjVtaWtMUllLV0JKWnpCNExuMlZJN2g1?=
 =?utf-8?B?T25CcTNCU2RsS1A4RmVseUNUYVhITGtMUTFQTEI3bUU2MkYzSHdmbmJMZUVs?=
 =?utf-8?B?a0xoQ0ZYaGdKQTJ4Ym5iNTl2ckFrVFdlajBLNU1RTnZsaVE4NkIwQnp6ekZ5?=
 =?utf-8?B?THc4ME16dHFNTzl3NlpDZFJmS1pabHRvcVBpVi9oYU54VXh4ODJVZ1hxOGtN?=
 =?utf-8?B?TWRocmFBMmZoSDBZUWtobUl1bHczOVZWZ0NLNVdoc21RcDdYOGYvZE05Y2pY?=
 =?utf-8?B?UWxHWXRTZC9WbUZSQlJRTEcvWm9Ha05HdjVlRHAzNXNlUFcvZnVEdEhBaVNr?=
 =?utf-8?B?NFhJMHFob2tOTHJ1ZG44enZ6VTAxMit6eWlaaTc1MTlnWXBpeFkwY1NuMTN3?=
 =?utf-8?B?YVRudHhLY2l2cUNIVEFFUkVoem9JaGdaMy9pQ2FYNG1USm5ySHN1TGNjRTlo?=
 =?utf-8?B?WjZsdysvTUlHU2p0RHVUY21aeHRTalNoZU5LZFFoeWdJc0Y0SDdQb010MUNr?=
 =?utf-8?B?TlQ5bVovNXZBNncxNTlOM01DNzVrOXBDSXRra3VySXNHTUg3ZndvcVdPWk11?=
 =?utf-8?Q?9Hnil5dTBbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkp4bVNNaWZacFhjeTRGTVZQdis2YUQ5MVh6cGpnZ3BtT3pYcGJLZ0RBS20r?=
 =?utf-8?B?M08vRmZTY0JNNmNtMmN5bHNpQ1RDeGZ0V0N2UWtKWEZRRklZTWtZbVAxV3Js?=
 =?utf-8?B?OXE5NUkvejJFaDVseHM0Q3VZUFd4QU5qTmNEK3pGNXBLSGkrRVU4Mzd3SlFl?=
 =?utf-8?B?SSt3L0V4aWNOb1g1cFM5ZEFmUk1LckJIdkttWTMzZ0xaN0xBZUYwcGpWQXk2?=
 =?utf-8?B?T1ZHYUc1YUhta042VWxKdVY1NzNYUjVrU21obTI5SWxDSkl4c0loVzFlMlFu?=
 =?utf-8?B?ODArSDlzYTlXRXd1aHFiZHJJaUFoQ2RXTVRnMUhDVVNGcXBsYTIzbkFqQnI3?=
 =?utf-8?B?OWthN3pHV2xkU21WaEpCQlhKZmJHenJKcExhRG5KNHVQZzZZVUdHa2JlTGtt?=
 =?utf-8?B?anhHMWJQdTVqOXU0bFpua1JtaXJUUVczNWhycWJEMTIzTDlEWUN0d1hJa2Qr?=
 =?utf-8?B?SjBsWERRT3VZSFZna2ZyR3JGRFdaSlJEVEMrMzdwMURCRzNZZ0pKc2hXb21h?=
 =?utf-8?B?Um4zbXRpaTdScWV4SGlnV1AyQ2lJQ3NMRmY0Q1U0V2RnM2ROaDc0QmhyZHJZ?=
 =?utf-8?B?cDFyRkd2MjY3Rys1UVg0UHlvcE5qN1ZPTlVqaytGZzdoWEtmTUlQcEN4RjVN?=
 =?utf-8?B?UUliUEFjOEJrUE1QNDMxblA2WVAzNzVhbnl6MzgrZ1pnMzZhUTl1alJLMW80?=
 =?utf-8?B?QVdzdU9obUZhaEZoa2Z0WFVrS2l2VXp5ZUp4QW9ZZkVpV1duMUJpZFJiSzlL?=
 =?utf-8?B?bDJ1OERMNmNFSE12cXlYbzlOdnErOEppakxmRkovdkJpMERqYUV4Y3RUVllq?=
 =?utf-8?B?ejFST2grMDdoOE54aW1SOWJWVGhuNmJKRk1rQ1ZLcEJUZFdSY1VCMjlWWWdO?=
 =?utf-8?B?QkRVTWZVZEEva0xJb0hrUXR5Z24zUlYzUDkyanBSZzNPeFFMbWZIZ3NiQTh2?=
 =?utf-8?B?NW1paVpGQjZ5UnFxMk9BaUtCa00vbUZ4OHBpQWQza29qUEJqV3VqZU9rQWth?=
 =?utf-8?B?SFNzZ3RKU1U4Yk5JOUl2NzNMcWkzdC9LclRBeENYQVZxWUQrbTk5YUJVNlFH?=
 =?utf-8?B?WG5IajlZVVA2Q0tGeVY0eWJLSzRKeDdPQ3RUbGt0eFdiNThseDdiMEt3QXFx?=
 =?utf-8?B?dzU4cTRQbllyMUxOMSs4akFIMzlZMHZmY0psTmE4Z2xIZTBMckEzS0ZqK2ZQ?=
 =?utf-8?B?em1waEJmcHlQL21aMjNuSlpjMVNSV2ZmbTFRQzdhSU5abDlMb21QRG9wbVVJ?=
 =?utf-8?B?WmVYZEhoTFdrWEMzdTlRK0phQU9YQ0Y5ZmFGUndiMTNlbnVVT0MreWN4TnVz?=
 =?utf-8?B?SnBvNmhTQmFWTWZtOE8wTWtKMWYxblBlUmFoTXNLTWsycXhLWXRCTCtUR01u?=
 =?utf-8?B?YktRUCtnS2VzM0kwZEdKeXJLQzM0N3RNT2phTWoyYXlLZk5tY2dPNVVTMnhI?=
 =?utf-8?B?TGdXRDllOWVlSk5Eb3ZlNWM1dmVXVVNyVkhTVXpNaVpkOFU1VCtBUHpMMmkv?=
 =?utf-8?B?NzBEREtHNkgwY3hYVDBhNFBQSXhUeThZRU12TzZUV0pKTmsrbWNqRHN2ZEoz?=
 =?utf-8?B?ZTN1TVFEejY3ekNsU0NRNUo1TVRUNGRrMmpDNVJVLzA0N2VsVzYxRjRFZnBL?=
 =?utf-8?B?N01QeEJKNk5PK1lNNFEvR0lPK3ArMWFRYXVZdmhIb1FHL0hMdG5SNjc4amNj?=
 =?utf-8?B?ckNSekg4aDE0Z2VqdVZrQ1RjdnhYbk43OXBMUnJzV1RlSnc2NXhwbEZUVFp4?=
 =?utf-8?B?YnZyelBHRThCWkxGWG5nUXlJNGQzejVHUUFVd2ZUeVU0L1pZTDR3WU9PQUpm?=
 =?utf-8?B?SC9DM2g5VGwxSjFKU1FCZXh3UUdCTHEzazJOaGh4STg2RnJvdkVRcGhnSGZy?=
 =?utf-8?B?bVhzWlN1RThybWtGbmZoODRQc2lMNWRxQkdZRnVRSTViNFg4bmRCVXY1ejhk?=
 =?utf-8?B?anVGYzF1Ulp3b0N2N3YySlc5MmNyeDNleHhoVE1uSmwrek9RbnZ5bW5mZjBU?=
 =?utf-8?B?a0ozNTdkcFVTbWttWUFyc0lVbUtFeU9VZjZhTWZCR2FycDNlWE5ldHdnV2kz?=
 =?utf-8?B?eURialVvY2F5Y1RveEl4elhpV3dab1poc2RXQktVMEtPdzZwbU5ZbEtwUlYr?=
 =?utf-8?B?a2MwSHNGYXEzb3JNVHNPTElCckliWFh3NDg4NjJpa3JrSjRFVG8vQnZJbk5P?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZuJnq2ADt2fYtfn6N/+pKmed4KyI15cLHZ0AP7Ei9+tAwJxtuOUcIc8zK0Fyb3aGVQ70CfCLNymnAAX1fsbJPoN2IYbPE48QKwOGVn4zplK/lR5MdPpWOqJIC3iX5BD+FpeYlWE1mdEJ1yvWsQOwNILXXdwxV1udBzCFt+l+ygUZxc1aEIO0B40ea69LKd3qLgeA/JWeFv4weXKtsf0yKX6HClrBVeH5+LfM+NPELIrCEkKGmx3Ni9yHiptfHS5VSB5uf1ERHn3F6no8Sn1daLTBDFP0FB/kWSZ1F35biLOWtKFX5zx28qxdlW19n7WVzS5S1EW1UhOrWkVzhEVMCuH/602apnwMkF+RMnzNULMesdRttjSYUlxKhSQuJcuGUi0E6JhCC7X+TcFqkABF3y/AHU7JYgeg9xlnmMrMY1U/2BFamXQCOqdXfD6JBgC4/kQFC68ntc2cKZ72GWxhcubH/GeuD8ejAXc820LN/caOmyDmF7ll5wb0jcK8fRM2NL6UIcKfFtGFye9MMxmd0C+VtMebUM19XOEaM+jTIQ+FJ+RKisglDCDgiTB8sLNODWJ+tfRQ62Ituhi/pYidTaioGVIe4gihOBLbHjk8FoM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1028c64-402c-4cda-6883-08ddd38907b1
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 18:59:25.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chVbRIdLrHN10/ciii7ZZju1c5I+P17eOeelj8BFj6dSqgJ836NyaPsTZ+JhkUc6G9LWih1AQ6ApKPaIohxgBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508040110
X-Proofpoint-ORIG-GUID: hV1T0BgQBavBC16BY_HijtdC_OuAcLNB
X-Authority-Analysis: v=2.4 cv=HY4UTjE8 c=1 sm=1 tr=0 ts=68910310 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=ubkYJH_4XtJ4jHJWQeQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDExMCBTYWx0ZWRfX5VyDvmcivxlF
 gBN+nQNI8nWlMiY1aHiiqinw6imnTrVKHGIpu9fBH3CmP3mE0CsyQJiGvb+lPJBEYi/mJ2GHmpP
 2GKF8ceBp5WwSWVfJ01yvou0DIY2H/lWjIZwCryCLOPe9eZgqvAQsW3jSBx5tcc6mRa21FDu+Ml
 SyaDUYq12fCGEFXH0fsGhZznL4MdQCaFcVt3ysUOiie0qlc4Rb0UQsusVvHoBXrsz5VPmmctcqV
 yb/q1x11XyVhQ5uZcv8z/p6aie024Y9S2472t1Swc+puxpELmoRsWB1qZpxGs0XotIm1fT2Mwxt
 WyBeSolQkWqE5TOmyp/3OKrQVrZ1z99nCorbyhnLjpMIZCC/cfjjXJw04vGI+p6BUwzw10RNcPv
 GkRlXv2n+l42CS8MZgCWdpJawT5QrIKl4B9VTSBIyGDhMuJYIor2qfZdxEWqowrp3pKLgigi
X-Proofpoint-GUID: hV1T0BgQBavBC16BY_HijtdC_OuAcLNB

Hi David -

I noticed recently that this notice appears when tlshd starts up:

       add_key: Package not installed

As it turns out, this is tlshd_keyring_create_cert() failing to insert
the client's certificate in tlshd's KEY_SPEC_USER_KEYRING after a
successful handshake.

That means NFSD sees the session is protected, but since tlshd
returns "NO_PEERID" for the client's certificate, NFSD believes
this session is not authenticated.

I can't find what is generating ENOPKG. This error code is not listed
in my copy of add_key(2).


-- 
Chuck Lever

