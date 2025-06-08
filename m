Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC23FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749405874; cv=fail; b=TKK+AU//Day0+x841mexb3lf8k5QYSE2VFtCC7OPyRtXKPdB/dm7eu0FlCoufWPl7B+F7FfpHocUKb2ppcbKWMMk/Uu6aY7NWmxqof5HnDVF823fiBJQvMDRynHwYHXxo7rUhzzwWFCuB3xq140CUczEUpoj0Sx+IHB3HPCzHhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749405874; c=relaxed/simple;
	bh=J7EZYTroJRpjEkg9zCpvMoornXe/4joBnM9Xb4MQ3LI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QThAtvHH18tRIQw9PILJsgXT5Y0LH1asxiomXhvRVkYEmxyqRX+EivdXl6QqPY4F2n7yVURwXnNAFXoF+8AWFZ3GPuWuDTSyJ8MFsKO/LhnYl8GQkGbEmkVVi/3ltWEMK6yjbuFrR7QlbO3GkeK1bFy6AWjrJs+hiWBX91vdKzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ACTOrjSb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=foxwoTB/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ACTOrjSb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="foxwoTB/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558EEHGB015984;
	Sun, 8 Jun 2025 18:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eVrXWmZW/cKwWiLR+/jwOPH5U5yJ8EKCyTBvDved3n0=; b=
	ACTOrjSbIA0ENDwOevFK2qsGiJHW26/jcgKmvarqB2/yvmRUR1rgszUcuwuqe0rH
	m9PUp/Is8h1Q8wyJtriGV4YSf2LZHeyZxmlgKAR3ZWi8i813yvzQjWc50Tgs+OFA
	B6GgvQy+qZa8LR6OAxRsdlNbAsXEjd+vD1SvKwWw7JIbXz2O/aTapQMzysEnO3Kx
	6UjyIkUsO69eIx2Mw/XtY3ZQ8vfKiQRGfhFrIBN8jot7gBiS4J73XJi2qE8Vh/zN
	BjuFCnx9T9I+d5UgsOWvpNOPKlWahSXxbVhJfsmmQI8QBX9b2uRj3PvISSifp6dS
	lbWZ9KFjGxjEsXVoFud7BQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v14c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:04:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558FxQs7021040;
	Sun, 8 Jun 2025 18:04:29 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013066.outbound.protection.outlook.com [40.93.201.66])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd00dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA8BnPqNuUHg1BOqGPkFRKJUCJOpSRUdWqY3jUUJYcnMh1VDJMXgvVSV+ULdHxS86BQYYQdwOHc2NyUHrpvH76Yi/9yy8mB3/5CtRoAhNGqrJBZmQWSp9CZBoVlM5l/2/wvi/piD3TONCV6X0jx9xNg/VH30OxIPlr0J0cPxQg6+FuWrnVr8J/r+jEhIqk4uH6sHHm3F+FX4IdQvYVwgbzhEoao/MpM+nRJIx4PjYgb0GJmaWin142yHT56YvhZUKeW9xJReClNTz8Gc3Oh8ugTFp+GSmg+gIL5gLAhTk2GZK+YTmBPs2NXaSOegfGzozYVWoCo3ZZPKFXKSEKUXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVrXWmZW/cKwWiLR+/jwOPH5U5yJ8EKCyTBvDved3n0=;
 b=qd9MxOUnuG9y/g3itiYA9LGy5fTN0/iXEOdWjN74sF6jiIbzO/zcCNSGMHgc/a5LMHwKshcQ4sOjA73T98GxG4b2TXI2tuXLKUKIpcTfOCpF3odc2wa6FlJcP3DTPblIlSoinmWXAhLCoBOzfgNtErJhak07qBK3+rCdrZiZtV+dVKOlki0w+ufRqGH9IZWqJCnf4/4sejaySvofRnO6SUCUX7/F5LIXQuzZty2Yldgf3YP8ZyT8qIGH4mMlyp+9tjsiwaTEXKDsBVioMtE32RdyuPyTApXGNryC6oypa5iYiUn38IP9cM82atYhd7fHLHJlZ1Dzmq4ydO0o0FNYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVrXWmZW/cKwWiLR+/jwOPH5U5yJ8EKCyTBvDved3n0=;
 b=foxwoTB/AfnAbuTAzFeNr0EnLvC3tTNv8WcexZw/PWZS+24zAfRlsU/qnhHIOMmOy5qTOtfEyNoPC3yGUMbmeExhcAdwILJUrL4XXSkrLsPvAWi3hCOeVwykgCgKm8Od7bzUmikPRsUhcPxQ6Q8UAPUB9xT0o1HThuBpyZc2Sfs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB7747.namprd10.prod.outlook.com (2603:10b6:408:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 18:04:26 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 18:04:26 +0000
Message-ID: <c5d5cf4c-f686-43ce-97b6-96b6ec2bc4d4@oracle.com>
Date: Sun, 8 Jun 2025 14:04:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] tlshd_handshake_parms: Ensure peeraddr_len == 0 until
 peeraddr contains a valid address.
To: Ken Milmore <ken.milmore@gmail.com>, kernel-tls-handshake@lists.linux.dev
References: <bca6320c-2bb4-4727-8ad0-0e3a0207897c@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <bca6320c-2bb4-4727-8ad0-0e3a0207897c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0327.namprd03.prod.outlook.com
 (2603:10b6:610:118::20) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LV3PR10MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: df81ba84-4f42-4dd9-8a2c-08dda6b6e7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVRoRjY4eGVSNXlORkNSMHRlYURFRWlUZm5GcS9mdjlwOXVGMll3bW9uOS9G?=
 =?utf-8?B?ZGxRQ2o3cTRwd3VXODRmNnRCN2U2dEJIS0dRNkZXeTB1d1lXRDl1eDNZc3B1?=
 =?utf-8?B?RDY3cDkvRUVQa2ZjMmtIT09NUmdWemdpUUoxa1dBSG5vdlB4UWo2QWxXelpG?=
 =?utf-8?B?Q3dDR1gyNUNkbUlpY2hSanZrR25CMlhnd0VRcjd6WW5nMm0wYzZINzlwMHBr?=
 =?utf-8?B?UW0yZVc0RnMyMXh5QlM3VTJqZE1VeVVJeVRLZFRqOVRLR0RFbWZvQWNXMjVi?=
 =?utf-8?B?QUExODRmSlVYUUpwTEVmQ1dsRm8wVDZlSzA5cHU0NHBBb21GRnNscmtNcmlJ?=
 =?utf-8?B?RWRCdTRRU1ViZllMcm01NFBMNGlDKzVic3BvOWg0RHFKNEwrTWNqQUljWmRh?=
 =?utf-8?B?TGRFdlVqSzlkUHhZcndFd2ZYUjlWZ08vdXZSODVKSHZ3RW5Oa1lPMHpPM0Uv?=
 =?utf-8?B?YTdWaXVyeS9FYmRHTmxoRDN6TWNoRWR5MFJ3b3ExR3F3Nm1VTjFsWVZrQWd5?=
 =?utf-8?B?VFloTXhlMFJlMzQzQ0NIL0p2WS8wd0Q3bXhrOWVOWm14clFYbFMvY0VXNXdl?=
 =?utf-8?B?TittY3JQcG1zSnB2TUZ5YjRGNk00KzZMSENPSHFCa1doVE53aUkrK0ZDbTdQ?=
 =?utf-8?B?Y3FxY0NDc0Q1Q3cwSEdKMFVacE9LeVVhb2x3QklnQWlFT2R0RDNwYlh3NlJS?=
 =?utf-8?B?Yzk1MUhQNXh2WnNEUnY3TjlGWGsyVmxHQWxNamlCSEVGMUFQaFJVZ2puRGhY?=
 =?utf-8?B?NElBeWZFZnVNaE94UktqNysyOVVUZ2UvVFRySFJVeXVEeElLaDNIeGlRK3RH?=
 =?utf-8?B?aDl4aW9DYlNrV01hQkpYWTYybDhPNFMzYUMxeU1VaFVudjVBTi83Y0hFVFpr?=
 =?utf-8?B?Z3VLMW1iYkdMai9raG1SRkFwTSsrVVJGRkU2SlBCTXF5L2k4K2l5clh5dkFu?=
 =?utf-8?B?bWRKVVByVkFYRXJIV3hUVkdjUU5RT3FkYmNibWlRbkZYZTRGUWpOVHBsdy9H?=
 =?utf-8?B?Y2l0UmFoeWJPMnNKVkYyc2IxSmg1azZjdWJpYlRCRG0zV2krM2pWOSt4dXdm?=
 =?utf-8?B?T1laakRVa2FwWFlwaUpoQ1U5UUJCODQyQjJyUUd2NmJPKzh0NEMzZFBFaExV?=
 =?utf-8?B?Uld1S2VZS3R6bjg0T1ZJbm5qbjBtOTBrUm15b1lpL0pWQWl0MVQ1dWg3TEJF?=
 =?utf-8?B?UWNxM0lYQjkzendRekhZV1pjamVjTEZWMEQ0VUFjNk1WckNTNVNFUGRBeWlR?=
 =?utf-8?B?WTNmN0E2ZW9SdGF1YVd4RVd4L3FnUTRKSldzcmVpQ3J3b2w4ak51R1drYWU1?=
 =?utf-8?B?ZXN3MUpML1VTYzhVcExUQUZsUlRaS1h5Ukk2R3NnUEo4R3NZeGJZSU43Yzd5?=
 =?utf-8?B?ZzBDbUk5d3pwcmcxUlpBQ3JzL1ZGcWhjY2l4TkRhZGg3NkJ1elBCUEhDNDBx?=
 =?utf-8?B?TldCRjAzbWxtdWlpUy9SaFZmWkNuWlQrYU9QQmtFcFZWdTAyS2Q4U3RNWERC?=
 =?utf-8?B?dksraDBRcE9yekZmZzBlTTlUcGJEYjU5OWh5TFBLWUNuQXNmWW54dWwxekZI?=
 =?utf-8?B?dTgwZVVwUENsc0NuUURDUWFhT1JYQUovdTkweTR0cm1nM3p1WEVCOUtsNk83?=
 =?utf-8?B?YUFmaWtvcXUrUmNXQlNQVkMyaytDQlRNenRvOGllVjFabnVhYWZYVlBNMTFs?=
 =?utf-8?B?SEhTUjdKQjJoc2hENk1hNFNmSmFwcnpuZHM1MFJMZUQ1bjlRUWF4LzMwSDRP?=
 =?utf-8?B?OElrYzJualVrTTA1aEs4L2pOQzhYcDREZTlSRkdiODF4RUQvWnZSeGFpTzRE?=
 =?utf-8?B?TW1BcEd6c2pCeGhCUEo1WW9oWkhSWFVtd2NWU081MDZBYTNSdUxaTkxBemNU?=
 =?utf-8?B?dDJ0azd0c2RPZlh6SUUwSFdpNWhCaGl6L0pLMVUrQmUyS24zWEM2Ui8ySWJV?=
 =?utf-8?Q?fDvVUXMvJOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FEWGd5cGhyZUwvampEak02UWJOUThvZ1grT2I5d1JjaVkrWTNjYkpQdEZX?=
 =?utf-8?B?UWxxWitRUW5wY1Q0KytJWU50NjBKWndLeEY4SUpjWllRVzlHWEhDbWRCYlFx?=
 =?utf-8?B?V2RHcXpXOGtsQjNNaUZ6YmxsUG5KNzVlbUNVb2c0dUk5c2lvVngyaVVTc1A0?=
 =?utf-8?B?YWE0WTlVWmFvU0ZRYUY4cFFDV0dYY1JUUlZZNGRxTTNpTEFmeXdJbjllYnA2?=
 =?utf-8?B?b3JIMjdCT2t3Zk44bXNpY1pZK0FpWDhlbm5vZ2pNMW5JRVpSZjBiaUdtUTZ2?=
 =?utf-8?B?WGFmUFhCdEZZcXFad09yMmtsVGF6Rk9XbGpncXpvS21vVWoxWVdTQXpsdmZt?=
 =?utf-8?B?bU0xeHpLMmpPanl5ZE9yaGxsTFJhNDBtZktxdFZEdzRjRWJDeTlrS2N4YjRO?=
 =?utf-8?B?V3JsQkdvQmFneExXZjVKcEM3blB6aVFrazNQWFVBUkZIY0EyQms3OTBweWs0?=
 =?utf-8?B?S3pYOVBvN29ZSjJIWno3U2J3WmsvMS9KdVphOE40RGtabmRaMVFlOUgrd085?=
 =?utf-8?B?enExSG1zcTBJSzA2aU4rUnVDcmp0ZmtpaWV3elFyYzZHVmpraVllVVU0L3l6?=
 =?utf-8?B?YjZpcVBVc1JZdWRRSFh4S3dEUHVZYVNiT2dUSEdoeDZXcXYya2FWZ1RlZS9B?=
 =?utf-8?B?WkpLanVHcjUvLy8rbHB1Vjd2ODIzVEJ6MXlaeU8xRGd3U2U4cHhRTm5XY1B5?=
 =?utf-8?B?OUFGYjh5cE1GL1dyQzJSS29UMTBTUXBmQkQxZ3I2MHd4ZHFOVjRkU3lGL21F?=
 =?utf-8?B?K0hVRGx5aGdBR3hJN2I3MnJVTlEvU3lFZ00yVU1qdnJFODBGNWhyT0s3TlZF?=
 =?utf-8?B?UVVYSEFMSEIwdEFnNEZCYm1DcHAyRzVpMkUrK0taMlRpY0h5bitweGdLakxk?=
 =?utf-8?B?Wi82R0JzOUJieTdqUU5IY2JuNEUzMG9YOUFZTEFDSzE5TmYxeFJReTQ0aEFv?=
 =?utf-8?B?SG96VCtIanJ2dm9HNTBDL0MySXFscjBSM0VCSmc2bWp4L1dRbC9xZmdkNWJw?=
 =?utf-8?B?OHBwbTNFMTR0eXlEY2FRM0tXM0ZaOG9MdW0xWG5mN3IwakhOTnBOSHBmVTlW?=
 =?utf-8?B?OHc0bVA2Qzl0eGhERGd1R3JLbytmMGtrUHVNL05nUHhWdG9WNkY2MVlrS3RG?=
 =?utf-8?B?U1dSejZPaWVtWkZIYnVGTC91MFc3SXVuRWFhTThxaHFiV2VQTy9uRmFMVXlE?=
 =?utf-8?B?M2xGQlJtY1N2K05BUFFGUEFXekJJa2JOVjJYMEpFbkhPOHNKUjIzQnBsVFkw?=
 =?utf-8?B?VmhxWjloeDl0R1NZUHQ0TEUrVE5VcUZRTWdsa0F1ZlBibFBTcEV5SlpNRGU5?=
 =?utf-8?B?VllrS3pIRzJtbzhFQ1Y5SUh2RDkzUDhWRUNuQit6Ryt0NzVDSnlFclgzSnBU?=
 =?utf-8?B?djdOUGZZN2RLc0tFZWtLZnd2cWNBZVI0T0U5WG82Qm5kZzM4SXRqNGI1elJ1?=
 =?utf-8?B?bTlXaUZTWHQxaGI5blkrWHNuWVBUYnlEbGZESXRIRmJKeXAvZGw2dlExMENO?=
 =?utf-8?B?Z3BTeTR6MkhjeDNkMjFMMUVDRUVOUy9PMUd2ZnlEVjd4dFQxM3FnNDl2K3Fa?=
 =?utf-8?B?OTQ2c2xEakZNQUJKamdFTExZUTVwWVA4dXloTHFGRFFMcTNuYTJXNVhPNUY3?=
 =?utf-8?B?ZE1uR3JMUC9EeDZ1SXlDeE5NWjZVWi9YbUlGVGh4dGJXR2R1aGNXSkQyZFp3?=
 =?utf-8?B?SGpCQTdYNTRJSXoyZWdDcXRISHpmanJYcmpHU2pkekgzbUtKZVF2VHpiRUZj?=
 =?utf-8?B?YmFBMkZHM0JNVXdxQm9sb0NJNnlmSlhoRGU2bEM4dW1lOXV5c1d6RnNVSUJU?=
 =?utf-8?B?WHZzd2tNejRDbVQ2a1lWZE9oUmdhV2RMbWZwVkdMRkxCZ2V2THpzbVlLRUUx?=
 =?utf-8?B?N2lMSHJnL1dwd0I1TG1Vb05vWm9DeFR1ZG5BbEY0UGp6dFpOQjF5RjJHcVdY?=
 =?utf-8?B?MC9XZDRSUjVYQ0MxQ3djcndIR2tTMXZTRE5lL0FNbVBtM1pzK3FpbU1vR1B5?=
 =?utf-8?B?QnNGN3FXMzBOUHM4V3g0YlV4NWY0Q2RpUVJlK2ZrWVIzZE84U3BpM1Bncy9C?=
 =?utf-8?B?OXRJMXNjNlQvVWdYWDB6Yjh5Sk1ocHgycDZRRmFWTkhuVXBSbXB1Y2ErUEVO?=
 =?utf-8?Q?DG3Z3EQrI8DXzDle1wMMga47S?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5WaAk8Q25QA7Ri77YKtQBRgaSb6v3eW3zEfk+Sd9JrwsS/ebf0tIV6sD7mqK3v4d8rEkcDdz95RIeWj0hRo+SgmtFQNagrUELjUhRaUWKBc+NIxQe0cBrIm0HQWmz+Nq9ca7cM6GrQkrmrUdsFJbTr16tV/2MsOg6nrZI25YfYkbTvMZIbjX+FXG/ShTlDm7+s4SM1fBPPykXbs1gC43Il1FtJGYHFgCTQ+4D5P7oEu4WiLj9j6jvNy+qS8Hktib3vj8AlVySm6jsvDWfRLt1AD1qWMKMNZXBIiMq6apI+9pWO0vmdLQvlyOkuNZjunmgLkBhQT4865oJt2KwjufLgxO2NApNP2PmErEVI6kpadlmiWgUENPYlnsd4gl/NXdiuIF6yxBybAnl3jFyL4qHbExbQ0f/1easJ6pjBtlkRfGQ1dLvaCtS2laJ5JKUjaayhL/lb+e/9vnqEFcqAjB17zI9djEKQ231XJkLbHMUrVrj/t1Qrw989FGKbpu4BNkpc8AS8JKQQb/VJQeAkrRl9O+F8S+HmDDgaP1VRoCNXOgb4C6rbf793uK8/MOa9aiVh1KzhriJytH8fAlgAEjKLkJcNhYWoL+Pzfg9ktdkEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df81ba84-4f42-4dd9-8a2c-08dda6b6e7ee
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 18:04:26.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alHa+bPbAhzc8YOLEcLUNRqCD9qylKlaywPqWO4FRN7aToNx7R29z9cjgA4TqSrvZo6YuhXF7CY5B8BFCT/xkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080145
X-Proofpoint-GUID: ENESR9jQ6f5ULiPfQuHIef9fF00qn3mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0NSBTYWx0ZWRfX2nzw/hC3ll4b hAW/b9aadQ98pkUtRUOrm69E4Xa6FesQD1agBFF3Yd5BXYAoRoV+HIUWLFJJF/J0vagL5LADZGK +CojjzxpAjXJzqTZF7lvoLsCGxwuXG6Z8cmCq3CsHf6ORO6JGn8WHOC6CRu0PtQNUYGmCw7MwXP
 OrWqi+ExdjPQm2JmLsIs1/t2B1RIjTRIawHQR2Sq+i/TCK7ssah33vOpXb7VGjZYgViOeDRDrWP ytPzlFUY7ZO+PTDYg1+LtxLwott2VWilx+PKU9fLdm+n7TxV4t1qLbFx03OnE/BPAr6CTZJXTvQ MSMS+fQQErHLkwH8p5eCsRbQ/yfPxM/s8uvtuDuff6hOfYv5PabBNPdZh4/XbYWv45vC5LLr1xR
 mcu9ulSE+Zh3XKnz6icOxP1PxrLtEcjwp/2f6SxyhptFTb5Wbh82yrIXZ4Xi1klJfJ5Oo5kU
X-Proofpoint-ORIG-GUID: ENESR9jQ6f5ULiPfQuHIef9fF00qn3mn
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6845d0ad b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=yf2x3YUqEuCWRDAGrBcA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On 6/8/25 1:43 PM, Ken Milmore wrote:

Needs a patch description. Why is this change necessary?


> Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
> ---
>  src/tlshd/netlink.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
> index 34a1f47..ce8e981 100644
> --- a/src/tlshd/netlink.c
> +++ b/src/tlshd/netlink.c
> @@ -245,9 +245,11 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
>  
>  	if (tb[HANDSHAKE_A_ACCEPT_SOCKFD]) {
>  		parms->sockfd = nla_get_s32(tb[HANDSHAKE_A_ACCEPT_SOCKFD]);
> +		parms->peeraddr_len = sizeof(tlshd_peeraddr);
>  		if (getpeername(parms->sockfd, parms->peeraddr,
>  				&parms->peeraddr_len) == -1) {
>  			tlshd_log_perror("getpeername");
> +			parms->peeraddr_len = 0;
>  			return NL_STOP;
>  		}
>  		optlen = sizeof(parms->ip_proto);
> @@ -297,7 +299,7 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
>  static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
>  	.peername		= tlshd_peername,
>  	.peeraddr		= (struct sockaddr *)&tlshd_peeraddr,
> -	.peeraddr_len		= sizeof(tlshd_peeraddr),
> +	.peeraddr_len		= 0,
>  	.sockfd			= -1,
>  	.ip_proto		= -1,
>  	.handshake_type		= HANDSHAKE_MSG_TYPE_UNSPEC,


-- 
Chuck Lever
