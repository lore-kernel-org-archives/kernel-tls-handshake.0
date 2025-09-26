Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138F35957
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892635; cv=fail; b=REbnycOumB0p14jTUAXRPalhCmnPYm1lSzHYoaN4UsA3NBTNhj6+19h7iijrwIFmf1viNYrRRrmMFMIqhKTZOHW3jFpnl/VxcFVGgq/BIg9SgJdT1zXBogoLZuBYyhY1EEnEBi8lrDeyK6odpGCZVM1rs/+0E90lfJrwpgKCpKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892635; c=relaxed/simple;
	bh=L4IZ6ZUk8gjLUTqEW+8BBiqha+HsrEtyPnF7Ug8eIuA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j4drhNz66cFHArEjjgHUdlm5wjvViAs32/EdGFm482P+On0Md/zmm4SXLdnI/5x6BCYNhiU3phSH4zHqkYfITkKUR+lp1e5mD9xAbnZg0izlAUtMm1LitFtgrM8pRRvx/UHqlXY9mHc8w3unshP+QNuKU1M0B202N3ARGkdb0m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sz8irmDg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RmK9cmM2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sz8irmDg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RmK9cmM2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QDH9QX028482;
	Fri, 26 Sep 2025 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=L3AaXhiODBj8n3y3WvSBrN43d66SRcTQDERT824cp6U=; b=
	Sz8irmDgmUcdzPJE49PreHl/moxDqCN7Mkcc71bZH9DQy8Uuo6UuAK8yjXdPdDiz
	BfERd43ywzfL6wX1g12aQ+ARUECF2dDAje08XLlVlTqGxerlP+k9VBOO7kL5HfCa
	+ek2Zq7Z/kREjZK8nwcXTQg/wdHWvAh7XDOfZ4M+ThJzm61r+0wUaAd5j6kozmv7
	TNG5q6/FNyUF71KkSzJ8r+nkkAqFeCMYpvBN/uwBUH8xAjXfTw/kakbGjo2DXZtw
	CdY/Ihw1M+iYPxiamIfOlUoHxO8Zw++P1anyn3o17XpGNxTCIHZmdkxpAsNZuvuw
	QUPPRhJj2MhgK7tLFdFWHw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dtxy02k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Sep 2025 13:17:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QCDZbd020809;
	Fri, 26 Sep 2025 13:17:11 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82jbpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Sep 2025 13:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIrEJLskMmnsx5uLI0uGz5iLNgGG6OFlOGsPuuNSQf8A2H+YD1GAdufZpqBtgFoZ0BkYLY3AlpireLLwf4Pz4fATliPjJTnHT0kuwVvJ19I4Ya5UY0WDNZK+YA4eP+IXMuK1T/0TwjbcZtNxElZSNrz6duKbl+H8G28XVwpk3gAeYzf//oPyfyZ/MDySBfuO8veBG+KTLQr2JguJQG54Mjpyi5w6HHrB6Pm8MmiSUbJ3onXpSToNeIBX/Q4tCS7JIhXoHtJCT8fQHfjfAXYXbouRJ6/h5xFm6HNPLfQhyoVM0fGgBb2pS7f2GbdqzKgPh8zNLpUt3ugVHjkZnO9/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3AaXhiODBj8n3y3WvSBrN43d66SRcTQDERT824cp6U=;
 b=pcRriL6yt8zT9OqvLEgcNV5l6oiclkR10Iob76lZ0xDQDnZvVCqKu3iIU1L69+kkV4xws9On9Xopx/rhvt8oWPbRosKtv0p3SHRoVzJHDZ9N9STD1TbVa5U6LJegNhHj0CHHfBOjU+l9cmrG3pS5R5hkm8EndTGKqavDhUMsmyd9k4UcuX6q53nExqEwYpGFdwuIPPLINVh/Zk/u1OpoMw9AFlwpNgRJ4WmGeiSwmSZof0TzKn/yWByyIxQxWVUbi3lfxOTKexoQ/wHzjVa0i/RhUw7OBkLIpK08BgtQrHaesV5GnMWgJTqgRPhnKu3YcfW7zBdAyr4cL4cHR/gBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3AaXhiODBj8n3y3WvSBrN43d66SRcTQDERT824cp6U=;
 b=RmK9cmM2bsmBi7CShKOFklvdJTFZsJ+5C/temespZ5+0RBWsrZUnVe67w7N9YtYM0M/kzTKVTzwq48OFCa7TdHDw4r0cw6Ro7x74D/WCuqfN8D5upa8buT2tjG3cMNlrbJa9eJk9BO5MlcUCwT/t1ZypF2FXdWML/ntonqcvSWI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA3PR10MB8018.namprd10.prod.outlook.com (2603:10b6:208:50b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 13:14:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 13:14:45 +0000
Message-ID: <99aa1210-c89c-4964-9a68-ecce39c6361f@oracle.com>
Date: Fri, 26 Sep 2025 09:14:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tlshd: do not set conn errcode to GnuTLS errors in
 QUIC handshake
To: Xin Long <lucien.xin@gmail.com>, kernel-tls-handshake@lists.linux.dev
References: <cover.1758818286.git.lucien.xin@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <cover.1758818286.git.lucien.xin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:610:53::38) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA3PR10MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 03936843-58ad-4176-217d-08ddfcfea983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2lhUFc2c1pPNkRDYzFOU2RQMUhBKy90Z1BMdEtHM3dpNGN4cFRJb1d0Z2Z6?=
 =?utf-8?B?V3Rid29aa1BDWk5JVHhPS3RUVmRYcTVmQ1grc0RlSlpBQ2dvY0ZtbFY0cUYw?=
 =?utf-8?B?Snkxb0V3VG1QRFdxNk0yOFpPT2FZbllQUHZJeDBZd2FzalFIWEpPSHV1VzQy?=
 =?utf-8?B?YTQrbkhvN3FHb0kvTGY2V2Jla203Zm9LS3lPenFFeTVhYldDeXBBOERTV0tH?=
 =?utf-8?B?cU4xb2xOcmxpOEsyM3RwNWpad3FNc1VHYXVmazdEai81SWxhSmM5ZlJiKzBQ?=
 =?utf-8?B?VjJtZ21NQWJxVkd4SDZraVRKNVhyVTdHdkcvYXk3VThMVklZZTI3dUN4NXBU?=
 =?utf-8?B?ZC95aFBXeHd6anVYQ2IwYStQNnUxVVBLeEcybWdQWUFTYmllR1AxMGxvU1Jt?=
 =?utf-8?B?Y1pvb25SNDgxNXlwbGloQjR4TStDSjNoUnBMNmxsUWtTUmkzbTlvU1Vya1Nt?=
 =?utf-8?B?SWV6WEw1T2ZGd3hSYnRpWGp1bU9hRVJLQ2ZIbTA0S0tIb3kwZWVtNSt0d2NI?=
 =?utf-8?B?YWZtOHowRkVnQ0s0aWZRWFNYVk5PZWtHcjV2clRHQWdaYlVmMStJSTU5MzFZ?=
 =?utf-8?B?Y2xOQnQ0aXhwbFljOGF6UWM4MEIxZWV5ZTZTTkZOd0U2aWNPTmxYSEl3Zi95?=
 =?utf-8?B?SUJ5K25Cb1ZhMEM4SFR3Uy92VXFHRmxqSmZXSmNGbWZVM3JPVnRjNVo3RkQr?=
 =?utf-8?B?M1JUNnAySEJJSmwvWmxEL3dOZ0JtN1lEcnhpME9ZL1VmY2FWcE0vSm94ZEhI?=
 =?utf-8?B?RFowVmV0eDB1T0ZHVUt4VVpDcFdERFRYWG1iRCtOZ2JYWmhra00vaEZCeDNC?=
 =?utf-8?B?VjAzZEhBUUIzUlV1eXZtUmQyTmg4V3JzZXMya0xCLzlxdEJmV0U2Z2FKenhS?=
 =?utf-8?B?b0JqbHI0MUozZWxGaEN6MnNlYTdtemZDaGJZSTNHdkJrQzRTQXQ4SHg4YjNC?=
 =?utf-8?B?ajIzeVZNTno3aU1qcmpROXpYR3NUQWdJK0dOS21UcG5hMGNwRzJMNkZ1VTlL?=
 =?utf-8?B?SHUrZlJneTlsSFd4VlhVSmRaa1ZWSzZXK2VzaEY2RmZ3eTBCQ0EreFBxNjRQ?=
 =?utf-8?B?b2pQcExKVDRrcUJHQWdoMXpSeGZKZ1lBdUNYZjYrY3pjY2Erby9MNGFFMjMx?=
 =?utf-8?B?U1lJM3lDNHRTUmI2eVBySURFalFxSzVNYTFkTUVIZHdxOFlKbGViL29ZenNt?=
 =?utf-8?B?akFyWXBtUThMT2VwNkN4RlRuQS9zUXc1aFB1WTU5ZjFYQnVZRTNoM1VJSnhn?=
 =?utf-8?B?Z2F3VFg4cGFNUkY5bkVaVE52ZTJxdkFPWVNqTEdFM1ZJcFZlZFlHbjQ3ek5r?=
 =?utf-8?B?VXF5L1BVY21aZ3VWVmhmZWZSRlo5bW5BYWVJRmp0MGNmNkQrS3RBb3M2Ukgv?=
 =?utf-8?B?RDdUTXBUb0dYWFJ0bHcxZkZiZDVGT3V3WFJ2M0pud3hxVGdodmZzSHovYUpG?=
 =?utf-8?B?OCtHWjRLdlpBbzU4T2hyWDdMM2tzK3p4dUhPc0ZzVVFmZWxrcldldm83a0Fq?=
 =?utf-8?B?SGV4U2doS0NwZVk2SjdIbm81WFhWajZlWGhMUlNyN1FEaS8xdDkvM3o4NkVM?=
 =?utf-8?B?elpZc1pEaDZGTzhJTVk5bVpoR0dZNktLd3JKaHRtd3dZME0xdXFRMmJxRGl4?=
 =?utf-8?B?VE11S2xmR2ZjL3F4Q0djUzRGcnZjcC8zMFQ0eEExcDZDcW14M0VhYTA5UUla?=
 =?utf-8?B?b3RsNThBRDN5NVpNK01oTHVlSThOTy9Db1NobldwTEhOTHFGNStZTTdYeUVq?=
 =?utf-8?B?ZzJJTm1LMDcxcGdNN1llZ25Hc0tWUy9NK2xxSGdHMkU3R21jUURlRHNCdS9E?=
 =?utf-8?B?clBtUHhLWXhrdnIwS1VYb21ucXg3cklkL05MR011eHRwMEdndDRMWmcwdk5y?=
 =?utf-8?B?ZnN1U01obzhUODQ1ejdzL1RFbSs4U3pUWWVBZldIbXlmOFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1JBL3QvSVlXRHBka2E3akhsWDVwS1ZoL1BNb0hUN3JianFYd1I3T0lUZVlN?=
 =?utf-8?B?YjFHcXpLOEttc3hNNTYvMm1nYklhbC9zVWdkZGNCbURSak1ZaXRYMVI5Tjkw?=
 =?utf-8?B?WVhIenE3RFhmbzlPUWtHYWhJN05VeXRFeEVpUHZIMWIrMitFQW01NFNHTHNT?=
 =?utf-8?B?dkFoeG04MWJpUUdQb1JBT25BWHY1L3Q0NlNLVDd1c3RLSzBxNU5ad3lxUVM4?=
 =?utf-8?B?eStqWERnN3JBd2hqWStLRUtOZWd5UjBDSEprdUhmSHJDZ2RjYmRhaTFPOG44?=
 =?utf-8?B?cXVGZFREQkk4UU9kNnh0VXBvZmpCck05N21HOUhCZWhEK2pBWm52YVdCdjBr?=
 =?utf-8?B?eDA3Q1lkNlFRN2xyaVpORG9iZ2FrMXJockJTbUVreWxzOGVNOEk0cU9hc1Jz?=
 =?utf-8?B?dm9VSytrM1cySmttbStwNGJwK3JrbUFVeVd5WmhVMnhFQXJWQUJKRmhBeWt3?=
 =?utf-8?B?WEE3d0wzSnJmK29YYktvUUczbGN0czcvR1QvcVZtRk5TcFRoYk5CVHpVUjN2?=
 =?utf-8?B?d1FTSFVuRk01WStwZzZFUjhXM2toQXNydFl5dHZ2VFBsM21KSU1oNG9KWjNT?=
 =?utf-8?B?aTl0dGxpSHhpUTNaNkQ5T0N4alZvZVkyWUN1VXhyTXlhTzU2em5GaGdyMlEz?=
 =?utf-8?B?byttSGhBS1pvN0dHTkd4SDlKdC85WERlbjRwcEZSOFFYK2ovSHBsSkNKL1NU?=
 =?utf-8?B?RXhpdjY4Y0ZmR245WXRlY04vTEJERXUzRWJBL1ZNOGRoSTFYNFk5OUVtS29O?=
 =?utf-8?B?bHpQR0tKcVFLN1RqbU9ER0lVeFNyZGlmRE83M0lUR0txUStCejMyN0VEby9U?=
 =?utf-8?B?akFMNnNheW53SkxWQ1pTbVp1Qy9WSC8xbmVuRXJZS0NHbG1WS2tIV2RkbUt6?=
 =?utf-8?B?MFJYVmtlaGZUanBnWm9LQ0ZVeWNBcXp4NmN3Vk5ZeHRjQlBCZmNXMWZ0Zk1y?=
 =?utf-8?B?SGNPVVBwdnVtaElxZVNNazdJZVRWQjhKUDlQSUxyUUp5QS9sdXJrSEM5S3pw?=
 =?utf-8?B?Y0xWYmZVUzBtcExMUXdtMTRaaXBjZlhqY3R5dFpnbFlLVTEydkFrK3h5bmRM?=
 =?utf-8?B?SUFpejBsS2Ztd3ErQnVyT09tVDdKV0EzQmRrWnVCdy9CU3IvUzNQMG9sSVo0?=
 =?utf-8?B?R3VJZWFWSkVhWXFUa0xRRnR5eGE2SzdWakNFZFdmcEhna1hzL3Azcysya3ht?=
 =?utf-8?B?LzREcldzVEVNWm51Z3B3MUV0U2Y5dDhNYVFMbFNwcGtNclZtR1JGRHJvekNP?=
 =?utf-8?B?ekJyckFwdXllYkhpT1VyQXhjeDlzeW5qSWx4c0c0WHZBa3JucW8xdEhBbTZk?=
 =?utf-8?B?OUwwVUw1K3hsaHZuY2lzaEpRZmZVN1M3RkdGOEVQOS9Yb1lRNkJXekszSGFu?=
 =?utf-8?B?dkh1b1J5NFZqWnNUbWNCME1renVmQ2YyU3JIdTBHV2ppaUFadXFqeE42TTVP?=
 =?utf-8?B?T01lemxyMnlVRzZGYkF4b0JFdE9UVlFnRUF3cnM3eXgwR1RwTmpkdFNjT3ht?=
 =?utf-8?B?Uk0rTDBUYm5Tb1NodFU1aGZwTVd1Z20xQXc0aW1jN3FISnFOcmtDN1dCYm12?=
 =?utf-8?B?Q3gxcWtkbkFvUmtFOFNjL3g0UFlXSW1tSzk5eU5BNHB3bnh5WnEwbGs0TEYz?=
 =?utf-8?B?bERqdE9tZTdDQWNGRTk4U2JGcWplcEd5bnZ4VVRBcDFvSHVxYkZxWVVJazhC?=
 =?utf-8?B?eTRVU2liR2c1UlVNdnliQ1NyblY3cDg2NGM5VEM5QmxFTEpLcjB5RTBIM2Iw?=
 =?utf-8?B?T1pYTld2aFZ3dkg1Tk5mVlJLRlR0cVVOSnZaaSsvSUpVWHRYR2dReFNsWXFS?=
 =?utf-8?B?bkVNaDA2NFkyOUw1c2dBUVBXbHpUQW5xNUxFbWk5THlqVjBmdXZvWHZmQWhB?=
 =?utf-8?B?bXhhd04waW1CendoZ09RK0htSnZScUhYQWR4eS9PYmlFaHdTUFp4dUpFd2dE?=
 =?utf-8?B?WENuNjhRcEZPdGZ4b056K2hYKy95eWpQT0lodnkvZkh0OGx3bmtPOEw1aWtj?=
 =?utf-8?B?M1NzV0dScGFnZ2svemd0a0xHUWROa05LazA5R29OVE1MbEpiU0c3UWhpeG9y?=
 =?utf-8?B?b2ZoY2NWYzI3emFrUHcyQUVmTHBSZ1pkdStZVVlOUlZBcWZNS2pkZE9Ma3l5?=
 =?utf-8?Q?PriE2jDGhBJmu3P9lDeZyl+ks?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V+Ckj0M5hPq54cKcXeki8IUCGWivtAPCVMrdN4Y9uZVxCGZc87I1tn3pSmoBwgBYcfRGI1XATywCq9FtTtxeZ415lP6vWAk4FjSrZjpEiblB3cYhNO10qXCkORUGGvaSocglC2Sj9gTMwot90FSIz8WGC1O+pY18H9iimdbS4aZGyWuXIfRUliSX3dHpEyDK2Aa2RNXfASfG6sehoHplxOCROBZbmyY0eEFSz5NzEJhiL/bi2sD3D4GONIreccTAlvI8YFEtdIlwKai1qReNRGLi4pwj6LdC/jLRv6+SKJq4C5IhXtBjl1kbfZTTNGlsdhBFHXgOBbdI7ePQoi076DqSXGHVzHg40RMdt9Dbwcv83Fz73beWcPX6L/YRA9iw232lsk7YMH4bSbDWJZyQGJAFfEzBCIkd3V2KTRSEtPOL8kFwx0W9qY50YOY9X17hOJsyvrGBRxrG/p0xNrNK0XDTcuc2oLPO0VQKbehM/w991X2z8Mx1p1Jf9ALIwpCsBlpdfs+pV1P5aCi/yMwXbpcslEUD2YSYadgHtBa5WbsN+daUWzSvtM3R81T2X95f+S+Iw+QP6sWOUYUJSNLEy7YKsid4FzAko9hkFAp/iUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03936843-58ad-4176-217d-08ddfcfea983
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 13:14:45.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJrGA+OhttX39ZDiyDSWi1IWBMstWYDgPbrGXy84IEIsCR/6vad6IveBhppYn86GDRc+xs7gaahorSzgdp2ANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8018
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=778 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260122
X-Proofpoint-GUID: 6SaJauHS1FXiRKPQMFa0BO2CDGSU8ArH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDExNiBTYWx0ZWRfXxmVBqNLOao7s
 okrBOV2ojWCBFDyrgNVEI52QY90/AhsTQuRzifAtfZ2nUd3HvxObBGtBI0rdZu0b+htEvhUU3qU
 O7SGi/kSv/O8r0UkNbakO7z1Wl7R7i5qaMijChomG2Wpayv+meLERE88k5Z4imKc3XVSMachgMQ
 RrVrZM6R1dS6iZurjSINH90jbJyi9sO426b9IB+mpQmpz8KUldNFriKlbkD2zYmYGx8n8K4wimZ
 w4s3s0JxapYhZC2IHxkKlrsotKWaN4MX1eBC+5YZhT4sJQIOD1qIONMbm4dJm41HUPAWFXDP2Dh
 8cm3GPG5PpLYGmpuHIkzqZFqBi6CdrFmLapPVvJ45en26y5YiAoflyfDFQeM4ktAw6bvK1sgizO
 XVrwUi7iuCoBk0TzcymfRSM3CJdw8Q==
X-Proofpoint-ORIG-GUID: 6SaJauHS1FXiRKPQMFa0BO2CDGSU8ArH
X-Authority-Analysis: v=2.4 cv=L8AQguT8 c=1 sm=1 tr=0 ts=68d69258 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=fyWBFMhNByemueSScbEA:9
 a=QEXdDO2ut3YA:10

On 9/25/25 9:38 AM, Xin Long wrote:
> This series aligns QUIC error handling in tlshd with the TLS 1.3 code.
> 
> - On GnuTLS failure during session setup, log the error and leave
>   parms session_status = EIO.
> 
> - On GnuTLS failure during handshake, log the error and set conn
>   errcode = EACCES.
> 
> Xin Long (2):
>   tlshd: leave session_status as EIO on GnuTLS failure in QUIC session
>     setup
>   tlshd: set conn errcode to EACCES on GnuTLS failure in QUIC handshake
> 
>  src/tlshd/client.c | 42 ++++++++++++++---------------
>  src/tlshd/quic.c   | 66 ++++++++++++++++++++++++++--------------------
>  src/tlshd/server.c | 29 +++++++++-----------
>  3 files changed, 70 insertions(+), 67 deletions(-)
> 

Thanks, these look great. I've folded them into the series to fix up
the Doxygen comments, and posted that for comments.

-- 
Chuck Lever
