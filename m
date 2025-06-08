Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3C19DFA2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749406496; cv=fail; b=HtY8NgI67kSoJMghzQCwylFU7q2lusvVvkKYAlT0Qz8/6s9C9pHlT0q9J4kO6t/5TCoFgvFvjt5dhdYPzPTmZmk437ejU9kD3wen0X3leDBgd7MJZ8sab+Vu3qS8iQ9SdT3PRJ5YCcTWmEyPpBifAinXIzlSNvDY6JwmvKpav6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749406496; c=relaxed/simple;
	bh=MIyb1K8iiqpEXywR5EwWktvCt35RUKs0cqmuKTO8/CQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WcxYHUH6P0c+AOgMFgfEhq42uf1eFBxJXp26B0b+ziYAJAwp/tdnB2OR75/Xxc695MYtG+cawoDzwt/EAfigeGsSt07Wj6QWFScaYkGZ9QwzmEeMkP6SkIUi6OBVqRf2sbzCpeWaDgr82lZjSs8+cfgKLlMR4vIz4dfS6VewRkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GWVKCA3u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YYlDgk62; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GWVKCA3u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YYlDgk62"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558FwjWH019322;
	Sun, 8 Jun 2025 18:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=trsiYaPh9p9feNRi6lSODpvs9igk6zU1ewft8ohd+pI=; b=
	GWVKCA3uLHLLXte2/6qfSBK331c6zLo4Y8lZ30wv9ZKhZPESVr8O+VAxAJ7kin+f
	kkCYzMYWogfGuqQEWg5qjopCShksACSFRDZFtk84mdVcotC30UbS3Hj5MRvq7R/O
	wTVWEtOOerJ3l3s+h//acSghMfEObOX5GQ8yzN9hkowwF3qQN5+3Rg14K0aLakv9
	TM0BM6W9pL9YLNjrbEIv3b6sI7hOyH6Av3mktbG7sq+xezgpBSvoua16RpS9gDIe
	pKvEAbcoSZ+liBr2XUKISQurazgoV0xuESIv35feXMJD13llozEkb6Le20YRYUzP
	AM2DRyLudarGhlPTGGRCAw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjrejx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:14:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558Gh4Fs020725;
	Sun, 8 Jun 2025 18:14:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7fn03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiWjoMLVQCkS1tqoE8kgXbRL3QvHkWBkrWnKzH+kD5d4N5gAfN8obFUpqUkgFuVcK2GeaD8NhWrK18lC64O+yf4FiyasMsL2yR68IENFpaSQ6JlVLSeVBnU3fJw8nrjEPC1hVf6QxHhEO1CcpcOZ1EPfb2AUj24rVWekPVuPilitx8DNBI0qDiVPU13BLUV5Wz9DRq2H1o7NK5U/w/Wncz4iNAITcX9oVkKKeyFxNte1jrnhve1PEew2SiX0DV9LbR/Wj2hDcECHt3n112+kDyX/HxzvRG+m7ocM15gaRj81WCaimgfo2Q0kIFa8pvjdv7/LcX+cv5djoDplidR2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trsiYaPh9p9feNRi6lSODpvs9igk6zU1ewft8ohd+pI=;
 b=Ix4whmDrzsZYT4mvBsZybf+Ij+s/7wNe2y1Se8ezntQ1jIfMN/lhEgnKZpydSr4j66CSnTr2ln3nEZDC8ZA43zNe6KYKAh1RHrSwpszbUppCWGm0DrHcOaGW+1sVP+p0TeyBH2dY8AVkCKpzEyPT0lwgkOQ57zUISDm5QoemoOsm9FGVd9CW/z3uour0C2Pf6s8TP59IV/Inemmn/s9EbQRx+4LTe/Ow8oEa2Pmdx0XgRA35WpZfSn7EnNhPPy47wY1urmWx2fhEkVy0yt84RmA0+iGhrtnEbyWNbg0JZk6NSdFkUAVsB3V1Op1RQYoFsDg1lMpSlWMa/1eBSk//fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trsiYaPh9p9feNRi6lSODpvs9igk6zU1ewft8ohd+pI=;
 b=YYlDgk62YfX/PZpFty4r/GUTlDBJGFGAslpjZgXiGW/K/j20M6V25Ft4mF/1BZT/7QMnd5S83FAMP1+KX4O7bgnl2wYpL9D9g7yLSRY8JBQYfuH8XRoq6V2VejUrXZfJuHfKa9+iJoiiWe0xSAY+LnDKRLzcuwtXXSa434vw/MI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB7793.namprd10.prod.outlook.com (2603:10b6:408:1b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Sun, 8 Jun
 2025 18:14:50 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 18:14:50 +0000
Message-ID: <19a1b0ee-663c-4324-8ca3-dc7ae0fb95bc@oracle.com>
Date: Sun, 8 Jun 2025 14:14:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tlshd_handshake_parms: Use an empty string, instead
 of "unknown", for the default value of peername.
To: Ken Milmore <ken.milmore@gmail.com>, kernel-tls-handshake@lists.linux.dev
References: <1f1e31ce-84fd-4db8-8873-68ba69019f67@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <1f1e31ce-84fd-4db8-8873-68ba69019f67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:610:11a::15) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LV3PR10MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: b110642d-0879-4db3-2a4b-08dda6b85c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnNaTldJcUsyL0F6MFE5bzVxSDBNRHJ4UllwODZYbjJjK1IzeE1uYVhndGRo?=
 =?utf-8?B?NjBhMXYwTW1KSkFTK1AxVkpubnU1d0FuTkJIeVJiamk4YjQ0QWdqUGN2QUUz?=
 =?utf-8?B?ck9ZL2NXU1A3ejRUODRvRk8rRzVMUThJVXVySEU3TmR4TFIxQXU1d2pScUtp?=
 =?utf-8?B?TVg3OVQvN09FZ0Vsd05RYm9FZGtSNS9lT2ZFSnNBUVNmdmFQMDRjV25HaUU5?=
 =?utf-8?B?T0xkYXlERUhxeS9IWjd6QnBEQ1NscjBaMFBIRHB1ZVdjdWpPR0ZiRm9mSFRk?=
 =?utf-8?B?ckdrZ1ZxOGV6SEVsdDhLTlUyNmtPZTE5TjRxd1QvdllxTTVja2Q2ODJnKzZ3?=
 =?utf-8?B?Yzdicmw5T3A1a0liTXpNbTZmUGlLaG5QRXRtTlk0UmtrWlJvdFNMTldRdERG?=
 =?utf-8?B?b1BVQmM1MTczMmVYT0lseW5GVllmVm0ybUpRLytyV0NKUXpncTNmQWdzTDFt?=
 =?utf-8?B?Z0dpRVBhRFVSU0ROeExDZk9memxpUGZZdkszaGhUc0loR3oydGkvQTlZRXkz?=
 =?utf-8?B?T0hla1B5ZlFvUWZUdEdTWXpqRTFSUjJZWGxOSTBVVVRSWDZsZzBtbk10TC96?=
 =?utf-8?B?S3pQUy9wbkRVZGU4ZHo4NTNVWnVVWGR0S04ybHhsOGhKQXBiNnBzYjdrMDdH?=
 =?utf-8?B?ZzQ0ZlBFTVBRWEs2b1N4SjZaQmVTc2lmWkt6azJ3VHV1Uzc5T0VEZVZkMmlo?=
 =?utf-8?B?ZVFmVXo0dzAzSzAwNTNTOXNtYWFjWmxodmdKTlF4dmkvMmhQVERJSG5IMkl2?=
 =?utf-8?B?TVhxT2ZUdDJHNFByU0lEM25YQ2R0VnVWb1V0QXJEWU9ZSUlSbGxESmtBUCtO?=
 =?utf-8?B?T1BsNWI1Rk5QdDE5cnlyTmV6UkF1RnRvT1dRTG5SM2ppdkJtODhoTXFQaTVv?=
 =?utf-8?B?S2s1QVE4SUliT1U3c0FldDQzbTB2UWlmMXFDMjNkS2ErZFNwRVptU0lFRVRh?=
 =?utf-8?B?NGhIcEp1QkMvSTg4dHNhdlhwWTNsdFZtUU1SVnhYWlVudTN4TmdZZW1mblhv?=
 =?utf-8?B?ZEhoV2JJMmV4Ymh0M2t4blBlUU9TbU8zdjdFdlEzZElmSE9CVkRZZGtVbFM2?=
 =?utf-8?B?SDcrZTRHVy85b2ZVallzaHlYNmtKVitnd0NsOWVDTm1INmliRWFUQU8yd3BW?=
 =?utf-8?B?SDNieUdZbm53NnpYWXJOSlBmTWkxSDBSTTA2ZmVtbEpaeEZFa3UvNFR5NWtP?=
 =?utf-8?B?c2tLSi9Yd01lQXhKd1l4am4yb3RqOXFGRFRiRVlqb1lwbmxFbTlIQUROcEhC?=
 =?utf-8?B?UjhORE9lUmJFYnhvdzAvUkhKUlBJTHh3aGlld25NWkRKT2dLZzZrQk5yd29y?=
 =?utf-8?B?RkVyMU9sVWphcVh2cmN1VENKZS9FY1E2dStqTXYzSHg2cTlML0pZQnBrc3hl?=
 =?utf-8?B?TEZ3elYyYXhONnNCbFVxcHVSNW4vekFMWmxQQUh0a1BYbFk1UjRrc1AzYkg4?=
 =?utf-8?B?NGN1M0NIRkgvNVV0QnRNNytsVXFydmY1RVJzVGdLSllTT290b21GRzFndmMx?=
 =?utf-8?B?MGVkZVNGMUhsY1RLMXBJdTBOQURvQ2NSVUNmMjV5eVJ2ZVhWcUx6bGQyQy9W?=
 =?utf-8?B?cDhhRmtzSnRTRVBwU0JiODM4YkZUOWp5L2pqdW1ZT0Vla21HRUxzQ0QvVkVm?=
 =?utf-8?B?SEZJTmRTVFJTalc4dFI1dUlIbmhnSTNsa0U5NWpZeGdXUjNlYTJQT0JDZ1Fh?=
 =?utf-8?B?SGxaN3ZubTV0R0JPQVZNNFA1VE83enpMMm5VSWZRcDJQQmFnTjZPbC9VZ3dI?=
 =?utf-8?B?SVpWZ2JQMUYrUmJLL0txcmJGYUpudG1EdEFHd0pGaE1qOXdmVml0OGo5NkVU?=
 =?utf-8?B?dEhmK2tSTnJ4T0VlT2Z3czlqN3FRRDg5OUJRVFVMM2luckhZME5KRHp0YkdM?=
 =?utf-8?B?QWRkTTI3NEt5Y3Q0TDlUUU9pa0t1TDl1VlpkVmtFeFJSYkt4QVdpNU1QYWxR?=
 =?utf-8?Q?nI56r/ISGNI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29LdjA5MUhmdFVRYXp6dkt5OVhFRHpFNnpwMEhZcnpXbUtyZWN1N3JyR1R6?=
 =?utf-8?B?Y1N2T0daSXRyMFpOSUpBY2NRS3NNSFN1cnlTbWhQeGlvNHRPU24wQ0tYa3RP?=
 =?utf-8?B?V3IvUER2VXdEak5JNHdsbjM3dEJmcmxQSFg4OElQWHBaT3dQcVI1ZTZBZyth?=
 =?utf-8?B?cjJJOEd0eVJRbWNsRzlUbmx2cGN3OStuSzNzSkRrUTRmUzV1c0tpaTE5RnA4?=
 =?utf-8?B?QTllTEoxQThqdEdocCtwOVBEQ1ZUeEp4Q1N1Wm5OYUhORHNLZEVFemFQVFcw?=
 =?utf-8?B?OHI1bEgxeHlxYXV1NmxYUjNtVzVzeEIzWThTSHhyU3I3dktYYTlob0FrYVJG?=
 =?utf-8?B?cHpIMk81czVVbUNUanRqWWpaMHozTjNoa25DMGtZV0MwdXI0cllxSzZHNTJ0?=
 =?utf-8?B?cnZTdGJCR3FXSW9JZDJjUmVCOXh0b3NwTThFSGdsTTdKZzV2YW5PWC81N1Fj?=
 =?utf-8?B?SkdJZzg0RWxYRmRWRnZlN1VIZlJsRkU5RFpLYjdDenJUSWw3VzlyV1FONnZ4?=
 =?utf-8?B?S3ZPNWRqcGwvWjRHcDg3Ukd2Q1ljdjVFWi9pekFBT1VXQlJYNFZGMisyMTdQ?=
 =?utf-8?B?YVZ4Um9XNW9iQ3hXd1FNVk53RTBoSFl6NXp3ejBtN3EzY2MvYkFrcWRKbCt6?=
 =?utf-8?B?RmFEb1VzV2ZRM2ZOMzBWZm9uU2VwYUdWNHdEaEduWWRJNVVpbmRWSVFtMFBP?=
 =?utf-8?B?NTBOeDZaZXFnZTV2OGxoWmtFakltMVZOMmpKVVYyV0w5WWlWUVpkWnQ0MXNo?=
 =?utf-8?B?Rmw3Y0orRWtRS293K29EdVZ4TWRMM1hreXczbDVObWg5VWpEUFljeUJaeisv?=
 =?utf-8?B?b0lrc2lSNFFOVG9zcXFtR1lveWJQUWNpRWR2ZUpxU3NkQ1ExSENCcWJvZjln?=
 =?utf-8?B?RThyQ0tkNnNLTUs2ZXZPaUtjQ3IvcElMbDdhakxZcmZyV3RTMlFUcWxpM1hZ?=
 =?utf-8?B?a1d3MFZ2RkhhU2wwODdZMVlOeVhiTHFJOFIwc0dYK1p5Mm5kaGJ5dzJKVkpH?=
 =?utf-8?B?SGFRbGFrZ1ZnZmVuaFloMDg3Mll6c0tVdXlHQ0pRY0NGeXdlWmZvTSt4N01R?=
 =?utf-8?B?SFh6TlgyYUxPemtHRWE4bDdkTTJTSXJTRyt2dzJtS0ord00zRHRhYmVUS1pI?=
 =?utf-8?B?ck9CWnBlOGVPTy8zc3RNS1JwOG1IbW4wYjFyY1RJeUYxQVNpNmlCTXYxZGZ6?=
 =?utf-8?B?VmJOWlpYbXE5RGkweUhFM21GZ1Q4NGlPR2RWOC9lNGlXRkk4bzNTVkJ5M0xB?=
 =?utf-8?B?WWJaOU82ei9tRHM2S01HbS9FM2xzWGY1TDQzUGtqVFlRVDl3N1huVjdHbnNu?=
 =?utf-8?B?TzVYUUxJTGVCenpKakZTYTMrbnZRdXkwbmNncUpOdHZocW0zaUtvaTFFTzRR?=
 =?utf-8?B?UWp0UTVxOGN0WEVFVHVZNlJEV0VWK254NEZvdTA1cUlCVlRjYzZ3QjYwb0g3?=
 =?utf-8?B?aHdNVUtKU081MlhKWGVhTUg2WDVabTlvOHRpTTE1NmQ4WE9ianB1cVJHS1po?=
 =?utf-8?B?aFRZQVc3UENWOFhqeUg3TnAxYXM2dXN4YnN5cFZKdHRrNzJJYVlPVS96NHRY?=
 =?utf-8?B?WlVDeEtNbGhsVnpGalhtaGljVm1RdW81S0VOL1psZ1JDUnpHQmx2YWRjWldM?=
 =?utf-8?B?czArQVRYNjFDdmplU2Fja1RMcDA0Y20wWCtRR2pUWm9FTkxDN1Z4K00yWS8r?=
 =?utf-8?B?ci9pdEc5aThsY2pYWkhEYWI4aTNKZHF0Zm9yL3dkZEl5a2NiaW1NSnhhbita?=
 =?utf-8?B?YjFTMGJqRVhMcUtsSG54cVVaeXBVcy9OZ2Jic1NJR2FKZWlwL0MvaFh4bGdP?=
 =?utf-8?B?Vkx2S2pTdHZvaDYwR1BQdzBuUlRqcjdIUUxaTG1SQURYdTJhR1hFZ1NvcWF5?=
 =?utf-8?B?TUY0WDNkT3haVVg5QTdGeW83dGU1QS9YeGFSanl5VWJVcm9hMFV3RnFUUWpE?=
 =?utf-8?B?Y29RUGVLdVQ2Q2NndjR2cFgwYnFaTTdoOUxlTUNTaHZsYU5HeTJCOFBtNjc0?=
 =?utf-8?B?NksxbDBNd0c2LzlwbWIxTTA3K3dvdkpUdlNiTVpKSGVXRUQzNi9BSzZtcjVZ?=
 =?utf-8?B?VHVmbzdGSGlGSEtta1IxbW93Zlc0NnJNeHhtUks1Tnh4NHJsRWxhNmxCQ0s4?=
 =?utf-8?Q?9BZovL41+Zb+7xf4dW6qgAu1Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6DsU9moS55A1i67Eoe8nOOUoqLRYnJZpIu+TWzN6/sByopKhegp8NMlLSr4Jztq5+DISe5LKuJ0FQWl+OCS5P5K+cK4w4GWEk8VejrdFmqMIxTLlcoRGR4fCEZME27fwylXw/DxSkkTvd9zPfAJEm1DHnQYGkKUCvfU6oh5Vfu50um1svVQzeuf0nC7nxs46xlo8wNn8NdipFZ3upVwxT5r9IbXKaMZuo2GpaK8UdfewoR4ivfEgMan0qKDnRa9u1fFxv9IjUQNQtp0Xnz4xLezf0vdRvTflVRzVbkHF2cVd4ZEUAP9ZxqJmNxNpE5ZLBGPTpHl8FtrmWQ77/tWg6Ff30XhrbJaOckQAFuKDy6B4SUdIU/3p5CEBMPp0J2qxrnPgsiHPy1sZspjPhHjduxzFZAA/mrPx3wfXibB3t98Rkqd75ykk9PjOzQJAH3VA0dIfX7+9aNu8r1iUW/ujnhMz/DNU7qzeMAd3NUcwLn7hiiDm/C7ksUbt4fBf2/Gjkp+2wpmRlftgWB6S05gc2RbpcEJymoLebDCEKW1e8fDjagUr/TBgE3iXjxFcawFgYBll/ZHi98/cHqRtqSlFGHH0DnJeG2YzYvSGtroRXuo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b110642d-0879-4db3-2a4b-08dda6b85c11
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 18:14:50.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uQmEtMF0Bq+AEAvimUbkrFMnrVct5+9FNTCRX6aVMBWmwQ9pdZaD6qoiT7+Q0JtAmw6RuBL8sk7SMneIPYZGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7793
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080147
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=6845d31d b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=LJVzYK-2ls0FEW-3:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=AtCasqSsI0knLD9_6PYA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0NyBTYWx0ZWRfXyn5z3HdHadyt kjYvY19cFVo+WAKeS88Pb3EIpSjq7+R4lK/ejtTwxNEofn/6F8qPo1dILIGan7zmuYgcw3+ENMw Q1c8b42jeejeD8GWwRgohjJAql2zKmJpmfJLbikuTE/1WeE5/1zfWh2fP203xUegGJ4fK8x5Mcq
 32SzYTZtu+ptpJAoPvWeju2bloU2o2OG1Lwrc8tdDi5TY/sRPriIGskM82oMCjX8worZb6GWtzW nDYZmmGpmtx8H8DthJ4Hsf1fbK9eFHd50vU/UmBeZhLqb/VnWsJ6QwBxk0YF8qV60ERF9lUoHLN 6DdoL8dw4NU5JScJxhI3IuTNG/YgJq4wtkaFeUDqcAVj9FuPXMqQkl+VT8cz0QJYMhpNQHiSESv
 XoEob7EBkfyeSiw9bHR7MoB27Kk/h8/6dBmRr4OjtnnlDqwwvViSBN/vkehDlnWVvcDHlFMx
X-Proofpoint-ORIG-GUID: 0OdJOy4THSHdtwrvMBxqVODCurQ5L4fy
X-Proofpoint-GUID: 0OdJOy4THSHdtwrvMBxqVODCurQ5L4fy

On 6/8/25 1:43 PM, Ken Milmore wrote:
> "unknown" could conceivably be a valid hostname.

If that is the only problem, then a one-line patch changing the initial
value of tlshd_peername to "<unknown>" should be sufficient.


> Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
> ---
>  src/tlshd/log.c     | 6 +++++-
>  src/tlshd/netlink.c | 3 ++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/src/tlshd/log.c b/src/tlshd/log.c
> index 3594d52..77e2d29 100644
> --- a/src/tlshd/log.c
> +++ b/src/tlshd/log.c
> @@ -57,7 +57,9 @@ void tlshd_log_success(const char *hostname, const struct sockaddr *sap,
>  	char buf[NI_MAXHOST];
>  
>  	getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
> -	syslog(LOG_INFO, "Handshake with %s (%s) was successful\n",
> +	if (hostname[0] == '\0')
> +		hostname = "<unknown>";
> +	syslog(LOG_INFO, "Handshake with '%s' (%s) was successful\n",
>  		hostname, buf);
>  }
>  
> @@ -75,6 +77,8 @@ void tlshd_log_failure(const char *hostname, const struct sockaddr *sap,
>  		char buf[NI_MAXHOST];
>  
>  		getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
> +		if (hostname[0] == '\0')
> +			hostname = "<unknown>";
>  		syslog(LOG_ERR, "Handshake with '%s' (%s) failed\n",
>  		       hostname, buf);
>  	} else
> diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
> index ce8e981..0f4a797 100644
> --- a/src/tlshd/netlink.c
> +++ b/src/tlshd/netlink.c
> @@ -223,7 +223,7 @@ static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
>  		parms->x509_privkey = nla_get_s32(tb[HANDSHAKE_A_X509_PRIVKEY]);
>  }
>  
> -static char tlshd_peername[NI_MAXHOST] = "unknown";
> +static char tlshd_peername[NI_MAXHOST] = "";
>  static struct sockaddr_storage tlshd_peeraddr = { 0 };
>  
>  static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
> @@ -289,6 +289,7 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
>  				  NULL, 0, NI_NAMEREQD);
>  		if (err) {
>  			tlshd_log_gai_error(err);
> +			tlshd_peername[0] = '\0';
>  			return NL_STOP;
>  		}
>  	}


-- 
Chuck Lever
