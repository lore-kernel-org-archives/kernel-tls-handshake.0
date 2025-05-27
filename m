Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA53C465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359415; cv=fail; b=sfPOd/yplQ5owOnbRddbO6uVpu0LZMSsJOVMsckBTrBovnyCbCErPsS/7H2sTjCvzOqOSyAbPCAZfBV+7oSmJ0DkcLE3AcIIPKLi1d+N4uJlvQNv0WdKMbkY9ZKoGVbYKXrvh51dOO5S7HYvYjP/6w4oWVGiZyBIP2j+usC8hHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359415; c=relaxed/simple;
	bh=i7WLYVnDukxDVHxKaf8+fYJGNxg5/9hc9BXy1/fsDb8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=D/Ie7lmhb27g0x/0GMHtgmpqVe6kddYHiYrZr6RZbBauTC1MVTpUosRV6Tc5YMWokBijSP66Wm0yA13z5eW3v3/rvieOo2g48Td3QO+Uum64Tuj9hbVyoDH2LoGzfRfOwUcU+xy5jp32BGJI6323qnAfCKhf8Do1MWCOZ3h1xeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZadAtKBN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rk37CkAy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZadAtKBN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rk37CkAy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCjghu025523
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 15:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ouiF7NFbuRd/+5nM
	ZtlVv9Q3L6OSxgPW2vS7LFwOs/o=; b=ZadAtKBNIz2MpQ+gc2d7jlRHn6Kxa6RI
	6efjxaYIkMsxkftzp1UgT7ESnUBj3xlmt4/6gUvx9cXbXrOQHrFZD+NLoH0Mujk/
	1eSQd/zrJJsSDJOmJUJDIwzqul9Wh4/OM7vQwDZ5XPqFQ+1HjEebJ6oy5NDv10Z5
	YnW13kg8FGn/XcM1DCeMrfUfz4aafbt2oCEqO58kAOhBLhVltkRESuS6FEguri3Z
	J0wZF8Ld+Wj8IuqT5B2jPQnF1+/OW9RY7W/d4gcZPRLjoIknJnnyN6+8halzrwef
	MO2vO7Zd+v1rcZOJwsJIJEm7FjAp3OXVQWJibd73cyJZ0yCiEXaSAw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46tue5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 15:23:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RF1WPT035765
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 15:23:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4ja1520-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 27 May 2025 15:23:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u++TEkOKscrwxBPYmMLGMJ7sZHRPNE94a/lcWdVhC5284yMKLeT3bG8CCaIKkpXbtY56Wo8dbMm4mEpwSCgmMlJX/pQVr0gp66ISTfkeqwsZfObBmxz9qcaa4WH4I8fXddnM8b/PiwX+w5huhZcIJwt+vC8nr7ncUZ1TQxVGF1XI9Sra7Efw41rMliMSnkQl1nb03/hZAz3DnASHTM131sEjpu4SVZNu2QJz8rMpvYKwNDD6rq2DqwkMFJhI8qrK/Ci+emxI/s341cmEOl6Nj/5wziY8Erauqw9Fpu4fgEDdB/hYNISICODzMXWhkmYWG7crb60FOQZ13rygWgUzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouiF7NFbuRd/+5nMZtlVv9Q3L6OSxgPW2vS7LFwOs/o=;
 b=Fr1CMvi3IDeJAwo18JCyf5GKYXNn61KD5Mxf5tX5tkLaAgCQjH+5iLiVRaAAw5o6aDXUkh1FzxD3Ahp0gCa+0szYlba7LdlPdjKumJnI4BdynKjLSRcI8F88kMHnpiVdaPvau8JDQMKFfzMb/W3mjgwlz0VJmGzuRuNHZqBa0omTAh3GveVWoTGI4H7Y8pd6IvbHTdhEpZ50nDbDO81Sw4SwkMvSNYLJsKS7sGzOco/C1Y1AD/Ns6HUZwbqMcgLqDV13Y7OXIQXf1VGtgTW5Yn37qdPjzMZmXrcqoLyG2aJKujiTByNu2X2y0IBI3toSgSXyqo+hTayEPsvj8U5Edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouiF7NFbuRd/+5nMZtlVv9Q3L6OSxgPW2vS7LFwOs/o=;
 b=rk37CkAy3kxX0TAGGWt3aYQYZ1ZCAgRyY/kqNtUiS+bEVW9CQtgKbhljXJCW8y/DerMyPh6WNFDVIAwHGIEcwqhrUij6OWbIq1sDGD97MURNEUTfuwwjsfMK5oyZYDIihrk5yLUyhLGjucQogCYfya+loU4Ukmu5Y4/sxD8mzYw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY8PR10MB6441.namprd10.prod.outlook.com (2603:10b6:930:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 27 May
 2025 15:23:28 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.035; Tue, 27 May 2025
 15:23:28 +0000
Message-ID: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
Date: Tue, 27 May 2025 11:23:26 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: Further changes to contribution process
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:610:75::32) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CY8PR10MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 933d50d0-7869-4576-a213-08dd9d326e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVNxTmhiS00rNGNqeVBkVHhrQjk5NGtxbHJ4RkN6bWlKam5WckRWbkt3eXFZ?=
 =?utf-8?B?TGdHNDFEb2hnWVFKNlErd2NSNEpwd0VneWo5VFRDa2w0SHF2a3M0MTBzUll6?=
 =?utf-8?B?VDJyVFRVNzRNbGVBY0ttbWlhRzZpQXFXV2pxcE13a1VBUFN2OTF3a0pkOTJF?=
 =?utf-8?B?Yk5lWnh6S1VBNjRIUStuTWVjeTVkWlJ3VEJyZEtBd1dVdFE1Y3FaMGlKUWsr?=
 =?utf-8?B?ME55UzFVUUJpaGhYeVVkMW5kN0wwMzBmNk9hVHJYem01RkFhdjg0eGVPS0tS?=
 =?utf-8?B?b0RoaXJYZWdaaUc5Y3VZRjVSZkhUell1VElvUG8vS2lYbDhoWS9FR2hRcklu?=
 =?utf-8?B?MCtESTUxU0JSZkhucENhRWtoTU9qbFhYNmp0SktjeHBhcURFdFlueVBrWDBw?=
 =?utf-8?B?M0NpTjFXc2pjak9UM29iaENpaEp1OFVXNUY5QzZodWxRRnREdTMxc1Z4TGFs?=
 =?utf-8?B?ZmFNQ2srRm5jNHdpUnN6NkJYdEtKVVNHbkhGc2RBc1hVVTFMem5FT1QxU2xp?=
 =?utf-8?B?bkZ1MWtkU0UzZ2ZMOW1aYU02N0MwRFlKSnJpaVlna3J0WXRLUHI3d3hlSGxO?=
 =?utf-8?B?VzFDN2xXcjN4RFRWMWFtZktRY2YvcnN6NWh2QWZ6STBOZC9pcVNMRnBTVjhG?=
 =?utf-8?B?UXdKUERHTkN0Vy9pVWFkMTN6eFIwdkxIeUZpYUh0UHpHaHE0eDhrWnI1cjRM?=
 =?utf-8?B?OUJ1ZzhWSFZkZE5TUFNuRlZzc0tJMldUbnd0cWJZYmpoQ3Z0ZTJWRGl0S0Jo?=
 =?utf-8?B?MW5EemNWcXpudHFpSDlEWGZ2VXNYQWUxc0hqdmpHYXNYbG1NZ2Zpc0NiRjBt?=
 =?utf-8?B?bkJZMC9DL0dUSWxRRW9HV1VrMG9JOFlBYmFUR2djVmF2T3drNW4vMzhtRVZs?=
 =?utf-8?B?VUVlUkpleDV4Q21uMVFpNXcwU1VHTVBoSW1oSElQdXJ5QUZxa3RKTTJ3Njg0?=
 =?utf-8?B?ZVVLTGRRd0hhQXdJZzJhdHh1c2V0MmRGWEVEK2pNd3FFc3FmM29VQ3BGdVlO?=
 =?utf-8?B?RlFtNVlmTTFJbE8rNmd6eXlDZ0RaQ3Qrd2RMS1hrZlRkQlNVRTJWdkg3czNs?=
 =?utf-8?B?YXFyUUtXRXdZSVZDNFNRTG1vR2xOOG9DMHJVNnNoeHZHWDhFRW9hdWozTGtn?=
 =?utf-8?B?VXU1SlNCelFwemNNRGY2Nms2bzI3K0xBOExoVUZnQlpydUhYZkt3cUhmWkRN?=
 =?utf-8?B?TkttN252bmxjdERFK1k5allPdUtaN21RVHhqUjlkajJXdjBLbW1SQy9QWUJa?=
 =?utf-8?B?eHVBVWlqYXdzMHJ0STA4YTNNRVpnYk1GdmR2WHVXU3RGWlgyby9IR2d6ZDJv?=
 =?utf-8?B?b0dTNUtoaEtoU29KL3UxN2JXSFF1dVNVV1NRQlZMUTNiU1poalZiMnhHaExU?=
 =?utf-8?B?SjVjZDA2RG1FQVYxZTFFM1RmUmpxM3FnSkQ5ZERTSEtoUzNZeW5YcDhmMzBw?=
 =?utf-8?B?eUVHTk9WTE16OExzRHlZMjlYTWdOd3JFR1B6clJ0bzZPb0NHR2d2VzdIeVIr?=
 =?utf-8?B?anhZSHZzWGhGNHg2ci9EcmJ0c0hSYmo5V2E2c3dXcDMyVjBPa0tGQkU2a3FX?=
 =?utf-8?B?Q0pqanBNaUhzZXA4U0g0c1I1SVl6emdNOUNXRnJsd2NWV1VFS0JxQUcrOHV4?=
 =?utf-8?B?VitzUUNuejYycHppL1A0QjBtVmduUnpsY2N0K2ZWOU9RUW5VS3ZFTDNzT2NP?=
 =?utf-8?B?aWFWOTNpb0JaY3BtcStrcm5ZQnhqclltQWxxV3U1d0VadXM2K21mcmFHUUJk?=
 =?utf-8?B?S1JPa2Z3THJ2cjBYelZ4MWN2ODdGaENxc3c0d0MrNkw1U2FhZ1NsZ3NvOEFS?=
 =?utf-8?B?VWpTcTdqcUF6SG15N3JkdjlodHJtcWlacXJqRE1EZWFCeVdrTTNKVEYxVmJX?=
 =?utf-8?B?TGx4dzNSL0wxOGl0SDFXNHhwWVBhVjh0U2IxeGdmeTJzNkhLYXE2UzlWSUNE?=
 =?utf-8?Q?3yoWQg2V0Ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2R2d2xCQThaQ0hkcExEWW5Za0ZpeFVKd0Y1MzVmWkZZYjl1K255azVaWWg3?=
 =?utf-8?B?MzlNYlUxcnZnNHZUb0prMzF4aU5YRXl4bTdQbE9YM2FtbGZ5cGJyZ3VlbGVQ?=
 =?utf-8?B?Nlg5N3p2ZjIwZTZlRjFISTMyTGVhWndmZ2ZjZVRNVkI1Q3B5M3IxRlgwZkR6?=
 =?utf-8?B?YWZOVzEvWjdINW5HMFBkb2NEZ1d2K1psUVhHSkJ3T2dRaGRnN3JwSWhxYVZn?=
 =?utf-8?B?VG9PWG1qK2pnMnFIOEVZRm5UdDhPQUhmbG8rck54Q0hCQklTWElHdEVXcDVF?=
 =?utf-8?B?WnVtVmxESUFiY1YrU0I5UERQQjFDYVV2clhmaEV5SE83UG84OUdpZm1udThs?=
 =?utf-8?B?eWVsK0xKYVhLai9HWjN2UlFuVVVDeXBUQ0RqVnJ1Y3Vhb0w1UnFpbXdub1dz?=
 =?utf-8?B?Ly9uTUZIeWtGVEIyQTBYaU1rTXJDa0pmc2NxNWhwVWU5clp5Q1VxczlEMnRP?=
 =?utf-8?B?KysxdUVMZE1uWGJRUGM1b1JrbU9lYmhnZDMwUUJERXY2M1VxUE91dCtKNnhq?=
 =?utf-8?B?YjZHQWdkS1NpQWlxRitvdS84SURoekE2T2tpNmxXYjlCajNyQ21jcjh5Z3l5?=
 =?utf-8?B?TkhzZzBLMWk2T0ZTNG9ucGRzK0s4dkVYc3AwRUJsaWNmckRvYVk3Y1R5US9i?=
 =?utf-8?B?b1lTT3BwdEd2QmJ2bVdpNk85UVRORXIwRFdLaUlCSXNDVW4zU1VwTEtrMThw?=
 =?utf-8?B?QzJxQmU1eDMzR2xRYVY1NEcrbmJsU25mcGhNU0dvWTNJY1dQRnY2TUpZcVNu?=
 =?utf-8?B?NVN1SXErdVBrVi91bFYwc1I1aVhQVFZLejBGNXpscS9iZ0lHcFlTV0kxY0tG?=
 =?utf-8?B?bUpPbkJoKy9WNmJJNlJFVm1EVW5EanpiN2tQQmpCM3Bza2FDdnJObkozbkE4?=
 =?utf-8?B?d2FlR0tjNTQyZmNzMW1WVmNvMTFSZEFoVVhMWkxoOEdIdTgvdDVrUWhZcGJr?=
 =?utf-8?B?ci8xMFl0RnEzUm0vcGxDNWpoRnhxbm0vaDdZNnZmQThhMGFiZithbVloNENQ?=
 =?utf-8?B?bmtUYS9zMVZqVk56U0JBN2JncUFrTC9DZ1I4RDZTdXZFY2x3QWNaNHF3dVFz?=
 =?utf-8?B?KytQdDdzcGs0a1U5YW01QzZscExVS1BMNlN5aVlPazBWTEFIWWVWUnVmTGxo?=
 =?utf-8?B?cEhkRHN1OVhkb01tZjlyYUp1MWdENXlYWXBuWUNYZTdPcEc1Z0h1NW50Q05T?=
 =?utf-8?B?MmRNN3k5NWxoTUlNYVlzS0pNQUpxRG1SSlNHUEw3SFRVYmlLdWt2OFpZV1hi?=
 =?utf-8?B?c3RQYmRpSnlOWTE0dHJhZDFhanVoYy9tKzVaQytPLzRWbVV5cGp1MWVkektF?=
 =?utf-8?B?RWFtNDNGOXV6Z3hjK29Mc2QyOGZwMnBOeEozMVlLdmlvNUxMK3Vrb1FWMkQx?=
 =?utf-8?B?bWE5cnpaS3FzV2tlaHBPMkJrZWl1MDBJdHd4alU0UEFmdStDTlRPSDR5bUFO?=
 =?utf-8?B?ck1zbjltSGJFTmJsSHJOZlFyRTBkKzN6WmRkMGlFWDAxRVJzUEZ3YTZVQXRh?=
 =?utf-8?B?cXQ5cjdpdmowOFduYXZVWW9zQkN2V21kZFpBTUI4UmJEemxFcmNQZ0pKUFMv?=
 =?utf-8?B?N1ZQb3p3ZkRma3F0QWdFVlZVOEU2WEVqTFpXcFlEVTZXTjFmVDNsRGpUNDdM?=
 =?utf-8?B?ak85NDh6VzZDZnJTS1UxOHRadmNWNHkrNXlCdE1NOGpiUU5JWE5ScXIwTTc2?=
 =?utf-8?B?NEw1aWtpRm12Q3JsZlNuQUhoU2ZCdHNjWjJ1dUkxZmFvMDdqWWhsd1IycGZn?=
 =?utf-8?B?Z0RHTGJ2QXl0ZnZJTi96L0ZSY04zeW5OV21NT1VVaCtTSC9BeU5rcC95eDZE?=
 =?utf-8?B?b1NZTERyOEJrams0Umc1VkhBc21ZUmZ3dGxLYlBReWF6L1FhdkFYMW8veC9G?=
 =?utf-8?B?bEhxc0xEZXFraWVtVFlLQjU1R0NrWDNBRTd1eTU4MjFYdzU4aEZjbW1SZmVZ?=
 =?utf-8?B?TC84L0JGb1ZTWXJYOUZ5Qkp0cU0zWWlPV0c5cms5WGUwUk94RkJWa2M0cFRm?=
 =?utf-8?B?Y3UrVzdIV3V4cTJYQmxzTXFFQmVibk1YeDdlQ2o4aDVXNGUvNkV5OUlrd2Fi?=
 =?utf-8?B?VTNYVmN5bFBkVlhpN0VsTXNEZXdkb1JrSmZacUhQUEgxOHh5UGR2SXBOYUVo?=
 =?utf-8?Q?1fNS6pFyFgA+rGWiTRbLy7Npn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x0egDenOLgMOAyTTYcjodlNFGIryzTvQcvt1Y04ipcc7jopt4c5LoKO7ZswOHZgyzPPShYHiOzJGjH/7YiOmID8z0jMllgTXd4O/SS20ARycDdEkM2OAS8kzAQf3bfWmmGCfmr5EaxL9UqNhb6+xJ5RtWW4+1wD6Zx1wPJyr1Tbvco/5HnIWCAG+d8pLOGK4DlmpjG9GEmb4JmTciiXKxXt1V4wMJJdojULXdUFI0SVReZ5mKAOPvD7oU7DjIhfXLxkLQt4v1W6O5Q5Bupo2XEiuqLZYqAfB1XMGwFKsJiN57woj+Jj2zEC1vTqYIZlhS8bUD4rTNB4ykO+MDpeIZyYTUEHyPyMUEYn0mnNDdv2CVrS3XnluaUXwis5dxbMwKWZtl9Z5wbK0irYGWFuWOnN0fsBrKuKMFvk4wZ3PIGBwZ2sGL/5wWuGGvFAV4QsmtaxRw/giJIlF2wrm4XUjzlahNCPVoVHW9S053omAyphOJI+7Z2chlul4U7R97b9FOd2+ffE9b4/dfU+kiLZOfEkW7nX4sYbWT/IWyMUgYdAwqf9Vw5pKAhusFB6Uk15/N7+CVNfPhjSd03WATgRfln3x+BAcSPfzXMU+4zPNVrs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933d50d0-7869-4576-a213-08dd9d326e9e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:23:28.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXEPc/nDvDJKRrxMNcvUcsbObGnloK0JntpmjTvDetFXPIl7tfz4SMXcuinCczbXXq2yr53HvJJH3oSaXkImYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=515
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505270127
X-Proofpoint-GUID: EEuss8ullLOKhLvoW-CcHyiMaDPplV5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyNyBTYWx0ZWRfX8FduGUGrdnJu MIU1VUuWf+lMLUuXgmbZVt9UxIFOWchsLxLtpjMfExJFDAo79L6SvRMsAe84VmJsKmF3Pb9ikR0 0C55Dmej8GlsjCkQlQ59kJ1pA05dRr4i+wFA9WO4tuK7jCv5sf406N2SKDt6S9HASImYobIkJSf
 3UD2Wzmclog9TkAIGecOc50XxuCDqHcrsPz9HDcqLgF0iOodFITUFnPcSQz36+uiXnwpoTIeuEY ajviWEOuFwzp7mdfdpMa8i8hUVFDxB4yHQntu1Y+f+MntSN2FYchy2oYlCdja/0xYVE0YASGucN II3Fip3WJ8wChbnuuT+o3HDTqYDGBganw12uE1n/pskVn5uqcZI06A1bjezfC+fYj26ONTKcHPM
 +MVuR0j9b9mZsxhzXq7GWJ6pnprN92qJtK40UI6oaUg4/atsZ5OfcR/PdAVIEtFVoYjO7SE1
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=6835d8f5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Ifppi5qsGPkwCB_CmHMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EEuss8ullLOKhLvoW-CcHyiMaDPplV5S

Hi -

Now that first-time contributors no longer have to sign the OCA, they
have no need to interact with GitHub at all when contributing.

I've heard several requests for ktls-utils to change to an email-only
contribution and review process, similar to the one that the Linux
kernel and nfs-utils uses. I've heard no comments in favor of staying
with the GitHub PR style of review process.

If there are no objections, I can merge a change to CONTRIBUTING.md
that replaces the "GitHub pull request" process with an email-only
process, and then as maintainer, I'll eat the steps of pushing
each contribution to oracle/ktls-utils.

Does that work for everyone?


-- 
Chuck Lever

