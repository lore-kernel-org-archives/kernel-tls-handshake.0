Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001912951B5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Apr 2025 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863206; cv=fail; b=PfFnpzQks3XKpEkQapLHdf0R/+KuLUrKJDYU3FeWPPOvsUmj4igrSU1z9lazb79dfDBYZ5oIw1n1Y7fjaMzw4/hvKpwM99/nAQZN4lQoSUGCMzCPpgtJN2sHCGZa8YWf4og2jQHfCjZYMVON0SkyKcL6lKpALRUzXulDoTZZl7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863206; c=relaxed/simple;
	bh=sFfbhACQZ9y9eKXSZcVWtu2ot2lGWSUNeGfDlh/iSGQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rJTFGi3mnsENVmmihd6OHHN+tUqeVRWY8EbqQY9LJvN5AD9v+GKkc5nN5FBFa5MMVWTc7n7lBA105lpJ9Jj5avXvMw2dIrAisXeRLOg5WI2HITGOeseisOVGchFUit6MJ3IcD4djIg//g6dOv9galsr4SueG3G8twcMfo515vvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RwOI+weu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eU5tPNWH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RwOI+weu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eU5tPNWH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SHaneY021327;
	Mon, 28 Apr 2025 18:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1mY16PIoMSZvQevZiByx5XIkbKJU77YWCPE4chPqQcI=; b=
	RwOI+weui8bwJHyGxhDwMG6/L/RIkM0mvjgM4BwRyjm8/lHk71kwei0KwLXkjFO+
	zax8hBoxdU4YstWUY6yYXNmIs9Gzlzmc6/wa1ZYToXFRs7PbG09ACNJRzAfwUgR+
	24KWgV3VrWRIzgioU8GvynBdB4AqxUI16xRi/wzvT7uDWKRJAIPKq1LYh7GBT1SS
	Dp75tpA17scyA31hal4maeZcYcaPvZLnUYh71lf0Bme3kpx9dzscPlgJtYyF6AJ6
	XIux65wJFJTFJhCC/Tt89RfumlbhVGe4pDxvcw7yHUmshxEo26T1MQU5SMKK85sY
	GLDVYGPgCfun94akGfLahw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ae7qr1yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 18:00:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGqGwc001279;
	Mon, 28 Apr 2025 18:00:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx8rt88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 18:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxa5AE6hX1UFxG5ltVVi+ZE0DxPv06a7zuNvoMqn9nfGTYd6Co8ohF2GMUPG7zRVwJ+GLOPfHwKacINI1l1C00MWN10VyiSK6phUntb6LojlGiY5nlRLSLeewhx0M3Sv9ikTds0sl21PXjIlSQvEcM9KOQmawB1CfAH/WkCJJX6ybrI4SJ1194peyHHwMWohzvdlbPuuGvwQSga/LiqtpUayZvItmLzp2YPKTNbG8iQwVuBppxGJsXn3wptAlrd8BOpdbEFOXDayBEx6VRQKAi833EOZHItjW2QS0hD1Tdh1e5q3/V4GpanklQH8nMa1pe485GLYzTjapTFX41YW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mY16PIoMSZvQevZiByx5XIkbKJU77YWCPE4chPqQcI=;
 b=RattT2xdfdKTfrthsxe+bLCHa0iIc+NHSGhARFHBz49NxJe531jI1g7XMp5Bun9GMvQAtCxvLpllbXYQYH94RpEQ08sh8eHjKat35oGAcM6gGGC8Vb0r2l6LUkvkpfJ8KDQsZWMs4FSLahaKfJlZ7KyufjaVXJJHHlbCpdg7o3Kynzw2m4wNASv7FmfvUMuv7yzV8YMXVXIiFF7WK8FHBODb/1aUT9up6ho3d2tUDxKVnSvOIXcQydCdnHF/I9onn0p1hrQC8HOSkrCxpXj+nZ8cXejhpHAwaZz4dW4jXrHtxGYXE0BjwAXc1LTFgmdV5HCPI9L7KifPy9AV4FuhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mY16PIoMSZvQevZiByx5XIkbKJU77YWCPE4chPqQcI=;
 b=eU5tPNWHzoGtxwJySB+t8pJmKWa0RDcGlM8mCwAQUny+Ldu0Lc7HtpfhWzksuTg+/1VKbM3m3UrTt4PSxnMpDcBvNpZGLM3Gwd5RwZbCir+diMbCJq5pmlgx1hbgOLpC0MRYmQZhTocyUZUTu6x3bYKvd2MVedTZqIOqIEivFGA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB6221.namprd10.prod.outlook.com (2603:10b6:8:c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Mon, 28 Apr 2025 17:59:57 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 17:59:57 +0000
Message-ID: <71f137db-f013-4530-a4c6-601fea874e1f@oracle.com>
Date: Mon, 28 Apr 2025 13:59:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Steve Sears <sjsorca@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
 <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
 <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:610:60::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS0PR10MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2a0331-15de-4fb9-6317-08dd867e7c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TG9UcGlKZjcxVlVnRHdCSDZ4TnhGVE1hTlk5cHVERlBJZ2xiYzBqQTBDdmdz?=
 =?utf-8?B?OG00bERtUk16dW8xLzg2MEtTa3JrS0FSRmgwMDd5YkNBMWxDTWEyUGk0T20x?=
 =?utf-8?B?NjV6d0dvMFU1dE9VQmV4Yy9rK3FQcFdQNDdocytHSm13NWVjNlJiMDVqZGc5?=
 =?utf-8?B?R1NPWjBOUXMzWXU2RUZJQmdNbjZkR3ZrRTB0d0tTQXJiS3BhL3BzVlVlQzls?=
 =?utf-8?B?V0hDSGFMRXkyTGNucEpLdU43YWhHdVZLOW1WQzBLVFN4ajE5SmV5d3hRcDBs?=
 =?utf-8?B?RkJrYUMydE8yUTVUd2pEVSswQUdtMEVuSjc5aE1GTnVveHk3UllsOGxQTVpl?=
 =?utf-8?B?ZmRhQUxPQ0hJSmwxVzlrZjg2aHV2N3g3T1VVL1RXUm5Wb0RnK3lwUnFLYi9j?=
 =?utf-8?B?b2Flai9MaFZHRXNXaWRVb3lsWlplNFZsRjJyaVhDd1N1MmkvVE96NHIzRlpM?=
 =?utf-8?B?OVJ1VEoxQVByV05qMmFsczNGazVvUzJzRFZUSzJXTGRIVEV2MEF6R1lOblVh?=
 =?utf-8?B?SGFPT3g4VG5KL1ZGWmRtWVphOUxmM0Q5NEhVdEpzaktEeXZ1ZjZubExIOFdZ?=
 =?utf-8?B?VlMzOExSN1Y4M2cxS0ZxU2E5eG9idGhMRSt6endRaUhWdk12Y1lVeXpTSnNt?=
 =?utf-8?B?di9GM3RIUGplUlNucjVjVG5rZDRXcjVPb1A4UDhCUGNkTTl0N0dnRGZRWEFV?=
 =?utf-8?B?ZXNkMWE1b3Q1WEF1S3lZZUozSHp6cDBYZ2xVQWFHc0ZpWTczRzBQUStUM3NC?=
 =?utf-8?B?TU9wR3BWQVJrQmhXcnhCR3lwb2RodWJrM3VEQXRvUTVpOE9XQUUrSVlJNi90?=
 =?utf-8?B?VExLZEIxRmdrMTFHRmxkUFpuaStIOU0xaWFMUDZVUk9yVnpzL2xWRG5LL0tY?=
 =?utf-8?B?dnduTTE3TjhDVGdhazZGNTdlcTgvd3VSeUM3Z1VycEdyRDhKMjh1QnZpQU43?=
 =?utf-8?B?SmhUR21RRm13RVMxSW5JZHpLTENHUVF0akR0em9wcy9hb3BCUlh4Rzh6anlp?=
 =?utf-8?B?MGtveW9NMlYxRkRGRHZQMTc0MGs3Umw3QURvMkVIZmMrNWgwOEhwUzdOYXRQ?=
 =?utf-8?B?V2UxK09LWFNOcmxrMnVKaWNWdmhYS2wxSGVFQkRWZlRObzBTT04yZkJTUXNs?=
 =?utf-8?B?cmNOT3U1Unk1dEtmdDNYM0VsU1NOWitNRk1ua210R0kyWGYrUkJzWjk3Nllk?=
 =?utf-8?B?SlhKUUNpOFFrYWFxclQydzB5My84S0grOVZtS0FCNGpTUGEvcHhpLy9MNnlM?=
 =?utf-8?B?VGN1MG5BM2YxblVtVk5Ha2dCNmRjQ3FtUnJydjNuaDNjOFpzOFpwOUJmdDBS?=
 =?utf-8?B?Qlp4RXpUQ1ZOeTNjU0plV2xoNVFUUnZOdlFWTVVjZkROQUh1eEJ5MmtRblpI?=
 =?utf-8?B?N0UyNVpaWFBUU2R1T3RNdTdaRDZoZHlGdGNXaC9ZTTBDNmtzUll5OFl5NWZE?=
 =?utf-8?B?dVRkNllGYVVFWURORitkcXJwdVkweHpLUE5WS0xaMDBwWWNkQWNhQkhMTVAv?=
 =?utf-8?B?WHlpN3Zxb2lkb2FGTCtHdTRoeFZsQ2xtTnB5Ukl0Mlo5WTBpcmFIY3o4UVFF?=
 =?utf-8?B?UU1Xc3ZETldPamtKVHZveDA3SnNWRnpkQmpnU2s0WmdkWkZUWVJCQ2tVWEd6?=
 =?utf-8?B?ZWJiNjI5WS8yUTFVNzVGd1BpZVEwMnpnMG95dHlSU2ZjLzRnMHh6cWVrVVF5?=
 =?utf-8?B?dHFWd1dGMmhHaXdLUmRadHhmS1MwUDh1OHRpbUtZTjJ0UXdjN2NnZnVZVVRT?=
 =?utf-8?B?c0M3K1ZGOGxMWEpudlhLRHFZUzNzV0Z5ZElmcUdaMVQ3aEtzc1VBMXB3SVc1?=
 =?utf-8?B?WU8vMEJBc1RDQzBWNzlKd0FSRzg3RzlWcHhiWCtNWWxPSE91WFNwMGJEK000?=
 =?utf-8?B?UDZyWFFpOU8wVnhSa1F6NHBMTnA5RXNyaWNKVTFWZlFNd0x1aDVicFRaS2Fu?=
 =?utf-8?Q?+2X6galAsgQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDltY25pQVJpYzlqRUpWRVVYSndxRm9LT3R4MGRoN0RRUGlVUmVzM2lYMHgz?=
 =?utf-8?B?UnlScWFXSHR6S3FWb1BqcW13dXVRbFprSlJTRzV5ZFByQVhZWmxtaFVXbVBT?=
 =?utf-8?B?OHhZeWllM3ozY2NmbTlLaTRTQlhwa2pFL2J3bkU5VVNPakIwRkhTS0lFaW9N?=
 =?utf-8?B?YVFhdTAxRmJLR0QrYnRQRFhWSm1FWklkZ1NDbzQwd2t6NUR2QUU4MWtTYTk4?=
 =?utf-8?B?dGJOVVZ2VFIrSTZWZVYrZXhQOFZIQWtNWURLQ3JaYWoyYVZTbktuUmU0UlFO?=
 =?utf-8?B?Ylp5dmNsT0RybWVVc1Byb3l6c2lBSzVVY0hQeis1VklVU0crdFBKS25YOVh2?=
 =?utf-8?B?L0F1b1JmYlJiTFRSczhCUnpNL1AxdXo0NEF1R3FxZHdPeE9Fb050NU0wK1Rj?=
 =?utf-8?B?WG1BUVdON21wZGR0KzVhanhXZzV6RExFdzRtK2I1SkR1Zi9yWmtDTWtqbm0w?=
 =?utf-8?B?WHRmejNRbkFyOHF5bE5DajJiOXEvSVVQcnFncmtLN0xsNkpRNzVjS3h3SG5i?=
 =?utf-8?B?ejE4SktuSjc4Qmc1bGxsbVpyY3I4VkVZc1NBaW1zZ2IybkR2SHFGeS9BTnVJ?=
 =?utf-8?B?eXpvR0FNT09maDhiWUZwL0NzU1FPcy9NZ0dqSGFVNUVkZ3lQNXpqM0FEcSt6?=
 =?utf-8?B?T0NyQVFPOVY3Z3ZNMVpyRWxaeTZFKzJpM2tUekpaRzRYdkJWS1lRa0FoK1cz?=
 =?utf-8?B?Ym40REhiTjFPMlQxYzREcE9pZVlIWURhbnZkWjlnSFJzY0xyMmdFZzdNQXJn?=
 =?utf-8?B?Vmpha1lST2Npa2xPQURwOWJJRmpWck54UFVGK0ZOQ3lGNjFzazNoRDcwdGo5?=
 =?utf-8?B?b0l3Z3NYRFh3bDl6Vk1mZEpnTGVQRnFhcGdkaXRxcUFJUmVrZHhLaUJXT3pq?=
 =?utf-8?B?ZmZxY3U1VlJxNGZiVE1WWjBrNnNGcmgvQy8yNTdXRlZ3SjVnVFhNMVRaZkYr?=
 =?utf-8?B?T3g1d0p0NUFmaW9yVmpOZ2V2UUdqUk1icHRTTG80bkNTU2lPZWZGWVBEYkcz?=
 =?utf-8?B?QllFeFlZM0YyMHgzd0k3REVnSFZMR2xMQktGcERvR20xNTRteTRBaVgySHVP?=
 =?utf-8?B?NXMrQXl4SmhzaG9FNko1eDVGU0x4OGdGWWcxMlUycFkzc0owY2lBMFV1UzRk?=
 =?utf-8?B?MDVtQVNlUmpBZ2gwSnB0UExycTVkUCtuK0ZTQlZJRnBOYTR0QnpOMThjQURz?=
 =?utf-8?B?RlcrVUU4Z2F3a1RCVzdaWU9QbFdGRVRQMUkvZGp2emV4WmgrVHdWNGk3UjJ5?=
 =?utf-8?B?K2FIaTIwZDh0b1VxRlphdndxSzk1YUg4L041WjdGNDNYZ0kzbmhkSEJpTURE?=
 =?utf-8?B?ZXFVNU1kSFVnTDlZaWQ1cmhRRnZuNzF3cXJrM0o1NldkNFh3bnNnNjVaZ2hN?=
 =?utf-8?B?L0lQZnNxcm4yQXpOYXA2VWUwaU5HNk8vd3JSejc3ZHRLRlVTZTZEOWVYU0Y4?=
 =?utf-8?B?U3RUbjJWeHExeGNQQzFlaEd3c0t1dENNUW9jY2ZmbFlNQU8xczE3aXlrYlZm?=
 =?utf-8?B?MnBINVNLQ0loSkVTYklWUWoxRk00MUZjU3o0aHZGdXVzU3h0TFhHVW84UmRt?=
 =?utf-8?B?d1hacVh1TUZZSFpMckU1eGpQSThzWmhtUDBwc0pPWGdKU3p1VjhTT3YwZzdn?=
 =?utf-8?B?ZnlRR09kZjRHN1ZTSU4zckQvd1ltNElFaUlWNTZjd0lBbmp3Y3hIUDFyVlh3?=
 =?utf-8?B?R2kyWUdKY0RSbmRCYTlyMWdSRUJVMWpxWXo4b3lRdzJtNUZmTGRzbE5vWEp4?=
 =?utf-8?B?aDN0SzNSQ1JkQ2NPV21iWEc4eUxwcVJxQW9vbHMzN1JGOWVYakFPb0JVWEE2?=
 =?utf-8?B?K245SU1nU1hIZjlzZW1VZzU4S1Z6V2pyUWFiSUpPME9wWGVQUlZ1RFNjQ1Rl?=
 =?utf-8?B?bFRLbm4yQlF2ZTJqYlc2UGtFWGUrdmtjWUhNNkh3SWVjeTVkQ2RXWG1ZWitu?=
 =?utf-8?B?Q0x6M1NIY01CdTl6R24yWWpqLzVWczYvQm9XMnlWUC82SGRxdFduK3VGdGk3?=
 =?utf-8?B?blNlMXZWVlR0WVFVNDNYK2dwOERyT25tbzRzaC9VTndhdDZjZFdBR0ZtbUk5?=
 =?utf-8?B?NDhwZ1YvZjFBeG83dnBKQzgvaWpxTjR1QkdDSFp0ajlZczFIdG5SRnJ2TkRi?=
 =?utf-8?Q?Mpk6J42ti/Fhh2GhxcimVtbuU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kFvrZSaXDn6UKyHD9Ue4KNBwof+2s83hR4OP3HpySloKJk9V1w+cFTmB6WSkb9xIyFMMwiAaR0ERw9CyvuVt8BehmKYKQxtIfEb1ij4Gy/oipQes+HQ5wXUphEF2hjg2Cdmzw9ee4vNteaT2+ne0OODE+Ao0peftgLEsBbpriGYj2Q9y00i1NfQNWkl2enGmb/EhN5aCXEsmH1k9wUjDH86jmTva7Zq/knz99ucqOI0wMLyr6elRFXQh8iKmLIsoy07/k0RDLhcRInWFyJ7960atxkHEtmf5WxSBYoWMqEcU1tWn1vpp0KwE3sOIIZg1/28oTYXD8TrzFuiva/QUZPXWW99Fp8aJEbBwEZwyLYH9ngWwWjTRMNISos9Yavl0ZNN8tpXYsClAmuepctUbiVLec07/3Efv13d/hwiFptXG3PrkdWoatLRgVg86LL4dZZbHiv7aFCUhk6jPUFR8ymusnSj3uUTN8+SmMfGdkyaq13WUIEgKXydIOeno9Gh1rr2D6M4wQ0aRd9zSytE/WcpIOCRqL6kwahBBYYGLM08dfaOcAqWEI/gsMkrDNukwaOVlH6zvdtNZ6aSIPpPm/YcvXvjOt/MdiD6PxR6S2Pg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2a0331-15de-4fb9-6317-08dd867e7c7f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:59:57.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDXW2Kx5KWIcQkmBbKsOcdi69pVwnWCOpwMfmtaMmmSzuCWbIz3wNnb/9AeA8skkQBTFDE7MD/N5SKd1u2LPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280145
X-Proofpoint-GUID: nmlYtjlhKISjfKADR9pS7mKtBukE9UIQ
X-Proofpoint-ORIG-GUID: nmlYtjlhKISjfKADR9pS7mKtBukE9UIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0NSBTYWx0ZWRfX0Oy8PUjUI7LB 15SWuHH42tmI/linxMIFerUW89oEXh6MPB7+ib6eE32qiDfQ6Msi1XSz/PL8BxoiXOXT1GHId6U vdrLENszgyrQzqm25kJL6skci6kJx351OSaVnMCzWq9wrVRjpIXVoRLimJGyGOqpr6AioU/OJdb
 2h52+VnnhB+XU8NRtpMXBjIyuMLED0YaJLPu2Te87D465cizWwHGwqHMyzDVrS+9DhTEMIPk33n MCsON/ofGczPxaamvWnDELzCWNJns9DJ0plQgCbFissMp77v4Ro/Nv4suo75kcI7k2KVnf7iQh7 H63iA/vgojP5sSnCqDuNGR5u8v/04fjPfK/VaZEPs/zILNOBa+q+4PkU4eECYLTJ9ymtXNc4rZh BFxZENyL

On 4/28/25 12:54 PM, Steve Sears wrote:
> On Sun, Apr 27, 2025 at 11:35 AM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 4/24/25 2:03 PM, Steve Sears wrote:
>>> Originally posted to the ktls-utils list and Chuck Lever recommended
>>> this list is more germaine to the problem I am trying to solve.
>>>
>>> I am implementing the NFS server side of a TLS connection using the
>>> OpenSSL library. There may be a bug in my implementation, but it isn't
>>> obvious given the data so I am reaching out to this list. Please
>>> respond if the problem sounds familiar or if you have ideas on how to
>>> pursue it.
>>>
>>> Here are some key datapoints:
>>> - Using a Linux 6.12.16-2 client
>>> - sudo mount -o xprtsec=tls,vers=4.2,hard,acregmin=0,acregmax=0
>>> testmachine.lab.space:/share1 /mnt/share1/
>>> - Looking at tlshd logs: the handshake always works. Always.
>>> - The client will hang on the mount most of the time, but maybe 1/50
>>> or so it works fine. And when the mount succeeds everything continues
>>> to work great and tcpdump shows all TLS 1.3 packets, etc.
>>> - The hang appears to be from an rpc_ping() when the rpc null reply is
>>> not processed.
>>
>> Hi Steve -
>>
>> What does this mean, exactly? Which side is not processing the ping?
>> If the ping does not work, then operation on the connection will not
>> proceed.
> 
> It is unclear if I am looking at the right problem, I am still trying
> to understand how the client works. The client sends two rpc null
> requests: an AUTH_TLS and an AUTH_SYS. The AUTH_TLS is received on the
> server and a reply sent, and the client sees the reply and does the
> TLS handshake successfully. This part works every time.
> 
> The, the AUTH_TLS is received on the server and a reply is sent. The
> bpf trace shows the null rpc being sent, but we see no evidence of a
> reply for this one. Or perhaps more accurately, we see a reply but the
> client doesn't think it is a reply to the rpc null AUTH_SYS it sent.

That suggests the server's reply could be malformed.


> tcpdump confirms both rpc null messages are sent and replied to.
> 
> I have the same bpftrace output for a working mount, unfortunately
> without flag bits I recently added. In the non-working case we see:
> 
> 15:32:57.391762 [ 56273/0xffff8e9b80b70000        mount.nfs]
> rpc_create_xprt(args=0xffffb53c87ceb710, xprt=0xffff8e9c259bd800)
> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
> RPC_XPRTSEC_TLS_ANON flags=0x2a0 auth_flavor=1
> 15:32:57.391786 [ 56273/0xffff8e9b80b70000        mount.nfs]
> rpc_ping(clnt=0xffff8e9b81951e00)
> ...
> 15:32:57.391896 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> rpc_create_xprt(args=0xffffb53c9503fd70, xprt=0xffff8e9c259be800)
> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
> RPC_XPRTSEC_NONE flags=(nil) auth_flavor=7
> 15:32:57.391932 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> rpc_ping(clnt=0xffff8e9b80a53600)
> ...
> 15:32:57.392697 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> ->rpc_ping (rpc_create_xprt) return 0 [(nil)]
> 
> An rpc_ping is sent with an AUTH_SYS flavor. Shortly thereafter
> another rpc_ping is sent with AUTH_TLS, which completes relatively
> quickly.
> 
> This part is the same for working and non-working, the trace shows a
> set of nested rpc_pings. However, in the working case a reply to the
> first rpc_ping is processed by mount.nfs once it starts running again.
> In the non-working case mount.nfs never wakes up from
> rpc_wait_bit_killable().
> 
>>
>>
>>> - tcpdump shows everything flowing as it should: after the TLS
>>> handshake an encrypted rpc NULL is sent to the server, which
>>> immediately responds with an encrypted response.
>>> - For kicks I played with timeo= but it still hangs, until the timeout
>>> of course.
>>> - Verified the encryption algorithm being used on both sides is the same.
>>> - The data suggests a race condition, and the order of some events
>>> shows lots of threads competing.
>>> - I modified openssl to enable "openssl s_client -starttls nfs" and it
>>> successfully does the handshake with my server and waits for further
>>> commands.
>>>
>>> I put a bpftrace script together to track what is happening in the
>>> kernel. It may be incomplete as this code is mostly new to me, but it
>>> shows some interesting things. You can search on the sk addr within
>>> the traces to see the flow.
>>>
>>> First, this is a typical failure. The exact order of mount.nfs & tlshd
>>> changes but does not seem to make a difference.
>>>
>>> 20:02:04.080574 [2087568/0xffff8fbbd7bc1b00 tlshd]
>>> tls_sw_strparser_arm(0xffff8fbac3c99300)
>>> 20:02:04.080585 [2087568/0xffff8fbbd7bc1b00 tlshd]
>>> tls_strp_check_rcv(strp=0xffff8fbb4a20cc58) sk=0xffff8fbac3c99300
>>> stopped 0 msg_ready 0 stm.full_len 0 copy_mode 0
>>> 20:02:04.080606 [2087568/0xffff8fbbd7bc1b00 tlshd]
>>> tls_rx_msg_size(strp=0xffff8fbb4a20cc58, skb=0xffff8fbae0a37300)
>>> 20:02:04.080616 [2087568/0xffff8fbbd7bc1b00 tlshd] ->tls_rx_msg_size
>>> (tls_strp_check_rcv) return 255 [0xff]
>>> 20:02:04.080619 [2087568/0xffff8fbbd7bc1b00 tlshd]
>>> tls_rx_msg_ready(tls_strparser=0xffff8fbb4a20cc58)
>>> sk=0xffff8fbac3c99300 stopped 0 msg_ready 1 copy_mode 0
>>> 20:02:04.080872 [2087568/0xffff8fbbd7bc1b00 tlshd]
>>> tls_handshake_done(req=0xffff8fb9ffce96c0, status=0,
>>> info=0xffffba1144697888)
>>> 20:02:04.081035 [2087562/0xffff8fbb55303600 mount.nfs]
>>> ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
>>> 20:02:04.081047 [2087562/0xffff8fbb55303600 mount.nfs]
>>> tls_sw_sendmsg(sk=0xffff8fbac3c99300, msg=0xffffba1155e2f5b8,
>>> size=0x2c)
>>> 20:02:04.081053 [2087562/0xffff8fbb55303600 mount.nfs]
>>> tls_get_rec(sk=0xffff8fbac3c99300)
>>> 20:02:04.081063 [2087562/0xffff8fbb55303600 mount.nfs]
>>> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9eb80c800
>>> 20:02:04.081069 [2087562/0xffff8fbb55303600 mount.nfs]
>>> tls_push_record(sock=0xffff8fbac3c99300, record_type=0x4040)
>>> 20:02:04.081127 [2087562/0xffff8fbb55303600 mount.nfs]
>>> ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
>>> 20:02:04.081181 [2087562/0xffff8fbb55303600 mount.nfs]
>>> rpc_wait_bit_killable(key=0xffffba1155e2f690, mode=0x2102)
>>> 20:02:04.121474 [ 0/0xffff8fbac0321b00 swapper/2]
>>> tcp_rcv_established(sk=0xffff8fbac3c99300, skb=0xffff8fbae0c96900)
>>>
>>> And there is a variation that is equally baffling:
>>>
>>> 20:17:01.400240 [2109186/0xffff8fbbe8928000 mount.nfs]
>>> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9ed70d000
>>> 20:17:01.400245 [2109186/0xffff8fbbe8928000 mount.nfs]
>>> tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
>>> 20:17:01.400272 [2109186/0xffff8fbbe8928000 mount.nfs]
>>> ->tls_sw_sendmsg (__sock_sendmsg) return 224 [0xe0]
>>> 20:17:01.400288 [2109186/0xffff8fbbe8928000 mount.nfs]
>>> rpc_wait_bit_killable(key=0xffffba1143713750, mode=0x2102)
>>> 20:17:01.400863 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tcp_rcv_established(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
>>> 20:17:01.400876 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
>>> 20:17:01.400880 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tcp_data_ready(sk=0xffff8fbac3c9e880)
>>> 20:17:01.400885 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tls_data_ready(sk=0xffff8fbac3c9e880)
>>> 20:17:01.400887 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tls_strp_data_ready(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
>>> stopped 0 msg_ready 1 copy_mode 0
>>> 20:17:01.400911 [2109207/0xffff8fb9e6aab600 systemd-udevd]
>>> tls_strp_check_rcv(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
>>> stopped 0 msg_ready 1 stm.full_len 255 copy_mode 0
>>>
>>> In the second case it looks like something (the rpc null response?)
>>> was received on the socket and discarded or ignored.
>>>
>>> In both cases the mount command is hung. ^C works fine to terminate
>>> the command and will show various return calls as it cleans up.
>>>
>>> Now compare that to a trace of a successful mount:
>>>
>>> 15:25:55.912868 [1847598/0xffff8fbb46ea1b00 tlshd]
>>> tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fbb3c06db00)
>>> 15:25:55.912875 [1847598/0xffff8fbb46ea1b00 tlshd]
>>> tcp_data_ready(sk=0xffff8fbac3c9e880)
>>> 15:25:55.912879 [1847598/0xffff8fbb46ea1b00 tlshd]
>>> tls_data_ready(sk=0xffff8fbac3c9e880)
>>> 15:25:55.912881 [1847598/0xffff8fbb46ea1b00 tlshd]
>>> tls_strp_data_ready(strp=0xffff8fb9cca31958)
>>> 15:25:55.913076 [1847598/0xffff8fbb46ea1b00 tlshd]
>>> tls_handshake_done(req=0xffff8fb9ce43f480, status=0,
>>> info=0xffffba114252f668)
>>> 15:25:55.913151 [1782955/0xffff8fbac2389b00 kworker/u19:1]
>>> rpc_wake_up_task_on_wq_queue_action_locked(wq=0xffff8fbac93cf000,
>>> queue-0xffff8fbbc1283258, task=0xffff8fbb7401c900)
>>> 15:25:55.913173 [1782955/0xffff8fbac2389b00 kworker/u19:1]
>>> rpc_make_runnable(wk=0xffff8fbac93cf000, task=0xffff8fbb7401c900)
>>> 15:25:55.913306 [1847595/0xffff8fbac083b600 mount.nfs]
>>> ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
>>> 15:25:55.913318 [1847595/0xffff8fbac083b600 mount.nfs]
>>> tls_sw_sendmsg(sk=0xffff8fbac3c9e880, msg=0xffffba11425475d8,
>>> size=0x2c)
>>> 15:25:55.913359 [1847595/0xffff8fbac083b600 mount.nfs]
>>> tls_get_rec(sk=0xffff8fbac3c9e880)
>>> 15:25:55.913369 [1847595/0xffff8fbac083b600 mount.nfs]
>>> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fbbc1286000
>>> 15:25:55.913376 [1847595/0xffff8fbac083b600 mount.nfs]
>>> tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
>>> 15:25:55.913415 [1847595/0xffff8fbac083b600 mount.nfs]
>>> ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
>>> 15:25:55.913470 [1847595/0xffff8fbac083b600 mount.nfs]
>>> rpc_wait_bit_killable(key=0xffffba11425476b0, mode=0x2102)
>>>
>>> 15:25:55.913661 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
>>> msg_ready 0
>>> 15:25:55.913677 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
>>> 15:25:55.913686 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
>>> 15:25:55.913690 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
>>> 1
>>> 15:25:55.913699 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> tls_strp_work(work_struct=0xffff8fb9cca31978)
>>> 15:25:55.913702 [1816987/0xffff8fbb40755100 kworker/3:2]
>>> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
>>> msg_ready 1
>>> 15:25:55.913717 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_sw_recvmsg(sk=0xffff8fbac3c9e880, msg=0xffffba1145fafd68, len=12,
>>> flags=0x40, *addr_len=0xffffba1145fafc2c)
>>> 15:25:55.913724 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_rx_rec_wait(0xffff8fbac3c9e880, (nil), 0x1, 0x1, (nil))
>>> 15:25:55.913728 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> ->tls_rx_rec_wait (tls_sw_recvmsg) return 1 [0x1]
>>> 15:25:55.913732 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_rx_one_record(0xffff8fbac3c9e880, 0xffffba1145fafd68,
>>> 0xffffba1145fafbc0)
>>> 15:25:55.913736 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_decrypt_sg(0xffff8fbac3c9e880) 15:25:55.913748
>>> [1830424/0xffff8fbbd7bc3600 kworker/u20:3] ->tls_rx_one_record
>>> (tls_sw_recvmsg) return 0 [(nil)]
>>> 15:25:55.913752 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_strp_msg_done(strp=0xffff8fb9cca31958)
>>> 15:25:55.913754 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
>>> msg_ready 0
>>> 15:25:55.913766 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
>>> 15:25:55.913773 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
>>> 15:25:55.913775 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
>>> 1
>>> 15:25:55.913781 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
>>> ->tls_sw_recvmsg (inet_recvmsg) return 12 [0xc]
>>>
>>> When successful, "mount.nfs" does not start running again within these
>>> traces, but kworker threads handle messages correctly.
>>>
>>> Any insight would be greatly appreciated.
>>>
>>>
>>>  -Steve
>>>
>>
>>
>> --
>> Chuck Lever


-- 
Chuck Lever
