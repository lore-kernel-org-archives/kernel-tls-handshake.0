Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2566B206274
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504653; cv=fail; b=UZWhtMfDL80FalW4LiiVbYF/Ry+TSGYzuLMoZep/scd1n+Kw2TIxlFt1JEMacyaZXx+JWSz2omdE2iVMXxZiPBYEjcW/jdF64YZPzVBEmC/QWi8b+oxqBNeHyNnB/r9+itEnP31g7X0QMmC5qLehixnJbG5jbbwPGainOLg/NSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504653; c=relaxed/simple;
	bh=UEDBWABAnYRNNy3EskNzjcoIwV098jO7+0+lLUUrDuc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2YoUXzwyeX5f5Xil/BtFjX+70W+fLFmthYPpIj+l2Gb15nz5Z8/rvBX9bl3y4f5F8aagnAn0vRGIa4KNe78cCPXCMjlAyfsb+aQ6oWSA00ZKfysHacV5YcvZlVNyyVSUjfk886JwblKn+3vql42Y8HEBcSFW4cFvgH3RolKYX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TG/ZWsek; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p9hewHoa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TG/ZWsek";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p9hewHoa"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6EP7Z4020840;
	Fri, 6 Dec 2024 17:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=MqNX8YY9rGeZrx4sitKszrkeIbnSCvqDwf8a3pm6Kec=; b=
	TG/ZWsekNNtQO3YAGO4/bvcjk4OvS537hsyalLj31o4YRucAtIc5e66U1NU/sL3C
	sWn3AZ6HMFJ8RC0tdbHItZDqTZ593LsTgdcZe2elgtIZco+NgESQ+xKe1fi8SmP4
	9PAaYNZBa1Kjwz2PSrbRvG6bjXrpDVI2ppbMfPFCN6J4G/A/A8cRzJphP2S6fCxw
	7mfiIeXPXqJxL+GD7RuCxvZaTAjYItA9ntS8frOzHdmFi0ADesnhXOUn+TCygrKA
	WrN76AdtqGNqx8h9pKi92RA/CBbvS5DworLbdSyBVRZNkoTc+EsGw7JuuOKLdb9C
	P7UDQUsipOEB3y5jbRsCag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbwyua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Dec 2024 17:04:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6H2mDn001475;
	Fri, 6 Dec 2024 17:04:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5cga7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Dec 2024 17:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfvUDWXAhDpeQcy6SSFm8AANtURbDa2tS9plR90Al15gM9j8Uj5szLcNybOFlXm8SbDYa2mTEtzzbQuelitMX/MKyNIzKpaCJeO00dojtgXdWD8RoVR3cc6Vug+VuOX+bIXw7vy1d151Ywg6f5AH8TOCVZE/kux0J5BfFqmqQxwfraeioPec+OQ3Dkn1M/wG4whXQUbwYbtXjvLmr9AsOnwAMzNI+pJyUdQsYW93LGqnYtqbTDNko91ZKtuGwNj7bJOIfaKlIClenPjDFVyXeXOteiukf6POhOHZFSMRkWKvE/PV5MebuyrAPxzJ84pApW5MrrNA3HFIANoYoraaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqNX8YY9rGeZrx4sitKszrkeIbnSCvqDwf8a3pm6Kec=;
 b=YBSF+bLvJ42FfYYeWR1ewgmjjo76C6fPQrlj+h9J5v0Ml1XaplRzuS6wMw1eww0pUxEpo+YkCaf+zT9WoO75O9BiNA/y6XS+G5vBbK+IjlP0XsUbdTRBtxuVZI/3lvPIsPk1trxGREp7zNYd61boH19EDyogL9s++CTLcud2tPjdSNbQeQyGMziVULfxK7ojUpAyrs2iLmdjdMdJs1AMjU5MJue3pqWvoDyrMd/1P+hxdsn9UBuUnpqolHR/HA3S7pAffRrn9uEkDe7E1PHmiA+U9q/oH6ew0kfmgToLb0362hRNEsnKX2rH6eQFFbiCeSeCzgynOAWnFCa97mn50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqNX8YY9rGeZrx4sitKszrkeIbnSCvqDwf8a3pm6Kec=;
 b=p9hewHoa3VZPdEmzKi4LNGaRhMWzpzqcpHoEquQeKfLrGIYjBMNWGNbRFsCC4bVogYtqC+bJVRCI8wPiEUgyHviTEOSA7cdkvzVYB3yoIZZMXo1KfSxDL95Z1Tj9F9lPRTqL02cwHrShSmUj5+eZK+y9hhFq/5pIsjaoguw9srU=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB6326.namprd10.prod.outlook.com (2603:10b6:a03:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 6 Dec
 2024 17:04:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 17:04:05 +0000
Message-ID: <8cec9f77-7e02-4a5a-bfab-6078cb75e152@oracle.com>
Date: Fri, 6 Dec 2024 12:04:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
To: Hannes Reinecke <hare@suse.de>, Sabrina Dubroca <sd@queasysnail.net>
Cc: Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
        "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
        kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de> <Z1LfX4S71BRvBKOW@hog>
 <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de> <Z1L2jQJ8Lr2kehXy@hog>
 <de5448a1-c5a6-4dab-afca-484eb9d6c445@suse.de> <Z1MbCCLxxd9hWgCg@hog>
 <69b10d5f-646c-40ae-ad53-8d20bc5603b2@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <69b10d5f-646c-40ae-ad53-8d20bc5603b2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:610:e5::13) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SJ0PR10MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 4472f0df-d089-4f9d-1d54-08dd1617fd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3cwcnhiejBlbWRJZmlkZmU0eDd0SnBSc3dSKytvVEtPaXhIenF5M0dOdVVO?=
 =?utf-8?B?Tm1uWkkrRHhDTEJNbjl1aXdhZVBUdzFYSXY3UmxvazB6akdIdUI2bXFBUVl1?=
 =?utf-8?B?WHA5RkFlSkZ3R1RPQmx4eDc0RjdMT3I0RHZPT0FmcVdrUW5QWC9QdlFaaFR3?=
 =?utf-8?B?dFF5bWxFL05uNk0zcHJ5SitZdjQzMnhSMlZYblpYWmROR2VVeWVqczhkYXlq?=
 =?utf-8?B?N2ZYOSttSS9YRWw2dG9LTXJVaTRRLzg1N0ZBTklwZTNOMWtYVDhGcmc1Q3lu?=
 =?utf-8?B?bTNEM2JZV2Zhcnk2YitSN0drT0pZR1ZiMVI5OGM0YUp3aTlBWUkwdHdONEJl?=
 =?utf-8?B?OWlDQ0JPN0xnZnJSRXEyUGd2amJFZnBhMVVsUlEvbXZxYnhhWGExWUJQbzl5?=
 =?utf-8?B?U3ZseVZmNERuL1Q5NFUwR2xPSzV6UGNuQ0wyNXFNM1RTckU1eENCdTRXUU5q?=
 =?utf-8?B?QzJGVkNxbzFCM2NsRlphYVVvUG5nMjdKd1VsOHA5Wm50M0QwSFMyS3NOSlk5?=
 =?utf-8?B?SkRHWjZ4bjhMTHVvRGVVYi9QSDVDZmIwSVJuVndQUitQRkVZYmp4c09mN2J0?=
 =?utf-8?B?NU9GaEVaSzBjNy9PZU5Ub3NyVHBYcVYvdUJrT2x2Z3VkTVNJR0tlNnF2UEdI?=
 =?utf-8?B?azBqZjljR1NURGJDVkxIS1dOZzE0Vm9VclZMbEtlQjdiY2s2amFiRVFIQi9k?=
 =?utf-8?B?TFEySjRuUk9QdTZzSmN5TERJUVpMZUdPM1FVcGFodmVhTXRTQ21pcjNkNlhu?=
 =?utf-8?B?aEsvN3U5czRpSHJzWnQ4U3RCaGJoUFlHZVRTaGhkcnNRSW1QNkVlbU4yaG5l?=
 =?utf-8?B?WHRaVndNTEdUMUhUVXB3dWtYTzR5MjFtUW9xZThxbCthNU1qa0JqczJQQUdu?=
 =?utf-8?B?bWJReUVGaXNmT0hjWTdpTzBjc0RxanBLTUc1dHNHY2tEbkJUc1Z3UnNsSUxy?=
 =?utf-8?B?c2w5T25NNzFZNGlLMUE0Qmc3K2FRR3JSYUc4cEtJVHpNVEVHaGd4SlVDZll1?=
 =?utf-8?B?RXEzbTg2UmRvYnozSXEwZnQ3TXNpMVhpM0xjeFJZVVZYRFBiTmpkSGRrQkhl?=
 =?utf-8?B?elk0aS92YlhsckZYdWpDcUN5NkR4aG9Gdm9nZVdORnlIQmZmOTdEOURQUXp2?=
 =?utf-8?B?dXJacTR4cUZkSUh6Y3RVUkE5Z0xNbmlyRkdXSmc5TXdSQjFZTER1RTJEMnV0?=
 =?utf-8?B?RzFtb25jSUtTTjdYOFVJWHBRR3RlRGkvTERRb0d3VU5MazhsdU5hRDNQMmVa?=
 =?utf-8?B?K01ycWhUeUp2WW5oU3pvQituUHJLUjBqZEtOOUoxajJEdUhOWHhCUEd2L3VX?=
 =?utf-8?B?b0YzL2kwUDcrYUpzYmpuY0Q0aXd2VmJBajJWTlBGalBLODNHcEZOYkRyejFa?=
 =?utf-8?B?M0dxd0dhMm9UdkhWVHFMVnYxTUZDRXNjUFpTQzJOOWVhSWNLYmFBdFhVb3ZI?=
 =?utf-8?B?WDArQ3pkbHJHQkpjOEc0V0NwRGNDeEpxUjVwTzZFTzAwMUx1UmhCeWY5cG5M?=
 =?utf-8?B?NG4zWTJnU040TmRSb0FOZFdXb0JoaHBZUTYzQkJnRkFUS1l6bUt5b3BjRFRr?=
 =?utf-8?B?OVdLZWpMWmhLSVU2bkpHcGpySC8xQ1FoS01uMDVNaUtPakhISGZlQ2VDNFhy?=
 =?utf-8?B?djl2NjhBT3pEK0dBZ0Z5azZUc0dIWVdVVnZlZGFGNkdFZ0V0R2p5K041cjN0?=
 =?utf-8?B?KzdoOEVPcWlWWm1COUhGRjhDRUZiakJPWGVRYWVIY3EvSnJtRmFaRU1VcjdT?=
 =?utf-8?B?ZkpTZ2p2WjBJSGw4ZW5rQ1FxYk5Wb215L3pxZ3dWbStqRncxclNqcyt5S1lG?=
 =?utf-8?Q?lotuPt77JRVGYlJfvattRaXBcC1OmJ3y7A5eE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVQwQWpCWGVialZ2bnBOdU0rcnNZWnNuZnErMFlKWWJyS2x1YXVaSm1xeEpH?=
 =?utf-8?B?ZFJXejg2Z1Y1OWlRQWg1eldzOFdKWWZ2VlZIcWJFN1RUbG5RQno2VnpSdzV6?=
 =?utf-8?B?QUJ3SmRuSTlMQVVqNWhxSTdEa0NybEd3ZlI1MlRZOWFQQTBSMDF2d2JOWDBv?=
 =?utf-8?B?aUZnamt4a2s4K2ZyTmp4U1UrckdMOW1LeWUxaUdyUVo5b3A5bXR3cVRKWTBX?=
 =?utf-8?B?NDhOK2htemNHbmZ0NUh4OWhxbmNZb1RiRDhHSnRUWHhMRHRmUlZuMnRuQlVZ?=
 =?utf-8?B?VW5CSlJ1dGF0TVFiZEliVWpTeDF0Mm1pS2F4YmNSLzJwZU1wMGhSZWxuVGFC?=
 =?utf-8?B?N1UxVHB5c3E4TmNvbVJhNUtiYVVJUjlFUWwxMHhLUXZzNENVU09xZGJRT3Ru?=
 =?utf-8?B?NXFtUFB6WTZaRDlkYTNuMFl6eitVMjA1M2MyWk9mSFI3Vjl0cXBQVWwrWGg2?=
 =?utf-8?B?dXFEQXl2MXo0eUo4TGJoSnY3Zy8wRmlzdUFJTGVtM1o5NGd2aCtPQlUrTzJ0?=
 =?utf-8?B?clNtQndCOGRXaWZ6NTliMWU0YUNqMmtFQnNiUTFuYmdnVExTb0h4SEs4bFM0?=
 =?utf-8?B?bk1RUy9PUjZiVXNNRlJPampQN2lPRFVVKzdzV1pOVmNnM0hiTXZJSVVlcHpz?=
 =?utf-8?B?SHhpMSswSU5iMlE2b2RVQko3bmtzQ0VCQmd0RC82NVhVUTV5UEN0WkpnQWQx?=
 =?utf-8?B?cU45UDhIR3hyWEF0dThRUi9mNzVRYWZ2NnZ2b1lnRjc1bDYyQ2dxUjRSMG8r?=
 =?utf-8?B?SVF1UHZCTUFuekMvZk5YelFEbFNIWlVNL2ZnMnJUZjZWaFpHT1BWa2N4WDR5?=
 =?utf-8?B?NDFRejV4K1ByR1FrQ2dYMW9ZbDUxN1RPaXF2YmozNERZdWdOTEgvN0MreHll?=
 =?utf-8?B?WWRQM21lQ0pqWFNpWGVXaElFUnN1eHNpc3FZK0lCZ2xYWXNFUGdkdDZtS08r?=
 =?utf-8?B?NTRQK3lxVWRONG1zWGVRK1REem1VUnJVRW9JOG1WSVJkaVh4ZFpJejhqQlRZ?=
 =?utf-8?B?RkJMWTYvQUhXY29LWjBvL2pmbEE4bzFMMlFjTG9yeDV2VUVBK0hJbSsxa1Bo?=
 =?utf-8?B?RTFaR21xcTJPT0EyRUdYeGZKOGtvYjl3NnNmOEZhZ0tMd0ZvRWN4YUJDdlE5?=
 =?utf-8?B?RHBuWHNEM1lIUHhwRHRYUHZVNytqaGZNblduQWg4LzBUUGVIZmVSMjhPejIr?=
 =?utf-8?B?bDBURjRnK1ZpaCsrTThxZ0dZdEd5QktsS2NraU4rZFA1YVFYR1hhSUxhQ2Vl?=
 =?utf-8?B?NVlLMEc4c2dTV29SRUh0SXBjN1J6aC9jNFZFSXA0dVF5Q3NDYVJlalF0a1Vm?=
 =?utf-8?B?MEVyQ216SnRXOGJ5RitmRkpuQ0JxL0x4WE1xZ25abzhtU2U5UFJVVFdmNHB4?=
 =?utf-8?B?dzJJakN4UlJJYnBxeG5Fa051RXM3cHl5dXk3ZHJadnJiT3M1TzVJV0duV1lo?=
 =?utf-8?B?S0VDVSswTGFPK1BySERJZkJMQmwyckhmLzJncHRNUlhzQVJrOVpKbzNWSTZL?=
 =?utf-8?B?eDJvbk1QbmlDbkRobG9sMWdIK1dTQ2hDM1dBL0Y4Q1RkZkE0b1hseGpKM0lu?=
 =?utf-8?B?OVlsRXk0NTJCcnowb1VPZDFrbHBzMmpYYSt4RkZNdDgrOHl2YUI5aDVSVTlX?=
 =?utf-8?B?SFNUK3V6Vk9GZGZDY2hZTHplV3c1Q1d2ZUk2ZUZNU0ZIZE42YzJxQzNLUFF5?=
 =?utf-8?B?b2gvRks3Q0l6dnN4Wm1XQUxKcFpadVpwTHhHempkNHFnbkVVYmJ0VTM4U3dt?=
 =?utf-8?B?dUpmRDNSUnNKajY0KzFuRHdmczFYTzJPQlRSUUErTmFySnhPbzl5Y0RTNmlm?=
 =?utf-8?B?eERRK1JUUVQzQ09RY0k0QjJ5czhaRXkyYkNac1JJQ1ZUL1VGYnplbXFQSm9q?=
 =?utf-8?B?NHVOcWpOeUhqZmVOeGhJc1pLNlZQSEFKOWxOMlJiWnp6UkwrRjc4QS9tTVlI?=
 =?utf-8?B?VkVRbGtLNDJGUUI0UmdDUlN2YmJqT2x0TEdENldPSlNpdzVlRnk5VFNWLzhZ?=
 =?utf-8?B?VVNyeHJLWEIydTdMUlllekdxaFZnQXBqS3BNaDFDd3l3azB3RmZZNG9LbHNj?=
 =?utf-8?B?WGFycTl3ZjVUWStpVEdHZ3JWUWp0aFBlSlBnK1Q2WWMxUkJRZ2JHMmt0VUtP?=
 =?utf-8?Q?od5HDNr9qc3M9KZWfFUAJKSPV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kg2igbB6IoYNrOKeagxcbhU1jSLRj7vr7vC4xkX40LfEQxHHXjHaB4+Vi40RYjOwdy77xUYORTD/f7Fnq/r+zqcVltJpEUBDgPZIvzBecQaqSEL/ywtSEphg+y2XUtEBBHn9du5TBWWGS7g3YOOZoEg3R/D+Fb4cM17C7vBJb6KLXNsLHfTN2sb7qP75fwh4xI6M2f3exTzT4/5X2wYjqqPg+LRYxzjSdIyL3tQ+MHINqoQo8UkUTwIa3Vpej4plQbne13TDee4A4vycsFDBhKS7CqyDYqKDhVoosq7hpZET4ytzIfPL9rO6Z/HMPZLWtPtvpXd+B4WIvw7W10v/7PGXHcDRFZdV6yS4M8IG62PMLsre64s2IIALdKjjC3Bm6mtI5M/JqnyNgAuE9lBs+tkLZaWTItiubDMQHGz0sdfFye8koJvioeOf3cG0wCJh6nMxuJoG1g3voIOMP4812FdTA8htjQV6XLuEzK2eRzd1rZrsVBCha4z/OmcRGqj1DFfWDE2TsUY4dBrCnCbpTqImu9r13JUBiLLTPgChIq3pkpoepUFVWtF1pDGg+sQ38/wnvwQhcWdSJBsaAaCtYVNqrLMe/+p3fy9+PHAj23I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472f0df-d089-4f9d-1d54-08dd1617fd8d
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 17:04:05.1678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxDHwmtYrhY7ZzlX8PaxAJMutrKVqrkPbAYxSPwT1mgJfLJnpyBDdoIWPEY2mgz8Evx11HpeN5a4WJMserJf7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_12,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412060128
X-Proofpoint-GUID: O9vulAzDetb4MJkdSXKiit_OHzUQ18kO
X-Proofpoint-ORIG-GUID: O9vulAzDetb4MJkdSXKiit_OHzUQ18kO

On 12/6/24 11:23 AM, Hannes Reinecke wrote:
> On 12/6/24 16:40, Sabrina Dubroca wrote:
>> 2024-12-06, 15:26:08 +0100, Hannes Reinecke wrote:
>>> On 12/6/24 14:05, Sabrina Dubroca wrote:
>>>> 2024-12-06, 13:09:23 +0100, Hannes Reinecke wrote:
>>>>> But how does userspace get the KeyUpdate message in the first place?
>>>>> I _think_ we should get something like TLS_ALERT from the ktls stack.
>>>>> How is that implemented?
>>>>
>>>> (talking strictly about "pure" ktls, not tls-handshake/tlshd)
>>>>
>>>> Data records are passed to userspace via a simple recv(). Non-data
>>>> records (for example a KeyUpdate) need cmsg: the record type is
>>>> stuffed into a cmsg, the payload goes in the usual buffer. If the next
>>>> available record is non-data and no cmsg is provided, the read will
>>>> fail. See Documentation/networking/tls.rst (or
>>>> https://docs.kernel.org/networking/tls.html) for more details on how
>>>> cmsg is used.
>>>>
>>>
>>> Ah, right. And that's the issue.
>>> NVMe-TLS is using the 'read_sock()' interface, which doesn't do control
>>> messages. And changing it over to recvmsg() would not only be a major 
>>> churn,
>>> but we also lose the ability to calculate data digests.
>>>
>>> So if you have ideas how to handle that ...
>>
>> But you have to use recvmsg for the control record if read_sock can't
>> read anything, which will happen when you hit a control record in the
>> stream. At this point you have to call recvmsg() to dequeue the
>> non-data record, process it, and then you can go back to read_sock
>> until the next non-data record arrives. Like a splice-based userspace
>> application, I guess. As long as you don't pop that control record
>> from the socket, you can't read the rest of the stream.
>>
> Ah. Right. Now I just need to find a way to forward that to nvme-tcp;
> currently the read_sock() is implemented in net/tls, where I wasn't sure
> how to deal with that.
> But I guess I could return something like '-ENODATA', and then call 
> recvmsg() from the receive loop in nvme-tcp.
> Hmm.
> But then I have that message in the kernel, and I guess I need to 
> forward it to tlshd such that it can calculate the new key.
> Chuck, I _think_ there is a bit of infrastructure missing...

Probably, but you'll have to be more specific.

The SunRPC code implements recvmsg so it can sort incoming control
messages. That's something that each ULP needs to handle in its own
way -- I don't think that can be done reasonably with common code.

But if you mean a KeyUpdate mechanism in the tlshd netlink upcall,
yes agreed. We've known that might be needed for a while.


>> On the TX side, if you have to initiate a KeyUpdate because you've hit
>> the limit on the current key (or the peer sent its own KeyUpdate and
>> requested you to also update your key), you'll have to send that
>> KeyUpdate with sendmsg and the correct cmsg (see the selftest patch
>> for basic examples from a userspace program [1]).
>>
>> [1] mainly TEST_F(tls, rekey), and maybe TEST_F(tls, splice_rekey) if
>> read_sock is similar enough to splice
>> https://lore.kernel.org/netdev/ 
>> e00a6aed157b20573afbfc6c2353af2afa54f48e.1731597571.git.sd@queasysnail.net/
>>
> Oh, _that_ we can easily tie into the initiator and/or target.
> Formatting yet another cmsg is easy :-)
> 
> Cheers,
> 
> Hannes


-- 
Chuck Lever
