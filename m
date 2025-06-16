Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829AB209F38
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 16 Jun 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084813; cv=fail; b=L6CcnJZQL7pal0y1mvXDHd7tp9mdUEtYV4JPp905/LnyIMeP6drgkEnx3nG/jVpkEOJagX6sUH4FLTH7CTpZfPMrHGNrZfCOgfGJlOkk7I6Ce5cixj73uhurq3UMq0M2KckDH9U/hmOOLIefMdjQ4RjELmbs9gSEBDFRCEkYoQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084813; c=relaxed/simple;
	bh=XYooqoVWHAsvdaC8yaG64UTl56DpVBQEW8Rxeh9Oje8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TGgek03sy6dIMS9nUtyzVfEMYjewOHx0mDo554F3uiNMZOgvm/BE7z1rsrZkWxz05AR6agnpuo5Xztt7y6FFBbEWL5AkR4iKHOSSSfnexETINhNIBkBjIGpVv0NY4QF3TAaI8Qz5xucHKyMfIaR6MS1mwIA5LreIYQmpquiHEDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D3ij3E/9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ypgiZhnE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D3ij3E/9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ypgiZhnE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7fbWw023279;
	Mon, 16 Jun 2025 14:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NeGGcX5IdTnM2dzILnQavLhobMEj+q4Ea6UgqSGmUCs=; b=
	D3ij3E/9yH67XI9CuH/1nHaO7suD/EeDauc95qVuCblC6oaYAqMYNp10DQo81ivc
	V7m7dqcAPbgx411e9Kb0hXDwVasT25hLjqXa4KYMqopzdBe+C/NWygw9sVixaSAv
	NxTTIQqRlFI5BKHYWZaHI7/F1GUvBV3kWUOFryUYCmbGHXrdOIgbt/nFdqI7y14O
	AtsyFkPHVkR/bHXd1hnijqbuITNNaCo0mxElCKFCGe0k78vyECBdwOYb4oOAyJuc
	QtFAnQJbsMBYyFYyVgB0Dqat/OOhxipXwOnoS9M+iZQ5lztSxRDfUkxOpT2PzIdC
	OpU+TaqhvhwNmZsm3Tar8Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv52pb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 14:40:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GEPB26035096;
	Mon, 16 Jun 2025 14:40:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh7rpnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 14:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG04IBmOYuFoL0XTP66/TsZhvCGGIR9Sw9pXXnKJtYdL0llipIMINCvJDYuSof6ArDpWFub0DVUTPbo1Wb910To1m3z/vAKDaRtWGzrQLEneXZ+2/WC6c55GaS1rnsFKAb4uOERXJf8S/D79h9qDh3IMe77/S+G9AMv4zlA+ulTY9osc0JnJo+j0TIakdnjaxQjL+ymbrpHWTv0NBTAO1V9Dem+mvGnmrNTwBqUJgk0jZc2neTQ3Kl3NhGRdJlpFeB4gmtXWVL2AI0HZyRJE75uwxyEAka+gYuaCUYkeQ0NjYiZ7dHJgVue49gvSWXHHty1qRTSpqRM6w0Pdn20T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeGGcX5IdTnM2dzILnQavLhobMEj+q4Ea6UgqSGmUCs=;
 b=sZ3HBGk/TCHt8if7bBlQPcX+8Y+x/0U0N+JTJTZEhT5HiRz9pNkwQ+vBhRShUJgHZIhhC84tz5LZvQRc8O3BL9iw90rBWr5Ngjs6Yc40yiG10YjjklM0/oAkowKg6HprO/sJ7w2Onv8Y6eG0LvK1lUm5vSVs7tsOV6QX6pUs3UlTPwun6E0NuV1HcTYaxTYe1AjS8IlpK3JhVKXrJecgByffClFeANixJkRR61cmzYvUl8CTHS3cl0W5qt9EKbV5hMebFhqX9J7ioNmXMBuNMJwjJR2n89Nx0XGpd88dCyxQykmJGlfMoWcVlcUZj1UAFN4XdC6Yz5kx0DfrsXyebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeGGcX5IdTnM2dzILnQavLhobMEj+q4Ea6UgqSGmUCs=;
 b=ypgiZhnEBER6BIV6qa99qq82flSeLqWqnVdI95TA+4mBCR4rNmU5pniG9sbwIv0fCSCvy8N+Ar0r0JqNpMP1DKE3X2Nl5vVO2602GQoLFXkIxKhEvwkyem0AQBaBnkLkFGOLKncUlOiNT4+AHG0MBnUP279zEnHDekaw2UI59Ig=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB7362.namprd10.prod.outlook.com (2603:10b6:8:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:39:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:39:55 +0000
Message-ID: <2e28a18d-145d-48eb-9111-65b5dfbfe818@oracle.com>
Date: Mon, 16 Jun 2025 10:39:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add CRL checking to server and client
To: Rik Theys <rik.theys@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev, Long Xin <lxin@redhat.com>
References: <20250611070943.235087-1-Rik.Theys@gmail.com>
 <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
 <CAMApiK_EsvOXrdSYgG6Kfnd57AChBML9v7Wj=xwFvLFk1eeNKw@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CAMApiK_EsvOXrdSYgG6Kfnd57AChBML9v7Wj=xwFvLFk1eeNKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:610:4c::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS0PR10MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dfd7af-ac43-4b67-b88e-08ddace3a8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkZ1c3J2R1ozMXBqL2pyQnhsbFJmTVVzZkpOdTh5NkZhRXVRaFJqeW1YbElx?=
 =?utf-8?B?enlrb0NsS1ZHaUI4S1NLN09aamxEVkVtZ2FhN2hXUHpqVkJ6bWVLNTU5azIv?=
 =?utf-8?B?ZWlJV3FtbEcvdHZBaTB5a2Nyd2cwT2VCa3pncUZUU2VmeitabTZmZklXb3BB?=
 =?utf-8?B?U2w3dmtDWG9kTkFvT056bUtQTGhkbG92ZnVGZ2s0dFpLUEtYYktJQWdIYUIv?=
 =?utf-8?B?LzZHSjhqaHNJMHJidWJMblptc0s3SzJ5d1oxMHVtblA3N0N0cUJsWDBGTlNJ?=
 =?utf-8?B?KzhSRVEweXpaQWlVSGhtQXhRLzdBczUzc0RMQncvVHdTRVZxd2FXRnd6ckNJ?=
 =?utf-8?B?VXZZZ0pyMDY3OUlmcWd6TFV1U2c0ZGZQWENpdlFFNjdhVnZ6bDErMWFQZks5?=
 =?utf-8?B?NzkxczFYTlpwd0ppTzc2S1RySkx0KzlNcXFBdG1TUGZHaTlIZ2FWSVU5SUJV?=
 =?utf-8?B?WThnRXV3RUFXSWFKSGdRaE44b3ljdkdaOGFhTzExcmtpVk5MUVBoaGZ5akdh?=
 =?utf-8?B?UVlyUU5wZERGTXpLVmF1T2hZdTBXQlN1OS81NENTazc2cVYwL1pNYW9aOE41?=
 =?utf-8?B?MXhPRmdoOUkxMUNtNDJzUTVSWkFKd1VQNitoY3VFdzA3bnloWW5vQ0NxZStZ?=
 =?utf-8?B?ejF1cXQ2d0dJT1ZTWDJLcjV3VzZJNUVUZ1RwcEFFcElLVEpKMjRpQ0twNE1M?=
 =?utf-8?B?b3ZyaWozb1RXWVNSMWlGT3VTNTVHZnhCN3hhNnV1MlhwVS9nOTlRc3hNN0p5?=
 =?utf-8?B?TkZRTnBQNW05OG5lSDFrUVZBakFWOWp3Z1lrdnU2c3E1LytuLzVnMkFDTVdx?=
 =?utf-8?B?TisyQzJsVUFDSExvajAxVC8xc08wTDcrTWI4cURtMk5ZVEtBNjBOKzFlZzlO?=
 =?utf-8?B?RytyL0gyYmR6QmxsVzJ4QU9xNFRTREZNSDhXS3oxbC9KMEhNL2pkWGtGakVa?=
 =?utf-8?B?NCtJeDZIK0c4cnFNaENNTFdkdjhJdm1INi9vRlYwZktOOW4yaW5LRW5tcVhJ?=
 =?utf-8?B?dkhoUGMwUnAvQ1JtZ1lkay9nU3JCbjRXWDJBS3AxK01GMy80NGs4WVdIS0l1?=
 =?utf-8?B?aDRCQlBWcmwwRnhnVzdmVHI4YnVOOExOTVpZa1BYMktFQ1FNZUpESXRka3lJ?=
 =?utf-8?B?QnQ4ZXV3R3hxQ0xRcmk0cEJlbEk5VzdzK3ZYditicEgxeGF0VjBtRndnQTRE?=
 =?utf-8?B?YlY0VStNeXhMeXFjaGZOQlFRT1k4aWMzczNrYkZ2dFZlclFOUDNVTmRuVlht?=
 =?utf-8?B?d29oa0p0YUtQVW9RaVRCKzRvd2pOYUZzR2UwUksxZXJmQWNBdS9uTnpuYVlD?=
 =?utf-8?B?bm4vekxwU1dLbFRFbzd6OWV5K25ySlMyRXNpam9kZThkZUU0aEVPdVZNdHVy?=
 =?utf-8?B?bmJNdnN2NW94R0QxQTUxNXhLQkRLYWEzd2VpeU1JOGtKNUU1a2pZNzVueDhZ?=
 =?utf-8?B?UGZ4MGFQTjZTY3Y3Zll2a2VZNmxBQVpOSHdQN0pJTnBiSnQ3dHFPTDhYZFRH?=
 =?utf-8?B?T0tqRmV5MmxYY3pJcE9FYnRVaXVvaTBQSlJmUjFEM2ZVOUVVdGs1eEVGdXVK?=
 =?utf-8?B?THpiOTdjNUhaU2M1ak5hMityRGZpUDZHVlFXNTVsTmp1SmdPM2w3TmVjMkVE?=
 =?utf-8?B?OWtIdlJPS3JJK1RLcDZVeW81QjRKL3QzOW9aSDk1djhaemFkZHpLN0dGWEl0?=
 =?utf-8?B?RkJjL2VXZHNpN1AvNE9iTmdVSTBMSXFqU2FqdGRKendQOUhnNkpmRW13Rm1K?=
 =?utf-8?B?T0VtT0pTbHRhc21zNnBJbFdHNXBzSlIyRDlDNTlEQXBOVC8rMi90dktoK2tO?=
 =?utf-8?B?Y1RMVXB2eXR6QXRVT21IY2tVNXpSK29lVGF2Z2ZWZUdhdWZMM214MDlRbis4?=
 =?utf-8?B?T01wQnJMUC9JNFZ4ZDRaWnhFNm1hYmFzK3JkRXloblFVUkZ4UDAycjljRlhM?=
 =?utf-8?Q?2sJWhQuHoe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTVhMHAveFdjeXdwb3ZpQlFyTnVtWFZIeEhzUjRmcWphZnlyWTJ2L2VjUHU3?=
 =?utf-8?B?a0h4RWIwRkt2ZklDZnlpNmgrOUFlaWxMQUZ2a2tVSlFpeURWMW9BdGd4S2x1?=
 =?utf-8?B?WEM5WFpzb0ZsUEplMTZOSXhRcmRlL0xuL0FvcFh1c244SWduSkdLdzZZVnF1?=
 =?utf-8?B?YzNWbzFUdHVMbE5jaHpSNEYra0hXOE1SelhKeXNNa1dWb1N5S01EamREaUlp?=
 =?utf-8?B?U3UxZU9VaDY5aDVVdloyYW9qdEhQMlcwL2JWVW5OcStIQzQxaG9qSVU3VCtX?=
 =?utf-8?B?ZGxLRzZiaEk4OEtBcytaQnpyTDRaVk5UbktNcXptbVg4RHRvVm5WNkp6Ykts?=
 =?utf-8?B?Y0JkaGZ3OXVHRVVsamlzekFFbE5pZ0dwTVVnNEdjdzRiR1NmQ2pWeWlEZDBG?=
 =?utf-8?B?K1crbDNWOXJnTWh1UXhJMzdIL0I2cmlscncwNzRjVTlnT3FIazRQQVdqN2NN?=
 =?utf-8?B?UWNod0VCdUxlNkduQnFMeklFWnF6QkhKTVZJdHJEbngyMU1hbm1yeFIycG5w?=
 =?utf-8?B?a08xOXR3K2JlRVQvZDRBY3B2cng5Q2J4TUtoSEU2eGFlcTF5bkZSSytRL0kw?=
 =?utf-8?B?dkViOTc0U25EQm8vTS9WYk1TOEpvUFk1VldqL0dUeUExZUEvTWorRVp1UkVw?=
 =?utf-8?B?MlZtVmhyM0s1MzRlUzNZeitXaXRBazBuem5Vb2FRM0dOdEQ1clJUblJSR2tt?=
 =?utf-8?B?aE9aOW5pZHlMZU5uQ2pPekRKTG9TdEc0NVd0OUFSQUNGbHk4ajJXQXplNXZB?=
 =?utf-8?B?a0lWRVpHQXdvaXdYVHlrUGRueGpyU2NkbWsrNk1ucytNRmNERXJyS0YrVVpX?=
 =?utf-8?B?bXAzZlZvdVVweC9NMCtMK3c1Y0Fja2o2V2JWdG9FTk5IRzZ0VU83L3RJbHVR?=
 =?utf-8?B?dkFzMWZqRGhxN2ZvbDFua3ZDcGVvb3dUZlJER2ZvckZoK0FvcG82MWVocUhw?=
 =?utf-8?B?M2tURUd4N0ZHN0FiM05NM2ZhME4vSkUzVVhFbnJodDRUQ1gvdWJ2RW8rSDRT?=
 =?utf-8?B?eW0zQlJoRFBiNUlodDFlZFh1dXZGNEU4TzJuUGRKd09uWVo5NU84WFl0ZG5t?=
 =?utf-8?B?Q0NReVFReHozZzZDM3pvd1pmMmVDQWsxUGI4MlBGRUZaOStHN3JqaDlyTFRV?=
 =?utf-8?B?cVdYWjY5dzJMRFU4bXgxbFpwclNzeFYyOXdXVDQxL0pBZldid2ZkWVB6SG5k?=
 =?utf-8?B?a1BSeWUzcUoweDdWRGd4eCtKU2YvdlNzOGN3amdzamNMNHMxVkFNZE51K0ov?=
 =?utf-8?B?VDJ4ZERxVko3MTM3M2hFRWlDZGdoZmJ6K05jNW1LcjErQXBMZ2t4QkMwTWps?=
 =?utf-8?B?Nm4rTXE0dVpNdHVCMVBZQ3I0dEh3RUp6Vlh2WVlkaW10cWVVM1RxYjE2VkY2?=
 =?utf-8?B?cUhFeklmbzJzRHYzU0JGRUZiL0NTZXpsRDdGR1dCU0VDOVcwYjZPRkZlZzFq?=
 =?utf-8?B?NEJWcWJ0bHlCYVRBYmQ5TGlSaEtPbnpQREdsaVUwVVZ4cmY0UndveWVXb3Vl?=
 =?utf-8?B?YXBZenN1ZlZMS2p6dUphNDExQmpxWGp5czdjSVdidURpcXp0b2RyMEI5VFRI?=
 =?utf-8?B?L0ozYnZTT0lNZGFSb04vUXYyS1oyOWQvTFo4NE9hU3ZGTno1aW1lYWlCN0lK?=
 =?utf-8?B?Sm9uNGUzZG02THBiWXdOaDZxbFpXeDFNWExzZ1dhR2dieE9ONzJZdjFFUXRj?=
 =?utf-8?B?SWZUdVFpVVNjVFJPb3RRdkVwSVBGaWtSTG9ycnVuMU0xSTlhTkxxZ3RxYUVu?=
 =?utf-8?B?UjRpVWdERWNmb2JSZzFBZTZQaWVmUmlJYWZNV3RHNHFHSnJJMzB4cGh6ZE5a?=
 =?utf-8?B?VjgwbjQ1QlBjVmJzckRrSnVNMnNYVjd0N1dNQ3EzcWJlR2l4aDJKaDkxdTFI?=
 =?utf-8?B?YUxYRnZ4S0JBeTVleVZRTjkxazhEUENEL3lRZ052RVVCdVlySFpNL25lZmpS?=
 =?utf-8?B?OENkc25ZUXgvSEsrajl1WGxUMFNRRHB6Si9DMGZqMUdlMjhBQTR5WUYydU00?=
 =?utf-8?B?Q1ZkVXZvL2FRbVFvTUc5ZkNZeDNIVXpUWUttbG53SW1PUjNXVDlLRnNRNzlI?=
 =?utf-8?B?MG9sRWxtMlJCTW54OVZVSVNxdlhiK2RxellzOWRLWXhJL1hyRnhJTmZBVGw3?=
 =?utf-8?Q?12p3BtSpUGcnTzJt9n0WPbLfM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pXGfWoZsvcA+HpY63DIyc3pDA/9zNVGRV1yoYxmwbGJQ9eqEp3uAjcCbz4ZTr9rj4iSAMnS7vze1Pw4rWPY9yDd5JEUC1atT/ZNVW5BESo//Enko1WSgCbNvtUaJ6Opbr7zsFUIgVC6Bz4InMHmKmKcHJ4rOIgmaR9YKutott+gsdtYbOOot89cBzcja2PBdslg1wEpE8Xc9intownTKgCyVTfUP0S8zA+0c4Pj3p8+UunYP3krvzYFADZW8TbKBkxB6LtcwAAwuGTkgem+epSAx7S/AYH2SqFc3yuBtTd2wpUHxcOPSra0dHu2PxUDLFTFFOOLjVvZpNdN354jCax260+xfRc+SNLAY6xI1xNKYvw4GdHNOl4fVh3gimGvVlizlh4El0iNvz+PuaVnArRj9qANnXd7m8U5HiDJB2I7stA+gbWWT2f6DcVNxKkKPbqopOppDpwXc2vH7ms+V4UagEPteYwxhv0LV5hvAhifG6QGLTkxQqHoGRktqiE5VDUA1VHS2AfuUT8hIDkOs3qmdYnal7Jo6Jfh+I7nbKhpOaQWeeQgU/WsMjEbbEYFjmDqCl8J9eZUXaLZ8tGsrC/oIrqrA+EKkOPg/oC5GTy4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dfd7af-ac43-4b67-b88e-08ddace3a8f9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:39:55.1134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHMsz01OzNXXMtYMTn++414VkZug1QaRRxQNEwGTPFpj71P6Zrrt/KkyJY1l0jziY2/5gmJguljLGg8/h3HeoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MiBTYWx0ZWRfX8xFrpM8o6Rhl UC2Q5U4SHMBzZQE435TZRvgvSWfN9VaJn5ChysWgAZDXJ47XpdzH7sEcziN1B+ad16BZQaoQeC9 2vKi5F23wfkgI6TY4CKkU1zopGKFlSfTjpVTHxapI7oVjt8hR162nEVr2/tI+HTqMDtInyYQS50
 AaY1ZoV/Wq/EQbnvsWFFwIoDjf9HlPiCakK5BGiyr89svK4HuK1EzK0T3pJl3btC7K0Etnx2cyn xuAB59K81asMMBiZzeLV3uGMRAoJxM25SZc3q1d1e0xndhuuqkRk3wCLWJplFFFx1Q7WkFGtR4Y 4Wi7PSVWnHVtqJiJOCc5N77tOebizcM1omWZeGvxwBoQYubtLVnQlpbcwMdmlWOarhs7dhGhQ72
 rJWqXLWNrqErEPdf6QWxthd4/ybAPuS/E1uEXidujeB44DOHhNnebKRFNysRclGzJl2spKPM
X-Proofpoint-GUID: kpYD_LjbuXAkoZMyEu7wcDAn0yRsNNU2
X-Proofpoint-ORIG-GUID: kpYD_LjbuXAkoZMyEu7wcDAn0yRsNNU2
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68502cc9 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=AtHcaS8QktiuIfdrT3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 6/12/25 10:28 AM, Long Xin wrote:
> On Wed, Jun 11, 2025 at 9:49 AM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 6/11/25 3:09 AM, Rik Theys wrote:
>>> These patches add CRL checking to the TLS client and server code.
>>>
>>> It introduces an x509.crl configuration option that specifies the
>>> location of a CRL in PEM format.
>>>
>>> The CRL (certificate revocation list) can be used by an administrator
>>> to block access to certificates that should no longer be trusted
>>> for some reason.
>>>
>>> See https://github.com/oracle/ktls-utils/issues/103
>>>
>>> Rik Theys (3):
>>>   Add server-side CRL checking
>>>   Add client-side CRL checking
>>>   Add x509.crl option to man page.
>>>
>>>  src/tlshd/client.c       | 28 +++++++++++++++++
>>>  src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++++
>>>  src/tlshd/server.c       | 14 +++++++++
>>>  src/tlshd/tlshd.conf.man |  9 +++++-
>>>  src/tlshd/tlshd.h        |  2 ++
>>>  5 files changed, 118 insertions(+), 1 deletion(-)
>>>
>>
>> Also note that this will need a similar code change to the QUIC paths,
>> eventually.
>>
> Yes, there's no difference for the certificate credentials
> configuration for QUIC.
> 
> I think it will be nice to have a function like:
> 
> static int tlshd_server_configure_credentials(gnutls_certificate_credentials_t
> xcred)
> {
>         char *crlfile;
>         char *cafile;
>         int ret;
> 
>         if (tlshd_config_get_server_truststore(&cafile)) {
>                 ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
> 
> GNUTLS_X509_FMT_PEM);
>                 free(cafile);
>         } else
>                 ret = gnutls_certificate_set_x509_system_trust(xcred);
>         if (ret < 0)
>                 return ret;
>         tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
> 
>         if (tlshd_config_get_server_crl(&crlfile)) {
>                 ret = gnutls_certificate_set_x509_crl_file(xcred, crlfile,
>                                                            GNUTLS_X509_FMT_PEM);
>                 free(crlfile);
>                 if (ret < 0 )
>                         return ret;
>                 tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
>         } else {
>                 tlshd_log_debug("System CRL: No CRL file configured.");
>         }
> 
>         gnutls_certificate_set_retrieve_function2(xcred,
>                                                   tlshd_x509_retrieve_key_cb);
>         return GNUTLS_E_SUCCESS;
> }
> 
> then use it in both tlshd_tls13/quic_server_x509_handshake().
> and do the same thing in client.c.
> 
> Thanks.

Rik, do you want to take a crack at the suggested code re-organization,
or do you want me to just take your series as-is and fix it up? Either
way is fine with me.


-- 
Chuck Lever
