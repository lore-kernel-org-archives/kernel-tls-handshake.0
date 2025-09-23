Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE727464
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655139; cv=fail; b=ge6Xj7EXO28AcF6ih7dTEZcMnb5fiVD3pWvlObZJfcatJ1WlXA10BRPm0Mrp3lIopJdve6e0qg+2pcXo+FW/4hVWZTfCrTk47wH31y+MxokUE+ALu5ldCES2MmuaWfLA+4aw88Cvyf8AQQlcdiTGiz23crDo3pegZXAilMZZTYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655139; c=relaxed/simple;
	bh=ggB0A2PJ5f/mGb+P2lxMJF5JFy5E9y0gqfqajxjTQz4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KMbz1dplh8r1chPR5Fui6Avj8wHJj4tV+KkRp82g/Te1TmZPE5bBsKrb+kEESh8HiUNzWkX5nKFHAhoQM70wudAX8VDcj0evj8M9M1A5Lnu8LFs/+2+OirPBVRV2ql0gtegV9d47a4/qNPXGGtQLvksJWDoK71KDqJRcV11ksgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cyl/Q3Su; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gUV32TJz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cyl/Q3Su";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gUV32TJz"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEXqTX005128;
	Tue, 23 Sep 2025 19:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CJO/YR1W3cc/VywZkMrJJDq7m23BY4e+YiT0/+l1JS0=; b=
	cyl/Q3Su2ZvAvo/e6Adiy03qtmGbKIHbrcCOmJefj2rckNDR1APD9XbxjSbUWDnx
	w0lIIZdTUwvhEgg7C6kw/NhVZB0eyaUsa81tfQmVvfE7BtbcX4KmfnSYk6isdkmB
	02cxog7vcidotE/YDwEYD/vWoPJgF8mxzCjJHUd6qtjEBXJqXxuW+NpA5ZD7CKj3
	qnbd+w2keva8eUTXtt3llYjyU4CHxmS0Aw8l0Cid+EdHrN2bGpIwSJshI0xE+Que
	/Q9uyF2RD8ANu2CDkuN3gEmMcKrb2SmJfS1YWGjCkyIdP7u8oaE50pwpSD1SFXH7
	izGF6ofJtS9EupqOWlmGBg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499jpdncg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 19:18:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NJ3YFm028350;
	Tue, 23 Sep 2025 19:18:55 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8w6e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 19:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbzY+zYLFvrX6NQ84t6wdERSKgeYG4po5xkOdjlBmUW+3ToOTP39oK7MrVBRVzV6b0hBzWSKoimUymx6N3qM+lqhDypWZzZRzxGYNLS5w8IBFbHiOM2N+5ZG12FNNogl7/+eEg3q9Qp4LML9/sevV+Bvrd+IM0rQv2F8xrgfD1dneT1QsgMx8thxIeooBgtl3W7caQ/raxWlki3fkCRyCPn/lAI1nzzpkzRlgFE4rPVb4kg90l1/YT2XUyS5YTHXiUBP5SSjm5f+gBln1zCQqCWiWhdnQPaK4c/WRIoWsldHEfawm209DDiO3vfLh+/vMoNtu2LlUTNvuOIpuFxAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJO/YR1W3cc/VywZkMrJJDq7m23BY4e+YiT0/+l1JS0=;
 b=ooZ/O659mqnbNYsGO9gpBmhaIAqYjJuRPR65BbLVGbMMqPq+1F1aibR8WyWvXyqjHgx12jD5D2ATNnwjD3m/eFnzmPOqNI2tHk5QVkFZD/zbm4ZBsH33XXPjXTuOO2GsG8MoTIV6l35f8DUByrvG9Z9oGbsywfYZN6qhtcrDWMCCuiVlWNzvEV+qbE4sRcNpLR1tUo4NHCEvwMiQDfOTYBbzr+9r7phW1u22YjCAzyVbgcvMNMvyr2z3Oh6jhSDFsUw4DU/zFoKoRwATkrURv9wS/7ICrZboXhV3BpvF6+at8IYiwkxGgImkybTtcjgEdLBRr8mrP3isIZecAyaT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJO/YR1W3cc/VywZkMrJJDq7m23BY4e+YiT0/+l1JS0=;
 b=gUV32TJzVSufEsLG+G57lmyDBJ01e2A/cb2dxZrM1GzBc8rjlXsOXNWkP0l5l0xZUHcw8agBxgJxFlNOXrlcUoGKkEXi0EZNJ8WRm7NIEPt7eQoy61EJ3+h8E3euGx+UHqRdnccy7AsHMFlbJeFoaWYSeNhCFg4MZGTqLmUw23U=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BN0PR10MB5173.namprd10.prod.outlook.com (2603:10b6:408:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 19:18:51 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 19:18:51 +0000
Message-ID: <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
Date: Tue, 23 Sep 2025 15:18:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Xin Long <lucien.xin@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250922220710.1255102-1-cel@kernel.org>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250922220710.1255102-1-cel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:610:e7::24) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BN0PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: c512b1aa-9197-4e7f-84f2-08ddfad6077b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clpWUzIzMXpEM3orcy82a2ZDSDRjVXpEWUFmNjVXT2Mvb1c2MDdXUXgzYzd5?=
 =?utf-8?B?M3NrTS9MamtvMy8vVUJVVjhsK0hHMUVwcnI0VVhza3lYWWZ4bU9WRjJlSEdV?=
 =?utf-8?B?aVVQQktHTkFBb0RCN0tYL2lhd2tVc3VocEJlTlBTSXhQZHJQa1Q5U2FVU2cy?=
 =?utf-8?B?VzVtc2tta3czejhQRWNoY0NpeWZUQytxa3B5NjJRUGVwSHY3eHpaaWtXc2wv?=
 =?utf-8?B?UUdNL3hQaW1Hb2EzWXloQnpMeTZEakZNWHhSV3cyczRobC9IZGRESkhOWFJZ?=
 =?utf-8?B?aTVLSzJnZEVOeFRRMS9rTTVmaU0vOFkxaEpWSTJkZWx5bzcyekk2dXBSV2lU?=
 =?utf-8?B?Qm9xZU01M1BtSzBYRHNJVFplZkRFaG9BbDFyVk9wdFRIbzEwcHdkcEl2b1dS?=
 =?utf-8?B?NllwZFpUOHE5a0NjblgxZ0QvdWlEVldSYnhuRXFVMlNJRDYyUGtDbHFDVFdr?=
 =?utf-8?B?aDFEd1hPZTQyNWRaTDMvUW5kTGlZZVJkTUtBMUdRZ3lqT2d0d0VZRlZDbzVB?=
 =?utf-8?B?TlVkRk9FUmtyQUUvbUQ5WmdCTFdWQVU4dzlURC9ZenhmNFVrUXJqNlVxR0ZL?=
 =?utf-8?B?RXJTanZqM0I1SzNWMTBlcUNnbEpoREg4TGxhNm5kanowNnFVMDdiZU5HR0p3?=
 =?utf-8?B?SldJbStwaGZFVTNQNGhNWDh5NDFXcTA4VEhPTDV6SnJubXJZNk8zbTJ2dDJl?=
 =?utf-8?B?VWJlMCtrV0c1OENNdWtqUE5LOWFqNHRMWkgzaUgrQVJBOS84MFJvZDJxRnhu?=
 =?utf-8?B?bzZaWXVQbnk2NzJPeE4yd1d0anVWUk5RRkVVMzVVUUVZd0k2ZGpzRms2ZDI1?=
 =?utf-8?B?eVFIaTNnUUQyMFh3VnVtdnN2Q3QvMFd3d0NHQUZZNU5HQnhtT3FpNHdmZE1K?=
 =?utf-8?B?SFR5U1pzdnJrWUl6RmVZZ1ZrRmdGeE9pVDMxMW1tL3FnYVRvMFEvYTg3cEdN?=
 =?utf-8?B?TW9iUWp5YkY1b2dmd0VUR2IzWTNmczhFZGliOTQyNVI2TGJOV3JsRVMxOEJD?=
 =?utf-8?B?MXE1Q0UxaFlLRUw5NXBHaGJsZ0Myek9LcHE1aVRteXJIRUNhVm9USFRJV0Fy?=
 =?utf-8?B?YjY4OHdFck0zekxSaXJ4MW0xNUdPQWcxaHhCZkdBK29JcEZIMmhsbVNFN1BE?=
 =?utf-8?B?NWkrWC8wSkdLRVVRaG1pZ3IyQ1NRdVBENFNma0xDYkRaNkR3dWorRGtNakZj?=
 =?utf-8?B?MzRseDR6SFgxaklXSnFMMXlzRmFoUXhRTzZwdFMvM2tNRldyNjJrWWptb1Ri?=
 =?utf-8?B?eWhXS3VraFlDd0JEY2s3WUxJcG9zZjlaNldNb2hRWlZyVGJLK0ljRVZLOC9F?=
 =?utf-8?B?ZUlHLzJYdi9DdnREZE1SSnQ1YXpoT3ZQTDdqMEtRMlRTT0pxdU9EeEF5OVh5?=
 =?utf-8?B?RnFQZlI1bzFqZHM3Q05YcGNkajJvU2lETDNtUjJzYmM1WE1ncVpMVnJGMEx5?=
 =?utf-8?B?NE5sc0xhaGRud0NxRFdXbG5WY3NNdUQ4Wk5IMzVxcVJyQlJuZ1drRzJTTURv?=
 =?utf-8?B?ckQ5MytGY0podTV2VHdLY09NODcvZ2JyelVHclU5ODQzd0ZaSkFXTkNCT2kz?=
 =?utf-8?B?Q0wzNkdDZEw5SEJSTnBjNm1CeTFDc2hPcUdZOGNKL3UzZTFWYmFNM2dIek9S?=
 =?utf-8?B?L0E5bWVZYkIwbnIwa2VCZFA5OW5HUXpiRVhRTW9pbjJGR0xjZSszdXY3WUFj?=
 =?utf-8?B?Y0pCa0pXT0xoaFJoTHhxbjZYMit4dkRBZytybS83ayswekhic3I0c1d0SGd3?=
 =?utf-8?B?SVo3UXNpVTRVRkllekFBTWQxd3o5RG4yQU04ZUFVMS90dU8wUG9pTGx6WmJI?=
 =?utf-8?B?N3ZmYzF1ZXpKSTZzby9XNTVCRGtqRGZ1dHVjSE9xSFVBWGg0SWtSbnRqZ1hK?=
 =?utf-8?B?RC9QclpGanEyOGtGajFMSUhIdnd6ZElRUTNHNVBqcE1mcFhKVTQzcFgvbmJI?=
 =?utf-8?Q?Q1aKqatLNXo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnNqSGRXTFM5MkNabUREcWlQbzdpM29NNlR6QVVQb1d1Y3ZMeklnSkFvQU1R?=
 =?utf-8?B?TzdsSjA4aUZ2SGcwS3JMRW5FSGk2L2NQcUhyRlpWVWVYUGQwQVVVaFZnMEFn?=
 =?utf-8?B?VzNpdk1aVHlvWDFpZFRGb29lWWNpSE5GVWpGRDV3MllRVmMyOCtIOFNWSjdK?=
 =?utf-8?B?NXlLNlZqVmExZ0ZMaHVncFQ4T3V3M1pPQzg1aU9SbWlUMU5MRWJiWUtkYnFk?=
 =?utf-8?B?WGJvRnM5NW1WLzBkelQxVTRRUVJUdXQwMWp3QTZyMWdLcTV5bk50TGR0VkZt?=
 =?utf-8?B?bk91UTc3VGM4WlFWaE50VW9MMThRQURuMGJyOHlyY2Z0OFhGSnFrZE5SZWNK?=
 =?utf-8?B?bDU3QkxtZTdob09HQm0wZ2xvZjdHVHRrdXFrZjliQVNyNzBDT3NWajV6NHdu?=
 =?utf-8?B?cHl5M096MjdMc1VncGVNUDRObytNTGxHdy9yQ2pFMmtmRXBFWlFhY1duQ29O?=
 =?utf-8?B?SkN4QnNwTmNGNElzZUNoRGhsVGg2NkEzMS94TDRxWDRXakdBcnFzd3JTWVRm?=
 =?utf-8?B?UGpJbjFURTNFTmtzb3REMVZ2UlBGSmV0MFI3M0dONEx1cmZyR2l5cTdaN2VT?=
 =?utf-8?B?ZTVROEtLL1hJOU9OUGVsRkRCOFUxbkNUTDN2ekxyMUxxQys1OXp1TGtoMmZT?=
 =?utf-8?B?MlkrR25jOUtjZXpnbjdlQTJFK3FYU21pLzN2L0JXQkRNSTdna1A2d2Z3TnVW?=
 =?utf-8?B?cGdGNkM3QmgvT2NRUStFMWtGcVhkRWYvZi9DMmNXL3Q2cjI5SlF0dFlLallO?=
 =?utf-8?B?Uk85aXBISnpRTVlxaUxnamRIMXpFMzZISU40M1BFS05pamwvbnF5Wk1oeStp?=
 =?utf-8?B?NUpkNjVCSlFxRHQzU1pjdjBBeEdrZCtwRlEwcFFKbVdqbDlMMTlicmsxbGpx?=
 =?utf-8?B?c0RhMEhTakc1NmtzZmNzWlBwUEYyN200ajhVbWlITkdIQTZuUVRCdHlydUY1?=
 =?utf-8?B?d3NNYXhMZDAwRGx5ejU3QmZIQ2NLZHBaM3A2YU5PVzIzbzdCLzFBb0xaNHJ3?=
 =?utf-8?B?ZVNnVXlkSDJ6RVVuVUZVZGI0WHg4cjR2ellnaVVvVzdCRHNLNWJOMWRDL3JP?=
 =?utf-8?B?dnlldTFSUzlEbE9oNmtDQ29ncllnRmt0aDlqcUY4ZThXbDlYZGVqZnU3dzVq?=
 =?utf-8?B?NDVnSHdsWHhXd1hJQXVuS0w3MG1xVEZhYUJuelBSS29TM0Zlakh0RklGa1h5?=
 =?utf-8?B?b1VuVy9ZRlBJM1V1SFQ1YzMvaC9pV1Y1YWZYWS9KK0Vrdk1UdDNvY2YwUmN1?=
 =?utf-8?B?Q0xsbDlYazk0SWE4TWZ1RjZUOEhxMHNMbVBLek1OOVRENWRPYVg2dTJmSkN6?=
 =?utf-8?B?N2xtVlRGQWNPUXFabXBCeXVUNjRNOEwxbGJ0NWJBZkszWUd2REZvVDJ1aGds?=
 =?utf-8?B?SWxjWCtBKzNSZFNHUWZCeFlYdDBpYldzRTlsMXN6TXVIZjJOamtZaHlaZ1dL?=
 =?utf-8?B?ZTZqMFJZcElLZG5oLzNMMlBnMkJHN1doSzlwaklLYWxiZHRUZzhTU0xHWkRT?=
 =?utf-8?B?Z1hQL1ZyZnhQejdPZ0taaU9reTZpKzNJMlhOdDJYWUJXa3ZxUSsyZ2V4TFE4?=
 =?utf-8?B?ZmwwNHBWVmFYTW80ZHArblFNQkp0NnZUc0hzYUx5VStsdktFRjUrQkt0ajA3?=
 =?utf-8?B?bFZJemhqMlVkbjA5dGlWYUdMdkVjaUZrUlQ1KzBnQUIxMWFncFJGdGU5UEtJ?=
 =?utf-8?B?NDVERVhkUDg3MG41MEdaWWJMd0NZa1dTeDJ0Zytvei9MMHVMMHEySHhIQ28z?=
 =?utf-8?B?S2ZleksydFA2cWVMWTdxZytPZ3lJRFFXRUFoZ3ZVMTRNZ0lQZ1pncHJkNjA0?=
 =?utf-8?B?RS9qOFZpNVVyTFhkMDVCVTF4UE5jRys0R0Z4SFZHTGp5eldKdE1ZT2QyaW5E?=
 =?utf-8?B?RmFzK3lNYlg5STFXNzJvc2xqTFl1N0tTVjRubVVlQ1BFdHRQTjN1VWxQVDlY?=
 =?utf-8?B?ZmdCMmVWN2JmRnV6TzdsaWJhQmxNUDN1UXJjSTBxQXJwRmE5K2RoeEtpN05U?=
 =?utf-8?B?NGtGUEl1R1NxVTRmZTRkUWZHcjl1UG41VmYwaHJCSzdMdFVtYzVlVjBFQjBs?=
 =?utf-8?B?Q2xxSlVkVzduWHBOUWRib3NaMTNCNkZiUDlJYmdqYXlWUkRNSFNRNWxXZkhr?=
 =?utf-8?Q?4I/cpG/5XRBR5zeOc5PZAR459?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A7n8s1msYilL7n+XpLehPr1MqxuBBzOnlFWE3gZXfKdpQRVGqkZbGBuatM9LRI+GifRRnrt4J++PDwVFJIcLwvGwrxcMxuTcS2FTmF3GsRnRfluk8hfahsqP1LpP1r6u+nua9fBOX46mc8RnKB5Al9asoxLfpFAJNUJ//Ls6I9mGs3V+SeIEmTZp4wgHNZucgLrvJFZnGmbCzSdpNVAzfeYF+W/oh0Cwcc0e8d2t/PAEeOqqT7x2m1kQ/qJkKt5NhL/p7dkQcBndjvFCJFbvo7YzOOuhGWd3kBZQY16cmijpp5kL7xfXEcmDWvXLPVfwbOr5TNPaYyNHntpWCORknSkUgEgYFvw+SFSm2kQeWRRNsWZ69fuzI+Q7DTCxF88CY2bWHg+dZZUbz9U71/LKQXJVdUdG/eClTjGgXucK4uF4sCsoSXCqxka2WaHlfKd1PwVfEaZBJNdA9wNnzjRZf1W8H3JZL+s4vRLnHX2wgPnihASabv8V2NdPBAA2rycCjkuTWLV55YRFKtB+ZZvbEa9Ruxtce9220FGNv2M5xYVsP9Orl+FT1aFo0esa0Fiq/T5a8t6cBXVLHtiqBqubZyq408z88rRCBcjIkgg/EbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c512b1aa-9197-4e7f-84f2-08ddfad6077b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 19:18:51.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dg8FKRKRJjHlfFSZlMzySbnFntsZZF53wA0gpvmVjzKf8GY7HmAg1MAJAZmvbHLsn3ZCxiM/Q88AeLO6bD5+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230176
X-Proofpoint-GUID: B4sTjliiw9TEC10K0V_E5--VZv7G7CGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxMiBTYWx0ZWRfX0N/tMNoa78KE
 T0NBN45q2VCZpWnn9FadRGE970ALVsmFLMI6hNyeI1O2SiDFReEfeJB5QNwNDxIuU/CssX+smAP
 /Aza0bX6zAc3eVvb5DOtsKQk1WF9sQx8v87e61CH4sJmIyJVkThZpKg56HbNwt/qJOFcDIOj+xS
 aZ22VyYiF9DMzT01M3UTwU/PIIDIArAp7nhtLlA+IV/SYnE0Eth1yG6DLLQhQWi3B+E79Wnnc/f
 Th8a2wOwt2o1hz2njTDEjPeC5+l/ZV6lphhmqsxP4loghGYJZZjM0C3yVRV35+NGUvjoZvQ0gLg
 6+OwHFkekfZs4gpeF97t8PQhrtE8BNONgyHXgUrC2OgrY5F6QBTlkX/TukMJGW4/9xA4XvoKpBy
 gHNof7lk
X-Authority-Analysis: v=2.4 cv=aJPwqa9m c=1 sm=1 tr=0 ts=68d2f2a0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=Yv-f3vgW94_xa0r9lsMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: B4sTjliiw9TEC10K0V_E5--VZv7G7CGb

On 9/22/25 3:07 PM, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Static analysis tools have noticed that
> tlshd_quic_serverhello_handshake() expects its helper functions to
> return errno values, but two of them return GNUTLS_E_* values in
> most cases. Convert those functions to always return errno values
> or zero (on success).
> 
> Cc: Xin Long <lucien.xin@gmail.com>
> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 22 deletions(-)

Xin -

Looks like src/tlshd/quic.c has the same issue with conn->errcode.
Callers expect an errno, but internally the utility functions set that
field to a GNUTLS_E_ value.

Can you apply this patch, fix up quic.c as well, and then test both and
post the fixes here?


-- 
Chuck Lever
