Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28D27E7C6
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372147; cv=fail; b=l+LgQkzFCq9qQIXz2Wvo0GneoYR539cODBFnvpsDF4r7376q9vMq3KS2VQhHOaiTj62EJ58yc6ZliUL2SMcswLD8oi5qL0CoJDDSmzvogZC+xMIhJKd43DZFrj3ME62MxI4MJ+bvfkpgXHFbKnZ9VkX09l1py4qSEioKn5oV7No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372147; c=relaxed/simple;
	bh=DJcaaJW4CFAktfVA2PswpglK9tLpQ3ONBD35VLNW7Pk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pr5x+61U6sn0t/u5akoqBAuOb/6pBM6OD9Q7are013aiG68Sa8QYMUwLfiNFHOmRKqXdfHvTfhzqKxlZLzpOvnGzfDeWSxoP2sKhvHcMoZa5n9ujf0PYyDlSQwqasy8gXUSdlTmp6+E46gYjY5OUD1SsP8qQEmMjIk1xsdqBpM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X9IkesNt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mewSxTrh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X9IkesNt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mewSxTrh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFu5tD013697;
	Tue, 27 May 2025 18:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KxCFN1oljE3ZXERT0DNJ3m7BYVRIttXx5IOKUVRjXRo=; b=
	X9IkesNtDcxV3BDOAbOCdOBS5TlPo1gzlDKluFrEboNLwmV6ywm0rR9M00JQU4a/
	2PFcKD4Ff8qIoPnMpA06lheOF/qWp0UfnLWUHMfZwkjhB9kAoMzV6KKsLBtNCo9L
	/CUO85d411kFG7rGSdyDo4m8sCa5S3FXWeJRlkMY15IDKquZl2SO3upgomdVike0
	hLkgBOnut42fRTJa+DeTTlKEZvt33+6QAvuhZRgfY3dB6Zv2lWUlXoJ6ipeOHnI2
	MiPLAamU8NTZr+Wo5ZmculRhfpAlHkE+DcmnjbZ/HVjLiKfK4l5v32qNBp+JzgGG
	hJUXQ0SVYG70BTAzzR9Q/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0ykv5e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 18:55:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIR6M8023901;
	Tue, 27 May 2025 18:55:43 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j9bbyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 18:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5hojENCFDer1ahy8Ek6GOjYYQK3Qf6XEmAuO6wzSxHqMRmZKmwiEdHpLwb3SiQc+xlVoH99sST8yhzFpGhjn8BNud4lsx4Yjusg4J8nrmdhO1ix551M2ePJZNjuA6Xw070OiiLr5z2ZftvArn/L5kX3KxbjATpp4w1+Mn9SDLdZIXeGvG/2Twaqp13ZdSF8m2ejMowOiflOPRAzcujf2DTD6fwwevhdR5RdGp1RzHgMiP8pGEWu8vGR2QtBzdXTPz5+Ohj1gYmf3ASe/4Y7lhW2OF82FB9LY8bY+8LdkmEo5nbUK/xZD1Ue/bDbi7t4f04Y1dqiDflYLp3CJKQrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxCFN1oljE3ZXERT0DNJ3m7BYVRIttXx5IOKUVRjXRo=;
 b=pwBZ7hg92VmRDXu1JbUjXQJz9x7h7rrBIQzzOYIUESI3XGS7LB2leC/huOPODWFlPYtXWQdHKOizYx8OMr8vU+3yGyFPNqjRG4N7DrXMy1tm4Q1p0iYjDg5Fs485qED2gJNwPrm4LdFrjKv3n/TxXRZEX6Iixzd/tZtyO+Wno1nDYKZ7EmJ647zGzTuCxAWHH3WvEsSD7gzeHCLzPeDtyNO/u8YFd4bXFmh7F1SwUQdCGj9d1bMRi9viM5aarL3j7mt0ansHSkQE4XBb+50+K87MYS7fos4PTE0lteaxaGY/tX1tvwpCIpkoltNfqCcAtST46FgtbbSVOi+Itx9WxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxCFN1oljE3ZXERT0DNJ3m7BYVRIttXx5IOKUVRjXRo=;
 b=mewSxTrhjMrXtSdivvBCJQssgzNOfx4lpKMHBaiaWCnpHs5cwJt4ynecnfrY15ktkzMJ9eFqTF5WFBbiyyml9pqAUtFpd2J4B9Jn2HHARd14Wh/hI5PhlcjjFYaqYK4LOnGjqOVtopX5fLFMnHNDtmXKxUhLbuDPexGVORK86w0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA3PR10MB8346.namprd10.prod.outlook.com (2603:10b6:208:578::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 27 May
 2025 18:55:41 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.035; Tue, 27 May 2025
 18:55:41 +0000
Message-ID: <0efa01d1-45f3-4d2f-b329-18c5b9a02619@oracle.com>
Date: Tue, 27 May 2025 14:55:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Further changes to contribution process
To: Benjamin Coddington <bcodding@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
 <23F7204F-02CB-4335-974E-EDF5FF01F03F@redhat.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <23F7204F-02CB-4335-974E-EDF5FF01F03F@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:610:e6::34) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA3PR10MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: ffed2940-1991-4299-bf2d-08dd9d5013b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0xWNXlPczR1UnIva0VEbTF3RS9Kc0xmdVVjeUtNTVIzdFF5RTRlRWxuK2l4?=
 =?utf-8?B?eFE5cXAvUXpyeTNTUjlORGEyMldxU2hGOXZoMVBmYmZaRys0eVZxcHpWZkhG?=
 =?utf-8?B?Ujd1SkJBZW96TVMzNmhtRlRORDJMU1F0emtjYTJDcy8rMWtRYnZOQllXY2Nn?=
 =?utf-8?B?ZVFBRWRXd0gwTVVlZkFBWitlN3J6OUxOWnEwNFo3bk9sUFFZejhtNjFIRy9x?=
 =?utf-8?B?clhscmVqWXlGOExWUUhvdWpYUUhyN0lvaGVZMldsYWtISWJkRHJJN052SmM3?=
 =?utf-8?B?dzRVaHlIRnRnOWp3ZmNXL1BIajdoOWhCdDJBcFI0bVBVMlZ4eDhXK01Ob1VW?=
 =?utf-8?B?SWxXZjNXVkhMb1czdE52WEhYb0ZrVDRpeFBxbTN2d3RoOVNIcHlKWWUyRmRr?=
 =?utf-8?B?dVc4cEg1MllZOU1IK09WbmFBWlhtYWR0RjJqek5ZSDVMRXdaL2U1VVk1Z0ts?=
 =?utf-8?B?VTJ0L3BkM0hFK2wxWlFhQ1pTZFllTjU3bFRHUWo4K3RxL1R2cWNNNlNyeTZx?=
 =?utf-8?B?c25nWkxHQ2Y1eHZMUWwwZTREMGIrT1kvazNuVVVsRmVna3l0U1l6K3FkZFI1?=
 =?utf-8?B?YU5PTkRQT1RENUlaT2p1UEdzNkNwSTZkWFhvTWxjRkM1RkozM2NycW1iV0Ft?=
 =?utf-8?B?OEFhWXlYcjZhUGRxVjhYL2FKTWY4d3pHK1V5RzVYdDAxMW1yVERTZjhHa2xs?=
 =?utf-8?B?Z2YwaHN4L0xGSGNyRlJqTzR5TUEwRitRMFFNWUNtTC9zVmg4bm9zNlZ4aVZ2?=
 =?utf-8?B?NDB3VW5yaWVhQ0JneUhQQUNEcXl3U2YrVHdEaElDU0pMM0VOakR2SmJxRFhW?=
 =?utf-8?B?Um51aGwvcEl4RldYYjg2SGFwWEpiYm0rM1dZR3lGMG8zc3o0SFpyNkFNUjR2?=
 =?utf-8?B?VURLNlcxMld6NElqeUh6TWExVklMSEs2WG04T3g1OHhzUlFkdWt4SEJmaHZp?=
 =?utf-8?B?alZRcE9oZU9DYjNrY2ZBQmRhRkhFR2Y2YUh1SCtydDhiS2dObmxEait2S0dn?=
 =?utf-8?B?TkdjVkNVM213NjkwZ1JCOWtId3ZuWUM0Q2hoTm9Hbmh6bHQzeUd4aEEzR1Vj?=
 =?utf-8?B?RTZ2Y1drVnNPSEwvLzAvazJzR1JTUjFIbVRyalhBaUg2VXhpSjNvZ25WSUFM?=
 =?utf-8?B?ck5qRG5tZGpic25uTTBNSUFOY0tmNnd2YWpudmFNL1hTTHB0NEhpUEdESWlD?=
 =?utf-8?B?bUhRTEhwdDVLSmdBZXBPRklSeWtvblpITzNoVHlUMDZneG5HZ3RndHBBZzEy?=
 =?utf-8?B?TzBkNlVyTTRjWkwvck1PNHpqd1dybGdEUUVOdlhuS0tyVFRIUzVOV09ZWkFq?=
 =?utf-8?B?Ti9vN2hMOTRiMFFzTkZHN2Y2OEhacGFSOHhGUEM1WDBsUGtwTHQ5VDJEMXQ4?=
 =?utf-8?B?VjJOemNyRjh6b1lqWUlaYlQwNDhmWEwzelVEcCtHVk1MeDlvVCtZTk5Vcng0?=
 =?utf-8?B?Qmx6aHhlVTF4Mk8xK2FtS21xS3dlSkN2dGZPTVhjSjV5ZGgycVlyM0JiL3Zx?=
 =?utf-8?B?c05rQ0Z0cXNtaGcrYWFPdmRpRDJxcGlaTUs3TWxEWmZXaEtEaUxsWXNJWlR6?=
 =?utf-8?B?aTliU2QwQ0tpTWR6Y1QxdFh2YTgzUGtBWk92Z1FYbkRaQWpMT3FDZi83TFBt?=
 =?utf-8?B?cGxBaVY5a21wS2FibXNwamp1UncvRG1NZHZxTTdqdy9vTU4xRzh5M2pwdkFi?=
 =?utf-8?B?V29CM0dFWGk2SXYyZXV2dzROdzVLajJpbXc4cG5RQXAvSnRGOExZdkhlL3lC?=
 =?utf-8?B?d0dIRjcwTXRVR0VBeC83NkJHREdsQWVKUkwrL0FnaXhKbUNNQlZCVkRTdVla?=
 =?utf-8?B?c2xXYjZ1ams5Zmo2VklRNW02YWpZQ08vMk5ZTEk2b2I5dmRoUjBJZVZYZmpo?=
 =?utf-8?B?ZGlpWCt6QXgwUnBkQUhJd2pNeWloMk1FWWdqMXBuNmJqVHhEaWdJUkJ2aVd4?=
 =?utf-8?Q?+nvdZCWzrb4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFXN1R2R1FrWlRWL1p5cU91M2xyM1JzOGxLcUpoVEplM2RjYjh4eGM4MjBa?=
 =?utf-8?B?OStqZ3VGbXQzTnNoZlhhZjJoaCtvTXlQUytRcUZmYXM4ZE1oUHhtQXpNMnQ4?=
 =?utf-8?B?akFBdzJ6L1pJQWVKWW9kTThPUkhaR0VJT0NTOE5BSWZCMXl5eW94T1JzR01l?=
 =?utf-8?B?ei9zMkE4YXJjNWlTa0R0RWhzajd5bC9yZEFIWW1QcmZkSkQ3a2Z5cWNiT1JO?=
 =?utf-8?B?R1d0UCtLR2lZemJMbTdHUE1RWndlbE13bHBSandKK0tpWmJLSzdOc2VsTysr?=
 =?utf-8?B?cXdMVEY3OFljSVdaa0IyQkFyUlJVQS8rL2wwMVNub3BvK0dKVnJYdjF0cG1M?=
 =?utf-8?B?cEpOeTZIS25lZndIdmVITWlMalBxNDBGOWlqZytjeERlWFBPUGQ2S1lPS3Av?=
 =?utf-8?B?R1JMNXh4YXlkUDBzYjJEaXBtTWUrNC9KMDlob01IM1BLM2VkRUF2em9ucEZW?=
 =?utf-8?B?enBDVFRnWUVDSERUdUV1QXVaOGZyYmsrN2xuMWpuekIyZ1dwNm1RM2UxbWZq?=
 =?utf-8?B?T3MwVTNublZBcmJYRTRQN2J4UVdPa1hnRm16cmxDUGZHenhVV3pMOHBTOS9E?=
 =?utf-8?B?WGhVU2ZxUmwweVdLdjc3RVhYZUpadkI1MVlydUphZFdxUitJWDcydmg3anJo?=
 =?utf-8?B?TGxZL3o0VGU4eHUvOW9jdXluRE01UTAyUUpQKzVNVlVQWkVCUG4vQlNRaWg1?=
 =?utf-8?B?NG8yeXFSMjRHNXVyZ1h4TDFWWHhzUzZoa2pCN3B2bCs5UHpSTnRtdnAwaWh3?=
 =?utf-8?B?V0dISU14T0lSY2RpK2ZvNklnOUR3TU43ekVWRk9jTjRYS1RVSlVWbDgwMDJJ?=
 =?utf-8?B?aXNBd1JMbHhBN24rZ1EzR2VGd0ZURUlnQ0htNGNsZWJoTmE3T0RSL3lpVVVC?=
 =?utf-8?B?SVAxR2RLdjV4cFJZbCtxWXBpRjh6QUJGamk1OFlzVFlCbDVZTW9tdDNoYUtZ?=
 =?utf-8?B?andVbkRVcmlmQ28xbXRRQmtIcGo3L3dEdmZ0S3VhMGhFeTBVMGdVQStwcWxk?=
 =?utf-8?B?aXd4cXp2VlJMRi9hcnhpTUNDdG90QkRsaWNPZUFTR0prbTJkRDg4eUJyQVlX?=
 =?utf-8?B?amxydzlGcHI5bmwrSUFXNGluTXJ3Qmt3bGFmZ1BYZEhaZ05OUVVXTzZ1S3Uv?=
 =?utf-8?B?cElFRHgxUHhxOTYxVlptNE9tWnByTXBoVUE2K0dXU2NEZERLZnNwN1VZajRk?=
 =?utf-8?B?MnZJYmt1a2VEcmVjYmo4SDl4SDZoa1REb0ZRbHYxMk5KbWp3cVREekROUC9u?=
 =?utf-8?B?alNydGNlRUt4NGFhL29vRDBIQ005MTA3RVZLZFM4aHlOZGVOdDAyMzFWQ0hQ?=
 =?utf-8?B?cTlDM1l2Q2FFcEt1enV0ZE5YVmpmdXFpMUpXdFFlc1l4NWZ0Lzg2NTROVkdF?=
 =?utf-8?B?VUkzTVhpQ3hnR0J1d1FXMnVkY2grUHA4eUloQnA1MUhIVzAvb3NDUVh3akwy?=
 =?utf-8?B?ZXpHd0krMEVETlk1bTVhR2tIanVSQnRKT3lRUkRST2c4L216WWVmcEZlK0Fa?=
 =?utf-8?B?bGpXY2hoSkhMYSs5a3dWQkNhZGlDRHRzZ0pFWFFVMTVZZTFlOTRQVVBicHJ4?=
 =?utf-8?B?Qi9oQXlaNGxCdk5ZMUxSa2kyMFRpSW0wYXFyZnZKRU9DUXJtUG1tNmgwVWdL?=
 =?utf-8?B?RkZLUHVLV1U2R1dDWGNyN290aFZ3SjcwT3RTZ0tWMHF1NFNrR2tkOFhqZU9i?=
 =?utf-8?B?RXp6SFJJTmtRcHM1ODJ4bHJ5TFNySytyTmx0T3VJalFNZEdZNkJJNmRNTXd5?=
 =?utf-8?B?dmZHQTFxQnhqTTlma3ZHcmdHanFMQzBlK0VLVTNEVmhYaG03YS9BUUIxYUR5?=
 =?utf-8?B?TkQ3VDVaWUtpeWNLUmFNZjZrdWZtWGk2OWx4bzJiR0tKc0l4RlQzNGtTbGRj?=
 =?utf-8?B?cHlLL3U3YnNUekNweFhpMUNGL0hoeWhDU0oyY0Y5ODJrMG1GZmJUcXJFdmFq?=
 =?utf-8?B?V2VMYklvN1ZTemxFK2xzZEhWc3I1K3NUMkhoL3MxNzFOWUlmbHRKRHJ3SzVC?=
 =?utf-8?B?TklwYkV6d3dVcDZ4TkR5RGhVN2NRODFJMms1YmQycitENzZsd28vajkzcmpr?=
 =?utf-8?B?Qjh6WXZLT1pDOHRDR3hQd0F2VmtFZ1FnRjcwS2pXL3dkTDVFWHhxd3RkL3Uz?=
 =?utf-8?B?U1FLL2srVEgwSTZpMlRLYnh1TisyTTZZdjMxUlJFcUo2WjBlcmQxTFNOeWdx?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hzgjS6r35Q2GIptk413JDFe+zYACG3E3blx8Tt/8aMINGqcRhaHQPdDcSX8w3BZLYugDbQ1qR0I4if+TRMZr7nlPOehfMJVa911N+m1wdqxpz6vqfxtUWd25pbotKIbCvcNol81f/5F+MggDVE2uMGixF513/fS9kgwQiE/lwAhL+40pIa6CMHijl7jDNbXPDJByJyuBYF1GbM4+aMmz7rh/x5YKADN87ii7A1W22OR04WBQtVYIZdAuhFsADnS+SX5G2Acf8IGq24qSM3m9LlT6pnm/VjmfoBZC3EGMZ5lutnxFkkZCqyQ1GOgA6x/Sn30CLULKJCQKFLpo+9P9ge6mO/EAHd3IF0owm9Ljm+um0GrjFBtLO/UTrvsOaDJ3Y43A1CdBrbPFkQwBDqZ/piu2HEnXHadUF0wHrO4mVQtA3mawhEI3oY/urEJV5i4kB/DP0akiGn5f3NRQcBsEt9ZKebjMTYlWrXJ2oQ8a0EsaIHDG1f69mA+ilGcumkgDLWu9GIT2nI+Snq483HNFXY/1bp8TzAPYj+yfcc+MfZ7C9IL8JpVHGkDew5qbNBhc47RHOweyUetf227vQFw6bje6rRyj0S9NSRoDzslPup4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffed2940-1991-4299-bf2d-08dd9d5013b9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:55:41.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1UtYsZdFF8vYGVKeoAha2+0mipLuuN4/nHsqcAhGslwZ4rtTT6zUs4HDI5h1kuULcb8gUcsGZ3IQrOSZCSn5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8346
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270157
X-Proofpoint-GUID: FjspvZdU5luZPRWhUTnHm3MPNHWjY3jK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1NyBTYWx0ZWRfXwCEq0JR3IJoE vguPCsHefZjUBLrRlOtjn6as3F+irdK3ahtKR88Z3BjIVh8C//zdhtNpMOnNqZqrOMYfVQFGBj9 2y9Xt3FEghD6v3OBxQGRt7F2h/psibVVDnOS2p9Cv6ShjupbOkzC089JzhyCMmLbW5rmxheH5ik
 LTj4eC6v21XJdCNBLZ34mNrtU0Ok09bzBgq38JZkDEvm9kBhtoT1qY/Q+8IvQ49OZKJ9cxBnIox WsUDHjf1WkSYI+0EF3PNWl+fozBbOtm/InyqiXt8rd38pgm6l/MrqUswvSr92e2RUsRLL4BcY7n zi2PbRRG9tXh/cg90gPasPC178kF62tpoUcTUHx+ABuJzVp2STB13EtZzobDJujw2TImijFQ8JT
 gxaQF5GSXWViiz7JTtLBZsvig8G0+U2Z8JG3yD2TP3pbEpKPFMdSAoge78DcmMiib1FwQo0S
X-Proofpoint-ORIG-GUID: FjspvZdU5luZPRWhUTnHm3MPNHWjY3jK
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=68360ab1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Hijy40x_bSz7wOZWzIkA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714

On 5/27/25 1:34 PM, Benjamin Coddington wrote:
> On 27 May 2025, at 11:23, Chuck Lever wrote:
> 
>> Hi -
>>
>> Now that first-time contributors no longer have to sign the OCA, they
>> have no need to interact with GitHub at all when contributing.
>>
>> I've heard several requests for ktls-utils to change to an email-only
>> contribution and review process, similar to the one that the Linux
>> kernel and nfs-utils uses. I've heard no comments in favor of staying
>> with the GitHub PR style of review process.
>>
>> If there are no objections, I can merge a change to CONTRIBUTING.md
>> that replaces the "GitHub pull request" process with an email-only
>> process, and then as maintainer, I'll eat the steps of pushing
>> each contribution to oracle/ktls-utils.
>>
>> Does that work for everyone?
> 
> It works for me - one thing that was nice the last time around was that I
> could see the automated gating tests for the MR pass or fail before having
> to harass or request help from anyone.  I think you'll lose that part of
> the workflow, or be forced to handle it yourself.

Those check-in tests will continue to be part of the steps I take as
maintainer. They do seem to run when I push into in my personal copy of
the ktls-utils repo, so if you fork oracle/ktls-utils you can still run
those actions before posting.


-- 
Chuck Lever
