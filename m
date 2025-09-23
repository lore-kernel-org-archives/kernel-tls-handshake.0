Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ABB1DDA09
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 23:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758668740; cv=fail; b=rTVwSnQ3ag/AAQ4NNM0ZSP8lDX+LXxZo+WBkrnVFtYpYM3KjGOr0zRa+gtTArRGObJkS4ZvSphF1p3F2xSkTRiVFdozcHLkj1tpP4oOkFywUsRjysiROCOKMhRu6zLMZJ8nCMopjXKViuCI30qyIidlIm9xUkiwOv8RCREQLnDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758668740; c=relaxed/simple;
	bh=ITNMfImzs+y8Z9M6iEhchQcPc9jcTGi7OEVc5NTnhnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KGjoyhfov5ORM3L5pZMvvxQ936yaIY0iZsgbRk16hAB6zwyaP956zPIwgCwWKKZfGOoHa8OiWVvdNhJh1v1KtPezb3MBUAr6OFHoJHVOyqoQOl3vGtJyyeszxNCMP9EWZ88XXGMFJrMbiZYOTtRVYXFj5EO6Fa08oHMqpytwJWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MDbFWowF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u95HQff1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MDbFWowF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u95HQff1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLbMfa006777;
	Tue, 23 Sep 2025 23:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AhdRAdaHgLJZpsXLXpZM/DjU6jyGO7mKOS37e36UXgg=; b=
	MDbFWowF/wEreGlcDqRpo3Jlgt3NvxJ0KCG3lWtarsbWbOgemUF9B+0H4qrFucul
	37UoaQLgPuBWYGhKRxTxAkeAeRETTLvP815NDF9gNkq6P0hvKRUE+jOma8uLwhmq
	JDn0Ikr+SYy5I4P5bN5z4X2+TlEf2k6q/PxiQ8fEoqvqnqTqD2oNgZUxNP/8sHgr
	Im0NGUwsRbAsPaWQLO3X2bCDl8UYYcOZAgHM6ARVaxuHWCeJZ+QjNyj4iFsECCd+
	ZvrDXYDlmyTyzE+IlfqVFJb95nPf0J4YvH1ewiFo29hvg/I33RN64sVaaYJbKdGD
	tY1+uDdU+qHiIDizk8nOZA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499m59dq5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 23:05:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NKVauV002078;
	Tue, 23 Sep 2025 23:05:36 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8ur6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 23:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX1uHf/9YSIpLzJTeSYumaKWo4J4Twr36GLC5CLszu5IOrF7hpptBg/M+fL3uk8Q9FhIKk/qBLflwfQEHoDR6JY2AAHdFae1bWJuG8+GHzXT1VPQaxGuX+PjqmZ2R0fddacwDc7eqgwo7JGwzDU8kT1YxsNuf4e8J2Icl53hpTEBhpCFUdxZkBdxJsGJvgHjHAW+C+N/h3DfCufQ/+pwV0AkA5uxhIQvTzVnkC/B0XAYk2Ono6APvILUsYESvx8BCG8yCRgPdg6zcw2ikSegV16A21zHdHjw/7uVTPivwr1EoQmWugNbMxWjzu5Oo4E17drbvRuw8TddAXpa98B8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhdRAdaHgLJZpsXLXpZM/DjU6jyGO7mKOS37e36UXgg=;
 b=dgtJ3pBcqDvAADoCnpLAaoXENdv82bcMNtQ+Wpk5oBO0sEbBI+IZDchRYpYpd95MEVijwlB/JdVbEbjq+5GPH0K8hIwdhUDY9vL78Ky9C3yvTyVT/oSfGHjC/oWn2X8ysTzeswo9i8XdwYUcEUiOV3sEpsecYhIdy6ctSUkbi45LGRkGcm9LjE7PFNUs11nGViYg7yA4J42dRs8eux6NojhIPoj8Z2qeUVUG2SN6pY6visQL3qLdPTdSDSu1bdsRxbhxiXSJzYxWDTCrqXGtWBElK58qfT3mgIiv6KhRyqrGPjUXcx1wW6OYZevVzPek70GjXL8PuVMAmuRxTENFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhdRAdaHgLJZpsXLXpZM/DjU6jyGO7mKOS37e36UXgg=;
 b=u95HQff1nOAOpkAZsiTlnDSf4qkH4fhxfp6y7C9o/yH8t0oIC+w2nmcC3Q0Wkspy643pH6ldZbsWi2of+LNySNeC79Li1359RCjc0eC3Fug+6/35yO5NVsrwVkdPl++J0k0iaQ+VbV1f72FXM6AZ5vfIoxffeowkbSPsldKbRj4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 23 Sep
 2025 23:05:30 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 23:05:29 +0000
Message-ID: <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com>
Date: Tue, 23 Sep 2025 19:05:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Xin Long <lucien.xin@gmail.com>
Cc: Benjamin Coddington <bcodding@redhat.com>,
        kernel-tls-handshake@lists.linux.dev
References: <20250922220710.1255102-1-cel@kernel.org>
 <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
 <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
 <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:610:cd::12) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c286f3e-b1d1-4e53-edc2-08ddfaf5b0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUNrV3dpZ054aXlmREMzZjhsWktBcHp2T1FBM3FGazRnWmZGYVlrYmVTUi9S?=
 =?utf-8?B?eExINWdaenBTTjhKZ2NjdjZ3TVdOZlNJem9uWUg1ajMvdFlnS3ZMbWxhMVMv?=
 =?utf-8?B?KytQNDdVVWdUSjRLbHY3ZG1rQmR0ai9reWJjVDRBKzdaMXo3L2tMbHBvVUlO?=
 =?utf-8?B?UDQwQ0d2ZFc0VEZwOXMwaGdQS2ZnRkwvbUo3bUx2emVzRnFzcDNFZi9YSGtt?=
 =?utf-8?B?YlAxeFJOVllDNGU0djRoMjQvN1ZhaGswY0EvQ2Z1REtuMUtYRU5veCtTc2J6?=
 =?utf-8?B?QjlMOVFzYkI0T3JiSVlYbTIwUFVvRTJoOGoyTVRISnd6M0dkUVhwTk1ZNklE?=
 =?utf-8?B?SmpDQ2lPcm5pcFc1QkZHd1VkVFJJQzdEbnFLaHZtSlZlSFMrVVpRY3lKWWla?=
 =?utf-8?B?Nk1VQTI5cktGanhvZzNxL0V3WC9CQ3pGRy9nRitYSFV5eWMvNWJpWEhPa3Vm?=
 =?utf-8?B?RkRwREJISlZMZ24rbVoyS0lOVS84b0NnK1ZwVFhDZ0pPWXQ2R21iNnUybUJ2?=
 =?utf-8?B?dXRjY1Zrdkx3MVJaVTdDaERibnR5dCs1TzY1RmFwSzRycllLS1hrSHFEYWsw?=
 =?utf-8?B?dHp2TVlZTlB2MmxwbnZjZTdRN1N4dE5OdVU3cGFoSStYU01mM1JTOU1jOXJ6?=
 =?utf-8?B?S3JPOTJOQndVYjBSQVpQQ2pCUGQxYVVHaXMxZFJVUVdYenFoYVhTR29mcVAw?=
 =?utf-8?B?djRzMlBGZXJ4WlBUUWJPdzMwaTgvSmlFemRFeC9GaENaV1pER0tqemx0TEtV?=
 =?utf-8?B?MXJXYi84cFR5OG5jazB6VjE4RkFneWFEMGk3WW1maEFVMEp3SThteUs5VFZ1?=
 =?utf-8?B?ZFI0VUxWd1paMWRhK1NrS0I3VklTeWNaaHdPMU5hNUNrdmcwWGt4WE9MaVdQ?=
 =?utf-8?B?NFYydkFEclp2K1d5elMvLzlDbHphQS8vZEsyQU5QUGs0NFphS0VDbmt5aWps?=
 =?utf-8?B?U1Z1M2hwYXhaaWNjNzFKckZudnlTNkFOK2kvQzFHbFVTRmJxYzVaWlhNVEJI?=
 =?utf-8?B?MkNRYmJSSjR4RG40d0sxa3ZHNU0xeW95UFNVR2xhbXhsM1dJZXlBZ3Vvd1ND?=
 =?utf-8?B?dnJsVGlsb0F3RExrYXlsYXBhcnBCY25wTXhYVzEvRDMrNmpMOUFkOFdybDBM?=
 =?utf-8?B?NUtHV1NlUkxFN0JsNHdFSVgrZmFMc2FCcjczSTNtcDBEcmNUWDdzRXZWQ1RJ?=
 =?utf-8?B?dWorYkVJTUg3VURBSFJnWjFwNUNKK2hldmhGcjgzT2dsanBEVnFnWUM3T3Zw?=
 =?utf-8?B?WmQ1eU8vQ1U4Q3R0VGx5TlZCZEhiRUVJaWxIenFWMGFJTkdpVXlGcWJQZ3Q4?=
 =?utf-8?B?aDQzVWdiR1JEK3d6OVBjQ05leWs1dlZ6Y2wxZ21tZ1pWSUtUNVZxTjdxOG9E?=
 =?utf-8?B?eko0VDU0bWdiZVhpMW5DMnFuVFNIdHc5Tlpod1FoN2NDMkt0NmFTMDhkZHBB?=
 =?utf-8?B?enlWT2t6MWpMa0I2N1o0N3FyRHBQSWFhdUtVZFdlSlZDOWNveEFZL0UzeElv?=
 =?utf-8?B?Z3BBT3R6VjUzNFNKd0NCaDdLZUNRSys2NDlKSkYwc0lCUEZkWkdCUm5NNGJ2?=
 =?utf-8?B?S0hMV2ZFaG9MMU5SZUJ5dEQ2MXF2b0ZOY041Rnk3WWpKN0Y5OTJzUkF5WDNm?=
 =?utf-8?B?aTBQejdLbVZJQkhVRmttd3U1YWJEQXM3M3RNeHFtRUdrU2pucDEvMTlwdnNp?=
 =?utf-8?B?anZXbnNvR291ZVV5NHNncXJtVkFndXFhL3pNWFREVi85TXJLcFhPcFNHcUNV?=
 =?utf-8?B?dzBEWkloMjMxUmtweWZOQmRXdWlBWFlGb01WenZFTk52S1VxaG85TGQ1RDkx?=
 =?utf-8?B?V3BQMnRiZHM1NXpaS3VGSENGU1JUcUIzQnhMMTNuYnZ2eWRGa0tqdTY1QnNy?=
 =?utf-8?B?TTNJNWlpdzI5QXpBVnpFSGE3dlp1Qk93STNIeFQzM3A1WC8ra1RuUHFBRmp6?=
 =?utf-8?Q?Jhc/WGbdJtI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bElKRlpSQ1B6cTNvcmY5NGFPaTN4T085U1VDRVh2UDY0bE5Ia0FLYnBTNVVI?=
 =?utf-8?B?RHVxRXNkMEpTSHFDOGxFZWFYaU40U25qZ2F6SExVWlMwVG45SmNMNVNySlEy?=
 =?utf-8?B?blR0Y3UxSzdlb0NOamlleWcvRGh6eHlmM0xEbWNIUzcvTTlPOW96UURUTzBi?=
 =?utf-8?B?dTJvQVVENHR3alZlenpLZWRlTmRNT3pXdXhHa0RWR0ljaldwL0Q3QUJpMUl2?=
 =?utf-8?B?VFI2Ujh0RzVEZTVHTStOZUlDZkIydlE3L1VySVZvR2g1dEpOVUVGbE9IRUVn?=
 =?utf-8?B?VHJhV29ydG82VjlzaEVrdGNpd0FkZ2VyaGk0aFpTMEJyNDZUNmh4RjNpRHM1?=
 =?utf-8?B?T1FCakpScTFnczJUb2Q5U29yMzZoVEhObXJPN1lrVnA3Q0VrVHlXdTN3amxK?=
 =?utf-8?B?ODFYSVBIeHo2TzY2SjdwNVJFSGNPYU9BaXgxaTc5cTk1eDZ5OWRpaUFqTHZx?=
 =?utf-8?B?am1BR1dSSWwyWkVqUU52Tk9sL3FBMlp5M29oQU1ZMzg1STJvRmhibHI5TS9o?=
 =?utf-8?B?OEgyQjNkUjhwSTVrYlhoZFJmRldaR2FSN0hrQjU4TElyTXBiTHFJOHFBTmdy?=
 =?utf-8?B?Tno0VXNoK3gwdW9PWDJnNUJsUUxjUERSanY1akVpbU9jT0M5SGVNQXV2cWJW?=
 =?utf-8?B?VTRmeUxPWlRkdG5ualdNTHF3VlFheGVLbm1sZW9wVXo4Sis2d3Fwc0tKTGhs?=
 =?utf-8?B?OGVzZmtNWDJzTTNnTGk3aVFibkg5QWNyUlR1SFNDMjhJM1U4NVc5UWV5Slo5?=
 =?utf-8?B?ZWtTUGgrYkJQUWJEQmdKYktSM1NOZ1JFTDUvQXQrYjNQaEFNTmhTUUZpUkJU?=
 =?utf-8?B?anR5N2Y3T2pqemtSQmd4VjRUcU1DSi80ZXJhT0d1TTBsNTFPN2pRZ0V2dEZu?=
 =?utf-8?B?YTlrY0pGRXNLblMvYVpVNmdCR0dTcnphOHBpdnpPNktIclMwaEUxclB2b1Jv?=
 =?utf-8?B?QzhNWSs5enA3NnR5MUJQQ0VzME1HODBUdkcyN3VuRmlpaWpnYkFJU2R4N3hK?=
 =?utf-8?B?MndWS24wY1JWVm1TRms5cWFXaHM4SWcvRC9MR0hEVUYzeUpOMk5DVGVyM3kx?=
 =?utf-8?B?NjZXbm1nQlJpR1ZzUW9hL2lWb04ra1p1bk02NDFKNURta3lFWWkyaGszaXRv?=
 =?utf-8?B?Nnl3eVJSNHVOQktodVNwMHpLVGFMaEVVaVR5VDV0MzZnQktReWhXeU9NeWgv?=
 =?utf-8?B?NXNCdGlXd3B3YkF6THU1aDdTeUJiYllDbnIrYlRJaGp4a3F4Vm56MGlES0RE?=
 =?utf-8?B?NVpDcTNOZGRzQm1BRE5qeE9Damp5dkhNUnNLdDE2YWwxazV4NEtxck1jYy9U?=
 =?utf-8?B?V1F2RUJLZGtVOS83YXVzc1ZVb0x4QVcxRE1vQStYMlJVNmxyaHZIdHB1eVVj?=
 =?utf-8?B?YS81SDg5V0pUOXFxcGNZcVByNUR5bHhsalVGbU12V0Jod3c5blBlcFM3WVBU?=
 =?utf-8?B?NHhwdFdoNktTOXoyeEpNT3cxbnRjN2tiUm9TQnhSbXNjbVUwcStETVh1Y1gr?=
 =?utf-8?B?SXNVTm43NHBnZldQNVBYT0ZveEFRTmFzR3FOY2Y2amxsR3UrbnRvaXBCOFV6?=
 =?utf-8?B?N3FYQTYyNElMVEVpb3JwdFEwZW1tRzZXYXM3M2RYTWxiNWk1VTBnK3F3MGd5?=
 =?utf-8?B?L0xjK0d6NHJUN1NyOUlVOUtsZFIwdC9takRmUEpHeWlhaXRFVXpJRDl2Q2xk?=
 =?utf-8?B?STBwRDhXRU5aK2tFVTNyd0ExV0FqclRhL0ozU1FvKy81Ri85OVV3MExKZkoz?=
 =?utf-8?B?TUVnV0pmUC9SdmRMQVdjdTdtcmJiNmloVkZvY00yQVlXcXNPR3EwQzFDaERJ?=
 =?utf-8?B?U0VOL1VISU1mNS9RdEVyRUxsdFNibVVKR24yK3BnT01DejVBWXB5dUFsTHZP?=
 =?utf-8?B?LzgzQzBidXhoYXkyNHRJTit0YXFSMVFlTTB0b0s0WStFZFI2WWE2NUxYRlNV?=
 =?utf-8?B?NTUyNVU5WFd0Q3MvRTlaS3NSSlJnVEJvdk9pOUZwWjVxbzl6eFp1Qyt6aGoy?=
 =?utf-8?B?QzAvQ2VPbXZ4aHNiYkVqL3M0c1N5eXlmZDUrZ2V2N1YwcFdQWkE3aExxR0p3?=
 =?utf-8?B?V01NaldMcUVMb0RwVTExcXZXQUFOQXR3c2hFcC85Lzc2ZUtUem5BZHlaeW5r?=
 =?utf-8?Q?/2K5PoMrs7FiAxrWVd+N4loBc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m4rHhyTLq/enkHGH7MsfNWxDn4AC+toVPuSXYl21vx0dKTVGoGB/XqeCNVh70WayvsQPq5Jy/8czhWTw56ao18JnJMyRTr5LFyNEEbk5CQSp9RBO32MhQVuLFgaPpOPtAWrWEPyr3XYPQjTCKNoqGzbfhCE2DcX9a3GIEUpgo5bUbshJsXFSyIiI4cfQ3Yw/zsJlg4XblGRT4ZseJXFeK+StqxH9jhVuk+qYcKD/tY3QGBxAky4X812Duc399yYKkeBnBVSJZoq4K+7q8uonAhdtQxkKVi9qYOtWJj5r9kVZbUKA/YfVftHNYXpRotKwuInQx2zb8ABVGDLooJEAorer9qIyODU/FJQMH32ZWu8Ik0UNWoNNsV6HF6iKVywWM8HiijxjL+QQJHuXkqgXSkAUbbKH2YUPtQqEWh3oGoqZo1KV8MNaIIJJjdwkAzkryGWp7p1Jbbkx5xL2bIlFnDZASmnVaFgC5Tf+72+H3dN1tYfXQCZydo8YhR5g+81Ss8RR/2sy5AxyZlWcbSBY8ECwRYvzeco1lV89rDkiQJ8bZIP+kDLTUmhwn6LZqV7lrxInC1OevdWfBRWfVV9Wu5sskPQyHLGacmi3BoGSTbA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c286f3e-b1d1-4e53-edc2-08ddfaf5b0c3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 23:05:29.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRuVoa9DdPlTYDqrmJZ6OiSoQIgulQv+Nlz1mDJ/30DnAQ6i8OC5b0WussT+qndHU7QQ/BVogvk3PyKMM0OPOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230210
X-Proofpoint-ORIG-GUID: bX-7fabdaffJo_9wCa2Ez8Cmm9phB5uH
X-Proofpoint-GUID: bX-7fabdaffJo_9wCa2Ez8Cmm9phB5uH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOCBTYWx0ZWRfX6wRtoaR6RUlQ
 STE/GO9S/JbkUGUgttxjkFGOBXaxFWuQgZmWwJAFwYH9TNO6NPGruYLfESWofTHbV+WxsVjCKI/
 q+8SXjh4+OJpNSnwCCJXl113HHSS+L+I0yv6IU2I9ZsAh4IM8Pwp+IkyPigpUJHnejIAmTqhNAg
 M4qpaz7+mhM66zMi5cvPF2yFoyUhLWLgKunHMxG8RWX0Qgv414eNcD/yhX5RgzE3rflBMesWwYA
 +FYLE4N50njhPb7Z+I9/4nxBZG/khDeBPqkGc/m5R9hz5msMwwxkszpgXXE2k3WzPekOosQxWid
 gMZpnMwyjGB1i7TO1AyqLA8uk8rarxRUtojAW8OCpQRmPG/n+SypbifEQf5lrx4P2Fp6u72B5/s
 dGoydy65
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=68d327c1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=eMx8imYVk9LzcJ4X3ngA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 9/23/25 3:41 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 5:02 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 9/23/25 1:27 PM, Xin Long wrote:
>>> On Tue, Sep 23, 2025 at 3:18 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>
>>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
>>>>> From: Chuck Lever <chuck.lever@oracle.com>
>>>>>
>>>>> Static analysis tools have noticed that
>>>>> tlshd_quic_serverhello_handshake() expects its helper functions to
>>>>> return errno values, but two of them return GNUTLS_E_* values in
>>>>> most cases. Convert those functions to always return errno values
>>>>> or zero (on success).
>>>>>
>>>>> Cc: Xin Long <lucien.xin@gmail.com>
>>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
>>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>>>>> ---
>>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
>>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>>>
>>>> Xin -
>>>>
>>>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
>>>> Callers expect an errno, but internally the utility functions set that
>>>> field to a GNUTLS_E_ value.
>>>>
>>>> Can you apply this patch, fix up quic.c as well, and then test both and
>>>> post the fixes here?
>>>>
>>> Sure.
>>>
>>> But conn->errcode is used to pass the err to parms->session_status.
>>> What does parms->session_status expect? errno or GNUTLS_E_ value?
>>
>> session_status contains a positive errno or zero.
>>
>>
>>> looking at tlshd_start_tls_handshake():
>>>                 /* Any errors here should default to blocking access: */
>>>                 parms->session_status = EACCES; <---
>>>                 switch (ret) {
>>>                 case GNUTLS_E_CERTIFICATE_ERROR:
>>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
>>>                         tlshd_log_cert_verification_error(session);
>>>                         break;
>>>                 case -ETIMEDOUT:
>>>                         tlshd_log_gnutls_error(ret);
>>>                         parms->session_status = -ret; <----
>>>         parms->session_status = tlshd_initialize_ktls(session);
>>>
>>> It also seems mixed, no?
>>
>> The -ETIMEDOUT arm sets session_status to -ret. ret always contains the
>> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
>>
>> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
>> gnutls to kernel"). Passing -ETIMEDOUT directly to
>> tlshd_log_gnutls_error() does seem a little bogus.
>>
> 
> Got it. I'm trying to align the QUIC err process with tls13 code.
> 
> - tlshd_tls13_client_x509_handshake()
> - tlshd_tls13_client_psk_handshake()
> 
> - tlshd_tls13_server_x509_handshake()
> - tlshd_tls13_server_psk_handshake()
> 
> It seems to me that: When gnutls_xxx() returns errs in these functions,
> it only logs them, and doesn't set any value to parms->session_status,
> but sets it until tlshd_start_tls_handshake().
> 
> So my suggestion is: not touch these functions for QUIC code:
> 
> - tlshd_quic_client_set_x509_session()
> - tlshd_quic_client_set_psk_session()
> 
> - tlshd_quic_server_set_x509_session()
> - tlshd_quic_server_set_psk_session()
> 
> but change their callers tlshd_quic_client/serverhello_handshake():
> 
> @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
> tlshd_handshake_parms *parms)
>                 ret = -EINVAL;
>                 tlshd_log_debug("Unrecognized auth mode (%d)",
> parms->auth_mode);
>         }
> -       if (ret) {
> -               conn->errcode = -ret;
> -               goto out;
> +       if (!ret) {

   if (ret == GNUTLS_E_SUCCESSS) {

is preferred.


> +               tlshd_quic_start_handshake(conn);
> +               parms->session_status = conn->errcode;
>         }
> -
> -       tlshd_quic_start_handshake(conn);
> -out:
> -       parms->session_status = conn->errcode;
>         tlshd_quic_conn_destroy(conn);

We usually express the return code checking as

   do something
   if (error) {
      error flow
   }

That's why the goto is in there. But I'll leave it up to you in
the quic code.


> and then in tlshd_quic_start_handshake(), keep the code setting
> conn->errcode = errno, but set conn->errcode = EACCES for all
> GNUTLS_E_ places.
> 
> What do you think?

I think that still mixes the error return values for the internal
functions?

The reason I noticed this is I'm trying to add proper Doxygen
comments in here. The internal functions need to be consistent about
returning either only GNUTLS_E or errno. The documenting comments
can't say "returns GNUTLS_E, negative errno, or zero", for example.


-- 
Chuck Lever
