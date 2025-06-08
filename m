Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE194C9D
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397918; cv=fail; b=tQFfu+7htkaHu7dtuNmHdU2AmuMjJQLxsxZ+PalDqllHf+a7M3aWt/h2rjvHc0yckZe8bcl8zPavHSElVv089H8ptCdHz1UA5JfvXspEAlgGtuSdcL5J0M8S6NW33nR48w17FoxFuAmwWe3F5AJ0j+nuVDsugrQNjRbKCpQkl1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397918; c=relaxed/simple;
	bh=hJhWzkXxuN/TrL8SP+OXyUlzl0vjYfvDJfzK+pZ9uhw=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rJOes9AE2IhmrSV/V5PDVYdttZBTAmKXEp6J8DOKNLzTg3rwdmPSN8fOjAAWRUMAj/MaL4ESY3MvOwHfW/arKsLrGkofglKY5MgYd0+tKha7WjMR/DRLXfE0n5w8kG+7XIVTi/iw2bz2Q1mcupm1FA5vQ+p2/wjMaDeG8VNyJro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CAlgPAM0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o9rIpZeW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CAlgPAM0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o9rIpZeW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558EV1sY016158;
	Sun, 8 Jun 2025 15:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0v+Xf5UXeX0oICOT4ciXKfc8X1rQTQyjO4cLXX5AkG8=; b=
	CAlgPAM0mwEmGYRiJWA7PIvHu40AjCqYngPv4YcjHPHI15GXDlwMiJzXaLe7hpJt
	5IKd4uVbDUTWgHduGPYPdKzrkiU46lVoTrmnnL4tTukVPdlJ9tTjA0/egPsRCBOt
	qS0v7Lp5AzyBTA2QRVfEglB6EvqvA8KSbr2qvWZL/Ec1cB8hR6mdBJl0ln7OOzjm
	2o3PnzXB+s6sQ2PeRxrNNihqiFnPHzcazyxQJYKp7S9QV7jJo5KGmLMylKu79sFK
	80ibmpEQ/6fZTad80Arssz7ACYl4eWOHJIFwWXXLeVtgVZUL4MvTi6h0hTPcsjps
	xV+heBuQVh+hv9gS+IqyHg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf13d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 15:51:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558AmsJ1007384;
	Sun, 8 Jun 2025 15:51:47 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6esue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 15:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z61htzfltUTNaIxx9cWbeqiFQn749ESHYFxk4XHqlp0JPhHgGPW00xsTY6orj2/c+twBZT2xKE6JB6C512w1Z0SS6+iuo7ihaien18HhuXdUkyjcCLMDU8bj0nXetgWm7/NY/6w4Tqw41mPE4I/kpvO4odjm7LpSvcvKAOqc/dGNwwLsQrYIQP8S3d7bRzAIHJL9CSyGBkozoEO/RCZuZ96i61REQByqNVgG0oE+nEAdF3EeeOsTJb4/loALb0mCzrc0hKwTUd7YbjBu255K+KAt9roNjgbq64JpePhZaVBpCp7AkxiGG29g9x8m8gCRBcXEQOT07i4BLDbiFmh/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v+Xf5UXeX0oICOT4ciXKfc8X1rQTQyjO4cLXX5AkG8=;
 b=NXjSow8xpRS3kSeN4wjWNfyJVLCrrB5m1ZZrS9xWLofNKskORDkyQfuGe7Lvn1kl+MBvlMABoNxV1cyARL2Ia2wgI99E0pWhr68FBUk/q/QeDWwIh9JZj8YrAHMEzsZPIzgMBv7Q1jfpkgX2GZmAPUIETGJjZW9Lsn4QDoozWqP9JhrXHAtrQ0nmqloobfR2/xv+okMZDpMSDpDUFqO0vFsR5QRcJ51SGEcsBAULF38NxPVUAeXiNAVUXsV1vUtE2AZVPMXs9q7phjbnFzxIvJI3sgB8q3SqQgecXz3BDdS0zHsmJcALiTe/ZpoThCtNQVas5Yd1ypf4jjPTntHhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v+Xf5UXeX0oICOT4ciXKfc8X1rQTQyjO4cLXX5AkG8=;
 b=o9rIpZeW3aghiw6a/K0GbG+PZVsrIEjFCFrAlIW2vUnHCAl/1nh4gDg/wx48cranWX0OgP+FAUBIopZFMifsRc6nyVHtXkdWZcPEbYKDgJjdbTaVFSMl7UzFoJXeE4vaTEFCUoKNKUkjoVtMCTMB0WsJvuWuO8LiTZzhVG4oL5M=
Received: from DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23)
 by PH0PR10MB4646.namprd10.prod.outlook.com (2603:10b6:510:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Sun, 8 Jun
 2025 15:51:45 +0000
Received: from DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::39b2:9b47:123b:fc63]) by DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::39b2:9b47:123b:fc63%7]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 15:51:45 +0000
Message-ID: <0d1d9550-43cc-4e85-9d88-adb72ffd5dfb@oracle.com>
Date: Sun, 8 Jun 2025 11:51:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils client address verification and other patches
To: Ken Milmore <ken.milmore@gmail.com>
References: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
Content-Language: en-US
Cc: kernel-tls-handshake@lists.linux.dev
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::27) To DS7PR10MB5134.namprd10.prod.outlook.com
 (2603:10b6:5:3a1::23)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5134:EE_|PH0PR10MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a6a454-d7de-4945-00aa-08dda6a45ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1FHK1AwYjBoNmdIWXRQMzNjVkkxYTZYZEM1QU9qOEoyRGF6MHY0WEpNaTNZ?=
 =?utf-8?B?NWFtd0VyajhtM3FoM3dvUnRva1YxVTViNkNNcWVpOGV4OTVRbVZJQ0s1TTY2?=
 =?utf-8?B?aTVjbnFBWU52RTFYRk1Xa0pJeWtFdVFVVDF0RUZSMXdkcDBLeU5xN0c3cXFB?=
 =?utf-8?B?VTVyM3g3VzhkOWZvK3BXWkZDR2c0MWNXcWZrUi84dXdrZHAyN0hDSWZMZnN1?=
 =?utf-8?B?ZXU0VmJtWHozcTlDYnRwK2V5OGxZdUlJUzBmSDFjSkFBYkovMUE2c2V5UWt2?=
 =?utf-8?B?UkVvQ0hZRDZVQ1FsN2R4VWhwdFphN3BacTUzZ2dVUTV4dEdrZ0duU3p0ZjB5?=
 =?utf-8?B?VzFueHZsYnhpY3A0d3pRanNVUHh5ZkF4YWRYYzVRZHpuWGtqZG1aMFV5N1dv?=
 =?utf-8?B?S2VhNUJmRTRNNE1LWDF0elhuMTdCNmVwZ0Rpb3k4N2swSnl1UkpxcTl5ZjdO?=
 =?utf-8?B?NmlkOGtkWFZQbmRnbVBmRERiaWs1Q3owRjdrZERxTnNoVWJYaHJTQnk4YlJs?=
 =?utf-8?B?WFFUWGRSaWxWSWNpU1BDNFpNQWRucjJPbkpUTTFFZS9LTE9nL2pKbS9wRnV5?=
 =?utf-8?B?d0ZqYUpVd2kydjI3UExReW1VL2h0THV3Zkh1QmtjcithOFNHcEJldjVJQU83?=
 =?utf-8?B?akpjNFdyRTAxZTlUek9KbnlFUkp2VUNWWi9GSmZvNVB3NWFMUnBUSy85SlB5?=
 =?utf-8?B?UUdZTnFQVjJxSDBCaDQ5bHZmM1BiUTdjYXBCTzhPZDVDWE5RNjgwVEZQcHho?=
 =?utf-8?B?QkVNTVdNNWFlY2FPVzhhcGhxSUFoa3J0c3ZTekhFaEFGMDFIRHBJVWxSV0lI?=
 =?utf-8?B?bWxGSC8vZ2lrKzlkcmN0K3h5aHN6dDV1RFd0bTd6Y0Zpdk5RTlRGMDB2aEpN?=
 =?utf-8?B?aUhNd2tDcmxpeG95ZnovVzhPZUF1S2Q4SU9ieGU5aGcyNWxBNExwNDdhSGVI?=
 =?utf-8?B?QkdxSjdsMG1TSWVvbXVnVS9yNzR3UXlLbTFtelRibE1lVUNUaUZUZ3JLUVRz?=
 =?utf-8?B?a2x2ZU9WYzk2NzVUeE8yeHlndUhDODU5bEcxYjFMT3Z5OVNLTzdvd2UvWGRE?=
 =?utf-8?B?QmJleGhlSVowQjVDcEQ1RnMrcnowRnZycTU3RTgyczBacmFzWjlKbjI4SnRp?=
 =?utf-8?B?dWxjYTdqYkpkZDdvUk8rc3FYMDlOckYwZzhGTmNxc253SUUrUzlmaXZvSGJX?=
 =?utf-8?B?RXg4b2NqRnI4V1JUd1NqY1JNS2N3L09qb21QcUZlajkwTTcxbkJleVpHVzRX?=
 =?utf-8?B?R20yS1ZnOFVPUzVDeGd2cUYzUmVOdEI2UElsb3NlNE50WDFyWE5xR0M1aVNM?=
 =?utf-8?B?QXViSmYyZXJQRU4zVnJ5L21tQXFRVVV0QWdYbndqTk9iTU9XVkxPK2FWWnla?=
 =?utf-8?B?R2NIVHQxV3A1cWJHL2VOWjRIbmNadnN2Z3JkV0p6Q2lXKzN4VHArZTBjRGpy?=
 =?utf-8?B?ZlJ1VmtieTEvbUpaVXhRN3YzUldPeFIxM3pUTkpINXNwS08zczZGUUZrYU51?=
 =?utf-8?B?QTVtYXJ5aCtVeTdwYUUxcytIajFGdFUvejFMdXY1dVZIbnp3eHcveUhNV1hP?=
 =?utf-8?B?ZlB0UTAvbzRlYURkNWlMQjNhajdpR25qSzZiTGh3ZUtSbTRRQ2h2SkEwSHJi?=
 =?utf-8?B?ckRLaXZxZjZBQXZNSDlVMFpkQVREM0N4OEFicXZMQU5zZXhkNDNPZE1odHA1?=
 =?utf-8?B?NUR1b3NmY0E4R3NzQmNRMTFiMUgyNU1oRUJaNGJVeXlGU3ErT2x0SEYrdTFj?=
 =?utf-8?B?a3R1ZnYwUHZFb21CV3lzYnF3VndxSjNmc1JvMjBHcnpySHQ2c2JOZGdJQ3BX?=
 =?utf-8?Q?9UEXU8xmhZZ1qxJH+jzfF68ntV2tx4VzR6DrE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5134.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1V3clZJRWx4azg5U1BUY1VrN0J3RzV2YlVTT3FYYUlXZWkxc0NQVzhMSGNR?=
 =?utf-8?B?QnlrcFl3UCtOeUpmOFJoc2NRTTMwd0RiK212NGxEMWREQmVNZTcyU3N6UENn?=
 =?utf-8?B?ZWR3eVcramFHVlVQQjhwVFpNd2FoVHhhbnRidXNQOVg5cS8wcnZMSWFZQnRy?=
 =?utf-8?B?cGpZdmNLckhpRDRYSEk0ZzJ3TENxOENRdUZucXRLQUZHTk55MEgvdFZ2ZnRX?=
 =?utf-8?B?d1YyK0NoVnk0c1A5MkhpWWg2VTBHN0Z6L09sSGFvdDFPbG9YbDJ0cTc0OG1o?=
 =?utf-8?B?N1hWbGlWdStldXd2b3BNdzJkZDc4S2g5NFF0ajlLazVkMUNsMkxYRER2ZmtJ?=
 =?utf-8?B?dFZ0U3VxQVRvalEvRVJlc0d1em9hTUhTWEZsZGdCOVU0SmN1WFFtT21XUG92?=
 =?utf-8?B?R0pXb082RFFMRjg0N3R1cjdjS2JRMzFpYTJKSk5qZnBkMGZ0UnlFZDdkUFRN?=
 =?utf-8?B?TnF3Y2VTZmcycFJGdG1LQTM5ME9xTUhGYU50Qk4renlIOHhiRVNUUzUvR3dZ?=
 =?utf-8?B?MnZGaGdkK05oVU1ub1lWekdRa3BCNlJNNjJvd2RJUHJBQlk1NUdlS0JRTm95?=
 =?utf-8?B?V25lTXJYRXByUE1JYzZQS09pdkdiVVEydngxZlJHNWZsRW5DUUczbVpEZGxD?=
 =?utf-8?B?eUptbVJ3bERCNDlsY3dnMVkybi85RnE1d0RoOEdUS1RGSGlxWm5ZY1NLYlFV?=
 =?utf-8?B?Y0pPTzdhWXJwY1JvY2kvN004SzlIaDZ0ZXZDN2dObXk0STBaUGRsNVBKdi9I?=
 =?utf-8?B?a2Q2c0xqUkY4L1BtdlYvajAvRGc0T3RuZDZlWkhxc21CdWh5K3RiZmhpaHlG?=
 =?utf-8?B?ZFQrN2pEUjQrcWJzeXNEVHhqNG1hN2pYbmowWTBhcDhZcjdSL0JPMFZEVDRD?=
 =?utf-8?B?NlYxaTduWTVHN1pMM3g0bzNwS2dUb21xa3A2RENqUFk1MjB4WDBHcHd4MTdl?=
 =?utf-8?B?YzdjNkZJYTRieTF1THVQalNUTVJSK2Y4ZE5hNTRxdi9uVkI0VDdWUkE5d25I?=
 =?utf-8?B?WndJbmNKZytGV3M4R1Rzb1dzOVJBWStteGE1bCtsSkhnYmxhMk1IbHUwdG13?=
 =?utf-8?B?RmlaUzVuZENYaVZqMlFsS3Z3Y282V3gvMXNWU2Uxdy91YzlBdVVLa1Q3ZVN0?=
 =?utf-8?B?NGV6TG01bXVKU25YdkZJSE1abmdqUzh0R2NGNEFmaFRIQm9TLzlmRmhxWWNv?=
 =?utf-8?B?VVdWQmkrT2c5dzMwTWo1UytRakw1dkFRVTg5WWxPdG9Xb0ZsM2x4Y0NXUTN4?=
 =?utf-8?B?aGsyY0p1Y1FIQjlRaGNBT0ViRkxMSlRaVTJGZzRjUURHQ2ZZYjdhblBJRjB4?=
 =?utf-8?B?aTdaN1FacW1lWUhIY29PcUg1WTNCRWxqSStTN1NJK2pLU25oc1JvdC9CQmIv?=
 =?utf-8?B?TEE1eVRhZUpuWFhTV04yR1dVZ2hGQW9qVzZSUjlqK2wycFVYTE42djg4QnJB?=
 =?utf-8?B?Z0twQXdmM1J4RU1lbDZYdC9PbmxYb3FqSVZGbGxHcVQ5bU1XY0RZZmFRQ3BM?=
 =?utf-8?B?K0xnODcwRXpkVVpnQXJxK1hjcFVFRFN3R1VVQ2VnejRwYThKNXdUZUtOMzlU?=
 =?utf-8?B?S2ZDSkR4QmlRdm9BZkc1YnRBWGpjTzdVOGM5bWxKM3d0clBrMnVkMy9CZVlN?=
 =?utf-8?B?cS9CMnR6WTROWklzSjg5UzNQVm0zcUNQUlpTVzBVTHhOZGU5UEttdUNvQ2Zv?=
 =?utf-8?B?Z1kvWkVWWDlnWTJuaWd0cFJxY1NORGlqdkRrZExYbEIwUHY4alVMbG9VZjNl?=
 =?utf-8?B?ZzMrOXJ1WG9YQVlEVmJyUmdiL0U0anh2ZkxlYXFyQjEranVvYVJJQ2ZyR3VH?=
 =?utf-8?B?REpDN3lJUWdZNm9UaUJDMGhoN1VWdkZkQ0llNGVWN3JyQUxhZUorcERFS1ov?=
 =?utf-8?B?UjAxclMzNGo2YUdnd2xuR1gvNmtvM2E1LzVRRTNYUENSN3VOZllSaFhndFE2?=
 =?utf-8?B?cjJvT0JVanlxUEtldm11Um01QnJIRDFvZWk4L2JsV2hnOEFsazVRSDR6YS9i?=
 =?utf-8?B?RXo5anF4ZDNVemwxMTNKcGVkeXcrRVhzdEVBd2xuYitEalh6RmRIYUx6VGtS?=
 =?utf-8?B?SnZldmkrOE5TaDlMZXhrUTRFWm9VTXVVWEk2WCtkZmVqYkF1ZkdFNnFodFUy?=
 =?utf-8?Q?dao4GWOFKvrgURk7u9URx1Bzl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QSkzrJPNOB2AIHBb0yIaDi/E+W6mQRTfTa6IWF6kv2jpcq4AGvjrjjlzMYDyyyu00L/PekPGBUA9PNMS9VdM8r1z4L4Bq0/e5iVrCKvNSZOqRAY29DeswCuzXwyVg5Ctz3mmXcNqM0vwSsLvRE0yG9WentAw2GMhbam0MYyH1kGke6cysDsQqmHUYKmsS1fxPEyt31S9APANjmDI/e9GpIyBpesfjmUyOq1A4M5N6r/Yw3/CgA1l3yDh2Qp1yP0v1PV1+WtZVPuZaftVzf6puyLTCz6uvwcOwe68iifkFamiT9XLxwssNKKg4EDTeuvwQiVtb/S/3LhLQQvV4cWJ+F6MqjfByMs4fmhqHlnzCmrVvezlIx8DPoMSq3K0rOgNgOXOnsIUhyZLI/993937kGv12xPNTyELlOIqjopr+e6sU5Cfj83zj+7TLBtvpfLVWQ4kmcp5IVw03tKVSnlIt3beouFDRnnWLV5dGWzS17TXbET1D7VhodM32i6bhz4cTVozYSBM4ALVliYCsDUh1VnA2ed03AVWWiv8iy0X7ElfixmUd4iSdxnTHeq3XvNX+ukwCha9uZO6o2iwuvQFonQOxGyjwoYpvl6KerSXdDU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a6a454-d7de-4945-00aa-08dda6a45ed7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5134.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 15:51:45.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENkb91RbG5eJLkI3HEnZqj9D2RxCzMPs0JQlVIFLFsuIsluj1rMVuTgmE050R2VSWQxDFmuNgYFlHtERCkP3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4646
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506080126
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6845b194 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=SXzkmgPmAAAA:8 a=TeZh0Dml-9yZLsV4AL0A:9 a=QEXdDO2ut3YA:10 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: Nxb6zCh40eLY6L83yJ-AWnOMU0CAclGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyNiBTYWx0ZWRfX4y3VrcUTQcyd 3W27HEF0qISLXN/4hxrIhYeOzmLfKsBwDxLTx2MQe5Wm0rNXAjXglktLE5O/eXjnBSD1YdD78CY pSKb/lax6S/oYlcsPB3eGPg7uf5Ns3Bt1KJTXzn9buEoQWHOc8iY+R5f1dFP6CZ5Sb0Q0lw/mc+
 GKRHZbxfJcqR4dd9at/zQiWwYEiHTCrbXtFKWyyFdC80vZ21JJqztIYDM8UB45Z9dMAkjGF8qnP /lMUakEaWe4VNhAuJEd2hdBZwVMZravk5LP3AwGVAmegnRM0f/d/ea+ZWK9GT7NQMNax4h1GOOw /Q0iIKyt9Ggo3ZFY+nse0iB/H3pjvyB1QrQWo8sH0bn8fyJm0eWdYuio+zA7yvhT+dM1ktnbJXz
 80i6xIEnQc/7XK+kxR41YU1Fde2OEywJil7Oic6rsa6k6ZIn40R2+dg+1LR2sJB3FeoCUCBZ
X-Proofpoint-ORIG-GUID: Nxb6zCh40eLY6L83yJ-AWnOMU0CAclGL

On 6/8/25 6:51 AM, Ken Milmore wrote:
> I've been evaluating the use of mtls to secure NFS mounts and have noticed there's a fairly serious limitation:
> Any client which has a valid certificate can impersonate a different client, since the server does not verify client address.
> 
> This is unfortunate, as I'd like to give different clients access to different NFS shares by naming the clients in /etc/exports,
> and I'd like to use mtls to ensure that each client not only has a trusted certificate, but that it is only able to access the
> shares to which it is entitled by /etc/exports. In other words, I want to verify the client host name or address against the
> client certificate to avoid address spoofing.
> 
> I can understand why this is not the default behaviour: In general, a server will not be able to verify clients in this way.
> But for NFS on a personal or corporate LAN, it is highly desirable.
> 
> To this end, I've developed some patches which allow the tlshd server to be configured to instruct GnuTLS to perform client
> address verification.
> 
> Please see patch series here:
> 
> https://codeberg.org/kbm0/ktls-utils/commits/branch/verification-patchset
> 
> Because the server can only obtain the client hostname by reverse address lookup, and this has security implications, I have
> been careful to confirm the hostname first by performing a forward lookup in the manner of FCrDNS: We call getaddrinfo() and
> check that one of the resulting addresses matches the one which was obtained from the reverse lookup. Should this check fail,
> we reject the certificate.
> 
> I've also added an option to use a textualized IP/IPv6 address for verification against the certificate, in cases where no DNS
> address can be found. This works if the certificate includes the client IP address as an alternative name. It is also possible
> to use the IP address as the first recourse, and this may be useful in some circumstances - it is possible for client and server
> to verify each other entirely based on IP addresses with no reliance on DNS, if the certificates are set up correctly.
> 
> These behaviours are enabled by setting options in tlshd.conf like so:
> 
> [authenticate.server]
> verify_peername=true
> verify_peeraddr=true
> 
> Another issue I came across involves the fact that when a client connects to a server, the server name is passed to GnuTLS for
> the purposes of SNI. If the client connects with a bare IP or IPv6 address, this is not strictly allowed, as only DNS names may
> be used for SNI. This causes the server to reject the transaction. I've added an option to omit the SNI in cases where the client
> is connecting using an IP address:
> 
> [authenticate.client]
> relax_sni=true
> 
> There are some other patches in the series: I wanted to textualize the peer address up front so it can be used for both logging
> and also for verification.
> 
> I also thought some of the processing in netlink.c looked a bit sloppy: Optimistic assumptions were being made about the
> contents of return buffers when functions like getnameinfo() are called. I have tried to correct these.
> 
> I am hoping for some informal review or feedback for these patches in the first instance. I didn't want to just spam the mailing
> list with them upfront. If there is any interest in them, I will submit them formally.

Some general comments:

Essentially we don't want to make certificate validation dependent on
DNS for any reason, since DNS is easily spoofed. Have you considered
putting the client's IP address in it's certificate's SAN field?

Further, there will be plenty of cases where clients obtain their IP
address dynamically. In those cases the server needs to perform its
certificate validation based solely on what is in the certificate.

But meanwhile, you can post your patches to this mailing list (inline,
not as attachments) one at a time, and we can have a look at each
individual proposal.


-- 
Chuck Lever
