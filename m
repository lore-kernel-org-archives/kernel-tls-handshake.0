Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5EB19F464
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758661327; cv=fail; b=XYlLTYT/lnQ8ZXuPRYVaxE/VbQGYk5ZG4HAm5g6fjSAMD+RkEtxIHwF4VOatMJGgSrfce0SHfunZN6ogTMpgMFIcet7TybRIlYkOoxTjmuo2GeFSz534ExajMVreOYSafhT4FMG0KSfCOREVJMOmwkZjLCa5qEIrZBDxIn5OP64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758661327; c=relaxed/simple;
	bh=f2iVNzNF4ekdSJbU9bHPfVH3Bu/2QP0HagXbhaJx+I4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IhO+MdxN81HnhbzHyuiD/ivArpPL1kuJwxd/WN5AvfFDgEZl5bopn9AUZgPIfGBd1UD4+HjMXwWUOydPj8IDT2uQF6wFfn5zmxsHctFeotncB4A5kUo/t/CzwAOR2lAhVO4ClGDFUO2Sf7BeVgXq6V9Ei+AZM70j0+AitUM9fjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YB/YZq98; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xg7Co6qX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YB/YZq98";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xg7Co6qX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NKu7Wv024116;
	Tue, 23 Sep 2025 21:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zEt/dyFGjqxk1CL00yOxwMbltL3pbIJlmABEq/7sIZg=; b=
	YB/YZq98XhMxdMtLrFBKFcBTEOVRlx7MLDtLLJnGQalFpnGUNlHEmqDd3zp4GLnK
	riFW+RL13KEbHv7CfUxP9QiwIAjDm0tO37TGg3Se1OzCSZapGHh9BMGgSMckRBTn
	LOEx+WneWw9aY3INSLZfXwxGDNRn0uNvW+MmY0f38eMbNiNHAacC986pNqc+5KxP
	RJ78a6J4Kl2p1COsk3XrW+Y4MlEr8hcqtPrkbEpqNPqZSaus7Czxk0UdxBYqHYuT
	hWGKF1fs/YsVyJWyF3v/Ity/sxDMMBD/XjhEa0NkFre/h62DboZmuLm96yTGtw0k
	hRujPyRCsfMI5zdv7SC4gw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mtt5jxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 21:02:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NJBqwA028368;
	Tue, 23 Sep 2025 21:02:03 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq90e9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 21:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enE9fB1OL1DqujIIx3ZTUZ0Mzk89R7e3Wvwkz1Mdv+/HQO2+ZCLtnbgdEGFwDRF5O1Td4kE9fb7XcqLKw4kTXcX5JioZ0xFvKXnxEKmQhJd4YTxblzY/4FLjSE6rjODsd4paAX+GtndoCGiWS9YEPep7aqtSPv4v/msJBGifTyA3SFDP9k7qlKeH7JXLpaaC4q5aRvigncVauayg5Z6W2FsoE92+PWMyAEKslbgkb8ynH9pMgqNtLXgZhQMbkAWyzZ6nkywXreHNT7RdbGEvwqW8q+AWUX2n22sQw+TKMTmkCBlXuEK/KA2mkJ3oyh9bwpiUZgiC8hknf1M/oTkPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEt/dyFGjqxk1CL00yOxwMbltL3pbIJlmABEq/7sIZg=;
 b=wphMpiLQ9NGfrmTIeCbsRAM2r4N7g5HP8EmBSx5Pfq/uWfdAaumLhScynuiYV3SJ4DwINIqbjSYuxDts//I3j02+hJ1GwgXsd/dz4g7CdQZ4oqktr+escToOullhsOHGQ/Oqv3qDA67tDrOy8fZ2D8m/shw3/7AGdc5rpClAtZ5z1Wzk/HGw1bptTfOGYsF7HDp965qsv5ZFm3TRiBxkHM/K5N/MdAnYzxSf10KluR6z4nLmpTnHOLsN07nrNZVq2m+F0M+mSpi0zYCxz65XwBt9IrxROsGvzpyC9ex6PVZJqP3WFnx6G6EPPiP9nUgolEbtAj2itFytYhUZOaBtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEt/dyFGjqxk1CL00yOxwMbltL3pbIJlmABEq/7sIZg=;
 b=Xg7Co6qXe/P2BD3Ouc2UN9uz9X4AE/bFpdFxevabFAY6sZMISTAx6DGGPhuAmVZqy/CLsYNuq+ZoXDrZforrrPkPHscoisVYlY5TwK/8D1sHfJneXkq3wL6lacl6cqYiAdW8/q31wAtRQnVY6Svecklv8kRjnTkHyLS8XfnJVUI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CO1PR10MB4628.namprd10.prod.outlook.com (2603:10b6:303:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 21:02:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 21:02:00 +0000
Message-ID: <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
Date: Tue, 23 Sep 2025 17:01:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Xin Long <lucien.xin@gmail.com>, Benjamin Coddington <bcodding@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <20250922220710.1255102-1-cel@kernel.org>
 <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:610:58::11) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CO1PR10MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cb4aa6-2f3d-4ca5-8d6d-08ddfae4709f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWNzWkxwSTVoVmdMemdoWkc1TTlJMVoyOGR5SXdMc2JXVm5ZMUZhNXJPQjVz?=
 =?utf-8?B?R2piNTVITm1yNGNOYXV3T2F2UDVIbjBzQStGaDZwMjFJUHAweUtoSWFwbFNO?=
 =?utf-8?B?b005OFkwQklIQkgrVWFobWJqRk5keHRkMWhoaTV4OE91TWRVaTEyZnRSQm5C?=
 =?utf-8?B?SkFmaWpWa1gyZVEzZy8rSUE2VkV6UFlLRmhFbExodEV0TnFyRHZ4R1ZVRUtN?=
 =?utf-8?B?cFpMbDBzNEU3VnNwRXFyZEtqdGp6VjNselRXVWU1cUlxV2JCZ1RxK3lFR09r?=
 =?utf-8?B?SzAwVTZ3N3Z0a21wUkhVN0RFcUpYelFUa29lN1o4MVg0WkhMdTNtbzhWUFV2?=
 =?utf-8?B?Yzc5aE5nOFhWbWtMeGpka0twN2ZvMGZoejdEYXlqZWJrcnl6cWpINFdiVHNZ?=
 =?utf-8?B?TFh3Tm90cTA0SmdzYkhyTW1VVEl6UjFseDdQaGMrMkZGdzJvdVZuWWUxcFkv?=
 =?utf-8?B?aDZtYUl1RzVxS29qaWlFci80aW9idEJSQlJldjNSSHBnZldqL0FMNDg4S3Fr?=
 =?utf-8?B?YzJwSVZFbUJuZUxQWldudkxXUGVDNlRKMjFrUkxmVS8yZlE1ZUlpZ0lyRVhY?=
 =?utf-8?B?eUpHRlRBS0ZVOG1TbHJoTysyaW5VY0dOL2ZManBKa2QyUHBqS1AzZExpcC9T?=
 =?utf-8?B?bWljaWdFYm9EaktMRjIxVjBUT1I5QzZ5OFZub1l1N0dSZ2t5bTJNaHNDS1Fk?=
 =?utf-8?B?L1JwYnVDSmROT0M2L1E2TUtBU1p4bWRXeTErTUxTZUoyOGNKNWltT3d6cUNl?=
 =?utf-8?B?dVZaSXg1ZktYbmltcTVVL0tFSlhOdTlhYjZMcVRNczRQY3Q3VENJZVFTZjlM?=
 =?utf-8?B?OXVnVy9Gb0JNT0FzUmhiZXpWazRkVmN5YXl6SDRVS3M5ay9KTkdML2NMWld3?=
 =?utf-8?B?UDlrSjgyRVkzaDN3VUt1Sm5qRCtOQ3RpS0ZDeklGNDYzUmwvRWppT2NZaW5E?=
 =?utf-8?B?MS94SFN5M0tmU2MwY2V2a3JmNEc1U28wMUVuckFOOTBVVEcxaDRIYkRSMVVU?=
 =?utf-8?B?VGZCRlc5clNxbGk0NFhpeE1GMndnM0lRdWpkd2tlUzZQTDlYanJGSkRBekh5?=
 =?utf-8?B?dFFoSzNYRXNGSEJ1UEFtcU9oc3JlTmIveWRVeFFvMVdka1h3VWZwV09rQXl1?=
 =?utf-8?B?ZU9zUXFhb0x2UGNiSHUxRzZhaDM5a0pub2FuMmFPMTgvQkMvZkxiM0dmS0Zx?=
 =?utf-8?B?UW1RelkrVmxPMitJUUdNUm5OR3AzV2JqclhDSzh0NzdYMlUwZEVuVlFjSVQ5?=
 =?utf-8?B?ZDZ0eGU4RWR2cURFOGx2ZVpLb013d1B6RWppczBvWnlDb3Y1WTIxWnZIK3Bq?=
 =?utf-8?B?dm4xS1lOUnJ3VjN1SmFEL3RHVlNya21aYjRPbzFqMTRrZG5uOU9aSHFDL0pF?=
 =?utf-8?B?RVpqeUQrc1JJUVFWcGNxV2wxR2RNYWIxWDNKamN0N3ZWeU5vTUdoWi8yNmg4?=
 =?utf-8?B?U0RuampBdDJSWS9GeGJRdmN2SFIxMkFKVTROYzUxaDYrYjVKalZwbUNnaFpV?=
 =?utf-8?B?NEVjREFHQmFtYzRxeXBUTmxGKzU4M2ZzU2RWUzRocGNyeHpXalJoTzZLWFdJ?=
 =?utf-8?B?NXFaajBtcmpQcFVqM3NaUUJwamxjeHVSUUwrc0k1WGZnZWpYRXIvdkNpMGw4?=
 =?utf-8?B?QXNuendWOGVKSlFwbnFVRmRYOGNUbGUvSWJmOUZjTWs3dXdVSWZoODRnS2My?=
 =?utf-8?B?RDJXSUtsTTVuSzFhcVVvKy8wdWUxQ0s0TWFCUER6S3M4ZnREV2NwSjAvOTBZ?=
 =?utf-8?B?bEJjcXNXZS95WFRFL0tKM0JxbzVHUEJVWFVWZDFmTGo5aEUzUnVSTGcyakZj?=
 =?utf-8?B?TGlOTE9YdEhMREkzU1dUeDRkcHZEVzZhT1dvSCtmUjdBcWNLV1dvUVRDOVlr?=
 =?utf-8?B?MlZNemFYUjhLa1ZPTUZVT3BkUThoaTFCNEdFWHJNdWhQODB5SlltOE9QMktn?=
 =?utf-8?Q?B5DP2/XbyBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmxMZVdvVzlGRmJLVlFvdXlGbTVqTEg3V1k0RzhnMDdwWnBaOTVWRVVWUUVp?=
 =?utf-8?B?ckdnNlBHMVV5cHBzaUhPd1pnWnNDQloxZjRHc2pLSmlLblluSmpJNWx6UnVU?=
 =?utf-8?B?RXR0eEdkT2JkUGFUNFNYWFhTNEd3TE9XeXY1WlpVQWNKaldURXh6TUxSL2dz?=
 =?utf-8?B?ZnFGSnArYXhPNzFxK3BsdHNUMGdYRksvOFd1bFJFeHJWdm13ZmRqOHRrTG5r?=
 =?utf-8?B?b1VNdENZU3lKZElOTXFLUzFUZTFVQXQ2WHd4N2Z5ZkY2c3JOa1ZCR0N3T1FT?=
 =?utf-8?B?a1NFMEFzdjdnWnhyVzNybWpRWVRXcmR2NDhhMUlIZTZ6QW92UzJLQmRyclls?=
 =?utf-8?B?VDR2TjM2MkRHbDE3NjNURkJTYnhIemNFOGJwSDB2bk4zRWsvTmhyczV4QWh3?=
 =?utf-8?B?QnlyOW0zQ0crWGdaT1gvQ29ZakE1dW9SNzJMdFR5NEQ5RTJpa3VBODF1K254?=
 =?utf-8?B?QTh1YzNtbFM3eFllK0luT0NabWRKb2hoazlxM3I5MXNsQ3JxZlB1bi83cm1J?=
 =?utf-8?B?YUo0bUNrNGRkQWRlWjJWVWVPOFNtUExZVXQrNldmeG1BYjFPa0w5S0gwUUl1?=
 =?utf-8?B?akhjUVlIQ0NCNU8vcEplTTd2RSs1Wk9HVlVGWlZsenB6dUxUcDhZTi9STkVz?=
 =?utf-8?B?RDhjMTg0bk14SW1pNHZFVGc0WnVQOW1vdkhxejNIWDUvVm9kcDBrS29xNWZ5?=
 =?utf-8?B?YUN6cE16UmY4SDhseE43UjA0UjB4Uk5KcktCdGdPUlNMNTJYdk5STDNiWU5R?=
 =?utf-8?B?NG1GdEMveDEwYk9ZeE1vL1VEeE9BeWowalhCMmxFUkh2YkVwRkJRYmc3UlJF?=
 =?utf-8?B?aXhncXBReFFScTRsOUp1cFNMY2drYTE5eVNOWDRqd3BEREJ1SXY0dUc5a1Jl?=
 =?utf-8?B?Zi9zc0Q0eWVXYUtjT1BRcmNicEJ1THl0QkxuYkpEankycEIxTHpPK2pjYTB5?=
 =?utf-8?B?SzFnTkRHWVY3VFZWbXQreTV4U0htVjE4dTVWQW53ZnpFS1ptcUNIZ0Vmcjc0?=
 =?utf-8?B?UkJOK1BlOUE3OUp3VUZ3YTFSbVpGK252WllMUFhjbkNyaFdlQXRsNGNjeVdS?=
 =?utf-8?B?RXg5RWQ1MXZDekUrUGNNMUdzcFplNzNPUi9lRkFZdTdVc0V4K2UreHJBMDFP?=
 =?utf-8?B?NThoazVtYWwxdUsySHVyOWo3RWtVWlhscUZ1UjYrSlQ5ZDhSYUdnNTVzUEdh?=
 =?utf-8?B?Q2lOcTIwU3VBdktaUkFTY3B1YnZGTTk5MGUzZnJLdEs2UDBKci9yc0d0L2lH?=
 =?utf-8?B?VlBpdmh4VTQ5VG1FYkRqdE5EOEV2N3NhZVZOUmErSHZlUzNJU2cyNUFXbzhI?=
 =?utf-8?B?Rm5STnZrWGtpd3M4R21nQjZqYjMxUEEvb2E0VzRraE92bnNCQjlQTGV4Mlhh?=
 =?utf-8?B?VHB2RGg0M0hWVS9XMFBnTXZkZ1VhQ3dsQTZGcHBMMlFhbmJFbVVDK001U3dh?=
 =?utf-8?B?TVJURjd2T3d2WkhkQXYyM0UwaUNKeUJmb1VjWWtMNWhRYVd5Z25wc0tTQ1Zs?=
 =?utf-8?B?V2xkQnFERHhLbWhpZnJQeTVMS3l6b1NmRG1DMHg4WEMvNm9ySExnWGNRcERT?=
 =?utf-8?B?b05GSmJ0Y3JNUXdubEVHVG9URGgrK1F5c2NrNk5ScmdJaEEwaHVIZVpMQ1d5?=
 =?utf-8?B?OVpTVmtrOWlSQllOQVNxRHoyZS9hWVZ5RnFsZlJQaThrdDBvYUJteWlta1FW?=
 =?utf-8?B?cXlaVktvUk1JSEwxTktPTGQyNU1mWWt3SEVpdE8yRHdQRWdnb2JWZjVIai9j?=
 =?utf-8?B?YUpKRnoxMkgyWm0rdFllbmdiMjZhUUwxZ1FEcitoWktiNjlPQmlNZ2JJL05T?=
 =?utf-8?B?Qys2RnFSRTV4azNQSTJTdW5kTngzOEhXNzdsS3NpSWx6WDN3bVc3MHFYNjBy?=
 =?utf-8?B?SjNCZElsUkRocmhkLysxWFlJazFPalBTYi9FUkF6ZTJCYVpaczZWN3VrYUMw?=
 =?utf-8?B?S0lRVmNkU3huekxxUzdPTmgybStsVEptTjFydFl4S1Y1WFk4WVV6OExWc1Nr?=
 =?utf-8?B?dXBhNWNMWjFYbWdpQUh6ZDlZenE1YzdNTTIzaUVMNzEzL0VEcWxQaFZGV2h5?=
 =?utf-8?B?QjBEeE5rdDhVTk5PRVAvbDc5WDdiMVNvbFE2dGY2VnNwVTNFQWdDYUtrTExs?=
 =?utf-8?Q?DOxQUWafjz+tlNhFo1Wo3wx8W?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r/quCKSMgkKlLPABBZwd18ldbgtFgMzFpWqUsb996gaZifLfCOQYVLGte/P9QqI/BoHiR4A6UZMzXfydke0yAl3jbD8aJK85QxFNkA77IL8P4kmiYqHXMHXT9kiKtfyIsGUHl3yPXQ39GibCpNZKDCKd+SCw6sMXrWRsKowuRIfVyL+FCOhox1SvTG+xJTClKvy71YFPYoDaFjuJW3pDAqQ2X0xd5Xb7NjZLo1ajVVieLxfUyzu68u79PGM3YWEJGZdAwj/xLuERhP3g8PwP7cEO7MMR5cMksPMGe8Pna1KSYOcO0oxKR0rk6iZG6nlB0HmsJ9G7ERaWv1oz5kTkUVsWIiAbFh0xwxlvhcE/hWEJIvGTM2J1MoDTrasRbzHWxIbEwKL5T0arLdFwmdnJsy2vpA1nCvE6t6fs1DGHompEIvJaYdRdfAbEJ2OGsBz08zdHe9qtvafxXyCzGVbtZjl5iOGweDq4p02AumjAjKzBn/cjHhkmbwRLj212+iPVIx9+ToNPPpQ1ylcXcxfMbXu69ekfc73yQTuGjEiTh8QB0NKQK2M5SNqpzvmoXTl4iYTx+6Ab3NlOYIn7Hwp6F1Kt2F171oEtY/0/fFV7AeM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cb4aa6-2f3d-4ca5-8d6d-08ddfae4709f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 21:02:00.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmyXapBAqWMMoGfAMKsYh7tEIYOGIBC3HC2EtGYNFE98GpsvkOZnouoDUfdRr4Fbb85zG0tLD3yisMa8AZxOhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230191
X-Authority-Analysis: v=2.4 cv=fd2ty1QF c=1 sm=1 tr=0 ts=68d30acb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=NDMFQnQXFoBz6AaiQdoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: A-0sTiBKCXzZjKqCSVC7QFCpEWg7-v4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNCBTYWx0ZWRfXwoT6EW7gJwf6
 /IoT/UWnqYCE1oKRJJ6dCF7MKl8c5sYyhXu8XqciY8LzfIN/J0e7EuSF+etxYOkvCpqYkVc5Ac7
 M18K8v3rCuiDVuPLgH89Jnxfhz3gGQaeRjDSZpVwrVUXmyr9rCNs7Xxu39IMJFkYDLm0MoABmNZ
 k7a0cYZ3wqzNyNzvplWKeODOuT84XNZrOsYKjBNwq1H/lisKLgI2itfzJuCQs0hdhr04C5cZq5Z
 XwJ6w+2HrV0FQ6GgK1JLI/JSxj83oZi5bGStlovHR9tVzxUG0Het7U1jQ8O/1yBkFs2REVPc4O1
 2QaadoBQsCPDo6B0Vo4VpSeLa+DfWQepkcdp36VWWAZYSwpp2D0basqrb6n2NXBP9MLWCSV70sD
 9EUjKFLZ
X-Proofpoint-GUID: A-0sTiBKCXzZjKqCSVC7QFCpEWg7-v4L

On 9/23/25 1:27 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 3:18 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 9/22/25 3:07 PM, Chuck Lever wrote:
>>> From: Chuck Lever <chuck.lever@oracle.com>
>>>
>>> Static analysis tools have noticed that
>>> tlshd_quic_serverhello_handshake() expects its helper functions to
>>> return errno values, but two of them return GNUTLS_E_* values in
>>> most cases. Convert those functions to always return errno values
>>> or zero (on success).
>>>
>>> Cc: Xin Long <lucien.xin@gmail.com>
>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>>> ---
>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
>>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>
>> Xin -
>>
>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
>> Callers expect an errno, but internally the utility functions set that
>> field to a GNUTLS_E_ value.
>>
>> Can you apply this patch, fix up quic.c as well, and then test both and
>> post the fixes here?
>>
> Sure.
> 
> But conn->errcode is used to pass the err to parms->session_status.
> What does parms->session_status expect? errno or GNUTLS_E_ value?

session_status contains a positive errno or zero.


> looking at tlshd_start_tls_handshake():
>                 /* Any errors here should default to blocking access: */
>                 parms->session_status = EACCES; <---
>                 switch (ret) {
>                 case GNUTLS_E_CERTIFICATE_ERROR:
>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
>                         tlshd_log_cert_verification_error(session);
>                         break;
>                 case -ETIMEDOUT:
>                         tlshd_log_gnutls_error(ret);
>                         parms->session_status = -ret; <----
>         parms->session_status = tlshd_initialize_ktls(session);
> 
> It also seems mixed, no?

The -ETIMEDOUT arm sets session_status to -ret. ret always contains the
value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.

This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
gnutls to kernel"). Passing -ETIMEDOUT directly to
tlshd_log_gnutls_error() does seem a little bogus.


-- 
Chuck Lever
