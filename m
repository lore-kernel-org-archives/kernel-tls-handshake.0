Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504C2857DA
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250256; cv=fail; b=QE863rCufi90cxqRYsFw9WXs/G5dvPEhp+kg/kDBjZ5dg3jM6QWTPreH68cLo7dsXQFY6+RiptEDYklVBFECGgqWMl+gE7AOfFwq1Dva3kGocWVJd4oINFZ3ChSbXSyyDeQ0Q9VH1nj7D61IHbshBLDDL0KXi9Wtt2n40pvy4G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250256; c=relaxed/simple;
	bh=M5+0eNYKIGNffVrCIUS7bR/Eq33XOSfYGJ/BVKagHlE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LWKRvAVtIKZlBQns7N/oQubrvFrXnU2TUAzLU4V5H4eFg66FUPieBvTdgruRmBSUHSHilo0/P/BdO/ywwnPjakmqGCC71wJI7XiDqzu+3oNLANtmkWE8hqxZLcUjCXm1X3eGptO5q6UvoaJankNkBX8fWhKwQSPDy3z5JLRXbEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JzHpWOtc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FrcGFQy+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JzHpWOtc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FrcGFQy+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICQnmb007335;
	Wed, 18 Jun 2025 12:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BR+78vfWtzkuRepxsjvLCuLex2B3GoPl8aCGXT5bohI=; b=
	JzHpWOtcx9TeV0FkzSrNVDM6DPuwdU9UpfnQKD6BIT2avY2KymK0rtDEMu3uNhpx
	5fkCRbpFNLb9HxDZYONGNJbADjDK3AjmXpMgGWXqSJI8jd0zV2pgGXar173XnVpm
	YhNP59N72fsKVQXoXljOCoqj8M9TdkHFIhi5vrt9Up5QWrC1dGKV8a7Bs5ugvv2q
	O9PvMI+OGqC7b2XDHe5qM5iNnFZGDx9R4Fgz9JdeeH1TPapeywP/M+xl8naTVCq1
	n0nqeBdTLul8ACgpidH6LlOb3MOb1PmYXOPfV564yfsdld2xERkbFNOwhwRbGlIt
	ELct/kY+UggHCPhCYv9s9A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xu6ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 12:37:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICLnQB032069;
	Wed, 18 Jun 2025 12:37:32 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhakks1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 12:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdmzXYEAXNPfmLQ+o5lvN73gR8KPvXkpLMfho+5fOekqBJEclyUqkgOyIdXSYTXnBpzufoW/Y0SUswiYuxsm3EsLual7eZNd6W5M1GEA/Ns+aU2hTvh24guirfHSCD84lez6IkbhRwaVftcTbMeK7eHLvbUFxVKxvJfOmvWJQxXpCWUDh4Se3K+hmraQBMHfQ+zuYUyoHW3jjgjJP62fJ7gc2j6A0KzPQ7iFu2ZLDv1D1TJ1u4GPUPy9vrxEkTvcVyJdYg342Vviq5XjPffFBQK5vj+s57CP+MoQcfXwCt22bls1zj6Y+jQsbTwHq7HHNQou5+TulM9QHMPt2AdKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR+78vfWtzkuRepxsjvLCuLex2B3GoPl8aCGXT5bohI=;
 b=QV+M2z3ka7xp1X1nzk9JDoD6JAU/DpcVsdeb3JX1zt2RHmQgH3i2IyW99xiBLx/TQIMbNK7vk2fB965Z3FtAetyycPBSblUonRWsKWGuZ2p+4cfxtITReQztMwI6yJ7Cd+vVJCgRxiDccK86wayDgAgEwvOMa18dfBJ+QUei9Yis89xTBAFLGDscF4ZxMjcUgli4YuG02Ak17xx+4HT8+n6dJveurqZtoolzUUq1Au9WnELcxN8XErdK5DkDGeqSUF8fhCx1s4t8Vu4pUrnlrYRMf8wONxc+4wDGcBrXnS5xBiUXEIai2WDwhU/asKLIyqwdF5rvdW8QCiK9fw7yFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR+78vfWtzkuRepxsjvLCuLex2B3GoPl8aCGXT5bohI=;
 b=FrcGFQy+JUVViMhGMjvJEZPwe70lNGCh1kG40/n3oRI5mDL9mq37dYfJe/at1VPflaPH4l7HKyzRqFzAlG5vMAeOLw5WAVoOBgL8VFhvStWv76bFIQYo7RmOBEFe+GhcmNBKYUf0uwI7Y8yhXDDc5lzRmtfr/dNxV6BHgvkwDk0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA3PR10MB8514.namprd10.prod.outlook.com (2603:10b6:208:571::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 12:37:28 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:37:28 +0000
Message-ID: <46bd64f1-ddac-47e2-9cd0-c1e83dde39f4@oracle.com>
Date: Wed, 18 Jun 2025 08:37:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add CRL checking to server and client
To: Rik Theys <rik.theys@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev, Long Xin <lxin@redhat.com>
References: <20250611070943.235087-1-Rik.Theys@gmail.com>
 <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
 <CAMApiK_EsvOXrdSYgG6Kfnd57AChBML9v7Wj=xwFvLFk1eeNKw@mail.gmail.com>
 <2e28a18d-145d-48eb-9111-65b5dfbfe818@oracle.com>
 <CAPwv0JkNRFsDEqXnSO0JNm-7a5LmgUf-zi32T+Prkyyf_tt3Kg@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CAPwv0JkNRFsDEqXnSO0JNm-7a5LmgUf-zi32T+Prkyyf_tt3Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:610:b2::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA3PR10MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: f559494c-a36d-4aa2-5ad8-08ddae64e2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elZDUVV4QmdoZFlEZ1RlTW5Ob2M3NHdYQVdkeXhOV2U4L0lXbGtVenhGUzBs?=
 =?utf-8?B?RHEvcklRTnNnSVBVdTBPOE8rOENoR1g4UXcybElBUkRqM3hpeE5rYW1EcmZo?=
 =?utf-8?B?akc3RmRzMUdRdC9EMlBOY2FtWVhOa0ZZSHFlS3dmNkJIYXpaVHQ1WHZva1ly?=
 =?utf-8?B?d2locGJHckl5b1hleVoyMElpSUc4bTdtanNEVWpENGNlVkQyL1JtdjhKdFox?=
 =?utf-8?B?QzlxTk1CZm80YTJOakFEZSs1YTdkZ2lpRzRYRTBmYVM4ZDd6VklkbitmT1h4?=
 =?utf-8?B?YnRjK3lwNWoveHg1bEVvRE9OOWt3cW9pbmhpM2ZxOTdPdmJiWVVuRDV4cCtP?=
 =?utf-8?B?OWxtUnQyWitLY1R4NEIxSEZiY2RYOXRSR3hFbWlyOS9zTG5uUmxYMnN3ejNF?=
 =?utf-8?B?empMYXU3d0s5clVjM0lWNyt2TGYzdFF5RzJsK1lQR1h0RFdNOXQ5ZCtXL0hq?=
 =?utf-8?B?Q2E4emVRdTYzcnc0MmdmdTNIN0t4aXhnTnY4K0dIRzMrWlVOcjEzcGxuOFN0?=
 =?utf-8?B?cnA4OEQ5ZHZBRE9RTXA0UWZUbFI1bHk4UzBwL3B5OUtjcUNtMEJIQzlBT3d4?=
 =?utf-8?B?OG05dG5lVy96NklvMjhDb081NWRKbkxjZmxsbjVQUTVraXBJU3NNa2s5N09V?=
 =?utf-8?B?dzdadU8zRVpjT0NTanFmMkFRL01OZ1l0amdzbExmUzhRUElGWWpsWCtWUm8z?=
 =?utf-8?B?Ukx3UEFKV1FyUjBpNE1VL1lrVk8zakZDYm9kc05wNjZ3Wkxkc21IajhwTDJa?=
 =?utf-8?B?S1l4SWVhZzRIV0tVbnJJZXlldmNjUnIvWitJSG02VDZ0YUdYeEFaTnBIRDZ2?=
 =?utf-8?B?UW96WUpqZmYwTzRPQWxMUlpqWHFXZkQ4dHJVQVVkRWlISUZBWEpxNnFybVZp?=
 =?utf-8?B?Q0Ftb0FOak93RzBGUWl4UHBMNTR5aGY4bXdSZjhqOVhqZzRCMUVhNms5ZDUr?=
 =?utf-8?B?N05NU010RlBqc1lZU0NaS2tLdHNxLzFWbFNQNmpsUHVBUHZzMjFUTThab2M4?=
 =?utf-8?B?K0NuaWJaRW9kcWoySDZCdWZpK3JGSXRFSCtTQTJkbmVmRkhZenRnZEMwY3pk?=
 =?utf-8?B?TXVRSkNPMkswdU1OQzZCeFp4SUphOHo5bWdpVndaOVJyVUQzQ1J2K0R3K2JN?=
 =?utf-8?B?ZDhkRzQxZkxrU1hIcjJXT3dEdVdXQ2RTdEhBaXNHRHFsS28rdFdkK25HTlZs?=
 =?utf-8?B?NXFSL3FwWjZXOThwU0xraHZyMTFpNDE3TXRIWitDaGJ1T1MrLzFncDZpUHZm?=
 =?utf-8?B?aEhIc1NWdllLYjBoYTZZc1Q0NHhwVXQrVDIyWjVQZkxYTEh6VTA0eStLeG44?=
 =?utf-8?B?NWNGT0FXZTRJWUZ0TWNVK2RIYURORWs2cExXWENtazg2WFJHNG1VVU1GWnlV?=
 =?utf-8?B?ZEtXeG8wL0dyQzZqU0gyMnRBdFlLTjBvdG5FQjBRaFFOUnJoWGlGYkoramxL?=
 =?utf-8?B?cjdjVm4vMkNFVkRPNDZjWWh6Z1MwOGp3M2FCWmNvOFVsQ1FpSnNHc2pEWFFy?=
 =?utf-8?B?bnpyYUpYQUVXL1d5ei9aQjJyVjdFMUtkcU9VNHNGSFkxZ3AxeWhYVmhqcGJI?=
 =?utf-8?B?NmlHOWg3ME90TUlTM0ZQMXN6dDhRem9WSHZVMGtyYzhqRWxZbTYwVzlvazB1?=
 =?utf-8?B?eUlKQXVGLzMrcnlXK09hU0VrUTJQazdWTEFNNVdhbWErN2VUYTlRM2JPa3pS?=
 =?utf-8?B?WHhyYVVsZkVSMlVYem13bEVKN0xzNGMzSkZCSnI4OEI4Qm9DQ3c1N3J5emZx?=
 =?utf-8?B?SzVkdld0Yy85U2k0TEtwWmtTaUtKeGhhcHh2OTF1WU1TY1R1T003bFUzV2Zo?=
 =?utf-8?B?RGpSOGE4SVdnZk1MdlJFRVJScUxQaHE5bmtlUHJtWjN2dVZaaEJid2dHR0Z4?=
 =?utf-8?B?NDRHK1J2K3kwUGhqWnY4ODIxbUx2TWxhMjdEUHZwUXRLWlNCOHAyZ2FZMXU0?=
 =?utf-8?Q?sV5HUhO4f5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NER1bWtwcGhTOGUyQVM1bnVQRDM5YTJYUExxTEt6UldDdHB5OVk2bXorWjdN?=
 =?utf-8?B?Y3M4MkU2cUlaTlRuRGtoQS9XNjdkRjc1VXpOa25LVFpLSE1vZlVaZ2YzMmpE?=
 =?utf-8?B?Yk5nUGtqaHE2VzcvU2hoVmJZYjczalhGem9NYmRXcGFnaXBTV3FRVnZkc1Bk?=
 =?utf-8?B?T0Zsd0RFcGEwMFo1WHU1NTEyQXBBcDF5SjV2RTJYYStCTG40R2lDWUJtVDd3?=
 =?utf-8?B?RWJNVmZnb0Q5V0lMQ0hOdHNnTFhYNEpVRmNxK3dXdE5xdFlncGxYUE4zWXZH?=
 =?utf-8?B?d0pPaGlTL09KN2xhTldWQ1hVY0Q2Vy9rZGwxc2ZqRDhKVnptVm9zelE2N1hW?=
 =?utf-8?B?S1VTYWdZWEt0ckcvWTRSOWwxcEZ5Qnl6dTVTZURvRG9mc3U4ZHFaOXBkMFcv?=
 =?utf-8?B?Sm4xL29RekxxZTQxN2NlUGxoZndtaUk2bmNXV2V1UmQxM1BjMHdsMENWaENX?=
 =?utf-8?B?RjdGNndYaVl6Q25FQWVZQ3FCRGd5VmhEc0F5NDUwbUpvOXFKeUpvbWdHOGZk?=
 =?utf-8?B?UHZwN3NpRHhOTWd4TlhKK2c3bm5GKzVFNG16S3ZlUjJ1MXJlRGZvalZUNG1u?=
 =?utf-8?B?YkYzZUJVMS9LdTFCWGlmaUlXNjk2dFBDWjhLRlBjUVlLbE8vTVQ1c2xQYllj?=
 =?utf-8?B?aTEvVkttNTZNbHBFeWtWT0ErcjBSMEFBMGVRVTdQajE2ZGNiU1pJL0ltaE56?=
 =?utf-8?B?Wll5YUxkNW5kVnZTTGt1RVZYQjltYXJnOFZPUHdkRldEY25jbXk3RDl1QU5k?=
 =?utf-8?B?MlNLeDlWYUhEYm9QSHBDeit3NXFSWXVmeGdJUUt3MUY4a1MxN25OWGZ2SFZo?=
 =?utf-8?B?c3lEc2tvbW1tazJlY01ScU50WjYwd255TXJCdUxDUFRhdmNpNVd2c2l6aEVH?=
 =?utf-8?B?NkhBbVR3UFBKWlNhRlFpSmtub1QxdU44QnJPRjZXZm5GamdxVWpUektiRTJj?=
 =?utf-8?B?d1BYb2htUzhsZFRacUxQeWNBYlhQK1hZWEFwOS9venBVcTRMd2xvamQ1djI4?=
 =?utf-8?B?cXVtZTR4M2RodzFoUzhSd0hoZDliRlVTRUgzN2V6ODZkUEg2VmNvWmc1cXVh?=
 =?utf-8?B?ekMvV2thTXJrUER6MkxXbG5hNERzRUdaZzVKVit5MlNJNDJVNityemtqcjgr?=
 =?utf-8?B?clY4cCs0ZTlLSjhtZzY1UzZsYjI4b1d3UW93aDEzNUg5blRFYTJUeTByNndO?=
 =?utf-8?B?WlV0cVB0VGYzOHZrZThnZDdkTWFEalR2NER4M0xBbGpSVjZ5aFlHM2Viblor?=
 =?utf-8?B?Q3lmNS90SmY4bENqUGptdGl3eExza1QzVk9pWW9KVlZ5QmFkTjlZYjRhWWRo?=
 =?utf-8?B?aFJibE1VQ0NFRVZEVldsSHBLeWZvemIzV05TU2M1RnRoSUVKNjR3cEc0d3Jx?=
 =?utf-8?B?RjVYUnluMXowTE05Z2N2ZEJpYzUwVm1lSHJ6ZHBNTENTdHFCRHFCdU9hbnla?=
 =?utf-8?B?MHdQT1JxaUczV1FEbDAveUEyWHdWRlBFRldJRjcwQzc0WnNWZ3ArT3NMeUxn?=
 =?utf-8?B?ZkhXcEUzWENubkNtRkZSYWRsRkJIY2loeVZLSk80NlZMS2hhSlROOTduLzRE?=
 =?utf-8?B?c1Qvak5ndExaaU13cUcwWCtHd2JyNWI3akwyQkpVWlJhUG9HUnNUcUkrQTZv?=
 =?utf-8?B?eU5BeXBIMVdHR0dJT0dHOTlqVExWVmw4Ykhvb1JlVHpNOC9Lb2poc2EzUU8z?=
 =?utf-8?B?VkNIUVRzZytDNzl5U2daRWxOZGE3TjVTNFpBUEJjaytORWp0WndUU1ZkY2NP?=
 =?utf-8?B?TWlqUUZVMjRKSVRLU1VpZXdGdVFIVkc0TzJXQ2tscGlIMVNCNnBxSm5PVVA2?=
 =?utf-8?B?c2RRWllUYnJJT3E4Ly90SG53SzlncW9PWWZ3OUxkVEJ5Y3Y2aTJCbysyRi9j?=
 =?utf-8?B?dFJCREJzd3JXcGFNRlFnT1l1MVliM1VFREMzQnFqVytIUFl4VTJYeGdEcEZo?=
 =?utf-8?B?VkFZZnZMbjJ1Y3JnZmE4MU5jYmxDMmJBTGFMcm5oSEtBYnBYanVWZjZENUMr?=
 =?utf-8?B?TkdiVjQ3bzh0WFdFMDJhbGFUMVpmNFk1TDRQMVpsa1p2bkc5a1k4MHpuODVN?=
 =?utf-8?B?QkxZTXFWM0JPNG0wend0cE9GK2lYVzVrcDVLaHNYTmZua0pMeW1sS2VSWE96?=
 =?utf-8?B?S2puNmo5TmxmREk2eHlqdnI2ZWxMd2MvbTNFZ3QzTitVOXNwYUp2VHZTR2lJ?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6U0bouSHEfZaRBj/53233KHyy8VG+B+TLZeoLVrkYdk9nrUuKOoTDiRJhbnWubbeNvMKNIbH17iAkootqnnW7JAlqgiJSpUw4BSRUJSaFq8jdgsTFA/1/6zr20TywKlj7xJqULSwwmfmpWgYH/sOiS2yaVPMGIoEUrCkDRz79MJvE2mv8KQfEJucbgOk/MWadPP4/JAHdElbASmVN2TOATCLAG1UZ6J5qHDcMrguktHyYgKDspB2rzojx+2flTh58S4sHJS2hVpYtwmriECK0KotKdn/kEOcaYIIbCAw9WmKfFdNhxQIE6ReltOp1KGi1V84FBci+fhJsXdQZwGeMBMsl/MltFaBE9SvvKG19PWOj55R1rpNJ/iII3vasFPACuJGAjHde9st0gLCrVTzHYcvUmoGNWXp/a9XSRWT1s081KRni86WqAAOqx0LiUr4AtE9KBscILrblcJuKSFg4RhdTFqcEqoGCxLGV1w7eX2Q4QzSjyv7pBNjEEhipJxQdFOXWa6lEb1gwKSo68LdKNHWbwxAH7b/B2reEzUZpe500YrW2FaqMBiWRaC3rQUEBDV8hfG3d3DlSRBE6wzHepYwICDskDF059Wb5/gx1pA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f559494c-a36d-4aa2-5ad8-08ddae64e2bd
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 12:37:28.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3vL5LwN22ALjgy3iRvJ/gYt3mxwZKKe5Qh8AEzrvNdGlGZ9A5Q+WjyaI8ZSqDlxu4QEf0/6/judbFukQOiqPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNiBTYWx0ZWRfX4dlriTUwK5ox N1YTmmVtqcJVTfCX9hlCG/6G2zsMYg95z1dQk/StY2Lv94LArWtjOnNejo/zgFiBPkVivQ67ooH L/oJisYdhfwhcMx5W5XKpds/MQqiUIppkhUt5bf42tfhYeGSDExln7EpnZiAtdQkcBuqNUWtSXi
 F1ty2oExhWiZC9DjIEoTqVED1FuPZRTD6kemMcWvLBOj7I6ZO8P3fwsctLx65i5NYnx0xi7aeRP ltxzOMWvi8nfqLZZyRT5+9C5LdXLWRHugVkOsLPqrP8FqeBbotYGeLtZstjErmampShWyXAzVbW YKM2Q9E6H93smEKTIznjjG17pyzCdVftRBc8A+rugy0WXsMBG8DWI2zVeqhizL3H+BPS+gBJz8H
 MvY8RmYTIiREnX4vqsDHZTFYRj35WshrQthzOc13/klc4H0vIxXwZ5d7bugsIYt/xzcop1O0
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6852b30c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=AOJ4fzzsXePIJ-jd3mkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: si3mIY7RymilpCHOJrStvaAqnZctoCVK
X-Proofpoint-ORIG-GUID: si3mIY7RymilpCHOJrStvaAqnZctoCVK

On 6/17/25 1:22 AM, Rik Theys wrote:
> Hi,
> 
> On Mon, Jun 16, 2025 at 4:40 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 6/12/25 10:28 AM, Long Xin wrote:
>>> On Wed, Jun 11, 2025 at 9:49 AM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>
>>>> On 6/11/25 3:09 AM, Rik Theys wrote:
>>>>> These patches add CRL checking to the TLS client and server code.
>>>>>
>>>>> It introduces an x509.crl configuration option that specifies the
>>>>> location of a CRL in PEM format.
>>>>>
>>>>> The CRL (certificate revocation list) can be used by an administrator
>>>>> to block access to certificates that should no longer be trusted
>>>>> for some reason.
>>>>>
>>>>> See https://github.com/oracle/ktls-utils/issues/103
>>>>>
>>>>> Rik Theys (3):
>>>>>   Add server-side CRL checking
>>>>>   Add client-side CRL checking
>>>>>   Add x509.crl option to man page.
>>>>>
>>>>>  src/tlshd/client.c       | 28 +++++++++++++++++
>>>>>  src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++++
>>>>>  src/tlshd/server.c       | 14 +++++++++
>>>>>  src/tlshd/tlshd.conf.man |  9 +++++-
>>>>>  src/tlshd/tlshd.h        |  2 ++
>>>>>  5 files changed, 118 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>>> Also note that this will need a similar code change to the QUIC paths,
>>>> eventually.
>>>>
>>> Yes, there's no difference for the certificate credentials
>>> configuration for QUIC.
>>>
>>> I think it will be nice to have a function like:
>>>
>>> static int tlshd_server_configure_credentials(gnutls_certificate_credentials_t
>>> xcred)
>>> {
>>>         char *crlfile;
>>>         char *cafile;
>>>         int ret;
>>>
>>>         if (tlshd_config_get_server_truststore(&cafile)) {
>>>                 ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
>>>
>>> GNUTLS_X509_FMT_PEM);
>>>                 free(cafile);
>>>         } else
>>>                 ret = gnutls_certificate_set_x509_system_trust(xcred);
>>>         if (ret < 0)
>>>                 return ret;
>>>         tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
>>>
>>>         if (tlshd_config_get_server_crl(&crlfile)) {
>>>                 ret = gnutls_certificate_set_x509_crl_file(xcred, crlfile,
>>>                                                            GNUTLS_X509_FMT_PEM);
>>>                 free(crlfile);
>>>                 if (ret < 0 )
>>>                         return ret;
>>>                 tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
>>>         } else {
>>>                 tlshd_log_debug("System CRL: No CRL file configured.");
>>>         }
>>>
>>>         gnutls_certificate_set_retrieve_function2(xcred,
>>>                                                   tlshd_x509_retrieve_key_cb);
>>>         return GNUTLS_E_SUCCESS;
>>> }
>>>
>>> then use it in both tlshd_tls13/quic_server_x509_handshake().
>>> and do the same thing in client.c.
>>>
>>> Thanks.
>>
>> Rik, do you want to take a crack at the suggested code re-organization,
>> or do you want me to just take your series as-is and fix it up? Either
>> way is fine with me.
> 
> This week is a very busy week for me. I can look into it next week.
> 
> Feel free to take the series and fix it up as you've suggested.

I'll take it as-is and fix it up. Thanks for your contribution and
patience.


-- 
Chuck Lever
