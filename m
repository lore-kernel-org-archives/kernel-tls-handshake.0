Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E042F43
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 14 Jun 2025 00:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861642; cv=fail; b=c+YHa6qpkI9wO4o4ICeqPqCioEJQwyITm401o/KauQAgEJ7MZb9jBcxxPTNNTK9Ty2pWtFGHG2rMDzoOPyVGWBggmA3ejZeHuYcGP6dpr1DlZu8XSmhnuL8oY+HTCUrwKMRd+5u4pLkruPzMYEYt0wGwD/8QaXh4QPp70zUQFwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861642; c=relaxed/simple;
	bh=pcnKucaSVpEQAj/jYtLXaUAzanqwltwiUW3EjIacr04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=no4kBKcmn+Fubm6KyMqiwfmhFVylVhbeU/CYAq51rKJYukW/rVuUupVyUQYiYYJZ/2sVMWswpQz3ZSSUvRFidjiHVoVALWGnpYSjHkaqN+SHGRIuoF5pFAYvrOvPA4fCBLceGsXnbD5bLTXCUVn/XnauhrDF9oo0d/gHe8uKdDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pds/n8om; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ouCL3jW2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pds/n8om";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ouCL3jW2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtcep032698;
	Sat, 14 Jun 2025 00:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=45CT62BQFBEMH2fGlXddcqZoTNe9qDkujmaAhfPeUCs=; b=
	Pds/n8omvHsLBTMVqWN/Pv6/QQl82FDzTH5j2cmEv4zBPJkbkqK1oyZCaws9h5Y+
	sMhwu5ZS+/hsCEF1RWWiYbYfRy4LmwflaRXk9G/Zk3DdC9SaXmgvrOsLKK0ZHa8X
	ZNxs0DwAsR7jM9SOhksEX7zH0sh7t/VpHsDLztZ4cM6NRgJZsdRiedsGos98bnrG
	F/4s07QG95layE77sfxjauYaqXKJ1HJa3GvjGRhD30ECHDXYGSXN9XyG5vzL7eyr
	wLJgaS/IFIM2808tGfR168SVMIgDheBfT/VxpSGqMv55+4A44eCJXFM0olhvWFhf
	+1g02/Z/fCV/85yAdqDEVA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1vcg8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 00:40:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DLSvWt040845;
	Sat, 14 Jun 2025 00:40:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bveff2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 00:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knnpJJkB1IBwY302tbHp1grkC81TWk44pr/Ie7EcsqIYH0MRtTI4/eDRlqbOfovFTIF0jA6qf4K+qi2nLlnYpa2DDC0EUEXWgjm0M9HzwK9cGTyKtz+r2ETbF4VEwroTKY50TuWlIhU/+HyMPpVEKQXr1Q/Ip5Wn38O6uA/2KELVNgWxcba3Rsp5CNoZXJbJQ9amgQaBUC5OPLAdk8iDLU7C3pyd5TrpMEPjkwq+0syTil14QpEFN1m1cqpi5Jcuhq4grY2cnF7UzFG2iGOA/rtW9aj1es1dBl1TaJvAtKrx0LJ73xd7HUrCz1+3WaSa1NFG0fyQ0kWQFvga4P0gIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45CT62BQFBEMH2fGlXddcqZoTNe9qDkujmaAhfPeUCs=;
 b=W9kwnwi2pjbFlQeajiNuvEBNd2pQohhJM9Iku/SYPZPOf+CGR1cvSDro0ufbgZPE3rEWNBH0zAD9jp5YeHn9jePQtTXsO23yeMWjOnb8FrfSjHbmsPCy4W9DuLVWv7wrkZ0NSeDNy+UGFq2KWCdzmzJfXhVaVZhVLbqegOF5AJasg3Kf/wb/AjYpj5yo1snQU6vH/djaKtqBzICh0nyUT5rb1L/FyEckcpYisQ5ZCcolE/4C9ZCOu10M66zybYO37kaK8MpZhl5BZCZ0AcRQ74NMVDLwNIfaLWtcuNCGPiq3knVtvqi+Lml5EfuMARkyr3n4QXH9g9D/i2qwJE9VLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45CT62BQFBEMH2fGlXddcqZoTNe9qDkujmaAhfPeUCs=;
 b=ouCL3jW25FLaRiBSLgKqY9JvaJllhFzzQbQSeZ3KQKKz+dhc2V3w6SBGnbfqdXMu7QyDALYrS8T/UuswMOtpBgGdjccCoS97IMYHgUeViQCpKggRUV7h7KsrBVP1t4i7//cwdCYp3LpzQFwr7WMQph5XzgVuauabBb2lYyT3FYI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6276.namprd10.prod.outlook.com (2603:10b6:510:210::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Sat, 14 Jun
 2025 00:40:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.018; Sat, 14 Jun 2025
 00:40:32 +0000
Message-ID: <6b62e314-02b1-4914-a6e1-ddf7a24ad644@oracle.com>
Date: Fri, 13 Jun 2025 20:40:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Ken Milmore <ken.milmore@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
 <07ebad41-0c74-4fc0-9e34-d2dc959a1d7b@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <07ebad41-0c74-4fc0-9e34-d2dc959a1d7b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:610:4e::33) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b04b909-61e5-4c97-183f-08ddaadc1152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWEwS016Ym9mckVBZXBxd1VJQUx5di9ZVG1YS0g5Uko4Y2tjVVUwVmhqdTN3?=
 =?utf-8?B?UitDOUZQdVAzcDkvM3ZuUXpoVjhERXliaytGUlJiL2FMN2M0U0U1V1lqZkZn?=
 =?utf-8?B?OUhJeHRPOVRQdlVoRjdUMndBWDdwTjFyQ05wL0o4KzYvSFJrVW81N1E0NkZB?=
 =?utf-8?B?NW54QU5CMTRVMS9oSDdXalNjdHJnK3hUTjdZd1ZFR2Rxa1B1Q3NHeGNwcHR6?=
 =?utf-8?B?RGRVV0VCcCtvY2FnbE1TM0M5b0NZV2xHS0w0WnlGU05ET1YvMjdES0xvNTEz?=
 =?utf-8?B?TTUrYmx4SUtjNHd6eHpDUE0vZ1QyeGQxM25kbnVWR0tSemhSNSthbmJRRlk0?=
 =?utf-8?B?cnNGSkdpWHpWS0taSjkzcTZQZ0gvNlpuMWRicUFsSC9XbWhTajhEVjU4VWRM?=
 =?utf-8?B?dzdPWER2dTB1RDlvNk5tTmp0TFhYZW00cW1ZRnZTWWhZc1JHd1BOZE1Zck8z?=
 =?utf-8?B?b0NWc3hhT0dSa1hvWnVGN0FVajM0aTVhZ0hHNWxxY1RFaUF2UzJQZ2dsMk5u?=
 =?utf-8?B?cHhGaVhCYVlqNkdUelNKU2RjbXNJNHZINHNDbzFiZWJjbTJFM0hiVU83ckRV?=
 =?utf-8?B?NjRnYjJnOExjcWtXNWtPTE1ScVkzSnltRUVOWnNWa0pQWGRZdHVrbElHNncz?=
 =?utf-8?B?bW1xdmxDTGMwYldaL0Mwd3JTeHpBbHFTQU9rVmxWbFJ5cjhkQURSTVh4bnVk?=
 =?utf-8?B?MGtCU25YLzE0Ylo4azZ1UzZIYUpvTWRQVG1SbWVRL2pKMzl3MC9kKzVPV0hJ?=
 =?utf-8?B?K29iS05UYUt0ZnlwSEtOU3h0QW5HcS9MMmFBRVZCbmIzalJqNWt0WUlyc3Nl?=
 =?utf-8?B?ZHRScGRPSnUvWFJaVXFHa2VpNFNPMEN2SGZ2NlpvcWxDdCsyUWd6OUZ2eGph?=
 =?utf-8?B?NSs4Y1pUalBsbld2L1lrdmN6U1dHMEVsWmxNejN3RjcxaHNuYURHcTQza2d0?=
 =?utf-8?B?OG56YXBRSmp6MlFmWTI2b2pDNjdxbEx3OFp6T0twbklzcDBGNDlMQi9nZFpp?=
 =?utf-8?B?c0tYZ3psWVRWZDUvaVN3azc1aXAzcmIrYXp1MUs5VWhjcXdwNytIYXc0dWZk?=
 =?utf-8?B?UXFWRjBVdU40Z0xWZ2thcU5qd1dnSkhUQW5TOFB5SHk0cTFic05ycHVWZTNE?=
 =?utf-8?B?ellIT1R6aHpUVE5YR3lmZm9GNDFWeHZ6Zm1JbWp4Q0Erek5XNWRYM2t2ZUg0?=
 =?utf-8?B?ZlRLazdDVURoUU1VSk5iNlhpSDlzU1VyK09NM0VQbTNRd1hIUlNFb1dxY0I3?=
 =?utf-8?B?KzA1bEJUTEh5M2ZLWkZydzFLek5OdXoya0wraDloU1pQM243dU1Ob3l1SXVD?=
 =?utf-8?B?TnAxWWoyODNjcTAwRUdQcnhBQ1lJYUN6K1E2RjdEU2hwTHVqU0xXZmozK0Vr?=
 =?utf-8?B?ckpZa1NVa012L2lCVkdYOFNiRkdWRVhKNlVaRTk3QXlFN0pVLy9QcWY5cTBH?=
 =?utf-8?B?cS9mQUY2aTFEelArZFI5NEdaUzU3OGcwdVZuL29TWjMrWUJNWVdncFdhTExY?=
 =?utf-8?B?N2wwbU1PNk9MRk5JcitKUk5kaXJWVHRmZUlnUnIyQ0x5cFU4c2VQeDc0WDJS?=
 =?utf-8?B?TFA1WUVwcFBXOTJLLzN4b3BJMGgremtYVUtTNXovcEpkQkdtYktRbWtLR1ky?=
 =?utf-8?B?Ym9zalRGSkc0bkx0R1NVQ1RmeUJvNzZlRU9raUY1Yy84MXdZaWllVWVnK1h1?=
 =?utf-8?B?ZzUzb2JObnVZN2ZzUm5oMGRVRmkvcFNESWZjN3lDYUFhSEdQdk5HNTBGSkVG?=
 =?utf-8?B?Q1JaRGoyL1BEUXNXK2NsS0xTL2FpWTkvKzhYcFI4WnhCNS9PQnNCMTZIR0lJ?=
 =?utf-8?B?bWNLOWlKanVtMkRuZ2prb0pDeEozdzJ4aTJpVklZUWVkYVJqTEZrcEJ0Slkr?=
 =?utf-8?B?dURkNVdzRUs1eTVQbGtkK3k1UmpOWTV4N2pDNnM2ajdVSVhTajRqOHNnQmxp?=
 =?utf-8?Q?2UwPNw48sOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFFoYit0dHU3U3l4OGtXek5KSHRoK2N4V3doSk92Szk3Q25KS2tIU1k1bzZ2?=
 =?utf-8?B?UFNNWElWdkFKOGdXR1Q2amRTa1dZRWFlSWJkQ21ubWg5UlQrREw5THRRalJh?=
 =?utf-8?B?SVlsZ2ZKbmZBZ3ZSQXUvWUNkNjV2cXcvOTBFUmJaSldGUm51V2RPc3gxOGhl?=
 =?utf-8?B?dTB1Tm1pMkZtbExMblFGZDlQVFZiOUt0NEg3ZkhFTkNYRHhTNGZONmg3c3dH?=
 =?utf-8?B?cnBTVXVwbFBkQTVqRGhtRmppQlFIa1RncWNvbnczLzdueS91TllpR3ZQNWF0?=
 =?utf-8?B?bVlicHJaWnpUNWNjMDlCak02bDhBeDUxMTVmYjlEK3pXY2E0bmRZU1pod25r?=
 =?utf-8?B?eHVpYWVvM2tnakVWZktMZjZrL1l2ZWlZTGVYWjlWYnNiaUJINkh6KzFROENw?=
 =?utf-8?B?ZHNmQnF3SUlSU2VZamcybjczbjRWRWVkbWd1K1F2WDJPL0ltU2Z6Y1F6L2xL?=
 =?utf-8?B?WnlQWEpwR3Vod0hMNWdkdkV1dENYQ0djS0RwajFNbXVtM1p5NVdSb1pjMnRj?=
 =?utf-8?B?NDMycmZaSWxTdFRydnNQdXo4dnR2ejkxVjFRTVdjUjRmbXJIQStueTlXOXF2?=
 =?utf-8?B?akxTMmdtVXBvV1hZck5UN2t4Q2UrWHdDaEJsTWpydUI2MjVhdG5nUDNiUXBZ?=
 =?utf-8?B?OHNtL1BudmZoSk5WMVplUGFDTVdtdHZwVXdPdnQxcUU2dnNhOXZFN0hoWHlU?=
 =?utf-8?B?VlZacy9la3ptZDhQeVkyd1ZOOUxoNDR2ZVVUditBQVBUNC9ic3VvOTlQNk5D?=
 =?utf-8?B?SE4ydjdUSVVKVWdMT09vaDkvQ09rdktERmNXYjFja3dUbHhzbThlUEhXYXpK?=
 =?utf-8?B?ampDVmRWMHFhQUQ2WTFHNFRZdlIyUzRZMlQraWZYUllBTHJlRHppM1lJa3J3?=
 =?utf-8?B?VnJhWWRTeStDNWU1TVpIV3VDZTNZZWlnU00rbU9aTzI4MWlIYXl2em8rczR0?=
 =?utf-8?B?TUF0RklRTHVFUjA5ZzNBRUNWc2tjT0p3bEh4a1BuQUMrcjRmVy9yV0Nxc1Zp?=
 =?utf-8?B?T294VzNjbndDRk5OZlZ4a2pOdWY1T2RwZnVsWmtzdmttOHdiVkFUMTJlY1Yy?=
 =?utf-8?B?NDdBb1VEQ2lkaFhncGdFa3c5YzRhOFIwNlMwTmJ5TFJiYmtNMkljd3oyRkZv?=
 =?utf-8?B?cmZYZ3VnQ1drV1pwNlpPSHBua1hZRVczcjRteXVoSlQ4TXM4MURrUE5KWWlS?=
 =?utf-8?B?cGVYMVplOW5TRzN3WVkzdlZKSjRJK3RNcjAxbWMwVU1sdW5Rd0JaZGlZb2U4?=
 =?utf-8?B?UVZjUHBJMWo5V0ZIektIdjRoMTlWWHk1NnRkbWlNWGdzRVdNS0hOVWJwaFBW?=
 =?utf-8?B?cThPZERGOWcxQzRjY2Q2WENZUXNSUVJpc014dldRemUrMng1YW04SXZUUWpr?=
 =?utf-8?B?dGZCUDJERFI0WDhyN05VQUVMQk9QUG90UjhBTGdLdTAvRHBidTZ5M1RUTmZt?=
 =?utf-8?B?WHdNZjB0aXBKQzV2QmpLODVUUnYyYjBjVXVmcFRXaVBKS2s5RnRweFBDaHRT?=
 =?utf-8?B?aWdoNEdLN1lNcm5rMDJaTnZndzhDQVM3UXRGL1Q0a1cwd2ZxZXFIL2xwVHcy?=
 =?utf-8?B?VElSQzV3Y3pBeHp6d1V4VjZCdFJtK0ZRazNxL3U2TTUwVDVldVVGMmExR282?=
 =?utf-8?B?Umo5OGc1RmVuUnBEK2ZzemdHd2hqNzZ2aE1aUmFOWmlOMW1GYnk1SkFJMFFV?=
 =?utf-8?B?b2FPZ2YycWFMang1QUJnT0NmUzlUTVAxSlI1ZjFJNmVDMFNpT2U0RVpWdXdP?=
 =?utf-8?B?Mk9QT0RMM2FDV1VSL00vZzFVQ3ljaVAyRy9qalRsMVVyVVlxUDBGUjZwK2JN?=
 =?utf-8?B?cXplYlMzcGhOcU1kOUdTdXdoTitQdVFPd3FJN2k1L2ZVZUJVRkxIUFFwZUI0?=
 =?utf-8?B?NTZ4RTlKS0QxL3pmYVl1UzJOSkxpOEZYWFJwNElMU28rSnNQTnl5dzdBNkhi?=
 =?utf-8?B?ZlRXVzE0WGU5TFRPMm55MnV1c1Z5Qi9MNFQySlQxQlQ0QzZkWUVjVzN6TS9R?=
 =?utf-8?B?RVZmL3BOOU5vZGpzSEhEdTMzL216ZnNKT3gvVUhpREkrMU93Ti9qemZnTjhY?=
 =?utf-8?B?Vis2dWZnYyttZHpqcWNxeTM4QmJMNWYzZjJBWmp5SHN2N013Q2pDV2VKRWUy?=
 =?utf-8?Q?j2tcm5vMpsKqnCMUVidjJglHX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XvZWVeOoKdsPddmaYtcaHxiThmi9meDqWN5kDnevgBe9gUnSZPzQtV05hgDE/tj+8eXRSVRFaOWh8SE1Pub8h05Z+YO+4ZMrhvdyHKQ6Tv6e2vKyovPkDpZ/qpabeuOSdjSGDH8CfgEBkpb4eSEpvkhJDJ80DfVQk0Pr/+veehVUTen3OzIkHT5d2HCYB28kvhJZzmGRgGHOwGd38TGe3BYjKRQktQulcfero6YfofHN5BVzdf+dmJotXbuBoydEk6kI/oz5ovAEevXRiV+qTlTudIxPKWHHN5+wlwpkigqQ0fEcOUyZxgZJv+ZfMr7FG8zb3uVqO3Ch7bvNp1iz27g1Bqx1mculXZyYrrSMl8ETZ/zlXNb/a+nRAm25OKcz407v2v1WROHp2BpegyhFHptkk1eTUVgzB8cs33weKZLRLqwQ8wXdH6eSdw+21bjdWylUwmFA9leH1KYEx25aZb6jjt9haTm+eUO572Y4U3hgqEgB2cIiJLG5M32krn9Opd1tcetDNZplzqUx/DS/x5KuwIsVKsCwjeMn46luFTrUhnILcvRSrpoizmMfsDRKs86GaN01lNCh2Q7B/oioBGk9CCZWPWew+HpscRoVNII=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b04b909-61e5-4c97-183f-08ddaadc1152
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 00:40:32.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA4/a0kEzzETv+u2hUS9WG4ECj1/xXixOz77LL0lAb6refR2vmUuM9VW8C2ISrwAIXPEC43U6Xs9A4YsD1L4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6276
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506140002
X-Proofpoint-GUID: RkVql-4QLP3AljYHRAgqTjadrZ4DeEJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDAwMiBTYWx0ZWRfX25sW6rZ8HNU7 Fp1u7OrFbGdBlTdk0RNN0J83AvGBGCG6NNplloOfgBj2AmXYcaVSY2qxZYFgUkKvZVL2gu3bUKp FNStIPrkaOZRsBcWHfVXZ2a9Pqe4BlSI2TQ2hOYg73cWk7M4q2OQ+jdHw5qI/I8yzSEAO2ootW9
 CC3pciqcGusX9Bv6JQn4HSLnj2itdGt+3ai2J7eY7q3XxZqB/O6NoBIu8M2HmvA0WivicjHPe09 sHjmW7cg+1ab6uOkwT4OmW+N/2vHdvP/ApNO7qKPdgcXNtkLI7tRRTObLrnljbIIHe1yv3bbj2S y67wukQGkp5I6R2tOkvkalN5Lqjs0HFydNi9pBBbY1IvBD3mfHcs5IggWkMn7OPHPI4quQEf3S4
 fFpSxRIOowzJQbgcDcsFBovw9Cn0AUm3vJAe+1jGvE7cTDxeTbRBgjQJk2vNqpSz+kR/URR6
X-Proofpoint-ORIG-GUID: RkVql-4QLP3AljYHRAgqTjadrZ4DeEJJ
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684cc505 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=cTnInNxruzCv-0ky-p8A:9 a=QEXdDO2ut3YA:10

On 6/13/25 7:09 PM, Ken Milmore wrote:
> On 13/06/2025 22:42, Chuck Lever wrote:
>> 1. [PATCH 5/7] server: Add boolean config option "verify_peername" under
>>    "[authenticate.server]"
>>
>>    I'm not comfortable adding a DNS query. There's no way for tlshd to
>>    confirm that the query results are trustworthy, and it will add an
>>    indeterminate latency to every handshake.
> 
> But note that the existing code already performs a reverse DNS query in order
> to obtain a host name from the peer address for logging purposes, so there is
> already an indeterminate latency cost.

In the current 1.1.0 code base, there are three calls to getnameinfo(3).

There are two calls in src/tlshd/log.c. Both of those use only the
NI_NUMERICHOST flag. They do not perform a DNS query.

The third usage, in tlshd_genl_valid_handler(), is done only if the
kernel does not provide a DNS label for the peer. On a server peer, that
can add handshake latency that could be avoided. Adding more uses of the
peer DNS label makes it only more difficult to get rid of this query or
make it optional.


> The forward DNS lookup is a standard practice for increasing the relibility
> of a name obtained by reverse lookup, as here. I agree there are ways that
> this can be subverted in general cases, but that is true of x.509 with DNS in
> general. The present code doesn't perform any additional checks on the
> certificate SAN at all.

Yet. We have a lengthy to-do list.


>>    IIRC, tlshd used to perform a query like this, and we were asked to
>>    remove it by our security reviewers.
> 
> Fair enough, but I would be interested to know where the security risk comes
> from.

There are plenty of well-known DNS injection attacks. For example,
an attacker can pollute DNS caching servers that are not under the
control of the local security administrator.


> AFAICT, providing a (forward-confirmed) host name for verification against
> the certificate can only reduce the scenarios in which the certificate gets accepted,
> it cannot increase them. That is to say, if a certificate is rejected by the existing
> code without any name check, it will continue to be rejected with the patch applied.
> If I'm wrong on this point, I'd be grateful for a citation I can follow up.
> 
> The only downside I can think of is that enabling this check may create a false
> sense of security (which was never there in the first place), if the admin does
> not understand the implications.
> 
> That's not to say I don't think that tagging sounds like a better solution,
> although given the widest use of x.509 certs is effectively to verify DNS host
> names I'm slightly surprised that you don't want to support DNS at all.

A DNS label is trustworthy when it is carried in a cryptographically
signed envelope with a verifiable chain of trust. The DNS labels in
TLS peer certificates are therefore trustworthy. Those acquired by a
typical DNS query are not. I'm not sure what you learn if the two do
not match -- your DNS resolver is compromised?


> Note that the client code *does* already pass the supplied host name to GnuTLS
> for verification, so we have a situation where the server name matters on the client
> but not vice versa. I was attempting to redress this asymmetry a little.

When mounting an NFS server, the server's DNS label comes from the
client administrator, so we assume trust in that information. The server
does not have the same benefit with regard to client DNS labels.


-- 
Chuck Lever
