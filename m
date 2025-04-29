Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6332192E3
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Apr 2025 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937448; cv=fail; b=SlfLl0e0OptFU0WaNpMbZfIZw+hfp3koWg5KOYUwhXgVpyjBpWlbY0IMEIFmV9ls4WDQolHxzABqbKZtouLWw5RdZWDAdxLag8wqu2XbZG78ycgm4psT4carkugSdGrvwLWzmQ95geUXGyMxCue6t85attWrPZ5c3bDVI6bJvgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937448; c=relaxed/simple;
	bh=0ae4nzLmKgrn8O/gZSIWgp9pqBt0+C3sxEJu4oY+sMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=go538qqnIFnnD2gX1k8bwAxSw1KqR9PDe42LsWtUdJ+ABfD2VsplRc8dh/+YOJ6x/B1vfko4nz+64R+jGN9JONNXHOtqoCWxNTLDJ9/6/B7wBAi4SNbIPB7TFzUxbuBLBkorLpkyU6JPCdOMUGotfRf2/gJeKpwDHDqDA967Bos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XUwWdGqX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ft1+D7YE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XUwWdGqX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ft1+D7YE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TDu0oa029437;
	Tue, 29 Apr 2025 14:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WXkbdc/pTfUSAr5Y101KXYLM7ZUueN/iD/DJqRgaHtE=; b=
	XUwWdGqXgU9gCnEtVcGkHzknhm534rGlrgg3yBZzJrmAonUbNvM5nW213umvu9HE
	VZ0hP8V1brslwIw2wlMdliGBLou2r19tOStLWCyJu6fWYBuPlF0lpz39gHAJPuzv
	tBpTId2HIO/DrxFRLdiEAjCAgh9XD6n0eHK9teHg1PU6D1krO0tvLvOchd89nFf/
	qXmHzPhvVCeNmubVmxzuH/nDkGWtsM+VmMv9rpMhQprq34W2SDZUIhTMgAAQLVkU
	c/Y55HcruejwE2KMQhr2Wlt7BoK0swFlSqIDyFIyOTg6QPlRvnwyLnY6LPTOcAZl
	5IBUWCnb+rqqmyVA3cpcCA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ayr385pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 14:37:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TDUjLI033478;
	Tue, 29 Apr 2025 14:37:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9y8dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 14:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFRiVtYxBhGIKWWBSSX4awZCSwGezo/Yl9vAZn88y4PHHhTDldGizSZ9P6YRY4lnv9Fv1JpgIyrvfXXcF7xwZiC9Mp6aQZYshWnoUBtnR+Gb5y19zDTMBMeT8CIc/Phywo2mdtAyv0WxtHnisiV/f4z1hyipUROCAQczcIWOjYjUw3zKl3FiMFoJdMgvsp7BTNMiNu3ogrCHD8QVdP2XZZggVZMwhoiivL5icoZydtp7386VYDT4qnTHEd+SuIYxwBPt19beiPxNyETuGKVYEkIrNnDfTjnEMzGVZ3+rgul2SUPgQBXjAmFTc3JqiYva48CpqLed2PTzOo8/qgF1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXkbdc/pTfUSAr5Y101KXYLM7ZUueN/iD/DJqRgaHtE=;
 b=TG8GyNj+JR4aTjYqOxQlYmJRsLO7etdT4d1uCEvXw1vcxTJ+MR242TPIq+VZCh7EWbgbcrQDdtGc5Gih1OpMg0mGwGLejS+gm2r2xJIRUA9M6t8SbnDWCcvtBlMcZtAqsjikxZFg0qq4zhe3dHq64LSd285Gu4ar4EGLURrn0kMAgTO+VylpiymBiZEv7Sb9e0SjE10L/w3LHZholv9+L9l7XoqlEY2QuUSjQ72Pb6n65MkoJRwgDS7lNuwexeW6QTv3jRlQbfDKntjz47LSRZW07lTW5B7mVWJD8DAR3fIM0hsq2vRaXhyNpi6lagP/RIIEu/0K73GTwfGPQOAYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXkbdc/pTfUSAr5Y101KXYLM7ZUueN/iD/DJqRgaHtE=;
 b=Ft1+D7YEVb7MleL4R+ock0A/puj19NG0wSoVjaxYprl0hshvmaSL7XkmqxA6pJiNZ1TJ4S6/ukPbEwh6i2RIfhMtd7V/AASbhm2FzmZazx14xuFMlNv1af60qUj3F5BC5u47xVCo3F2TFKXeRF4MpxjMr6Ue0/81kxF8Vdq4cRQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH3PPF539203119.namprd10.prod.outlook.com (2603:10b6:518:1::79e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:37:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 14:37:21 +0000
Message-ID: <0c15df28-32aa-44ce-8f4c-bb30da0eea44@oracle.com>
Date: Tue, 29 Apr 2025 10:37:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Hannes Reinecke <hare@suse.de>
Cc: kernel-tls-handshake@lists.linux.dev, Steve Sears <sjsorca@gmail.com>
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
 <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
 <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
 <2132fd1e-2de1-4ba3-9ef4-575a9c09e390@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <2132fd1e-2de1-4ba3-9ef4-575a9c09e390@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:610:75::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH3PPF539203119:EE_
X-MS-Office365-Filtering-Correlation-Id: a64dcb50-091f-4b40-3921-08dd872b5983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG1abUltQlZzLzJ4Z1dkU3dXVnFwbEpqMlpjTlhpenNPTGwwUjlvcUNwMHFM?=
 =?utf-8?B?WFkvcE5lVDJta2RmV3M4c2hrT3BzVXJhYjRsdDBWcnRFZkZuRzJHK1BHTklD?=
 =?utf-8?B?d2VxQWJIZ1YxSjJXeitYeFlPSlZrRTZkUnUrMEplbWwxKzEvdE5ONmVscnk5?=
 =?utf-8?B?MnFJRGV2WlNxWWRkUnQ5ck9UaWMyNDlhdlNBcVpsZTh3T2Q2My80UFA3bnYw?=
 =?utf-8?B?NytXL3l5MytMSFE2SlJMaGs2MTlQL1JHNXZtdmM1eHM2bEtKa3VXYy8yL0c4?=
 =?utf-8?B?N2dPQzdVQUozK0orWlpsMnRGOGZYYytQRnJyWHlJODRIYzFEYkpoekEzR0xC?=
 =?utf-8?B?cGJ5RzBPVzVITGYwTFZGMFhRWUZUNGRSTzRmUysyNE1sRDFSMS9Id0VTMmh5?=
 =?utf-8?B?REFOYWFPQStsUkpka3lOTmdVNGpWd2REcTRzSFhVVU5NbnFwK091NFcwRE43?=
 =?utf-8?B?UjZjRG1VWXRmZWkzNHFsQWp4VzBCRzE4UjJSRFI3WDJnNXJTTGdCSHlMRTNz?=
 =?utf-8?B?ZldwakVEaW5IdWlWMkxWQ1VKVmVpVjF5dGpEU0xJV3J3bUJpcFZ4UVlhbnZ4?=
 =?utf-8?B?Kzl6SmdLMlI0RXJTUUlwUzNQWUtLMTZTZ2FoVmJmcmxMZU5GVC93WnZ5bUwv?=
 =?utf-8?B?VFB6bGtQTlJyb1kwbTZPb2ZQaXpvUlZsamJRL3U0V2pLa1NqaGFFOG40b3pU?=
 =?utf-8?B?Y05zcEQyVlBqME16OGR3SExOZ0xrcjRyVnNNVnVSZXI2K1pmUElGMXNLZWZu?=
 =?utf-8?B?QjRjdENLTlhSTnVXNm83dXFmZVRYWHh3anQyZmN5NDNZU2UwOGlMYVlrVGNQ?=
 =?utf-8?B?c3BWOWliUkJxUUg4ZFZjRTV3RC8ySGtHMmhhbEhTQmFQZ25EQXRrNU8xQXU1?=
 =?utf-8?B?QnZtRVQzVlowNHlabzNtbTc1UnZmaGhOYkpscEVJTk5FMTZDd1dLVlpyaEta?=
 =?utf-8?B?dUJDMVAvdFQzc1ZRb1JySVh1dk83dElkYTJDVXQrVmdWSzg0dGFQOWpiejJy?=
 =?utf-8?B?Z2VVREl5SEE5TnExYW94U2x1NjAwWjM1VmVQV1NSRk9xcWtBTnBTNFcxSVJL?=
 =?utf-8?B?Mms3Ym9TUk03OGFSMGtlVWdObXdnUjY3ZU1sZ21BMW4xRFhmdENab0R5Wnll?=
 =?utf-8?B?SlF1NlBvYXRFRXVWdDRyU3RLMmJkQVR2RVJaR0Y1MEkvT1Z6Q3dJeWFWZWlT?=
 =?utf-8?B?Zkc2VlIvUDJZS1JwYzN0bHJyekxEL2J4TmdDY09rN0JnaWVTdGw3MHRSVVRN?=
 =?utf-8?B?WVh4NGZyRGk5dUlwUWhaZ3JXNGF1SlhveDkwWHNrdTY2SDRDSFZJN2Zkenk4?=
 =?utf-8?B?QW9lamplSHY4NDhzbjRIMnc3RFdUTzJybDRqRzhvb3lwSmZWSjZpT3JMTjdn?=
 =?utf-8?B?eWNWV1lZQU1jMFhLdjg2L2hhMmU4cXdkeDRXMDFmcllsMlN1MG43N1JnSGVE?=
 =?utf-8?B?SE44eGs2NmNxMDJTUGhsWkNLM3ZNOE1yTnA3b1JrMFg1RzY2U3FLYmQ4djJy?=
 =?utf-8?B?SEhiYzl3YUM0QytBTHRkZytwdnhLQzZDUmNPZXh3WCtwTW5YeTRTRENlNE5D?=
 =?utf-8?B?eEE4UHVaNHhnTm9zUUtLNTdDSlBja3JTUlZHZHkvRDgzVVFWNnVVS0N4aWll?=
 =?utf-8?B?NmRmdkVXbG5uWXUyancwWHFYZTUvcXA0dmVPZ0dwNnFUUVAvTjRqYmdSaXVW?=
 =?utf-8?B?MEp0a1BwUEtYeksxMFJSMjJEWTl4c1ZoTVhBUmJyRmxyNWxZODVOWFRzRU0w?=
 =?utf-8?B?RWh1enNERENmL0NRUU13NGFablZ4YnZCTUppb3dRNEN2aDVhZ2dHSkhrc053?=
 =?utf-8?B?S2NTelZRbjJMM2JROUdoK2lVVXFUVEdtYURwWTFxU3BFWnd2cW1YL0pVMENv?=
 =?utf-8?B?VWlzdVlVKzdwa2NUQzc4RmRKak93ZEtQWGc2a3M4US83dDErYzFkWThKblFM?=
 =?utf-8?Q?rl7W5b2xbHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0xHNDhnYUl4TmU2NU5TUDRqTnJqRXFTSFNhczN0SmxiUGtMNTBJc1I4UnVW?=
 =?utf-8?B?SFR5b1d3Y2lMWVpaYVNXRlRndnJBV0VjNTQvN2RGWlRhcWJnY0FoQ0RHVWo3?=
 =?utf-8?B?WkZkT0ROT1NWTXFlZHUzdnhGU3ZENHFJVDVwUHpOdEEzT0VjczBBeEFlRVZY?=
 =?utf-8?B?em0yamxvKy8zRHZnYVgwczcxc2NvQmxlYzlEUGNraEhURnB3WnE0T0tBYnJP?=
 =?utf-8?B?YVRZT20xTng4cDJXZlZZZ2paSWVBeGgrMzN4aFFpOERpNmd6Tk5VZDFyb05V?=
 =?utf-8?B?MUExN3BjNjUzaHpINVJ1V0RFOHMyVUxjaFE2MmtYTDFVWk5WRzE3RE54a1Yx?=
 =?utf-8?B?Sit2OGhXZ0JMQUUvd2R6MEVwcWZtalRRbGpibnM4Y3VSdW02KzNUVk5oOWI5?=
 =?utf-8?B?WnhxaXQ2UTJXZ29Pc2RyVi9abk5IZ1dkNTRzNkJxdDhvR3BIdXpGZWczZzEx?=
 =?utf-8?B?Ulhma1ZxV3lsQVB1NzdtWE0rbGhPbGhURzRNVE5lVTFJSzFHU2c3QU1vb3d3?=
 =?utf-8?B?ZUhmTkxCbkNCYVpIY0NYV1hpZ1BIODdYSEdaQmhxTE5OWDBrdmpxRW83RURo?=
 =?utf-8?B?b2xRUHFjTGxZU0hMM1ludVcwL2hUaDl4V1daU25VOGN1SFQzTmdPMzJnWUoy?=
 =?utf-8?B?R3BPZnNacVRpaTl1Wnpsb3hhK0dsSGJDOVdCUUpWRyt3UjNiR09wRTQ4WEJ2?=
 =?utf-8?B?QzF6bHhxazltNXhKNHpSTDduTXk0azRtVzhJKzQ0SDZ2T1RoYWtHbGc3WHR2?=
 =?utf-8?B?SWZzMjZ5Q0dhb2hLTkY5Z1RJRVVDTWljajc3RTdkRTVCZmF2TFlHQ2JrQXJN?=
 =?utf-8?B?dXE3WVZhek1TNVdKVk5yais3Z1BscnVGcDcyVEdhaTJxNzkxZFc0QW5qckFL?=
 =?utf-8?B?NmpDZ29ZNnA3Qy9veU1FVzNnSGdVUjNUeHlhUkwwVGhrK0xrRHdzZHVRalZ2?=
 =?utf-8?B?a2ZRN3NIUTgrbDQ4eDFTSnVZdHBMUm0xbERsM1RhcGVreElqcUpFdEdyUDZQ?=
 =?utf-8?B?OFcrUm9QaTY4bGh3YVMxc1V0TGVmUG9BNUU0N1lCVSt2NzFBS2VUN2pKSmZx?=
 =?utf-8?B?Ym81TzlzQUlCcmxPZEE2anBScUdPMGZwWTgrNDJwb3hpZWVoWlJiVURpamdl?=
 =?utf-8?B?ckhGYnJmQzVncGVHUnlvR3BrWnVFWkNxbGpTdUNnRWRPTzBBTlZ2RTNJWmVL?=
 =?utf-8?B?VzhsS0FDbEVVRVNBTzJ0RFFYbjZVa3ZwdHZIajVRTlA1ZGRLYisrSVRQblFn?=
 =?utf-8?B?b1g1Y0RNZWtnZExjV1RCaFdQQk1Pb1E4elN4R1F2dENqMUx5ZzR6REFBRE9E?=
 =?utf-8?B?T1RzMGRRT1I0eWxvclo1Q1dqWUV0UVU1ajl2Q2NSVEVLZW5oakNqMys2VFZJ?=
 =?utf-8?B?anR0aWMyK0Y1a3pNL21sOWhPQThlaHhNMUNaNCsySHJpSlYyeEFoaWZRbHc1?=
 =?utf-8?B?SzFFeWJQTXhWcWJBeDU0bFhWVXFwZDVFSUYxK0xDMXhsWlJKVGw2eE82ZENC?=
 =?utf-8?B?R2N1VUNwMTM2RFpicW1EVFFrVXFkUFVjU3Q5ZytJYkhTZlJ1V1pISXhNd3Y5?=
 =?utf-8?B?cytVUnpXSVZxYzNodTAxaEVteGlzdFRJS243dHkrYjQ3M2JVR0ZzMG80bEtw?=
 =?utf-8?B?NVZ0UEh5WW8vQ2E5QjRqR3gvK09OMWFqYTAxTytFNG90dUdMSDVNWllWNk94?=
 =?utf-8?B?UzBvNGFjYncxd21jNjdpSmJBSXp1VlprWmZENUI5aWV1MTRCcW16V1M0RmFl?=
 =?utf-8?B?QjYwb2hmV0dDOTVER3JScXVkL0RXMW0wZnpQQndjK0lzMmpVSnd1d3NrZHpD?=
 =?utf-8?B?QTRrVDRFc2QvZUtHN1ZpOEhXd1YwdDFPVTQ0azd1TU1pRERvUUc4SGtVVU1C?=
 =?utf-8?B?aFVyQWFwRGJPTzBkenB6QmlqZW9DSU1uaUtsbGRGQXI2akJnUGlNQW1sS1kx?=
 =?utf-8?B?Zk92elJ0NllIaTlsdThKYjNmcnIwRFIvUlB4dkp6bmhRMUZ6Nlg0UFZCbWdK?=
 =?utf-8?B?b0RwcXpNUEEzd05jTDNScWFHQWtCUWFhUkRBSjZUUnBBbzB1QlFLNCtURTdE?=
 =?utf-8?B?ek44RDFPOHY5S2h0bEhwdWRCRldQS1dTc3JIdm9nWkEwb2Y3THVtWmxMTU1O?=
 =?utf-8?B?UHNMVm5OZUZwMWpoSU1OZnA3WDliZUxiQ2tIMUxTMEFhUnhzZTRqMzFDNDF2?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sw4I/PsiJe7wF0q+4J7HqP7ytOhg5KctiEIvxH7EU7IP7LLaHypMTDQJX2lPht21KJr2MY2Urp7wcqDQH1kaMoEdnMHHRJ2oRDCEMhyyfkNO8I2Rb0IK6SEF5aeuY+M7WFIla7rKv0wSbRsEPJrYiAh4Jt7jVUmmysNZhT9qkYaeRvLeYqNtz6qFrO/DWo3pqGzLSNDZmq8XVoKuUtD33BN1xPh9PDNPY0+ue9LVW0BCaRCX0N/KwO3NA8xw8TPp4lXtjE8h7llCGlp2FMWjkP8jGJ1MVX/faJJGsznFFA4XpK3VZmRYpXyijY6brREr7gOb/weKN69Kdvfj+q0TvKf3v2NsvIKPQkLWZakKM7UFD9MHzSu3vNIv+DjXhJ5aYLeCXUvMU1ije3YyyU8+tss7yHim7Q81oUf7taZ98XaXudYFc3zRqHCOapDRjfOiiPZt6NGxwmYYydui1mpW6nbFoWqGi2PhfseZABTYeFM0b1SJUplIUwQbscBE8xpW2SDYEYVtP/gxh5h7NBn96s4gyYKgScL2sEn27tQBW1OhX4g2eiDCC/12xfxDUrHjwbTfiQuVWJtEjunLgChInP9NoMrdtBgqfnccHHwAoJQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64dcb50-091f-4b40-3921-08dd872b5983
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:37:21.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCLS4y6nEYs5yrxW1JfacdwxpgeRegLg/M6eBKrCQqNRZGmd/wn3BPtcuK+4bMyEe8YbDg2fnNKgpP5lE0bExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF539203119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290109
X-Authority-Analysis: v=2.4 cv=D79HKuRj c=1 sm=1 tr=0 ts=6810e424 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7v6FQzskn2sg_cScwc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uRMBXF9DZCVpY0PMYFD_BZ8Wt--3D5IA
X-Proofpoint-ORIG-GUID: uRMBXF9DZCVpY0PMYFD_BZ8Wt--3D5IA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOSBTYWx0ZWRfX6n4kzabldQVm DzxCQKiqfWmfCk8NlXuA/cuw6WUd0MJYc86tSJI0yng8fySQXg7sDh5CNJDztivy3BHBcnNZz7W y8kw8bktove4MpLJmWQaYCkOSLkBp2syGwNa4uxMl6eb/dwi5gT8GWNfHplhuwJelsGE9ZWfy1l
 BO+p3y8AnMEHg93SxYVxYxekYPLR72Ow1VxMTtJal/EQSIg2CtHY/a6v2ZPJ6bf/Eof37sw1rPv loSDLx8cz+peG8O5p54zo9s3AFXYos5vAn6HLKWQ1ep9uHa8Tdakt6YjTwqpTudFTIwJSxFSLLk 1xIsWhOLMc48Zg4tezGwRjT7uE5msTtm2dkaxEjgAtYdajiNvLUHu4b5dfOOsdAgxbAu8CT7XI/ 5sM42m6f

On 4/29/25 1:55 AM, Hannes Reinecke wrote:
> On 4/28/25 18:54, Steve Sears wrote:
>> On Sun, Apr 27, 2025 at 11:35 AM Chuck Lever <chuck.lever@oracle.com>
>> wrote:
>>>
>>> On 4/24/25 2:03 PM, Steve Sears wrote:
>>>> Originally posted to the ktls-utils list and Chuck Lever recommended
>>>> this list is more germaine to the problem I am trying to solve.
>>>>
>>>> I am implementing the NFS server side of a TLS connection using the
>>>> OpenSSL library. There may be a bug in my implementation, but it isn't
>>>> obvious given the data so I am reaching out to this list. Please
>>>> respond if the problem sounds familiar or if you have ideas on how to
>>>> pursue it.
>>>>
>>>> Here are some key datapoints:
>>>> - Using a Linux 6.12.16-2 client
>>>> - sudo mount -o xprtsec=tls,vers=4.2,hard,acregmin=0,acregmax=0
>>>> testmachine.lab.space:/share1 /mnt/share1/
>>>> - Looking at tlshd logs: the handshake always works. Always.
>>>> - The client will hang on the mount most of the time, but maybe 1/50
>>>> or so it works fine. And when the mount succeeds everything continues
>>>> to work great and tcpdump shows all TLS 1.3 packets, etc.
>>>> - The hang appears to be from an rpc_ping() when the rpc null reply is
>>>> not processed.
>>>
>>> Hi Steve -
>>>
>>> What does this mean, exactly? Which side is not processing the ping?
>>> If the ping does not work, then operation on the connection will not
>>> proceed.
>>
>> It is unclear if I am looking at the right problem, I am still trying
>> to understand how the client works. The client sends two rpc null
>> requests: an AUTH_TLS and an AUTH_SYS. The AUTH_TLS is received on the
>> server and a reply sent, and the client sees the reply and does the
>> TLS handshake successfully. This part works every time.
>>
>> The, the AUTH_TLS is received on the server and a reply is sent. The
>> bpf trace shows the null rpc being sent, but we see no evidence of a
>> reply for this one. Or perhaps more accurately, we see a reply but the
>> client doesn't think it is a reply to the rpc null AUTH_SYS it sent.
>>
>> tcpdump confirms both rpc null messages are sent and replied to.
>>
>> I have the same bpftrace output for a working mount, unfortunately
>> without flag bits I recently added. In the non-working case we see:
>>
>> 15:32:57.391762 [ 56273/0xffff8e9b80b70000        mount.nfs]
>> rpc_create_xprt(args=0xffffb53c87ceb710, xprt=0xffff8e9c259bd800)
>> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
>> RPC_XPRTSEC_TLS_ANON flags=0x2a0 auth_flavor=1
>> 15:32:57.391786 [ 56273/0xffff8e9b80b70000        mount.nfs]
>> rpc_ping(clnt=0xffff8e9b81951e00)
>> ...
>> 15:32:57.391896 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
>> rpc_create_xprt(args=0xffffb53c9503fd70, xprt=0xffff8e9c259be800)
>> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
>> RPC_XPRTSEC_NONE flags=(nil) auth_flavor=7
>> 15:32:57.391932 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
>> rpc_ping(clnt=0xffff8e9b80a53600)
>> ...
>> 15:32:57.392697 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
>> ->rpc_ping (rpc_create_xprt) return 0 [(nil)]
>>
>> An rpc_ping is sent with an AUTH_SYS flavor. Shortly thereafter
>> another rpc_ping is sent with AUTH_TLS, which completes relatively
>> quickly.
>>
>> This part is the same for working and non-working, the trace shows a
>> set of nested rpc_pings. However, in the working case a reply to the
>> first rpc_ping is processed by mount.nfs once it starts running again.
>> In the non-working case mount.nfs never wakes up from
>> rpc_wait_bit_killable().
>>
> Could it be a stall in the TLS stack?
> I've hit a similar issue during NVMe-TLS development; I found that the
> ->data_ready() callback needs to call the original 'data_ready' callback
> first (as that produces the data in TLS layer).
> Otherwise the ->data_ready() callback will be invoked with no data to
> process.

xs_data_ready() indeed appears to call the old ->data_ready callback
first.


-- 
Chuck Lever
