Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC029A2
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181033; cv=fail; b=qZB+f1aCBgpYlO8pZeuyIE8RfbMrFWJcw8dP6wlLnbJ8ww0l1e6PNHaWr0lNJj4voOEms2T1wHJ+Yw38/GPZEMHt/OfgBXupClHEWzUYe0QUKP1cxCibbNtuCOuwmyPiqyq2prdKi1qoIhC50p0im9HQOQ/489y7eQKvjO9Qwzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181033; c=relaxed/simple;
	bh=+XFWVMnfhUlxityeQtPYbVOnO9JylPxh/Jikf+jQ/BU=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BJoLnH5AvwzAu3zxZuopt6ImciDmEIwlgQNsRyI51bM7BGqU3Z76M0nFKIPmcKaDzuY1d4q4oeZfl6xJ8qYh1Y4DqT5ozGeeyyKqSaNYOnd/q527XoNxurkWy+9gH5StbczpI0HBRpsMSCKuo6GlOehcTTl34K8v/AdQMslzwVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WCOUHlKe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NZ/VP9Nc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WCOUHlKe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NZ/VP9Nc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TJMp2O005650
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 20:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jlpXdqUZhA4gP6tdH12wJXL/rAsALOnHNQouW8OLBQ8=; b=
	WCOUHlKeTuA4C8uXe81uX8VuGQ/5TM1Bd358PA+kFfVlBqgnhajbIja+25BfNkwp
	sFLpI7NySCjdOO/moN1StDrell8txtMex9pyLmWWny3WHgKbwh+Ey+2JmgEPnnEC
	R0TYhIKD8QThch8OyN16L/0ZtmjcIr0+08YonfprU9U1r0mds/c4hhgL99pH7i/w
	9tp0JRBoiMaKllVjkdU/Q0PbGRde7yRRIKEOpu67t4G3aIoXvGjpGmmVqwKpp7bx
	u8DXOlXbUCBxbxiWXanc2MojHQaZThDh+aZZ+0k96OMoL1/D8159MAR21ChiszF6
	VLCeQh5l15kFaro5GyggVg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fte0g3fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 20:03:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TJFSmG002813
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 20:03:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdaamyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Jan 2025 20:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOPsVzg4vk/g25rogmppYOvtaCyRKE0uxRHyIhvt9l76V2mAjEQ0r6o7wrhqjkdA/yi5cF/O4HgSgkaBqoNqorgXA/VQD+Atb9imA64wp6+irkoISot8hhH5xTtRPi+2KZFdQkUAnRmTg6K6bgjSbTQ67pSijl20Wc5TB2MolV7oJv2FYa0wDerzTMG+CJGKCaN9DvtdEVHgCYhDIHgfVUJOn4Yz7+jKPHiu4nlbGyqTXCLd2BzzrHRea5JPyg/RZN7n+Nflnob7hzMjvswDQIlufFluA8DN4JF6UmFEzujKhiDqFBxcJXMtSv2P8REuBvZU5dopj58+CIEVNTiBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlpXdqUZhA4gP6tdH12wJXL/rAsALOnHNQouW8OLBQ8=;
 b=JJ6MRr2uspRdrkUL+LCFPzJLn5inIlLTvPkcFOc7PxW2H5JEhiPlBdlG3x9Ld7hiBSttMwnDKrCHfkFLS3usCOkk7Nb92kr9Vc6RhTkEGJ9Xx98fvfgBXxoWr+1abkXDurG0vHREepoYuw0yhsCQskj7zy7O2DgtjlbQDv5BHg00wg/hkhMOzyzfi4/T7EPUii3jw2IwxA8g0V7e2gQojJnQ1KeVMdSBqmzUX/FcUVRzcb7uYiURHtoQ6NScHbOqBBZN/IFRxEx+lsSicXdxC874JBuRJC3GBhT7fiaTjldPULZPnuz0QZ+3q9mEdpYpaWU7WckvZMAXIBF2QY2spw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlpXdqUZhA4gP6tdH12wJXL/rAsALOnHNQouW8OLBQ8=;
 b=NZ/VP9NchgCDoIaw/7hbxQVGuJkvlvbY8XBgoahcjIJudxA17/UsD8l8MEwd09PUs7tEejCDQswroXKu70pgWZwOrkCNyHeEuh/kXt5wqEjt0xyCqxZZHthnlg2EVk1HhlKxHUaqzbbzWvFZef6e9Wjnfit90IQIz0QdVOeb7DY=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB6098.namprd10.prod.outlook.com (2603:10b6:208:3ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:03:47 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 20:03:47 +0000
Message-ID: <c6d66de9-f66a-475a-bf63-ae5eb15ea85a@oracle.com>
Date: Wed, 29 Jan 2025 15:03:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Preparing for ktls-utils-1.0
From: Chuck Lever <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <77ac012b-0ad7-4aa4-8b27-7a837c6c03be@oracle.com>
Content-Language: en-US
In-Reply-To: <77ac012b-0ad7-4aa4-8b27-7a837c6c03be@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:610:74::13) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 635c1848-c673-4eb1-0e77-08dd40a00a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OS9GREVFOUh4Q2FnRGtUYzNkMXM5cHNsWnZHeWROWnFKMUNKVEpIWVllVzVp?=
 =?utf-8?B?emx6ZTRFY0VyaU9Ia2g2aXBsYW9NNmRMNlllTFRkOTJSWUgwcFF4cTFyWUZq?=
 =?utf-8?B?VnpCbHBDdGNWMkpJS2ZaQ0xXVEVZbUxJSnpwcW40emo0Q2VVS0VPT3l3Y01L?=
 =?utf-8?B?TzF3aHRxaDFLZ2FlYi9WL2d5aGNMcHFlanBMUUZaY05ldkdJbVUvckoxbjBu?=
 =?utf-8?B?TGM1ZG04cnpqYWdYUHY0MjkyZnd5WUwzODh1M1I2NFk5SGtQY1lYTnZDenlV?=
 =?utf-8?B?VGhlOVlKUC9KUXIraHkyMzJDVnR1NG9uU1hqV0RaRVJPeU5CWnI0WGQybytC?=
 =?utf-8?B?Qnd1M2hPZWVCQ0hRb1M1ZTlTbkZBSExBS1QvdWJWY1cwcFdoR1FhR3p5UDFL?=
 =?utf-8?B?K1ZETkNSTTJsaitlWmlJVmFyM0FSbmQ1WVM3WTZERlJMbkNaT2xsZEZaL3dr?=
 =?utf-8?B?Y2RWdGtMMExobUpCTWhjeEErN1RkZ1U4QXhraUpERlFlNzgyeDYxSWxIVVpG?=
 =?utf-8?B?WlUvRHdGcUk2L0tOeFVLNlJjR0Y3NzZEcmZmVDhqUjZuM0djNm55U0NKb083?=
 =?utf-8?B?RG50TS9BMTdLNkU1TFUvbElIMmRUMjlvL0RpL0M3OFZJTGZMWEVrTkR4eDRB?=
 =?utf-8?B?SUhuYmF6ZXdqOEFRRENjYmlJbFJVMHZwSWdxNE4reVFUa0JDVGxqZGdTZTBL?=
 =?utf-8?B?dkw2RmEvVFlTY290UW9sUzVZTjAvdkRPQzdxM2ZTY1B1dVhoVUZ6NVhqYUF0?=
 =?utf-8?B?czJBRUtsRFRTZ296bHNoMkJkRldMTEQ3UDJPbEl1ZHdDWlQrMmRMNEc2eW1B?=
 =?utf-8?B?WnpPNC9DZkR1d21jT2pjTWJzcXpKcUpwYTJwb1lyRU02WFdvRWd4MEMvU3BG?=
 =?utf-8?B?N0loVlhnNC83L1Z5eVdyanZyaWFHOWs1NHZsaHdsR3hjY0RHSUMwdUVkZ1ZM?=
 =?utf-8?B?ZERiR1J0U0xPZkZ1V1hJVUp2VkVLT3BnWWpkcURObEY4ZHVTVWdLeEVvUmNN?=
 =?utf-8?B?ekxtY3RsMHlESnZCV1ZMcXBnUGJNeFYrM1p6MFA1Rlc1OHJITWhDemV0N1ZB?=
 =?utf-8?B?aVNUZzJtRUZmSVdjTVRMb215MnVoeGFBdTEyR3FoRHdVYmVXOUo2cWlHYmhD?=
 =?utf-8?B?ZzBLVEV1bWZ0UDN1aG1ZalN1ZE80bzdCUjBqNVZ0N3p0bFJxVSsxdkZxeWZs?=
 =?utf-8?B?WFRDVm5KWmJUdXhNMCt2OEtzeXh3OS9aaTlZUWc4VmtaV1plaXkwNUlBNnMr?=
 =?utf-8?B?UzBiM2s0QnkwVFp4K1RTcEVqamplV1VPTW84MkJ3OU51VUdROWwxMHIyS1ZL?=
 =?utf-8?B?MTk2ZUN1TlZncTBoeTZ3Nmo1cmQzNFVnVm5vWk05ekVjb1padTgvV0ljMHRC?=
 =?utf-8?B?Q1dBekx5SE1YQ3lCSTR4Uk4xWUdDMjlXR2NUbGdoSjhSMnVLYkN6UVBNM0xR?=
 =?utf-8?B?R0hmVnoyQTNtYU84L1JPVTMzakZkd1k5d0V2SmtYWVRTRWI0dkJVSDhKZUlD?=
 =?utf-8?B?YjcveW95bUdyeDNmalpldXpad3E1K3ZUMEZJYzRGck9sdW8yNEFNV1pFYkgr?=
 =?utf-8?B?Nkc4NisvbVhYWjNoZ1JyenhpYWF5TEhHY3dEQTNiK1JNdXUxZ2NRd3BVWXk3?=
 =?utf-8?B?RkEzaXQvR0MxVHQraXZzblBRUmJabS9JaStjQ3hkR0JSRDBFdkJEa2oxa0dB?=
 =?utf-8?B?ZGt5bi9BckJRaklwdHQ5cGdXenhhdThZTTM5bzkxN2hoYkcrL3I0OVRpZ0lR?=
 =?utf-8?B?aGE2Z0w3TjljY01pcVNoUDlvcGlBZ2ZuNXk3eEZYQ1JqNmFoMEJKUnVFWVhU?=
 =?utf-8?B?VU1JbjBldk1RQ3JuUHJYSGtPZzRjM3NKL0VoOFFnZ2NYREd5Q0N4TE5HckJB?=
 =?utf-8?B?Y0NmQmc5b3FTcHRMRWQrTmpqOGJyR2E5SXZJTHFGd2pZRVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXI3Tm85MWJEdUZ5TDhRTGhkMkt5cE9nOURZVnBuNWRrbjJyTHNJaUZrb0Ft?=
 =?utf-8?B?NzJ5RUJ2S0RRWG9CUWpKc3FwOHY1K3FYR1FJa3czNzVJMXFrZXNiWm9VbzdB?=
 =?utf-8?B?ekFDQXRnZUVFeDRtRmNBdk1ycmI4b1NGSnhKUUpTZ25pRjE4QWZNL0JxQk16?=
 =?utf-8?B?T1ViUEFPU3pqWitmam5QOGlHV0F4aWROL2d4RmErd05EcitWdGo1aGlmLzdO?=
 =?utf-8?B?aHhhc3VkWC9LeTQ0WUh1dUc1aUVMRlFlSDNNY3ZvZ0kycVJWTGM0akgzU21L?=
 =?utf-8?B?ZWViZ0VTb1NZTkVOQWFIQVV6ZWVrZTdiUUpLWUlVS0tLU3dMTEw2SFBEYjg1?=
 =?utf-8?B?dEpzd2VYMDRZbkJkL2Y5TlNWNlR4YTExbUE1eTdWcUNqRXB2NW5LUWJZYmZS?=
 =?utf-8?B?VVRsQ2NDVExzSW9PQk9MeUdhUGV6c3RFWjhONU0vZ2M3QVdST1FlMDhCa1g1?=
 =?utf-8?B?ektaRHE3MU5hb25IV2JoTmdTa2FMa3dkSFdXTU1GR2xOZUdObDJGS0VYRUJ3?=
 =?utf-8?B?RExnNEZicVpwWUNuUzNTVktSRUExaGNZaldIZlhsaDhkVjY2UFUyaWExemZo?=
 =?utf-8?B?MGZIaC9aVGxtQUk3MHNVMVVORjF5eHFJOXFuUXRZTWlWSVN3d0oxeHNxajBB?=
 =?utf-8?B?d0hhZytpSXVwWkdzRzVLN0VZWUIrZTVvUE9UMVByeVlZdG40anpEaXk2bGcz?=
 =?utf-8?B?V2hSWHNDMTlPem1rcGdxUjIxb3daN1dGSENMczA2dCtsMG40TXZyYTQrT1o3?=
 =?utf-8?B?bnRZR0tpM2FWOWZCeGF2YmJKZ2lLTFoxQ3RteEQvUjlka1QyRU14RExlbjJS?=
 =?utf-8?B?THJxK3p2U1VSNTRXSXBYQUdleW9mRHhscjZ2bHRYc1p5Y2NVS0NQd2VLWDNP?=
 =?utf-8?B?L1RudGFPclFsQTBsMXYwSDJ4Y3BldHUrUUErbkMxb0tvVUphQ3ZwNk1sR3VJ?=
 =?utf-8?B?MjJmMEh3RHFhdktUNEZmVm9jWDcyWFpWOUNadG5wRUtyWWNENEdXUWhBRktq?=
 =?utf-8?B?dzI4b0VnR2trdlRoOHpSZ0krZ2FxODZGTFhHdTZkNTNIamEveEZ0YWZYY0Fs?=
 =?utf-8?B?aFR4MVlRelBva1RYODd6QW1ZeFV3M0FiTndVazJ0T3pZbk9MUVE3M0lIRXg1?=
 =?utf-8?B?ZHN2aC85dzdQaDhweVBIKzdEMUM0aWd4RWJRRkN2L3BjZGxJSWdGdXJTQ2Vm?=
 =?utf-8?B?bGtRdTZ4aEdibTM3amMxMGZSelhNZmplZkw3Qlc1T1Y1ZUNDR3l1MVV2VkJM?=
 =?utf-8?B?Zy9Mb0sxNWJBalB6MTk3ZUtCNnNtZFpzMSt1NEYrbzg3MUYyR0lOSmErQzdW?=
 =?utf-8?B?Nmd2bVFneXljTlVuV3JtNEpRQll0bHVnb0JEY0JFTVp1cURyQWMyREcxZ012?=
 =?utf-8?B?aHVMM2d5b0ZLVVZFMHNxZWVSY1lFdHdYNTFKWFZyZzd3Ym1tR1BIcEJyQ2VF?=
 =?utf-8?B?RFVBS3JCbzNmTTBkUlJDaWNFSzZMS0hBYkZlWkc2Q2RUVDFuYWc0SGpNNWkv?=
 =?utf-8?B?SWk0SG9VOXh2WjBCQlN3NldQb2xFeGwrWGlIR1JMamFNaGQwdDNlSW8wU0Fi?=
 =?utf-8?B?cHFudTdrR0FwZ3U0TlFDSXV6T1gzZHZkS0lPWjN0MVcwMUhaUklFTm5GREdJ?=
 =?utf-8?B?TkZnZVRwc3hXbXRTT0xWdkRaSEhrM0tGbUsvSlZWMjhkUmxWVVFsYWUvZ0Fm?=
 =?utf-8?B?YzVobTNoWVlHMEFKWkZuU0x1c2Zod1I4KzNraU5WYzRBdmxhWjNWOGwwNHVV?=
 =?utf-8?B?S0hnaXNTZkxzVi9DQ0w5bm1lM3RZSjJNUHRnMFd4aHNuUnFRVUt4aEJtdmxj?=
 =?utf-8?B?YkxXMTYxNkUwMDRFVGZCSHoxcUJQd0xES1pibWwvQWl3VzBqOVVUMnNuL1FO?=
 =?utf-8?B?VzVRVGpERk1QQk4xbUF5Vmc5WTFDY29oWEVLekJGd2FhS3NWanduMzN3dS9u?=
 =?utf-8?B?bTdZalJnWnF1M1prK0ZkcUd0S3loZXRiSk9yOFdwUHRtVnNIRHNBZzNDMUtQ?=
 =?utf-8?B?Ny9pcmR5cHk0bk9JOFVkWWVUdExTdzhSbnU4Ync3bTBleU1NTWN5S1FUWWdW?=
 =?utf-8?B?SVI0M2VQODAyNnNEa2doZkVsOEZPQ1dtVmtIb2owUzgzQjB2cGQ1Nm00ZEJQ?=
 =?utf-8?B?MUNMekFKTXFTYU5lVnBYWXVoN28zNkpGdWs0UUI2VjlTZEVSSHNLT1d5LzhV?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/gdSVWdRGRrbrogeW6kckFyvbrqgVgNLYaJ47tnh5IWDBWI94gFxbYjce3oeBCkWC2kR59uZ8O7b4BFqiSbZg9vs/iTxFaKluSTQJpBqPJqfIsVcbNw2oQXlo3Ji5o3nuRj+41l/IzSe79QYSAcUVpOgSh6wpaYl/wUb4pEsZtTLwWsQ+Qd/+iCbGYWmwVQhcIGNwjbiHBx4oM9avF60nfhz4p4hGIVGwZnr/Fw5MfVeavofJqX13vCNRlHAmV3IH4iYMWK0Db88U3eTSZbBWmUEFtwt5qyMLI4qS7POVA9/gsDHN4d4vq307CvQONUMBcAGX5l98r7S7xJeFqvkt4avqubwC/E6jxkj3D+emYmG5w2RtB+3RSzvpeTnbT0vas4g0uMWaEQy0C1yY59xw7sDCT88x3lGVK5xoIAWLIPQL2lH/LC6sOKJUd72dnZAzx6QqA0xQnANajD4hDi9RZJ5JMbZOg/HNewqs5eibEVwUQvxS3Mat9l5SGuImotRL2D0MlWmr0nO+J4saGGxHrI7gwgty7BMmExQxXU9z8OTx3MVF9t/1/1niKFKsGBySYFMzIS1A45droIkiWzyB2eGyu0Z87whGWy0ebTzoI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635c1848-c673-4eb1-0e77-08dd40a00a48
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:03:46.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbJB4I0VFL4q7rmO2n1bgLSlw93dHQeyn1k41nURr5klp0oOr4cRwCK/rNgRKiXs3i782k+fQetFDXZvHSe9/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6098
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=972 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290155
X-Proofpoint-ORIG-GUID: Z4s4HZ2Igr1HJ15w7CfvKeImKPvicYMN
X-Proofpoint-GUID: Z4s4HZ2Igr1HJ15w7CfvKeImKPvicYMN

On 1/29/25 9:39 AM, Chuck Lever wrote:
> I received a request to publish a fresh release of ktls-utils.
> My thought was this is an opportunity to release a 1.0.
> 
> I can request a Parfait run on the current source code. I've
> never gotten Coverity to work. Any other analysis tools we
> can try?
> 
> Are there any other features that should be in this release?

It would be great to close these two before a 1.0 release.

- https://github.com/oracle/ktls-utils/issues/21

- https://github.com/oracle/ktls-utils/issues/71


> All code review (or re-review) is welcome.

-- 
Chuck Lever
