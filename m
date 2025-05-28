Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D92AF1D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 May 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438055; cv=fail; b=LQdRuokD4A1AMfN3xuVQdChVYzaxgM1Sp2ttrsd/rHw9tsCSjXJsp9LRFYL8fqRUIgBELQNucFeRZa8Sl5FnG1PlAVpWfvrgLmNBOXbX8t46sEqnuFvGU1fEr7HfYOFX5ekpU4z1ezLkZ9U1/wlWO0v3tNJ9KTI6DvnJVVgaL1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438055; c=relaxed/simple;
	bh=b4zA5QlE+lSNzGM5k+a0ca7pbdLBNvQtqDgN1pU5pgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A9qGwfC4JNg1XLjrbXYkrnI0kPSk3lQUxUrrew7QClv4wBrHC21livcMNFVYlmECvKiqRvQSa03wwdIWlkh6L43oX75FWzEmTL9Mi5QemmYsuioqKsCcQxlhUbEb2JceegYFbIH1gyouZSdMuO2TWxj9efDdX/yt/ag11NvLSXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IZSRJTW0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XOyRZrDm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IZSRJTW0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XOyRZrDm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCqMBB023535;
	Wed, 28 May 2025 13:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=uuURrkpadzAshch3fJXeocUFglrfwF6kRJMBuZK//Yc=; b=
	IZSRJTW0kbXk1gIxGqnirq27sXy/Ib/7FAGhdtrM9sy02ekQcWFrpLQRBSrFhn49
	ZnsTnEoRSudEsy+1mrfDblL0eNiEVBZzK5YKUY129OcRaIDTCg5lOzIUi5TIL7KX
	md65QI2HrO0cGPG34GpyjSzVoqtqvTnuFFgdzu3qxTpkJk3FU8EnPOOKYcm7S77t
	Gpw5XMD5RLWgl+ZLLbTf2IvLw5QHAMMEAr0gGEzlF4uDomJQAH6EKuXApvLx77gw
	rM2QtPSTfdEBQwyJfIQGrOya99XDsuYm16LAFuGzx4fEeQxWh9Zud9yGVd1Pd80B
	5mcgvPG6+C7j5/s2C3rYYA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33mwskw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 13:14:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54SBKFG3023120;
	Wed, 28 May 2025 13:14:10 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jacee3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 13:14:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQcR2keUe12kXesslF+BG12tvXP0oRcDi5V9BzFiWpIM9X4lTn2W6ogvM7V4Zrz3w6i/5PN9EhyjmN4QpfzlIqTnChPr+nx5AWpVfbqNOI294uFy7Vm7NVJZvWoyhUJrmhnbwgAo92yrTxCedoQI7D6InIZLGdQ+cj2DYXeGgDWl8ufzB7cDUgvxjk7ZZjZjasTknlil9mOBcSYrVnhrQehjBdzbevmshEL87O3160WwuBZBhWmEmttBFgeMqllcg2EfKXQaE0C6YolCK2xFYsQsB5D/9faxhngezF7KOeiLGithiQWubtAwEuyBlIN+AFFKbvYUHZVxifKtv2mySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuURrkpadzAshch3fJXeocUFglrfwF6kRJMBuZK//Yc=;
 b=ylI+KtMjRlKGpOXH1tHiBnFtolo9e5+0eVP4sTDc0nKN+9+XS3+lFsRIahyN2nvJw4MxamZ1PPKBzXRLxqhfpa8uqwv84dDTkODe70POhjKu6qxZWEWhHKxLnOdDI9gQguTU94Ouodo4M6i4CZO5FmVX7YGUk289Rb40NDQ9lEQ13ttw5gGqgy/nu36aH7l15d3aAOr0cbz403ZQ7E4JK6j23Qh/MZkBQAAYRneF5NTlijV7vVBagIGUszOZMk0e88nmVYJbMWqa93L5Hu7gl2v+Fvqs01j85ylCWJULPR8m4cEhYWxssKRnvcMobGALDyVFYd6thrAaAeQ1dGNTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuURrkpadzAshch3fJXeocUFglrfwF6kRJMBuZK//Yc=;
 b=XOyRZrDmtG6C0UdJWCRaZ+t7SxFqybNLCsaclzHljVH3U7CqoOpNRuQWU38q0RkiMKbwnXv+OzsD9T73TRnyl/fkM7ZPaVusoEyKWpA/AiDTfAQDgeiETcFVbfSoD3pRXPyH/byUlpDqBauSfdiDnI3ZmT5hollYYYinNImQFeg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB5181.namprd10.prod.outlook.com (2603:10b6:5:3a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 13:14:07 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.035; Wed, 28 May 2025
 13:14:07 +0000
Message-ID: <2e519f29-3360-4da1-852c-9260b3925c4a@oracle.com>
Date: Wed, 28 May 2025 09:14:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Further changes to contribution process
To: Hannes Reinecke <hare@suse.de>, Benjamin Coddington <bcodding@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
 <23F7204F-02CB-4335-974E-EDF5FF01F03F@redhat.com>
 <0efa01d1-45f3-4d2f-b329-18c5b9a02619@oracle.com>
 <5e97878d-e5e7-49b6-8061-95cec14838b7@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <5e97878d-e5e7-49b6-8061-95cec14838b7@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:610:51::19) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS7PR10MB5181:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c4bdb7-f9be-4385-8c2b-08dd9de9871f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0FqNzRXRk9qd3N1TTdvRE1Na1VxZWNxQktDUDd4ZStuMm90OFF5cTc5by9E?=
 =?utf-8?B?ZHIvVDdvVHlJSGc4MzlFRUs5RHN4aUJIbDBaY2c0SVNIaWtlUmQ5N2o3czBG?=
 =?utf-8?B?eC8xbnoyOCtBWkprd0NQaWdUcW0rZ0NHVWFLcmY3aWswSnBreC9ISGFLZE0y?=
 =?utf-8?B?OFlNTVZsV0l3RHVlTVlLcExoVmFVdFhoR3JrOVk0blVpUGF4ZjRabTIzL3Bu?=
 =?utf-8?B?T3NkaW9HdEkxck1FSGxmUmZxNzZBc1FORmE3ejRiZ203N3d6RytwU0JuQnVy?=
 =?utf-8?B?ZGE2UzBQZkpKRlV3OG84eFZXNTVzVmswYU1kVFZ1TmgwQzhhSGd0clVuSjZx?=
 =?utf-8?B?cEZZNXpMajFkVVE1UDFFZzdKbkQ0MUJhWmR0OC9wY0dBZFJFTDBxaUE5Vkor?=
 =?utf-8?B?akZCaEh1VDhzNFUzc1RxeWUremJPTU1peVBUVnRPeU1wYXYxZTlpTkxuUE5N?=
 =?utf-8?B?bHRBUjVLY1pTM01kK3NFTXNGam9UNEtlL2ZwTkZXZ2p5ZENvRHk1SEJzYmdv?=
 =?utf-8?B?K0dvVHk1WEd1cXd4STlVajRtdEFJWnhzeG5zMDlzdlo2cUY2VDZyMjBkbFpm?=
 =?utf-8?B?cHhWcGljMHhEdFUxaTl2UGJLeE02MFBsQWxCUkMxTElWNWpiWVkxNUJjb0JN?=
 =?utf-8?B?bEM3cDNoV2RlK3ZiMlE1QWoySTk3YlNSaFpCZ0hhbEp4dDBzTnJKR1NqYlQ0?=
 =?utf-8?B?dHY4K0VwcUt1ZDVKQ2lNTURsZHFMckFhU0FFaWpndVM1a3pIL0hsQ3doZVli?=
 =?utf-8?B?QlU1QzJORDBmblQvODJZWFJsUlVVMll4cEhXMHdubVJLNlR1MHBXUXJHaU5y?=
 =?utf-8?B?U1RjVFNVaFVQaEZWTnJDcTZhNStYM0kyOUFmUitDNWRpN0x6TEpXdkliWGJu?=
 =?utf-8?B?aEZ0c3NHUHYwdkFrWmZlRkRrOXZNN25QYThoUjZ6YjhnYmhsbUZBdWQ1TVpF?=
 =?utf-8?B?eG95UVlzdHNNaTZPK3VSdlZJTUN4RHVnOWh2dTFVY2FrdU5aUXJ4a215cWJ5?=
 =?utf-8?B?NVlBZnVsaUh0SkhFazltTGQ2THpyWG05M3RpMXBsbHJHbUlUK0VLeDVRREpx?=
 =?utf-8?B?OE5oZVBHOFJJU0xxVDhkU1FSeDlXcGs4aUhFSHczTDNFZFJEMEM4RzBJdGF0?=
 =?utf-8?B?bThUaXp1Wm4wZE5hUnNJY3pjaG9wOUVIOURJZmVDV2s0WGM0d21Ed25mQVVp?=
 =?utf-8?B?Z0FpOGtwNnFpT08wNVFsMTlQZ0lIdGtMRXdCelNsVXRRdzlWMzFjMWxIVGRF?=
 =?utf-8?B?SGpkUkVRUWU4akZPaGNuVG9qNVNQMDBPNktIdWRXMFBtdFZaK3VKMXl5enpG?=
 =?utf-8?B?M0pHM3g3RVBZMFEreHpHSDVPUi9oUnVLUHB6dlh2R1RTN1JDR2djY2MwMkVG?=
 =?utf-8?B?VG9hM0NEbm1BNm1RY1hWSkhGQ1FuaTl1dXp0VFhBMGhld0ZCK1AzNmo0V2pW?=
 =?utf-8?B?TGNMd3lvQzR5ckE3anp6eWJ1RE9aQ0RucGIvTVdFejJrUDhuWjhxOFhDa3M4?=
 =?utf-8?B?M05qQWFyeGpGN3p4Nkk0TEttU0c5TWEyNEFabjhPVHFZdWRLYmJmY0dWdFhq?=
 =?utf-8?B?cjdBVGdKamhYbmtUQStEd3F3bTZZYkRldzAvU0FkM2xoeVJFV2lYbDMrT0Yy?=
 =?utf-8?B?dW9kTW0vZHFpd20ybXJBRUk5Vy9RbTQwYUhob2hKM0NSQ1AxYjMvdzluZEhB?=
 =?utf-8?B?dnlmeGowRmZtT2xZWU82b0V6SjlNelZvYjNpZkdONG5kblRPU3U5QWJrSDVV?=
 =?utf-8?B?SG1jSElxSSthMUVKS09mRldyb2ZZaHBLRW9BVXVKSGtHRU44MXY2MnZGOXdU?=
 =?utf-8?B?dHZxNXhWZGQrREVRdVZpR25xUHBldzNSZmZMdHVrZnlrU0ltMnlDRnhqMTE2?=
 =?utf-8?B?MFRHMWxJVlJLUUhYWmpnYkZla080RWRTU0lwMlJ0bGhzYTNxak8wbEtObWtD?=
 =?utf-8?Q?5/2C0gjMWTA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bStubmVoN28reTVqenJYVkh4aWk0bms0TXo2dXJhVEFXekhVVEhRSDdWZXBV?=
 =?utf-8?B?WXVvQlZleGVSYnhzV3M0cGljZnl6TkhmcTZxeDRhbjFNTk1XNk04RVhYZXc5?=
 =?utf-8?B?R1pLVmNhUUliTmo0MzArV2tpZnNSMWVyMkZJRkR1eWxjRkxJUzl4N0tqYW1u?=
 =?utf-8?B?ZUtSaU4wMDhmNkVPUTAyMlIwNklOUWhWL2pZUUUwa0cvRFF1SjAyelpmRFFz?=
 =?utf-8?B?MkFOS012TjE4UjFiRjZ4SzAydXI5OUJVQnpBaEVsVUU4ZlFDNnlQN0lGa0Fy?=
 =?utf-8?B?TmdTcGdLK0dWeUtPVExFejdKY3JJZlFYRVNqenQveHJaVXdxZmZwblU3b25B?=
 =?utf-8?B?SlV0eEFFWis0eU5zNGtDUEtRMWdDN2s2UE52QjJoMWRkWkR0ZytvOHhkMHM3?=
 =?utf-8?B?UzVMMmh1c2FKVk5vcm9Mbis1WXNldU9nQld6UHVHRmlFcVkxRm1NTkVHSFhK?=
 =?utf-8?B?MTNpLzJ3ZE8wSkJGOVZKYlgvWEdWdkljaGVlWFpXbXQ3Rlp5REJlZG9BQnRY?=
 =?utf-8?B?NEE4aEEyV2hWM3B1NFBZaVNxU0ZMOE40TENLS3g2ZlJkYkdicGpmdktiNnZm?=
 =?utf-8?B?VFBFTy96NFdTU1pTNEtTUHlZS3V4Sjd5aitPczIrSHJOcGYxTW00UC9maDQr?=
 =?utf-8?B?OVdYNFU5aVhkbGhka00yL2REV0s0dDN0WkdvQkIyeklUMVgvQk1PQ0ticG1r?=
 =?utf-8?B?M2FKWUttc3pkdi9vRnlXOU9iUi9nTk0rdDRDQVBpYkhHT3FSTVh3d2hlU2h5?=
 =?utf-8?B?Ni81V3hnajlGZHhyb3RxZTlwemhSUXdDNzlXYlY4NktLTnFJd2EwVHNLekhE?=
 =?utf-8?B?b0ZncnZscVJQNTBjb3pkTGVwQ1BjRVc2elRJY2JnQlBMNUVSU0hmMWFPU09Z?=
 =?utf-8?B?UjNPSGpjVWcrbU4zQ3dGTmJrNDJXZ0JGRDd1K0l2UTBaUlZaTldVZFZ2NVhC?=
 =?utf-8?B?b3Y5TlFWZ2dPZzNsV3FlTjR0RVUxc081WHlLNnhFOSthQzkrYVZwYnBtTkFC?=
 =?utf-8?B?bys0TG9RREdNcURZOWJFRzEwSWJsR1Q4cWtBdTU2RU90OWsyWk9zQUlwSEZJ?=
 =?utf-8?B?cGI0eDhKeUdmekpad002ZXlseHJOWk1MU3pSeUZIa1ZrQUNvdWhQZVR5R1dG?=
 =?utf-8?B?aC8zTXlQWGZOM0N1eDl1K0tYRFFNRmNZc2hTTmVpYjR4M01iTytSaGh3VWJN?=
 =?utf-8?B?MUh2VytBR0JzV0liWlR5ZkZQdGVDNFBIMk9NcEZ5ODlkSTQ4akFuNWZYYUlu?=
 =?utf-8?B?SC9XQ3l2bktwTkk5ZmRlbWcrbmVIeE5maVprU2Nrb00wOEJxalVEYzRvcnl3?=
 =?utf-8?B?bmJBOExOTkpGSXA5Rlg4SmtmbHpiMStxSnlDNEFXUFN0V3B3S3IwU3UwbGlZ?=
 =?utf-8?B?Uk1YcjVyQ21BaTBXZjhsbWc1Y1lwbkE4eXBxM0c4N2tYT09lbSsxZVhreE1M?=
 =?utf-8?B?Nm8vZVplbFMrSnJiRHJuczhacktKS2UyYXQ4TEpidy9ld2N4VHlsc2s5TU1P?=
 =?utf-8?B?K3QvdVpYOWFqdXo0M3I4NG5pM2hCWVIvbFhsV0lUMytrRDdHQmFlaUhjV2Q5?=
 =?utf-8?B?OTYrekJiTksvVEtJenNUcVdNakZnOHZrdHI3K0hiSjJwS3FjSTY0dmJaZG1r?=
 =?utf-8?B?KzY5WG9vOU9sWmhzZVhUVktVb21GNFlmWDZwSlF3cS8waXdjREYvNVEwWWFT?=
 =?utf-8?B?NlN6b09GTGFCdjMyWVRlNHl3QWhqRzA3eUpKSjV5SGdCZGdlQ0ZweWVJaFB6?=
 =?utf-8?B?TDV6UXFDTzRJSkZSQUVDWVZKa0crTG1YblIxNFBCMWg1RVNuVERGUkRBTHFY?=
 =?utf-8?B?S3lnK2hyMW0vV3FabjhXVUhIQTM4TnlKZjZ1QUxaVS8xVC84ODhTRnB1ais0?=
 =?utf-8?B?Tjd5a3pvYmRSa0xmL21wRHQzb3RiOHBRRDBnR3h4TEdMZml3VWRab3dHUlVL?=
 =?utf-8?B?Tnp2RUR0TU10L2tPWFlIbHpWRDFGbWk0RmlFOHdYVTEvekk2U1lvSU40YnRE?=
 =?utf-8?B?Y00wVVZudHJ2V29iSkZtZHAwR1pPeWl4aWg2bTV1cCtscm9heWw1clluRzFM?=
 =?utf-8?B?UldGUXB1eWJmcEpyKzJKRUxzQ3Uyc1J1K3Z2UHZGOHdrdUZLRjJabklXWTZC?=
 =?utf-8?Q?6QPm9Ph9hbefU58odOKcs8j9n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8MPqswxXo8I//NMR7mUVCoyGmlWYcYKDIAB1Zb3B6YfoW6zgET0cAncEm1Fsuyl0mCPYzAOLP7ls8hGlxzVPMYf8BpHtplzabUdTc6GAkGZKCOuLbxE3/69KUf5vEBnUX7aiwDPwVoalOILSUXIvwsE/C1H8IH4vfiDeOno1/6/qm9j9PVELyb8wwUBR3jNNc5voQT8rc2Uzod8EjfE9zkWGsqAoOYCCd9Xtr7HQmPIuNSCHpWR9P5sgNuTNv9/soJJamXZ/XTrZUEM2hdGN7Q9hPIJgOLeuRA0rZ4qYGcmWIjj3Q0wtVmLhKZtkYZ4YNXiQnKCDlqWwQsaoqnYE8BP5bEg/cqsj6D7m87mitR35V/XUEjV/L8g5BuJXIJQefa3sM1QfLfJ5h0/EVGE0iE9ujulKcD4zG1RpCDPn6UIjnDQihNmCsPjkmvxqXOpmZdXvkwQAZrgTZpQ4DQ62qup6MApbTVXgKKx+5K1H72/pE1NzSfnKqzwEmDCZE6Lf3c/rscAebJt4wlU4xjWIHTltHZsOoR83mjZV3jo2JmIQtKxazXgxpsUZyj01yYYObLCtJTGDKb07TPZk6ePJt8WaZHZEctyIWvEMIDVbTto=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c4bdb7-f9be-4385-8c2b-08dd9de9871f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:14:07.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz4zVF4xNUr70EOyoNG2PizkwfRXPvh0BE32JnF95/w+AyCqxZy2t9LZXoBGlHGQVVE1hZ6PKDKU29iFnZUuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExNiBTYWx0ZWRfX1xH2TFn3tSyq I6nsH0eYZNNVTAfKQxwQCMkZH6axqchyCw2BZ1MpIJ6N1fbFhaMFKTlfwmk1YXu/JruzZjV6n4C 1My7GTW3mIWcZGmj1EQrjjHhZvbiNrikR35jq1N5QXQtLaNLe9sjsvkKe/KGHgbRjeqfIEXAZJ6
 Qa3XH8xPhHSF5lmZr3L9sei+b3nMKQ75FA4hr1ViucXPqZUa58zuiqy3txMcve9N3+y67f1xdtB TdQjszJ6ProyWi4s2mrioMco9M45C257JTPLCyRZkRfBAP7qHB6rGC01RsJsmnQ574uCn1pwqCo PDkI1R3PyTw6C7/b77M1S2y2uh5lMrbrpMxVUFCPp6xeYhMttHOFdfkep0BOM3688JCTiLzOjyL
 J05j4eo+QfZiMqkzeSOzkMULAzgp79soxxJXCShNbLF35a5kCIfbWUwAUr+CUvi6isIuAX2H
X-Proofpoint-GUID: ZTw6nFR5OWw6jO9SwdjMFtvBQjlSssW2
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=68370c24 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=nK3bi4EHhn9lAT-EjLYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: ZTw6nFR5OWw6jO9SwdjMFtvBQjlSssW2

On 5/28/25 3:28 AM, Hannes Reinecke wrote:
> On 5/27/25 20:55, Chuck Lever wrote:
>> On 5/27/25 1:34 PM, Benjamin Coddington wrote:
>>> On 27 May 2025, at 11:23, Chuck Lever wrote:
>>>
>>>> Hi -
>>>>
>>>> Now that first-time contributors no longer have to sign the OCA, they
>>>> have no need to interact with GitHub at all when contributing.
>>>>
>>>> I've heard several requests for ktls-utils to change to an email-only
>>>> contribution and review process, similar to the one that the Linux
>>>> kernel and nfs-utils uses. I've heard no comments in favor of staying
>>>> with the GitHub PR style of review process.
>>>>
>>>> If there are no objections, I can merge a change to CONTRIBUTING.md
>>>> that replaces the "GitHub pull request" process with an email-only
>>>> process, and then as maintainer, I'll eat the steps of pushing
>>>> each contribution to oracle/ktls-utils.
>>>>
>>>> Does that work for everyone?
>>>
>>> It works for me - one thing that was nice the last time around was
>>> that I
>>> could see the automated gating tests for the MR pass or fail before
>>> having
>>> to harass or request help from anyone.  I think you'll lose that part of
>>> the workflow, or be forced to handle it yourself.
>>
>> Those check-in tests will continue to be part of the steps I take as
>> maintainer. They do seem to run when I push into in my personal copy of
>> the ktls-utils repo, so if you fork oracle/ktls-utils you can still run
>> those actions before posting.
>>
> I would vote for having both methods. The github workflow is nice due to
> automated testing and workflow handling, but at the same time imposes
> another barrier for new contributors (especially those coming from the
> linux kernel side).
> So allowing them to send patches vie e-mail will have the advantage that
> one can review changes to userland and kernel in one place instead of
> having to switch back and forth between systems.

I agree, the kernel and ktls-utils contribution processes should be
similar enough that patches to both can be posted at the same time and
copied to multiple mailing lists.

The problem with the GH process now is that when someone sends a pull
request, no-one on kernel-tls-handshake@ can see that, and it cannot be
discussed on that list without someone (me, usually) asking the
contributor to repost there.

I don't have a problem taking a GitHub PR, but I'd like patch review to
work for folks who don't have a GitHub account.

So I think what I'm proposing is changing CONTRIBUTING.md to say "post
your contributions to kernel-tls-handshake@" and perhaps it should
mention that kernel-side changes to the handshake upcall should be
posted there and to netdev@. But I will continue to accept PRs for small
changes that don't require significant review.


-- 
Chuck Lever
