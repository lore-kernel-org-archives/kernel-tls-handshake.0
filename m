Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB41494A3
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749405524; cv=fail; b=mzXgsq91UzSXHpNgclHh5kBHYofY6tZEjVoaCQ8U4wwJCnFkWD5UOqM7+sl8ROe8fPn+vRgQFFOgt4xqnGmHRk9Qx1oM9rOMNgudjQz3pJk9EyEak40PzJ3qVgWbgGZW5cw2rYEfL3ftuDpoaaVQEy7gnQO07e+yA8dXxqjrjJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749405524; c=relaxed/simple;
	bh=lHH9cHGNHKBRRIofnVe9uDORC7UWD7KmwvQQ+3tZVew=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eeYWi9CHOI7tCL+J/Z9mFKEygQNcklYp/mHbMtAuXCrzS8mQkcX2rT4Y3KQVgSvoyco4kNTGYt5IW0x/ZnFdX1g2cGyVdsaTFnuEJgksc2/t4wfLnCYd+weD810Qn9tEcnthvvPXEzouXEmDEd0ya/xMQO7w6jslsXyGjsuyqUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G6CMBCMZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZA0l5CfD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G6CMBCMZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZA0l5CfD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558HtSbn025639;
	Sun, 8 Jun 2025 17:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mTO9D9eTPR39D7TAbGxKZKJ/8z4bZUMNJjc+2BQs8ZQ=; b=
	G6CMBCMZlKHK2B21YyzrMaMk0FeiiO4bhdh6TGhgy0h0ckIVqQBLaizvGvb2dOdL
	FEa/VJGA+kim77WJLNO7Hl5QweDyZiOiwXeN41aMc5amEpKDouM6AjKWyghqMz9T
	S9P0I45TsyL0+SnqX+/RNBruZ+v8xHCoJdB+op9w8uKlc0bsmwnye6g1LtnDrU0A
	nQWa4FHSv6Kc3nHy8yGkXNkfJv8IawxF4zIOT/T+1jfqYg4uTHZjPIVcPB4Tu1OG
	XdDqHkVKPaoYG0qHb01KvBcmuX3GHdWc08zCr/CpB64uvXvlI7lu3PYz1hl3sLzO
	bx6iWXqY9uFufmxTfuoAWA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyws3e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 17:58:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558Gq9cd020262;
	Sun, 8 Jun 2025 17:58:38 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcywcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 17:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0Knv2vOSTGEYMVDpZHFO64S1oAvyVOmjaPfz6XOJ68KlsqQWSgWH9wWjmgrO1V59BSNVGemitxBR+f+UTXXsGCxc9q4NocO/YTgDBhmy7ywRuDyLS3p8P4kWV/cE6q2xl2nLU+fxcAk0AVrsCX8tMBZW8k1aCTjahduZfGL3IkJ6AkfqyO9FG2nFt4JMhjdacr1EEVl5JFMKmRVC0w8W7PF/59KlkWhNxv0HrzXQzSae+ZllgdkIpUCN2kizLDLQ1ep8/ojjI/z/MXEmrNbs0/4lTD2g/gJ2RQNa0T0/lAHZZ8LmAMQb+Qz/+CJnhvABLAHfwRF99k7wEvb1a+DAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTO9D9eTPR39D7TAbGxKZKJ/8z4bZUMNJjc+2BQs8ZQ=;
 b=gkqQvxwdWABvOKKYiA/oh0LYklGFjxWF0pvsiuE19OV77zl8UYN7lAXZjMO+e1sJHmdxL1rgRAeMEmom3kP/jJTrHF9EZ7Dr2tqgR6AnBEvk1mySLtlZsg9S3e6sblZ/EB4RI4/I9RUsLupBxW6vWZOXJkSooHcJctbTijxuABEOJT6/ZcyS1UKqHjkGN5aTaIr42gcxklz2JYKoWS2Y2RzG8MK+E5f8lLC5G1kG4ejulyc0wZWqQQVgoeD1JSSMYnc503HQeB3ATOO5vqV6a9rXkIyzLCYPeIvRZvPdW8ReBMqmFkOjrBXnI2/ZTZPWGZzDUeVfF58Kk1dgovtjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTO9D9eTPR39D7TAbGxKZKJ/8z4bZUMNJjc+2BQs8ZQ=;
 b=ZA0l5CfDtphVF/BUuJkLUcU6U8/QxS3G03wZl9p3WpoPLukMoNZVqs2DmeuLV/Qr/OZ6XLrzglzeyRzWwXIqBLYBUZQ2xaNYgNFAaZ0BXlx8gQy3wxaeowDEU07DjHpmQ59tt478hLDngytNNMS+boEhb9/TiBAZUHIBfxkmbdk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN4PR10MB5800.namprd10.prod.outlook.com (2603:10b6:806:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.38; Sun, 8 Jun
 2025 17:58:35 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 17:58:35 +0000
Message-ID: <7c0de7c2-2c4c-44d6-ab54-b39d528e2b95@oracle.com>
Date: Sun, 8 Jun 2025 13:58:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils client address verification and other patches
To: Ken Milmore <ken.milmore@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
 <0d1d9550-43cc-4e85-9d88-adb72ffd5dfb@oracle.com>
 <8342df0b-f308-4b95-905d-87d2c4a4d55a@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <8342df0b-f308-4b95-905d-87d2c4a4d55a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:610:52::13) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SN4PR10MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 02793474-b9cc-4d7a-3f65-08dda6b6170b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODV0R09NVWk1MUdQRkUyeGJtTDVScGkraGJSa1d2TTNOcVJGbTZmV3p1cGh1?=
 =?utf-8?B?WWJuamphd1pHY1ZPZS8zMTZkQ1A3NW9VK3Zzb2ZFMFZNN29aMEVoTlVuMTVX?=
 =?utf-8?B?YXRGYkVPWkwyTlZRSlBzSHhUZVFJNjQ3R3ZxeG9Gbk9kdjFNbnB1T2ZBVk9m?=
 =?utf-8?B?Q3RvQ2syRGRIWnV5QlRSTmxNYUthdjRFbFhRK1pNZE9scjFHcU1wKzJDWFlY?=
 =?utf-8?B?blNHRFRxRXVqM1JRWGJUNVNkV1FwNUlpd0M5R2k5L2lwNHMwdlhRVGNlaU9B?=
 =?utf-8?B?TldQY28zZjdrV2g1akhZSkdDS1ZXWVJYYkhBNnZIWXVVVVVSTTNUNFpBaEcw?=
 =?utf-8?B?Q1hITzgxZ25rZDg1OU5SU3QyT2tMU3Y2TDlXYW5aM25ndm5TL0pvajdtRXZn?=
 =?utf-8?B?Z253Zks4UUF3YVRDeWZKdGVGUzBZeEN2VU5MUGx3R082dHpQd28wRkRlV0VY?=
 =?utf-8?B?aDI3T25kRFdrQ3JFdkJiaWxUVThDUmVJbDYrTXkzOG12RDBKc1A5eXFZWVZh?=
 =?utf-8?B?VnN0V1gvZHJKMU9DUVRqY2k0c21abFJOY2s1enovTlFSa3labUt3aGdKMUFN?=
 =?utf-8?B?ZlBJSUozKzNpZ0syUi8xODZyTitraEtYck9tTVdnTURoSVBUUHJqYS9lcHVV?=
 =?utf-8?B?aEZ6WURnbk0zQzNmZTU2UUtrNzBKM3hMMG9sdW5OTzRJZ0FnNHFhNkRuUVcy?=
 =?utf-8?B?Y1VYZnZJWG1Eano5cDVMbEswSldoTGFlR0dZN3BHd3dwU25sQjVHeCtkRCsz?=
 =?utf-8?B?WkRHL1FHakNhRG16MW5YREdwZUhNSENyUkZkZXM1NTdRa09Za0VyS3dheFRr?=
 =?utf-8?B?UWI0ZnlQbE01RDF6VlZLL1pOL3JqT3pnRjZ3Rk5INDd5QmFGYTg0cEE2UUU1?=
 =?utf-8?B?bXdFeGdOYVhYcWZmTkFQL1ZrU2lNZXdzZHROMlF3SGtYcFdybVVVSEtKUlkv?=
 =?utf-8?B?TWRkUGJhbi96VFk0YXhTVFFkVG9ORWtHWkx2QWxrM2tmaGJSRE1MSzZSVDg3?=
 =?utf-8?B?Mlo1RWE1MzZlYmoxMXJnT3B0aHEwMXVjaUlHZnhVVlhNZGtJNXlmTmlSQVZU?=
 =?utf-8?B?WUZpbnZwMVpRdTducDRlRWp2ekduVXVHaGFzbDlOQ0wzaDlnSGtaMVBIVWI1?=
 =?utf-8?B?czdoYWJZZUoyZ0VzYlg1Q3k3Q1hQdk16T201b25WQ2R1eE1oM2UrVDRkSjh3?=
 =?utf-8?B?T0JkSlBVV040dTM5ekwrTXdwYkVtemc2TVFaajMrZnNJaGdwTDlCMzlTSkk0?=
 =?utf-8?B?T29sdGM0cVVhNVBnSjBzRld2MWRMaXZFR29ZOUc1Y2NRWUZlaDZMTHB1V2Iz?=
 =?utf-8?B?N2k4a0pLZ3NXdFljR3MwWHBzblpGUy8wdEtRd2JRNGRNR245enpkcUxrdFJL?=
 =?utf-8?B?ZHNTMzU1MFg5MURCRTFhZDJSemNUZnBtdjV0eFNWOUU4MDkzdU1ZUVZoOVgz?=
 =?utf-8?B?YlJ5ZnQxVHRNWXYyWGx3THJJbUQ2UmRLUWV6QVVBcXRDQW1xOGpLSDk0YU8y?=
 =?utf-8?B?WHYvYzlEQTBGZ21mcjFTdU0wNFV0a0IzZ1dvK04wajVOTG9jUTJaY0NDK1lX?=
 =?utf-8?B?OFVwSkhrc3dld1pycEVGL2FNc0VCaEdCTVN0ZmZ0VFZIcWM4b0FvRTA5Ulcz?=
 =?utf-8?B?VXYwVjlPcmZ2Y3JTWXdwMXVuaVV0NStNWCtUY2JGR0lUSlJ1Y3QwWnZNSmY0?=
 =?utf-8?B?bDc4RWlRU2VBQ3FsU0l6bU5kUkZtbG9nSndaMDNsU0U1Z3VpeVFKZUk4d29C?=
 =?utf-8?B?QTFjVTJkN3lrNllpLzN4cFp1S2ZWZTdSMFEvN0cyZm1tYUF2d0VnNjQycE9V?=
 =?utf-8?B?azVkS2x4ajBZSGJmL2RIVXhUWi90VDhacmtJNW5xVmRVdlNtemkzYzRRR292?=
 =?utf-8?B?NzFrL0tpeVpuRlg1YlRtVFJjR1hoczVRNDQvMlIrT1gyN044WXBwbnVralpS?=
 =?utf-8?Q?SNZD+0HXpXU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZ0SlRLclViOWNKa2VqeVJBQmpKVEpzUmZaNVgwNGJTeXdzOXFkTW8veTZS?=
 =?utf-8?B?bS9FUzYvS3hJVmlBWjluS3JLMlpjUlRDNTBHRWRsKzZ6NnQrWWdyL2hyall6?=
 =?utf-8?B?TUJ5andodzhkS3ZuOTdPWGdVVVhmMUFWdk5yWEJSWTBWTlVyUUJqb3BlQWZZ?=
 =?utf-8?B?emJmZGE5OWJYV1BuQmNQWC9nRXVCQnpoQmZsdGgzZVpkWTNidm40ZlZ2V2wx?=
 =?utf-8?B?dWw1QlZRTzNOd2VnUXVITG5LaitLRzlUZ1k3LzdORnh1SkkvRk9CNnV1bnQ3?=
 =?utf-8?B?WjBEWGdpdUFTSVF5NWxBUk40NGJZRGdRQzVXL2hybzdaUlBYeDRnMWRLamJy?=
 =?utf-8?B?c1p0QUtJZHh5QzJQUFFtYUo1Wm80Q1FaSVlHUW9hbnlaemJpRlNKMU1VUFN2?=
 =?utf-8?B?bnBsd2YvRzZnNEIvKzUwN1NySDc2cUVnTEU2a3lXMXF4ekkxZjY1UnczV0FD?=
 =?utf-8?B?MlB2M2s4S05teUc1OFlINXRQOVdwNEN0dGpubjBMaXg3TnBmN2pVamUwK05h?=
 =?utf-8?B?T0cvRVlHQkE0aTVwYm9MQjVuUjNsMno2OGVGZmNJbTNZZ1NqWiswaDlzWm9r?=
 =?utf-8?B?UG9lYWdMT0FwRWh5RElVSkoxUDhNaFp2SHdyY2prdXdhWmltdEZmclh0RDlp?=
 =?utf-8?B?cjhKNjcvaWp3SEY5Zkxpa3hzZjNBb2YzbTd0b1JPQU5obklVdkdLbEJnMStW?=
 =?utf-8?B?VCtjZDMycEZ0U0VaY0U5SE9rYXp1WlhmRVNvc2N5WDAxeHB2L2x0ZktTR3Rm?=
 =?utf-8?B?RGIwa2ZkanljU2srT21CL2dVZ0dxRVhpb2FzYUxKUFJFdE9qN3hzSVhaRkph?=
 =?utf-8?B?eENDZHlPd2NsM2hiZ1dzNndWOU1CWE1odTRML3lsb2UxZTlOR0tsbWRUVmVQ?=
 =?utf-8?B?dWJCZWNBaUQyZkNTejYyaW9kRkk1cjMxZzNyL1pvQ1FBOWl4dWsvc0h0cy8v?=
 =?utf-8?B?V0ZhZFByZDlkUjJyYUthbzZPQzVac1ZWSzZYdUttTHlyalJUd2pmeXJUdnJm?=
 =?utf-8?B?Vm45cmdvRnZUUGIxRXFkS2hXbW4zUjRVMXZEOXVJc3VPM2xWZVFuSnFVcHRo?=
 =?utf-8?B?QkxIRnBtWS9kWUJtK1BvZTR1dEJuUkgwNW80bUxDdWdROGE1Qkp1K2lDc2Vs?=
 =?utf-8?B?WUN5cnVkQyt5TDBLc0Y5WDhGeWZ5aUFGb1h6dGgrS3o5cXZZUUtVYnRhbDNB?=
 =?utf-8?B?UU5nZ0M4Ky9zRzVKenJBaEJDZkR6SmQ0MzlzVjlGdDBGN1hjTXVjL3FzNWRo?=
 =?utf-8?B?VzVwN1dtR2NlcCtnNzBZYTZXTFA1MG5JeFVyMUF1MzJ3V3Y3c1B3VEdTRVRy?=
 =?utf-8?B?a2w1OGFIckFkaVJrZEd5QmU2d1cxamcrcENvdERtK2d3cTFvbG5Md1M4ZFdp?=
 =?utf-8?B?cEdjaVo2TUVyVUh3ZUpmWG5WNXdYWEdIcFJxRGRkV015R3BrQkg3RDljNjhR?=
 =?utf-8?B?dnRRcUFzVndYTCtaVGlYTWM3VGZ0SXFyQis4UlNhckNMT0l2dURHUVhFcCt2?=
 =?utf-8?B?ekpXYXpMYWFIby95TEowRmIvSVJDWmpSL2xWWmRNWk5KbXBDS1lwcHJQMndE?=
 =?utf-8?B?ZEVVZ2N0a3J6WHN0L09aQi9ienNWSlUzVW11RTVNb0dyZENWNVpLeTRJTDA1?=
 =?utf-8?B?NVhMUUlOZTlNcG5ldnpQYyttc0F1cEQ4aldYR2huMStOUmw3UWovVzNRU1Bw?=
 =?utf-8?B?WFV3OE9BaHNPM2swNHdnRFVjZ0svdjNEbmJlVnVkY2piNTVBUmV5TForS3VH?=
 =?utf-8?B?RXFIVkwybUE0Z0JzNklsRTRUbVVyREJqcWRSOEhaMmtqVjVMaWE0L0pHc3Fz?=
 =?utf-8?B?SEt1Ty9jVTZtamQrRHNPUXRNcEJ0b3d6MlJYN0I0aE0wTmZmSXRQUy9SajhO?=
 =?utf-8?B?TnJhdnZTVjRQK3dubnV2bW5YOFoybjh4bTN3MTlOVDNIRnYyYm9YVzNBOVBC?=
 =?utf-8?B?MWQzK3A1dXBCWTRJcXhRd3FPcVBPT25JYkdKcnFreUxOZkUyRlNQWEtMUmNN?=
 =?utf-8?B?ZTlEWXUyYzk5Yi8xVnFONXFkNjFRb2xNakNZZy9NU3QyOXVVVFdoTXhHU2g5?=
 =?utf-8?B?V1pmSWxCaEVMM3RhTUR5SVRWYStTRENzWmtpZ0VhdFNXTnFENXNUY0pLdjM1?=
 =?utf-8?Q?4hE4VP09y/KMnOfRZYg7VdD1p?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FHWKh+EEiOUTXjQot++372GCqbn21M+HX/0aSggxpr0K9WCMwXcnA4tQWXY207wCJ/u9ChR2JCxVPT55RnSJGFoAIQ4h0sogaAAdYmIf0N9ID6KMQPymtM3dk9eScO28cDCRi19u1jSKkegywXelopfok0ihjYTC9mhtaD9AmLUW3cGLqtskoXPW7quxWNG5dr6h+zclPlQA3CsN3vCChazNcuiCP5eP6LdFlfpGAzaVcAs9p6AEHPyKDM53uoJD8zO74GD6Dqc6XFOHL1IU9kby1K3hTbFlyFRHBPCAhFisfph6e0OXymZxeGxDkCOsi7/ndCXXwC6VtEepUhKQR7tXSl4aNBiClYpX7y/fcHfooK/bTRd9m2w52JYkEaQMVRCdk/kJ51Q6yPrqSDOWyhjkLseSCGU+TXON+dXMOIosy9KcdVlUG1WZplunkxkgAOrfzJbY3Ogx8ssNQD+ovQaHWEVdXRnRGaQHlZ4h+T4u09cBInJqjcoIUVovV3e/sg3BxOfVqoAw9D61AwGw8TQ4e3507ibqeO8mLVCFOmraRCtHG1C6ZKZHyiKG5D96oqe7C+5kXFS7XeCoBIVBQpY8SQ+39QRJey8y62vp2ZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02793474-b9cc-4d7a-3f65-08dda6b6170b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 17:58:35.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qx2zp2TYvRD3DV+F/EE9bJd6lvdfX/95xvY81O4AqPaG7mVKmlnTkaDOJFHwx+J8sTo1TwkplAWbtKG1LTu4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080144
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6845cf50 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ADWRihWDmk7Vn1sS-fQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: YmNfSmYJduDcD-Qt7AJ8QZg4P-yUBKNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0NSBTYWx0ZWRfX1k/fGYk/6LhC +JvONDAsu0JOKQ39qhQYy5568vB1FoaaqCN/MVYdd9p44IauKZBg4as58UWXwWz2nld9ZY6dNXW oZ/rcUfVApRwem3n0HXknIGVManwkjOZ3wsN86Upj4t5jHScZ28PkBQiOzShbCKhRuZiccZUNOq
 z38o2HWT5ty4+o1E0GtbEaiJLVsLHNKF1Iicu09CMkp8iPUt4PBBEkZCD6/93lh2pc0+tYw6ihh KxE/1Xp2Dss0UHj7IKWO4ZLT4H2gsGZbVXCYbRZLpo/12htWGj3RCdfUJlzzKS0paqIcIKmfTTZ TQaiT0oiBNAiFdk5m7yGJ3taDrQfNKn/f9co2n9oTO7nxD3vG/ZUXYaxfEgUnRM4L3EH0INHgo+
 XCA6YFhKEt/BcdBGZQnHGESxeoUFejMT/hTv3OCBMpkXUEP+JzbNkt2djZH12rncreC0SWNY
X-Proofpoint-GUID: YmNfSmYJduDcD-Qt7AJ8QZg4P-yUBKNK

On 6/8/25 12:57 PM, Ken Milmore wrote:
> 
> On 08/06/2025 16:51, Chuck Lever wrote:
>
>> Essentially we don't want to make certificate validation dependent on
>> DNS for any reason, since DNS is easily spoofed. Have you considered
>> putting the client's IP address in it's certificate's SAN field?
>>
> 
> Yes, and my "verify_peeraddr" option covers that. But the current implementation of tlshd does not check either host names or
> addresses at all on the server side. Therefore client A can use its own certificate to impersonate client B simply by using client
> B's IP address. This is because you are supplying a NULL hostname to gnutls_certificate_verify_peers3() from
> tlshd_server_x509_verify_function(). AFAICT this results in no checking of the certificate name at all. I've tested this on my LAN
> and it bears out.

That's correct. The only checking currently done is whether the ingress
certificate's trust chain is recognized.


> Re the insecurity of DNS, yes, I agree it is insecure *in general*. But once you have forward-confirmed an address you are in
> essentially the same trust position as any browser connecting to a website via https. I'm not sure why you see that as no better
> than no verification at all?

Because NFS clients are frequently assigned ephemeral IP addresses.
That is actually a common deployment scenario.

If IP checking is needed, mountd handles that as part of the usual
access control, once tlshd has validated the client's certificate.

To date, we have been thinking that if a client loses control of its
certificate, the cert should be revoked and the client should be issued
a fresh cert. Because in order to use that certificate on another host,
the client's private key will have to come with it. So both will have
been stolen, quite clearly, thus revocation is probably best.


> The difference, of course, is that in our case we can control the trust store, so we only trust a
> limited population of hosts.

Actually I expect that a lot of admins will simply get their certs
from a third-party CA. So, it's possible to set up a small local CA
just for one NFS server and its trusted clients, but I expect that
will not be a common deployment scenario outside of testing
environments.


> But what I'm pointing out here is that all trusted hosts are treated identically, which is not very
> useful in most setups.

That is more-or-less by design. tlshd is going to be used by a bunch
of systems, not just NFS. tlshd can make decisions about whether a
certificate is trusted, but the consumer systems (NFS, NVMe, QUIC)
need to make their own choices about authorization.

Our plan is to have tlshd tag the client's handshake result based on
filters of the client's certificate fields. The trust store says the
cert is good. The tags indicate what "category" of client this is (like,
"Subject:O=My company") and then mountd can authorize the access based
on the tags returned to the kernel with the handshake result.

I believe this can also filter based on the client's CN or DNS name, if
that information is provided in the certificate's SAN field.

I'm working on it right now. See issue #21 for recent traffic, but we've
also discussed here on kernel-tls-handshake@ a bit.


> I want to check that the client that is connecting to my server actually matches the certificate it is
> presenting, otherwise we have an impersonation problem.
> Additionally, in the sort of LAN situations where NFS is typically used, name lookups can be secured in a variety of ways.
> I'm simply using /etc/hosts, with my systems on an internal domain that has outside lookups (both forward and reverse) on that
> domain blocked by dnsmasq, so that is fairly secure. Obviously there is DNSSEC, LDAP and the rest to do this for enterprise setups.
> 
>> Further, there will be plenty of cases where clients obtain their IP
>> address dynamically. In those cases the server needs to perform its
>> certificate validation based solely on what is in the certificate.
> 
> In a *general* client/server situation, the client may have an ephemeral IP address, or come in via NAT or a proxy or any number of
> ways that mean the server can't reasonably identify the client.

I think it can identify the client by the contents of its certificate.


> In that case, you obviously wouldn't want to turn these options on.
> But as I have pointed out above you essentially end up treating all clients as equivalent. You just have to live with that I guess.

The downside of setting these options in tlshd.conf is that they will
then apply to /all/ exports on that server. It will also apply to any
other system that is using tlshd. That does not seem terribly flexible.


> But in the specific context of NFS, very often the connection is over a LAN or VPN and the client addresses and names are
> meaningful, in fact they are *so* meaningful that this is how access to shares is policed within /etc/exports! So these patches
> cover a very natural use case for NFS. I have made everything optional so there is nothing lost (except for the additional security
> that you currently don't provide anyway) if you turn the name verification off.

I believe authorizing by tags is how we want to approach this problem.
tlshd filters validated certificates, and then each subsystem (eg, NFSD)
will be responsible for looking at the presented tag list and granting
or forbidding access to a shared domain-specific resource.


-- 
Chuck Lever
