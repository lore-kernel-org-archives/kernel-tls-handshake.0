Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB913B58A
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754502684; cv=fail; b=KcXZBd0hdGwKaXe+gJaRsUItgelLcD24KLN1uCo7qVJe1eMbyFkKUqT5uWpF3y0H8+YnNPP7mTP5Gj4iDmp9SFUaKwUH/nptP5rEs2IDxX2gKm6YRQvR9KeZlEAsY8i8huZgsvJQiCI7lU2vTEGq/yIGsmVEvPfYpfQXZcQhZUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754502684; c=relaxed/simple;
	bh=x1WaLfs1YjZSth0MIEOksqfczKQzEF+913n1hm2iKlA=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=oMhASyRWLS2Ix0g4x+XD/eaB7vTJ+ZytdT/iYGASBzUYP1O4pzKhL0831v7tz2PGe3Zppfm6aq3YULu/aWjS8I6jQshDvmMQER3YwyLCUC/pZsIMEccPSb8p80jyqAqxOaXU6z0/pweujDd0BkX36vHIvOXFM9QVh8g98kVR8bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BENU16pH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sfQimv5R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BENU16pH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sfQimv5R"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GS4nK020939
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 6 Aug 2025 17:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ghCFc+Mj+sooWdxi
	tR0U0FGssBap/gRAe4GXFgsq5oY=; b=BENU16pHQCz3fA3zZASuYxgw2Lw3d0wj
	66QLT4qS4OibtzJ0D48zbbkamZpH7u36+qJpD/ZsCV0ZVdMLnarpZpix7N/JmLYr
	n71aFMlmCDUDw7nHOUEWGFcSzjRv501D3OJgKMaByNEGzeBGRas5iU+FH/8w0+5V
	qZuAsmFj2166YukFQdLgrRsEoc9/xK994Rtf5CgKEimtiTqa6JWmVFonU5qVn56J
	oh8jV3La5LWIjsF1nWlQTrRytesoSNVBsvsI3GfI7f3pjtMe1xo1ieRSHOALdRPI
	VUeqTqBycAdPKHF22y3KCd+6UjyCBnV56+a1x9Us2LVKcLK+rF50dA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf29k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 06 Aug 2025 17:51:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576Gbt9T027097
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 6 Aug 2025 17:51:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwnb7t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 06 Aug 2025 17:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV0A/xh3xwYzLj3C8E0FZsRWzcmBupw+awZej+cJLfjpspcx8KGtlsV7hrr7KCmiLQC3TClW+GMUam7sMCWTBrZ2eie71/gT89TOHz0EiAsvA/I4RHf7XP8fxgJFwcHG01HDwd94YKUZDgl6M8VVLoxRjHVMDuG/ACGJ/V/LuauGrwIYyaQkEoaQXKO5otlyazfozkhiwAibR/+C98iD1IHAXSV25kLGjhtyG/ol77t7otK/FPDvKmZykl8m8zBNh+EThK9tnLSC0SeoILELKwCrMoNh1RKcAi9QVGQYSu4+tEAnhRbrQVWllji35VB8L5xs403odIxDIEGITfhwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghCFc+Mj+sooWdxitR0U0FGssBap/gRAe4GXFgsq5oY=;
 b=quBdgBHRI3v07L5BJXJJxesBxeG56lRkJOsu+1JMO3wuo9RG93bgjjorneKQeUF4O7PtYUmvRXboaS9oRDmHIXdu8c+0gTYjCYBXr640IAWlFIHRXDTRjLpXTiKYk54IW+Ipbl+4bWwgpqU33LgWBUK/bhg0hvY3OPMYzHpXs95XIwOyoH95IsAIxvCjD/MbaCwpg/7eJiKIJMprZN7elJiEr4MeSLhdpkIDgwF6V65WW3/GZL9yR888uOHP6lbEgql6PoDM/FqcWeYu0OZvRXvW4lKInYkSDEMgOVd1Lo+xGcSTIZiiOegNrOXTUiEYu2x4X69rg3nQewPl6Y0m6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghCFc+Mj+sooWdxitR0U0FGssBap/gRAe4GXFgsq5oY=;
 b=sfQimv5ROkhxRFxXZDSz2RG1ti4GLGETZkJyyFrC50EevitEjXcJHQaI3B/YbUPhBJsS1g6f4RiHcayXtsKD79K9ZtJCXcHXvw/vkdlqkwYEDMhNZfRHfEfU36uJk7vGmyzJgeT+7ixuzaYPa8MavkXvg34ifqqF9NtAlkntLYc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN7PR10MB6362.namprd10.prod.outlook.com (2603:10b6:806:26e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 17:51:17 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8989.017; Wed, 6 Aug 2025
 17:51:17 +0000
Message-ID: <6c65b9cb-82cc-466e-ac48-3efea7258fe9@oracle.com>
Date: Wed, 6 Aug 2025 13:51:15 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: TLS session tags support for tlshd (rough draft)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH3P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::8) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SN7PR10MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa40aaa-be7e-48f4-4ba1-08ddd511d806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmZra1hoSXk2YkNOSjhLbEtTV3l2cllyLzN3eUhGVC9MMkNWVHFCR0Z6akVt?=
 =?utf-8?B?akZMdUM3OE5MZkNkYnJlQ2VKVmtraXRaNFgyL3VNVHVlVnlTNW5qTy9kdzhH?=
 =?utf-8?B?VlNVZmkxUnFDbmR0Q245RHplYWZ4dDlHbGJVekFLczlxYTdzbEpESnU1eTd4?=
 =?utf-8?B?YnpZOUpMQnRjczAyUjQ1dkFUZmc5b3hrblRIeTdMNFMzM3JKdVhEdEFMZDc5?=
 =?utf-8?B?K2s1cndMRW8yeGRnWUM1dTFwK1F0cTZBNlV1bXROV1c1RUlQYnovWW5jOS9Z?=
 =?utf-8?B?QXoydU4wdEFqd1ZiT2p1blRxaGt5OWJ6cjVZMW1iakJzY2NRdXJlWG5YeXo5?=
 =?utf-8?B?NjRHNCsva3FsZ1VrTFdhR1JXbi9Zb2l1UXRoeENSZTR3SEtsUGcydFdRcXU1?=
 =?utf-8?B?VVQzUWhoTE15WWVYRVVDYWd3aEpuYkVURTZHWCtBM0xMbmlmZ1RiSFE1eUZt?=
 =?utf-8?B?ZzNnZm8rOWVhNEZGNElWKzNnMlhUMnhxQ0QxR3ZwR0VPeXI3cjRqYlJVT1Na?=
 =?utf-8?B?U2NOVEhHN1ExSkNSQXpGVmlJOUYxT2UzRmI4djNqeUE0Uk5ObVZ2UWVwVHpi?=
 =?utf-8?B?bG9IYXJnbVZINmtOdzdkK0VBV0lWVXlENE9hN20xRDhwcUNTek9PdCtKQXhB?=
 =?utf-8?B?allZMWVCQnR0aHVHTTBib2kxN3Z6YWFRMzdITzRkaldLQWs2VmozQWtMZWVD?=
 =?utf-8?B?OHMzK3JHWHVhUVRndUMxT3ljek90Z09LaWJOSW5qU3BVYmQ0YWNoaERTdVZD?=
 =?utf-8?B?UjFhT1ZpWko3NzNXVGRmYTBsRS8rYnVhaDk3QXp0WjE0ZWs0N3RzbSs4dTdI?=
 =?utf-8?B?Tk15M3lmNlZLS3NObTRGZG5uQTIrWTJTUVRseVM4eGY5aTk0dUtKS0U2eGVl?=
 =?utf-8?B?eXhaeTAwRnlwQ3JmcEw5MkJQMjJpRlNBb25sSnpZYXZ2K0EwZ2tobVpKOHYx?=
 =?utf-8?B?TnJLdFd5b3V3R0lCcVlTWEsyYkx3SzA0OUNpYmdwSkptMVM3eTFPYjlDVW50?=
 =?utf-8?B?ZVdrWU9QVkc2ZUN4RmxtaGNsaUFmSFBwRDhIdW9EbWZsZzl1UUVqVUk5Y3Ju?=
 =?utf-8?B?OHFMTTlnOWxOdHdndFdzNHFhWCtndFVsNU1XWGx4RXVBSzhxV0FGWC9mSWVE?=
 =?utf-8?B?MHo0Yk9OQ2dCS1FSbzVTRHJwSEtKQm5NcG1GUU5LKy9vZExzTldqRnBOVjBp?=
 =?utf-8?B?YzVacE1hUjczemFwTkNFTmtEV1JjVkUxNWxXUW0xK1FDbWdOck16L2NDeURa?=
 =?utf-8?B?THk0MmFmNFloR3M2VUJ1cVVGS0dRek1Wdy9jZ2JZaG5iZTZ0QlV3cEhTZEpn?=
 =?utf-8?B?NUpLSmJRSDZuU3g0SHR2QXB0UjlCdm4vK0lzZE42eXljdnp2d3ppdmlzRHNP?=
 =?utf-8?B?Wm16R3lmUk1ZaWc3dHBLVVpwZFZESzNMM0dnVEdxMm1DWVFaNDdTaW1EdkFa?=
 =?utf-8?B?YVduNG43UGZrOEp3T1l3QlVkcWJBL0pwMkNDSVJncXJLMk43RkZVdGwxcXNV?=
 =?utf-8?B?ZU5VWFFSaDlZYjRBNWw2cHVKOEFWaml6VGJPdkE5ZFoxYkhPeVltRU05T2FC?=
 =?utf-8?B?SW9ydGpYWVVYMVhKNzZhK2NTcTlHWC9LNUt1UlB3Wm9yYVcxRXRVcW9CdE9P?=
 =?utf-8?B?dzJ5ZFdLU3M1NG9BS1Z4bWhLRE9HRElJZkRpdkkyQ1hRd0F3RmVXZUFmODZz?=
 =?utf-8?B?UjVGRjZnblpNd2FJNXZqS0lQdjZyeENRUm1PZXpYdTZXRTV1ekFBOTN1Unhr?=
 =?utf-8?B?Y1kwNXl3ajJ6aVBtcFZKY3QrcW01VktVV05teFVRcnhSUThVY2RDd3ljRzJK?=
 =?utf-8?B?RC9RdVVhLzJZbFJ5T2ExTlR0UWxMSW10MEthUkE2VVRxQ3hrdHE3T0hzWE9O?=
 =?utf-8?B?bUpSa1EyMTluNFBLYitiNDFBNnljUnNpWlY4aGNLMEhCVnBUVStPcEh2TEsy?=
 =?utf-8?Q?/QoIHKKdhOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnE4WlZhQWRrRm9YL0g0UGtIcDl3SDJxMEVMaFM1YktzQkd6ZHNlM1Rxd2oz?=
 =?utf-8?B?cElFaUhiU2YyeElZVnVkMlhKMzVHc1lGMTVRbFdrWVJGd01BMk5qSnp4NmRL?=
 =?utf-8?B?VmNUUWNmVGRYd2YwZ3pRV0V2eDAxelRFanhkNkFFRVRjNnhWc2h4c0ViOHph?=
 =?utf-8?B?eVAxc2NPRDhMSjRkMEpUTFhRMS9sNzFaVStHMVYzaCtVS2QycGN4aDgyVnhI?=
 =?utf-8?B?UjNKLzZMUXhsTFV1cE5qVmpNMjQ0VGFDSjlySGpJcGJRaFBZMjJDaUliOWgv?=
 =?utf-8?B?ditTSmVOYlk3VlJhR21HS25GZXgvWm5raUttSmt0RzZsNFFkTm9YcGhjTE1Q?=
 =?utf-8?B?bVpqYzdORGZKN0NXYVhMYWJORG02NTkxRTI4WEJTR3haY1N5emxMZjMxZTJO?=
 =?utf-8?B?alB6bmRTWUtsai81MHJ3cDFPeDlTZnIvZ0JKOXR4ZnZpQlNseUZMdk9EdlU2?=
 =?utf-8?B?SUs3TEFHRUMvSFNuaDZsYTlyaHg2UnpjOHA0SUp1SHJ3aVlJVVlMYlpqbWZR?=
 =?utf-8?B?dmxyNXlWTUI3TWVSZUFHanc3WkZHRy9aMkx4eUt5TzB4aXVZNDY3b2lGTkVK?=
 =?utf-8?B?R240OERZN3ZsSDBRUXBSVlFySU0zVkJFVjZiVW5CdEtlUGdjUzAvMVB5L2x2?=
 =?utf-8?B?UzhnMFRwYzloNDZBZVhpY1JTdUtjVTROWUhoNFNndFMySzhDN2xhU2JWY3po?=
 =?utf-8?B?aWxVck1JWTlpUFJoa1crbXY1VU5ZMTU3dG1xdmUvOGQ0U3FWU1ROb1pVUWRi?=
 =?utf-8?B?N0RUOVZwUnFYdk1nQjJGbjh4bTl3alE5MGhVazMvZUFmcmtHeEwxL3VYWGJ6?=
 =?utf-8?B?V1hUbkt5UlFGcXhDMC8zVEl6Y2diUUo1VEdJL2RUNEJ4Nzhod2QxSkZudlB1?=
 =?utf-8?B?a25iQnBBRHB5NW1UZFM3cnV2UE16YTlXVk51VU51K1lWWDhiaUNsYTV3SUh2?=
 =?utf-8?B?bStFVmRaU0kzRzM4b0d3QkFtVXpPdVlDTW5PQmxlbERtTVVyOWU5YUFHZGVh?=
 =?utf-8?B?b1Jmd3Y0bStqS1h0Tml3MTBvamtBcThHQTY2ZDZQNnI4dzhEM0VnTUVyZTM4?=
 =?utf-8?B?eWp4em5ETG1pSTJsMnJrdzNHRzJrZUpYOVYySVNrNGxVT0EwRHhVaXlpMklI?=
 =?utf-8?B?TEtrYVprL3ZCb0xKQUUxZVBMM0V5ek9EZ3BEbTdDYnV0M3NxRGQ5L1NHWWdx?=
 =?utf-8?B?d2JVN29naDYzQVF3WnY4d3l3dlEzOSs0S2ROL2hENHBSNStMMEhLRlhSSGpF?=
 =?utf-8?B?UXBHQnJlWlNyaW54V2JTZ1ZDeEU0R0k3OEdnWUlybjRJLzBPWW5nNUIzRi91?=
 =?utf-8?B?TVVQNVM1T0Zwdm5nQk9EUjB1ZERtcS9Zdk9EUnV2QUpEbVhEYTdxOUx1bmtL?=
 =?utf-8?B?K3hSNFZNZi9TMjNISXVVcWNqWGladnpMQnBlVnFHN1VTOWszeTc3ZlJhdVg3?=
 =?utf-8?B?R2o2MFpkT25ueTVrQlVzRzNKalgyTm5DS1BrK3hIemhnK0xaQjVVc3JtWUxJ?=
 =?utf-8?B?aWFNQWkzTEcwcm1yVXVOV3QzUXMvUlZtZWpGaVVFRjFvKys5QkRid1VWNlFT?=
 =?utf-8?B?eXdscGtuRkpjVlV3Y1RTWVhicTRVdTJNQlZ2RzBTZGNiT3h4a2lIcGpRMktE?=
 =?utf-8?B?MjF6eFJyclZ2SWI5NDRYVmFYcGNjOWNDTG9uc213WDZVbWt3K1lNV2h0cHMx?=
 =?utf-8?B?ME9waVBoUStvVmNFcmRONVplQU11b00xWFBTTFFxUzFHblB5MXBTWnFoZjJw?=
 =?utf-8?B?aGhiWENodHVhQktMaUNQaEh0Y24rY1FhbEtNL0lOMC9wY01CQnpHcUxBS095?=
 =?utf-8?B?Z3ZQUUhJVG9YTlFtbFNPckM0OE5UTjNMdFhPVFZyMTIxQmp6a29zaDZ5YXJi?=
 =?utf-8?B?bGgwd3BGTTEwS01DVEdma0t3YmFKaFJHaE5VL1hnYWFHZFVNS2JaUEtzSURh?=
 =?utf-8?B?RWo2OENjZlZNQW5valcrbnNXTEd5SWhvaVRaZ21oQVdUNzh3Snp5K2hka2Y5?=
 =?utf-8?B?R2NkRWFsbmlDQ1lkeUd1Q1BPRVA2cmtOTkN5cUtrTHByMHhBNlRsRW9FZmpj?=
 =?utf-8?B?bHFNVnpyMG1lOVpxQk83YWxEdzZTa2ZsT0hRdFpSRzVEbkswd1lRc2VQZ3RW?=
 =?utf-8?B?alYxWWFLT1BZajVuNHB0MEl4MFhPcitnbXlRM0VONmVMNTJRWG9XWC82c2R2?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lCVRpVMs9W0eWxEI/CTIEqRtq0Peuli8FS35lQpvP8coksyAC1GqrcF3lA6DJmr7G66StIh7lnnRSADwQpGEP1X3tTHnJ5pfI5ELD5wVHkTZ6vnfknFuBMGrsxbazFd/exhA5Lj+klp0cugcYTTRStP2DahXn/0WG7GkzLxgOMgYE/9Eiie3K7eFcQGkKcqI9Tu8QRLqAHcT4/1o0jNNeIWr068tfeVOnmAXjwP5KGh9vRxB7QL7POqizAkCmeBeiSLRbnij7MAd4YJyLE+vquPx0QjvXkQri1LtjFIXKd6eQAXK8zj7X+A4V4+hJcSpU9jVYeWV1mHKAac4UaE/fJV2Xp4rrvKrTjqw3TWV/kHNFQT1FBArDL5BiHGAnETzLtIPhdtL9diksQGBpcYDwBgvQE71WafjV/qZfnWpPEjI6likDylkG3vcbJ7cQIWvaHfXPfsvSFjGaMtdFhq66WV255gwJgOooYnKhzX6IPNlY3hdkc9Jbt7jM/DWVDqlWQ5DBghcG90E4CM540c+3uaJrL5JCKUJzTvl+J4LLe9meed7fjpDIJEhTIhO2eNb6RnP0H+hRa7zow8lHc9zQ/vqbE4j+D5yfej5EzctDMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa40aaa-be7e-48f4-4ba1-08ddd511d806
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:51:17.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrKXBeqMHmCrh7helMnhd0hd3uSDHBYiJhFwmxmQbkZ42OTXYCgpPR/TSO+CcVWuMcwA4GpXKa7zYt4iaKmYXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDExNyBTYWx0ZWRfXz5oXP6e+nzZD
 GkkPBvP8HBAOy+9kk9sCytVGZAHNkDSMHVEWqGLY/E/KKKuKSOnIIbIQ2yTq3/HME8ulGJVooDO
 YaC2+pT9nqfGHLGncQX0VddKxPoJKenGVpBA6B6DbLqyTjSPJ4C2piLnH4Ma4nIHCboo2IKAOf1
 lb2wlalqnr6mKRnIBGUJMFrFTkrSuk0iRk8f050hV0CBgJ/6Hzlg7eN3aetUbvG17fsufPZNJws
 a/xR0QfNGaHO5QZTZS8oE2/nyby3cCFY6ZuCbhyoGCWnIVSOfHa4DS65kosOUaZ1RD+D4VJltrt
 8mhiyB9jOv9T6PEEWxxmXDbozz3NjmSH8fUOjxKveH7tSSSUw72DCdvjpJaOnlsfV4C/zU1vD+S
 PtydZq6nplzmFociLa2cH/FG1s3S2wou3ErARhfE0+Z4BVEW9bSJx/+3NhTjW0YEbGZC1ZRz
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68939619 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=-t6P4QqAnG0X1OqZDMUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: K7fTvdD4CRXqequC0Czyl8YjUWMkvDA2
X-Proofpoint-GUID: K7fTvdD4CRXqequC0Czyl8YjUWMkvDA2

I pushed my WIP branch that starts to implement TLS session tags
to this branch:

  https://github.com/oracle/ktls-utils/tree/tls-session-tags

One of these patches has a man page tls-session-tags(7), that
explains things at a high level. An example set of tags is
defined in /etc/tlshd/tags.d/tags.example (added in one of
the commits).

A lot of it is working, some isn't. But these patches serve to
demonstrate some of the usability and coding issues that have
come up while developing.

-- 
Chuck Lever

