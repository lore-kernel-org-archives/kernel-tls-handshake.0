Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5081E47A5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839237; cv=fail; b=hE7ymJwUPD2kfnzy0hkJBiHfL+KQfOUd/69ZAKjsX1gnQEMsBkyhelsCP7y0HX1+lkA6rVa17NdAe7Sux3lEP8djLbQk0lSQ4fNYabJuQnJ3pAWvZZn4L+ETEvngy/NXQXfaN2ZchwdSRrRUVGgxnD47M2upgO7+jHERQYNrrmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839237; c=relaxed/simple;
	bh=Mi/84QUW9ZrzuotTtesMDVhhxkPJ7DstnfC7JHbNwzQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MEAF7jIfU4D/kEU25RnpRRw83v+GOSqIDWn0S+BB/CWh93IfyUNBBdwkAWhF/uhqCMEui/eOus8XTjr5ig5s6jNe93Q85hSChLGTXX3Hu9l1s1jx5tA0p9hB1WsVnIcHrFe5tI2eArNnDH64IBF22sf3d++LzMWZf+cjm14uiPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AgJEwE61; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x0PoEsRB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AgJEwE61";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x0PoEsRB"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LEqOc9030448;
	Wed, 21 May 2025 14:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=D/432rXs3R0BuVhO/gPdmmlqJMMY1/Z0ALJ65rByRjE=; b=
	AgJEwE61Uz8YUdRjwrMVZY0H5k5r85ObzZyMaeZ0JwqZ8zohhFtEaqPLNIbW9Bk/
	2wmjHPbx0iUhZXXDvxINZ9OL8VcsAyXMbuACmATF5F/OTu9j9tCYbKGbQfKP1djL
	g10FUBupq1X7pg0oQuFHu1jOiCENkx+zagzq4xbGiIpYvCZP9pedO9ejDs08dLeJ
	0IoJbFUjTKWoIvMKSJGsao/r8BJOyZhqUVwQvrIt3vc0MsM8P5B/KzzBUlhnn5TG
	BsPJSaYtoGXME9Y7e7vV2y7GuCkoVeBqO2JjR4bfl7J8/MMrbXYPoNnahJEpuThZ
	6YYmJN91wystOFpCv068Kw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sgyk801r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:53:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE3Riq033631;
	Wed, 21 May 2025 14:53:52 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwenf2fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=genfLinChlrOfrLvXBrxbJtIi1EQZWnd/NpKVyh1IcduUBTsJnz3qwVW41gH2OQacUG6TJ3UJBngV7dZ07XG5C15tBfHQYvOwE9yZtY/NA3GPQCtMoUHTLWAND/sJt250isiMKOljH06SzYPnOCXJBqAJYBmYZynbLw0pHaMEFxe6ZRAzgcNk1P0rHEoDYvlGzii5vWSDiAZtg7i2vGFlmquACM85p+/ADa9aE9+xw8SkMwpAaci7ZLJ2X2HfhDt4yslgf1bXx14wI3lhPhWnZc0TtJkuIcGZQ7YFVkpr8LsBu2861swNiZ6IrBWDb9SGlVUpP5n14ENbxP3pe5wCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/432rXs3R0BuVhO/gPdmmlqJMMY1/Z0ALJ65rByRjE=;
 b=Q3h02dvfi9sTfnCU3+TrvwHv1XS0CvmRk1cJkVytJY2IAz+CgtMMNIJI43QwJR2YX02Ads+CPORPKWemTtGBgjSxnPg5vcWqtG6d/a0PhThjLZ5wJEumEqw7lk+YyZJ6O2DLfAuFnDzVa6+tzwy05+mAn6tNel35a02hIEqS39R+wvUBHJTS1KvL2dwRM2eixZ6KyKy/qNqd9K/48DDGgErhOOuLqfXM4XeXsQj87Py+jlLbx0kO2H0p6m3y5OThX9FZZp2ohCkaEpzNezqvcYL1QjPVm4xHWajkiRfJlEPFLUeNIfvCrvuIDCY6jZE8JHDwlcgXMXiUADKPpO9fLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/432rXs3R0BuVhO/gPdmmlqJMMY1/Z0ALJ65rByRjE=;
 b=x0PoEsRBAvorBRIkH9GZJlQ8NqgQYOtUHktvoa7GW7bY0QA8xvpZcO4ylXBrCzr38dq8m16KCk7ZSGCJ93peAVtYwI3/DLHLvDA5wQVnYAPh4u1UFei7z+RUzPswtiZh3fBZ7dKeRHBNNtysRet9msctfopnITC7rvku7SuBBV8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7957.namprd10.prod.outlook.com (2603:10b6:610:1bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 14:53:36 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.031; Wed, 21 May 2025
 14:53:36 +0000
Message-ID: <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
Date: Wed, 21 May 2025 10:53:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
To: Benjamin Coddington <bcodding@redhat.com>
Cc: Hannes Reinecke <hare@suse.de>, Alistair <alistair@alistair23.me>,
        kernel-tls-handshake@lists.linux.dev
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
 <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
 <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:610:53::23) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CH3PR10MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d27e879-63d5-4a1d-e59b-08dd98774384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1RNZEdmTExZbG9PUTczNDNUeHpBTVVlNTlmcTZuWnFqWnJCc3l5Q01Hd3Jw?=
 =?utf-8?B?di90R2NlTnNQM3ZkdjVsWUQ0azE4ZHFtcVA4bzN0bnRnVXR0OVMrVVFjUVM3?=
 =?utf-8?B?NXZXdlNySXhIUHBxQUYwNERCczVackpNQzNxOC9oNDZUamRQa2RPdUttVUti?=
 =?utf-8?B?aUlPcGRVVHF2V1hPbTZVRVE0REFsd3VkN05rZlF5SUxvY1JqKzNXNHJya0Uy?=
 =?utf-8?B?SGpjdXFMQ2NrWXRMOXozSW1wUTNvejJ4UmZVSlpKOFdPN29LbEtQV05UQWJu?=
 =?utf-8?B?QzF6M0Jxa0VPM3ZIN0VPU1cxWUJkR1hFRFduOFdvMW9kYVhqVElldEV2K0lG?=
 =?utf-8?B?Wjl4QU1wSmNqN3dzT2Y0SGhTMlNra1Mra09xTHUva3loRTBWVTZ0Z2lod3Nn?=
 =?utf-8?B?SHcwRG5PMnlZOEtFS3pSVkJKcFNmeVRXQk12VjlGeFBSaDg2ZEdJTkNSY09s?=
 =?utf-8?B?T2czb0N0a1ZYNHhtbUVQTzBXU08yTVFqcy8rY1VqcVFIa1ZXdy9hdmxTNXY0?=
 =?utf-8?B?dE5xdS82T2dkNFZiSzZudVdGb3dyQVp4ZTdpRmQrT0hoeTl1bC9xVkQydGFi?=
 =?utf-8?B?Y3pMWkVHN3k5Qk1Sa0IxUzl5T2lZdG1Ub2w5aXdkOTN3ODIvdXo2ajFUcmhQ?=
 =?utf-8?B?SWRiQmJON2kxTHJLc3I5V2dZZGNlL2wvLzFrSHgvVGFVc05SVnhDMDIvVW9C?=
 =?utf-8?B?MCtRZ1ZqMnFTRVVlNmFtQXlmMklicVVDOHk1OWFIRU1DOWsrckZsekJQNWpQ?=
 =?utf-8?B?OVgweVpYaGEyWjcrYit0Q0NqN2E3TlJSNkJ4KzBKLyszRGtudGNuaVR0WGZL?=
 =?utf-8?B?RWFPM2hIWm5hWUtXRGVadXk3cUh2SWs4QVRlclRwTlg2RDBVUTEyV2lveTI0?=
 =?utf-8?B?NCtxbld4TExzbXNOZ2I4VDVsYkhjNFBoaTRjNDVUdmplQ0hmU0tzUEUxWHdx?=
 =?utf-8?B?d3ZkRGNoOTlBL2FTM2duQWVFcks2QndRYVE3ajB3NkgzWm9UNGxwd0JPbnpS?=
 =?utf-8?B?V2RDQ21oK0NOVFdxc0lNMU5rVDYrS1YwQzlIWlVtQzRSOTg1SXdoRUthbTFC?=
 =?utf-8?B?N3ZUVmNpeE1WaTlDZ0tKMFJEYzFPbENpdVRESVRDT1B0THoyV1VaeStlZnNZ?=
 =?utf-8?B?Rm9HM3l4QVFJK3pGUERoODJUMm1KbEZpNWZjZmwzaUNIamxjMytvY1RMdmI5?=
 =?utf-8?B?aXlZeCs0MXRDL3o5aFprVlc1amRuUktYQVhZQVJmbEpha1dyQXRnVHVOdWhD?=
 =?utf-8?B?dDBBdStYR01Ic3EzT3ZzbUlwcm9qdCs0M2xJaU1wTzE3aDcvMHlJNDA3QkY3?=
 =?utf-8?B?MnVkdU5CMXd6UUwrQi93cDMyTHdOaWJpdmxnemJkSHgxRG1Hc3Y2OUpmd2ds?=
 =?utf-8?B?U3pkV1hHaitEVk5idWhSc3BHdnhxZjFjOHErUVFERXRTUzd5YXpUTnR3dSta?=
 =?utf-8?B?OHc1ZUg2cW51YVJjakt6UmtxaVR3NlBSNTUxbEpFZFI5YUZOVWpVMmRTSlhk?=
 =?utf-8?B?L0dnRmlLenNBRDNEU29QMmVpR3pMNnh2ZXhpTmJ3L1NrbGw3cThXMUhpMVBo?=
 =?utf-8?B?RmtseHJGdnU0N3laNE9Sd0JZS0Q0UEJlcE5HLzdES1I5eFZxb2s4RWVPazVD?=
 =?utf-8?B?TkkzakxNZ2FTY2RvYndpbWV5eVNVYThVSHJCNDZxNkIxNWMwbzM3cDQ0ZkVs?=
 =?utf-8?B?TUJEbEFVdEQ5bUJNTlJiNURpbjF3OEhyczg4UVdObGprZDhuTlJCanNLVnNh?=
 =?utf-8?B?dVVqSWpwVm9iSjNpQ1h6aFIzR3p5MVE0YzQ3MTZST3FlOFBtN1RTSlZ0TStG?=
 =?utf-8?B?SVVRRldLVmxiRVVDMjJNOG41bUV0WGcyaEk0Y1U4SFhYQVlab1J4QTRkTEZk?=
 =?utf-8?B?QWdTVG9YbWVhOG5hNEFoREZ1dEUwU0RiK291Yi80eFRJeGxEUUZVbi9kdHpR?=
 =?utf-8?Q?+G/KomJZOLk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVh3VzNSR3g2WEtQQ1NaenhheW1aZE9BNkIzZ00yeWdXTzFzVFVmL3Q5S296?=
 =?utf-8?B?cmgrd1RVdkl2RUl3QXIraExkVVljbWFEdmVmb1lQZmNQZ3FyVWIxMzBtSCtv?=
 =?utf-8?B?Y3haakNvRTFQRDdxaGoyemw4bHU1UlJ3anBrWkV0NFY3VUt3Y2JLQTAyajNO?=
 =?utf-8?B?c1VCUW5vWTlOb0w1WEU5V0thLzhKSi9zVFFnQlNNTkdia0dlZlYvMmVOdHBw?=
 =?utf-8?B?dlJBd3lvU2d5V2hUL3BldjdUSGkwUUVqUDg2Y0xpbVdqclpNbTdEWEZkbjd0?=
 =?utf-8?B?a0lQUDVtODFnbWJlSytGcXZoT1JueDVYcVBPM2dkazZqT2xnZ2FRQWk4dTIy?=
 =?utf-8?B?bG9lOFZCb1daSjlpUnEyN1RXSzk5dFFsUGpiV1JLZ25yamNaSDVqS2xFZkZT?=
 =?utf-8?B?bE5aY1ZPREtSZFluejBocTZZM0JFZ1ZEMldXYnRxai9Yd3Y4bjJtUGUrTVBI?=
 =?utf-8?B?WWpOdHlsNUR6MHdxQ2NHREhIaEdSNVFybytQWkVxQkpXRUsrSFN6SzYrQzhn?=
 =?utf-8?B?R3J6QU9kU2VuUGExSytnU3pMU1o0c2p1YWw4Q2lCYzVSVjBnbFZzL2JTNjNU?=
 =?utf-8?B?T3FGYTU0RDh0WWw5WldkSHA3T0pMN0FlT3NuSDVTUG1mK1paL3Y2SmxPMjlO?=
 =?utf-8?B?LzF2WlNrTkdFMUdqQlBVdVNiSWd5Y09MejdjZjBJRjkxd2JIbFZGa3plOU1Q?=
 =?utf-8?B?Z2hTNkc4WFhsSmNPR216V0ZVamFXUGpNVlMvYmFxNXJIdGpUeUxKY3QxOG04?=
 =?utf-8?B?N01BNFBQRmdIWnZkcEtRWDVtcEF4bFVLMFNwckMrUnQzZXk1QU0zN2htejZ5?=
 =?utf-8?B?N3ZhRi8wU044YmUza1ZxM0VlOUlON1Q0YnUxQjJUWTlYZU1LVGZMZDN2U3ds?=
 =?utf-8?B?VENhRDF4eVEybWl0YWdCTVFNMFUvYVZZZ09kVGZDcXl1UzhjdDU2QUNUQjJD?=
 =?utf-8?B?UGN6R1h3NVRRRExvRUtCRDdCTS9tNG5vdmFFd3J3WWN2ci8rOEFOYWFWM1JX?=
 =?utf-8?B?OWx4U0UrS2VQUzR5UjhTVGdVYW5hY3ZybXRqKzREMDBieXhIS3JoZmtTUDhR?=
 =?utf-8?B?VXhVbWhLTDdRczZZWi9CMkt4K2k1cU8vcEtobGM0Ukw5YzZvRTJ2K1FWbkVT?=
 =?utf-8?B?L0N2RTdnbXlwU2tzcE5aSFJaN1Jja3ZRVXZ5dVRnTnFZNTJ5b2tFcy9BSk9H?=
 =?utf-8?B?eGpLbXdjNXVFV21PclhETUZCdEpvU0ZtTW5sQnpZUkRUVzBqU05PSGw2L3Ev?=
 =?utf-8?B?T1NnZG1GRE0rendPd0xKaUxCV2huVFQyU1g0c25OQkhRZDVwLzdDT3djaHBL?=
 =?utf-8?B?REVJQ2ZlMTcrdzBSa0NXWG1BVEpmWHVUQzdnVEc0TE5aQWFQdnZrRkFTakVE?=
 =?utf-8?B?QWhtRnVHbEovWUxxQjJSbjNZbDhjL1VZWUJJc1JEcVBhTWNhdnNLbjVCR3d5?=
 =?utf-8?B?MC9iS25oR2R0WjBjeXozSi9sKzA4cFYyc29yWUhsaXRLNjNvZzU5RE4wU2Na?=
 =?utf-8?B?WGNyYzc5M2hUN25KNlRCOEs2RnFSdjhpdlUrc3dLcEdkT0szOTQ1WmpKSVQv?=
 =?utf-8?B?QVhGQ2ZNOWIxQkNRODJyMk1EMTFRMDFKS0pwZTk1aGcxRVM2anJTRFg3M0tY?=
 =?utf-8?B?dXhISVZ5Rm1jZ0gweHcvYTJDOFF6Z2QxQkhJMjd2dVpETU1KUlN5a2NTTmtU?=
 =?utf-8?B?TFNQMExKQUpNckJadXZzRXhFRm5UWE9jL2hwSEFUVDZXeFJ5S295dytQeW5Z?=
 =?utf-8?B?WFA5cnRBd3FHd2NUZEIxbDg0Y2U5MGN4Slc0ZUdDR0o5STA2VDhGUVEraEpw?=
 =?utf-8?B?U1NCczFBV0hGMmNvYnZ6SzM5TVRHL3l3L09IZnNJbXFXTDJnU1Rna1k1dzQ5?=
 =?utf-8?B?RjlDdkI4Nm9FQmJBYzZVaHRPeTk1SExrNGRsT3pHcFhyYUpCQTdzLzhJL1Na?=
 =?utf-8?B?dzZoNzEyTDJ6S2ZNWEQ4aHIrVmc1eXB4c05zWWZ6YjJ5VDRqbFMxNlRHVU5Y?=
 =?utf-8?B?TXJzNVRBTEthWHVVTjZQNmFuZ09iUGtqOWhBN3J1ZEx6NnJIQTJMZHU3TmVR?=
 =?utf-8?B?Sy9zcExpYmF5b2oxYS9SWFNZVmtLc3YzT1NqdjUzM252R1gwT2pISFlsN0JX?=
 =?utf-8?B?VitlSzhMa2Njd1lMZDhVYmhUWXpjMDRqSFB2dnlZRmNqUDlSWkNjenB5RG1W?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8EhZVIS24/X2uhzlOiZCSBCD0x1ipK0Z3j5uhm0VRo3xHNhmOVlfv6dSgh+oufYOvnW0/wPpy6+21XU6ahkObuDO6ivG9ej1WORNxWN/GwHrOsLZkBZHM/Po0nAJV4ZcEEQ2UzgaESbUTec7GOIVEZ8pLbyEd+FUoo7fU9CrwVN4DvmK5o+VvGCnJxCxX9zJqjuhlPCpSUnWoySxWWo4JQVYxtxG+8TXGnjtggnVW0jvnkUh9UUDrdfzWTdljOmvj/elXxUJ017pepPuoOovxGOHtM3NRkTiDqYR678EKxqK4FSioIyc/M9N9vXpU83m7Gzt8hDW0vXoAUTZMYii3/jLd9ITNHQYy/dT4ZHhs4rHCh8CmSJ9+cCrOora8k9Spz3L6Xl3p1jMfNmXHKc9d3Lgm8H3LkwlEsbn9q95bmf/ZLym4Me8lNF1MQsfBGV4FZpBcph5zAkJSp5mn10geeze5vIZKwtVDT029Tj33LZUs8Jqxiicl2cBaNZjQsTFKzrB5nfkU9own4PVpji3XaMZetsnPkjQ5+qLdAHrPnRj1BXYRLpXJ1MDigeLt0H4BiuVVX6kmavAY5VsUgiTlSE60TWXzbBVAV2xh1hO0C4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d27e879-63d5-4a1d-e59b-08dd98774384
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:53:35.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkM6e8UqeLG8DO81FmooUxNOcfmdd3XJnlXjCIDfl5/hdtItGtaBKuFZsQkwaGrldIeZbOh9FXTTexxNRjy0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7957
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NSBTYWx0ZWRfX19XYdq28J0kz kIR9ZDRxE8iE4RM0GJvq+rnSGI7y6g9h3qoj7KJOcZgQC7MaMYG+oBMpba2SlO9vLcKgulGGvfD l4rM/ViqnLox0wdL/c6EqB90RpfKc7i2ekbhqiXWDYcctvJojdR7NwfbTNtiWQB8K+gKCToCq5d
 67kEbdWUS45FTJxwckEj5WtK+5FXYRjhDZOIBumxPt5P0615qhTW9bjop12O8jziDZ2saXtCQAl z/lFukvyRgbKK7wCEJL2QZGdYbIfS6A/Ef1Omf2qbKj+9QnCz9rze+mA2h+Bt1TieymNShuJwg0 2Vr0TtdG39cpb1iva/dDsBXqNcOh02bAQxZGLzRFIqFvU/I91g/worJpS3CM+snNIFplh3otjNn
 VAwiragbLkfi+US4l1STnftejidqYQMkFbCSHC1QDe3Ge3bdcz3gu/Qt9UK1KLnq0qndlaqh
X-Proofpoint-GUID: qOYb7FmmWF2J3krNZkFSDpRlnTBrYJ3C
X-Proofpoint-ORIG-GUID: qOYb7FmmWF2J3krNZkFSDpRlnTBrYJ3C
X-Authority-Analysis: v=2.4 cv=BridwZX5 c=1 sm=1 tr=0 ts=682de901 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yYN0zLkcoI4K3fb2BeYA:9 a=QEXdDO2ut3YA:10

On 5/21/25 10:50 AM, Benjamin Coddington wrote:
> On 21 May 2025, at 8:53, Chuck Lever wrote:
> 
>> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
>>> On 5/21/25 03:00, Alistair wrote:
>>>> Currently tlshd uses `fork()` to fork the entire process after the kernel
>>>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
>>>> function from the child process and exits.
>>>>
>>>> This provides a high barrier between different handshake requests and
>>>> ensures everything is freed when a handshake is complete.
>>>>
>>>> The problem with the current setup is that it makes it very difficult to
>>>> share information between `tlshd_service_socket()` and the parent
>>>> process.
>>>> For security and system resources that's great, but it has the large down
>>>> side of not supporting the TLS KeyUpdate.
>>>>
>>>> In the future we would like to support the TLS KeyUpdate mechanism, which
>>>> means we need to maintain the `gnutls_session_t session` information
>>>> for a
>>>> connection to allow us to issue a KeyUpdate later on.
>>>>
>>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
>>>> we need
>>>> to store it somewhere. We could pass it to the kernel and have the kernel
>>>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
>>>> it's not fixed size making that tricky to do. Plus it will break if
>>>> gnutls
>>>> updates between a handshake and KeyUpdate.
>>>>
>>>> The other option is to pass the session data from the child process back
>>>> to the tlshd parent process. The parent can then store the session data
>>>> (maybe in a database?) and use it as required.
>>>>
>>>> I submitted the first step towards supporting that as a PR [1]. The PR
>>>> changes the current `fork()` multi-process mechanism to a
>>>> `g_thread_new()`
>>>> threading mechanism.
>>>>
>>>> In the future this will allow us to maintain the gnutls_session_t session
>>>> in the parent process, allowing KeyUpdate support. This could also be
>>>> supported with `fork()` and IPC as well, but that is clunky-ier.
>>>>
>>>> My approach [1] hasn't been accepted, so now I'm trying to see what
>>>> ideas other people have for supporting KeyUpdate?
>>>>
>>>> 1: https://github.com/oracle/ktls-utils/pull/95
>>>>
>>> Hehe. I knew it would come up.
>>> The reason we didn't implement it for now is that there's an overlap
>>> with session reset. In NVMe any error will be causing a session reset,
>>> which then will trigger a TLS handshake. And, what's more, with secure
>>> concatenation we even generate a new set of TLS PSKs on every reset.
>>> All of this is transparent to the upper layers, so they will only see
>>> a (hopefully short) delay.
>>> Additionally, with the current in-kernel TLS the connection will be
>>> reset when the IV values are being changed, which again would trigger
>>> a reconnect on the NVMe side.
>>>
>>> So not that easy.
>>>
>>> But if you insist on doing that, why don't you use the keyring to
>>> store the temporary session key? That is persistent, and required
>>> to be present for tlshd to work ...
>>
>> I was about to suggest something similar. Depending on what APIs are
>> available in (or might be added to) gnuTLS, preserve the session's
>> metadata in a key ring, and return the key's serial number to the
>> kernel as part of the handshake result. When requesting a KeyUpdate,
>> pass that serial number back to tlshd.
>>
>> It would help if someone could review gnuTLS to see what is available
>> now, and start a discussion with that community if we need a capability
>> or API that doesn't already exist. (Eg: translate a gnutls_session_t
>> object into a JSON string; translate a JSON string into a
>> gnutls_session_t object)
> 
> I believe gnutls_session_{get,set}_data will serialize the session object.
> It would be trivial to store in a key.

Oh, very cool.


>> The other aspect of this is that tlshd will have to prevent saved
>> session state from growing without bound. Probably the kernel will have
>> to notify tlshd when a session is terminated so that associated saved
>> session state can be discarded.

It occurs to me that tlshd doesn't need to be involved in this aspect.
The kernel can delete a key by serial number when it notices that a
session has been permanently terminated.


-- 
Chuck Lever
