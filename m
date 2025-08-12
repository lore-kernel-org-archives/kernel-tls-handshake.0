Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1C22B8D5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 12 Aug 2025 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755011060; cv=fail; b=NkRNWEMJIpksjnBXOp+wqlen/qoCnFrqL4At6UKNnpuF2WThKzF3mQxMcrnAkr5C8oCMua3fG5RTezU6KfBC1S7iqaI8SpN5+hNLFQtqCS5xmXkKFmrvkkqpCxW9naThDshuS9qBapGaJFrW75vDkHa4nR34PBjRSI09gXIZjeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755011060; c=relaxed/simple;
	bh=/ubPmJ7QOdH9gHXNPHuNdT52otgmkaOV7Gi5qyDkTAM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RvBz1MNhHXxScq+D1TjvJxliqtyKjRWwYQs3DosRq751WxBRUKRYJnBqrtkCy62Uf+4OOFeVbli3ePpBwTJR6bkX31Th/ZPiCOUYTK0JH9f0HDG1gWPcSoddtUEbc/tNdEqYjmEpLF18xvPZ2qADpFGJXe+O5FPp15GNklfqp/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rBHf9hWd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DWlM/uoE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rBHf9hWd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DWlM/uoE"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC8XU010994;
	Tue, 12 Aug 2025 15:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=He9bFifugQmbbdl7wkx3HboB69Zy7cJ69JDEzBDSYZ0=; b=
	rBHf9hWdIeY7pckRUbfSNRUddzkzH/cst1j2l02kB5sIzNzcRQoxaFYG72174mzI
	SA8ek4TB1+4uQFaNFCYmIVTzYUmpO6Pz0nLDHQbIgkEcWLU+crDybrFbJxYnsXN/
	MAsWmYhL8jFfkJmFhCIVMaM+A0JVUjeZKzgO4LUfaqfqcvbqVClAWB9KtH3MsDgd
	d6OJ1zae3WffC4qYqq4IGmvvzFiXYkwJClQUY8AvzTO4tJOq2mMer7WhVO5khdFE
	KM+ERlsaBj19KaO10TeVNwYZgLVDOWK4ZM+3tB7bIH9AKtNgC0fOOWSAZMQRe/Rx
	IMzDgm5BwIKjOiOA1zCEtQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ecwdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 15:04:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDf9Ch006338;
	Tue, 12 Aug 2025 15:04:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs9vkfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 15:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSxMt2vn5Qj65vBHhAS1/wm1nGEbnHjpv9rjoSrgIdbmHYbnbH/VT/k0TjRzgSwsBUGOXbCenBsIi74SUSe0pRoK9sznZh35tdItyzcC9o9lRl2jB+O+oi6C25wET1cZ0JN44VDQH32XN976J3NNMBZzq/qwZKnaQupvQoNZ0sZlL6EiI4IPEMtBek3hux7lW0POO11PK3Ta9eXSxAb39OFbnaZecK/3QQe7QhE5VkG8w9IDCSPjZK+nZyitK1h7+FnTsRzuQ6yNhXIKut37XCcmK5Ay/Av0ifBYbaCeWA0oqZyBd5CpMUXuzdPl2eo2uLuRGbgyd8K5o1N97Lzvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He9bFifugQmbbdl7wkx3HboB69Zy7cJ69JDEzBDSYZ0=;
 b=cLGpMb42S8ZbGZ/VWqYiF2ovCrSODbLcIpCkiUwmSg0Yi6RONGy2xlW9H/v+xa/x9xVXpj1urXauFFBXBnDkzphS9SloHyLhMrd7rdiPc+9B0guW4qroTIWoyF/n0UTRjW3BqnrtiEowGRPK98kdKYRBxLuE1/kAtMVfjbcai48XTtaz6ACTbRfyWqVpQVIdxidRBOsIbq/Fdetx8sejb9oWvgKPcUYs+djkJLJSebqoI4Sgrdjsdb+k/1Yy9NJvzUzi8Kp82NrnWhOOSR8rRSRXgTVJHrRFMyFVMAM3O5MFaNxMuFLITvq5wfHjy6eEB5G10+RszQuuW2Fe0by+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=He9bFifugQmbbdl7wkx3HboB69Zy7cJ69JDEzBDSYZ0=;
 b=DWlM/uoEoWNoPOPJx0dl/xrDE9HRBJ3jNgdhoWUj8vBV8ApfR+ofYUq+3UPunlHkduf9xs80l8NKP22fkQZomloAYr3Rmuf7NY794KvMYYD86diMld1rRUeRyxrYYXhRBD4BvtMkQfzE633wnsYoXDIwKnrtpj323XtaSN0b1PQ=
Received: from BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7)
 by CY5PR10MB6046.namprd10.prod.outlook.com (2603:10b6:930:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 15:04:10 +0000
Received: from BLAPR10MB5124.namprd10.prod.outlook.com
 ([fe80::eb17:e79d:5975:fa79]) by BLAPR10MB5124.namprd10.prod.outlook.com
 ([fe80::eb17:e79d:5975:fa79%5]) with mapi id 15.20.9031.014; Tue, 12 Aug 2025
 15:04:10 +0000
Message-ID: <ad2c6e92-4d42-4104-b9cf-3d21c7728982@oracle.com>
Date: Tue, 12 Aug 2025 11:04:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: client's peer certificate not recognized on my NFS server
From: Chuck Lever <chuck.lever@oracle.com>
To: David Howells <dhowells@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <960f5f19-7062-4c90-bcc6-f3abdb503008@oracle.com>
 <3b68e91d-55da-490b-9a6e-579383a2ab21@oracle.com>
 <f587f0fc-a016-4390-9b7f-37ff0cd53c85@oracle.com>
Content-Language: en-US
In-Reply-To: <f587f0fc-a016-4390-9b7f-37ff0cd53c85@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:610:4c::12) To BLAPR10MB5124.namprd10.prod.outlook.com
 (2603:10b6:208:325::7)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5124:EE_|CY5PR10MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 74de9100-4c52-4a94-097a-08ddd9b17e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjU2SkQ2Yk1KRmVyT3Arek05UjQwUU9hNHlqbDhEdkJGcUFHckVPMjNLZi9z?=
 =?utf-8?B?WjJacGxrMldiT09LSmE2MmxEWXJaUjVaVDU5SkJERFR5MEpLZnQyZzBySHF4?=
 =?utf-8?B?QlU5YzViQVFCNXZDcmRia3orWVVKK3gySkFvV3dQckNpZjlLNG9zTTRVVVRt?=
 =?utf-8?B?UEYrM2h0YnRVcVluVzJYNWhWMVdvZkpIeTFLdUZGRFhoaFM0UE9ScGtjR2o5?=
 =?utf-8?B?bUFuMTNMWjJ6NHNQRWp5aFFKZTdBYnVRaGVWMWwyNzJDa3NVdmQ3Q3pzMVNH?=
 =?utf-8?B?dVd5aHZxN2lDYVBsTHh4dlZ0TjlUY09EbnlJUXZueE8waE5HK3p2QTE4RFhq?=
 =?utf-8?B?LzdISTZBRzJPdHMwUWltVVBqQVU0K3IzWXZNNks0T0VLMXdhQzhSSk1Ec1Bo?=
 =?utf-8?B?djBlcjV6cDdJL0hFZTZQeWp5c1pMT0t2ZTZtV0MvKzN5SU9JK09iU2ZQNzdG?=
 =?utf-8?B?VGhWdk8raVkyQ2xBMjF2NWhTV2JpOUJlK2d4MDdNWWRaVjFiekhqajMvV29Y?=
 =?utf-8?B?dUprNWtYdTZiaFgxdnNXU3QrRzh2ZXFqazN2Um80TDhUT1A2cyt6RlcxRXZG?=
 =?utf-8?B?amMzU1BoMkhhckdNd1kzbWhCaVYrUmYybG04eU1yTDdGd1o1cTl2ZWN4bUtU?=
 =?utf-8?B?L1BOTno5ZE8wVmJRZVRpcVRuNi9pTjFranFnZ3VnMDFYK2FMT09GcEpWaXY0?=
 =?utf-8?B?NlJxRTRMTkZSVUVwam1UT21GWXduOTg5WUNlVVc2dnU2cFJDNUFVTzZpU3Nr?=
 =?utf-8?B?YjYwdUgySmpGOGN5TEVIZGllQ2NNUnFISzBYUG1wdGk3RHRGWS8xWnJYb0l6?=
 =?utf-8?B?UjNxK3UvM2xqQXl1UnVrcnR5SmJrcUxnaDJDNHc0N3FmYlNvM1lrZE8wNFQy?=
 =?utf-8?B?UlFkNFNWN1UwcDQzNmtxUDRyMVd5aUdXT2tjL2xJVWRJaFd2K1JHYWRBblo4?=
 =?utf-8?B?aVQrREVORHFXTFNlMzdCTW5LaXo4cFlHMFM5TGJjcEJBckYwMlFoYjNNMWJQ?=
 =?utf-8?B?VWorQ1EzNFpQSkdLTVorRThzN1NUdXlpRW1xOG8wK25vUU5uV0FsYmJGTXhm?=
 =?utf-8?B?bEhXZU91ZEVDdktmcTdTUi9IYmxRdnlHM1hxa0xIS29NV2dsZk5JUFhBWWky?=
 =?utf-8?B?NHp3ZkNvYnFqVVJaYk5XWlQwaTlDSlA0U3VIdFdCNUVvTVg5UXdqQ1JsRmp1?=
 =?utf-8?B?SUt5RFdTWW5uV09vV0ZEL21QSzVwUHFKWFFkZVc4aFZsZFJTc3J3M3NMZGlm?=
 =?utf-8?B?eTlROGQ4bkU3Mkg2ODhpUjJSRHdaaVdKMGIvL2F6ZVJwa2h5czRkM24vVHE4?=
 =?utf-8?B?UHovbUdZMXIzWU5LSEZlV0NOdU54dGFBMUYveGVsSlRKbC9WS1k0bUZ2R3Iy?=
 =?utf-8?B?Z0dSNG5UVXo4RFlsdHl3ejZtYlp6ZU95MGJQZUt6b1JPVnRxM0VCWEEyQjhO?=
 =?utf-8?B?RDJIbERFU1h6OFMrQjRvVVBUQ0ZsbHE5UCtWTXg2RkpaaGpXRmtuNlIrTHQ4?=
 =?utf-8?B?UVg3TnRmR2RUZ1pUN3FTN3c3SVZqVUFLbHcwcnJadE1va2JwMU9pNC8wcnRE?=
 =?utf-8?B?cE40T2VPMU90VjBMeVBjeVIvbHZWTVk0OWREcmp1QU0ySDlxZ3Vsa1k2T1hB?=
 =?utf-8?B?c1VLbjUyMlZ6RUxqWUFFOGtXY0JodnNZc0RTSnlPcHBNY21HVGdOdk42VTYz?=
 =?utf-8?B?THNwdGgzMW5nNE4vSXB1b2VpdzRDY3hMWCtZdzZXVWxOclpTT29HNlp0QnFy?=
 =?utf-8?B?VFJuWk1XeWpDQWpBc2djcmZKMis5Q0NuMTZRSFZQK2c5cEJnOElhdkRPNnZk?=
 =?utf-8?B?TS9iZEhYckpGbjVNYlBHZU1vRGpLTVlmMllkQkFxOXZ2NlpLWkVCQVBvL3A2?=
 =?utf-8?B?UEVDRjh6NVRBelExQlZNb3EzanJmRTFyemIrNnZNVVl6cTJtbXl4ZEErc01D?=
 =?utf-8?Q?yA3lsmpkRhU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5124.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1A3SExzMnVmcnNDaG9uMlNsVDBVVVU2em84d2lMb0dXcWVWZDJ3Wkp5NkV2?=
 =?utf-8?B?Smc4Q25VQVJ3cGdxdldCb1o1TVJYb01jeThoUFlMM3NENTFJNllCazUrVzI2?=
 =?utf-8?B?WFlyTk44QThMME9kV1NlalRPem9CTlRMVitNR1grd29ZNW5vQ2Jtb1pYM1lO?=
 =?utf-8?B?VjhPd0VQamN4V2YyUVhablRSOWdETXZ1NGxyNGFlYXJoajdYalNrNmNjUXlh?=
 =?utf-8?B?ZVAxLzdpcTBrT0RKRlVWUDhXNXkyL25sRmR4VzRieVpSUFdLdVVma2xXa0Rw?=
 =?utf-8?B?REcyTDZEZ2lXTEEzMDRIQUplaE5LYzZyVUYxTFluZTQwazY4UzlHRDVkSDJU?=
 =?utf-8?B?OWFBWmNKRkRVRkFOOWo3MjlublZtNnc5bnc3TjI2enc3UlFHU2F1RHc5S3ha?=
 =?utf-8?B?ZGZYK0hheTBtOU02N0dlRnRGczA0TDdSYjliVytGVEI1N2RUT2Nyc3AvNFFY?=
 =?utf-8?B?NklpY0EwRTAyT0VHZ1pYcUZ2MlhYRGI5dzdvZWhFcjl6ODVRZ1JWaU54QmVt?=
 =?utf-8?B?WXFERzRZNnZJbElmd3FtYUU5WGE2NHM3MjMxelVXQUNvN0lDK3dUWm1YNUlB?=
 =?utf-8?B?YlJqd3N4WEdwQTl2MU9qZWZPUXhWUGxlSmFadmdWTUV1aUF4NVlGQ1kzenBl?=
 =?utf-8?B?QzErNElxSVlLeGtVcDd3SVBvaXYrUVNsdUNYZG83dU1WU21qTVVKY0RBSHls?=
 =?utf-8?B?Z3NGS2YrV01QSmE5dzNxOVVXM1JTOHB6TTViaDBsU3JvTjBIZjhNSEcwNEVU?=
 =?utf-8?B?RkxCd21qM3hvdnJaanVjankvRFdPQS9XeHpxZGxxR2ZTRnNlY0FwTHd2SWJS?=
 =?utf-8?B?c002MHNYVzVLdjZ2MU9uUGN1aTVNdDFHbjAyUGdGWW5Nd1FGcURjS05PVmNa?=
 =?utf-8?B?Wm9SdVlHQXNWZVp6cm9KOTdhVlB2aWRpNldwT2pNUUk3US9xSWQveWFVUHo3?=
 =?utf-8?B?R2dPYVdmdHNGTDN6dThIYU9rSFJVTFYrQWRUaDNyN3ByMEo0NStDWmU4OVJB?=
 =?utf-8?B?b0h6V1lMUnByN0VoQklXaDBubk1VTmdvSHdFNThOVng2WmFJVm01ektsSVdK?=
 =?utf-8?B?NTBJeENzblhsNHAvOSsySEU1SUtENnR6ZWQ2UnBPWjkvY0UwTEVsbG9lN1JP?=
 =?utf-8?B?QndEUlRZL1JrSERzMzJHc2RBekV4dXNzYzNla2RwT2c0Mmt4Y1NveFIwMHNY?=
 =?utf-8?B?RVZNcGZmTC92UVZaM2ZtemZ4RXdES1dHUzZMaEN5dWR3bUx4b0FyVDdURjdm?=
 =?utf-8?B?dU9NdzVad2ovdG5LOHA4RXZWdDV6THJLNkZrYVo3VjZ0c1VyV1lpOVhXaWN2?=
 =?utf-8?B?dERSaXk5SGZjUkRMNm1kcFRsOThPQXhndnlaYkRLRldGWFIyckY4OXh1NC9t?=
 =?utf-8?B?UkdpYWQ4cUZwcDlpZzk3OUtMUmc2VWltZGFPMVFIWjhpTkV4ZFFEd2p5N1hS?=
 =?utf-8?B?eFllU3hOQ0JraUNyUGlYVHpyVWQ3YXJBQTZnMHI3dmFOamtPcXVjMWZwZ0lj?=
 =?utf-8?B?cFI5VHJhdG1tQ0JCdEhQWjAwQldINzdjTERaQjArNi9RKzFVTFc5UDZUV3A5?=
 =?utf-8?B?RlhlSzFnY2sxNWs2Y3BibDBPamJidGc0bE1STlBPWndyS25LdlJ5SXNvNlc4?=
 =?utf-8?B?NzQ2SmhXcXVqUFAyTXF0U01iQ1FpS1FhaEZ2dHJWVnlSMFZ4KzE2dkd6bFVR?=
 =?utf-8?B?KzFxSGRDRUZIc3NscDJNNGo4T1o0eTNsdHBwMFBRNDFrUWFxUXNNaXAwL0p6?=
 =?utf-8?B?WVd4TDJnOVhQaWdjOUw0dndQMlhuVVBiTzVTR1FNVkZQVVlsRFdhbGt4Q1VX?=
 =?utf-8?B?RTBFQ0N1ekVQd1pMMmx0YjR0YmxpK2RVQ2k1SjBDbmZkbUtQcWxzcTVZcDBi?=
 =?utf-8?B?Wm9JNUVpTUo5ZHk1NXJ2MEhBVXV3d0RjYlYxMTZuUVZ6LzFJL3g3VGJJNW1x?=
 =?utf-8?B?QVBxMXBBTzg4S3BUMzcyVmJPWjQxMEFmSXdMU0RIblowSW05dU1aRnJVSWRt?=
 =?utf-8?B?RkpKVS9oRklmYTVLRDAyYk1BdXVINjRhOXZjbnUxUXpuU1VsSk9Md1NEYUI3?=
 =?utf-8?B?T1MzdWV0ZTF5T01ncEZQM3BFdXU4U2dZdmJjUU5FVmRQZ1dmQWpOYmtwcFRM?=
 =?utf-8?B?UmxnQnl1M3RRNFFJcUkrKzlCSVRYQ01uRyt3MzJFSVVqVjluNWZqUzFSOUFl?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TbH+AdESPec0VWgNhBhIyo991W5qRoCJDeQ5XO5FT85RF8/PHXF3TaR0bzm8EwvQTnrb4ScmHLHQTy+VMVdQCs7gK4txrqnaVvdQ2rgHXR0LEWMZbjvEPhVjJiAY+Css54Gi03QUwbEtpRQY+c5kjrZkOALma7urgAjiq8Wy8qiUdB5KGtHqlRjR7ztsD18fK5ur9F9KhyDOfiCy1D7H5bhdKg9Q8Fo8WRZeDUeJyXfK+TYqt4XIogY0BTwDic8uBBI2Grh1AUOgqwlit3Lo4p41/8qab6jh92t7fKuvb+huP1uKARji4bhB0zrN190TCayYjCtIT2L8uuGhFgbw88VNWaZ9RRKQN18vvfX7pHgvtPjfACa6wu6MtAxLwWzN7r093r+ISNNx87NijXtKbKes4qGhdHZmxL7XtKCn4Vzb50bMEajCWPP09bQG5Tw3vwDLXDI6FGYQO4/izh/R0kap/705NNb92E/onAHCCxiXSW4olRce7r55ZhfzwOeXE85RAoYtfZiNPsTaCWSapEXRn3YA+Pblyw+1ZLdwZBqVfFtb6mN6nT+Rnr4K9dq+tMzD4ksgp7uasNeYj9BNFRsFBjWNdtFCXDkOs+5zR2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74de9100-4c52-4a94-097a-08ddd9b17e25
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5124.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 15:04:10.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPfj05hvD5V/kX2+8gJi//AhLGlGHx/7LulM2UsEYZTG5O6AWeUf3n2LR0Zgue7ltXhoCTaN4l9Ik3gWX6Fg3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508120145
X-Proofpoint-GUID: z5trNene739A3iGPbPlhMSHe8x8qk5Kw
X-Proofpoint-ORIG-GUID: z5trNene739A3iGPbPlhMSHe8x8qk5Kw
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689b57f1 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=qI-_hbGIhzfyeEV6csUA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE0NSBTYWx0ZWRfX5sKb57KHiU5O
 w/35q0b5kDsZmZ6LtQtpUjce6zKbOgaIBAWnzIke/EP+rZUkb3RcwAFs8cS0C3mdC0oLMr1685N
 lznXmKhVf9cgVk58xWZBNUrlMXga8qPs4y6XAH0GTe3GELSELcezHiAua4EtA6ePXmU6+Xgf20J
 2nlemWbua766EMU5ccVjzHS6Xh72pVTFNvxf5w4IEffuSxAErFsr+xf9/g/yoovvYC0RKX6B3Dm
 D1e5o9S8YCzuHhaxLakEK/PVKy948G6lkiH/4da5XFg1g8U8TtWK+ZONhMWy79w+7qHAESlsZRk
 2a8vT4rjiqJEw/x14FQNh7CJzbbM1jOmCJIX6QE94wYbbGIg8v6chYUbuLM1Oj5w+bvsyBfPyej
 KOT5r8mSepISBe4u4zTYx7pbDdEnxhbctbtgWPOkS65RLYJA9+QFoFs26fGGSB9Pmy4mT+Uy

On 8/11/25 10:49 AM, Chuck Lever wrote:
> On 8/7/25 9:31 AM, Chuck Lever wrote:
>> On 8/4/25 2:59 PM, Chuck Lever wrote:
>>> Hi David -
>>>
>>> I noticed recently that this notice appears when tlshd starts up:
>>>
>>>        add_key: Package not installed
>>>
>>> As it turns out, this is tlshd_keyring_create_cert() failing to insert
>>> the client's certificate in tlshd's KEY_SPEC_USER_KEYRING after a
>>> successful handshake.
>>>
>>> That means NFSD sees the session is protected, but since tlshd
>>> returns "NO_PEERID" for the client's certificate, NFSD believes
>>> this session is not authenticated.
>>>
>>> I can't find what is generating ENOPKG. This error code is not listed
>>> in my copy of add_key(2).
>> David, do you have any thoughts about this situation?
> Hi David, any guidance would be appreciated.
> 
> 

For the mailing list archive: the problem was the kernel was built with
CONFIG_KEYS_REQUEST_CACHE disabled. I'm planning an update to the README
file to mention this kernel build requirement.


-- 
Chuck Lever
