Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D83FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749405845; cv=fail; b=Ug6g1vRFlbBuXN5sDNgx/vhHqgOSrlvBQDIQA2DaspsWatwMXbzqB8JC4ipmSJeFXpPWrp2haQ6UVhL4V9JhLIni2rC/4Y5nXlv6kXhusiX5RqVV3JeaPetp1hHimmXCS12KBwfKyyYKD5ECIw4/K1ioo6lu3/wimQvxFyTBWNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749405845; c=relaxed/simple;
	bh=FNtbJCJQwn51Z8aGS9akdWL8wsuFaYZB/QDFrhuhjko=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cC3E3SN1F3Moy2YsqivRNwr7aTp/XJMSFp7+502aWu2DKQOBoyRX9am5pU9Vjahm3VpwZIoE9dTyp0Q8gjVpX/yxBh4XFjb75yO87CHiGt+maB/QKHWIhGjvb53AwBy4kNpKh21/yDETWwbb/CxpaHhrmV3zS6nKrlOnJ86TUCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p01Qacr+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TLzCAF+s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p01Qacr+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TLzCAF+s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558FxdnQ008670;
	Sun, 8 Jun 2025 18:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GSeoq1r7pKcvMSK98yhKi0dUXC56GGaWH2LxrLRbIxE=; b=
	p01Qacr+Bwb/pedYZe2QNcAhZgV7boZLJH1wdz8Af0tBDoDmCfxGyATctoYSoTqD
	Fj6ddgkNe0gW5jVrQNclqHzzfbwIUPFAIrVoqUkoH+iW4POIpgD2t7su4+jZ2Nwj
	fMXee4y0SoguMm5WSykP4Zw8RigzC2XX0/dsXfEjNjso4KDgKWWsPwMojvWmw3l9
	L+FTQ+HI/7o4/yp/1H8qQG4zffHoLQmG4MWfC+hUUwhYwrQH432xIMT2t/lpx4Xp
	prSbzVzAyVc2RxcraVgOVpptAIRigcqMOpW8Zd4cJvnEXjPIFaVCi0PeNb5j54ZR
	sblcrKnLouQPdY82f4IfMg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74s53r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:04:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 558GxC2i020939;
	Sun, 8 Jun 2025 18:04:01 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd006r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 18:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+NaKNgaoBLswErqBvISki2t3YZnSUs3hgOMpjtt/SFY146jk9p1fQfCM6dMtNT0Bgxggyr18ZPYXsxDgw2fR3Xlj0kPznHJpbp1LHwllp6EvxMf8q7TTYkaWFWH7hr79MnkxIqhAMOcvzW/0CSttGb+k+5E21kJwh06NMkoX4np/Vn3cAypu64VSzBgTcb/6Fq3YNmKzcTgJCIpJa+K8d/Joz/BRMGPnD8Ck7DHsLQOGCRe4NuS1TmILxuRvJnxDqJdDik5d6iLUdu5pjb5O/S99fcjTem4LXSbxpLC4K7JDsc+PmM4xXQ7h3ll23Aw3VbfIEOcpFjQUS3y9uL1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSeoq1r7pKcvMSK98yhKi0dUXC56GGaWH2LxrLRbIxE=;
 b=PwqWKEouSFj/Rl0/ecxQa06J6DvJd8cGkgLGOVFJNyvvPkq2l7VlKxXaiAlLqAuuIAuCPUY/aMWeiG/EV/x35aSZNLqgdBnt/ZmWxKdedvQf5NcUMUmWwWCsvdH6FUkHZJeLPjBx21Wr++cETNrTqPtza1s8YPjU+bmYnGyzWHI7z+ChBNbW9B0hH63gICjHvx9Qe8cnXcDKmflh5v4266PRoHpZIowSRmyMV2I3i53g9iKdPskLWPzVHPHgvcWbxGziaQDlYeMMSZo5QoDFv+9bKDZgInmgSwuuRNglc1lIYyT1mdTxCK20XvaxpMSMvBmxUxKc1CIkwHAcxbkDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSeoq1r7pKcvMSK98yhKi0dUXC56GGaWH2LxrLRbIxE=;
 b=TLzCAF+sZ+RaPFMcZg+UrSE9UBIA8454a6MOsT0dpG8QCdqQ74G+uutJZyGeKQf56f/kRAE3uf4p2VatP9yJdaWs1EBf49GMvv+oITHGv5kbWJLqPM9MS+135n/BKP+QUwA3MKFSJZ/XqA0OESPusIA1ogvAED2S1q1MoLV7rJ0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by LV3PR10MB7747.namprd10.prod.outlook.com (2603:10b6:408:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 18:03:58 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 18:03:58 +0000
Message-ID: <9f57e091-8e21-4ab3-981d-962a3d738e10@oracle.com>
Date: Sun, 8 Jun 2025 14:03:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Ken Milmore <ken.milmore@gmail.com>, kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:610:118::16) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|LV3PR10MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: fd87bbed-595e-4e3a-e810-08dda6b6d774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFdwdFM4RFJMNHZCWGxXS3FSOTBDN2d3SVBESThMamZDR0ZSZE9kUkQ2bjBp?=
 =?utf-8?B?ZEluVm4yUUU0UEVjSVJSUUVKTDBCcFcxRjVoYTc4M0xvekEyeDNjMGxzZGE1?=
 =?utf-8?B?SzN3NWZjbHV2UEdnSXJtUzhZcFRyc0NsNkI4K1hxWFVpVldWL0FlVXJkeHZP?=
 =?utf-8?B?L0g4TjhBUGtaQTNObzhDb1RScHhsUEwydUVkQktoYXpZcllXdWNKZUNVU3BG?=
 =?utf-8?B?OEdENENFenRaMUtMY3pkR1NrMjV6ZHhaZzlRMzArdHBxYXA1dnBHZ0Q3bEt3?=
 =?utf-8?B?aWZUamkwVXJtT3N3R3kxaGI0bEtoVURmSERMUzdaTTR6MVhSZHpWWEU4U0h3?=
 =?utf-8?B?RzUzR0FoY2NmTFM4bGo4Qjlaa0I4ZFQ3dDlZZHlneVVsSTlKR0k2OGlUQmZV?=
 =?utf-8?B?TnpaU2gzdzhzUG5WVHdZTDhkd0kxTktVTGFaOHJqQ1l2UldrNEw0UFl5UGxu?=
 =?utf-8?B?aVRwYk9nSnpxa2tXSjlkUzFmWXd1NzJFVE5KVUdGQXZneU1TVmV5Q0thbmpC?=
 =?utf-8?B?cWpNeXBHNUtiUitpYzYzSSt6dWIrNE1JamJhSFQrRGk1a2FhNEZuLzVBVmpq?=
 =?utf-8?B?SDRseE1tb3ZnYm5WdHN6WFVFcUU4QWtpQmI3MTYrcFBJZWt1bkxZTVBSbjRE?=
 =?utf-8?B?aHl5V1ljMUtlTFpOSkc3ODh6ZkdscDBlbjRhekNyVlBTKzkxb2JHaVEyZHdk?=
 =?utf-8?B?RnlRN1dWMTA5c0Q0M0pRQy9aemxJSm5hRWtISGlFN2hWQ3NGNThJNFF5Umlr?=
 =?utf-8?B?WUpycjAyLzVRelF2Yi8wUmg0cWtJTjA0NEpjOTcyRnJJdlhJMFFqajBYcG56?=
 =?utf-8?B?eGlBbW9lY3ZubjZJcER4VkRTLyswQ3V6dW01QWpXc21DOHBWT0I4WmZVR0Q0?=
 =?utf-8?B?bFN3SlZ4MGpTRFQvQUVDdncrR1Mwc2lnamtsaVkzK096RXp4K2tCeTRMSWlq?=
 =?utf-8?B?eHd3cWdZNmJ4NmFWZktXVDB0TGVyR0VDNHlCdUlKb2RqRm1nclRoODF1YkdV?=
 =?utf-8?B?VjRGcFpSQzFOMXd4YlF4akQxUktNS0psM3ovM0EzekJqK3NkUnVCeFltTk9y?=
 =?utf-8?B?ekpreFl3V1pvK1d0TTFQZEk2N29oRjNsNDNYbzF2em9KYlBRb3hiaUtnMWNy?=
 =?utf-8?B?MER5TzhxS2RlRnRLVEVMbXg4T1UvK052Tk5WdEk0a0dFRFhBUVgzK2tvRGxu?=
 =?utf-8?B?VmtFQkVEenJZVEhySU5CKzIvTnJ3MWpOZTB0RTVxNmRUU3lDSkE3MEc1YlBk?=
 =?utf-8?B?R2FraFhrRnZQUDB3ZkMzckRIOWNMQytKaldzeCt6YVdRaTIvYXJTUUdrUE1U?=
 =?utf-8?B?a21IU0kwQWFxZnhvMHNIQStLWjVFK3p3SkZiVGZWVndVZ3Rjam5zVitScVV6?=
 =?utf-8?B?bVI5ZjYvSnFYVmpyQUtubUpvcEYwS2NEU1FzVXFEZ0dQSXZXcjNoVG9zbTJV?=
 =?utf-8?B?Lzg1bGJqNFdLQmdlK1UyVzFiT09PUkFUMHhHVzNZMDUwM2Uyd3Y5RTJzczFC?=
 =?utf-8?B?L01YUmNNeXZuQWFpTlFVUit6SjdpN09jYkZRTFUwKytXNkcyVWV1ZFFpbXRV?=
 =?utf-8?B?TUhWWVBxNmNkM01iTDJrblV3WGZsVnZLaEVjWkg4cjJIN2dwaWhaMURsWUNG?=
 =?utf-8?B?RUZhd2pPTU5weEdXV050RFBtUHNVK1FUMUtrZllCOWhqU3hDSUx6c0FxbkNa?=
 =?utf-8?B?SWFYNmNmbFN5Q29ZQlNkcEZVMHdvNDZOLy9XdEF6V1JYenVUZjEyd0Q2cjdN?=
 =?utf-8?B?TEpCUFp1MUJ1ak5yek1KK0ZPanJ5NHBwVjcwZ1VsN2h3cDlMN1JXMzBZbWJK?=
 =?utf-8?B?RVFaZ2RaUWoxejVVbW03RnJnNU1KV0piVHhPOUNEMDdzc2pwb3ZSTDR3d0Fa?=
 =?utf-8?B?TWNFR0MzVmlGZzdjL0NOd29LTEs3TEIyVzdQOFNFTmdWN3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVgvdlFzR1oyRU5mYWFsRi85WitGT0pmOE9ldWJBd2tFSExMaTl1V1crRXdZ?=
 =?utf-8?B?eWUxVzdLK2dLNWhLenZ0NUdBdnFNTE8raVlVV2ZwMWNuVzU3Wnk0SDN2cWxn?=
 =?utf-8?B?d2IzTGMwY3NIVmJyV3c0Y2lqbit3aGo0K0twU0RYS2pqajJ2bFFrM1pLZjJF?=
 =?utf-8?B?NlJWaXFNUUkwRHVQZ2h6STZleW1hcVFFaXVzQ05YT1RzSjk5Z0xtQ1dXNEJj?=
 =?utf-8?B?YWhrMEdXT3NyZGYvRzl2bEE0TUJoV0lDYVRMTDhrWWN6cW8wZmp3OUtoU01E?=
 =?utf-8?B?SXNQYURnNDkxUy9aNnNkeHZpVDdpekV1M3hHWk1iUWwwU3oxU2pzTHNFRnRD?=
 =?utf-8?B?T2REK2VzRTVzNUo1d24yVGlycitXcEY3QXBjNkZKQlhPakszbTE1OVR6YjdB?=
 =?utf-8?B?aE9Xa2NuckZjMEFLNEs0c0xRQTVCWkppWmVUZklMTUNlV24rN0VuclFaUDFE?=
 =?utf-8?B?WS85WTJBb3dTUHY0bnUrMEFrTUVsRXVBUE1UYm4xb0RDOU9XTXF5cWhlOC9O?=
 =?utf-8?B?MGwzNWhMZ2J3bklsaUNrc290L3NEOTYxWnEvV0NXUHdPbDNHdVVSd01tVWw1?=
 =?utf-8?B?WTh3OVVVMUVQeVVna0V0Y1hvYjZBS3VaRFZhT1llQVBOWUhkTjQ0WUlxUStq?=
 =?utf-8?B?TVJEVXQ2NStKeWVONjFLREU1OGlreUNydTZlcTBKVExFVG9ZRytLUC9rem1M?=
 =?utf-8?B?dHVFMGs4NVBhUWxubUVkV0ZpcGMxYTVpdDZVaDhmYUw4THJHcURmcjJ4aTVx?=
 =?utf-8?B?VTZCYkVEc1ZkaklMeTRRYzJKWlR4SkRwZWg5enA3OHBJRnlRZTFCV3A4SWNE?=
 =?utf-8?B?VjVhdU1lNTJWUTdtQnJ0VzBvclo2em5IaTJVYUQ4UlFKSFZrNGl3aTRxS21Q?=
 =?utf-8?B?Y0FZazU3ZVphWDJGWHkzU3V1d3h6SE5nTlVGdFcwd0JjbTg0TjI5SFhmVm9Y?=
 =?utf-8?B?Q2xqZk1kT2lHbng5K3FrOXp4UTVleExsZGdVT2l4UEw0ZG5GSnFVbit6OVBt?=
 =?utf-8?B?ZU1WdGYvc1IvSHlTQjlEM0hXcFVpSVZJV3o4amtKV3RsdlhlWFRvcHB0cnRm?=
 =?utf-8?B?b2VtN3BYdEJXdmNBeGNIZkw3YkppdjBTWXJQOGdHRndzanhkN3hqeVRoK0NV?=
 =?utf-8?B?Z3pLQ09uZWNYQ0tVdEl5ekpVaWs5a1VBM0EyRWJEVGxmLzloRENnMHFxZlZT?=
 =?utf-8?B?WG1KWUs1TXZrVHZaSW9hNHBydlFmZHdtMXFnYmNISk1rSDVwUjNDMjlDZDVR?=
 =?utf-8?B?TnF5WDVjTlNVL0p4QVEyWW0yRlQxK1lJTGJ5U2ZMS2doNFJjYkoreEFpOEV3?=
 =?utf-8?B?aHlrdG1jMmNybzFCM1NKdU8yL2s0WDJTUnRJMFNRVVV6TUowYjMvbmtwQXk3?=
 =?utf-8?B?Q1VmNjBBZ2QzL0hJSUJ3R3NoVE5NMGxyYzhEdFVmNG8zYnV0d2tVOWlzSGor?=
 =?utf-8?B?U09OdzJ4MHpyNDNJMkpoUDh5N0s4TTByRXYwRGFOdjRQVmZQR044YS9LVGZr?=
 =?utf-8?B?UzFXcFozcENGWng2MFgxUEdOb3hXdXlXRUJWYTh3KzhmdUlnV3doZ2puV2tZ?=
 =?utf-8?B?ZUhiZFJnNnZCTllJUUdXMDlRYW9zWHZEeVZDOEdkdFBIYUluUkJaaXV3dlk5?=
 =?utf-8?B?aWhiS1I2K2NIYWRCL2NSR2tDc1pQc25vOVlZRldDNXBqek9DSWFEWmQ4bE5M?=
 =?utf-8?B?S3hIem9tMjgwNzRKM3JyVk41N0N3MXY0YnIwVU9NYjVnYnhneG91bmJYdnpO?=
 =?utf-8?B?KzBaWS9hN01hVWU5ZHZPTUpOYjc1KzlzQVpVUnRjamVlcHgwZDYzYXBjaElH?=
 =?utf-8?B?ZmVMUU9Ka1lUSHFXMlNOdFNDc1lHL05rejNTQ0hmdEJ3YlMxNXVsK1Q2cUox?=
 =?utf-8?B?Z0FETC9pRTlYdnZqY3VoYWxmc2JzTTZDS1hiUktJazZ4UU16MVRoYWdnTmdR?=
 =?utf-8?B?Vm9teUkwcjFuRlA4QzFKdlMwM2N0YXJncmEyLys3R2dqM3BXNkZMYWJZenVl?=
 =?utf-8?B?aHlMbXVId3B5UDA1QjlENGE4eFlla2lHNzUrbVdHM3pYTWNvWTU1SUNIZ1NJ?=
 =?utf-8?B?YzZRRW8ybnhrZlZPY2pEVFRMMlpRSm10TURpa3FoWklvd1dsRjdyZ0c1ZkNu?=
 =?utf-8?Q?Y9ApghmMiogDt7EHUD7jE3yKe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eDA6PkzePCMJTLOek5zDqMdzzdoioVTvdLFbJEAnaialIKnHPmFYudWqI9rmO8aJ2EeYTA1JWGXK7yrkotDMi/Lblbn9NdNkQ/fMzXXFnRzZz/sY7hjvGDmfx/BH9Z4jprhi0AI9Nz3ui3go1pwh1oTVAC2OfwZwhydr4u/jjy/PFEfS6FvXZ6aDIA2hNz/JThcfbyUx5zE6HnhZkurbEt9FRSx3uBjPdHQscA6vpohz+8rBpcFEa/jx8HU1/HeUBAT6cZdVC7ZlkyR3TQeE1FUwzPyejz9Q8n4k4TCExnX6Ds78QVqTvozOrxyngIlcjxas4Y2BpkOsYzR6rmqbfCqSkVhH4+kzB7JaeYdTRl206+30qdDUZGmGvrZ2ozN6yk/QGoaaIAHm8fWLVC5HFlngMTqwisYY2M201QK+TS4hS9O6vwrM3wGyhOtAbmtcmeUIR8LB/yukQXYxnBm0Y61kr5WrhAObeiOhOLzhBZWLw9MiUl7+EbZr/nHEgXRP/5DQ5jVOhNKbEdW9+BuLx0QaxcotiVEciEDUEjG/ZW82YDsnvdPiaJ4HER5Ni5TYlcnR/4R52XRVl823Ie9dGaDFdEOHcjCWkFz9TJheHRk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd87bbed-595e-4e3a-e810-08dda6b6d774
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 18:03:58.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkaWEAXYx2p6Qnk9bcoLIQ/ponawwPB+VUe6sRFb7NzLHXObzy4ZycljKHROEFqoItsHO0h/tABDDbaQXSxvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080145
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6845d092 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=YFKizrpmq3JaQVO-nBcA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: kXqiuedxHbDaeO2P40iyeq3Y7u7kWEKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0NSBTYWx0ZWRfX583Ns7xyjSyR 4Gb7afQIGXk3yIFA97w85ngMr9/cyacYJgHtmXrKj4D/DoWX2s5AwYsFZXW2LASLhI2ylOv+mqf De1TI24kFVns4SScpS8qb8wPgZN9+RIPD/wRTor1okmdngYsuASSpznAuIIrMWWKbwnTo7ojfoo
 lqD1/M6LS+QmOhU3eYvYXAuUcIMxaUZz/EUVCSczIEme/kADLpatAJRw1ZLfwKPDyeuTLXqupyK JwxqXXoYs2DvjJ86hnNlrR2GSICvTz9OII0d9qK4JnZJCBrtBbjPbf5Szq4TQejM/C8NkCP5xhD x5HZirmIKuoB2r12xNFvRV7tIfWoxSVrI+N5vw8erByc5No21nKI6Wt3LZUM/ya8A9sZiM4saie
 w/xRHI3GsS4hVLZpUrjgBEKjXHVjwy34kwxPHgzSPHjaquOMduHAF1XB5IeNUn9mJmPHZIK2
X-Proofpoint-GUID: kXqiuedxHbDaeO2P40iyeq3Y7u7kWEKb

On 6/8/25 1:42 PM, Ken Milmore wrote:

Needs a patch description. Why is this change necessary?


> Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
> ---
>  src/tlshd/client.c    | 2 +-
>  src/tlshd/handshake.c | 2 --
>  src/tlshd/netlink.c   | 9 +--------
>  src/tlshd/tlshd.h     | 2 +-
>  4 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> index 9c8f512..80107b2 100644
> --- a/src/tlshd/client.c
> +++ b/src/tlshd/client.c
> @@ -434,7 +434,7 @@ static void tlshd_tls13_client_psk_handshake(struct tlshd_handshake_parms *parms
>  {
>  	unsigned int i;
>  
> -	if (!parms->peerids) {
> +	if (!parms->num_peerids) {
>  		tlshd_log_error("No key identities");
>  		return;
>  	}
> diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> index b9de6b3..6d10eaf 100644
> --- a/src/tlshd/handshake.c
> +++ b/src/tlshd/handshake.c
> @@ -185,8 +185,6 @@ out:
>  	if (parms.keyring)
>  		keyctl_unlink(parms.keyring, KEY_SPEC_SESSION_KEYRING);
>  
> -	free(parms.peerids);
> -
>  	if (parms.session_status) {
>  		tlshd_log_failure(parms.peername, parms.peeraddr,
>  				  parms.peeraddr_len);
> diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
> index ff9e35a..34a1f47 100644
> --- a/src/tlshd/netlink.c
> +++ b/src/tlshd/netlink.c
> @@ -188,13 +188,6 @@ static void tlshd_parse_peer_identity(struct tlshd_handshake_parms *parms,
>  	}
>  
>  	parms->num_peerids = 1;
> -
> -	parms->peerids = calloc(parms->num_peerids, sizeof(key_serial_t));
> -	if (!parms->peerids) {
> -		parms->num_peerids = 0;
> -		return;
> -	}
> -
>  	parms->peerids[0] = nla_get_s32(head);
>  }
>  
> @@ -312,7 +305,7 @@ static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
>  	.auth_mode		= HANDSHAKE_AUTH_UNSPEC,
>  	.x509_cert		= TLS_NO_CERT,
>  	.x509_privkey		= TLS_NO_PRIVKEY,
> -	.peerids		= NULL,
> +	.peerids		= { 0 },
>  	.num_peerids		= 0,
>  	.msg_status		= 0,
>  	.session_status		= EIO,
> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> index 135e1e0..f058a1a 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -39,7 +39,7 @@ struct tlshd_handshake_parms {
>  	key_serial_t	keyring;
>  	key_serial_t	x509_cert;
>  	key_serial_t	x509_privkey;
> -	key_serial_t	*peerids;
> +	key_serial_t	peerids[1];
>  	unsigned int	num_peerids;
>  	int		msg_status;
>  


-- 
Chuck Lever
