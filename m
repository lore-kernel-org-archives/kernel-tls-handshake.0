Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02F27585E
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  1 Jul 2025 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376248; cv=fail; b=ey1c/fnkVCavdY9zO8zlPCebzDj6LUnRF4mgQtZJldbKCOC1GVaoXZYFChwo0ESm9XXteJOfU9Cfpzo7eA3+NTyVzCITs0+wkdIdQk3IdvgUjQKdgXbt85aFVMhTel+8t5LmXR2Q+mhuLWnvXTWXjI2ax2zEV7un4slKSgJWqCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376248; c=relaxed/simple;
	bh=6QBlfXD1NzLH6iuxgM4BWWzSOOUBgXSV4nwMyKrpX7A=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L52gKninNsXa+Tn5k/Keyruc+k1Jt7XzrCVMdu3PocWUIjSGxkk7ZzpswdKiR7EK72CLoKi1x4oCic1d+cc4W0GkjTBY5BNQH71HiQyxXt6QUbB1fQbbTlW2Navt0rGFmvWxrq2lFdV2BF1VZnZP+Vj1NRVHAhc04LvrXWpefbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rfA4v8Y9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QHU+fFju; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rfA4v8Y9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QHU+fFju"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9CTf019346;
	Tue, 1 Jul 2025 13:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GB3H1Cm8NHyRaNKsAAZpjmKRlk2AmTJtSYPTb41vKjY=; b=
	rfA4v8Y9VvNDzhqDTRfvtPdGYmSH3T41ljN2PKA3DCZ5+XzMrwZeQGr+Gn4stDW4
	WfF0fGM2vheIQpr+HJRInzalUU8bArJFnE6K4SEuQdpizvEczxXtqicsSkr5Xs7Z
	N1km37d34L9cMy8xl7bDMV/5f97cgBcCub6B1R2yd5CKLsfFg8mbpoK3rRE58z7s
	vCoVn9zVfCsjZ5vOTSUZ6dF7SYqZjBP2lp96HQruLiAchHuoEkbKJ+A+Y3X951yM
	dLCqeLIdiv2R5fF6IrStgUgm9RHnbHgoPHg7e+vo2SRYKfbN6Dced/F1IrF63lzD
	pTRwXE9axMVgxeCuYXpxlQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef4s2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:24:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561CoZBr005782;
	Tue, 1 Jul 2025 13:24:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uh0s8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7IwHdNQwPRv0xmxZmmQyI3g73tsRvMwLSey506WOJgVFKUcoqNai103kwPQs1fhLoc7bnd5Q1stbdPiYywE6TtfON2kpDZeE20bHpoukkUwe80YqeAfQ2FubRpuIQ4TpleZyNwW86SUzOoaF0wZ2Gc0vNB9cy6nfHo3JNc6cci5E9sMUlEZVsiRxZKq39sHM289AP32xSvJP3mTi3Rp95wjxZ+6Ac4umqPYIgs2dqmy3/Slav5LKQ1PXlRSDtEQ3Wp/0CnwTV5t4d/CUUP7AIRT4noUZNvFQlLeTgcwWFWsuSU3OvlILgHoh6fNIYXvdOo4BnOBlyzq9mQiRGAwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB3H1Cm8NHyRaNKsAAZpjmKRlk2AmTJtSYPTb41vKjY=;
 b=WHinx6zBLFkXJrY3WkhBApee9yRhS9otD6ILjHueh0PpRXSE3h3W+BpLuQhEH8rnMvVwyeNVSoIi35FMFmFUS/oUoXLK0vDSHH/jETbeprctE/1J8tg7zuUnlV2a4hzG1AqTK2ImckS8FspHrQILhiOyXd2+cuNdFQTkNS65YlkFFBp9jwnnpRnBu0ovwOVyvYkaaejkXTtgHyOyS2CMlB3lqe/GN1Vsn+8aX16osq8MKeEmPj4GQZP1uGmGf5imMk+y8YFapxExKKU54hggStBxo9iS3s8aZrdH0JHl5EOBaf47pn0WfubJhTXiNScnLFaiLdjEyfNCQkIhJOvYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB3H1Cm8NHyRaNKsAAZpjmKRlk2AmTJtSYPTb41vKjY=;
 b=QHU+fFjuudog4xjo1bTZGK8aigvKmH1nPlaNdQxzsgfQYa2Gk8HtuawonJNFiqLwnyB//5DJ7f6MbQ+VboXUNyYuJ+QbBQ4JJraZZaYgnftr1nj4ckmwPzBn1yYaUT9LIv3GZW0iHI8xZxhvdejEUNYyuhhvSTN37cSCc+pR/3A=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 13:23:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 13:23:55 +0000
Message-ID: <6e2d924d-fd3d-4bf7-a3c4-4899fafd666c@oracle.com>
Date: Tue, 1 Jul 2025 09:23:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/handshake: Add new parameter
 'HANDSHAKE_A_ACCEPT_KEYRING'
From: Chuck Lever <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, Hannes Reinecke <hare@suse.de>
References: <20250701063320.67849-1-hare@kernel.org>
 <dd0a85fb-e7de-4007-b9ab-b11b73a31f58@oracle.com>
Content-Language: en-US
In-Reply-To: <dd0a85fb-e7de-4007-b9ab-b11b73a31f58@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:610:e5::16) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH0PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a429835-0b45-420b-9f9c-08ddb8a2874a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG4ySDROajNTb1QyQkFoQk43ZjVSdkhHTmxnbkYrMGpkbXJPWm9oUUs2ano3?=
 =?utf-8?B?UmphZ3Z2QW9vYUZQdE4yMllhZ0JxZ2FlaW1iV3FQVFVCTU9GdU9rYXgxQklE?=
 =?utf-8?B?OXdFWU9Tc2RweHhva0VSNUxhdjlMeU95TlBkS0NEV0VkRytJb2loUzdOV2Zp?=
 =?utf-8?B?Qkx1T0lPTjlwRWF5RUtUS001cWZXbjIwTzE5QktOaE1BclNGMGhTZFFZOUdK?=
 =?utf-8?B?QllxSHkxVjFOZmd5dDllcHlTblNUREluS05uN2kxYk5GWDUzY2RKcHkzZzU4?=
 =?utf-8?B?aVQ1RXNWR0ZyeDcyb1VLTWdXZ3lDMklrL1dmL0lHWVJnWURZQkM2bjc1Zy9h?=
 =?utf-8?B?UTZQVFV6UGlua2gvbTI0MmwrOVpOZFlXaTl1cGlnRjBrNVdsMFlYc2ZldDRj?=
 =?utf-8?B?ak95bk5KTFpiVytNQXBIOU5TU2xrNWYxZXZBQlcvUkYyRGkrbzI3V1hwMjhQ?=
 =?utf-8?B?R3FkdG95czd2ZDJkRzk4WkFhVG9aVFlneGpIZEpjOWxsd1F1VGs1NXMrb3Nj?=
 =?utf-8?B?VnlFaHBNdXlZOFl1eEN1L05Sd0F3WHZOaUdLMFZjOWJBbFV4SXRsd1d4ZmRY?=
 =?utf-8?B?WE5XeU92b096bFpLSWFpQVF6eTdMT1R0OWh3cVYyZWRzRnNwV2RIMDZlUzhY?=
 =?utf-8?B?S0pUVVFmanVNYm44WDdCc3VCS0paenl5b2RXWnd1MnpQeTF0U00vRlFiS2Z5?=
 =?utf-8?B?M2piWGdmMmdOZ3BEZGVJQkk5K0d2dHZxWTg2aEtUZjlBd00rVndZNitVcFhi?=
 =?utf-8?B?QkozdjZvUG5rWitRanVYSVhhTTlqZmcxTTRXa1MwZWRJcXVMZlpobTh5bTdM?=
 =?utf-8?B?NU1uMWtTenFhSUVCNTlkMWZGYTFnb01qWmhnMExtV1Bnb3dzTW1TbE1sK1lN?=
 =?utf-8?B?Y3dxK1h6ZHV5bkxJQ0RyVkx3RlN6MVlTTy96RlhjNEoybnk5eGlVMDRyeGV4?=
 =?utf-8?B?RFJsRlIrT1R4S3VuVStHS2x6NFAvb0tyeU53aWlXVWRacjNyRUY1Y2Roc2ZY?=
 =?utf-8?B?RitwNjNHeFNwbzhveWdvM0ZzOXJVQWN0S2ROQ1dCYmJzRFQwdkQvcURVSlV2?=
 =?utf-8?B?T25WV2lqRUpCOFU0ZGxLU01sZ3ZXK1kvQWRxRVBraUluQmMzdzBjZDVtWmpW?=
 =?utf-8?B?RmpZYVZQeW10ODVUTkFJcCt1TEZsOTFJd0g1UDNjRGRZOXpJeEkvZTdNMk1M?=
 =?utf-8?B?Tk1yakJsTTJVUTlScWttbmMwbnFxaHFTYmZCbXFmNTc5a2s0ekRFNjdBYlh3?=
 =?utf-8?B?VWk5NmE3U3kvTjFJS1dkZUp2YkVpWGNCenMzMkh2SC9YaHByZDQ1WUthU0NV?=
 =?utf-8?B?M21LUVhxMnNZWXdWSzBxY2wzSWZZcXovRFRvTUJZRHBHdjM5TzFmTjBMTmpy?=
 =?utf-8?B?VExVVlk1aUVrVlNWaGVJai9DdlFDbFg5QTA4dlg1QUVXQXpTMnp4a3luenR1?=
 =?utf-8?B?emhiY28xRkM2dzFMeVdScWR6cFNGeW4yc0VLQjZhNU1BTGJGamlralY0U1NP?=
 =?utf-8?B?UkphakZJdWxXZm1DcTh2Q3dRSE45N1llR1J4bkdnaEs1OUl1UG9XdTFnbTlx?=
 =?utf-8?B?UEJLdGNQcnNIVkpBNWRhZUJYRzBMVU1ISEk5QTE5YkI2bWJNaU1uRzlKRENi?=
 =?utf-8?B?eTNaVlJ5RTBONVI2S25jazNDcThjbjRkbTZrTWQ3NXVlWGs1Y24vazhnRXJ1?=
 =?utf-8?B?UFZFc0NxWEYrb3IvQ1dqbEZPeElXYXF6WFRqTGRWUmFzblBqWjBVQTloZHNx?=
 =?utf-8?B?akw1aGtyd3RmblZ3YUVVNURvUlNlTVBnK0o2QzVLQnJ2Rk9HeVpnbHlKZ0Qy?=
 =?utf-8?B?Y3REanNOajRZVTcvMVhaOGV2bjNVemdoTitvTEQyUXNOZmV4Z1N4aHNiRjA3?=
 =?utf-8?B?a1BuZTEzZzViYkhWRDhycHpEN2JWV0VvaTNLb0xEUm0rcEluRjVDZ2I1VmlS?=
 =?utf-8?Q?lNw5y7J6aCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtCYkdXckduQzZEN0ZVVXhYREpaRFB3d1NFSklxR3plN25JNlNDR3lVc1Bu?=
 =?utf-8?B?OTY2R3FvdzFBZktJaUdVYjF4d2g1MmsvK0tOa0tWSFBiRDExeVk5WEE0THlm?=
 =?utf-8?B?UGdySlB3c1oremkyK0NSV1pzWFFnZnh0ekIrZHo0Slg5ZVduWWx0dFFhZ3FT?=
 =?utf-8?B?WnhadFVWQjZmb2ovRTNueHAzWHQ1a0F3eEtRY09yRklCa2Eyd0VtdW9LbWNJ?=
 =?utf-8?B?SnovUjVzcituU24xOTZnTDRaUHV4YmhzbnEzeEQ2amdvZ0dNY1ZzYUdoNnc3?=
 =?utf-8?B?YW1SSVRjYVh5a2d1Y0pDN0NFOTlDMG9sWkJiOFFtZERQTjdEWExXbTFoWUk0?=
 =?utf-8?B?d1llLzM0dkJrRkVvTHlyL043UTIxUWFSWVhnOHpaWGR2MmhrUGl5T2VNaG1i?=
 =?utf-8?B?YzhJdWszUW9RdEJMaW1sWmU2LzdxZVZYVzVLUDFqNFAvdThtQ0sxWHdhZUgr?=
 =?utf-8?B?NWNRNUxITWNwdHl6WmdwWkd0OCtkZXBreURVY3JSSWJpKzhhNUVaa1ZodWox?=
 =?utf-8?B?Uy9vUUJuSG52TzVOWGpmTTJ6cGdkd2lRM2VQdmNKdS9ZV1duTzVqQVNWQUtr?=
 =?utf-8?B?MCs4aDg0SnRLQVRNazk3aXAzMjI5cmk1MVV1YmlIeGhwSnMvSjdPTWcwSHhJ?=
 =?utf-8?B?Um9vQjZENDlmblE0aUpsbWJEZEZkVU5sWmpPZGN1NldtY0xOYld6SllwaWN5?=
 =?utf-8?B?eHFRQ2RqVEFtTC9yMHNZR21NVE1xSTNDZFMra2o2bmtZRGlTVldqNDJHWlph?=
 =?utf-8?B?MnlxcGIzL2lmd29FOFQ5eTZKK2M0SmI5aEc5L1RDd2Y1L1AzYzU4STN6VVZE?=
 =?utf-8?B?UXJNMkxYYjNWNGsxZGQ4VXF0VC9DdE9zS3dBSzdGY1ROWXVkMDBsRmNZaDBq?=
 =?utf-8?B?S2dTUEJBeUZNMDZjamdYcWIvd2NhbFd4RUFZL3NsZWZGYit0dS9DdU9sVTFP?=
 =?utf-8?B?bU9SdytXZ1RSUDhRV0dpZW14REpTN092MVdvU2JoMWJ2anF6OEZ1K1IycWMz?=
 =?utf-8?B?T3RIWDM3RWVLSDExZFV1NGR2bHI3Q3hGbEs5L3c2WnViMTJ6WHdrUzJzL05J?=
 =?utf-8?B?TW5DQ2F1NS9xT3dUZloxOEtVTlM1NENBRVZ3L2o3VkRPZTZhN0pIak5DRGJD?=
 =?utf-8?B?UzlzeitBb0hnQkFMMW1WbjY1cUpadnBrc2lzU2RzOVZOc0cxNTZaME1aM2li?=
 =?utf-8?B?c1M0K09aT3FSb0RhOEJzRzRuMHVZSDdyV2dKYnRNKzZtdjZTVzdaUUV3SHd0?=
 =?utf-8?B?UzBCRjEvalFVd052TWRaUzZZRktoTmMwenV3SC9PVlF5MEJkZ0VJQmhrQ3ha?=
 =?utf-8?B?M1VjQ3ZBQlZpZHI4UTNlYk1WWUExVEhDdjNETmEwMVVIYUhHRVVjdEFKWito?=
 =?utf-8?B?SDc5MEFBRUFBOThhclR5TkxESkxDeEdPTHVxWiszRHBXNXVkcFpwRys4eHdj?=
 =?utf-8?B?OHNuYzEyTEFoQ1k5TldTMXZ4a25oSHcrSjJrbnViQ3dsL0dMOVczaXYrcStv?=
 =?utf-8?B?R0s3NFNHT3QvWlMvUDgyUDF4Qm9EWjRDeEpJbW1SK1BXbXpoOWtKVlBsSE03?=
 =?utf-8?B?ZTdQTVJiOC9XZWVKa1VyRGo3M2FpRHhtb1owKzQ1WnR3K1JnRkt4V3lVN2Nx?=
 =?utf-8?B?dTk3R3o2a2d2UFhndi9UVU9aRXM0eFM5eUJvUDdsK1Z4KzluZFZlaFpyWHMz?=
 =?utf-8?B?bkxrdFZuNWdqNkVhSkNhUWJPdVQ5U0tmbXVqbEFtWUp4M3V6QVVVNkM1MFVl?=
 =?utf-8?B?d01Wa0ZJV2o3aUZxdU53eE5uTkxpOW9hejNOMWtFYk0zNStIYS9kSFp3NU16?=
 =?utf-8?B?NkcrbE8xTkp6cVBYaksyUlBSTkVhN2J1VFc2WHBCWVBqdHp5NTZ3aWI3RDNz?=
 =?utf-8?B?K3AydStJeDFQWW54ZlVsZDMvRHpRMnc0LzNtS0ljL2pVc2cvS0xYYWd0em5k?=
 =?utf-8?B?UTIvT1RkTVEySHgzV0QxejJnMlA1VitVbVpFR1JTZG1CSGNsa3ZaZWxPaVNr?=
 =?utf-8?B?OUxmY3grZnFYSi92N08yM29FOUdQeW9ubVNCeTlibUNDbENrZUVVd1d5Wkwz?=
 =?utf-8?B?MEJjcVdQUURKdzRYczkvbjc5cWxLSnc2VU5ta3VDdjhiV25icnRpMlJoQ0tV?=
 =?utf-8?Q?A5CzesldYzkoGiTdTjK2h/47H?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jcmFXxxs27f+Yar3rOwPfUSryK6d3WLrrUZceL1DyADx4BMYAh+TlkvYijOWPe8ROld6XcUcQ/6JdmTj4QGVSRS2kGp1EdwF9gqKY0RheGcUwsOsyvBfMR0reiRMHfcbG8sjqwIDPrw+YexCFtcjmeMqte0RoqbgHqwStXXXt0KJF2FqQXvLxiMy8J4Oq9IXcJmFTiZYjNu3Uu2rJG0mhR8FzmdijAaRRE2L2u8rkDoE8Z6rBNSZJDPx2g/5aqew+TgL8lHRDxIvS7RQFW2+gAEuzm5GWuYv7z1rP0RRfpKGjCM0u32Qelo0H13T7ez8n7XEhvltjQtSezexzbGi1ETdw+pkTJjkn0jqUHQ935qtq0DQi+GfZ43KXHKMTOSrd0Lii1t5Jy6SuznjVwcFPxjJiuj4vKO/THR42h3gHsiI/TM2GzMx4GkaTW5yGMpFaZRMT2avk6QJ9Ob5ZsxyvT5g0ucHkT7QC9NDSaN38pFeovKVcnL3p4O4OCmQZisxfaQkNjNwZeYSIw5iCUsjNzuord8RqpnkgYuFhqRmK/KA4PmUm2pNMn/OwiqNhI15fptwRksAkadkMn7BYcula18lljmblZqVB7brwxXKB3o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a429835-0b45-420b-9f9c-08ddb8a2874a
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:23:55.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCdJvWAU89YHhhbW+pLHZFw3GgVaxeJBkIB2/jIHNx0z1f1TwtRKpZ6uabSVggWQJQ14t+B19G/dMiCNgD3prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010086
X-Proofpoint-GUID: no9h0_Wut8gJ3b5nCU5NpIKMrjZYsBGr
X-Proofpoint-ORIG-GUID: no9h0_Wut8gJ3b5nCU5NpIKMrjZYsBGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NiBTYWx0ZWRfXwFTuxmhNPLaL h8f5Oe3RY2N0Yw6oFX4CIQAXfty74ehlGYUSY5kAuoP2RRHmgeZrOOTIiuf2IiziMCyb9W2Qccq 8hmUGN7MQCfRE8HhVZRdwvWYb6U/6OYCVL0hgESlEhjg3gWJqkeREs56dYvASjWJbIcEOBJ9ZyF
 KXdPyZktiWjG5ZE9CvjM2JpggZ9Ff1Sk+30uB61RKP7GxeVeRdBWr0eyyobVZ/wZ1WUKlTTXzyl sXigxR6kHpho5KB1b21FK4cSns75qAGcVqwUbn151ZNrSEHX/Is98yxbmUOsHPyXxsiM0xvvbjl Nich5U342c/yZSpPkgVHTcN04qkZt+PCZFYqRYo1bpPWDNbHhTH9NZJZxzWglRnnA1i7Eoura+z
 rLH6LpsylJRV6O73V0sE+YpzgemrxDELUqM3j9XsxAg/UD5hjlfR3IsU1V7MFOpKesCTAKG3
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=6863e172 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=CHA0idT5e5X5ClAx_hAA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13215

On 7/1/25 9:20 AM, Chuck Lever wrote:
> On 7/1/25 2:33 AM, Hannes Reinecke wrote:
>> From: Hannes Reinecke <hare@suse.de>
>>
>> Add a new netlink parameter 'HANDSHAKE_A_ACCEPT_KEYRING' to provide
>> the serial number of the keyring to use.
>>
>> Signed-off-by: Hannes Reinecke <hare@kernel.org>
>> ---
>>  include/uapi/linux/handshake.h | 1 +
>>  net/handshake/tlshd.c          | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
>> index 3d7ea58778c9..662e7de46c54 100644
>> --- a/include/uapi/linux/handshake.h
>> +++ b/include/uapi/linux/handshake.h
>> @@ -45,6 +45,7 @@ enum {
>>  	HANDSHAKE_A_ACCEPT_PEER_IDENTITY,
>>  	HANDSHAKE_A_ACCEPT_CERTIFICATE,
>>  	HANDSHAKE_A_ACCEPT_PEERNAME,
>> +	HANDSHAKE_A_ACCEPT_KEYRING,
>>  
>>  	__HANDSHAKE_A_ACCEPT_MAX,
>>  	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
>> diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
>> index d6f52839827e..081093dfd553 100644
>> --- a/net/handshake/tlshd.c
>> +++ b/net/handshake/tlshd.c
>> @@ -230,6 +230,12 @@ static int tls_handshake_accept(struct handshake_req *req,
>>  		if (ret < 0)
>>  			goto out_cancel;
>>  	}
>> +	if (treq->th_keyring) {
>> +		ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEYRING,
>> +				  treq->th_keyring);
>> +		if (ret < 0)
>> +			goto out_cancel;
>> +	}
>>  
>>  	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_AUTH_MODE,
>>  			  treq->th_auth_mode);
> 
> Reviewed-by: Chuck Lever <chuck.lever@oracle.com>
> 
> Do you want to post this patch on netdev@, or should I handle that?
> 
> 

Whoops, you need to update Documentation/netlink/specs/handshake.yaml
as well.


-- 
Chuck Lever
