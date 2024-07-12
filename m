Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275112B71
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jul 2024 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793827; cv=fail; b=Dgyx+JkQqXktD4JPZMT5hGHuIrqdEZNaKFRKXaTMsUfU/43uVrQkMVAxbT1WP9of5WrlSN7H6m+Wxrm+GT2v0Zu+MiwUYUswLNL0Cw6JXjh+DIbDHQ8LrdlB9R7tfCkLOdHM6QyBJWidOWJVhOsStFr4XPJOrJd15TS0WAm/HYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793827; c=relaxed/simple;
	bh=VPciGEaKl4fNJbJaAW+ifQ9d0p6E+/7oCfduYhWclCs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O6ibph+XuFTbPc6l7pg8oph9RXoB39HuTU/65NO7ctmyj92nUzqfFQekMRdyy/1OEVZtbkdzFRMmVgkrI0XL+YQyx2YDdT9Y1nfILYrQq3OO1LD1XE/7ObG2yEBDVZT5jYrbN64RC+GzdBkWaw2zP3qSe8/ta0rdwVyifU08ACI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mYidLJ8c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MPktUUrZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mYidLJ8c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MPktUUrZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CDIU1M028074;
	Fri, 12 Jul 2024 14:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=corp-2023-11-20; bh=VPciGEaKl4fNJbJaAW+ifQ9d0p6E+/7oCfduYhWcl
	Cs=; b=mYidLJ8c3tLA+1d1+v/Hk66RciDAGOlcpXt00C7C82xNXXr+YL73bShpH
	s1uTBXI3OzEvqk53zy1B74KsR7s4CJsKebver8pSUS/PyGSw5FElSfKBaZECrb6l
	p6PYCRYMRvDrG3UuJraFltnXQNPdOXLZuMF35vGLQcVRRCOodXX2lcOZ9KRSSGO2
	tgFgoj26faabwKzcBBM5aMSqopwDeZKmh4uHDuMa7pZSZac+3lOP4S1Vm14v1SyD
	lAfflkEgwq0hSvVMG4x7kjzQb3p/zppS/WuSITuqzsAosDX5RyT1VAlPXpHtVzJH
	0BZDC7a4mEJnWgBJ/vXgtsr+gq0qw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wkyc5fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2024 14:17:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46CDSQAd028935;
	Fri, 12 Jul 2024 14:17:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 409vv6d8tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2024 14:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHfj0QxugQQz7EdCUPI/TBbS8RIZTkaWmMuHauszt10RtK/X3/A9MZT8gEaDMkdaEGzK6xZM0uGF6Tiv9JYl1qvIKoBZvTgR6v1EnjOM1v4gCK/9P+XH1YjaeqjmBJBaHmWy6biREDTaxjmBa9nYGHJk8pB2Q45LNdVaJcZoxGOk5iQtKpG67A+TrpaeMuxa/eb66H8n093SC4mMd7ZNweQKWNXAkUxsEZmiI6shm7oXzbKPDFofIUD7nB6faW0mrlK3Ds4mIwt6O/39nWAAwl41oxDg4bDWV7meFgfTGiDSUMBHPCQScmoOhcg1qmRxI72ayPCcgXRfpmi9WUsjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPciGEaKl4fNJbJaAW+ifQ9d0p6E+/7oCfduYhWclCs=;
 b=i+iG8x+8cuXtulVZIqf1AhTdY/DT0+C4VjUp00gRmxG+Qx+J22k9Q6J40bvpssr/cmswAh2VFdy78FQ1fuHhn99Y0yq04EyWUr1tkjqobqgrEGUZX9lwhyJvE3XC6b+XBOWlFTZAs2SY1Fb5Y0u1+AUY2oOMoDgHXcZTDI56NUnI3tHqNwkQTkaizOBVNZ01+FeU91KbG74S979/u6KIwh/64mvz8vjpo8bRDeDL1RAh1fxoIPuCmulsl8f2S5+PvsZxL/SSddCcKa039ruWxe1deYe2SzMtCY85zV9On3GiPHUa11fJi95VwXbT/QCMGanFU5kQcovZwWJqSf+PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPciGEaKl4fNJbJaAW+ifQ9d0p6E+/7oCfduYhWclCs=;
 b=MPktUUrZ0Diu3KbaGbIk/gMueUjzR1eLpsi7auN0r0eMwlckEDeBQtrpJH1ceDhOy1xgtlyQ27hejqyGRVk9DqSQAAIDSK7fGpH6JPEbixeUCz1kLO4IoveE0JmeR4lQDUAXvtf508vTaL0Eh3F8fAstH5tYDjhFnX+GCzP6suE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 14:17:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.7762.024; Fri, 12 Jul 2024
 14:17:00 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
CC: Steve Dickson <SteveD@redhat.com>
Subject: Re: patch review for upstream ktls-utils
Thread-Topic: patch review for upstream ktls-utils
Thread-Index: AQHa0V3nlsPf38iL9Uyi2p0TWjDKXrHxo6YAgAGF5AA=
Date: Fri, 12 Jul 2024 14:17:00 +0000
Message-ID: <A579F7B3-0044-4EF1-8AEA-BDAAC93BF536@oracle.com>
References: <EDDA7FA4-FEDF-4687-A6A6-112D9CEC90FA@oracle.com>
 <51FCC68D-03C0-4B96-BAD7-9248D6D80405@oracle.com>
In-Reply-To: <51FCC68D-03C0-4B96-BAD7-9248D6D80405@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB5765:EE_
x-ms-office365-filtering-correlation-id: a25d9203-a080-45dc-3b5b-08dca27d4bb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NThWcWh6cGE2cG5mc2lRMi8rQnE2VUd1NksvMnhsSEJQemZmMG5udkNGYWZ5?=
 =?utf-8?B?emhCeWJpTnF1WDhPSTRhWTdVM2kvQkwzZjVWOVQ5UnBmbDJkc3RkYzJ2bXBH?=
 =?utf-8?B?WC85Q1QvNG9nVk0yeWttNGV2SFhhSkVTU01pZE93Nzk4NUVDaXZWRy9rWTl6?=
 =?utf-8?B?bU8rdGVuNU5SM0djOXdrcEl0K2RMdy9xVjRBdjdjOUQrRUVMTXkwaDF0ZExl?=
 =?utf-8?B?bkhEZENIamZKQmx1d0dFY3lEM2thY0dXN2VMZTlwYjFwSVZaUmZzeUdESHU3?=
 =?utf-8?B?N3IxajNFaWV3RXpqaGRWeDZLRHk0RGFiWlR6U05QcjJNWm03anlIdzQzc0w3?=
 =?utf-8?B?dS90RmVEdkVjUUVVQnZxWnhraG1wRi8yS1k0bkJHczIySVpacGkxNUlicmZk?=
 =?utf-8?B?QzhwODF2WUppMGYzU0s0U0xJeVhaNEYyS3kra3IxdU5ycjh3OGw3L0QrYkJ1?=
 =?utf-8?B?UEIyLy95Sm4yWUppTkNsVkFPRmRVV2txS0hHMFhsQkZzVmFwc3JXakNyMERR?=
 =?utf-8?B?VHNSMzFyTTdTWkZNelFpQWNmYTRYdkxhRXNzY04zK2pOUVR2UUY3N1ZmNGZw?=
 =?utf-8?B?ZVQ5RFdqd0RTRVNuMGFLaklETkRsUE9vcDBQVlVmYWI5YjFpTjB3S2h4WGhz?=
 =?utf-8?B?VXBqVndIdkwydFJRY3FNdXVPNDI3M2xiSmpYRHNZY0VRM1dmREozdU85N3FO?=
 =?utf-8?B?UUNLVjMxUTQwSHg0NThnS21sTDVUVkNYKzNEaUllRk1waURBa3pCOEM5Y3Vu?=
 =?utf-8?B?aWgrbkJUSjdsZVBhUzNaU2pNdjRDMUlPWWtYTVhwMitKeS9uV0N3Z0NzenNU?=
 =?utf-8?B?bDcvTXcyMEp1a1BGV2M2K2dnK1U5NW5qaC80c2VUQjdKa3ltY01RWW1FRGhz?=
 =?utf-8?B?V2Z6aVlFbmtqRUZpR2dhSVpveEMyaFAyNEYrazkrdHUyWHBEVWhhOFhMZVdt?=
 =?utf-8?B?c3FxZUVKM3B1L3FVc2lBaEhLeTQvZlpBNU9rZFVVaTRPV1BXbXpHdEFjNjBm?=
 =?utf-8?B?UVBRVlBoSURBSnRWekN2NlJXMEpXU0pPZUhNNmFFMkFwNkFCRDZ5Q01tU25I?=
 =?utf-8?B?aFY1YjFBRElPUEFGM3czTnU5R2JoanA1SWZma1pKVHA1Zyt2dFVaZ2ZCdXRD?=
 =?utf-8?B?eFY5VlNxWFpWZURBUEMyYkRFUGh1T0kzY0lwMGVTOHZCaGpiYThrb0Fxejd6?=
 =?utf-8?B?aG1kU2l6L01HcGpyZ1FyYTZmN2xRRXVOTzhCV0FwcFhZOHJPeWpCd2lTVnI5?=
 =?utf-8?B?MDAwL3hOS2gvc002UnlKYTNoYzdrdWVXeURRc3BVcmlUYitiVFV2MW56TDlN?=
 =?utf-8?B?aERuVjBkZ2lldHZ2Wi9IMkd4NGx3a3dzR0xrVjRmUERhVkNwU0JyRDZHUDVH?=
 =?utf-8?B?YXRFR2thTEl1bVhYTzJ4Z1c3amxhalp3bzBHQTJpT0ZQV0ZtckhtclowOXpM?=
 =?utf-8?B?N21Qajg2bnk3RXhtUmVuWmdBdmltY2ptUFBwZExyVUs5QTM1dzFyVWRwKzhy?=
 =?utf-8?B?eCs2VjMyZGlpSnNGOXVXek8vWWxWTENCb1NHTlo3WkNNNXdxYzMwcVBJMXpl?=
 =?utf-8?B?UGxXT0xmTjMyRDVxTUlBTVJnTXdRZzlOMUE3T3FpcHNXblp3QkpraVZBTW40?=
 =?utf-8?B?ZHpIUkk5Nm9zQStJV05jNUxHTGs0YUU0UytCWGRiUldCZUlxQUZORExaaTM2?=
 =?utf-8?B?R0lsU2dCdklkOXQvUk5hVDBaK1RBOE9reFU1WitnU1p6UVBzaFE0b1UrSlUv?=
 =?utf-8?B?cHhWcHByblBFWHpMcHZ6dDc4UXpxQ0R6dm84WndVK245dEV0QzZWZjlLZlZp?=
 =?utf-8?Q?gpmhgUNA+X8gcTMRsnCrZjnjO6SsG++OAkdBM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NVlkYStHbW5kQVRqM0RZVGNzNVZ0RnVMRE9WQld5YVFFYjluVHhVUFlYK0hy?=
 =?utf-8?B?eGRScUo5ZVl1M3JjRDdUcFFFcGo3cU1LNldUeVkrekRWc2VvdFBNanByRmpz?=
 =?utf-8?B?TVBWK2ZiZHl4d3VGSWxEUFdoTXVpeXlCVEIzYzZWY1NCaGl1MkVGV3N6YnEr?=
 =?utf-8?B?ZUlvUmJUUm9CTDBRa1JlNTJTVXpjeVBoZUYzWEJQRkRWOVRIbmp5Q1dxdjZ5?=
 =?utf-8?B?MktxaThoUnQzZjBXSVo2NVpIbUt4Qk1pY1ZWYWtqTFBhaUJka0RpcDhSZzR3?=
 =?utf-8?B?bExXdWFzbHlpUkpVY0Z3eHdNWlVKRmZRbEZTNnE2RlZPZTRvaUNYeVp0M3J1?=
 =?utf-8?B?UCszRXNSRmRHNFZCRFVVTExzRXNRcGJ1WXd2ZENHSWpMQ3prNHlrMnpYYm9N?=
 =?utf-8?B?end2alFtTmNpS1lmVVNEOXZrVlhOYXdqeURRVmNKZDRSOHFEYjBZNjRabitw?=
 =?utf-8?B?STVKSnVGODEyUlI4VitGSUpCQzA0ekZ3Qmo5WGx6OGQzeVB4OHRXY2dyM1JR?=
 =?utf-8?B?VE0yMTN3UmROSHhXQm9DSkNlMHR6YTFJZFZESWNHWjlmZVFvU1grRHBzQ2F4?=
 =?utf-8?B?MkQwajRCb3o5SjlwaDI2Z2I2S0QzbE9CSHY1Nk1BdWd6L09Dc25OMWdrUGZq?=
 =?utf-8?B?U1ZHU0hyUXQxcE1YR3ExK1VnbllFNGtuTjA1TlNUQ3p6SFU5cmkyZ1M4U3ha?=
 =?utf-8?B?S1ltaml1UGhwUGVqaklBZG9keGMwYjlzRVRrZXBUdElFSU5SNkdVb3p3ejJ6?=
 =?utf-8?B?bEY0LzFycDhxS3h3S0xubU5yNHBtbitFR0tzSXQ5RWxHU2lCblBBMEN5WGps?=
 =?utf-8?B?bTgxTEdZczRBRTg1NDhQY3dSakIxWjZBYWczMEtmclIvb1E1RExZWm42ZXpo?=
 =?utf-8?B?amt6WTBoQW8zeDJYRVYzN2w3c1hsMWxIbkp5WDJPaHZnTU1qSCtObnlRNldB?=
 =?utf-8?B?aDBPUm5GZmJZcXZpL1lYQWRpL1N2TGNhOU92WHVmbHF1MDZoLzNGSUg1cU5X?=
 =?utf-8?B?SEhuWTNqSEdmSWorb0FsOGNkMVlzb1hTQTdBdGdZVGpFYlhza0VYNE9xRkEy?=
 =?utf-8?B?bURZZ2pWNThlVEVLSk5kY0FKVFFHWGgwSEFST3FtbTJYaGFhTHk1NHJqbzVs?=
 =?utf-8?B?aXc1dVZlUXo1ZVhXUERKQ29jOHVXQ1RvRmo5R0EzeUtWcVFkVHNWOS96TWx2?=
 =?utf-8?B?eTdYUEhWTGtwZ2dzOFpSaDlYMzF2Sk45RE4zclI2cUtQR3liYkg4R2J5NVNu?=
 =?utf-8?B?ZDlmNnlYSGpNNDArRWxsczI4NENFZDRCK1dkaUI0WThaRlZJeWk1V1pTZ2NQ?=
 =?utf-8?B?ampNand3SEx2NkhzNml0M0U3VXBFR2F6cTlWeUpHanllU1l5d3A1TUxsRjIw?=
 =?utf-8?B?eHhsYytZbEdXUVloMGd1SUV4MnhmL2ZYWFBseml1YVA0ZDBYODh0c2pTMmNy?=
 =?utf-8?B?endFVHIvRE1raXY2VnpDTmxXa0NpdDhjY2dwRzNySjVFY0crYUovNzFCbE1Y?=
 =?utf-8?B?ZS9ZZGRFdjNZOTNkdnpMV2ZHQTZYV1N1YStWOEF6c28ySUpzNTlya2xlOWlx?=
 =?utf-8?B?U29WcGJCWUMwcndSMlVDNFZBbjdQNE9qNVMwYlNMR3RtU1lDK21lSFlvVzNJ?=
 =?utf-8?B?VWZYeXZ5Zm5nZTNlZmwxMlUvR29Xd3RhS2dlb21GZm1sKzV6Rk1xM3RFdSt1?=
 =?utf-8?B?dVExMzIvRm95aGtIM2tBSTJYWVFQUUYyS1p0UHRnb0kxNksxc0NSY0xXU1JJ?=
 =?utf-8?B?NUlmNi9NeUt2akwzWEphdUlSK0pxMEhwNGRjNFd6RDhaZjQ3WEtIeGhRMW96?=
 =?utf-8?B?NjZqTmxvYW9tNmJ5dTIwQ2ZKbWlxUjg4RGUzNlNDbDROMmUrNXdvamdvL0dF?=
 =?utf-8?B?SUljUU9aRW9DbitDK0VIYXN4bEZGVWJhSElnUmxUM2V3RnhTRG9GT001dTBS?=
 =?utf-8?B?VnBBL01STEtod2E4bkErUXNIeDAvVDFLN2s2R0I4SFRrbmlyQnRabHJmMmdm?=
 =?utf-8?B?VWUvZDdCZDVLbnVMOXZBUXBTQ2hyMnp3bThvUXhDUittTjFUQ2RqSVhFRE4r?=
 =?utf-8?B?T3dHbmpoUkJBcE5CSWVNSlVDRXFnYUx2R3ovREg4bW9BMGNMdzc2MjlSOVli?=
 =?utf-8?B?bStsYWdCMkl1Nmc3ZTZsaTU1WEZCRnpZT0Jlc2tmRGE4cFRRR3doZUwzUFBk?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56F62E1CCF422E48BC276A5857B0172B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XRJsRwFdz/h4CCJ6qceUFNXMJzzVvnXsCLB+l0UCvgAFt+aIG2mJp9n6RW5EfDWDmGuXnaq0Fj12ht7HCokwEhtjsVLhTxSztdji7UX02PcpWiFuwOFC4aY2d8eRenoeeI/+ohYkuqVd+Q5N8kpqkxUhcQVANxchMwtbBCctz3ynX69GvBTTOX8Cps+lluDHlfrZhxh/9n56oJT4bIuLrcE6cy/muKqCNALAZ2Dsl+bgoYQUMkyvMJZkxcv9rV2TlqQQ62r1e1Dm+0oqe1BBfjSvsgQa/2X8086+UnjTDzgfE7qmYymOYNbHZLXdGlh/OOLcFxulBNiPC6DVbsKyvUVhfFvyCXHDZFNUOuiu/qqJJYueo/TrEZYvpjrEAqv/YNL0uIDdNTSNk51GAtMkoV5PtnH2pAObA5F8NiAMq+pQY7PmCtJckxVOdhG6O3//NQ9ABtfDWMB4cRko9OwBhx60hC5XiI35MJ+hS1BZc1Q90Na7ixRuzsyJtgymILJL9rrtixiQI4su0ACM1rP1+BOjmgBQQ66IGfAWsRW9KvZLg9GVVExx0ShGsL/iR1to3gFInshoPgDTZOV/XWTyKNQq1nOvs1iE23f/TskBxdQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25d9203-a080-45dc-3b5b-08dca27d4bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 14:17:00.4325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KavP05yBtSXMyocUhJjdgW2mJ/Qk0+nEhcbk9tEoWa2MLczl1pbV72wegRiQl0Pwsuiq0jWCzQdHbGk7CbxV5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_10,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407120096
X-Proofpoint-ORIG-GUID: -yZwND_6ppR2dDBp3vhfvkiTmOJpoKy9
X-Proofpoint-GUID: -yZwND_6ppR2dDBp3vhfvkiTmOJpoKy9

DQoNCj4gT24gSnVsIDExLCAyMDI0LCBhdCAxMTowMeKAr0FNLCBDaHVjayBMZXZlciBJSUkgPGNo
dWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVsIDgsIDIw
MjQsIGF0IDE6NDDigK9QTSwgQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5sZXZlckBvcmFjbGUuY29t
PiB3cm90ZToNCj4+IA0KPj4gU3RldmUgYXNrZWQgd2h5IGEgbnVtYmVyIG9mIHJlY2VudCBjb21t
aXRzIHRvIHRoZQ0KPj4gdXBzdHJlYW0ga3Rscy11dGlscyByZXBvIHdlcmUgbmV2ZXIgcG9zdGVk
IHRvIHRoaXMNCj4+IG1haWxpbmcgbGlzdCBmb3IgcmV2aWV3LiBUaGUgYW5zd2VyIGlzIG1vcmUg
Y29tcGxleA0KPj4gdGhhbiBJIHdvdWxkIHByZWZlciwgYnV0IGhlcmUgZ29lcy4NCj4+IA0KPj4g
VGhlIGluc3RydWN0aW9ucyBmb3IgY29udHJpYnV0aW5nIHRvIHRoaXMgY29kZSBiYXNlDQo+PiBh
cmUgaGVyZToNCj4+IA0KPj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFjbGUva3Rscy11dGlscy9i
bG9iL21haW4vQ09OVFJJQlVUSU5HLm1kDQo+PiANCj4+IEl0IG1lbnRpb25zIGNyZWF0aW5nIGEg
R2l0SHViIHB1bGwgcmVxdWVzdC4gVGhhdCBpcw0KPj4gdGhlIHVzdWFsIG1ldGhvZCB0byBjb250
cmlidXRlIHRvIGNvZGUgdW5kZXIgdGhlDQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3JhY2xlIHBy
b2plY3QgLS0gcGVyaGFwcyB0aGUNCj4+IC9vbmx5LyBtZXRob2QgdG8gY29udHJpYnV0ZSB0byBP
cmFjbGUtY29udHJvbGxlZA0KPj4gcmVwb3MuIEluZGVlZCwgZXZlbiByZXBvIG1haW50YWluZXJz
IGFyZSBub3QNCj4+IHBlcm1pdHRlZCB0byB1c2UgImdpdCBwdXNoIiBvbiB0aGVzZSByZXBvcy4N
Cj4+IA0KPj4gU28gZm9yIG1hbnkgcmVjZW50IHBhdGNoZXMsIEkndmUganVzdCB0YWtlbiB0aGUg
UFJzDQo+PiB0aGF0IHdlcmUgb3BlbmVkIG9uIEdpdEh1Yi4gT25jZSBvciB0d2ljZSwgSSBoYXZl
DQo+PiBlbWFpbGVkIGtlcm5lbC10bHMtaGFuZHNoYWtlQCB0byBhc2sgZm9sa3MgdG8gaGF2ZQ0K
Pj4gYSBsb29rIGF0IHRoZSBQUiBvbiBHaXRIdWIuDQo+PiANCj4+IEZvciBwYXRjaGVzIHBvc3Rl
ZCBkaXJlY3RseSBvbiBrZXJuZWwtdGxzLWhhbmRzaGFrZUAsDQo+PiBJIGFwcGx5IHRoZW0gdG8g
YSBwZXJzb25hbCBicmFuY2gsIHB1c2ggdGhlbSB0byBhDQo+PiBHaXRIdWIgZm9yayBvZiBvcmFj
bGUva3Rscy11dGlscywgYW5kIHRoZW4gY3JlYXRlIGENCj4+IFBSIGZyb20gdGhhdCBmb3JrLg0K
Pj4gDQo+PiBVbnRpbCBub3csIGt0bHMtdXRpbHMgaGFzIGJlZW4gImV4cGVyaW1lbnRhbCIgZW5v
dWdoDQo+PiB0aGF0IHBhdGNoIHJldmlldyBoYXMgYmVlbiBhICJuaWNlIHRvIGhhdmUiIHJhdGhl
cg0KPj4gdGhhbiBhICJuZWVkIHRvIGhhdmUiIC0tIGJ1dCB0aGF0IHdpbGwgYmUgY2hhbmdpbmcN
Cj4+IHNvb24gZW5vdWdoLg0KPj4gDQo+PiBJIHdvdWxkIGxpa2UgbW9yZSByZXZpZXcgb2Ygd29y
ayB0aGF0IGlzIHN1Ym1pdHRlZA0KPj4gb25seSB2aWEgYSBHaXRIdWIgUFIuIFRvd2FyZHMgdGhh
dCBlbmQgSSBoYXZlDQo+PiBsb29rZWQgaW50byBzZXR0aW5nIGFuIGVtYWlsIG5vdGlmaWNhdGlv
biB0aGF0IGlzDQo+PiBzZW50IHdoZW5ldmVyIHNvbWVvbmUgb3BlbnMgYSBQUi4gR2l0SHViIGRv
ZXMgbm90DQo+PiBhcHBlYXIgdG8gc3VwcG9ydCB0aGF0LiBJIHN0aWxsIGhhdmUgdG8gY2hlY2sg
dG8NCj4+IHNlZSBpZiBJIGNhbiBzZXQgdXAgYSBHaXRIdWIgQWN0aW9uIHRvIGRvIHNlbmQNCj4+
IGVtYWlsIGZvciBlYWNoIFBSLiBUaGUgdXN1YWwgYXBwcm9hY2ggZm9yIEdIIGlzDQo+PiBmb3Ig
cGVvcGxlIHRvIFdhdGNoIGEgcmVwbyAoaWUsIG9wdC1pbiB0bw0KPj4gbm90aWZpY2F0aW9ucykg
YW5kIHRoYXQncyBhd2t3YXJkIHRvIGRvIGZvciBhDQo+PiBtYWlsaW5nIGxpc3QuDQo+PiANCj4+
IEknbSByZWFjaGluZyBvdXQgbm93IHRvIHNlZSBpZiBhbnlvbmUgaGFzIG90aGVyDQo+PiBzdWdn
ZXN0aW9ucyBvciB0aG91Z2h0cy4NCj4gDQo+IEknbSBzdGlsbCBsb29raW5nIGludG8gY3JhZnRp
bmcgYSBHSCBBY3Rpb24gdG8NCj4gc2VuZCBlbWFpbCBub3RpZmljYXRpb24gZm9yIGVhY2ggcHVs
bCByZXF1ZXN0Lg0KPiANCj4gSW4gdGhlIG1lYW50aW1lLCBpZiB5b3UgYXJlIGludGVyZXN0ZWQg
aW4gZ2V0dGluZw0KPiBub3RpZmllZCBhYm91dCBwdWxsIHJlcXVlc3RzLCBwbGVhc2UgZ28gdG8g
eW91cg0KPiBHaXRIdWIgYWNjb3VudCBhbmQgIndhdGNoIiB0aGUgb3JhY2xlL2t0bHMtdXRpbHMN
Cj4gcmVwby4NCg0KSSBoYXZlbid0IGZvdW5kIGEgR2l0SHViIEFjdGlvbiB0aGF0IGlzIGFwcHJv
dmVkDQpmb3IgdXNlIGZvciByZXBvcyB1bmRlciB0aGUgb3JhY2xlLyBwcm9qZWN0IHRoYXQNCmNh
biBzZW5kIGVtYWlsIG5vdGlmaWNhdGlvbi4NCg0KSSBkaWQgZmluZCBhbiBvcGVuIEdpdEh1YiBp
c3N1ZSByZXF1ZXN0aW5nIG1vcmUNCmdlbmVyYWwgc3VwcG9ydCBmb3IgZW1haWwgbm90aWZpY2F0
aW9uLCBidXQNCnRoZXJlIGlzIG5vIHJlc3BvbnNlIGZyb20gdGhlIEdIIHRlYW0uDQoNCmh0dHBz
Oi8vZ2l0aHViLmNvbS9vcmdzL2NvbW11bml0eS9kaXNjdXNzaW9ucy8xODAzOQ0KDQpGb3Igbm93
LCBwbGVhc2UgIndhdGNoIiB0aGUga3Rscy11dGlscyByZXBvIHRvDQpmb2xsb3cgcmVxdWVzdHMg
Zm9yIHJldmlldy4gVGhpcyBpcyB0aGUgdHlwaWNhbA0Kd29ya2Zsb3cgZm9yIEdpdEh1YiByZXBv
cy4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
