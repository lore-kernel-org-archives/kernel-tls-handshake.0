Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEE264A73
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  1 Jul 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376021; cv=fail; b=EDb2bhdGXbXVibWtsDaWc7YeHGgUHkK/DSaxFYYoRX+Sd/DC2y7QNSgIZqmIg4CsIZjqsYSlVdJdL79xBptpdw78MCB8onj32Ffaxz2UQLKVdp2zvYNYq1zFhmAkPsrXit+EzkoLwHNHzf5js8FLS/zFAk9kuozU7sejKTXI3lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376021; c=relaxed/simple;
	bh=6zl9VL3+A6NoihziEW1QcwcKeUmG5bgvjafN+x30euI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JNj9mB+dgcF6jfC42cXROOnoi62Xi2cQ9pdLGF6M3nHXybFeYhmKTwYrRYBc68h2E1X0knGTHssjdAhEBYf5yA31+3McRZVQ7a8N4c+QwWCjQS6rR7W3/0662OBvA+dXp469jOsSf1h6kiTMBRI1jUiVak0i8ns67ILnEYBy2H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RVI/yu7Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jQh55phk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RVI/yu7Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jQh55phk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9RuJ024738;
	Tue, 1 Jul 2025 13:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tFikZYdrZbt9xSNEyibV5YT6mM76ajdfmxa2SdLn/0g=; b=
	RVI/yu7QEi3IQBdYcBqHaQzfZxLsaNUERSCmFeXMSKbjLNgNVBRCoxATWhmbfbgH
	D84IBP4PY1MRZ+6ygzaVWEU5eJTdVIZARiwQBSN0dPweROKclrEEzJf6najCQgwD
	XY2VvlONLhN0vUODuCf5GDZpLr3ann9aE45NRUaVHhVF1PkkyG560Hd//+quVjpo
	zqz546wT7RTrVxq6vBmlVYtzJqjLvGHXXW5jkSZjMXAU1LS2jfEZrPsvBAzH4HN7
	wMC78+EcPBqymxqGNRoVkyO4GZ325T6LLDIVkiTTMQTyv3D9/ZNXYev8jMlLdIgI
	IXw5PtV0Bl9srdZm4H68/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704cs6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:20:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561DG1ts029841;
	Tue, 1 Jul 2025 13:20:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9rey7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unUT2dVABg0S8i0x8uY0qm0gJXC1PTeWITRRBbKqSiUGvFXOmMUygLIKyGgNToiwLwtmpSKjqPvrQXhoD1tfl0TaGDjSpuVzB0UbLnvKhSbEis8j7uNs3AaZhPvay6RMUs3nRwEjFZuPjHKTWeCiNzw0/aBG/RqlWWpQVPIx89IWN7ZhzGnDroyjhykeiUdC2oQQBB+lTeEcPcpreD316j1Pkf5ogDl5dywuAcIW8OOrYupWmf2zH9yaIYD2HeyKejzMry2kU778BOeXiuOVBCb48qnDH+vYkjH8s+ysI6ueKplkVu2oNwKYn5zDyGpoWAvNsvOOCcDNBsAibesZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFikZYdrZbt9xSNEyibV5YT6mM76ajdfmxa2SdLn/0g=;
 b=PWRhmJIumhkbXPIvuTsKqyfzLbUvUwrP3JpeTpHeVwV5iDwgPaYm1zawFv3384j9tajWMvfvXx5fusK4zAf/SXlT+SVkRdTkcYr2GOR6CLLvGS4PoeRlXxYfuqcIJQheAeP+e8UH1x3fBm4rDBPiZm45XY7/+8Ibr6awyhCiVecdk403c5OKBPYkbWvtTgwle74CRuTNG4dnQq2OgaE9g6JtRrBY+Spj4+TMlMND1UdUz/ccrfleQxiCC6DG9YQsOhoUwY8/JxtimFVhB7ZkNIDHyOQuiRKZxdTfiq8UFbksXGzk85ZU9N0Cybl4kCPK05xKmdI45QyJ3be1bVOqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFikZYdrZbt9xSNEyibV5YT6mM76ajdfmxa2SdLn/0g=;
 b=jQh55phkLdB6rHV4sKEu5aQ5vV3QGQNjwR1En4UNyREdsbPMWhgzPPhSyPsTJHYhZHbyIktWLGYPjMUFya0112UOqFNiG0Jp5xCpxgITBmtHFkiKngpVUalTNxPGx2m9MgT/VcEmMMcAYgtO7dLCTNA1EcHZeygtJeAmF2d+iwg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 13:20:11 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 13:20:11 +0000
Message-ID: <dd0a85fb-e7de-4007-b9ab-b11b73a31f58@oracle.com>
Date: Tue, 1 Jul 2025 09:20:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/handshake: Add new parameter
 'HANDSHAKE_A_ACCEPT_KEYRING'
To: Hannes Reinecke <hare@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, Hannes Reinecke <hare@suse.de>
References: <20250701063320.67849-1-hare@kernel.org>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250701063320.67849-1-hare@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0019.namprd14.prod.outlook.com
 (2603:10b6:610:60::29) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SA2PR10MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ea7253-2d13-4056-0e3f-08ddb8a201cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnFpelJ4VWhrY0xSTWNreFlmTGFDUzhUMkFvWjlQZlhwbnhyL2tHNHFpbUlT?=
 =?utf-8?B?c1NGb3Zla1hCUWpGQm9EaXBMQ2x4RU9CNjJrVjVnNDMzY3hPR0I5MTdJMFhm?=
 =?utf-8?B?VHRyYjltTFl2VmlDRGR1NEJvUGJYZTNTa0N2K3F0bkpOMTRJT3BMYm90aEV3?=
 =?utf-8?B?Qm9nNnNuekE4eTRFTGRJL0ovQnVBNlRsaDc3Smphdk80eXk1djB6c0o2S1gv?=
 =?utf-8?B?U1VJVWw4L3ViY0hDdEluVkw5YmkvYUFvT25tczdxOWVvYWttbloraHpkRzVw?=
 =?utf-8?B?UDVOU1hIaHZuM2lXc0lpTEZQQ3FwdE8zdjZjcXBGam5XNS9YV1dNTjhaUHRm?=
 =?utf-8?B?QStkT21XQ3NIdzJ3MUtudFFnYUJZMG1VNS9YdndHZDZJL1dQa1U5RkdDeWhz?=
 =?utf-8?B?YmJpeWU2Z1NkbHN2eTVaREYrd2VKSHdpbE5uRTdTNjc3ajgrZXI5Q0xPcFh5?=
 =?utf-8?B?NWlEUUNaUDUxS3hQRjZXK2wrdUJ1R25vYXV0Q0NLL3RScUMrdjlJUUJaTlU4?=
 =?utf-8?B?VzdGZmZDRUFyMDRJRUlBNmZoQTkzWnNzVW9aRytLbEx2NndZMEIzakpjanZl?=
 =?utf-8?B?VitHUGZjLzA3SC80aUdkTDFCb0FSSzlIRmdueExFbWpKVmQ3aDkwVGZCaVVh?=
 =?utf-8?B?MTlYeXBrZGpieDRpRXdIbXp1QXk2MHA5RzZySnptQlRqM3ZPK1RiQ2treXQv?=
 =?utf-8?B?K1hhaXp6YkJMVDFUelJKTWhnQmo2TGpMLzFndWE2d1VLMU1wUkhNbE9WR2Nu?=
 =?utf-8?B?VkQ2cSt5UlFBTFh6QWVrYTZMYXZQV2tsNFFna0ZLcnkxNW9LUUwralIvMnB3?=
 =?utf-8?B?ZHBGRThUOTdRS3pnYVRoMlgxMFp3Y1RVTEFZRzRPcWhBRE1rM01FMjIvV3Z5?=
 =?utf-8?B?R2pESFE2OWRKckFKaUxmSEZUQmJRMi91UC9ORHMxT2g0OXVxeU5xL2l5czhE?=
 =?utf-8?B?VmhEUEJpMUZDakp3bm82ZS82WmlibzlrOGw3emxNT2loY010Yi81ZW9FZlls?=
 =?utf-8?B?OFJrUEUrSWNGMnEzaDBSZmxlOVlIV09EUjlDdVZacjROMVh6ZTdnWHdDM2lI?=
 =?utf-8?B?djY5Rno0cEVzYmVCZ01lcmlhdmhtWlJzdWh4c0x0cFVETlhPWFpSRytTSEhN?=
 =?utf-8?B?Tk85eUhIcWhDOFRJQTRhRk1TRW9USHdnc0ZsRVdVaENHZDN5VFZHOEwvWExn?=
 =?utf-8?B?Yk11ZDIxUVo3ZEltL0dpWGVCck8vQnh5OXQ5Slo2Yi9ZUHd4QUlpYU5zOUdk?=
 =?utf-8?B?bEJ6M1NsQlJtYUQwMHVCNjNCYUprNHdtSTlvYUtYbzNraU5ZajVCS0FwSXNU?=
 =?utf-8?B?eXB3c3pKR0FtWWhHM0tIaVUyaEhjb1BieHZSQzJCeGdJazJGK3djbHhCU1VL?=
 =?utf-8?B?akJvWXlCblMvM3liaWp5TkJtcFd6SFdBWWFNZjNidzRwUzE4aVE4TWUxWjVn?=
 =?utf-8?B?UmRLeXFneFNSVWs1OTBxR2JjZExySE9VMnpGQmo0M1BzK0w0Tkt2b3lUZnFB?=
 =?utf-8?B?cVZENTZQSm1RcHJ6ZEFCV0xqUm83cklIam1oa1pwYm45Y05qZXM4MWlXcUZY?=
 =?utf-8?B?OHppNzZ6OEsxOXRJbjZLTzJmR0M5Wk5hemdNQzJOZkI0TlZaLys3cnVIQTFm?=
 =?utf-8?B?UTJpenhuOTFXWm1wZTVncWxkdG1MQjl2L2ZWTlVPVUJMRGJqcy9jQWllaUll?=
 =?utf-8?B?Y2JGWGQ3NDloYWE0cUxuNmlURy9pcUFDNG9KR3dQRE5ZK2FoVDJncU96dyt4?=
 =?utf-8?B?MWJiYktGV2IrdU1sZzBsTDF1WmxzN0srNzJ1VnhKakZ6amVZT3FLaWJZd2l1?=
 =?utf-8?B?OE5PTFFzWU9TNjhSMTVhUGxnUFpmZmFvYks0ZHM0RUJ6VVZIOG81WWtQejFy?=
 =?utf-8?B?OWFiVlc4NTFZbm5RRkJoNzZ4dVB0cWxmRHNGYUV4dlVsQ3pYeWNFWjF3ZlZw?=
 =?utf-8?Q?BROfHMEDtFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjZnRkpCdW9rZXZWQlF1L2hiWHRla0tDTUEwS2huMlM4Q1o1RjA0RzBZRDcr?=
 =?utf-8?B?ckxlRWZOUkFXRjJ2elFFWDlMOFltT2I1WC9PbTNucTVhZVdENzBoMnJmd1pC?=
 =?utf-8?B?VlYzNllKdHE1WVFWWnNoNmp4N20yY3h4UTBnTUE3SFQ3VlN1Y0RKYWx4WDI4?=
 =?utf-8?B?STlGVmp5bFVEUmZaa290MjVRZG1iWGEyTk9EbHRPMjBEQzd5TklCR2I1SWlX?=
 =?utf-8?B?RE1rZnZRTjVQcEpHMWVoNGh0eSsxRUVpMDJkaHQraGJFb0JSM1BBVGFkanVL?=
 =?utf-8?B?YkpQa1RmcFJ4eUJwWkNaRlpiU3NXWFk3YXFINEZ3S3A1RStGTlJmMmZIWnlu?=
 =?utf-8?B?Zzdyb3RvSTNHaHdGY0RLd25vRWVVOFlhYTNha1RYU1EwU3o0a2RGQlowSE1x?=
 =?utf-8?B?cXJneVRxQUhiUWJXanpLOXY2Z2R6ZzhZcmNzOWRxUzIyVlc1L3c0Q2pjWmJD?=
 =?utf-8?B?VVM4cSt6OFlqUUFkanRpWkJaSGdxcW5wUVpnUjdEYmI1Mng1bzhGZUtzQnhP?=
 =?utf-8?B?NFc1V2lFcWlzT09FZ05DOXJxdlJWcEFNSkNoUk5UdXJUV3hiQkd6R0tXTG9i?=
 =?utf-8?B?YnVJS2RncVZiTHh2NEF5YzlZSjZFL3c5SytlSVZDdEdrNmFSWDRpdjNZc1FN?=
 =?utf-8?B?RldMRWpITURUWDVuMHZPUlE0OXk2MnZzRW9Sb3dVYjN4L1QvRjVudHBSZnJo?=
 =?utf-8?B?MUFWVTNFVDByTzFPR3RoOTdkMGtjMENJSDVQZSthTFdpZFVUYi9UYksreFhy?=
 =?utf-8?B?TEJqanQ5dURXeFBXSjlNaDVOWkhHMS9vOG12aFZySFFORDlGYnZRZWVKZVdX?=
 =?utf-8?B?M3lVZmczeDM1UGlNRVRHNG5ldTNTTDc5ZitCdUlOUEgvR1pMV3E3Z0V1L0hJ?=
 =?utf-8?B?ZmVOcmtSMWRvTXhtUTExWWtYR0JFTE1uNTBOb21NSmpnbE9mcjRQWCt3clpZ?=
 =?utf-8?B?dnphR0lESzJHdkRURXdNZ3lxZXprcE5CMW9lVUhDMVcvakJGRWVJNWllVFBr?=
 =?utf-8?B?ck10MDRQanZTbG5nTitJM1ZnallSWTZRZktMbWRMN1FiYm1QQmhCN2owZlkv?=
 =?utf-8?B?ZjZ2TUZ6citaWVFKMkZzb2NIVmgwSU5sNklIYks5Q1A2ZmtJUjhsa2lkZ29S?=
 =?utf-8?B?b3JPS2RvL2NPd2VNSW8waEtMcDdnVWZ6K2pHdFBiSjg1d3lKckpMQ2o1Ymxj?=
 =?utf-8?B?ZWozQ0RKdE9GWUhrU1lnMHZCdjlmenViVlBIcmZTNElxb2pEbkhSTkxSUXg5?=
 =?utf-8?B?bkZOQmRTbEtuMyszK0xZVFpxN2d3Y0tQWE9JY2hjcVpuMUFOOHpDL0ZjT1Qy?=
 =?utf-8?B?anFleGVUZUpJQkJSWW1ub2tXQXB1SEdZKzAwai9YVUw3YVVWcTRlZUNPVEJQ?=
 =?utf-8?B?OE1ENk5lRDR4MnNyVkVvTWIzUmlWUHJGSWpkQ0RZUzVMVGJseHVhbkNEZTIz?=
 =?utf-8?B?TmRaL0F5dEdaeWZoU2hmQUlGUDlGall4MUdsTmFoTWtvd3FSQ1RQN1gyRGt6?=
 =?utf-8?B?SjM4YnVIMUcxNnQ3MW1UZll5anRGK3BJNFU3L2R1N3ZIOWRIdzRySEdIRk53?=
 =?utf-8?B?WG1TTy90ZXdtR09tMm1KYU4wbG9MaU84clNNd1ljbjh1Um9yZTcrMExwVHcw?=
 =?utf-8?B?WCtVZlNDTWt2TEpJYnBmcmdsOWhzY2ZMTnVUaW9yZGU3d2cySFhNZEFZd0Nx?=
 =?utf-8?B?VnNnUVNuTVpTazFnSzl2aTR1U2NFMzR2ek1jUHBIUEJsTnFNZW9BRy9obWYr?=
 =?utf-8?B?U0cySjRiOHFZUno1d2NnWSt2cjRGbEgyejVGWWUvY0pMU2ZnMkxtVDFwMUl0?=
 =?utf-8?B?cGpGSjVROEUzQVNscjhXeG93MWVDNFBDTG8zdHBhTFRpeEhCREdXeE5lZWE3?=
 =?utf-8?B?MGtXMGJFT2R0NnRRci90bVhFNGRHOFZnMjA5YUR1UFZjZGFKOTdQN0hEaWo3?=
 =?utf-8?B?a2lqU09ibUYxWVJ3OHkvL1NldGlZbzBpa0dTbnR0ejdSTEVIekdPRDZJZlMz?=
 =?utf-8?B?STQvRUtXYmU5YStFMFkvUGY1Ny9lNzJ5eEV4U3pGTlp6NkVoWGR2TmJsd0Rs?=
 =?utf-8?B?SkJtOVRhK3NXM1BwaVphclg0eWtzTnNTRFA1M2t5Mk1YSUhlWDRyT3Qwbjcw?=
 =?utf-8?Q?1Q9zmP3oJZftpZcD3DZuNkDt9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tAwHqL51IdycIuQUsgRfM+cOQrH9W3O8HPZ9oqgnNGurUAyM1Li0lIDbtUOehzaLo4jm4pCbEJKfURwydxDIYpplsKyKDuxzSwNLvYkFslwiV5DsPKD5Ad7ewq35xuKHbMVIjl9e1CD89+OxBYeuEyDshg7/IXsQnPQK7088dU0TO0UMHwFMaKzbcn0/i+HBEYO6jYAbwcTkHZer11u4TgcR6Od8eozcnz36TZ1dZTo/sjqWs7JPrnEZI2U0zI5vsCDP4WZvVPwfGdG3IVFxYxlcTRLAbjHyPzfXrTvEtsp2hcVnm3NYVjP2HfRqc+owrosI4+/nY+j2KmMP0HnciqRoee8anpQ9c7swCqt7Gcu4c5cTCsvQ72tJN8C6fKWbU3hSnCACouk7uBUZx2od4IUtH5gvT/wY50KrOjkGma8Gx2nU99FZ0M6bDTLFpzX4433wbGAnNDbEqXW5OR0GcaXv7l9OSRLto6LTeYmWnqEGMVrseLGV+iNnL/W8OoQS5fc2z9vEnyA2vbsmO6AG3P5L05m6R6qXJEMAoO1GGRbPVBN/aRY9pj0oZOPTsg5gEzMeqsZlKCFi53xraNEHoGMylmI9+Z0n0F6ERfI+5n4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ea7253-2d13-4056-0e3f-08ddb8a201cf
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:20:11.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2KWWUQ+PSxzlqVxq0VrbmvTBJRanHU1j27qPfhIZHhG4YpMtTd6ef3xS02vxHD+O8JF22ieJdfD/o4VU0RrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NCBTYWx0ZWRfX87duvXqkhdoJ U03FzJf/8mgA/gwf2XGxWEok9Clrr7mCLMddBs7w5zznVyV/jsDeYfhXdn7o/nTHLE3Jw+MHDOq 4i3WFGKJ4EB3TxWi08ljPLWszbO8Bf2H4L8tduK8kg58LikLTfqng1v1tf4Sfw+mJn21/VYGpAu
 icz16R5Ga/vQiJJ99r/heuPoQSLMj3eaSnaQhtdWoiokvphJxBZqNrhIpuuI9CAwO2LnFiOl7v/ nFLrq9Itknwdgl3LgHKz3jMKLToY43YRLaM3LF8t3bXiqK7+XGL06PxC0Q1PSibT/oXVOVrlufp 3gnohEETfgszwFuvSMp9JhsVC5k0JGEpW7dtcvYXG0CiMSkWEz3KyoLbw9xxAMhkGuNY6Tf5isp
 vD2Ih6DvFG2P9sgz4vXcbxmoQHPvNrXpRVjBA2EkQP360GSGFUn5dcxundZmeSOrA+++POji
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6863e08e cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=GtKKwlXGpVk4V20fJV4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Cy_WohW-xW8XihTp8cn30uWwVDya8Boi
X-Proofpoint-ORIG-GUID: Cy_WohW-xW8XihTp8cn30uWwVDya8Boi

On 7/1/25 2:33 AM, Hannes Reinecke wrote:
> From: Hannes Reinecke <hare@suse.de>
> 
> Add a new netlink parameter 'HANDSHAKE_A_ACCEPT_KEYRING' to provide
> the serial number of the keyring to use.
> 
> Signed-off-by: Hannes Reinecke <hare@kernel.org>
> ---
>  include/uapi/linux/handshake.h | 1 +
>  net/handshake/tlshd.c          | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
> index 3d7ea58778c9..662e7de46c54 100644
> --- a/include/uapi/linux/handshake.h
> +++ b/include/uapi/linux/handshake.h
> @@ -45,6 +45,7 @@ enum {
>  	HANDSHAKE_A_ACCEPT_PEER_IDENTITY,
>  	HANDSHAKE_A_ACCEPT_CERTIFICATE,
>  	HANDSHAKE_A_ACCEPT_PEERNAME,
> +	HANDSHAKE_A_ACCEPT_KEYRING,
>  
>  	__HANDSHAKE_A_ACCEPT_MAX,
>  	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
> diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
> index d6f52839827e..081093dfd553 100644
> --- a/net/handshake/tlshd.c
> +++ b/net/handshake/tlshd.c
> @@ -230,6 +230,12 @@ static int tls_handshake_accept(struct handshake_req *req,
>  		if (ret < 0)
>  			goto out_cancel;
>  	}
> +	if (treq->th_keyring) {
> +		ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEYRING,
> +				  treq->th_keyring);
> +		if (ret < 0)
> +			goto out_cancel;
> +	}
>  
>  	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_AUTH_MODE,
>  			  treq->th_auth_mode);

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>

Do you want to post this patch on netdev@, or should I handle that?


-- 
Chuck Lever
