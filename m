Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98DFC19
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 Jul 2024 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721150574; cv=fail; b=uSgxeqI8cclY5XNNke0zuigSkfRIytCFD79T3n2XodnHgL02g7wES2SjJT2maSpdbD4znf38l8Zl0FIt104HSVOnZTztP610injaa4UxQuqAmGzRVtDxRb9+UgxJ/dmKTpO8mWMhtJr8MT9pmDnlYhyuMcSGZ1VdFDhbuwhg2C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721150574; c=relaxed/simple;
	bh=WhBCz4BdrXrrjBroyVrpSGe4ONkR6MMCZpr08qKqxYk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kLCWxLcQensHU1jAT5JRRE5aW3nqa29kWJFrb1SsZqc+Efm1saSg9MhF/HnKkiyfjcXwMU6vSH3iLaGRawVma6W2jUWi5KrCz+l5zr3wL34pzqClWarpcD0rM0RNFDTrgPaGcJiq+WXNzJ7/zj6kF43pwu474Q2FsPZcGUuDtMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o0vsqKHW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jrQGKOKW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o0vsqKHW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jrQGKOKW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GFMXAs027727
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 Jul 2024 17:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:content-id
	:content-transfer-encoding:mime-version; s=corp-2023-11-20; bh=W
	hBCz4BdrXrrjBroyVrpSGe4ONkR6MMCZpr08qKqxYk=; b=o0vsqKHWbd++IECSU
	aNfem8DGiLIQnOqwx/N8IbqbtcZ+3HAhEos1elVRV+cZf/K6XyzMLqeQwzfn/34T
	mk9PRLCcxwMtPRRytn7fx9KKNdN1wRcm78iqNSXJE9gnpLWzl54dgotfPByqYTMo
	KUIiG7174NO93kj6udMINenKyD+0+cPKBnYaMchA4I8InVDAsses6e4CNNL2VJtX
	HgqIIB1fWoaYLJgu76LGJLc+T8652VW41/6qPf7xU45mloBIM3hGis34W7oaOo4E
	OaCbl/SRvM0y4a9DQvaJM6w2j6q+TgOWDAve8SvUmzX//CM5Lk4uKKEUbj51d2Pp
	hao8Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bg0cpham-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 Jul 2024 17:22:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46GH12tN010644
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 Jul 2024 17:22:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40bg19vaqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 Jul 2024 17:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTas2KX6UrxdCrQJpsUR0VI1iQ8x50n6uSFrLS/sf11a4YR7lBAOVxp9LvCQCVFxPGThFfMNzvvekI11nxRNaAsbO2I18uv2BBiw6O996IRFO64r/dEsGWkZxr54RcpX/JnNvKW4DNpvvmE06area/KhcQeSlmeYht5lIFmHbS5yYP7fZ6/ZXwXFAKv0A6WXeTWwGV86Y4Wr6kqyCrc1nKgQtdBKGSCJ7FuKJoXqnPlFqzF5QzpsZz+VJFVCw4Ec2/AWPlT8ajypA4t7ONsF4NAtnDOGiuo24ldWDfRPSLZD4Zha4YqMvdSjkU4PBhipwENZB6VfyMDaEaD5ezWa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhBCz4BdrXrrjBroyVrpSGe4ONkR6MMCZpr08qKqxYk=;
 b=PDXvN810GtgIXZDyqK4WKTGpKSaWTRTllGnA6M52sx8e9MP9N3/f0eTgNMp7FlyFnZSuAM1BZ9G8GdxHvgA4+QzvcZrw7iI5pQ72LoYvBizs6uAHsrJAlpBtB0xrwibzJ0T1M4hepYC/zE5hvGcP4kimyvhMxGsmSHSmvr8HK5KsGqOERwJzmoefP8TJdtUTgIX0qZKmFoSFVqmrN6HOCFUDQ4tLk1sKZJk1ck8CUtmVAQMXA0hFuO9e8MVivtvkQtnopdjcA1wc1+N1oZcooW2A2szuUFFav0SEoRiaHffM5yhaFCanhhTylCc9wSJtS3AVtKPLkWxTyekRalUZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhBCz4BdrXrrjBroyVrpSGe4ONkR6MMCZpr08qKqxYk=;
 b=jrQGKOKWOqntuwCZXzc0rR40i7RhqceYmH3nnUMIN1hD7fjpSWDik+mmoQGIE9FX2Z9iDssy2kYb4j2UfeBpV0JXTtbHEHB9UYGuw3csvfmtJawVf3rVaVB9hRdrOx3UXVwhPTsQa5zD+yx3FIZOMmEUrflydYaJ6nlcR7RIN7U=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CYXPR10MB7950.namprd10.prod.outlook.com (2603:10b6:930:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 17:22:47 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 17:22:47 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: ktls-utils project Kanban board
Thread-Topic: ktls-utils project Kanban board
Thread-Index: AQHa16THqP2CEk4PyE6VVwDEU7mJ5w==
Date: Tue, 16 Jul 2024 17:22:47 +0000
Message-ID: <1B8279CB-C5FE-480E-B6D8-7018EFCFB54B@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CYXPR10MB7950:EE_
x-ms-office365-filtering-correlation-id: 1eb90984-6538-472c-7d9c-08dca5bbe984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?VX2gJu0UqquSOFhDDPSi5+WKmivEH0IRNOUXHSMcOPq3swQ5PB1ZiIx9X1x3?=
 =?us-ascii?Q?qrAGqVNwaqsSHQ1gl8Zhez983h1n/JEuHaCcaSDA645dem45pQSHjBVATQXF?=
 =?us-ascii?Q?6GS0E1f5Dco9dOXdsxeh2M7p7iDebivQuFJKoZO+k9ZfFQdjFj6G/rY19biQ?=
 =?us-ascii?Q?fRtYBjZvuuwkQ9A1K3/VMv8yMupkUfD8TSyh4QQpdaeXE2xoLdT1154a9Jtd?=
 =?us-ascii?Q?MH/0taPxCevrxTv64dJQSeosFG4F3XmF2Snh/5SrASkg+wfkOuge2bFCE89x?=
 =?us-ascii?Q?8he32pYwN9iOnvtI3asFqhMhHzgDn9NrmAr7ofVBI/bBFg5H06RNCb1jZ/1+?=
 =?us-ascii?Q?/pDXo91x6udFbjkLqcxHi/GMes8/FBOz5smfSBvTIgQnF7pEQ1HQmhKC2nX+?=
 =?us-ascii?Q?rWHEmRgJk1adYXSZ/HURkg1sbkZbpvJY3HH2hsVwC62uYnLmXqCIM72T9xUr?=
 =?us-ascii?Q?DlyTcIHwF5qBitGznUTNITmWgpGaDr4WRMXjZgW48blPV2OBHo+PLEW6xW95?=
 =?us-ascii?Q?WcV/+g+o9PjMuEtNqEQMblVqsjH0ul5lqJyouVQxGA1W+1ZbiCEQeuN+sn3e?=
 =?us-ascii?Q?rQVr5NzBDVzz90UDhTNc1yCjiIPVy8QGLKJgbyCMxPoUsLD44KxWhbF8Vb40?=
 =?us-ascii?Q?94eT7lVRpSs/UA0YG2AjV2q6RBE5iVeteTJVD77xclOmCKQzoR+yeoiraTTg?=
 =?us-ascii?Q?RcdShurZNuFn0adSLKwJpuepYqAdpvhNCI+brk7548uxuI28gjzubttW3LEH?=
 =?us-ascii?Q?7l/+s8dR8d2vUBmsoKeb8jwDnfIdDgQgW3eHqugl2QzZfvIdT9ZUjrK1IHhB?=
 =?us-ascii?Q?H5ib470VWnWOur74IrG8u9ZNe2ITbP60LotYepLxB5ZHf5m3zNFlx2JC4wub?=
 =?us-ascii?Q?YpsLg3oG/RQdmXDi8otZ2cWA8wSLs2vOyYRCVXw7Vbpnuc7no2ZlltU/pt4a?=
 =?us-ascii?Q?wjgQtlE9WFTyvuR/sQ4eYxYIQSLoYS5xs+yGNYDCqyhMxRoR8Y/FEcO6ZLdt?=
 =?us-ascii?Q?PGZnFlaEAz+UL6+306M/m8i1gqQ+qROGwD3uz4edzdT0XWA1ROvkCrnObOO6?=
 =?us-ascii?Q?Vs63LWH7LgGikCGwhYudFvhzBdkqBBCMggGiRK43oCOB6G/7+W++u0IBI1+v?=
 =?us-ascii?Q?eAtLjSczvrjb51RVBCUZDNzfOK5kgnxBbBKu2xSRl3OhV1ZOP1lB7HPqcN2z?=
 =?us-ascii?Q?x45adkd9gs+NnYhxqRCRRaJymmdPp7uPtIMhPnWGr7yylK+0WFMzS7FQMdtI?=
 =?us-ascii?Q?4inj/L6GkW4OYiLCH1Gy7dpfcIv2e3H/XZIQNk95HacwJMh66kqJMzc+46as?=
 =?us-ascii?Q?OVo7kMB0xA0W54KYSRVFh4ks1Z2ugqiKjh3bolTJNseVuiX9l8FMsm4i/Hr5?=
 =?us-ascii?Q?K5mUWoc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MAngYWlnOErGgqtbW5HyEnhHqmUtmaEYFcGuXAh7cIBeshG2tBUiBDX05RHx?=
 =?us-ascii?Q?t/ne3r/R0HonwfqD78B447v/6IghRDVmhlRIqGffql0ccYf4zjt92PW3I6d0?=
 =?us-ascii?Q?vyUlmUU1zeNXzjt1/z2lPrS1PWmNu6uQFEOtx/X960FC+EN2Yy95p35KhZgc?=
 =?us-ascii?Q?nn27c9y4S4xM1RRXI7qR+B5mOzfWqhBnlG8nXOK6CPR/Zl/PAkrVymeAg1Mr?=
 =?us-ascii?Q?PKpmE36GMLdYjnhColPLdQoKJrcEjXWY8b+I1CHVbcAsfZLFhm5rJhxo6QZy?=
 =?us-ascii?Q?9V95csf6sLB6rSvb2v4DriuWPxKlYhT6e88yUw/5viDdAC+BZkcMl8R8qcIL?=
 =?us-ascii?Q?LQKtQg2j5fHhzoN7OX83FIixLlpQlizInXIr+mUs9hUQb4doPrZrZdPL0hE6?=
 =?us-ascii?Q?eJsmJsg9674qFg0RRha66Op6dAhWnGh5MJs1o0A3ZLLtWEpArrMEX/Ib3QlT?=
 =?us-ascii?Q?a1sORNYEw7RVedxgSH95CdqWNI8mUol91aV6n+YKGqVSGnt83gv1t5J4zE79?=
 =?us-ascii?Q?fk8/qEo/SEJBrU009SbKsy38J33S19DzGFpEBNZMryv3GeBl7oQZfjW+75bY?=
 =?us-ascii?Q?0GdrXfpd046DrWYRdEAY8ub5BwMB5cKIuBveeStrraaCqNRu8OQeinhkKDRo?=
 =?us-ascii?Q?UdUCCxqP/wGUVMyW0CutGQ4FghcjYax41yI2/CkrtmOV7PQhO6afNFMPaYip?=
 =?us-ascii?Q?Vp72KMoX7vUrtqINxK/0hK9TM7riIy34b2l8H+rtdfDF8iTkv/xkVI/SCDkh?=
 =?us-ascii?Q?tsGodLYvc9iJpRKMf/XUW+BKl/cVfGwjIM2/yugTQkc3PqH7N2H4er46NvQ0?=
 =?us-ascii?Q?ng4OJ5+J2oMxXvGpV/tQOrTVRpvVlbEr/sWD+1S5z9MK82TgL1ja37D7QU6s?=
 =?us-ascii?Q?73QEWLfM0ugn1XdnPucfn5d5TNGbvXkHukRTvLL7YDZWPWOb7d8Gy9kLEdfU?=
 =?us-ascii?Q?v/zYnMubOlGR/zkse3G6OikigyZGBMjSkmZA+cP3lANZaTb8jrkLrw6Ma23C?=
 =?us-ascii?Q?ly7avZ5IpXrbYpFHAw0eHWDQk0YkjcnpRPiiV7qk6huXahEy8/ssTnndR1Fo?=
 =?us-ascii?Q?n4p6fxu2gZ+tTRidRTsFzGRh1gcdVBYFuDRaqrowNGrug+gWx5XlEztQWNf6?=
 =?us-ascii?Q?GR1/ssi5xbDGTpVYmrdgMGcjkK7IwEOGXNk19oGJUwRQODGnZ/IIj5XfkU29?=
 =?us-ascii?Q?t3RS1ItalSvLfKmRjiCLfK3347o+80Aw+bNiu5GwsLDqyU7snByGk+1nSsm+?=
 =?us-ascii?Q?poUKPp8xlk6h/Kb0sLhcVGdDf1by/QvO6UajMNLylVPdwy7NbZ4OCsQUdE9A?=
 =?us-ascii?Q?qazagpDYSexCQbvL4E1tahI7QLFR84o+nixytVd2r7Vbsu7SSXCTaoIyoU8x?=
 =?us-ascii?Q?DdeyyH/7yRJRTmbS8jFiaSSm4yVeiZTA4bv/eI3/3zCbVbteEW2zFtXjbR9o?=
 =?us-ascii?Q?uV4xpHHGdhADpV5UGKLRXW5QlloBPzvLOu0+wRMgAgStBlpdB+SJDIbLGU3m?=
 =?us-ascii?Q?NFjDagsFtfdsaPUqCI6LL/5vG48B/Zl9FO+GOLFjxkxK/t0MmAx0GO6VWsPC?=
 =?us-ascii?Q?/vgTdMJ5qaZcgVRNerY3s9PZdwho9EqCEV/MyBqWHVNkQZeQNFNMB8G7x4AS?=
 =?us-ascii?Q?gA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17B5E1EA1DE3C84299DA5AD610406C45@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8dt6THXDhz85hiTqXlfe9/QbJd2O1T73rBxhxg3+EYF08/D74D16ff9+SIY5/F7cHTv4TosRz49SA2iQEMMWC8OyRqCt6pyNSPbeNofOv31TIlhjtMITiXzCEky9OF97dB0fiV25QToGCAMWqhDMGsZKAe1K0nI4wUmpmTnwNtt+zTkRTsHfBisxN9dpghrEO9w9miZ84wJKiQOaeF71KG6MifpftaMpiF0lEvPwc9W0f+OFZ97pdlYUsAdlQwG5SBQqd+tekMF1c+bkwtSSWHYyKUyQkha7XUtUIG62MKVfa2ad5t8WnND6MODUalXgBmrb7SXSX+5GJ96fD/cABTbFc7grjGDsPWYNWgVw+g72qmarCTKyxSRCch92qL1QzgxS96bhWsnOjNOV760kq4e/4VLRLSzTBm+X6nMwcwIXoXTaB56DYP6XFvAFDGooEJ160dryYezNSN15Jjt79Li/zLxWuzS048npzLP/dt5nzbbNyfUGxTd6gmktogiroC8muK+XDfSWMg9aODVeVu1YytIKbFDZurURVfOW76V2Ovom+dVKJeD1atluyEMO+SHLcDdYTP3vh9izn040VmivK09GyTGEczaSvb5H53Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb90984-6538-472c-7d9c-08dca5bbe984
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 17:22:47.4897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xR1ugiGfqg5dWKjWLCOztNaZyujCaFbJ6u13T2o46BQbZcB//Z21RsL2MM/x6blPwwdKFuC7nYAaCZOVL+jL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7950
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407160126
X-Proofpoint-GUID: -T3aNlm7RWWfJIjuEgz44UGfoUw2LB3S
X-Proofpoint-ORIG-GUID: -T3aNlm7RWWfJIjuEgz44UGfoUw2LB3S

I've created a Kanban board for ongoing ktls-utils work:

https://github.com/orgs/oracle/projects/14

I think it is publicly viewable, but I'm the only one
who can modify it...?


--
Chuck Lever


