Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C722DFA4
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Feb 2025 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860119; cv=fail; b=ChRbSj3ux8LkSi7MGuh5KnLVQBCz7fjwbbYuINf4Jkwhv9oShpIEqPftHNfRe7dcuP7z96Ft6uZucyk/TauFprTl/4O/U9hcgdDB+c3LFCWSTKRS4iJ7IwrIKq3nU4MEUKw/rcoTTetsoxgmLjiiFkIC7D+77oH7hio0d2QpNM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860119; c=relaxed/simple;
	bh=GSum1B2dZ+tGZ9wngF0924zhfWoFZ7sfLx9C3izaRg4=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQY4hZcabxgp+8U8Yhmko+yFd6+w2eyQu0qR2t9fWz/rPrTxGtmZgUEJrhl0uJSQUArKXBHE98a0aoELBNrMkMJ7zdOQUochMISAby+1vHt+N+8xy7lyQg/bGGzty1dDv5/Z3pDVuMIT8B/Jk1KOvW0k2krUXpawTqZ4HFAyDlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zt5zZ4gZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tdjnrdas; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zt5zZ4gZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tdjnrdas"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516DMip8022950
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 6 Feb 2025 16:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+xsyFDaOWZMfFQ4lwnMuFlKWM41YvRe7C/8buQ3Ibv4=; b=
	Zt5zZ4gZ0Y5Bv8Iczfv8Xxq1IMBqOtQwl/rK/YZv80QmxL7AmXpkUWIGgadTNmYn
	BM59IORXikJV4kKUGo2yaS8JyYw7DZf1Nr1I2HFTwBBTpuZzTsFRFsZzQZadj+u9
	rSj+xVGUTVAjEuDrIOQp+YwCvgqF5RA8l8xHiHDm86EECL2kgxUWt9Bv4dRkCMCo
	0G2GofWj0K2edlhpJHIsF5AehcJ6SxgpUrZULPojcRogp3wU7knDjbKzDCd8W+kT
	fKccFoI8baWSrY6VHpcbRCJbGZGqSaSTclxJTEXjYSOB9USdYss/dDu+c0Ml3DHm
	g0Ql/MiznBrWLFKvssLgJw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mwwpgew2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Feb 2025 16:41:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516Fwej3020618
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 6 Feb 2025 16:41:55 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fs3578-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Feb 2025 16:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe7r88/Ay2zRexu5JAkgFw4oZkbNJX6zU9DrAr/Ju7IjEKuUPdybvLU2dp+qqU0BkPmiKN72zzNO/mLiaitPJK/M4yAQNdgXqYp/6rgjkJXg4XtkL5eEELmN06ACuO66k+rFSvwmZb+0M4AafL4bcv+AJpZJwt/6Im8HtHetyojhADU8deZP/OlB65qb2DdVBdDwrJ9/PvlIesId/aKv/xdEdDh2Sx9hAQSyyx56BMMSFWOzf8EPQMCMlE1q9wDpcBGesxiL0c61sTAxU4aDEVWh5rl1bZ0/Dyk6QvWYGpvMP8ZNUEdkEezCqyOTJJJTiCUNb/sc3CVD0GvDx62Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xsyFDaOWZMfFQ4lwnMuFlKWM41YvRe7C/8buQ3Ibv4=;
 b=HhfBfLziejAC3guspLo/bGZaw0PKnyCZer0DYErjJQBdFgX83TEWJgMlY7chv4FQdHdNAZTuKSuwTgLEJ1mQxVtXTsVRQ9aYVbSGBONOnB/2e+OKzOFjULfxUrTZenqhb5JwgHYabND2ncAIm4QaR/Z6fXl74+Nll0h2q/xASMU5iVe5BymN6oZUXsHBKHoj9F7Z4KShWvnMCcFB9ohAg2bIcWH97MCDA8eDHceTwDvA4oFVb3J6qkADOoe3rNi48RqgsLakuBA6ZUNRTwpEevLowgR9wqQB+Nw1PYcJ2IyrXH5i7Zet/DyMB0cX7niJUoclX3rrAYK6n0nhKoGv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xsyFDaOWZMfFQ4lwnMuFlKWM41YvRe7C/8buQ3Ibv4=;
 b=TdjnrdasdwGTEmMtuipRCw62yTwOsQ9jN/bCO0Z97P75McPAmjJWCQouasS3gBDmw+GrSRVLw7TdCAiFGvvnM/8WPPR4pzGj5KDfukCCfZpBxPIzfOpDV3Re+3Re9WlyUHLiNzoIwofW7wVRgNph8zPgbfVkC9pK0ZFPiI3mKf0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB7771.namprd10.prod.outlook.com (2603:10b6:408:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 16:41:53 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:41:52 +0000
Message-ID: <3f33cfa8-edfc-4cde-8c42-5083eb405fc3@oracle.com>
Date: Thu, 6 Feb 2025 11:41:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Preparing for ktls-utils-1.0
From: Chuck Lever <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <77ac012b-0ad7-4aa4-8b27-7a837c6c03be@oracle.com>
 <c6d66de9-f66a-475a-bf63-ae5eb15ea85a@oracle.com>
Content-Language: en-US
In-Reply-To: <c6d66de9-f66a-475a-bf63-ae5eb15ea85a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:610:b1::28) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LV3PR10MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a1e230-0fd4-4271-5333-08dd46cd290e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0V3RDE1V0NCMkxjQ3FENnhVd3BDZ3MzVzkrU2dKZktUeHdzcEpmZWs4S0tw?=
 =?utf-8?B?MFlsQmlEWW9tV0NhSGlEbmNybi9nM3hDWUJmOFRsTHZUQWd4cUNrc0VLalI2?=
 =?utf-8?B?bnU1QzdHazZERnNReTR1TWprelRIcHQ3WjduK0M1UzJ5TVI4MVhhYVozeFl0?=
 =?utf-8?B?K01rMFJWYVNIN3hxZU5BWXF0MjNPc3JtaG13MVA5SEFTSnV0NjU4YzhlMzRt?=
 =?utf-8?B?OUtHSEtaUi95c09GNHVaQXpPU1VnaXE0VUFrTmRJQ05TbmlQdmpPTW01YU55?=
 =?utf-8?B?eDdaRzk5OHNCZkd3THNIMmdmRGx1dGZLanYxT2doUWw5RU0rTWxicksxcjJq?=
 =?utf-8?B?Yk02VEtpVTgzNGNBOS9oa2U2anJxVTBRV3haSFc5WU8rK2pyYzdqSnNCK2Js?=
 =?utf-8?B?WElQSTVCZHFBQ3lnVkkxMUxuTVByYWoxR0pqUzR0N3MzQkxzeEE4ZWpMVldK?=
 =?utf-8?B?K1JNd2RRN0ZyaEZVdzl6dmR2cVE3Y2F1Z3hxdEloM0x4NHZiWnAyeGxIQ2U4?=
 =?utf-8?B?THlMRGtsZlN5UnJOOHVhbHpJbkd3Nm1ZMlV6WDhwanJNcHhkc2hvbzk5Skxr?=
 =?utf-8?B?TjYyL25FYVNlQmtBT3RlZ0Q3TkdFcnVadDljOHdjaTdrYnludHY3YmdtckhQ?=
 =?utf-8?B?VStFVnU3Q2NQTFkxRUpJeG11UGhScUpNYkNpR0QrczhvWWNVRjBheFZGUFFU?=
 =?utf-8?B?eEtPTUhJaW9qdmlyUk42QVorUGp5R1FrM3Nxczl2cW9rT0FpWEZQNkhzVEpy?=
 =?utf-8?B?WEVvU3Q3WUgzcllyTmQvajB4TktCQmN5eHZqVXYyMzBHMXJkVXZIZ1YrS1NB?=
 =?utf-8?B?WGs3MmhqM0RTYzh1cTA0UlQvT2t4RXJGTzJuNVdxZ0VpR1hhcWl2K1Zsb1N4?=
 =?utf-8?B?czN3WnNtR0cvOVZoN0JNZFNoQTNDN3pmNXBSY2g5L3d0NERUK3ZzaU14cjQy?=
 =?utf-8?B?OWxCWjFDOVBydFRYOWkwSjZoaUEybzlVV1NCU3lmc0Fld3BQZldNd3BOMnBN?=
 =?utf-8?B?Nnh1UzhWVjNJQm82VndyVTl4Yng0Umxxc20xcXdDMWlRL203bVJUOG9xTGVP?=
 =?utf-8?B?QlBHbW9RMnRoWnZKd2FvenFKdEI2b3hsL1pBUDdKVGgwZlNaVkdBOHVydllL?=
 =?utf-8?B?LzdzQmcrL3FPY3pBWXp4bUUvWEVGbW4rc1VFVFVvY2gwRzlpNUkvOWtTeWpz?=
 =?utf-8?B?KzI0S0MxbXllRG9YQXBUN25lblFwNnBFd2NpRXdoVHkzMHh2M2F3Sko5SENE?=
 =?utf-8?B?Vkk5OFNnRWgxcUhIY3RWN0l0THk0bmpkbkFBcFMrblBxV0hnWlRLbTNKcndX?=
 =?utf-8?B?VkRCQWpBZU93R1BObm5EdlBEWjQrNmNFcDlWSU1qMlpqOUZ0UU1sVGhJVE5j?=
 =?utf-8?B?ZlZDS3cxUjZDWi9rVkd4WmdOMFd1TVB0WkdFT2MzTGVRNVVleEdRQkdsNUdE?=
 =?utf-8?B?TW0rR215c1k5c0RINFE3cVV0ZmV0YWFOZE9BSUMzVmVQMkkyS29yQ2RodmM0?=
 =?utf-8?B?cUxvL1I3QllJWjU1Sk4zN2pkaldYMlhUWElWMjJMV0Z1WjBRUmduSW5POG9w?=
 =?utf-8?B?ZEtDZ2o2UE1DbHlhcWhjZGVOK3FtQWdRNEQ3ZWhyWGE3TWlYdFRIeEtqdmZ0?=
 =?utf-8?B?bmo1TFFPV0xMV3pZcEJVQkhlYlkzdElYVEpoYUxMc3NCSEhzeGlTU2JQMUdW?=
 =?utf-8?B?Q3piekxvMm91RUM0anZ0VmcxRE9DdVJDWXdqU3hBOURROVFXMVhpaStGQTBa?=
 =?utf-8?B?YXc2cW8wSWtXS3BjUnM0cE5HNThJOFlKdEZMQit2MzBHU0s5QmxjRFhPQVRP?=
 =?utf-8?B?NVhKWGhMMmJNdGI5YzFVYXdSaU9BejBOT0tIRmZYeE5GbExTa2hYL08wMnFt?=
 =?utf-8?B?WEg1TXZSN0gxdndiK0FpQU8wVzg5Z0lPMEZnYkg3bVdvUFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk4xZjF6MGFwaFpBUGRVQUtTN29uc0hJOTZ2RWZKRitJbWNPVjE0dWdWK2g0?=
 =?utf-8?B?Y1R3QkZZUnBBVjhXR0pjMWhxZ0lLQTNPUEhKQU1CMlZNQVlHWjN6KzJyc0Z0?=
 =?utf-8?B?WkFRSE5tV0tCT0tSTCtHZ1hKZGVvNW03OWQrU1NFY3J0VjJqd2draHlmdUVI?=
 =?utf-8?B?ajNRM25UcjQrd0MxMTBGd296aWtZc0lBcmJRSnNjUDI3empyZzFSWFNpT0tm?=
 =?utf-8?B?Z0hvb2wvclRHK1p5WXcrejBsN3gyVmMwOG9pamVINjVGcHhvbmdoem02bVVw?=
 =?utf-8?B?OXlhUFc5SUs5SU1pNldWSmtRc3ZsR1hWVGlPbXNuOXR3Z1kyS1RRU2lQMkNG?=
 =?utf-8?B?aHNla1d5VTRFNzcrZEI0Mkcwa3M4VnowQXZkaG9zalZVSFRRbFVONXU3QkI0?=
 =?utf-8?B?WXRKMjBCcHRITUxHbGsyaU5BYXM0WUNKbzR5WVpaSlFXZnNLQkFlbUhEQXBZ?=
 =?utf-8?B?NGdTZmZjZVdWMmk0a1NHWGxOa0JudDlmRng1YzF6RGlNeEdNTlJkT2JHaUU4?=
 =?utf-8?B?ZmtsWlI3MkIxZFFpbURZK3BHa1I1cHRlKzI1RTEzdDFlYjVCL2NZSHF4cHVN?=
 =?utf-8?B?bEhGQ1gzUUx0RWEycGlSOWxtbk5rSExWMXVFTk9WWFh4akJ0dUZqY0tibDlv?=
 =?utf-8?B?MFVwYjYyd0xuT25hQXRhQXhyREZFNE1zTExFaFdEVmlmVmtOY213TlYwMThC?=
 =?utf-8?B?aUErdjMva3Zud1g1QzF1VnZTNjQ1TTZvcDFwb3o2YmNXejYrSzFsYmpvRzNp?=
 =?utf-8?B?b2tzSU9NenNCWjNYZGtFelBVdVBXMU9ZMzFyQnZscHlxWjY3d2pMZDZUdTlm?=
 =?utf-8?B?WllQai9wMkpEc3FwRG1RcGYwdnJCZ3RxVDZmQ2djWWZZeHJxN3YrUytCV2Ru?=
 =?utf-8?B?dXZFWit2c2VBY0Rua3UvK1lkMnh4OUJoT3gwbFpkckZ2T2R3RHZrVTN1MWNV?=
 =?utf-8?B?Z29PcG9DUllhQWI4cnRITjJIcUdxMWgwMi9kR2hkR01TV3RwYWFkRjV1a05y?=
 =?utf-8?B?SjM2MlMyNVBPVXVndUgxNSsxdmNIV2RhK01nNWU3WFpyOEp4NTliZktiSFhv?=
 =?utf-8?B?VDB0Mmw5amR1Z25Eb3VaSzJNenhhNGZXUkZRN2Z0QmdTZS9mRWp5c2FOUi8y?=
 =?utf-8?B?YTJVcDJYekRwNmVuMTRlSDRvN2YzQzN6L1BBU3RrVmRkUlhwZkxSdE44SzRE?=
 =?utf-8?B?Tklicldjc2xhNVBwYjIxTXdjUy9MMzlEZ2pyaGk2b3lsa3hjb3N6MUwyMExa?=
 =?utf-8?B?VVQ1a09lVDBKb2xseVNId2VkY3MzTk00dUtkc0gxSSs5TlpnY3pHMFdldWNO?=
 =?utf-8?B?Zzd0NjEzT3BpOXhWS0JobnFKUHF0RUJIOS9zRGNNUzZxVFJzSTBKNUlRdjUx?=
 =?utf-8?B?Nm9sekN1WWFPTjEzTWJvMFlOUVMrMjdkWUMyNmswTm1CVVQzd2ZDVDBuZHIr?=
 =?utf-8?B?dGtFUEcrTXJRV01HM3dmY0NTNzZIendldjJjRGpUR20vYXZyZTdTcmx5ZFA0?=
 =?utf-8?B?NnZoNzVWZnFYNlpuVDVlK1JkWWthMEVVT3lVT1AxWDU2TGR4cENiNmVXanE1?=
 =?utf-8?B?RzM5UHdWYkpnUzBkbUlHOWNLSjlGV29xOEF4TVNMWW4vWnM5Z01KelFaa1dF?=
 =?utf-8?B?WDBhNFptR0dZb1Bpdm92d014cnBEY2hBcFFXTGRtMTdDaExWbVJoRGxBYmJ1?=
 =?utf-8?B?OU1Cdk12cHIya3YzUHozVmJPNjNzRUVqanFiNGtkcWxhRVN1M1cxM0tmNnZD?=
 =?utf-8?B?R09GcTVDUFJsM0g3Rk15MzBqdzNGNDc0bkh0MHduK2RXTzR2OUxJaVFldDV1?=
 =?utf-8?B?T21JR3krR0xMNnFLRjd3QStqeHpNSm94cUw1YmlRVHJMdnlORXZ2Q1dMeTJx?=
 =?utf-8?B?amk1bW5GTEtmbEh3c2hZS3I0RjR6M0JHWFIrdWIvZ2NVN0N6UGg1TW43NlZn?=
 =?utf-8?B?RnRzMnlWV1lKMEFvV29nMlRLdmQrOG1qQTd3VTlYeXRHQUVQdGk4T0IwWUZZ?=
 =?utf-8?B?L0xiYmpaa3NwTit6NFFtOUxWemNKR29aWFRrSlQ0bWZiQVNER3Y4ZTBqKzJa?=
 =?utf-8?B?RU9ORVgwWmNxSWhGRkVoRXp6aW1Vc2xZRUxIMGU2cHExdjZ3NnNDZGlUQ29O?=
 =?utf-8?B?NnVZQmNnRlE5YmRwOXlYVHkyYVVKeUpwdTVqb3V5MzY5TFA5M2V5NlBvUXZI?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PWMJ3Jm8gUaPJSHdv8zo0sExcgQWRd86xLF/gdZsc8oh+BeCukAtvY+96qeh+Q+xeHN/5/MDBDQyg17inW5uQFxlIOOBBdfEtkdWLYvwVLXL4U+5sWyXaNKTGEh8/fu955QLs7yn29csHmMdLa4tVjBFWXOWPgGGlKGSVW4c+umcT4fHEUc7ax0yllQmzfqMuV2hxOhm1SKXJ9p8CS5LYR0QnPSFdsIvgvTq2becbM1t+GbvQhSII2Hrzb76ymx/Bm/51TURABpvpO75JMoz0BbG9QYPgTnZjctd+6LLOfnmlXqK/bgfXIQh9L2nc/uIr6ZEDehPfnGd8TrrU2fdMa/w2uRgotBAZbsjBVbo14wk92CtuF902jVUZbzyPF/YZFAXW5RAVU7vOWTZGyq0mhfp3ZACMCUJGn+tM9vZnVaJ/iHAVPexL1MDXJXHrwAIJzKKubaSxKrs4stxsmpL42hDXptmVQO6aqMkQsN1yrR9uKtIwnf4iAxEIewJ1YJ0Q1UOtuSu++NpLSn+KcMGMcqswV0DiyVcpMAgJTbr8uQ1QsnuFL6rF7+iAhJQk+8waKcJ4rGUe64bGA2K0d+x1ywv0eocmNZivL/Un2nSBsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a1e230-0fd4-4271-5333-08dd46cd290e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:41:52.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5oK+0Snb8bTnmRQa79CE+8esxlNF+mJEAnBn06VhN7VNOu0rAP4yD2Z5cuN3pXI9CkrWQ2qjzXV4h6+z+SR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7771
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060133
X-Proofpoint-ORIG-GUID: N2XaN1APt0WmYCxqulQBRjbY7G7QbXP5
X-Proofpoint-GUID: N2XaN1APt0WmYCxqulQBRjbY7G7QbXP5

On 1/29/25 3:03 PM, Chuck Lever wrote:
> On 1/29/25 9:39 AM, Chuck Lever wrote:
>> I received a request to publish a fresh release of ktls-utils.
>> My thought was this is an opportunity to release a 1.0.
>>
>> I can request a Parfait run on the current source code.

After reviewing some old email, looks like the Parfait runs are
now automatic and weekly, so no request was necessary.


>> I've
>> never gotten Coverity to work. Any other analysis tools we
>> can try?
>>
>> Are there any other features that should be in this release?
> 
> It would be great to close these two before a 1.0 release.
> 
> - https://github.com/oracle/ktls-utils/issues/21
> 
> - https://github.com/oracle/ktls-utils/issues/71
> 
> 
>> All code review (or re-review) is welcome.

Hannes closed #71. #21 is still pending, but I don't view it as a
release blocker.

I've created a pre-release of ktls-utils-1.0:

  https://github.com/oracle/ktls-utils/releases/tag/ktls-utils-1.0-rc1

Let me know if something is missing or broken.


-- 
Chuck Lever
