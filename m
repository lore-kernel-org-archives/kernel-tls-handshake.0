Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2642D5956
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Sep 2025 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911830; cv=fail; b=LjfAW8L45QHUHYrf5fleswLZPBEBjXmLhY+B/pys5acExhpoY6HInGIQiTbPylQ5sWP2I/whUsDpRTKMRJOpjnBFADyaR8ySwu7vQamm7CvbQU8pNX1xTqXNCPskrZDD8hObKmBpwUbT9AKIrCoyj7StoaH1zLXNtzuH15Ifvn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911830; c=relaxed/simple;
	bh=C9/06LoVkUUWYF45Aq1m0dki2Q3FokbDphUPGtTeENw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KBCSWy1J34Bt7YQKp1pF3OohkeC8IOGObnBg1XPBhHQ4mmkTxf/y3s30MVxKphsbbsOe8fhD3uxczbeYqTzxBx6FS80cBwCzXeszDA/0OTHKxgkOHMAGNOC7NGUXdhdEcHUyG0DBpcYxdQdfRSlnEQmtHYs1sQ/PxRbU22AAQzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J4FhFicJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P5Blit36; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J4FhFicJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P5Blit36"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839NJPm016122;
	Wed, 3 Sep 2025 15:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=b2nNTL9B+fMfMIB2UytBS1R+1QZOInLkqmw0TeJ8R1Y=; b=
	J4FhFicJ0jIS6uX7GF51tDRMGI696bjignc1xqwtKGhdDZVtSK2UZUShR9y/4QOz
	YXKpBeigb+xVb7FLg/b+8/zYYEgn5okilMmHeIPBVZwpP+/qFq3gwZ6hGKSmjGmD
	xv9UFk0RSVV5Wm1XLfI842vaUnXIZ7BmGvUpr/Yali07f2qyRBOP0YL67GDn8ocf
	VUu00qud37G9aq4iOgTRHH6sjinDUmRBcEPMXdbiRI7N/3ju0VKaNEPoOMqxHZnJ
	kVytn91ynHrNLMYrUzkHSOk8fRwd8UN1CS5ldsHdfANQlzYB2p5ucu8fsRkEUDow
	MkTu6MDoua4iN/o28ZaVIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ussype5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Sep 2025 15:03:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 583EwQOx040062;
	Wed, 3 Sep 2025 15:03:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrgh1v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Sep 2025 15:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fxkrfav05pD5L5eKlGbN1En5e4x1Z3mEQV2lzxrHW6K4EjiW2Svtqtd3kbe9qf4tnsmXEieg81PRyqsuwtXwtsJQst4s8wi8dgwlvFo43r7LEI28IYDhykTU72tHwvX9nw9CH965zosc6BBVGhKvg7Eyp15pV1t6btQ3vGwQhYbVXz0bGUrp3yoPtS6gbR9Ux2ZC4IRNwQsVAXepTbfuAF2QeYZhdLjshClN+rVG4p8dFUu9nGPPxAZthxaJMzeP/5GI3bR80ayiB8kNq1NOhpsXJeYVWg2KDxyuJkfyaVbrpta1vwNloNCZnVgTZDZ9NrnLeh9mVgtuNdW+RoRk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2nNTL9B+fMfMIB2UytBS1R+1QZOInLkqmw0TeJ8R1Y=;
 b=A0iiv5RL1MNqZPHlWA5HzJ9PJaO5iQ11sFmupnw9z4Xr7cl/SYPjZQJ9q7S81QfCt7dZfbc7isXeJSW+zO0gEcxWJDVk6i00PyTs0Fm1BhrQx16G2koXSYJ3NthiFWo3lmM7ee9ZAKPsioXeYX1BbmyqIDQSIwOr6/PCgHp4byfE6Zt+kuIiJK+Du1PZCMdmjKdJoPumC+smAEk9sbPe53lwZx8LW1BVijXlS3AVcxWW/KGLk8rqmzCcgwOnzR2LzbwfhdqHyXiI6Vq8dfbRrBKVsGiBuHO3zKMtq59yMGhSxE6NXJHBwSgLiS3LWr2A2qP1EPEXmcYNGad5p7SCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2nNTL9B+fMfMIB2UytBS1R+1QZOInLkqmw0TeJ8R1Y=;
 b=P5Blit366L+x+b6wF/8miLp4/YY7PFp8aYRDpGJWCC27WCHyMvAAsmbw1bxfUGYX3eIu8rMOGH2Mkckqk+MZyQRXMNUpy9BXReakTIdBFn2nSF/xGFS7VW7GN5es058DQvvGFR3k9LoJyyEkEg8WinwFbc3mkoB4vNIQLYOf6AE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW4PR10MB5725.namprd10.prod.outlook.com (2603:10b6:303:18b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 15:03:38 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 15:03:38 +0000
Message-ID: <0236b5d9-e762-428b-96a2-f09cb168bcc1@oracle.com>
Date: Wed, 3 Sep 2025 11:03:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tlshd: Server-side dual certificate support
To: Scott Mayhew <smayhew@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250828222348.601924-1-smayhew@redhat.com>
 <20250828222348.601924-3-smayhew@redhat.com>
 <cc649f61-f3a4-419c-a861-2b4d23aab38a@oracle.com> <aLhCcXmJV0VQaJGe@aion>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <aLhCcXmJV0VQaJGe@aion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:610:4e::24) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MW4PR10MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 7224717d-f586-47d2-b158-08ddeafb1023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmZqckNCbm55c0FZcGlnNjBhWUdXTTM3N0pVWHBQcHVVc1pPZ2RnckRuNWNu?=
 =?utf-8?B?blZHTXBmMkhnQnJ0NlpUUE5RT2tnRlRsYTllR1U3UU9oZ2VhYjhKbEZsL0lQ?=
 =?utf-8?B?VHlnaWxYNXJ6cHlRaERxcVdPS1RpQmdEZ1lGUThTcDJLODdtZWJ4RzcrYWw2?=
 =?utf-8?B?RVNiVE1wMXBIcU5MRldGeW1jbXUwbEo1bkxiZ3NMOXU1dGhXdW9KMnhidzR0?=
 =?utf-8?B?RUFxMUFmVFVKY011MWVNMkVSbHR5c0tCamRRR0o0NXhMT1hSZDVXZ2pxRUk1?=
 =?utf-8?B?R0NSNTQrNldCVTZnMUpna2J0Ni9tZ1ZXY1RyRFpEQW1ONnBlWmx1eDFQQ1dm?=
 =?utf-8?B?NS9vN24xRU5iV25oZDI5cVAyWXc4VGY0QTFlNUw3eDJMZWMwaUsyR0tpM3hz?=
 =?utf-8?B?b3QwOEJaZVVFNUlsKzh6STBwMkF2eGFlMy8xKy9NeW5MQUt5RU8xN3hNVnlh?=
 =?utf-8?B?U0d2YUllWThoTWdZcHVVb3pLVW4yVGZvd3dZOU9BTHM2UytjdUk1bWk2R2xa?=
 =?utf-8?B?eWVWREd0RUp5NGMzR1RMSkkvdVlwa08xUDlMb3FBODV2TCsyK2k0aHdLMGpR?=
 =?utf-8?B?Uk83TmltOHE4UnZseExHUDhNb0pSSGdjRXQvTWlCdzVUQnp2Y3lWZmp4S3Fv?=
 =?utf-8?B?aWNkZFk5bE1ZRWxWSzNOa3B5NUV0R0p5ZmE3VGpNK2FWZjhuSkQ0MjFOcU5i?=
 =?utf-8?B?QUIxRTdiUzNYVmIyMkdvM1ZSbkxYWSsvQTRsTG14UURjNGR0RU9yNTNiaVA1?=
 =?utf-8?B?V1VOL0NpajR0akxKeVhyczJ0Z1lPY2pkVzlaNDV0Z3A0dWpzdEo5L3NIWE9Y?=
 =?utf-8?B?b2w1Z3o5TlVHYmk1OXVobWx3Nzc3MENkV1BaYmNzT2Z1R0dZSUdLZy9EWTZj?=
 =?utf-8?B?cHl2R2QxRDVtVnZya0VqY1ZTb2E0aThSTHdzdTk4UmliTjNrRlNYN1EvS212?=
 =?utf-8?B?dnJmVEc5VXUyaXBBSFlTci9LbFB5L1l2bXFZVkpIS01yZS9jL3lydTVkQXhZ?=
 =?utf-8?B?TWZnRndJNnFaNmF3WmMxTmEweXFOZlNhQnJ5Uzkwd3pGNFg2U1kreUFDdEQ5?=
 =?utf-8?B?SWlPT3g2bWliSXBReTJSbGhHZFJIYnlqNjlVRjRLTzNJV3ZjdzRqd0dhNE5G?=
 =?utf-8?B?N1JIbU1tSXhtdGVMUU5rcXZZWHFxSjRwZWt0NjVwWWtSZFJCdTdMNFBLMkN2?=
 =?utf-8?B?cW5LMFhiaFlLdkFhQmhwaDlRbzFYaHdSYjVkcEppYWM1OWk0MGFHWHVZM0xi?=
 =?utf-8?B?elBXZE03aklPcW9YYXl5dDE4SjFRcXo1M2I1bWxVSDZGeXZHTzJ3V0E5T0FY?=
 =?utf-8?B?MEI3eVVEaWU2RXNYbER0akg2Si9YeXM1Yklud0x4bFdON2lrVHVVWlhHR2pC?=
 =?utf-8?B?VXEwWkYxbmhCVHlodGhxa3J0ajNyaHNOTHpOSEZPR2ZwUTQzL29tOTdMbHVE?=
 =?utf-8?B?Q3JkRWxJLzU2UUFacllHNGkrdHRQZmh5ejNtbW54ck40enI5MEhFaTJMaVZ2?=
 =?utf-8?B?VkduV3RyRGpMSFJDK0pudy84WHB5RFFBeHFIWUlBYkdsVjlEL1RLS1B6UHBn?=
 =?utf-8?B?VHkzYTYxeG4rdG9DelJNTTA1K1NETDYzQnN3OVB6K1ZJVnZwKy8rUUx0Yzlx?=
 =?utf-8?B?RU5JNFNSTVUybDZTRnJVOTgxSXJpM0l4YmMxNHo2amVidGxORGU0NHFJdGdk?=
 =?utf-8?B?MThvcXhIMndhYlFycVBLS3FnUzQrTmFxa0pvdC9EM3J3YytzZDN2Wmc4Snh4?=
 =?utf-8?B?WlRQRGNkN0lkUGtob0EvbFh5MWxXVTlKSWNwdE5GT1BOOTF3dW4vYjdQY052?=
 =?utf-8?Q?TJZEooYTEjypMoYAMI00o3WkwZSnrQWODFR5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStzZHN3a3V1OUlQQzBrS0h3K3F4bmlMajMzLzJ4VTQrMW5QRkVSNXdhN2lh?=
 =?utf-8?B?ZGptVVI0RjJFQVZoREVzbGpzdWtnWVJrWDl0MGw2SWt0RU5peUFreEcyT2I2?=
 =?utf-8?B?UkxXYVdjWVRMcnpkRDk0ajQ0djZNRStEN2oreDJNUzVicTJQVjlnaTRxcVl0?=
 =?utf-8?B?Z0NLTFdOa1JCZEZNN2pqSlNGaDVxWVJxd0pJOUtZZDhuRklja3dHbXZLcU8x?=
 =?utf-8?B?K3JMb25WT2d5S0JJU3FVZjlVS2xPbUdFOTJRcUN6ZEk0SFhrcUJUNnF0RXA2?=
 =?utf-8?B?VDd3NDdrSUhCYmR3ck9Zb2gycnYxdDk2V2ZOSGh5bUFleEtCeExudnZ4Umd1?=
 =?utf-8?B?ZHo2ZEdPQnhwUkxiWVFTNVcyQUc4aUxLYllCSEc0ek5VKzNwZXJWb2lOWUFF?=
 =?utf-8?B?RGFLVVp2bHg5emF6b2pZOXdjQ0w5Z1dVRDQxZzlteHJUMlRMcFI2VzdjcXQx?=
 =?utf-8?B?SDNURVNpQTZOVVFYTVZ6SEd0U3RRbG5QNk15NHBuNTVkWnh6YVVqa1VKL1BI?=
 =?utf-8?B?dXB3bm1qTmVkOWtqOUpSQjlIaHVKVXphZGg0RVpSd3dqRWZNbU9wcUR0a1FK?=
 =?utf-8?B?Vk5BMVJMOUR3WGp0QmFsYnlxZkVxUnlxWTQwNDV5UmMzWGptZ0xPN3doVVN5?=
 =?utf-8?B?UnpTbHNtUEwzNWlxOURNNVZqYVNlM2hHNld1RkVUUkFGYWY2YjRkb3NrQ3NI?=
 =?utf-8?B?Nk9TY1hzSGs5ZEFuM1I1cEpnSjUxVmRyYTQ4VXFIN3Nsek5NZUlZaVNicnJE?=
 =?utf-8?B?NVB1NzFsNzRDa2hmK1pUakcxazcxaTRseWxJOVp0ZGFFMExwRzVlSmxyR040?=
 =?utf-8?B?WVlVK3FWNkhZbk5CQXlmZWlSblZFNVgrUG5BQXFjbHp2dWJScEZGQVUrcXpJ?=
 =?utf-8?B?WmZRdXpyU3lMYVVmYitiRTA1N0szSzFGVnd3ajFYYVgrRFZ3VFNKQ0dvWGV6?=
 =?utf-8?B?NTVoaWUzMWxqZ2svSURFaG1wV2thTGlPQmlCOU16WFo3VSs1bXc5cjR3UlN1?=
 =?utf-8?B?YlVlemtQSkJ0UEN3VnhOeXFTMUhMNUg1UnZ3TGlYRkxPczN3WG1FRDJ1ZUI1?=
 =?utf-8?B?Q0ZYcnp6cXNWU1dYWXFXcG1wK2ZvYzNvY2szZ1JwWnU3Y1QxNitsNEVwaE0z?=
 =?utf-8?B?REl3bUtpa0g4Z09TUGJVUVZsRnNyUXZpaXEzcTB3YlNsb1NLWnd6RTJzRmxq?=
 =?utf-8?B?SDVSdFczUU9FUTQ3MWFNV3RLbTdwTmJaYTkvS1g1UWlrZ01HWldRU1ZmRmdq?=
 =?utf-8?B?YjdzK09rVUVDQUNnRk5NanM1MElWaHJqbkZNKzAwQ0lMVUVEbXprK3BNTWtO?=
 =?utf-8?B?UlhaZkYyQkQxb2FpZkdJQk1Qdy9rek9Tc3Z6UnlaWU5jNHZtR1U5cTZjWW9V?=
 =?utf-8?B?VU1sTkpsaXFHU1JBbkhyOHUvcERtTDJQQTZnYysrOFhYUEJ4eXhQMlhXdDBY?=
 =?utf-8?B?YWFLMW9DUy9VekJtWlhjOGRtTXQzZldMVmIzSTJxWjFuNlVZcXF1Si9tQm9r?=
 =?utf-8?B?YjM4NGo3UXdHVUJGK2lpaTVkYnFuWDNFNktFU1huTEM4U1VmYWhSaUhhYlJT?=
 =?utf-8?B?Q3cwQUxyZnJBVDhBUXRvL3doa0xyQVdLNFo4Q0dkU2RQcXRuYlFNdGMxZ0R2?=
 =?utf-8?B?aW8vWEhCM1dCc2F2V0dLRm1XSDFvT1V2V1JiQTR6SXpnYnRaeXFvb3ZiT2R1?=
 =?utf-8?B?RmhCbTRpekVMdk13QU95UnIxZWgydCtqNDQxRFlycVozZ3J6eWdNYklQTXRS?=
 =?utf-8?B?T0RNdkFFTHJabFNhK1B5MGZ0bGhQTkRCbXVuR2dnSDlQdmxmWHJDMFV1ZWVk?=
 =?utf-8?B?SjBDTGltb3d1TzhKbTdBTFhkOTc5MnU2RDk4M3pzcHdjVUQ1ZEgrc1RrVGtW?=
 =?utf-8?B?ZFcxbU1GTTRVVnZONjVKMHlOYkJWRXVkSFNJeUVTZ3Rkdlp4eXJVZEc4UC9L?=
 =?utf-8?B?cjJXaXRnTVBTMkxodXdtRllqeVhSMHdLYVNPcHZHdGZPWDlSNEd3TDFvSmRj?=
 =?utf-8?B?VE1qNXJIbUo4OXBVdFdrSURDL1kvekFsRXI0bDFla21FNENCd0pKamRpUkxN?=
 =?utf-8?B?YWVnQzJPRm9iRjM4NktMT1BzM0NvV3IyYlU3Z0RISUlQSGJLdTA3MVVYbTJi?=
 =?utf-8?Q?Sto8lRsNtqhtvL8ScerAZqieM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d7+IZyCb+zMl2NqcEjOeE7BOvoAVYdXIxoB5Vz4o+5UyM9XGkin6YayaqUQPCOhACkfboF+om2EzujJe5xOS/hgI8yjJs1rm6c9Z8N25BPY4L95aFD8pAIwCjEpko0Iz3IIkeoEnIpGE+sYw8ImzrHO1AgB2YLkMw5seJ9CmGJYHgqX5lT32gAVKu/Clnp835PTalhIleI0v7BLh2SZ6ydmhImpSpiIeYluHsRbk4WTfAJyxRUWBO4+wsMQs9Zbs4Ry1OahNNBkfzrDT6vfScv67CjEYMHboDZCL/neIig01B2B9NRjtgf1fkc167uklpEtl8wdLAW2wfzUdtcjhb56vZq8xLz7m6f/0JTRVe5HvFssUyrX0geCWIuSHwC39rxlwsb0NmG2WdDBjk82EpjG3LNnFFR58hhLwNgaqWFIqlGBnowZPloRnVM7ll+jIolD3fHaOg+YYYLwm7rI5iPOm9Z6NQhrcwES1xQK1JA+TaMG66L1/YY1qtpF+ZMk2hNEkVBstHlODhjIFk/1VhkBrqBtBRZgdn6u9Ckg2ZyUiPgR7nf4s5w6SPlTIppZHz0YFQOlBaChCZKS5IalNA2lk3GDJjp7DSE+IDz92DkM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7224717d-f586-47d2-b158-08ddeafb1023
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:03:38.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL8IifqHwlPgMwV5mpFvVDSvZJxvUUkm7hKqb00xQwPPDO86mzg1rICJxON4oUEfU73DXVBZlZk4iECdCYub/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509030151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX1/F2Z6uWPmwt
 9E9E4fF60pUjrrmSz7ZqltFHyIpzaLD1neJ2r+3mIPpjELiRs06F6n6wudY5yIQFuwD6PQAV3n2
 nYpRi0Oa8kJLsbCMTqYXZ7ySnnCEYUHWYpf46eCx/pQtbnXYyEyqPQCKEqNWggEySdqio64BmE6
 ral0yUwQeDTBNy62acRkVA9btP+YA7RI2vE4qCuYe3fdIkLrGaKXCAJiWWfVwDrOVHJi96QUff5
 astGSIqi6DixNPKPJOAcb3UtThXkT6LVrrEit6r7ouW542DJ1DoMIzkduUUpQmgDEOgFBkA8Aye
 4ukZRIff2hrqPiigjrLJEp4WYeRSPIf1kK4nnDKsYWCYX0GoGu5fVAmR+F6K+GaomLtmF4Fqkoz
 03xzaArLGSrndxD4jorcy9wUVEPMiQ==
X-Authority-Analysis: v=2.4 cv=X/9SKHTe c=1 sm=1 tr=0 ts=68b858d4 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=A3H8OfN2AAAA:8
 a=20KFwNOVAAAA:8 a=vZoRIy8xVhYCJge5OqUA:9 a=QEXdDO2ut3YA:10 a=lnXKwzmWpdMA:10
 a=hKFNpMRl0UUYlmJlzFdh:22 cc=ntf awl=host:12068
X-Proofpoint-ORIG-GUID: FfKrAd20R1BuQOsgGDoJeE90A-P-Z4tH
X-Proofpoint-GUID: FfKrAd20R1BuQOsgGDoJeE90A-P-Z4tH

On 9/3/25 9:28 AM, Scott Mayhew wrote:
> On Fri, 29 Aug 2025, Chuck Lever wrote:
> 
>> On 8/28/25 6:23 PM, Scott Mayhew wrote:
>>> Add two new config options, "x509.pq.certificate" and
>>> "x509.pq.private_key" to configure tlshd to use an ML-DSA certificate.
>>> If the cert callback determines that the client supports ML-DSA, it will
>>> select this certificate.  Otherwise, it will fall back to the
>>> traditional certficate (i.e. the certificate configured via
>>> "x509.certificate" and "x509.private_key").
>>>
>>> Link: https://github.com/oracle/ktls-utils/issues/113
>>> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
>>> ---
>>>  configure.ac             | 12 ++++++++
>>>  src/tlshd/config.c       | 12 +++++---
>>>  src/tlshd/server.c       | 59 ++++++++++++++++++++++++++++++++++++++--
>>>  src/tlshd/tlshd.conf     |  2 ++
>>>  src/tlshd/tlshd.conf.man | 13 +++++++++
>>>  src/tlshd/tlshd.h        |  6 ++--
>>>  6 files changed, 96 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/configure.ac b/configure.ac
>>> index a6d9d09..0dd23f2 100644
>>> --- a/configure.ac
>>> +++ b/configure.ac
>>> @@ -79,6 +79,18 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
>>>  AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
>>>               [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
>>>                          [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
>>> +
>>> +AC_MSG_CHECKING(for ML-DSA support in gnutls)
>>> +AC_COMPILE_IFELSE(
>>> +	[AC_LANG_PROGRAM([[ #include <gnutls/gnutls.h> ]],
>>> +		[[ (void) GNUTLS_SIGN_MLDSA65; ]])],
>>> +	[ have_mldsa=yes ],
>>> +	[ have_mldsa=no ])
>>> +AC_MSG_RESULT([$have_mldsa])
>>> +if test "x$have_mldsa" = xyes ; then
>>> +	AC_DEFINE([HAVE_GNUTLS_MLDSA], [1], [Define to 1 if gnutls supports ML-DSA])
>>> +fi
>>> +
>>>  AC_SUBST([AM_CPPFLAGS])
>>>  
>>>  AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])
>>
>> Nice.
>>
>>
>>> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
>>> index 4c54d37..20634dd 100644
>>> --- a/src/tlshd/config.c
>>> +++ b/src/tlshd/config.c
>>> @@ -403,6 +403,7 @@ bool tlshd_config_get_server_crl(char **result)
>>>  
>>>  /**
>>>   * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
>>> + * @key: IN: the key field name from .conf
>>
>> ETOOMANYTHINGSCALLEDKEY :-)
>>
>> Can you find a less overloaded name for the new function parameter, here
>> and below?
> 
> Yeah, I called it 'key' because that's what it's referred to in
> https://docs.gtk.org/glib/method.KeyFile.get_string.html
> I'm open to suggestions (gkey? gfile_key? option?)

How about @cert_type ?

If you need to keep this parameter, I would make it an enumerated
integer. Keep the knowledge about the config option name internal
to config.c.


-- 
Chuck Lever
