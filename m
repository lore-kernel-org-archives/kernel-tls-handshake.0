Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368D71F666B
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Dec 2024 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733236441; cv=fail; b=rDc76pwcbKqqfF+ezpP3D4Ev2S2LyZuixd1pYSACcnO/LRr3a8dvuhfUhDoVE5f6Me5QO+uo09HNoIge1ko9YLqqxMriAesV7vh4SlDMmyW+r44anhm6GZwcrRqz/f7k5hT+7L7cfNM7Ijddny3xwzZkrlGjrZn1m6CNbINm2fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733236441; c=relaxed/simple;
	bh=PdWNuIlluLcw6qVt5wZFnOdB9038HzFwlszN1gmbeOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TQLIpoEUq+2CMzWMAatzwBbdeOAR2rTTm4q0ix6fEeYJgGmV0SG43FQwCtojQzSBYxUTMCfNFdtCc4bz+DwkhRphGdpI9FZPZT9Nu3kytwYaileiufMkIP7c0hJaoo5f2JTjWZU4UpK8T377A3sayFxXs1QmNfqb4FeEk1132nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LO6BYO0i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=toRFAQqL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LO6BYO0i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="toRFAQqL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XfqL012893;
	Tue, 3 Dec 2024 14:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=PdWNuIlluLcw6qVt5wZFnOdB9038HzFwlszN1gmbeOc=; b=
	LO6BYO0iqzOB1TKZf8DBtoKZSxBuMXDKGAwe3YuaDuStmN1yEKul8xvVmc1w1mI6
	fDFnJwl5FGDIiKXLHcXFL95CvvFFf/NQEFyWzcusI30xCrViix5k6ddCPZQMMHTe
	+k3/1ELGbQTDEbhPvX5ojBPDyyh7srKNVBNtWmmr5JibLUCbD989D2hS3X1ruR7R
	P6VeNvjefic0Qk/Zxl8KjVpV+7mo5SFYbofMX9AeBHFM+yPwWMi6Ee26PnzTGwNT
	im3VOLDqU+i9GIdnfzqG4MYl6aDUDYCbNQRH/Ux3TmSrCHLWynonPHk+heBCXHVC
	tyhaF3uJzCO7ll57BDCcTA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437u8t63my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 14:33:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3Cdlbu032113;
	Tue, 3 Dec 2024 14:33:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s582ts6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 14:33:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4uaOo5spmJjsub2le8vqQ+Qoo9bHcWFTwYUbfdM5yRPf/Hijxz5VGzKpwQBa+jGDAWUHg9U1SxP2dGRV0dizC+0VCWPAwkzkLEeCxLHlLkBUjkojFmCd/+HEOinjhOLp2eukVQ0IKr9Cj9z3epU2d8wC0UIDIIeM4zscPzhIjRbbd8mgLEA4v/qMe2CojXD/6VzxqrIZcHyHmvn2kopjwEdCFui/7GVjsybXvZ9BJlaxSeSAtN48G0mHpmk+gwfPxfK1x6lJ85yLjLzlnYY3IamWWBWynpE1wpNoKGBtejIyIuGascpbSzWK7+rTlyBNxz8XRSAWX5CrXFKMchtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdWNuIlluLcw6qVt5wZFnOdB9038HzFwlszN1gmbeOc=;
 b=d5GmHXNOcAEbWT1UUFIhANS4beFqdLib4UoMp0lIN0s/jDDJ4U4oA0V37WPMZO9takDAUV4QQp7SSq0clbdPLKJ8H/y3AqZbkNq5SjJKn63sAaXzsHYtZVdbeGi3K+78ElUbnIDAH8LL8m3Dw96cOmcWAZZC2sqnsv5qAUWDcPok2vGuHmZplIDRZsnFwIO2Dv92ihxj1YcDRw6qgEQ6x8OeiGDDldREYuIIYuE00C6o4X172Do/KsHgvqFShIgVGZWSoh0rkxli3g9/YkRGrmxVFRqhLRHoMMfZK/97EHgrGxJ80WOGosLjIyuX1BpvHd4MdGLvtLQ9UGxm+/7+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdWNuIlluLcw6qVt5wZFnOdB9038HzFwlszN1gmbeOc=;
 b=toRFAQqL4UI54Fh2jgnv3ixcFxniHaHL/DMuGvMVYlwasJi0ocTfZtVZAYJvkO1jEARgSBZ1UMq0s0tLbShXvUPzzx+bpWWdoqrx4OqCPb4nuH/OIaiGUCVdbvqXeBhlQi3ur5ocD0u3Bqkvx/FkzDBc379zKy5zyJ3N77hpyG8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CYYPR10MB7651.namprd10.prod.outlook.com (2603:10b6:930:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 3 Dec
 2024 14:33:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:33:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
        "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
        "sd@queasysnail.net"
	<sd@queasysnail.net>,
        kernel-tls-handshake
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
Thread-Topic: Question regarding TLS Key update for NVMe-TCP protocol
Thread-Index:
 AdtA4dTx60qe6yI5Rc63jtENYw9WqgAqoEl5AAl9OhAAAJQ8mQDLQnLAAAJZLAAAGhnUgAAPOksA
Date: Tue, 3 Dec 2024 14:33:55 +0000
Message-ID: <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
References:
 <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
In-Reply-To: <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CYYPR10MB7651:EE_
x-ms-office365-filtering-correlation-id: 48430753-dee4-4ab9-c97e-08dd13a7842a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cEZsLzl2UmhoYzlPYmhHV2t4SEh4ZVNmSi8wQXQ4U0FUeTRqOXVlZVJtdlNj?=
 =?utf-8?B?SURySzJrWnlkN1JZc1laZm45bGp3TXBaY0h2aU1BNUNaWDJHRUZ0cTR1MUNy?=
 =?utf-8?B?V3dJRUNWN09vVC9ZU3VLd08vVGVpOWFKZjhLUGNnSE9remlhbERiNTdkaWpk?=
 =?utf-8?B?TDQ0ejEwM0JrNUpyRDVPMmFQZDdScmM3QUJKR1hSYytRWXdDZytiL2Zia01P?=
 =?utf-8?B?a1R5YnRMR3JQZzgzS1hHZDVqc1pmNGlXWDc2VERMb2VyKy9nN3ppazI2WlJ5?=
 =?utf-8?B?ZmJwKzU0QlMwMENVQ1JQTHE4eEx3SUQ2V1VYME9sNCtFV3BETm9uVTVZYTB2?=
 =?utf-8?B?UU1tNjJTZEVjZkpJVWhIeU1yUWo3VDJDeW1hcU8wbFcxcC9weGRKUno2aXp4?=
 =?utf-8?B?bjFONzkxcmY3YXNrWGw4R0hWWXdtRy90a0tXVzZGcTZsTXBMSTdRUDJpL1hl?=
 =?utf-8?B?RCtFeThHMTQ5VW9iR1RXTXpyRmxIMFl6SzVWZGNRcVJmVlQzMHM4R3lzcEU0?=
 =?utf-8?B?eG9UaloyK08zNmF4R2dPZ3EwUGlVSFF1QUtwNjBIcDhoUmJNOFFWNS82ZHNn?=
 =?utf-8?B?dngwV2YyY0p3UkhpZHgxN3hlcFByL3NJM3hFeGRNNzdPVUV6NGhkOWlQb040?=
 =?utf-8?B?aGFtYitmUEdPcnMyVzVsTWc1UHM0bDM5dHBBRkhhdXE1b3VNNEtJaXkxNjBG?=
 =?utf-8?B?WDU0TWx2MENyVVphd0hnVDJJMWErdU0wUG5BdGFJQndQYzlSU0Z4VjZRNWk2?=
 =?utf-8?B?SkNEaStLN2VCa0xJU29wVnNnNWgzSGY1dGxwSUdSelRGVzJEUHMwcGNMdUk3?=
 =?utf-8?B?aWtFaDd6TGdJV3Baa3R0eDA4cVFNSkhMY0g5QXh1bUNmZ0JySnAzbDB3VTBE?=
 =?utf-8?B?WVRNSWdKZE9Hb0dWVlJBQnBKNTRRK2J1Yjlpckl6QXJZUHN5NVJuMkxic25v?=
 =?utf-8?B?YVVYNG5yT2Zacnd5TTBHMDNjY0dUdkVvSTZUOVh4djZNRFA1N01RVVhyWWl4?=
 =?utf-8?B?QkdqcFl5MGNqbUEydEdmRGZrTGxFdXgxcDQvWWdEa2d3aDIxUk45d2tpb3RR?=
 =?utf-8?B?ekJBTXduRG5XU0Jlb3hpRWNzSWczaTRPMWMwNmViZE1GTjV2aDc2d1NLNElJ?=
 =?utf-8?B?bW5ob09FRVB0TjJDWDNKWGFvYjRGcVRFRDl5TDAxTVY0NTdZNWFqZFdWOVVz?=
 =?utf-8?B?MGRqN0VEUGhOdTZoSktjZlBKT3BPTGVaZ0p3c2lEMlNTUzJWRWluM2tEWDEw?=
 =?utf-8?B?Yk5ZV3lHMlZ0N2M4bk9GYkpXMmgvZVBianJxbnU0N2VmRWF1SHcxZjc4d0Vy?=
 =?utf-8?B?cWg0Qlo0bndpY253ZWQ2dUE0dlRmbjZMNlBrNUVacEJLMHlqd0lTVWhFdkcw?=
 =?utf-8?B?ZDhJeXVQZHR2QmRTT1dMN0VBWTh1THVpMUFjMHZPNEptOXNUTkY3VlkvNEhV?=
 =?utf-8?B?bUZOdHladUNLZWtTd3FoSlNONTI2T1lmUndBTVRYbWc3d3N0akVVOUxUNUxL?=
 =?utf-8?B?a1lNbjZvczAvUGVaL2NoQ1FadEY4aDRDdjVXNDE1VG9kanNRYmpsclRHVmZx?=
 =?utf-8?B?NlJRamliVTNLMTFkb1Q3SDJGK0NXTWV5eWFYQjFuRnN2L2FKZWROMXlzc1I1?=
 =?utf-8?B?bW5DOEFTTU5TcW5NUmR0OVB1b2JLUVdCazc3WTFDUnh1Q2U5QXRiSlRNTjFN?=
 =?utf-8?B?Yk9HdEFxbEdybWJleGdWQ1hWWnZ0cHFWQndOK2JUdThXYmYxWHZ4dmREazJT?=
 =?utf-8?B?am5iRktXYnhLRzdTWTh0NWRHUmlsLzVxRlppcExWV3hhTW55bC9oaDJ2YVY3?=
 =?utf-8?B?M2d5OWVERGdWaG52ZjJmb1FEa0VTQXBjNkVpQTRlY2xDRHNmTXgrem05dXVT?=
 =?utf-8?B?WmlGdmNmSmhSQnNiWTd6WVZqNlNTQVdXSktNQkVlZ3c4Y0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STFJTnoza041UEVNRk9wbXQ4V3RSWjFIUFJ1TGlZbmlTc0ZNQWNyZGxuQkZp?=
 =?utf-8?B?ajhRNk5LcjFVOEpTTnZhRlltRnlWVGdRYnpqczBYSStnMWhLMWloOUdnZHUx?=
 =?utf-8?B?VkZpdWdaeHRheDNaeStCMzVPTFViY3NCby9nNk5nMk85SGFBOEI1bmFwS0R3?=
 =?utf-8?B?bnVieVlydW4vMnFFZ3ptMDJxVTgwTHdLZWN2SWlOSWNYK2VEWjlETmVpa1gy?=
 =?utf-8?B?dCt1MVpkNUdVdWN3bGk4RkQyUDdFU0hJM0lpOGlVWGh2OGNmNFlrREZ0dEQr?=
 =?utf-8?B?WDRLKzNTenFjVEZKc084UTM5YkJLWDZVelhORjNLeVgzUFMwdTNPMHp2WjJL?=
 =?utf-8?B?VFZPenoyYkh5bHZCVU5vc1lOa3JFYVhEMzZEUjNScndVd2luNFVIVEZZR2NC?=
 =?utf-8?B?aE1hSDVHUzR5M1FsMWtIQmYvcVd5cTYvc0dwZXZ1SWkycWh4TS9jTm1Qdm43?=
 =?utf-8?B?Wld1ZVc0ay93RSsrdTl6UlpIMUxvTEhTbFYwc1V0TmxvSGxkTjlNUGF1akdi?=
 =?utf-8?B?RzBZRGdac2g1OERseEVKV3ZIMUNGdzh6aVh0Mk5VRU9ZYVUwRHJLN3JxdmIr?=
 =?utf-8?B?SjNRZU1uWHVuWXA5TUhrRWI3NW9VMjFKZ3dEaGRKZ1RJNUpDZlFWSTkrL2dz?=
 =?utf-8?B?aGJxR0NmSXdTTks4YndTMUR0Wnc5RTc4YjJhRnBoZVc5UmNDUzJkbmFCeXY4?=
 =?utf-8?B?S0tLdTgvbXBwbjkxYmZLZmUvY09XTmY2SjVyeStrblNWUGZpNTlzdThOZlRI?=
 =?utf-8?B?M0FtRjkwTWI5aC93T1l3eEloRWNpR1FaaUFFKzJoRnIrN3JQUjQ2cDhFaGhO?=
 =?utf-8?B?L1ZBcHRaNXErRDlmT3BXbW9CS1BIeFQ4RUptd3BJeHRDcUZlelJSSVRQNUR1?=
 =?utf-8?B?UFhLaXdJNVBFczZxS2luc3Nya2ZhMlJqNTYwZlQ3MnV2c1pQNmNNNFdUSmY3?=
 =?utf-8?B?QU93bVFzbnlHSUdOT3haYjV1SXcyZTZ3cHJMSFMwaUtqVGtQSUZNblF0MDNz?=
 =?utf-8?B?bE9OSVpUMEVGRkNjd2twaTBydkNSUElhNVZJTEVVOGcvRGhIbyt5bjFyZ3pB?=
 =?utf-8?B?bGRvbVJ0MVpGTVlRM2d1YUVGVGhML0JQbnhIL092T05MKzRMYVRnRlVWd1Fr?=
 =?utf-8?B?cmxQQkZ6Q0twZ1VZTzhPVXZOaGVpNStuL216TWRmSFp1dHBZVTdmZ2Z5WG81?=
 =?utf-8?B?cGZFb1V0S2hRWGdNN0o3ak9LQ2VtZ3JUTmtuTjdBUG1mZzFxbDNrYjQ1NnNk?=
 =?utf-8?B?YXQ0dEZHWjdhejAyNWtpRlFuaTRuaEFoRFBraUF5TFZON2x3Y0xLNnhaTlRh?=
 =?utf-8?B?QUtLWTVUNUlTZFc1VFMydmdTcnEzazBVczZ0d1RkQlM5U3psd1dMNnUxWXlz?=
 =?utf-8?B?RURKUmpnVCtaOGlTUzlhdjZhSm9sQzg2SUJRMWNvNmtJNncybWszdlhubUFI?=
 =?utf-8?B?ajFEeHNWTGRBTlNZQ1Y3RUFIdFBJSGh5a3dXZHlCdFpzbkFidU03U2llNUFk?=
 =?utf-8?B?cUswbkxMbXcrbWJHZC8xMC9Xa3JHQVBzU3ZxMFdmMXppUWIrZy9nMzBLaWE4?=
 =?utf-8?B?c2pzbjNUcE15R3VHeU5JOGJiYnY5WTJ6V1RQQVQ4UDE2Sm1hQ0hXNGUvY0Rp?=
 =?utf-8?B?MEpqbGREWFRrcnZoSDR3cUp3dzY3UDBkWWtTb1VLMUk2VmlJZGErTnd2bEtx?=
 =?utf-8?B?WGJyYTRiWURGVVdUbHpIL1M3VC9rTXIwMyt2Nnl0dzVaRzdGN0lKZDJXWUlx?=
 =?utf-8?B?K3lrOXRaRmZSbEdWdW4wT1NXOTZwUXIzVFVlY1FOTEMyTDA4RVNuNzhxZGdZ?=
 =?utf-8?B?Q1BROW0xVTlmak0wZ01xeFgxZHY2VEhmbDZ6a0Q2RXpUUmRkbEdrcnF0aURD?=
 =?utf-8?B?VDRTdUpGVGJzVUExT1dxMTc5azNObVF2cmN1OCtXcVVXeWhvem1yYVlGWXRW?=
 =?utf-8?B?RXBmSHlUWUl5bktTQVBkTHJWMG0xeWFkbEVXdittUHJjVTlZb3BmQTN5bURm?=
 =?utf-8?B?cm40RTF2QkpaRktPQVNZbU9oK0s2Mkd2QzRDNmlReUI5bGI3WVVXVE1GSlVi?=
 =?utf-8?B?NFlScDE0ejNGS0xmekNqVFhoVmV6NkxDb0NhbDAxazltQ1NCeGVINlRlWTFv?=
 =?utf-8?B?NGlqbHF1L2Zod0RyYXQ5aWR2NC9WQmZMWWNIckJ1RUpLR3Jzd0hLcnNla3Jz?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91996D35DCD71B4D981BF5A1B1BBD77C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o/7oMoli7SlRnE3V2tGS5fxHubojqQPXLwTnL9bnQH8CS1yvRPJC+uNk8SFKaLyPZd/mgaeR2zDc+jalEGZeqA0THHt422KprAZOyyuzmVswkIsHuJPapCyqu+dLxB2akYaXBBPC0DFCfMMi2Sg3s0Ej/frlCl594bMyjEfXFzvgHa2ovCqgNOkjffT0ZUtv2nPpqCvFF+AwhxwbLpMwQiroHUofn1wkwXCl4GPD/ATF6zPt2SVTEyHgwCBYfOE+UkNvsgVYCeRFA1nCN60cAhK+Pop/eJzwh+LV9pSwUsczfnAimg2ny4VzGtpOFjGk5PWKsHf+jTBZr/XUg1NtArt9/TOv74aNgJyMa9AFZJB8uC/tt3ByPim18y4d/KnaPi6Kbedc0wk+ErL43MSlZVdcbFDllzeCyzSo2tzlAk8qEfsSU9T/PMlnaqe3/d8k3s2KAhdmUeOox+mMANDwjvJv/25/WB1XEg9PjWN7IFsJKBBUOl/1p5yN+CnxJm9et8rq9jrObTjcjg5PY6OFYcaH4YzqoO2YACg5LjtIckzrFbVFcKE/e8cIRucul1Y0XCd2oA9hp9/fjIYggJURrduUHQ8au2F+3JdQL+/8gu4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48430753-dee4-4ab9-c97e-08dd13a7842a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 14:33:55.4268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lduGHSJRgJwu5Bw5MrCi9yWQRLZ/BRb7nsvuJ3oqoP3n0M1Fk9owNpvcfk/N4f2JjoTcqODhHhPZiUvJmu8VEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7651
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_04,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030124
X-Proofpoint-ORIG-GUID: EdBA9kqpT3h1OS8Con8OjGQoVkbGYKZZ
X-Proofpoint-GUID: EdBA9kqpT3h1OS8Con8OjGQoVkbGYKZZ

DQoNCj4gT24gRGVjIDMsIDIwMjQsIGF0IDI6MTfigK9BTSwgSGFubmVzIFJlaW5lY2tlIDxoYXJl
QHN1c2UuZGU+IHdyb3RlOg0KPiANCj4gT24gMTIvMi8yNCAxOTo1MCwgQ2h1Y2sgTGV2ZXIgSUlJ
IHdyb3RlOg0KPj4gQ29weWluZyB0aGUga3RscyB1dGlscyBtYWlsaW5nIGxpc3QuDQo+Pj4gT24g
RGVjIDIsIDIwMjQsIGF0IDE6MDLigK9QTSwgTmFyYXlhbiBBeWFsYXNvbWF5YWp1bGEgPE5hcmF5
YW4uQXlhbGFzb21heWFqdWxhQHdkYy5jb20+IHdyb3RlOg0KPj4+IA0KPj4+ICBTYWJyaW5hLCBG
cmFudGlzZWssIENodWNrLA0KPj4+ICBJIGFtIGxvb2tpbmcgZm9yIGd1aWRhbmNlIHJlZ2FyZGlu
ZyB0aGUgVExTIFBTSyBLZXlVcGRhdGUgZnVuY3Rpb25hbGl0eSBpbiB0aGUgY29udGV4dCBvZg0K
PiA+PiAgIE5WTWUtVENQIHRyYW5zcG9ydC4gSSB3b3JrIHdpdGggYSB0ZWFtIGluIFdlc3Rlcm4g
ZGlnaXRhbCB0aGF0DQo+ID4+ICAgZGV2ZWxvcHMgTlZNZS1vRiB0YXJnZXQgYWRhcHRlcnMgdGhh
dCBzdXBwb3J0IE5WTWUtVENQIGFzIHdlbGwgYXMNCj4gPj4gICBSb0NldjIgdHJhbnNwb3J0IHBy
b3RvY29scyAgVExTIDEuMyBzcGVjaWVzIHRoZSByZXF1aXJlbWVudHMgZm9yDQo+ID4+ICAgS2V5
VXBkYXRlIHRvIG9jY3VyIHVuZGVyIHNvbWUgZXZlbnRzIChieXRlcy10cmFuc2ZlcnJlZCBvciB0
aW1lLQ0KPiA+PiAgIGVsYXBzZWQgZXZlbnRzKS4gV2hlbiBlaXRoZXIgZXZlbnQgb2NjdXJzLCBz
YXkgYXQgYSBzZW5kZXIgbm9kZSwNCj4gPj4gICB0aGUgc2VuZGVyIHRyYW5zbWl0cyBhIEtleVVw
ZGF0ZSBtZXNzYWdlIHRvIGluZGljYXRlIHRoYXQgdGhlDQo+ID4+ICAgY3J5cHRvZ3JhcGhpYyBr
ZXkgbmVlZHMgdG8gYmUgdXBkYXRlZC4gIEZvciBOVk1lLVRDUCB0cmFuc3BvcnQNCj4gPj4gICBw
cm90b2NvbCwgZm9yIGEgaG9zdCB0byBlc3RhYmxpc2ggYSBGYWJyaWMgU2VjdXJlIENoYW5uZWws
IHRoZQ0KPiA+PiAgIGZvbGxvd2luZyBzZXF1ZW5jZSBvY2N1cnMgYmV0d2VlbiB0aGUgaG9zdCBh
bmQgdGhlIHRhcmdldDo+PiDCtyAgMy13YXkgVENQIGhhbmRzaGFrZQ0KPj4+IMK3ICAgICAgVExT
IHNlc3Npb24gKHRoaXMgZXN0YWJsaXNoZXMgYSBzZWN1cmUgY2hhbm5lbCkNCj4+PiDCtyAgICAg
IEZhYnJpYyBDb25uZWN0IGZvciBBZG1pbiBxdWV1ZSDCtyAgICAgIEZhYnJpYyBDb25uZWN0IGZv
ciBhc3NvY2lhdGVkIElPIHF1ZXVlcw0KPiA+PiAgIEkgYW0gbm90IGFibGUgdG8gZmluZCBhIHdh
eSBmb3IgdGhlIExpbnV4IGhvc3QgdG8gcGVyZm9ybSB0aGUgVExTDQo+ID4+IEtleVVwZGF0ZSB3
aGVuIHRoZSB0cmFuc3BvcnQgcHJvdG9jb2wgaXMgTlZNZS1UQ1AuIEl0IGFwcGVhcnMgdGhhdA0K
PiA+PiB0aGUgb25seSB3YXkgdG8gdXBkYXRlIHRoZSBUTFMga2V5cyBmb3IgdGhpcyBzY2VuYXJp
byBpcyBieQ0KPiA+PiBkaXNjb25uZWN0aW5nIHRoZSB0cmFuc3BvcnQgYXMgd2VsbCBhcyBUQ1Ag
Y29ubmVjdGlvbnMgYW5kIHJlLQ0KPiA+PiBlc3RhYmxpc2hpbmcgdGhlbSB1c2luZyB0aGUgbmV3
IFRMUyBrZXlzLj4+ICAgSSBzZWUgdGhhdCBTYWJyaW5hIGFuZCBGcmFudGlzZWsgd2VyZSB3b3Jr
aW5nIG9uIGEgcGF0Y2hzZXQgZm9yIHRoZSBUTFMgS2V5VXBkYXRlDQo+ID4+ICAgZnVuY3Rpb25h
bGl0eSBvdmVyIGEgeWVhciBhZ28gKGFuZCBDaHVjaywgQ2hyaXN0b3BoIEhlbGx3aWcNCj4gPj4g
ICBtZW50aW9uZWQgdG8gbWUgdGhhdCB5b3UgbWF5IGhhdmUgYmVlbiBpbnZvbHZlZCBpbiB0aGlz
IGZ1bmN0aW9uYWwNCj4gPj4gICBhcmVhIGFzIHdlbGwpLiBJIGFtIHRyeWluZyB0byB1bmRlcnN0
YW5kIGlmIExpbnV4IHN1cHBvcnRzIFRMUw0KPiA+PiAgIEtleVVwZGF0ZSBmb3IgTlZNZS1UQ1Au
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgb25seSB3YXkgZm9yDQo+ID4+ICAgdGhlIFRM
UyBLZXlVcGRhdGUgdG8gb2NjdXIgaXMgYnkgZGlzY29ubmVjdGluZyB0aGUgdHJhbnNwb3J0IGFz
DQo+ID4+ICAgd2VsbCBhcyBUQ1AgY29ubmVjdGlvbnMgYW5kIHJlLWVzdGFibGlzaGluZyB0aGVt
IHVzaW5nIHRoZSBuZXcgVExTDQo+ID4+ICAga2V5cy4+PiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbmV0ZGV2YnBmL2NvdmVyL2NvdmVyLjE2OTE1ODQwNzQuZ2l0LnNkQHF1
ZWFzeXNuYWlsLm5ldC8NCj4+PiAgSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0Pw0KPj4+ICBU
aGFua3MsDQo+Pj4gTmFyYXlhbg0KPj4gSU1PIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0
LiBDdXJyZW50bHkgYSB0cmFuc3BvcnQgZGlzY29ubmVjdA0KPj4gaXMgdGhlIG9ubHkgd2F5IHRv
IGhhbmRsZSB0aGlzIHNjZW5hcmlvLiBXZSByZWNvZ25pemUgdGhhdCBrZXkNCj4+IHVwZGF0ZSBu
ZWVkcyB0byB3b3JrIHdpdGhvdXQgaW5jdXJyaW5nIGEgdHJhbnNwb3J0IGRpc2Nvbm5lY3QuDQo+
IFdlbGwsIGFjdHVhbGx5LCBub3QuDQo+IEl0IHdhcyBhIGRlc2lnbiBjaG9pY2UgcXVpdGUgZWFy
bHkgb24gd2hlbiBkZXZlbG9waW5nIE5WTWUtb3Zlci1UTFMgdGhhdA0KPiB3ZSB3aWxsIF9ub3Rf
IGRvIHRyYW5zcGFyZW50IGtleSB1cGRhdGVzLg0KDQpPSy4gSSB3YXMgc3BlYWtpbmcgb25seSBv
ZiBLZXlVcGRhdGUgc3VwcG9ydCBpbiB0bHNoZCwgd2hpY2gNCm1hbmFnZXMgdGhlIFRMUyBoYW5k
c2hha2UuIEkgZGlkbid0IHJlYWxpemUgdGhhdCBOVk1lLW8tVExTDQp3YXMgbW9yZSByZXN0cmlj
dGl2ZS4NCg0KDQo+IEN1cnJlbnRseSB0aGUgb25seSBlcnJvci1yZWNvdmVyeSBtZWNoYW5pc20g
TlZNZS1vdmVyLUZhYnJpY3MgaGFzIGlzIGEgY29udHJvbGxlciByZXNldCwgd2hpY2ggZm9yIGZh
YnJpY3MgbWVhbnMgYSBjb21wbGV0ZSB0ZWFyZG93biBvZiBhbGwgY29ubmVjdGlvbnMsIGluY2x1
ZGluZyBhIFRMUyBrZXktcmVuZWdvdGlhdGlvbi4NCj4gQSB0cmFuc3BhcmVudCBUTFMga2V5IHVw
ZGF0ZSB3b3VsZCBvbmx5IGltcHJvdmUgdGhlIHNpdHVhdGlvbiBpZiB3ZSBjb3VsZCBtYWtlIGl0
IGNvbXBsZXRlbHkgdHJhbnNwYXJlbnQsIGllIHRoYXQgdGhlIGFjdHVhbCBjb25uZWN0aW9uDQo+
IHdvdWxkIHN0YXkgYWxpdmUgYW5kIHdvdWxkIGp1c3QgYmUgYmxvY2tlZCBmb3IgdGhlIHRpbWUg
b2YgdGhlIGtleQ0KPiB1cGRhdGUgaXRzZWxmLg0KPiBCdXQgdGhlIGN1cnJlbnQgaW4ta2VybmVs
IFRMUyBpbXBsZW1lbnRhdGlvbiBkb2Vzbid0IGFsbG93IHRvIGNoYW5nZQ0KPiB0aGUgY2lwaGVy
ICggY2YgbmV0L3Rscy90bHNfbWFpbi5jOiBkb190bHNfc2V0c29ja29wdF9jb25mKCkgKSwgc28N
Cj4gdGhlIG9ubHkgY2hhbmNlIGhlcmUgaXMgdG8gY2xvc2UgdGhlIGNvbm5lY3Rpb24gYW5kIHN0
YXJ0IGZyb20gc2NyYXRjaC4NCg0KSGF2ZSB3ZSBhc2tlZCBCb3JpcyBhbmQgZnJpZW5kcyBpZiBp
dCB3b3VsZCBiZSBwb3NzaWJsZSB0bw0KaW1wbGVtZW50IEtleVVwZGF0ZSB2aWEga3Rscz8gSnVz
dCBjdXJpb3VzLg0KDQoNCj4gQW5kIHRoYXQgbWVhbnMgdGhlIGEga2V5IHVwZGF0ZSBjdXJyZW50
bHkgcmVxdWlyZXMgYSBjb25uZWN0aW9uIHJlc2V0LA0KPiBzbyB3ZSBtaWdodCBhcyB3ZWxsIGp1
c3QgZG8gYSBjb250cm9sbGVyIHJlc2V0IGZvciBhIFRMUyBrZXkgcm90YXRpb24uDQo+IA0KPiBB
bmQgYWxzbyBub3RlIGZvciBzZWN1cmUgY29uY2F0ZW5hdGlvbiBhIGNvbm5lY3Rpb24gcmVzZXQg
aXMgYnVpbHQgaW50bw0KPiB0aGUgcHJvdG9jb2wsIHNvIGFnYWluIGEga2V5IHJvdGF0aW9uIHJl
cXVpcmVzIGEgY29tcGxldGUgY29ubmVjdGlvbg0KPiByZXNldC4NCj4gDQo+IFBsZWFzZSBkb24n
dCBoZXN0aXRhdGUgdG8gY29udGFjdCBtZSBmb3IgZnVydGhlciBxdWVzdGlvbnMuDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBIYW5uZXMNCj4gLS0gDQo+IERyLiBIYW5uZXMgUmVpbmVja2UgICAgICAg
ICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QNCj4gaGFyZUBzdXNlLmRlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OA0KPiBTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHbWJILCBGcmFua2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZw0KPiBI
UkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdGOiBJLiBUb3RldiwgQS4gTWNEb25hbGQsIFcuIEtu
b2JsaWNoDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
