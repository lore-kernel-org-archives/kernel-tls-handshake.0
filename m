Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA92D23B8
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 11 Aug 2025 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923790; cv=fail; b=obRG9UFHTCPey1OBDYkdkfqtEet2YdegRsebcKFUszr310GDyHV4S8R2CKfprca3bDiJSwmUZAJ/p+3Vs+lNiG6hElHn9lIxuxN/RiEvLqJO2nVrBPbu1QaiBHhxqfC/p9krJpbbk6eYESayeOaeUEH/eNBh8bh/6Ma25Ct8wQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923790; c=relaxed/simple;
	bh=0USMC2dHWbvO7/hWTTC9a4K/TTY9lPkVDfI34TIblME=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DSdPec2P1556dzfFRZ5jzXzsiq8tUTgnKi/lIVkH7RhWE79sIPQn+HYsnISi5k8B55wrHRUNwLkDm3PVXYBjDWjwLbiSaZGP0OnJ8IeopPv9cydABXwlWzRyI2pKOMeJ1e4W2i1WSkVp6JrXA9yGPMlyk+a6gf1u7XQUJV/Y+dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p+p/0/LI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mtryz0ft; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p+p/0/LI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mtryz0ft"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BDMsHi024793;
	Mon, 11 Aug 2025 14:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8XvKGHF80uaYlvZ+qggVH81FHZ/R2mg1+S5shUCN/4w=; b=
	p+p/0/LIsHKbHiYsezReEtbNUJACpNi2Y5gAjinLHdLEuu8GJRZH4gxTRUzsdy6F
	xpbJ7mZ2lI2wrMIcgbU4KxeG8sqMYXAGboA4WlUl0JP0ls0mg9yXJ2edcyioh1dU
	EYtqyp/Xb7f3A26xfkkbSjPNnvpoi3rNDrmyxNKrABcAjGpCmOLSsuart4b9tDcr
	7iE91zqv8mt6Lw4I92G2YvadlKgmzgWqL8mDxar5SOnpHzi8ov9fDErdZvuwGFoT
	JV4tM+rbpd9xKcCb3H5EzH/exkZL4KjVC59/P9NadY/q3rLOdk+ySPG/yK2No0P6
	DeH3BLuHVS8RiHOMZjky0w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dwxv2r98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Aug 2025 14:49:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BDKjPL038739;
	Mon, 11 Aug 2025 14:49:46 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsf906j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Aug 2025 14:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anteI+4LAyIqVXX8G7kPEB+V2XVx2xiAwrZ6fmdK9TxCvR4oookkoTYMlWUYqLvJM00a1O1Jlvu5RViLU5nAJsurent0IDKtnGQMXpB0/aCk5DgxW0Txle8e0AyDm46x3g1CUx+ETr8GOVMVjNyiJqIDQslAc7908GLZk7/z+SenYUTqhD6n0dfzH4hCSXLH7yYqa9uPYHZ9pdAlm+teZEdf0saT7t800rHDrF8oIFHr8hAcToiyYgipi99Q6ScBQlgSuZH6RlfJaAoO9ax8MHnJdqwWf8nslmUTs+OM4HHsvVIClIDeUxncn8uDjyffK2i9yfUP0maZHsAk0DWuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XvKGHF80uaYlvZ+qggVH81FHZ/R2mg1+S5shUCN/4w=;
 b=VLVaE1iJ/mJ025Nj4HFnN5aIft674VpHE4eiSRO/3qlbEOTtU4zm804GwwHi+yrMpjH/3Rd5KTpTAKn2ufB2O5miCbLYYpoJb64kBWgZwFoDs3OaW2Wgha8lR/Hl5whdmzM7ZzxQvmmgmHG/wyyBxNPWFeWeFORmRmpbUNL6U6ewxOIFK7C5/5Pc+xwEf07gO3z4McOTHGgtWi7FqNDQh2Vt2Ot9KZEZRv8Ax4k3Vz6M8O1iDSKUtvOSvMEptrW8Q5nipvBUx53Gk70y2qzzI1fuCci4jxncoTlF1p0stUHM7svCOqTFqBnqzj9cb8glWK8WHts9HXn0VAeI2LpOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XvKGHF80uaYlvZ+qggVH81FHZ/R2mg1+S5shUCN/4w=;
 b=mtryz0ftwhY2YUBpE0ikfoIIFkx/JmrJwe53K6J/1DFz03vZriR1hmTuUa92R+9qFsiW5QBTib1brgs5VH05buYV+RiNMXD8nnNqfr3OaWA/9XrPFkf5bbitYT5et00uBTsj+3B+6N/j91fm63W2SR9ey38m34j0hnf33F1RcBQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB7514.namprd10.prod.outlook.com (2603:10b6:208:44e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 14:49:43 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 14:49:43 +0000
Message-ID: <f587f0fc-a016-4390-9b7f-37ff0cd53c85@oracle.com>
Date: Mon, 11 Aug 2025 10:49:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: client's peer certificate not recognized on my NFS server
From: Chuck Lever <chuck.lever@oracle.com>
To: David Howells <dhowells@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <960f5f19-7062-4c90-bcc6-f3abdb503008@oracle.com>
 <3b68e91d-55da-490b-9a6e-579383a2ab21@oracle.com>
Content-Language: en-US
In-Reply-To: <3b68e91d-55da-490b-9a6e-579383a2ab21@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:610:5b::11) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: a662d400-f545-4c45-93e2-08ddd8e64efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0JBQmNpekJraCtHc1U4YVU5WlBCMWpNNUxLS0R3US9KY2NTb0tDS2QrMk9l?=
 =?utf-8?B?UC9BeXIvd1pWellnWFl4R3RtVTBmNFdOaXNsandOeWdZc2hWMEh4ZVdXaS9S?=
 =?utf-8?B?M3NzWVFEdUZBOU5hMDNFRExwTW5TYjA2WjlmdE92TjJzTlZZUWh6T3pYdUZ0?=
 =?utf-8?B?dnN6ZlRNU053NDRSWW0zQlJjbWNsWlI4ZXJyVndCQWwxNkZkL3UyMmwvOGxC?=
 =?utf-8?B?UG9sR0k5bFB1NXExWnd5NmZLM1VFa29KWmZScGRIVHJjSURUQTdmNXg0cUc4?=
 =?utf-8?B?dmNEc0Zhamt5V2dMYzhwbzZWR0JUTVdLNTBHdkNjcnpDTDkvcG5xSXNXMy9C?=
 =?utf-8?B?Q25XS0NPM3V3amdVOVlLdFFnbnZOQmkyVlBZTjBSakRMVm82ZmxDZ0wxL1p5?=
 =?utf-8?B?OEpSd1ZKNUI1MXZRWkxQODV0OW9LQ0ZqUHI0RDY3alVsYnhja2ovbFNrUmFY?=
 =?utf-8?B?cmFHclIwdW9WOStQdHRBbjNXV0F4SXhlRXhHV2ZNckFhT0hWQTU0TE82NjVp?=
 =?utf-8?B?ajJjb3dpL1BwcVczbldDb3kzWll4NFkvbThtNVZ2cDViekp5Nk1RakVZeTdP?=
 =?utf-8?B?SnAxelBqbkt3KzdnUHlTSzJiTWlzZkkrakNGZnhlcVpYaFdyZytqd2dqMlBt?=
 =?utf-8?B?V1QvbUFKekVDeXF6N3lidEZIY0hiRml2M2pSRlpqbjFtMHB3OVdCZ212RHFE?=
 =?utf-8?B?RnIxN2JUTldzSE1uSDlLU3QyUmN3K0Y1ZVJ0MVZjVG1GcVZHZVNNTHljMTdT?=
 =?utf-8?B?czhSYkM4NmpuMjhlS2NVNDV2a3c3NHQwckp2dmQrQ0ZoOG56ZzJBNHZpNGxw?=
 =?utf-8?B?b0VtV3VlWXloeFNEL0NXZWZTWVVua3htWXVuQUg1VS9rRXlOQm53dU9SVkRX?=
 =?utf-8?B?UmRNY3NPcmhQQ2E1K1hncHBzSnNaTUl6cDB1WWx4Q0crbHFXRjVuU3J6d2lw?=
 =?utf-8?B?cC9TbTc1MXFKczR5WmtaTjVBTW0rUDhXMVUvc0hLQUt0S3JrbnZUNVR2TDd4?=
 =?utf-8?B?TkEwZFlkR0dZU2dBb2ErbnNrU25aMXdNbzNJWEcyTlBPcm1Oc1N5M2lLTHAz?=
 =?utf-8?B?aDBXQXE4TjJ4c08vaFpjVTRwZWdTM0NDTUR2UlBxb2c5Um51VTZYam5mdyth?=
 =?utf-8?B?dFV3S1cxQmhOTlVWWjdPM3YwK1ZiUjlsZU9lckNSR2hmSXhhNkJlSURTR3E0?=
 =?utf-8?B?ZWU1bkthbUVVTCtPYm1WbWNwT3hmSkVxbEdBREhRc3pxT3NWQjdPZWNzVDJp?=
 =?utf-8?B?aUhRbXJEQVhCa0NyTkVvMVRLazFYd0EwRXBTQ2RiT1F1a2R4SVVVbXdlRnNq?=
 =?utf-8?B?TENmTGhHbFFYa2tPY1FBNDZTN0JzdUUrWVNpcVc0clN6a29KanpHd0U1VE5B?=
 =?utf-8?B?aFJDelR6aEZKTnB0Q1JyZkhtOUFEcEtGVTZ1NXNra1ZhSCt1OGV0andSYmJB?=
 =?utf-8?B?K1lkSTFuYnZmSGhodWpuTFUzRkZZZXNOZTZwMzJ1RmlQd05xWnFjb0ZWRENT?=
 =?utf-8?B?TnBRL1NhSDdsdGlvVHFLRzc2Y3VDL3dZaDJvWkorQXE5L1BXRGZreUo3NVJH?=
 =?utf-8?B?ZGlDSnFBM0d1bURPRnN3RXBUd1JxNnFIVXZKUzlDMWhaaHU2NHZrbkNwRVNC?=
 =?utf-8?B?N1k0aVBpeHlPcFlnS2xVdzNBWisxQkE5dll3dGpaL1dyY2JJS2xLM3B6VkVN?=
 =?utf-8?B?KzNiOXZBZllxNHBNMVBCbXhhRFJrVnhBK0htaVFQLzdNRk81c25nMklBSWdm?=
 =?utf-8?B?b29JZUJyQVM2TEthUTJORGduTGs1Sy9kVlRKV1BXaWpqMXV2VDkwancwdUlS?=
 =?utf-8?B?Ky84dGRnVVNoSWN2RGtSWmNQT2lrR0RQYlV1elUzL0lhYlY5bzJsemxHUE9H?=
 =?utf-8?B?cW14cmp6andOcnNFU1BRVTZzdEwrR0h1bU5tdDJianVGZWwveFpCT0ZGbkVJ?=
 =?utf-8?Q?k4RN5RJWEA4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhYNU5JYXI2VlZPZlMwMXRLRU5PNEw2MDlyT005c2FSREhqVnVPM3lJWmhK?=
 =?utf-8?B?ZU1uTjdONVVvd0dSMTNxL01pM3dmVHpZdXA4V09rZVRSc1FjSVpveHlXaTVL?=
 =?utf-8?B?cDVCM1JzakdyNGZacHFaU2szSHNFeWR3bkN4eml3dlNCUDVZQ3dmd0dick02?=
 =?utf-8?B?SjdueVBWV3orRVNzZ3QybHdSRzNld2R0ZzF6bHIyTVJNYmR6N3V6cHNhQ0xy?=
 =?utf-8?B?Njc2dXoyYVFVakUrN1UxcncxNUJNVkpnQm55RVN0anNpUWhMSEdOWVJXeXlP?=
 =?utf-8?B?SGViSEVrZ2lNL3FJZGxvL0NLZXhWZStRQTR4UEdsZnZPck1NSm9SbnV3RGo3?=
 =?utf-8?B?QXVvc0daRnZueW9sejk4bHd4QnkzN0dpSFoyVDNIbjJIRUFXVjRQV2FYdUlj?=
 =?utf-8?B?c2R0NHRhMThOMWEwZjNxWWwrdzhFMDJLYjQvTnFwQXMyRVJQTlFVbGlySFU0?=
 =?utf-8?B?eWkzeVJrWit6anY0Ly9XSkJiVnJleEw5SmptMVZpQVpOcmo0QkpRUW1iZzZs?=
 =?utf-8?B?TnJLUW1nMTMweWkvenp2QWJhV2daVTUvSmNXSXZSZ0tBU0JxM28xSkNwbHF5?=
 =?utf-8?B?TXFFTGNDdkRhWHBwMmRZU2E3OTllREN3b1NwRU40UjBZNzNIOXN5czRxODlO?=
 =?utf-8?B?TjcvMVZNOWtZcVVITnpkYXlJZkZkZjR2NWpQb3BIWVNLTzQ0RVNGMDEwTTcr?=
 =?utf-8?B?dVhHQXpkci9kYTFmNWF6L0l6Q0kwejEva2Z5U2pYbjd4SUZ0amNmWkJKL3Yy?=
 =?utf-8?B?TEd5YkpMYXQ0eVhORkxKajdybVZFV0JnbTg0QzV0MDBVUXN5R1V2TmdiS3ZB?=
 =?utf-8?B?TVoyT3dDbE5vQU10QzFnRU0zS0pPSDNvcHZCb1g3eXNiSzdTZklyeC9YTlZx?=
 =?utf-8?B?Y2lDb2NhM1ZuQVZnMXBiVS9MRktrdWZ6VG55Y3FlUy90WkRLYnZidzh1dTh4?=
 =?utf-8?B?bnRKODRJUFBUeEM5RmxhYjRsazhtaGFQajl4Y0FmbzJFN2dsdDJwa3lWRk5w?=
 =?utf-8?B?K1R4RzhVYnAvVkZxSTNOWU01RlJIanhhcTg2empZSGFLQlJNcUF6ME5RV0FQ?=
 =?utf-8?B?WFVHeUJ3bXZxaWVVSUt6QndudVlwNzVYWVlURG5hVm9iTGZsZENXcFZTalg2?=
 =?utf-8?B?c3M1R3lMWWpsa2I0VE5VTFdJZjY3NXNyTk9LQ05KcHFVbDJsbXRlNlQyS0px?=
 =?utf-8?B?ODBnUkcrZ25na0NpY1FxVzNZdDV3VEtoaVJrZFJUQm1UZ1NxTzV5WGtQY0I2?=
 =?utf-8?B?c0dVYitra1dDRWFoNGdyRG52U0NIRGI2ZHFWdlU0T20vL0Y3bHlkUVIzamVm?=
 =?utf-8?B?UkNzOFJDK0t2UXRQTkdhSktEWmN2dk4wU0R0KzhleGlIOTBKYW1oRXNXaTRY?=
 =?utf-8?B?V0hNSHd2WU1Ua25JQXhxNExUMFRIOHljZWhac2lVTTRTRFB3dDlYYjg5MVB4?=
 =?utf-8?B?RWdERmlRVzZnUng3MlZsWk0yOEY2b2JUQWJiRXRXWVFmZDVub1kyTFNRZXBD?=
 =?utf-8?B?QWJYbEE2Y3lrcDdTOGQ0QjZCYnBXckx5S1ZMbUNaOGRSTTVhaEdlZ0NXWm5B?=
 =?utf-8?B?Z2o5aW9GSlo4T1RNbUdQNGpIenlZQjV0MmdxVDlTRlZkWW50ekczRHVBLzZ2?=
 =?utf-8?B?ZUdlSU5Sak1pWUVSL1d5SHVDUGhUSG1oOUdBL1Y2Y1czS2NnNDdkaDZoZ2lX?=
 =?utf-8?B?bFF3c1dydmNQRFNzSVZyMng3RTBESHp0M0gzdVg3eVppbDBvVnRUNGdWNnM0?=
 =?utf-8?B?VUhXay9RMnQ4V0w1VzgvdTBldnFidGZ6dVVUbkxzRVJlQlBWQ0taRXBWOGo5?=
 =?utf-8?B?SHEwQmIva25JWnVIcThWVWx3WGNaZlJBcDc3c0Z3K2xFemdoNFBNUTZ6dkN2?=
 =?utf-8?B?NFRVLzN6SnBqTGxiK1RHYzhjR3pTTTBkb1FZN3diT3NQNDQwbGVMQUVUWC84?=
 =?utf-8?B?QWpGWlZSZnUwK2tIbWFSUTVrZ0ZsZHZXeFpVK3ZvbUtrZ1lwOUpldDVPL1B6?=
 =?utf-8?B?MkxKWXc5OTF1ZnUyQzBIcHFvZjJEM0ZKd2tXWE1kdC9udHJCemk0b3JvdXhD?=
 =?utf-8?B?V2licDFadlgxUGVLL09iWUFZaWgveE5ac3lDcGZUcTBjN1luTzdES1BuWFor?=
 =?utf-8?Q?GOibLxYLKfwxbk5YNUgAUvUQ7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LukVxBrpInKLLZu/ypQQZna010Yzcq/3lA2ucLK4AUT5cgVXsDqFUO7BBww0L+xACtGjR/SqC0E/pohq1JWBlg2ISrPG0ERN9dmyUPBMGl+e5CfsqZ2X6zcGyGe3qa79dAMc6IuirEVmv9t2oToO9xyhriQDQBxtwtwY+YA1Xs9AUiqRrbuoB1DzseCl+6uvhawsJAqZ37waTJ6nI205/sWAt2vV/dYWyegz1FRjsRSfsbCjFvueruYfxYsH7ubh4w04iWPQZIOLFULzGcXhdFiMq4G4ZTJL8IperOvGPeLBnCssTnYXFTM6Ufak/iYQQr5f1eHUzkKxsdHUsvL88S5YT2TbMKfVXImZXsMgzWOWyPnfqi3cm5FgD/pb21vJN/G/CtjDOQbtUfvFOZW7gAnyUirgxev9YXvwkzTEBQDACgOLHmO1Vzvn3wr7Tk9LyPqcmJ7my9BSKuMdTVJ8yq7Zx58bcZLxwkwoVBky2nubOBAyhawfAZPu+XnqQTVFBEZy55qxfHrMlvSE4BoGXwAxtG/3quQwtVuF95i99a1V89MOOBV7fk8ngSBNWmY6WgYQVEPbKuUoRZyOxxJXHSJ1dpGffSC0hn8+Wqcelrk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a662d400-f545-4c45-93e2-08ddd8e64efe
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 14:49:43.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ms8YjM6lsMm+TnpJXQ0JeIgRCn3oiuQT7qu0qEdyoI+S8pIk5aYRV27PoCQQj3Y7RpKKgM3cTUfNNP9CZW+L9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508110094
X-Proofpoint-GUID: XkFzIMUXeJ_t5H2eklXAPxdRiL8x7rTV
X-Proofpoint-ORIG-GUID: XkFzIMUXeJ_t5H2eklXAPxdRiL8x7rTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NCBTYWx0ZWRfX4nqq+NqzqUcO
 vPVdEDryWzjXUq5vgJHCyESWMEiDKpr6yYvQwd4fnaTP8u5tkv5i0fSs528ESo2h0Bfq1LHkp8P
 e8oR6HKM4bX1LMulbfuzy2nrght40ZcK8RhEutxpCsrA3y/2c4cz8DIcs8wF+jpHdd+Gyv7EFIj
 A3iq8w2skMz0+a1FR/yjTV4jZz0yCOZTvHLVIDzWqORZPOrXwMPnMCwDLTr6Kn0pl3ZtHe+VF/7
 1AacVpS9qH78Q9QZCCuz4e33PbF7dCcuPhKWucTcsjylQtcxWRXw+/2yGRqctHqy+G/eoB5n1hM
 bx1Ujio4o8FNbJt2DbKnpZH2TovzFQB8uFiREzp09RvxFprJfjY8gsE6JxUgtbKjZFbCBs1RapF
 Ib/pfafE//ibbMtEVv6wJrAMWgThXLAi0wN57PxiCjI99tnxuymFlJxZLZU7pZzwdDIJTJ/7
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=689a030b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=3YSXzrDYuElhZjsYef8A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070

On 8/7/25 9:31 AM, Chuck Lever wrote:
> On 8/4/25 2:59 PM, Chuck Lever wrote:
>> Hi David -
>>
>> I noticed recently that this notice appears when tlshd starts up:
>>
>>        add_key: Package not installed
>>
>> As it turns out, this is tlshd_keyring_create_cert() failing to insert
>> the client's certificate in tlshd's KEY_SPEC_USER_KEYRING after a
>> successful handshake.
>>
>> That means NFSD sees the session is protected, but since tlshd
>> returns "NO_PEERID" for the client's certificate, NFSD believes
>> this session is not authenticated.
>>
>> I can't find what is generating ENOPKG. This error code is not listed
>> in my copy of add_key(2).
> David, do you have any thoughts about this situation?
Hi David, any guidance would be appreciated.


-- 
Chuck Lever
