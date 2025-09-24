Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE222AE89
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721623; cv=fail; b=NBr8buUL5KWDVPVT7Czvn1YFesVABehEPugER/WDzpzsyZ7rM0w7j8dvFY6dr+GHS9BQEFIeNh1pBxky2fbIQNwUzEsBANQAOORNV06WOEKna5aGhLtA08BxjMtrfDdIhR8GlNjiuef1aimlWzYs6UNPqDPe9pfJqVmFWRq/jto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721623; c=relaxed/simple;
	bh=miu7RH8TrLs/MbQBQVuWkrdyJtNgccuLs3uB8LqW2M0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cx8OqF2CyL2X7E2LJogQ6LaS79nzbg6bE5NjzLYR/6CczYKsqoyfEo9xGTC5H5W4FO2knTtSLDTdTU9m0+CPur1Iwl+s6/R3I8u7qsQqFexLmIsLrYrpkPoseJ2DpDOsrTVu5bA4WksUxicqzXT9u+qEdubFcZgyHe4yCoXs0J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NR04C3xd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ut2qX8uv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NR04C3xd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ut2qX8uv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODRJd0011882;
	Wed, 24 Sep 2025 13:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1lxFt65Ilha72l9awnYnKBXzfJbnAQrGf+tKI4TTQEk=; b=
	NR04C3xdg9puIh1tT02m+F6SVvRJYh3+0hoDHwdIpGeV0mxKC58WHGl/Vz/yAjuo
	4ZTQiATi+YV918ipr65xvbwZ4TvQjuJdopQDVYgo5nzt0HCgVm89N5ErmHEnqZXI
	DzGDs4zUzj/LYICGjx1AU5RdiwChQzMwEDUYRK9wkzddVxZDtkyRtzIRbxxdgERG
	047Iumnstw0gFfZNqmnd3QabPjLNarEo7j+ekCq77NGjbUcZjDnnuvatSAVqG7vd
	9UjPMIiC5+JNjYFjcSMfoIwg5wmO3NsPkK+3tQGOoIS5rpXLVO9I5cNFvSXIrVPE
	66jVvr8tmRcJtvWCaUQAHQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mtt7tgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 13:46:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58OC7PMr030818;
	Wed, 24 Sep 2025 13:46:59 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq9yand-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 13:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElhodQ3EHPLyWS6v1a/ibhcMNEIYDi+r2gxUmSY9N3MOn2QKKXfbLM2DPyLX9XlN/LfsgOUKZhhE5EAqy0sQxAX7LXzsgBd51KPgyDzzR6Xivuru1l6vdyuYBBuGR+HJIfhqNO9tfzd8lSKJpx2sBg5y1aUZLOGBl50u8jIH2B82TNHj5tXrER65gAkw6bmgbpku3NAn+wI6c0BgaRWkWs8LR3YgHNcSxKRPto2p+u0KbaKM08B6H84NwGlTI4cWezLs0DyHXm5b2/VFUV38a8di/KMk5lfwRqaIksGfzns2DJYguKujAYtjqpOUrFXnHLCeOnrV0h2053KzwryZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lxFt65Ilha72l9awnYnKBXzfJbnAQrGf+tKI4TTQEk=;
 b=o6J2B2hxvFJ32kNjHIZYv9EYV7SbOArL+XuhOGdLfgKOe/mxxRBSLvOlo1gQ5HsRLdN/MMPX0Gp71tVL/W+3HFiXX75ZVSTKsmlPG35ECcL46Sqbe3ZsXQnaudZN/ZqmhMotpO4VICICKd+fcuWc5prVZRzcpd+AG5q5msU8k15fSSTRYB0S1V9eQmpyNovDPaP9ueNBawyK6g32IqHdH0fGz7Oq3upkD0jmdpBocS+9c09ypsnG9tZ4QF9ZIBuYV0+KTUKc9cyqKoG7jzPpkzAd+1dL9d/VVrEDEwNjQekx++f4mxE3NbZzYw6Fxjx+8ZdkK9LKrl5h24qVr/BL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lxFt65Ilha72l9awnYnKBXzfJbnAQrGf+tKI4TTQEk=;
 b=ut2qX8uvRHPi4XyS1lkJg6caq6jBOqTOPbBBBo5hG/d8Tg4i1vlKXYOjWHWBW7i8YyogQBFDTo9dbsa+NYZKUGLp1apZUQmDOlxJ4pT6356nBeCAAyK49DkFr0EdnKMaXVcBZEJMWLTALnEtBgWFM2lEmgr6jpH2+0ygRlIjYAQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM6PR10MB4155.namprd10.prod.outlook.com (2603:10b6:5:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 13:46:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 13:46:55 +0000
Message-ID: <f6c4609f-62de-41ac-a84d-309b1e2edc9d@oracle.com>
Date: Wed, 24 Sep 2025 09:46:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Xin Long <lucien.xin@gmail.com>
Cc: Benjamin Coddington <bcodding@redhat.com>,
        kernel-tls-handshake@lists.linux.dev
References: <20250922220710.1255102-1-cel@kernel.org>
 <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
 <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
 <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
 <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com>
 <CADvbK_cVUHwx16Q_uQAoae5rLRkTZSZenQjgiP=3Nn-LUkUCAg@mail.gmail.com>
 <875cb069-d762-454a-b01e-26344a16050e@oracle.com>
 <CADvbK_cR+Kzoef1JH6JwO5nT0vkwTEXbDmVw7_GqWrDYUefyyw@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CADvbK_cR+Kzoef1JH6JwO5nT0vkwTEXbDmVw7_GqWrDYUefyyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:610:4e::40) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DM6PR10MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: 80531e64-6e3a-4e00-c924-08ddfb70d2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjFwK3l5dDM3ZG5tSHR0T0RjV0s2anU0VENKN0QrUFpIOXZMYkZCaGQvM3JI?=
 =?utf-8?B?SUU0ek9aTjZabkFuSlZxb2dGL2h2TTVTWWczY0tndzRGUS9wNm0rUDZmcXY1?=
 =?utf-8?B?SjA1SWNqVGdaSHUvSUQxclVSakhyZ0dnV202UGhyR1MvL05Nc3BnelpnUUgr?=
 =?utf-8?B?ZG8zWVl2TmIwSVZ6d05BeXdPSUtPejB6Q05XOFQ5L29TdGE0bWQyZHBRZ0ly?=
 =?utf-8?B?TllQTU9RcDRNekJlbk41c29XSXl0WGExSG1RRFNOTGJlSng3enAxTDNTY3BM?=
 =?utf-8?B?MFdjc2VueU5LcjNWZUFDMEJEK1lBN1VJUW1FZ2lzQldYL2grMGNOTUUyMnhX?=
 =?utf-8?B?elJLbEZCQmcvczE1NTZUT0ZPM3REckViMnQxaDVYMXF1bUpJVDFYZlBrSk8y?=
 =?utf-8?B?OGRJRkNscnhxU1RwMVJsTVR2dFlIVDhFOU0zU1ppWTRtRkVmTDBpdndLdFdK?=
 =?utf-8?B?UEdwNTJKbHZiQ01ucDlkZXJsNWp5OFpvVmZzMms3U0ZxbW9mS0o2c0ZhT3Rl?=
 =?utf-8?B?b2s1TG9JN0Q4c3lDVHNnWVRzTnoyV3RvRjlvcm5BNFdZNzhjNHpnTS9PdnUz?=
 =?utf-8?B?cTFQQUtEMW1IRGRocUJCWWpscWlaTmEzdkRqUTlwWEFVcldsZmozNXM0KzRK?=
 =?utf-8?B?T2YvdVFFaUdEYTlzbGFLK0VLWmgzYko3N3JhRkkxQU9scjE5blNVRy96anBK?=
 =?utf-8?B?dENsQW95K3hDN0h2ZVpZQm5pMm9KK3NITjJnTjF0Ny9SMXVnVHpVQ2ZwTEtW?=
 =?utf-8?B?TXQ4eUQya2ZMVTVaZHFLS1d3eWJvcG5wb0srRnlzK0NJQSs2N0tIeTNlU2Nn?=
 =?utf-8?B?SjhLTzFxbVpKUTJyU3hxM1dKZjB1OWNoTUZBMDZNTTY2dzhzRzlWYkRCWXdv?=
 =?utf-8?B?MTBKNnhyVXVZVEhuNlkzdEtSelBobkwzSEJuZ25HTUxENkduV09PY2Izdmg3?=
 =?utf-8?B?MEQxTHdaRXhJa3AxaVkrMGFJUzdXRzRFbm9FdFRNTzg4Mk1MSVR4U0RuMUpY?=
 =?utf-8?B?aHJjWTMrU2xwL01QaXAxS1BkRHZxUVA5T21LQldBYzNVa1krQ2w1Tm9ocXdL?=
 =?utf-8?B?d2ZGMGpGdUtwS29wQVd6YWZjWXNnNDA0RjUwU24rOUs5T09GZkxaTTNYUmZp?=
 =?utf-8?B?VnlMYTF6bWplSmV5ODRkSWpGT1FJZkd4c00rK1c1YU9NcWw3ekpzNzBFTEVW?=
 =?utf-8?B?bjJHMWlCbHphZ3hGUnhNT0F6MkFta01lcDkxVzkwaC9Xb1FwclBvRHlYL2lI?=
 =?utf-8?B?WHcxdXJCdlowNUMvWmJUMHQ0a0Z1QzVtbzhZcFZOUTNyK3dhUW9rVmtZZFFL?=
 =?utf-8?B?UTc3SytHV3haZUtQOWFuQ0JPbkM3NCsxOUlUaWlDRGRkTUMxTk91cmdZUTB3?=
 =?utf-8?B?cUFZaDZxSGtWN25CT2VheC9aazdwbHlka00rNFdxRUd0UHJSelJyNVZ6MG1U?=
 =?utf-8?B?RjZTRm5yYjlNTTJFcWtocVZjbytPMStPTjlaZFZoS0JidmhKK3lqdkh0a3pz?=
 =?utf-8?B?aStWMDdDWE5nRG4vMjdLRmNBazlTZlVWQStMSlV0TlFsMWFQUWQ0cERkOGpN?=
 =?utf-8?B?TjlmSGNYOWQ3a1M4cmRQdFh2NVRrSUx5emE4L3UwKzZHYjJzVW9MVHRFay9R?=
 =?utf-8?B?MDRPdTlvVFhUUTZKQTkyQ1NVQTdOcWVlT3dmbTFTYXNEQVBtbU5FbEtjWWI4?=
 =?utf-8?B?bjlYcmZpdzhzejlGOEVKdTZuM1dhTkFpVU1ZQ3VoRUhVZGpLR0JrbHZabWUv?=
 =?utf-8?B?T3ErNVk5ZHVvWVFJdVJKNHo4NVNJcmpxdURUNHNMY3ZINmppUlQ3WDZ0NHdD?=
 =?utf-8?B?VlJRWjZHVWRNK2Jlek5TdkRSSVBsNU9ZajZqTkRFK1JkZUVCb0duQlMwV2p6?=
 =?utf-8?B?bzNkQzdnK29TZ0ZwOVhpY0JDb3dXVTl0cFRET0pOWXVVZlI4bWl0dUpSV1Rl?=
 =?utf-8?Q?TPZvRZKCSTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJDYVBSYjVPQURZRklCa3lnWjdLdzZTajFZTElsdTU4bnBhb21RUmVUV3ph?=
 =?utf-8?B?SE9TaVZuSkdPdjVqS0dKM0lxS0JDZVJjcTVLazJicFN3bldNMXZZYTRKWWdN?=
 =?utf-8?B?aGorck1pYVBDTmNJZ0E0MGhBSWdDRDdWMzNTMmZLbmlQU1J1U05ZY2pwdmsx?=
 =?utf-8?B?OUZqL01IMGlFL0NDaDF2eXlna2IyYTNIMG1YMmcwZUNzOEE3eGNWTUJNZW95?=
 =?utf-8?B?SVV0cjRackFmYWl2dFN5QVVWMXlteXNwS0Mra1Y0YUtnOVVId09tdjZEU0Q2?=
 =?utf-8?B?TmRrY1B3a081TmNLcVhTQ1Z6TCswUHhreDZER2ZEdVpkVkcyYW4ycTBUMklx?=
 =?utf-8?B?emRpa0g4WHNqaXhnVDFiWTRmZ2dRcTlpMWY5MnkreS90RU1qaDJiTjdwSGs3?=
 =?utf-8?B?K3R4anZmZmhqQWw3dFVaNU0xQlZrTHo4aFk4bjVkVjJzUE51RTV2M3ZxWmF0?=
 =?utf-8?B?aWFKM0pmK1hTOTVTVmxLd1cveDNWaFNWbUgzUHZjcnRCYjNNaG9ZSGx1Y1hu?=
 =?utf-8?B?ZDVsZzhXN3FtOS9PdDgzS21ndnVqN2h5akJrOW9kRnZCT1JIaUdGS2djb0pB?=
 =?utf-8?B?aXd0T2V5U3VwWkRCb0JyMWEwYXR4V0xmdit4bW53UElwRnE1V3RpalorQTdj?=
 =?utf-8?B?cnp4VjJEWVBleHlEendkQXBScEY2VFpGQjUxYXZERHRJUDVWY29oSHBlcjRs?=
 =?utf-8?B?dUkyUW1OWTFrV2ltVlpQUzloMzVZTllKdDFubVEwdFNRSmhqTE1udFptRVJ0?=
 =?utf-8?B?dFM2SHVlZTJuZWdVeE9IblBDd3oxcnI0SlJhNWpqNmRMWFI4WWY5a2NCQWto?=
 =?utf-8?B?dlhTT2k2Sm1kdUVRb3FDV1pNeFRxb1JNWkJrY21BSFNpeXJhNXBqR21IRjYy?=
 =?utf-8?B?RU00N210d3dYdjZ3Uzk2cjhrazhyeGNrN2VCNnNTbDNoN1B4QU5hNzU1citH?=
 =?utf-8?B?Rm9xRUxVRStJRDhpMU9CZk8xaXdEbGlmcUtoNko5cE9OUkdBVzVTTkNXY0ha?=
 =?utf-8?B?WHpHa2o2WDlYZGxVYlVRYUFySkM1ODd3MERaTGtscm1ObVN3RnFpZVR5aUFh?=
 =?utf-8?B?MDlZdG5iSVhPNmVEaGtkNTJhZTdZQlpoZVEzT3hlT1NsdS84aVY2R0dDUVhY?=
 =?utf-8?B?N1hFaDBvYW9kWkZ3K1Rqd0RvRVZIektYRFJ3M1RCZFBlZmxhWmVyRFJORWFW?=
 =?utf-8?B?djJva0RCL0Z2d0E0WWJxK3pSYmdUckNYaHpPZDVZWFpWNWM3U0ltTHVQT3Ur?=
 =?utf-8?B?ZWY3emJsTmlEZ245eThFU2k5b01PRFczR3d6NFIzOTZib3ltUDMxVzBmYlRu?=
 =?utf-8?B?Zjh0Y1pRcnlaZGpmRUcxaW1abE5RcXFsQmh6aWdPcERqUE84Umo3SVB6NFJQ?=
 =?utf-8?B?VmtTQzdHUy9DRWpFQnBQWFIvU3hKSmh0d2pXRlZDVWxiRjhkenBlaEhvUWs4?=
 =?utf-8?B?aVlpb25EUldzeGZtaG11NWtVdTV3ejJ6eFl2UUlIZElnWURKaFpGZEQvSUhL?=
 =?utf-8?B?UnJUNkFmQnNLTWh5bkQ5aHBXWmU3REtnNmJhZ01vTGlYNzlJdFVWY1ltdGc2?=
 =?utf-8?B?RHhYOTFkaC9WNTRYRWlhaVZEK2ZJOEF1dERTbC84SG9WV3pyWFhkZllPTU9Q?=
 =?utf-8?B?UW1xVGNaZTlneTgxU0dqVWlqRUJodlNEWTdvQi9kMWtUTkRGNm8vaXlxNEhU?=
 =?utf-8?B?ODNHK21ZR1c2S2g3VUR5cXp4MHVrY3BPb1dWRXRVUGJFLzhlNFljdXhOTFY3?=
 =?utf-8?B?R3dnZVRkbENZMXhjT1JPcWpRRmpCWjdXWkx3V09adEJ5QVR0VkxQTlFLWnha?=
 =?utf-8?B?M1k1N0RNd1Jyb0luMnRRckpUcEZFREl1UHJBeTVuNFpCZUZEMzROMnQzaHJ5?=
 =?utf-8?B?YnNNNTZDd01POE9oTlljaGNvYUREa2U5cG1wa0pGY3ZCQ1FDYmNXMWNDOXI2?=
 =?utf-8?B?NmVMQUxJYTJRenJNdFJUUHdxcjMzR2thaWxVOXNud3ZrbktuRXRIdmV0NG9B?=
 =?utf-8?B?dVNqWEhWaEhSNnNOeURQaEl5eG9McmVnSGYraVZwTmJjcmY5NlhmMXpUanpI?=
 =?utf-8?B?WSsyNmp2eko2eDlaQzlRS0lVWnVRUHlnYzByeHFpNG5tNEpIRVVqSzZRT0pF?=
 =?utf-8?Q?Yz6zwfyc/aPXdK8fzwY6eN9U6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HlrHZEhCX8ddPSMyQUNZcnyHYlttLZbD1b658vPG0LiWAClYQ2ob648svy9Nw7vZoo00XDoLNjjmLOrbNuOLD8haGfb6a6/gYb1zP7UL6f+0Hra56Qboeja/ajrKVLv8Psc6VcMBH3nnwFWemuyK5cUA+T0XKQ5pXedXRy7mm52w6CgwBQCt/Y2MRhSzd6IoSTxUn1ikLZnirPdXwQ3RyMaB9jmJ0SwOFxwesYX35Hm2TIhnARKWMsn5Ekjdc/XwIeuXhmfbfZrcvE1DY4r0ZpZ+DsDqqjSRFiME9L8io36tsdv2rhy4S/2w9MDuInoNzCmzA+yIarKEWVDCvJcEYpP+BCD26cSFMn/s49JFANt3+UEFNGhPMek+8B2tFFc1T8agq5QcfFB/yWjB+HI2z6Fx1HAB0i8P6N+BhPkw563U3v4p91j6NiYYxMH3oLmjyFOCfvsuAdFuRWH9MyKKu4osgcJSs15BYo0lxGYp+LGY6zxJLzgrgKC8mzKKdTqfHqvvd0G/XJvHIGPYamvcTSZ9UjG0mXiYDn7IPgZmyfSO5EHUUr2FkMg6EVAQ28xTkjRQILuZpyD0blwV1vyt71AjGknH6oBM4PKjqd3MimY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80531e64-6e3a-4e00-c924-08ddfb70d2ef
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 13:46:55.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrpZl/8+ARVXO0HLdIb1Ov/vEfQtEVCCScmvIHMwgXUkYQKHkNIU7mK8OolNJILaB7x//TzRhwvXlTx48UAozQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509240118
X-Authority-Analysis: v=2.4 cv=fd2ty1QF c=1 sm=1 tr=0 ts=68d3f654 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=FZZjJvjqqVpZp6PDLjMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1wqD7AcBtQvIkjpySHJWyfHVwyOgxIXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNCBTYWx0ZWRfX3HIuybuVlfH2
 suIBa0gmEq+xjw9suPLHHr+7250+k0InvHeQGL4n/zOKFoPDqpKC7aCjZqq+Vn3Yg3HcSB5AnZz
 9TX8PdhU6t/g2aWTrQq7BwUK6C/2YaFy27dDebmXQWPtC2g8egYI4s2fR8t2o78oGZ1LOY78fD1
 3TY2LbHRY/RQCbXmaXcaXnslvx59liSfqe7IpTurMyPeNWddo8VkcTp/pSxhWb/DctvAFPh2FmZ
 YBpjVi1QRUwEygI4cLPAysoOort/aWLnWNbCswCeZNzorlnW0pnLCdUXti4Ao3YisSJv07ZyMMH
 ZC2IjJBGIZCduS+t8oArnyF8T6z9UJgFj3nLs0QQDfqtlem8Hz8ocZ/i3npXBXTqQJ7Wz/Lqpfc
 YYQJLRBe
X-Proofpoint-GUID: 1wqD7AcBtQvIkjpySHJWyfHVwyOgxIXm

On 9/23/25 6:40 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 8:05 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 9/23/25 5:00 PM, Xin Long wrote:
>>> On Tue, Sep 23, 2025 at 7:05 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>
>>>> On 9/23/25 3:41 PM, Xin Long wrote:
>>>>> On Tue, Sep 23, 2025 at 5:02 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>>>
>>>>>> On 9/23/25 1:27 PM, Xin Long wrote:
>>>>>>> On Tue, Sep 23, 2025 at 3:18 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>>>>>
>>>>>>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
>>>>>>>>> From: Chuck Lever <chuck.lever@oracle.com>
>>>>>>>>>
>>>>>>>>> Static analysis tools have noticed that
>>>>>>>>> tlshd_quic_serverhello_handshake() expects its helper functions to
>>>>>>>>> return errno values, but two of them return GNUTLS_E_* values in
>>>>>>>>> most cases. Convert those functions to always return errno values
>>>>>>>>> or zero (on success).
>>>>>>>>>
>>>>>>>>> Cc: Xin Long <lucien.xin@gmail.com>
>>>>>>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
>>>>>>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>>>>>>>>> ---
>>>>>>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
>>>>>>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>>>>>>>
>>>>>>>> Xin -
>>>>>>>>
>>>>>>>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
>>>>>>>> Callers expect an errno, but internally the utility functions set that
>>>>>>>> field to a GNUTLS_E_ value.
>>>>>>>>
>>>>>>>> Can you apply this patch, fix up quic.c as well, and then test both and
>>>>>>>> post the fixes here?
>>>>>>>>
>>>>>>> Sure.
>>>>>>>
>>>>>>> But conn->errcode is used to pass the err to parms->session_status.
>>>>>>> What does parms->session_status expect? errno or GNUTLS_E_ value?
>>>>>>
>>>>>> session_status contains a positive errno or zero.
>>>>>>
>>>>>>
>>>>>>> looking at tlshd_start_tls_handshake():
>>>>>>>                 /* Any errors here should default to blocking access: */
>>>>>>>                 parms->session_status = EACCES; <---
>>>>>>>                 switch (ret) {
>>>>>>>                 case GNUTLS_E_CERTIFICATE_ERROR:
>>>>>>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
>>>>>>>                         tlshd_log_cert_verification_error(session);
>>>>>>>                         break;
>>>>>>>                 case -ETIMEDOUT:
>>>>>>>                         tlshd_log_gnutls_error(ret);
>>>>>>>                         parms->session_status = -ret; <----
>>>>>>>         parms->session_status = tlshd_initialize_ktls(session);
>>>>>>>
>>>>>>> It also seems mixed, no?
>>>>>>
>>>>>> The -ETIMEDOUT arm sets session_status to -ret. ret always contains the
>>>>>> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
>>>>>>
>>>>>> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
>>>>>> gnutls to kernel"). Passing -ETIMEDOUT directly to
>>>>>> tlshd_log_gnutls_error() does seem a little bogus.
>>>>>>
>>>>>
>>>>> Got it. I'm trying to align the QUIC err process with tls13 code.
>>>>>
>>>>> - tlshd_tls13_client_x509_handshake()
>>>>> - tlshd_tls13_client_psk_handshake()
>>>>>
>>>>> - tlshd_tls13_server_x509_handshake()
>>>>> - tlshd_tls13_server_psk_handshake()
>>>>>
>>>>> It seems to me that: When gnutls_xxx() returns errs in these functions,
>>>>> it only logs them, and doesn't set any value to parms->session_status,
>>>>> but sets it until tlshd_start_tls_handshake().
>>>>>
>>>>> So my suggestion is: not touch these functions for QUIC code:
>>>>>
>>>>> - tlshd_quic_client_set_x509_session()
>>>>> - tlshd_quic_client_set_psk_session()
>>>>>
>>>>> - tlshd_quic_server_set_x509_session()
>>>>> - tlshd_quic_server_set_psk_session()
>>>>>
>>>>> but change their callers tlshd_quic_client/serverhello_handshake():
>>>>>
>>>>> @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
>>>>> tlshd_handshake_parms *parms)
>>>>>                 ret = -EINVAL;
>>>>>                 tlshd_log_debug("Unrecognized auth mode (%d)",
>>>>> parms->auth_mode);
>>>>>         }
>>>>> -       if (ret) {
>>>>> -               conn->errcode = -ret;
>>>>> -               goto out;
>>>>> +       if (!ret) {
>>>>
>>>>    if (ret == GNUTLS_E_SUCCESSS) {
>>>>
>>>> is preferred.
>>>>
>>>>
>>>>> +               tlshd_quic_start_handshake(conn);
>>>>> +               parms->session_status = conn->errcode;
>>>>>         }
>>>>> -
>>>>> -       tlshd_quic_start_handshake(conn);
>>>>> -out:
>>>>> -       parms->session_status = conn->errcode;
>>>>>         tlshd_quic_conn_destroy(conn);
>>>>
>>>> We usually express the return code checking as
>>>>
>>>>    do something
>>>>    if (error) {
>>>>       error flow
>>>>    }
>>>>
>>>> That's why the goto is in there. But I'll leave it up to you in
>>>> the quic code.
>>>>
>>>>
>>>>> and then in tlshd_quic_start_handshake(), keep the code setting
>>>>> conn->errcode = errno, but set conn->errcode = EACCES for all
>>>>> GNUTLS_E_ places.
>>>>>
>>>>> What do you think?
>>>>
>>>> I think that still mixes the error return values for the internal
>>>> functions?
>>>>
>>>> The reason I noticed this is I'm trying to add proper Doxygen
>>>> comments in here. The internal functions need to be consistent about
>>>> returning either only GNUTLS_E or errno. The documenting comments
>>>> can't say "returns GNUTLS_E, negative errno, or zero", for example.
>>>>
>>> I see, how about if I do this in all GNUTLS_E returned functions?
>>>
>>> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
>>> index db5db31..0ee1157 100644
>>> --- a/src/tlshd/server.c
>>> +++ b/src/tlshd/server.c
>>> @@ -538,7 +538,7 @@ err:
>>>         tlshd_x509_server_put_privkey();
>>>         tlshd_x509_server_put_certs();
>>>         tlshd_log_gnutls_error(ret);
>>> -       return ret;
>>> +       return ret ? -EACCES : 0;
>>>  }
>>>
>>> This way, we will not need to change their callers.
>>
>> IMHO we want to distinguish between a temporary memory allocation
>> failure, invalid input, and a permanent access failure.
>>
> Yes, that will be nice.

Perhaps all that matters here is the audit message -- the admin will
want to know what kind of error it was. tlshd recovery is just clean
up and exit for all three.


> However, the tlshd_tls13_* functions don’t currently convert GNUTLS_E
> values into errno for parms->session_status; they only log them via
> tlshd_log_gnutls_error(ret).

The tlshd_tls13_ helpers return void, IIRC, because the session_status
field is initialized to EIO, and that gets cleared by
tlshd_start_tls_handshake() when the handshake is successful.

The quic helpers return an int... maybe they should return void as well?


> If we adopt your original patch (which kind of maps GNUTLS_E values to
> errno and  assigns them to parms->session_status) for QUIC, it would make
> the tlshd_quic_* functions diverge in behavior from the tlshd_tls13_*
> functions.
> 
> Or you think we should make this change in quic first and align tls13 later?
> 
> Sorry for the confusion.

Confusion is mostly because I don't remember how any of this works.


-- 
Chuck Lever
