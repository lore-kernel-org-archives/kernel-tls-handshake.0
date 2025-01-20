Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA514AD0D
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Jan 2025 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410644; cv=fail; b=u5qqrCK9NR9bSNwKo8Aeuq2ccEjozO6FOvymCFzbxg2kMjhcoUiSD2plodyoCyNOC/UEUrxCykWdF/ZBGqt5muoanprbX2gWA9QQFHZjWHxAQM5iROjiXqs9bNUD8C6C8pHDR6ysl9/K2UgLoCbXFs4AlpiMY8NFlqxKQ9pXc8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410644; c=relaxed/simple;
	bh=z3MiQsSyaWVeDpQzFWfArF/ocwjy8pHS7vwMfJTCW/Y=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fDIotToKjlT7pGw0rczR2lsuw/f4pAhvecUCo1LWNw6cIDfzjdZC++kaV0vjUDZnac2fdh0VX/iPd+u7PUZSE6CIb1/KRc4idxORuzonkM+aVp/7jjCKWoYQGWo9k7gPpyRhrBTFwDNU1tei9NxN0LFL35Dft5HiPL75KmkAW+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oz+jVJhQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uF+KniUk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oz+jVJhQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uF+KniUk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGMtfJ024911;
	Mon, 20 Jan 2025 22:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=4H3FgY9hMmObrybyIJefK2DlgMS3T1oCgune7OI4s6E=; b=
	oz+jVJhQUpeS3Phw0Ke7ZqoBYQsXLbFvXgj/iyR+a7b0AyZzoiLBcq+zIqg2PvRT
	SaGuHmB0bVbXBit3B5WypY831dEFiPF2srpOI+n/iy1BNIX23bH5N8cnRDBmyO90
	/6i/Ww+iqv/iGEd8I1GNb++7uPIi1cb2bUwomjM9osopYl8o4uXH+0Bj3AjHqWxQ
	DPL9NANjDAUworSfxffrcgNiA16uPwo1/ifKdqS3C3U/ZxqrspYbQg8ATkZGuxid
	hUTRqk1HXTWNUNVEWRAmWURUUSmbcqgiLEbwuSNTznypAlF3LKOk6I0SuYVMrFBM
	11fh8bEVF5ua5DylTcQLKg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485nsc7p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 22:03:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50KLL6c7030424;
	Mon, 20 Jan 2025 22:03:57 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 449191s0t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 22:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGRGLOwZp0/RBNN7Tc1dM7yhaam/rGUhFiQgw6nwMJ4Y1SGIegNr7701xWv5t34YZkV/b8e67giWdsvEQnovjSUoCf6luTEo979QHFBxSMLM2Tqjg2NqEnnuKKkTJaCSrxigjUGCqd9yJD6Kx7DzI5OeDlUPQi2idBtQZ+t+08czikKckycnzO9V9F7opKFVfY4hVDe7HNKSgd/VrbvFymhsWC36aB7OaRokeBEwFpqWiUExcbIS+lzrRwZhoQfJNgcXntEpRVG+CmflMeyjSyIcmbL0J737eO0coatF3L5935n9VvzmhCYJukeqk93N34X05WmOGsvE4JQGTUtmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H3FgY9hMmObrybyIJefK2DlgMS3T1oCgune7OI4s6E=;
 b=WVg4DApAh9k0N+lolGybB5r08RDpRzCR+IE1y9WPIBT4A6zXi3LqQZb89ruphxzMcIapHB/y6l7Unbadf5kcuOSoen8eXvmgo0qMcl4ODOjyGk22xwvJLh1l7bZYsqdaLr8eOIxyjkjuuZb3hZIS8uZPqoUk25Neul1PtMc/nRBksgWbe3aGBtjSPw/C/cCq5kwT1+8Nq7fnOkeDJ84rBSSYwR7vUdXexlCN/1TqDh5x7iIg9l1+xhKAJ4NNUZkCGiNQy3qfnMPxnBwwu5Z7QL9m41cO9mIVDIrEkmq4TeY4+d+bV3P1WKIKrPhDZ1B1FBonoS9UOB1L/hotLsdFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H3FgY9hMmObrybyIJefK2DlgMS3T1oCgune7OI4s6E=;
 b=uF+KniUkRPHezWOjtad7QSKA5aE7IUEQ44W10rTW2egXt42Unkv4SLQyql1EtPZgw+3Mbn7NlneMtK4sOdniqTcHpGqPBi7xWWcL+Qgsq84r27XhPMD8I3O6HoCRjc9IpduuyEj0tMZsByMw8t2NZpHd/gavMTelx4zbzIKbRQg=
Received: from BN0PR10MB5143.namprd10.prod.outlook.com (2603:10b6:408:12c::7)
 by CH0PR10MB5034.namprd10.prod.outlook.com (2603:10b6:610:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 22:03:54 +0000
Received: from BN0PR10MB5143.namprd10.prod.outlook.com
 ([fe80::783:503f:ea07:74c7]) by BN0PR10MB5143.namprd10.prod.outlook.com
 ([fe80::783:503f:ea07:74c7%7]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 22:03:54 +0000
Message-ID: <11d36029-eb36-4eb7-85b3-f2eb461e23a4@oracle.com>
Date: Mon, 20 Jan 2025 22:03:52 +0000
User-Agent: Thunderbird Daily
Cc: Calum Mackay <calum.mackay@oracle.com>,
        kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: NFSv4 TLS
To: Chuck Lever <chuck.lever@oracle.com>, Steve Sears <sjs@hammerspace.com>
References: <PH0PR13MB493959B3B8870BFD51EAA835A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
 <c4459bfc-965d-48b4-bf28-bd9f65c7657c@oracle.com>
Content-Language: en-GB
From: Calum Mackay <calum.mackay@oracle.com>
Autocrypt: addr=calum.mackay@oracle.com; keydata=
 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
 smRifw1wGg==
Organization: Oracle
In-Reply-To: <c4459bfc-965d-48b4-bf28-bd9f65c7657c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To BN0PR10MB5143.namprd10.prod.outlook.com
 (2603:10b6:408:12c::7)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5143:EE_|CH0PR10MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d26118b-95b9-4379-3e57-08dd399e54ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2NHQ0ZkTUlHTElqUDFUa1ZoQTRWam9YVnpSZ1VJaEM1WWJhUjd1c3dWMlVN?=
 =?utf-8?B?MFBiZS9MWHhtQS9mdG9zcGlIQ1JJRE1vM0dNRGxWTW1nRGJPSG9zMnRFZkky?=
 =?utf-8?B?aFBqellkcFV3RGVGcDdLdGpybzM0SVBnQWV2NmlneE5ML3oraTNKOTZhdFZY?=
 =?utf-8?B?OEc4QWlFcEVROHZmNWdQY0RSRDhoZDd0ZElWNnY5dU43WUcwSk1BbDVFR1RH?=
 =?utf-8?B?K0NydTdOdGJHQURpRnJpMS9FQVR0eU1hb3pQOXNpYXdCRGE3ZGxNMk1hM0xl?=
 =?utf-8?B?OTdQSm5aK0dEN3FHZXlMOHJJdnJJMlhVWWlGa3BEemwzYTNMd3o4NUhUV1cv?=
 =?utf-8?B?WVlXODhRSzdBY241Wk5XN2lFZHFLd2xyWHRxRm91WHBsaWpUUUJlcnl2cTFZ?=
 =?utf-8?B?WDVmTWlNRENGOGZoVkxxY3l2Y2dOdXg2dDJ3bWRMdG5zUFJiRDFXV1FyUlZN?=
 =?utf-8?B?MGhDdHFDclpUa1dJUlJqZ0cwdElCelY5dTZWRkplTzltWXJ0akhzZ1ZHVis5?=
 =?utf-8?B?OUhHblNPdjhicEdsbkh4ZlJDTnFQWHJmbGJFblRzZE1jdVBFc3hxVWxpYWhs?=
 =?utf-8?B?cHRzd3pnWkZBK2ZkK1lvZ3UrNkFveGgvV090MmtNVG5LQVNldEUzRzU3TkpB?=
 =?utf-8?B?QlQxZG9qd2NJSjd3MjNGbnk1SU5DN3ZubXdSNGx3Qko4Q2IyU05aRkUzWEFz?=
 =?utf-8?B?RGRHajJMNFRQK2tWZ3RZMXpvYytyc0pJNitoMGJISkQ4T1QwWVdGQnAyd2h2?=
 =?utf-8?B?ZURIS0llTkgyVEtjRGtBZEpSUy80YzlLVHN1N2swVGdnTFBMbXY3S25kU3dD?=
 =?utf-8?B?MnA0VXlLRjlKS2h1ZTdwTnFUZXBFU3gzczJEUXpQc0p6QS8xYXVTdjA0cEVy?=
 =?utf-8?B?VTBSb2NLQU1RWGdRRW5WS0VjOGFNOFd5bmV3T0w2L0ZDNEdINTl1bWM1SEVW?=
 =?utf-8?B?SHRJZjdyRkNMTCsyaWNmZVNxTGw5ekk2QnJOQ21ycHBNei9zU2lJWU1Ubm9k?=
 =?utf-8?B?c2lKVjQ2a1A3c1VaZi9Va2NoYXRjbUIyKzRITjVsNEFTWWNsSDlqWjJmRFNS?=
 =?utf-8?B?eGNNb1dEOWVjazlsMUVNZlpQcXpETkJLNjcvWW0yaEtSdWlIdjB2R29PMUp6?=
 =?utf-8?B?M1NSUE0rTlFiV0EwNWJZNlBwYUh5TDRWRkd0b3JWUDQzL0V2Zk90cEF5WTdq?=
 =?utf-8?B?WThUT01Raldad3lUVFU3OWZVVFBnajArazhnTnEvamdCcDhNOXdnd1FKN1I5?=
 =?utf-8?B?NlU1ZlliRnV4Y2d5TWgwL0FiZnlhSTE5MzExMTkzeGhaQk94UEptVW1HcGtT?=
 =?utf-8?B?dXBhYmJkRU9hSjZvUVBIdnliSUhaTzZld1ZCTGtjQ2t1WU5zbjhLUXE4T3NX?=
 =?utf-8?B?YzVYdXRnbWJLcW5mazZGWGRMRDBjWTJQdTlPRlBkbHAzS0UvZEZSVzlRQjVX?=
 =?utf-8?B?Vm1ObGNqV0Rvc2EwdGZqNlR1RDRCelJPdHRBdzdiYnlZNWJ3Qm4zeW5BSkoz?=
 =?utf-8?B?dTFFWnJWZUw5YVRpRHFUOERJVmkzbDQvRnZ5RnhGWG5jdHgyNmtUMCs0eGhw?=
 =?utf-8?B?ODNrMzJqeTUvSFZDbjNWK2FuVWREUExNMVRZUmV5WnlZQ3ptdG5HSUk1MFlZ?=
 =?utf-8?B?K0JNN3RvdERhSFd5SjA4eW83WUx3bW90d2V3SFZwK01qZTQwRUlFL1lZR2c5?=
 =?utf-8?B?REw5aGhpZU1CU09MR3pvTjVmMWFTZzVLWEd1d2p2WENCTGExSXlDUjlReVF6?=
 =?utf-8?B?bjZLWkFmRENhTHdsOXA2OGZRdFNQeFF1a0djWmdJa3BkOUFtZ0U2VURIZHIz?=
 =?utf-8?B?djR1eWRLR0gxV1VacTMxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5143.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNQV2lDVmxFVVZrV0lJOU9qU2M0K0JXWVlxOVNUaWRnWXhXOGViaGhnOVFD?=
 =?utf-8?B?c3oyb1RIcWxoTXBRWXYrKzgrZ2FIVlB6Q3JLcld3MWl5azBZRHpibStQRHRn?=
 =?utf-8?B?OXFoNXNDVUd5M055a2lOUUVxYW9JMGRpbHlWaWxlMTNqMXdGQnpnTGliQzY1?=
 =?utf-8?B?NGJ2WXpMbTBqbGNKcmlYTEhWYWFTbjc4c0hOUVI3eFZzaWNnSzM2Z2IzZEhE?=
 =?utf-8?B?VFBjSUdjRndjQlJ6amwxWFk5RnN4THgyR0FKSVU1QUMyWlpDK0JjVnhZaDhH?=
 =?utf-8?B?cmlVYzM2ckN4WTVCcTlSV2dWMUNBVFNLZURINk9WaXIvdjd1Q0FpWDg5QkU2?=
 =?utf-8?B?Ti9xQnBDT2pralk1YlhJa0xrQk5OaFNHeldERGpUTms0VFhhc2cwUVFaWXZs?=
 =?utf-8?B?UEMxQ0ZaRFlnd2E5eHpYenRDdmFoWlBSYlNqM042QVZGSWR1eUdJUjVoSkVX?=
 =?utf-8?B?RnZtU3MvY05hdGRoL25VYmltMXlxcVpzNXJoR2R3aTFBeXVxQ1Zvb2poQmRn?=
 =?utf-8?B?UmU2dzVYOTh5MGRmZVpGTC9TMHcvKzRuMkMrejNlQ3hoNVVSRHIrVVNVYjNt?=
 =?utf-8?B?bE82ZUV3TUlFbVRQZ05HYkg4ZXRlM21nbWplWkpxamlrSTlRWFVIL0FjVXpn?=
 =?utf-8?B?U0dNVVFqdkVvbzZzVXRhSk9ScWFiSm80cDZSNHk3MmxpQ2RtUDdoU1ZnZUdW?=
 =?utf-8?B?WnZVZWFqMkkvY3hEekhDQkNSQnA1RFpFUjFZZnBSa2dLSVhzMDBQYzQrSzVY?=
 =?utf-8?B?cGpPdjc1dUR3YXV4d3dpU0puTjZDMm0wcXdxbjdhZStaN1U5T01sem5JUjVu?=
 =?utf-8?B?SVJlWXZoQWFnVmJnUDJIMzgrejBSOUhMczZFT3VmRGhBQlVMdW90OTlqUXFk?=
 =?utf-8?B?Wnl6U3VacjFBMDlGc1VueVV1ZjNyb3FrRDVlZyt1STluYWRjWThva1d2S3Jh?=
 =?utf-8?B?UnFFTEFLMGtrRlZDQm0wZTRjSXNQTkJta0dnd2N4dThJbDBlWisxd0VGVHdL?=
 =?utf-8?B?dzlsUlIreFFIR3pCU3JxUExIU1plelVndkhFQVNEdHVrZHZRaDZHYnM0TFB4?=
 =?utf-8?B?NkY3bmIycTVXVWF4Y21ocDBmekZpMjgyendHNm5BN3p4bXRBTVRmUUVMQWR6?=
 =?utf-8?B?QllTT2I5Vm1iZlcyUHYwYXNVeGRYRW5DNWlHZVdyd2d4ZmdBNHlFWkZrUHZo?=
 =?utf-8?B?eWZQaGVPT2Z6QXNhNTQyeTNtblM4TnNVaDh5blRQeG1GSEVwbmRrVllUYzRZ?=
 =?utf-8?B?MlhXdndHTkx3R2JVUStQTWF2bmNQdWxCWGRlU05CSzZoNHhrQUlSL2hKS3ps?=
 =?utf-8?B?UGE2eUJ3NUJseFZ5NFFleDl4elozY3k3ZGV3a2pIeDdVbFBXK2t0OENzSVhG?=
 =?utf-8?B?WXRUOEZSaTJuQ3pWeE1iaGtJMkdPUWxMSklwWjBlYjNqTWo5NTRQM0kwNnp6?=
 =?utf-8?B?a1JBNFcvRFFvNEs1eXo2OXNucDJMdGZWT1g3V25ybW1mVzh0VmRjVmJFYll6?=
 =?utf-8?B?Z3owcFJoaU0rMlc2Smh3dkNIS1psL2VicC8zWDNzdlBTZG9WYjk5cUhnSjFM?=
 =?utf-8?B?MlFHa01EOFViaUZpeU5yb2pEbjZHclNHdkUvM2N4OFd3Ymt0VExvcWRhd2Fw?=
 =?utf-8?B?LzFqclRxUHR5RHUyd1FqMW1ySVJDa3RkbTJ6TVFJSkVKVnZkejd4UXZEbFBD?=
 =?utf-8?B?TlpLK3FrbFdldWNCR3hCU2tIcm5kOTFoZS90SE5BNU51VXJ1KzUxMHh2a0pH?=
 =?utf-8?B?Lzl6eUphM0dnZzBtVVVXNms5SzB6K1BibFBhSGUxdnhjZGhUQUNDSXBFOHRo?=
 =?utf-8?B?MllNMnhGRXJIdlRRYmkvTG1hNm0xeFNhdXNWRVdGdjFydnhpTERSblpGSitJ?=
 =?utf-8?B?K2ZFS1VqcHplWXdaN2xrcWYwandNMzRlYWF6NjFGU1dlUkhkaDF6UjcwN1Vp?=
 =?utf-8?B?ci94VUJYRUREM0NWOTJkYVlwdkNPS1BnVHhhQis2RUVTT09zSHhOalZIaEp5?=
 =?utf-8?B?ZDFtaG5CbGx2THNKWTFaVFBrbVBkaFAvN3QyZXFXd3ZLWitDejRTaHY5aE5z?=
 =?utf-8?B?Q3NCWmFBYjVvRlJreGYxZC9aSHF3N0QxUFhXUzNUbHFZc0ZMOTZEbzEwOSsx?=
 =?utf-8?B?Tm1ucmlINTFpY0d3VHQ1Zng4czJiTit2b0tsM1hrbVpQL2EybDhiVG9Qa3R4?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pmQjOAENBCEbWoCKlFKAh+5Gja627EggclXJFLsWjnMuurcowcwbG2WsXTaiFL4aTNUvjyaa2FDZj0yuSXVpC1LvehUgeVZD8Bx4V6yEXZEsh4UOYYlIqUw/EvQ48eoyAf6mSMaW0GwN3xceCmGVaaqMhJS1KC9W8f2KfQHrKuYXPP8bN4u0VgV2NYIAlg5Jzax4Sorm02Su8hz5yqqjY8LF0ijSax0C4JfwXmwxRizdO7Rv3wQLD2/01DV5Wv5z+Qx8ZCv0XJqEMAfRsrpji8quBbi4cuiVjSqDnyXgdgooQFMVpOpXol2ueCWMJPdtpdBPtPJht+0DBxjg+tIGau2AojihqaVEpKmLDJ5AQWcfjEw604QsOeEAapJgKxqk6YhegJqw3z+WFQC5zZcymc3j3c6WWmX6A/R8Re4CMnkQaxlDa7z+JKlBjSEne7t+irNbl9/+FR7N47OSpiD1AoQ3aOfIC0LZQ2s5LvhxhswTB+Jehf8RMjmw+H73QJoXFl3rJ7W3gG+vJUWxc20fJF6c32kxg5H8FM1MAiTavuBLShPjEBWorpXUFL4ysEd/gbBsT1wwxsInQWegb4wss+MsUU3ThRHc+IY9/WLN3yM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d26118b-95b9-4379-3e57-08dd399e54ba
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5143.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 22:03:54.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AYgMX/EfOs3JU5++6GKy0Uc2UWMHMw95hpjXJol12bnT2uqEtjHA6QIEqgxlVA693n336uT//Bemd7E4RqlZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_06,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501200180
X-Proofpoint-GUID: 2A0k4U0YbC96b2PU0CzQVs9s7eyMT1Dw
X-Proofpoint-ORIG-GUID: 2A0k4U0YbC96b2PU0CzQVs9s7eyMT1Dw

hi Steve,

On 20/01/2025 7:08 pm, Chuck Lever wrote:
> Hi Steve -
> 
> Adding the upstream ktls-utils mailing list. Note also, you can
> file bugs and enhancement requests at
> 
>    https://github.com/oracle/ktls-utils/issues
> 
> 
> On 1/20/25 1:39 PM, Steve Sears wrote:
>> Hi Chuck,
>>
>> It's been a while since NetApp. I was pleased to see you wrote the 
>> NFSv4.2 TLS implementation.
> 
> To be accurate, TLS will work with any NFS version.
> 
> 
>> I have been tasked with getting Hammerspace to work with this and am 
>> using your client to test using Rocky Linux 9.5.
>>
>> My implementation works but runs into trouble with certs, preventing a 
>> TLS connection.
>>
>> I created self-signed certs for testing purposes; and from what I 
>> understand several of our customers also create self-signed for 
>> internal operations so it isn't totally test oriented.
>>
>> I have not been able to get my self-signed certs to work with tlshd. 
>> And I ran across this NFS Wiki <https://wiki.archlinux.org/title/ 
>> NFS> that says self-signed certs don't work: but it is in the Server 
>> section so I don't know if it is a general thing.
> 
> Self-signed is supposed to work for the Linux NFS client and server. We
> want this facility to be easier to deploy than NFS/Kerberos, though it
> will take more effort to get there.
> 
> 
>> I can make a connection using /openssl s_server/s_client/, and 
>> likewise with /openssl s_server /and/ gnutls-cli /client, but the 
>> latter only works with /--tofu./
>>
>> /gnutls-cli/ is supposed to work without /--tofu/ by updating the 
>> trust store, but I can't seem to get that to work. My suspicion is 
>> that if / gnutlis-cli/ works with /openssl/ then I can apply it to the 
>> NFSv4.2 client; that might be too optimistic.
>>
>> Did you ever get this working with self-signed? If so, what's the trick?
> 
> Our testing environment (bake-a-thon) uses certs I create with a local
> CA. The only thing I can think of is that the CA cert bundle has to be
> present on the peers for the certs to work.
> 
> But it's been a while and I'm probably forgetting something.

I originally got it to work with a very simple insecure cert for 
testing; about the only issue was that your DNS full name must be 64 
chars or less, to use it in the CN. If it is over that, you need to put 
the DNS full name in as a SAN, and the short name as the CN.

I also had some trouble with wildcard names.



My notes say:

# on NFS server
#
# create self-signed, unencrypted cert & key
#
# this requires full DNS name to be <= 64 chars; otherwise see below
openssl req -noenc -x509 -newkey rsa:4096 -days 365 -keyout nfsd-key.pem 
-out nfsd-cert.pem
# all fields blank except CN: use full DNS name of NFS server
Common Name (eg, your name or your server's hostname) []:blah.domain.com
#
# if full DNS name > 64 chars, specify it as a SAN on the cmdline, and 
use the short hostname as the CN
openssl req -noenc -x509 -copy_extensions copy -addext "subjectAltName = 
DNS:toolong.domain.com" -newkey rsa:4096 -days 365 -keyout nfsd-key.pem 
-out nfsd-cert.pem
# all fields blank except CN: use short hostname of NFS server
Common Name (eg, your name or your server's hostname) []:shorter

# check CN and SANs with
openssl x509 -in nfsd-cert.pem -text -noout

chown root:root nfsd-key.pem nfsd-cert.pem

# /etc/tlshd.conf — adjust paths as required
[authenticate.server]
x509.certificate=/home/xxx/nfsd-cert.pem
x509.private_key=/home/xxx/nfsd-key.pem

systemctl enable --now tlshd.service
# or restart service if already running
# check it has started, with no errors
journalctl -b -u tlshd


===


# on NFS client

# copy cert from server, then store cert as new anchor in system trust 
policy store
trust anchor nfsd-cert.pem
# review existing anchors
trust list
# remove any previous, obsolete, test anchors
trust anchor --remove 
"pkcs11:id=%E8%3A%86%59%D2%A9%21%68%F4%30%94%E0%E0%58%01%5F%5E%11%02%72;type=cert"


systemctl enable --now tlshd.service
# or restart service if already running
# check it has started, with no errors
journalctl -b -u tlshd



best wishes,
calum.

> 
> 
>> Barring that, is there a way to get the equivalent of --tofu to the 
>> client?
> 
> There's currently no specific code for trust-on-first-use in our
> implementation. I haven't really thought about it.
> 
> 


