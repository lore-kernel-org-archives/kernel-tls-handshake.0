Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CA135A58
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Apr 2024 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878493; cv=fail; b=oOiljuUVe1hZ2UirbHwaUXlHRUuWR8QnpaDbQxsc5gLgmGGNEOzY8gRvHZ6ldFkP9cOPV37JHOpHnWpWGgoRLkArU7FSagrtVQJGufMhlzlLjdfK+j9ILCCHr4RzA4wRa/+5EkUNYCgyLFbp09PYas/l2HaGUVf7wfzeKBxptYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878493; c=relaxed/simple;
	bh=kX2w+RLDssXYfdv7AXmzc7ZeYBtnMxgpDee2JPi1umM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aLCeGZ88EN0m659BUnmz/uTMLiz9HXvcbqJOp5BKL0VWdMmxwCvVcMbPRRHbaoPxDdiF2QNxN32oY0yyCHwBG8H+lLIEKrv9jBdPmkBgM5K6Xp+YJoQAzUQNlW5/QgY0sWk67OVFb2HacyKtCgqqtFmyykIkURmaDf+4ntxJf/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JnObcSR+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tq64hgLD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JnObcSR+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tq64hgLD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43N7YBJc013690;
	Tue, 23 Apr 2024 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=kX2w+RLDssXYfdv7AXmzc7ZeYBtnMxgpDee2JPi1umM=;
 b=JnObcSR+JjB3sO2SMdg8Y+++RNuHgr7qRCutSKLEM4xLW9XGclQIQ10d+t0Rhhpzf73S
 ndyUxRNQIMaB0eDtaGdauCWkTSv5f3cGwZQXRieJ9JECR1HBdea9nunPJC/G16unCrY5
 F0DBAe3GNZPI4PMSG4qEiFr2fHANC7r9S1Z7jAIrfwlAjm1jA+9QOEoKbfOxP1kUUA0A
 XpubNOgYEQuBLlCqBDmtT/62xGIn6RBniqFPZewwHLEMHHPNGXiW5rdZvFpaBYY5f00k
 MlcbSvsrnm0SjGPfDp9YcdRpKMW7UwFogzSSsLIVnvTJB38a3MDWUG+Bps+oyd4IRtiC Hw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5aun43y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 13:21:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43NCdCDc019962;
	Tue, 23 Apr 2024 13:21:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xpbf362v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 13:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJt2+V6gpNiZMm3BlGBijCczDHh2myd0lZ8iWJ/gCNhk0RVDOVbgRLRXbooN8/1dx8Omu0TDPy1zNBfOQZH3K+y3JjPyXI32Hm62RwudhkAwe/niZMljUS3QoqBoelDkS2JwSmMl4HN2kd7/8ZEhlxltLFNl+aNM6/B+WgwhmmjMYXYeCpS1zDfKEurnt82jbqYDqRqY6UewgzrwZOjigPeA5DRcEAeEJA4lu5z3c2HaBusFSQRVBaMNbqj4tHXB3WOB7dXlg0Z8zZkPkgKBCphfq3U8r/mKUsfZKc/SecDLiK1w1rgFmf0rmWd7A0Al7x0MrWsGVTB7KAzw8NC1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kX2w+RLDssXYfdv7AXmzc7ZeYBtnMxgpDee2JPi1umM=;
 b=b+fBbhR0FQVcFLj8ed1uHwTJkvfpGHRb4AjrJ1DbA0XbIdk/vpgAdnLg8Cb6dPLBIkdE036p++tJCJ2FRhbKZ8fzoBTGcoWTOR1sQrf78SP1oGPc6uuUzMnrNBoWobazWz88eSS7aZ8kZaBE4JQGttvY2s4tx4fdRIDKvBV1LOAWrMQeHg2eWu5qFBWNR/Yscr9glaHX+0+zPHBZK4N0K2PXWOakqdEKR8nm2pHnwQ0CVU+WAjHuyr21e+I3nzGDChDdVLKueaAf3SaIeqMm0MWEOqU+5Ktkt+P+ly6Ak+ah0s9IoqCFQHeTvreU1/cjpHlmb9Q66shjlHc4f5JR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kX2w+RLDssXYfdv7AXmzc7ZeYBtnMxgpDee2JPi1umM=;
 b=tq64hgLDf513UN5q4Yg/QT2RUPLSRnBse+RC/kd1+gjphwMW63/XgzBJMAh2cPlzFGEHxdzSC6ZrFcvOowun41H6KsEau2URkOwbpkSDAi8NHREHk8FS9o4seTHskmNbh58sYV/6NNs4liGRlqBO5rq7EudF/GnDhJlrC7E0oyg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB7348.namprd10.prod.outlook.com (2603:10b6:8:eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:21:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 13:21:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: Olga Kornievskaia <aglo@umich.edu>,
        kernel-tls-handshake
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils PR needs review
Thread-Topic: ktls-utils PR needs review
Thread-Index: AQHalMgPifjynCvj0k+v8GiIPsEkBbF0cWWAgAABHoCAAPmygIAAbHmA
Date: Tue, 23 Apr 2024 13:21:27 +0000
Message-ID: <A69018A6-A4F0-4BF9-AD6C-99CCA8E20AB9@oracle.com>
References: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
 <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
 <AD446B51-7488-4F07-9637-39E8FD452D97@oracle.com>
 <ac997b67-ad82-4e98-81fd-ac01ea13159c@suse.de>
In-Reply-To: <ac997b67-ad82-4e98-81fd-ac01ea13159c@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB7348:EE_
x-ms-office365-filtering-correlation-id: a184744d-d1af-4684-e3f8-08dc63984846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aVU2M3oxOS9HT1Ivb3ZYNlBlTXdxNVB3T0lVdnVrQVhldHJCMlJqNENsbWVy?=
 =?utf-8?B?cDlXZ2NCNUFCTUFRVGdRQVNiajhJU0IwL1NCNTdtOTJoK1NUVG1RQlEyV1NU?=
 =?utf-8?B?K08wWFFQQURJZWYvZER5ZFpjQ1EyYTY3Vmdha1R1cWJwL1VxVXo0MWhmSFZ5?=
 =?utf-8?B?MmJENktsVmFYTnlxR0xRbHd2RVBFWFVWNWlzYVNzaGQ4TUg4OHNBNE1MK1dh?=
 =?utf-8?B?MmF2NUpLSW5kOFpHOTNiZVkyWjRYS1BvendydlVSYnpMc0I3MDFyQk94Qith?=
 =?utf-8?B?ZTF3aDU2UHg5dWxmMkFoKzN0ejVNanR3dFJoMkhZY2xkek9JQnlVVmxMMGpu?=
 =?utf-8?B?bDY5Vlo4TmF3dVgzZGFzVDQzTHZjR0ZLaXFxd0cyWEo3SDBxUEV6UTRRaDY3?=
 =?utf-8?B?eUVvYkpZMDBkS2dmTFgrQnpuZnBVN2h3VHdhMDVqRUVWTUlXNDhoblFZcUY2?=
 =?utf-8?B?THp1R085aWJKZld1amNLSm5xMW13SnZoTUU4Wk03TUJnaXlzZHBOUVpibWM4?=
 =?utf-8?B?b1BDMzRHY1hYS3BSc0FYQUMvL3YwRVQrbmF5ZlZpOVE1ajRsY1pVTE9yWDhK?=
 =?utf-8?B?aFhubGJLakRxdml5QXFScGdYZk1aN0w4T0pMYkVPaXl1QVVYdngxQ1Vwa2ZC?=
 =?utf-8?B?VkFWZEd6UVF5Z2FKZlVyQjFoRUFDWWhDRjQxRmhPSlJUaXBvalh0TDFkcS90?=
 =?utf-8?B?NG90OFQweWkybEtDMzQ1a1BPR2hGWVFBRWk3Zy9EVWNKb2NCWE52dWdRbHRY?=
 =?utf-8?B?ZHlwZng0dkhjQmZ3UTJ0L1FjZHJqQ0VQSTNJbjJoR3dkZVlDQVFwTUt4Zk9n?=
 =?utf-8?B?Q2VYa3NyQnl0V2NJZ3JPQkNkaVZaZFV2T3Q3cVRXMFM2bUg1ZSt5OEFkdUxW?=
 =?utf-8?B?eStRN0Ird3l4Y1BTNjh3Zk8wb1MxUW1palczeE5hR08yUEJTSUJ0b0laVW5o?=
 =?utf-8?B?bGhTeUlhSkpFUDF6REY4VmZHZnRqUGdWZTFEdGJjQ1I0MnJPVTlxc2h0ZEhj?=
 =?utf-8?B?bEJNcXg5djJESlI3anN4aDFBQ2FsS0RlOUhPSk1NcmI0QTVZbTlodmltNGI5?=
 =?utf-8?B?bWZ6N1crVGFMNXdicEJkWXo0V1J1em1FeklWd09JbUNnQjJtZnN2Y0hWd1lB?=
 =?utf-8?B?dHlaTlpROFdiRmJzaGRGZnVZdHJhZnU4NkJ2UStpUG9HUUJud2Y3R0NmZnN3?=
 =?utf-8?B?V0JBNUt1a1U3bnQxNW5WZkVzdnd6aG1DNjRIejV0OFEwNmM3OVRVS3NSYmRa?=
 =?utf-8?B?RDN5eGdETXdPZ3hOVXdrd1pYZlB3a2tCL3FOa0hDVzVZamxaWDBUVnBsMkVO?=
 =?utf-8?B?QmRmSmN4T2Jpby9KanFYSWFYdy94cmFHa0lSWUFzK0Ezbm5ldXd0T1hPdW1Q?=
 =?utf-8?B?aTFkR0JsckdjWlVleVlkUG5LZ2JwNFFWYXhURFNkR1JBNTNpRUZ5cWtPN2pG?=
 =?utf-8?B?dHJNYnJLek1oZS9aVURUajVKa21ORzluOE4wK2VjbGZuVUt3c3FZUDRjeHk2?=
 =?utf-8?B?QlpUVkFObGI5Q3RKN3hVWjBYRTYvVnlXek1Jb2JJUjRnay81TmhWV1BqN3FI?=
 =?utf-8?B?OVVBeUFHQWJET3hRYWh3akZkcklMc1N0cU9WNElzcjBVOHE3SGFjTWcvcGRI?=
 =?utf-8?B?dkNnRmVuZlJUN2k0WmFiVlhMVy9Wc0Zydkd4dERDSk8wZEpoam42OVlxcDIr?=
 =?utf-8?B?NENmbE95SGVJbVFnSEhzS0hnZ2RyYkFHTkxOUEpkTHY3UjUzSEtTcHhCMzlB?=
 =?utf-8?B?UnY4a09jc3JyTFNSVVJ6bDFMTkJ3ekhyem1seXIxNFN5T0hrQWtzcW1JbWxJ?=
 =?utf-8?B?c2QwM1QzVVRKbkFhSXNPZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UUFjMGkxRW9DSDZNNG8xeEpVM3RCT1FFbXpwWUdEYzB2OWNORkFERUd6Tnpm?=
 =?utf-8?B?aW5BMmtOcE9vL2MwcEJFcngzaGFkTUwxcm9mMFI4aFVsN2NjSjhDOUpKNjVC?=
 =?utf-8?B?czUycGhOczZjbDJWekxadS9aellFc3dEVUJTZWxNelAwQkxmQkdJSUg2RmNw?=
 =?utf-8?B?Y1k1QU1XVG5rWUFuUDNVMGZ5Wm1XZGNmQVgveEw0WjZwWGtSdUh6OUNURzNz?=
 =?utf-8?B?ZnV4UFlkQUpIQ3ZQbEVyd0dkZVE1cmhVMkFmSEF0Ujg4ekgzWDBNTU5IcjNQ?=
 =?utf-8?B?bHVKNCtkMUluRzdzaDE0cy9XdFZMZFpsTzdORXhkRWR0M3VUbWxuQVZQaENC?=
 =?utf-8?B?cG1QZjQxdHhiWEJCODIvMFdMUjZKOWZJU0s4UlJpU3Vxb1E0UDdQVWhYVEtN?=
 =?utf-8?B?OTA3RWkwTXlOVmFjZ2xqR0djZE5KR2pkRDhpWWQ1R2dQQWh4dnlzektCdTlE?=
 =?utf-8?B?N1BoVFROM3pFQ0wySmppVmczL1pENk1EZW5temhYTHFSKzdhdkRvbUxkelNR?=
 =?utf-8?B?M3ZzdnZHWm9LQ3U2VlduRnJacml3TUhBYmNpK2QwYmJaSXVQQnpzY2E2TlVP?=
 =?utf-8?B?cHlUVDhreDJrdTFyQm9WM0o0MkJKNXloT3BpeTlhY1h6bzBhUWdHTEZIU2R1?=
 =?utf-8?B?aE5xVzYwVGljdXBFV1dZNVFCMkdIaUFRa2dwMWMxY0Z3QmdpaytMdDI0MlND?=
 =?utf-8?B?M2dOUlpDNTJzZWRyK3RvMWE1N1BRNHJTMzI1b3BDWld0Qis1Vlh2dVhGTHB6?=
 =?utf-8?B?c0E2T28raHJ1NldMSVp1Q1lwYWJucFQzRkpZSFMvNUc1WE0rNk92V1YzL29F?=
 =?utf-8?B?Ly8zcVJhSGFZMzhXYzVKcU80RGh2TXRCdU56REU0c3JVNlB4bDdkK1ZxOHNw?=
 =?utf-8?B?RHluT0dHYlNnV1Rxd0tYOWlNR1hSNFZNMnpGMitOM1d4M2hzNHd5aklHYml1?=
 =?utf-8?B?RlhWVmdDZXNxOFdlYzVPS2hvaWN1ZjkvTmlZRWszRlowd25LTWNuMTFwd1cy?=
 =?utf-8?B?SWdmeWhqbWxxSDVNVEUxQW4rWm53RlRKVS9PelZyY2grcktYRkZkM2gySHgy?=
 =?utf-8?B?ajNZNzNyclAyRFZTQmJIUng0TzdMOE1OaG5tK3ZwaTNlZC9RUHdEV1NxK1F6?=
 =?utf-8?B?T3l5b25sMlBneFdWUGhNdTU0QjBwWmpHdlQ4aDJ4dmlFM0lWbFo4YXZHMk43?=
 =?utf-8?B?c0c3NEgxRXpzcGhXdFlLeU5VaWpJWUhsZTBVcms0OUU5TGNXRGdQQ054eVdH?=
 =?utf-8?B?RUdkdHBzcDMvYUxyY25KZG05alhaZTVndUZveThFYkhWQnhHN1YyRE9hclVO?=
 =?utf-8?B?Y3RJbGRBZENKQU9HUWlWeTQ2ZmMwU1ZKSGFtRFBRNURHUDUzeDZlUHVyUm5o?=
 =?utf-8?B?aDdNLzh2MkYzbzhGVXhWZ0dIdkhXblRqK3puOURiZjZXTXhzNnRrRUxCRU5T?=
 =?utf-8?B?dVowbFRaa2o4NzVVUUxJUlFJbldIbDNQd09wK0hiMmlVTk1aTmNpREM0Uzdj?=
 =?utf-8?B?S3VKS1JZY2pPcnZIWXp5S2tCWTlseHVEWXRqcVQ3b0NaU1duVnRod1RLSUpw?=
 =?utf-8?B?Ukk0blZram1ZT1ZuRDRZWk51K01FQ1M5eTdDUUI5Z09mNzVrOHk2WUFmZTFu?=
 =?utf-8?B?cTVURUEvMVNVSnNPR2Y1TzVCdEVTK1VqSG02eGtzc2wwbmFtOFZqR1ZYa1FL?=
 =?utf-8?B?NGhPN2NMOEZLcjZjNnJIb28xMUVqamN5UzhwQUNiN0E4NWU2SHJXUkl0djN4?=
 =?utf-8?B?UkYwR0VUeTJZUjVtM0RCR3BVakVnNlZ4VThrdm4reUhmNDZiMnR0Znk2Tjcz?=
 =?utf-8?B?cFVEbU5pTXFzNDgweVBOajlDUDFhTjJ0WUc5OTRYckhMQzZlOTJUWVdnZ3hF?=
 =?utf-8?B?aHhOa1dXVWQ5ck5SZVBZck9QNXBOTHMxMG5sMzUyNlcwajRKdEgwWUFIdHdU?=
 =?utf-8?B?SXRnV0pYd0UzcHpLek9haTdXVldWVkVqWFAydkJzemlZaEhKY09HelV6eTZS?=
 =?utf-8?B?MjZ5ZjRSZTZtV01CMkFpMXN4Vk51eHZmSFJoVEhGa3BvazlGelg2RlB2cXhK?=
 =?utf-8?B?cnhYZml2ZlR3bi9MZTJ6WVpwNUYzUFJBTmM1emg2eFM3aWlPcW5ZcDVMVDlt?=
 =?utf-8?B?MnlIZ2dMMEVLR0tGam1Kb0xzT3MzdjhERks1TkIva3h0RXlwTzJFQnMxNjJo?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95F1970EC392F24B9E454211F9DB25D5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	VIS/JXQlPHpBCumi6v1MkTwp5oCn76MHcvc7W12Ai8+Xbj3KVlewnAZ6w60Xh0jyoHUQ0aKEw59jyaaUS+HKqNzt+uBXtU/9VOA3N75KsDTFn3t8BOxn1WJ2omdyRxUy3M9SEGnpYhwCDrtIFtvf9+a7R8FiEu3exK6WqfSsLQUDVUWshhvOggb6800cU8Xm8Ui6UwxP8QXsQxgb6HL+AMLUEZyIjmZfmHzNM8NVFxYM4HkWjsImE06akX6fN9PRcvgOKWk9ivbGbYYy6t4WHHNiaQjPkXgw5LsC/oVw/uVBC9tSdgOhCp8UM6/LmsWdaPqe0q8mKMlNRMtRVx6oweCzr69fPpzi1Z7Q1t/WRuZwwVNFpRDv/WqasHPzIWbKR3obSx4Exbhzp70VAIkK9hf5GGquAQp8Xz4+GWZvZDA5DFT9nwiKF49FVqYxbohGoaAOqA9yAsm9gm5GNFTRE1tX/KRvMnE2WbGPJrQWdVC0nqvTnvlGaNqyoI2Y5RhtqpHQ/7W6C0ZwypjqmkqqtvUjf+hNf5s/4tm1Y9AWncaaedEU8RyRBa0fXbVmbwZOrhJNe9GRIwWhnrFPbCRXtY54z1t/3n7qOJKAoMeC8L0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a184744d-d1af-4684-e3f8-08dc63984846
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 13:21:27.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMWsA/yWU44xTQj4yMfBfY8ypHAucKv+60o3TUnQVUeU3AYnpz2gixr5FdpjZLZWmLtGNdYOj80/R0I917PKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_11,2024-04-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404230033
X-Proofpoint-ORIG-GUID: LPxl2ZLzYsFv-S2_nOVaEZZpy561uo9V
X-Proofpoint-GUID: LPxl2ZLzYsFv-S2_nOVaEZZpy561uo9V

DQoNCj4gT24gQXByIDIzLCAyMDI0LCBhdCAyOjUz4oCvQU0sIEhhbm5lcyBSZWluZWNrZSA8aGFy
ZUBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IE9uIDQvMjIvMjQgMTc6NTksIENodWNrIExldmVyIElJ
SSB3cm90ZToNCj4+PiBPbiBBcHIgMjIsIDIwMjQsIGF0IDExOjU14oCvQU0sIE9sZ2EgS29ybmll
dnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gTW9uLCBBcHIgMjIs
IDIwMjQgYXQgMTE6MTbigK9BTSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxldmVyQG9yYWNsZS5j
b20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29yYWNsZS9rdGxzLXV0
aWxzL3B1bGwvNTQNCj4+Pj4gDQo+Pj4+IEkgc2VlbSB0byByZWNhbGwgYSBzaW1pbGFyIGNvbW1h
bmQgbGluZSBvcHRpb24gdGhhdCB3ZQ0KPj4+PiByZW1vdmVkIGJlY2F1c2UgaXQgd2FzIGluc2Vj
dXJlLg0KPj4+PiANCj4+Pj4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBuZWVkcyBhIG1hbiBwYWdl
IHVwZGF0ZSwgYnV0IEknbQ0KPj4+PiBub3QgY29udmluY2VkIHRoaXMgc2V0dGluZyBzaG91bGQg
YmUgYWxsb3dlZC4NCj4+PiANCj4+PiBJIGFncmVlLg0KPj4+IA0KPj4+IENhbiB3ZSBoYXZlIHRo
aXMgb25seSBhdmFpbGFibGUgdW5kZXIgc29tZSBzdHJpY3QgdXNhZ2U/IExpa2UgaXQgY2FuDQo+
Pj4gb25seSB3b3JrIHN0YXJ0ZWQgaW4gdGhlIGZvcmVncm91bmQgKHdpdGggc29tZSAtZCBmbGFn
KSBhbmQgaXTigJlsbCBvbmx5DQo+Pj4gcnVuIGZvciAxMG1pbnMgYW5kIHRoZW4gaXQgd2lsbCBl
eGl04oCmIHNvbWV0aGluZyBsaWtlIHRoYXQgd291bGQNCj4+PiBwcmV2ZW50IHNvbWVib2R5IGZy
b20gdXNpbmcgaXQgb24gYSBwZXJtYW5lbnQgYmFzaXMuDQo+PiBJbnRlcmVzdGluZyBpZGVhLCB0
aGF0IHdvdWxkIGVuc3VyZSBpdCBjb3VsZCBiZSB1c2VkIG9ubHkNCj4+IGZvciBkZWJ1Z2dpbmcu
DQo+PiBSZXViZW4gY2xvc2VkIHRoZSBQUiBiZWNhdXNlIGhlIGlzIGhhdmluZyB0cm91YmxlIHdp
dGggdGhlDQo+PiBPQ0Egc2lnbmluZy4gQnV0IHlvdSBjb3VsZCBhZGQgdGhhdCBzdWdnZXN0aW9u
IHRvIHRoZSBQUg0KPj4gYW5kIHNlZSB3aGF0IGhlIHRoaW5rcy4NCj4gSSBhbSBub3Qgc3VyZSBp
ZiBJIGFncmVlIHdpdGggdGhlIGFyZ3VtZW50OyBhZnRlciBhbGwsIG9wZW5zc2wgYW5kIGdudXRs
cyBib3RoIGhhdmUgYSBzdGFuZGFyZCBvcHRpb24gZGlzYWJsaW5nIHRoZSBjZXJ0aWZpY2F0ZSBj
aGVjaywgdG9vLg0KPiBBbmQgeW91IG1pZ2h0IGJlIG5lZWRpbmcgaXQgdW5kZXIgY2VydGFpbiBj
aXJjdW1zdGFuY2VzIChTZWxmLXNpZ25lZCBjZXJ0aWZpY2F0ZXM/IEluaXRpYWwgZGVwbG95bWVu
dD8pLg0KDQpXaGF0IGlzIG1pc3Npbmcgb24gUmV1YmVuJ3MgY2xpZW50cyBpcyBhIENBIGJ1bmRs
ZS4NCg0KSSB3b3VsZCByYXRoZXIgaGF2ZSBvbmUgb3IgdHdvIGZ1bGx5LWRlc2NyaWJlZCB1c2UN
CmNhc2VzIGluIGhhbmQgYmVmb3JlIHdlIGRlY2lkZSB0byAocmUpaW50cm9kdWNlDQpzb21ldGhp
bmcgdGhhdCBpcyBhcyByaXNreSBhcyB0aGlzLg0KDQoNCj4gV2hhdCB3ZSBjb3VsZCBkbyBpcyB0
byBkZWxlZ2F0ZSB0aGUgZnVuY3Rpb25hbGl0eSB0byBiZSBjb21tYW5kLWxpbmUNCj4gb25seSAo
YW5kIG5vdCB2aWEgdGhlIGNvbmZpZyBmaWxlKS4gVGhhdCB3YXkgaXQnbGwgYmUgaW1tZWRpYXRl
bHkNCj4gb2J2aW91cyB0aGF0IHRoaXMgb3B0aW9uIGlzIGVuYWJsZWQsIGFuZCB3ZSB3b3VsZCBh
dm9pZCBwcm9saWZlcmF0aW9uDQo+IHZpYSBhIGZvcmdvdHRlbiBjb25maWcgb3B0aW9uIHNldHRp
bmcuDQoNCkFzIEkgbWVudGlvbmVkLCB3ZSBoYWQgc3VjaCBhIGNvbW1hbmQgbGluZSBvcHRpb24N
CmFuZCByZW1vdmVkIGl0Lg0KDQpBIHN0ZXAgYmFja3dhcmRzIGhlcmUgcmVxdWlyZXMgc29tZSB2
ZXJ5IHN0cm9uZw0KanVzdGlmaWNhdGlvbiwgSU1PLg0KDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoN
Cg==
