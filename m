Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C29A1ACEDE
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724042; cv=fail; b=tscHUgXSbyMdqZS11Wb2n5zEyE7BhBV04/EU/feg8CLhD/P9oYjUjclq2iTX83dYQ12sCgUd3Y4unXBCKUR/6yosBX+XhLW5grMAxH6qf2zOIU3dLLwoF/VWjTTtp8VWL3kBMelroBhoF0PV4SWpnhh4OLC3z6e14T/19cmi4l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724042; c=relaxed/simple;
	bh=QjL0g99i/0/nXFQAUqLL949SvPomfeyeGwCC/kYkKGo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CXM+Rbo+JjcRnpBPL7MQqU67r3K3wkp6HebVrybzIlXe0GeIApTjKYQy+AqVKMXskQBw94k5RhqhI6KGgXDKNgubri94oTuN2N8+UU7Ovsoq6+U48e6weYBTDHpSb53RJHtwyl88g3EASCoLm9I3pzkBkpcA9cNvuFJKwrcGPm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L21yh7ok; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=axOgX5Of; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L21yh7ok";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="axOgX5Of"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODQqFc017072;
	Wed, 24 Sep 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=k6t/WsrpCsiE88RwaqPbBqi8IipxspcbBN82fomAIj4=; b=
	L21yh7ok13nhJIQf/PKti5sTiGAsxP1UlDrBQcNuANR7JtJhff3eQkCEv4PIn/C7
	NA/7TF5VVq5Zq980UpyrA4HKqy9JtjCTLpp8G2wnLcayC9JXqeHQpPx3WPQ1m10Z
	k95MQcT8TzprRg8oNKXdpT8z6Zzxl6KXR8HxUvAWx7u8+mlqHAWce79G19DBOs5j
	WVAafDzWOHa6jNMQqwBZ9co1aVw/eM8rTvyT74dydKj/EkeQEtr1zzY9GVDLu3T+
	VolHFj3SM/g+sCBSBPmcQvWpqT75Y6Npmj/BzKl7dQHEV2Kg/2F/weleqlHor+WQ
	7WlFJ6a+lbjsCsRYfW13Zw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mad7y8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 14:27:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58OEAHT5036436;
	Wed, 24 Sep 2025 14:27:12 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq9p7a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 14:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2vSB0b2RTbHnGmwDRoI5/vPv2jzM8NdLQKZUFYOo+VN1fFC+Y+6RC04ovh23ek5p9GIeV2GdYTpw8dNoAWkIAtvxAMJFcfGtMkL7gcO0x8dENamy4bFxP5/gWHeg21YWZyXU5wz7hlX82IxLBufP94+t2YEWPUz3DmeZGU1ULRcW4SFhuDrrUQ3E9DBHTwJ0JT0pz2eubA0cxqyWs5Ud1QNbrKlM5srlwPNXNOIQKWVo0f2D0tLk+u6no2gyEM8BtVYX+2pn0xI6GEGykWrCeje8b9UoCPfiBG+5EMeXrJ/oP4083A1j5cQTdlQWZvHovPOLn40C6ptvXkM8CDjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6t/WsrpCsiE88RwaqPbBqi8IipxspcbBN82fomAIj4=;
 b=Hc8ZvtAbGZWA+J7Z9sk73BAqKPvAh8UpT8XjMDZnsjQ/LpuOd2Y9Y0Jhd4zHO50CN301asCnrE5HHuVYGRz8jNFZgSoP6A3Zuf51BNhY3dL2DoTygf/Se+WO2cjvvdK9nSmW9YgtZLgtcL14fSLpb2mNhJHNrFKp8nBmiatuW7/N4MXz16b4Y7VDU0qYdti9zgZiPlYaoHPxRNyYxdCA6iVAubfBdY7Es8+On7Z+LwNTRKVIlGSL249ljFc6iaMlH4F72CdREVx/ahbkunz1vSTO4fY43hza/NoZHE2LydbaaYbDtR0FSFD/10OJ8/hDTAGfdzT+vIqxp5wpzZ15rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6t/WsrpCsiE88RwaqPbBqi8IipxspcbBN82fomAIj4=;
 b=axOgX5OfpHr8B6+yNlvGjvcIZupat8H3k8eK1KqyaizrgGMhwHaJA3RImrgaYLTXLAcbzX2t/oPpVkBMOmME64dgptQY6To3UgrNT6T25v6jRuVLgWzhkrkJCNnGtFgc8FhUsgtnX864lEfNl8vdvyAKFa1jHlHB6iyZKd3/hRo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW5PR10MB5850.namprd10.prod.outlook.com (2603:10b6:303:190::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 14:27:09 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 14:27:08 +0000
Message-ID: <8b624be6-7c0c-4e32-9396-1a9ca4680f27@oracle.com>
Date: Wed, 24 Sep 2025 10:27:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Clean up logic in tlshd_start_tls_handshake()
To: Chuck Lever <cel@kernel.org>, Ben Coddington <bcodding@redhat.com>,
        Xin Long <lucien.xin@gmail.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250924000134.2429264-1-cel@kernel.org>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250924000134.2429264-1-cel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::29) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MW5PR10MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc5a216-1729-41d5-b42f-08ddfb767198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWtwYnMzMGh2bnh0MTJzRjdPcG5aMlpJMXhBbkt0TWdmQmhFVXZFTHZkMTRJ?=
 =?utf-8?B?QUJWU1lWRlpUVjZNVi9GT1NrYkZNQVdQUHl2OG9OOCt1RktyS2hxYjZocVJI?=
 =?utf-8?B?alh1Q1Mva1BxVW41VisxckU3R2NMQlJ1QmtMZ1d3M3ZKZDdSV2J2Ykw3Nytj?=
 =?utf-8?B?TUgrVWhDTU50UmUyazBPdkZtMlNGTjRPS0FRNGtTYWNUSnlDTVVpNVFjdTNm?=
 =?utf-8?B?M3lFZ0Y5SkIzdnRBVXBoVDMrOTNXeWZjVXNCaENlRTcrZWEzb3lBMStPZzFE?=
 =?utf-8?B?WVFzbVlBOUxycEVGNzl6QnV2OVJBN0M4WjRUWVlXN0hFUDJCVit0STAycUJ3?=
 =?utf-8?B?THpSeS8zR1VJK3NHQm05L2V6WnhDWUZaV2I2dzRGaU1SWVRLMlhJb2hUd2Yz?=
 =?utf-8?B?S2dhR3NKMjZGb2dVMmpOYktMUGwxTTZRWldJRzNZYTFKSEFhUUtqYlBPS2xN?=
 =?utf-8?B?endseFVtRitUbjAyd0lWaHVUK3BRajB1R25wN3BOVGpPQlV3b1JXbkJZZ2ZG?=
 =?utf-8?B?RkJlaHc0L2lkbjFlbnN5Z3Y1SnphbzdCOGUzUi9UMldNRmJaK09HR01zK1M2?=
 =?utf-8?B?bU10RTJuZVVzVjBrdGRXU3JQdldoYXFYMDB1VTUwMElsMEFUUWRnTTdIT0FQ?=
 =?utf-8?B?d3hWU3RDd2trQXVKbnovQnRVKzRSVW9walZZSVdkNEhOS1ArZjZrYnZ0elRS?=
 =?utf-8?B?ZVdxTmxnRmxrOTJ2dFdDR3pwSlZkRmFGTnpPMGNPQ2djZmoxbW9GbytweDk4?=
 =?utf-8?B?NUp5b3hqRDRhaHp1b3JZN0RxeGJQRGRwa1ZzMlo2OTUyc3NvYXBxNjUvZ0My?=
 =?utf-8?B?ZlBidkdWeVplTWZXeWZyT2t4eVNQcll2ZmVBS3pSSDdkb05DL2ZZdlAzSmVt?=
 =?utf-8?B?VTdlMlhmby9TTHhhZmJIdTJSdE93K0hvMTI4ZFBSdnlMREtQRmdwZ0xGU01K?=
 =?utf-8?B?d0U2cjV6Yi9HNHBIeFBMTERVRXJYQTlmR1lIelJ2RGFEU0w0cldGVEJ6eVZH?=
 =?utf-8?B?c0R5TXJVYWhKdkdkcm9HYkJiRWJpYzZiUlI4ZktLRGxTZzVvb2N4TndOUHA5?=
 =?utf-8?B?c3k4WElxU0pGWmNUb1hqaUVKZndTOXJVTDZoUFpxc0QwenNOM01xMncwNElX?=
 =?utf-8?B?djJ3YUg3cHFoTkV0ZzlWVlhGdXVHb2RmYUFQODVad1FVazVQbzNSOFRHeVE2?=
 =?utf-8?B?a2RSdFJVOGZMeDUzVzVQNm9nNkdKcGJWMEw4V3R4R0tQcC91ZzJlUWxYWW1S?=
 =?utf-8?B?Z296QjV6NFZHNTR4SnZONk5vazd5aXNGdGs5cGdtdTVYNVJmVjZIQmFWbTI2?=
 =?utf-8?B?aXhJYTRtRy8ySitCM3VVKyszby90bFBHTWRORy9sdytkdDZqN2ErYkZzcGtj?=
 =?utf-8?B?bkxDWmwzUDBhSWlJK2R3L0hSQkMyeEdMelc4T2tXSjRYSXl0V2k1QXhhVUd5?=
 =?utf-8?B?UGtzRHVvbHlJcGVGTWpvc0p3Vk5vbmtObWVidmJWQUpZMzRhaU9BMThlWE1v?=
 =?utf-8?B?UmRMUlY4eFNDTm9KY0k4TXV0MytLRVV2aHRRWllZT1VEY0hISkFoTTJVWDBE?=
 =?utf-8?B?cFFWMW9aNHE4WFBQNExhcW0vZk5mRnowRFl6dnl1enE3aFJScXdjYkUwenl6?=
 =?utf-8?B?M0RDd1crUmQ2MldsSVBoMFQrT2lVTEcxK2NNanlTWkZqa1ROK2tPRmRrdkFZ?=
 =?utf-8?B?aTNsQUZJeHBLU09YNzFkL1RNS01CaHZrZUhHSUxWRnMxTzdqeklSazE1K0JE?=
 =?utf-8?B?R25hVk8yb0Exb0R4alNoSWNsZjcxdk1pdi9WV3ZiTm4rS293R21ZbWF3dXFk?=
 =?utf-8?B?b1EvQXlOSXViT09TQjhPSTVGVkpjdHFENllrd2JWTjZhUUFNcWFVWUVsTmpj?=
 =?utf-8?B?QloyaEZIOWFKdUJmaXQrZjM1Z3g4UWVLZ0pJU3BmdHhVYXNuL3NwbXN6bWVP?=
 =?utf-8?Q?j52e5X75CzI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1telVyUkdrSkVHS05PQ0F0dWd2OTJ5NGJwUGpKWm5pdnJGdzFMWkNpclN5?=
 =?utf-8?B?clVCM3ZMbjhxYjRpVTRuY2k0VW5FaytxcnNGVEFTTUwvWmEzRHFoODBSUWpr?=
 =?utf-8?B?SzM3SlRYNUR2dlBaekFNK1lLSm9mM2c5Qk1ESVRheE14TjdnMVovRUVuamJk?=
 =?utf-8?B?R25iLzZGQUVPTDBORitwVkFFbWx1bjZJT01tQ0dHblNMTm5QNElGYnNWM3Fv?=
 =?utf-8?B?MWZiK0FHT2hCTmRFL1dmL2VWTXU1bjQ1eUZqUnNzRURSU2xXSGFlQVpTb1Ix?=
 =?utf-8?B?eXpqR3A1eHArejBrckRKdGswSGtoY1ZjYzA5MGI0alpNWTc5MkYwazlXZ24z?=
 =?utf-8?B?bDgrVzlWdTg1eDEzVXlrMmZNUGVueVJaVFQxNkM5RnNUbUxXZXlad05VdVhv?=
 =?utf-8?B?TVVLYmRIdStqVzA2WG5ycTRMUG85UFVIcmJOTXUwTjNIZzV5cW5XZVNpS2xD?=
 =?utf-8?B?NTI1RjZ3ckVWSllDcmRPREE2VGFLcnRvSlgwQVg1Q0doeUJhcVVjbVM3Ykxp?=
 =?utf-8?B?alZ2TXhKWDduMzdzMm1xUE1ycEIrOFVIYkpEeEdCV0tXWE5LVktrSjdiSUtL?=
 =?utf-8?B?Q1dmbnpGOUg2QUs1a1FEWEdwcnc2V2RRdmtZZW1UZjFZRWdtRXNpZG5CWHJR?=
 =?utf-8?B?WTNDQWlsYXZZUEVTZDVUbVUzcXlFYVdCZ0ZZV2dQdHE3NTFEQ3NxZWVKeHNO?=
 =?utf-8?B?UkMydVBlMWFnMUsyeGZpejZ2U1hNK3NXaGFIbUF2STVUN1JLcGZRYTBNSzlY?=
 =?utf-8?B?MU5BRExXK25IdTNZWlgwaW0rV1hKdlQrV1BHN1YvZUZkUFJhbjRJMHpwcHJh?=
 =?utf-8?B?M0xOR2pWVDBiMlVDQ1NwSWpKT2NDcFJJME12K2NaZkxEMnNSUlV2ZERmbVZV?=
 =?utf-8?B?RjBqeU1vYStzUW1RZ3g5cS94V3hkc3BINGVnajl3T2l6a25rK05LUnlVNWtK?=
 =?utf-8?B?YVFJWGhTb0dQQ0FyUFdDZXlnS1ZldzNHTzFxSWc1WWdUV1N5WFBNMWxkd3Bi?=
 =?utf-8?B?QTFZVjdrLzUyRFFkMVh2MW1RYnRpOHZFS1Y2TGs4NE9QNzRBSTh3ckdmQnh4?=
 =?utf-8?B?R1pJMVBpK0F1NHU3cWxxRzVRbXJNdU00SDRwWUVzOUJjQjR1OFdNL1k1R09I?=
 =?utf-8?B?Z2h5ZXZJenVmRXMyTmdObUlQSmYvenYvcWk5T3NKckdwc1Y4TjMxaDNyRnRj?=
 =?utf-8?B?a3lkNTV0b1ZxNlBQSHNGV2JWMCt4R3kxR3oyWDk4UXpZQ2lvVE1FVnpNREpF?=
 =?utf-8?B?NmZtL3p0M0padksrVld1Sy96VkczdUtlYmJidGt4RVpvUnJPRHVtbjM5ditp?=
 =?utf-8?B?MnNlNnF0d0VEeGc2UDhOSDNDMTNud3BnL0MrZVduMTh3eUpaUTFtcWdGaTBX?=
 =?utf-8?B?R3lUWFd1ZW9BRzduK1lOVkZwbTl2bEltN3BBaSs0enhWUFVDVzc1L29CbHIz?=
 =?utf-8?B?THVNVWVJdVc2dlpycVNsdnpMeCs1c1NSRGU0M2syVkxka0FmM1JmS1U4SGxr?=
 =?utf-8?B?Q1pVTy9Sd3VydVZGNFRwaTZFRkdTbXJ6eHNmVVAxZnpxTVB4SDJQVHNad01X?=
 =?utf-8?B?VWNybUNiNStRdFFhQ0M3anhiQUl1d0tiN3JrWktxaVZ1RDROeW5QQktlR2Fo?=
 =?utf-8?B?VlB0dlJIZkN2WlBTTjBmdUhna3h5elE2UUFiMnhoMTdEMHh4ZnVhbU5oL2lu?=
 =?utf-8?B?MDVwalViNHI0a3pKY0RESkx5Qk0venloTWpmTFZvUlFzenk1WUg3TUJXME1R?=
 =?utf-8?B?dmRkMzFtU2FiY0ZsSDFZSkVQQ1RtZmU1TkxiT2NpSXNrbWxPVGhQc2pYLzJl?=
 =?utf-8?B?SnY3NlplaW1CZmQ0Q2pOWXRBR080d3ZYbHd1Qlh4RW53elpHRXQwZFhvRndS?=
 =?utf-8?B?Z0hBL2wrZzJtQ29vUnBUejVoSkY4YjRaVXV0SEZWYU9LaGJDUmhLYWxlQjZJ?=
 =?utf-8?B?aWo4WEkwZ2c2VjR4NDdwdWhpMkk1RmJFVG15dUNDTDVhd2pBbWxyN2gwV2dC?=
 =?utf-8?B?OEZKVVhtL0RSMWE0c0R4OHpUeFE1NXRKUHgzYkl3WmowM2tFZW5palU2TTNp?=
 =?utf-8?B?MDArSXJWbE1tbWJNc1Z5TWJDWFZHakVmcGxsTmJFei9kbGIvZHRzZ2k1cEpU?=
 =?utf-8?Q?Qao4T77HyMQXAw+HufIk26GFV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8TRNnwzCe92OkvNbwFM/VxspiDIkDXbSXQm1mfmYsRo302GaQ2brHow2k/8Y5nez/U/2NcEx7PV7nGK1tNvQi0vaXTPx2AhV6MnE5sWM/LvHm0go86bclnV6H1VSvsk2scNYGXCb5NPbhon4GW7tu7EaeNwpDqXCJQxzQONTYauwfN09FDBxSDkCPGxK/urdvz5Q39EM7XOHhF0tosOdM7mtPp4de1uIrf/6eYL/0qqEWM8zSRDOyS7dkpKQgHPI494rXsz0GwG4GFIj95ANU+nNOYA2qHcG+lg/Zkc3zAwgFfu3RagNk1AvhIWTFmergD0Z5nK0DkI6+xGay66/cPPHcmMi4YXtUPeG0VRNANzuBJMSW50ZE6+Hyr+DJsuxqaYPdRMx/OJce6WgFmOAfynZxtbGvNutzFz7MuMPpZ8oCy7PCoFbFRzzzxj0xvQKZWZcNHpHOaqXrA/wUt+2gFl3tI/9Y9yV+tzyBuMcqlpyxN1Y1+QvR/+Z6qW0uGbrtCuaQ/FXZ9PaaEBrwvbVk4dIU67Yv4wm7V3RDf120NcjfQcEao33lkAz6afzaN1pY9t02CuhED+tBvrIcgAqdk4cboov2Mxaf6w1CBTp7Lw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc5a216-1729-41d5-b42f-08ddfb767198
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 14:27:08.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qWXGG120/MkaaMLclWPyLxjPPudoMd5Ic2K0XHFjk5BLoMeJ6Q3/6+ZAIr071ucUQ7eBt4MP0dVDTETVPIASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5850
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509240123
X-Proofpoint-ORIG-GUID: 1LoWZIO_QD7Xw5WbHh5puLwNg-JzPY_j
X-Proofpoint-GUID: 1LoWZIO_QD7Xw5WbHh5puLwNg-JzPY_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOSBTYWx0ZWRfX9bInCr+OPkcL
 w2PviOhJLD16bj2LFDYnyRvnN+Vvsxdpdx/H0pvKR8S6XnTOtKCjaXI1GEf4ngj0MrQgaL1zS6E
 TaTLN4ZBqQxjn0bgK0tJC/fsCJggEYDz5Q3h0VFTBKjP+NAwpVIptjC3sCaeKgLl9CHsdm0PsPi
 cVw3pEQPUKEGZLa3bVmcrGYrXT6Ev/78rzhtV024QocT/oxBaGsK3tRcfO70yeAtTbg9bBEbbAq
 XV4uO5HbvGoIrzz5eXuwzXTFwlt2X+aVvuqDtSikAIlPgDxuLmVq5c1KRmHzDdYHQxFCRa8D+Ck
 dfIKLl5vuhfyDflGoscZThy4WCDTmcgJ4zEkK4xtaPqvHXCPHopPR84o867ml2Q1hwGUwOwBLQ0
 ZTe9UaWn
X-Authority-Analysis: v=2.4 cv=Vfv3PEp9 c=1 sm=1 tr=0 ts=68d3ffc1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oy5EYI_Y7Y8k1Lx7x5kA:9
 a=QEXdDO2ut3YA:10

On 9/23/25 5:01 PM, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> gnutls_handshake() is supposed to return only a GNUTLS_E value, and
> the session_status field is supposed to contain only a positive
> errno.
> 
> GNUTLS_E_PREMATURE_TERMINATION is -110. It turns out that on x86,
> -ETIMEDOUT is also -110. Make sure the correct symbolic constants
> and auditing functions are utilized.
> 
> Fixes: b010190cfed2 ("tlshd: Pass ETIMEDOUT from gnutls to kernel")
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  src/tlshd/handshake.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> index 5a2893994d4d..44932b7a5311 100644
> --- a/src/tlshd/handshake.c
> +++ b/src/tlshd/handshake.c
> @@ -90,19 +90,19 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
>  	} while (ret < 0 && !gnutls_error_is_fatal(ret));
>  	tlshd_set_nagle(session, saved);
>  	if (ret < 0) {
> -		/* Any errors here should default to blocking access: */
> +		/* By default, a handshake error is permanent */

I had forgotten that session_status is initially EIO, so my new
comment makes less sense than what is there now. Will drop the
comment change.


>  		parms->session_status = EACCES;
>  		switch (ret) {
>  		case GNUTLS_E_CERTIFICATE_ERROR:
>  		case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
>  			tlshd_log_cert_verification_error(session);
>  			break;
> -		case -ETIMEDOUT:
> -			tlshd_log_gnutls_error(ret);
> -			parms->session_status = -ret;
> +		case GNUTLS_E_PREMATURE_TERMINATION:
> +			tlshd_log_error("Handshake timeout, retrying");
> +			parms->session_status = ETIMEDOUT;
>  			break;
>  		default:
> -			tlshd_log_notice("tlshd_start_tls_handshake unhandled error %d, returning EACCES\n", ret);
> +			tlshd_log_gnutls_error(ret);
>  		}
>  		return;
>  	}


-- 
Chuck Lever
