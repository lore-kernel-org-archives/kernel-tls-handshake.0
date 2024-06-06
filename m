Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6C282FE
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Jun 2024 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717708643; cv=fail; b=NZ0SCCI3kLQKdqi2DytgvhXnmuebznQz+F0vqt0IHcl4o51Mql2YF9J4D4AvYhTmLTUzRvbR/q1Mf6KTa9Y+kVL0qahwrEsaXbBgCaywpVYhITLgD8TAhSHhQGgCsOScG1fcSBiJwKCT2qHzBUf31benIYeAzrc/q+UcHlun6ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717708643; c=relaxed/simple;
	bh=TyQSTU85SftZKm7pf+DWY2bkA6nxUZnKwPxsM/7DHtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JukCWfx8VDN0ghih8cA9DSChQq8m0ZdpWiVFP4/pXoKjMlSHhnv108gkXN34qoM9SCIptUk5aqxHmRJrTmtjXtEdYU306MxVP6Mom530BXkUuqEH7yNHohb0m/niVZGCDCUQst9zbtQD6W3V/esGoREtHH3pFqWUbxOpg6c7tjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=evH2C5Ga; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jBr00yZG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="evH2C5Ga";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jBr00yZG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 456HxT0E032746;
	Thu, 6 Jun 2024 21:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=jByc3nOHMOtDGQk+BfGSokBg7qqUQH18qDVWFd2U/Zw=;
 b=evH2C5GamJE9rh8rzvNJ4ZEph0btHh4XRJpv32SpFfQXLVVwQNpFkFnrKVWSFuJarnQY
 TsFLTB3qNCQSpfvBe/Y+sEknJc7TdEDU3Px1JKfbGmFA2oBK3lkR55YpLDkd8wk51hP7
 vqDCeWFm5mJodflQcF8uImSZ7lAyG0f4gDeMk9WLEDj/I4oHXom+kTOf922zrB7AuWEg
 L85H66PUCT/EmVTIk6WF4OH5agMvKIE6On4/n57NlZpjZDHpD5jtQZDpk+5AefrMp4aE
 KWEy/Kah7pu4w2LG5c8WAlvPNhZCw0gpeQV2l/Jq/kssk3MEMf7XoxnOWUCov9HBkHfm 9w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbqn4f55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 21:17:20 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 456JPawO020669;
	Thu, 6 Jun 2024 21:17:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj5quet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 21:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCOV/mBC7FN7JR0GTiWey/sgoZLZRmcq0LAKCzTFyfSvlwt8zzaPZxgjJoOcLFRF2kMg/QwPTlf83LILxsCYgoKKDiOA2W/mIM0kG5c9ImFfWqXHdybYhxwkRHZ8IMFoN9d38Ch33FZqsYzhoZKno08suVHdrmWkCeWzy6Ngd6ClViRqvF0GResrc+9NJ5Hq5J07Wi56nArEYSDgL30l6IR8eK+2O+k6m770f374EB5jZ7I7mXMZz7S/D+zfbYVVCOCdvq8Z1itS4D/64qJuBLgUN5f5KQp6ys/f/f/F9ugQtKegXCoL2DacoWaJnu5ClE5qgLUTUje1D3o+KtWsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jByc3nOHMOtDGQk+BfGSokBg7qqUQH18qDVWFd2U/Zw=;
 b=JsM7fw9hU1d4bPH6lZMWyoCZW2HJNjQ4w1ATiSgGShyTiq+0k1PBVgLv3aLDAnV+Guh0RkCURrRCebn4Xop0sQwsv3HMg9zwnU+pJh48H9D/Ms5YzFJSZyCmtHs+HW8mVjn5296sYa7I6eCHETyUSFahavXMRCcT6GKiCYK9YppeB6mAnXYL76c5lhLHiWLEl/JQKOabiK8FDHFkyEYfXFYNLoV5Ud4Rrw50EXestQSpOfAQGjOw4pCoF6xAf2jGqaeTdHAZhdEHS/Gy4kEa9Q3JAJg13FUNySGdmtuH3yn6xWO57AL2E/BccB7j+yzgpDh6OD3xWY3eChIfnaPSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jByc3nOHMOtDGQk+BfGSokBg7qqUQH18qDVWFd2U/Zw=;
 b=jBr00yZGenCOeyyi071mtJDnUn2i27rcYIUqFxxLJCaNWnvYKWeX3BCQjctL5z9t5/j4Cv7V91sJr0a/N1fdfIZkhR8gEm6oRjSgj7HwQ3EGSz+OoHnz9xOhCtcRdlzNBHfP4gojOw7rq1o6ytX5FUzdVm3/lW5xMY79wXDY1ts=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB7935.namprd10.prod.outlook.com (2603:10b6:8:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 21:17:17 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 21:17:17 +0000
Date: Thu, 6 Jun 2024 17:17:14 -0400
From: Chuck Lever <chuck.lever@oracle.com>
To: Olga Kornievskaia <olga.kornievskaia@gmail.com>
Cc: Olga Kornievskaia <kolga@netapp.com>,
        kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: tlshd.conf question
Message-ID: <ZmInWudRMbelgI8Q@tissot.1015granger.net>
References: <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
 <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com>
 <CAN-5tyEP-+s_8LppBqos0+sWTbUq-nwL6+q-rSK7tz6Gzd2B-w@mail.gmail.com>
 <2D1C791F-C5A1-4985-9BFF-DD2E5753071E@oracle.com>
 <CAN-5tyHav3f1XOj1n=MAUm6N8oB6QgY_guav119LNEjiMrXcGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN-5tyHav3f1XOj1n=MAUm6N8oB6QgY_guav119LNEjiMrXcGw@mail.gmail.com>
X-ClientProxiedBy: CH0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:610:e5::32) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS0PR10MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7d86be-7268-4594-37e2-08dc866e0b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVhIaldQZXpmbnNxZmVLVnJPNC9xdnllVjNBeXQwOS9tRHd5cXZBdXJqVitX?=
 =?utf-8?B?MzIxdklnTmhyeU4xaXZZRDVUTHBZazUwcWNQV0toNWxnMmc3TU5KSmtuZGtj?=
 =?utf-8?B?TmhMcDlKS3Y4eGNWNDgrekhsSU5oUGVraXlJMS9QQlBISDBqT01QSzB2M0hJ?=
 =?utf-8?B?cDU3cDNNcEVkL1hoKzcxbjFYNUdQcTA5SGJBdjYzR0pjbHF5ckwwdEVCek9Q?=
 =?utf-8?B?Q2hiNi9tM3Y2cHhwWm9PczhTd1B0TWIzMEdlbUpCd0FLSndsZDhCZ2ZvQU1h?=
 =?utf-8?B?Slkra0ltbVpMdWdOMUd3MUJjT3dwN3ZydzVQaVNBNnJqdWI3MHpPZnZKcW9s?=
 =?utf-8?B?UXYyY290S2VvM2JkNGFlK1kzNVNMUG5tVDJNOWIwcDFLekJOOHM2WGNDYmht?=
 =?utf-8?B?Y1RPRlVjVmRLZ0lDWWRGdHoyVFVjUG5mdURIZ25qTXNDczF4bkNTUm5CUlZW?=
 =?utf-8?B?OWF5S3NzUUxwTHd4NjNWbEZoUjdzcU5wTytLVmRqT2NSdjNPK1VGT1dOOTNh?=
 =?utf-8?B?cEJZM3B1VG9JeFBYMmhBcURaaEp4MWRtSzFjSmtJZC9lOTJsR25uU29LdnJw?=
 =?utf-8?B?ZENpejlXT1VDNms0QW9jeHpZYlZmbGhjR1J2TVY1VlZvZDVScW91aFJ5bEUw?=
 =?utf-8?B?UGRUaHVVZm93NS9KcCtmM2FQZjc3Nlp0MyswbFo0Zkc0TXJ0T2FhT2R4dFh4?=
 =?utf-8?B?UVZlaDZJYng1cXVILzg4ck1MR0dWRGtGWGFnMStNaU5BdTVvQ01HbzZjbTh3?=
 =?utf-8?B?a1MwczAza3I3b1ZsaTErd1ZkVlNoQU9ibFhHWFVqUmpKLzdTMzNncGZiSENS?=
 =?utf-8?B?RGFtZ2Eyd016ZDN0a1gweGRYUWUzOUNEbUJYdnY5NEdoR0RKcnNHMVp3TzU2?=
 =?utf-8?B?cXdsanhlcHA2N0J0VkJNejNBQXFnUEpFNlpicnh1NXpSVWlYY1hVaFo4Y3I3?=
 =?utf-8?B?NnFPUjNySUJIWTU4amw0cTNSSy9Nc3pvYjRZTEJHblpJWVBHdXlXa2l3MzM1?=
 =?utf-8?B?dDZjNGZqNmVFV3VYY0tOSm56dzdYWlRCTmkrNmFCc1pieE9ZZUtwa0tXK1BR?=
 =?utf-8?B?RjQxUDY4SzVXaWUvOFJ3aHo1Z21yMjVCb05SdmtPWXl3Z1l4cDBTUzRvcVlI?=
 =?utf-8?B?TEI2N3dzcUdXc0p0N2tpVllMNUtNTUJuVUxVdkxCTDYzVm9qWkhDcFMrdTI2?=
 =?utf-8?B?MFV3aU02YXhxSkxGQ084NGNlZlA5cmkvekVXMU1mOFVubEZKS205ZmlLK2NS?=
 =?utf-8?B?MmVJVjFyeVRVM2FYR3BmNDFUWlNLMEo5QXBPN0MyQTBzNm1rNHhhSDBXOGd6?=
 =?utf-8?B?aW5jWnNaSGZ3ZnFmeVhHWDBFOW9QcnhYZ2poVkhpRk92VDhtS21iVGFKcUtF?=
 =?utf-8?B?YUovZVh2MitIWG9KVURmNllmSXBGZ2dMbWFjazNCVEdYQ2x2WkJhTXVBRVBw?=
 =?utf-8?B?OVcxd2t1ODRMTUJVN2QyQWIyYm9HdUNuVzhRTC9JNDVCY3BsZWJNZ2dmN3h4?=
 =?utf-8?B?b2JQMlAyYjhCaWlvNU0xd05mKzQ3OTkyem9PSFlsYkRMd0wxRHVOWDRSUnY2?=
 =?utf-8?B?SjFkdVB3NHphWEtFc25Najl4d25jbzJpUUlRVFhmVjNTbDdUTmRIMitGdkk0?=
 =?utf-8?B?ZEpmUGR0YmV4Tmt1SWRiWTZNb0tIWGhNTmVEUmxuTVoyY3Y3cWVFVG4yTXhr?=
 =?utf-8?B?WEw3K3JsOGNzVXZlOXFwbHUxcVk5STFIaGZ4THZKdXVkb2FZYXJSY2dOM0k3?=
 =?utf-8?Q?MsbyAeTiCbPfCuqP2+aTkmbZW6CDCouV3oHYKK4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEJjUnpicnJ3cU9McjllQXBwUHh0TFlaSllkNWFBZXFTL240Q05WRnIyOVEr?=
 =?utf-8?B?bzBFbC80RFJNbDB0QWZtVUpna0taWU9NdCs4M0wyaENETkhXQmxCSjArQVZ0?=
 =?utf-8?B?N1ZVT0YrdG9XK3U2dXRycmxHQXYzd0pmL2llNVFPMTNHcm1zMkpyMW9EYmhY?=
 =?utf-8?B?aGZrczBqbkhnMHN0cnZKYWdiS2hXZ2FIaUFINS9ER1R1N3Z0WEtiaVMwS2Y0?=
 =?utf-8?B?VXcyUHRlcWhCdzZDN0tFdTV3ZDMwNHN6TmFDSllaVnJNUm01YXdYbG5seStQ?=
 =?utf-8?B?dm9xZVhvYWI2b3BXdmIzUlpPLzNPcFpFTW9pTXF1N01hTWNES0hLQVZNTHI0?=
 =?utf-8?B?TE4vVTZqOTh1R0VGZ0dvQTdSV0NzZEtXRVFYQXZFQ1RCWkFvc0NDZWVRenpL?=
 =?utf-8?B?Y2NoVzhiUnNmVy9VWUM1VlRXUVNka0lQaHU5SVc0WDdEVEh0WXNreUVabFRK?=
 =?utf-8?B?WXM5a1I1bmZVNGd6R0VxcU9UR0htOXVCZDI5VXBvc3NhTTVtbndRQWNhdVJm?=
 =?utf-8?B?VEpFWnhIeGdrSEpjbGVXaTQzeHcyYXpmcFRxTmVlOVVhK1B3cngxU1R2RVFY?=
 =?utf-8?B?cSsrUEVKRzlaVlFaQU84aEc0emFLN3V3d2pqUzE0K3dkWWQxMngyMTA4OWRJ?=
 =?utf-8?B?c0F2WEtHRUpLY2k4VUZXaTNBMzBiVUV3MlRwNXZhSWFXR0ZNd2paOFFFcEZ3?=
 =?utf-8?B?OWgwalVDT2lhUnZnQm45aTRBa011QytUM1NlSTh2b091VUd0NUVjRXhsTURG?=
 =?utf-8?B?eTlDOTJXQklLK2pGdlV3SkN2SHQ0dmpyb3lkU2R4UGt6YWJzK09tRzh2YkpE?=
 =?utf-8?B?M0pkM2NMMGdxM3lsNTU0UXM3UFNGOVppeFp1NG9yVXlQTmtYM2tvZGJTeXJH?=
 =?utf-8?B?d3VjdkVKNWlzSU1Bb1R3MjZkYjdiL1V0eDVxZisrZGRhMU1nbDM5akZDeU5X?=
 =?utf-8?B?S0FaNUV3aE1ib0FTM0wrSU14UW9LMzlFMXRwOHQycmgycXJQa0MzYkRFOHE2?=
 =?utf-8?B?R3hzbkwva2tIVithM1A3T3RXQ1JmU0NYNiswQTFEaE1CYlhjK0cvUWxWbllL?=
 =?utf-8?B?dGNaYXZDc2tRbFlBak8wUVk4WXJ6U2o1NVp5SXFXZ1FvSllXdXZZUlJ2a2o1?=
 =?utf-8?B?UEhuaHJMNkQ0REwzOGlOSGJaK0FBdzBxMTVoWkd0RU5SaWp2Y1g2UkswZFAx?=
 =?utf-8?B?ejhOaUQ4bzE1cE9YZU5vcUNxOHYwbGtHdnBla2JQWFVUS1kzNDY2clN6N0Rp?=
 =?utf-8?B?L3J4RS9FRktZaUxkQjRXTzZBMUlYb3JNclF5V09idjZwMm1UK0JFcHBKeEFZ?=
 =?utf-8?B?SWRUZUQrL0xJNmxJaWFocytPeStwYXMwdFJhS2pTYWVYcGQwSXhKMndNazhi?=
 =?utf-8?B?L0p6OFJnYUNYbWFvS1pjb0hYaldhWVRCYmZSaUFIZHR3TlE2Qy9XOFNhMkth?=
 =?utf-8?B?d0lqbDRzbUVwZVY4a3BrZzJpUmJPZEFSTXgyZ0wxUWZpMkhzN0xqKzVIN0di?=
 =?utf-8?B?a280RFhmemZEOVhBQUJScnUzTFU3UmdUWXFPdlFZTkdrYzk3SHBnSzIvQXM5?=
 =?utf-8?B?cFo4YnBWUHBoWEpDTGVaZUNpNUhxUkNoMCtRditaV3I5aGkzdVcydW1BUG1x?=
 =?utf-8?B?eENyRTlRaytQaHJLVlVONTNSbEwwNFJoMDIxQ3EyTmtFQkZicmxYcEVPQmxs?=
 =?utf-8?B?OEtQb0JMWW5zQitxS0lOZ25tbCszSlFFTW9PWWdpU0pyU3FCZUI4cUZpZVJw?=
 =?utf-8?B?OHFubkM1ZFp6bndLdUVmMXVFL2dtNS9qdTNIQjN5UlBROUw0NkNUeXVsMitK?=
 =?utf-8?B?QjczVitNSWswWjFBY0Njemg0ZEJ5QkFCaEo3dFJZQUJ1d2gybUxnWGRWTEVK?=
 =?utf-8?B?K1RjeWo3ZmdLa0xmNndQWk5hYkVwNURPemRMNlVyNHhCcTFUdm9GNUVqMXJH?=
 =?utf-8?B?b0dXWXRQTkpJaWlnVEMrRkh6ME9YZFlWUmliNktRYUtWMGJQbnZFOEFYcm1W?=
 =?utf-8?B?d3lSdjg1cFAvUlFUUGdNOUpYODFIUUZ1c29qelNpaG1HcklyN2M3YitrdzZj?=
 =?utf-8?B?NEcrZGRGNHJDLzlNWmNDU0RzaUlIbm5pL1NmRGZLNFd0eXp0RndFUHhqK2lC?=
 =?utf-8?B?TStXUjFtWXN2TXFKWWNlNHpVS0o2Y3NkUkhJdllFUVF1MzZscmZYTUMzak5w?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/zsDcpq6OSwZwpZn8qoU/14TMDyVFDcy92Z+6zhVaRgY2nJjrOzSCYOaZJmyCUCDvAw9Ec5VsvbrO+sOcLuhZOQtd174Lg2EBVpzm42E5wxeHdBuWnCXZNZ/4r8FJWsZS9zN8H6VqscAU0osJiZ92pwGquWhVsbHrBwVQJmjeLyFlOJOYHRZqgMs9G0Ez0Edg+IoK3RQSNCutuIApK79lFJ+Nig7s4YBBg8aXgaJmfmyF6OfwLWIzDHJ3GPjrHWOY7hD278nbZTRtdVCwQsR38RmlX7IEdV1uzrxJQAZOjyqjnrPbx9hoY7IFUTwsMPdewHsNQ1OqstgmeV42ZgLeoAnGE7pwVboSVe3Ix0Hjbw0LZoaf1ZDSrIvVLTf8F2dYI1JqhHGWZchEo6X8+wHetu7fhbxpL+3vN4wvTVJX5CGQTxRrWcDdfQwE++MmDTzXiZewj7nsIBboPOvjhVqUxYHd7PTGUri1JrMhKcZtznzQFDcXyM7mO6dchN0VDdiXeDaux/cC3ynhigpASn46JsLdE7oATUBrGpvCrZ60lhf0o7fd9ETD9O7vHk7cR9oRpCC1VaOuwsaknwSHRxFP8t6aWA9SkLMSZN6N2WIbw0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7d86be-7268-4594-37e2-08dc866e0b28
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:17:17.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kwghc4+5t5oghzw+W4MiayO2aiUMYygOCC5wJwukS+tUuvny7XNKVnyGWIq8c3Ta8fuslqcfcYOprjvneVY//w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_17,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060147
X-Proofpoint-ORIG-GUID: pUFYmpvhcMuFwfqaX0Xm80C6oHgt4aIq
X-Proofpoint-GUID: pUFYmpvhcMuFwfqaX0Xm80C6oHgt4aIq

On Thu, Jun 06, 2024 at 05:00:41PM -0400, Olga Kornievskaia wrote:
> On Thu, Jun 6, 2024 at 1:59 PM Chuck Lever III <chuck.lever@oracle.com> wrote:
> >
> >
> >
> > > On Jun 5, 2024, at 10:50 AM, Olga Kornievskaia <olga.kornievskaia@gmail.com> wrote:
> > >
> > > On Wed, Jun 5, 2024 at 9:49 AM Chuck Lever III <chuck.lever@oracle.com> wrote:
> > >>
> > >> [ Redirecting to gmail/netapp addresses ]
> > >>
> > >> Maybe <aglo@umich.edu> is not subscribed to kdevops@...?
> > >>
> > >>
> > >>> On Jun 4, 2024, at 2:41 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> > >>>
> > >>> Hi Chuck,
> > >>>
> > >>> Should "pathnames" in the "authentication" section ignore any spaces
> > >>> that might be present in the same line after the name be ignored?
> > >>>
> > >>> It took me by surprise that they weren't and it took me too long to
> > >>> realise that I had:
> > >>> "x509.certificate=/root/server.crt " and not
> > >>> "x509.certificate=/root/server.crt" in my config.
> > >>
> > >> Agreed, that's surprising behavior. tlshd uses a popular
> > >> library to parse its config file... maybe there's an option
> > >> to the library API that can get it to behave better.
> > >>
> > >> I would like to be able to support blanks inside of path
> > >> names, but I'm not sure how that would work.
> > >>
> > >> Anyway, can you open an issue tracker ticket for this?
> > >
> > > I have opened it.
> > >
> > > I think as a first step, my initial suggestion is to update the man
> > > page to highlight the fact that names shouldn't have any extra
> > > characters appended. If that's acceptable I can take a stab at the man
> > > page patch.
> > >
> > > Don't we want to allow having spaces in the pathname? But I'm not sure
> > > what real value is to have a legitimate name that ends on space or
> > > tab. But if we do allow spaces in names, shouldn't there be rules such
> > > that the name needs to be in double quotes? I would like to add I have
> > > not experimented with creating and using such name in tlshd.conf, I'm
> > > just speculating here. You mentioned that tlshd is using a popular
> > > parsing library which perhaps lists somewhere what its syntax rules
> > > are?
> >
> > It's Glib. The config file is treated as a raw key-value store.
> > Have a look for documentation, but I haven't found anything that
> > suggests it treats these blobs as anything else by an unprocessed
> > UTF-8 string. If we want extra escaping, we'll have to add that
> > explicitly to tlshd.
> >
> >
> > > Regardless of what is decided about the spaces/tabs I feel like this
> > > should be agreed by the community and then documented in the man page
> > > as to the appropriate syntax to be used?
> >
> > Propose a man page patch here, I think, and we can discuss it.
> >
> > Note that I've been asked to cut ktls-utils 0.11 ASAP. Can we
> > get this finished by next week?
> 
> I decided that if we modify the man page but then we would fix
> handling pathnames the man page would need to be changed. So instead I
> thought, I would have been happy if I had a meaningful error. So I'd
> send out a patch at attempt at that. let me know what you think. I
> added the checks for exists of a file.

Yep, for now I like changing the code better than the man page.

We can do something about the code duplication later. I can imagine
a utility function that might handle escape sequences and test for
a file's existence.


> But I also found out that
> config isn't read in the beginning but rather for an upcall. It would
> have been great if at start up it would just notice that supplied
> files didn't exist and exit with error messages..

Once tlshd is reworked to store certificates in kernel key rings,
though, the storage administration tool (eg, mount.nfs) will output
the error message.


-- 
Chuck Lever
