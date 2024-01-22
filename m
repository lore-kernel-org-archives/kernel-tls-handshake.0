Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0283D575
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934671; cv=fail; b=CvfThJwsYbwH9dRnaBibUciPEwRRrIOjs2JypG5j6N579XmrOpRYmGhTrOOXTWHB6w63gZYUMExfj5EjwdIaS/n3NeLQDcq2uAosxMOefaJ3YtRp4RboS/38A5+3hDm305di1Rip7Lc1kFtngkn6i4h9P53X6BLP7Y8MfJOKb/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934671; c=relaxed/simple;
	bh=Ap+AMEz19jgyxd3xE0a3cjCswcvlmOOT9+VVcU+kvd0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e9vMOWK0FVnmju/Nc5tcBbfKDogBp9Id59xhc/E5rQ2NLrei91dvuyr2KWvs8H3Uk/Ss3UGOVQEFSknRzyrqtLe9YbR6IG27Q60Avacg0DbTmaheQZlB1zQPG5DrNK/ewWEbDv1Acj5cPk3wTJ4OSym1lo0VH61nHmnAsgzexs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mlgXjRqN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tQfDSmSm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mlgXjRqN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tQfDSmSm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MAZEQ0002494
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 14:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-11-20;
 bh=Ap+AMEz19jgyxd3xE0a3cjCswcvlmOOT9+VVcU+kvd0=;
 b=mlgXjRqN4huRRsNYGtb2JuLNnYlmam94weZIW4BKLdAq7ia8Q7l8z/YzyqmS5Cyqc1TA
 +46VebNmzRdCJhQF10cisaKl4FNg09PbFBWLxECr/0f1WF+2trWk3STrjL1Wvt7RyXG7
 NBdB5q7ru9CnrQ4MOEI4OdND56lLF/Ap8OjYm86+clJTN1IvYHjhqmUDDzniV4C4iYkK
 07m23vYSUPgBJslLnZo/Rex2+SB7ptHquSXNjxddOTV33vjJ1o8Xm4G+tBSggmD9k/M8
 5zwNqBBr7/ejzf8i/+Hqm5AZpW3XKHAl90rY0AvvnOOr3Hy9g5MJhXWLbktqzMcokySa Ew== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vr7cuks3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 14:44:28 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40MDxHcM039493
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 14:44:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vs36y8kvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 14:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS/kcUbaKnD/0Qq51YswwD6PHmwxSHz4/dxBmIhg2ovyXpObyKrNDUoy6PFb1tPHwFqMZiDPs50GK+vGdLNhVVvKV5SX0xEk1co6ZPbb4H0yY6Q9z36A1wvho66gYIMBUG5D1L0fs7B6V5uUPzhhH2wGYCj+eGOcisNaV8O6TiAQ58Fr54/i6g63tH69H1Jlc5IGAhxMfbhwyeA7TyNVfXas+HpcYOyZI5xrdlyCLkMYq1NcNyAuPQ4oKuzagSvZF1SPlIfZBV/gp1h4Vla+unci6dxSNluAC3buGBG7JNR/ZHMuh2wM4VWQuK7nbEYPysb0aC00+cNlS0zs1BgidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap+AMEz19jgyxd3xE0a3cjCswcvlmOOT9+VVcU+kvd0=;
 b=goYu4c7XpWPvALvqzzE2Htp/xg93HRNFXSyoalngXeOA9gBmVALZE8wM8YH9ivYJylxZaGt+4ZXQwmESEMsYE+yzgRlBPOWJl9Pr17MTRPEm5Kye9bQt/z4n4kY4Dh9JrACsUa8rJmnKf37GPX3FfLW/YNh4H2Zvvu2CiwuwZqWsD//oBq4T2+sdYhYletVfPiWL97kO/qCbxpuqyE9ZQb9yesun1Y8q0PpCg4oHqsWKVHfnjgJ1p2qw5AsN2NWHGQwjnLp2cHWMDq3rsynPWbkoI6dknAI0xL1QbNbnc2zta6Hbjj8VZjSsjS8XYK91MN1m8IRzCKch99wcS5hAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap+AMEz19jgyxd3xE0a3cjCswcvlmOOT9+VVcU+kvd0=;
 b=tQfDSmSmdrQgmabkQwzN9LDsIMVLO6oyE6f/GJYfEb/l1J+nuBkA4yCbGIIf5XjlmdMOZp6wtDYZW28j4zQToGF1h4x+BLYiWu+/jbeF3t63si+CIg0yajO9CVPR0vXfh1tpxY7+WNmeRz3atbcN6ljFVgt3sHNrX9+BbMLWeCs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB5549.namprd10.prod.outlook.com (2603:10b6:a03:3d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 14:44:16 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5475:bf96:8fdf:8ff9]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5475:bf96:8fdf:8ff9%6]) with mapi id 15.20.7202.035; Mon, 22 Jan 2024
 14:44:16 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Pull Request review
Thread-Topic: Pull Request review
Thread-Index: AQHaTUF5oW2Hf7X+HUSXAQA6YbgBMg==
Date: Mon, 22 Jan 2024 14:44:16 +0000
Message-ID: <C3BD1E65-F354-4DF3-A716-28A074B59C35@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB5549:EE_
x-ms-office365-filtering-correlation-id: 586833d1-a011-4963-e410-08dc1b589bbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UMgTXsW2h6Ym5W5rQkt1Oioeh9eJBLH7U8k81Chw3XzMMEKnGic1p3W5mLYcezVN71cu5SyaZ8H8M6irPQtOfGlI+lxmdIY1FgVOBs9HJzyENeG1SQCoQJadBqAPiDCfRxzmNNYZrgs+IEuw1UifnZix+5F6K/HR7g+IvxNgSW2VmwFLL/hsKCRbFR75xjkS27YWK+RDfjCQli9A4j3VPszLksrzlTYNPAscWyA+mm7X+2TknY8oe8etXPMHxJLp6PzUZDo3dW6M84nzOkgRwcIzT5rJ1uPJ2xKgq6/4kD634HK2QTOtsSueqsgrUkz6uYEuA/9roinrO2hRaQarGU/XkM8y39idAsqMwVhjbOkHV1UfMdbfmQ64ehAgrcVdCzLpisRFTfos1ok/KeSPxOpL0eKQLrMuVNAky4A2MtxGm97T+oj/Fv1ws1p8dk2kdeunl8wVAu6rFFKZuQsgZApdO4j5J7Xop6pJIQQ4TJ0u3d/PZ1e9f9JI7h8IvLcoWcO1dca2XWbgLzFXl6cpk+N/E4v5MIXJhdPOY9M2GLWto7HhuPwpAxgEcxv2pGKrqeNRKC+eD2gJCTEodFXhjdDx00gY572D9IKojqgJsMANgNTmpNjOVpVSY6Qj42yWJthKWHuN+TuqzsSvRZ1jjw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66899024)(38070700009)(83380400001)(966005)(8936002)(8676002)(7116003)(91956017)(64756008)(66946007)(2616005)(316002)(66556008)(478600001)(66446008)(6486002)(66476007)(76116006)(71200400001)(86362001)(6916009)(26005)(6506007)(2906002)(5660300002)(558084003)(6512007)(36756003)(3480700007)(41300700001)(33656002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MwLKr/ewgqrvO8fF3hHpD5LQtXoNVjO56bk7Tm6yJveq/+tAr0/umzClptwJ?=
 =?us-ascii?Q?HjatyuXNrcf4/YVaDAXBWRlKPzWRv0rsidDfWiaMnRiFNgggX3QuSiZpucJ6?=
 =?us-ascii?Q?usxUbto5BBUS6n6H47MIopk1bdtyZT7wI/PA3rQwq4l0MYVl8iSOaqzC/bnX?=
 =?us-ascii?Q?I99vEzh3IAdZGwfAruUCr249WXH8dbeXWVOzvhSVhwE1uP3BncndYqpZniw7?=
 =?us-ascii?Q?/kQt6Ad24P3U004UladsY8t8AVJl9nCYsQ+xDDRZulCsh+3d12UGGSOUuW/h?=
 =?us-ascii?Q?Lr1+9xi1M64bAjcMwJYsAEZ6j/i3u2rBpAej36uXaimNFwJCgzfkUl3p7/Cq?=
 =?us-ascii?Q?1DyYydZr+4nv3P2CI35YXfJczo01b0Ktsm11cMWNHPfweKNklIf1JYyXNHi1?=
 =?us-ascii?Q?a275Ly0Fk3d6ll3/XpbMeU0qXDjLV3dyvZT425rjvg/CGt2phV+cuTU1b0k2?=
 =?us-ascii?Q?5QJGh3cdGpFlF+sqihySUBFOsQ0EUBrT6udK5ZBVa5ckK+qXuqNeUsz8SJtY?=
 =?us-ascii?Q?yNt0yzjatUN0J7w6zJKfMwiAWN7+FseJ6eT1ZJSS0rDf4wgqjNz+JjkPYJpu?=
 =?us-ascii?Q?0o9FXwFHIyFGexSSogXwTI+RD+1I7MPbtuC8rcvwgX5Le5aD5NimU+kwrCtC?=
 =?us-ascii?Q?ZKbUQBKkbAM9AySWvVImuhO2t9+TuLb86rg0aVzYY83geg9i//8u9/QN1DZ8?=
 =?us-ascii?Q?1iBTALHvGE8zhXQlmLehigCKabuSoOCkapJ6VzMI3q5Rczzg4kvduDt8X3L9?=
 =?us-ascii?Q?E1UHR0eBmE+K8bG+LHkYUjVHJ8t6seI7ZseuCBr8AR1dJ24Zi3lrz9aq2tnU?=
 =?us-ascii?Q?KbHbCWI0aMZexPlUOVuB1mJyolYkPtRNQXCGNwn5UCSPR80R5ZRR5tF8ifUt?=
 =?us-ascii?Q?C92rWHO1og77WdDn5YtvL1U/+jQqKfwAm301Tj8JPLiOiAJllT/qjLtLqsvV?=
 =?us-ascii?Q?ZtEboVpnd72kQ3jV4ZcJAb3RLCb1kGgPDjtojjDmegoSYaPTRTiCXM+BK7L2?=
 =?us-ascii?Q?QhabdiV4Uz+QcHBUFZ1o0P2vASB7u16kBgUybP2dRpD954WNuzaTxj5t/i5n?=
 =?us-ascii?Q?QsHeQB3ydOyCkB6YAvTSxWMB5PaRhSXWz8MznFPaptlC0GBPQXb1rPRA6Z15?=
 =?us-ascii?Q?C6fJ5qXEPLPtS+wFq0Hm1yMnxCP0Y1JWapa11yoZpvQp9y4BSyqzQ54rE1jV?=
 =?us-ascii?Q?bop4oNFYIhUF/5VoU8GX++NrLMD9DLiW+DIw1ThNx9cFqwmJ8NAnikwBYiYA?=
 =?us-ascii?Q?ixV4ktQc53dDcRSd7C0KC+66IXUx1xQO2FQmtF/e6KYDcHFWup0bak7gkJ+Q?=
 =?us-ascii?Q?IN3ugvCy5g0hHa9qesDEaY4By9G/eNmMgbnm26lofZDMYjiEGBU2yGELeweA?=
 =?us-ascii?Q?n3phwoUHwb8sv91apQF4rfUk+C5X6fYtNEcbc9sGxDG7V2xNMvZHPHisoqTo?=
 =?us-ascii?Q?X7T+PEWupGRLvA6sR4j3z+//CfKEldS3awAJonZyf0skiQIc2Sq+YuR8KYAf?=
 =?us-ascii?Q?z9j6dGl3/ymoRowfiWKB7AI1DuPeIfpyqhW/DEEXl13Fz4bngk5cVqxKDWY/?=
 =?us-ascii?Q?j/gTuO1U8+HtsDp2FEa/dfbvZBUavMb+FasYyuGDykYp7Mv+2Z+HfM/BpfHO?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9276D6B9C6BE0D4990CEDADD882375F9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1hbNlz56k96/XW9/XNFh0Q5kAz4V1qu+hGn6/Y1Xp5t6qqxwjATC0T0v+On+OIj0jyfN7S8wEwj1P2Tr7H/Ot4qzbzJ9RVUN5gMJfFca4QWsJepTCKU4eCgYjHnrniTXSp8/p1ELv6rwy4QfOQrXoL5VDA/QCHQgwEqE5uPsV9jZVCUf/aiVZ1LPassbk0jBZTpPb4YtpXGA1KUjRG1JDHiwEw9mpxQX3gQ1PtZMoIwcpfrfxNOyMdd1YqSvGWPGpaiiMSlf3X7IfwwqweoWFRQr0kH1v/1/zKZXYbNSA5/9pJjPqvULShJsvUdOohnUtQW0bMFtv0KKtK+Y+WicMu9eAfGO+yhpN/rxF+bz2zQI/siBcA38Csy0YfHzpb9kmLsVjsGZTpsvCKx+fl85ZVS5xpjmD1ga5x4OXGXDIpWPtqc/nkfpctJCB6goI1pErET6HF0RlHxtdtWUEJrCPREkn1Xrh2R+KwVubWQDy0GCQR8GM4duz0fjFvtPrmJh28aDK6pS8qVk2/kk9BX9/lfVOfcUBD0ixiV3Qr3iRKtKgppKxD9ZPyFxXotUjEzC7xSV/UzrIe/4V2q0VpuzQxt8kwrgqYN+sv6BPbvrosk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586833d1-a011-4963-e410-08dc1b589bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 14:44:16.3585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKxInXtwrXtLkeLLNGOSa1KfMujhzNlgFM9Tb/IyOmeLC3HlPRYKSITwH4MQEiqTrJYCvnE2UHfHqp5/M5Ne+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_05,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=952 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401220100
X-Proofpoint-ORIG-GUID: LIf1UTfykauC4M3zgJR3zUBbiSkS-w7G
X-Proofpoint-GUID: LIf1UTfykauC4M3zgJR3zUBbiSkS-w7G

The contributor would like to add additional restrictions
to tlshd in it's systemd unit file. Is there a way we can
request review by distribution security teams?

https://github.com/oracle/ktls-utils/pull/45


--
Chuck Lever


