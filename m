Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9284265614
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832024; cv=fail; b=PdlB/H/Dj36pLXxfDpYjmR1v1pV4zZ2ig/rDc/xQG8mZH6/eOzI6Pu6sVUKNCPBoTziubwMFkt2RevZMIWOKpo5/u6bokOp+0w6YdnAMH/jRF059mlf+JXmTP2qo3oFHyXErCKN6gSuwPw9Hc2WKSQmueL324YiPqP9Y2mLjlQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832024; c=relaxed/simple;
	bh=M5NxlMcuewQAlneTgQt/MQ3fqpxq0RBIzPSxbUp9At0=;
	h=Message-ID:Date:Subject:To:References:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=cu/djNc1lYKK1ELISS0gPoMDxYV5z8BIlurn5tnzVitV+x+FN92T8N1y+3eFGD0rJkkktL8/55sAWsKMCkX3wX69eMh0MKS39djV/gZpmysVubyn6Mwqjmmj+GLHRxY1C5b1mzlMwqttp8XRn1unfSVLeGD1x4NEfiI2ucIykGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aZcFx6A/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ab+CKhDj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aZcFx6A/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ab+CKhDj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCCKcY024559;
	Wed, 21 May 2025 12:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h2xss7BeeFJ0ZFsBmJvxLpAv0/gSSp9Zucc4DuGZdO0=; b=
	aZcFx6A/LEZYCsLqCBCbFnK7LN7Fm2l0xRZWgfQXIYVmR5H5LiomGKmXsaiP+Dp2
	x65ZUI4csCozndieRbYteQamqS4qmR3r+Qpu4kd5vw4QdkMlsIXh6xXL0wx6wNe4
	f/GsC+9h/Hg+KJquhiyL4L4pAPT3jHGl2fC5lcPT7OyRzJMo/mGG67klpXxfXzs1
	WggfhBP80JeAve3UBJTPp+pb9AMfB/XTf8M1Df4CsXawIWKwzNtKYPj2GScLrpW9
	mYGGSx8ZETE78LTHzjg1grJucm5JoEr3BYzR6gYcMvBlb5ZPd7ZtYhdXWByQYpT9
	CfATfffUcYXVcTMZjwdpmQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46semgr2sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 12:53:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCNtBD001747;
	Wed, 21 May 2025 12:53:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwesadqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 12:53:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJz2PHpxyxVJ8+tDEQ2/BWQsZ6w2qKtFSFEIuF8GuDbZx5H1luP5HiokHWL6lTcGy70+xmut3HVQEA1zSpvsYzbRRb/7dsP6Fi9Nuy5JXMC5saffdpzD3/Fp9r1PsJrgn1tDrtwH9Y9Wg6LapfX0BLC3SZjPYG3UrY/LJXGiNPLJ7DstUuhK9nCzfwDVp3/p9ZPSYjB6rKJMoTtBKtBQePzTyIRSSGH1AjJE3Jrp3I2EwWR36BUSxX9wltQ62DvmwBDITJfV3uEJmzBSpHYugNDUDpGo7Lpqr/K1YLJ2PoROWLaVUe3S6fyANEgENa2wAkkfwgfk+VwRRK0MRpKCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2xss7BeeFJ0ZFsBmJvxLpAv0/gSSp9Zucc4DuGZdO0=;
 b=rIm11qyYDj8jzROJloVbDKR/l3jXXHtwOyBn59fSKJU2+Ejudwa8ToVIjaG45Z5M5UsS/kvNuw7kex15Bb8fVlbEBi7XFonKBcwoL2AG5qJro1wianvJJgA6kfhc546uAUEgN5/09HLm4FN7EIKYL/ptEz1oX13W0cfX+hfnrvDTR9qMdrhLR+6HAW7TMIrGpzae6tlhK31Z7G3b+ZjAfRNR6Bh3nWH4VkK2BexsUXCtokzHhzEpLGkzvGd9Siy7oz6LjP748wdB6F6GVtJxk8AUba6VUp8nhiHNKn0zB8vLCKj4txApDwKFRbsxTb5TtV3FsAfwAjvsmfB/xYC0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2xss7BeeFJ0ZFsBmJvxLpAv0/gSSp9Zucc4DuGZdO0=;
 b=ab+CKhDjJfEYUyJnvsKfxm43JHEXWOxOukhveEEYFDjcl/vhM5+OO30h3CHxOfkyLfgeCipp4HQs88tVPndf8Huk5sY134Aae8EGBrEf/PPrc5CYCN6gJBAtlVLAGM1EkA+HUbqy2lOx1jJKNaUcMD8O/NZrRd1fujVsXA4h60U=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4164.namprd10.prod.outlook.com (2603:10b6:a03:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:53:36 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.031; Wed, 21 May 2025
 12:53:35 +0000
Message-ID: <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
Date: Wed, 21 May 2025 08:53:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
To: Hannes Reinecke <hare@suse.de>, Alistair <alistair@alistair23.me>
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
In-Reply-To: <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::23) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BY5PR10MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 45696be7-9773-4d48-247f-08dd98667f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVQ3ZWpGSTkvSzdLeHZLclpGd2t1WUtFS0FDYmJhRytBdHpYL2tlUEx4YkdP?=
 =?utf-8?B?TjNiK0J1SERCUGVEMFFkWmpoTk01cDl5Z0RHRTlMNjRETEt4alZBeEUrMnJl?=
 =?utf-8?B?MVhPSSs1ZGtBeVZrYXFCYkdNdTBaSUk2SWVYUzNhbElXL0wwbHMzZlg2ODJS?=
 =?utf-8?B?NThBbW1jaW5DK3d4azIvc29rWnNsWnRNa290L0ZEaDNxeTl2QnhEVldEU0pz?=
 =?utf-8?B?Uy8vaDBJV3dkMFAvRU9xSWdtVnczWG9keVhmaXFkT1I1bitHOU1Id2l2Q3Zl?=
 =?utf-8?B?b0JhMGZKc1pwOUF3ZEdKdlVxYnErdm00NEIrL2lXdEsybVZ6Z3IrdkcyYStH?=
 =?utf-8?B?WHMyVDI4QzZxZHduelIyZnpMTFQyUDFUd0xuVmk0UUV3cGgyZUtHOEtrSzFG?=
 =?utf-8?B?UTVtcVdqTkE5dzZ1TDVBb2NRaURTbjJvVFp0U3lKOUFTdE5RZ1lJdHVncGIv?=
 =?utf-8?B?ZmR6cXE0OXAzTU1vd2FpNzc0c1RzU05IY1lDdTRvaXNNU0VhZVN1RHNiMmwv?=
 =?utf-8?B?ZkNKMWRBak1PTU9vbHlzbkJHZDUwS045OTJCMERZM3ZmTXczVnc1alVvUmp0?=
 =?utf-8?B?NFVnYXExNllBOUhTc2JwdzlzeDZQSlNGRGtZSTZjTFRTZUhUaDc3cS9IRnJv?=
 =?utf-8?B?VFNobCtrNFNGRjdTSHd4bGkwRUlRbTQyMDZDUXhYYmNnYWI1TE1lZHpGWFFm?=
 =?utf-8?B?aHNGKzFhWE5uY1JKc3BkdjEyMTRzcWdpaWZjNjdpb3d2QzJHZ0FNY2Vkc2V0?=
 =?utf-8?B?dXRyeDJVV1ZiRkxhb1RzcTRCUHh2ZXVPQ24waVdVTWJMK3Q0dmRQcFdFak1D?=
 =?utf-8?B?Z1NWOURPeWQxaDZTVEc3T3IrN0ovbGhjTVFRbEhyQTVoc1Vxc0R3TmtXMzE5?=
 =?utf-8?B?bStFUGFZVHErTzRGcW8wMGUxMFgwMEZvUnBzRUdaTVFUQlRSUnEwYzZCdUlR?=
 =?utf-8?B?VXBCeStKeDhJUHlQVWlVczlsWHBQRUxtVmVpRDV6dm5lS3Z3TnpFT05DV0ZM?=
 =?utf-8?B?Y1NNVWFIYlRXZmpwQUsvNzZRcDQraE5WNlQzbXNhK29OWUEzRmdCdnk0K1hI?=
 =?utf-8?B?R2R1K0dvKzNXVC93YkMxSXFyTGg3UDk4Y0pPSWVZdmhXdmJSQVpRVkdQVDRS?=
 =?utf-8?B?dFFBdk5WWnNYTU1VZ1g1cmRBSU0yOEdQWXYwaTREa3htZVZzR3RvemlkY0NR?=
 =?utf-8?B?ZEtKSXZmbDlwd0J3UDNYS0JxdXhrT2FVUEZyWkxHaVBJT2loN3VOUXZEOTBU?=
 =?utf-8?B?c2FZRnhvTDlROTRvVTM4ckdrNmVnVFBIaStkYkFna2Z2WkpRajR6UUZYTXBz?=
 =?utf-8?B?ZXFpV2xEaUI2Uzg4TzF1WlFnaUhVbjAzZWwxbmdBM3JaZGkwMG5obDZpMXhh?=
 =?utf-8?B?TlBqU2pZMndaQThWdkkxUmFkMkp1UElGaG5QOC92bjZRT0U5ZmVoZHRnWW8y?=
 =?utf-8?B?eTFwU0d3elQwUFZYVHdSdE1tcjlTQlNtSDJJZktpU1NqUEVGM1VQUVdaQm0z?=
 =?utf-8?B?Tm1HdVlSSGdqaG1OQjFGbzRWTTJlSUh0azhEcjkrdUdqa290UlFubitZZHFj?=
 =?utf-8?B?K2ZOQWRxc2p1V2FZbEhDYThlbktqRXFSNjVvSzRYM2JkUFJycG9KaGhEZHEw?=
 =?utf-8?B?alJQZStnd3V0SC9aUUNsc2tseFNGTFlFem9UclFuS3p4dEljdFQ5dkFKSWRO?=
 =?utf-8?B?M1V1dVV5NkJ4MFZlR2hFaUorTWxtbjhoYWtjaTVwUlVaY3FTdERwZU01bnJB?=
 =?utf-8?B?Z3gxOGlLazFTejRrNFJ6aWYvY2c2cUVzRVRWakFNK3A5UHpHOGNtMm5wRmlD?=
 =?utf-8?B?Z2xWbXQ3NXZUWnVjd2YyeDNLRWZFa21nckJ2eGJxam80UUxkRDQ1RktSRlhW?=
 =?utf-8?B?cndwUk1PSVBHeU0zOElpbnNpMDFzYjJ4T3p5ZWowQytER1JLczQ0QTIzVVZH?=
 =?utf-8?Q?qVFEGDjLBXo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2FCWnRZL1BDV3p5ZGFtZndmd0ZKK3QxZ2tnd0Q2UmtrdHo3ODh6bWl2NG5S?=
 =?utf-8?B?eFlJSGIveEVFVVd0eVhZUHFjRjBsaisycEZtOEVic25Xb0JkZDgranFpZG1l?=
 =?utf-8?B?cGhpNGZta3hSbEtBMVZLbDZaTjlhTkJDZ0VGb09uMEhRRXAwd09FL1htWlVW?=
 =?utf-8?B?eEVsN1I5Y2hrSlQ2bFVlTUpkWGF3Uit5S0cxakM5cUJwV0VQcFpQSXluNXlz?=
 =?utf-8?B?VHkzcEN1VXZLeU5KYXlhWm9HR3gyUFZRMFBDUFA0L0FiYmxIM1dsTnVvc2xq?=
 =?utf-8?B?Yi85cmx4NTVYQ2dqdGRwLy9ZQmk5WHVITDVENXFwZjZwem8xWEt4VUtRWWVU?=
 =?utf-8?B?a29rZDRaN3hoV0g0R1hyeGxXbWJPQlZheklJdGJib0lTakdSNHVPYmZPQk95?=
 =?utf-8?B?V0dmS1N4Y09oNzNIbDJ5MzlEVnlEeTJGU0dEZWM2a1VUTnZieFEyYXdlbGYx?=
 =?utf-8?B?bFhMK2JLNVVheml1VmpLQkQ0L3d5Ykw5bFZpUkYzbFc3aXRFVUZvcS90b1ZQ?=
 =?utf-8?B?bFZzclhiVGZQOWY5eXd4MEMvWXpsR3FXV0dzbTNmcXpzZFo1TzdOc0NPSkU3?=
 =?utf-8?B?WnJIUUkweVRxYUZzbWxrZmN2OXdhWnV6S2hvanVoNm5oM3c4VDlWS1g3M0xw?=
 =?utf-8?B?b1ptbEhmRGMyZUVDc0cyTXpvWkxjTmZkb0tseFNZSmNCOUhnWFFjZmhTem52?=
 =?utf-8?B?VkErLzFBcjFEQnFmaHVJM2hMMXl4TnYzUFNuSTM4YVB5eEdTdUFUeTNoODZR?=
 =?utf-8?B?MktzeVZuWGVKeDhSUU5JOVprZWRmYUNxOStEVmx2akNpNW1GcDZQSHBEVmE5?=
 =?utf-8?B?dzExc1VCRnUxUmE1bVdSbDE0VTNaSWVBMW1yVmdMdmlyVkw3NGRnUlQxMmhF?=
 =?utf-8?B?Z3NscXRDYWh0c0NpWTUyNnJUSStzdnl0QkNzbkNMUkUwaXhRUkc1ZnRaT3hv?=
 =?utf-8?B?RFFNUTM5dUx2UndKSXQ4d3dvQmhQT0MwU3FINWREeExiYnJnaG1IMkJLRjlL?=
 =?utf-8?B?T0h6TU4xQVV5cmtUWjFqM3ZYVW5EZHRGUWlQSkduVzMyTTVLZlJZeDBsN3Er?=
 =?utf-8?B?bkh1M0h3M0RxWHExdm9PQW9ZR3dYa3QrL3l2akZqb2VuaDVZUk1rL1UxR2tz?=
 =?utf-8?B?ellqcSt4UjlobHRaV1ROdEEwMHVjYmw0eFZsV2ZnckRUaE04dlpnTXlETkRY?=
 =?utf-8?B?T2JpdjQ3K0tGT2t4b083N2s5cFRJT0h6MWFVRC9IdloreUpJc2YzZFVQa0pL?=
 =?utf-8?B?cnNXV0xLOEtTbU5rcFhabmhlS1dDRWN1QkZZQXFiUGtMNU03K1ViUG5leUx3?=
 =?utf-8?B?aWFRTElYWEpXNTd5d2JIeWpRVjdZckJPcklXTFNMUU85aEh3U2xzWE5MOUZh?=
 =?utf-8?B?eW10Q1phbVVVYWYzaXNvOFhtZmJSVFRyWi8vZk1CZlYxZ1RURWladXV5YU81?=
 =?utf-8?B?OHEvSkE2NlFzcUpxMWxJdEl6d3EyTml0dW43WnR2a1ZQMmlaMnNPTEl4dnBy?=
 =?utf-8?B?MVBqYkVNcDdCRVZoWU1RdFdvSS9CT2ErMldadk1rNkVKQ1ZQczk3L0hZQmFk?=
 =?utf-8?B?NE9ZS2YwbzZJcXJGOTJIVUUvbkRSQlBzMloyWEl3TmFlQ3RBZ1ovWEthSEoz?=
 =?utf-8?B?ZTRUQldFVDZNQ0ZaYTJMNU1HZGlzMFBtRU55MFljV0tRRzNzU1MzUDlWVGFx?=
 =?utf-8?B?dllRV0FZdis3Zm1ZaEJXZmdRMzg1bU9jeWtMcnVZV0xGUlI0ZndiRiszN0Nt?=
 =?utf-8?B?VzQ1dkdTTE9nVVFSUjlwSTRPajEvdlo5V1duSitTN2pWcWw0TlZiaGhZMHRS?=
 =?utf-8?B?MU1CWFpzWlVSbFdSV3p6YlZuK3VpeVRDNTQrTVhYdFpXL3Z4UHJwZ2x2dkE5?=
 =?utf-8?B?RjNNbmMvR253a3FEQUpyYlBMd2JFWFFFd3VTdHYzWXhCQWdHNWhaUHA5SHlH?=
 =?utf-8?B?ejRLbTNDOWp2ZUlNU21QbE84Y0l3V1l5ZkhyUWw1MjQ5Nld5NXArUTJ4NlJi?=
 =?utf-8?B?KzBEMXgwekJxVm03L2MwRm41MHcxWWhHWUhXRm9BWlBVejRXSkhleTRrYUlI?=
 =?utf-8?B?TGtzMTlVczZwVUhIcUw3V1FKcllLRkZKM090eGdBSC9TQjlaNzE5OFA5SlZ6?=
 =?utf-8?Q?neiW/7prueYkxHWWr39VJof4K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tcS97OI6xCB7bEIX1DP82Q7CeldpiM12BN62NwB8sJKYCeVrja6Bmhb3Gvi3SWb5GvznUI3g8cd0zactpx0imyBTq24bKarFVvX809zbT/7AmkPTh8IxW/5gwRtHI82F4tvcOK0vA4JR5KsKNfCVsAzRCYtoO+1HDvAnQTIwFq0PsEZ3VIZrlpfddSs7tHd/j9k6TsnEJmzNt7BWbOtT05qJx0yYPJJwo3d6wcgZTrYjIBXYH3dSOtBoBTWBe1CJyesNMIyhlGqlcJHiahalPfEeOjBd9AjYERfVOK9S6LkSeGoMkQAPp8cSlt6UgW1Liq8uYwm0AoI+DBPvFa2zMp2+UCCoL/h2ulUNf7DEA3pM1sOVCkNkoV2b1Ynp5lAREPmCconpk6H3lfS6NV1ya4SRpsI11nbAFtjirIP28k7nNw/2OSCZRi1BCfuUdzy8UvuRCNAMaFDkqlMDRbXc+9ssgLZ1Lc6Jj10bNedvjd63QvW3Yq5Be1GYPuE7Q2iwQGkd5YjgT4K+dkv57s26Tu146I+SWT2sB9rDFUfPCytaBbxuVCgstJ5O7czgDx1UBDmjOpo8RU8M9lAjrdiSq19l3T6xX06L/ZZPa6NF3Ls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45696be7-9773-4d48-247f-08dd98667f80
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:53:35.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0upC0D6MQNTlcO3O4AnKJVVObNDMaXNfh7IqieYt1jdZV5HG99fCkPBjvodrSyveeiOtjjJe75DF9A++fCoYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNSBTYWx0ZWRfXwODc3soVTkg0 lBiW9dh4tYdjB5WQEjaNHHqM2MdmBgV4+xjT3D2YIw2llBBuP5tn82JTXLZgaa0v5AYeGftPrVn WvY9l5X3MX+A2z6KKbtMpJJVGC/CulcW723SvuOKWWg/CVVPb1irhwgzRNJGb3SPBqaoiMObbes
 ILak3U6OTw0ZZWLlQMuVPHQcJuYrLigILD3PfNMTFNNJG/4MctC5NgRGVYdX1+Fg4KJvWxvhFiY h3yzN7ZFSbVrLO+2UGKjX9wiCRbi+WKrq33BH3FytEofKxoRtl2Q+Moz/ozIUCfY2HgTAaKD9RA nLUswASDJgnird7EfWxMnFE5SlFsqaMmM+CaXRP5VAhPmT0YYmD1BV0DBixatR2N5tLe/AkV18w
 l7vatnPG3OTumuMCJQa4OqMoYWb1EwrKUcCEKlm0PnRZa3ABalebwe6PpLwCKW3Ka2YFArYu
X-Authority-Analysis: v=2.4 cv=WNd/XmsR c=1 sm=1 tr=0 ts=682dccd3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=K_tj-crO6i9w7Ebs4XoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ieW4uB28inONe0iNDq8ASciW5SvwBSYx
X-Proofpoint-ORIG-GUID: ieW4uB28inONe0iNDq8ASciW5SvwBSYx

On 5/21/25 2:43 AM, Hannes Reinecke wrote:
> On 5/21/25 03:00, Alistair wrote:
>> Currently tlshd uses `fork()` to fork the entire process after the kernel
>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
>> function from the child process and exits.
>>
>> This provides a high barrier between different handshake requests and
>> ensures everything is freed when a handshake is complete.
>>
>> The problem with the current setup is that it makes it very difficult to
>> share information between `tlshd_service_socket()` and the parent
>> process.
>> For security and system resources that's great, but it has the large down
>> side of not supporting the TLS KeyUpdate.
>>
>> In the future we would like to support the TLS KeyUpdate mechanism, which
>> means we need to maintain the `gnutls_session_t session` information
>> for a
>> connection to allow us to issue a KeyUpdate later on.
>>
>> AFAIK there is no way to re-create the `gnutls_session_t session` so
>> we need
>> to store it somewhere. We could pass it to the kernel and have the kernel
>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
>> it's not fixed size making that tricky to do. Plus it will break if
>> gnutls
>> updates between a handshake and KeyUpdate.
>>
>> The other option is to pass the session data from the child process back
>> to the tlshd parent process. The parent can then store the session data
>> (maybe in a database?) and use it as required.
>>
>> I submitted the first step towards supporting that as a PR [1]. The PR
>> changes the current `fork()` multi-process mechanism to a
>> `g_thread_new()`
>> threading mechanism.
>>
>> In the future this will allow us to maintain the gnutls_session_t session
>> in the parent process, allowing KeyUpdate support. This could also be
>> supported with `fork()` and IPC as well, but that is clunky-ier.
>>
>> My approach [1] hasn't been accepted, so now I'm trying to see what
>> ideas other people have for supporting KeyUpdate?
>>
>> 1: https://github.com/oracle/ktls-utils/pull/95
>>
> Hehe. I knew it would come up.
> The reason we didn't implement it for now is that there's an overlap
> with session reset. In NVMe any error will be causing a session reset,
> which then will trigger a TLS handshake. And, what's more, with secure
> concatenation we even generate a new set of TLS PSKs on every reset.
> All of this is transparent to the upper layers, so they will only see
> a (hopefully short) delay.
> Additionally, with the current in-kernel TLS the connection will be
> reset when the IV values are being changed, which again would trigger
> a reconnect on the NVMe side.
> 
> So not that easy.
> 
> But if you insist on doing that, why don't you use the keyring to
> store the temporary session key? That is persistent, and required
> to be present for tlshd to work ...

I was about to suggest something similar. Depending on what APIs are
available in (or might be added to) gnuTLS, preserve the session's
metadata in a key ring, and return the key's serial number to the
kernel as part of the handshake result. When requesting a KeyUpdate,
pass that serial number back to tlshd.

It would help if someone could review gnuTLS to see what is available
now, and start a discussion with that community if we need a capability
or API that doesn't already exist. (Eg: translate a gnutls_session_t
object into a JSON string; translate a JSON string into a
gnutls_session_t object)

The other aspect of this is that tlshd will have to prevent saved
session state from growing without bound. Probably the kernel will have
to notify tlshd when a session is terminated so that associated saved
session state can be discarded.


-- 
Chuck Lever
