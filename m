Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FECF23504B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 30 May 2025 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611374; cv=fail; b=Vh2Kf4B3p9+tthuTthwq2hO2MT5JisRRSk/wCB8muGAlf9iHtNXKm5dD7DbRjpCbjNpsqDzYH/Rr37oD7D/nn+2tJqBC1rfLAJXtcpuo+gW1umFhJAsyXFX5lpfelFEufvz9WkmR/LkaK0S1u6/au7noYYFUQNt4QL0fCWMKcdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611374; c=relaxed/simple;
	bh=sdLXV69ZnIg2OtRhubzTqb/UpzMt6ysxrjhlUV3os3w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XoVqs/Raz6C8pxz8G+AilcAwwB/TPZNl24TSAHrE28kFCRPmQYlCof7ItWRL2b3QT1MAZIZaJssoAESBNYr84ixj+jQhUbOrWuG2b6fEabxeY+xhJkmtW7AFvJ94LleZHZ6yguT3h7brhKg9nLRPeGDHRj4ZVNuSwR9VA2Lp3SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ogOw0stM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c5xjzpT4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ogOw0stM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c5xjzpT4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt196015517;
	Fri, 30 May 2025 13:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=MPfSBEitj33l84MsHbIILVXFsxPnHIQbe+y3DOWDgQ4=; b=
	ogOw0stMiUuvJ2Ymzh+F0fGA/BD1zWKI4czE5m1bg7ILF/hVA9fs83nghWFwt1cK
	HaT5U62qfA/u9YkqGJBz27EQW9is9o4pzBJi7kt5AtUdT8Ua3Yo83yhFcCE391Zo
	RolFDce195XA/7QI0YdHKHJE/3lZhnArcSHKCB//UYnoTa6CTqaPX1pvRmCZPlez
	QHPFVBQE3ozL3mXqw7ZpbmyiWgYKPTOlhKrTmNrEloAl0bkXz2r6T6m4oGInbChE
	NKyODNysebCSwJ3RA7V1TKU78+WToNngzKI5WDnLVqz0rSwPjx9Nlme//NGkipXM
	zJImZO5XC1IwsOFEAYroSQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46u2959-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 13:22:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UCYhkt019261;
	Fri, 30 May 2025 13:22:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jd9fgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 13:22:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8rE457wibKK9ceExJJOOccQF2tU7j9nQWlKW7iW0SYaUEOeVxowWhXRPdl8Mjl2DJJ0dgh/nNILnGKgayq376+WWSgSxA9mxi42dmCmJk/uXFQ5THRtjJ9BnNRFrnUgIlYCA4E/uY+U268+TYzrMzE34TFgxvHFEAp18COI7xzymfYiFyWSC9LpdYZzdsbDoXDi3oSMGZtZ9tC7Z6BJs5dtH6Ql60PwzggIL0D/BcNTkju67GHUKc3A5MkOm+60fGk8GX0TrDVKm355WyWE7Fg/Vm0/46qTQYKkI7cRVDMRJ71tf9sSGy3XrZorZFi7K98KMcUTzv1s5qmoBFXsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPfSBEitj33l84MsHbIILVXFsxPnHIQbe+y3DOWDgQ4=;
 b=pwXpZjSNh+2rLG+/gMUijLXNi4ntrloAIafwKQEdZqg77uczJ1SOGQkjTKeTToEBOQ3f1HDoGqionQDzDXhqo/0usHWbkydBbKtejqxlBg7yQ43Q01v+cc/gcBwZtDa8s7aGX0/1g3V5t6F1hb4BwklS7A3yimqE+GixSBE7xLCX734CdM+bh2aQfgDxxC/QewY2LTVbESXsr/Px6zm3OtJEbxNhiBdMHOluVSy5S2xuCrf9nxCvIB6b/2iLJck+ZbS/RrYnVIkIqlyxDYX1SdaLJYSDjGcnDJYRbrz0Su1JF1F8KModQ3m27Ay30c414Ewfxp2IzCO287ltTNtDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPfSBEitj33l84MsHbIILVXFsxPnHIQbe+y3DOWDgQ4=;
 b=c5xjzpT4ioN2h2qUxZO6MjktGuty958NWEDXjHC3WHgY4zBRvjBGJiLYNyXVEZpdhS2GrW+AgfhCtXDphaYP510ZolAJ0xIsGkK4dZqGlu+6KLbu5ul0ZT84U5k1JxvSfH7RhJK5kaQqjB9ZlLOqaNXvHgyLqfDUFHYXaKGQX/c=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH8PR10MB6525.namprd10.prod.outlook.com (2603:10b6:510:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 13:22:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 13:22:45 +0000
Message-ID: <ca5a7b00-600b-4d47-987e-ab7969923430@oracle.com>
Date: Fri, 30 May 2025 09:22:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
To: Alistair <alistair@alistair23.me>,
        Benjamin Coddington <bcodding@redhat.com>
Cc: Hannes Reinecke <hare@suse.de>, kernel-tls-handshake@lists.linux.dev
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
 <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
 <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
 <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
 <a1c5c804-c92d-406f-844a-328c1ed0ac5f@alistair23.me>
 <0d34408a-b6fa-4425-9cf3-879d0eeb3825@app.fastmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <0d34408a-b6fa-4425-9cf3-879d0eeb3825@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR15CA0011.namprd15.prod.outlook.com
 (2603:10b6:610:51::21) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH8PR10MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e95644-124a-4745-99ce-08dd9f7d1084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0d5d0o3K1BpN3lTelBtMFcxYWQxcytLdkdrbzRyRGRJRnl0dnlBTXQ5eDli?=
 =?utf-8?B?Ykg5M2V4MXNYRXNiZEF5N1NpYi9VcTZwL1R0R2pCby84aWtMb0pESzhWbGVm?=
 =?utf-8?B?NHhEUXV1c292bGVGV3VmcHRmR0QxcEhnT3orZkxXUUNhd29DNzUvSTZpRFpW?=
 =?utf-8?B?a2F6bml3V3ZtUnFRaEZzRXhaWXprc21sMUtydHhEMDB0bXdlS3c2eHB6ZWdV?=
 =?utf-8?B?Q080YU5STnNLbWRkUzMxcnZkWlB3bEhpUkJXeHlFZ1VBeHcreFVyUVpHUVEy?=
 =?utf-8?B?ZzVrSEFNR0NCYWU2bjhQa3JFYXJ0RGxMODMwQ3Zja2lUdy9BRDRud3ZUci9U?=
 =?utf-8?B?bko4dUNtNGJwQWZ5Z0J3QU9xRi90WHBUMkw4N1JlUC9MaW9mTVlHQ0duSEE1?=
 =?utf-8?B?Tmo2ZDg2czBRejd0NGpXT3B5bjA2NjQ4UTVJUjh1Nk9qejVFT3pJSVpzYXBZ?=
 =?utf-8?B?SFJxMmRQVlZQOUJQVlhxaWxIWjlLSDJWYUVrM3JDUm5SOVV5Si9JZ1hGa2lY?=
 =?utf-8?B?OUtYZG9MNVFKWE9yZS9IZEwvOUxKZUl2VVN1UzFGREt1bU5zbkRsT1RJQ2pj?=
 =?utf-8?B?TzhTY09WOWduWUxtSTZ2OUlXaW9jVnFHQ0l2bnhzWkMvcSthcE0yUStPaVp3?=
 =?utf-8?B?RU4zR1ZCM2h6eis1UzYzZXovT3lLOXVtN3BpZnFrc1ByZ09ROHFScFAwYTA0?=
 =?utf-8?B?RDRud3c3MFU5bjY1eUxCTWNvTHI1VzF6bkV6WmdhMkcwRC9PbGZBKzlNeHFM?=
 =?utf-8?B?Vkdpd05ONm1EZUFJZjVPRkJaVm5rY2ZRNkRrRldueENhUjhLWVVxMEU3ellH?=
 =?utf-8?B?eWFGNkoyUjQxUUh3YXRPNU1PTGRzSEw3S1J1U242dnFNL0M0MnkyRCtHTmlv?=
 =?utf-8?B?QmtGK0RCdk1QSlg3U2VTL1FiczdlVndaeFg0SExZL1hWSnlxd0JRMFdPLzI4?=
 =?utf-8?B?SlMxMXBVMm1uRE1sNUc1SkpzRlZhNE1CTHJNTjJPaEZwaHg5Z2lMV2h5SVlJ?=
 =?utf-8?B?WGk2QWVFOFF5MGROUFFLazZndUdQeUhRTHdJcXRnOERmS0lJUWdkZWJ1K2JV?=
 =?utf-8?B?MGIxVEUyM1BtVGQ1L1hXUEV5cDJITC83U1hOQVBKTnpremN3bFFyVUs3dVdC?=
 =?utf-8?B?Qk1FV3BqMHJKU2RUdDJwZTJ0QlpZWnNrTnFRMnhxdmR0dDdMRW1BTnF5amR5?=
 =?utf-8?B?WGNVVC9FMXgvWDZxVTdtQ3pkSlNWQ2lxc3BlTVplU0VTdThHaTBtc0YwaEpZ?=
 =?utf-8?B?VVVIcnFBaTl5NjVlQStrS2lIWHBUSzRrcFozRnp6eHlpQ0V1eUVQWERzRFBF?=
 =?utf-8?B?NEkyMHlydzRVSGlsdTZMcU9BNUV4U2xyNXAyQVNsUTFXMjJlMGF2Vk12VWxk?=
 =?utf-8?B?MUg3eE12WG5Eb0IzWjMrNER1cmxVY3VlamJudkdML2NzQitJcHkxSTJaSGNm?=
 =?utf-8?B?ZVoxY2sxWG1FSUpTaC9BTmFURzhFR0w5U1FyNS9ES1VhSGdZSmpuMldoUzgz?=
 =?utf-8?B?QTJndkhFRU9Tc2g2cnNaUmZkSzVreVVaL05EbnN0cEpDekVTNU5QZjZHQmJO?=
 =?utf-8?B?MjFDRkx6c0JZaW1CbTUvYzkybFQ5ZndaQlB6SnhIL216QlVFSUw5cURIeFhv?=
 =?utf-8?B?N2NUQUNGanFJcHNLSDhZOTZMM1NNZXBpUitCeG0wZmhqSS9DUHduSlQvVEph?=
 =?utf-8?B?ZVdpTTU2RUtIR3RHUjh5UnNFVTl0SHJBVGRFQXBJQmo0SlFNNFdUVllNMFJN?=
 =?utf-8?B?VHdNK1B5NjRLNzFUY0drVk5FcnFlMTVPeFFqejlYMzRhR0tLUGNDdnRkc0FJ?=
 =?utf-8?B?aEswTEs2U1VuRUp0UmlNYjA0UWRVMTRlYmxhdmdQNk0zbHkzVjkrQ0cxS0k5?=
 =?utf-8?B?TldBV29iSHRJVk5ubEZUUXBSc0pnWTFzejhKZHBoQ3VVUVVSdThwQ1pha09y?=
 =?utf-8?Q?lpppdZi4sBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm1oNmhqMHRDSnJ4QVB3TXpZTzNlY2F2emxXbTdmaXFEaDdyZVU2REZseERL?=
 =?utf-8?B?Mi9Kb09BQlAyV1lnOG9lSGYxT09Mb2ZqWXpKOXlTbTlhSzVWTHVTd3IwK2xj?=
 =?utf-8?B?VmlkVlpvWkhGV2RZcjJpN1BDR2ZZQ3NFNURkSHlFVmZ5V3hpaWZsRWRKV3lD?=
 =?utf-8?B?bUVWd281VmpDa3RkdFBsU1BuVTRpWTArWVFTdXFmS0FXZFRBcnYwSlhiQ3Ur?=
 =?utf-8?B?WmsxNllld0ZjYmJWZEsrSzhWem1wTHBOZjNVSVZVbXNMZDVNZEJXcFI4MGJY?=
 =?utf-8?B?WXhmbnBhOFF3dWdCTWVGbEVsUyt3bStaVzVBbFJOSkhQbTRQNnlLay9oMVRy?=
 =?utf-8?B?L0RRT0ovZGJEeVZ0dFg5c2JoN040UEpham1kKzViaUN1dTAyeVhBaHhLUFFS?=
 =?utf-8?B?aTVBNkVDYWVXdG1GSktNWTJsQU1OYWJubWRXQk1waVZWNVcwOGM5RnZZNHF3?=
 =?utf-8?B?RUhKdkcvczRmdlZnMmo0WmtnQjRXMnBxa2RaN0ZtUDNoNlBhL2pXZGt3UFd0?=
 =?utf-8?B?RTVwQUJZbm5zOVd0bTY4aHQyWVZmdGNud0dBYlV2RUhlNEtKSmE4ZHNEZk5W?=
 =?utf-8?B?ekpKdU1KT1VQNTJyZ3JZR1NSMmpRenBJeHRSUjhoSmVlcWlTcnMzckFlQ1Z6?=
 =?utf-8?B?RHBiRm9SQ1VYeFlwVFJCeTZnL2g0TFZScUtBU1FjanlkNnJFd2tuMVRkUEdS?=
 =?utf-8?B?UW1vdTdzR1VSVVIrNkNqcm4rQkR4QWd5ZzJPSlB3NTFXZ203d3VaZTluM2p5?=
 =?utf-8?B?WTNCdHR6VmNUdENDdmFqWjB6MDllenh0dENiMk0wZWtzK2RyVUtlRjMvRlQv?=
 =?utf-8?B?UlBOR0JJMEo2ZDlPUGloOGNDeUcxMTRXV3FHZHQzZHpXZmlGUTZoKys1cmp3?=
 =?utf-8?B?MGJ2MzF1RlRMOG5XRGdIWlNUV1dUMStZbDVza3ZhOUkvOXlLNllUQnNTR08x?=
 =?utf-8?B?Y2swMDc2YWFPUHZibml5MU9lcXBWS2lhWEtDNEJDbWMyVWdTZngzWlc3cEQ1?=
 =?utf-8?B?S3Vpelk2MVZhYlZwcEtoMGhtNFh4cFg5a2xxb0o0MEUrUVYzSncvWlVxS3lU?=
 =?utf-8?B?WmhhdnNLRFNxenFhY2NIUUpmMlV2cG5lRFNiak90eVhucXZKdDJXK1hSc2sv?=
 =?utf-8?B?ZU1WeTVnZ3ZFcTJwbDVUQ0hPZmlmdHNXbi9yVjNSUEEzcEpLeXVtU0J6Yi9m?=
 =?utf-8?B?Z3pmaE52bUxzM2Z1QVRGeWphN2pROGYySW43RERnQmRlcXNnU2d3RUFRS1BY?=
 =?utf-8?B?SHl5QUtyc2NmOFBUdWVPSDZNcGdqdnpvNU1ZV216RytKTlg3RnE3WWRCVXlp?=
 =?utf-8?B?RkZnSE16dHZ0bE1UanlENnptWmx2STZHWnptOUdPTW1IbmwvZ1JNVHpVbTRy?=
 =?utf-8?B?UXZpOENaUCsrWG9IRkwrMm1QSXYwZUpBK1JEWDlaYnBBQjFrV3lwRG9WMUhq?=
 =?utf-8?B?OGJJOVc3bnBhSHpGN2hhSHdCTDdramVpMU9TUmRUL091RGpGeG5iV3g4MFkv?=
 =?utf-8?B?c2xETEJCZ1BjdmN6SGRtWU1ib3cwZ3RGK2ZPWGl3bWJEclVVckdyVWI5K1Uz?=
 =?utf-8?B?bnZ4K3VpNjZZdy9vTFBDbytveWx4d0xSeStadWw0U1lwUTdZemZyUjh2bFU4?=
 =?utf-8?B?QkY4N1RNMmwyWGt1bDlFa2hDTTBjNXdUU1h2S3NMQWsxZzVXS256NU9oY0NZ?=
 =?utf-8?B?Ym02ekxJR0dwd1grUHZmNzlxRE9GUE9XdVcvSlF6eHlMVW80bzZWbzJMUEpP?=
 =?utf-8?B?bDRYUU1QV0NiSGZ6Z1lIclRzUEpHcm81THduVXUxSXpCd3NqYWZNY1BzZVVX?=
 =?utf-8?B?N2d0aDN3Ym9la08vdGRHZnhOeVVGV1l2MkdwTFRjQWV6MFlTNjFMY0dxWmNl?=
 =?utf-8?B?ZU1iaENVclpoRzYxWnJTc1Y0ZG1zVzlCVkpENjJ5dGZxNFVTREpHYlJNSGxD?=
 =?utf-8?B?N3BmUlFwNi9BUkRQc0s2aDF0aUx4T1lhZG1Ta0pPeFRpR3ZPU01iQ0pjK2k1?=
 =?utf-8?B?bUUwbStZRVNiaE9wK0owTitLbVZEdFN1dWhCaE9Jc09hUUcwaHgzSVFCbEhJ?=
 =?utf-8?B?Um1kTzdZU2M0cTJyYytHaUozZ1BGZWtTQThLakVHemhicjlkaXIvT001MGZR?=
 =?utf-8?Q?Xv9WPwTxga3EDHCQeIlRBOpTv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SgSrugHZj+HiTsbYG8cZluwo7ywcgjsHBRRqJpmZfcsNGO+CyXY/RUILIxhoqz8646PgIrezQXP5SiY3bP/iPJMzpKWJCPde9TC+WA1fz5YzBbup5zqNRGDrLxnHy1G2q8UqaJ7683mCKZN0ZfP02kMTz3pZU5xpiUtA3l+9RvUne8IVohFsS5mPexmogT1NSHaNveS1WBZvowBXgVC/CFmkIb2Nnxs536aVK6Vvd7S0BEz+43OogY18eTt5KDCdTd/EGGeasyVTZ+9KhPFqrGz53i9m9+VwVmrTXV77rgMkhfXcgU3D/oXyYE+2A1tFZv+WBsA8150OiLYMR7My3aGJWud3U1RzpzKUhPRkOpg7A1rrUz6XQmAhxkyrBWxvDhos0x6YVCYN1oO5klhdgCcvjTY5r0qn6a5yuH47FbWX8191Jj5AyYQb5ptnP8BN5oEMZ6I+NAEPctw5xQj65Ai2wtKo6/h5QMmBZf1woFlUo7KZzWiQ+0Xg1HACxxcAF6uWaw1uz7i1x3Qe0v4dS6Lm+tThZtIrUkMrEJVeefDcxDOO5ljfIb7MMX5kwLq1rf6zdhpfDJ8WFGyx5F5Fmj8j19+npWP1hGlSF6VGgiU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e95644-124a-4745-99ce-08dd9f7d1084
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:22:45.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZv/tUqkZoHUDexhGDlaw5k34Mdy0s+OZGGoYwYbjgtcyhYaNWJaLHDqP0+aqbqXbf9k/SOT1iIdl+S1JdGpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6525
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300116
X-Proofpoint-GUID: VH_2NOPKYWh7NvmJrdVTmp2TaCxKxDOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX2kMUlp890qxT rZiZtPTMwBBEak+zrGaLl8F7gUGeqgI211GwYrixhLRvdWHDK+XOlvC+C0LyYwBTwtmU18QIIJJ EeGylFMY+bT+wBXcKHHlZc6JdEINMnBXzAYtWxmulwNMUj+RGEYZaOYMLO7yYvuHURFEwSRZlby
 Ll6MlDCLEPqvaVKsoFW2Xu7qmCFq/Q/6kQ0re6YUlhPBzSTXw8MvOmlujkAm0UOuAxqmLQO6Dm3 uy+qW6pX4He0DviYtqx8W6c+C58/HIy+LlfQSeNwylzyS5FY//q15WpxTybqumPZ03C9Z6KQkuH P2gYw6oKxC5pbJTd/Aj66Sd92xCtfNyJ5A09HMJ8aW1+iydGrsmjDS/cCwMS9SniSG72Q3yAFMq
 PThhD0HTKOwJNbruuhcjJKlfa0a2RudR5ILqBJyXaTrhTkHm6YNEU2SOlLesL9eXDSvAJT79
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=6839b129 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=WiW0nwAi12l-0nfQapsA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: VH_2NOPKYWh7NvmJrdVTmp2TaCxKxDOw

On 5/30/25 12:44 AM, Alistair wrote:
> On Thu, 22 May 2025, at 2:50 PM, Alistair wrote:
>> On 22/5/25 00:53, Chuck Lever wrote:
>>> On 5/21/25 10:50 AM, Benjamin Coddington wrote:
>>>> On 21 May 2025, at 8:53, Chuck Lever wrote:
>>>>
>>>>> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
>>>>>> On 5/21/25 03:00, Alistair wrote:
>>>>>>> Currently tlshd uses `fork()` to fork the entire process after the kernel
>>>>>>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
>>>>>>> function from the child process and exits.
>>>>>>>
>>>>>>> This provides a high barrier between different handshake requests and
>>>>>>> ensures everything is freed when a handshake is complete.
>>>>>>>
>>>>>>> The problem with the current setup is that it makes it very difficult to
>>>>>>> share information between `tlshd_service_socket()` and the parent
>>>>>>> process.
>>>>>>> For security and system resources that's great, but it has the large down
>>>>>>> side of not supporting the TLS KeyUpdate.
>>>>>>>
>>>>>>> In the future we would like to support the TLS KeyUpdate mechanism, which
>>>>>>> means we need to maintain the `gnutls_session_t session` information
>>>>>>> for a
>>>>>>> connection to allow us to issue a KeyUpdate later on.
>>>>>>>
>>>>>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
>>>>>>> we need
>>>>>>> to store it somewhere. We could pass it to the kernel and have the kernel
>>>>>>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
>>>>>>> it's not fixed size making that tricky to do. Plus it will break if
>>>>>>> gnutls
>>>>>>> updates between a handshake and KeyUpdate.
>>>>>>>
>>>>>>> The other option is to pass the session data from the child process back
>>>>>>> to the tlshd parent process. The parent can then store the session data
>>>>>>> (maybe in a database?) and use it as required.
>>>>>>>
>>>>>>> I submitted the first step towards supporting that as a PR [1]. The PR
>>>>>>> changes the current `fork()` multi-process mechanism to a
>>>>>>> `g_thread_new()`
>>>>>>> threading mechanism.
>>>>>>>
>>>>>>> In the future this will allow us to maintain the gnutls_session_t session
>>>>>>> in the parent process, allowing KeyUpdate support. This could also be
>>>>>>> supported with `fork()` and IPC as well, but that is clunky-ier.
>>>>>>>
>>>>>>> My approach [1] hasn't been accepted, so now I'm trying to see what
>>>>>>> ideas other people have for supporting KeyUpdate?
>>>>>>>
>>>>>>> 1: https://github.com/oracle/ktls-utils/pull/95
>>>>>>>
>>>>>> Hehe. I knew it would come up.
>>>>>> The reason we didn't implement it for now is that there's an overlap
>>>>>> with session reset. In NVMe any error will be causing a session reset,
>>>>>> which then will trigger a TLS handshake. And, what's more, with secure
>>>>>> concatenation we even generate a new set of TLS PSKs on every reset.
>>>>>> All of this is transparent to the upper layers, so they will only see
>>>>>> a (hopefully short) delay.
>>>>>> Additionally, with the current in-kernel TLS the connection will be
>>>>>> reset when the IV values are being changed, which again would trigger
>>>>>> a reconnect on the NVMe side.
>>>>>>
>>>>>> So not that easy.
>>>>>>
>>>>>> But if you insist on doing that, why don't you use the keyring to
>>>>>> store the temporary session key? That is persistent, and required
>>>>>> to be present for tlshd to work ...
>>>>> I was about to suggest something similar. Depending on what APIs are
>>>>> available in (or might be added to) gnuTLS, preserve the session's
>>>>> metadata in a key ring, and return the key's serial number to the
>>>>> kernel as part of the handshake result. When requesting a KeyUpdate,
>>>>> pass that serial number back to tlshd.
>>
>>
>> Ok, that seems pretty do-able
>>
>>
>> I'm working on some kernel patches now that start to implement the 
>> basics of this
>>
>>
>>>>>
>>>>> It would help if someone could review gnuTLS to see what is available
>>>>> now, and start a discussion with that community if we need a capability
>>>>> or API that doesn't already exist. (Eg: translate a gnutls_session_t
>>>>> object into a JSON string; translate a JSON string into a
>>>>> gnutls_session_t object)
>>>> I believe gnutls_session_{get,set}_data will serialize the session object.
>>>> It would be trivial to store in a key.
>>> Oh, very cool.
>>
>>
>> I didn't see that previously. That does seem to do exactly what we need
> 
> A follow up on this, gnutls_session_{get,set}_data doesn't seem to store enough
> data to easily resume a session to handle a KeyUpdate. So we probably
> need to modify gnutls to get this working.

Thanks for checking.

I would start by joining the gnutls development community and asking
them for advice.


> Alistair
> 
>>
>>
>>>
>>>
>>>>> The other aspect of this is that tlshd will have to prevent saved
>>>>> session state from growing without bound. Probably the kernel will have
>>>>> to notify tlshd when a session is terminated so that associated saved
>>>>> session state can be discarded.
>>> It occurs to me that tlshd doesn't need to be involved in this aspect.
>>> The kernel can delete a key by serial number when it notices that a
>>> session has been permanently terminated.
>>
>>
>> Oh good point. That will help with freeing memory.
>>
>>
>> Alistair
>>
>>
>>>
>>>
>>
>>


-- 
Chuck Lever
