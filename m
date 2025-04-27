Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10E84A18
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 27 Apr 2025 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745768125; cv=fail; b=dm5lSSw1Pzu/ocZY02A/9ImqIgb1QhRA9XP1Cxxg3u98KMJZsa7K29PdSmuJVxXHBxqsClY9ZHgFINIlyWxMxEoNT/VIbBru6TI+huPt1zaR7Vx+5Mr2o2/SRORpNLgdrCvPF7UIpU0jnjsKsjOLdINBIp5rS5kJYJqJBmb2u/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745768125; c=relaxed/simple;
	bh=mTW1MXU0b43OTalHq/nYQiz3qvlF6OT9xbOTksNrLE0=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qYx9PnESNO9h59UNBzs4KoO7jdM6E1LdQzmj4fMEkCw59SDeDAo76wCzuBRp2YDT264vQatdltwm9ATF8tkwgSj1co8piuomHUwEZWa6qUE681PB5XInoQchznqo3Rc744brYvlylpFA63Zv+Fx47gTO5W6YcT/jeW6E7tRTMC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ekZ/Lo9v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=srMPJBgu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ekZ/Lo9v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="srMPJBgu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RFYuKw027705;
	Sun, 27 Apr 2025 15:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=4SIHISqVJGe6n9+xxtJ46AfX7yZyA/0rAfPyesGDowE=; b=
	ekZ/Lo9vLOpgg1cW3FICGmeU4NWfX4qRCZNv4SLF5J2XErt8F3ioXpLJaqzeY5cy
	WHOTDtfBm7i0W6PEdGomS1IratLeufxglpLwS7bcAvJuv3aEaj5HjCryFbhacSQi
	1Nvu8TenCCwDQ15YP/bH36J6MaJzgSTJWRtGQDIBmejcp1m2o4dnjCKtJn09WbnH
	rkXwDyyueNh32WuZTjPUxBpldXYv/3cGRV+XDnB9osnwc2NnhLt1wMZmL6atHHet
	4x5BE/FVrqyddaShGm7EjXCqYj/A2akAaOjWTWXKNNJo7UQHmcziN3RH7cHShE1s
	NxduoJdRwIPKiB8Roh+WkQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 469q1d0211-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Apr 2025 15:35:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53RDBRmZ028475;
	Sun, 27 Apr 2025 15:17:04 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010005.outbound.protection.outlook.com [40.93.1.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx7em5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Apr 2025 15:17:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0R+7BqU/TERZlwkaIoS2CZWuZbeLktfsjb/rPq1lr9NnJkoGu0ojjxd/uRkGSa5192YkecCMvf1fs5OUiAv0665NwAF1alVjvbQazch3ibASL0jsxaCiE5chpItg8agYcSh1dKuj74hxK1dDiihNAabBrOqMNwaZB7W2FMzjP0ZnTRNjLpn56Orns39YzU3En8uZV0yzHQ0W2XRFmHfxivbnmudW9/g/n9j5zjnkkn2wwNAP2HioMfQWBE9Qi6/yho0Ol7hi3KZ8q7z+QZZFGpSGvfkuR0iwbmlcQC2cp6r9Pb/hQGzjbMAOyXdaHudl0wFlrLOotvf46B+zsEbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SIHISqVJGe6n9+xxtJ46AfX7yZyA/0rAfPyesGDowE=;
 b=QfX5cpXRu5Me28JBuhatuDKfYPUH2YuMGDIP5Vk6kJ/sZZuXAw04gbiZy/if7j4qUw5uXFwsH5sv/ZaA/wbkjN9ltL0SoWb141AVbgq29qTREZ/aQg3qFeBXY79hUDSxAM0xjDd2jG4mhxTYm7aBTYglxhPjfeuDo8m0oY1DSN7B5mxuJiVFTafiX+cFQaKzRWa1Fa9C47ZvoE6WmXr8AVLZX/RRUthzsFp1/dvZ6riBaFEcI26ca4rXfWACQYVZB5bmjO3NAGxMs5JAH/4Hp043OMugpLxYDCeIJVJFJW7Vdm9rN5YuwPi+B8Bab5PfjziRcuqUAXZIh/Eba+gNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SIHISqVJGe6n9+xxtJ46AfX7yZyA/0rAfPyesGDowE=;
 b=srMPJBgumn1BOoFQ8tLMY0Le9wFoR6e44VC/DPgjBiDDTkEIaXV9k9VxsPzHZQkx+LZttqdM7eeakTX1dXll0GIrZ2NGRZRR3ElXL66axWJxaE23Ix0yXP49aDwgjop7tB4zDCzI9qXRoPxQwFEEyY6ZBbgZFSEuvWmFxMBjtYM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.40; Sun, 27 Apr
 2025 15:17:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 15:17:00 +0000
Message-ID: <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
Date: Sun, 27 Apr 2025 11:16:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Steve Sears <sjsorca@gmail.com>
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
Content-Language: en-US
Cc: kernel-tls-handshake@lists.linux.dev
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::13) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BLAPR10MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 48931f6d-1f9e-46bb-63fb-08dd859e8e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXpKL2FmVGMyVk1aN1AzSFpiN2xVTEdCUUJWYnlSMGMxTVBDaWdvOVhOaGFG?=
 =?utf-8?B?RlQrZUNsb0s1QktaRldXTHpOQ0ZIbXlJdlVBRm9GSytLL3Y3UVkvOUFqUkRF?=
 =?utf-8?B?cWtScTdlWmlhRUdjazc4Nk1UcUgwc0FrVWxxRVZuT2x2WWQ4OEFuckhXUWZz?=
 =?utf-8?B?UXJHMTBYVTc2QlQwK1FseVdJVnE5S3ZIdGRWK0h1eDA2OXRRZmFFbTRoeHYx?=
 =?utf-8?B?amR0d0tPRDBOUUJyZkFIZlJ1RkdSN1FFN0FNakRtQ1c5RnlxbnJ6aTdyYytR?=
 =?utf-8?B?dmVMdm5zSjNuUUdXblpldXQxakVCWGRrc2lYR2xlYWp5L3dCcjRTbWJteEkr?=
 =?utf-8?B?aFNXaEFieWJlcXpKQ240MENkNkVPNUlnWHdqSVJyS3ZnUkpySTFPdzNwM0Vk?=
 =?utf-8?B?K3hjd044NmpyU0Q4Snd0eklCYkN2eHNUbHJWQU05V2dBck9UZ2lEa0dZZEgw?=
 =?utf-8?B?T0pRSzR1YU51OWcwUmgraHZ1WmY5bXVBclVJdEhlSloyT3pWRWlVQlRFaUNQ?=
 =?utf-8?B?cHpHRzRKL2liZHFkYmRVbTVoNmJxNy81QVZPcVAyaXNYSFNEa1d3YVVYU0JS?=
 =?utf-8?B?Q2lFZkpLeFpaQ3RzLzMzcEpoMUY0QnBnSm9VNWJ4Y1pyVGhyUTNPWUI4SzJW?=
 =?utf-8?B?OWJwb0ZQZEVoaXpjaW00ZVdVSTE2eEt5b0M0YUVTOXdDZGpTV25xYUxTb2NV?=
 =?utf-8?B?c1VKUUljYmVOS2dWNW5saUhKU1I5Uk1XV1IwZm9oZmdycDgvWDFvdTJxYmRD?=
 =?utf-8?B?eGxrMllkUis3OW9qUGVXVytDYzM5d0lVQ0xzb1lIdzNyMmREa2JNMm5XSmlx?=
 =?utf-8?B?WUs5SSs2UFBZcDc0RWlYd05JVGtLNlNUaU9udkltaGlkeVNzVFR5aXBhRlgx?=
 =?utf-8?B?QjZSVVNsa2tKM0NlY0FRUU1EeE4vZmp2bXdJRDFmQU9tdnN5Y2EyLy9nVlJG?=
 =?utf-8?B?a0xxV1BiZUIvZGhqNmlZeWRZTk9jNjhMUG02N3o4NHFISU9PempSbWdpN3A0?=
 =?utf-8?B?Y2gwWnROQVI1TG91dXgzUlZHYVhrajZWdURVNlJJbXRmM0RTaWVsT09hSjFp?=
 =?utf-8?B?U0J3Q1kvaTlSR1lZUm9NdjhWNmQ3WkVtaG9DZmVYekhEZkxuQm5BaFZuUlpW?=
 =?utf-8?B?MTlwTFFWRXhGRjNQN0Q4UHdxVTFsVG5VelpUU3haRUNCbGdla2gzTGxCbDQz?=
 =?utf-8?B?elIvSVVRSG5GNEhrMkNNTXN3b05xcnJoNksvNy9naklkNW9yT1dZb0YzaVRT?=
 =?utf-8?B?VnNPaVpmMEc4bTdDODdmV2FMYWszUEFYTVhkM1kwMENzMFRkWDBlckRpTGZn?=
 =?utf-8?B?Tld6SW9SY3FMaUlPb3BmTEJBS3FUQVZUNUhlMmtLSmtoTE8rNm1FZ1lBS3RD?=
 =?utf-8?B?TkF5Q3I5Nk8zdU1jZXdLRklsMG1jZ2thdDJsS2pMQnRhY29CQWkrMmduakZw?=
 =?utf-8?B?dWVrRFQ5REgzb2ZYSXN2SE5vc1RzVktyOFZFQW9XRThxVlp2ZDdDYWtzK201?=
 =?utf-8?B?VFdQbmxDeGZVYkZIS3NveHl1Nm9ZVm5OSTNjcmMvcHM1cnZnK3VKelBaQnFM?=
 =?utf-8?B?My9UM3hERDFmc2k5OGh2N2RGUGZOWnN0QWlyaUVPR1Z3bFUyVzN4RzZLM0NT?=
 =?utf-8?B?akY3RStuS1Yxa1dBaTJzMmVHY0lUWWpmM1hRUGFHdi9EWnordGtnV3ppR1Yz?=
 =?utf-8?B?TUthS09ZNGdUdTV5TEIra0MzNFZYQzhyaGJVZjJrMXdiNVRrbE55YkxlOWFi?=
 =?utf-8?B?VTFjSHdRRmNST3dWdnd6b0ZmYzNqNk5CaDRVaHFpWlVoaUl4RGMrTWFkTjN4?=
 =?utf-8?B?WDdmRTZQVTYvTnNzeVpFWVUrWk1RNXN0RXVRenJUS3p2Z0VUSFNRbmFaaVRL?=
 =?utf-8?B?MVhPL3k0SlhxYk9KcldVbFQxbDVtaEs3aFcwWGZ1V0d5NWg5QWZ0VUYzNVZU?=
 =?utf-8?Q?MN+ST5LnV8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anUxTWtMTXlkZm1VMEZWQWdvQmtRbHRVRDBGT1UydnpESml5SHZmdThZbWs2?=
 =?utf-8?B?OGlmZFlsTFljMHhlMUtyRXJkaEx2aWFqNC9wSmJZUk1uT3BYeTRidU1ZcUdG?=
 =?utf-8?B?WUp2bFdKR1FoNW96WWNWL1VSallIV2pqWnJGOWpNdUd0NVFPaFF0Y2pvVEtp?=
 =?utf-8?B?Q2ZCMkorU1drZkM0K3MvV0pXeW9UQzdwMkNyV01yVGtwRHhMdjhrWjU2OG1K?=
 =?utf-8?B?N2RCdU5qYnFPbkxNam4vZ3JPc1Y2NWxIWFRGZ3kyWWtOZWFYSTFWVW9vU25P?=
 =?utf-8?B?dWJDbTRFMmNKUXJVVmdkek91QnRNV1h3b1N1QjhLMmo2ZkxkOFR1T1pFM21E?=
 =?utf-8?B?YnVtQmxqdldBQ0YweFdlTkJlYzN6cWV4NWl4UzRINHNCMnZNQ21CbnBpTlpK?=
 =?utf-8?B?RjBua0J3N0FUV3J1cnFBMUxGN3o2SW5kRHlzeWhoV24yOGtmckNRQ0tZd3Fl?=
 =?utf-8?B?TWpXNzB0ZVhzR2JaaWlFNjl3M25LQU1tNmEwZUcyRmtpdzlSenpoRlNxdHhn?=
 =?utf-8?B?amVMNTVRKzRkVm1XS3VhRmpVcjRYRUF5NFdXYWFjRHJIM1RKZldTekx6TnZG?=
 =?utf-8?B?K1N0cHFBZTQvNDRwdUJMcExNeHJ0Z3dpZFROdHk4Z3ZicGNaQXVJR1ZZSEFY?=
 =?utf-8?B?SWd3c2hYSW02RU8ycVo5clVuSFlBMGlnREdSVmV4MjdzSVZIVXBkZG9ZWFpx?=
 =?utf-8?B?clFpMzJ1MVVWNWl2VGdnZU9MYlVoL1pnSzA5TVhjd1QxZnVERmE0WGV3OEJw?=
 =?utf-8?B?U2pRQ2pKRGR4dXNhUExBeTVabDlYY29nR2tZN2JLZnpIaGkxdTl5clhoQUtH?=
 =?utf-8?B?SUFSZUtPZFdWODd1bklTZmhUelBMWWlhaXl1bmNYdTlGdmV0V3lSYXNWd1o1?=
 =?utf-8?B?VmNHdk1CLzNNVC9SZHd6QnBLUjZrNzQ2SmVCSE5Pd2tzYnpmV01POHhnbW9m?=
 =?utf-8?B?aURkSkVBN0F3R2ZIcEZMZHZWbEIvVFdOUjI3cXBRRFQ2akxYTFRCK0M5eW5B?=
 =?utf-8?B?TlZiVzYydWxZQjZIM002UHdLVEMxVmdTM1g1K3VHeUVHY2xIQjZUM2Y5dW5k?=
 =?utf-8?B?WVZDS3J0bGoxNzY3UUhtaTN6bXBHMVhZVVlpQ1Y0YXkxbVRPUnZTQWJ0Znlm?=
 =?utf-8?B?OE5xRTkrelYrUThSL0QyWEVjTUM0SlVEWDNlYkRMUHc3RUNkSVNIazN3TWt0?=
 =?utf-8?B?Wk5rZmIrSkx1ckx0UWV6dXRVN2JhRVhPc3ZoRXMzY2s1YUNnRm04d25PUnAw?=
 =?utf-8?B?Sm9SMlJaaXhleUVLZk5wUko4QWVUY2p3WWF0ZnkrUHA4NEU4b0hmbFp1TmpS?=
 =?utf-8?B?QkhoZnM0b3UzcHVZUEZYQVV0ZmsrdjlGeTNnNDBIVDAwNXd3bkpyb1QvU1hn?=
 =?utf-8?B?RCtUSmhZZjJnUjBuY0x6OXBYM1dMYlJXM0NGOFBJZkFNS2podVdMMmRoY2d3?=
 =?utf-8?B?QkFtU21NeEVIU2xabTZYR2ZjT29GaGRzcVp5R3pGNmx5d2paM2VNWlg4eDlk?=
 =?utf-8?B?L1A0b3BDSmVxdlJDbUFpSzNqR0hPRlJGeitKN0FCT1NFMitpd0FPWE81bFN2?=
 =?utf-8?B?VFZFNmdOU3BTOUMzSCtyS0RUdWNEbjhGL0lvSnJxOTJFSTUyYzR3M09WRjdh?=
 =?utf-8?B?ZS9PeThrNk1UcFdHZ0hWTGJzc01wZCtTejFPRjlFaGlCR0lXNm9iQ0MwZnZh?=
 =?utf-8?B?N25FVDlaUHU5allNTmMvSldBUjg5NlBLME51ZVM2N2FLZFRidENqT215SFlW?=
 =?utf-8?B?Mkt5MVZ4azBSVnBLMk93TzBzUWFKd0dLVWYyVnNXRzRQQXRnWTJyenUzZFZT?=
 =?utf-8?B?S0tIWEFFNHl6QldpS3BVTEllUzhiMTNWcStGekFvNHJrK0puaWNXb2g1dWJ5?=
 =?utf-8?B?RlJ5LzZYaUZLbEFEbTl1eEs2TUcxUjVYWkY5NEFZK1lIRHZ3UWRLSGJKZ0FN?=
 =?utf-8?B?Y0FBTS9LbS9seGFQalJEUS9qdTlhTmVkUWk3bUFzUXh6MzF6RWZ2R0liVWY3?=
 =?utf-8?B?dTRUUGJaTk1DeEN0Nk5PUVNxUFFHckdFbGNZMXhhQ3NEZ24wZ0RZTWpiRG5y?=
 =?utf-8?B?aE9laVp5WlZqeTYybVptYzJ6UC83OVhrZWdKY1VteWtWUjdDVGt1UkhWaUdZ?=
 =?utf-8?Q?bPmxsIxNS7mK0NTl3BkMVNVZ2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D7pn8DZWKs6qcd/hozybyuK0kKIlvBoL5ZFJcJAB66/OqkF/7hVA0gw6+bZfAjc1ZUkfpoTHZJonjxMjY83bAhlpx721UlirrJ3w0ob+xERi6CUYFGKYtKYTbPRKNDmg6qpgCyse6hI+PjNyoXROzrhUiEoxvUL0QVVVof7MEedb5q22NwHHFsK/sA5yvrmy2h2UQNqxxaWgGYGczAlbLKXETEvW446Sm6D+/Sd3Sd4To/SRl2wbk/IwhP6cwj4Yy7fBRfnM66DuJY+NtOoUWjU8Q323Dzv4Bcbj/cxkvzBKsYJEN8GkEUc+xnauSJL6trAcahs3OE2AltyABdiq6qam5yBcXoCzZd4ZryayzuiLKsS56ZYyln90delhy19zDM/r3iQ/d7d/LKPeqL6s+7NSxNA+nxCiqQ38PtTM1u1ssnabtwdyq3mfx5jNGsSRn7i5kAd1r/HZn0KIkWHfqzf9S7rdOIELD6pJp0Z/RCdDMc+hIkM6PWZGvq03HTOxnmRvFMwPosHvR8NGdJ6+D4EnvooccaGnrgNcq8wUq5mZ1A5ZmRUcvTOUClMKPdom2AYJE5JMj/0VZ22C+lOfy2h+Wzdxo9zR6igqKotdtEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48931f6d-1f9e-46bb-63fb-08dd859e8e96
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 15:17:00.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03hQeQLkLj3TTrQXH1+tkfiYiMa4Re3H5KEifX50EN1JX0mLl1PJGIBK5JJ4R+nE58h8s2VNn/u+fDEf4Vuj1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504270126
X-Proofpoint-ORIG-GUID: bsllwxVY9oYIUpVdTEv-ggu_0qX6Uo98
X-Proofpoint-GUID: bsllwxVY9oYIUpVdTEv-ggu_0qX6Uo98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDEyOCBTYWx0ZWRfXy3twqW/ddC7E pcHuOc9r3jNfeVAMPyED+jgPuqochWkzfFusxahJ9cLwLHTMAqpk0te3DdhCniT7spenMvrGh3T zT974SgkRWx6OCBoa6KnYjpU8UhXONuLUIXG1T+r7vcrwFQ4OTSF+M98ULtidSpzJU+BufO9fqd
 l2+ORVTdm+jzSdMqv92bw9QT71iqH11oT1WCzSoIoA/eqYoDSSOlDDRVWHYHOPzuMIbwTIxMPza FiqkUMtFvyL8/ilZErtS5j6nUG6Jw1RiQy4X9tSIQPtnoPoCoA2zdsi0cGNsfpsEumPICQ3f+WK R3J3+p4FM5gewDyR/HZE81QAcHn/Rx4j5apKht22G/ca8vpjGQJH90ZkPCVSC3j18fjoRBIW/yL 6AbJ9xlj

On 4/24/25 2:03 PM, Steve Sears wrote:
> Originally posted to the ktls-utils list and Chuck Lever recommended
> this list is more germaine to the problem I am trying to solve.
> 
> I am implementing the NFS server side of a TLS connection using the
> OpenSSL library. There may be a bug in my implementation, but it isn't
> obvious given the data so I am reaching out to this list. Please
> respond if the problem sounds familiar or if you have ideas on how to
> pursue it.
> 
> Here are some key datapoints:
> - Using a Linux 6.12.16-2 client
> - sudo mount -o xprtsec=tls,vers=4.2,hard,acregmin=0,acregmax=0
> testmachine.lab.space:/share1 /mnt/share1/
> - Looking at tlshd logs: the handshake always works. Always.
> - The client will hang on the mount most of the time, but maybe 1/50
> or so it works fine. And when the mount succeeds everything continues
> to work great and tcpdump shows all TLS 1.3 packets, etc.
> - The hang appears to be from an rpc_ping() when the rpc null reply is
> not processed.

Hi Steve -

What does this mean, exactly? Which side is not processing the ping?
If the ping does not work, then operation on the connection will not
proceed.


> - tcpdump shows everything flowing as it should: after the TLS
> handshake an encrypted rpc NULL is sent to the server, which
> immediately responds with an encrypted response.
> - For kicks I played with timeo= but it still hangs, until the timeout
> of course.
> - Verified the encryption algorithm being used on both sides is the same.
> - The data suggests a race condition, and the order of some events
> shows lots of threads competing.
> - I modified openssl to enable "openssl s_client -starttls nfs" and it
> successfully does the handshake with my server and waits for further
> commands.
> 
> I put a bpftrace script together to track what is happening in the
> kernel. It may be incomplete as this code is mostly new to me, but it
> shows some interesting things. You can search on the sk addr within
> the traces to see the flow.
> 
> First, this is a typical failure. The exact order of mount.nfs & tlshd
> changes but does not seem to make a difference.
> 
> 20:02:04.080574 [2087568/0xffff8fbbd7bc1b00 tlshd]
> tls_sw_strparser_arm(0xffff8fbac3c99300)
> 20:02:04.080585 [2087568/0xffff8fbbd7bc1b00 tlshd]
> tls_strp_check_rcv(strp=0xffff8fbb4a20cc58) sk=0xffff8fbac3c99300
> stopped 0 msg_ready 0 stm.full_len 0 copy_mode 0
> 20:02:04.080606 [2087568/0xffff8fbbd7bc1b00 tlshd]
> tls_rx_msg_size(strp=0xffff8fbb4a20cc58, skb=0xffff8fbae0a37300)
> 20:02:04.080616 [2087568/0xffff8fbbd7bc1b00 tlshd] ->tls_rx_msg_size
> (tls_strp_check_rcv) return 255 [0xff]
> 20:02:04.080619 [2087568/0xffff8fbbd7bc1b00 tlshd]
> tls_rx_msg_ready(tls_strparser=0xffff8fbb4a20cc58)
> sk=0xffff8fbac3c99300 stopped 0 msg_ready 1 copy_mode 0
> 20:02:04.080872 [2087568/0xffff8fbbd7bc1b00 tlshd]
> tls_handshake_done(req=0xffff8fb9ffce96c0, status=0,
> info=0xffffba1144697888)
> 20:02:04.081035 [2087562/0xffff8fbb55303600 mount.nfs]
> ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
> 20:02:04.081047 [2087562/0xffff8fbb55303600 mount.nfs]
> tls_sw_sendmsg(sk=0xffff8fbac3c99300, msg=0xffffba1155e2f5b8,
> size=0x2c)
> 20:02:04.081053 [2087562/0xffff8fbb55303600 mount.nfs]
> tls_get_rec(sk=0xffff8fbac3c99300)
> 20:02:04.081063 [2087562/0xffff8fbb55303600 mount.nfs]
> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9eb80c800
> 20:02:04.081069 [2087562/0xffff8fbb55303600 mount.nfs]
> tls_push_record(sock=0xffff8fbac3c99300, record_type=0x4040)
> 20:02:04.081127 [2087562/0xffff8fbb55303600 mount.nfs]
> ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
> 20:02:04.081181 [2087562/0xffff8fbb55303600 mount.nfs]
> rpc_wait_bit_killable(key=0xffffba1155e2f690, mode=0x2102)
> 20:02:04.121474 [ 0/0xffff8fbac0321b00 swapper/2]
> tcp_rcv_established(sk=0xffff8fbac3c99300, skb=0xffff8fbae0c96900)
> 
> And there is a variation that is equally baffling:
> 
> 20:17:01.400240 [2109186/0xffff8fbbe8928000 mount.nfs]
> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fb9ed70d000
> 20:17:01.400245 [2109186/0xffff8fbbe8928000 mount.nfs]
> tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
> 20:17:01.400272 [2109186/0xffff8fbbe8928000 mount.nfs]
> ->tls_sw_sendmsg (__sock_sendmsg) return 224 [0xe0]
> 20:17:01.400288 [2109186/0xffff8fbbe8928000 mount.nfs]
> rpc_wait_bit_killable(key=0xffffba1143713750, mode=0x2102)
> 20:17:01.400863 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tcp_rcv_established(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
> 20:17:01.400876 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fb9ce618c00)
> 20:17:01.400880 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tcp_data_ready(sk=0xffff8fbac3c9e880)
> 20:17:01.400885 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tls_data_ready(sk=0xffff8fbac3c9e880)
> 20:17:01.400887 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tls_strp_data_ready(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
> stopped 0 msg_ready 1 copy_mode 0
> 20:17:01.400911 [2109207/0xffff8fb9e6aab600 systemd-udevd]
> tls_strp_check_rcv(strp=0xffff8fb9f085ba58) sk=0xffff8fbac3c9e880
> stopped 0 msg_ready 1 stm.full_len 255 copy_mode 0
> 
> In the second case it looks like something (the rpc null response?)
> was received on the socket and discarded or ignored.
> 
> In both cases the mount command is hung. ^C works fine to terminate
> the command and will show various return calls as it cleans up.
> 
> Now compare that to a trace of a successful mount:
> 
> 15:25:55.912868 [1847598/0xffff8fbb46ea1b00 tlshd]
> tcp_event_data_recv(sk=0xffff8fbac3c9e880, skb=0xffff8fbb3c06db00)
> 15:25:55.912875 [1847598/0xffff8fbb46ea1b00 tlshd]
> tcp_data_ready(sk=0xffff8fbac3c9e880)
> 15:25:55.912879 [1847598/0xffff8fbb46ea1b00 tlshd]
> tls_data_ready(sk=0xffff8fbac3c9e880)
> 15:25:55.912881 [1847598/0xffff8fbb46ea1b00 tlshd]
> tls_strp_data_ready(strp=0xffff8fb9cca31958)
> 15:25:55.913076 [1847598/0xffff8fbb46ea1b00 tlshd]
> tls_handshake_done(req=0xffff8fb9ce43f480, status=0,
> info=0xffffba114252f668)
> 15:25:55.913151 [1782955/0xffff8fbac2389b00 kworker/u19:1]
> rpc_wake_up_task_on_wq_queue_action_locked(wq=0xffff8fbac93cf000,
> queue-0xffff8fbbc1283258, task=0xffff8fbb7401c900)
> 15:25:55.913173 [1782955/0xffff8fbac2389b00 kworker/u19:1]
> rpc_make_runnable(wk=0xffff8fbac93cf000, task=0xffff8fbb7401c900)
> 15:25:55.913306 [1847595/0xffff8fbac083b600 mount.nfs]
> ->rpc_wait_bit_killable (__wait_on_bit) return 0 [(nil)]
> 15:25:55.913318 [1847595/0xffff8fbac083b600 mount.nfs]
> tls_sw_sendmsg(sk=0xffff8fbac3c9e880, msg=0xffffba11425475d8,
> size=0x2c)
> 15:25:55.913359 [1847595/0xffff8fbac083b600 mount.nfs]
> tls_get_rec(sk=0xffff8fbac3c9e880)
> 15:25:55.913369 [1847595/0xffff8fbac083b600 mount.nfs]
> ->tls_get_rec(tls_sw_sendmsg_locked.isra.47) return 0xffff8fbbc1286000
> 15:25:55.913376 [1847595/0xffff8fbac083b600 mount.nfs]
> tls_push_record(sock=0xffff8fbac3c9e880, record_type=0x4040)
> 15:25:55.913415 [1847595/0xffff8fbac083b600 mount.nfs]
> ->tls_sw_sendmsg (__sock_sendmsg) return 44 [0x2c]
> 15:25:55.913470 [1847595/0xffff8fbac083b600 mount.nfs]
> rpc_wait_bit_killable(key=0xffffba11425476b0, mode=0x2102)
> 
> 15:25:55.913661 [1816987/0xffff8fbb40755100 kworker/3:2]
> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
> msg_ready 0
> 15:25:55.913677 [1816987/0xffff8fbb40755100 kworker/3:2]
> tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
> 15:25:55.913686 [1816987/0xffff8fbb40755100 kworker/3:2]
> ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
> 15:25:55.913690 [1816987/0xffff8fbb40755100 kworker/3:2]
> tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
> 1
> 15:25:55.913699 [1816987/0xffff8fbb40755100 kworker/3:2]
> tls_strp_work(work_struct=0xffff8fb9cca31978)
> 15:25:55.913702 [1816987/0xffff8fbb40755100 kworker/3:2]
> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
> msg_ready 1
> 15:25:55.913717 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_sw_recvmsg(sk=0xffff8fbac3c9e880, msg=0xffffba1145fafd68, len=12,
> flags=0x40, *addr_len=0xffffba1145fafc2c)
> 15:25:55.913724 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_rx_rec_wait(0xffff8fbac3c9e880, (nil), 0x1, 0x1, (nil))
> 15:25:55.913728 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> ->tls_rx_rec_wait (tls_sw_recvmsg) return 1 [0x1]
> 15:25:55.913732 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_rx_one_record(0xffff8fbac3c9e880, 0xffffba1145fafd68,
> 0xffffba1145fafbc0)
> 15:25:55.913736 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_decrypt_sg(0xffff8fbac3c9e880) 15:25:55.913748
> [1830424/0xffff8fbbd7bc3600 kworker/u20:3] ->tls_rx_one_record
> (tls_sw_recvmsg) return 0 [(nil)]
> 15:25:55.913752 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_strp_msg_done(strp=0xffff8fb9cca31958)
> 15:25:55.913754 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_strp_check_rcv(tls_strparser=0xffff8fb9cca31958) stopped 0
> msg_ready 0
> 15:25:55.913766 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_rx_msg_size(strp=0xffff8fb9cca31958, skb=0xffff8fbba6a53600)
> 15:25:55.913773 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> ->tls_rx_msg_size (tls_strp_check_rcv) return 255 [0xff]
> 15:25:55.913775 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> tls_rx_msg_ready(tls_strparser=0xffff8fb9cca31958) stopped 0 msg_ready
> 1
> 15:25:55.913781 [1830424/0xffff8fbbd7bc3600 kworker/u20:3]
> ->tls_sw_recvmsg (inet_recvmsg) return 12 [0xc]
> 
> When successful, "mount.nfs" does not start running again within these
> traces, but kworker threads handle messages correctly.
> 
> Any insight would be greatly appreciated.
> 
> 
>  -Steve
> 


-- 
Chuck Lever
