Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170832C1584
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 12 Aug 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007271; cv=fail; b=Wt0ux4HFFZypUl8dalRV1CSgeC0ul1ZqzY+39uVQm/avmFbYZOlsNwM1srA5aRiwBSkOPbFsEthkxHPo21YZnYs8YOHLDfQgtThhOr2X1U0WY8f00l5Mo7W90KAcJTWzHszr9rtzl8DxVF4dJxgWAV7PnmNmxr7yocMo5Jvo3TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007271; c=relaxed/simple;
	bh=LcSzpwqr6L+9m3GtOWU5zDzfdU3Z2ipgOyUPiDm25sY=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=I6Z1K/51v2MtP9hZfe4htsmPD0SU72wtThNdj8ALldZWHg8hqqz0tcUCpUxm/8JbUKfcyeZZBAo4W7PhPOTwXGFVn6FfbYv7OH12jDeqMgd0I/XqNlYS70plkyuX/sBgst8itTNv/QrXr4qvl0iTElumUM1BRgj8qdiJEM0t9vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WhGuUH/p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gRePcv0C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WhGuUH/p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gRePcv0C"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC8Nv010994;
	Tue, 12 Aug 2025 14:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=e5nT5q7L5Cvr6TgS
	3deGTsXlcbq8Bnmah6BNMlH9htM=; b=WhGuUH/pSpn+2QATISGkzfeEBXgQwk71
	xbWhAjcbrzzlh93TdCFZuHDrn3g31z/pXCZ5v6KKAG1zb0IugYLIG0jpWZMm8+4U
	KmH2ufkwPokG5JhYJha4rr+kylhkGc/FoStPScFvNIO5OOl1bBkeyWCyabkDF0lc
	qHkMiVtTjAr2KSbqI7Tg1/UglN6OUrl/yIhx+vjARvS/NVtskdqIExbRjmJ8E6dj
	rH9mnyqeiB2/ZB7uPO/zhBx5JJUnVPCbo861MwGtq+3zMXMPVAtfWFhAEvFpqJSP
	IowFYkGXit60/z+2hvabQpDR+slQ5dX/A9fVEJ4xfs+RwWvTYdoJ4g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ecrqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 14:01:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDX05c030254;
	Tue, 12 Aug 2025 14:01:07 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsa0k91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 14:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRT/NbilGzffEVkDMOFjkMOW4cMNKJUJZl+kWFvSOkXJqmpwfvE/Hc2MlOPFsFT3bfh5IeZzewCFRkffXuK/6aJkHXQldVim7s44D4SOv/Hn1SfeTFbm7tHE2MjZBX1BkpXfpASQKurd6bvXWR6JLEytW0FhqGGidGl5KAUkt/mGZNcmb0YB43N7GiW+Qg83EbvD0fvEJ15C7rZfesLnm5DmXQfTCb3uWH7pULbKYe6W95i1gs7z7p6GrWCHHY0gybQqT009r4czyWI1XHp0RQOQi5yYobOpNg95mw4Xelr2/WtUTyZRTAaGAo94m1r6zpu4ais6sYO9Df5NEPc8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5nT5q7L5Cvr6TgS3deGTsXlcbq8Bnmah6BNMlH9htM=;
 b=q8Lu6vk68sp1kL955QhVd5nuTml8AGHjcoDCAGeEDMwWd5iIeQzFl0ktpk22SkyDJqSQugUF/2V8U7Weyukb1PAU1rgxUljXE2sW9LETNiQ0kCfHE3CwjVga3jAsz5nM26PiVC1rmi00z7iZEFSGNLdDLmpNALU//pqHNZDCPx95/nC/S1gndvbX8pRLtsdwFHvoUrR2Uw6agRvEkZPKQKS8X69u09s2nQa0Fxi//hzmFk7IoJOBLaLRx+A6XUB0fiQzuBtqQQTOZxWq97TgCqLTglxXBMCHQwE7A8f4bCZiqrYUcHrwE7m3RNdjwCovgW/uqzsMsP9MEVX6WcnUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nT5q7L5Cvr6TgS3deGTsXlcbq8Bnmah6BNMlH9htM=;
 b=gRePcv0Crt6i9rT3amcQ+8nCLv6NdCkpNYpS0rBVUvH3ZAkqAPe51iYmIdSwrMnjcWHIg/fCQfvsFpk7F2F8tEjBg5ZL74/krkVBJJ7Wzks9a95LfS9rt5pHur0JSV6XB9+WXNfZmVNKR18PBM5hNc83BPUOznsn+r/oAkdAdTs=
Received: from BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7)
 by LV3PR10MB7841.namprd10.prod.outlook.com (2603:10b6:408:1b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 14:01:04 +0000
Received: from BLAPR10MB5124.namprd10.prod.outlook.com
 ([fe80::eb17:e79d:5975:fa79]) by BLAPR10MB5124.namprd10.prod.outlook.com
 ([fe80::eb17:e79d:5975:fa79%5]) with mapi id 15.20.9031.014; Tue, 12 Aug 2025
 14:01:04 +0000
Message-ID: <cf18f6cc-8d78-4aa0-ab6a-f97710b957c1@oracle.com>
Date: Tue, 12 Aug 2025 10:01:02 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
Subject: https://github.com/oracle/ktls-utils/pull/116
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:610:4f::20) To BLAPR10MB5124.namprd10.prod.outlook.com
 (2603:10b6:208:325::7)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5124:EE_|LV3PR10MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: a2df6865-575e-4f7a-9e39-08ddd9a8ad5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHU5Y0JrUUlCTkNiRmR6RkFUS0hLNFM4eDJTcWI3cGtkY3VTdUFLVEIvVk1Z?=
 =?utf-8?B?SHd4VDI2a3QzSVVCSGhjNVZRaC9xd3BjZENjSWdMUW5TRWF4cVNOcmFDaEV5?=
 =?utf-8?B?dUtCemJudVpzbnRNaHM1dWd1WmQ1QU10dEs1aks2bE5weTRUeS9rZklYRkg5?=
 =?utf-8?B?SGRTZnJ0TzkxN2xwNHZLRjBGbHA1UVA5VUZOclhQQ3YzMFNkUW1tOUIrUWNy?=
 =?utf-8?B?VjNxWENINFJvakwzZWcyLzBzSEdxdkFQWnNsbG1ZejZwUXZTMHJGQ1I1RlBT?=
 =?utf-8?B?QWFEcVBFL3Bhc2VNWG5LVTZjYndZVGxwR2s5MVo2U0s2QUl0c2Z3K3ArMTVw?=
 =?utf-8?B?OVd2NDVkTHMreGRQdzBjOFYyVUxyNmF4RUdSQkxFQzJCeTBKdjZOZm1EcDNs?=
 =?utf-8?B?R3E3MjdHa2Y2R2lCNlBpQ0xUY0dlNFpDM2xMbWJiUGhmaERjcXR6Nk85b3JL?=
 =?utf-8?B?Q2piN2psbklKUGlnOWFpZE1VOVNwN3ZyQjN4TUgvK0pmMkpLUStHV2E1QVlT?=
 =?utf-8?B?WDRJeDc2VXloVjd2RXhaeXA4VHZSbjBUZDlYRlppVU42a3VKcmFBYlJ3TkRr?=
 =?utf-8?B?RDZ2c01URDdjTndDSC9nWFN0SFBaNWxvZnNmUGg4UVNFM0pPbC9qd010YXNy?=
 =?utf-8?B?enhQTUM4UDE1R2ZJcnliQWF3bnZFTWhDdkNHR2IrMko4ZURpRis5cjJFL21T?=
 =?utf-8?B?UFQ0ZW1iSnVxRFQ3OG8rblZ6QjYwYWUrdlNQQzEzaStmMXM3QXRjclhkTXlr?=
 =?utf-8?B?S3RUVE0xekU3cTUyN3NybGlZYm9nVU1YVUx5dHdEL1FiV21QVlY1bFpteDhY?=
 =?utf-8?B?RXdLTUJWTW8zVkg2eVBkcGsvV3VZTGFneFhzM1hMalE5OU9JMnVLemIzeUQw?=
 =?utf-8?B?eFpPbXkzUy9vMFNHY0h6TzRmWi9iWU5FK3lyQkJRSWZEd2xwOE1pK3B4M2VH?=
 =?utf-8?B?eUVzZDdXSmVZV2RSVTRoSU9qTW5EUmxJaFcxQ2ZERDg1dlRDV1dtWXBYZ1Bv?=
 =?utf-8?B?UFhwcVVpeU91MU9hZ1UrQjlFNXhsdzdQd2tBUzJSZTh0WjdOMk80aHE5bE1J?=
 =?utf-8?B?SkY1d1dhVTRHTEIxK25hNllxdlhQUitUKzhiQXRWZmlOSTNMb3p2TUVwSHhX?=
 =?utf-8?B?Tk9CVjVET1piOTJpM3RJT24wVnNtSkhDczZHSHUrWCs5K1pxL2N1Y1YxZFNS?=
 =?utf-8?B?T0RwVEdsbGIxaGtIZklNRFdIZHRYYkFWanJqMnI0L3N5RzVXdFZIRnFFeDBi?=
 =?utf-8?B?amlobk14ejVSOTJlNzh2VGhoei9EbXJJaG0ybm9SSWtFeVF1OS9CRVRleUkv?=
 =?utf-8?B?MGFWOHBOcTBITUt2bUI3VyszUlVPUFQ0RE9ycysxVWZuelJhRHQxeFlxY2Zl?=
 =?utf-8?B?TkZaTUNhT1IrRFlXclp4M1plV3JUQ2xkSFIrcjRWZmUyRnI1NW44Yk9rcDRY?=
 =?utf-8?B?MVEzWXNyamlZT2p0RHk3NDgvOEdPME5OamVFd0dRWHJwbm5BYWNsVTduZmRF?=
 =?utf-8?B?b25xRXZFT1NSN3NXWVdyak5NRlI3aG9seXVmSFNHakMxMldWS2pteUVVSEh0?=
 =?utf-8?B?NFNPdGQ3WVVta1I3d3RVcm5MYjI3WmpETmZsdmVXRFVNc2duWmhMSnVyMGU5?=
 =?utf-8?B?Y3l1b01obVZpbVByMmMrMEN4QWVwZm5PSnJua2pQbDYvKzRUTW5Ed3RFWWox?=
 =?utf-8?B?UnVzU2lQQkIyTkRMWS8zSU1yd05DUmFEWVk5WHFCZi9DN1U3V3ZjRmViTkgr?=
 =?utf-8?B?ZWlpUTdwM3dLK3VPaVRMb3A4QXllcUNFYWxOdE1wcHVLeksyelVvK3VvbkZa?=
 =?utf-8?B?VnUyaWhLdlB5b3NnZytCSGJZU2dSN1prRjg0UFlPQWZkNnpnck1ReHJHOE91?=
 =?utf-8?B?MVZwTzllSlo0OW9DUGI4V00vMkplNThJYjJsc0tBUWthSENOcHVXR2laTkhy?=
 =?utf-8?Q?1iLstQwkaL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5124.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzNWeVdqR0xpN0UvTnF6ZUtYNWtjY21RalJlY1JNdVZKZktzb2o3U1ZRSXpy?=
 =?utf-8?B?YlV4cTE4QS9HemZ3cS92cFNXaGRqWnJ3ZlREOHNocVZqdkZBektTNlQ5ZTZS?=
 =?utf-8?B?YTRKVWp0SGozRDVhaVlEbkMzY1dGY1Z6QUJnMTVCTW1ZMUNtaGlGM0NCcVFq?=
 =?utf-8?B?NHZwU2lDd1hka1AwT0dESXgzNm9xQ1BRMHYrZHlHRHQ1WHpwWkhSdkJDYW9a?=
 =?utf-8?B?MzMyZmw4YnFCRHVON3cxV2V1R1gvYjlSWkVMdkdZTWNXUElpejFtWUxPQ2ty?=
 =?utf-8?B?TC9QQXZneE5DKzVUa1h2YUVtUVRKUmVzdTIzSjBSTzArYm5RUzlwMS9xeHBr?=
 =?utf-8?B?elVrM1ZrSzErR3piNVdiSHZYTGlzWG9US2t6TTBUTU1aTGh2N1gwbGl6aVg4?=
 =?utf-8?B?QnpteC9CQWJ2R1k3UDhmREc1WDkyMjNOTFdEaWl1dndCVUdjQTd6UnZ2N2do?=
 =?utf-8?B?NFltN00yQVFmTGdjT0VKckQ5WFkrdDYyV3BQbllreGU0WGpRWHVHY05Pb2lR?=
 =?utf-8?B?VEZQY2kybm95ZlZ3S25od1ltdTl3SXUyUzYyd2Q1M2NYc2JEWEs3OHpHWUNl?=
 =?utf-8?B?dDlhWlRFampqeUx3SmFaNUxjL2RLQzhGaTJnUVllUC9YUUIvTWtXbmY5T3lJ?=
 =?utf-8?B?d3dUdmhFdkdyeW9KTzFRN0JNeXNEOGxmcW0wQ1BJd2NxckcrWDl4U3lrZDNG?=
 =?utf-8?B?T3p3R1llNm9yam9Jczd2djQ4S29FNUUwTmhKaUlXRHVIYTRJUjhOcDZFcXQv?=
 =?utf-8?B?aXFnU1JOdFhUQVFoSWRiTDRURzdjUHdyV0YzM3NrbW1lUVhJNE14RitnQzN2?=
 =?utf-8?B?NjZ2Yk85Y0MwNjVwWHBETVFBL2dJbGRVR1V2b2VyQ0YrKzdVdmlCSFRJN0VV?=
 =?utf-8?B?Tk42TFZlK0M3NW5uWVRUdWZGblJDSjJ0Y3NNU1BTZTM5M1RWdHV5VTFwb3B2?=
 =?utf-8?B?b1hIYU9QNjl3b1VlSFhlanVmVXpRWXRUSnZwOU5IdHlaS3JDZS84Y05iYVNi?=
 =?utf-8?B?bStTQXRUUmVPZGpRdkQxUkRxZ3YyTWZHYzRkNXl1M3kvb3lYM2FxVkh5Qldj?=
 =?utf-8?B?UE5iNDlhbmtTZ0Y2ZW42U2Q2SlRMS012NXJRTnh0MHNFVVlPdFRoRzJuNEth?=
 =?utf-8?B?YW9xZFh5TXRncDlYak1MZmlBTlVQNGFLcE1LUHV5Q241QWROUlQzbjErenBt?=
 =?utf-8?B?eC8wL2s0eWJTenpjOGNUMzhjOW5OWExjZ1U4bmY3bU5FejNQQk95OE5wUGVT?=
 =?utf-8?B?UXlXalBzMk80Z1UvbnBTL1pHZUlqR2NTQ0xYMlFUeFY2elpCQ1I3b2NmZ00w?=
 =?utf-8?B?QUxkOStXZlBzMld0aXFoRVdHeU02TTdMTjFMQXcwRmdwVG5ZeUxUZkZBQmpS?=
 =?utf-8?B?U3hKYzRiSU9Sb1dOYUdmOFlJSHRZVDM4Qi9oaXRhSzlyWm02T0dmdWZ3dUVo?=
 =?utf-8?B?cHF1aGlwaFUyWXVDaGdja1J4alFIbWNMZWFKZXJjTC8wL0liZDhSdHFOQ3pP?=
 =?utf-8?B?YVFud2lLZ3FlbmM4UWh3aWt2VjN6a3cyWmFTYndSTW80SVl0ckdRU3V4VFdv?=
 =?utf-8?B?R0RSRTgyOUlXeTc4VElzRlcyMCtWOFJQazlOQzcwUVFwQWxZckF4ZGNLZ282?=
 =?utf-8?B?U0wxK2EvVlJTazhuUjJEOE9CSEtaOWdKUGExVHhmcnBXdzJMekxmMkVMcDB3?=
 =?utf-8?B?WUFXNzUybjBZa0FaUFpWMEdONVFCaGJ0ZytxeEV0N0U4RzArRXNFM0I1MXRV?=
 =?utf-8?B?Qkw1a2VXczVnWUE4U1FuQXRmOUFuNHl6SFN6ZXRMeHNQV2tVaGs5VWdPc2pI?=
 =?utf-8?B?azc5OThvYkIvcXBxSlNjR0JFV0t1VHM4eW1ucVl2K2FZTTRaQU92WGRjcEMw?=
 =?utf-8?B?SlRsNGpLZFc5SzJ0WWFpQ0dINkRJVGhhWFhjYTAxaFFueW9mQklvNnoxdldn?=
 =?utf-8?B?MVpxQXBvamxOZDNYd1NBdzBxcU8zM2RHSXRJVUErYXU4VDI5MVRaelhqOEhj?=
 =?utf-8?B?R2pYYnIyWDhXazl6NlRCeVF0T0UrZkxTdHNVSVlVU2QxZGcwZk5TY3JpNTJ1?=
 =?utf-8?B?SGFkcmRwaEVBQ0ZFUDltODlaVTdRNVRYN1Q2bktKTUxyR3J5QVZremdGYlQ3?=
 =?utf-8?B?cGNHNUk4cWdWZVZla0orVE5MRWw3VnlnK3ZuWVJ5K01SaXd2WEswM3hHVkZi?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E+7Q1dlD8x60ani3VnYckycv3ROk88XSB/ABMW1F/vs/33qRC37Ljg05QMYSILIQ0lxWINSdln3Ew/AMX27q4+g1gUKYeDRxkNYhx5pwMI3viN1w+ZxKXJsjvqUS9FGMerGqyyo4FxuYCtt/vitxv6LP+rLCshiungVcbk/0cYZwPrx6PQ5QcuWBJ08Nhpjj/6OBzhxm+o2m09hMAZEmHxFz0MU/64BoHnCbDexWUxWUSSfRIfjgVH68K1xvMRk2pw8w+AykG37pC5pcwXEEHiCcYsZ5I/TKsAluLgERupJpcTAB865geBxYN6v3G5Kc6xUwwqFBb7FJS/mtjgjbbev52Bts2d9Nzi8QVC5uZTLI+zIulV8zX/j3+IgYVKIZujqbAcr3rtBC+TNeZ9lcTuF2yl7pwZFe3RPC/sJ4u2F7O8GCm5BEACWVI3JalavXCByVYzHfbsdaWcI8URjf5OwJZxK6JNsYcc+pzJ585HRfUGMd9httZ6gDBCsDyn6V3oN+RzSuhDFSoVkVPH0njJamfx+LGZFsgkXUW7NMMvQz2uYwCX66gH8t53XTIFzlCiK6tb0XOfxJXSqzNiVn7+ukWod8QzyIUwm7ybVOKyc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2df6865-575e-4f7a-9e39-08ddd9a8ad5b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5124.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:01:04.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UtFrqgRDh2ZQ1XtDMjXKQUExa2E5UZnkZHMhi4JqnqZPjdpcDfTyNJGn8bX2uplNFeL5foCz6n5+htMdNoGOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=989
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120135
X-Proofpoint-GUID: LLtzDk7jn-rNq4WTlULU_G3XmLn1IO3F
X-Proofpoint-ORIG-GUID: LLtzDk7jn-rNq4WTlULU_G3XmLn1IO3F
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689b4925 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=NEAV23lmAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=HId0tydg6lcA:10
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=j5KQ8em1pREPqL0118sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDEzNSBTYWx0ZWRfX6mAAWLfjhe0V
 +hQadJRmX93qdNm86mQB4kYdsITBrP0mf0PN2ZacrBeq5AR3erGszwJIJ3GOVi8/samGpotOHJa
 9EBIpd6jRt/2NP6X5R/jvXzBOCKSjjl01RftUM5jXoEcDHU7vBRzAqsqTuMO/4jcX3d5iCq8Vn7
 N4WjEIJNG1RgxiLjw9E6gJpRx71lTcC+UYgdlNS3Ux+cFIMg3heJPHwC+aJ8VLb2nYEhDjN2o61
 FBuA/xEnaoZ4GsppHefM6g3Q71B9yl/8RckY9O6cfMPNlpH/iN5gNnvUFKCWBpNosm5oCXEZ+o0
 zrkUxzzlMvIkX+T9a0WZj/sEzDhxVul/yFtlAl+mhQJdm4Vve609to6xk4im83ABzKuE0avBpoA
 vVkJVKNS1uinwHc5NN2k6xEmUQkp+m0Z7Xbs5/d2ln41aTAQ/c49UxuOpB1WBQLuMlEpvvoJ

Hi Hannes -

Please have a look at the PR ... it fixes a commit you authored
recently.


-- 
Chuck Lever

