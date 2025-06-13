Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437792E11CF
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 13 Jun 2025 21:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850953; cv=fail; b=VkIUzeKUDtucIiFcRwDpJKKiMIVol2ew7lrlTbl/J02nqIl8MdcOIAbA7/4x761IrfglZ02l0h4U21qjbTFsL9WTyN+IQIWT0kpyrCwUqMIn/e4IIXXzAazGOfxI921Y8r1U74Em7jnGRjkDX7ZuK6pUWZr20Vfi5R97Jo6AzJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850953; c=relaxed/simple;
	bh=ysPI4IJCgvOtLRjrLyR+V4SJl1BhYhee5YDr/KfTqXI=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X0Sj/x6cw9LU7PDl7Y/pm6qoTFD82FHKwcJjEx1BiINZ/b7cCV/s0T1pmX/TEPOutg5YT0yme53ogBG1C3oLMk1iUypDrCJyVTwrC+nNvWhbDRqmpWWpD5nF10ZBBsJppxfmmI1dt7B5YbBq6rzrm1qNWuGw+WkV3Pl+VesbthE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OJ8zriDi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j50ds1y3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OJ8zriDi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j50ds1y3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtZbg009400;
	Fri, 13 Jun 2025 21:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zr7WF6mWaO94mp/ue9YDn/hrKe5GLU1VxgzA0CQg78c=; b=
	OJ8zriDiRzdbnP/xKHJzCJQSulGQaTDIECdKKs4DFC4MYi+0Hb63+E7F1U3x3BXU
	UggM/1qx2OVWDRndhgUmkZYk8/SaOj5ugEzsc7hMSrMgDeGxTTXKCFYMmWa/L4Pq
	3lp8ZU2TFZ8/8FofQz3jgQgtoTJ4nEVcT2gy+4jecrfdSM3ULmN87oXoXoevGT9E
	g99rhq++dngY4sqRaCrJiQAoihtzW+fzVqEnbteoCSRbWAS6hOOVCzszwr++CTW7
	08rzjyr5clTx2FafmLzwynDwU++YzB42EaZoDrvm4t3vqIn0IOi5HrciZ7F2ghub
	EIDfUsyjNqadhVxBgMz0Mg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xk3ssp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 21:42:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DKYrbd037848;
	Fri, 13 Jun 2025 21:42:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvkkjhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 21:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwmmmLflGREdSo8wtBL13XYiOlOcNkqaTR2SKoA2vq4WCACWr5aJYnUn4wSJnhJJIkf8K9ZI8cM8uxaeDjBEHRtUvFPj3K1hPCx7bw5aqZe0O/4Neph/Q4X1tzZ6ydMmXnaXtb85e+4K5nRT3rEkklnKdkNvOckW03UZZrrqZ7ATvS728S9Yha4xg5s8QL90OG+56wjR6kzqBYlxAmHhh5eDkJz7Z7RWeuZpb93eWw4XDjbRHeOsN1RDoXnEW3hLGaIlvAUBagsflHLOm6aQffn0giPG/tOdJRz8++tl9FuUyywzoYHReHjOerRqzTr4R+scToppLCpnXDTWPvx78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr7WF6mWaO94mp/ue9YDn/hrKe5GLU1VxgzA0CQg78c=;
 b=knQIL9eG8ficxPmKbouvtC9qkRoborN9xwImASm43RrlsSiyyUKbF7wUE1nbSGXhYw1uIU/BeZVSdJIw/cOskWlMbc2JgUSHioMGLIUeqpqi8DeEpe+RvqA4dyvFf4Je6QVGbCEHnRV3/4TwD6ZsQ4Fme/SAyGo5CuXvhX/ACYW2Tszqzu6bslqdyMbMFBIobwRT3aI8WWTOTH8z75Yrtk7EYYlsVquPsn3ZoxrUOpfXRXsWoHkMxMvYZTROiJi9oimzJ6PvF/J1is1VaKIb4SJBxwUzgex4vLhegI7gFj97lbrWroR26ClQl4aJFY57WeE4KwifnD5jnAzzvWVxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7WF6mWaO94mp/ue9YDn/hrKe5GLU1VxgzA0CQg78c=;
 b=j50ds1y3eL6MkRymXV5MwCPt5hd8Xy4C4lkPcYjZnq2ld9m5dTZ+5XL5EFtsvMtT+3wgqJPIyut+z2rQRy32yUZn3+aUZGK9HK8rsVX7CbDeNdq39RAHr8kS9VQ+/r3+7/ZZOmbGCJTHrJHdkIGVI7TFzaUmRvb98DzRbMCjIfk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW4PR10MB6680.namprd10.prod.outlook.com (2603:10b6:303:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 13 Jun
 2025 21:42:18 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 21:42:17 +0000
Message-ID: <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
Date: Fri, 13 Jun 2025 17:42:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Ken Milmore <ken.milmore@gmail.com>
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
Content-Language: en-US
Cc: kernel-tls-handshake@lists.linux.dev
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:610:b2::35) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MW4PR10MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b15c11e-c04e-47ab-a46b-08ddaac32b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXNHZkdGbWh1TVN1RXJQelAyRHZzKzRRL3pDRkRxb0VQWERYdUR6aHZ3VlFM?=
 =?utf-8?B?K3lpMDdNZ0htQVRQbnV3K3lxRnp6SWFleG8veVh2WlpMb05OeWxlRGpON0M0?=
 =?utf-8?B?QkpFZHBmL1NyY0YyUjMrR3hGbU01a0R4TVYrbzRTYlNQMzZWODJqQ2pNRGJY?=
 =?utf-8?B?UDVjSjBzR1dQdTZQM05zb0EwcGYrZUtXS1RFV1YzZHNnUFdFM1RzSk5LUTNW?=
 =?utf-8?B?UnJkY09tcEdJeEswYUQ5cWc5cUV2aEQrL3BBcHFkNlJZSXpqMFNwZTAxcTNG?=
 =?utf-8?B?c1FTZERvekFDWGhra0NPcjk1MXN1TWRzTW80dlE3cDBhWkZlT3JTUDFKNExF?=
 =?utf-8?B?K2VaMzFOelR6UUE0TkRRQjVzZXJaWWYyRUU3WXl4UE9NSGhHZCtsZWtDN1di?=
 =?utf-8?B?KzVzNjc1WDUzQ3ZFYkxWNjVCbzlWRmdENTZaYnNLMTlONklPa2ViWCtWenhQ?=
 =?utf-8?B?bC9pZGdMeTdraTJxUzJqQWhTNXJtM04vK2tSbjZwR1lDYlBVVG1WN2U2QTlR?=
 =?utf-8?B?RlJzR0txTkF0aVMydk5Ockt0NXM4ZklUSFYzRUdVTkNFYjk2a0ZLeFJONlp5?=
 =?utf-8?B?Mm9MNng2c3phOXh1MmJiOU56dWNYa3AzOFZhMWFNK1d3cWtRVkI3UjlHenM5?=
 =?utf-8?B?YzF6TDRRbWZJNjB4Zkcwbkw1dGUyL3E4c3pUUU5qOHpOWGxUVXBnd1ZydjdX?=
 =?utf-8?B?Sll6VFhHM2tmUURraVRQYzdWUWJlcGdrY01CMnhBV2J5TG5OZG00M1hsVTRs?=
 =?utf-8?B?c3R2ZEdRcU9VNXdadVZCR0gwbEVDY3lqcE5qTUhkTHRiNDBEK1hKc1BTajR1?=
 =?utf-8?B?dTBRelhpS0dVcU5MOHY5ZEVreVIxSk5wU1cyOWhXTWhLNnRIdkpvZi9rTVFE?=
 =?utf-8?B?WGI2Nk5GeVk0NXlPeGRsQ2lCYWxnNWZZQUltYmU0YlZIUFFJWVJtdHQ5ajF3?=
 =?utf-8?B?QWRuVk1sTDFGZmxmWmtnbEJ5VW5GSDZ3eHVnK0g3eERVSjhESVhZL0RDZTds?=
 =?utf-8?B?OWFaTGxsYk11cldLcWZnbitHZHlpaTNCemlweHFjWkRDdnI4bWxTTWxSbkxB?=
 =?utf-8?B?eUxZckwydlIrVTdXaTVYODBiT3ZYTUwvYVpLVm9BREZKZEx6UFlqM1c5OFNF?=
 =?utf-8?B?RnIrc1dlU251VVdJWEVqTGpObzFLVyt0dVdxa1JjbkM1d0pLdUlKb1g3MStT?=
 =?utf-8?B?MDVFZVJlWE1IVllGbE11czN3QTVPVDVEa09zbENrNVlHSzFYU25FUUNuYTJK?=
 =?utf-8?B?a09kL1I2dG9IeUhLS2paL1VCNHN5QU11elhZN0d5bVJsWGZ5bkpqWjQwV2ph?=
 =?utf-8?B?MENTSW5OckwwZ1E1RXhId3dYb3FYeVZVZVlBRTNPdGp5cW12Q0dpN1o0N1Vi?=
 =?utf-8?B?MG9HY3lna2VnQ0IwZk5sMDZ2aDVrV3JLTmNYRDhqVEJBc2RXblBOVCtGSUtN?=
 =?utf-8?B?VElYalEyTTMvZEVMdzJaR0hWM0JRSURVYTZDRDU5REZwd2YxYS9Da3JHbkQ0?=
 =?utf-8?B?YXhqRjlsa05jMG9EM2lvaGZYcDlKTmRNcGRvZ3BMSlhpZHQwWEwyVkRXQ2Jp?=
 =?utf-8?B?UDhaOHZOR1VmRWFwSWtWeHFoL3Rkc3J3Y2g1Tnl4MUN1blZpa2Rsb2tIR0V6?=
 =?utf-8?B?NDJvdm9yQ3JKUGxQZkdCdmE2V3VOY2FtVmNSZzRrWUZtMUNiN1NJU3JtNDNx?=
 =?utf-8?B?b2VoT3JLYXhlbUx5MXpoRXI5WHhESGx4U3FNSWY2bUJXU2JQNjdDSE1Pd3Ev?=
 =?utf-8?B?eHRxUDhTU2J4Y1NHUDgzRWo4K0RZWmdzVzREa1QrQUdJQUVxMXlHOWJtNXZv?=
 =?utf-8?B?T2RTc3lrUnd4aXVtZlBWUFpOQ0RLWlFuekY4UStFbTVhZGxrRjcwNEhiaXpp?=
 =?utf-8?B?OW55WlFCcGp5TWlxd1E1elRwSHVvSW1ZSElDQWl4TmpGWklvbTl2aTB2Yzlr?=
 =?utf-8?Q?QZvVgty2Rt4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UyttdUtXZk9YQzVPQUtrR2tabk9Pcm95R0ZOeHAzV3l0VW1CdXIvajdYNU43?=
 =?utf-8?B?Z21MUFhXLzNoanJVS2VYaEM1WmZQRDM5WE5ZMzliTGNzbTU5Y2orWWpBUGhX?=
 =?utf-8?B?Yzk3eTJJWGN4c2ExSWhvT3dqRUkrVjBiT1FoTktXQ2U0U0RXOVBmVEU2Q0Fo?=
 =?utf-8?B?TkE1ZDJwNmdvR1p6NTVGbGlHTjFrMnpJRFpSai95bUhmOVpoNVhjVUFiUVc0?=
 =?utf-8?B?WFVsQkdHZ0o2RHY0ekNmUGVzY1gxTlI4VEhmOU4zMmJYRGV0NG9YalJPY09K?=
 =?utf-8?B?c2Y3eC9IS2dLL25JMlpwOWpZRjZMSU1pdFNpSlIvT2ZSK2FIMThMR1NQM1lU?=
 =?utf-8?B?bnV3QmhNeFRNWVpXVC9nR2pmb2VmK1ovMUUwNnRWb0NZc2k4eng5UjJxVFND?=
 =?utf-8?B?ZUZSQXcvRWZIOENsOUFSTWg5Q1UyL2dWOC9adjFtRXRRZXB6a0JGTWxiTTdC?=
 =?utf-8?B?VEI2YUNzRUpObmZ2SmxZSUxhbHJwSjdNNTdJRDdDOXIvRWlnejFDUkJ5SEw5?=
 =?utf-8?B?ZnpDQkEyTm16Lzdycm4yT2g4MStnV1lheVdUb1E0WkxnUTE0MzRlSTBrYXUv?=
 =?utf-8?B?eURHTEkxQm83ak8xNnhuOTFjd1VhS3dsM1BKZE9YdTJ1VXEza3V4b25YRVVX?=
 =?utf-8?B?ZkswSGFib1Q1QXJkcFh4ZFNVM1hDaXRVYnYzODdwNndGVy8yTnFpcmx4R2w3?=
 =?utf-8?B?UUNlT3pLV3ozOW9BQmVac000MjQ1QXJicjZPeVNhd3FQWmpXQzcreEZnMnJZ?=
 =?utf-8?B?WXBVcDd1MmlYUVFtOVlWUXZpWnc3a2FUbmpUMlBsTk1BdmwvVS94TEczZWNl?=
 =?utf-8?B?a1FLVTIzbmRlbEc2OHdKdFZ1SmZBWGJ4Zm5ONnF3YTFLeU9VOCs2S1AyUk1m?=
 =?utf-8?B?MlV0bzdPNHd0UjRUcTNHOGZGTEVXaUpqWEEralJUS0pyNnJxM09EdUw0YXZK?=
 =?utf-8?B?YkV3eHc4VXJnUFJYQkRxUVlld2tWc3BCdTlsVXB2akcrazlnTnhxVjlTdXdL?=
 =?utf-8?B?dVdWdExDMTUzbXQ3RXhUMW1HSk81YnhnalpMUWJvQXNaNWhGRTBGRzdId1pL?=
 =?utf-8?B?M0JPRGtzNzhBdWtURnIzL2t0T3BOTDZRYlpLaENRdUdkV1ZnRWJLbDNlMHk1?=
 =?utf-8?B?aThOTUVoemxxcjdXd24wRWJmeEVlUXd6aW95dHNYQ2JaZW5QVllGY2F2dDdS?=
 =?utf-8?B?a1BVRkF5MTR6S3lxNDZjMjYvRHNmR1U4Y29semQxUEdkei9jM3V4NnRuUkZ6?=
 =?utf-8?B?MzlUN1RML3c3c2R3TmFYZU80Wk14dmpQTkthdU5qTGFQSUtXNWx0MmFjOW9L?=
 =?utf-8?B?a2ZmYzE1ME5NalY1NnkwOTUwOTZ0Mlg1b3VKRzZMbUMxOXJZM3RJdXVSaWE4?=
 =?utf-8?B?WHZPdXowM3ArRENVRzVWOFJYOWNhMERtUU1OL2FmRDdKK2o3cEFTV2tGaHo2?=
 =?utf-8?B?NmR0K0o4bVVndjVZbGNJSXo3bktMd1NhdVVQSGNwZ29lenRsMjBhZW1lZFhn?=
 =?utf-8?B?ZXRlNU92TGhiUC9MbTlYamdhTkxsdDRMdkVJby9CcG9pWldVbnZuZEVSbEtQ?=
 =?utf-8?B?WE43UDU4S241SXo0eXBEaEVpU0NQSUFSTDNUcHYwOEt6M0pobmZyZzFyZkZC?=
 =?utf-8?B?Zk1pQkJyS05VcW5zZVRQS2ZHQ1FvaXFtclBxM25kblpZUnpJRG9SU2hoTWF2?=
 =?utf-8?B?WHZwT0xBRUJHTThlbTJuUjk2MFEvL3VjdkIvMDJJTkErNnZWWEpubzlEclB5?=
 =?utf-8?B?QjZ3Y3hTSHFqK1JuN2NIL3NXdksyTFBLNWlVdDM5MVlTaXRKMUZEaGkvSGk4?=
 =?utf-8?B?RmhYTUxhYTZXM2tJSVZieGFPOW9yWngvRzVRUWpqVXYrclJoc3R0aDBDT3Bi?=
 =?utf-8?B?Wm9WNXJYdjZkLzFDUlNFMHM5bFQrWjhOZGE4eUw5aTVuQ0hlOWdhSWdEQjJV?=
 =?utf-8?B?ZG5SSFNJQWFUWTdkaVBvdzFFSEdjbHJQbE12OFM2WEE5SWxlZ3NFOHE1TVU3?=
 =?utf-8?B?akxUYTFMMmJodkdUMWdHdzVGYTZxM3hGQTMrUEFXS1FmOCtKME1Dd2ZxYWp6?=
 =?utf-8?B?b1o5MXo3eTd5ZjhEQzB5WmMyWUs3KzhSK2QyTGpTcUt4Y290dm9icVkwWlVI?=
 =?utf-8?Q?IJKfE7y6PcIq88rpEGNWF7hS6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D5fnD2or+GTCD2+za5atkVzfWFySfcvIXUEvVvrK3zOK4fGFF6z3RDqMlYQFQo8vTFjTi1aPnajXn6hpi6gUIuW9kEvQKBf6lTJmi36w1LTWWhI9+wmGxLfpggU0k6vl2Ay5mwKd9kYgFbGgLEfIqlKYRKnhwRgHChK/8MrUPwvbWUwm7TNIr8brzRB0E4y+UeQBLin3RRgO4pnFYCCkCQr2Z0XsJ4Ab3KOWWDINqxC04/rWEUCub9CkpUqm0b2XiCaMoAMJc03sTxTpLww/EvruNfVKXYNiJguzpdvhKJEbWVfEbUc1NMpzhy2/wNrWQ4J7JWo+6CznosRs38VWBbdnUNh/sF6YcDxd1xQSsJlIMUpnZjtkWPpVgArFB9MZWp6umB4Ezw5D6bhBKZuw7kajKddY7XqWv03MubOj9wtH4hFAXhX7jw6fQaI10dxejPJUhxhxbG8OP2jmtUJuNhFF1Nxrd4g9LEakj3xlYmUJ0zvv9evmqZZPp8VUUwdxtBa8rnd7xaQ3WUZ46Eg5QLXgFTxM/kIIVIlJUaeQPGIxfUFxn3KjLF23JyKjth2SoMMoeVC1sdGAweQoB/57mYUOSE9O5wkANpFpifuMM6M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b15c11e-c04e-47ab-a46b-08ddaac32b08
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:42:17.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caCFs38DFjQLbLu1Y2wi3e4Sgg4rO7XckIKichHOSBarZBawDcTmpP2pl9qmN8QHZH6nDtZXj+gD+NeV8++Asw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130155
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684c9b3d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=qkuZfzqoOU1WlP5i8OwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE1NSBTYWx0ZWRfX+fjPbP7CKZ/n ym+qd92KD4kKaBHvo5/XxmSg1wrZwskYVNStfXxj6h/g7asC79BKSwZTC6tVDOdlslw2eVI2Kz9 IZxvnDp3YtpW3wcpcC15Sw1Jdpr1dAuhLjd048eVXNGArxlwYyGHX2ORTICzFjoo11dInnx7J6c
 AgpP8cTo+HRqiytkUqdBw/frGKiK07q296BxYIf5epEPitAWhpA7lmUW1xUroLomwVQlRi3Gq/h 4niAkYfeQgihz2Uwk7F5t9XPtMPNDajlRXJjbbMwYA7LBETdZ5ulf7zBzlu1FlOIbOymIqmVuAA 0HDa3kgL2Qcfj0X8ubwynI4vG0d53OR2l83iUGbLQ1Cuuzcg4d0MzUF4djMakSVc9T2qAyvzk1U
 rHiBIyJNGs0Tbefll4mcJ/WepHH3v917vYcUzlASKRzFa6wtgt/XaiBxzeq6MoWCke4tNf7b
X-Proofpoint-ORIG-GUID: b8S_O3R5DJjMFI8jvrYMMhClEb3JCFj7
X-Proofpoint-GUID: b8S_O3R5DJjMFI8jvrYMMhClEb3JCFj7

On 6/8/25 1:42 PM, Ken Milmore wrote:
> Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
> ---
>  src/tlshd/client.c    | 2 +-
>  src/tlshd/handshake.c | 2 --
>  src/tlshd/netlink.c   | 9 +--------
>  src/tlshd/tlshd.h     | 2 +-
>  4 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> index 9c8f512..80107b2 100644
> --- a/src/tlshd/client.c
> +++ b/src/tlshd/client.c
> @@ -434,7 +434,7 @@ static void tlshd_tls13_client_psk_handshake(struct tlshd_handshake_parms *parms
>  {
>  	unsigned int i;
>  
> -	if (!parms->peerids) {
> +	if (!parms->num_peerids) {
>  		tlshd_log_error("No key identities");
>  		return;
>  	}
> diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> index b9de6b3..6d10eaf 100644
> --- a/src/tlshd/handshake.c
> +++ b/src/tlshd/handshake.c
> @@ -185,8 +185,6 @@ out:
>  	if (parms.keyring)
>  		keyctl_unlink(parms.keyring, KEY_SPEC_SESSION_KEYRING);
>  
> -	free(parms.peerids);
> -
>  	if (parms.session_status) {
>  		tlshd_log_failure(parms.peername, parms.peeraddr,
>  				  parms.peeraddr_len);
> diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
> index ff9e35a..34a1f47 100644
> --- a/src/tlshd/netlink.c
> +++ b/src/tlshd/netlink.c
> @@ -188,13 +188,6 @@ static void tlshd_parse_peer_identity(struct tlshd_handshake_parms *parms,
>  	}
>  
>  	parms->num_peerids = 1;
> -
> -	parms->peerids = calloc(parms->num_peerids, sizeof(key_serial_t));
> -	if (!parms->peerids) {
> -		parms->num_peerids = 0;
> -		return;
> -	}
> -
>  	parms->peerids[0] = nla_get_s32(head);
>  }
>  
> @@ -312,7 +305,7 @@ static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
>  	.auth_mode		= HANDSHAKE_AUTH_UNSPEC,
>  	.x509_cert		= TLS_NO_CERT,
>  	.x509_privkey		= TLS_NO_PRIVKEY,
> -	.peerids		= NULL,
> +	.peerids		= { 0 },
>  	.num_peerids		= 0,
>  	.msg_status		= 0,
>  	.session_status		= EIO,
> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> index 135e1e0..f058a1a 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -39,7 +39,7 @@ struct tlshd_handshake_parms {
>  	key_serial_t	keyring;
>  	key_serial_t	x509_cert;
>  	key_serial_t	x509_privkey;
> -	key_serial_t	*peerids;
> +	key_serial_t	peerids[1];
>  	unsigned int	num_peerids;
>  	int		msg_status;
>  

I've pulled all 7 patches in this series into a development branch. I'm
planning to take some of these ideas (with credit to Ken) but rework
them a bit.

I'm leaning towards dynamic allocation for all of the array-related
handshake parameters. That will replace 1/7.

I agree with cleaning up the way hostnames and socket addresses are
stored and how they are dealt with in error flows. Those will probably
also get dynamically allocated, going forward.

I think server-side tlshd should /always/ check a client's source IP
address when IP addresses are listed in the presented certificate's SAN
field. No new configuration option is needed, I will test to make sure
all of that is working as we expect.

The two changes I'm still equivocating on are:

1. [PATCH 5/7] server: Add boolean config option "verify_peername" under
   "[authenticate.server]"

   I'm not comfortable adding a DNS query. There's no way for tlshd to
   confirm that the query results are trustworthy, and it will add an
   indeterminate latency to every handshake.

   IIRC, tlshd used to perform a query like this, and we were asked to
   remove it by our security reviewers.

2. [PATCH 7/7] client: Add boolean config option "relax_sni" under
   "[authenticate.client]"

   I haven't looked closely at this one yet, but I suspect it's
   nearly the same as the deprecated "-n" option, which was too
   insecure to be allowed to remain alive.

I am working on implementing tagging for x.509 certificates. I found
other software products that do something similar, so we are on the
right track with this approach. But it's actually quite a complex
undertaking, due to the variety of information that can be carried in a
certificate. Stay tuned.


-- 
Chuck Lever
