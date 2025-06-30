Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2724D72633
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 30 Jun 2025 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294614; cv=fail; b=BY45FqNo2mIWwfi/TIvJDDo/V/jWZs0LIDRpQ6ANtchXg8we8rwmEw1SbLMpvpGNtcBx9XUJO3pzhB+508tvgIUv+jB3zW3aKYAbnBKcyIcW10E07ou+dZT1wgGf8LSvx5R41UhOGTipX6+jd1eq5GhpbB5UXYYv3NYji9p99Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294614; c=relaxed/simple;
	bh=ooCFOKonx7PyVs8Sayoqv3dvW+po9xr3xMMtA1HSzGo=;
	h=Message-ID:Date:Subject:From:To:References:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=f1YbwtrSB4IV1a70MMTQ/aa3IhdnfF+31XoneBH72QxqQnJTF8wucFR00IRxxC0dgKCZ1IKMAQko4DZbIX+NTNOxkWKDdNuK4vFAHMsS0cbeui35NDEVKFat3VIR29HwxHPiu+Td99v7x3OAkCql3b2I8FDjM7qW6hC5FVwTkH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SXWlKxFK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hi7aMT2X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SXWlKxFK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hi7aMT2X"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UDfgVQ016449;
	Mon, 30 Jun 2025 14:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=66pOsofXzKwtIM3Qi033I0qMW4Zurf0xuP6atROBNQY=; b=
	SXWlKxFK8bZprvVx7hHTbiPtJRTSI0iXUqxBQpFwf0TB3u9PEBmkxTzeZkcrRQ+m
	7vtXgAgJzDfWIkrNrogXRaBVy5/oc7ikl3s8+rIwidRWuT4h9QZNEGAsSPNx+7G5
	pFEzlOwApelor/ECnaUiS303Uekh/60Qulqb/ogu0WGs/Y3q4sNiWSshmVZcMyxM
	GiO62V7g1cRwOX0YhM1xMpwBpvpd3u6GaOkmDnxSFsi0u99KmXxHCYONq1RTVeub
	FDYbO8C6FMYCbwwO56y/5Ssix3VdrQSGzNHNAhOzPpkhyhMlZAB5YKFFufrlYy4q
	LX6UOkeohSnbEj664DCCmQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7t08t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 14:43:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UE5kF3011643;
	Mon, 30 Jun 2025 14:43:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u86dh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 14:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tul+MmdI0chd/N7juslDEm63kZceMA/oJC8HQE32VVs3yseBtNwR7aDi5LPpZ4ZF2nNKvocBinOWGo1NcSfWZfUS+s6ORcakifUwqHpSXRmd9eO3yjA8PFquHfNjUuII0yVBljgnLBEwhpLL7XTDew2uSRbn0sHRvOVdekuJqLGFj6U641Px4m9kHTiB8maUe22JxVA42jRbH6kVdD0rbEaxVT5FkWHL8aLomD2Xs21zgDrwTdRnGCppjj3BkbvLXei38/GH1dFaVnsbE5BdPlnL6/MzJTdq7L+hokFplmy6BDhqus/Q70JIUY+lM4y8m0ZYq94AK5wis/fOlgJNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66pOsofXzKwtIM3Qi033I0qMW4Zurf0xuP6atROBNQY=;
 b=lCgW2JfBUu6vPLkG4YRxLfjhnyAvxzQESDrf3Gk56IyAHH4c6wSYbSIuklXOdru8tdPZa7RQA7tKg7bAU4m9zCwie3cJNt5i+LTYobvYUdMYNpHUEhxNTBIY9qVe4yLYodfjtzl/xyHx67cQmpR0SroymMZ5oI9lNdGTdC51i8YQmNBqKNTgy8nU2RmPdR6cYcawslAXRH8buuwyFvD2prcDbqhK2BTTDugylNofui4SP2xp0Cx3zEq53qhhKAIGNi2aBLI1k9GM6zhcS0wPr7k31OpS1S53z0EqwUZEkMPEFYmxfoQgL4G10hNkE6aKM4TzLleb7x9hzVtsRV9v6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66pOsofXzKwtIM3Qi033I0qMW4Zurf0xuP6atROBNQY=;
 b=Hi7aMT2X6D/pf9kn9iHhdE3O7vCw7Z2QQFwxiWbogVySsAOXg3ZWdVa8XLTKaJP8tI7P+lJYGDRCAaAWqrJw5nQnk9GxExmMU4Ha7OwJaL5XgPHKYAUNfyHrO8zabQ5/TIItXPM0mP0nV394LW2B1Zh/A2Sc4hwuSau820OAtIQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH8PR10MB6386.namprd10.prod.outlook.com (2603:10b6:510:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 14:43:26 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 14:43:26 +0000
Message-ID: <c2a449f0-74db-4dcc-9c99-f1db16e07743@oracle.com>
Date: Mon, 30 Jun 2025 10:43:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: netlink 'keyring' attribute
From: Chuck Lever <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
References: <de3eebc8-26f8-4d91-92bd-9f37b54649c5@oracle.com>
Content-Language: en-US
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
In-Reply-To: <de3eebc8-26f8-4d91-92bd-9f37b54649c5@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0054.namprd14.prod.outlook.com
 (2603:10b6:610:56::34) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH8PR10MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 3492a910-973a-4d06-b3c3-08ddb7e478b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlBabVFnNVFyQ0ZNajdCY2RxNW9CSk9NRnlodWp6enJiRE5mSFlMeUpvMzRj?=
 =?utf-8?B?RTd3WFY2R0Fhd3Z1UFAxZVF5aDFoSXAvUlJtK1NrYklyTVZFeC9lS0JvaFBW?=
 =?utf-8?B?TU82WHVjUUVwSTVkSEJtbzZMeUNRaGJQQmVCc05idVNHRUJnRDZFekk1ckMv?=
 =?utf-8?B?UStPaUFxR28wdk9iZmw3MjVydHFXZW9BejB5WjdBWFY1WXhNNjZGalg3WG55?=
 =?utf-8?B?SEJXZ0krTHEzajQ5cDJUbDVRMUxSb081QmN0YkNqSEFjNFVsRHVGV2oxWlgy?=
 =?utf-8?B?NndyZlEzZ1lHMi9HVkxlTHlDM0pBZkZ3VElBdUxYS0RSOFpyeGF2Y2FxSjdJ?=
 =?utf-8?B?WGh3bWxtVEVzWEpNdkRhR1ZJMU1qYjEvM0tZcHhkb3dRTHdmWTBEczRTZHcx?=
 =?utf-8?B?bGZjVnlYd0xXSWZaVkY0SG41NzBiWFJTSEcvMGZGais3a21iM1AwQkh6cCs5?=
 =?utf-8?B?TllSYjQ3MGtCZGZOOERoYnFOa2NRdW40ZVV1dVVhN0VneWc5M2NvMFZEdEFs?=
 =?utf-8?B?WTJKcXlDN1ZvRTU0MEoyd0VlR1V0aVpKc013N21QVk42RFJsMmFNdVNQSGY4?=
 =?utf-8?B?ZnAxd0cvd2o4L1FpdUEwYzQ5VlN3M0ZRYm03eUxKRm55S0pMaFhGWFZWbnA4?=
 =?utf-8?B?WFZGRjhuMnkrY2dFKzhiS3JiMHl3czB2b1Ftdy9UandoSzdNV2htUU1senZE?=
 =?utf-8?B?bkh5Q3dHKzZ3RzNhTkpLZnF6dituMGxTQjlkbnlacVZkV04zNmNtVlIvZHJT?=
 =?utf-8?B?VWdLUVErNFJZaEVhS3g0ZGpNdFZTejJDWk1XZ3JtUnE1QUk4RVB0dEFSUzRx?=
 =?utf-8?B?dWowWXcybnVLbmFQdFlabVE2NmhNbnhaZHUxN01tUTRIcURBVDZobTY1V2x5?=
 =?utf-8?B?UVVzT2lNUFZWUDV1b1NUTWpGUVhLTTFRMk81WUxVV28xK1FDNWdSWXd4VUpH?=
 =?utf-8?B?QUVFNlh2MGFHZjJyMmo1cDdTdjdPaTVZMDJ2d0lkUnpabGFaWVlzNE80L0NM?=
 =?utf-8?B?L0pDNE9iT1ZFZGx2ODEwcjNWb0NlMUNmYzUzMkNlRUo2eU9saG1wSmpGdGRt?=
 =?utf-8?B?Ykh2cll0TGQ4ZXlVL1MrMWtUQWQ5dU1DamgyN2lyZGVUekZUY1ZCUS9ka2pl?=
 =?utf-8?B?K01haU9iK1BWSUZwSFlpQVZEcXhFdkJyLzBoTkZNVkVFK3ZxNXZmV3JUbjVE?=
 =?utf-8?B?R3dMWjNOOGtNQWNLbXduMVZiWGZxdGlZVlNqRTVveUIzTmN3N3orMUFWeXRP?=
 =?utf-8?B?aUQrL0lRZkFHcTFSN3FqblJWMmg5VWROY2FaYTYvZDlFMmdhSVppb2dnM1hp?=
 =?utf-8?B?aVhYeFVpeWM4Y0NUNUFQcWFXNk9mSVdjVEQyeFNYZWNzVFc3M3NibXdPZFNa?=
 =?utf-8?B?R3hBNWQ4amZFTEozTk4vL0xiQ0hGclVaYmFteEkyMHcyeEF5aWNyWkQ4dUtL?=
 =?utf-8?B?R29WRmcrR2QyWDRhbVdMOGx6SzcwZ3R5NTMrSk5NMDd6YzZuZi90MGtXd3hz?=
 =?utf-8?B?aVNLQnk4bUVqOGh3Ymhjb2FrY3NTTG01Ky9IRlhnSXRCUlZHbEJUV1lFSXFs?=
 =?utf-8?B?TFhwc2JCSmpmdUNYQlJnYzVjZ09nZGtJM0F0SEVPdmYwSnVmOTY3T1p3M2pW?=
 =?utf-8?B?b2dDc0lYaVQ5OEJsWVFlZHhKcWFheVliZUhLNXRrR09KZGkyYzNObGR3ZEYz?=
 =?utf-8?B?ZDRBN3l3Qk5JUFF1RDVIa0lEeUMzRkhDMGwyOUpzZUJOOGVUNnBaT3V1MmFz?=
 =?utf-8?B?dlpzOUh2YmpBeVdRK0ZTQ2RJcnVzRkhGWjljQmk4SDZTR0NNT2hjbWJYaW5I?=
 =?utf-8?B?cWZjQ2lFNjI5ZmVxWVEySEp5LzVqOFgzMlVLdFY3SVFOcklSWVF3dzBBZlVM?=
 =?utf-8?B?MVpTZi8yaXg3YXNpUnpzMUQzZ3lIL08zUktrbG1tQkErUllCTE9WWUlSUFBR?=
 =?utf-8?Q?RnaaR9bM4OA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmI5ckZMdURYVnRDRGZNWWY5MjZZNm5pNXNEbExSeU5OY1hWV0FuSUh5UGRO?=
 =?utf-8?B?ZHgvOWIzMzd5UnNHNEd4cjl3aCtrMXdnaE1oWTZVeXhIZE5IWWNGYktxUWdU?=
 =?utf-8?B?TGVLMXVIYjZUY2VYd0FHSlVEOXBvZCtxTHlwazNmU0lqRWM4Zkg0R09oTmd2?=
 =?utf-8?B?d2ZuRlJhekZnV24zMXY3eGZtemJtTkppL0pDQ3pJM1dLaUUzZkthMDRwdHpB?=
 =?utf-8?B?SVpsU1YvWUxRa3FZTnNRNldWNnQrM2pxSlpvNU4zRkNpV1dkUkFBNDFOUlV0?=
 =?utf-8?B?ZVhGdXNiV2lDQ3BLb1Y0ajRrM0VDMUpKaG8zdUNOU3ZKcUdtUXBuU094K0Zu?=
 =?utf-8?B?dGRNWHk2L0xMYVE4SUxNLzR2QStJVWVQdWcrUHRyYjJIbHI0MXZoSDNJeEFP?=
 =?utf-8?B?c2NjcmZKekl2ekdEQWk2dC9ZeExBaHNPOHVmVFlhRk1QSFE3TUlOVlA2YVBY?=
 =?utf-8?B?eUxKM3lJMnYvSWFvQUhuMDFjbHZ2QTdIMzhIaCszNnpYN0VmZndXaWRyeHFx?=
 =?utf-8?B?dllLS0w0WW9hZjVVeU9qYkdPMEJuQjZiR1NvbExnQmtrTllkampqZUk1WEQ1?=
 =?utf-8?B?WmZWUUhKaWs3VllaYnpYMkZNSDcxcVY4NWhqdVZ0Uy8veUFBMThXeCtyQlA0?=
 =?utf-8?B?SzJFd3pqNUhqdW92UGJqZklmTnQwZkIyNW01czEyOERBUFRSLzNuWG1qMWhp?=
 =?utf-8?B?NWxDbzJxVDRHRzN6K1VJUUQ5R1pGcXFMVDdheW91MWx6MFNjMDVoS3RiYmZo?=
 =?utf-8?B?RkRROWlHOXVMM0habXAyOWd2UnRYMXlIWUlyTk9YejZyQ295ZzNIYjVZaEF4?=
 =?utf-8?B?VkxlenZER2xlZEpZNGp0TUsvY3FuNDYyVDZjUUFzQmtDL25Qb05Pd2JDdGxk?=
 =?utf-8?B?dVY0SGsvWjdtbXVtSzhVRklVeVpWS3NuMWdpYlZINGZyZEtzTVBIbG1RRExV?=
 =?utf-8?B?ejlmMmR2R2JDbHFURSt2am9xTEtGRFlZVFMrS2gzV0VIeS9vTTZZeVJkbGI2?=
 =?utf-8?B?NDltellsRlhtTGtseSs3WGRNUkVHQlhpV1NzK2VDRzQrZ1NXTTV4SjNoTkRv?=
 =?utf-8?B?dkR6Qk9DZStnc0hYenZERndJQTZZbkNWVkc0T08yQXg0bEowbE1uSU5hNmpF?=
 =?utf-8?B?LzI0ZnhQQk9MeExFZnVqWTU1Zm5XRFg2MjJoRUc0SGgyYW9OQWE1Z2M0b2l5?=
 =?utf-8?B?Y0RnY3dtUEtEU1YyaWIxMG9Na2RXT3puYzM5SnFmeTkveUVSL3dod2k0RVNy?=
 =?utf-8?B?M2Izb2Q5d213NFpZaWRhSmRYQkh3N0J5b2F5dkhPdnV6bzRwSm5vVm1hZ3c0?=
 =?utf-8?B?ZmRiQmFuZXFHSFVJU0Y4MnVkcTZwc3dYVUpIVEc1b29HMmJ3NHMwUXZrZlpq?=
 =?utf-8?B?TmxwWHZBclo4eHN0c0p0SC96OE1HOTFsQnFYSEVIQUJXYkZCYzIzQVNiNVlV?=
 =?utf-8?B?U3hQeHErQ3plU3U2SFdla3E2WE4zWGZGd292RWV0dGEyUEZwQVlKSUM0eEcr?=
 =?utf-8?B?NEhqT0NmREdIZWMxVHgyRm9VbllJMFF1MTd3WmNheFMrSkZObjEzWTV1YSsw?=
 =?utf-8?B?V3dJK1JTQVNkdC91OEVkc3o2Z1AwRXJqMnFvVFhoMVcxSkNnZ2ljck94czZw?=
 =?utf-8?B?V0V3dnVEZkdLZEpMVFk4MWkwR0YyUDUzWUI2eXh1dEFveXk3NERSbmRyWTZS?=
 =?utf-8?B?d2pKZGVoNGYza0dSbkl0cVMrcG9KZHR6bmY4cDBYSjg1T05jQ1E2UzloZS9W?=
 =?utf-8?B?cjRwVk8zR3AyTWxxSHBUY0E4NWhpdEg3YUJCN1NMZStHMGt0V091VXVaVUUw?=
 =?utf-8?B?RTRIeUNRNWhrQ2RLa1FXNzZ3Szhyb3V4YkRsekxCalZOKzhkQ1AzMlIveSta?=
 =?utf-8?B?ZHBtVUNvOEE4ZlFYcHRNeVdZNzBSYzVhTVc4T0g1TWorczEvbXNLT0ZwcXhu?=
 =?utf-8?B?aW12YVo1K0tSRWJ2RW9YVDIzR3h1bTc1SThGTSs4ZmpDeC9QVENkWUpweHZW?=
 =?utf-8?B?SnhGUG9CcThrei8wRlkxaC9TdzcvanprTWwram1uSW9FT2NScVEzbmswWUFz?=
 =?utf-8?B?RDlVWGxrMEsvWUlnOG9kZDJtWjd5dSttc1BteDhJSzNkR1pEeFdEL0JKY3V3?=
 =?utf-8?B?WFAyRUZVR1U2NUhyRmp4RXBJenV6aFdhT3BjL2JYTXpnejlWS3Z0anUwYS9w?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gVluTxZ9g7p4xt09eXOibiAarGR9UJBwz6lUQE6rXfNLbLm2XcunpTQdgXVF9XKwDfOsuJtfJq7TCuHrG/xT7HkCjRUwXj5hhzusuYPE51HBdRcqP9WrmWjoyxfPuCPA7aPy0awF6U40OWKkkktwsOwQ6NwbhleIO7+9NzutDYRiihpD6161lHS2hAmrxd0aXm5JM0XC8qq45FI9yai1+ttkaH4AWrdUhx5pCrBnP32yH/Lm7dwzivjyVCWjQyDgtNp4eRMBKKOScfBExxwQyVoiW9MNw/x/MFxBwuLY4MXx6+rhyIIiYrvAt0TOhoVsYwJ6L5iDJJSPh93QaWsRXnwvtLvtb6TschCQBlipDWPDsRxWfMS/fIov6I3QPv6lfyhegMmdd0Xr+F30TXasuZAHR95aFFvsu5oJH/ZH/1Ha0JdaO1q81x/XcC7KIjSFRVG9klCugjKv2sj6W05tbT6Gp8hjRzg7L3t98K2pV1V+GbQAP9VzPDBy9GKG3zuIjHlO65SG8xtzsgvOwADEFs3V8oY/zS30nWLD866xGqZL4VsmD6j6qf36brUQcxgVDz/+MX28DAMNw5INmB58gFqxxD2YxNMNDuvoRNEfPlc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3492a910-973a-4d06-b3c3-08ddb7e478b8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:43:26.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gwZf2BT6Dhkc/fDj3fY2T5o/Sx2wcvOQoaJiNTkYlq2d9rqdkzVUPKL7MbmHJBAK6pxgrDGSqsdxUkO7z/u5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6386
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=734 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyMCBTYWx0ZWRfX9MGHPZPVb2w4 8sFfh5EOCzv1CwMsxCIajNoT2SvacEIJy7Sf+Mxc6m/z5V/QHNYXSROq5L29LqQWFJnAvKOLh9I IFNB+w7dYng/E/tGucDFVWQRDyifd+LzsO7XvVecmjN5T1ihSxdPR41qJTZnxks/1cTOCcgf30l
 cdVClGiRF4CJF9jDLEYXq7a6lArhXANzsY3JrTGIRRYY6AK1+tTL/BddvvHBnm6C8gS/eb08ADD FRq3QgodnYmcK0+/ufaGPgMIhuQ/6V5CVOxDuQj3MFqgngQBlP9D6phapcflauOWRPu621aSYV6 aGfCty8+krKA8ca8DRH/tL/kzVCwNm688ULogxkqG1hgqzyxgAgwT+g0MNO/6ewKjXpMUnfuPmR
 REj/6qSSAsjMuQCaomrPIGyBLhq6yc1KrkX5QmeHWX04nf582DrsfZpMbVPI4TaoxS3UjPRd
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6862a293 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=gw4zap9DkBEIbyQyQ9IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: P3gqd8DDdmo-VWY2f6uvIlUPhMOlT-QB
X-Proofpoint-GUID: P3gqd8DDdmo-VWY2f6uvIlUPhMOlT-QB

On 6/21/25 11:26 AM, Chuck Lever wrote:
> Hallo Hannes -
> 
> Do you happen to have a kernel patch that implements the new 'keyring'
> attribute in the handshake netlink protocol? I'm about to add another
> attribute, which might introduce some patch collisions.

ping...

If you don't have a patch, I can create an RFC and post it.


-- 
Chuck Lever
