Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F991D88B4
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332865; cv=fail; b=VoBJw3W2iI0lviSGwPhIHaNQT+wglKPk/dGsEnJwuZQKIie6YrODzLVsqFz53srbrFDKX3QfByMO9ohsfOIru/iJJOeptfntlbot1iMIT0mAMOthlVwCcG7euQVwyKlWKkz9D/p9XRhXRchiKt74ZEcuRokb96wLwcUFJfP0wNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332865; c=relaxed/simple;
	bh=6sw+JSc93kK+nen/+CXDUPhv8AsFmPOcUl634VVFtpc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R4qloIHteJ+tdAoob9/hoob+r7bi4SAQji0VhR/97psZk4r0UUxNG2SnlWIrxgLAR7Di7dgUxypLLMTiAp+qN8vzbVu1rW6IJBZF+eWOVYbUfOLB3lYSnEdkGYADXi3FGhov3bHTQzPVjQeF546kgwZ4/MgKr5d+I/2zbVQwhms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LEH/S/8y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AdaP8lqj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LEH/S/8y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AdaP8lqj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591FMiNk002889;
	Wed, 1 Oct 2025 15:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9rjZWFHtHeaWsYNvDS9Z+LSerXeLwJGi4QfqaxzT5+Q=; b=
	LEH/S/8yodhhi9VI4NrBEjdjFpORlnvyyfnZZDoJdSBJGdcH7zUHAJT1IsCZlpUs
	6mN4Hmo26xarnRTtKq2ACiTiN9iMGcKlgKWMfT/FNNii0RTsccGKWaYA0W3FMDs+
	x3CqJp8DiZVIUqnq0ubous5YEIGrKr1W2UrTDWzWtTHzj9aN+MTfS+tsbGLsvUec
	0KJP7EkA51D6Y79YHfrLwe/EwGvTOUgf4EBwIVb6o4m+mJHDbZ75Ogr9ei5p8IJn
	IyPigJfOtAdPbaZAP8dJsHv7NaUF5UcOOVnme1dArNbhprawYw646CGUoz0Ksuuh
	Ef5sxdeZ1MUxNUy6fE52fA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1spfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Oct 2025 15:34:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 591EhcBD000307;
	Wed, 1 Oct 2025 15:34:19 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6cfvc0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Oct 2025 15:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDXN/QV0dBpvCI6xh5lb/DnNoFYaiV/vUwoJWo5+I7ozLGwNZ1LXLq+M9Ac0IT/7iM9kZLOdHJ1O48/ah00JYXUtT9a5KLPSFS8LSp4xuqS20ALUh/AEVqk1zVF4Lkrqp5tAax/hXnzMguB27oC5Pfu/SgIjZc1wVWE0w/reZb3oxzMu7CHZZkpou9OaXK2jjE84RHdxktK8w3U8PIx1vIUK0uTtr4GarcyeXSaRUfVnzJjb7kC5v7Y5S9SBoDMZMTvSXMr8FxAT+G7kZ2Ko1/aCAGPQgcRRFZpWaOO3JlUdqdvGw1zd7masVSEdYb3W/t3PRxnJO+QOaEm/Mc0r3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rjZWFHtHeaWsYNvDS9Z+LSerXeLwJGi4QfqaxzT5+Q=;
 b=g/z5iH4Y5mr1MNM7pmZ+hNv6pcCoSlJv6fctrIO1Wbi+mnX7UTCaYjD043BPQXBRX5OIld7uLbNr/r0fHTz0k1Q4dn1ng3jrmLb3GeB6eBebM+NxEbi4d/7dpHeCpyrroSbvF3pkRvcMTh13YOVP2g/YAwrDZduffTa6t9hOx+DH+N8wftu+BcFSMI8tao9jx434O4SMPjTn3P58wAHVX6HCZndktDwew09hiUEN7+P3IqsxeFT9SFGW9zZNn+cGUFMv6CgcW2eqjtxqFGBc9sl7EBl+wHYjHh+j0FtTQudAhHi+6fjObVo85o3k3syOAQC+2FuB0FEDOI7YCCNr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rjZWFHtHeaWsYNvDS9Z+LSerXeLwJGi4QfqaxzT5+Q=;
 b=AdaP8lqj11axlzZ1cyVZy5d5uHyRMXfv4aId1zmQHuEHJzskmrQUWTpy+GM58zlv8O10DqhmF6iwPkZM3ID8yfV1mlkIji0LcqdouNRdqobS3ZniiJpIrTy8s3jX4DqGiaAckC74Y+oHIBrGMWp8I48d9qh0PGMIbdmpt2vWrA0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB4455.namprd10.prod.outlook.com (2603:10b6:510:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:34:17 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 15:34:16 +0000
Message-ID: <bcf707a7-e436-4518-86d9-09b4ce08c3c6@oracle.com>
Date: Wed, 1 Oct 2025 11:34:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>, alistair23@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
        kernel-tls-handshake@lists.linux.dev
References: <20251001042734.17307-1-alistair.francis@wdc.com>
 <9ca1828f-49a2-45e6-b8c4-dc64be71b33f@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <9ca1828f-49a2-45e6-b8c4-dc64be71b33f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:610:b1::8) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH0PR10MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 1088151e-3577-410c-efeb-08de00fffb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnN5eTNES2NqaGo5RVRpNlRLUHBXbVg0ZHY2Vy9FdzEycnJncEYyMjNxN00w?=
 =?utf-8?B?ZVE3QmIwYlBqOTV1U3lxekxaRzRqd2hiWnl0TjFvK2ZEU3ordHNoZ2lHb3Z5?=
 =?utf-8?B?dmJJSCtRYnI1dC95a1NPNWo3YWJwUE9Qdk5DaHhYOWJRMC9jSGV2L3gxYyt5?=
 =?utf-8?B?UzlMcjFvU2tCMVNPK2N0NHE1NmhlVjJnMzFMa3QxM0lqci9zd1VvTUFTd1p1?=
 =?utf-8?B?YVpyVkVmb3pBRG9sSjl5UHI0ZDlYZXVnNTA0b2lMcTVHNFJoV0JpV1paZmdl?=
 =?utf-8?B?VDZjWTNUb2I0YlAxWnJZaXhTVjdEWUhZUGU1NllKcnlKQ2I4TzF3Rmg4R1Fa?=
 =?utf-8?B?ODZuSDNzTjZDT3AxU3JPbGxOeVh2akVYZ3dUWGxlLy9xTGJWTExPVGJXSTN5?=
 =?utf-8?B?NkI3KzEwak4zZkEvT3dydXFzU1dxdWZ3N3dJRDY2ODNDQWVtMVV2ZWo0U0oz?=
 =?utf-8?B?UDlDSlUrWWxMdktyY29kK2REdjZVOWpSQlJjazJnc2ZtUko3MzJWWGMyQVps?=
 =?utf-8?B?UTlmRi93TEJXYmxjUS8xT0c0ZTdMbnpadGUxS2pMOTRETUhlS01zdFZ4OFdt?=
 =?utf-8?B?T05oNnVLdVZpMThWdnpJTmgzRmFWdHZvUjR1VEFMNVJ3cjJaUXNZVUkrZmcz?=
 =?utf-8?B?dWpPNG1tWkowWnkrL3AvQ0IxaCtYK1hVa0hyamoxa3hzOTJOTitGWTUvZndG?=
 =?utf-8?B?dThtNGpoby9uMDkzemJ5aW1ZZndKSmwvamlwSHRHbWZ4VHovazBLR21RR0lz?=
 =?utf-8?B?NkZSNVEzc05scy9wRG9QTWlWYU5DY0tUcXpwUE9xMDlHNVVKNWVuUkVRZ2ty?=
 =?utf-8?B?VXFGWVFhNExGVkZIUUJpak1HOXdWMkg2YkRtUllibEV3K1dLU1dEdXJsdDVl?=
 =?utf-8?B?cXFQTit6dlpEOVN4L0dGWVNZRnRLR2VIaXUxckVSVUFyZGpjOC8vZXRvQ2lR?=
 =?utf-8?B?ZFl4YnBvTklQemZCV1pESy9lKzBTeXpkU0RwYkxrQWRNU2UwMkh0RGpCSCtx?=
 =?utf-8?B?V0daWlRlN3Q3QU5oNHhUSjc3Yno1bWo4aW80UEtLVWJPalhKQ3Yxb2NoQWZC?=
 =?utf-8?B?MFdCa0RpWUNwbEszUWM1R0NuZzVROHdqOFZsNWt4eFJ3ak83UXQvb2JIV0o0?=
 =?utf-8?B?OG5kUk80d1k1NXZmMkVqa3ZodXltTFE0RmFscU82ZXpDU1JibnUvMUw1MFkr?=
 =?utf-8?B?dEhobWV0VmwzYlY1VHRwNHQwbUszOFMrY29rNzFXL0w3WDNncTFWNkdNYXht?=
 =?utf-8?B?bldOSHVhdm5IUE1BaUtWTnA1VTRkZ2VTQ09ybDdoL201T0NEQkxKSUw2ckRC?=
 =?utf-8?B?cWtvNnZuVlJOaWE3N3RkbE9iaWFaTUprcUFzMXpDREF1b2M1ZnVtQ2N6dktu?=
 =?utf-8?B?Q1IxMmlnRE05SFFMbU8xbmhXbmxMOTcrblI0MHliOHBGbENwcFVZajJ5M3BH?=
 =?utf-8?B?M2NrZnd6d2pmS2ljTUI5RkQycmRuL0plcWZ0RG9pUkM2UDhZRm02c1o5NGY1?=
 =?utf-8?B?dHpqVloreTlibjVDZVgwcHdwcTBhNUwra2NGV1QzZTg5NTJYdE5Vc3A2WkVV?=
 =?utf-8?B?UUlSb3RKRTJtQ0RlUjN1NmtmL2dYVVdzNXl2aXdiMXhDOGJlZ2VmM3VLYjd2?=
 =?utf-8?B?NlR4N0lsbVRuOWh3bnNzSW96ZGo1K29yaUpNSVBrdGlpSjhXbjZubGltQlA2?=
 =?utf-8?B?czhVNFJQSktiditIMXgzK0RCOWx0YjZ6YkJkL3RTWWVBRHFNelRTcks0ekk3?=
 =?utf-8?B?U1k5K09mbDArclRXdGJwZE5lMzUvUXZLWkZZcHlBZU1DZWVkcC9yN3hMaHhp?=
 =?utf-8?B?Q1RqQW1YOWswUTJrWUpLcUNmM3B0aVpCZ2gwM1UwdGUrRHJvamwxNzVaeWZV?=
 =?utf-8?B?NlBTTVpQTFJac3Y3TU9aQTZMS245Nk1mL2lISUZzbUhqMW1WWlN4SnJjaWhI?=
 =?utf-8?Q?gnj8MqgCiM9UZBU0zEKEu5yhdKJ2NBdS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3g5NE9FUklidEdqUUNjRSs2UHlyaGJTbjVWTERpdFR6dnZ5eXNreGpKN3dj?=
 =?utf-8?B?YmRVU2RaN3J2Z3U0UnMrWnllKzl5T000WFZxMVZZMXhmRVhIb29JVWxsdHpy?=
 =?utf-8?B?dERBUHVjd20wWjYvOEpVQnhwbzVyRUFDVGt4RHA4aFV6ODdOYWxwTHpIWWwy?=
 =?utf-8?B?R21TRlNVais2T0MySFU0NWpRaGgzS3h3eVQydEdxaG1NelhrSGdLaGd1c1ZM?=
 =?utf-8?B?bkVZOXBONW5RbFllQUQ1b3lrdmtHbUFIVlRsc1JKQ1VXTnNEQ0tOYUZ3THJ1?=
 =?utf-8?B?TDByeFFuOXI2eGprSGlKTitPd1BSRTZRSmh3Y3BPdnlNR3JxMHBOWXg0WWVJ?=
 =?utf-8?B?amM4YlladEdGYXpJdVFjTmVBNW53UkFMUTBNNW1pY0dtY2hCTHNZVHQyTXpo?=
 =?utf-8?B?UUNTK1hmc3lnYS9iYmdhMU41cmhtMWgwbVFtQWVkMTVoWk1FTkx2N2JZVUdv?=
 =?utf-8?B?cWwyc3A3NVhETkx4RjBXUGV3VHJiRTJMVzV5WkEwbU5rWEdGL2Q2bWE1V1J0?=
 =?utf-8?B?S0taQVloQ1grVGJtcVA2NWtiY0l0ZHhiU0ZMcEdlaDBpOU51b1RuaE10N1kz?=
 =?utf-8?B?NmhSNEpmYjhhVXg4T2NIRFRTak9WdnpOMHFoU3lLT2ttTjRtQjJETWpGRit6?=
 =?utf-8?B?N3UycW4xSFpYSUREaTNkLzZyZWkrRVVoblA1TU83VmE2MDA1YWNtZWFkV3da?=
 =?utf-8?B?Z2NrMlZvOWpPOENVYTcrQ2RGa3NpSkh3RUJtcHVFK2hSMFl6TmplVFdacHQr?=
 =?utf-8?B?ZUZPOStrTENUQzlFc0hDdGxUMUYrRGlMUXc2YjVQT0hnVDNkRnNQTXNtU0po?=
 =?utf-8?B?UklUdzl2Q3lDeElBVnlPWUs5eHI1L2E5UXpWdmhYN1NGZGx1RFFrN3F2NGJn?=
 =?utf-8?B?SSttUDNOZ3BDTDNhaWRZZHdJckY3blZIcUg1Z25DL245aVo2a2RaS3FEb1dD?=
 =?utf-8?B?OTg0ZnBiWE84TlNJNEdxdDdKajVqeVRzcmZ4Z1ZSQ0J5dVhMS3pHMG1nd2xE?=
 =?utf-8?B?TzJFQ05sUGRFcWlUM3FuTDBuWkZJdzhJeDREM1ZOdEFDQ1Rxc0NmQ2NGMU5L?=
 =?utf-8?B?VDdYWDNsUDNDeTNETk9wOWkvSG9WSitQb1hSZ2MxRHdROXpLNko3NlNmTytC?=
 =?utf-8?B?RVo2cmlIYVFPQjgxcEVKUzE1ckJGZnJYZVd4ekRnYkU2Yi81dzZpRnpML25N?=
 =?utf-8?B?WkdJTC9oTG5oa3NnKzhnTFkrdDNpNnVIVlB2eWE2S1puUFNBdXVZTThXMXhO?=
 =?utf-8?B?cVdBR0N1RmR5L3pWSzI3Snd2QUR4Y2V2Yk53OE9vZkZlV2pHVGVCRFJsTmlI?=
 =?utf-8?B?NGhGdkdJSVgrN2NUZ0Q1MW90dUNlanJRZzYwZ2E2cTFpVTNlQ2g5Q1FTMWtX?=
 =?utf-8?B?dUo2alZBai85M3JCWnBNMk11enp6RlhIUVlqNHJJWXZHa0VqcGgrd0lLR3FW?=
 =?utf-8?B?QlFYOUdyaWYwaHdCWUZBYm5qV3pmSmVhTGxuQWsyKzNFN1NGMng4STBzcUR2?=
 =?utf-8?B?eUM5MUE3UjJRMHRLQVYyOVB5b3B0NndEM25adi9CRE5kQktCUGIwODVDUVlO?=
 =?utf-8?B?LzZwWTRVNitqN3FYVmxyc2E3VitoQ2hQTzhTODdVVHNNZldhUERGNk42bmN6?=
 =?utf-8?B?RnJITTIvVGsrZGNsVTYyUnJZYzJqRjk5NUliU2tiNzNXdDFuWlZPNmE5ZytP?=
 =?utf-8?B?bi81RE5BZVdkU1dZd2d2SUVtdlhFUG5TWi8wNVBXeHI0MkNLMENjVE1QczBI?=
 =?utf-8?B?MUZ1a3JTRjRRM083Y2hWRG9FWkhjaCt0VnRvT3VIbndDbzhLN0Z2dzdPR2ha?=
 =?utf-8?B?WW5qZ01MTEUyWVNjd1ZDWGpPSkEwbEU4T1A5VmY3SUFMWW80aGVjY2s4cjB1?=
 =?utf-8?B?Qlp5WnNlb09vM3N6VnBXbEdJWldnT09BRW1VVE0yeWxML1luNmxHenRscXZx?=
 =?utf-8?B?eHhpSmM3SmYvQThGRUxjNGl3UjM1bHpONzF2ZEVVcFZQNDNQcW4zOUU3c0o2?=
 =?utf-8?B?eldEMzlyYkxta2Vja3hXZXpNQXpHR0lxSU9VbTZiZmhGZC8vTWprSVZ0Y2V6?=
 =?utf-8?B?MXZlTlJGalRDSnE0MThXRFkwYU1hMHEwZkhUUENkYy9KZ1N5ZWJKdnYrckNa?=
 =?utf-8?Q?wIpd9sUsy7ALO+tI3rWGuYiw3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CoR0Kv7RfFHOgOiE5Ge+MHo231Lh5Vq8Eer/177mlzpT/cU1yLQ5XjTYS/jt7p7fbeqV+UsAzWCEMp7u4XOjZMq7Ip6EYU+NZLT/aw9fs0HacBN+vY3UollpEOuxn8rbpt1yjraqwavPo7fY7dHp06jGJ/nAGg/gp7Y7BOCKPv3h/513FZF4d7b0VsNVlu9+09TodsyuuHaKi06vuBEWh1tFcubtSWgQxHjT2cA58XdgTcG68RrtfefOiKRXFNER+HYwo0wCsBRnTaE8C5gLf1I9eipcPtRDuO1It8png90JPjCCMYMU7KPTOvpWkadMU8PFrR+JUpm+jP72S1lEoVrZovC60R6brHixWC/p5t0EJgF2EbsIQHe2p/XFFQEwswTFW0a4vqguEp+UaFQGpDGH843mvTjI6pwsQkxaA+EN8x4fjwgSMmLA5PBDMFOpDwW2jFXJ9ZhcstA960c7XbU2fphf9L8V5n0E0lUMwV75AwFC4xiO5ukfxwRkJdSdXkGmrjPFe9/vJs4J8mkbKjQ1ranlpnBD+jS938yD42mRcziKl+uxT4FPazRGKTnEUsBirarsVn5bdfyW6dsXjL8iZoGp8USHEwPbbxpV4Jc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1088151e-3577-410c-efeb-08de00fffb43
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:34:16.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSJl9/Xdwt4p0iP6r8CFtnY7Os21v6LlqsojAugQymiRIA0PY8N4gZATDygqJDRhqgxr3Qd91utiJUh9hBIeTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfXzmazQoc9yT/j
 5bdNM46EdJzReTEJ8JR4jryIIHj0MSxX7qdqwrOqoUaOVwch/975fGdKRtGfkTJ1Uh4xg3c+pJU
 Hp4CJVilQWnuq0h+8pQWIte71+Lb6tjUCo+5jbimy851lfYAjSORnDH3ZRTNDVWNRVomhqJWdZ8
 J0xfNMBjzMZsq+ex+WGdVAp6i+97oodq03Fi+UVRUWGEIYmg4CBBT1BFMCZT/htxWcvmkNB52+2
 Xo/4EMiTbeGz1HH0PflvIHh5a+MucULIxJBslepxBNXl5bqE2bCoB8oI3Flf4AaI5nMJDdEKsg8
 0/keX0hRLjPKp0lQO0+3rGyNEm524hoYXG1iI3/Z1OdqYo831kHx2bxcRiFkIqxTG7yRZn3DATE
 uzZNvnOBFkgdLkkBTEnDlNH2OLU4MImiqVQxrOaoVtwoiIRRchs=
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68dd49fc b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=cUAJv7vmgm3FNIzQ798A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12089
X-Proofpoint-GUID: TsMRlbu--OLjCqwM8k7GqAzuFlWmdcVi
X-Proofpoint-ORIG-GUID: TsMRlbu--OLjCqwM8k7GqAzuFlWmdcVi

On 10/1/25 11:26 AM, Hannes Reinecke wrote:
> 
> The good thing here is that we don't need to modify tlshd
> too much, and we have full control over the handling of the
> KeyUpdate message.
> 
> Will see to send the patchset next week.

Just some release logistics so you are not taken by surprise...

I'm planning to release ktls-utils 1.3 sometime soon without KeyUpdate
or TLS session tagging, so that distros can get a tagged release with PQ
and other recent features.

I'm still excited to see KeyUpdate progressing, but it looks like
there's some heavy lifting left to do.


-- 
Chuck Lever
