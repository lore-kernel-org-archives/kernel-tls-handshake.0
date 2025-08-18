Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F921FF4B
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524638; cv=fail; b=dFMdndVIPq2f0tHIN0l9ZQTgo+SKFsxy7CzLupusHZVEmpvh7L2MODApPOBFxPBBRtdy3ChJxQ+jVJhTaNtf2CJTaJVENMrB/lL/ZNNVnIB0nkDRXVekaF+d1DO4VTAWXc8XMIfdsK9RLChHBsbIMVSPVVR4PBgi7ZZUJUIKLDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524638; c=relaxed/simple;
	bh=wjQTgU5TKbKlUCc1ODRecUOCM02Atp/txmPVz2n1ydU=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jsM9Z4ywW9lP9k5w744N0hI0jEXV/rmddgrHJ5jOxbP6hj2tSNYezogDcUsj0X2UEW8SkGnGP6ZvYSevYDh6cE6OWbCnvEi2h+PxwnycitpAapB+FBpZZPw9C50JRQUwTj6AEypUXBv+/I25OklGOcTfi0uKO9IenQle8xpTJgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PPhF6b+u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iZv727FO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PPhF6b+u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iZv727FO"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I9f0uY016531;
	Mon, 18 Aug 2025 13:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+xXa9jaGF9WMq9hr7+sShYD+n4YvvJotUXyQAkA68HU=; b=
	PPhF6b+uapscNPMm4RuEGp2dNgIHUnRb0J/6wUIhwhRUrX7aNV9wxONH86lnZSBR
	lyW7fNcgve0AD9k6JFBRpPm4CjC6T5kB9/oYjjf3Bb+TN1YakihiWbVJp476Q/Gn
	BqKFFtHaeTgPLz/TG3ccqCkonjgyfT9TsSqneXvjlMOkOSQACYMKbN8gYvocbd1N
	4aulU4uHh+kqip8Wj1fmgH8XmaP9HNv3dXFNUWIHh7iW/Fmp0URJ/Y2IEq0AQkNM
	9xEHTXNEpPdsEA86nOwCmMtXMHlo8uOzRKtHUrgPgQb6ZvW169cVE9kIyFTm4RNU
	HKoUzJzsHunrB084rBts4A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jjhwu2xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 13:43:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IDLrZR003576;
	Mon, 18 Aug 2025 13:43:55 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge90uh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 13:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xfb5ESTxVhvxuCSKAK1C6DgMmvqzaII9MbnMhjW+NMgcLVJxLPiLkCBfwnRFec4X7K/Lf9AybeCfzrilgLznICFX0+P5ofrwc+CJwC9k+vOI+I5Z0wKyGsqhNMGwvWRqwLXC1xNJvqQO+1Izb8oaAopY1WNlCdnI6EJQImxkazaN5VXanPAn8rZYRw7Pdgf+A6/qIb2okRYFER+x63l6semIahPq11tuj6lbklM6h4sGcZYqSIYwX/qb5DkZnhPPI8YCeXZY2ZG8RjZ+dZGiijRc+gqegdm/mDINieh8V6/qQfw/sSae1ZDFlxhf/nC/bDSze3lA5nh72j2WqoUcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xXa9jaGF9WMq9hr7+sShYD+n4YvvJotUXyQAkA68HU=;
 b=Ik6d0+IjvBQyKE10X96iPsvyegrogAAqdGaKADAjXUpT2d+iKCHK255ILTa8DOI65SDG9duQc3MqD3l5lvBZaXw8i/AmVe43xhijoVgIjBGBEsbTpEk9gq5pQ7aJ460HyFgaEcW0FVFxN3Gu6Sj9UKkhWyqFqMF6x55gTbjEgxb3E7RQyUf0+FL6wq/BAgFS4/TvHsAAmY1ifJGAht4SxHbpR3VDtB0p7fN/4k4bzCI4hk54WLScAL5aj11fJWV4YxzrnsOBuiBNwUVg+IvB+mp//W8fAFz6da+Xb1h7anNNH3f4cxdo1ln3nuW8jV20bCQLESqtW7aoJx2LwDYTkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xXa9jaGF9WMq9hr7+sShYD+n4YvvJotUXyQAkA68HU=;
 b=iZv727FOkdYDX/x4TvxQSZlSbwRJk0u5J0EUU92YN2BCN5+/tSAlzS9Me+K4iS54WWQw/tEbSs4Qg79UrcVlxEY0NDHv9Wf14alDPjTXQZRG/oNU6WIbRsnmYrXgiaeI4NwOGzXs6263hOkaISzyyj0Naxi7TNoJsqnFNSpM9Xk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6129.namprd10.prod.outlook.com (2603:10b6:510:1f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 13:43:52 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 13:43:52 +0000
Message-ID: <a793b1b0-18d6-4714-9879-31c686003c00@oracle.com>
Date: Mon, 18 Aug 2025 09:43:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: TLS session tags support for tlshd (rough draft)
To: Hannes Reinecke <hare@suse.de>
References: <6c65b9cb-82cc-466e-ac48-3efea7258fe9@oracle.com>
 <98e1f182-4f5b-4eef-ad9b-697c846ff07e@suse.de>
Content-Language: en-US
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <98e1f182-4f5b-4eef-ad9b-697c846ff07e@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:610:20::42) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 79277f47-b3c1-46c2-b4c3-08ddde5d448e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2dQZHc1N0pLRkFXdEU3ZFhMdE1CVTdNVVVUUFpmcDFtMEtTSmdXZzhZM1pi?=
 =?utf-8?B?aWJnM2hJbFlkdmU4ZU45NHM5c3N5OVhxNFYxdlNWeWF5R01SU1RFZm56eENV?=
 =?utf-8?B?WnNCcWhUVGFPdnJYNVgrZG1PaC9IQ0R6YUpRdnFJRHV4NFpPaGExQm1Ib3Jl?=
 =?utf-8?B?Zklsd1lSVit6UjJtQStvenBQQ3lsby84Nm13Rm1yZ0djL3NSZWVJS1V5M1dK?=
 =?utf-8?B?aUNOaHFkMEpGQWJJa0d2bGR2MnNRcVRvLzZhTWhyVndGaGVYU2EyU3pESkNK?=
 =?utf-8?B?WVZTODlIOGsrN3ExK1pJYWZySEpYN1FaZCtDdFpmZ0J4UjBIWkJsOGdSL215?=
 =?utf-8?B?U29FbE1PYTlrQ2xiZFozdWdvdzlwUzBEV3lsSFJaVDBMaDVCc2MvSk91S2o1?=
 =?utf-8?B?WWZqTHVwQmFWcnB3LysyS0NoRU5sZDhvU0JpWDRML1lnRU55RjdNby9Ub1JJ?=
 =?utf-8?B?Sk9kdEl2UDRZUXlqdVpJWmtIckxhRERQamJsTExCcThUK0JnTXFodnNreDlr?=
 =?utf-8?B?SlkvaEd6aytxVUVYTzhFb1h1V2R3ellhNldSNC9LNEw3MFhCV2ZrWW5TSnAr?=
 =?utf-8?B?VnVtajVRQXRDTFdmajE5UFkvT2xadCtuTllWWlJVMFVjMUVWVWE3ZHVCelll?=
 =?utf-8?B?V1lyeXRvSExRenh6YXQ3K3M4dHhuZkR0YlEwdzI3bzN6c0VyR3Qyem1sRitE?=
 =?utf-8?B?K0VicGQwUDV5U0w4OW00TGExM1czaSthbmxRS1B4bmZOUTZ1RVZYZE4wa2Jw?=
 =?utf-8?B?WUVndWlxY2U2cy8rTEZtc1dmd1dNa2x1YmVVSnJLenkxUzVYdWF1aWwvc1ds?=
 =?utf-8?B?RnI5NlZ0SlpVSjdBbFFxeDBQQXcydEphSkVjaVpXNjl5cUd1dFZEQWIrSVp2?=
 =?utf-8?B?bjZIeDZrbkdITVJjOEFSaDZuVDkvM2d0S0F3NWdGYjhEbjNETHAzWk1xaW9q?=
 =?utf-8?B?NXYrYkNzYkx4SDNmT0F1bkN6KytHUndETDlsYWVHYkUrWm5JM1JLVTl3MkNN?=
 =?utf-8?B?UzJYa1JES29LQkt3aE9RNXd6QkR1Y2Iva2F6T2psQ2h3dXRqYVd2ZHBJVGE5?=
 =?utf-8?B?Tm1KaUZOY053RHJaU0NnLzE0ckJkMHoxZGx0V1JIbmhkbXBUUmg4NnQ0QmhD?=
 =?utf-8?B?UDUvZDUvNHJrdmVlU2wvTVRjMnBVNU92ajN6Z0tRTVBOWSsxSHlXak1GbStY?=
 =?utf-8?B?Mlp3Z2JJSHVYYVJrd2F4bDcwenU3ZEVxQzRTV0xhVnVPU3NIYm9vS24vWVdH?=
 =?utf-8?B?bjNwUGJMRk12T0luOXF5T0YvY0tUTnp2Sm9GRjlINTZqTUNqVDljU29kMFdY?=
 =?utf-8?B?dEJ1N2cwcElJOUZKMUpQbDZuZHNaZ1lJY2lxMWxUS0VkVnp2M0lxdkEzMjV2?=
 =?utf-8?B?WXV6bm5NbElMTkRFSXROZGlkb0lsM2QwM1BLYkZXbnRkWmkxZzhrNE1NTy8v?=
 =?utf-8?B?Tmo2QWxQRXUxK1ZqRmZGR1pNQ2xVdHh6cS9rdTQxM21WdGt5VnBIaUp6eEJX?=
 =?utf-8?B?ZkJ2OEJzaUZoL0JTWHQ5c1l1UWxZck8wT2hhbG54b0lBbUEvcmM0VEtOY21a?=
 =?utf-8?B?NXhnRDdrMFhMSjVYZDdnYmJkZExJUXUweVlxUmNqSkt5c2lvOGtYemZ5TGMw?=
 =?utf-8?B?SXlhbWRzVGJCRXFGSDhTZ1M0WENxZkk1enNFcHJJNVFTWUpFdHZrYXYxbFJX?=
 =?utf-8?B?WjFscmVNRWdEVXJzMU1jVC8vMlZTT2phbzNGYnVxNVZBSDhjWlFmUHFVazZB?=
 =?utf-8?B?R0JvZGpzNkRPYTVJNytXd2ptNzVTVG82TzNSRzFnK25XR3I5TjBvdGcvRjRZ?=
 =?utf-8?B?NGdPd1ZZV3hkZGpLeHZoQW5hVFBUWWdJaGFtK0RtZlE4Y1FyTzY0NDhqN0NW?=
 =?utf-8?Q?XVEAwsNaolkje?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVRPNjBER3M5SXZPRjdNdE1jUFpzeE9xdXpmc3BYaGp1R3JwTTdTYjB1Z3NE?=
 =?utf-8?B?Vm4yVzRnMWxwWmVkYm9SVzd0Vk4vVTVSdHJ2eW9rdlJ0bmhSYXAyKzRqemMw?=
 =?utf-8?B?bTVkekg1RGRxclBxQ3pabEJTZGlGV09MajZudHBKYjdjdmxIb1hNZ1dJWW5N?=
 =?utf-8?B?ZVhJN21rQVA0RTZwdkREaTR6VnVmWktaMXhxM1JJRDkweTMvcHp2bmREdStn?=
 =?utf-8?B?VWU0ektCU3ZTb0c5dW9GdXd5TGFkVHd5RnBBNnIxL011VzVKdkp3Wk5pV0Q0?=
 =?utf-8?B?ZU1CSlNpMTFHb2R2Wi83cE9ISFFXUnVHdGMwT1dMRHl1Nk1XdTVlRHdoUEJV?=
 =?utf-8?B?QUhOVFgyZWRWRWE2WU5YV0huaGxPUFJqbC9DTlBIekpDYUU1cTlmSG01T1FG?=
 =?utf-8?B?bzN3UXcwTGtDOTdRN2NVNnNpYlBtMHdMSEo1UGx4ckNvcjBDRCttblJXS3dt?=
 =?utf-8?B?NDcrYU9TWkt6Myt0Q1NCRndYQnFHZTFzUnB2UWY2RHBKRkpRU2xld2xEOGJ1?=
 =?utf-8?B?ZVNjS3daR1BkS0Z2VStLakh0Qy80TXpYTXV2SjFzOWNNY1BoWUo1aVlFUEdi?=
 =?utf-8?B?VmJzV1ZacTYvbWdKN2dQV3RNYTdMM0ZYUTRqcUhFbGxhdERheUtvMDhjTmYx?=
 =?utf-8?B?NVdSa20zWjdBUm1vODVaTnVmNzRld0ZXeGdDaURMbytySTM5dkJIL1orQTdQ?=
 =?utf-8?B?MklMYXh6MFV6MzM2VXNQTzFJMzNkQzF3UW9OelRMTFh1REdvOWFYQ1FTRHM4?=
 =?utf-8?B?em8vN1JDaXIzRnduZjc5aFI0S0RReFBaVnd5SkFxQ2paOGlYNzNSZmZNVk40?=
 =?utf-8?B?aTVtQ1dDMHVqN2l0M1R3RWJnN2hXaXJMS2VpYlRNRnk3NWhLMnVjWlh1OTZW?=
 =?utf-8?B?K2lHR01XZmFkTzI5azN4YnRFZzZHdGZYTDZZc2xHb1RNSVp1dGJVQzNTMENl?=
 =?utf-8?B?ckRsTko0ajVlM0s4OFJCaEJHZ0RVYnpDZHV1UUtuNUs4NC9QSDJlZkpsenVJ?=
 =?utf-8?B?Rzg3Y1A2YXBqR00vMDdXVS85OUFRLy9yWkVKTmxPZTduYk0wNURFbzRpK0Yx?=
 =?utf-8?B?WERoYnRPU001clN6bVNpYUw1azRFM2d0eFhKR1FNZW9mRTNuN0xUT2pycGdW?=
 =?utf-8?B?ZlRySUtuWGtoY1hlTGxmTHhjSVE3QWhCT1lnUGl1RURRdjJMcUQ2Rm81dTFH?=
 =?utf-8?B?V2lOUGFTbVlDRlc2bkE5WjlHK05BQU1tZkhhT1lVMURuai9ISDlIVlF6cDFD?=
 =?utf-8?B?NXdHcEk5N3pBbjdtRXAxdFB6b0NpUXZwVUZ5dTNCQkI0b3BYOXZ5M0E1U1ll?=
 =?utf-8?B?U3psQ3UrVG5Gdkxhb1U0UzBwR0VCUUNMVThid1BGSFA2dEVTazJSeU9sZ1JL?=
 =?utf-8?B?UDdwa0k0bk1ZeFRhT0R5SzdocUlIWXE4bG5JdkZXaGhLcU1iZWlidmVIR2R2?=
 =?utf-8?B?bVBEMVJYR1pNTS9xWFBPWENsbE82ZXAwYi9ldmEwdncrRko0M1dQdVNvUFZz?=
 =?utf-8?B?bHlMTktZUUlYc3VTQk4zbmZjZGg2NHBQa2JYNmNzUGwvRjlUVUJXdUlCZHZ3?=
 =?utf-8?B?T1M2TnlWWmdQRXlzOUJhWDZUVHpxV2ZUTmVVdlgrd292SnFaNWdlR2ZrLzQ5?=
 =?utf-8?B?b3VlQS9UMzBoaVpCUXNLUFIrdGxpbjh0S3JRQjJIbGc1SHdKNnJxUC9jQ2Ir?=
 =?utf-8?B?bG5pbmJFN05Oa3pkM2lhdURRRlZpWGNuRjhSbDZRNWRIZnBNVWZwT2dwS3J3?=
 =?utf-8?B?dk9mR2ZZOE8yOWtSdk5Lb016MUVzZXJENlhlYWZkMVBid21WMkYxQmwwSUZI?=
 =?utf-8?B?QXZBZ2M3UmFaTGlBa0VBZy9HZDBGWGtrMVhGRTdXZytRV0dLdklLYTJDTXJO?=
 =?utf-8?B?U3BUSHRkbWZYNGhSQzlkVVlHekJhQ0k4MHM0QVdBRHp6bXhPZTV6U2V5N1Bk?=
 =?utf-8?B?cWp2eGpsSm1qL01IdDF5eGR6aGJRSThELzBIZGpRMDhWMkdKUk1DRXdUMWhJ?=
 =?utf-8?B?bVlKZVVOdm9DYlR4U2M5cXd6SHVmWnFNL1VKRzNVeUFyLzh2aG1XbklzSGY5?=
 =?utf-8?B?SFV2aWN5bmRSV3hMVk9DTGY0bmx3dk5aM1FUeWVZVi85bTVBeXBudVhMVElL?=
 =?utf-8?B?RjBjZmNneXZBamZRdGpka1Z6cG5YR3U1NFM0L3NsK0xZYWJ3RisrK0VZMW9G?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D51LAMbCwzzEDsbmYdShDEHBTgravDEU7oMgjWPXFcgsu/nxFgvU+8cGCcoocWDW2bENly9UNRVIt7PiSPcBGKLbCtg883tWvbJWOxV8AXCLdfbv0hJfKCYURwUcoWAoFEuxCND9at7+U0bZr/CP1eKDtqg3sWCrTWTNYssbyR83EIbjuvEn0ENxa5Imd772PrFue5VRTwZM5wp/i+nGjOz9knp6icuDm5+CfBa7Wp+Nr52hqXLwpTMMN2aG3EM4ULUgbFfjHD1hXpstYBmDx7Ze9sJjM2J0WeI52NfJTeZV27wdrOzsO8ZZEzfmLwmqsqDlgbhFMFf6IaG+C0m8GYnz1BlSrInqbQtxq1V4WeC2bUcdjKDlnk1OUsh16HdAhWOhUwL8FciC4QtQ7pBp8yoX83Zyq51bZEJOnrtu/+esjgqWbOPykdZlnTFSjerPM8yZ4Ly+RuAnU8rkvqHBcWA8UtqPgCZnVnxkrGRB59mDfjecrKogMKD0Ly8NGBtCcYdQOUMUtIBE0KpgDUIWQwZ8l/s0/V3lTqBM23kZ+OG6B4Vf7ZUd30EV9r9yAIAhWq1AHH9sXmBy0wan1M2xFo00D573wv1Kv2620gsM6GI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79277f47-b3c1-46c2-b4c3-08ddde5d448e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 13:43:52.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l1t5nuQ0e/hjUbdoVZk0ATQMevJ8Dsr6l1sPmt43LmH6vC7HMDaT9GCMqjXe3YayWP+kHdoN30wnz7LLkgdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6129
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180132
X-Proofpoint-GUID: KxAIjVlrJCg7AEmUS-J29oaGr1-WOaK8
X-Proofpoint-ORIG-GUID: KxAIjVlrJCg7AEmUS-J29oaGr1-WOaK8
X-Authority-Analysis: v=2.4 cv=G4wcE8k5 c=1 sm=1 tr=0 ts=68a32e1c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=kebO5z2UxBZ-2LZbfokA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzMSBTYWx0ZWRfXwb/qzJFDzfEs
 Xwzg39HbHBzXmQSktO4e7e4Ut68niZfNpGuTkef/orMiAqbhIxhTv80ol3BM59fHxwNnlI8tr39
 0bnRNnbdUqihrLmIbWx73zib3ZomVkTrl7zX0UNkvST3eekS/NnqHVzufz5/s6b25pdEMbpaF3W
 m16RQMq6HPbccVj+rsJvPgFZ9rXGvUGEVMVwXwNfXzWCTBKcBWM9oEMaycMat2FBd5lWpXvUSmy
 6jy/jCJjpXlp8e9YZYp0cyRUWRHKy/a9MqHmaX1WcCwhOCNsGqZoKYezrayP2ak/aS684j0Ffdr
 MjJRjsnEGGHbKr17noKMoSScSjNRl8kAxNMtbBQvI9vyCbV9Sam3SCwf00AMormMbsRd0MEcaw4
 wRrKbXFTuWVdqDcGbUGfpbrGjtyEFLKEjeH89ulx9HKfddFgbT00DbhsHzbG+fgE3sxSUzB/

On 8/18/25 4:52 AM, Hannes Reinecke wrote:
> On 8/6/25 19:51, Chuck Lever wrote:
>> I pushed my WIP branch that starts to implement TLS session tags
>> to this branch:
>>
>>    https://github.com/oracle/ktls-utils/tree/tls-session-tags
>>
>> One of these patches has a man page tls-session-tags(7), that
>> explains things at a high level. An example set of tags is
>> defined in /etc/tlshd/tags.d/tags.example (added in one of
>> the commits).
>>
>> A lot of it is working, some isn't. But these patches serve to
>> demonstrate some of the usability and coding issues that have
>> come up while developing.
>>
> Ach, well, I don't know.
> Yet another certificate validation mechanism.

Thanks for having a look.

To be clear, this is not a certificate validation mechanism. The
library already validates/verifies incoming certificates.

What this new mechanism does is examine an already-trusted and
-verified certificate, and adds tags based on the contents of the
certificate's fields.

Kernel consumers can then use the tags to make authorization decisions.
It avoids the need for these consumers to have any understanding of
x.509 or ASN.1 -- the tagging is handled by tlshd.


> I would have hoped that we have enough validation methods already...
> At the same time I do see the need for a selection mechanism
> on the server.
> 
> But it's for X.509, so I'm not that concerned.
> (For now ...). If it works for you, fine.

In the next version, the filter types explicitly mention x.509 to make
it possible to extend this mechanism to other handshake flavors (like
PSK) if we want.


-- 
Chuck Lever
