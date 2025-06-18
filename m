Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B41E260A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262469; cv=fail; b=M4fKGyPZefGwasRKd6DdI4F2Z3e9b9VLhaVVMVuBMzHVlXKfS1OI8Z/DzATekxs9dTT+1FA4/fgq57HOMGXfNGigSzC34kDtTuCUYcPekrXrymDtp5aBmObpqV3YoEy/4eXsD1RbLEWVmbWGeB/GOVNvYNBZZntgXSQDiGRf8FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262469; c=relaxed/simple;
	bh=Cgag4MneqjYNZKo5QXUfjobgKmoz6WilDOZm43fUHcA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mXXqtzQt0Ri5NOLoGRIzMloEBXKlL4moc/MnqmFU0d8GI08TRVfgYpTMsaeKfZZo/8z1BtnwvKt0LE8GJxvVbmraGpLgDjUAVF2pQio3iexEOFJLGVvm3RjEgwbJ8wiH0U4ab8udQEKLTQ0WTjGn2TuiANj/IoLQnigcyUtBNuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=etTvaz/a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AyevocK7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="etTvaz/a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AyevocK7"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFBbtd016920;
	Wed, 18 Jun 2025 16:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4ZRdP8TVyBRipCXLIEtvAQKZ46b+auzu55cHm2TEm1o=; b=
	etTvaz/aFVgzSb4KcKnVuWJHvy65xzXHxALvsHqCtyMar31DCBItF+rpgVfIDLLX
	YJaju16WjkMsD36FJNgTYnSaUAg6zoHAEKt1qPYtFpMSBSIhu3BHHXUcKIzRE/lJ
	X4jZ5syoFNa2dvenJmf3rypnZGFlQWnXG9m915gUP4nJ+HTrC+uCISL2kp34MhJ5
	9mLKt+sf3xVXvrzCPewSBtRS/iaYZEbzCNOX+YwhXgNkyS21MHxHMbg0Bspfc0FP
	H7R48MFSIHlPtalwmRgUbA+lSJyL9orQgrJqkaIEyFEJTgLO5rMF9k4Yex1GN41q
	WFe/4pBaKQYx5Y2AZccBUA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn7hgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 16:01:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFgNgL034396;
	Wed, 18 Jun 2025 16:01:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhak9mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 16:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pw5FlfJo4YQtxI6eKmhfiPmrZvCmA7XGIf6KR6+1hZxXeaW+8KHNlR8UFlcA6GnvAQbu8a22Wa1Bn+KFB5dKqTAqL88Gi3Gyf34p7XnlAljXkfESfzQlFMEAQ5tO6wW2EB6BER81TKkIzxKbEUVVJH+EC9e7SoDdXt5ua8QRyvR+9mjm+h//A1uWlq4bpKGsZjl13Y4l3OXBYpkvRIyJD6VeyIgrtLW/nrImAzdW6UjN7bNvjtgncV3WnY6ayldDwUwKn0dD58ufzlgLQRyMRacRdqI07FjEjopYnwWSl1+3EAB4hWHJj4o3FpNlnZy/d5alH/mV3dZEZSowhENnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZRdP8TVyBRipCXLIEtvAQKZ46b+auzu55cHm2TEm1o=;
 b=UnmoCLqfdza6e28gjQ92BluRISIvw3bSD/FvShMeqE1Ua7WT4G1njIfxIkW/pg13rsU5YZZ7BD7L1YUuLjiItXuxGylb6Z6EJDzLGwkGE05/JJfH8VkVuwIvOLWkSavLBxdcsr4eJjGDMLEro10ZRxKfwFPhhQucSE2aXetUUPhC2kmuZdB7f1apqDpmdyqVY/F0LkzZXefj8fpGPcAIGYLfNSRxajvPTAmctT2I7uXePmI/MEnrGKo5ezwFIaynvpuXiDE99xZk6xdcUboT2yoTJt3tdE6WZvT0TnHXrVmZQmVg5V6XRqgq65ubUGW7wjhgeurX3YJ6bLeJQcofqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZRdP8TVyBRipCXLIEtvAQKZ46b+auzu55cHm2TEm1o=;
 b=AyevocK7aqFKRqH7v2PMccDOwuRM/N4QPejkDZPcJNETh0g1U8iSKdscJMOU2icjFGYrOOiGTHUO7KBklAGbnC/SYYo7GSSQ8tNga/TX0a5QnJ3Qv1rnT9QNMlr3hWKCeXfX6z69tyJpSU2whXtzQj2b4ajhXsUHFUlbVfMNKYE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB5972.namprd10.prod.outlook.com (2603:10b6:208:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 16:00:59 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 16:00:59 +0000
Message-ID: <5b4f7024-29b4-4b34-9109-268ae6c93002@oracle.com>
Date: Wed, 18 Jun 2025 12:00:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Ken Milmore <ken.milmore@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
 <7e910cd5-f095-4002-841d-ea724569312b@oracle.com>
 <47ec64e3-22f7-46f0-b929-963f7ebc1bca@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <47ec64e3-22f7-46f0-b929-963f7ebc1bca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::9) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1df00f-94ae-4c78-2f03-08ddae81511f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVpBb3Y2YUU2bDJaNmxQNFlSR0JyT3ErbXVmclBxK0NRTzVaaGZIblEzZnhu?=
 =?utf-8?B?cmh3UGxCRE5mZTV1ZWozb1JMT0g0cUpweEhlcHpHNTNHNkdqNmRKN2U3RUFH?=
 =?utf-8?B?SlovaTFtVGEzU2pvK2QxVExXbUcwQnZBQWlmbkxycjJlbUNTRFFSV0hxMVpM?=
 =?utf-8?B?R0p5Kzd2M3pBT0tKS1BWUmVKK0xSTEI5anBhOHhpQlFBU29qUUJmYnBweUZ4?=
 =?utf-8?B?aXJCeHBiVFoxaWhWTEN5eDdtb3psdFNLYkx3VGZkZHIzUytWcENySTkzRC9x?=
 =?utf-8?B?UnZ6RlgvOEQwOWdVWU14TUVHdWFES0kvdjVpYlVyUWVFN29lR2NhVUFnMVJC?=
 =?utf-8?B?czRCN2ZqZjUrY1NBOW5WN0hxcHZIT3UrZUprQnlEa1ErRzdDOWVGZ1NMeXdp?=
 =?utf-8?B?ZW9MdGo2Q04yU0ozb3dPaXFwNkxNT1lSY2J6aWRmVU5nS2RId3RVaGNsZ2ZG?=
 =?utf-8?B?YkJqcXNSanAxUC9QVDllZ3dHNmNBcm5oV1JFRGNQWjRtMno0eU1laUNTWDY5?=
 =?utf-8?B?dXdlVy9zQVpNWFcxcWRCazhubGk1bVhUN256RUtUZThDVDhFM0JPcUc1ZWlu?=
 =?utf-8?B?bTNsQmdiMng1SWZOMHFudjhyZW1meDJQQ0ZoWTA0N2JBamF4clVvSlJWcGRF?=
 =?utf-8?B?emFDQUVjdUpZTXhIc0VYLzVkS1pXT1RmbkRCay9CN3IwWDUvMmVha1YrcTIy?=
 =?utf-8?B?T1BvdmY3bUY2a2tTYm0ySkVEdm1MS2lCTHRYSTdIVkRiWHM2Y0ZxSW1wMWpI?=
 =?utf-8?B?bHVvMHR5N2ZYOStnWWs0N01KZU5KWEVPNlVhaXRMWHF1bUNlUWtWeEw3ZFBX?=
 =?utf-8?B?SGU5cU1NVzJ1L3YrSmZ1bFptZ0JJVWF6bkIzYkRJZVBLOTJPM1NucWdxVDNp?=
 =?utf-8?B?SjZFV0Z5ejNlV2VzZStZVUpTWU1RZUhSQ3VrSGZzWEovMFFGbDgyZVNWYWwx?=
 =?utf-8?B?R3FzTG1CZG5ScTkxOHBOT1ZWYWFkWWVoai8xazBDRGRGdDliWEM1Z2UvbVdC?=
 =?utf-8?B?UXZDUlNxeHFjK0pxa2tlcGVNNHdTQUk4SXVsYUtVRUhDcWlyQVZMcEVzZGJl?=
 =?utf-8?B?Z1pHZHpNK0Y4V0tZVStaT2ZxSWRUV0VoakpxNURDMitkaGdrZU9zZk5xY2M0?=
 =?utf-8?B?ZjlTMGZsZEJPWWdGME5FWTNXRTRkRUFsOHQ5c2RsQWFvd3hWR3Y5Q2x6V2xS?=
 =?utf-8?B?NmVYY3U3SnBBS2U5RHNvWG1nMG9zZEE3V2xXNjAvUDY4QVFUWDdFWUhsaWlF?=
 =?utf-8?B?MDVqQjJPNTh5UjFKQkE4UWRxVldqZFZ3M2YrQmVRSHhhTDE0MU1TVEhTSDhS?=
 =?utf-8?B?eExBeUNKclpjTXVPRFlNZXF5Q2REOVkrRzVJUWxrcGpZM3lrNlVPKzZWRFRj?=
 =?utf-8?B?aFVBTVZjbzI1bExXYkFxaytZc2xXOGpqUUt5L2xFZ1ZGcjFYREcyRWE4VWJZ?=
 =?utf-8?B?cTVwUzA4WmM3NTZJY1RMb2IrR2dIZFdGZm41NjBTSC9PUDN2bFpuMWxiQkNj?=
 =?utf-8?B?eXlETHc0Z1l6U2h5bWZsd2xXNzAxMzJQY0FpZXlDM28vcmNoYzNjOWVlOWRS?=
 =?utf-8?B?WGZWKytVZzYrTXNhcSt5Y3J3QlMxNmZMNmVoSlJFK3ZSQnIyOGZnNDEvTERh?=
 =?utf-8?B?T2YzYjNRZHVqY2o4eDBnOFYrVHZWSk1CdGF2Nm5XcFJOeGplVk5xRm82cDlQ?=
 =?utf-8?B?TE0xZ0V1NzZLaTExMnBKeE54UmEvbDRzRTUzWG5YcDEzRTFxZm9KSGlaUkRQ?=
 =?utf-8?B?Z2dRemd1MFZOSENKekpoRDVvTXY2eG9xaGN5T1hxRThVNWsyMXRtbVk1RFA1?=
 =?utf-8?B?NjVTM2pTUWV5S2dDeS9WTmVVVnNJVGtJTGkvMkdJdXRKTFUxbXFpY0JEYkt4?=
 =?utf-8?B?b3ZQcjVXenc0RlVucVJQYmNIaHZXc0lWeERNcTZyVDNkYUdZckhMeVF2aTNW?=
 =?utf-8?Q?NyZXK6pm2Lg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVEyVm5memFtbllWRzhiWXZkT3cyKzJRc0pGbkdwSnp5L3ViNnZmZCt2RkE5?=
 =?utf-8?B?Uk5LaStXS2RVQVBwWEhzQkdwQi9PZlJxM0dLNjc0R0RMTWNpTUJOc2taSjhS?=
 =?utf-8?B?TVFLL3k0Mk9OMmhEN0N5dmtqMldtZlRRem1Tc3I0ZU1RV09qNEtxL0Y4OTBz?=
 =?utf-8?B?Q2VXZFJTUk51QnFHR1U0akpndURvLzlUMWFYellPWGNsT2h6d0lDeHY5Zy93?=
 =?utf-8?B?ZnVqaGlRRW1vNCtWckEzUFZ2RzhBY2lNQUFReXhLbkV5Y0ljenpESmh0eVY5?=
 =?utf-8?B?SEMxKy9DcGh1Q3RZakRrRFdTQjdDZTFXdTk2UkJPNnU5aEFTbFFPd0ttOUV3?=
 =?utf-8?B?K1puRWE2V0l3KytUc0VOYjlRTThZaVM1NldGdjEvTXlHaXRsZ01ZL09yeWpj?=
 =?utf-8?B?MUkxMnBEOWtDWVJZZUYyVUJONU5PeXBiclBCbks2MXNyYVF1Rjk0UVVDL3RV?=
 =?utf-8?B?UnphcUkzSDRTZFlkZlJ0SUg3eTRDQzNXeVA4WjZ0OStnS2tuUU1YWkFyLzAz?=
 =?utf-8?B?eWJqUHV6ZFpUaExJa1o3cGV6MFRrREVSMXhIc0x4UVBZNUtPSFliaVk5azBM?=
 =?utf-8?B?UkJGNzcvQktuS29UdU9xOU5xbFRkRkVzbDBUZ013UXhuUENXMlQ4bkpseGhM?=
 =?utf-8?B?SENmNjNQbHFWQk81VHdzdmdPMFNmN2hwTkcrVTM3dWF2VHdEakEvclJsRDVs?=
 =?utf-8?B?dGthTlRTVGJTTHA5bTBZTERHeDdaWmI3bGhuTExnR1l0OWJyM2dRYVE3ajlh?=
 =?utf-8?B?L3ZuN00yL3NsaC9ZOHZlTlYyaCtFQ2JMZDdqbTdleDc4ZDdwSlZYWlFqckNF?=
 =?utf-8?B?UFQzdlFYNmFOSXJIQWxkaExGSjBMbWVPMmxOaFZGbFhGVEZYRWdvU0VKVnJU?=
 =?utf-8?B?VjhlZ2U5RFpjaUFTZzlXSWF5ZWNJcVZqSVlNaEFVcC8zcU4zVU9pY3N4S0Nm?=
 =?utf-8?B?c3JJcUt3aTBma3RMQU5nYUQ0WTBNQXhBZ2F3UHAxZ05qNTRLVTl3RWhzT0o3?=
 =?utf-8?B?NTlNVituZTBEQkozaXJadllTZTZVWVpFcWdBYXZJY0VnaU5pWWhNdVVGVENB?=
 =?utf-8?B?Tlg0aUlYRmxXR1VWdTJHTDJpWDJya1FZQTMwZFdSdEYydFlMS3ZKa0lwZkQz?=
 =?utf-8?B?SDYxNDg5SW15dHlHZUZMYkgyQ0g5QU9uNVhjalRqNW52c2ZmM1N2WTM0ZFFi?=
 =?utf-8?B?LzI5RC9LcE5tWUF1NWZ4WG1jZll0N05teFFsamI1VjM0d2gvczF4czM5blFp?=
 =?utf-8?B?d1lqZHFDODhlRjdvMmtKS2RmWU9WVzNCL3JSZzhKWUl4TTJkZ2NVbHJwSy9U?=
 =?utf-8?B?ckJjNDJ0Nk0yT2Vwd2ZNbGFsNGdyREE1Q0VQdVorQUIyZXg5SjZQVFh3ZWtp?=
 =?utf-8?B?T1ZxNWFDQzVrc3Y4Z3hBWm0yMWVDZ2Zyd2tUVjV5R2c3cEdnRDhIRFIxZ2ds?=
 =?utf-8?B?TkdSYkhaQXg1SmlrMWtMVjV0QXQrb1RpMytpeGdOeTVmQ1lMb2xmKzlHVlhi?=
 =?utf-8?B?ajlFSTc4TGYrVElWcjNXbzJOM0FGdDMxakNwS3Q5QzFrSjE4SHN4eXdxaTht?=
 =?utf-8?B?SUloZTRmY3AwandIL2pnN0V6YzFXK3ZsV1VKdysydXp6OUR4LzFvNTRzbzJZ?=
 =?utf-8?B?a0VoQ0c1aE1JWDRqRzUyaFBHamo1dzdHZHFWbzhIcTBSYnlaV0RQVHNERWJn?=
 =?utf-8?B?STJvSjUvLzlWMURoQW5XYi9nV3RtdGRzUytXR0s3K1U2d1hZalJEbUVxWDNB?=
 =?utf-8?B?NU5tOXZZZmtITy9DTlpXM1F1alk2ODMwMUJ4NVdaaUVNaEFDRTE1NlpWZmhC?=
 =?utf-8?B?dGQrWW9LNnNrTlhSZEgyeFBJR0NMdzBydEhTUjVHb2pYZStwanNGUHNoV1Yy?=
 =?utf-8?B?Y2lhRkwvM1BZbWRJbHpDbVltVFZDcFRoSXdDbnFkTGRyY3hEelFhUzl0eEJY?=
 =?utf-8?B?cWU2NVNvY2hBTmpBRDVBVUdsaytrOWRQODc0UlhRYllPY0YvYWlXb1lqc0R6?=
 =?utf-8?B?ZFF3dkpNOW10d1BoTEhUckJMQ1JaY0Z3R0VjSXo4LzN3R2kyV2JVbzM0bzBq?=
 =?utf-8?B?WjAranFxSW05bFlUc1hBK0hJek1CUDFIcnFhbEw2MXF0RVI2cExRbklPOUIy?=
 =?utf-8?B?Z3pYYytOVGZMSXpjNVprVmF2SWFiM3FZZXFXUHpDR04yQUNSV1IyekhLdnVl?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jTpJmc1/XTL064lhEUGvkwQJxvhpvg1AoSN2fC/OGTx254rpfLCyakkS9Dd38/De25hrMXKPWiX5UZZtDrdiznZ1c5FfoTWZwBV7+aKRpIb9R5jQS6WCsShPVqRd9eCILvEuboXX7pJth+HpXJ9aLqpiTdvFfDiJx5ZSFrqX8uSiLStz6YGRFb4xZAHZMuRaWTMzq9wzMvAPpjt47J2MSybOBW6SkwYwRlE1JC151wlkqX5qqCsGbFmIjwf13zBM0iHcXcYsqEmdbf3gt/4JjB6gx1NrMuEtDT2VcXwNpverG8C8Qz93Tf3XR/TQfvfHJ7ytZYV4GRL7Cy1PIg9SnkbwxCzKj6bchyX0JawCtz5YteagXicP6ckYDYM9lycKW8quXekA12nli4mTddDZ5M++K4o/cbpQ8jLMjsvBCnuSCz+FyQR9IqrcNnGiV+seKPgQjtYP1yfbx3h7pglpcmZItjz8PzC+yo8O0KBoXDw2ttagIlgFNEEZ4IwN8eIm+hxsDYq28Jq5jlDhdkWxjV/+Lyhc31fPsyP2ckdSDTj6U/m/QSNCxYmfM0gNmtZ0JrBZbZiFIJEUqXmoSPISqI/OaUxTDlBN2W6Km48mSQE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1df00f-94ae-4c78-2f03-08ddae81511f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 16:00:59.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0k+K+J+pMfF8A7Hu23H8VY5S2gsvC4E3jAlz9uypA8WoF9sVgtRpjXBPTbJ2xacioGYxTVuNmKJ0uMSlN0+yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180135
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6852e2bf cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=6MySdOUj0w3Q-kV5GvsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FoLf1kxsXnfmFpTfx63MWU619fdoZUJO
X-Proofpoint-GUID: FoLf1kxsXnfmFpTfx63MWU619fdoZUJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEzNSBTYWx0ZWRfXz1taQaEYbFQr qdYex+bJpiSCECXEMIO1vDtdTHVn4ujhrOJDsFll3iEyWb8qWcYa+ZCzycWVJ+75MimPEM7N6My 2iyLW+X6eHcbG4yXqcnwrvg+w2Iij46LnnJIXoTbgPl7tnvkTFdeiUbh251zrOVK5xVLw8B/Ywk
 6uZfv1crzbZiv6jKOLhYDa3q9J8jFCSJwBz4UrKPdXERwL0kKz+NSD411YgIKcrRjhzcwMjdM6P Twg604r6fw81QaujQKd/3iUiSCHAx31ZGJNlDGrPuUwtciugsSCtnzFsZwYIedRksvugosfa/ZD cY5hNfsCqEe4yx4oL17tOzQ9E7gXPT179Ldxioe6Tw7FL8/9YIczKNoJIQBs6Vn16/lJKPQt1kM
 RObIigJ2+ZmX5fDdaSL+2qTqbC4Q6U4bQK0Y4XlLcOketttsFy4xY+XuS45+A1ihM5WR51cC

On 6/18/25 11:03 AM, Ken Milmore wrote:
> 
> On 18/06/2025 14:42, Chuck Lever wrote:
>> I implemented this.
>>
>> However, apparently, source IP addresses can be spoofed as easily as DNS
>> query results. I don't think we can make even the IP address check as
>> secure as it should be.
>>
>> Add to that, such a check is not possible to do for clients with
>> dynamically-assigned IP addresses. That includes most IPv6-based
>> clients.
> 
> I'm grateful you've given these patches such careful consideration.
> You've demonstrated how this sort of client verification doesn't apply
> in many situations (insecure DNS, dynamic IP addresses etc). I always
> understood these limitations, which is why I made the functionality
> completely optional.
> 
> Given that tlshd is a very general mechanism, proposed for purposes
> other than just securing NFS mounts, I can understand that my approach
> is not an ideal fit.
> 
> However I still don't feel you've grasped the reasons why this approach
> is useful, and could be used to enhance NFS security in certain limited
> (but IMHO very important) cases.
> 
> To spell it out again:
> 
> - The current position is that mtls will allow access to ANY client with
> a certificate in the local trust store.
> 
> - This means a client is ether trusted to access ALL exported NFS mounts,
> or NONE of them.
> 
> - For effective security, I wish to limit that further so that a client
> must have a certificate in the local trust store AND that certificate must
> match the network address or host name they are connecting from.

I think you are conflating "trusting a certificate" with "using the
client identity for authorizing access to an NFS share".

tlshd does the former. NFSD is going to have to do the latter, and it
doesn't do that yet. That's what we want to do with handshake tagging.


> Why is that useful? Because each NFS mount is exported to a particular
> client or group of clients named by network address or hostname in
> /etc/exports. With insecure NFS, this is not enforced in any secure way
> and therefore a client can easily impersonate any other client and gain
> access to the mounts which are exported to it, simply by address spoofing.
> 
> These patches were to enforce that the same checking already performed
> against the NFS mount point are also applied to the certificate, therefore
> it attempts to PREVENT TRUSTED CLIENTS FROM IMPERSONATING EACH OTHER,
> limiting them to only those mounts for which they have been specifically
> addressed in /etc/exports. See my previous post for examples.
> 
> Without this additional checking, a client is either trusted to access
> every mount, or untrusted to access any of them. This greatly reduces the
> usefulness of mtls. An analogy with user accounts would be to say that
> you can have as many users as you like, but they all get root access!

Yes, that's the situation today. Our proposed solution is tagging the
client handshakes and letting NFSD gate access based on the tag list.


> When looked at this way, you will hopefully realise that in scenarios
> where it is possible to verify all client addresses, doing so can only
> add to security because it ensures that a client must have the correct
> certificate AND an address that matches it, a more restrictive criterion.

We are very aware that "xprtsec=mtls", as NFSD implements it, currently
does not perform fine-grained access control checking.


>> I might not fully understand the vulnerabilities you are trying to
>> defend against. IIUC, there are two distinct impersonation attacks:
>>
>> - A client's certificate and private key are copied to a different
>>   system
>>
>> - An attacker creates a certificate that duplicates an existing
>>   Subject
>>
>> Seems like both of these can be mitigated using a narrow truststore
>> for the NFS server's clients and/or a CRL.
> 
> The problem, it seems to me, is that having a global truststore is a poor
> model for securing client access with mtls.
> 
> A global truststore works well for a client accessing a server, because
> it wants to verify that the server is not being spoofed and gain a secure
> channel to it. This is how CA certificates are most commonly used.
> 
> But with mtls we need to look at things from the server POV. The server is
> going to grant access to some resource (e.g. an NFS share). It can check
> if the client has a trusted certificate, but if that is all, then it implies
> that EVERY trusted client gets access to EVERY resource or share. Not very
> fine-grained.

That is the current picture, and we agree that is not adequate.

The only task for tlshd is to determine if the certificate is trusted.
It is up to NFSD to authorize access based on the certificate, once it
is trusted.

The question of TLS client impersonation is strictly one of how the
client certificates can be misused to become trusted. The question of
authorizing access to NFS shares is entirely separate.


> In terms of trust stores, I guess the only way to mitigate this would be
> to specify a different server trust store explicitly for every share in
> /etc/exports. That seems rather unwieldy, but it would work.
> 
>> Do you feel up to opening an issue [1] and describing your threat
>> model?
> 
> I can do so, but I'm not sure whether to frame this as merely a lack of
> documentation or a security threat. It depends on the security expectations
> people have of mtls. A big warning in the NFS man page saying "mtls does not
> protect against trusted clients impersonating each other" might be sufficient.

TLS client impersonation has a particular meaning, so that is probably
not as accurate as it could be.

"The 'xprtsec=mtls' export option ensures the client is trusted. NFSD
continues to rely on the machine name (as described in this man page),
which is not secure, to authorize access to exported file systems."

That would be added to exports(5), not tlshd.conf.


-- 
Chuck Lever
