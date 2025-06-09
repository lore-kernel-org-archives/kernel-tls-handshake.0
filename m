Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04B3398B
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  9 Jun 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485318; cv=fail; b=TSrpGOqcYudyTXqIVhHxd7LpNcGKhd2auaEHHSNBrwg+nXWMme9JqBLPFbz1KdWnqOk0QqopXxRESx37MygYKlgtFCvqcer1KSNKmeGnV4ShFsygLGLG//f+VQ85Omiz/EUZNFE78MTXOtaTZX74tlMMFSQXto+CtF4ZKpjdbhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485318; c=relaxed/simple;
	bh=5lkL3vHaprbK3CCn5pouqAUny1VLpZxi7y8xu5p4u1Q=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mPwkEIfnJf94BRZAwjAffKc0tAdMws0sda85Loh8ybwzgVa2+pFALFRY87RLAY6hwlMLEDyPWnLDEUOVivN1EKMDNq1pbYwKz766x+sCQm1we9LYGzX/KUcQppMXtULRt9Y6Humi2ILr5MAHEjQX0wEKmXfuEsZB3MzOsQ++FTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l6T8kbeI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A5tO0s6W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l6T8kbeI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A5tO0s6W"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559Fdbrx006154;
	Mon, 9 Jun 2025 16:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9NsTnDM9ysZUH9/LQJhOkdVaHXU+7YwMv/LHvgaXhFc=; b=
	l6T8kbeIZrvDS/s5pjs5sye+dtlkXDatoQPQdOmXDtBVm8+UcMM0M7gdIW33Skoa
	CX3VTqluyjeO/SQy1HEcbF64xp4SGLG5XIfojlADOjsVnWaZtUO+9Bcfo12xHOhR
	kp0lVUBCZMQ0rWlr9ktrcxM4T4v63BmF1z+OKQmaob8VgRnl7QnN8ZDRf103ORD0
	LeBtjxY2X3TMPRCYun7QAL0CGh9bydG0F5Yg4rT0pWbafReFsiSEtxw+OwFxyApH
	1pcUTls/Ki7Oy8FJMdqtkton7G3tT/aOvekHHLpwFSNU7F1O/WlkqO/4zUmi5+Gv
	UzQbwlSTs4JZiIDt15FoLw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjstcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 16:08:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559FMn7G020342;
	Mon, 9 Jun 2025 16:08:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdv7qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 16:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlwfBNB3h842w6BcEjGJNqNlvkw08cHb0eIlwFrRhpgX4rMHdBiMqw9lfW0gq7iIXFKGfrIxjObe7k4WywGxQ7P06iI2WXr9tgiXVANewZcAyfWsfp8mp2U0WvBapPiJ0x9pnAEN7fEcz29m3wzpIZEOq3ilCKXol/KRgGIDX5IJJv6AYiCkmtdRuDvQ0PcQ/dg0mpEi6I09XpXnFp0Eyts/g3SvK42IxOgYi0rAZrPhmdkbeczG5HR/h2hwC4++rl9K8nwGRc320uxlTgELcYi5E+4QqL08K2xpCyeHLJ13LJgGU+nlfOi0Xv3MBe0/3/AFPyG2FRtoCoz6u5e6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NsTnDM9ysZUH9/LQJhOkdVaHXU+7YwMv/LHvgaXhFc=;
 b=mV4uZ3F+/TA9WmMg2xm+/ZuvrRygP27RvEmkIExbkyRl7f3dDR1NvLRsdnTOkj3t7zpUPY/Yr1ydpYySwxvEh6Ma4dPYgbTmEMpMPyM4EhL7h9m3DL9rXldV2hAwfdYYnTzPpg20hkhhx50qTpa8P4swLBsVN+aeXRDXknD5Fo82K/EsNpsMocxRdUDbZiZzgkWCPrKed0LmAcsUzOfwRXiSsS9OGH4wNKze7d4ehiydfVoAizf0m8kec+1YGYHNmeoCugWVE+7giF2/YCgi4FW2uriiEXaizVDjduFEjRUWNd3OzxMMOsJ+ovQG510q0ZGfUHCW6354W3pzzUyZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NsTnDM9ysZUH9/LQJhOkdVaHXU+7YwMv/LHvgaXhFc=;
 b=A5tO0s6WpzkPm8ZVNeTxhDlekv4wdRGHq6nvzHglragwlIp2dXL7PiAMCguUeFpX/rJRMoJh71+SY8ak8hLbdDxXsql/7ZOj33z+93V9snu7r6yszi4X2AxKprfUccUpR07NObPY+9dH6rflhGSEasjRJdOwyp1aVgq+PWlGNGo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB4986.namprd10.prod.outlook.com (2603:10b6:610:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:08:26 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:08:25 +0000
Message-ID: <8302fd73-2b8b-4e41-85c0-76a70c47c94e@oracle.com>
Date: Mon, 9 Jun 2025 12:08:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Ken Milmore <ken.milmore@gmail.com>, Hannes Reinecke <hare@suse.de>
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <9f57e091-8e21-4ab3-981d-962a3d738e10@oracle.com>
 <004e428f-0f19-4afa-b286-c62ff3492a71@gmail.com>
Content-Language: en-US
Cc: kernel-tls-handshake@lists.linux.dev
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <004e428f-0f19-4afa-b286-c62ff3492a71@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:610:b0::12) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CH0PR10MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e6eb8c-5521-4953-3eda-08dda76fdd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGZ2Y0NLVGQzaFY5Ui9rb0d0ay9YeEJCNUFHWWlOQWlTYnFWL0RYbEpvdmxk?=
 =?utf-8?B?b2RyS3ljQ1dqMHpTaUJUYmVXSDljNm1XckRmd3RFT1U0UzlBazZydENRaUxV?=
 =?utf-8?B?cTNQZDF3YXNIbWloNEZEczc5bmVHNmt3V0RVYnpaQ3lrVGF0LzZwL3dETDBa?=
 =?utf-8?B?T3RGNFpSSlBaTHdhTS9aS09FZSt2QWFEdzh2QTk1QWJvYkpySUtrNGhudVZx?=
 =?utf-8?B?dlBCOVl2ZDE0WFB0akNZMU9PNENSYjZXV2kyRTNLdi8xa2ltZEYvM016S2dn?=
 =?utf-8?B?ODd6cWtiN0JwRUJBcEpIVE11c29TeW1qNWVLT0xSYWFTa2MyRThIVEorTFFI?=
 =?utf-8?B?enhzbjhBODJPUHNNVHhIK1hSNlN3Nzl4cnp6YXJmNTdyVHVHdmV4OUN5VTd5?=
 =?utf-8?B?TG9oVmVML1RyeVByNkJrVkNwNUJ6R0NpcW9qOVIvZmNTSjNtYTRobjZ0bUNJ?=
 =?utf-8?B?ZTIzN0lxK25MTTJ6Zk01dHFsVHFWNFlyb1U0cDAwZlVRbVVWaGIyUlZDeEw3?=
 =?utf-8?B?WVFhRDZtRlZMZ2xjY1NiTGVxTVhvNUF1SncwTXdiS25Jd0xUQ0VIVGRKSm9R?=
 =?utf-8?B?NG4xa0cvRHd0NVQ4KzdueVlDckQ2SXZUS1MvSzRLRWNMbE9uUk15eGNyeklE?=
 =?utf-8?B?dWk0THhaSkhuVlpLWTB0NFE4WGw1cGdOb3MvY2lwWHB4TW90SS9tOUxhWURL?=
 =?utf-8?B?dnZWZTZqT3hZY0VmMDU3b2psYmdrR2RFblFqM29XdVBUY1B5aGR2TGk1MjVX?=
 =?utf-8?B?a0VPK21aK2M0Y3p3c25TNUtXWGlDQSt0ZkFPR21vWmFJRWhUUktsdC83N3B2?=
 =?utf-8?B?UCsvUkZjWEZ3L3p3dU5oK3N6Mm43UE4yanVBZUJWd2RmZyt6NDAzN0tLWjF5?=
 =?utf-8?B?blYwV3U1TnlRWnFZcGc1VzRoSmNKYzNORUdPYkhta3NBT01HMjBNTGpmci9V?=
 =?utf-8?B?NU5ZN1VZSmhuY0RoV2lTY3haQ3U5MWk5YmRVbjhVYy9YSjhkcCtSRnJYT25o?=
 =?utf-8?B?TGpDZVZSMWliV2ljcldTaFRYS0cyMkg4a3J5eTN1ZTAvY3FxMkEvcmhnbXlx?=
 =?utf-8?B?cXp1aFVMVDBKR2RnNXZtL042V1pGTGM3dkJlMERYRXRWMTVrZlZzakJVUkUx?=
 =?utf-8?B?Y3dQSkRwVEFCY3FZNjY3OGlJK2dHWWRHUVJ3NTNTNVBRQytlM1JQNXFuUUFh?=
 =?utf-8?B?MFBlVExuRjZCZStsMmk0cHpaV2FtMjU4dnEyZEhFakpzTnZERkxBekNHSFRC?=
 =?utf-8?B?T1RBdnY4c1VIVUZ1SWVnZlRPUmFSWVFSUDhnR2UxdGZQdG9DOG5YS1BpMkx6?=
 =?utf-8?B?TFdpaGV4Qk1aMTBaVStybFo3SnlxQzhxelRjUGY1Q0d4bEVoZjhoQS9rZFF4?=
 =?utf-8?B?S1NIVGdqNTRjaVdzcjN0Vkc3NER1YnNsdmYybVdSRXBtTUNTTXpLZi9JbG1B?=
 =?utf-8?B?cGlVRHdPR09HTXdkWlFRcG1WR1hJbis0amJ0MitDRnRtVThaU21RNklNVmpE?=
 =?utf-8?B?MktnQTRMMXA2cXJGdVdJbWZuUHorQTVndlNKUUpBdGhGV2hiK2JIeUdhVTdW?=
 =?utf-8?B?bWh2U0JUU3ZlYVVMNTZ5SDlmRk9yMjZMN01PbEtJSWxVK05UdElKQ0VWMERw?=
 =?utf-8?B?QkM0QTRDWHBUb0h0d0hSZUlQbjZ3SmpSaFhIMzVNWHBhZ1dqUXBibU56bmVh?=
 =?utf-8?B?Y1pDWHpFTzQ3cWpoeGtKNHh2VHUvYkp0Y0NEV1d0OFJvVk1RWVZNQkkwWnlh?=
 =?utf-8?B?eWVhK0xUZzZtdkxGRkRIU2t3WEZja0NaczJlNVVhOElBUFF3dWtWYndMQU5U?=
 =?utf-8?B?NnkxOEVNOGRjaGo4NlNuN2h4aTdCS3RQbU16a0tOQ2kraUJveW1DVlovSUlJ?=
 =?utf-8?B?OEdIazZ5YUlyMEN6TXRvVm1Gb2NnYStjMkg3VzJSSk9yWHJSb1ROTTFRTkYx?=
 =?utf-8?Q?7ZCEJmT5iqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzE4WnRYdnNRME9ubTA3SlhIVkQ1SkhReE4wSjl5YkhZQS9sdUNuS1JNRmw2?=
 =?utf-8?B?NFd5NFM3emVvSU0zeHcza1lBbFM3bmpmalFIRnRscVJ2VDZWRisrVDVZeG9i?=
 =?utf-8?B?TDczS3ZIcnJBUnFGZ0pUWTMzcnZsQ21qbWwzQWs2QS9kQm8xQ2F3WmRaTThU?=
 =?utf-8?B?ck95dTZVeTVzeUUrcVlndjFCS1BpbyttQ0dTTEFjdVpOQWZncU83ajlHQnRV?=
 =?utf-8?B?WmxnSXp1SE1Dek90eWFCRmVpOGlpMkErc1J0M2lMZnVzT0ZnMDVKWDNrYUtt?=
 =?utf-8?B?cURCSjhtQTF3aXNJM1RVb0pJbTA1SWtlUlVMUXdNTGZPWlYzdFJ2VStkWGV0?=
 =?utf-8?B?THNxWFhhOWdHaDduMUlpNFlmUHk3MVU2ZUFYNHV3MHVPNk1DekRLVEoyYTRo?=
 =?utf-8?B?eCtVMkhnS3ZPUjM5NUNBbHBLd0hlYXpBRytmd2Q0L3kyZEpUd1J1MTMya3RL?=
 =?utf-8?B?ZFhHUGQ3VXFKRUFBWUQrdHVKV3REeGhXSWpZT2dvTkx2NGlFT2pWMis2Y3B3?=
 =?utf-8?B?UUtKSURBY3AwSVZjcFJtZlZuZnR5a0FGUTBJZGN5aDdnOXYrVnJ2a2lramNI?=
 =?utf-8?B?bUhGc051U2tXT3U3U3g0aW4yUGZLclhVV0poYjBpbkRCeWlFVmlJZHNuQlhV?=
 =?utf-8?B?QmJST0dlNTBsSDJOc01FTlZCODkvb2hkK2xWUCs4YVp1VFV3Z21Tc21yc3pN?=
 =?utf-8?B?S3U0TVFWV2JvRzY3MUNLZWZqb05ObDY5RTA5ektFUGh0QWpzV1c4a2xhUzlv?=
 =?utf-8?B?QjZQSk50aVRTenBLNGM5ZmVyMytSZWEvNlZzQm5zYTY5RDNObVUwNENPOTQ1?=
 =?utf-8?B?Z2ZMMUMrNXNCd21oVCtxWWhhcmNlNU13bStSaXFoUkhGZ2VkYmFXd0RCUmpC?=
 =?utf-8?B?RWZPVTZTNGN5UGtxWEEvTExPZm1Ra2ZGcHZiN2ZZbFlvNTQ5QWJyZk5jYTBp?=
 =?utf-8?B?ZldmNzMzQlBpN01Rai9ycXpZTG5idndFUTdQaG43WEpDRlYxU0F1RGphcUdU?=
 =?utf-8?B?R01IMm1MYWY4M3lZd2F3Z1YzRWtsRGZVbjVoL2JNTWY5ZVBIYWVnZ205dWFk?=
 =?utf-8?B?MC9nVHNGUTQzZ0h5T3hmOHU1a2VBdjNzU3NhMFdJVENVb1FnZW5TbTZaam80?=
 =?utf-8?B?M3Q3eEpER2ZxUm5YeXVHd3lTc3VucFFtaHlVYTBaeVVFc2lMbUFFRHc4YU42?=
 =?utf-8?B?Tnk4RVNHSVJCYWhoWXdYVTJRLzhvSHhDUEJRUHhJR1lEOWdwRGVqTEd2emE4?=
 =?utf-8?B?RW1nREJtR1M1d0o1UGxra1FZM1BLWFV6R0lLSTBhMXIyYS8vTlNWcmlIOFh1?=
 =?utf-8?B?ZnhZZlRIM0Q2WlBQQ293bE1Vd1A3VlBjQ1V5b0VQR0lzWnNuVDhxUDVyOGJz?=
 =?utf-8?B?c003c01razNiK096ZUF3dnpoTzllSGRlUWxnbGh6S2l2VDVyd2NZZE1hSGRo?=
 =?utf-8?B?YTB1STFMMlRUY3JzYzZFL3B0ODZHZlNEYWZ2S0JjSkZXWlJCeW1EZmlRTURE?=
 =?utf-8?B?WXVBMUZjeTJpYmZxWUd6L1dlaEo4L3d5L28wc3dPUXpib1RjSHdsOEcwZ0pT?=
 =?utf-8?B?dExMQ0ZDRTVoSGJKTGZYZDRMUldBNzl6RVB1MWVUbHcwbmJqbDV2QS9UYUlz?=
 =?utf-8?B?NUdRY0djOHNTcnlRVjYweVRpZll4cUFlV1c2SzFhMVlIWDR1TS9maFNOUDFP?=
 =?utf-8?B?U3FMZklrMmJmb1hNRE02T29Xb0xzR1pPdHBESXRiZ2xDcW44Ry9NSXY3RVVX?=
 =?utf-8?B?YjhpbDZ5NnEza0c3S3hCc3NDWlRneENhcENjYUFNMnZVY2Z2YjJRak91dnpw?=
 =?utf-8?B?alUvaGZVZnRRYnNZbC8reTRjdlBXUTZ1V3NGZlJ5cThQZDF5MkUyY1pwb2tJ?=
 =?utf-8?B?bnh4RFBQMnRmd2lHdUNjTlJWbThWK2FNbjFwRm5vVllDZUx0TDV0cXpUcGJ0?=
 =?utf-8?B?aFNIWk9RNCs3SDBnRWRwMnV2NHc0cVV1K1RkeFBpckY5SXd2cEVhVmMzaHRr?=
 =?utf-8?B?RmVkVEhJeDIzQ2Z6S1pOVXJ0YysxU1JLYVNPcktZVE1UVVpZb1RWWSt1N0RV?=
 =?utf-8?B?VmZBeDZEUmFxTW9tTWUzcXFQREhyazJPbXovR2Y5NEdtQ3M4M010R1VJWVlF?=
 =?utf-8?B?TXJ5TTcvbTl2M2wzSm02c3UyemtpOGJJaUtYOGRGd050aWk2cDRVTkpZemJx?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	allrvuhHHZn4z5lnAue2kLtmgbl4fEvJkqHMzJceNRpM7FMXGKc038+DjyaYDRMOgMayxal/zLnN8zj0vabQd1tGacPvMqdGZWiaEy0MWoTyYxyjKTybe7q0m9+hSu+pA0b4TTAC1+Oxs1xvi61Fyuh+x046KjZ4Yk3MT1znofJ0r/MluHxzQyRTLxkLfaQZfjNq8iBrHRDdVxo9+eXiFzkqHD8hc8W6g3MPsui3hjFr8eUW+31X/VtGPJ2Gv2/isFKk5nIImQE8A6CJxQjWdpKrULg+PS3rc1wdDwoI/6B+WD8Zu90YzJCgYPLQY8Ynw2wlDB/QY+whPr6Xj2PH742Em1O0TvvpGBVbPqfdz/ihB+paPlilzX39PaMtK8euwaO5dc5CIG9PExMZXVlCoN/cGOsTYhn+8Ar+DYHxmqhaYEnTIkj+X8YJXc7GZUOLTZDMM/ThzRrGRK/fs+zHOscSlleR5vz6zPHdBzZu7DjkkhawdW6z+ADJGdfXC3/fJWqRNYhJx3LVEwFdLZULRorGHXbUPne3ts30Ssb/t82lgGlruyTBQO2H49AUAjvknkf6s+EiD3VmYupbD/aWplyREdMPY/ZQ0wVrSRMc5C4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e6eb8c-5521-4953-3eda-08dda76fdd76
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:08:25.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNZ1BhycBFxfNMl7bfErvu7EXEVJJugLS4/xQ4DobWeQHzL45ka3WcIb0YHj5LBxy7jh1gmtnkD5iRpTDht5FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090119
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684706fd b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=6DNBQvRp52xVfmUe7KcA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyMCBTYWx0ZWRfX/U/C6K9DsSmp 07QYqNEALNxxyNiiewgtkfc47JK300g80+TPnthZUDcuNn5U7NIgMKGPmzo8f+xpESRjbugEej9 TykFOPJbx61znQ72qHjfBav7ttyqRn8GRRd51wuyHaMsFX2XHid3Z5wDxYxMPEpUS5VXPzGd2C3
 BuPhRXxgWlqwmYubuMsgWifC4xI6p7dUt+Dc3llofgRJpQ2gRs90sc5GJvXEckkU5LNZ+dyI28+ ozf7/VLveEU7G8umz4/MCbCs7szQ5aPugXA8M1cdPvRKPVyEM/RTm12xMA41P/lgez0oShivdRw 2oOSo2zziUOsJyvgtwpgEJTDfleFTkG7jGIkEkD5tIODSB4IdfT77pfMXBnmXZbAfgpVZl6qDVy
 7Er+8r3UUK0jxZ6OQuOkcWJ0OuyzYl9yCQY16ccw17JaeUKBthZIaw63EKLvUd1SPihYkZE/
X-Proofpoint-ORIG-GUID: Ps6-xCR2mlZxX2o4Xr0mjvZLdAcKHGQv
X-Proofpoint-GUID: Ps6-xCR2mlZxX2o4Xr0mjvZLdAcKHGQv

On 6/8/25 3:08 PM, Ken Milmore wrote:
> 
> 
> On 08/06/2025 19:03, Chuck Lever wrote:
>> On 6/8/25 1:42 PM, Ken Milmore wrote:
>>
>> Needs a patch description. Why is this change necessary?
>>
> 
> I find the varied allocation policies used for members of tlshd_handshake_parms a bit sloppy:
> 
> - Some of the members are pointers to static singleton buffers outside the struct (peername, peeraddr).
> - Then we have remote_peerid, which is an in-struct array of of key_serial_t, size 10.
> - Then we have peerids, which is a dynamically-allocated array of key_serial_t, maximum runtime length 1!
> 
> This inconsistency has no obvious rationale, is very confusing to newcomers (me!) and is a banana skin for anyone 
> attempting to audit the code. This seemed like a bit of low-hanging fruit to tidy up.

The kernel's handshake netlink code can insert up to five peer
identities into a handshake request. PSK handshakes only support
a single identity, currently; but I recall us discussing the need
to eventually handle more than one.

Hannes, do you see a need for tlshd to handle multiple identities
during a handshake?


-- 
Chuck Lever
