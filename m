Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C401DFE0B
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Jan 2025 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737400126; cv=fail; b=X3MRwhCAvMJ8dSgX1IySPPIAo6jKA/D/g1AFQM2EQ6jK00xKw+4r6TeVqxoIuS4JaBnQWXmEktQyyglCyqw4RA7lMuHxSbSlSnYHicJr8yQSlK4evoJUwEdEzH9Kz5ZkbzsQokCDmN9hYO1oPdyWeNmUXoXrMu/LVgDf7sgwY9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737400126; c=relaxed/simple;
	bh=ye6iXZ7S3RqIf8WX8fFx3MQY3odRgTrLyAzu3wBgJgk=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iP/ZBuZeHjVdIIPpjCkpN5x9FxmuNBFAXJboyuyWkKh8Eu7zAPBzAf0a7nP88WauvQxVowGwFGOiF0EjuN8xhrltJBtwIFY36BOoX3so8zU5wS1Uaj6SYN+r9LOmTBz78YmI5wWo2sSuMgke9Od2yf3NFKOPp2PE6iz83PNs7Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bl1nmOOc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KU8YNKhl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bl1nmOOc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KU8YNKhl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGMxjT024779;
	Mon, 20 Jan 2025 19:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=W5sMAlPvqL0dIWpnG7q0pJAYuqIMMjwuWheBU95/P1w=; b=
	Bl1nmOOch+Dt0MVIz2bjqlWhYWDqE03NdCCNC0++N0cTfPyy9Qy2SD8hRy9QRz2e
	/wOutcuYKlJcNDbQXB9711FLO8olsk5gUc7IBUZwuwqL8TsQ7IYj19aTHbGcPjNi
	GB8N3d0+QicN9X1LMIX55UMPN9LCBwHnSd9tf3ve+s9PpbxJo+i4QsH62zgFRYJk
	ql0SQQ8XhEvb+YFLfv4SJntqfB6SL6bdQjmz98nZAYsVBoqzXrAICItb+O2L4qGD
	4hj7Oh/qIyxUtA3Cxm7ROtrbX6rCEAMu+cexLj+xoTax+ren1zJ47FLLLB4GMn/d
	OaSSofXyCDWoBqcAOBucAg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485q5487b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 19:08:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50KIVdkA030485;
	Mon, 20 Jan 2025 19:08:40 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 449191myye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 19:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez7P4u50g14Vra2zfTeCvgTMs6f2y1mcZTpEcAGakS3BKr2iMuL3uTei006DDdMKnO9D1Mw4UIZPadC/Z7kRONXi4WufqUZJ9mCF74HAAcXU+ioPaCfHBTyrQQ4y8zK5yT8dw21e6LlZxs4vO/m/uxSy14Ek5gp5RTXV5GImdv3zi6Z71aSzYYZrNtNqqUPZdAI4XhexLSGDWBxRZWfEPNoDt6F2k+RBhXru8mDMRtxmRADPtxe9bB7XmdU1RmWnEZjWFEuZvXnkEIcQds2+d/uw7drUE7jt5shWayAJFTwLQfJTPJYwWQvka3bax9EpvbXlAzkuHhfU7sI9CIyszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5sMAlPvqL0dIWpnG7q0pJAYuqIMMjwuWheBU95/P1w=;
 b=QelQSiMPhipfbomRqQQQ647d62s9ZPDEew+83fERB4mzpkbhowjI6HcXVAwcFhXIkrG6GDGyUajQ6fTaQTsOTt/IbQHRbYuuNvLkp86sldH6WnqbZecy8G7iUYW7eoS5xMGC1rlvUbjqt5MwfPImj9r0MG8BMFCltcoSiIYlUIEmE9wRg1iTpGqsyKjp/ef22dPefvKwi29GSlfAAylVbKLtinV62SslkkwrAxFMg7LM70Afqmp8wCXYNIPflP3i5GNmhFgmJXgyVqjf2MZct0I65vPJshV/nxNYppdv7gNWhIPuzvxLbZ85mZVSOaPWhL3wu9HyRiKNJ4DiOnx67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5sMAlPvqL0dIWpnG7q0pJAYuqIMMjwuWheBU95/P1w=;
 b=KU8YNKhl6+pE3MmfJ/07J7RsA5VFuyyShA7D5SxVyoPsaY76OWdRcv2O71KgjlIhsnA+HjWETcn0CinsN1jU3TIfFoJfmp0aaJR4XtkBb5WX/cHPFit5HSvRinoSO3JEIv91Ougl0Yh2CYYzjcjLXljU25RmCdfBX6HZti8k8iQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN6PR10MB8189.namprd10.prod.outlook.com (2603:10b6:208:4f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 19:08:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 19:08:32 +0000
Message-ID: <c4459bfc-965d-48b4-bf28-bd9f65c7657c@oracle.com>
Date: Mon, 20 Jan 2025 14:08:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: NFSv4 TLS
To: Steve Sears <sjs@hammerspace.com>
References: <PH0PR13MB493959B3B8870BFD51EAA835A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
Content-Language: en-US
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <PH0PR13MB493959B3B8870BFD51EAA835A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:610:b1::31) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MN6PR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 19bf234b-8ae8-440c-d7b3-08dd3985d526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3hpMU9UalFhdUZwRFh2NDRSQnZSS1FrVkp5NkE3d1JaRTBaS1haUTdNdFBG?=
 =?utf-8?B?a3c4UmdCMDNxR3lMNllzZy9OeDhxUVAxcFg4Qzl2bkdzZDNkNnBWb0xyUE02?=
 =?utf-8?B?Rlh4cThOeXdSS1pBMzBUdktVWERjOXBnaXlBNk9yWHpEdzFZNG85R2ZqL3kw?=
 =?utf-8?B?Qjh6c2Fkc0xqVVFnWGQ4M1NlZ1E3aGNMQW85eW9vMWNXNWFDUzIzejFod21o?=
 =?utf-8?B?eStaM3RucytQT0hOMU5GbGMxTVZhNUw0K0ZoZUpBTjhZVVZrOE1qVC9RZlBL?=
 =?utf-8?B?S2p5bWNpQ0ZFUi9rUGErTjA3ZHJ3UldvaVhNcjU4VENETVlJRmFnUFRMK1g0?=
 =?utf-8?B?azJyTEZuei9xR2g4NkdUM3djT2t4M3FhMTc5Ymtnb3hLaDlGSHBjZXg0ZndZ?=
 =?utf-8?B?Rm52NUxtVVRqbFZPTE5qbTdydGkvOVRVdThQaHZ6ajUrZGtzRHVCeHlhMnNo?=
 =?utf-8?B?dmFBRmMyTXBlWXVzdkNkMXR6UkgrTnUxTlNQbVhxejA2UVd4MW1jenh5azhK?=
 =?utf-8?B?R29zTTBOcGpzcFlZb0l2L2xsQTQ0dktQZHAzbnMrenpONy9kZ2dqR2NqNjlw?=
 =?utf-8?B?TUx4ZmtiTzY4V1h2ZEZvMVAwQXVpMDQrYnhCaysyNmFrMlZDU28rRmhOaTVj?=
 =?utf-8?B?RDN0Z1lOT1prdzVlLzlkMTd2c1drWWNQdklxK2RLZEllTTNieXBnOFE4b3M1?=
 =?utf-8?B?dC8waWFMSHRGUWVzNHUzdC96QVBWTnhneE9aU1hMUUxQRUVJR2lCMzBRTzJD?=
 =?utf-8?B?TUhWOW1qM2xKNCsrc2NmeFlqdzByWXJsRk1ncm9FZ0ZodUZ5TEVxOTlrSjJo?=
 =?utf-8?B?Z3REcGl5L2lqVGI3R2N3a09vNTZ5K0U5WFVSbkZOcit3UmhhSWpIYjFRZTNN?=
 =?utf-8?B?VTRoNTQvYUtDR3pZODFKVkN3OEV0TWdra0YwN3hFRWpPYVAwd28xQ2dURDFa?=
 =?utf-8?B?Y1U4OFVQR0w1Nno0UkQwbFp4TUNUZTBON29yRE5RR2N0MkJVbkU4YVlsNGtH?=
 =?utf-8?B?UFZma3VMOFYwOEJMS1FRNEp3RUwrbERuOTN0ajlVTXVpdEhyQ0ZnakdkS0Er?=
 =?utf-8?B?dUZ4TVU4bUNMWUpoc2hWMy9QK1YwaC9vNGtBdlJzNkcwak5SVWpWbUQvbm1n?=
 =?utf-8?B?dWdFcmpPc2U2U1p4eDdYNXpvN1BBN3BMbWRzcU1HUnZtRGNNOWkyaVpaSGY1?=
 =?utf-8?B?RjlITGRtSlFjcmxGZEJtZDJseklDaFZOdHVJb21NOVhKRHNRK3F1d3ZnaTc3?=
 =?utf-8?B?eW55RmhlWVZ0NGM5R0JVTlJEUEdMbkUrNjJtM3pjVWh4eHUxdDNxZnlJdkJC?=
 =?utf-8?B?NVM3Q2NKN1BSQm9Rb0NUcmNsYmVmbTVKYUR5WjUxZHJUTTJMbDV2SktBSWJw?=
 =?utf-8?B?eVpyZ2RyMXpieWNiOGt3aWk3dlBsSHNIc3pCSXZzNW1CdWcydWVTNWhPVEl5?=
 =?utf-8?B?cDgzQ1NQL3Q2cGhlUTl6T29OZTlBa1k1MVo1QkovTzJzaEdBSU90Y2lVVkVr?=
 =?utf-8?B?TkNPYlI5U1gvZ1NBZmVBT1VaQ1ZnVVl4TzhMR1hkMWJBemdaeFZ0RWZSWXV5?=
 =?utf-8?B?dnZ4a1hPc01MWXdzZUM5L2JoQTBabHFmQ0ZCUFFBWnZDdFFrZWljOEt0SDVZ?=
 =?utf-8?B?SUV3cGdnWU00Y1kwWVZjcTVzQTIrdVlYOXlFR1V2L0NqSGZZREJHR0xxM2tN?=
 =?utf-8?B?Rks1bUVsMnQ5cWhrZjhNL0RuUkZTNjltOU9jeFNrYi9QdVpNcGV4UGpaRUN0?=
 =?utf-8?B?THJrbXdBb3BqVTBoSTR5RzBxcktUakRtenl3Z1JGSGx2SVFqNFRtOXZLaUs0?=
 =?utf-8?B?dDBROG9MRVY4aWtpVTl0QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2JxOE5PbExNWi9QWlJ0MTVBdEdrRU1rVXFkcG1QMGZQNHY3TExKUklVTTI3?=
 =?utf-8?B?QUNWQUdwVjNtNFY4RVkxNExoM0ludjlabXBLQVV5bDRrOW1wK1BRRlJ3SjFC?=
 =?utf-8?B?c3JmUnE4R3ZLbytFNEt4aFpZY01aZVJpMW1FS0NFZEVEQlZWdGt1S3NSS1JQ?=
 =?utf-8?B?azNGZldNTENpL09iL1JhaksvUmJUNk42NUtnQlpWQVMweGRyYUExZ2NQSGZq?=
 =?utf-8?B?Wm41VThRbWpWN0ZuUTJYeGxQY28zdTRxUVY4SmhJVWNGbXQxMWVQOHpneHRQ?=
 =?utf-8?B?QWRLQlNhZXVQOW9MTnZFeENGVEhKWjN5NW5FdkhuTmtlQnkzeGVWRTFSVldo?=
 =?utf-8?B?Mmg0MUlPczV0SGJ0UC9ad1RKdlU4YXVsSmd3QkZiT05IM0ZLS0NWaVo1Q0ZU?=
 =?utf-8?B?TFBoM1lKeE1Ob0NSZ0tsSU4yR0x1Zmd2WE8vRmhQVTEvSFRqR0dyWS82d3h1?=
 =?utf-8?B?R0YzNjRIUk1abmpVT2ZMcEhkY1B4MlFTOU9BTjZsYkNteUVNYnZiU1JJNXl4?=
 =?utf-8?B?L1RhS1FFUFRFVTQ1QlFOSjZyMEFqQ0g4VXNUT09kNVFMelMwWi9RR3pDTUdz?=
 =?utf-8?B?WWwyMlkwVnlqYnBOckJLTGhSbHloWWdJaytLeSthdXFlUy9WMktnMG84NlBD?=
 =?utf-8?B?c2Z1Nm9rVllFbStQWnFuWjRxczZLWVltSzBhWFd3TjNVZk9GZFNaY055TlhQ?=
 =?utf-8?B?OG85QzlqandKaFNJbVhtc2Z6bTlkakkzMGsyWjlTNWVXU056V2pFQjIwR1hS?=
 =?utf-8?B?RmxZQTBrNC9RVUJjYzNqZnhRamJpbkR0UjI4ek4yM09FL3pQZk00aGdCMWdY?=
 =?utf-8?B?NzhKazF3dHpyb28vQ01pbEpwdlBKRXR0aFF4cnVwUDJuWXZpOW15bktCcEJl?=
 =?utf-8?B?ODJMaWV3V0pFdFVRc0FPYnA0MWdNNWI3VHg5MUJ1cnhnek45QmdHOFM2aC82?=
 =?utf-8?B?a2pnUlBhRlhxQzJORjczbHBMMUxvSVhQekJYTlNHdW5wRG9saGY3aGFwdHVJ?=
 =?utf-8?B?T1ZwSXVCS1dqTnd5YXh6R09TNHRKd0E1dS9FeG5GZXA5UnpYV3A4S1dLUjg0?=
 =?utf-8?B?UzZHREpVYVdSTS9uNktCYUdPbVJQYnhGWForYUx1clQ4OHZYUUZHbHc3VGhM?=
 =?utf-8?B?MHRSWFZnSFdkRm8yY1p1ZXBiRi9WNFQ2Q3FSUnE5RWRhRUsxdWZKNGQ5YXg1?=
 =?utf-8?B?eW5zRU1xTEloNHROaE91ZnhBbkRyVVNqcFJnSFYrb3BMUmVyNnFUcHlmUC9S?=
 =?utf-8?B?R3RubVZJTWU5MVRDdzF3Ym9CRnBGN2pUSVcyVGNGRjNNWDM5V3BwUVBVOUs2?=
 =?utf-8?B?RjFRdXpkUFY2Y0Zqd0k4anFmTnBuemh1N2l6Q1I1SHFKbU5tZFRtODEwVXFV?=
 =?utf-8?B?RmhwQWNPc2tYRTdFRFIvQUI0Y0pEU09CNW9zbEVNaS9wRFpLWkc5Um5DLy80?=
 =?utf-8?B?RysvTDlpSlZOSGlPR2ZiOFJrRzhEaHA3L2NReWlOS3ZOV2t3V2d1d2NzSkl3?=
 =?utf-8?B?VElGZVdxSHRJbjBGL2Y1dURPR3hZQUpxMmpkcWR6WllDMEpmNDFxTkNDdzQ5?=
 =?utf-8?B?YmxUVDJrT1JzbStEN2NlK1BzaGJSNy9vNTRGT2lMZ0d5MGVOK2JENTBBYStq?=
 =?utf-8?B?N2VnYS9HcG0wcmtoNldFSG9qamhsL2ZZNzZpdmkvODM1QWNiK0NpVDhPSFNi?=
 =?utf-8?B?eVRJaWhzVjVyZzhlWUdxUVlSL1FJUHNFQWtVNlZDcEVqWC9LL2xNQzd5eUNZ?=
 =?utf-8?B?ZGI3eVNTYzQxbGlndFJndHFjRC9sdnl0RGN5TFc1ZlB2UVNBVU5MNVU1NVRG?=
 =?utf-8?B?ZEJrdUl1VmMvMlVaSHNjK3k4WkVPR2tma0RUZmVEMXpaNHpEZ1VHOHIwaTJx?=
 =?utf-8?B?R1E5Z1A0QVNWUHc0OTVTV0pHMGt1R2pqZjRWNjlwYWJIWnRLK0dIQ1pRSEhQ?=
 =?utf-8?B?RlpsT2N2VVdKUHVOcWFPSVovcWJQNVFFWlM2SzVwSXRHS25qQTk4bmU3N2lk?=
 =?utf-8?B?TmtialJGVnRLVGIrZnhnaWxVZDdNSkE0dHdXMlBlekwrUWdJY2ZCbTVMcm02?=
 =?utf-8?B?U0ZwcXNkSHdVcmlMcWdzc0tpZ0N4SldQTGx2NXhQcnRYdTRuWXZTWE5NR2JM?=
 =?utf-8?B?NldEUHNWVDdFbVZpYktTeXgvZVh6NlY1aU9LY1FQMTE5cm55cnpkUXFmdGZT?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UhV2mP2IJVi3F2c28RihCTNxHm8nxsasjkgQRDronTJYe2GnETm7VDiL0UJ0p8DcIlEUbWljqb7SNWziYXvg7Tj2pHGhWq8sRe4G18eXsw/rzlh65JOcojo6p1Jr2WzlstdA6DglYd4yde095PKP2952IkHkaz3o9jH3ZynEbh50E78ibNs6PbsbEfAYWOl6bZZiVYpZUl8rPQGf8OUcJyWz73UQdnVGPo0vJgSJ+Wd6TooAAxt+LJNNToJfJSIlknpPHetZt8eQ62frzdjm4pAwLAcTG/Zj9qwlpB7k/QSCjHKKW2w75WdRY7LN2q8b4FL/WDUo/y12/iX8nHiHe17LZOTtpZe2HfqauFt6FcdRJZEJpEKt41yVncb2Ys5h9UyTr11gIihkjFnEYD0n8G+EJyXZmA3hK05jOj/ckib5H/VxUeVJamJzNLgKh+Xn8EYb2l6Hs3DYUk+MJpgIpNr+q9ty2+5GFIpTrXFRyFLXXA3k35BR8S3mfGDZf1GFedDkFwW9ryfX2qIHCOoivyudRlqwraAHfaoVOuwmA1Ojuc7FNi48wie4m/MfwZkrD/LyNDQ90JR9kTSGSxbeZ4p+0aQN2SWCq1lR3kgyB9g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bf234b-8ae8-440c-d7b3-08dd3985d526
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 19:08:32.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVy36QpRqy1Tukc5IZ9502Wb1YUySNb4krSKZpam+7OHb+eL5V8RlzZUS6EaCV45ypsZuZPwlZ7p4j7Fu8Q8jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_05,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501200156
X-Proofpoint-GUID: KIBOQjROe8JmMAIdXYu4_8JQrfD279Dp
X-Proofpoint-ORIG-GUID: KIBOQjROe8JmMAIdXYu4_8JQrfD279Dp

Hi Steve -

Adding the upstream ktls-utils mailing list. Note also, you can
file bugs and enhancement requests at

   https://github.com/oracle/ktls-utils/issues


On 1/20/25 1:39 PM, Steve Sears wrote:
> Hi Chuck,
> 
> It's been a while since NetApp. I was pleased to see you wrote the 
> NFSv4.2 TLS implementation.

To be accurate, TLS will work with any NFS version.


> I have been tasked with getting Hammerspace 
> to work with this and am using your client to test using Rocky Linux 9.5.
> 
> My implementation works but runs into trouble with certs, preventing a 
> TLS connection.
> 
> I created self-signed certs for testing purposes; and from what I 
> understand several of our customers also create self-signed for internal 
> operations so it isn't totally test oriented.
> 
> I have not been able to get my self-signed certs to work with tlshd. And 
> I ran across this NFS Wiki <https://wiki.archlinux.org/title/NFS> that 
> says self-signed certs don't work: but it is in the Server section so I 
> don't know if it is a general thing.

Self-signed is supposed to work for the Linux NFS client and server. We
want this facility to be easier to deploy than NFS/Kerberos, though it
will take more effort to get there.


> I can make a connection using /openssl s_server/s_client/, and likewise 
> with /openssl s_server /and/ gnutls-cli /client, but the latter only 
> works with /--tofu./
> 
> /gnutls-cli/ is supposed to work without /--tofu/ by updating the trust 
> store, but I can't seem to get that to work. My suspicion is that if / 
> gnutlis-cli/ works with /openssl/ then I can apply it to the NFSv4.2 
> client; that might be too optimistic.
> 
> Did you ever get this working with self-signed? If so, what's the trick?

Our testing environment (bake-a-thon) uses certs I create with a local
CA. The only thing I can think of is that the CA cert bundle has to be
present on the peers for the certs to work.

But it's been a while and I'm probably forgetting something.


> Barring that, is there a way to get the equivalent of --tofu to the client?

There's currently no specific code for trust-on-first-use in our
implementation. I haven't really thought about it.


-- 
Chuck Lever
