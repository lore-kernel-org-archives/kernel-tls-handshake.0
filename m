Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BDD1DE2CC
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  2 Dec 2024 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733165441; cv=fail; b=fR07uLnWgx2/hqR9QNVwp3jn6RhjDeFfKfO4FaYRq7kJ7U9gFKXqebla0GIvSUZy2NpkgiBx105pZe5OrGjH3Fn6GR7Y/XJY3LYQ21U2ldfTRI1n4kfl7WL0hBm0bxr/pkzqHCA/9TGOFqZs7B2ihnAJjAIElswM0JkVFnOEHro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733165441; c=relaxed/simple;
	bh=f50H2bgqKCXtWki4iG+VhI5do0GWnbqYVc/Ml5m1rvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5PyAln8eYujcwWQC6HOG7f0oXJk16faTgTFXU3YpGQbfnRvHDrPGFCIe05NITW31OXIjIZm4CsxvEcqNM+8VBS4eo/PSwAAFerXnqkZ5JbMpbAkJUCs2hv4xAG1V3DzR4vn4QzbAv9+wSrb2stK6l2iCnLRTf/JFIok8I6Hhdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gj8JGSt7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KYTT8FG+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gj8JGSt7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KYTT8FG+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Hfb6d029534;
	Mon, 2 Dec 2024 18:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=f50H2bgqKCXtWki4iG+VhI5do0GWnbqYVc/Ml5m1rvU=; b=
	gj8JGSt72ozCUZFuknJTKwh9gD140+ej+lvyxwBuCSkml6VarGUcC5AHPGVAC6+X
	9NSKczRUDnIYJWK7FRvFKwh6tTZxNG1ILWwOiDO2Y1dOUYwGMqQJVBF2O9F/bx2Q
	nVfSC1hEUiCteb0TT2W2l88W+tEJ9RYX2rpiuRSty/Y6jzMxh4E+03rjLVCt9Imo
	TDt/qA4CoXjGWENrZdfyRmvcqkCGxe+BK4UyvPKUVG98swJpY9TNVdkNSYrg32CY
	rLjsuJmdSMFq4DiAYvGRw0YE1JcLwFaGstSzbHZ5gGXAyHYKsJC7k/xI88xhZof7
	lDQgqgA12S+Mu/wCm7pOXA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbmeg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Dec 2024 18:50:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IJbMV032875;
	Mon, 2 Dec 2024 18:50:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s570gmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Dec 2024 18:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkxHPXvzodrEemjhAwPqHas/g8fUMaQC5yk9QU9rtX2udSPMikSsftXHJf46/fCNPR0HS8/An0GisqCxF7DwHosmvRFgFvpHDycIKSIjaE69gpJOpXR+OcSF2KLAyKWRiE4fqgxU6+TXwnt4LVt8cC2H+KfzCKeXSIaH/h6veOKpwnP12vb+faFizHLuAaKbvrFmyxxV6MQPB/vNlEM5kQno6O3cwN4NCFhhqoShU+R9mkYX7pvlQGx+uuIgbx7GHpUerWOpwDCYohBD1+i61Bs3Atzyw5MmtRpRIGcdX8zosSiBeN5HqBzg1iwP+IyF3+1HorYrE0qQI6vd2PypKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f50H2bgqKCXtWki4iG+VhI5do0GWnbqYVc/Ml5m1rvU=;
 b=NDCxKVpDn+YAvT28bmqUSyNpKy+eb9VF2hZIMTIZyZaGFm9RT1Vkt+XPrmwZrRoB2XmX7drAnonscrKPSFMhS6TXPSxDm3CwXWJ96C6az/sBTehIhpaITaWww7UtEYH/irUTtaqYGEMzm1Pli95f9cwzTcVkAaJNunZglultkqdL5NnirUS51W3RovmPNsvxycQVDRwcVtm9wAa+bpvckeMK9cJYOS7cu6c/EA9uLIdXlZMok8Uqo895r/MCWYBrpvpGjcv6E2eMQr41fy3/yriTd+NwgmRSfAQMFAlebdS4GbpEjqfDV8DNzOY0zZm6zgib69Ke5RhcmySNYNTlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f50H2bgqKCXtWki4iG+VhI5do0GWnbqYVc/Ml5m1rvU=;
 b=KYTT8FG+AGxb/HNgGcoRP98nceFDugrSoi1AQmwfq/oSSsXzkAE3apeLdceR9tqA8SHZUgIV6TO0x7SRGkM8wvz/mTF/KQLFDZ+9K4Q7efEclYEG24De3W44WVIVYs9nNYILcWJn+evXv3CEcdN3T/wZWqToI3pJibm14NcU5jo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH4PR10MB8052.namprd10.prod.outlook.com (2603:10b6:610:23d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 18:50:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:50:33 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>
CC: "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
        "sd@queasysnail.net"
	<sd@queasysnail.net>,
        kernel-tls-handshake
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
Thread-Topic: Question regarding TLS Key update for NVMe-TCP protocol
Thread-Index: AdtA4dTx60qe6yI5Rc63jtENYw9WqgAqoEl5AAl9OhAAAJQ8mQDLQnLAAAJZLAA=
Date: Mon, 2 Dec 2024 18:50:33 +0000
Message-ID: <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
References:
 <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
In-Reply-To:
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH4PR10MB8052:EE_
x-ms-office365-filtering-correlation-id: b9820ef5-ce1a-41f7-35ab-08dd130233d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkFpUU01d1M5RU1jUTgxVjBpck1iYWhaNUdrOXhHM1dEUytMMTVQRG4rbGRH?=
 =?utf-8?B?VXFPTDRmOCs4aW1IOVJoNFR0d0RiMWVidmZjV0FVMmd2NjdDWHZFL0ZSRENT?=
 =?utf-8?B?cVB0LzVVYUsrVlM4RWljWEc3UXo4UkgyTHZmSEVvbCtmaEUrQ1ZBb3RuY2ZE?=
 =?utf-8?B?QS96ZGNRdFFiY1k1bys0SUNHQ0NiS2hoRnU3UnRNNk8zT2YrVWFNd0ZkU0xs?=
 =?utf-8?B?M3BDOTVsVlQ4RFF2UlVTVjBJZ21rbXVGRS9PU0E0QTRCNEhLWnpzUUIxTXh2?=
 =?utf-8?B?aS80ekRxeVdPNGlnVllqWFFtczRObmZLQ1pDcTVjdlZET01mZm5Zb0txYnpU?=
 =?utf-8?B?aXhKWnpLUWVJMFVWUGliVU9VRkEwd3R1SG1iaXlkMVFDOUJyMXBvVlJUeFJr?=
 =?utf-8?B?N212UDJGWlJycWJmejQrWkcrbmUzVkhTaXpNeG1pV1lTMVA0M1JIdUhiS2xs?=
 =?utf-8?B?M29OT2RSZ0lsUXJDc1kyN2JuME5KamljTkJkakFCNUtEbXFRL0pnRG5HbWlB?=
 =?utf-8?B?NEE2VmY2L2crZFRrOXVJVlRncnEyNFZiWkxWVkJ2M1R5MUxVTHhPSjRENHBn?=
 =?utf-8?B?K3E0aWVmYW1pcnN6V01nYjNCMzlNS09GWjZUVVJHZEdRUEhqK1NUaS9nSEdL?=
 =?utf-8?B?b3IxQjdmSHdnVSs2WFFzNFY1dk9OWjRtbHFRUXNrcE1jQ1BiMjF5c3lkTVZh?=
 =?utf-8?B?TVhIYVdDSElKUXJDYkNDN1NNbGxYSmZWcjQ0ZlNxRllJVGVpWmxmT09Tc1N6?=
 =?utf-8?B?bUNGRlpDRzVHelVlNGQvenBHdUZ2Uyt1RXpiWS9oakFpZHloT0ZSek94MEJ2?=
 =?utf-8?B?bWhkbEs4NUFEK0ZDVlIxNS9HcEErQ2VzMmRhaXdkdnNhNHJVVjFCWE8zaFJP?=
 =?utf-8?B?S2lIRE9OVjlmQXFRbXBJNjE0cE5UMTFteGNJWk9oemcyejZDVHRlajY2UTRU?=
 =?utf-8?B?SVRtMzVFcG9MM0dvRUxJZk80anA5ekx3S1psNXBLNVZWN25yOTVDRjEzaXJE?=
 =?utf-8?B?VUVGWDIyZ1BXc3Vyd0JkUWEwNkx0U0VuUGlIc3dkWm1EVWZ3WU5sZnNtWDJs?=
 =?utf-8?B?bzA2ZGgwUVMrVzlDcHFJdXBqRFVyOG5WVXpuclNyY2dBcmpSOU5CeDZDcVpS?=
 =?utf-8?B?WU9QQ0tyeVJHaWJ1MlJCUEVVVVVMcFFRL0hNbXN1VGlnNEEzWjROMmhwMTQr?=
 =?utf-8?B?bGRVNGNWcmhwRHFqYk9zVDhKa0V6cDgxUEhKdFdUVkJSU3JITmIzVFJnREtV?=
 =?utf-8?B?VmNrOStSbEdSTHhDbHJYQVY0Rk5GSFU2Ujh2NktYV1pramVlYTNTMlpjSFpr?=
 =?utf-8?B?RCtKQkZlQnJjeHN0TlF4MlB2V2MvYjlaQjh5RGxwVlp4YlQzUm1hVWwrbXhq?=
 =?utf-8?B?VDdGaWRMWFcwUHlEVmZRd2JtZFlmdkQ3Z2pVbzVsZmhDV1gzeS9Vb250aGFq?=
 =?utf-8?B?cnY4M2ZmcUxhQkwraGtHWHdnSzlha3haZWhBVVdzQXdDangxMnhJeTkrVWVi?=
 =?utf-8?B?bjUwWjdLWHA3YkNibmZKUFZHSm9tbUd0ZVFuN0hwM2RySnNKSmJIRkpYZDYv?=
 =?utf-8?B?L0xrSlZZWS8xZHcwU1VVV21jL1dvUzI2RkhBLzJpeGE0TzNuR2ZSVTFEYjRJ?=
 =?utf-8?B?dEdJVnpITmZiK0tySFVEOWNVVkhsSVN0MXNNWVVTVndSVkFSb0hJVWpWbnNh?=
 =?utf-8?B?NW5lY2h4Z2dxUUdCYzdQbXRRMXUzbFg5OW41NG1TMEpuSXVGbDlwZnhhbDZ1?=
 =?utf-8?B?TmxkanFRSDFHbUVmQWx2ZCtyZ2NqRHdKdU1LR29tRFkyY3J6cExrK2NqNUlu?=
 =?utf-8?B?Y0dJaGwvWEdNbXZpeG9JUlFSYVNBK09qOTJRck5YYko2K2Flb2tqOFRRYlU4?=
 =?utf-8?B?YThWSjhHdm1KclorSEdKQlltTXA5QVJiZ3BXUldZY0pwbXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3liUElwbklMSHZEcWlxZVd2QkVDdlVETmFJL0ljdVg0cnlkaHB4ckZJZklY?=
 =?utf-8?B?L2RTWlRCY3BuWFdKUGVlc2FyY1ZZaTVwaGYvd0xTbVQvWS9EU0VhdmVPUDFR?=
 =?utf-8?B?OEtBVU1GTlJnUlhFUUFVT3Q2NXJwSXBDNmh4eldIeWQraHgwd2ovWFd3VnlD?=
 =?utf-8?B?dzlFRzhvSnFYUGdaMTV3WWVxMU5IMzFMY1R3amdKMHc5RUFXUXpUbHd2VGkz?=
 =?utf-8?B?ZUYvdUUzMkZMUFlxVVFaaytEaTRjK2VYQmF0WE80a0k0UXFoT2RjZFBlV253?=
 =?utf-8?B?MXZYVGtoMTd4L2ZTUUxmUVJ5YWVDeXh4dUNXSkpRV2MyLzdHUjB3bnlIWUth?=
 =?utf-8?B?TzIrZjdDTjRqd3hqdTlMUVp1akcxNGMxdGtZd1EyalVGZTA2RWUvTDB0TmZi?=
 =?utf-8?B?V1BZSlBOMTFiVDBHcjhzTnhMOWxFZTJteFlFaGRidExpWkF6anUxZkZSMzlP?=
 =?utf-8?B?MVVhU25zMWgxUXpUcERYaXU5bTRtK2Fpd1kwV0ZmSzMxdndDYVpUTytpOHVx?=
 =?utf-8?B?eHVTczVYMWd5UjlaYjU0THVxY3dyaTgvanplZ2RnNyt3NGI2aVBKVEpvdDMy?=
 =?utf-8?B?cDhkRmU2TDRRWnJ1TGIwSStyYmNsVlNIUGtDSlhKaXExaEpKNkJpSG91RHZi?=
 =?utf-8?B?Sk4rYVRNVmNDVEd5dHBUU1BsazdzY2p5V2xWMEliNDZZWjlrdTBzWUlNRVZH?=
 =?utf-8?B?R0pYNHltbWEySlNGT3I2UG9DVVpDckJKRWdoZGd2dlNoNEYxOEFEcHV0UUYz?=
 =?utf-8?B?KzB1UHhOL1lIV1dtaGRqSm5jTVh5N25FZHlDNy9BL1NtdHg3Yk00RkozakFD?=
 =?utf-8?B?VVRLcTFUTk9ncmYzUXlHMkdYN2tIUWJDS09pcmxFTjZQcEcwWWZ6UTV3TWht?=
 =?utf-8?B?czljbXBGeCs1MDQxT0RHVm5UdmR2T2FjZy9MeFFPNlc4MDdBSEVpSnZOak9K?=
 =?utf-8?B?RndHeDkxdnIrc01mck5pazdLVFV5RmN4V1E1WEUrVlNsMnBWcSsyd0dpR1A0?=
 =?utf-8?B?TVZTWDVRVkFPdnhTNGFPK1ZOWWxKUmR3MkMvTWZ6OFJnOENKUFZ1Nmd3S0Yx?=
 =?utf-8?B?aW13ckcvRG00M2NUL2s2NXR4VVN1RGtGa0x2L21sZEJ3WWVMeStUYlVyL3or?=
 =?utf-8?B?U25NdTIrODJSeGNHbVQrMDdmS3d4cU1GcGp3SkU5d2JRbkR6Y2tzdDRnRCtS?=
 =?utf-8?B?ZEVKZ0VwcXJGcEg1RTE3a2c1bWZxbytMT3Nya3NFenNRZGhneW1qT3pvYUJI?=
 =?utf-8?B?MTE0NGhScmxkdGkwOFZuaGdyd1htUXFNSERLSkUwNGM3M1lpNlRCYmhYQ0Fn?=
 =?utf-8?B?RWIyWUJROGlmZE1IaUJJUW4xdUZ4dWR4anl5Qmo3cTh6RGxBTk9pYWVwc1g4?=
 =?utf-8?B?alhKSTlQRmt5ZnBSdHBLRXg5cE9LdkZacWliRXJiZkswTk5CcEUzYlNiYzUw?=
 =?utf-8?B?L00ySGQ1N3dJL05qcGZDNGNzcmVpTmduOTlQaTBGSGd0cWxxVzExaEswOGpV?=
 =?utf-8?B?dzdCZEFaRVBFZmhaK1drQXRJaXNGY0Z1OEFXRU95MExpZlNyajlaUk13cmxl?=
 =?utf-8?B?SHVJRlNyam9Nb3dtL1d6QkVOYmRZcmxUeW4zdnFMOVdVWEJZdjRlYTBVc1ZL?=
 =?utf-8?B?VHJPaVQ1RHJHVEo5QyszclpOQVd2aHY0cERjUmQ4M2FDclVBT0VSNlJqZTNo?=
 =?utf-8?B?aWlDMjZTYzkzWUZMK2F6NUo5MUN3bkF5ZUJLZEE3eGdDRDlQTTV4Z1g1d3pv?=
 =?utf-8?B?SlM1NE1TYlUrYkJQenhhb0I0aVdsYzRlWXJjWEl4TXE0Q2J2NW9NVzV1VlNF?=
 =?utf-8?B?ZzhodzI3WGpjY1gxRGcwWHdPdUhxTGxvc0FQSXptN0xNZ0tvK21ocFUyK1VO?=
 =?utf-8?B?KzUyUVpObmp5OThKSHo1cEk2MjNuMUM4KzRZYVJUNXk4UTJnTk9rb1dsUHpq?=
 =?utf-8?B?SXQwV3FHTjRyYXp6Ull0a0wxTlh3VVVXZlk0SnBycVArZ1pLMTVUMnVCN3pz?=
 =?utf-8?B?NmtsZnljdTRRcEtsZisvRkV5aG1lM1hwL0UwODFuS29MOWs0QnhFZmN3NDJk?=
 =?utf-8?B?eWEwK09YdDRoMllqQXVCMVdicDRSSjdLRjNvQ09GWU1NdjNYb0cvZG9JQUNr?=
 =?utf-8?B?NWRhTERHWlVFd1JaOHFxeUtheFVnblcxYzJtb01vODk2VFlMT3Vwd0lLK09L?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <304903A7DD0BC14E9D2A45D47AD5CA99@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y0tO9wjdJU16PE8vo3kIw2uUJN9Qle4xxnjHgBtvJSOdJoFrCFecKDGiuneZslcOqvLaOE6xnaWhU7urrkUder7XMOVondHe/uctWUH5vWsvEfRykBqZjyq6915z1p5jxhTxmRYjX0DJou42oMOXOsL0rl0/ETNQ9X+T+g+H4XHjIs14Sf+zbeLnErMDVXcVTYhjpRcGs1x6qJt+H/pEfo0tkqf+M7iZ8Vfp3T4QrLpr0HE9YUn5KxAVMfFAFiJR+GxcYZvvlOGL0fY7chQ0X49R0dn9FRFCLdVwJkVlWxgHHxFH1GakN6nBA3X6vLrAuNzV3/EAVNedEr+UMTFx7GVl6dgGZyn6NEaYjCbpV83fBENdL+2UZDheUg7u8kGfUPU2f/GDv0gh+qhjDahfi0Yinp3QIi0eP9hzjGmY3lidQTG9828W8USJRcRINEQvjzQLjXer0bnfeWSeNm1MCbISDH9FNaG8MatWp1G4hn3S20Ay5OPRYrdVhJF+kO55iodEwljaueLc2a80MU2dhqR7t/2kJBbJ5Rf3GsX7ZYX4FUQZgm3jgvhDEz7T7ySGdxNKrxSNXZmQedE3g+OlHUrtW1/Tj4lfL+PSLw3aNqM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9820ef5-ce1a-41f7-35ab-08dd130233d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 18:50:33.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QzSR33iktpHt6RrnGQ2H0OQDrsyYh5y8A0Ai+VoxMTUXftHWSz6z1Ex1rhXClmaNh0oOULoJw905WBtcd/+0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8052
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412020160
X-Proofpoint-GUID: tlC664oTObtz5I5Y6RMi_dhIm6M2fSM0
X-Proofpoint-ORIG-GUID: tlC664oTObtz5I5Y6RMi_dhIm6M2fSM0

Q29weWluZyB0aGUga3RscyB1dGlscyBtYWlsaW5nIGxpc3QuDQoNCj4gT24gRGVjIDIsIDIwMjQs
IGF0IDE6MDLigK9QTSwgTmFyYXlhbiBBeWFsYXNvbWF5YWp1bGEgPE5hcmF5YW4uQXlhbGFzb21h
eWFqdWxhQHdkYy5jb20+IHdyb3RlOg0KPiANCj4gIFNhYnJpbmEsIEZyYW50aXNlaywgQ2h1Y2ss
DQo+ICBJIGFtIGxvb2tpbmcgZm9yIGd1aWRhbmNlIHJlZ2FyZGluZyB0aGUgVExTIFBTSyBLZXlV
cGRhdGUgZnVuY3Rpb25hbGl0eSBpbiB0aGUgY29udGV4dCBvZiBOVk1lLVRDUCB0cmFuc3BvcnQu
IEkgd29yayB3aXRoIGEgdGVhbSBpbiBXZXN0ZXJuIGRpZ2l0YWwgdGhhdCBkZXZlbG9wcyBOVk1l
LW9GIHRhcmdldCBhZGFwdGVycyB0aGF0IHN1cHBvcnQgTlZNZS1UQ1AgYXMgd2VsbCBhcyBSb0Nl
djIgdHJhbnNwb3J0IHByb3RvY29scyAgVExTIDEuMyBzcGVjaWVzIHRoZSByZXF1aXJlbWVudHMg
Zm9yIEtleVVwZGF0ZSB0byBvY2N1ciB1bmRlciBzb21lIGV2ZW50cyAoYnl0ZXMtdHJhbnNmZXJy
ZWQgb3IgdGltZS1lbGFwc2VkIGV2ZW50cykuIFdoZW4gZWl0aGVyIGV2ZW50IG9jY3Vycywgc2F5
IGF0IGEgc2VuZGVyIG5vZGUsIHRoZSBzZW5kZXIgdHJhbnNtaXRzIGEgS2V5VXBkYXRlIG1lc3Nh
Z2UgdG8gaW5kaWNhdGUgdGhhdCB0aGUgY3J5cHRvZ3JhcGhpYyBrZXkgbmVlZHMgdG8gYmUgdXBk
YXRlZC4gIEZvciBOVk1lLVRDUCB0cmFuc3BvcnQgcHJvdG9jb2wsIGZvciBhIGhvc3QgdG8gZXN0
YWJsaXNoIGEgRmFicmljIFNlY3VyZSBDaGFubmVsLCB0aGUgZm9sbG93aW5nIHNlcXVlbmNlIG9j
Y3VycyBiZXR3ZWVuIHRoZSBob3N0IGFuZCB0aGUgdGFyZ2V0Og0KPiDCtyAgICAgIDMtd2F5IFRD
UCBoYW5kc2hha2UNCj4gwrcgICAgICBUTFMgc2Vzc2lvbiAodGhpcyBlc3RhYmxpc2hlcyBhIHNl
Y3VyZSBjaGFubmVsKQ0KPiDCtyAgICAgIEZhYnJpYyBDb25uZWN0IGZvciBBZG1pbiBxdWV1ZSDC
tyAgICAgIEZhYnJpYyBDb25uZWN0IGZvciBhc3NvY2lhdGVkIElPIHF1ZXVlcyAgSSBhbSBub3Qg
YWJsZSB0byBmaW5kIGEgd2F5IGZvciB0aGUgTGludXggaG9zdCB0byBwZXJmb3JtIHRoZSBUTFMg
S2V5VXBkYXRlIHdoZW4gdGhlIHRyYW5zcG9ydCBwcm90b2NvbCBpcyBOVk1lLVRDUC4gSXQgYXBw
ZWFycyB0aGF0IHRoZSBvbmx5IHdheSB0byB1cGRhdGUgdGhlIFRMUyBrZXlzIGZvciB0aGlzIHNj
ZW5hcmlvIGlzIGJ5IGRpc2Nvbm5lY3RpbmcgdGhlIHRyYW5zcG9ydCBhcyB3ZWxsIGFzIFRDUCBj
b25uZWN0aW9ucyBhbmQgcmUtZXN0YWJsaXNoaW5nIHRoZW0gdXNpbmcgdGhlIG5ldyBUTFMga2V5
cy4NCj4gIEkgc2VlIHRoYXQgU2FicmluYSBhbmQgRnJhbnRpc2VrIHdlcmUgd29ya2luZyBvbiBh
IHBhdGNoc2V0IGZvciB0aGUgVExTIEtleVVwZGF0ZSBmdW5jdGlvbmFsaXR5IG92ZXIgYSB5ZWFy
IGFnbyAoYW5kIENodWNrLCBDaHJpc3RvcGggSGVsbHdpZyBtZW50aW9uZWQgdG8gbWUgdGhhdCB5
b3UgbWF5IGhhdmUgYmVlbiBpbnZvbHZlZCBpbiB0aGlzIGZ1bmN0aW9uYWwgYXJlYSBhcyB3ZWxs
KS4gSSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpZiBMaW51eCBzdXBwb3J0cyBUTFMgS2V5VXBk
YXRlIGZvciBOVk1lLVRDUC4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBvbmx5IHdheSBm
b3IgdGhlIFRMUyBLZXlVcGRhdGUgdG8gb2NjdXIgaXMgYnkgZGlzY29ubmVjdGluZyB0aGUgdHJh
bnNwb3J0IGFzIHdlbGwgYXMgVENQIGNvbm5lY3Rpb25zIGFuZCByZS1lc3RhYmxpc2hpbmcgdGhl
bSB1c2luZyB0aGUgbmV3IFRMUyBrZXlzLg0KPiAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L25ldGRldmJwZi9jb3Zlci9jb3Zlci4xNjkxNTg0MDc0LmdpdC5zZEBxdWVhc3lz
bmFpbC5uZXQvDQo+ICBJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/DQo+ICBUaGFua3MsDQo+
IE5hcmF5YW4NCg0KDQpJTU8geW91ciB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QuIEN1cnJlbnRs
eSBhIHRyYW5zcG9ydCBkaXNjb25uZWN0DQppcyB0aGUgb25seSB3YXkgdG8gaGFuZGxlIHRoaXMg
c2NlbmFyaW8uIFdlIHJlY29nbml6ZSB0aGF0IGtleQ0KdXBkYXRlIG5lZWRzIHRvIHdvcmsgd2l0
aG91dCBpbmN1cnJpbmcgYSB0cmFuc3BvcnQgZGlzY29ubmVjdC4NCg0KDQotLQ0KQ2h1Y2sgTGV2
ZXINCg0KDQo=
