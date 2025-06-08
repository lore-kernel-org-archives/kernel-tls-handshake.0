Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB431A23BB
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749407413; cv=fail; b=WXfSoVESpFrRQlHJkSY4Mddd69XBIbywPTR38gIfYNTIP1xWci2dIQ7F7yyVgfIbCUlqsNQ3/25xs4CZ/wO9fwR8z1oOWlrvrB+OBl0jug6kmpqokyl/fZHsH0StKuzE6WMdAibX6S/UpO6fHTIwUHKcuFMoboc7es0Ddev6jx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749407413; c=relaxed/simple;
	bh=//iqcqUloAvshY3T02lncYs7CLi71ShwtOQFDazMW/g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QI0bTAtDcYJLb3YH4ZBwPevoQONZBmFQpIHdPRVu522uAZTx1pr/T/9p0+WFgPOJGXs95DYGMStkefyYtKIZdeD8qGhfBCIA8R6NE58rtbOPxywY018xgd6lGUoofItBzGSgHHjimfCjKZfm7qagMDVl6DebB80Nn1pzO4gLOSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b8EKPsYI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cjr4cBx9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b8EKPsYI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cjr4cBx9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558HU2oh022743;
	Sun, 8 Jun 2025 18:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UCHmIPzteE2D62BxLF8dBjhmimUkaZzPENp4Bg4Q2iI=; b=
	b8EKPsYIRyhnz0uac6cQ6v5eIsFL5/n81ybXvwvLVww8pfDTJZ+QYQN1PngaBxUC
	Jf8QM5adoZyzfhJEUTeCFgtJAca0Ab+/8IUy9RdwT+VpFtEBc5r+aEtPiBZnNMmX
	MC6tPfmzIhA99Ovo6Wp/ouUUGaV8q4f8iA1PjmwAHWR6ZUeEFfFEiqLQ4gEijVNd
	lxFltcK3iiiWcmQY4LU9bEIQN8n7iAX2guIN/hYTJ+OgYUNVy3Kqwa4wRED6TW8Q
	zyWmwigoBnf0d46O4wl2cnrRkGTKtfh+K8hFQHbKcKH5M3+Q3mUCLwOq8ziJkVeS
	63Z9wHnxhIHkYBlmQA445g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe95d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:30:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558G0CJS003302;
	Sun, 8 Jun 2025 18:30:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6r3dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKdHiXjBpDKJcpEZWnGlb/Fvh6ltqHFBJigKPYUM1UrnwDJBiAsdS2J/Sn4KojAesld2oth3jRM+8uJTEVHAEfJeFZyljAi/Mbqyrur/9ynHk7uE9rqlSrXMnpiMzURDaIwZJ1/782vW9Gz9uh+iD3XQc1ABLqWvvYiWWPTMcyG09snmLI2ig7YCl51KfTQvF6jIDVfEKEdJrJrDKZkB72X13a99MumSBqdMO5LEM5FRoOXXoEsaMjT/A/9tVOMfafXD03MRj9QHkwvV4ezUK+t61va1m+p+EwnKXg1TQ2sxO+H4TapNC7PVFyXeCF794FpJ3QQawmQ9j2V0gjQRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCHmIPzteE2D62BxLF8dBjhmimUkaZzPENp4Bg4Q2iI=;
 b=RLnUr/5Lg/YFyJDSGt6M7CMDQgEltGxcgbYEHUQqQQ4N2ZP6WjH0f5nUVQ1Id6ANUFmPygYMV7ufBlQgfOwPg3w4iw1weeusPhuUidyjUPLRRe7vmOiqOuH89DklGz2pg/QL1XIpojP/GWy3lf6zB2USiKm2ePpLTPM/3sbsu5ILtROrGkGrsYO80vcQulHDFUUd4SeHwNvausUn3IDooOtMwK6e3C2XRIMzhQCwnWJ767roWrrrnhU/PrybT/KWlXOPUhLcbukVQcX9zr6WbKzu9+VpQ0tVOF0FyamdvffpSkOlFALv/X4nkgW/QmNaWkfxznRLETxS81+3XTFuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCHmIPzteE2D62BxLF8dBjhmimUkaZzPENp4Bg4Q2iI=;
 b=cjr4cBx9pV9XqAZKozoVAP2MsdPUhQ/djMoiEYM+4rIVt90ttoVtL9itEXsjvwrR28yE7NpLaeRNcnd08pa5mLdBIQs/3PbQJLQWtDub1rbTQhihe10wWsXNBSXZJ00WOQ1KIE5X4bFRCQnEPjF1PA9FH6KLNAlHViBMnEKkVT8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW5PR10MB5714.namprd10.prod.outlook.com (2603:10b6:303:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Sun, 8 Jun
 2025 18:30:04 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 18:30:04 +0000
Message-ID: <b9815a8c-25a7-42ed-aa7a-f90821cf4853@oracle.com>
Date: Sun, 8 Jun 2025 14:30:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] server: Add boolean config option "verify_peername"
 under "[authenticate.server]".
To: Ken Milmore <ken.milmore@gmail.com>, kernel-tls-handshake@lists.linux.dev
References: <4b17224c-0525-4e30-9ff3-4c0abaacab89@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <4b17224c-0525-4e30-9ff3-4c0abaacab89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:610:4e::29) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MW5PR10MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: af967d41-bc9b-4a95-8ca7-08dda6ba7c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm1XVEdRZHlZQ0tVcmxONWlra2hmSFErSWhoRWFVTkhyZk1wNm5FTFVBWnFP?=
 =?utf-8?B?Y1NtU01LRFQwSVIvTG8vVTVvUTJGbGE5NUVlU0UwRUtCeVlTTjNKSGRuK1JW?=
 =?utf-8?B?L2NCQUwvbjRKN245ZWJST2FRR2lXZDJCUGFZVjRhWEkxbkdqdjl6RWovY2NE?=
 =?utf-8?B?Yy9vSENqcWpodG4reTlOaWhPeUhmZmZ6ZHg5TkVLRUMxRmxJUTRPcU1pRUhU?=
 =?utf-8?B?TnVRc2hNUnU1MURlT3NnS0o2RmRBR1ViZlpEb3lZNzArR0NIQkhMNXBQQ3l4?=
 =?utf-8?B?b2h0V3hteVVhTTB4NW04UGM0aU96SVdEL2NYYjRLMWsxZ0RSZ3dGWGhabmRN?=
 =?utf-8?B?N1dJNEpEVlVTVmx0aXdKZE4zUWw2aHF0Q0htZGlDNDNNUFBXMmJ3blF0UGNh?=
 =?utf-8?B?MGRSWnI0cW9rYTBEWTkwZ2NaczZRNVZVckp4WWZZRS9FSWN4Tkp2ZjlPZ2JT?=
 =?utf-8?B?aEZSUktMWGplWXVuUmZhSlVDM05PYXdlU1Q0NkwwYzVZNS9jYVNGWlV0RWlG?=
 =?utf-8?B?STFTYTVhMEhkNlBiOWNrcVowQ0hDWGgxYTFJTGluZXdtQ2hjb0RjSHc1MUd3?=
 =?utf-8?B?aHJnTWFKc0RqSXcycjB6K2xta3BhT3BDMVdKUW1jemZjek90b3Brb3libCtO?=
 =?utf-8?B?ZXVqZEx4MVdjZER6S1MrRVhCTHFNRlFvUGEzd1BhUHZCN242VjdPd01vejZR?=
 =?utf-8?B?SUY5Y3g5dzEzRmlvMDFKZFU4blBQaDNVdnMzYUZHOUs5dFZONkt1QVRJdENB?=
 =?utf-8?B?UmpEVGZLVTYxRWJ2R1N4dDBpNVBJSWkyb2lSd3JrcEtsaUZHVWxxUUlYMXBa?=
 =?utf-8?B?dzg4Qk9BRHZId2Z5NFJOVVpOSDlvUFN6MlRGc2lqNk1uNzdVUkFvYmhQVlJq?=
 =?utf-8?B?SHdEcEhSQTEzMDZzZzQ5bGdPTTZnTWZWejdQRExjRzBQbWdVeXNWRDVmMkxo?=
 =?utf-8?B?bU9ZeGpGLzQrMGwwUWRadmJvQW1Vdi9GMnlsbWE2ZEs1anhXS056Q1FrN1Q1?=
 =?utf-8?B?WXpCSThOd0xDSy9iZlN5bC96R3FhTlE0RjRTN29xVFlna2RUWk9jckRYc2tE?=
 =?utf-8?B?ZnZxT20zY0U2MThQYU5MRmkyWktuMEZmOU92SGsvRmFQRGtuYnZqOTEvaTN1?=
 =?utf-8?B?MStIMlBZdDh5MEFPajdwSFdnZTFhK2FMTVRacUJGWUhEZlBzem5NNndIbFdu?=
 =?utf-8?B?UDVkQ0pTWStLbXFZczYwL3BieDZFeW9XbiswdXVuLzN5dGluTXNKTjRjSENE?=
 =?utf-8?B?dCs2UjYxOFFod1p2ejRlb2RzcnhWOHlnLzBLRXNVYkxuaDZGdUtrZFlBT0tU?=
 =?utf-8?B?bGJ6L0EvUU5tU1RkREMrMk9yYlc0T3pjOFdQL1ZySlBmZHI0b3Q2SXE4WElF?=
 =?utf-8?B?YTFLMEg1aE8xVWxyWm5UdTlpZFQwa3IxMkpjKzdCMFgxVjhWVzFDc1lqVS9j?=
 =?utf-8?B?K0x3VWV1eGZTU2RZM3YydXhBZHo2NVNZelJ0WjE0RnZPTkw3RmJ5aEcrY05r?=
 =?utf-8?B?VTlTU1dFS2R1TVNlcy9QMnRvMTgrZzhTUUs4RmhKT2NrM0RTdW50SVZ1a2pa?=
 =?utf-8?B?UkRacG9ZM2NsdGFsRWRSOU5FU0JueVA1WUhCQmNwellLSytuaHNlaTI0NFlG?=
 =?utf-8?B?bHIrSWZMTUdDQmZocVptTzlFNytlT3E1Q0RBdCtUK3NpeXEvN09xeEI5ejk2?=
 =?utf-8?B?WElNWlZkT3dJV2xpN0hmOEJCdVFkZzk1QjJuWVFZWi91a0x1OSs4MnZmazJx?=
 =?utf-8?B?alJxYXY1QXlPL2l1V1FQSDVXOUNFMXVJeXBNWjczSkVJZzB1Nk1XeWE5UTdn?=
 =?utf-8?B?RWJrM09pdCtFUml1UTJPcWlZRm9jRy84NlFuR1Y1TTc1dGJpYmJIbEgrVUt2?=
 =?utf-8?B?aU9QNkFKVzlkakFiRFRHWlJNQUtwOWFRZXdDS0pMaThOY0xGb1ZQZ29sdUk0?=
 =?utf-8?Q?0iNUPNOgQXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhHam9kYVRvOVVRdDFEd1crNFUzb3BNa3Vkc0ZQdkhYV1VNT2E4Ykg1dWlD?=
 =?utf-8?B?Unh1OStpR2tlVjdQSGZEbGh1dnp6WFF4Q25pbG1mTW00aS9zbU1XVnFOdjkv?=
 =?utf-8?B?Z0lLSWNIS1ZJRmQ5YmhLWS9mMGZmY3RTV3BZelZEa2Y0YjJSMjNhTGQybml1?=
 =?utf-8?B?SjZpaHZwdWV4STRMQThQREZ6djNsT1k4WjJ4azBVWk9Ia1R5d1NzYjl0V0g1?=
 =?utf-8?B?VE9VQWtpSEZYaUcxMU13d2ZMVUJ1S0tvdHM1SDdQT2FNKzBIUjAxUUkzRzBq?=
 =?utf-8?B?NllzSFI5OUp5bEJSY1p1NFp0Rm02SGhVWUhMd2VFNEZhN25mZ0ZEUnFOVHhM?=
 =?utf-8?B?TXgrcnNvU0ZlN1BueXNVOEhQdHY5UElzdlBmQW5EdWxSSDJUTkc1cFFWbWdW?=
 =?utf-8?B?RnNsajdLL2dSbVREQUlSdnFwME5heis5VmRpNDBFR3JvRVdDMnJqYWJDeElt?=
 =?utf-8?B?aTYrNUtGSlk5eXdzWkRTUE9KUXlnVmZNcDU2ZndyR3ZieWRyUERKdWNWYmlX?=
 =?utf-8?B?WUtiMTVPOEJTOHRIWE0vV0VldkROejh6MW5kNjlEKzF4SE5Na2xBRGphUUxk?=
 =?utf-8?B?dXcwUVh6ZjBrTnFBdnorSm1WdGh3Tms3YXEwaXdTMGlXSTZpKzNQa2Z4Nm8y?=
 =?utf-8?B?ZTl4eU9aS2lHTUhQMGh0NzRsUzM5THRMNzZPNGFWV3QvK01WWktWNVpEY0sv?=
 =?utf-8?B?TjJ1MldMenBacFFMVzBWd21NcWlTMURoMXFhYXBWVGpmcHkwTy9TeUszdTFU?=
 =?utf-8?B?ei9NWXZCQXlOMWZOa1Qrb1R5eVI0bXJ6ZVdxZmtsVm9hZEtzVmJDZWRMekJF?=
 =?utf-8?B?VG4zL21NRkE5UFNBcmtSRXZLVkJCaTVjVXFpN3BpdU5DdUZTS1lKNUtrRk91?=
 =?utf-8?B?TXVleXp4QVNEK2dTVmNGRXNTOWs3dWxHSWpxVmRuV2RQYkNvK1crRmxqbm9E?=
 =?utf-8?B?YzB0Yy91WGc4NVlvTEhHbTUwUFAxeE1EK2JjL09sdjM0bU12d2QyL21uVlZt?=
 =?utf-8?B?K25TbElDbGZTQjFxc2xnNy93OFY4NU5aeHMwSUlCcXZ2REE3aHVRRDBRd1pV?=
 =?utf-8?B?K3ptRUtHcmtVZlFiOW9BYUdTdXNWR2gzMThKRnN5NG5kRWFvRHpCWFJXT09M?=
 =?utf-8?B?WDRYbmRXNXFCR011WlNMNkZJWnR6UWkwNHZLZFFVbVRVOFFSK0RxdkIvYmZP?=
 =?utf-8?B?U3lDZ1U2WW1ENGZyR01VbTQ1R2Y4UWlRZTFoMFkzN2lLdm8zTGNSc2todFdU?=
 =?utf-8?B?YzBDbElib2FZNDNCYi9iazZUekZweUNZSDBvNFEyYkh6eEx4S056ZjdhY05t?=
 =?utf-8?B?dUpKODJJUHNDYkt5M2RkTFNFMzVCZUdyTHRXL0J5bVJLWkZjaStMVmZYSHht?=
 =?utf-8?B?QzZ6STA0VCtuUE9IcklrRTNlbGp0c2RUd0xtRnJkSWhHNURVZlMrUzlaZ0RD?=
 =?utf-8?B?TWJ0VkE5d1hVWStjcUZTemFESEVJQjdwSHBkQkxJMzNvaFNlZ2pla2ZmQ3NV?=
 =?utf-8?B?T3ZORjc0QjFBb1pnRlY5a3NXbTllODh3eVR4OWRPUkg1d0ZVRUx2Rmt3RGd1?=
 =?utf-8?B?a3AxNGNXRDY4aVhJT3JleCs2N3lSTkkrQlJMT3Exc2hyK1JCSUlPdUdPZFkr?=
 =?utf-8?B?eHN4dmRpNVZ2TGdIREdjQ0hNZ3BXNEpXa0V0WGppWEV5OTNYdldMdWlHcU11?=
 =?utf-8?B?N1ZwRy93c25kVDZUcDJ6dzFoQ1QvU3dhd1RwZ2s4bWw1YUNnQ2pSQzc2dTR1?=
 =?utf-8?B?QmgxREwweHZzVzE3M0M0anVwbkxEeUoraHZYRE9xZmtNOGtVU1luOC9UaDJx?=
 =?utf-8?B?elJmUysxMnM4T3dHZFpXYWlRL2NLQ084cHZzamwxTGNxSnlVM0V1Nk9OTHRq?=
 =?utf-8?B?RWZaYjluQkZlMVpld0syMCthTTQyVVgvUU93bTFtNVdXd3FaWHJkeGFhbHdz?=
 =?utf-8?B?elN1M3pVVVZYaGVWSFZnendZVHNkdC9YMVNGNlUxbUszRTFmOWsrelR3b0Rm?=
 =?utf-8?B?WUxOVmROb1VIMkFBdXlEWXRjd1EwWXJEU1Y5djliZytwNlFJN2QxS1o2SzZY?=
 =?utf-8?B?dWZDZ0hXbjVwS1VwN25sK3RxR290eUhtMUl6a2RVWk0rdWVpbkFmV294TGlR?=
 =?utf-8?Q?RJX8iBT4lU9s2CXYD0ESUg/Ro?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	It+BFWb2i0kDBbEUqkRp+FsNqn6+O5ITK35Zn+YyCYRvro3DonEyAHkC+toXIZUkbncvprGINYyZnudYQbi6uZskA2OFUou4wQTussMN0sgiytp6TZlvcWq5Rbduy0wtqJdBH8vwHTWL3/HZJD214nLN0JSOVXQJ+mzl70YuMVpT6DFL5PHWRSwElClyKMs6sQhtwwCzxg2zTiQpiO1vCJ80MfI/HilRynKhdUcOf5D+lvfAiCuuSwSijr5VDKW+Hm5IRUQK9dolyBKlR8ldGsRtqN3Qd//vxOYwj5GikG50WdVay7rcjmxITMpm4/tpnQ/cVd04J0b8+3YU38XXBO7NaU+shkI+Y3IGggb+3zc6RiUrVgipIIYopMIDe7hAZRHVkbiBxVsORvswLLn3GdswEjxcmoSODACtk/cqcMVYEeaVIptN5/Ww5PK5MS3RaLFyOsYn63uLf3/Tp3a6Ef0YDwAmqQlnVjz4VOZ30BmIfKd1w+GLFLnY7k8xFxqosq4M7rXA09cgfQ45TV5IuJe1OUwun8M18inPT1tjIPKv6ERUDLER/Dv/VFmweOd93KAhgdrlFzsVIAborwokMQg8SkltrCXjFQR68GIcSbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af967d41-bc9b-4a95-8ca7-08dda6ba7c80
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 18:30:04.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OIeYlUnWuWxmcZJ3tLv7aaOfOSewIFXpJtyKLhnddnYNSSA+mPn7qSEXQMYtQqAL5OwzCvu3eZQZYKx+5RBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080149
X-Proofpoint-GUID: 20zCpj9tUYNkqdvj9tCdPaB0pdAwag6D
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6845d6b1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=ah4qXpLB9Ybv0R7rJnkA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: 20zCpj9tUYNkqdvj9tCdPaB0pdAwag6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0OSBTYWx0ZWRfXxksc1Ibm/X78 wDqXZbWwgg6hB1Ch7rxeXBrYywl+fA0Ib7JjMBH10eMW/imlLhatffYEQ3jSs3EFX8C8aIinym+ M/ACoxVm0zhvZbNNFs/HadQywXivzBSzzimc1hbaKnEUpSCzlZonbhWHmfnecNoVjhiri+yskV6
 MTlE4QSrlqQ0dic8bZuRN3hFrZFMGEzDsElMNpL2h0Uyw5tryzENljTT6cuzq9OjExdRCgd+8fq qAkyQW5TGFWtLr7RPwdz1dafhDPg09QQGrccmJYesKRwHlXmH2Jrter7ZEfw9l1l7r7kj6RPAEw gDeX0iLzWNyi2BGEe8my+5dtIChG6XrNlW5xp9/l27lDQzHNE6Owb5W1MpANeivkxgZjwEu0yca
 +MvxxboL4yBh5c26SVvQsPp+caJ4ggeyKsCEKkqzoK9LLVuSKSYq+mGQAif3MAX44koisK6Z

On 6/8/25 1:43 PM, Ken Milmore wrote:
> If this option is set to true, then the server will pass the client hostname to GnuTLS to be verified against the client certificate.
> A forward address lookup using getaddrinfo() is first performed to confirm that the client hostname maps to the client network address.
> Should this forward confirmation fail, the client certificate is rejected out of hand.

An NFS server that services both clients with DHCP-assigned addresses
and statically-assigned addresses can't enable this setting, even if
it wanted the deeper checks for it's static clients.

Perhaps a better option would be to test the socket's source address
against the certificate's SAN field, if the SAN field contains one or
more IP addresses. For a client with DHCP-assigned IP addresses, simply
don't put an IP address in its certificate.

That check could then be enabled all the time, and perhaps could be
changed to "warn" instead of "reject".

Still, this feels a little unnecessary. If a client's certificate is
used by another peer, that means both the certificate and the client's
private key are compromised. The usual way to handle that is with a
certificate revocation.


> Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
> ---
>  src/tlshd/config.c |   3 ++
>  src/tlshd/server.c | 124 ++++++++++++++++++++++++++++++++++++++++++++-
>  src/tlshd/tlshd.h  |   1 +
>  3 files changed, 127 insertions(+), 1 deletion(-)
> 
> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
> index be5d472..c647681 100644
> --- a/src/tlshd/config.c
> +++ b/src/tlshd/config.c
> @@ -92,6 +92,9 @@ bool tlshd_config_init(const gchar *pathname)
>  				     "delay_done", NULL);
>  	tlshd_delay_done = tmp > 0 ? (unsigned int)tmp : 0;
>  
> +	tlshd_server_verify_peername = g_key_file_get_string(tlshd_configuration,
> +					"authenticate.server", "verify_peername", NULL);
> +
>  	keyrings = g_key_file_get_string_list(tlshd_configuration,
>  					      "authenticate",
>  					      "keyrings", &length, NULL);
> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> index 72ff6f5..4a47fe8 100644
> --- a/src/tlshd/server.c
> +++ b/src/tlshd/server.c
> @@ -31,6 +31,7 @@
>  #include <stdio.h>
>  #include <errno.h>
>  #include <keyutils.h>
> +#include <netdb.h>
>  
>  #include <gnutls/gnutls.h>
>  #include <gnutls/abstract.h>
> @@ -42,10 +43,127 @@
>  #include "tlshd.h"
>  #include "netlink.h"
>  
> +bool tlshd_server_verify_peername = false;
> +
>  static gnutls_privkey_t tlshd_server_privkey;
>  static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
>  static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
>  
> +/**
> + * tlshd_forward_confirm_hostname - Confirm that the given host name can be
> + * mapped to the given socket address by forward address lookup.
> + *
> + * Return values:
> + * %true: Forward lookup successfully mapped @hostname to @hostaddr.
> + * %false: No such mapping was found, or an error occurred.
> + */
> +static bool tlshd_forward_confirm_hostname(const char *hostname,
> +					   const struct sockaddr *hostaddr,
> +					   socklen_t hostaddr_len)
> +{
> +	const struct sockaddr_in *ha4, *ai4;
> +	const struct sockaddr_in6 *ha6, *ai6;
> +	struct addrinfo hints = { 0 };
> +	struct addrinfo *res, *ai;
> +	bool matched = false;
> +	int err;
> +
> +	/* Refuse to confirm an empty host name. */
> +	if (hostname[0] == '\0')
> +		return false;
> +
> +	/* Check that the supplied address is reasonable. */
> +	if (hostaddr_len < sizeof(struct sockaddr_in))
> +		return false;
> +	if (hostaddr->sa_family == AF_INET6) {
> +		if (hostaddr_len < sizeof(struct sockaddr_in6))
> +			return false;
> +		ha6 = (const struct sockaddr_in6 *)hostaddr;
> +		/* Refuse to confirm a link-local address. */
> +		if (IN6_IS_ADDR_LINKLOCAL(&ha6->sin6_addr))
> +			return false;
> +		if (IN6_IS_ADDR_MC_LINKLOCAL(&ha6->sin6_addr))
> +			return false;
> +	}
> +
> +	hints.ai_family = hostaddr->sa_family;
> +	hints.ai_socktype = SOCK_RAW; /* To avoid duplicate results. */
> +
> +	/* Fetch a list of addresses matching the host name. */
> +	err = getaddrinfo(hostname, NULL, &hints, &res);
> +	if (err) {
> +		tlshd_log_gai_error(err);
> +		return false;
> +	}
> +
> +	/* Search the returned addresses for a match against the supplied address. */
> +	switch(hostaddr->sa_family) {
> +	case AF_INET:
> +		ha4 = (const struct sockaddr_in *)hostaddr;
> +		for (ai = res; ai && !matched; ai = res->ai_next) {
> +			if (ai->ai_family != AF_INET)
> +				continue;
> +			if (ai->ai_addrlen < sizeof(struct sockaddr_in))
> +				continue;
> +			ai4 = (const struct sockaddr_in *)ai->ai_addr;
> +			if (ha4->sin_addr.s_addr == ai4->sin_addr.s_addr)
> +				matched = true;
> +		}
> +		break;
> +
> +	case AF_INET6:
> +		ha6 = (const struct sockaddr_in6 *)hostaddr;
> +		for (ai = res; ai && !matched; ai = res->ai_next) {
> +			if (ai->ai_family != AF_INET6)
> +				continue;
> +			if (ai->ai_addrlen < sizeof(struct sockaddr_in6))
> +				continue;
> +			ai6 = (const struct sockaddr_in6 *)ai->ai_addr;
> +			if (IN6_ARE_ADDR_EQUAL(&ha6->sin6_addr, &ai6->sin6_addr))
> +				matched = true;
> +		}
> +		break;
> +	}
> +
> +	freeaddrinfo(res);
> +	return matched;
> +}
> +
> +/**
> + * tlshd_server_get_verify_hostname - Determine the client host name which will
> + * be passed to GnuTLS for client certificate verification.
> + *
> + * @parms: handshake parameters
> + * @hostname_p: Receives a pointer to the host name to use, which may be NULL.
> + *
> + * Return values:
> + * %true: Proceed with certificate verification.
> + * %false: Force a certificate error.
> + */
> +static bool tlshd_server_get_verify_hostname(struct tlshd_handshake_parms *parms,
> +					     const char **hostname_p)
> +{
> +	const char *hostname = NULL;
> +	bool verify_hostname = true;
> +
> +	if (tlshd_server_verify_peername) {
> +		tlshd_log_debug("server: Forward-confirm peer name '%s' against address '%s'",
> +				parms->peername, parms->peeraddr_txt);
> +		if (tlshd_forward_confirm_hostname(parms->peername, parms->peeraddr,
> +						   parms->peeraddr_len)) {
> +			tlshd_log_debug("server: Verify forward-confirmed peer name '%s'",
> +					parms->peername);
> +			hostname = parms->peername;
> +		} else {
> +			tlshd_log_debug("server: Peer name unconfirmed: Forcing error.");
> +			verify_hostname = false;
> +		}
> +	}
> +
> +	*hostname_p = hostname;
> +	return verify_hostname;
> +}
> +
>  /*
>   * XXX: After this point, tlshd_server_certs should be deinited on error.
>   */
> @@ -146,11 +264,15 @@ static int tlshd_server_x509_verify_function(gnutls_session_t session,
>  {
>  	const gnutls_datum_t *peercerts;
>  	gnutls_certificate_type_t type;
> +	const char *hostname = NULL;
>  	unsigned int i, status;
>  	gnutls_datum_t out;
>  	int ret;
>  
> -	ret = gnutls_certificate_verify_peers3(session, NULL, &status);
> +	if (!tlshd_server_get_verify_hostname(parms, &hostname))
> +		goto certificate_error;
> +
> +	ret = gnutls_certificate_verify_peers3(session, hostname, &status);
>  	switch (ret) {
>  	case GNUTLS_E_SUCCESS:
>  		break;
> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> index 29b0715..9e5b221 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -24,6 +24,7 @@ extern int tlshd_debug;
>  extern int tlshd_tls_debug;
>  extern unsigned int tlshd_delay_done;
>  extern int tlshd_stderr;
> +extern bool tlshd_server_verify_peername;
>  
>  struct nl_sock;
>  


-- 
Chuck Lever
