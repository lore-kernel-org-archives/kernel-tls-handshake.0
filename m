Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBB1A0BF1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Sep 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909034; cv=fail; b=Pp8p2L2BfsrbTIJUmNfbCKWrxBsWOQwoOro4PJWNIBumI2qMurSEv4YCYrRvP6VZXJR9f2XT8UUZOsk+/1dSLXbCOfxwdJjBbYriLrYnQWoImO7dSE7L45VLW+t2NERnz8aexKrz7h+Ccd9CAylrl0ZQMDJl92Hrqy7rh/sPnAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909034; c=relaxed/simple;
	bh=AaCQZIgKmtK5Hw02QurILQM89f9sl2u3gRGEl9A98YU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e5WY5SjBwHlxz3XkvxwlHfGokRWq6wW0F1Iw8zpf91+NikQJq8kY2hoUWhrEib3KWZwzAHvhhUHIuCRbJO3uID4iHeXPqw2dRHlVQ7BevO+4wmmmPme0lv1oiK64cfaZIKP3Sglv9hHTTnggVAyF2VK8cXd0EBW7kair6vfL8AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fw/n1vXX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wAfmM7Pp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fw/n1vXX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wAfmM7Pp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839N9lY010407;
	Wed, 3 Sep 2025 14:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wkL3RgF5Oux750XuMatazgx1667K0ExkBpmhgYn9PrI=; b=
	fw/n1vXXnkYlYWwxU71aMiBffyxshRhivUQ5ytJ7LaKcRYFmq2t/hp+8FAZT0iLY
	Qt/zFNZTTP7Tvr+aCcWr/VzeWH9pw50bH8dOYvISy5M2fM5FGr3dr8jVxyC1hdY6
	X5pBQFwoA2mZBpqoOjVwIQBC4+5+QXSg6tELsGdBDsPEn32PCEmFs/tRXsfxvits
	vPMgBzZyojJ88vrIsFXHhj2yAJdl0LiePLV1/X4+ma+VNjXdepTl7fDvDPocd6H0
	cqNlm9ZRa4KRdzdcuADRpNUks5iPfpm0Quj7DPmWOwf7/GLQkFA5k2O00LZS0z4+
	ddvoMoFe2vUoe6W6B0rGjA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmned3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Sep 2025 14:17:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 583DjlIl036219;
	Wed, 3 Sep 2025 14:17:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqracxpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Sep 2025 14:17:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcLK9wTWoYIpQ5YwktEaZWSfyk4r2Axecpzl+tzc6pfVWOkaBacuGSuU8SOMuLMGfp3Xu3oX1qwCuAYTXKIh5QXBFlFso4+N8d2BIYBKOzOOJW/kVueP8KOZNAXB2PHFoGOYZga6v13IOr8pKXVce7r2qey6dFfFuh3chnxCiHjZQSj/bMdFmF2jrc37WGWhJYAxWBFGpHv4N+mb1sSWRETowX30xvTFX/Kun9Llsji71pQ/cPUrhmxIr6AEB1i1kFGKe+isVZ/Ppmg6dGj/Cyssq4oyph/2ktm5W5vlzZ+494j5qu3VLAnadPFtQ6hYmR/B0r+purIBRPobhOgAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkL3RgF5Oux750XuMatazgx1667K0ExkBpmhgYn9PrI=;
 b=aHW8GsgZgdK5u93PtQjb0gUxFQtvgooWO6UT1piMZg9KWqmw9d6/3SeJrgQM+YzqQnDKJd6LSg5yJ/vQTli2n6Wn0zX2R7rwsSFpb8b7x+4f4Rd71qIHrXOduzAutTEwoDxDabsfhD8bKwn+SDqxDmJ2HVf0nj0tG4ItV3J6J3ADpr1Gbfjbke2doNLMWopoLe2y0glydYTuDRxPXZz8n3eM0b9wI7Rxbxu+YzEz3RzJsPycMIx2DAl8ep+EUhQ3n8+qmY5yIQ6JWcZQu3ONlNA5GV4XIDeQEf26+IdxynMnjaqgSoOSSnw8ZMIA//wysDcYzrp7fpZlnMp1jBUFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkL3RgF5Oux750XuMatazgx1667K0ExkBpmhgYn9PrI=;
 b=wAfmM7PpbJsN9zYAZ12pYd2idfRHr1m3rXsmhOEPAtJL3aXvdCjGGSEMQYoF+1Gnk1MF1dFRTEmxbrFKZx4lM+0hRPLV3jMhppiT+FUIHycMMu9e7ZAFcNNx/0TX+09RoHu0wX1FHakh7+HS4mHQWyh8/xd+u7NTEOSf8FVZJqU=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BN0PR10MB5144.namprd10.prod.outlook.com (2603:10b6:408:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 14:17:07 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:17:07 +0000
Message-ID: <aa3e3a83-9eaf-43c1-92e9-03ae265d6363@oracle.com>
Date: Wed, 3 Sep 2025 10:17:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tlshd: Server-side dual certificate support
To: Scott Mayhew <smayhew@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250828222348.601924-1-smayhew@redhat.com>
 <20250828222348.601924-3-smayhew@redhat.com>
 <cc649f61-f3a4-419c-a861-2b4d23aab38a@oracle.com> <aLhCcXmJV0VQaJGe@aion>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <aLhCcXmJV0VQaJGe@aion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:610:b2::7) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BN0PR10MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c5c834-2c19-49d7-5276-08ddeaf49009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1oyWWl5emtaUDBHUTBjSzZ4RlZmSXFnZTZMOFBXcmMxZmM2bXFKTVVFeVc5?=
 =?utf-8?B?UGliUzduZFhaUzU1aStlMEpHS2RDdGpVcDJnYUVWZ3ovcXJ3YWJ5RTlZejQw?=
 =?utf-8?B?blRCSCtLZnZNc3BIYThPSVJZT1hoNEJhUmJGOW9IQlMzZnFqdmFwUGVpcTJI?=
 =?utf-8?B?ek5lS0krNkpuUGl5bnJjL3NNTlRYSHQwVzlWbWkxVEUvNXFzN0ZnOW5XNUtN?=
 =?utf-8?B?MDRyaWsyOXBYV1gwbWdGbG5JazhjQXpUS1E1ODI3dHRtTW1iZFhsSjk2UWZt?=
 =?utf-8?B?dnJkZzZNRzNkZisxdllmeXhFb1VzRVpINmxCbUJ3d3BQSWhQblJsN1l3Y3ov?=
 =?utf-8?B?c25paXVxZ2tGVFlZUTFqNTkyRnJxazBHVDRSMktGMlA3TjdWNnNsRWNrazg1?=
 =?utf-8?B?OUR5NzJuQjh4aFVIZGlOQVh2SnVDZkI3ZkRhaUZPU2JUSm04eXpqRmh4MVcr?=
 =?utf-8?B?SEpGNThHYjBFL3FleC9wSEFsNXBRTDdKODEyb3RxZ3RtWjMzSmlhazB0eERN?=
 =?utf-8?B?dW05emIxQUt1WmdpSFIxYlFxbU1xaWl3NHFKbUh6Z0FIdkR2bFBCWHQxVWRq?=
 =?utf-8?B?YzRpa1BTby9neC96NksxcmsyYXhBYitNVWI5MFZ6NTFDWGhZeFVsdm9YN0xT?=
 =?utf-8?B?OGNQQ0J1aU9GV3UycTIxQjVUNy8wVHM3d2FUTzUyUHQ3ZjkwSU5Cc1ZNUFZC?=
 =?utf-8?B?U044cWhWQ2hYVkplQ3hhLzA2b1hBUm5xSTRxeFJmSDZ2QStOallWNEdOUUlF?=
 =?utf-8?B?VlZQbUJyTFNPekNhNy9ML3BXek5RMG1XbUZobUxJY3M4SVhXVkFhWWZxRXFT?=
 =?utf-8?B?anlZRnplbWt6SkZZbllZWUY1WFBGSjN1by9FaDJ5blhBRW5TYUdBek1lLzFi?=
 =?utf-8?B?bGFRQ3JMNFVLMWFjcWFHYXp0cUFKdml4cVcwUTFXRVpkS1QrT29mdHZKS3Y1?=
 =?utf-8?B?THBybVk0Qnk5ZlMrSzF6ekR2YzF2WmpJbWVaaGxrWUQ1dTZEeDBrMkJKczB1?=
 =?utf-8?B?dWF3MFF4N01kcy9aMEswRmpiczdVb3NXYnFVaThQdGMySUdMSUFFQmY3Rks5?=
 =?utf-8?B?cXNvZ0h4azg4T24zbzJRU0JZRkFuek9ySDZjYWpqekZ1Vm1SZmxqaHVMdWhW?=
 =?utf-8?B?d21vQlAyb0FTWDA1SmFKUkpQZ1hvd3E0cXVRYStzUmhHS1ZLYmpXK1l3YkEy?=
 =?utf-8?B?cTd1Kzd0amFQdmJOd3pWS0lVWnZUMTJBY1JGNG5OTkhDcTd1a0ZaYkd1a3hX?=
 =?utf-8?B?aExDbVpxRzZTOTg1NG9XR0RWK0tUSlhORTdDbFNad1E2UWdpZjBLQnBMWG1H?=
 =?utf-8?B?UlpwVnQzV0d2aHpzWVQ5Y2U3YmlpeGZtMHg3ZXFvdVZjQWVUYk9IaGlIYVJE?=
 =?utf-8?B?eXdyQnB4M3ZyeGNBYVYyaEJBa1JzMllXNHF0Tmp4NWhrMnd1NjBjVVJlQ3dR?=
 =?utf-8?B?MDJPWGs0ZTdVTjJRWnF5anh2SlVzMkVxQ3lObmg1dVd1ZFNIYzVka1NsazNO?=
 =?utf-8?B?TXZmR2pvVEdTMGU1RFlvdUJzbHJ2dHBMTVp5Q2JOY1RrR2lwbWxKbUVUYnV3?=
 =?utf-8?B?MTNYRWJ6TWMzNGM0UFA2ZmhGc2VZcTZLZmZPdkwrR0U1ajVYTXZFNXE3T0Vl?=
 =?utf-8?B?TktwNXNKKzhaQXFFYk5lTnRUNmtrVTNia2V5MVpPQ1RoRXptT0EweDNmWXdp?=
 =?utf-8?B?b1U0K3hYd0M0Z09Gckx4azBzZW5ydjNFVWpGVlVMLzZDMUVNTUxOeTRTZmNz?=
 =?utf-8?B?VEVYQTFzZlNlZFZLSURVamlPKy9KT3h4V2gzOElKOWF0bTdkd1BiakJvbnc0?=
 =?utf-8?Q?BLcAe6Ax7sXLMWNWQ3PhC2HQkwtalFXEuYxi0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0EzTURTeEJUc1VvMGFJczJMUHZpeHJxS2UxWDZNdjJLKzhESXZTQnNKd0FQ?=
 =?utf-8?B?d1JWQldKOUttN2k2aG9WSS9ka3QzOSt4bjQwTktsc0U2cG5uNzRSVUcvRW9p?=
 =?utf-8?B?MS9GOWI5M2xENklnRHpjUGZ6bFF3UEFuYVRVd2NndWphczZDeGNNSGhvWVVS?=
 =?utf-8?B?MVlybUZrNHUwU0RxaGgvdktzdEdsaFQzRDFyRiszQzRidHN6eGI2QUFla3U2?=
 =?utf-8?B?bjR1cmthZ3hUNHVsTU81TzBmd0wwN3NYbEt5VXVyNDc1bVU4TEs3ZmpnMWtE?=
 =?utf-8?B?RllJV3JHa3RUK0FGRkkzS2IrQjc4NEtnaklvV0t0Y2NHQnV6cU83MHpIVXA3?=
 =?utf-8?B?QzkxODd2OFJJSW1kYjk0a3F6SWZoY2lmWTE4L2hYQktWUGY1a3BFK1A2Mm0y?=
 =?utf-8?B?b0RsUzdSOHdyZVFHS0ZEK0tmUVZkRGUvWC84bHNQQWlPSHBQbVJwTk1BTzM0?=
 =?utf-8?B?dzRMUmZOOWU0WURkZzd6RXBnUVZjdldKMmIvQ3p5bzVmWW1MYjVGL2gzOUZ0?=
 =?utf-8?B?Z2tjM0wwd2VpV1k2MjJjUG40Q1RTZHVlb2xKSlNXS1JBNzdYcFdaOUV1a2Zh?=
 =?utf-8?B?NDdiUm1yNXZibUlYb1lyUXFIVGk0MnpKTUdkZkdhQkFQQ09YM3FaQmlSRDRu?=
 =?utf-8?B?V3J0RVQ2ZzB4N2FIdEtFL0NOWUNBMFpZL0gzZ2kwMHkzWDl1ZExmV3lnQmNr?=
 =?utf-8?B?dmovTGFoZUZHcjNXbkl3UFVPK2p2M3c0UVplRFlrRDNiL0FwWVN3Yzg5M3hC?=
 =?utf-8?B?TGtISnNzNjJicE12OER3YTd6K29UNDlwc21XUmd0dzBTMVpNODB4Qk5TVDJw?=
 =?utf-8?B?TytIUXNqL1BDOENsSVU2OXVud0l3ZnZYQVg5QlNwOUhLWWZmeUM3MlJaRTlR?=
 =?utf-8?B?SVFSVkhobXVMUEc2NWJGRCtLRU9pcWhqMGE0Wk9MZk55QmJ5RUtMUkxNM1dx?=
 =?utf-8?B?M1ZWN2pyenlsNVVscWpMWGZpVUJ6Si9pd21YYWJoa045dGErVUVVVFFsNEhj?=
 =?utf-8?B?TzVXTFlLZmJ4R3BmM3BwRVNVTkgwRTFFSmptOHN6ZWtEQ2NOUExhZi8vMm9j?=
 =?utf-8?B?S1A4YmdDRW5YV2ZrNlNqMWZCMExQWDFjc1VQLzBjUmRFUnpIRG5QUFV6VkNC?=
 =?utf-8?B?U2ZjTHRVdW1CVHhSMitIQVYyZHFhRkNwSnUvNCtTZHY3LzZsdFVwTXVqUzAw?=
 =?utf-8?B?MU9iUDdVaFI3eGV5Q0QvdkpHd1FHZ0hDaEpLclRLcmtPWUFmcEJ6L3VwakRH?=
 =?utf-8?B?clEvclNKQnNnR1VtMnk4bmZGQTN2L01xeVdjSzJMTGpDWFNGSGpWQUEwZHdM?=
 =?utf-8?B?cXV4bnAxeGdtbVJwSTlROFdoV3lNRGF0bEtxWU1EY1dhekhxUjJocjIxczVL?=
 =?utf-8?B?STVFN3Y2NVIzZ3kvemMzZFVweUZsc1RkclNkZEo0R1ZRamQrODFnY2l3N0d2?=
 =?utf-8?B?ZDZoV3dDWHhiK25OdUZsME02OXZPczkxWlJLWG50bS9PUEQwS2tROS9oeWMw?=
 =?utf-8?B?UjNwMUNGTzVXNEhSOHZxdUZXTHNOdTRqWUF1Wmx3TDNadUt3N0ZyMjRlakEz?=
 =?utf-8?B?L3hQTnNxT29hNC9McHBhSGpYUGZWNDFUYnZMNy9YUXkrTklLcnNMMEg4Nyts?=
 =?utf-8?B?ZEFhSWlpUjVKR0t5a0Y1bVZsd0h5cXU4b0Y2d0xkSGErdE0xb1g5ZmNBanhX?=
 =?utf-8?B?UkhlbkppWUdKcXZyNlJFeUN0RDhENTloNDlUSkNNNFZ5MWhreVIyNTIzOGZk?=
 =?utf-8?B?OTdmUXlTRkMzcjcxTGJuS2hmbHpMdmRTRkhydE9peG5JZVVjc1h4TGYyV0hD?=
 =?utf-8?B?RW5NemhJcnkzUVhCQ2VlZDRzc0puVWRDWkpPREZGY2pRR25NT0VZUmFpSElK?=
 =?utf-8?B?NVR2akFEZUhqUnVueUdMaEl2U0RYR2J0bFNhQnh4aVhiVVRQdzlBVVd4Z1Jk?=
 =?utf-8?B?aEN4YjFsRjZUdUFjU3k1TGlYcXRkSXU2Mm9Qa2tJNkd2dTdOb1hCQVFFc0NH?=
 =?utf-8?B?L2NwdDJsVk95eG5hajdqajFlTnUxa2s0eUUzQU1nejVJUjFnelJkMVl0SUVn?=
 =?utf-8?B?NUlxRGhpTkQ0bEtva3BRZ1Zjb1B6ZjhaT0NjWW5KNHdCRzcwWkFDY2JMYkFZ?=
 =?utf-8?Q?E6JLI8juZpTZ1GuxAUEXmN+7C?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I86p8ug43Le30nZAyJNfQrHPvRHMXYV5KiSbF9agV2G5OvS72RIo93hvRx8VVwVrOA4NZc/YKb6ztYBEYlUdGWACDk7X5J9lsftNkI4j7rlDFKFmyZuUIs3aNDAN1J5fAaB6J1u4fuQK8T4hl7wMT/VGrsCv3UoP0Bdw5GGl9XtHYBB5ZcR/zL+3e0vSm9fsUoCKRM091NNvOXMHIQVfcrrRx/oknvXivVNjsyKfarldtac0EIlpQFD8tgKwsHObuOWbLAxRYx9POLvQvMaJROKNRZkAwwGU4z1DiQtQNHBaaCnCS65smCadNecw6XtN4Hpy6gaGqm9SzpjFT3GuoyLBE2o3UUOvOUSNc5wFgpT4eLqoh8otdOtmQaUp88Gm74Aqfw/tFSyP5Pnnu0RlZXYaya7i1BeBZlczyTaJm0++5pm/CfRqcOnO31Bwx4fIaBEk5Jz5gaBEQTfpbYxhye3aEAyp6Eg6jTvyclYFXIcewi7n8jeiAh9ciK3cOniM+9NLhB9zZl7Tx71RwSpHLIV5Yhje8cOa27+RjmIcrQ3fw7UvsYwj22aZbJduMoweeszT+tnWhKYlYhkKPimlZi4M/W0fee3lkydfSgjIryc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c5c834-2c19-49d7-5276-08ddeaf49009
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:17:06.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XgnKnTiq8I1Wqv94CjhsqyJr5jQNtout3I1UVi3TRWTwFzj1VvZQlQKFZnVxQqvIi11zQUJUxoofHavqLImYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5144
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509030143
X-Authority-Analysis: v=2.4 cv=D8xHKuRj c=1 sm=1 tr=0 ts=68b84de6 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=A3H8OfN2AAAA:8
 a=20KFwNOVAAAA:8 a=kA5c387SNzpbBrb0l2QA:9 a=QEXdDO2ut3YA:10 a=lnXKwzmWpdMA:10
 a=hKFNpMRl0UUYlmJlzFdh:22
X-Proofpoint-GUID: -eLMEeAJpbHjO3eOcvrXri6RELLXy0bn
X-Proofpoint-ORIG-GUID: -eLMEeAJpbHjO3eOcvrXri6RELLXy0bn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9JFDZq8dneyH
 Npac8NF81+e5AoMJuFsNZgVIn8ExBlo5wSXShsUg3i+AI8Z8VW4mv26fM0n8FxFob9WKMSdywug
 tr39XvHZLEyUTi0QNVlK2HD6OUy+H4KfDtPAvRhP0Nyq6iD/b+b0wv/kV+GoEB7zXE2l3w5+WXb
 vuQF8SR7wyEDR9gIrrYcSobDvnQdh+/ml+6h/8vW6b1uRt0EIz1+RT7H/q7kr15XvwWx5eTdcUY
 vaGPrgbmNM/nkbW6LXeRnSTp+2bu89FdzfdUhOjZu3oQkXAxRZUuSLVb8X7bjuKzTRmgZmB90uj
 Uv8fPlt8HGYUGybKcRPjGgfyrdja59ILmd6d+eu7Cd5Z5oD6lu1iVVFaW911iYHrS9za4nrQVWe
 fXSqpQ1n

On 9/3/25 9:28 AM, Scott Mayhew wrote:
> On Fri, 29 Aug 2025, Chuck Lever wrote:
> 
>> On 8/28/25 6:23 PM, Scott Mayhew wrote:
>>> Add two new config options, "x509.pq.certificate" and
>>> "x509.pq.private_key" to configure tlshd to use an ML-DSA certificate.
>>> If the cert callback determines that the client supports ML-DSA, it will
>>> select this certificate.  Otherwise, it will fall back to the
>>> traditional certficate (i.e. the certificate configured via
>>> "x509.certificate" and "x509.private_key").
>>>
>>> Link: https://github.com/oracle/ktls-utils/issues/113
>>> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
>>> ---
>>>  configure.ac             | 12 ++++++++
>>>  src/tlshd/config.c       | 12 +++++---
>>>  src/tlshd/server.c       | 59 ++++++++++++++++++++++++++++++++++++++--
>>>  src/tlshd/tlshd.conf     |  2 ++
>>>  src/tlshd/tlshd.conf.man | 13 +++++++++
>>>  src/tlshd/tlshd.h        |  6 ++--
>>>  6 files changed, 96 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/configure.ac b/configure.ac
>>> index a6d9d09..0dd23f2 100644
>>> --- a/configure.ac
>>> +++ b/configure.ac
>>> @@ -79,6 +79,18 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
>>>  AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
>>>               [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
>>>                          [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
>>> +
>>> +AC_MSG_CHECKING(for ML-DSA support in gnutls)
>>> +AC_COMPILE_IFELSE(
>>> +	[AC_LANG_PROGRAM([[ #include <gnutls/gnutls.h> ]],
>>> +		[[ (void) GNUTLS_SIGN_MLDSA65; ]])],
>>> +	[ have_mldsa=yes ],
>>> +	[ have_mldsa=no ])
>>> +AC_MSG_RESULT([$have_mldsa])
>>> +if test "x$have_mldsa" = xyes ; then
>>> +	AC_DEFINE([HAVE_GNUTLS_MLDSA], [1], [Define to 1 if gnutls supports ML-DSA])
>>> +fi
>>> +
>>>  AC_SUBST([AM_CPPFLAGS])
>>>  
>>>  AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])
>>
>> Nice.
>>
>>
>>> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
>>> index 4c54d37..20634dd 100644
>>> --- a/src/tlshd/config.c
>>> +++ b/src/tlshd/config.c
>>> @@ -403,6 +403,7 @@ bool tlshd_config_get_server_crl(char **result)
>>>  
>>>  /**
>>>   * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
>>> + * @key: IN: the key field name from .conf
>>
>> ETOOMANYTHINGSCALLEDKEY :-)
>>
>> Can you find a less overloaded name for the new function parameter, here
>> and below?
> 
> Yeah, I called it 'key' because that's what it's referred to in
> https://docs.gtk.org/glib/method.KeyFile.get_string.html
> I'm open to suggestions (gkey? gfile_key? option?)
> 
>>
>> But see below... perhaps the additional parameter isn't needed if all
>> the configured certificates and private keys can be retrieved using the
>> same functions.
>>
>>
>>>   * @certs: OUT: in-memory certificates
>>>   * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
>>>   *
>>> @@ -410,7 +411,8 @@ bool tlshd_config_get_server_crl(char **result)
>>>   *   %true: certificate retrieved successfully
>>>   *   %false: certificate not retrieved
>>>   */
>>> -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>>> +bool tlshd_config_get_server_certs(const gchar *key,
>>> +				   gnutls_pcert_st *certs,
>>>  				   unsigned int *certs_len)
>>>  {
>>>  	gnutls_datum_t data;
>>> @@ -418,7 +420,7 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>>>  	int ret;
>>>  
>>>  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
>>> -					"x509.certificate", NULL);
>>> +					key, NULL);
>>>  	if (!pathname)
>>>  		return false;
>>>  
>>> @@ -446,20 +448,22 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>>>  
>>>  /**
>>>   * tlshd_config_get_server_privkey - Get private key for ServerHello from .conf
>>> + * @key: IN: the key field name from .conf
>>>   * @privkey: OUT: in-memory private key
>>>   *
>>>   * Return values:
>>>   *   %true: private key retrieved successfully
>>>   *   %false: private key not retrieved
>>>   */
>>> -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
>>> +bool tlshd_config_get_server_privkey(const gchar *key,
>>> +				     gnutls_privkey_t *privkey)
>>>  {
>>>  	gnutls_datum_t data;
>>>  	gchar *pathname;
>>>  	int ret;
>>>  
>>>  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
>>> -					"x509.private_key", NULL);
>>> +					key, NULL);
>>>  	if (!pathname)
>>>  		return false;
>>>  
>>> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
>>> index 6b4535d..96b1b88 100644
>>> --- a/src/tlshd/server.c
>>> +++ b/src/tlshd/server.c
>>> @@ -46,13 +46,25 @@ static gnutls_privkey_t tlshd_server_privkey;
>>>  static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
>>>  static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
>>>  
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +static gnutls_privkey_t tlshd_server_pq_privkey;
>>> +static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
>>> +static gnutls_pcert_st tlshd_server_pq_certs[TLSHD_MAX_CERTS];
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>> +
>>
>> Two architectural thoughts when seeing this:
>>
>> 1. Generally, I'd rather see fewer "#ifdef HAVE_GNUTLS_MLDSA" throughout
>>    and just leave things enabled all the time where it makes sense. That
>>    makes for less clutter and better test coverage.
> 
> I should've sent v1 before I did any refactoring :/  There's much less
> IFDEFery going on in this version.
> 
>>
>> 2. Does it make sense for tlshd_config_get_server_certs to retrieve both
>>    types of certificates in the same array? Or, more generally speaking,
>>    where it's sensible, try not to duplicate the logic, but combine it.
> 
> Yeah, when I did the last patch I noticed that each of the client &
> server variants of the tlshd_config_get_* are pretty much identical
> except for 1) which stanza/group_name of the config they're looking at
> and 2) whether they have the word "client" or "server" in the log
> message.
> 
> I was thinking of adding the group_name to the arg list, which would at
> least allow us to use the same functions for the client and the server
> side of things... or just adding a flag field to specify whether we're
> looking for the configuration for client/server and
> post-quantum/traditional.

Careful, you might be mixing local knowlege from two subsystems. I'd
like to keep the config-related details in config.c and the x.509
related details in x509.c -- at least as much as is practical.


> I'm not sure if I could use a single list or not.  I guess I'd need to
> either store the index of the PQ cert or I'd need to walk the list each
> time in the cert callback each time to find it.  I thought it was
> more straightforward this way.
> 
> But looking at the gnutls-serv program I'm wondering why we even need to
> use a list at all.  gnutls-serv just pulls the cert and key directly into
> the credentials structure (gnutls_certificate_credentials_t) using the
> higher level gnutls_certificate_set_x509_key_file() API.  When you run it
> with multiple certs it picks the right one, without any cert callback.  Is
> there a reason tlshd needs to use the lower level functions
> gnutls_pcert_list_import_x509_raw and gnutls_privkey_import_x509_raw (at
> least for the server-side stuff)?

I don't remember, unfortunately.


> Also, why does tlshd parse the config
> and set up the credentials structure every time we do a handshake instead
> of just doing it once at startup and reusing it for each session?

Is it parsing the config, or simply walking the already-parsed
tlshd_configuration data structure?


>> Similar comments in the client parts of the series. Overall the series
>> looks like a reasonable direction.
>>
>>
>>>  static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
>>>  {
>>>  	if (parms->x509_cert != TLS_NO_CERT)
>>>  		return tlshd_keyring_get_certs(parms->x509_cert,
>>>  					       tlshd_server_certs,
>>>  					       &tlshd_server_certs_len);
>>> -	return tlshd_config_get_server_certs(tlshd_server_certs,
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	tlshd_config_get_server_certs("x509.pq.certificate",
>>> +				      tlshd_server_pq_certs,
>>> +				      &tlshd_server_pq_certs_len);
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>> +	return tlshd_config_get_server_certs("x509.certificate",
>>> +					     tlshd_server_certs,
>>>  					     &tlshd_server_certs_len);
>>>  }
>>>  
>>> @@ -62,6 +74,11 @@ static void tlshd_x509_server_put_certs(void)
>>>  
>>>  	for (i = 0; i < tlshd_server_certs_len; i++)
>>>  		gnutls_pcert_deinit(&tlshd_server_certs[i]);
>>> +
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	for (i = 0; i < tlshd_server_pq_certs_len; i++)
>>> +		gnutls_pcert_deinit(&tlshd_server_pq_certs[i]);
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>>  }
>>>  
>>>  static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
>>> @@ -69,12 +86,18 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
>>>  	if (parms->x509_privkey != TLS_NO_PRIVKEY)
>>>  		return tlshd_keyring_get_privkey(parms->x509_privkey,
>>>  						 &tlshd_server_privkey);
>>> -	return tlshd_config_get_server_privkey(&tlshd_server_privkey);
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	tlshd_config_get_server_privkey("x509.pq.private_key", &tlshd_server_pq_privkey);
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>> +	return tlshd_config_get_server_privkey("x509.private_key", &tlshd_server_privkey);
>>>  }
>>>  
>>>  static void tlshd_x509_server_put_privkey(void)
>>>  {
>>>  	gnutls_privkey_deinit(tlshd_server_privkey);
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	gnutls_privkey_deinit(tlshd_server_pq_privkey);
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>>  }
>>>  
>>>  static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
>>> @@ -120,6 +143,11 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>>>  			   gnutls_privkey_t *privkey)
>>>  {
>>>  	gnutls_certificate_type_t type;
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	gnutls_sign_algorithm_t client_alg;
>>> +	bool use_pq_cert = false;
>>> +	int i, ret;
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>>  
>>>  	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
>>>  
>>> @@ -127,9 +155,36 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
>>>  	if (type != GNUTLS_CRT_X509)
>>>  		return -1;
>>>  
>>> +#ifdef HAVE_GNUTLS_MLDSA
>>> +	for (i = 0; ; i++) {
>>> +		ret = gnutls_sign_algorithm_get_requested(session, i, &client_alg);
>>> +		if (ret != GNUTLS_E_SUCCESS)
>>> +			break;
>>> +		if (client_alg == GNUTLS_SIGN_MLDSA44
>>> +				|| client_alg == GNUTLS_SIGN_MLDSA65
>>> +				|| client_alg == GNUTLS_SIGN_MLDSA87) {
>>> +			tlshd_log_debug("%s: Client supports ML-DSA", __func__);
>>> +			use_pq_cert = true;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (use_pq_cert == true && tlshd_server_pq_certs_len > 0) {
>>> +		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
>>> +		*pcert_length = tlshd_server_pq_certs_len;
>>> +		*pcert = tlshd_server_pq_certs;
>>> +		*privkey = tlshd_server_pq_privkey;
>>> +	} else {
>>> +		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
>>> +		*pcert_length = tlshd_server_certs_len;
>>> +		*pcert = tlshd_server_certs;
>>> +		*privkey = tlshd_server_privkey;
>>> +	}
>>> +#else
>>>  	*pcert_length = tlshd_server_certs_len;
>>>  	*pcert = tlshd_server_certs;
>>>  	*privkey = tlshd_server_privkey;
>>> +#endif /* HAVE_GNUTLS_MLDSA */
>>>  	return 0;
>>>  }
>>>  
>>> diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
>>> index 620bd17..5419146 100644
>>> --- a/src/tlshd/tlshd.conf
>>> +++ b/src/tlshd/tlshd.conf
>>> @@ -39,3 +39,5 @@ nl=0
>>>  #x509.crl= <pathname>
>>>  #x509.certificate= <pathname>
>>>  #x509.private_key= <pathname>
>>> +#x509.pq.certificate= <pathname>
>>> +#x509.pq.private_key= <pathname>
>>> diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
>>> index 914261e..ed545e4 100644
>>> --- a/src/tlshd/tlshd.conf.man
>>> +++ b/src/tlshd/tlshd.conf.man
>>> @@ -125,6 +125,19 @@ a handshake request when no other certificate is available.
>>>  .B x509.private_key
>>>  This option specifies the pathname of a file containing
>>>  a PEM-encoded private key associated with the above certificate.
>>> +.TP
>>> +.B x509.pq.certificate
>>> +This option specifies the pathname of a file containing
>>> +a PEM-encoded x.509 certificate that is to be presented during
>>> +a handshake request if the peer supports post-quantum cryptography.
>>> +If the peer does not support post-quantum cryptography, the
>>> +certificate configured in the
>>> +.I x509.certificate
>>> +option will be presented instead.
>>> +.TP
>>> +.B x509.pq.private_key
>>> +This option specifies the pathname of a file containing
>>> +a PEM-encoded private key associated with the above certificate.
>>>  .SH SEE ALSO
>>>  .BR tlshd (8)
>>>  .SH AUTHOR
>>> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
>>> index a0dd47e..d9b68ed 100644
>>> --- a/src/tlshd/tlshd.h
>>> +++ b/src/tlshd/tlshd.h
>>> @@ -59,9 +59,11 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
>>>  bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
>>>  bool tlshd_config_get_server_truststore(char **bundle);
>>>  bool tlshd_config_get_server_crl(char **result);
>>> -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>>> +bool tlshd_config_get_server_certs(const gchar *key,
>>> +				   gnutls_pcert_st *certs,
>>>  				   unsigned int *certs_len);
>>> -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
>>> +bool tlshd_config_get_server_privkey(const gchar *key,
>>> +				     gnutls_privkey_t *privkey);
>>>  
>>>  /* handshake.c */
>>>  extern void tlshd_start_tls_handshake(gnutls_session_t session,
>>
>>
>> -- 
>> Chuck Lever
>>
> 


-- 
Chuck Lever
