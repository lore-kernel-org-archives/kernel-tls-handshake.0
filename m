Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160913E8B2
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713798998; cv=fail; b=bxQHmsC1oKdejwX4I4jjxy/XOD7k0MRKZ8K+nVEbXZT50VR30X4utgWD85DQXjAi0BcPNL6G4qnpJ2hh4NwHr8QLBh4g+0pRqHX9ELLj898B+4HFG6z+XyWouOyBG7pMqMGa882zozmwsjtWth5qNOKW2cxxCAf6mV5CYYCLTLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713798998; c=relaxed/simple;
	bh=N3pYkvh5jgcZe1FX0Xcjjig0fhqrqXCSFR2HmY9Fqzs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kF6+6WYDT2Ph07qinh8edE5j0xA39P0rhXean2v3eBPOWRxuFJIlDHWcJWfceKUK2aWwM5WqRiScVwuATwA7fH/zxNqwntGHFxOEn1aaHozOezIt60CZQNP1HkDjpnj3tgW8tYiSvT6do8VS/pOYTtrH3z70lxW3yoZgG60hNV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cNTQSs7r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GdFHUJse; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cNTQSs7r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GdFHUJse"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43MDXxvo005865
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-11-20;
 bh=N3pYkvh5jgcZe1FX0Xcjjig0fhqrqXCSFR2HmY9Fqzs=;
 b=cNTQSs7racYy0iCNvhIdg9+oONiFBLYMq5F6uyC3hnmIoc/GTKU7JSLmmYpNMT0yhM1H
 xqGmqQJ98JooWCdBcXvpPgoBotgunanE7E8bBTMLYhlDz6qquDFRLlxLT/aexJTaTd3g
 +oPIxo6AsHWP8VAaKk6qjB681b5yWJrtmGj9iM0/rXqnxyL0TtXPxn08XlwXYf6zb1xw
 HkPmJLo+HKMrRg11yT4+PjaoBztOZr17SBIKw4NKoXk/QvHa5svNTDcra+0qewsIvmFP
 sXDEi4EWU4JvqF4NKpLnF/8xVsmpYjQpL2t42yi6zF2X9AIes3ffihEbii/sojsxklSY GA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm44etwxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:16:35 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43MEJrim019661
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:16:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45c9sff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Apr 2024 15:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLQ5c2GE0d51qXX3ozaX2Luheho43mCqITIyDQStGnX8zX9Tu8M/DJJqPdf+6pQwMGtUmPpmePhfavwH6v+7JZzuvPvXJMSnDioMPDXZitlMdyQ2mwvwMhEmoKnWGWz08S+Xvnh9M7Br/FsrdDyjLPlSitd+GX4lPla6+ED7Xcq+15OTpYLgm8VjoTGpLWS8VTtFeFILAVmIVMmoENT5UOS09GdPwn1szpIQxN8tqjsYQ8GC2rpVpnVpVYmv/QeCVceoiziiz+oWICEcxiw/pr+r+cTCPM4pkuRn8/D0CsbeAhDskK/+28+hOMkfDScJS2cCdOURhJsVvTPxVLy82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3pYkvh5jgcZe1FX0Xcjjig0fhqrqXCSFR2HmY9Fqzs=;
 b=gA2hRlJaZdpoubw3eq009MZIReYGtSLvzlpsHtpl1TF09kvI2yEAXPHU8ATjprkvFzoFZ9b592vv0J29NRHn4ng6/gj+KEo06Qg0goG2QVm+YV3SaeFWa1vpgdyY/RmDNZyPTUILV3TsGZxb98FjMCYxm56DyBoATH1cj+Edd8+154p8kl3XBqpnphZ+U77MnZJkHwqVHGH1h3xl0esaJxynsqGObAIHFVxH8VQJQjm83Ia3YDZ3gXEBtAroP1RpIdzBrd1C2YswsrDsmA8ZJcR46BQYst2bf1Qc24hRwUqmTgnlyEc8zakvxAdQSCXxrWhXl+X53L/WlqJ+1lLDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3pYkvh5jgcZe1FX0Xcjjig0fhqrqXCSFR2HmY9Fqzs=;
 b=GdFHUJseR+llR1TV0JJYcurQOeM/1vrEXgsmW7Gl0xI8rI2CXIbEaxSLDPD1RzvsjYd2kLoMZDylNzABxtk6NU15VDTGf+e/gADlV/nlnu9a3/p4enO3NoSn7O56ksTDvyQ5iBM3ROYFPfKcanRo4HOXoxm6O4z5m/RGBXl44Ng=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW4PR10MB6678.namprd10.prod.outlook.com (2603:10b6:303:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 15:16:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%5]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 15:16:32 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: ktls-utils PR needs review
Thread-Topic: ktls-utils PR needs review
Thread-Index: AQHalMgPqeljALedHk67IOatpyWRkA==
Date: Mon, 22 Apr 2024 15:16:32 +0000
Message-ID: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MW4PR10MB6678:EE_
x-ms-office365-filtering-correlation-id: 23c832fa-015b-4ec3-fcc6-08dc62df3192
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?1o2Bj2bW52ak/Ti1CsKDb+L4MSbG9JBf++Dof/kpxL2GYw+RqZ1tSv4oPlL0?=
 =?us-ascii?Q?1BkAnqmCe8AeMWTJdGmH3ovWdNFU7b0tA5bQFWClNP7/kK3Zn9U/pYWvOZrH?=
 =?us-ascii?Q?LbBMil/5SG31DVn46rS7MylpIzJXSmTN553YL6v17Jii8huTKFoulltqzXpG?=
 =?us-ascii?Q?oYkqfvoWfk7uAEPmL3vnVYKhIiTulJiLTfVo23L09BCcbU+EvmNtIu74nd5B?=
 =?us-ascii?Q?gqjgBeJmvfFS2gYkN6ezDJxFge6RUWhGw3L6wvyUf497Z9TXHVfuIpg8+WS2?=
 =?us-ascii?Q?zToBmOCW/p+k81fmfrQpDyJArIpXGt7cNNUfeCkWHE0o4qRVyhIXirA+Wje4?=
 =?us-ascii?Q?6nS0+6zYOLm56XPE1oPdGVa2P5QfZWga4P0Waq+QlJANI/AqUlgzR8nWFsVx?=
 =?us-ascii?Q?lOvbRuYN/29thgIuQJpVbOqw1DQsb/9yB6qCPUbDl/gHexFkA+dPFOvKiMM7?=
 =?us-ascii?Q?nzv9W/Df1SH9Pq+fWt8nZQwl5mTpCx59G/v+AdI5SiBxjCzOttG6GsSr5kzz?=
 =?us-ascii?Q?AQfGBlo/zgUI5pRqEW+gIwGlOur1DGzNua3I/O6Z1u7+3Mg10XnP/BL9VAqF?=
 =?us-ascii?Q?HhFzhykhSSD+GxmudbCecvzd8EptMS+stZKUnSiXQIc95QYFYw7ASdG410J/?=
 =?us-ascii?Q?YypKKz8BeDlF56Ep6zhR8LvO2eTH+Fl/S/qqb1aFsM4XISU02zz7Z90XU8d/?=
 =?us-ascii?Q?3VmV0imiS102C47HCf2XvrHsR0qqB5ND+XphigGW1f+7IAPkUeEpbqzVJ4Z9?=
 =?us-ascii?Q?+m64SB+rWp97Muww//mm2BeIV5TNC5SIhlHPh4RE+DzVMONANzWMJAABZtY4?=
 =?us-ascii?Q?Cy4o+Q/CznmoyccuCgInFEWq4ArnR+0FicWK6dALuNYVGTtcrh3HZrMuZcnP?=
 =?us-ascii?Q?vqPvJXJ99JO1IuN4ecTY+sXIZy8Pi0FLS6GpLU8qyH1IV2KnWhO++WkkrVfm?=
 =?us-ascii?Q?eOv8zsz9t0q7sn/TJ9GygT3J7wMvLW38EQeSNaLk8dtFNn0NxqAn/cRqTNkp?=
 =?us-ascii?Q?mEfQbV4ImkV0Wjznku9MdnptQfFJXv8MovLIy9Lfafr7aSmibTXW5jM0uCYp?=
 =?us-ascii?Q?1PDXyHdqUaxZM54aYFX0JGhXLgr7eRBKW2NXpjKRn1xAbzG4WXEzuV7LmCHN?=
 =?us-ascii?Q?j4yzID9c6VkGU1VzVa8WFIORT4cIuypkLijoePNmPd8my3gQBsxp2ls02uI8?=
 =?us-ascii?Q?niomb/sdGJMOXVLbQbnfB9giTfCRhzjm+bQw+IkzLMfuhlaTGN4S6gEOhEKd?=
 =?us-ascii?Q?7dkeUWhF6tXJfTug7ROaJLi2WimiWktylL+cRFkPBSAtenc7cPJ2B2oaDh0g?=
 =?us-ascii?Q?JC11rmsrja1bc1S6O6tOyYTS1rY7miP81vE1DunY4E4ZBg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ekzOGX1N592HUPIAan44M9/nlW68LeH3JT8HrvtJbLH2NWBbsJ67+TDZliZ4?=
 =?us-ascii?Q?XP/gv9b+0IQN2c0hdQE1ggRSNdBBZnlWFC/e8pwgzFN2m8e0VBMfDBZpEtyK?=
 =?us-ascii?Q?pu5xr8HgEqEkNw/ucAKHwk+kGXkiQUFbZM+JLa7a2oMoed5H2CgOuQzsAEwi?=
 =?us-ascii?Q?7jMouU8xuLSNFdGDtez4VayjawQvIqLQefc4KqoEL2QIrCH6QaVsnXDMQf5V?=
 =?us-ascii?Q?cbrYANx2nkaImHDn7kDzG1YTFjzu1I1pX5Ugo7irhKOL/bB17RBQiQwYxIN0?=
 =?us-ascii?Q?1UK+MkKDWMTHm2BycStkAttUFJB5knMyXFxcPsbyRCjjyfgac6vHbmIFCkP8?=
 =?us-ascii?Q?c3eAqZFEJKX6tSCIZmJ4RNDQD/sKrug5K1jCjQ76FvRFFoYNlae39k2ZtFIV?=
 =?us-ascii?Q?L/DOL2LPbsYe1n6afosJ1/xoXLQlUj6TleCWLoa+jxcoqvlmbPCxKCZoYs2z?=
 =?us-ascii?Q?s5QkgDbdha5b76pLbjGdMCj7HbV01zdOFV94qcKot6Y4rlucR2d6wh7U//+4?=
 =?us-ascii?Q?HJtv/M8y4QIOQNQN5SmKjgHx6SLnIEgLWWgqfWoIVUitgI8/p9PGZLU47sBK?=
 =?us-ascii?Q?AJOjD2TO1I52kInSOOe2XSeUuGE50vQTkDxEfLmO4q8Sh0+VAfRIo1FS8MWa?=
 =?us-ascii?Q?gn2wCYFZmuGYVPQsMbyPjcyc5/yKIzXcno8TA2wAXcXpkLLcdrdHiak0ktjt?=
 =?us-ascii?Q?iMhf65e71TlCnUQfCIsUoCs4tUJBvlkFL5GzBcl7dKKjcK1DHKWlWYT15BYv?=
 =?us-ascii?Q?y/4zGdEPVcMZ20iwhtScZqDlmCJa4Cf+PYKaVZ43Z2VCmHHlqBFw33pQbJ/g?=
 =?us-ascii?Q?7SOt2M197KSwz6CZyfUuNb8DT/N0XgO7955EmsJzuPT8tYx0D8cKQ1wtPs33?=
 =?us-ascii?Q?K/HKlxafdZ2VYoG9pummjB1qtbV9RJvaL0OuSR87bhYTZnRmQiuY9+6JVsvP?=
 =?us-ascii?Q?9k7ow5iLEC0QOHx4/FGKIBksdOnnaGEWVVcfdGk6OnBKTwwCL7JTY+4icPie?=
 =?us-ascii?Q?jKZRsioi4GhiwgohJCRg7l3wUpZJgS0pa3f8fuUg7zp0MBlkHKVtsMV2jzk8?=
 =?us-ascii?Q?+R8ITLoK2wqU+CRlZbxMjE1XmhArMtPxOhjPG8IgwNPKu1ehKlrcpv+yop6S?=
 =?us-ascii?Q?Fue7QPmLitajLaMWHY1FlcjtP4DCaoMPIlKntTASwQVUmu6LuW+qc2t0fRrA?=
 =?us-ascii?Q?Ha8itDam9INwhhLaniSedfkxGiu3OfKJbhp/aS6pIiqfxtIa6JPvGZJsEXzm?=
 =?us-ascii?Q?CAFG41MkXADyyPKGrjMtFGCZgA2QEQZ4q61tNr/PBqwlEU4UqI/ohHsgljlV?=
 =?us-ascii?Q?8rImT0WULGl76lHKNR9ARsvcUHGzP5QLeBlwHLyJyZ0wxP7ElseUDaFRbItU?=
 =?us-ascii?Q?4K2wuAZ5ZlJItzzQc1ab1lcLxaiFkj4AZqWIJ5+K6PXJ0cU84tGWF2JGIYG6?=
 =?us-ascii?Q?54+N+tc0LB/qzVhqWDncrmdRVenYkR0KrFOWoy2r6Tu5oT60SdHpX+ig+aEw?=
 =?us-ascii?Q?y9o1Dfe1D1pe8/AMVtyaJ9ZP2fl8/Ggd+ul4wZl4Z6Md86Wi6WjbSbh1f0GH?=
 =?us-ascii?Q?Cc1zLSqVgIadpwf5pbcHb4OPT3MbTLsJ5xwzklsH+BPczHrhIebvLiAwuVBP?=
 =?us-ascii?Q?Qw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F621CA19BBD4184188F17EE34DE7206F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q9wal6e0SXITdN7bn1YFM6Tml+ZsIsyvDNh2LPIfw6b9ruFynO64p0ZEWyAcO5npQ/E4GY2oOTwLCYLicodKbWFx/5E+gqSFqc8EunUbogi8wBNCkEo8v8cvanNhifI+YwhcBxvbnSdJ7gsl7+B39+U6liD5VjU4gEwCOIzUq0+JNRdgUKNOa5Q86kBXePOkUm9AGBV1IodHXBHhtAwD+QaQgCbq5uwAcpZ3pdI6SrmNEamcplI24n+o2rw6KNyjgDGxbFI+W7qJQ3hFhGldidIZDf41SoJVx8qyCKut8iuMuflWK/EsUuQqetpYQKoDClfo57cz5L+h1OYRYn2grhPgcDa2eb7O/m/fHAMEX/Ouucmpa2Heow7cQmKhYjDiLN3CbUe3m7MlfmlCSWlzCvMJrXg5uq2eDQJlAE0xayVU0H3ElJXqFW3KKZR8LkLT4OaUljQ3VAtthMeM02RA83ZVrevh3dSjnN3QdAU196Mx5shfzqQLpcQXELadtFgX9ntFNarN/avZI+T3/vVn+07bcLjLc59E6q3/o2SZiW2QbVGPRt4Wj5AJ1feMTptvFeF0usDTLXJ+QpBNz/VlKGqhC7IYtQLLsB4ZrZWMwZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c832fa-015b-4ec3-fcc6-08dc62df3192
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 15:16:32.8127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu9VBOySiw9BE+h7s3xMR7bsy2ILYGSIa62pZSPKOm30Zt6ZB4X78gpZj3qSjZ1Z520ONwCHUrcBcqvRvDW6CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6678
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404220065
X-Proofpoint-ORIG-GUID: srsNw2mK9MsDpaSROkWbx1-SOsvlWHqr
X-Proofpoint-GUID: srsNw2mK9MsDpaSROkWbx1-SOsvlWHqr

https://github.com/oracle/ktls-utils/pull/54

I seem to recall a similar command line option that we
removed because it was insecure.

At the very least this needs a man page update, but I'm
not convinced this setting should be allowed.

--
Chuck Lever


