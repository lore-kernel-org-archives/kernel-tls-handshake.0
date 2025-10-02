Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDB12C544
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  2 Oct 2025 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759431012; cv=fail; b=PFl/V66yLuGlaLn+WbUhUipmdtUwd2fbpiKBG9+DGZVmgtQoSh7W6wwYncl55qjiHEXgWXdAlUGhAu8nSwJxAVOF/r81DfFMGTp6/3aecrR/L3OZ8mkBGgoEONNfTVpyRkSkaprJ0EOObBMzIeIzJh8e2nh9zshpa1UZNKV+qzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759431012; c=relaxed/simple;
	bh=IXdaIomxgDFh50Rl8kGTnF+0HVrPiT/A6LbfK7rHbGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R1in0+i7/UZ1D4r03JqWh4GGBugTjdBJZj9wyTJSaa/vHWcvHouXSjbIR8ExTFvH285piCfB7uIKOkNk+qwIHK/W5OYliTMhDHKrXAJt89IvK4X8nxFkoZz3b8BMjwLXkBKleHvBljL0uNCntPggyB0ekt73Qa3/IlgIWH2hnKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KvV5IiY/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PNIqsuAA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KvV5IiY/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PNIqsuAA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592DN2cW003361;
	Thu, 2 Oct 2025 18:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=B+L51GJQA1xuKuAwcyyrnRiL05DcTDn1VSClBLagI7U=; b=
	KvV5IiY/rS+okuzt14t3bgiz6IQv5xIThFxbg0PInwqZRUbUSXXLOIwb1DZq4/NF
	YLr1ytYc4BpyOObKU01N+cDiX4rm9D3vljlzPSWGOjBNbG5n0C+RU2qHJZ6NjPQL
	1Dti39q7TOC0TWilSVswfgsgLA+QK0PKNbumDFMeIE4NU+b/Gd0KkQ9ZYVlnRZn5
	hqi5GObwyEIYqMFLu/GN/w5orsGdm/yXBgAZWY0Yal94z5AX8mrQx1bbmm8wJ1X1
	mRpONm5dxDLt6C2eHqMw4cSDdfllFBK+td8XBg+PRWLUTy+JDlXVFOHLaBwaKVE1
	Ctk3lykKz0rD8iONBkATmw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1uvtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Oct 2025 18:50:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592Iedck003793;
	Thu, 2 Oct 2025 18:50:07 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw184j1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Oct 2025 18:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IugQxD2u/8l4AnuPo2D3dnwYLtsP5TfWgqTjx3qmIBmWQfVatFCJWLpyLVR8FhC7EM8hIrBFttO9kNAPrwT7RMOxKjj9x8eLp+T9qABVUK0k/RVFLe/v4OYLGK78H/fNcD2RgtfwG/6jH4N04XPs/RjJhlHk9vm3shPv6T1F0uyKts/T8hYk+plXZT6sE6bTk3ntL8vEAjFCr6WkG7eTgP8ZDjupwpxP7YC60c2gwarYT9TvAkmg3tc6UKyEV5OaDJyF3HhXZdgloa8D5DrtT3g6EWgzcFLkBfzgacAmMIefFDqNjr/rCBQ6KqgBPFRjI0ehwvXznaXUDLDRXn+mrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+L51GJQA1xuKuAwcyyrnRiL05DcTDn1VSClBLagI7U=;
 b=fY5aIqWazF6mfvQ0p0NCTJJCPj/qkNSsSDJdZwvcNo4V3trl8EEoTtvqAF0pSEAx6nJ8vKq407K+Nb+qg1NOb8cximCscyNUjww2b140/Sja+d3h8Ja31gpgamzmZ6cNwJSP2jvAMMZbgAmj7Hd/CmR9crKZOhvHHnfk3EdBVTvo/dfRuM9wPt8Suzn4NRk8y9Gs3EUd4uEzTZf46cpXfhvmDSqCGriAEfRfKupV6pkELr1MisW5ZT9Du1bfMERFAw22XzXOKUwARICBd6fl2yBLBSPAFacrS1qdn/stOuRFa+nMvvO5w2Qxo3QSXo684tuUG5lnpAgiCFsVrao5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+L51GJQA1xuKuAwcyyrnRiL05DcTDn1VSClBLagI7U=;
 b=PNIqsuAAkUZkcPRPRGjN1ZaHLy0VwyLBiIXb7dijVA4HGkPFJn6MYDztyU54dMvUilIssuvmbcp1zcHMsnSvyn474OsjI1yBRnVqn6CN4/1mQQPsSIZiJ/mGVvarnH99tPcL7HIGW7BgXiXZ1WiI8y8MTNVuBWxygn0UxRhdMEE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB4817.namprd10.prod.outlook.com (2603:10b6:208:321::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 18:50:03 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 18:50:03 +0000
Message-ID: <920c6357-fc32-4ccd-9f0c-3b9fe9386eac@oracle.com>
Date: Thu, 2 Oct 2025 14:50:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: fix priority cache initialization
To: Hannes Reinecke <hare@suse.de>, Scott Mayhew <smayhew@redhat.com>,
        alistair@alistair23.me
Cc: kernel-tls-handshake@lists.linux.dev
References: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
 <20251001233549.436746-1-smayhew@redhat.com>
 <768e0842-09cc-47fb-9f66-2443f95094e4@suse.de>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <768e0842-09cc-47fb-9f66-2443f95094e4@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:610:4c::12) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|BLAPR10MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8ec883-67ed-4791-6316-08de01e47f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGt2MzNYQVo0YlVOV1B6T3RaWnFxZTE3NTBRZHFLK1FNM25ObGVGbXVBTVJm?=
 =?utf-8?B?VFNQVDNNbExiNVQzZ2REK1NKUjNWamZNTnNnSWI5dHJiYUhuRTRlN3o1V2hU?=
 =?utf-8?B?VEVZMmZtZU1iaHNaMnpIZXNjZ2toZEg5WERYZE9nbVg2T25YNWE2K1N1MGdv?=
 =?utf-8?B?RmE1blUvMW8yQlRJWUVjMmVUclQ1WERFeFJ5SDVKQm5zUG9ka3FIM1ExMFpM?=
 =?utf-8?B?Q2d1WTNCQVlhUHZpKzl0bmp6SEJLQ0JQRUpFdzZFajNUdlUvbjRvcFlpV0hv?=
 =?utf-8?B?S3pwZjZQclJQWmlpOFcyUGR4ZU56T3dCQkFFeVAvOEhva1pOVS8vZU5TWmZL?=
 =?utf-8?B?MUNWNWxNcFF6ZVZUa1Q3R1Qzdk9RUUdLUDV3dktud2pnTWVLK1BFbldaTzIv?=
 =?utf-8?B?dnd6OHg0bTgxTDlNT3o3UXFwWGtvcmkzeWZRd2tjem80WGtOZG83MlE3OElt?=
 =?utf-8?B?VFE1NWlqQmNsUURtUG9JK0M4cktMaHByeEFic1hUcTUzZDVtVTRMMGVYRnpk?=
 =?utf-8?B?S1J1SHk2ZE5ucDNVd29ZVCttbWM3SDMvYzZvcmVFeXdkV0hTWmY2QmRaaEs5?=
 =?utf-8?B?OGNzK29zTlZJUUZ4V0FSNWtBSzhOKzhMaGpVdUZYcW80cHBkVnlEUEh5TGlR?=
 =?utf-8?B?S0s3TmdFMm5MVS85bGhWTjAvS1RvU0NoN2R3WFo4dEw4UmI3ek9qS0tJYjg0?=
 =?utf-8?B?SjVBczA2eWZyUkV2ZU9sOEo1NWRlL0ZheTNSOWNRZW1rMW4zZHJuOXYxTita?=
 =?utf-8?B?QjVDYVQyM0RZRDEzMXdQMUU1SGcxUnFZaUplSEpxK0dOY3gvNEkrd0t4NitZ?=
 =?utf-8?B?ejloZXU1Wm5ndWpqbExsU0Q0bDg4Y3A5b2VlOVVFdTFrNEtiZXlSNWdRUXVZ?=
 =?utf-8?B?WW5RQzRRVy9UbW4yQzJJTzB6andtdTY4dWhZYlI0VllxS0dEMS9EanZaaW9Q?=
 =?utf-8?B?dFB6QzVtWmNwMFpnUStWL3NmSG5TV09UU0dUdWNLa1hqa3JpSVBkZ3NIZTNL?=
 =?utf-8?B?a1lOSkxxWU01Y2JRb1BqRHZoSzBoWXZleXdhMUdnK2cyeHNUVTExYitpUFFX?=
 =?utf-8?B?TVkzQjRES3U0NTNSZEVjU1BiUU5hS2lmTUFuMEZjNGU0MFVGY05SemRYSmgv?=
 =?utf-8?B?UmVHejRGc2pqZVdQdjRjekVMVDVpZmFndEVaMWk0dHMydGFyTExDV1ZRb2FY?=
 =?utf-8?B?YTNyL2FsSS9XNUZZN2VCTWZwTXRBK1RzbmpoRUVOVjNiTE5GbDI2VktodEUr?=
 =?utf-8?B?VExhTGFtUldDTEFuYjRNNWJ0YXBnQU5XdUVSK0d3UjM0UzNENG5tY0xhblhx?=
 =?utf-8?B?RGFqZmJhaC92VEZvWlRWMXMvNE1SZWVJY0Z6TnZET2NMM253TndhaFppczBS?=
 =?utf-8?B?dXQ1Rkx3NnRpK1pPSStSN2gwbzdkcms2aFI2N3FTUmdaV2x3RVNleFhhVXlh?=
 =?utf-8?B?VGlRWUkwS3FZTVVkL0xqdWVWSWdNQmtIejlPREJ5QkVxNFlBaDFtZG03bXRl?=
 =?utf-8?B?Q09vSmNhMjN5bzdOME9zWTRuYU5ENUJMa2tYU2Z0QlhaY1IxZE0yeXlGVWJq?=
 =?utf-8?B?VHZ0WDB1UDBVajJhOTFtQ0NCYXMxQ0NnS0FvZTdraThQYm5zR0Eyd2pPQ3B1?=
 =?utf-8?B?NUY4RmpyOWlGckcwNisyQ0hEeVNSRkZTZ0tqdHZ6anJNdEVxZUFwTTAxRldJ?=
 =?utf-8?B?ZDExdnhVM1ljVTZxUElmZTg2YWx1UklSVFVNYzA0Vkx0bytLSmU0T1h5a2FP?=
 =?utf-8?B?NTM0K0F5c1MxRm9uaFFLOHBSNzRZTGxtTnFsZzZyNWpRY3RLNFZsZGhEckpr?=
 =?utf-8?B?SCtRK1Vmdmd0Z1BuVU93WTJVVVdhN0pabGZsK05NMjVIZ0tpZm11Zng0N3l5?=
 =?utf-8?B?L3ZzaGZUOWoxZ0J4anZRaEwxa1hwU1hDall1THpiMEJ2bFpaQlNMNEQ2Vy9P?=
 =?utf-8?Q?t41T1gyxSRPDv7JJm0RqbBKq2z3oD9oF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkdWd3ZYZ0szVmEyNUY4WnhXZ1lGVkVtTjZRWCsrL2NSUGV3SkFYOGZnZWhM?=
 =?utf-8?B?V3YzUmhCK0RtRHdSaDFIUVhsQjR2L3dQRHdnNlg0V3JYYVB6Z2hUTEs3RmJi?=
 =?utf-8?B?aldYeTRnVjkzeUVQMk5MeWU4b3dkQlc3WGJQd1RnZmo4WFBnZXhJV0NsZjFk?=
 =?utf-8?B?K1BwM3UrR0U1blE4UWFzN0JKUDRBc3M2dnhnZUVDa2FUTDJFVVlUb0FkOTdR?=
 =?utf-8?B?c2hRZkNhNXE0WGNHUStPQTJtUkNxeXNNdStIbEtQamo1cFVOWThMV284encw?=
 =?utf-8?B?UlhvN3l5OWFkL2o5elo2NHJ6UjBwN2dWTDMyUjdNckIrUUE0N2VxblVFR1ZP?=
 =?utf-8?B?ZXhNVFpWUEdBbXVzSGE0RmRFVkJvYzlFbUZoeGNESjEzYThCKzZHbnVvTHJr?=
 =?utf-8?B?dWRlMHMrQlE5RE5BZ0MxOVpOdXdpWG9RM3NqSXZCRDBIbnRQcDZzbXdnWktj?=
 =?utf-8?B?eEdTZHltQkVQMHZJdXQveER4eWdwYTZZaThzZ2RRLytkTkMvU0ljL1FSaDBJ?=
 =?utf-8?B?aFZWaERSWERzdlBrS05qd0NEK0owT29OeVVyQVkremVtS0FaSGhPU0VhaDRq?=
 =?utf-8?B?d1c0UlR4QWlmWi9SMjFtcEliOUtrcmpSOEVkMVRTV0k0YTY2cXVONG0rbjZ2?=
 =?utf-8?B?SVJkWTBmOHczcVp0WW1WOFQxTDhlVUZkeFR1TlYycmUrcDRoTkNmT3k3anpB?=
 =?utf-8?B?eWJBNGExU0JSeW1qWkFLZnhDZ2pFY1R3cHNrQ0h5QTVldWFPaE9vdWNDblFZ?=
 =?utf-8?B?Z2hHR3Rud1JtUWErSFhleFh3RC9sVWlKSkFFYUliN3UwV0c3bERFZDZrZzRs?=
 =?utf-8?B?b2tmU25VS2JtQmlkTVZvczQwckdzODJ1UGVTRS91WFhSQ0owb1BZb0t4STFO?=
 =?utf-8?B?cEt0cTBraWZSSjE3aDRMdDlaTkg2alhIekhSSVlVdEQ3M1lJWGlhM0RjcWNw?=
 =?utf-8?B?N01iNVliNnQxTFExeFRHY2dSWlptTlhaajZ5WnBuSUR2cHZqMFU2RFlIUjAy?=
 =?utf-8?B?Wndrdlk1SmlBYUxJa2FROCt4dGhLcXBUSmhYYUh3Ti9yNDdJVDh3Qm5uOSt5?=
 =?utf-8?B?SlltQURFTTFFc2VJVUVCSVVqejZML3JDbGEwS1JLTURpS2ZEZ3l2UjhPeDdw?=
 =?utf-8?B?Y01QMmYyUFdVTzB0QkE2QXdibkJvdHJkRFNuODdmU3JpMnNCWE1SOW1aQzZj?=
 =?utf-8?B?c1BieXZVdXM1b08rNFI2Y1kvbXVVdjZDSldVaDNSUEdqMkpPSEVaUk4wOHRN?=
 =?utf-8?B?M2p6dGxCWGdpK3FCNURSRzJ6ZC9oeVhQRnd6TDdoSlN1dnJSTnh5Nk91bkZ3?=
 =?utf-8?B?ZlZ0UXhnVTJLRVlGc0dUSUUwVVRacmxsdldTVWJnQkNKZlREdUZjd3FoZHMv?=
 =?utf-8?B?amhTYkhRN1JLNkYzYXFrd2ZPVkZTS1RtbnZQaFU1T1YwamFwd0Y3NkhQWEhv?=
 =?utf-8?B?V0MvMTJicEtxbndYUVVoUCtPeHBPaXRxdmNpQmRydTFqTCswT0hMaVRRdndq?=
 =?utf-8?B?dHFoN0Z5NFNiakk1N3ZrTUZFaGd4eGpwMTkwOEpDdHBkYm91NHR6cUh0S2xj?=
 =?utf-8?B?YXJucUZvblhZUU5lN0oraGlxOFVmM1E2Y0Y0QnpiM3p5em5RZ05ibXhnSTR6?=
 =?utf-8?B?ZWt1dEM0dEZyUUNtU3AwcUVxOCszR0hIVGVCdS9Oc1RvVEFoa2ROZCtqdmdY?=
 =?utf-8?B?V2xDaTMrZ215UHZMUmFDWGdXMTd2akY4TVNzcVhVUXJIbjF3MUN4b3krZXJP?=
 =?utf-8?B?N21jN1pEVHR3VjNPSFhtRWVkVkwvNkMyMkVRMmZaQk5XOEI4VjZabkRFVVNF?=
 =?utf-8?B?eXh1S3RiK1d2M1cvRCtVbmp0WDQ4cWFPeEVGd1JWdXdDdXBnTXpIb2hnRXhY?=
 =?utf-8?B?OUIxSUFFa1NIZnhESVFPRHRSbE03K09xOXJKaTQ2dURzbFBBRlFEalpBYitm?=
 =?utf-8?B?dWlyNUJYNEZEUVpIYTlIajZYSCttQVo0T3daQ2lMWXdySWRzU3Y5OW9iY0Rt?=
 =?utf-8?B?c2JHOU52T0l2eVpKSElvU3l0Q1lJVXJIQlc0ZXZPY2REUTVXdTQwU2MyWDdV?=
 =?utf-8?B?TFVlS1RoYnFhWG5YZ09WNURjVlpBcC9vcXVPbXNCYUMxS2g1dXQzNk12bTFO?=
 =?utf-8?Q?NnBQ8xQyKn4n0w0FHEJRxS/vb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y8BWpxw62U5+B54wsmpp32bIQ28pfhX8u7TkZMNzIDbqfggv5OJF1rXNjuK3C4GYmptGHLchvFEqDNTfYLb2FU13wfs6BgIsuDtvf/3DbSOygHYbCPLw02auIFquO4S9a79ojEelFroemOH0f3xUaHlpZIshKzJSZjlK/CSPZT3mEtv/h+wLNw/rtNqP3BpAN8oFIi+VbZheeQshJgCtO+JRAkI6VMu1ZvrJ9L/RZbCwjct4Ryt7kw2GXZhpANRg+AUFoTrLZsGxgwxAWGXLX8vyeVPDFy3KOTvhuaVdTA95Ij+GsW8QPA+7lyLYr4UxFaKYMpBwUvtvd2t44MztLJbNjAgiFIVLMUz2db1akYuuZNyReXVLAj/ZU7wzgCGKe0CaP+Zw+3Q3Kurb/Lks/6b32sZnLf1rTU2p9NHv7oXed8pcJzxDeAFwBTwdFouuVSGb7bhKl4MGTclcuRw8AGD+HMcVm3jIWYrehxj6S4ojvTZ2ag4JsxrJ5Fag9R6l0NhVwoXlge0VxSgtmVrpP+4axFtyub+YtBf6o2v5pp2o8MPCUv2AP4ad2EqfqMPeI3xBoviox5mTsTXkKPd0lthIQ7Qv9AvHBgTBmxHjgnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8ec883-67ed-4791-6316-08de01e47f72
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 18:50:03.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chaMn7tBxCO6obk5on1R+qnPcf1vk7KyfDOIlu+dQzDlNPhm+he7rbyIdX6PeBxqtE57JYqAVIsmLbq3SeeeGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfX9okvX7pRjZe1
 mFtHnDbGNfuG/ZQCzGErNgXisDXbO/BTUDCYHtXTtUbXXLketpsl0U15eDtv/JMUZoUfVAH/P+/
 S5Cy+F9O91mu7p8CLIR2n83IcmQY6K1l19yWEtgdsaWwXd/IdKUMFfkRLSJ3xLuEogP6A6gV766
 LcoO+SyX7t7l4c/TgPJea24ifclSznEZPPN+pVcoS7gpbtHgEoihgRP2UG9Twx9kf64ySeZ0UaZ
 OjCzBeUOhJ0Be7lbOA+VmwBbOfw1tVDmhYhQCOUJkWGkPa7Zp8EdZlg92+PmF3JXjzzqFerOcD8
 qIs12vvuZIJc2wZLF5qnBOvWVlFdUp+J9yiDoML0cz5JTtNiwmaTiXoDmkjwpJW9BCBGKVsSikJ
 Ba0Zw8pH2ybnFjlFBOHsE0W/o3TsnA==
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68dec960 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=jTeH5past4uA1otZFNUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EwNuqdS1GkWWMl5Owupp0HVah7HgejoW
X-Proofpoint-ORIG-GUID: EwNuqdS1GkWWMl5Owupp0HVah7HgejoW

On 10/2/25 1:28 AM, Hannes Reinecke wrote:
> On 10/2/25 01:35, Scott Mayhew wrote:
>> Commit 9253f9d added the use of the @SYSTEM keyword as the initial
>> keyword in the priority string used by tlshd.  Unfortunately @SYSTEM
>> doesn't appear to work on systems that do not have a system-wide
>> library configuration set up.
>>
>> Instead of trying to pick an initial keyword that will work on all
>> systems, let's instead use gnutls_priority_init2() with the
>> GNUTLS_PRIORITY_INIT_DEF_APPEND flag instead.  That will *append* our
>> priority string to the default options.
>>
>> Fixes: 9253f9d ("tlshd: Fix priority string to allow PQC")
>> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
>> ---
>>
>> Alistair, can you try this patch and see if it fixes your issue?
>>
>>   src/tlshd/ktls.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
> Thanks for doing this. Figuring out the init strings had been a major
> pain, so I wasn't that happy with the initial patch.
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>

Thanks, folks. I will try to get this merged this afternoon.


-- 
Chuck Lever
