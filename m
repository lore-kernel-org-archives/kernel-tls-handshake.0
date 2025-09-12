Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039A1B043A
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Sep 2025 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687711; cv=fail; b=T47H+WBEdl/nh6EK8uJyP3dtRq+ZnHYJPmfEKUARLyEoaEjdjSDTGyyw350CCLTniG+JWGYBx3SNhHpY0nx72MR0IuXW9V+Qd3URLeL8bs+Zty5MJPCWYIzcrL2l2iEF9xnnDD8GDOcqejQvJqErLrbM7aH3a4EgpWFSdaOrFGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687711; c=relaxed/simple;
	bh=o9LezjRIBQrt8Idl87yMHoMQGRsVUcKuKpuiHOcPRoE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TY5dINuolIEVwd+Z+fqFlO75AkwRDcWGpy4p0rewtcWF+gBtjFn8iaiSiYIa4Wl3LoRbROeLe/DMLO2W+EE1Et1aDCRlbE7J4q7/5TUqrNXJX7V05uLcgCbgDxR0kS3WmpnMLf4A5xoBivkcaKXc++hjdS+fLZON+5e+4ejF8cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k8JT3s6S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Aua49Czs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k8JT3s6S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Aua49Czs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1u4Ap030915;
	Fri, 12 Sep 2025 14:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Kmhm0iXYF5/SOy6FNs0VU26O1A35iP3Cu433NrU1QDM=; b=
	k8JT3s6SbMKhaGBZu5tOse2P4glTjs211alE65NqMkj4TvW9kZCj/GfrIZPim4k2
	rCGSM1cnuJz6QYNApq+HJ2jma3NNRz2Xs/yZ1DDUWo7RLT/ehCa3K1kL2u+hjHbz
	iGMUxomwyeaMPiy7pb4jsCaegNL3uazNYTn8iaY9jsmkhaepmnX8EMB8uOEfhTb4
	8/Cdk9z0djLDbAzB+/JAspmfkq8buMY4jF0jNA9b6QUr5v3nVY8S2gYXwWDwaMvA
	Yd8SYRiud3jaMPzKo9+yaISV0Z0VCDj38ewfW0a50YECTEsukbcdxQomHC4o9X8p
	JpBqcNLafQ6rOUQ7ml9RNw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922x98a6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 14:35:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CDB2Hm002770;
	Fri, 12 Sep 2025 14:35:07 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdmg3jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 14:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQo8NxodoJsGkFqzMRmNULApUsmni9noIwg1g4er34v2HUOCc0iHg29glhI/rtNlIaTe3i9nCNj55sdGwUzeeDXUN/9Tl+5SHi3OoRWGgvr+BFNQmsuABQOrb/DqNzZL3qVBROc1TJfcaIYlr7p0YrmQzlTxnQhPynVz6ys3mRn4ktzICwbvlF/jrR+E6ec0xPe8/TqbLWGlcHJ+nXqEB58zgc0KCYdm7I2yyvi3Gtf/I9FDmk16nDbSuJDwfTX0UXe87LC5aG60Z24/2/AWMZZP+Oz/HH8iF1TPchvqsJKq3ZHXDDlT2DnbPoBFn1+sAQfs4EiODoXv3wXTTMZWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kmhm0iXYF5/SOy6FNs0VU26O1A35iP3Cu433NrU1QDM=;
 b=ShF7L7sZ9/0J486N7qo8a8wmeon2ZS96Q5f0fkhLGR0clQCPIsK047nc0bR2xfOTQTla0CTbm/KFS75r1KGJQSu97mNEkpAE6mdjL2L8TzVffgGvfcDCocp4GfenP53YGDpp7w2liBvRFEBvh/MG5jtpH1men8iD+Luph31EEJZPUw7rkFWbKWfPaFwQPUtI+KQLJcSk5IA/4za1V6jbW6qIoFyZ4SmCv8bPIl6ic5MsS2avRX1qhevya9fiz0se3jGjNWsUDumy01+DU+3HFM4xFrlp4wo/1t6keSAOErhe2vM3Fixs929jbrD/dT1RO5SiPPpY+Xh4289KwzR1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kmhm0iXYF5/SOy6FNs0VU26O1A35iP3Cu433NrU1QDM=;
 b=Aua49CzsHHXdBVhNjY6zLb2Qsbj/XWYfVxkeW3XgYHoq/4W/3vgkTBJDOeV51NKqDr/4RPjWwokJTbJIWNFr5nmhlv5SHLU79PZJy+2FJ8BZxuKggkkWgMbyRxZUiNvDXvx8bnZieG7murMH1CL2RVkf7cFCcPeSHc7boo9qGd0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB7153.namprd10.prod.outlook.com (2603:10b6:8:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:35:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 14:35:04 +0000
Message-ID: <626814b1-ab29-406a-a5ff-2255c6dae26f@oracle.com>
Date: Fri, 12 Sep 2025 10:35:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] tlshd: Allow the use of post-quantum cryptography
To: Scott Mayhew <smayhew@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250911212815.1414784-1-smayhew@redhat.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250911212815.1414784-1-smayhew@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:610:77::35) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS7PR10MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a34f8d8-bef5-4852-0d1f-08ddf2099037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGRJc2FBbXJod010WmloU29CV2lCTW0wZzFsRkEzRDRXdzVhOUdKQWZhb0J1?=
 =?utf-8?B?NVMrMjA3TzdPQ0RYMXVtWlh5ZHRES00yM3VSNHJQMXpQTWkzdHlHTHJ6YVVO?=
 =?utf-8?B?ZnhoQVY5YXh4OGltQnExK3g3N2pKdTFEL3lxUHFPMGVLQW10RnN1VkgyTklR?=
 =?utf-8?B?QnVyRmpmOXVoMXp2RFM3N1AyRTcwTHVmWFRHcno0c0VVTks3TTFnb3BOMUpQ?=
 =?utf-8?B?dUk0MEtzM09Ba09UUk4xVFloWHdJcUN0ZUZGSnBmLzlDWUc3M1Nua3cyUkFK?=
 =?utf-8?B?WjByem1VY1Z1WEJ4WWNvZWpXdUFYcWk5WStLQlJKLzJSaHpFSExPYWkxdUFJ?=
 =?utf-8?B?dXZnaWFzT0NWeHJQeE5ub040bk53QVNGSWR6ZEl4dGE0NW84dXVhUGZnUTgv?=
 =?utf-8?B?MGlrelUybzEvY0dsQi9rZjBMYWF6bThFQmVrQVJPaUpVcm9zdVREbnNKUFJK?=
 =?utf-8?B?dHVqZDhWVzg5UEk5L2VvcXROOVB4aTBOQmJGRll0eitWSnhiQUFhNDFENTZu?=
 =?utf-8?B?UW5nQW94UitvN0lNVzRFeTljSlFCeWMvYUFYK0xaS3U2ZHZjOThhYi9vdVdY?=
 =?utf-8?B?akwydytUMkNiOUhDbUZWZno1dHRsVHlCQlN1V3hpbHlxQVZsSUxRTlVCaU1s?=
 =?utf-8?B?WThPSkl1V0U2QUN0YUtCTWxnU2cyU0lvZjNidVZTd2tjWG9MSWpVU1I3OWt5?=
 =?utf-8?B?ZDdRclNUU3FqUzlJVDVEWnBERjk3cVhsQXROSXlISFNkQjJTclZnYmRFbWZ0?=
 =?utf-8?B?U3BiSnM2dGVnUGZRcy9VdnBLN05TR3Q0WUcyb2dWK2M4Zk9Sek1NNWR6NU1K?=
 =?utf-8?B?SFZOcGxaMGZmNW9QVzNIOUlUUko5RVZoRTlZZU9KZkxPUndYSnlpYlRDblp0?=
 =?utf-8?B?bGIrTTZ1RmRLN2RFRXFON0JhV2RGMWMveHk0d1RselIwUkM1M3d5YWxTQXZt?=
 =?utf-8?B?UWhCMEtqcEhKSlVWZWY2MWFqa0RQbkNGeDFNUWZyajhtKzdVUmx3TUJhLzdV?=
 =?utf-8?B?UUMxUEVYT1owK3lMenhDaVBuTTVuVVdIbFpZWXdrUVgyVU5zeVdoWm1iRW1M?=
 =?utf-8?B?bUVjbi9TTFdCNzVISEsxU2ZsbWdJc2VITDcrN1RqWkowcE9SRXRkcy9EOTdN?=
 =?utf-8?B?aGp5MWZLQ095d1ZRWXRrOEljWUtqdktLdGNTL1J6Y25tcHRoM2F5bkZ1STFH?=
 =?utf-8?B?ak9CbG56ZEUyRTNxRERreVRLbVhPVmxEbDY5L0VubEdSYTRQTTBaSTA0TU1n?=
 =?utf-8?B?dFRJdkx0VE9tMWFlOXZqYUJNRC9ZL3RwRU5FOHcxMjVpaVdSQU0xcXFlSEJ0?=
 =?utf-8?B?WnJIcGRCR2U2UERjUjJ4WnA5ZW04SmpvdHFyS29UN3h6TTlDc2V6d2V1d0pr?=
 =?utf-8?B?K3pwcSs0OUN6SjJ5WWVOd2gwY0dmMDNNQ0VOQ2doNUI4OHV3MVJwc01ESEY5?=
 =?utf-8?B?Wks0a0xRWE5PekRFOUtiLzlXVTg1WXZCcWtjejNXR2o4NHY5Wk1zYndtVHdx?=
 =?utf-8?B?UmpmamU4STdNVi9VNmVPNVR5YWlISWpETCswRCtSbUlhUHRCYUlkb25USTNE?=
 =?utf-8?B?WkJYS0FqRTE4NEI2cjEzWkJaY1J2Wm1QMElxSmtISkV6RmhEeXFkMjZZT0lW?=
 =?utf-8?B?R3l5N1ZwaWpkUW5vQThIdmdZWU5GK1p0bHY2N3dtZHZkUnJlaUc5YXhTTUxV?=
 =?utf-8?B?QzQ5LzliODNEcVhZUTJYeEozNnhKODl0Q25hUDhHZHA1YWFrc2E4OHdwcEdL?=
 =?utf-8?B?cnBOTzVJOUVYT2loUUwyRmM5V3NzVkNwYjFCcjhlRU1FblE1Tnl5TmJqeEFv?=
 =?utf-8?B?NG5hMzY3QjBNRGc5Ky9nRUZQNHRqNmNZcWhmcWVTUU44RGFYSGRQYit1RVhs?=
 =?utf-8?B?a3NkQmpnSjl4MUQ0bERQMjZmRzYreEZweS9RaldFTldIU0N0K1hPa0xVQTBE?=
 =?utf-8?Q?DihK1BJLmM8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxCUDNSWVM0dHNELzgzWVhTWW5UYjlCamRWOG1DRHFBcEdhYVRmYVpEc2Zl?=
 =?utf-8?B?VEV6Rm9mQ1ZWeFFMNWVUalp6aDRsTGNDcm43ZWxlNlNvUDlUc0c1N2N6TzdG?=
 =?utf-8?B?NXN6bWtGL1hkTEJLbkxEdEJCeDVMOWxNYloxb0Z0SVhvbnlkbkxYMlJKRG9q?=
 =?utf-8?B?VExMYldFWTZoaUwxNjZYeWhodGgxYjBJeW01SnRuOHZoTTdoVVVDemxwd3Fj?=
 =?utf-8?B?YnJQTXozMFFpT1hzSnhzZWRXK1FsMy9QUUt2cklBamVvenlWbVVKbnZEQXZE?=
 =?utf-8?B?bUt4TGplWlVIMGRVczlraUVhV3hqeFVzdzNqQmZTU2M2bm1udTduUXl5M25B?=
 =?utf-8?B?aWdzWWRuM3V3aUNWOU9mdEIvR0FJRkM5MTRJSFlheUsrQVJtc3ZTbGQ0Zlgv?=
 =?utf-8?B?VUVSczhMcitqd2h2OFYwc1lvdXV5Q2RCRk1QT1E5MXVDM01uWG5nWG1EVE9x?=
 =?utf-8?B?ZHRWWlFLUi9SNXBSVWhMeEp3dFBsejBTaFg2UmVYRWVZSVVvam1kNVJFZzVk?=
 =?utf-8?B?b1VqZ1pvc2NkenJPa0F0c25rTGdWVFdqT3NYNjk2MlJUTU5OMjcwZXVaQVdw?=
 =?utf-8?B?K2hoUk1XUFVDZEJlaWVtOTBKQU9LMStKVmZKWlltMys1SVowZTczbG1ldFoy?=
 =?utf-8?B?RzRaQnhuRFhxbllyTVJBVlFoTFI3ZUNzMDBHRlF4VnhUYmovUy96VVJvSzFK?=
 =?utf-8?B?amw1NmsvQXNXaWp1MDFqK1BXaXViVW9aLzlkS2VyWE5xcTJTdVh5a1dIWTVo?=
 =?utf-8?B?QzJxa3pVVldLc1hHZi9PWVU1T2JqekE1QlFUZTY2Z0tYdUJmR0lmOThWUGc4?=
 =?utf-8?B?ZFAxY3VMQkNMQnpvWHpBbFF4Q0dtcjBoK2Z1YytLUFFwKzZBeGtBNEI2WWZP?=
 =?utf-8?B?UFBxZmRtTzhZYUhhcFRlM0hMakYvbURrdzExaVJ4Uk9NcDR6OWx0QVR2MVpx?=
 =?utf-8?B?NkdaeFRpTDY2ZVJQK3VnVTltdG9qYVB2VXFKSU1nT0FjSTE1RG95LzQrUWkx?=
 =?utf-8?B?d2FtQldnVE1xYmFWWS9GOHhLNTRpZlhHcHFnZ0JtT3JQaStDYm5LeGNDbUtM?=
 =?utf-8?B?Q09naG5IZmZuT3BBaCt2TG1aZ0UyQkpPNmJ4VHMxRmdQaVg3c1EyUDk4Zmxp?=
 =?utf-8?B?WVEvNWxvYzEwUC9FejdjU2pIZll6alU4S2UvYnJ2dFhuNXNnaTNTcDN1VlBD?=
 =?utf-8?B?aWdjekZCVzZHZVYzYzcybkMxbHpzbENpMER1VTNVL3pRZ3Y0L0VpNHhrNENS?=
 =?utf-8?B?aUF0Z29KU0JSUnVNK2hNUVlPZVZnMUZISTRzOVVHYTRrUm9sNkovUGdPellM?=
 =?utf-8?B?aHBBcmoyUDRJRDJ5VGtyek0vQUtBdzl3SXZXdkFDWFlHSFl6bFRDYStHcmwz?=
 =?utf-8?B?a2Vwc2dLK21vd3REUmRMNkg0WnZTSTE3ZHl3K3Y5TjFsMktqKzR0NHBwRVdB?=
 =?utf-8?B?U1EwRUd6Mm9ra1o3UnhJMWN1MkU3Z3BxczhzdXBra1hFVFk5bk1uUzhQWTVE?=
 =?utf-8?B?dXRZcXhnSUE3bHQ5VzNCOHBEVVVQUk94Y1E3YjZ4ZkxDd0pmcUZaV21RcXV5?=
 =?utf-8?B?Q1A3Qk93WGcwT0JIR1FSdllDZEt5d2sxeUlSaGp4K1UxSXNkZm43L3p5Zi9J?=
 =?utf-8?B?S0x1eFFDbUUzcHUzQzRZR0U4RDVnQ0IxWTFlalBMUkpBSHhqOWVaRXRiZGM5?=
 =?utf-8?B?ekh2SnViSmJMbWh5emhFVXBFZ3crU3pNUjVxVC8vUFhjVC9GQnRVWFNqY3Np?=
 =?utf-8?B?dTZTM29vTHZBR2syTjVjMmZuK2t3R2ZnU2dMZGk1YjVKOHpveWltaml0ZHBs?=
 =?utf-8?B?REE5Vm0zT3NtRmV0ZUx5MnZtSVNtcm5qY2dlSDVzV1NzamkyODM1SUJCbmlp?=
 =?utf-8?B?WiswekZMZXpHYmkxVUhxQU82TGhETEJNK1RKb1liTytrR29nOUV4VTZoeEpj?=
 =?utf-8?B?U1phdks0VDRPTy9oYWhGMUJ3U3hQQmptcXlSZHc1WEtld1AzMGVBOHVndDdY?=
 =?utf-8?B?OWVjUkl4MWNTVTlQdDg5dHhRNk04YnFyczVjMmtGZVkrWUIvOENHQURvUFVN?=
 =?utf-8?B?NHRoQUxFRTBaK3VETEdJMlgzaWVycmtaeTFaVEI0OEp3OG1XTlNmYTJwd0FL?=
 =?utf-8?Q?VqKiqSGefGIhpVvKbmTonq6MS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eaAed3WDJkNZ+cb50OKbz6/tMID9bZq/xv4Qdw0aeIGxNZ/Vh3026WjcRi712AIjKn0hqepQJsGPDrjK+Xa9dpCbolLLYkygQEd8ncb9awO4G5cmlhAd/lqtRVwbGsh2f1uVgMI+q1JF+5Eu0f9z2ZsxsiFDJ3ilPskzno7ONcULPoORsBGXrPI4NxxiPJjySXxAVtARJM24e9nITJvemp1fO5FAJWANb30aUHAs3M8lqLNoCfsB3cJoZsHPkXwrzASUyKsG+q6ncd/xBsU8jzcgqsW6keisRgiUsrJYQ0OtKYgCA2BU9G3QbkqZ0hq/8mVXDqPV8VpPQsnAQ3sMeHQcQ+csH5Pl5pBah81ueIxugv4xa0l1pwOh/uxPuS6mSIgMq9JjxwM8eGxEUofRrhiP8dWx8W7DOuv/d93dEs7un4emGDiIGdnFx7qhIKK5EdEXX0wsbB4aggr0OvNoA479oXjr5FCEIqUTn+Y16br0Bn3eSuN/+V3A98cO/DyGpyCSXHx8QrDlGv6UekPuOIYGtidKM6TLYifYJ15T1va6efYztq0I8sFTV5+zAlq59R4eGgIOSWd3Wu23Csz584T4YXODq2JTm/cf2e1r5II=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a34f8d8-bef5-4852-0d1f-08ddf2099037
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:35:04.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnT/gyVRjntKcz6nC4HaMNOJEUMphp9eW3nuAqiFCUjqdtpJtQVN1gvSBTaMPp+CwKwDu/oPwboZiocVjoG+FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NiBTYWx0ZWRfX0HHGBWaohDAP
 QmIjWNSreSKPBwHy1+kg5NFmrON5wGqDr1VOJ7+DoIgTAc1jCrrGygbCEl0c/ZNEQBu1Fk2e5sX
 BdcgdH9RvIN5gfGD2x/69uYX1Yb8FzGnpyJhKEQ/baUmLgaK8GI2yX8w/ITPAK44Qw8h8ZVqzpO
 zI44IVHTXn6lF3+b7xsbks8lBBYyLjIqqSn4v60E3oup+OddhORtlGk90P67Wq9GZRUDXOco3Fw
 rXcHgXAE6j4tFlxL69bQjqzBqV034qgJzpSh8ChqwdmqcqZ94txMFc1S9pDb5NREvHszzs8pqa4
 UTKyGIbjHmBt+o3MPWI3RgT+BgMzztC8E6ji/RvNNKPhSqJsIR2z7hgeP6vF9sW0U57Y/V+T7bc
 GAqrNgzLXcmja3ulC3GSQqlnUxW67A==
X-Proofpoint-GUID: CdpBuuMhPx41RRQk05tIU5i2U-aCXIAC
X-Proofpoint-ORIG-GUID: CdpBuuMhPx41RRQk05tIU5i2U-aCXIAC
X-Authority-Analysis: v=2.4 cv=LYY86ifi c=1 sm=1 tr=0 ts=68c42f9c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=YLbBYSbf1L6RZvk2NsEA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12084

On 9/11/25 5:28 PM, Scott Mayhew wrote:
> These patches allow tlshd to use post-quantum cryptography.  The first
> patch does a bit of refactoring to reduce some code duplication.  The 
> second fixes the priority string and allows the PQ algorithms to be
> used.  The other two implement dual certificate support.  Dual
> certificates are necessary to enable a smooth transition period,
> allowing servers to work with both clients that are PQ-enabled and
> clients that are not.  The server will prefer the ML-DSA certificate but
> will fall back to the traditional certificate for clients that do not
> support ML-DSA.
> 
> Changes since v1:
> - Refactoring to allow the client and server code to use the same
>   tlshd_config_get_* functions
> - Removed a lot of "#ifdef HAVE_GNUTLS_MLDSA" statements (I'm pretty
>   sure the handful that are left are necessary)
> - Store both the PQ and RSA certs in the same array.  The PQ certs (if
>   present) will be first, followed by the RSA certs.  Note that I didn't
>   increase TLSHD_MAX_CERTS though.
> 
> For those who prefer a web UI, these patches are also available in this
> branch:
> https://github.com/scottmayhew/ktls-utils/tree/pqc

Hi Scott, these look close enough to merge IMO. Please open a pull
request against oracle/ktls-utils.


> To use these patches, you need a recent version of gnutls as well as
> crypto-policies (if used by your distro).  These commands will help you
> determine if your gnutls has the necessary stuff:
> 
> $ gnutls-cli -l | grep ML-DSA
> $ gnutls-cli -l | grep MLKEM
> 
> You'll need to generate a cert using ML-DSA-44/ML-DSA-65/ML-DSA-87.  For
> example, here's how I generate a self-signed cert using ML-DSA-65:
> 
> $ openssl req -new -x509 -newkey mldsa65 -days 365 \
> 	-keyout /etc/pki/tls/private/rhel10.smayhew.test.mldsa65.key \
> 	-out /etc/pki/tls/certs/rhel10.smayhew.test.mldsa65.pem \
> 	-subj "/CN=rhel10.smayhew.test" \
> 	-addext "subjectAltName=DNS:rhel10.smayhew.test,IP:192.168.124.69" \
> 	-noenc -quiet
> 
> Obviously if you're using openssl to generate your certs, you'll need a
> recent openssl too.  Or you can use certtool if you prefer the gnutls
> utilities.
> 
> You'll need to add the cert and key to the relevant sections of
> tlshd.conf and you should be good to go.
> 
> If you have debug logging turned on, you should see this if you perform a
> handshake with a PQ-enabled peer you should see something like this:
> 
> Aug 28 17:58:25 rhel10.smayhew.test tlshd[3291]: Session description: (TLS1.3)-(HYBRID-X25519-MLKEM768)-(ML-DSA-65)-(AES-256-GCM)
> 
> and if you perform a handshake with a non-PQ-enabled peer:
> 
> Aug 28 18:04:21 rhel10.smayhew.test tlshd[3352]: Session description: (TLS1.3)-(ECDHE-X25519)-(RSA-PSS-RSAE-SHA256)-(AES-256-GCM)
> 
> -Scott
> 
> Scott Mayhew (4):
>   tlshd: deduplicate client and server config functions
>   tlshd: Fix priority string to allow PQC
>   tlshd: Server-side dual certificate support
>   tlshd: Client-side dual certificate support
> 
>  configure.ac             |  12 ++
>  src/tlshd/client.c       |  48 +++++--
>  src/tlshd/config.c       | 281 +++++++++++++++++++--------------------
>  src/tlshd/ktls.c         |   2 +-
>  src/tlshd/server.c       |  74 ++++++++++-
>  src/tlshd/tlshd.conf     |   4 +
>  src/tlshd/tlshd.conf.man |  15 +++
>  src/tlshd/tlshd.h        |  23 ++--
>  8 files changed, 286 insertions(+), 173 deletions(-)
> 


-- 
Chuck Lever
