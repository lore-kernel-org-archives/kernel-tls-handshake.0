Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9B79F5
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  7 Aug 2025 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754573500; cv=fail; b=oGubWDKc+VkWOc6PIDVd7UdVcFCWRKZWajoliyu6mW2pH5x7QnuFZeUn8AZj4XHXM0UkvjMbQMKSyjkAGQ8Ocea/2Nzut23F0akHv7pJQJrJ1hM+AzBR+cmkEfyXouwyGWArMB10jDruwdmYwxwZlgwzX+pDKiCt0UBDDQa8SUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754573500; c=relaxed/simple;
	bh=aCcWPROiEOJqRRgt4RHy8cWpV9RFlEjuiQXlzKJAPTA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AdozQu8EdT+WipcX5f7A09i8rZntoqMC2avOZFxO7NhPtZ6f/5Wn4iI5YdQ8z6u0bEzbkwIBsdJp0VGUQXG1jO4I47SG3TVgPeLBLxbK5uErYOMa2acDDED0SOMWbkcOs67chGnSmcZWBF4Cvo7BN/yRt1LZLaIVOS84JLJkHsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GW7SZFna; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UyiVtrVc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GW7SZFna";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UyiVtrVc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5777NLe4017125;
	Thu, 7 Aug 2025 13:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=OYzQLPWb2Z+jdMvSwhJCcERgwXoZ07U0nJqshvRr/No=; b=
	GW7SZFnaZCP3BldYv0ySCOx1Am/vNtlF9hlGNsb1sctJR0beilFurTV7j8Y5Q1uK
	WWxqGsth9SvL2mDtzvTB8/FZHVTSbKoj8o/vDWqv/5cmDFNx9q7VbcNGvUj/Mpje
	A02YHyvKfQBC62Mxbd5kc/0DlP4fMm5eFv0sn7vOWUQSHHvDCoQvuu8JSmxfM1Zp
	KkME6xrzVuPoDcBai/hSCiXoHlBYPFi1qkX6SKOOixEwntHifgMu4BEc1PPLZa29
	ewcZ6cLwhV77wKmNig/7NDw2t3ATb0j0nBUVGXNHm+uWxzOH/ZYfKJzJ7hWnylR9
	WkneXBSjSHDiXgJMytixbA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgv19b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Aug 2025 13:31:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 577COFJr005603;
	Thu, 7 Aug 2025 13:31:36 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwyf04v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Aug 2025 13:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD5jbw5zt/n98i+HAL3WCzHtiFVmyqglR2fCSDSoMP9sxtzSSw3eQw55id38Q2nApxkx3oDI6FxpdHaWRoXrYIvr84ndPfbBW24BSEaZKHZE6PYM1F8schOcQHxhsHTKs8O47wbUBAgdiO07M/CR1UkyH8KatI4xjbEy67m9lOLi89/CWs8tfkwJf0Asz9Rw/4CVe11cXkT8GohFycDM/R1AjiDBJrBmKPn2/Evuc4RgZNIWSd7F9VuN/uVkEk9DTMZK5EitMeFCSczJOvjvA03XwwZk0A07TB3v797/76xs6xh15PukBkPjHXEkLlkc/4tZ+D4R0vqepEIqnd3zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYzQLPWb2Z+jdMvSwhJCcERgwXoZ07U0nJqshvRr/No=;
 b=DMrtcKN6yeWJ1r6ZAUvdfBIpxLGGP+HrPhgREdznk/uvHQgQeoDBV0zqPmJhpFoZC6RWXmBvVPUDAj8bS6laPDDsUiN084YQQturkVtBZsV9F4LTGAnTD/FDctyXnj5iJ6C0oizJy31TFcWQg9rdhbQPFMToaoXEvt48VRJM4SVuM9huf1W+t+eruYJFXwAY4Igk/LsHoSZ1Xz5BZZ3m1lmTPHZylaUbBn6CqQgWvRSNGSabfmeQ7rlajYGAQpKPfDxvQnhMlRINjiAgqRx2OYHtDPswtOJZ/vPP4DO9YHqeB68NFV7XM060Kedn66KSlBPsuqxdz13EINK/oBsJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYzQLPWb2Z+jdMvSwhJCcERgwXoZ07U0nJqshvRr/No=;
 b=UyiVtrVc7h5GnIUDIfvoRuVTzr5gYohGYSEDCIcTiTo67Ej63aQ/hem2eKn0tuTpmqbtE1nTusvsjRZuCGhdieyw9OQVlBUBWk9BJ+PbetZSw1qx962TuOkZv7M9a35T4B/xU9/u21+rzMQaJjbA9iOwgfsPtK+bMtht9Q3RS8g=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ2PR10MB7060.namprd10.prod.outlook.com (2603:10b6:a03:4d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 13:31:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 13:31:33 +0000
Message-ID: <3b68e91d-55da-490b-9a6e-579383a2ab21@oracle.com>
Date: Thu, 7 Aug 2025 09:31:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: client's peer certificate not recognized on my NFS server
From: Chuck Lever <chuck.lever@oracle.com>
To: David Howells <dhowells@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <960f5f19-7062-4c90-bcc6-f3abdb503008@oracle.com>
Content-Language: en-US
In-Reply-To: <960f5f19-7062-4c90-bcc6-f3abdb503008@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:610:5b::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SJ2PR10MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 87424073-a630-4d1d-81bb-08ddd5b6b994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDV1SkhyY1VJWmlvbVVGRkdnL202RWI2dHBIU0lXWEFzNHVnR2g3M0I3NVdu?=
 =?utf-8?B?T3hrdGUzaW1GMmU4dlZOUFllOHVGMDhyMFFiYjVadU1EWEk3Y2MzWWNXWnBr?=
 =?utf-8?B?LzdUSUN6TFhndEZpWGxXcDBWY0loMjBiVnV1Z0JMK2VWMG5nRFJVRk03cWhv?=
 =?utf-8?B?SERLVG4wZDNSRVgrRmY2MHJ4UTU2bnZaaFNnRzhwNm15aFRXU3ExYmNCMFRu?=
 =?utf-8?B?MFEweFc4N01Ic0NTY1Y4blZwUFpUTmNhR1VHRndzSXNyalJZV0xoQWNRZEVN?=
 =?utf-8?B?ZlBlenZ1bzZNMThyTmJHQVlSL0NveGlwL2ZuZHpZMm83Uyt1QkxrR1cxdDlt?=
 =?utf-8?B?dkYrM1cvcjRnQVdTNWFhU1VCTTRER2VmTHZGaG9jU2Y0b0JYWWEzUTc4WXFH?=
 =?utf-8?B?YU5tSGt2UHQ3dGt0QzdPeVMvN3I0UEgvMk5sVUh5SzNwTVFxNnJPYnV0OUIx?=
 =?utf-8?B?SkJvVzZVcERnS2RGKytrOFNQaUx3cXJpZWg4MFVYeWlTZE13N1ZuYVN2UDlE?=
 =?utf-8?B?RlY2NUFtY2tFT3QzUWVzKzRhT1BwQ2dmWFlMdVFlbGgrR1FNRE9rQ05nWlRE?=
 =?utf-8?B?SnFTR09wMWg1SFhML2pLRzJaUkYrWUdiNFpuZjh1Sy8vVTdKNXNHcHF1TFZ2?=
 =?utf-8?B?S0dDcVNzNG9tTktWMUpIZUJMbEtFZ2t3eG9oUWxoOG41Q3hGVnY0Wk1GTEgv?=
 =?utf-8?B?TUJyQWw4bndqVVVweVk2QUNjMjZpanV4MWNGeFhYTTlzUkRBblZQYkxHdlA1?=
 =?utf-8?B?VUh0WUVsdTJWQlQvbXJBUDBDaEpobG15bXBhc1o0dUdGQytDYzZuVE1mci9E?=
 =?utf-8?B?S05pTk9LTlM4U05GNHdYOVVVOEpOTngzUm42OXUvVk9xamlybi84RlJja01z?=
 =?utf-8?B?N0l1ZzdNQTBla2hkQVVjVnlJRWFPU0oxU0JHT0pkdmMza0UrNHk3cDU0K0l4?=
 =?utf-8?B?Nmo5dFUwMWJWdEdkWHN5cVg3WndCMVlVSWZsc2JjWHlkWnJ0V1cxMFdNZ21p?=
 =?utf-8?B?cEc4S0NyNXJZOTFESGRwcXZDZkpWMUJQNU0xZlIzVU5ITmtZdDllNWdGa094?=
 =?utf-8?B?cVBnbURIMkkzNHo3NDQzb1orNFE1dHNkTUdXV2hXVVZXMm05TnVJWEtGdFVB?=
 =?utf-8?B?aUs5T3BRMEJoQTJseDA1K3FFVnNJRzJGaDE3UEwxaVp1WXk3YzNrcUo5NktJ?=
 =?utf-8?B?dU1mc3RSbG9aRjBjc0dFRTBRZzg0NzJWclJCSWRaWG9MOTdKVGRmeGdzYTFY?=
 =?utf-8?B?NGdSTlc1OCtrcklmZ05mUkZhdVhwRXpCUExLTTNTNEovV3E5UzRYcjlSWGRN?=
 =?utf-8?B?aStlUVBpUU1DNTFDS2xpdG5TR3BJTFBJN1hxOU1QU0ZXalYrelpiUGJFWWlj?=
 =?utf-8?B?aW52dDk2Zm05cFArTWw1M0ZzUWd1eXE4WGkrRnpOaG1VTFpFT2xWKytrWW80?=
 =?utf-8?B?MlQ1RW82UTJrNi9ZVmdWZHJjTE9NcmJaN3JzY2VVaXRzVUpabnNLMGJLQWFO?=
 =?utf-8?B?dCt5emtudENTOVd4a0JDaCswcmhvbGxoa3I0RDduNVdvcUFRc0NFNkQ0Nmoy?=
 =?utf-8?B?Zkp2RHY0V0R4b2FUN2ovZDBDZjRuMjM2blhGTHRzT0VBanpVUk0vN2hUNWpH?=
 =?utf-8?B?eG1MNFZxZmM3VkQyWnpqMS9Xbm11S2w0V2NwQlkycmp0V1J6MFZwK2NCbkFN?=
 =?utf-8?B?YUU4NlFrNFpxWE9DQ3kvbkcvRVhUaVppVHVJSVRZRUE0Wms4QmtQeVFUdnJp?=
 =?utf-8?B?alZyc2NXenZzNGtqOUVLTWV2b1NKS1pMUU9PaHAvVXdOMU5UYXpXdzBxSEpU?=
 =?utf-8?B?QndTSDA3b0JDYlZ2VVozMEpuQzZQSzhEaThLTWJ6VjJ0ZGhGbCt4ZEZNaUU4?=
 =?utf-8?B?cHhTMytsMGd0N0pmM3YzQm1NTmxHODd6czFJc2pYdEIzMnBKbFpLV1drNVov?=
 =?utf-8?Q?yVqydWYK4oM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWgyV2I5YTVVZTZLMlk1U2RqODJNRzVrellQRlpGaTkvVTJGcS93T1RSeTl4?=
 =?utf-8?B?Q1RPRTl1R0ZyQk5JYUZUYm5PRXJGd2lVT1dyaTFPL054WHYxVkN2Qmh5QWRK?=
 =?utf-8?B?YStteGNob05mNjB2YkQ3VkZxMWhuWkwrdnZwMjFhMzRjdmh2aEFla0xWbEJU?=
 =?utf-8?B?NHkra2FRRXptcmgvZjZuOWVoVjEyL0dUR29EbitGbTlvN1FLTFV0eHU3MkQ1?=
 =?utf-8?B?UXgrM3UzSHRPMjA4NlFXNnVBTXExTDFUYlluL2lJMGVOL2hheXFSNXpIcTFo?=
 =?utf-8?B?WnBGQXVZNDBjamR2QkFBM040anhLMzhENGpybGwxQlZVNEJxVzFDR21RaUpM?=
 =?utf-8?B?Q3hVKzNaUG4zR01uNXBqRUtMRWd0eTJiOHYzMjNFTmlUa054bkFJd05rMytX?=
 =?utf-8?B?bjh4VWlOT1pTOVpwOFJKTW83elYrOTBIUkhTZHl0MG9ldVRwQTIyUkhwOWdI?=
 =?utf-8?B?blVVVVBMd2psSkdnYkl4MjFZMUlxQlJjTXRwQlAxTytnZVlZK1R1dnJONWd5?=
 =?utf-8?B?ZTdIb0RVclZ2eCtJbkZOam9BdExUOThURjBzdHFnWGR0a2lWWGdTeEFzZDlN?=
 =?utf-8?B?d214Tlg1VUFoRTREbCsvend2ZVJ6b3NJSUFwV3l3RGlvL1AxRTczZHF6azNp?=
 =?utf-8?B?em1mK080d2VGKzNoaE5Vdlk2Y0kvQXcwQ3hxQjVaVXBubU5idmFoRThqUzM5?=
 =?utf-8?B?OE44SGtJd3crRXZkWGM2MGFrWDgwQ0NJM1pod3Y1S1ZmWG5PLzF0Y05YUmkv?=
 =?utf-8?B?WmVzd3kzTGJ2eXFQNzZGOW9EZlZrSy96Vkg3NE5PK3BWbERHS1ZNTnBrd0Na?=
 =?utf-8?B?Q3NqRlNRRmpSNS85ck5TZ1F1Rm15S0xFa0JvMU1rT1NDUStFdXBZNzdsUjNX?=
 =?utf-8?B?M3BHRFZUQkRNYnpsSlkwbGt0bnVMMFJQMWoxTTVyZEhza1UrMVBsaHJWQkZo?=
 =?utf-8?B?RU9yVEVEaUE1T0xQRXhUQm1PdHp4NjJtdUZGQVVNc1BuZjQ0eVdMTzNDeStp?=
 =?utf-8?B?bWpJSlQ1LzM0bTRvMFNrb1JVTU5WY1UwSXhHRHEzSTBsdkNyVnloR0lkR0lU?=
 =?utf-8?B?K0h3bDdRQUEwOGxBUjZsZWlEODgzU0xJRXVJQ0NwT2VKQW9qM3RCanhKRTNC?=
 =?utf-8?B?dGZHQm5Od3JZZHU0ZzBjQS93azUwaGZheGYxY0lRWlZtcTlWd2wyV1h0M0pG?=
 =?utf-8?B?c1ltZkJLZWhSZUdiYThkZmIzbXdwdFlxZjVsNG1LdzRlWnRiQm8vSkZaNjd3?=
 =?utf-8?B?VTZhSWhhQTRYcDlNRnIxZjlpcWo0dCswZnl3N1ZLT1cvSXlXTWVKYzkvLzBx?=
 =?utf-8?B?bHJTN1kyMzVBVnJ1V01YNmhmT0swYnBsR1kvZWlpUlJWNThYM3JUN0x5czk4?=
 =?utf-8?B?V29tRW5xMWpZOUxRSTZSeEZZQXlGUlQ1NWhyamEyR1VGamxDUGJWOEZuYmtK?=
 =?utf-8?B?SHBNdEdKbnhkTGVkcWdNNDgyUHJtMkVVRmNSS1ZYVkVTcmJLczkvNGVvWTJ5?=
 =?utf-8?B?b2RLTm82Qm1kUDdSNUZncEt0UDRudWo5NlZsRkFMd3I3ZGlVUWpJVTFXNlFw?=
 =?utf-8?B?VzFnL2taUFNjRENCQ0swZzhlQ2gzOG01Z0MyVjJvQmkzVTlibGtQNk1BT3J2?=
 =?utf-8?B?WU1objNKdC84ak1kZU1PRjNxeTdJcy9xRlNyc1lwMDJueXJuanZrKzJCK3dm?=
 =?utf-8?B?RnBrVWQvTnI4bkRKL1ZxQmpuSU9FTHBPM1NCQmt6U2puL2dJZmY5dGp2TURx?=
 =?utf-8?B?UjhlTm92bjRWVGRRY2hDVmpRRXJKMy93d1RTaHpqUjZNT2J1VzM5cnIxMlo3?=
 =?utf-8?B?SjhaUmlGRHJ4cVBJVFhkOXVaalYwMUo0ZVZYbTdMQ0JBUFh4bXE3ZGZxN0Zk?=
 =?utf-8?B?ODIxbkNPRnZldG5QMlV5SG02aDlmNC9OMnpGRWFmYzBpdXpFTkdxc0V2L0VZ?=
 =?utf-8?B?dEtyV3RlR1N0QnY0WExjbWFvWW5SditKKytFQTRZeEN5U1VIQ0xoL05ZNG5R?=
 =?utf-8?B?N1NCNjBsS0k2Q1pDU0swRUNDQzNoQk9TZ1BTOEo1a3NQcVdURGFMUEN5VThT?=
 =?utf-8?B?eVc3MDVRT1ZxcjBBVWlPa2NFWWhyRVJlQVBHSVh0WXZQdmYvNG5JTHJpNnYw?=
 =?utf-8?B?ZzFkT1E3RzlyRVBDbHVTbjN4OVRpbTVVdlVXQk1EeC9CSzFINmtYL3NGRTl3?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WN3j6kNb3wr/XlNMDZg4eCxAmE5/80o5DnRWsrwVgd64KMkyxr2gB04MWil4LaD258hYwW3x8/bm6gKBw0vEcetIETLRrWAXAWs6r9iXyajtXwxr1r8D4XnnrM4B6j9MlzHEd0GxgRvvNEfLPC8gZ8r5OrljWlExnYXVFKJIvmf/K8DVN4S7cOR1TMSvidcfkHg6nRD+zYGnPyx8OjU9wZMYVO/85mbQFi5ZBMh/SXxQhzUgMC0fo1fr6ONoQi3tkk+ogNvMLGnZ5mU6Ya1hLLkrsgTllXEQ5L5a/qu1n/2otA7nyoFEZAOYzjN/FYjY/9eebGSf9TQAbanFIRp0Br5GPGkhbkU26oXXHcHCCtbo3TXhuOMYdGwfSCVEuxPw+Cb8aETrLCWHQ577zPKMQKAHumIP5+PrK8kxS87Sqw+Z0gyWFoGrHLJuDkuyRHQ/Auc3t5Ew/JTndyas3mzO+gjU3aQW5Fp2A5hzvElJOFxEcKoCGT7NXnlGo2gunmlMnX6IoIIgQsnrSH1qhm5zdykN5vSYqp4eMKPOdf5cbD+xQ1iGnqONbjsUJq5I70Gq8gyd4v06N8e3H//UBz1W/ZZmrz2dTjqqDb9YKxMJleY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87424073-a630-4d1d-81bb-08ddd5b6b994
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:31:33.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWAEW8jQ2ERfwvhUNhUKiKXw2Cod9HJK9rZyz5atVUikylbfHHONGJfp+bDw+XZCthXmYWd0qhsDDNn1IovkFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7060
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508070109
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=6894aaba b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=fBPS6TE9TeJPws2ZZSEA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-GUID: LEiChVC_tzEYaJT2oe-ruiFqFN7Hughv
X-Proofpoint-ORIG-GUID: LEiChVC_tzEYaJT2oe-ruiFqFN7Hughv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDEwOCBTYWx0ZWRfX9xCk69CmdWR2
 8D2B0zoePigfsuHUBYBKqzVQmqQLmIBw5VlGIksy5QWrksUIzqNdlELbbVWVW5Xa6/Ip93W37eK
 BYA4zro7PookXcJ5XHN3afvCDxnPfs4rhyTJIFP05a2sFe+8gqgv6Mb3bcER7kdx6Ol4H7gYg0s
 23pwSxlyXiZrZbUyKsUmwwQ8sKvr7en1chyRWBgjPXx8cudaUdRTfx7UorqktBtGbV+5WdH4Mjr
 qztva1LuKr8tioQlyaENt98TjY0uAX5VRmBW//l7QLtJC0xmFXkhpyKU4eLTjwHEalnU69ylq9x
 oesTWjnuxKUlPvITehUEcsapU/THmilj41Y1H4wQq+PkDbk4VKJnH/W8WMgXVi2Ijz6WfczEiOH
 v3eaL9V+0bIA0azgfd/lrtEAjuo7HhqmL7yWLSkBsSyMi72BFM92F1lcz4JCYOwMOEr+FXBs

On 8/4/25 2:59 PM, Chuck Lever wrote:
> Hi David -
> 
> I noticed recently that this notice appears when tlshd starts up:
> 
>        add_key: Package not installed
> 
> As it turns out, this is tlshd_keyring_create_cert() failing to insert
> the client's certificate in tlshd's KEY_SPEC_USER_KEYRING after a
> successful handshake.
> 
> That means NFSD sees the session is protected, but since tlshd
> returns "NO_PEERID" for the client's certificate, NFSD believes
> this session is not authenticated.
> 
> I can't find what is generating ENOPKG. This error code is not listed
> in my copy of add_key(2).
David, do you have any thoughts about this situation?


-- 
Chuck Lever
