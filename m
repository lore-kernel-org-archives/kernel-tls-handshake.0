Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B7242930
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649753; cv=fail; b=eod7Bd4MRsgPgoo8EASkQQrMKnauufp/ug0q7kDyLk3NZxyC+NK+K5qNrSI5BqoLE5VHu51vKjAsNFvaeZVD9mTpAIvmKD1KSPEYW881L2p2rf7Ox/ze2iZCOha64KfGgXDhzyu5AFInm41Z5IJrci0+7C1F1HHsy3pxvN/i7Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649753; c=relaxed/simple;
	bh=nwKO4NxnWAArhO8ADMbSjmvUL6Wz8il3BBOhWKOorqo=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jIsfzdj7oJQjhn47kXVXKaRRmS0cWMJVSEtw2Bh/oyJHNyioWtIUzbE5A33ebJKIqQQwDguzRhy7GVym2qf3PgGMzLDcLnvYgBQ7JR30PB3VlSqNV/5J4as+ukPqaYXhxYo3Tmc2WGTJMHXyv50sxfmp/HgvgxrV1c7udEpTcgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o4ANZfIg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KxLjp45c; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o4ANZfIg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KxLjp45c"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCtaAr002709;
	Wed, 11 Jun 2025 13:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5cqXqbP7rrC3Ff5/T23JZcECfHKjb07nKLbo66kyEUs=; b=
	o4ANZfIgQ8FuKMCe65asb7cAUdt+JOvu08WsUL/08kiezJ2covGvuqJqVasp7dhS
	GLswiSthng0K/fC9u+OZ8CmmhOyGnrMSyaGbstUQZONhH4rwxZK+si89pk7L+rG7
	r0ZdjYDV6IP33kpzN8SSiWbXqEYeRT1aBKd98whH7yzr79Z6s3hCK6YBAFTQ+rX8
	mDCKxqRO03e9iNby46rUlTG6ln1Ves/TI+LhWOnmJKLu41Ys/MEJ0JoIwxDs6DdE
	wEVr9PPByLY5XkBwrfNU0f2ypD1mKO607HwJdozM4j7JCHq4JOV4ONVS3n990Xo/
	qRmz0VJPir/bjrDWNDs69g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74y0w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:49:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BDiDBU020413;
	Wed, 11 Jun 2025 13:49:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvgekku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZFo3RIMvwrtC3LTG+vzvpbGfbk0NQXQ/vT18sOWREDa+PMXioNC9Z3MRS15X4ixylDoSU+Z32FCNniCzDGRgBUQLNmQYElh3P/sO0qf3f9k2PSqxJk8zVQWZJTMM75RHDhRmWozh5lTirnMhtFXmrGfCtY2apyl4/NwvhofX/qh0VuvB4TewwmgRpXEJuY9ddybSkXBFdvOtx+IyfY1UQBXG99VrUhMf8vkT+Zn49boWqrAATsr/CifHVXcin0C79IlFOshFQZuMbY0fBmbD/Xn0LwFD+EusXMysa++rgTBf6y//VjV5qN53d4vT16FLxRjBhS8vHjYNT+/1qilLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cqXqbP7rrC3Ff5/T23JZcECfHKjb07nKLbo66kyEUs=;
 b=gYMgZ9fwjlOpyV302RBHshINmpPHAvPm3HJaYhR1i7wnmrpucMM7vX5lAEVkikZGjvvmo1kqkq3n7IOH8cT3W/1A9dtxdt9gSprD4gEfvnkiQQcHTjqkfhz5Bn/O0v35GRGHWSKhZxVIxRRGbXikEraN2j57/877TDIttZ3ZOG4Hb3LwFIqF/q7AXpapkZXlXF6791BUhxtNL60YOjJBjQpzSESb6RkzC7YDlI0wKe/Ep0DvWbBDIrj+wIQBZIr2+3SiazyqZ//k9KoBQrO+FlwUrug+fSsV4IoNMKe8GzknktR/GvJA3tmoxwtvX8lHTLcM67gAvuhabGHOSg9emA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cqXqbP7rrC3Ff5/T23JZcECfHKjb07nKLbo66kyEUs=;
 b=KxLjp45cdr5qHzjC2WGBg21Z6v+5hBv7rao/GXebM/CpLr1lVyIcxEpF4bPgCPMDxohMf5+pd5xogSuirjOgjd43aGaTOOuugEnWi2eQtCA9IaBAP+ENFKP248ekc0jDTJYJPMqsVM08nv7z6p1qhtMIrhnx96Jmf39qHwtUW7U=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH3PPF55F79EE4E.namprd10.prod.outlook.com (2603:10b6:518:1::7a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 13:49:06 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 13:49:06 +0000
Message-ID: <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
Date: Wed, 11 Jun 2025 09:49:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add CRL checking to server and client
To: Long Xin <lxin@redhat.com>
References: <20250611070943.235087-1-Rik.Theys@gmail.com>
Content-Language: en-US
Cc: kernel-tls-handshake@lists.linux.dev, Rik Theys <rik.theys@gmail.com>
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250611070943.235087-1-Rik.Theys@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:610:33::30) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH3PPF55F79EE4E:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7ccc5a-da68-427a-d68b-08dda8eebb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1k5VDlxeHoxK1ptbytOM09DZFR1ZGRhTHJqU2JYWWJSTXpqc092a0c5cjBY?=
 =?utf-8?B?MmlqUXpjWkM4SE10VHNUdmxBYlY2dkRTeUpVUFZQVmxLU3ozejN2MFVmb1px?=
 =?utf-8?B?bUY0bjhFMWZLajR4SjlyNEI3aGlmczR4Uk41U2RDM0VLMHV5eTI3em5BajZ3?=
 =?utf-8?B?QmR1NzlyYzF5M2tOeGhOZTJtYzl1akYrUzAzNDFySytXSEVtaW9pZ0U5T0NJ?=
 =?utf-8?B?bG1FYjE0bDhuV2FZNnNqVExpK09NSEVDNG1vaVVVcEhyMERVUTNkeW94UFZk?=
 =?utf-8?B?RUpPUXZlNXFURlYxNG9mWnMyL21zZjhOcGU2TzFrTEU3QVdjbU9mQzZOL3Zy?=
 =?utf-8?B?N29TV2ROQjJmMXZtUDBRakpKSVllelhGMGdFeVhnc01mZXlBc0RTYmZLdVZY?=
 =?utf-8?B?SjY4NENpTTd6R1lRcGxLWFdCUkh4ck10dnVwUzFSdWR3YWF1eWF3OU82SVZk?=
 =?utf-8?B?UGtycXYyQjBPWTZqRTB1bThFNjkvOWkwSlJaZmxsNFVMSHpHNlNxa0N1S3NF?=
 =?utf-8?B?WEtUaTI5blJ5cW5mVDRvd2tTbjNFNHQ1S2JUbEhOMEZFMTFKbVFzM3VwTytl?=
 =?utf-8?B?aE5jQThKSkhieFFwWGJSeFlqRm9jTzYrVDlVdTA5L1Vjd2drb3lSNXAvRnJP?=
 =?utf-8?B?a1FyTmZDMHpjdWZyL25ZT3lmdStQUXJLaEpBMzhZTldncDVhR2Z6OG01dGR5?=
 =?utf-8?B?bTZWWEhVQ0JRcUVldXJReUFUcWcxVHZ0TzR6SDVWQUo4d21DRlFtWmw3M1c3?=
 =?utf-8?B?a3hFNkpDQlNNQWQ4SGliaVplVU1uSGxCTmV5K3Naa0tGbFVncC9oVW1na1BT?=
 =?utf-8?B?YmtGam16bUhjcnNsR0tXcG5VV2phWlNNSFh5VFR4eERCTjNjSVBWSFI0bGRn?=
 =?utf-8?B?YnhoNndKbEQxZlF6Y2RQZ3BkNThQMGtreXJLanMrV0dWanRBTHgyUE5ja3Vs?=
 =?utf-8?B?aXU0MGxlYkZuVVpiWTFmRDZ0U0M2Z3EyaXZxb1hKcWpNM3RMQ2I3K1o3OGpN?=
 =?utf-8?B?ODhHZWtmMXJuT1NlRUlGbVRiVUVGRTU4bHRyenduMFlRNmh0bVF3R3RCcWlX?=
 =?utf-8?B?N09KUHIvMXNnN3lubU1aNWZ1SWhhZC9qVUZNdkJ3VFVtRGdGVnBMV2llbkVB?=
 =?utf-8?B?L2p5NFJhNnVwSmxqcXZjbGYyWmhLczA0RDRrNjc3SDlFUmZaWUpYSVVueCtz?=
 =?utf-8?B?bURqSmZ0a1dZQTcwV2Q0RnUzMlRyb0ZxUWZqV2RST3E2WVUyVDQrL2FXc2w2?=
 =?utf-8?B?clhQRnpnTGY4ZUpCcld1Mm9FVVJYZDFBaysxbnFTaXdmK3RoUkJnUDhQR1hL?=
 =?utf-8?B?aVRpWmxPcWhHV1FhTUtIaU82REM0akRHSHZnR1BiUm5pempoQjhBMlJSVzNH?=
 =?utf-8?B?cnlrNytaSmRZTE8wRXdCUjV4QzljN245RGthUFR1WjgwTXBrb3Z3MmcrNnZG?=
 =?utf-8?B?d0Q3SGVBaitxeVhJdHlML0EzSVNVeUluZlo2R3AwZHA0Z0RqUnZpdWVpbmdr?=
 =?utf-8?B?L3ZPS2hHUW9JTjFMa0FPMnM0ZTdDZUZhUGpvYU1lY1JYdW45VVE2a2ZOR0hH?=
 =?utf-8?B?MlRuR1pXQjhQYUZHaDcyUHF3aVlOa1ArbE9WUlpTWmwyS2RIbmNuSGxCdEw0?=
 =?utf-8?B?aDFqWDBjY1gvb1owcnZYTmFpbE85NjJFQUtMUnhmdmF6SGVCQ3pKK3o5WGhG?=
 =?utf-8?B?Wm5uZGZ3ak5Qcjk0YU50UTF6dFdrSmwxOGxramV1TkRCbmIxTXJLL0tqZWdI?=
 =?utf-8?B?Rjc5VHFneExGeUJhaENkNUM4bG9YMDhUMW5OY0ZFNlhtM2tsamF0VnlYRzhQ?=
 =?utf-8?B?WEVrYkNSK3VpVDA3T0tpN3R5SjVVa2RwdDF4K25mZGlOMUJTeDVoNDZyb2tD?=
 =?utf-8?B?OUxXaDhRVStYMkpLK3ZVVkxFTmNYaGxXL3p5ZWQzTEVacTNUTlgyWUUrLzFZ?=
 =?utf-8?Q?4NNW8g1qwss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTZlS04xQ1ZOV09KZWZqOExxNGJrRStaWFVNU09mQmdHUUYrWlZwWU5nNFd1?=
 =?utf-8?B?eXZ3am9TTEhWZ1BjQXF6RVllL3R3YmRCUDFIQlp3NTJBKzN6NFFnbjBDOHA2?=
 =?utf-8?B?NEVDK1RMTWRad2FoSjhSN3NYS1I5TzgxcGdxVnhBSzJwTE5jODIvekdwbjZF?=
 =?utf-8?B?dVM3UWJzTHdGUWVGMC9qd1lVV2NXZUJZVy9pUUtVVVRkcXpkdGh1Q0tOUmpP?=
 =?utf-8?B?S0JiYlgzcmFHN0E2ZUxYd080QnN1VVhMMm5nbmhrYXpUTHh0ZG43alYrMnNQ?=
 =?utf-8?B?OFZ2UjNqampOSVg0UUlLWkp2UXRXQStGTjMwMEdJcDVSLy8vUEpGNW93QlZ3?=
 =?utf-8?B?eS9MM2hvVThXQnN3VmtNTk9tRWVkUThHOTlJRnlYSkFicEQwVks1M25jTG9r?=
 =?utf-8?B?Sk1yS29jM0NoQU9kOXJpVFRZUWFUYmNzUms3NjUxUVE1UDdJRWV1M1dzSDRU?=
 =?utf-8?B?dUlINGFkbXhvRkE4eWVXNXdqQnVSa1NUSDlDNmZMUFdFRzNKQ0M5dEgwRkZj?=
 =?utf-8?B?MlpOU00xR05VZ2hpZTNyVkZlZUFBQkVGa21ybmRzUUtwQUVVYlZRT3BIazFs?=
 =?utf-8?B?L0xiUnRtZWRTZjVjcVEyOG96OU1WMjFxRHd4ZUNNTzlnRUhPOTEwNEgrMnU1?=
 =?utf-8?B?TkQxZVFFRnM1YUVNdktiRGx4RWhscXlKNkduTm9FU3BYdXE1UVl1N1ZNTFBH?=
 =?utf-8?B?N3V3YlJrUHAzcEJwS21wMGsvcVdzU3dkODM5MWRuMU11NWltd1M3L2NCNXkr?=
 =?utf-8?B?cE03TkU3M0t6MnV1M0lSd0FWQzdJbHk3eitDSDVmZldVSXQ4RjJ0bjJYNlRR?=
 =?utf-8?B?dWtxOVhpVkhvVHkzaEZGbWNKdkttZlNLeWp6bFFjc253dWxudFdySVB6MzlN?=
 =?utf-8?B?UFRwRDlBWEdZNGlnVEo1S3pVaW8yUEx0YUtRSVBDclk2WUZucDNWclB4b1pY?=
 =?utf-8?B?VGFyNldyM3kwREpNbXQvVEVVYVhvRTN3V1JoZEZyTVBBZmNWanFzeGZSOTFy?=
 =?utf-8?B?cWoreXRuaVlVQ0hsdVQxUG1yMnBPTkFseXVHT05KWkwzMkRkblZjalJWb2Ra?=
 =?utf-8?B?Nm9uNHpjUGRFd0o1RmE1T0JGYTJXQmdoZnZidUlRdFI2OXhpQ2VQTmcvdnM3?=
 =?utf-8?B?WC9mRDlmMGhzaE9CTVNSUXB4UGZaMEdGRHdSZlFGWU5SSjU1T1hNaTdKays0?=
 =?utf-8?B?bG5JMmVSNG1wV0lHNTRJbTFHODhnSE1xQTRrOTZjcWNkekdqRzNhU2h0b3E4?=
 =?utf-8?B?S3FpY1F2bmFFMzB1K2RKNVQ5ZXMzaFFaWWpBOWw1RURkTnVQVXh5YUx1czhE?=
 =?utf-8?B?dklYYXNndFVLdzBEWk5xTUF3ekVaTVFDM1dPbGdIMURjSFgrc3lFMjJ3SGpU?=
 =?utf-8?B?NWZrQjl5Mnoza1BZYkJoUjhIR2MrYTBRaG1ObDY2SUZROUFUVU16R01EQUZN?=
 =?utf-8?B?amFTTldhQTEvY2hBdXZCY0R2aVUvV25wWXdJVVgyNGtPUm9EQVk1V3VDcVNK?=
 =?utf-8?B?L295YTRPNk9RSU0zRUx5QThtZkdCME85OUhUOVk5WFY5WEw5TDd0Q1FnZ0hi?=
 =?utf-8?B?S25WRUpnOEVYZWczREloaElIYkkycThMTm9OZlRJVHNqSmhBRFQ2RlZ5QVpG?=
 =?utf-8?B?QXJoakNudnI5eFpkS1lWT0dNdUFVYmNZeUZybWcwY3lCdC84dWFxeXRaamh6?=
 =?utf-8?B?WXFlZjl5dGREazlWdnkrRXRyejZJZ3dSN0pKV3E5NFdFRU9MMXdHMjFYYzZL?=
 =?utf-8?B?VGpmandsamlLdFlKNjA1aXZudmtkNGdoQUtGUFZpQlJ5YURrSlRoUE9lT1c3?=
 =?utf-8?B?amV5QVB2eEI5NGx6TktIL1lQMkZRR0hxRzd4akJ4aVFEelRBVnUzbFdHMTMr?=
 =?utf-8?B?YTlKR1FadEFPOVdSVmFUU2lqejhQWFJuN3pCUWVtcVZiR3AvSTErUmxiOUxv?=
 =?utf-8?B?Z0ZsV1RzRnI0MlZXZC91aHc4TW9zMFRxQ0NkNWNmdEVGWHVFZW4xNXBIZzk0?=
 =?utf-8?B?azZsSXJBd0FFd1JkUzkzK3Z2Y1BDVlRzRnQrZDZoblJFUmRkMWJNNXNDblZV?=
 =?utf-8?B?ZWFLd3Q0QmxMZ0VIWkM1Y2tNcFBBQW5vRHFYNVNKbzY1anFmSDhwQmdDeDcz?=
 =?utf-8?Q?MlN+Ju0wKJ90K5csWaeEQaq/9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	azh4GTnjjy4gQkZJRqDDmAVNkDMQuFNMhdHwvWZW0M6ZluD8f87crevyWlGx4UorK8lJx7M2QX5kZu4WRPdjc+DZksIiyFizNT4KZf2LAm89CbpY028CEBuMBGDAc8pxfJbQNUvcyehohBrpO+9v/efFQdYCqvaoRvmLDQz/LouclSieun54ZUTqU4b5KcZ8e4i2D9dU6CB8Cudv7Et4VpBSquvLkLmqYpC9jb9GJVN6/KAS7ArmL3t0fSIQXVxHG63Z8Y44uhQbatZs7t2HEbQ1KLiV1l6i44iILTZs1hh4xuVPgcOJHs2gX/7iaiB0ZM+tN6ktMHxcKkhDn2h8cbjxM/5NwWRxPeUZIZtYUUM1zZHeCNrru9vRb1cbu5Z9lM/TnDLhnR6niDOu3DVRV8LG5l8n/AXIsCocYgpxqLqZus588fMVwBfJTcngfVdEui1UVp1BfJAE5+KBIaubfuoOogO9DY1UPgO8L/j4HVCK1C5Hq9gNoo3RfWkVlOapE8xZESJdSXkKBobd4oARScP07Z89I50RGZ2R4aiB5k6MXZe+g8UYrNG92yvspdJxKl7m1djbeKbCZobp90CWl5junvIEJkg7fsO8Dz0s5bw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7ccc5a-da68-427a-d68b-08dda8eebb9a
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:49:06.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3vrue3BwpvtKLZ4tE7eqjykuigS7HQXf9EEGHvWARTx0e7I+RG08+IvOVfyz/uECp4DLtlInNSs1TetjAbAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF55F79EE4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506110115
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=68498956 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=FpAZB63EirVNIshsCzEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: BR1gY0uGfuzE_zGX4kd4fmnjDtnoujXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExNSBTYWx0ZWRfXz3oDw79auvak 2CVAQonoqsn6GRH7ZoTWj0WStBt/5tPiA7g7sQbS/EczHYV32hlLmowVssPCzMlRNxRZMGhM8Dg CudcC+hW2zDkfqQcPE7vazNnlTt9jAX2Q76Z9S3gL7oequyXAPcl/gfDyn595Kd2CL6zw1y/a00
 gRhY8tKTBKNV0zlunSYzdjuuyyykPivgs2adQiknlbBZqbgjzq8HtYT5clckjMbcOoLbQEJGDDF IrZN9kF5pB9FPYW6K3GtnawXYospCfuyYEfyTNvh+UWx/Zcti2y70rsuaV6iLac0uTACIvaAm8D ZlgYOsxOfFX2BA4A7f55aLvGfQnHp+NL/1RApsaG8nH/XQobYsIqCM1RCjIYsJD4bo9qEXDK3xb
 wUO5no9JiBmC1f3QBwlTngBU6ZACiUETrUkVh/dHoUJvC74cFvAoGHdRVqpVmA1Wx5PPML18
X-Proofpoint-GUID: BR1gY0uGfuzE_zGX4kd4fmnjDtnoujXy

On 6/11/25 3:09 AM, Rik Theys wrote:
> These patches add CRL checking to the TLS client and server code.
> 
> It introduces an x509.crl configuration option that specifies the
> location of a CRL in PEM format.
> 
> The CRL (certificate revocation list) can be used by an administrator
> to block access to certificates that should no longer be trusted
> for some reason.
> 
> See https://github.com/oracle/ktls-utils/issues/103
> 
> Rik Theys (3):
>   Add server-side CRL checking
>   Add client-side CRL checking
>   Add x509.crl option to man page.
> 
>  src/tlshd/client.c       | 28 +++++++++++++++++
>  src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++++
>  src/tlshd/server.c       | 14 +++++++++
>  src/tlshd/tlshd.conf.man |  9 +++++-
>  src/tlshd/tlshd.h        |  2 ++
>  5 files changed, 118 insertions(+), 1 deletion(-)
> 

Also note that this will need a similar code change to the QUIC paths,
eventually.

-- 
Chuck Lever
