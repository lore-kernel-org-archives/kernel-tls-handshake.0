Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D020C49E
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498533; cv=fail; b=qfoHgyAIX+19+U8YEClF2nzWrhumqGojU3bL0DrbX32nyaG8bVloglu+B5a8OASo8fUphjLn0FyHw1xjTyZdCN4tSbT6MZkAuLHK6bwI0oJljJ6v6AOHCk5DaNtWQvGvE+nHCj7kJjHpCA7pSqRSrVr7iD8JwzCUuBmiCIPcim0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498533; c=relaxed/simple;
	bh=roZnz2lFGnMq5KUSQ2Ypt8Sch6EcZWCsGb4SHYrSkS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AifOsE/gFubfR588v5NrMGDnNPZ++y6R+qHJASrh63bSaR+RZZrbxz0UpAB7f8qG9Hq8dmG4nWABoAmLHCcxYqyfbCZ6agFdluweLqxliKMrwzhcUx8qPJ66vZ+YrTWp8bP4+OTqHEMpc8ud/nH6OpBHWHYvpbR9/LSRU/Nxue8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jKKLApRu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mkuKqfbc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jKKLApRu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mkuKqfbc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B66s1Dj007292;
	Fri, 6 Dec 2024 15:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=FXyfGgpiW8bV11cZARCTPFkE3hODn0w11vmfJDu2K38=; b=
	jKKLApRu59AM7w3prG5AshbN2pMu/8exsKxegdwTFcmB3Q2nKHo2xd47dqyweaFx
	U0MrNMupAiHgj4lI3J2LIYTXjScps9jDG/+YIz3cA1OHTNAOnAZ1VfsseP7cp/J5
	x5zZ7zU4og7bqJE3wVPb8kvjFD9uQrP6RWF+VtP/nkURi72Sz5/Mzbci8jxOUzTD
	MxV8CeG9RT7Ym71xFvj4yeoGXrNAVMHhOMDC34cS3wIxqi9iQIUSSDftYTr0OLGf
	kAcyKm7y4O67BSuT+wAfdcipGbSjJlch+DvDJ8L2jcSBXu0Ylkrug7wJN7bS19h7
	GhB2kbG7D3m0pyZNNZgapA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437smansqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Dec 2024 15:22:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6F0C7F020371;
	Fri, 6 Dec 2024 15:22:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5cdnn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Dec 2024 15:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPQfP+XPEvFrv2rt2b8G5gBoQRI70/5ArF7xKn84BAbX+XtwnfKOXiQWGX35fMnfV6sFzImxEyXe6nzU0//wJLDYyQH6+2s+Eqp9z1nfYwcalE8c7dPVmOWoNtX9lA9PsdGIbjv1PDUbgl/DgMgIl5zEBnid7KPyU6TZsboLEOR3g1LMjnKnZ7VC3vbsNe0rozu98axldrv4tdKEkXZxnpL2CgDalR0UHvPvQ25WmWpk96ASkcBQckTbDsLcTLgz8uz6iYvYHVrl9+CG87LJFXMFVjC+XBa33zn6SDJYQf9eRTIfMWA1oAONb+5ju5QNTk+M5W3+qNcgUtarl44/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXyfGgpiW8bV11cZARCTPFkE3hODn0w11vmfJDu2K38=;
 b=ON9uU09Gd7Rt5lXtn8beA68/lMAbb7F4QUrZQMPwbyxwXkiRwzQNu+4gd9dcXfAlk8OMU9NFgBlhQnglfccGVK+LEBbMOZQA3NMOfJfAy/RLa8TDpUO6gh6XjgWzHJvdmpdcR1FtR30vnx9R6SlNVUrqyiHa1x88S4SxxzujUirkDsH8kVwUGh9uBc8Q2C555URMhV6hB5UGh6GK0rDwieifqXSm3FgDgWMYcUhwZrr6b797RYz9eiGYStnvT823HhzpsCDx892cl/5X9i6KjC3LXTPviEwfbzpA6RWZDVV8Bgtv0C/K4hLksfNPpj5Obnup9cFr+EV8QhDzqLhUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXyfGgpiW8bV11cZARCTPFkE3hODn0w11vmfJDu2K38=;
 b=mkuKqfbcoNkuYUybLJEwai27aZ/Hn0t8SyYEDpS8evx2sEtoxMM5l2NI7O4p3S9bVGm95S0pD4bLxnlguHVImSAx+fXs4QiZANdG7uoPZXJWcXSaKUBM7XuhrfDzH4ZHC/rxscW/AbbxeLCXoY5XgQg+Ps0C+XbhNA6NOAzaL4k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB5996.namprd10.prod.outlook.com (2603:10b6:208:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 15:22:07 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 15:22:07 +0000
Message-ID: <0d8994a1-a025-4899-9b3b-c5596071db14@oracle.com>
Date: Fri, 6 Dec 2024 10:22:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
To: Sabrina Dubroca <sd@queasysnail.net>, Hannes Reinecke <hare@suse.de>
Cc: Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
        "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
        kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de> <Z1LfX4S71BRvBKOW@hog>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <Z1LfX4S71BRvBKOW@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0428.namprd03.prod.outlook.com
 (2603:10b6:610:10e::23) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: f1315ff6-8d12-4f9e-b00b-08dd1609bee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDVua0w4RHpYQnYzenNTS0tTaDM1N2wwenZKYmRJN1B0TEVkY1UrYVpkYUZv?=
 =?utf-8?B?M0VHMlNpLzZjV0R4TjZvdFVTZmhKZU5Ic2R0eU5LbVNSalNhL3pmeHR2Yndw?=
 =?utf-8?B?cGlsOFlEUWNUMVZQSEJVTUpackRUSVJ1YWlKVWcraGhJTGhGRVJPZWlweDAy?=
 =?utf-8?B?RGFJVVZONlpZQm50SVZpSUFPWXJ5czMwWldZZWpvVU10TS9UUmdDUng1aWNv?=
 =?utf-8?B?R2RGa0FhQ01xTklacVI0UExmTC9lanN0TWJsdFB2RzhuSjlQT2lLNjdLaUtK?=
 =?utf-8?B?dU1JSjdOdkNGcEZ0aXV4WUw1Z2J1dkdjblRudXFwQ3BxeE1ZQW9JM1gwc0dI?=
 =?utf-8?B?TWtVL1lEbktlbWsyYWZOTzRYanB5SzFRVFh6R3VSeThUU2VsbHYrMlFWL2Fh?=
 =?utf-8?B?OEJYaWFUUmtGWDNMZFc2b2l6YXFZbzRyYlBYaXFCdnk0MC9wVDZqZy9icXFY?=
 =?utf-8?B?UlU5NFpxQ3RFNnErWlRTcElRNys5ajdOTDBUOW9uZDZFaEtQdWlTU00vYk5U?=
 =?utf-8?B?eEd1VVBvNS83WExjWVVCSGhHeGNvVm9QQzk2bnMwY3ZVdE9KdW5DTitYa2F0?=
 =?utf-8?B?RS9aYVE0UGhUQ3I1bnBadXh5QjU5dHViaUFKc2dqWGE2WkpwZThYZ1BhOEJh?=
 =?utf-8?B?dkRhZVBSSllSR1FpZmJNTFViOGRBaFVFekFxM292T1gxektnR0NDMlh0TGlx?=
 =?utf-8?B?N2NqT29Lb252ekpYSzVLbXRQYlUydVJ2MHNxaTJVMVBtYWplL1JWL3J0b3dF?=
 =?utf-8?B?dno5WXV3RDl2OUd5cnprS002emxzMmNsOUE1T2krTWcvdkI3cGtPN0l6QW1J?=
 =?utf-8?B?L3lCQnI1ZmdNVm5qNHh0TDhXUjBDcGN5YVp5dlBUeFJ6aDRVZDUyY1l2T0du?=
 =?utf-8?B?ZGZacGI1UkRBYXRtTGkwUktZNWZ3RytuNVc4QXVaSTYrbDNReUFjaFg2a0ov?=
 =?utf-8?B?NFBYdUtGRkFqQ3N0bTFUd1dtQnhFWW9aaUxLTnJHSE1XVnlJRitKbWxDbTk0?=
 =?utf-8?B?cHhPN29KZTRCSDVYZFlKQlVBOUhjS09Ja1pKL0IyRWlsZ09tVWhzdU1FbE1G?=
 =?utf-8?B?THQ1eTJqdDFhVWM5a25ZcGZCU2prMjlNYTd5RFI0eTdVdHRlelhBRnBsQjUy?=
 =?utf-8?B?d2toMDBHS08zN2p0VkFUcHZmTXNSeXZ1a3A5cjZRZWh4dDNyNXJKaUswd0p0?=
 =?utf-8?B?ZU5ZS2Exdk4yNit0QWNvbnF6RE9iUG0yY0RsNjBzOTRZOGhmcFpEL25NYlhw?=
 =?utf-8?B?MitTaTR5bnl1OW9IbjhsNVc2YXVvSlgwckQyWC9MMERPVml4emxOeG1SWDRQ?=
 =?utf-8?B?SEtlM2JFOUNjRUpmRzhia0JnWjZma1hyOVhaRmpSVGRrZVRpMjBnS1lWdHFi?=
 =?utf-8?B?aGlvdDQ4ZlpWSTE2WkFZWjBhRXBoUzdPOHhaeDg3SDNOSHNqK0JwYlJDL3dp?=
 =?utf-8?B?V1FORE8rc0pxSkRRZ1JFZmNnSlNPM1g4YWhKZ2ZCOWM3cVN3WnJXRGZydWF3?=
 =?utf-8?B?S05LQjNQcXpJcjBpaVhvT3hyTXFBTldLS3EwTFh6c1lDNmVzak5HTGU2Q1lW?=
 =?utf-8?B?TWxueGRBek9ORmVickN5R3dPTjBhc1JNMlh4aFBYVFplcUJpWXExZCtlZmxU?=
 =?utf-8?B?c1d6YjU5K1pQeWpJdDkvbi9RblNUK05aQW9lbjErUWY5dWZNK1ZOaWMwaXk3?=
 =?utf-8?B?Q2xTUGs4NVBOVHFjU20xeCt1eTZWbWkwSDNoTFloWFQyYkZ1QUFmMVUzR2JB?=
 =?utf-8?B?M2JaOGRhNVVteTJadVBrREo0bFVEOGNDTGpBaE1JVy9wRFhzdG5Pa0xwQlhG?=
 =?utf-8?Q?Wm7FCq+b1mw+xklkrrVPuqiRbw7M+dlBphZ9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ylptb1MrYWZ3Z2FuUWd0TnNOejVVcG9TbUcxS1h3RStjeCsrRUZVZktFVWRD?=
 =?utf-8?B?eFVSYzkwTXJVZ3pGL2tWWHpKWVpxdEFNWmRTQlpxNVlJY3BjeUxUSTcxSm4v?=
 =?utf-8?B?YVY0YmlsYktFRkpEYVAzaTEvSHdETFQ0elFxNkZMd0VRcEhUTG42bzNVZktl?=
 =?utf-8?B?UlgxQzVGRGJCZFN2dUlsdGxNV3FUTGVEMDJmcVZTS1B4akdjTGxzNS82bktC?=
 =?utf-8?B?ZWE2eEk5a2kzcmczMVJORS96L2xTOW5tS3B5RTUzMU05VWwwWm9ocmt4TGtU?=
 =?utf-8?B?NDdMZWVRS3VUTHo5NVpNYTNYSUZTb0RlSEtYTzhMT3RPQmNlM2cxdHlGMEVN?=
 =?utf-8?B?U3FGald0QVkzNUVyNExUSEVUSkpodGZQU2pZa2JzQzVORXc4SHRpS3Z1Ukl3?=
 =?utf-8?B?VS90NE1iUk82SXBnTzZyNGhlNHo3Zi9SQnlnU2NwejlHQnNOYTdPN080WUpM?=
 =?utf-8?B?RGIxSE1NNXRnNkNaQWhrajFyQkczTGdlQzZkaVJXT0xYYWtBQmptS0RxQ0V3?=
 =?utf-8?B?c0JPV25XYWtUOWJtREVzRjFHTkhJcTRjZFBiY2pNTm9ZcWNrRlNVdDFCRnlq?=
 =?utf-8?B?ZDNlMk9YNm0zWkUrTUpjS0lOcVlGWFpsYkhBdlRxVUJ5akZTRnJOZlEvZ1Yv?=
 =?utf-8?B?a0tQem5VWDF0NlNZQ0QxWWppSkE4emt1R1BqTmFkQ3RvZ3YrQWVhYWtiRWNh?=
 =?utf-8?B?TzBjVW8yRWRQMUxNQU9SeWtxYjNjODg4MExQSkJwbStlTjNGNUllR0daY1VV?=
 =?utf-8?B?ZUxiTTZBZmwvc2sydlNxUnU3MmVnUDZHSUpySVhrbksvaEhZRFc0VlhteS9H?=
 =?utf-8?B?SjVZZ2U3RS92UHZKbHRnVkFxbzZLRVNwaC9zOE1XOTVaQ3FhSXVIM1hUL2g0?=
 =?utf-8?B?aTVzSCtsOE9udzkxcWJGdHIxREhpS1dsNU84ZzkyVDJ6OUV2QW9WckUydnJT?=
 =?utf-8?B?SU10YlZQeHhGYzZ0Szg4VlRremJYeGZQZGp5UkVaTExhdUdHbitWMFVuUDZr?=
 =?utf-8?B?Q2gvZlVIRGUwT25xYW1PSzFrRUxxeFdlalpnYURHNVpXQmdHVENqclh2MDZI?=
 =?utf-8?B?cDNDNkV2dFdRd0I4QmFTbFZkNXg5cE9zRVJsYXJyamJsSloyT01qTExVR1JR?=
 =?utf-8?B?WWtneEVMd1hqS3YvODc0bVdqMXhXUXlQY1FlOGNKelJja3RBeldCbWlJR0t6?=
 =?utf-8?B?elVyM3NydTFPQmxGT080a2ZlaGxEODM0MXNqUUNaSDdDVzVTN2p3cDVPM3Z5?=
 =?utf-8?B?dG9qTWZVcnhBanFpWHBzS2xFNGNQbTJKOWlOcjd2Z3c0eDNBTGdHa21PRjV5?=
 =?utf-8?B?UXZLOVYyQUJ2OUt2Rlh5b2dqOWhPL2ZkWVlmNVpVT2lkWC9KMElhNVhOMUxx?=
 =?utf-8?B?RG9ES2tEeWIwWG1kcXBldU13VGFKRXo2MkZXc015cDByZmgraEF3dXVDVk9Y?=
 =?utf-8?B?VEVWTUpmS2phbm1rd3Y3Q3N0Z1BPT09uTncxUWxqVnJGaE5sMFJVVzVsajY0?=
 =?utf-8?B?ZG5RclNDNTNnbDBYeW9EMzFjdTdJTVNIU29ua0NHRVM5SjRGS3N1WU5wZElW?=
 =?utf-8?B?VXc1UThMMkYveUtJb2xXWkJUcDRXTnZxL2NQQmhrajRJTm9mdEEwSEZmM3hq?=
 =?utf-8?B?K1BnYnk5S2JXSVlNL3dpSzA4VjBOc21GSkVyR2N6UHVoTG15WWhSNjVRNEtj?=
 =?utf-8?B?SWh1RlVIbE11dGxmMW9pbDAzcHhwLzVSVGtiL05Rcjh6VzNXNng5VGwrOVNU?=
 =?utf-8?B?TXRVVGxGWHhSaVZGQmlqaDdaQTFiVmF3emxhajNkUVhvWGlXcENzRkpVeFpU?=
 =?utf-8?B?R09KVElqbnVsV3dzT0krMzZlSW5zM2Y0NVQ4cGIzQndUOXBVbWFIVnFnTXdD?=
 =?utf-8?B?eWpLMWFhbFVwUkNpclA5OW5xOUgrc1B5NmZwK04rL3BGcFlNREVIK1pnQUls?=
 =?utf-8?B?cnIvZmU1M3F5ZXcveEpJL1poaWw1UUUvVDdKSktjbGU5TndpYWQxRHAwSElT?=
 =?utf-8?B?cDFUZXk4WXdNWUZIOURGVnNSUHF2OU5IamdRYlB6NjN1ZC9TU3BpcTNtVldn?=
 =?utf-8?B?aTAxMloxdU40MjJFQ2dqVTRzSGtCR3BaS055SzhyNUxJaXUwblgyQlpFMVps?=
 =?utf-8?Q?N3XF0GbwOHjAJHTkXp+IqR8lU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZgeJiYUpX08t8F/NI+wGrsCpHKig5fs196OmpKVYN1mSOKxNQW1A/BEt/rzOiFLtKKlLd2xE46EJE4qqV8eo0l7b1KGPvVCZMr4D6GbvUPDZGN/U04sHByU20zY7gFBc7BZ7QuzukjbrqLTGBZgT0118TzAnfeArhAsvQOAHH6ZLp3AfGR2y/avaY9E/CYgD3IzmSBls6loKcZxBmnlyI3VY9mTICfQfFSmL9kz59rYWjjZq8N8HQyXVTXTfB1fSs5+Xc9InODfTCBrJln2NcSanyBkQHS5SkdGwo/ucs5+nZhs6vT2qk8byMaZMtDHQmy0OG3aoKdxG4h1BgdT4J9vGkW6U5sbgEiW/y+UIG4qE9Q612vq0fJvhlC90OzBFDIRIsdy/cGsDDh+j3fAU5Uqk27/N7d2tIyt/9g/qaujNhogTHTmbVV5vlUb512fiLGdH1UWvTNSYKSGEhlTv2viNBNhyo3vHMYtZiZbUnpC3b2k8QeFqW0ulm8eGWTE42cPwXfPY//N9LElDkKTwC1VxSrOyBxQY7S/FrbOM44GsxScYu5FYisd+69obwyZhUGqtlpxDUvf4iQ/51UcUOKXeNljUk8pc4DgEXLQOz4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1315ff6-8d12-4f9e-b00b-08dd1609bee0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 15:22:07.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+O+/9+f0FeOhSBdODpN2wbG7uB52xeRI/1BIaJ0keSFJgh9YvAPjcl8cl4a2NaKcybIuy4eqU3ThjV4S0fBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_10,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412060115
X-Proofpoint-ORIG-GUID: faYFbHIqPjUOvXsFaYaNip1vwG0-_GtD
X-Proofpoint-GUID: faYFbHIqPjUOvXsFaYaNip1vwG0-_GtD

On 12/6/24 6:26 AM, Sabrina Dubroca wrote:
> 2024-12-03, 16:20:12 +0100, Hannes Reinecke wrote:
>> On 12/3/24 15:33, Chuck Lever III wrote:
>>>> On Dec 3, 2024, at 2:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>> But the current in-kernel TLS implementation doesn't allow to change
>>>> the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
>>>> the only chance here is to close the connection and start from scratch.
>>>
>>> Have we asked Boris and friends if it would be possible to
>>> implement KeyUpdate via ktls? Just curious.
>>>
>> The immediate problem with KeyUpdate is here:
>>
>> net/tls/tls_main.c:tls_setsockopt_conf()
>>
>>          /* Currently we don't support set crypto info more than one time */
>>          if (TLS_CRYPTO_INFO_READY(crypto_info))
>>                  return -EBUSY;
> 
> And my patches (mentioned in the first email of this thread, but
> there's another version that I sent for review more recently [1])
> address that.
> 
> [1] https://lore.kernel.org/netdev/cover.1731597571.git.sd@queasysnail.net/
> 
>> so we need to close the socket whenever we want to change the TLS key.
>> And that results in a call to the socket callbacks, which informs the
>> NVMe-TCP driver, and the connect is reset.
>>
>> KeyUpdate is a single message in the packet stream, transferring
>> the new key values encrypted with the original key.
> 
> nit: the KeyUpdate message doesn't contain the new key, it just says
> that the new key will be used from that point on (otherwise we
> wouldn't have to worry about keeping secrets around?).
> 
>> But: The new key is derived from the application secret, which is _not_ the
>> currently used Key/IV values used by the in-kernel TLS implementation (cf
>> section 7.3 'Traffic Key Calculation' in RFC 8446).
>> So we cannot compute the next set of application traffic secrets; the only
>> one who might have had this is the tlshd session, but that is destroyed once
>> the handshake is done (or, rather, I hope it is ...).
>>
>> So the original handshake traffic secrets are gone, and we cannot
>> derive the next set of traffic secrets from there. Plus I'm not sure
>> if we should keep that around in tlshd; that definitely would be prone
>> to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...
>>
>> And that's before even checking whether we need to modify gnutls
>> for deriving updated traffic secrets ...
> 
> I would expect all TLS libraries keep those secrets around to be able
> to implement KeyUpdate regardless of ktls (but I only work on the
> kernel, not gnutls/openssl).

For each handshake request, tlshd forks a child and instantiates
gnutls in that child. When the handshake is complete, the child
exits. No secrets are preserved -- the handshake service is shared
by every user in that network namespace.

So if KeyUpdate requires something to remember the previous key, we
will need to think about where and how that will be done.


-- 
Chuck Lever
