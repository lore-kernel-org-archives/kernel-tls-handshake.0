Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0DC2EF
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 29 Aug 2025 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486030; cv=fail; b=VMSxVp9/I7uumpmmv1m8eUiFBBHFZ63bIoVll0T+mbmpBO6R9fxPUfVvSOF0E6Vyqq62OftKWi9HE7EITd8SU7msPfNEcipx7pPPwOBWB+flcky7GCOlplgiktNr6U0zmVy30UGPfB2K9UhYYK2Kb03bhCcZ54d5B/xkoZaWXzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486030; c=relaxed/simple;
	bh=m4b01O/kxEIQypHIj5yixQ+IZB+VJCHJwmTsD/LcWSQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LsHUFJGMrT2KKt8Evc0Wji+SAL2WJL+XV/GMX4XxEou2qszjVO6doKZKjUV2N6g1Rr7i+t6hNPe5hn7x+Mg/lCGPLk2dkSVIsoNZNY1tvjXJaCNGiec8fKzHvzqmjgSn47oesfKoxBdD/67N93nSEWDIWyUyXBUsT8fohgJUrbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cF5Ocipo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GC75da2L; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cF5Ocipo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GC75da2L"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGfjCj012789;
	Fri, 29 Aug 2025 16:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vwlf1CNR6E5lPi59f/DDKmG6dBvQMA646VlYAzhygb0=; b=
	cF5Ocipoaiz4Mf6cY2qoNIYSLTn7XfqX5DyCVS5+kTvIWfJPkyLQ9k0j4B84wBKn
	uNvPPKsXfWJiZbJ7kGU8wZkLG70ROdvtJrIHWC0gMMTMlucMwKFIJTfr3LO2+2Of
	Z2ZP7qtvY084v7AiELmYzYjNktbTK9XtJrUdkzoGxDxS6CBq6ZlcuWGP8BHQAm6l
	J0MilOFebF0rFiDSkBWWOQ5qxJimWTV8hMYrlyNv79s9mNbT2+IJrc+nOBQynAM1
	c54IR06mr1daI8auBj8/FDYDvGGuPD71IRC7fP2vFmhDV2+nN0yWgP2U196R1lKV
	iLf0obLxM1cwxskhcnqJtw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58sausg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:47:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGEH8U005167;
	Fri, 29 Aug 2025 16:47:06 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8dkux0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxr/7TZABIvUcVIaB7T3cnHBSJKNw7MJR6or6Ne7O7j7lH1Gt6tLEuvs91OQyd2m3K6MH3P7w1KsR/GjIcXMENjRYsBZwCVy2zwlwijqb3TazOtaXLsBhO95KiEmMTtQ7TYVltMVheShaqoiAeIuhPk2HWg+v8ym0Bq9XH9pFxvJ8GSSLSpNuSNu2RfGgUERf04alszC0iwJSlOJaEIdjBoy/yRsq41P+KFJs0wpa/aIwdM/w/2Z5H27qYKAid4crkcZYtjL2JbqWGcn8VyL7nWd1AsvGUhMgZAUTJtmI2+kr9FZpiNrDQ5XD0yICr+JcWKUcQDezp5FYTWw5IqjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwlf1CNR6E5lPi59f/DDKmG6dBvQMA646VlYAzhygb0=;
 b=LwjWMrRAatvey7s9EWyuBUhNomn7BBc8KObZfsY1F6ieEBDRGW/1W5yS9/hDgEWTPfa+t4jX9FUMPSNEQ0woJRTLRfxicY9UA/fGwUrYXVUyEZXw7LcG94J+9S4Zq+9FobgmsJGnbCI9YLcpCjhQh0IetH6IBwBm8Zk9fpFhPicZj1cdwYVME1p9Ual7VTW9RB4b3J7xuWiZZSPK31UKPjYlZyTf+4nf+7uV8LZZU82Dg9K3J0Mbed8RRJjqdDHCairgUmTtY9ak0isHv8S/CY2iHkarCw8wGNGSqzaCv0zyesjDSenNFAWZWClj9FPHSrSeFO0op3ho+j88eD6n8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwlf1CNR6E5lPi59f/DDKmG6dBvQMA646VlYAzhygb0=;
 b=GC75da2L6Sjz/h7SDVbwf6gq/hYGYXXBVrvHMNL0aUU26Ud2F26zseKFe4+xnqCYSnWgTSshTcthRR3qJOWsAjv7xiiMNCPjaBFNnGl0hyTQdfYm/Q4IfY7C4kvDjNr6a+gb9VxT+kqxPsGNcLneZMd1q0qXbfRLu62vfy0mZpc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM6PR10MB4267.namprd10.prod.outlook.com (2603:10b6:5:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 16:47:04 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:47:04 +0000
Message-ID: <e82b7b5a-d5d3-4506-a3b9-a86194b18b04@oracle.com>
Date: Fri, 29 Aug 2025 12:47:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tlshd: Fix priority string to allow PQC
To: Scott Mayhew <smayhew@redhat.com>, Hannes Reinecke <hare@suse.de>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250828222348.601924-1-smayhew@redhat.com>
 <20250828222348.601924-2-smayhew@redhat.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250828222348.601924-2-smayhew@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:610:5b::18) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DM6PR10MB4267:EE_
X-MS-Office365-Filtering-Correlation-Id: bf17ddab-219e-424c-303e-08dde71baeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3d4Yjh0d0QzVzlYSGtoMXR0RUg3UU9MK3lGRHVZeXJDWTdFZGY0NUhCc3d5?=
 =?utf-8?B?VFFnZmJGVklUZVVxeWJtdkNPTGV2UEVVaGVTTUFIUW9YUytBdGNLbEFSYlpK?=
 =?utf-8?B?MkpzUC9vMDZyUlJrOERDVWt4ZktrcGpEeENINFVEUDRJMy9XQ2p0NGVWZWVO?=
 =?utf-8?B?U0sxMTcvSk85ckd5aVQzYmErYzVXRmZNeExUWXdMcU9vVndWZk40RDBPQXVB?=
 =?utf-8?B?SW0vZ29wTVhBbk5nZjJZS29vdWZwOWJNdUdGTEhFTy90akhWUmdXQ2VxVTBO?=
 =?utf-8?B?MXRJc3B4MEdSVmtYNzc1ZkY5MWthUFJISkM4Mk0wYU9hOTBmUks5akFKaGxp?=
 =?utf-8?B?R2RXSnBKNmhXU3JuVUtGdGpDcGp4UGVJUXJBRWRlMUgvb2VuUDB4Wnc4eDYv?=
 =?utf-8?B?eDJqMkpjVTNNYmxuTk9PNmdRSFBVckpqSUlDeTJkUE5EeitwcEl4VWJvTFdk?=
 =?utf-8?B?MzAxY25wRVRkdzdNejY0cGpzWHBySXBUQ053dmFMZE5LQjZqdG42QUdIRzl6?=
 =?utf-8?B?amRHaUgzcXpJQXUvZEh4c2xYaytRNnRmb0RJSVllVm9JVHlsbzI1RG1qMlBp?=
 =?utf-8?B?LzNNUjc3RysvN0NBNGpnb3Vkc1dCNVovbUJ2VWZrV3NWQXhtYm5jY2pZNno1?=
 =?utf-8?B?RmR2Yko0bVdwZllyUmNobjZmRE1pUGlTR0hYRStJRmNOUjczdlZrb1FUOGcr?=
 =?utf-8?B?Vm1WZHRDOWF3U3ArMHdXckcvQjlvSFhWMzJ6WWpSQkJYY0NxRVVzNVd1VytO?=
 =?utf-8?B?QmRTdnFILzNpcklPTXpaYjFKWmJaQVRTbGQzWlg1dDV4VlB4VUZubGRmK3lk?=
 =?utf-8?B?TnpFT2hDOU5kU2dENHNoVGRkcVhzQlJBQ3lVd3JZWmZrdGQwZEVEQjc4NGhv?=
 =?utf-8?B?ZUR0cDk1MGJiWkQvc3NJbENqVXJ2N1NNak1RTTZLZEkxTUx3UHhRcjFaLzNq?=
 =?utf-8?B?SC9yMldXUFVxUytHMDFPajF3UFZLNFJFMmM0MWZIUS9nUEg5OTFLZjdadjdV?=
 =?utf-8?B?Tkt4bWxRaE1xODZ4WTgybUZnK2dwZEIwdXREZlRmdEprS2I1MHlqV1VEWkdz?=
 =?utf-8?B?QWZZTFNZb2pycFJrN1pTaG5YaXZ1U1R5ek1LRHFwcUUxZUZTWWRVT1lUano5?=
 =?utf-8?B?UUZ1d25mSVFRR3NFY01Db2N3cFIvSGhXVGQ2a2hubE1acEhPR0UxRXN1SU4z?=
 =?utf-8?B?WGtOYTVOMExScGVGN3hEeE9iMEtqaU92RG1SU0kyUDJxQWdKZVpBWjdmYU1Q?=
 =?utf-8?B?S3hSUXJvUXNoSnZvVzRrMDBURExCcFY0MUl3VmZCeDYvSUZnRytrSFlnWXB6?=
 =?utf-8?B?UzZGM28yTzRIOUUvUW5ZcWU5emgrUUJkVmxwY1BoZVYrbUF4SGwwb2pPV3g5?=
 =?utf-8?B?NFNXL2xPalZ4c1NNaExxaWJPS3VYV2grUWFXak1HRE0vRTA2MXBqYk9ldXlK?=
 =?utf-8?B?WWw1aVZxZ3hFSER6d2w5N1VSTENwekpwM1JpVElOM2IzRUlaVVZNZDVNelMr?=
 =?utf-8?B?b01iVGJiUytBaEttbW9sUzZWSE1EcTNub0REVnJtMXpycXd5dDlvazFzQWpQ?=
 =?utf-8?B?RTV6em1WTEt6cHp4MWVBRXYxRzM3VktmWlFsR2hJdVRoNXpjZ3QxV285bFov?=
 =?utf-8?B?eUJjTEFPZzNqL21VL2E2Q1dLb0JkMHNNZ3YvTjdUdnlXL1ROZndiZ1hxMzBB?=
 =?utf-8?B?RXVRd3VqQTBzK3U4OGpxT21YVkgrS2JxNEFGbDlEcUJVZ0NrU2JIOHR1T2d5?=
 =?utf-8?B?MFF4bytLNStQNlRwZ3hIVjdvR1hoYlFTeDRkQUhlVVZzcDk5UW1mcVFnaEJw?=
 =?utf-8?B?RzE4WURtYXJJK2wvUWZQYmtxeldZTUxJZnVDZ0lXN29IblV1QVBxV3BVME4r?=
 =?utf-8?B?Tnl3WnR1YmRQd0dOMkdsaDZ1QTU0T1pMTVlKRDlXbGVJVEtXSmNySTFac044?=
 =?utf-8?Q?i2+VFfPXz20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEVVSmZMMVU4cEExeTJHNGRmWTFnN3hqdFFZZU5MSmloRG5ZSGlzMGN3a1ZE?=
 =?utf-8?B?Wk80MUE0TFRmR3dUQTlaMTIrZHZNdmhwNVVaMUtUb2E5aG5mTUtZdDIyaFdq?=
 =?utf-8?B?ZFkyNkd6UWF1dkhPZncxckpDOFdmNTN6S0dxQ2dyeTVEdEtMT0FPajE5aEhI?=
 =?utf-8?B?dnErVFBEYVpPYktNblZhVlUrWnBydDJOaWNxZ0lsTlJTeU90cGJsSC9BbUZ5?=
 =?utf-8?B?c3pxenBOWDlEVW01UXQwb3RJRVlUaG9Yc0IyaU5WNnE0TnR6L2Q2b0tMQm1Q?=
 =?utf-8?B?OXVGOExaZ3Z2VDJOMEx1aUxHYk8xZ1Noci85SzNTSlNXUk1DRWRsbStrbWRo?=
 =?utf-8?B?OHBiZXAwREdFL2RURXNBTVp1WFVmUFhjNUFvRVhDZ0xMV0pOb3p3KzlvSU0v?=
 =?utf-8?B?Y2E1bVZ3RDZ1ei9EdE5mTUx6d21aLzNQTzkwWjB4c3ZqNG5PQnVYRDFlZ0g3?=
 =?utf-8?B?bGZZRVZxKzZ6U1JKb2FEMmRMVGV5eEpXOWdsWUdFUXZkR3ZyWHVyQ1dtc0Fj?=
 =?utf-8?B?TkJKS0lWSVhBSVdiOW05RFcxNGkzNjViRFBuNVlmWjNBMDFjdG0rTnJvSWpI?=
 =?utf-8?B?ZitDR3d1WDlaYjZua25Ea0VieFZsSE83MWZsWFVMSXpGRkszdEZETWhHWEZS?=
 =?utf-8?B?TUtXUlRyUEEyZXJNbUlmOXZTSnVYODd1VGNCTk5Yb1RyYkU0RGJXL0p5QXhj?=
 =?utf-8?B?QnVQazhRdXdiazF5cDFmQUFLRVFZL3NmTUl6bmpickxYdElNUnJDaVM2aW1z?=
 =?utf-8?B?L2FzNnFRTWUrS3ZRRTVOa1d1alphZnF3NnJRd2VoOWJJOU5UcldIdHpxYkpW?=
 =?utf-8?B?SGkrQjVjSlRMcEU4bFlXTDhIZTNLSk5Bc0JUNGx5Z3FYM0d3Y0xWRW9oRksz?=
 =?utf-8?B?UXE0a1ZpM1NyWGVGMkN3N09SdUlkL3NXWWtwSStCcXRXMklpSmhsanhXWW85?=
 =?utf-8?B?MU02dmRhYk1GWlZOSk5Ca2JUblQydXREZkFYeDZKZDRxTDNwZnorZFJNSThk?=
 =?utf-8?B?aVZvUWtmR1hCZ2RuclNrWFJNTlc2Z0pNbkR0UUljcDU4NVhhcndvWTBybGg1?=
 =?utf-8?B?QkNKVFZtdTF3MGlGTDhWeG4yaUdKQ3h6cU9zcXJVUi95OWhZM0F6OUl1SFBH?=
 =?utf-8?B?UzVIamRxdGYyTU9mcHBkUnNYZVJiY1RiM01ac29STjdUcHpkL1RNNUFXMVhV?=
 =?utf-8?B?djJya0ZPM2RmYWtqWlN5NE85RGNlRmE3dC93Uml4SFQvK2srMURJT0N6ZGtU?=
 =?utf-8?B?clVyNjExV2hBeWluZVNuR2k3MjVVYnV3YU1MVFg3NGw1UkM0dGdxbUsvSEQ0?=
 =?utf-8?B?Smd0ak1hc1B6UlFCcW9QTFlUM2tpYWdxSURBVzR6QU9INENlT2VuOStQWGFx?=
 =?utf-8?B?NWxEeVlMRzJVTGZaWnAyNGJvK0lxV3lXWkJQSkdpRTR5QmJvNHJseE1DNGp6?=
 =?utf-8?B?NXg4cmVRR1l1UjhHNisvS1UveERWMlRvR0FHZFNIMm9iVmVNVHJaaGNCZGpN?=
 =?utf-8?B?VURQSzl6eTN4RkV1NTU5V01EMVBTRG9wTkJSWGJvalhNTUV3TVpaU1RpeFBh?=
 =?utf-8?B?UTVqT291RVhDZ1BETU9uVWE0bGhub29Nd1VpV2N6OVQ3ZSswVXNXM0NaQ3d4?=
 =?utf-8?B?MTFIMHR2L29jaU8rM2p1MHE1ZHFDakFmY0VubTE5eEM1TXpSbndkam0ra3Yy?=
 =?utf-8?B?dFlzRHM0d3UzNnRMYUFnUGFjWTJHWGp2Qmh3VzJGRHlOWU8zQ0M5TUR0dGtY?=
 =?utf-8?B?aXJwSEVSNjZ6aXY4Qjl4c3NNQ1VMb1hZdjNxU00yRWs5b0hXbUJKSFlndmxM?=
 =?utf-8?B?b0NlVzF2Q1lrSFRmeUtzTWM0b2ZKdktyc0JHcnlRa0lBSVZxU25TOWtabGlV?=
 =?utf-8?B?d3JBU0w4QXFnS25Sa2VEeGdra0djSGpWNW53NmJUTG1pUUZScVE4TTNPZVpV?=
 =?utf-8?B?RU5rZnBwQlROZytEZUlTeURHQ1NnSWZKSXQ0NGhuTmhOQ0JiMlpUY2VxYmsz?=
 =?utf-8?B?ZTdVbzFjL0hpeEdrYVRxNzZRMUV5aXVJblRVUDZ3R0JYRWNyQjJzQ2FZeEw2?=
 =?utf-8?B?MmsxaGhqelQzc1NaaUQ3RXAydForYU8rVXIvTERMUmpRNGpxTDZ2WHQ4Y2Fp?=
 =?utf-8?Q?uDlg1vjPi9lTrLRkZAP1/TO3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fXI+i30hmZiuCrsbDWkrTovhQafpeibzGt9h/gjXEPpWwtUvIlgc0p6MVLWULGOJytRJQkiELwFGlMNjWokDHUjEYMmuKgcWl0QgsWWRHuzvv2oYSD649Ehk88RX6U/u6+NGz64Q+Rdn4JLjtWIWG5YbJsAsRXaQqgxpGeEcMOMjIak/+Tnycu2b5seNeL7mrlOoxrUY6mmIT8qVHgS7mwIlj7mBD9SCJIwAm2Xfdlcw2UKMyGJ85+pqisKV5EXIcYeVPNgyVaffNqhFaTOMcKKjrkvyeC6ZRCYh9EIn5zcZihvyoq1+8EuC2cd0ssJkVh+EZXBC7evtg5E71IyQ2PZoSlfZyfufdjIN/AEAVx5ud8eogUo4hN16eH2uZ8R2ZTlAq58Sm9UTNR1IMk4shKIUXQkuUvC7fxTz/5UZ06D94kw6TrFP58wVeLp0ePy6GvA5B7mqfxdohlgqyviLfHhiLy9Z8vM6mrwn7p9QuUKxMEbNbVSvE9aUebtGBg2QI1ZDlb7+qwpZqjmbO9/Yuc5gDW1ahlL8zOUXcZZm+VNH8hQnz/tCztxnGnwsUbxq5DuTROdTSL+xaqth/T8Uv2zyV5deVFFDD2LlG37kwvI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf17ddab-219e-424c-303e-08dde71baeda
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 16:47:04.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqekUx6mv5cIstTsg06GSLUEsG7hRK873qNeW5Ae02HQxq+1kAyAJfb0w25M+QGQnoGmyJMmFzD2RWxkFJpR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290145
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68b1d98b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=_00-uUQ9FHjRkHxgjFAA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12068
X-Proofpoint-GUID: uuWKP4LXeHp9kJGWgeVXWBrqRkNrbF2N
X-Proofpoint-ORIG-GUID: uuWKP4LXeHp9kJGWgeVXWBrqRkNrbF2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX61FlSe2Qa32W
 PNbpw43K+VYUkJeyaImb9LMaIMBbYzc754Ad+10xVCLxcEbx/gFoOomLSwfA8xK2r2WeouvM+0E
 /yJtZJEUryVQJ9BUlHEIPp7kJFpJEV4nZUDUPUuG0fzHSbru84g8r9WlJnhqOz/Um9PymY99STJ
 h6S584r7+Owh4BRh2gy5hBcR5xd4yNx2GP3q+Kb5oQyw3d6zWVb/XE4MIejUe+bBtGTDV2uxKps
 7nPha/WYl6NiOYdA3nxiCyKXPMAn7d8tyLWMENEXn4gI2JpU8hN2FsPMg3xRcLobfTrLQMrPGAg
 D4q1Fm0YpVHtfZP78at0TGD4PueSRRnujrSd7ksxmyKsH1isZt5s5C7ZiO+ly8cfc8aqZhnJUiJ
 AQ7+MtAZzJT5O1KgIvAtyuXW0VhJgw==

On 8/28/25 6:23 PM, Scott Mayhew wrote:
> Specifying either of the SECURE256 or SECURE128 keywords in the priority
> string results in the ML-DSA algorithms being disabled because the
> post-quantum algorithms do not map nicely to the security
> classifications based on "bits of security" used for traditional
> algorithms [1].
> 
> Use @SYSTEM instead, which will allow PQC on systems with newer versions
> of GnuTLS.  It will also allow users to disable PQC via a policy module
> (on systems with the crypto-policies package).
> 
> [1] https://csrc.nist.gov/CSRC/media/Projects/Post-Quantum-Cryptography/documents/call-for-proposals-final-dec-2016.pdf#page=15
> 
> Link: https://github.com/oracle/ktls-utils/issues/113
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
>  src/tlshd/ktls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
> index 40a26a4..866a023 100644
> --- a/src/tlshd/ktls.c
> +++ b/src/tlshd/ktls.c
> @@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
>  	const char *errpos;
>  	int ret, i;
>  
> -	pstring = strdup("SECURE256:+SECURE128:-COMP-ALL");
> +	pstring = strdup("@SYSTEM:-COMP-ALL");
>  	if (!pstring)
>  		return -ENOMEM;
>  

If I can get a R-b from Hannes, this can get merged right now.


-- 
Chuck Lever
