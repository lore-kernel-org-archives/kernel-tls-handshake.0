Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD42D0619
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513873; cv=fail; b=NARPT+UrbIdnx97fj8vW9g4iZTa1gRggISJoHnnTsVlhLD5HwpPKVytcudKvsq9zsfmqBEshdJEAl0ZoV7ZJqtj+OIhHkmaiGQrlCpocDf4mUMpaQvjDYQLiCT5uE56fLmPfe8qhmIM7Y7ZcU04I5hFV8qkW0weYQ527LIsCvzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513873; c=relaxed/simple;
	bh=gyrCW2wkyCn01lWTO5vSbIZ3IPgENr6aMW5ayQ4Q7Hg=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=TazyJBSRrlZ18b2OgRTXf3Qm2H3YpFTpk4rKf+5z6ac7EOksyfLlsCbMep/oiyQhQ4jdDZDhSyxruIU/u6SSDhl8n/7UHcBRgcDLMvGZnHhxbwzG+k7f8No3PQwYND8AbtnBQaGU2+k3AQ/UYBezFD89UM3VnnRRZy/yno643yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dQpv+zWz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IUh13+1c; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dQpv+zWz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IUh13+1c"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593HBxoe004951
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 3 Oct 2025 17:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=V3FbH2fa2gSznYNH
	AH1oDTC0lIfEHqc1xHiAdDvStp0=; b=dQpv+zWzExoLuWUkMqnsAYxt8FUKyfVX
	lWvjeaXsgFZ5TJGEaO6tryueBPW9nylIRdljlQVSIaVNcrgpzsfR/kuYyd0iYhEk
	Uqy4VVh6Zuj36flhnpRdACEUBRjjy0z0SEzXVP8bI269nLxOXoBTR0aNwYfHBrvb
	pkYeNyDFOMqfeLh+t7xuEnzU36KrAHlBd9A/Y7j1yLvWoze70k6KyuzdrjxILCYH
	PgsQiGTc0AWu/k7weTfB/UbixFh28z1KyEMlj/UKQNcX0yzlC99uPR6FYln1AIkw
	RhmVtco821JkEuSuJ8EaJ2Mzupx1+9CjKBcqiH7G9f1oqhj1QI51iA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49jj2484v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 03 Oct 2025 17:51:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 593Ghlwu017353
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 3 Oct 2025 17:51:03 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw24a1aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 03 Oct 2025 17:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGJJZI+7OYu+jQ1b+PBitxZES24OMNuODaZW4gi0UYtSZKTGpfKgBmcrZ5ftvZvAIglvcbAlPVzzAhWoBzACvi11WSoxYDNew2clHD9MothrEDMOpjUtfrFxlWz+NspvUg1AJ9w26W0YOKNJfKKhGIjFLmqyhNgUAxZ3A3/Slb8YM86lUn/tuoYKZpjIIXCazuWZJx12vY1vTJxTwDb3YveLXYehmKutTcNnN/YQWDyf0DrO7U6TGp0nI3kZ/pSVgBY8SeuyJ3ycc5UCLcGDp9zPryo70QLcNdOD8krVmv1naKqXUZciXGUO6EtzKhhuA2AeWRQRxC2AVFsftzaBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3FbH2fa2gSznYNHAH1oDTC0lIfEHqc1xHiAdDvStp0=;
 b=BPp4t8NVIV6ixaswzXmtES5oQH5DXgASMuey/VJcm+i/tErfjmdnkzkzVS1XfEfM3EG6/KpVUxqN5B8/BFhiaChDz6Gqw7RzUCeCbY7tL0giy+S3frapOnDk2epmraWHk1nYnr6o/L0Bw7mKBAP7G3PHwhkUY4B0k469NHzs1RDfkig7GsG9MLbxeBX28HWoKjBhoYHu2ZOWdQa8hgU4CXS3dEkUKM1bGPYUEEMC3bjsLkhLFBzDX8Zp/FPn652gRyf0kQSqiXPimYHggmDg+9mY5zyMr09P20c4PN444nLJjTkeSAanSeolYCcp424qHweMoSbzmHmyNIVshcZA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3FbH2fa2gSznYNHAH1oDTC0lIfEHqc1xHiAdDvStp0=;
 b=IUh13+1cPH14Xa2D781cjD39LRerp3xsRS+1AwXp/OxsZeYcm04XTpROzSq/bl2A4EOkmZCYnG2hNUIzUXiumJEzuF6LqxjybPeg5VMQgYokIQvPSPXOIGY8qbqOEn7qtt+kPxS0qqBemG9BE9TORYNc6pPXvqwdKzNTp5fLwBQ=
Received: from DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23)
 by SJ0PR10MB5631.namprd10.prod.outlook.com (2603:10b6:a03:3e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 17:51:00 +0000
Received: from DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::39b2:9b47:123b:fc63]) by DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::39b2:9b47:123b:fc63%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 17:50:59 +0000
Message-ID: <9cd1d1d9-334d-4ded-a257-2a56101d2b2e@oracle.com>
Date: Fri, 3 Oct 2025 13:50:58 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: gh-pages deployment now online
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::12) To DS7PR10MB5134.namprd10.prod.outlook.com
 (2603:10b6:5:3a1::23)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5134:EE_|SJ0PR10MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: 3507fa4e-fd03-4edd-6552-08de02a56950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGhOY0NSb2g5OW85ZE5LbmE5TytXL05KbFlabTNCVXFFbWpiNk5VTjl1YnB0?=
 =?utf-8?B?eVQ0Vk92ZDBoWVlvZnZJNW0yRXAyaXJybVFaQmdnbU1oVnlVbVFkNitNYzdo?=
 =?utf-8?B?djJhU3RaUmg1NVM0QWV3TUJXditKSnVsb1ZDa1VOcHQ4S0tLR0xQQmh2VUUv?=
 =?utf-8?B?UmdxV1pxVGhMOEt1bFdsUnRKYmRIcVNXb0R3Mncyb2R5MklEbEVqT1cvWE41?=
 =?utf-8?B?ZW9FMTlTK3J5TlUxV09aZmJodDhIcjZRTWFmZmZ3ZzVUOXZnMTlIS010M2ph?=
 =?utf-8?B?T0RCVHhPQjlBbjVKc0xpd2R3UXhJUUZvbGx3VWIvaGJXaG1BV3NVVHlYT0tO?=
 =?utf-8?B?SnJ0NnlISWEyZkVmTU44QjdFWG94VnNjWGczOXc5N3g5Q3dKOVlZYmQ3b3BZ?=
 =?utf-8?B?TE95N3Irek5jbzJXUjB5TVllSjAwM2UzY0pxMlNhNWMzMElGOUhhZjVNNllE?=
 =?utf-8?B?M3E3VkRNVFNRTjRKZ1N4SzVuZWxsMnhXZ3JWSTQ3SWdBZG5jSjdBaDlYWU92?=
 =?utf-8?B?b3RSTVZnTVdENitPanNlSGFjaUNLSllpZ2NoY2g5ZDBVQnhRamFreTd2Q2ZN?=
 =?utf-8?B?NFk2SUNRaHRLUmJ3bXpKMndIbGhzb1kyTEZuTklpeitCeFlwVTg4S3N6TDc0?=
 =?utf-8?B?a0xGaTFHczRtQ3BtQ24rMXFaYXFYaHljaUwvQ2RJQlY5ZmJodVpCbm90NHlH?=
 =?utf-8?B?eEdIdkhLVFgvRW12SjVyL3RNTUFxQytGMmJYNThod2pWSU5Rc2tqSEFYRXVa?=
 =?utf-8?B?S05nVzhDdWpIdGdSazFQQkhyQ1cyR3hzR0EwKzVaYllucXAzMVNqSE5TYk9x?=
 =?utf-8?B?MUpiaHZJMFAwQzlYbjgxWVlZQThCT2JPYW9JSXFsNzVMUVlNcTZheEtrUkxQ?=
 =?utf-8?B?UnlvNEhaejZ2MG5xelVyNTNoVXgyd1E0VXp6VDJVNlIxSUk5T0ZKZ0NyR3da?=
 =?utf-8?B?MWFTNlRRcFlETC9wMVgzeUtvUWlOck1aVC9KTTdBaFNqeHpWY3lrejhGQjJz?=
 =?utf-8?B?bHVYeUI5Z3JiYlBjbGNSSXpoYk1vTkpoVlprRE00Unl4OUF4U3E2dFhqeVdk?=
 =?utf-8?B?V2czbXRrSlhBVy9VUHViaHVFSis2SzZ2QTJWR21STEdNZTZNMUR5V2F4STlF?=
 =?utf-8?B?dWxNdUtzdVZ0a2FoZFJmTjg3WVgzTEZET1QrbUxXT0d2QVNEOHlrTFJzUmpO?=
 =?utf-8?B?WFhDYUR1clUvbklvbmJQRkNKRnhna0VIc001b2hIQUhPS0NXUkdtaG4zbmJu?=
 =?utf-8?B?S1JoNXhzZTEvY294V3FDRzJoWGlITkhKRVkzK2hKazQ4RGZuQms2V2E0NU1G?=
 =?utf-8?B?UjFMTzVqNXdmY0EyZmtxbjBzN1Q2SjNnOVNTY2o4cFY5ZE1aZXQwaU5Xbzkr?=
 =?utf-8?B?RDRXZUVyd0kxMlBiT2QrdnRVbHo1bjZGTjBCZGdQVDMvUFNudzc0bER1RGFZ?=
 =?utf-8?B?NmZaa2M5blZ1WTZKQ2U3NHpsd1V1ckNsK0k4cktZRDMyK0RodHBHYUdteTgr?=
 =?utf-8?B?Ui9YZHFDcE9LY2tJaXZlaS93U0xwOGg0SHdvdkdPZ013WFpDMTVEZDFQRk4r?=
 =?utf-8?B?akpDb1Z2MHlIMnpkMDg2TzJPZ1NwQ1hpVm9OeU1jOHpyR1dXMG9sTnRYdW1h?=
 =?utf-8?B?VkpqUTB5eWNtRHMvdVZQUFlFWGg3S2ZnSEg4UEtma1VJaGFnOGFBY2lwQWdq?=
 =?utf-8?B?MUExV3pSd2tGeENGV0s2WkVGSjA2ak1MeVhFeFAwWXlUTWxJM2cvdW5zZ1VE?=
 =?utf-8?B?VXIrL1kxUEhscEZ5SnpkVWxvYXV4NmpjVGlTa1duZGpYUEtaQy9GN2NxTGNu?=
 =?utf-8?B?d2c5bFUyeWFxbDA3SVhVTTh4Mk1MRUZKcmxXdFFWdkE4blJBaGU5bVQ1SFRS?=
 =?utf-8?B?eHpoS0FNVUE0LzVnQVpEK2VLQ1NiSkwrMmw3ZlJhTzlZWkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5134.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlZdXlsNWRrbUh3RytrRWdXd3NlYW14VzRYNjIzN2loM2dZOU9BbGFwYjFl?=
 =?utf-8?B?dVBubjJuSVVTbTVaSnJCTkhmM2w5dHFMejRSYWo0TkFoUG4wZnB5UXZCWVVN?=
 =?utf-8?B?TUZON1JHdlhLWGVBN1U3SXBoclpVQ2F3a0lDSkRvNGpGb1pLMzRTc09pbDk5?=
 =?utf-8?B?SSs2aWluWkFmZHhoYXRHZFZlY1NwOElYL1E5bU5wMm5qNjFOZDVyNHJMSWk3?=
 =?utf-8?B?RDMzamVCUlRSMkNLeERTYWEwbnI3eldQREpMOG04c28rMFptVVFZWmhjVEhY?=
 =?utf-8?B?ampYTGU0YUJPdUU0RHZvMjlQbG1BNFhEV0ZQbitnK1hxa3BWaG45ckFJWjdy?=
 =?utf-8?B?YlhveDBDQVV4LzdiNVZxTFZnRzVDWjc3OGkrYm14THJ0UXh3Zk5GcjdzcEJi?=
 =?utf-8?B?UmJqSC9SSzFScldlWFhyUmpIT2RtVGlmOHBONi9tbXNyQU4wMCthcFhMOWwz?=
 =?utf-8?B?aldjcExPZ3l5dXFKeVE0SUdVTTB4MDRMbWJlbzd0bEp0dHhsa2JiT3k1TTJu?=
 =?utf-8?B?MVVTNk1oajJhaGxLM1B6dHVhTkc5VzFaamh0OGVKaU9McGlaMDNlaFk2clZj?=
 =?utf-8?B?N0d6b2JhcnVncldXWDN2WnZSZWkzRkl3cERWUXJtckwvSGFFTndoTUZNQkZN?=
 =?utf-8?B?eWNSK21ZNWdJb0FQN1J2Q043V08rMkVIR1pmV3VmWERKSndtMjd6eGxZWDd0?=
 =?utf-8?B?K0tTdkxOdjgydzJXWXVkK0VlQUpnZzloNEdneEUwdHFJZkJ5bTh2S1VSUDRy?=
 =?utf-8?B?V0ZUU3BHS1lNM094dk9scGJJSVZoWWc0Q3hpOEc1c3Z5N01LNnYrOTB2Sk5j?=
 =?utf-8?B?QzBSeFNocGYyZlRaMkI4YVp3UjJQNHJJRG1TZ0JzYUNhK2VGclMvMTZMK0lZ?=
 =?utf-8?B?dWtQR3RiWlJGejVOUXFMLzJEY0psRXcxYitxaWQ2NjNnUmZDK0R1ZVplWXZC?=
 =?utf-8?B?ekw4NjNrd3hyVHJPTnFXZVhWVkJ4aGpZTmJSRGwvWGxvRk1QVmRCUUZsdisz?=
 =?utf-8?B?NmRFNzJYcmFLN3lVRjdBdEo3UUVKTEJ3S2RNZWU4MHFUN1pjdXRjbGZOQ3dZ?=
 =?utf-8?B?L1JqckZ0bjlwRHd4d3VyM1Q1YVlmQ0IybjM5a1RCTHNMK0t3YUpOdnJpTU93?=
 =?utf-8?B?TlJHY1hzWEhaQW5zUkpnUFcyNW5UblB2b24zRU4wNkwvbngrbklTYVBhcXBL?=
 =?utf-8?B?cUpnaE82bVB0MmRyWmNjOURsMjBEc1pjT2JlcmFESTNCZUViUVZybEJSM3lj?=
 =?utf-8?B?N3kvL1VTK0FlU2tBWTJsQlhVTmhnbFBEQ1NmS2drWWt5L0luQjhFUTFLV2lZ?=
 =?utf-8?B?TGNHd29rc1ljR2Q3WXhReU0wMjA1Q2tvclBTTVdhTm5UT1Z6K1JrSHNsQkd2?=
 =?utf-8?B?VHVQdjEyK2xtOXNhME9YN0pOSTVySkJldDltWllFNlZJNkhnTkR6OHo2ZllR?=
 =?utf-8?B?aUcxaUxqNUJZWmx6SVRTZVprNjhTUTd0UG04eWxORkVzZk9pbDdMQk5rRmQ1?=
 =?utf-8?B?VnQ5RE5DeEF4Vm85QnZQMllTaTZqNmNDVTVad3h3WE5oYXlqcHZsRjBydEFT?=
 =?utf-8?B?amx0OG5NTU41cDZ3bFQwcm5sbHl1Wnk3NzVXNCttL0s4OVQzZ21uVmVnbHJB?=
 =?utf-8?B?TWY4Ujh5dnBaYVpFakd1aHY5S3FDUzcyUk01WTRuZ0ErTnJTdVdHWFpUNW10?=
 =?utf-8?B?Y1MvZXkyOVNld05nSC92blpFb1FoQitIR254ODNKYWpUdXBFYmFqc3l3TzUw?=
 =?utf-8?B?dWNpTklrZDIrcDZvQWhHMGFKZkhGeGRzckVTandzbGZ6Ty9PbDRTNzgwUklx?=
 =?utf-8?B?elZLSkV3ZnZZTHBaQytocGptdnBhL1c5dk1VU1RHZlpnaTF1L3pGUWhtQWtT?=
 =?utf-8?B?d2tBZlhENklBRGw2dHpET2lPMkRxTkdmbXZ6NCt6VUhycEJtZEFkRXdHRDgw?=
 =?utf-8?B?OXhMelhYOTlVUWZJWjJFczdnN09Ta1ZrOGY2MmNFK1hVUFZxOGptcGlYV2dP?=
 =?utf-8?B?VWUzaVMrRlUxTWpYcTM3bTBZNWI1T1hZeHdVUTJpN3R2QlIwbDJkblN1TFV5?=
 =?utf-8?B?NFk3T2xDWXFKKzl5VUFkUnhGTFNPbFlCeHZtUnJQcWFvbTZiYitkUkNoNnhL?=
 =?utf-8?B?aSthbkpuOGlWTXJacko3dmhremJlMCtBVFZaMndmdkVYaHFkc3U2dzlIQThh?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U9pkbCM/5HRYpS9uEQ7hBRXQCs+UrESvhK4Wj1BuZRWU/ij3w01O+lFpqZoRIzn7FjTCWRMLIevaCamfpNyQcxRn0VtfXjq5i6MlegpUnvjf7TLOaxtN72OrHYb4IQ6gbAuC86Q0glbc+wKGSUIfO6rpwCOW67aBOqf0QpWnnDdkmB5LVa6+uxqiyU9QkULl6N/DuoghWOydtWtUt+51hc0y0MJSKxy+MVJuxNGXe7J+Uq/gso1ij8aWfVpPOX3xxedMx3KYjCysbFYbunB2P9lT7lUdcoIXDcKAR0D25uBcu5CPkl/44014GkEM2KoxArsfP5DSLeWC5jMItXZVWDQbRXewPCMTJgyIsr6DUQz65az6Ot2T/1ejsxqbEN/MbZKdLlbOTTYRPnSueevT4GK/fiRTjNl8KmzbPre/T2pGB2e9stcIvvP6w5oAKU/zfXqXT50e79krFDStooepyLRfHminWJYhfEXVlfbqzs+MGbH3pHCVe3bn8BUXmjgCBKEXel4ycs64XQArcf2Hqk11f5B5BS4CqH8dBjQhoDweO92pk9xcsV+1gmCdeNvFAx7b+CxNB00dNHsVzRlDCntcRGmRkaNuBt2cEHzSetA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3507fa4e-fd03-4edd-6552-08de02a56950
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5134.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 17:50:59.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR2vr+gDlThoCGy2kbYOR+fk54N5AWIL7mIgzqHy+PAzoSa90V1EEfv/aBkPXA34WBLXVpIfkbK0vPUYot6WNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=860
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510030147
X-Proofpoint-ORIG-GUID: v_kL4bhe8ae4mDChZ7tEsPorEyGZFFPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDEzNCBTYWx0ZWRfX7EWVRsyHIooz
 kzsGF6hDh1vikNl+iLY9fYNEFYwiG5wfbHP2YbgMBUEKD6pwDScPGXmsPPO9KI5zqDeAWGQ+hsd
 NqSbc7GWkiiUE6/x2FiBumlT+coDK7dUI1CwsSFdq+kgQwgHXwRaRpmvXWtDs1M8ijgpvAyaVvP
 PCP4N7np/ndIcfKDFfaPi555Nn+6lyvcpACygcaciiLMCSf7uruzlDIb1F6qKEABQHsBTQCTOHK
 sm7KyABDx+YyxieNnAn4ouQDe31zwYDFN/4ZcqOqEvYKrqrJnhlPQB6Wg97C65PyFs6w/LlyWuM
 FlldQY2B+5W7LGabPoEpdZDOb6PjHQ4P8vRNB2Yym8HrtO7nsyvJLXf8dYOIdn6R7QuiS9w2KKP
 4PWijJ9kgeCPIClkzEVjCTu/GMlE5AjUSsIqW15dVyLI1Olb8xI=
X-Authority-Analysis: v=2.4 cv=Vav6/Vp9 c=1 sm=1 tr=0 ts=68e00d08 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=-_EOp7p_AAAA:8 a=XhkkSTc-jwUof2lpmAEA:9
 a=QEXdDO2ut3YA:10 a=cpbXmsUOlS4VOvFyDt8k:22 cc=ntf awl=host:12092
X-Proofpoint-GUID: v_kL4bhe8ae4mDChZ7tEsPorEyGZFFPr

This is live now:

  https://oracle.github.io/ktls-utils/

A little ugly, but serviceable.

-- 
Chuck Lever

