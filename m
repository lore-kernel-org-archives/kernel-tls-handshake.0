Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49B2E9EAA
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254144; cv=fail; b=JC72RTtwnBmZF2K0ewLjojojXlL+gTmMMDGKmXJ7RsOHhzXsHRmD6IIxHM4K9QTc6Ljq+zKgCBfR8jdjcRdxPH1c3MXg3mHdmZxDPlmwn+LDlT8i1LkZRWfAKG2gE3pfAFoUELwc8qOlisX+4OE72JbtfyLynbpxKmIZU5RA8/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254144; c=relaxed/simple;
	bh=O0i+FW1R1mMYiYDa5nk8EzCuKqq1PTYPzLj3kBnGNG8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p3kO+s7fw3+2BU+tGS/mKED//1okuhlaZx1dK6F5ypaMWGxxdtvLInKuygaG/3xGXz2NUNkX+v7J2KeL16DC6D055sh2VaDRoHco44G3eoJvK5xl2Y3AtYZGRm/WA945EsO/h5FoKCN+9WgDscp3V969D74vNljhYOPPnsu6Ab0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Na0EMZW8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fBaob+wg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Na0EMZW8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fBaob+wg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICQ1Ke023491;
	Wed, 18 Jun 2025 13:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DeOmvOnBCCyTbBMso//Uh9oHL+jniXz24LdnrtZUM2M=; b=
	Na0EMZW82x270RlZqGGJ20lNgytqOujcqBC0SJdbzajgovvHEizEt8eAimr+36sC
	hf/+l09mpg5Kg2I7HdFDKP0jPAKKmBUSYmL3/PaNjiEsD39GUa+yLo0Dkr9HBBob
	8M6BKRCH2HaRh8lvObwEpMREHw/iTbwAZ8QPlhuUq+1Ok3Mvyt6B0F9TVbN/E0th
	FykVhbyX9qHViXtF3mo1qXjd2y4qs42xRzZmtSh7Uy73y+8l9lCm3LGPIac2Ps0d
	p6fWBUN3QotzGK5YH7tRb9eOm9SZw8KkKuleTzg6nBPgbNeO3Sy3ZkxHUFW5YKdu
	oTnEddl1iX3nsHfpDeQeGQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn7705-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 13:42:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IDeBLV031654;
	Wed, 18 Jun 2025 13:42:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhadx92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 13:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeCTJSrsqJjkzhlei0vlxqboB5ac6c/H+EUldTqc7zCiy4BPaXDhBk5kczEEzP3ctTwW1wmCksEVth6VvRSmfQQrNzZYCwva2BFB8AzdsPuWSfSid6wYxkoRxpNoKZmiLwuZH0irK3TXreuzG9Njovib/2VJ33JaAlnJCfPfP7ipal0++G+W+979qsW9W+txqxKNprEHn8M5eKWGjN8XeXSzMlzHZz06jObBViBLdF/S2VPx2jGslq+AVSARWHYuUPYJhoU2gWmpCKJimhJtjkfgBb3Z7/5yzaUdxtl0Z37C8R+GENdbJdSLczJX/+37AASGvQIOr/SC4cAzu8PW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeOmvOnBCCyTbBMso//Uh9oHL+jniXz24LdnrtZUM2M=;
 b=q8UfQDg5VPilRXbTAIM+AIjeuR+FHiCwzGSPqV83rY4tCdbCoRbfp2C+RxlgMmtVNltvFJCpNRxioFa0s6L2ukoLQSYV/WRslPkaP5VxLAe6E/9ma5ZGObqMK4rTv2zKOIBLCNSDhk+FyQGUZbR5/YFZ4WsT0JQ5cRggAacw/9FaezPO7tQ/O4IMds+SfvrOfYoE2NXbfU1shDq91otAa1MXM5UyhABkaDSJ+cCUe+BpZ1NDX8eWyvCkKXNaNo5AdvghT7ZXECGMN9v0RWUbPjkhleU5R6DGN+I7mV2SiKufGlMzPMtatIIaBeLyjFcVwkPqCsRYW4KnS/5tk4HNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeOmvOnBCCyTbBMso//Uh9oHL+jniXz24LdnrtZUM2M=;
 b=fBaob+wgS+xqncdEEyT4w4Bfijo+71YRoH2qCteiPHuo2febrV8ZQvPyuNRnxXk5SMoaP94XeVY2sgX90/cDCTPWtPfxeHqKBmEUyVknKH71zIxlMeqeZr40DST45WkfI8wEUF0sXw6UgXK5O9wnp6MoVZd4Z9g4bNQzlePY3kA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6484.namprd10.prod.outlook.com (2603:10b6:510:1ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 18 Jun
 2025 13:42:15 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 13:42:15 +0000
Message-ID: <7e910cd5-f095-4002-841d-ea724569312b@oracle.com>
Date: Wed, 18 Jun 2025 09:42:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
From: Chuck Lever <chuck.lever@oracle.com>
To: Ken Milmore <ken.milmore@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
Content-Language: en-US
In-Reply-To: <3ece0818-4347-41f7-8016-84c9c4ceda0d@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:610:75::11) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bbda3c-543d-4021-7bfd-08ddae6def69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RStHSTBHdU5kSy9BV0dCeEY0STlneGJldFJqcnhiTitJNUo2NXdXTEVxOWF2?=
 =?utf-8?B?Mk1mRElJWTZYWi9ZOGpLOTBLZE4yU0ppOTJWZDliemgyV0w5dHpIZno2V2xH?=
 =?utf-8?B?cWVVa0pKTE5rOHBhbmFHT1dmUlQ0dzB0YXh2aDRLVTNkMjdSK3Q1MzhlaUJW?=
 =?utf-8?B?V1NjN1hMUTJ3NU05NWQ5R3Z5NmJ0MHBibmI5eTNya2R5WHd3amhBVmZ3L0Fr?=
 =?utf-8?B?cGtKeUJDWUM1bVJaL2RqNlUyQmdjNnpydmxrQzlQSUE4bExMSXNQck5TRjZW?=
 =?utf-8?B?bkRrTFBCQXE0SG43RW5GNFFiZ2FJSThsSVRCY2M3TC9vdzhIRnY3cmd3ZFF6?=
 =?utf-8?B?MzQxKzVHWkVSM3l5bGZhR0tmK252TUZheDdvQ3N4WHU2Qkh6U0M1Q0w4NTBH?=
 =?utf-8?B?QjJFS3U1R1cwN0RtMW04WERmdytpamNmcmtuNVFtZ041dDEvZnpzM1pTOFNa?=
 =?utf-8?B?LzdQdTNYMGNEb2dKNmk0bUF3Y0E3bE1LaFFPTlhqSDZoYTlmTHVaVElSTW4y?=
 =?utf-8?B?TlZ3c3lCYTkyLzVyaUwyVDgvT1RRdTVxaW9iK3psM2lMQ0NkSXhJWG83Yjdm?=
 =?utf-8?B?aFN5cVpPQzVTajJQOXZaT09zb09yR2FqYmMxRXg5bW4wZldwVWhoQjdrcW1V?=
 =?utf-8?B?blhMN0dXUS9PczU4WktNSU8yTjJSL2NRbGZKY000YjNqb2FHN0JSQmd2VDBN?=
 =?utf-8?B?elYyTGFvUnFjYnBSQ2JhT3lOWitIQXZQc1RYcVgyT0dDcFJTZ2hycDVLd3RG?=
 =?utf-8?B?KzlYd2M0OFU3M09LS21od0x6STFaYXdadmJjWnhuUHliQUxTQm5XWnFtOTJi?=
 =?utf-8?B?RFNwOEppUkJjcEE1Ti9rYkU4Q3pWcGREbXo3cjgxYzNXR1RKbW8vdnZaelNw?=
 =?utf-8?B?UFQ3M0lycjd4SFE1RTJpWW1pcFNXN1FWZ040QWhPeCtnakt2ZjFaTk5rdkI1?=
 =?utf-8?B?Z2ZneU1ya0srRVVlY25TR1NWdmFDTUtBanVEemQ5ajNvRnpCYjVnc0tMNnN0?=
 =?utf-8?B?K0MwanpBTjQzSjg4TEtFSVlXcmFWN3FHMzZrc014Zzk1Sm5wSFlHbzJIUzlw?=
 =?utf-8?B?VFkyZjhWRjl0OEIvMUp5WHUvTVVLdGNxUWVuVDBVMVQyYnBlTmsvVHZKRWZi?=
 =?utf-8?B?RFduT2ZKR2J6QmpEMmJ0YUJuMHY3RkczRXlXWXVOc0xSbWlaS09rRjFBNXpS?=
 =?utf-8?B?MHR5SnNtQ3ZzRFp6QXVlUjkvZ0dVWENiUUZzeWwxVFNDZ1VVZ1paaklMT2hs?=
 =?utf-8?B?UlljbWVHdjUrWk83dDNNRU4xbldGTHZNdXg2U1lpd0xBUEJQRC9JYVlMa0lm?=
 =?utf-8?B?Z1JRVytSWURidTRHRzNiQTUvTjhzczdCdkxyRDFENTdRZndidEtFbElpbzll?=
 =?utf-8?B?TU1kbG80aTA2OU94ZHViQzJ2QjlWVG5vai8zNmFMYXpNT2VRaEgvTGZ1SFgx?=
 =?utf-8?B?QkJJUTdPU1AxczBRODdLNVQ3NjFZTXNxSk5JMGdheHhad3RKWmxTeTJ4MnZE?=
 =?utf-8?B?enBkQWNzdGhId1VxZUdGbk43NGFYaDNRV2ZNN2FGWlB3aklmd1BoZmxNRnAy?=
 =?utf-8?B?bGVYeXF4b1JEcVAwOXIvL08wR0NWL24rdkFiVkpYd0dSZ2NwQVNOYTdPang3?=
 =?utf-8?B?bDA0ckhFSEl3VHcrK2hlaHY1ZHZBU1h2WURncjF6T203MEYwdmozV1VSWVVU?=
 =?utf-8?B?ZmJEblpJbUtyc2JjalRVc2JOYW5lNHNGbGwxNnl3clFYRjREY3Y3bkJTbmZ6?=
 =?utf-8?B?QnZ5bDc4UFB6M3ljUXNaZFp2d1ZML0FJMzM3TnpOa2tTNWRWdWJsNEhRdGNK?=
 =?utf-8?B?SFlGSVlZdWdvaVo0MzJQazBLUXFjSGl1bDlkRUpZaHI0WGM5Wm14L0EvMjNP?=
 =?utf-8?B?ZzByL0MwbndibEh6VEM0TDg4OEFYaVB0YkgzMnJ1dG5HR3lwQnNxSG1CcDAv?=
 =?utf-8?Q?dxF4kaExCC0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDBZNkxyN3AyczVsRlNnQWtQU2laMkY1dVJJc0tMN3NVbXJDc3VUc3dLeCtM?=
 =?utf-8?B?ekJzdmhycWpTZjhHUkhldGV5MG8yVElwZzYxVDdMVS85TW9MdHFBWXhaSlo1?=
 =?utf-8?B?QUhGZjZWM1RBRHZkV2xYZ2h5MUExdHR4OWxxcVFKSnByQS9KZlNreklTRXlv?=
 =?utf-8?B?eGVzWW43RTVITkpqdGgxL1VtRHpZRTN2RC9DQnBqWEtkSFNtMjdqTnZ5UGgy?=
 =?utf-8?B?T1ZaL0dFZkVWRkxCVG5oaWhiM1k3MTd1SVVyY1JNUVAyM3hFK29FL3NPSWVt?=
 =?utf-8?B?bnhzdnVLMTJicE5TdjZrd0ZkN2VJRUVML2x3U0k5V0N2OVhyZGk2TE5JSzY3?=
 =?utf-8?B?MnVwbm5KYk9tT2RrNDVtZ0xaczR3WlJCNE45aTlvMXI0WUhVdk1MYXl2ZmdN?=
 =?utf-8?B?ZjdDUC9qK25xbEtnSzlVUllsWTR5cFBraldIZWNnM3NycUd6MDI2d2pPVi9J?=
 =?utf-8?B?R1ZFQ1c3djd5OFp4bU9DYUJ1OTlSb0F1Rjc2U2xyVE9HSEZyd0VjR2RMNldR?=
 =?utf-8?B?eWdqOUVxOFJCUzBuUys1ZWt3N2lYTU9Da0dVSmMyYy84Zk8yUmJLaFpYc3pk?=
 =?utf-8?B?cmIvRWNsZUlzZVJtM3R3eWluaTFseDJ0VC9hQSt3c05ZVU95TVRXMG1LS0JJ?=
 =?utf-8?B?QTRjbmlQUThUcWtTOG51OTc2NGJ3YzhtNFJXNWhDdWxFZzNOdGZIWmFrb3M1?=
 =?utf-8?B?NXlyOUllcjRVY1VNOVFVTVB4S2VBcENmTmV2WkZtNy9yMG9mRkFBKy9pY09x?=
 =?utf-8?B?Z0x2cWY5aUU4YVAwMHlFRnIyTHcrcElWekp2VHYvUUtiMEx3VmdhejNTc0pI?=
 =?utf-8?B?RWFUa091eEVZUkJNaEJTMGtHeWtZbWNNaEVEZ2U4V3hidVNnNmJncTNYVnJx?=
 =?utf-8?B?WnBQdE1ROEQvY1p4dldsNGNvQjd1ZXEvSUJOQlJSVDhxWnNqYlVQc0Yyb2lU?=
 =?utf-8?B?YjUyUWlCRDByb1kweTVpREVFL3ZKdUNYQmZ3SWtCSFVXK3FjS2xTdlJLL0Fy?=
 =?utf-8?B?TDZnMmdybmlEYzBPcVhPRCtQRWhISGZINGo2R2ZvL2src3lNSHRqSXN3cnNm?=
 =?utf-8?B?WXhLL3RtalUyNzVKeVB1SER6WEZxVHo3WXQ3VE5LVjJpaEtoeEZEZmZUQnp0?=
 =?utf-8?B?cnpwa1dkaHdqOXFxUHZUS0ZzRW93UndCQUpoenBwU3BMZTZpMlkrVUN5UWZq?=
 =?utf-8?B?aXpESUZXWlRWTnFONDZXZjNITXI1TnZTcStEcFhnQVFEdGFESllWckxoc3hp?=
 =?utf-8?B?WklpM2RiS21IZjdyQVF6NCtjeXZuY1k5Um5LckNHelZvWXZ0N3NKTHRlbHg0?=
 =?utf-8?B?SFBGc3prZFRIb21wdFNwNXNMUzA0SldBSUJrR0tFQUhPTDNhYWhUL3pnOVda?=
 =?utf-8?B?Y21TV0JtZ2JrbTJqSCtnbHJNb0JBeUp2Z0dLRXMweHRZcUdUYXFkb2IzKytz?=
 =?utf-8?B?Y0FYajAvcnE2blhOYURJNTlGSEtHbDJoeXlHeGVVUDVmUnRUeWhqOElXbTVu?=
 =?utf-8?B?d0xhUlpObVVEamIvbEhUNjh6ZUU1ajZ0TkpmSlNpWVdvMU9NM3JpODBXWCtT?=
 =?utf-8?B?a2lwT2FOUS80cnpHaXBMaDNQc3lXT1hORllmSzY3SitMa0pSbkMwS1RvUVYz?=
 =?utf-8?B?VnpDYzJ4dEcwS0FVR0txR013dkFVOXF0ZTl6dDR5WjBTVWpnSGxxQ2hDNWxt?=
 =?utf-8?B?VU5BVk1ncnR3T3VrL2dqamhrWE9OVTBMcjlkQ096MEFrdStyczN3QnhtQlYw?=
 =?utf-8?B?QzNKSDJ4Q2cwVmFnTVl3bS84NURCWWlHMmtwZGUrdWpKU2hhWUlBUFpBc01Z?=
 =?utf-8?B?eW93STR3SlllR1NhQXNvTWN0MjkveDYvWnZnZlhWbnJOZG1oaVZXcW1yZzRw?=
 =?utf-8?B?T3ZBS29qNGNERGp5cXM3bjEwU1RINUs4R2ZrZ21wZWRNZ1ZRWThLaWNCYStG?=
 =?utf-8?B?Qi9SRElTcU9kU3Vza0doQ3hWYXNzVDRjS1V0eitTeEVxRUFwRHVlcjZzSUJv?=
 =?utf-8?B?RXVjT0MxVVQ1N01vMGlzcEIvdHZuZ3J5MTlYTzd6TmVBblg5MW9RZG5paHIw?=
 =?utf-8?B?SVNNNlVoSWhDMngwUm5jYlZ2S3I5S1Q1VkoxTWhIaEV3MEluZEVaWnMzcGxK?=
 =?utf-8?B?UGkrSFdLYzRmbWNaWWM5OUpJZC84RTBnVGV0VjNsR0c5ejJmZGpQdDMrUU9S?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UkZ7Jkg7mpxe2WtD1f9GUQmqNuboySjBF9AX1l2Fhd807gfWGw29mZGFGVBY1Ap/Lw1i+3xw1HTBfzD8KkDa71fXseBHAUUS30UkhlMN3Mqy+VC3CCElsAW4QDhlyWFeUNHiisY/Eumgy6TrFqIcHEb9VobHTsGgu9aPjKlOSVqwg1OLLtlGVXPHcuhrdijmD9R5y99Hm8gFW26jyoW6RJBbx59apfoLbMygTWU4N5JVQMIHPl8SDJRbf+5N8xqxzATzfW2Kc6iq9MamjS3vumBlJqAyRNHhLBhir+Ed8lwR/RIrqRLcDYlGD4zpbIW5AgZQB/tvljEqosRgyv1k9FEBRrcUHZMddcekEKKkRWJOpp8jMX+bZRy7cuvpfHQLOtsSOYggOm/1KynVYJkv2TYVxVFVtn6F/v5qAwa37uj+D6J88CWrlW4QaFU+tVQBjqJRpnUvN+BSgh0jAkgdmdQEiUrvQLyJKfyJeRQ2i/YdsEUjL9A/O30HN106plFpi+g0tEWcL4Lv78uffQ1Gx89vEJfmopytYwSgTIEVu4/4MEZJXJIHjP43cKZV3EvhbKeEJmftJigKmDSmXod3aSRUo0V9Te/ypN+XlGB4THY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bbda3c-543d-4021-7bfd-08ddae6def69
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:42:15.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEX06fAT0CLRF9io3o+B1DWaZV43E8/pB08Ij8VhqGMHxytEZcDSetcYZp01sFJxYoRzo7a4w93LUgBO3aT52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6484
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180115
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6852c23c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=inq1oeXa_ulGqlvMf48A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: O88wvxnKCepqlOOQCavYHFwuvWTFb2YB
X-Proofpoint-GUID: O88wvxnKCepqlOOQCavYHFwuvWTFb2YB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNSBTYWx0ZWRfX2VGA9JlsCcdJ 6Yg7mXlJGCf5U+FDhOpoinCq6tS8wB6GP4szlGPLegRLE6NclE5yeOrRKOVqdm7t79afYN3fA+3 LNWKpEC/roC5JI0RWsm/vXVLUEJRCph+cFEdEX9lC3fccDR44VA2y1ZIaQzk8EmyYFmJM2U8/eG
 o4GZ1bSO00jJZd3UeulPbegqeuBZBQ8jBZBnbsyrnOE6fACWPU639Ky5J1HF2vRZ5pYXOmW/QTN hk7BizY0/AOD9varOcgYXgBwjJcy7EUXNQX6gGG7uNjGfqdw+EBjCdW5gbPQ6AogJhkqH+VTO3u v6FjKHAu9WJvIZ8YKy/9rC/c1IScu69DmHaC/1gEjnLJQSaAKXdvN/tORhbR8Z3HQKMed/pRCZY
 x2db7Jlgut+IHtggQls6g5uE3GuiQ35KurRRILKYhK+NNPiFlPnNsaoNeJZMqJ9xU4DOoBHp

On 6/13/25 5:42 PM, Chuck Lever wrote:
> I've pulled all 7 patches in this series into a development branch. I'm
> planning to take some of these ideas (with credit to Ken) but rework
> them a bit.
> 
> I'm leaning towards dynamic allocation for all of the array-related
> handshake parameters. That will replace 1/7.
> 
> I agree with cleaning up the way hostnames and socket addresses are
> stored and how they are dealt with in error flows. Those will probably
> also get dynamically allocated, going forward.
> 
> I think server-side tlshd should /always/ check a client's source IP
> address when IP addresses are listed in the presented certificate's SAN
> field. No new configuration option is needed, I will test to make sure
> all of that is working as we expect.

I implemented this.

However, apparently, source IP addresses can be spoofed as easily as DNS
query results. I don't think we can make even the IP address check as
secure as it should be.

Add to that, such a check is not possible to do for clients with
dynamically-assigned IP addresses. That includes most IPv6-based
clients.


> The two changes I'm still equivocating on are:
> 
> 1. [PATCH 5/7] server: Add boolean config option "verify_peername" under
>    "[authenticate.server]"
> 
>    I'm not comfortable adding a DNS query. There's no way for tlshd to
>    confirm that the query results are trustworthy, and it will add an
>    indeterminate latency to every handshake.
> 
>    IIRC, tlshd used to perform a query like this, and we were asked to
>    remove it by our security reviewers.
> 
> 2. [PATCH 7/7] client: Add boolean config option "relax_sni" under
>    "[authenticate.client]"
> 
>    I haven't looked closely at this one yet, but I suspect it's
>    nearly the same as the deprecated "-n" option, which was too
>    insecure to be allowed to remain alive.

I might not fully understand the vulnerabilities you are trying to
defend against. IIUC, there are two distinct impersonation attacks:

- A client's certificate and private key are copied to a different
  system

- An attacker creates a certificate that duplicates an existing
  Subject

Seems like both of these can be mitigated using a narrow truststore
for the NFS server's clients and/or a CRL.

Do you feel up to opening an issue [1] and describing your threat
model?


-- 
Chuck Lever

[1]: https://github.com/oracle/ktls-utils/issues

