Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1104338F28
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 29 Aug 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486764; cv=fail; b=fQmtxOWJCNcD1cSRsZgxTuzyEw/H4vY0N1vsXHbK3dhT1kUFykguKJWiD7VYbgDg9pspxxCvuIJqcR9ERUEY/njOmxD6Xn0e+fwu1XNSZ0TJ7uohA3+i3pSYd1dCckjY1cz4NjkdnbiO2t+yicWJoVfQt+vJaK2dJMUJ85mH/FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486764; c=relaxed/simple;
	bh=EGKJmwl5ODkoC9VZVy7tixlB5vnA7zRZ8nSE/TDiKq8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c1VrrUYF2mz7IPgTFSs5Hwbt18X31jNejVtLd4HCHzLDslZRxiKrSmrJ908IVZIfoxOuuylFxBisI5JFrtMLuP72KEGSJbuJdqXSla4hdh28KvgBGOdyboYhcEJGewl6EQ/IlNA/sJRZqjI625BUUiRBb9pTOY8nDQGPk+PeIDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HCfHhVV/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UvpzNMyT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HCfHhVV/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UvpzNMyT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGflW1009029;
	Fri, 29 Aug 2025 16:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Sdm/pSOC/QELK4RvIbQFg9gjcz+D0qgXIVxbsxmvSFY=; b=
	HCfHhVV/ta8cV2CTmYHlvYgsJtI1ZAtBNnG+jeZ3JOunKJ/6gltLeNoC1zB4+vnY
	RugJNU7CXPffz2oT3PPJ8eRHYd9PVvvGDUlSJcRAwf1uxufbXlkXYMBr1Jr8Bsnu
	3vzcr5w1ahhAI1+kfMxusCfHEhuC4KNGYWOUneFiHAAKSmy345hWsNubXJD/TSqF
	yXGWXX23TCjWaGWDv9MKizoV/KB+lKucceNZ0AaGUchHZVbp7/fdQRfK5UHWR7oR
	1p2j1BUHrjDU9CIhEjK6vZ1Vkyfi8ilAQQi0nERMJxcSfqng+DvkA2KqWDRASmIw
	OgC3Sps0gpPaIXMgpBGW0A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twhjpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:59:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGnxsH014626;
	Fri, 29 Aug 2025 16:59:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43dc6wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHkcc115Incc7maBy9jw4cVWp+oeAWdPily5AYzKsYhR+K9oD+LTzIII2wjKZcrS2qMZiHFWgBbIdgsS8JcRTkTLIG4yJ2p1GQS4UqKNUdwYCR0t2dBjJRgP6HEqJ7EfAH/ei3mdtKc9v44M+oWNfPO1UaBUOWoyQBQbnZsmPnV79VoKe4DCLx5PiMXx0Mlaq4W2VMbHDhQ37s35BpqhSQHDSCZMLg7camcjq0YmQiBWH5Ynk4mRQTImJNm4vozE82HG3XibEkwF02RA/GF9v5+iryy3O13GLqCEaXJl8srNC2E5rwXNeGsFgY7QauA8erOhIFZ6fcd63ZjdMml6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sdm/pSOC/QELK4RvIbQFg9gjcz+D0qgXIVxbsxmvSFY=;
 b=dp7GifC23n4cJ2Pn0iwcAVBJvqjHCJvy66zUy727B8Hr4fKUtgs4pAoD46w8sPIFUJ/SIUIahIZd1hIZ89Qu5bJ1Xl2rtWNs8fMmoLuJN4se5R4974wKAGzzMP9Hd5fUC+enQOX01RNajX1PoH31XfEm/mPvhhto1s4UvAmyPkvKNXl5/CRIcvhl88/s/H13cjaeFdY1afLiqxKe/uUEcTiomRL/gIOatSxWCqCIDgvvZWXBwdrHCtCOfvmVB4qAfIOi+8ek8YSr2+w2CZxy3R6V5o9nV25xuQBQXwZNMA0vCDNHD2Y+qiMzPpDhYmbZNzNJ+DM7/fh3B3ddUQ3z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sdm/pSOC/QELK4RvIbQFg9gjcz+D0qgXIVxbsxmvSFY=;
 b=UvpzNMyTzc5ki3Llf+fJqvh2ciSb3OMRYuVqCXaIR9X9QKFfGRgF4xjJcEWuwgoGj6p6pajs/Es+QX1RmNm7D3GzbjMGrGSm7o/lM9UqddtSGHtIbqHZRi5pR5zgozYcux/iyWnO0+IbWd+xcJhY18ScFmjgHermB+wJcblBFQg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB8131.namprd10.prod.outlook.com (2603:10b6:408:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 16:59:12 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:59:12 +0000
Message-ID: <cc649f61-f3a4-419c-a861-2b4d23aab38a@oracle.com>
Date: Fri, 29 Aug 2025 12:59:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tlshd: Server-side dual certificate support
To: Scott Mayhew <smayhew@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250828222348.601924-1-smayhew@redhat.com>
 <20250828222348.601924-3-smayhew@redhat.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250828222348.601924-3-smayhew@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:610:e6::22) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LV3PR10MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f13e3f1-b2e6-4a87-760d-08dde71d60d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnozSWdPS0NOUERIaWZiYnFIVm8zQjlyWFJ0RE1aR1FBQmxkcVRSRVVkLzBY?=
 =?utf-8?B?dTZBWjFwSmIyTWU1VEZBR0I1Si9tQlNsUkVWdEphMnpiTkNMaDJsRk96akRG?=
 =?utf-8?B?NnZvNjhaZm9rejdnNFVMT2Y2bGtiUzNYalR1NzVmTGFxY1FaSG9hcmpCUkZu?=
 =?utf-8?B?Z1hkdFFqcWdoYlBlZEx4Sk16WUpsNmhEbUYxa3lVUUpkVENtMENKaXhDbko2?=
 =?utf-8?B?dnZWZi9sbVMweFJTUWNYMURnenhIZnQrT0JqOWV4ckhzbW9jNC9tUU4rNmlM?=
 =?utf-8?B?Z2lyeWw4V2poM3kwS2lLTENFOXJSYUd5UStKQS8wWnd6bm1HeXdteDdOVTN6?=
 =?utf-8?B?ajVRdmdnNmlKcU44K0VBTnhET0JiWmNzYnNqbmI2UWVyNUp3dGI5cXhCZXha?=
 =?utf-8?B?Y0pydTBpMWsxaWJkcjVHSzIzQkJtMVllUU9XRG9pR3gxY2gxSzdxaE5ZUy8x?=
 =?utf-8?B?RUZDcG5oVVdoZTMzbU5aWmNQcytlbjhyaVA5NnVDYlZqd0swdGxSeGp5MnBK?=
 =?utf-8?B?cW5BN2ZzOURqR3YrbXlOTXpiNUp4eW5ZZE9Pa2RKMkh2cFNSRzg4RXRjbDlG?=
 =?utf-8?B?S0dWa01jYVJDWW5WUFJWZDVzUE1oOGlTeHNZdjQyL1NrTGVkZUxzL1Q3dGlY?=
 =?utf-8?B?YkRoaXdBQzdpS2MwemU3ODJtMWJzNTNwQVJ3cE5BazRCTDJNQ0ZJclIrUzVY?=
 =?utf-8?B?VzVURTgwUUg0R2g0V2pwczAwOTRQNjE3WDlqTTVMaEpHNXhzcy9YMldWeTdL?=
 =?utf-8?B?KzhTN2xad2IzSXpZOTFTdFdDZEFnRGVLZVpyMzRBVldJZzFxQzIxT2U4SjFE?=
 =?utf-8?B?OWNMYVZwNEF2WU03VkgyNkNWZHZCc3VOaWxCQUZrYTlWU3BPbm9tT3pSTVoy?=
 =?utf-8?B?N21Fakh1MlVPWlJ2NzJkQ3VoZDZHdTkzMzZSUTdxSFNkTVlyanBMRXFQV2s0?=
 =?utf-8?B?ZzZ1Unl6WUgvOTB5dkQ1cW14UlVXUG1tNm5zMUlzUWFYWmkzWE0vN3RINDlW?=
 =?utf-8?B?czdEZjBESFFpdmpnbmJZc01GUFN1RjBJWGNXQ1AySm5STHVPRGdkR0x0MTNQ?=
 =?utf-8?B?L2xuMGJaR3hVMkNrbWttWmlQdkMzTXh5enowcTlqdUp2dzYzOHg3RDFaL0ZN?=
 =?utf-8?B?ZmVmdC82YUorYlYxZk5Wc2xPOWU4OFZ1MzFkazdjZmliNGUvVENxVXRyZmlP?=
 =?utf-8?B?enpRY1p2YmVXK2Z4YWgzU0R0WFlGYkNxRzhkZWVhVm8wMVcvaTNlNXJVRTE4?=
 =?utf-8?B?RGtuSjNnaHl2Rm9VdVFhU0xydWg0TUtCWXpiYWVrVy9vWGFwWHBSNjZCcm9l?=
 =?utf-8?B?ZTc4TWplOElJa1pKVWJwMFBSeU11UVF4ZEE1NVNrSWNKaUE1VEN0UUQ0SnBy?=
 =?utf-8?B?aXZBMkk1bmUveko3djNodGkvaFFLazU5ZWFkdjVka2xOVGkyblJ4OFdNY2No?=
 =?utf-8?B?NnhQOXRpeGwzemJlc3JSbTlqOFdHb2RWUmlyYTNlZkxibHpuY0xGbXBZZ0Jw?=
 =?utf-8?B?dnlwYitqaUFveXJKREhZY2lIcHZDVlVaUlVNSXdLa0VjVmVoNmF2dS9nME5V?=
 =?utf-8?B?MWxaUXRwQXVOMmVFZWlxQS9PV0M0cm96TldEVm9yamhyQU5GbC9iZW1OR29B?=
 =?utf-8?B?cUJXc1NGeEE3S1lOaURKWGtvYUtOUnJYQy9CUk9yYnQxYm9RTFN0WC82cmRV?=
 =?utf-8?B?a2daQzBWbVh5aTB5NHB5d3NKaVB5M3M2cVVYYnF6dGFzZ0xnZytIUzlnWis2?=
 =?utf-8?B?M1FnZytVaHNJZU1IVlVCWmVYVjZlTTRLR2N6cTVyTmlmb3B3dTBvQjNHQjRU?=
 =?utf-8?B?WmlEaTZTRGh1VEhiZXl5bkozZDRObWpTc3ZxODFRZkxOS21ibXJURmFEZ1pw?=
 =?utf-8?B?dXJxWWZKSTZ2bzVCbVJqam83b0lTZ25RTnEvTmdITy96UmhvSnRvREtITHUy?=
 =?utf-8?Q?RvIyOL/p8qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3VoaDJvQXc4cnFXVkVJUFY0WllkamRzMDZGdUxGTVc5VDM1SnlxMGhzQkRh?=
 =?utf-8?B?Z1FQUytySG1rbjJUaDBEN0tFeUtiQktiVGNhSU9QaWg5N1cwVHhWTW5BdEN1?=
 =?utf-8?B?T0xRbzJ6d1krYmJLTVkxMzdCZEZxZHhEOTYwS2NFNXF2OTRUMlgzVm04RmZm?=
 =?utf-8?B?ZVBpOWRLL0EyOFJ1dEoxQ0JPNURPMmN1bnJHS3hFdWs2dVFkRDVKbzR2RVhM?=
 =?utf-8?B?L1EwYXQrNzdvREFpSFZ0blpVWjd4R3M1aGxpRXRDbzd4UndJOURVTHcrOVhG?=
 =?utf-8?B?cUZjUWtUY1FxWXNaWUZQbVNXbGI2S3BZVkYxVWxwVmhWaFNXMjZzbmd0YmRI?=
 =?utf-8?B?Q2xidzZYaENjcGRtcHkvVG1WYzdINnBsVmZ1RlVrQmdtN291c0FGWHltNXd0?=
 =?utf-8?B?U3laUmd3OXkrYWxPeU0zZTN6UldWN1IzQmF1U1BQZjZQaStBNEQvV1VWNnVI?=
 =?utf-8?B?bTVNK2FNZ1YrZWlsRmdTVkRuVEdJQkVSTG1IRE1XeXlsa0pqdXU2MzI4TWxF?=
 =?utf-8?B?ZUFDYlQ0aDRrb2VrVlJxYThzNUs3akVoMzlXcFptV1ZRa2k0aEp3ZWlnOGd5?=
 =?utf-8?B?cjVnbHJYa0ZsMXM1cy9jZFZNbHdLcHVQeHRvSkxGVFFVNVpDREpXWWIrb2xI?=
 =?utf-8?B?MENkcWF2Mnlnc2lINllvQTFMOEIxYXFIdnRsaTM0djNwSDdSWHFjemgyL291?=
 =?utf-8?B?YWg3OExwM0hsZlVnbmF5VWdDYW9ta25PaEtqZlVGWUNTdGtYVWd5ZCtYNlhy?=
 =?utf-8?B?Yy9IZnZTVVRlUnNNNklZR1hFSWltby9BWmlaV3FjdC9PR2p6OEgzZ2d4UFFB?=
 =?utf-8?B?UlJVTDVIaFV2VTRSc2g2SWtwR0luT1pWZnRSWU9HVGh3d2pyL3BaSmhPOUts?=
 =?utf-8?B?T1Q5a09FSFZKTC9hQUZpODd5MjVRMk1sb1dqU0toU2JsNEtHS2J6TjVpR3R6?=
 =?utf-8?B?WGtkUEdwc2gwUGxCdTdNUWlSVFlFYUkvemhMRHo2TDhuWFpNQW8xTFM1Ny9N?=
 =?utf-8?B?RFlQanhDY3VUYy9tOTArRnl6Zm1rVDU1UXk5TXVscmFaWFZKOVdwaElJRzUw?=
 =?utf-8?B?TU1KVVM2TGg0MGc3MjB5NCtqL3I1bXhOU0ZtM2ZoQ0NlbUVPbWhxQ0s2dU5z?=
 =?utf-8?B?MXlPYXlML3ZpSGdmalg5cHNNb2dMcGNnY09nUEhkU3VrZXhITmJLMlZjTHR6?=
 =?utf-8?B?ZVFCTGgvdGpJVi8rb0txUEIrdks3ZS8xVi9wbG5saEhWOVhtb2hwaGVITWha?=
 =?utf-8?B?RXVJWEN3c1pyTTViZjdzUjhFR3BoT3YwK2t5ajhsT3kxUnpUM2pWLzlyNjJq?=
 =?utf-8?B?Qmsxd2R3eTVWb0NDSWtTUWhYN3kzSHJqZzRQVnVMbW5RMGdNK2RPeWxneTZE?=
 =?utf-8?B?S2U5ZzVUejFWdHZEMEs5d0M3OHFkU25aZ2R5bkpwWWhXS2RheGFSWU4zRDdQ?=
 =?utf-8?B?M1dSYjFsYk5Ra1h6VUIzVHk5Y1k4N1AvTk1Zd2pMY1B4c1ZnR1YrOWJEdGlX?=
 =?utf-8?B?ODhhd0grVHF1MmFvZk56N2tYUjR0TFFQTkpseHNtM3Izazc0MzNoNnhrMlNx?=
 =?utf-8?B?bmpzNWliSGliMHA0YWFScStZb004Z3hWaEFkOGtCQXBjdVNSS1piclJGdVFk?=
 =?utf-8?B?ZTI2R3RuRmFZKzhwc29FVis5YjJYVUdpOVJxZXRlTUFhdFNCRXRYVk1sZzBm?=
 =?utf-8?B?ZkpkNVNFa3Z6bXh3cWJod1NqWGFtS0RUQ3phamdabUxCK2RCbkhwdlBIRkdI?=
 =?utf-8?B?YzRMLzdXSE0yVmZDQThGTE8rRVU0NXN4aEQrZmFKNFVjYm5GNjcyRStBQTgw?=
 =?utf-8?B?TjZ3QlVNcERieGlIdWxkZlR5ZU1HSCtuWlpBQzd5RFo1OWZXVStsVmw0d3NV?=
 =?utf-8?B?ZXF1VVk4dmVPZXlzcytNYmRLRXdFSm9vT3Y0ZWRDeU1qeWRrc3c0Nm1Pd0VI?=
 =?utf-8?B?dElUOUVJT0FaZmQyaWpCSENoMWtKTFNJMGxmRjQrVDhyV3lnb0QxUnlQT1M2?=
 =?utf-8?B?aWlseDN5OGNOYlBLM2dJK2haa0RNRnppRXdTMXAwQVcvWFl5aHErRkR1aVVs?=
 =?utf-8?B?UlQzS09KSXZmMkg2RkRuSWhpTWhjc090WlhTQ2JIeEVxa2JGam5xOEp0MHpE?=
 =?utf-8?Q?kDKG/hrF8yB/zec6eoGxap5xg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ROu9e6LV1uUC+dYMNj1a0uDfXr3EBVxtp0Q/vwckdzig2djJat3xwafhsvjFbLLtHXJroo3ZRgHVebLRSxP12ckmYUsfPw3ULi40Y+m+Cu9AxWiaABD+yvegU+dS1MGIdJ4016tarfOSXNv5+Gx2xfNjLVSEAx97Y+9MnRHn3AP7XuGtf+HhB3YN+NJ1tNRCISqaI8YMEvcgl11tuQSo/8ypFZiV666XIM44kzyLoqit4BCJl9A6yapb1zXqaQxED1cPssqwroWYaKzSxl7qQdk3jno1soKEUNyZDYVGGKTvsBSaabmkUpmaraMczIaznTEoQ2SnYve1oCz7LRaEmg5PENvR5OIDyh1/Ogn8ul0vZJmvQOe90gNZA8krXkU7thAmQb1HreuEo8tOC1aupSOXdQH3+o8O2bPt2N+LdqCG4F4TOrEe8surVx8f7g76HkXzP/CmaPMpAiX86vNqcUlUz42DDuIpxH6R9E25OD0x3ISs9fZpxK/hvezchAXns/E5TePlJnUvmMYtlM8JBDiC9Ynu6zFq3wy2gxXugC3WIn1dAOzjhNMXk3Tfzc9ky6b/0VKz2CzehXLOOt43bpGKC/Acdderl4jklVnqSDE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f13e3f1-b2e6-4a87-760d-08dde71d60d3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 16:59:12.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kweLkBnTU8I90IVQAmlnvmpk968SuERLWTcA/fx9SOs/aHrbYSTxKWSRGzvUEdsaH5ro2tO5CkQl0uDo0V0jHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290147
X-Proofpoint-ORIG-GUID: sBBHIcaDSv0FVOpU9cZmWwaydoVBhDRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfXxXlPUhI6LdXk
 gQpXho6Oa3uvzUe+p6nfmi8dBN9SKq1eiKgQAU1hI/Xqtt42c5cqA1E7KSUgOf/CiwDAHYaVml6
 xCc6v49ek9HFu62E+UMAsWh3XtEslHQV6oJnvKkW8LQebHU7NZVEIBIG/EHyjAS3pKCPnpRHlJ/
 2w5+ODi+4xpY7+zCiTWhGTswnYjvDypI+FfM0VgkvcGpSfOsToWWpmM7GFI5K/PjyXJKQmfLdBP
 EVaFfR/0ESVj8KHlu1d16yJs2x3oRvY5g8U96LFbcBq55hO3bk21gRQBURoW1vurWnL9Wjv1I5m
 N+fQ8r72vsEx3+ARKXGBgxNG1ymryhnCBRPBsQyR+j40uZ8OfhyV7XJPqi6c1bqjg2QBxLJqCwj
 uziNeYqpkQqQ7Nd7BJRNIVbDnnxIaA==
X-Proofpoint-GUID: sBBHIcaDSv0FVOpU9cZmWwaydoVBhDRK
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68b1dc68 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8
 a=Qh61XpjVKX2uaCWNKkwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602

On 8/28/25 6:23 PM, Scott Mayhew wrote:
> Add two new config options, "x509.pq.certificate" and
> "x509.pq.private_key" to configure tlshd to use an ML-DSA certificate.
> If the cert callback determines that the client supports ML-DSA, it will
> select this certificate.  Otherwise, it will fall back to the
> traditional certficate (i.e. the certificate configured via
> "x509.certificate" and "x509.private_key").
> 
> Link: https://github.com/oracle/ktls-utils/issues/113
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
>  configure.ac             | 12 ++++++++
>  src/tlshd/config.c       | 12 +++++---
>  src/tlshd/server.c       | 59 ++++++++++++++++++++++++++++++++++++++--
>  src/tlshd/tlshd.conf     |  2 ++
>  src/tlshd/tlshd.conf.man | 13 +++++++++
>  src/tlshd/tlshd.h        |  6 ++--
>  6 files changed, 96 insertions(+), 8 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index a6d9d09..0dd23f2 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -79,6 +79,18 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
>  AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
>               [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
>                          [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
> +
> +AC_MSG_CHECKING(for ML-DSA support in gnutls)
> +AC_COMPILE_IFELSE(
> +	[AC_LANG_PROGRAM([[ #include <gnutls/gnutls.h> ]],
> +		[[ (void) GNUTLS_SIGN_MLDSA65; ]])],
> +	[ have_mldsa=yes ],
> +	[ have_mldsa=no ])
> +AC_MSG_RESULT([$have_mldsa])
> +if test "x$have_mldsa" = xyes ; then
> +	AC_DEFINE([HAVE_GNUTLS_MLDSA], [1], [Define to 1 if gnutls supports ML-DSA])
> +fi
> +
>  AC_SUBST([AM_CPPFLAGS])
>  
>  AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])

Nice.


> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
> index 4c54d37..20634dd 100644
> --- a/src/tlshd/config.c
> +++ b/src/tlshd/config.c
> @@ -403,6 +403,7 @@ bool tlshd_config_get_server_crl(char **result)
>  
>  /**
>   * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
> + * @key: IN: the key field name from .conf

ETOOMANYTHINGSCALLEDKEY :-)

Can you find a less overloaded name for the new function parameter, here
and below?

But see below... perhaps the additional parameter isn't needed if all
the configured certificates and private keys can be retrieved using the
same functions.


>   * @certs: OUT: in-memory certificates
>   * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
>   *
> @@ -410,7 +411,8 @@ bool tlshd_config_get_server_crl(char **result)
>   *   %true: certificate retrieved successfully
>   *   %false: certificate not retrieved
>   */
> -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> +bool tlshd_config_get_server_certs(const gchar *key,
> +				   gnutls_pcert_st *certs,
>  				   unsigned int *certs_len)
>  {
>  	gnutls_datum_t data;
> @@ -418,7 +420,7 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>  	int ret;
>  
>  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
> -					"x509.certificate", NULL);
> +					key, NULL);
>  	if (!pathname)
>  		return false;
>  
> @@ -446,20 +448,22 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>  
>  /**
>   * tlshd_config_get_server_privkey - Get private key for ServerHello from .conf
> + * @key: IN: the key field name from .conf
>   * @privkey: OUT: in-memory private key
>   *
>   * Return values:
>   *   %true: private key retrieved successfully
>   *   %false: private key not retrieved
>   */
> -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
> +bool tlshd_config_get_server_privkey(const gchar *key,
> +				     gnutls_privkey_t *privkey)
>  {
>  	gnutls_datum_t data;
>  	gchar *pathname;
>  	int ret;
>  
>  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
> -					"x509.private_key", NULL);
> +					key, NULL);
>  	if (!pathname)
>  		return false;
>  
> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> index 6b4535d..96b1b88 100644
> --- a/src/tlshd/server.c
> +++ b/src/tlshd/server.c
> @@ -46,13 +46,25 @@ static gnutls_privkey_t tlshd_server_privkey;
>  static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
>  static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
>  
> +#ifdef HAVE_GNUTLS_MLDSA
> +static gnutls_privkey_t tlshd_server_pq_privkey;
> +static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
> +static gnutls_pcert_st tlshd_server_pq_certs[TLSHD_MAX_CERTS];
> +#endif /* HAVE_GNUTLS_MLDSA */
> +

Two architectural thoughts when seeing this:

1. Generally, I'd rather see fewer "#ifdef HAVE_GNUTLS_MLDSA" throughout
   and just leave things enabled all the time where it makes sense. That
   makes for less clutter and better test coverage.

2. Does it make sense for tlshd_config_get_server_certs to retrieve both
   types of certificates in the same array? Or, more generally speaking,
   where it's sensible, try not to duplicate the logic, but combine it.

Similar comments in the client parts of the series. Overall the series
looks like a reasonable direction.


>  static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
>  {
>  	if (parms->x509_cert != TLS_NO_CERT)
>  		return tlshd_keyring_get_certs(parms->x509_cert,
>  					       tlshd_server_certs,
>  					       &tlshd_server_certs_len);
> -	return tlshd_config_get_server_certs(tlshd_server_certs,
> +#ifdef HAVE_GNUTLS_MLDSA
> +	tlshd_config_get_server_certs("x509.pq.certificate",
> +				      tlshd_server_pq_certs,
> +				      &tlshd_server_pq_certs_len);
> +#endif /* HAVE_GNUTLS_MLDSA */
> +	return tlshd_config_get_server_certs("x509.certificate",
> +					     tlshd_server_certs,
>  					     &tlshd_server_certs_len);
>  }
>  
> @@ -62,6 +74,11 @@ static void tlshd_x509_server_put_certs(void)
>  
>  	for (i = 0; i < tlshd_server_certs_len; i++)
>  		gnutls_pcert_deinit(&tlshd_server_certs[i]);
> +
> +#ifdef HAVE_GNUTLS_MLDSA
> +	for (i = 0; i < tlshd_server_pq_certs_len; i++)
> +		gnutls_pcert_deinit(&tlshd_server_pq_certs[i]);
> +#endif /* HAVE_GNUTLS_MLDSA */
>  }
>  
>  static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
> @@ -69,12 +86,18 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
>  	if (parms->x509_privkey != TLS_NO_PRIVKEY)
>  		return tlshd_keyring_get_privkey(parms->x509_privkey,
>  						 &tlshd_server_privkey);
> -	return tlshd_config_get_server_privkey(&tlshd_server_privkey);
> +#ifdef HAVE_GNUTLS_MLDSA
> +	tlshd_config_get_server_privkey("x509.pq.private_key", &tlshd_server_pq_privkey);
> +#endif /* HAVE_GNUTLS_MLDSA */
> +	return tlshd_config_get_server_privkey("x509.private_key", &tlshd_server_privkey);
>  }
>  
>  static void tlshd_x509_server_put_privkey(void)
>  {
>  	gnutls_privkey_deinit(tlshd_server_privkey);
> +#ifdef HAVE_GNUTLS_MLDSA
> +	gnutls_privkey_deinit(tlshd_server_pq_privkey);
> +#endif /* HAVE_GNUTLS_MLDSA */
>  }
>  
>  static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
> @@ -120,6 +143,11 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>  			   gnutls_privkey_t *privkey)
>  {
>  	gnutls_certificate_type_t type;
> +#ifdef HAVE_GNUTLS_MLDSA
> +	gnutls_sign_algorithm_t client_alg;
> +	bool use_pq_cert = false;
> +	int i, ret;
> +#endif /* HAVE_GNUTLS_MLDSA */
>  
>  	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
>  
> @@ -127,9 +155,36 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>  	if (type != GNUTLS_CRT_X509)
>  		return -1;
>  
> +#ifdef HAVE_GNUTLS_MLDSA
> +	for (i = 0; ; i++) {
> +		ret = gnutls_sign_algorithm_get_requested(session, i, &client_alg);
> +		if (ret != GNUTLS_E_SUCCESS)
> +			break;
> +		if (client_alg == GNUTLS_SIGN_MLDSA44
> +				|| client_alg == GNUTLS_SIGN_MLDSA65
> +				|| client_alg == GNUTLS_SIGN_MLDSA87) {
> +			tlshd_log_debug("%s: Client supports ML-DSA", __func__);
> +			use_pq_cert = true;
> +			break;
> +		}
> +	}
> +
> +	if (use_pq_cert == true && tlshd_server_pq_certs_len > 0) {
> +		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
> +		*pcert_length = tlshd_server_pq_certs_len;
> +		*pcert = tlshd_server_pq_certs;
> +		*privkey = tlshd_server_pq_privkey;
> +	} else {
> +		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
> +		*pcert_length = tlshd_server_certs_len;
> +		*pcert = tlshd_server_certs;
> +		*privkey = tlshd_server_privkey;
> +	}
> +#else
>  	*pcert_length = tlshd_server_certs_len;
>  	*pcert = tlshd_server_certs;
>  	*privkey = tlshd_server_privkey;
> +#endif /* HAVE_GNUTLS_MLDSA */
>  	return 0;
>  }
>  
> diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
> index 620bd17..5419146 100644
> --- a/src/tlshd/tlshd.conf
> +++ b/src/tlshd/tlshd.conf
> @@ -39,3 +39,5 @@ nl=0
>  #x509.crl= <pathname>
>  #x509.certificate= <pathname>
>  #x509.private_key= <pathname>
> +#x509.pq.certificate= <pathname>
> +#x509.pq.private_key= <pathname>
> diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
> index 914261e..ed545e4 100644
> --- a/src/tlshd/tlshd.conf.man
> +++ b/src/tlshd/tlshd.conf.man
> @@ -125,6 +125,19 @@ a handshake request when no other certificate is available.
>  .B x509.private_key
>  This option specifies the pathname of a file containing
>  a PEM-encoded private key associated with the above certificate.
> +.TP
> +.B x509.pq.certificate
> +This option specifies the pathname of a file containing
> +a PEM-encoded x.509 certificate that is to be presented during
> +a handshake request if the peer supports post-quantum cryptography.
> +If the peer does not support post-quantum cryptography, the
> +certificate configured in the
> +.I x509.certificate
> +option will be presented instead.
> +.TP
> +.B x509.pq.private_key
> +This option specifies the pathname of a file containing
> +a PEM-encoded private key associated with the above certificate.
>  .SH SEE ALSO
>  .BR tlshd (8)
>  .SH AUTHOR
> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> index a0dd47e..d9b68ed 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -59,9 +59,11 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
>  bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
>  bool tlshd_config_get_server_truststore(char **bundle);
>  bool tlshd_config_get_server_crl(char **result);
> -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> +bool tlshd_config_get_server_certs(const gchar *key,
> +				   gnutls_pcert_st *certs,
>  				   unsigned int *certs_len);
> -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
> +bool tlshd_config_get_server_privkey(const gchar *key,
> +				     gnutls_privkey_t *privkey);
>  
>  /* handshake.c */
>  extern void tlshd_start_tls_handshake(gnutls_session_t session,


-- 
Chuck Lever
