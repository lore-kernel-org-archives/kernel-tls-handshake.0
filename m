Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EA153519
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713801579; cv=fail; b=mr97xk0ErVHvMXkIn6ghyeFfSzwjmvEHxNCK1RrfvvCoNqtJhortd0ATGLvjV4ASZAJyi33WaSUIXpKDaPk4b9KAT/4reNhd4oTQAizDRUSIU50PjcDFJKfiB1iS3uXLkZjlkn+W3B9fO9Im+FibUmldpkHuRPXplIiuazkz+Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713801579; c=relaxed/simple;
	bh=A8Oovht93oPY7hp8a2fdkm2sZVVQxnFS/unf1hdJgRY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MyRp2BqhyXPAtLLTXYHOkc7hTfRrtYSGZaUqBCOSuAT7Bp+7JM6y3fweH6rrq3Sgx0ZkaDz87XOzFBKTHlXOvY052Oo6RiB9Rnl4Yv+opzt+Ogs2iaGUhfDaVYn3gnGF5HH+mRNFYGszzRi7bwug1/qlcnymvjzzpgmwZErCjfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nragMz92; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hvbh0obC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nragMz92";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hvbh0obC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43MDYq4w018272;
	Mon, 22 Apr 2024 15:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=A8Oovht93oPY7hp8a2fdkm2sZVVQxnFS/unf1hdJgRY=;
 b=nragMz92hVjVAsH2JILX3MMpiKX+l/lDLH/7fBoyNaf0Q7o2moAAN+WQyGxZExmq/Qcy
 UgUqB67bzAk9zVFnwloNJpcsweI57FWSN2ZCP8BqQK6XWxCm6LjIKygApkLSoS1KLbRO
 s8hxjfLOLGNs3wdVWkp1v7AaNFAP0HsYxnzBNWx6Yqd4MJ9U94KNUX+KNsji7/KJ+o+x
 wIDDdpSLLQcuE5lrThXO76oAzMCmRzAjxbpwWcPmjoQ5+Ep9OqpS0xHb6Y8rU4+/hb7d
 4rfgW0JoIQFjTVi8XY8/mJrXP/z5E/rbAGNGsdDiIYi+73mKSVgOru3nVFQiRqWh6TvG eA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm68vb0en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 15:59:36 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43MFOA9M006977;
	Mon, 22 Apr 2024 15:59:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm455ubvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 15:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUGAB3zJt9sNdI5Fj45DnRes5Lt97Y1JSlom0VoCAne6sndNaPm3YDyr2npvLKA37AHVnsuPi63rwpVFyvZtdG56hHJ34DDciQkgPxGst6jTi5qP5+c9SQ1TuUIFzK2SCxqU7DrgJYufX2FsBcV8ROJO9yBxrE/qxXXzy76Q5QrcVLnQyvQNjGN0djHuBmwZ/J2jEcc6EFuDFpQlR0TJh5CA6/mltWbQfN2KHYLGCwaK6QyU8d2j9XuvZjz6iqLEdO2o2cuxGvPXa6A9QX3118KcfjcqXJZuPxT/HL5yN6ktvGIOafU906gkaqtk939TxaLM6kcWPYKRHwSCfYlbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8Oovht93oPY7hp8a2fdkm2sZVVQxnFS/unf1hdJgRY=;
 b=haWhBEYaVuSqYRLfRHE7yhnExw0qv7fUEIUtzqDFG0ofIWzl9uuo1ERb5pqqT7ZQvG+ITvtRKnzhMnzubJ34MG3u6byz1e4zFiQAUZsetbXAC/2YNEOb5gZYCtNcBq+9+0GUjU7LmrSOvjIiv7zq9tf9aAlCQP5SE5eowqeDzbiC+Wp9zgx7jIvTPmzReqrBX4/V5bWycLY3+MZwpjZoYcpYzZs1MGHSCLEpOCpXXMO7P7GGm5TPSmPdrwHYP3uFI6kE9R+1qZzxuG7OOhnJndM5ERmRpeG+earRNaWLDmF5Hd+1CuV41NCfzi3CLOCxkHLMbyPIm5r6FE+hw3Vx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8Oovht93oPY7hp8a2fdkm2sZVVQxnFS/unf1hdJgRY=;
 b=Hvbh0obC1AoWHgoTsbWPSG2hBwNIKlFVxR5HrgC/pyfuhuid7bqD4kaRBRLfRb9DI53AzAe4OvcCrPEo3A50gV2c96+ZpJadDCRYAgo+panWVaDTCI2OwtuLaeE0j16P17kVwE4emzDJroQHwyw4DntNjUbtXfkRDuQpLch1s6E=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4308.namprd10.prod.outlook.com (2603:10b6:a03:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 15:59:31 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 15:59:31 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils PR needs review
Thread-Topic: ktls-utils PR needs review
Thread-Index: AQHalMgPifjynCvj0k+v8GiIPsEkBbF0cWWAgAABHoA=
Date: Mon, 22 Apr 2024 15:59:31 +0000
Message-ID: <AD446B51-7488-4F07-9637-39E8FD452D97@oracle.com>
References: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
 <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BY5PR10MB4308:EE_
x-ms-office365-filtering-correlation-id: 3a024abf-5ed1-4742-e284-08dc62e532ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Tm9LMUg2MEZxSHdaemsrZ3JzZDdCM24zcmMraGM5SXEwQ2l2RWdDNlU4NndH?=
 =?utf-8?B?YnlLQ25LS3MvdWIvd2xqak5IUmswL0Z3RENZdkovaGV2bStoK0FUVkV0WFJW?=
 =?utf-8?B?M09ROHpabG1BL3AxTDh3RlZRdG9Bc3JhODQzaWJYdkQzcTlMNUVYdHV3MXNF?=
 =?utf-8?B?aWNiVGxiS3BiSGZxZ0VnNkwzc1p3TE15dnRKaDNhRHB4QzlnV0phcjRKZENO?=
 =?utf-8?B?WE0vc0xHaWxaSmt1WFlUdE11Q09OTUlwRXNHbjlQMXFlYU5aMXZBNWV5dEc0?=
 =?utf-8?B?RGI5MldhTzc2cXh1Szc1RklMYU5IMithdjEzMHN3WEw5QWZaaGlnbm5XUFk1?=
 =?utf-8?B?UU1ZU1BTUVpaR0l4cHNFb2xSMmJaaWxQMk5aQVFZblJyazNhMmJ5VFNvWnRW?=
 =?utf-8?B?QjkrZ29zdFJuTll5Y3NkdHl0dXM2bFdkRzR3Nm95R3lFdGx2bFZ3UllOQmFj?=
 =?utf-8?B?Qkw4T05hMEx1dEsrbUxTWGJkY0U4UC9QeTRVVUJwS1dhWjB0dUl2WWJOaTlK?=
 =?utf-8?B?OVkwLzM4QjhQN2ZBT29yOUxzTkNYUDhUcEJrbmNtQldvYk51b0NuWlVkUnJm?=
 =?utf-8?B?UlJHQjFHUVZlTndLZkhhOFJRSzZRL1l5VDAvM1JTVTJneXRIazc3NW05bWF1?=
 =?utf-8?B?VmlXbFFYejZPbE91czZXc09hQUtoZ0lycU41aFExeFJsMWRudkJjOTRlSjF2?=
 =?utf-8?B?NUtBMGlqQ1JPS1F1aE1Bb3c1QWtZdnZWMjh3M2FvMDkyMTh1VTg2UUQrUE9V?=
 =?utf-8?B?SnUxcWhQTGVLTHV6WHhyMVBnYzZMN2hYdG1CRDBiN1hxRVdIN2lIWk5Ldk9h?=
 =?utf-8?B?OENBMElSTXhrbXBxMWVpS0kxL0xFVnBRNFZxa1c0MXBoRWN5TFFUeVNWaFpy?=
 =?utf-8?B?ZkRIT1IyUHpqcG9TZzY2TEQwNG1FRk1lTnVJT3ozMk1TdFpiaVBwSTYvdmcw?=
 =?utf-8?B?VjFFVEVjb3Q4ejZ2WU9oR0FLZ3V2SzB2UHRPM21qT2tJWlAyK3dBbUZuSk5P?=
 =?utf-8?B?czBLVXNhUDNCYVA1ZlNoWGdUYUxWNThlYW9jVVFSR1FNN1lnNVAzbVdkRjI3?=
 =?utf-8?B?OE0rWmdkVnluajEwZ1Y2UGVIT3Vjanp6UFcxRVZQd3lsRnQ5aE9wV1pIQm1O?=
 =?utf-8?B?UmxFbGt3R0NHdW9nKzVRNngxZVBZWEdyN2oyOC9CZ0RoSXovdHU4eVNEb0dn?=
 =?utf-8?B?TStvUkI3UEtlRE5aa2E2RGJQS0NPb1FZbkt1WFRrejhaT3FpMStoME1heWRN?=
 =?utf-8?B?eGh2RHgybnhzaEgzMTdHRFFRays1ZlFQZEJsOFZNd1NqTmpSRWcxT0poRHNU?=
 =?utf-8?B?YitCbVoxM1MzZ2tiWE5KRUUxWE4rVG42SDQrY2pFRHZaajRnM3ZDZ2ZoNjd3?=
 =?utf-8?B?NjQwdTA3cXA5UVNiUThCTXVDTzhYczdpS3FBZVNmZk5DZy9kcUNVc0J4U2hu?=
 =?utf-8?B?T3prbUtCUERMbFJiNnIxNTM2TUlUSi8vWVE0aTlrc3U4Uko4T2N3MnVoRzRU?=
 =?utf-8?B?Zjk5U1dRbzJNQm5MS3hBYUlKNlNCeTQ3WWw2dlNuN2RvS2ROUklpSmllV2hq?=
 =?utf-8?B?YVpGYWRtbUl1UEg0R04yTytmdmx3TmhYQjNlNmxKdXR5czRPZFNuaVhQYVA5?=
 =?utf-8?B?QVJqbnM1YXJvNDZWc2FMaUIrMDZBNEpXSHR3aGF6WVVXSG4xL1lLellrM0lW?=
 =?utf-8?B?d29qSHY0QWJESWQwOWprSmMyd1o5bHNyUzV0b09uQTZlb1FKcVNQbDlkTjgr?=
 =?utf-8?B?bUxIamh6WDJ3UFlVZDkwSHYvTWJPZDVIZlh3Um5tMEtwV0lXZGxkQ2lwVVZv?=
 =?utf-8?B?TTRwVVhycGdOcHVSeW41UT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SExxUkowTDFtRUVHVlVMUUNHZUdZZm1hSWtBNFBMZ1ZmellqbXZReld4aDQr?=
 =?utf-8?B?QXlIWE8zeEJnQVgwcGlZd0ttRWJpTXNVWWRocFFFWEVteUhFMHVSZFJWZjg5?=
 =?utf-8?B?SVE0QUVWWnMxNS9xOGdqbzBtTUZFbzBqTklyY2NoN0Y2NERNdEt5dEsxblQw?=
 =?utf-8?B?NjE3cGdRdUdURG9NT2I1QXJJelhMTGtoVXNHUEZOcUZLZjIxSmxXaVNod1k4?=
 =?utf-8?B?S3lLRUxQRStCZkxtMnFmZ2orUnpUblVUQlM1UlEvckc3YkRVMGlXWDEwMjFT?=
 =?utf-8?B?QUJhU1p6WWxvNTIvQkhOKy9DV01ERGZUS1dPenRtSE93YkY4VDNTS0JPb2Fi?=
 =?utf-8?B?QkJJYVFLcnRoTVhVaDM5aHhyakhhSkN3UXFjTG1EY0Q5dzNvZ2VGbHcybmhU?=
 =?utf-8?B?QzZVc3ZDV0pGQnZ1VzlmY2RVcW9KVnBTQzgrYmFvV1FEdXNPWjlnZ3VXYW0v?=
 =?utf-8?B?c0hhLzU0WnlsUStKMUFhTFpGMDE3UGU0STAreDR4QktUM2dzNFFaRHdjVHJH?=
 =?utf-8?B?RmFLZ1FBd2VxeXlidHVyZ0c0UDAxK1U4eDZua0QwYjQ5TzFZLzlSLzc1TTJo?=
 =?utf-8?B?a09xYk4zbWhPUmg0eGtLc0FCbFE2SThRQ2EyRjVQS20yMDkyRUhZSW1xZE5i?=
 =?utf-8?B?MVl3Qll3eEFUWW9zcjlzV2FCK1JGOTZCb2pKbHBQTjd2N0tZUTh2WkZqNVNr?=
 =?utf-8?B?MzlHSi9TcERSSlBwQzFhSHpUV0Z4UnhkMm16bTR3Yi9pWmpuT3pJMWJHWWZs?=
 =?utf-8?B?Z0NHTFdpM3kwTWZkQ1ZCUzhkbElaT2FIZlN2dDZqTlJnSGxSbHpoSXJ5ZjJk?=
 =?utf-8?B?TThzUlpzYlo0d0xGYVNSUTVpM1JJSWJHblRlOHFBc0NLT3dDRWV2K3NnQzZ2?=
 =?utf-8?B?ZS9JbmxTZWE5M05yQTlyU2tDUmFiQlBIbElCelFpZUJLSER0Y2FleGI4S0M1?=
 =?utf-8?B?S2g1QjZLY1J0aFY3azFJUy9mcGV1UDVGOVg0S3E0NHJRRjJOaU94cTBnRlMv?=
 =?utf-8?B?ZnlOb2loS1FLYk9mamlvS0FTNk5veHd0OVFxQ0FxOWt2amtHa256cnorT21w?=
 =?utf-8?B?Ly9NU2RoNVR2VElDVWN4U21DQlZhUE9XZzdqSnZQdlJyY2diSjF2dTVBb2xB?=
 =?utf-8?B?ZHQ5eFBTTVd1ZllsNzhCbzJIM1hxY1RoN0JjbXlNMWpKYXBmZFJQSCtZc2NJ?=
 =?utf-8?B?elI5eFBzQ3kzUVZONWlWQUdRYVJlcjVQZXo2SFhEb1M2UnNLZk90MDUyY1c3?=
 =?utf-8?B?Z0NXdE1VZ3IxT2prcDlENlFWSEk0ejd1bVpNdE1IbHhkRHRtdU54UkhFamdT?=
 =?utf-8?B?cTNVNndSZ2NuWFpKOHBEUEd6WTNyNjcrQ21OY0NqMzlqTlNkdDBZZWVQZEJY?=
 =?utf-8?B?TWNNdHRrdXIyOXhTeWRaNHp1eFNpN0h3dWVKVm04ZGNCVUh6aVJ6UVBGaU9j?=
 =?utf-8?B?cVFEcnhKS0trT1ZKc0s1N1lXSjMvREV2RUx1alJOL1VIbHNTZHdMTGljSGFG?=
 =?utf-8?B?U2pUbldQWVQ3VlQ4Z0VJMXRQdi9udlBTVVlUSTBtSG9EczNVSjJIWUE0d21M?=
 =?utf-8?B?RnlMS0xTVWpiTmVUYzI5alByenArKzVrUzkyRnA0WjlvR0gydkt2eEV5NkE3?=
 =?utf-8?B?cjJxM2FEZDdtaXg5QjVXaU5qREE0bTdMRHh2ckh6aGhYalVrMzRnYzMxbGVS?=
 =?utf-8?B?bWlKMENuRWREN1NpK3hkWmlza1c4K0ZvcjBIeXYyWWQ3WWR5K2sxclV3aDYx?=
 =?utf-8?B?NG5DWno3dDh1ZHcxaWEzMDJERU0yWUhST2o3L1U5TEpOZ3p1eHFMOFN0LzFr?=
 =?utf-8?B?WlBFQVNGa2xTcXVVTmt6MERpTjBRaGNUVlp6UWp6V3RXWSt1S0xQdHdwRFor?=
 =?utf-8?B?QXV4MnFuVkxkcXN3b1pXdjJMcnFRbmtucFZhclZsUGlka1Q3ODZ2TTk5TUNF?=
 =?utf-8?B?R0R0UXlINVQzVTNHRklYdC9jdS9xYWpaQllXSDl1eTdQcE9jc1lGVW9PYTZu?=
 =?utf-8?B?VTZFSStuRWNiVnUrWm1RNzQzNENhTjFoSTJvSjB1ZG9yNkVCLzR5OEk1M1lE?=
 =?utf-8?B?OVFtamhpcWxUckhiSXJRbERzMllIamw4akYzYWtsVXpsNzJOQVRlYTlOSS9i?=
 =?utf-8?B?NjMrTEhCQlRSWnhJeUhlc1h0VVFWVUxHbDlRVjV0cjBERWdNY2tWVytUQ3E0?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2026EFD431FBF4BBD4D9003FAD94676@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T2VIr84uZCPb0RXJk/3wJP+zTOioHACXA3fLvdpIg+brwsJ3CI3igPxC2QEkMNcTf7j+BWBwGmHlWoZ1X46a3aPyGslG0mxzXFKgF4+SE+F67sZNzRgVNFoAetnWFiO+J6dcykuSYW+81UkIAk7EVjJYSJPVOyfhimgpidgB2eTcLe+YlrduZKsNF1s2uRkuLxj3t5EbY14sRv8oYElN/PrG/63E3Ccayl443I7WKuPryFfEMHoo3Ir/3nZMr485/knSeMBUxzBStA+cF8dMbpHEgRbW/1sdFBUUJgseElVjc1nucMYfZUTpDJroxWoBXNe5IobPpjOucYRISaxbbjE3m18r5lLEmUeGLUjgCQxclLcgyT8sZo4KZjMaG5slJx+zDcNuAmFq/2WIzQlkqgDnUdf3RAMoOel/ia2LlQ6SUAvjnpEPhe39cVv6hVH6UQElc/J0pTmH6HgCD6SFEyHc9ytIV0Ek4aMGs/r3PTW8GeS4mYr59jt6fXNEUlyxsCNuNyGQz3gM08JAh6xfoiZhQeX24DtcC0jTQHyJkbXt5cRbMYfgQSHVsnktHAxfUwElGlBV8rOPPyiE2zxnJTsSxMgW+tnzGaA4d0biB7k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a024abf-5ed1-4742-e284-08dc62e532ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 15:59:31.7867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRjTxYC3Ni4KaFG4Td5dcgHSe8S+Wz4rp1/iEnByRrgTVUQnuqSjMiHZwgpCommCPGv8E7UkCOwjaXxlNyrOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404220067
X-Proofpoint-GUID: 0C1wTkwDh487bXtx4VtedhpLGVLjAvsB
X-Proofpoint-ORIG-GUID: 0C1wTkwDh487bXtx4VtedhpLGVLjAvsB

DQoNCj4gT24gQXByIDIyLCAyMDI0LCBhdCAxMTo1NeKAr0FNLCBPbGdhIEtvcm5pZXZza2FpYSA8
YWdsb0B1bWljaC5lZHU+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMTE6
MTbigK9BTSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3JhY2xlL2t0bHMtdXRpbHMvcHVsbC81NA0KPj4g
DQo+PiBJIHNlZW0gdG8gcmVjYWxsIGEgc2ltaWxhciBjb21tYW5kIGxpbmUgb3B0aW9uIHRoYXQg
d2UNCj4+IHJlbW92ZWQgYmVjYXVzZSBpdCB3YXMgaW5zZWN1cmUuDQo+PiANCj4+IEF0IHRoZSB2
ZXJ5IGxlYXN0IHRoaXMgbmVlZHMgYSBtYW4gcGFnZSB1cGRhdGUsIGJ1dCBJJ20NCj4+IG5vdCBj
b252aW5jZWQgdGhpcyBzZXR0aW5nIHNob3VsZCBiZSBhbGxvd2VkLg0KPiANCj4gSSBhZ3JlZS4N
Cj4gDQo+IENhbiB3ZSBoYXZlIHRoaXMgb25seSBhdmFpbGFibGUgdW5kZXIgc29tZSBzdHJpY3Qg
dXNhZ2U/IExpa2UgaXQgY2FuDQo+IG9ubHkgd29yayBzdGFydGVkIGluIHRoZSBmb3JlZ3JvdW5k
ICh3aXRoIHNvbWUgLWQgZmxhZykgYW5kIGl04oCZbGwgb25seQ0KPiBydW4gZm9yIDEwbWlucyBh
bmQgdGhlbiBpdCB3aWxsIGV4aXTigKYgc29tZXRoaW5nIGxpa2UgdGhhdCB3b3VsZA0KPiBwcmV2
ZW50IHNvbWVib2R5IGZyb20gdXNpbmcgaXQgb24gYSBwZXJtYW5lbnQgYmFzaXMuDQoNCkludGVy
ZXN0aW5nIGlkZWEsIHRoYXQgd291bGQgZW5zdXJlIGl0IGNvdWxkIGJlIHVzZWQgb25seQ0KZm9y
IGRlYnVnZ2luZy4NCg0KUmV1YmVuIGNsb3NlZCB0aGUgUFIgYmVjYXVzZSBoZSBpcyBoYXZpbmcg
dHJvdWJsZSB3aXRoIHRoZQ0KT0NBIHNpZ25pbmcuIEJ1dCB5b3UgY291bGQgYWRkIHRoYXQgc3Vn
Z2VzdGlvbiB0byB0aGUgUFINCmFuZCBzZWUgd2hhdCBoZSB0aGlua3MuDQoNCg0KLS0NCkNodWNr
IExldmVyDQoNCg0K
