Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955A21A45D
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 18 May 2025 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578448; cv=fail; b=OaEd8N088SbxM4uLuYRhP3Pr14TTt/nacXSa4YNsJxZjnjJlJqK78dmc4OcDgOVZiZJn94M57CS4Bq6J2W6yuW/G5yVCfKTnT3JV9SmrHjWT0KwyAlls7l8QgMCB41sF6LhiQRB4fT7FoBTBtUqDPumkL1KhVUscd6eGG0bR62Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578448; c=relaxed/simple;
	bh=vIf+bJ+FG8cRyjckWOUSbg/lkdDJuD3gNR4ceT2+80w=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=PVEaDkkKBK3EALP7JvehP+iqTpd1bWSJhHlR0m/LYZH7UfIY6ZGa5qAIFd94Z4pVc6yz8gOaCkneojqP+stFAxw9ePDVFy6c2RNx5CdXC+jthml+jmoWNTsIEdp4PbodaharNemf5/GcEYU6iES2FJPpPzdoc5YsrjNczZw3i4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M+dqfS47; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fKndsc4A; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M+dqfS47";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fKndsc4A"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9Mvad014454
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 18 May 2025 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=B+R7+mQVjbRWKaDq
	BLneqeGEH1qyAXA822NXH/1LwqM=; b=M+dqfS47y8g1jJG8JKGJm0A3buhaFenM
	dEO+NiSWq03J7owgmXyWvT+Gs61BuIYqXoEWtJNSwdqBQsmsDylqJjsVVbwC+Vah
	Knjs1U1HgRj+pumVN5VCbfi9JSq3AYnrgmSRwdI0w7Z/X0/G2Lpmf7zQd0KPFuGi
	cqVNhpw+t+10Ccb8cyVDUQ4j6FrOxnulb8owvp69oPdfmIo3SUFBxgI7AgZlB2Cw
	CeA12Yd1Kubm7TJgoUf6RsuIArpt9ZFcx/BLMfLvMsgoeH0b93093327ur99A4+b
	aiVm5H2m0eOI3yfdCV+3H0Nl/YrZTpKSm6EiejNi3QheWSHqCD4j5Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ph84hfn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 18 May 2025 14:27:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54IBmJUw035084
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 18 May 2025 14:27:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw6ky2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 18 May 2025 14:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix1LUHjNvTYLO43Q+QuxdIvTqpykQp0HmuORGdtGfTpBRihno7c60RmvA6Dofqog/yur9LGipZiwd5IBAI5+c9eyXR6HTuf9tq60Ky6ds21wqUTVKhwTpwZ9eQsRSlNHnycO5RU83EApbCbmqDqwhDekMU1zwE0oFbu8Mgn5q0bU7QTd3b7QH2RaLX4m+vp6pPn9fI5ZUHqlteHOxjMYG3jhc8l4edZRCkGU8BXyR2XYh5sIESDA9gIKSe4Y9R0DB/i9+Yg3tctQV3Y0tx4Iev/zveMnCIgP1PdmQQXrq8xGnk5JDzPW6VYDvfO3JUz8Yd6MmWsoaLx+iRxfCb2Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+R7+mQVjbRWKaDqBLneqeGEH1qyAXA822NXH/1LwqM=;
 b=ovQWFjiwj6XlGv/lenoz3XWGaNa5oNBnrmrwdZ+xpLi2ye3ZUxG+EvfuFMIqdwyMzltNnPRSfkMb7bnEzIcWW1WsX0+DLfyMFomuxz9n+R1+I8YmT5etpZMrm7Xu4eVTDKr7NLvoCEAB5Np4bhtj8F9SuZ6HZ186ICP0H/tiHNIrszzhIeIRKbKLLAH0CRx82G5P+KhTKX0mVArnkq5X5bKS0zFCkzCvstHSItlZv3PX4XsBtcFz89gAscgasUBHZ7bZ0C6yGTeILj2gwwFqa9bCb6C3EP42/83P1lFTLaNIzl1JxfsRz8rEzcvx+ZZSOhfhVq6CNNbQOadgV1dRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+R7+mQVjbRWKaDqBLneqeGEH1qyAXA822NXH/1LwqM=;
 b=fKndsc4AUVqMA51bhSOdRhy/wvzA5Ds2eUShhjlysCIxiIcIE3IF6T8F67NoTZeSR7RwvIatjV7BW8ABuUSramTJefl0fHfgerKyqWShefaftY1hoxq0DFGHnXGKu0ricCOcgXDNvkpGT2JWxu2odJIi/1/l0+CQA6cUJ1IPha0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA1PR10MB7635.namprd10.prod.outlook.com (2603:10b6:806:379::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 14:27:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8699.022; Sun, 18 May 2025
 14:27:19 +0000
Message-ID: <ff4a1bdc-11da-4a2c-9012-19f6f8045827@oracle.com>
Date: Sun, 18 May 2025 10:27:17 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: Let's Encrypt ends the use of "TLS client authentication" EKU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:610:52::23) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SA1PR10MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: e437d22a-1c4a-42a3-99a4-08dd961818c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVBBemttNU1pMWYyYUJmNUZVdkpOWnlKakh4bHZsSXJVRVpmZ3BycGc3d0l0?=
 =?utf-8?B?MzQxcGpORXRHaGdWMHU4M1MrUk1aNGVLUExjaG9ySHc5QUxKdWxuZFUwYVNV?=
 =?utf-8?B?UEtmUW1mNi9ndnAvTVJUYkRITWJYeEpiZTRzT0FDSklMbXFWTTMvN1AxWVlk?=
 =?utf-8?B?REZ2SC9sZ2xYdVp0NUJRUTY1TUV1YVFldmp6RTFZc0VXQmUwdytoS0dCVUha?=
 =?utf-8?B?UWQ4VzJSWGxpRkpORUVEczZEVzRMUEI0ZGtBOEIydUs4USttWnNYVld3d1dk?=
 =?utf-8?B?TXBPSzVZTE1nVDR0RGtlVWd6SUhjMWl4eWM3QVBmNkNtQ3JsNnFZQ0dVSHQ0?=
 =?utf-8?B?SDdrSDVsTURFVEx3MkFHZ3Urd0ZjVGdmUnJrRlZlUGVSTG1pbzI2VjgxNnBZ?=
 =?utf-8?B?U2FzVThGbUpuR2VCNmErbWh3ZWRKQUVnM3pPYXcwTEkzaWhvOWNzazYrbHRu?=
 =?utf-8?B?M2hsY2R6cHlQZWtON0Q3ajhtaDJhQ0t0cG9EVTB5bGc5Mk9Ndkc4NHFUTjFK?=
 =?utf-8?B?Yzc3d3VqOGNnVVQrNGloU0phMWRObGJYbGdEaVBycWU2dTI0WnhaYUtTSkJV?=
 =?utf-8?B?RU0vcW1vTEpnR0lzQ29yU2lxVkM3Zy81Yzcrc3lwWGdlcTFLTkpsSXV2bE84?=
 =?utf-8?B?VE4vcHRHV0JFRnNhQXBXWU5HR1B4ZTJTOERVMmpGNHJsM2tCQWFRNU8vS0hq?=
 =?utf-8?B?UEZYUTd0UzhqbmpsYlQwalM5ZVROZ0RSaFN6OGpFYitMby9xUDVGamZ2ejNl?=
 =?utf-8?B?T2dlYkpzdkgwZG5GSGNYL3NQT0FMaytZY1VpeXNsT3U0UUNqdXpvSUFiUEE2?=
 =?utf-8?B?Y1hiVzVrM2hFKytqOGJqUVpESGFiendmUUtoaFlFbUhwUjBCTXVGUWlSSHhq?=
 =?utf-8?B?a3lYNEVoeENNNU9HZWh4dnZhaXdoRTBIY0pSRmNBUEprZVEzK1I4WWE0VHZY?=
 =?utf-8?B?aHY3SnRkVG9vRGVEUjMwYUNsZXZqdlZLaWdCamErNFdJaVRhVy9BanpGdTZp?=
 =?utf-8?B?MGdmVzZld2JSWUt0OXBud2RsVmZYZUVjRDJaenJzeXJwalFTUnljMGR1L3gw?=
 =?utf-8?B?cEh3ZkwxV2ZCbGtlV215U1Z6Z0k2Y01EMzNIdUpaMldxbDZGZ0NQcGpXU1F2?=
 =?utf-8?B?UjUxYzVacEtZVGhLeHlrYVFIckV4ZFQ1QkFmdU1nOFFUVzJBWXN0ZUtQNFlx?=
 =?utf-8?B?cWpLTU8ycmxXcnAwWVBrTkZ4Q1dkU3BGeG4xclNrc1VqYkE5K2JaYVBKd1Jz?=
 =?utf-8?B?YjVjZ2c2L2pzYkNaT3d6U0xrK1ZLNVpQeHMwVHJrRlFwRmN2OUdZWGlzM0xK?=
 =?utf-8?B?Tk0yUWtYeGh6ZXRqNHF3T0doMnlOcllIM0hBR3ZaOFVHMm1wMUszTkxNYWRq?=
 =?utf-8?B?OUhyTmx3K0J1MFdGK2Z2RkJFc3diU09OV1dmMEE1cXFDa1FtaUxVUFFGMDRR?=
 =?utf-8?B?cGJLR05BTzJiMUIwNHRhNmJOSWNoOFZqaXlWS2Q0MlRGTlQyVWNkbHYwaGpu?=
 =?utf-8?B?a0Vlalo0RFhwRWQvYzFoZnIrV3k2N3R1R3pxRmQycjFxTWk4NW5OVCtDbmhr?=
 =?utf-8?B?Wm5SdktLWjRlZDc5emUrREpjQUtDL1FNNlp5U2VOSHR4S3N6Tnp0ZlFSdThs?=
 =?utf-8?B?TnNSdHNZNGlCeGRxbXRDZDFmNmFyUjZzQnpkT1VWWjdVSTdBaUJiL01DNCtE?=
 =?utf-8?B?Y0V0Y1NPMmlobXJlalJwUXhnc1Y0ckt3MHlGVy9jN0txazJaS2xESEJ4UEtt?=
 =?utf-8?B?aVNQRXIvbW5RWS9sN2xMaGJRUEJyOG9LeGZocUJsSEpZOWZYK0J6WHZQWG9z?=
 =?utf-8?Q?QJqDz8Dh17x4BfTu9YLmr65iYxw/0MufoM7p8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZWUGU4YlpMZFkrcndRaVZsZmdpQ3BZY1BkRWFpa01VOWw2UjVHNHVBNWlj?=
 =?utf-8?B?Vmxua1h4bS93a0grUnpPaWsyRFJCUEpOSTlaTkwwTXVtV2FmYzZLTUF5a2dm?=
 =?utf-8?B?SzZiYkN1SmxBZllndjJmMGVUaXRHRmtrTDJzYnFFYnR4VThHMjA4MjlYMWtM?=
 =?utf-8?B?UDdiaE8xQitCcnBVUU1CZUY5WndmM0xsUmduZHJBRHJoUzlOY1Bxand1ZDds?=
 =?utf-8?B?bW1YUGNjWmdKSFNJQnhFS001MjVXY20wSHFSaUs0ZFFSMVhVU05zQklDU29t?=
 =?utf-8?B?U2dCNllKY0cxTUZmVmxOb0ZsN0NkQTVPWHpWbHQ4aEplVThCakxwaGtObXFU?=
 =?utf-8?B?aXZVZjhyL0MxcXRTeUhCV0JTcEZSSW8rZHhvb2Q3ekxMSGxRT1l5UTNQb01i?=
 =?utf-8?B?bUYvR2NyclpRdkxEL3BzbzNXRUFrSEJXc1JscTlFei9UOU15UmUrUkRyL2Nr?=
 =?utf-8?B?cm9qa2s3ZFo4SExMUEhmcDh5S0dDRjQxL0NCa2JwalQyTXlzQ2poanVxcDR0?=
 =?utf-8?B?YVJUQzBhSzdvTnNML3J3S1MrRExhSHZyY3BlbnVCaWpVcjFETHhOUDNIcGVl?=
 =?utf-8?B?SEFLUndKM0xtS2hqRnc4UnZpMDIxY3VhZno5aHp2MnNvMjRWQkYvVUFOTTQ0?=
 =?utf-8?B?U21CMlpZb29PQUExSmkzMXBxU3BXQkdwQUIxTjNZY0xENWNrWCtvT2Q4aDJp?=
 =?utf-8?B?cnM3QlJHTmFQRWNwczREblVVazVod0kyK2YwNzh5R0FqMjdLNDRBblZhY1ZE?=
 =?utf-8?B?L1o3WENHNUdFMi9uNTFmK2ZPWmpPQUlFOWhPVURsd0htZExhalRxaDhObjk0?=
 =?utf-8?B?Z3NQV0JKVEE1dTJnZmg3V2F6eG9ZamxVUnNRZWZHM2I3Mk1sWUlUcmZQYnZy?=
 =?utf-8?B?Mll4OW1aZFZRSlJIYkVNZDAySlhZQXdEeUkxOXQzTEx5U0h4VjZ2OVVPVWpz?=
 =?utf-8?B?NXp1WXFrQkhZTVc0bFFITFc2eWZ6RGlLd0lYN1BOOFVHUFIrS092R2t6SFpr?=
 =?utf-8?B?aXZmNFBadEdmUmF4OXpyTjgrdGFyRDVES09tOTgxQXV1SmtIcVMzSytLNHNJ?=
 =?utf-8?B?WVcxd0xuZ2ZYL0FxVks4Tjk2NzMvZTJSQlJjWU9VdXpaZ1YzRHIvNi9tOSt6?=
 =?utf-8?B?OUtqSVl3K2d5VnA2YWdVQVBpS2xxeEhkeVhyQVpPSklNY3UzOG9URXF0bUJp?=
 =?utf-8?B?M0xadit0a3gxZU9HMnZ6eU5UQXZXRFZQNHppcTF5SWxsdGtQWGliODF4L3A2?=
 =?utf-8?B?QXRTZVBIRWhNUnhIYlFpdFBDb3JnMG54dkZyb1FmUFJ0U1BXVDVIMWlFV1hG?=
 =?utf-8?B?MTNsSU1mRE14MDA4MnlxeFFYdFY2L3l2cFRZN0V1TWpCRUFGeEpCT2s5V1Fm?=
 =?utf-8?B?UUtVcWN6VVY4SDFoWENTVXFwTkh4M3hQTTlwcVhIamFGT3Y2TnJTallJbHkw?=
 =?utf-8?B?bk0vZ1hoOHNsdGNxeFQ4SzQzeFIxR25qM1lBc1lTeVlScVRIekg1dnl1SEZF?=
 =?utf-8?B?VE5MbHZxcTYxeFFNSkNZaXlIWVhSeXd2WUNDTzA0dGtHT0I5alVRQWtmd2pR?=
 =?utf-8?B?SjVBYWY0cUZCVmw2VUhBOU9pc25wQlZSdEh3YlA2aFIwNUZrcDROZWxCcEM2?=
 =?utf-8?B?Q0V3TXdZaml1V0dvR0doR2VZTEpCOWtIaExZZDVveVNvaGdHRm1RRlhZNFpW?=
 =?utf-8?B?SkRkOTZMSVZiTnltdkVRT1NreS9nRStHKythRFhFeCtYVlRvY2lINDVhV3Qz?=
 =?utf-8?B?NzBWRVQ0YWUzemJpVGxDYjFxWCtZekVZY2o0RVJqU1Vwd0FZbkNWQnBEeEdY?=
 =?utf-8?B?ZzZ2UG5NbFFvaXpjQlI3cnNCYWdDU210eldVQ2Rhc2dQU25PeFpxWHh4V29n?=
 =?utf-8?B?QVNCMEZoemdCYkFuOEZQV2VmOWY3eUdRcUJxZDV0QUR4ME85T3FmRUtRbmJq?=
 =?utf-8?B?aDByMERHTFI5LzdTSDF0N0pSZEI2L2QxbDRhVVdSU1dWUGtvODFaUHJFLzlV?=
 =?utf-8?B?elZxMmdOTVE4ZVhCNkVPSkkxeWxHeGUrVmsya2xpTDVRd3FhdUEzb0phNmFs?=
 =?utf-8?B?b1RiK3JoYzJrWUl1cjVmZTJkdE1MeDYwcmVCRkZTZnRsa29wT1g4b2pLU003?=
 =?utf-8?Q?q2gibNdYxSuWHgKtfVq2kh+/M?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ersg/dIOYWPu22cefyJPjLMFT5BxxilpUIYEbwehZgzSCA43+XaVf93h5qXC3lLyoSHau1EhvS8Pp39oZSrz+qUfIE/2c4I3VwQO9OzgnmndmlbEuNOcCRIaPDzaDXwICeG6xu+AheqQ3tFXoQCvMxNWUTohtlnxkNSMKt0zwde4jcYGSCB8JNVPXSMsf98/FMulwZ5F8Uzv1B7GUUNbU79e2gc4IOaIzRrcQcS/Dlvz6iCBeEiFsv9QVatU85+t+oaaSpPLKc8AgVN1r5TP8BCCSs85HRUqPXmS2epDTRSoEThyhkZW6YDsgzKSQauNHJ2WbbHjtMaklKDGHm7CzBS2cxQ5qjjmlQw1NMVl4b1Zo19mx9und0t4zDjM+bD8DyEblDaH6YwJLDwtskKAxS7m2NKpmUhkpPjinl7zxDr554eRkYgnDcvzfuo97/snxyUNJ3b+/yiYLJ+tikoL0qhhEOek5FYiP5hBRO3lgfRUYRg3uj5hfddKi8Pc//qi3EkILh087cIFbk0x4rg943RGWgLMYZNOQ0hNlCE7V83y/F9+/kq7JRyqFjNo1ixmIylvMAVAWhZLSv8Rv8r7+CSyDVnghVnbkGm46eCIPUc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e437d22a-1c4a-42a3-99a4-08dd961818c6
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 14:27:19.7399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/JomysvtE2QfT4mzayDu9Hl7CTogQAT4/5063F3pE/0ZdqbeTWg/mzWOWKry/K0S7VRmFmb1diar2fJ1lR3Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=549 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505180139
X-Proofpoint-GUID: 0Mmm_1o5hU4V9ajfUeZafQuEFnp4Jjx0
X-Authority-Analysis: v=2.4 cv=YPSfyQGx c=1 sm=1 tr=0 ts=6829ee4d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=9jmlPmk0AAAA:8 a=iDH0FANdD411kMYGGVAA:9 a=QEXdDO2ut3YA:10 a=7Hos59U20TAA:10 cc=ntf awl=host:13186
X-Proofpoint-ORIG-GUID: 0Mmm_1o5hU4V9ajfUeZafQuEFnp4Jjx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDE0MCBTYWx0ZWRfX8AY0BeOqm6XK d3MhtUt6anqnDY67bzfg5pcsvg/h7FfWidNBg3QA4dzMyKcuCsCWusZ/nkOz7OHRqDohZMsCW27 023l7H978GEUHNkvvyZqc+KUE+8H4ctbYKuq9tb8JnBUstd1iz5TRMnnHBLw6lAk+y2SJee2C2H
 kX/09WvxG+vdGtvVbqRboSB9/hUleQXz1QcvxyyCDgZ/O6CNNIW0aJOoPHbgWBIEznNHrRx7kuv GCJNxZicQxR0zxDu3/P3MvRfoPuWAw2uL3+wRMxiyzTfxzvf3dh6lW2d74mbMLwm+AUhpu7SgRg p4qDrNXhcRep6B8xpQivLQvnOOuhQXvxbk3ST/dEFeki1Ij54TCHoVzA4Kg4yfcYJnivv1ohHEJ
 TRvO/OEiclkUgDUyQ6EgWnfYni5wROEL7hnLRQwJ8k83uPELschym+nYKCOmxpvPU0SpZREE

AFAICT this does not affect us directly, but it's an interesting policy
change.

https://letsencrypt.org/2025/05/14/ending-tls-client-authentication/

-- 
Chuck Lever

