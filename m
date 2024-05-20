Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513D328E7
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 May 2024 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716218087; cv=fail; b=ildWH2z5ZGjYZZeWOMzogKYonavSvKEaF+1kQrvy/qpUgrdy5LXzB0w7ef3imjdTBbhQoYhAEeMLmMFMYzzLGERMs8oMSyzDKW3TX6Bl1+mJqdh9vFOJskRnlSiB/Y6gIYHC+kvceD38R9WpBBvoOwJierehbFHsEMrpJVeecFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716218087; c=relaxed/simple;
	bh=yIsx8ePX6zq5Bn5R4x7nEMrhUCZObfp07dKhZXg+UlI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RUjECsNobst74gEkY177wZjnW8/t5RsASe/7gs7+Q7CIfw33V+0UUXqTe1vdyZALPsfkV3lzH9BRxGMGtZS+x+I5oHhf/TnaAsndD35ahAqxYObRmTCECxa9Yv6QxzCUIHMiLjJHwZnOCwKx1oLNI2nCo5jz3vNXxe2PkS3sCeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eato92gi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I9m9fMEk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eato92gi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I9m9fMEk"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44KEE4Xd011917
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 May 2024 15:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-11-20;
 bh=yIsx8ePX6zq5Bn5R4x7nEMrhUCZObfp07dKhZXg+UlI=;
 b=eato92giZHC/I/vC2sdjSvkHwOT7cAMwd5FRSja81iL8+rwiCfwiQuiVjD4fYRS1EYpW
 HCPPFW5+TVrnAV3bbARX9cYWJmSdX8vZB28iLvsaxNQuQ4NXMyaJWoMGkFCu1HcFR21v
 KYpahnnv6HsUcsGf02kl3oW0U9H2GE03FY1S2vrxuNrK/Vudh+ElnpyLzqxVTs5S6cx5
 QaA6A1oms7ItIuadnJaeUQgc621yb3rSN6Rj/WeY9VanOpcznr9uOpY9ToDVUqg8q6BU
 hBnX0KWzae55U0+VXGI7/BYb9Gilow559lR6Q9hkNsLcWEa3Z9C+UGZ1YyV59CaGl827 xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mcdtycp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 May 2024 15:14:45 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44KErk3l004961
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 May 2024 15:14:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6js6hgd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 May 2024 15:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQnIVdSLV1kwfgkKUhyuhPs/De5Y6mSsQHbk6CaoUQw6sxOZzcIjw8nWMI6QUbBPau3pjxk/FZsARIkY5L5Ol9hxTr8PpUPE2kk9kxsffg7zo+nfUwcR6HTq7EqgJ4dBJGrgPHeaB0+Z0KPP6LpkpZgE/qDmZAt+y9ZrWVqve7EhnKZKhDTZL3DdtaAUPN5kGgA0FKepDCOv+DCwJCIrJfIrs6wodRcyLBp+IXi9jEaqjqJfo55W1g94zChZXdIXBP9y14M3q50KU8XXcMB5eaZQ+hPl6U88iV8wHnacVdIFBtP1GOoInYQyICbuOdd2XA/T5+DBA2sf7pd3efIpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIsx8ePX6zq5Bn5R4x7nEMrhUCZObfp07dKhZXg+UlI=;
 b=VsHdqO1douyQLyM4hbqlGbrqNsKf5sRe56DUy8m1TCYYsfaonTjAxmCS/WaeEmBJ7d9Zkk04mvWX8hw1SqpDBG6yIQjXM30iNJtlQk4S6V8DeXoKLequqT4kqi8KaUz539CuE4myo42uz5eja2bc0dIpDn/AiXyCTE4N+UmpHvlnc+lxOMvHaZPFiheZBnOWSIKd7haymwv791DSyCzEsRkOfeugTwu7I7sbAC8KGxqcwOQYznzNXoC+Av7dJNACWeIcpd80gR8mitjFc855t5vMVr8bNXIJ1lJ9D24dIiwLMT+73iOlvhETlyOqU71QiW0zOIjg9H0rFm2rSY8YYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIsx8ePX6zq5Bn5R4x7nEMrhUCZObfp07dKhZXg+UlI=;
 b=I9m9fMEkrDLQVSUBdEpI0EzxM4z5e8D/Z15qAS0aDoyuD4uxi6aRCQ9hHqTl3LsVafRLIparcK1QOhZ3iq0vpWBILSfY2w0FDt2oAbT3iQIKEzIaVrvAhkCg/apjZEZm+mJjz7jfUmFW2riyHKPEusu4Wf8WPIA8LhCTPMgQIag=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB5671.namprd10.prod.outlook.com (2603:10b6:a03:3ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 15:14:41 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7587.035; Mon, 20 May 2024
 15:14:41 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: pull request for QUIC support
Thread-Topic: pull request for QUIC support
Thread-Index: AQHaqshv+pCDwekaTEK91gjQ0a4iLA==
Date: Mon, 20 May 2024 15:14:40 +0000
Message-ID: <6E46CA49-8CDF-414E-9089-82EAAD90C186@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB5671:EE_
x-ms-office365-filtering-correlation-id: db9a7794-6332-4f83-2b3d-08dc78df9278
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?y+u/iYV2EyWHGoT1N3x1FzXTqmM9eKj5X6TMDZCac01PjnCdP6LEMzToIjch?=
 =?us-ascii?Q?KaxOfILAderz387W6oD+3UTDeViYCS9MUDDZ5NZG/STkvYAS/4Su83vZ8BPY?=
 =?us-ascii?Q?vuTDi0PmUoUNBx67LlLcSYfu7X/EiktnecdWzb1iDFA6j2t47Y7EJ5/tcJAG?=
 =?us-ascii?Q?Sb+lwXAWZe9OFIqjL5pamKyvnVHYR54VFxdBrNYZjhXMiEl05qdJaONWBBZk?=
 =?us-ascii?Q?ZiW9blUjl+OyqHWQnXEqzgmXin2Wr6eY1UHWgcwVRdylGknste2aOdBkBH1k?=
 =?us-ascii?Q?9U6IbiSvCAhaPGE2Mc46WPxGefYEzMVuKceqcWDJwVt2WYVByFbKIJkbSkZj?=
 =?us-ascii?Q?v+wu71NCi9ulAlvFtaMtJHnf5zzu2tL1lK+QZAEEee4Pkdl5x0S4OHoZFvZk?=
 =?us-ascii?Q?oCLxeMRPZT1FDNYITx1xF4ZIfBwbv1a9OtH2x3kKYAerlsy6BWYt+/pkLMg5?=
 =?us-ascii?Q?If4J7viuZNFTqMTbr315D60Ff0te0QV8O9zgRQdw3ilLV3AmXzC2Bl9GL9KZ?=
 =?us-ascii?Q?dGeiaDeXrtxoNzvznX93Lf5OWDisqSgl4yvgqJp7wrXDMrjXff9ROiL7skL3?=
 =?us-ascii?Q?3M33lzmYR/tj+/fHdX4VDNwh1jmxsP8ZyIM8bLcs1333od6ugFpmGRczf4Rj?=
 =?us-ascii?Q?EYQzXAvckPKJkN/Y/FzA/7FyQBTAqL7is3rOal1zGyqZeIRq2K553K3EpzD+?=
 =?us-ascii?Q?q8+FlYNZ2YXxrO7lYy8+tiLHV9I+tFzOKEko5BBwtMsA6S5vxN3+p+h1lNp+?=
 =?us-ascii?Q?iuWP4D4K95Skhq+VlvBd+cuk9k5XRj2N/k5D6gBjBg9Ur2bRV5XA2XNo6g3W?=
 =?us-ascii?Q?H9710o8TkENwVuEngVVFviTuKjfsobYMQz3WPXO6cE0pvgbepnN/PcEm2SAe?=
 =?us-ascii?Q?4LzdFYcjFtbZPHqtXsJlKdmlcfu85NLa/cvYfuXrWJagghMEkdSQpFTlf6ne?=
 =?us-ascii?Q?DQX8e73hoT8HLQLQMivB70TKAoVGlNTTTp6fupqJdY+UpHBWheT+F48HECi1?=
 =?us-ascii?Q?gbarFwQHZxOj3rRbnJQNJeqU6Qor2pCXLWzGa3gW70oNGjnuc8rG+SFT7MRR?=
 =?us-ascii?Q?NW7gbq/hwzHl3TPBjMoQ+hsuAhgBVUqjCoohv7fMmgFAO3czvAEDC7pJXijq?=
 =?us-ascii?Q?ZufeuqDZpsIj8X9KHCalABt7E1P2SiVvj8c21imm9ms7w9Sy6lwosWnDXP/q?=
 =?us-ascii?Q?qYzaDNa9/fKLSCHkZxtneDJyWs5b3tYDELLdpNKsxb4bj7QMymPEempNkhbw?=
 =?us-ascii?Q?D2ufiyvMJxA2sJBaQGnHmo12jUuxDBLRq2NQ7V5qhQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tHYG0LQZy4ePyV+4g6tptAlGbWESlnrYIc+n7WJ5oUc00nRm/ayodfTuXZW9?=
 =?us-ascii?Q?YOPbs8RVKOqS7lXcOXVWjh0a9J90PrmCHLP7gO4opYBbg56H+1zTchcux61/?=
 =?us-ascii?Q?8G7kLer/PHtDS4+YIO8fu1rtbsaKiT9IvfJfVUeJgZpL04m/f4Nvh6RftUkW?=
 =?us-ascii?Q?8VYOpbH5tRJrAoBQSqc+Mz0WFeP0LWjX4Rdyc9ZK4F2wmjHwBCSDouQU/5zi?=
 =?us-ascii?Q?K94TuNO6bioDF/OY63Dw80cWgbwihXxDpWrlKu51XAPsUsr6pVk73B1Qojhu?=
 =?us-ascii?Q?c7lEu6EiVaU8bEE6Rd4lMGGNbgjT5fZt4OaLI1qb25a61kFXu1ZxT7DzhGXP?=
 =?us-ascii?Q?E5QL/a4qyqBcjaZuRNirEY2CSgsTnemvg0iRworWrYe0o2nzAoc3fwnlx1Tq?=
 =?us-ascii?Q?9uZu6xnoYBEQdCs9XB6k1BlNTTGc3xOx/ym/oackBQDAsoA2PpdWnHFHDgEr?=
 =?us-ascii?Q?GJ00/sHhrJ/Hq7O1/rMt2V14+Oe6siK5MeqD+XjQyrguE8UO5xKe2XaSCV1f?=
 =?us-ascii?Q?3L/PTTXdvyh3VDA+YzXDDBE4CccQ2f/yBYAdYTCvTW7Pnlbxkqzkn7SV4Uhi?=
 =?us-ascii?Q?fd6RPkei5vnPNl2MqtttPk9QqqqywLKRW1frg6HLcn9r4XYxDb2ebWAXYu8N?=
 =?us-ascii?Q?giCAxqWEY+Dct5vI1XN3ZIOnQCeGeBg6k4zpOskLIA4hP1i0Z5Enoumv8zJj?=
 =?us-ascii?Q?u1jix1YZnPhKiy3bIjxRYbUo/VjEDdN+ni/MIvc9P8DO38td6SO+xN7zXOex?=
 =?us-ascii?Q?2tJFgl2y/0lfV9zzNSo2aVY+qtwyjKmSYRIOtn2fmHk9h71ySidP8klXf8Gr?=
 =?us-ascii?Q?VkXStzpwGRlNcq1gekxKXXMmlPZoaD/9Ycms4KfCoejy5zGrB1kC5xyeqn8o?=
 =?us-ascii?Q?MyrWn+2Xm8GhfQMahtdrFCxvEJqhgsV6bJX2Ycpc83dCMelPCRUc5coPuD7m?=
 =?us-ascii?Q?byFPzl5dMXTU5HU9ZZEnj9h4rmf+I3fmGVcpYx5r/FTgSm0ql2sBnj8KuGKu?=
 =?us-ascii?Q?b+z8VXiflKkCjaysq65T0JX30yzEVICVz0UHarl6LZqp641XZargi5mufEc4?=
 =?us-ascii?Q?PNzNXZyD3HDERPAu4Y6b60tw3TawWvZ0ogGnjEH5NCiqCCkrZlMaDTjqWcFW?=
 =?us-ascii?Q?dBP9NcjrXzW1QqbMXH6kohYYa/aVLs3/fT8zvjohgx3hJTAQWnW356Dl00rj?=
 =?us-ascii?Q?/H6sE4vQp+RLVeujVWXpFsC5qdKmk/wcbWzwnD6WwyAq7ObGe7aMPPqfs2rI?=
 =?us-ascii?Q?TtcN6kZAxaasfRUp4xlyu5bJ1J2SAY0TgaIWoQJ322iKyR0rDKSacA9j8RKz?=
 =?us-ascii?Q?yf89n0AOesyh40Bvdz+UgWhADhniqhuID/IBf3Scpjy0CMvid6JzgC1gMihq?=
 =?us-ascii?Q?20rpQhRd00yApl6FpdY72tBWeOHwD0UWuaBWxfyYfXObI3dWH682fJNmMLV3?=
 =?us-ascii?Q?fpc7TBzJrWWW/sZfudBMoSGsriBvz8wwnXgwY9so31XMpdiKTl5T5K0rsapR?=
 =?us-ascii?Q?4xYHmCLkvAA7PQgyGniaT07Dnk/ryd+bq3G/Bzjw5YwWssxhUmP6Uc0xJLg7?=
 =?us-ascii?Q?SvtkN9xsS3rfBG6Yps/lu/eOAaPq31kN2y66TMChfXJy1xR1x+Rjx/hmV6EV?=
 =?us-ascii?Q?ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37CAB31501105A4F9A2E29CEE44B4651@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tfC3pIuNW9mi4R0nxpogGLLGpCwxbPp+KGANAdhMifg0VKlmVEzSFikqtzzlXduEnG4wyko0Pg+LJ8bBCKNmtYoXK0xy62dZ2vHNj0fXCeFU7O4DPags8Y/YB0KTqd4R4VXhOi4pB98jlmNshDL8Y88oR+y+uvoz9nCmHyKJZt/IEhqfXEtDWYPWCzcppSCsggTKuknf6/YZGKkV9fIrozZsXyhL9vPbkXahdZEvkakC7eCZu7d7CAp5AcZUR5CSRLObFaon5jUVDQGOrNwYW5onhm1tx/j7ly4EgqP4bp7CCyVsGqGeVv08/By5+aD3TVyXHmdNY3rbO8mT2cUlTQ1TIaANFq0wiJcWd7J4CZyXK3u0Sa7De0wRT/KfwTcuMOLzTNbp5CZsQSQDRefzTwBTqmVKQxytutUSg+iuRTE0y6W3qaWzThUj4vK5RQjoJETvnhmjZP9BXI05jQvKbHDNrLnbskHuspMum/vblq5ZAnZNDRrsgWNg5JtIeHDayBQaMlOBGUKY3T2wEktf4cGmnCG/jC+GavqT+ZEvl9hoUKEcqJX5bd046CTCejMP8kNrbLKFBUIKGfGndDPwmwI/XkkSG0r/L6nFJlOvEc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9a7794-6332-4f83-2b3d-08dc78df9278
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 15:14:41.0083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha9ZPyQI/QG7PzBhBtpioMNop5tOaD4FQgudfCUN/0h+CqnLPMaKtpBu83zgIrJLzSN9DrlqrNn8fOEe/WFcRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405200121
X-Proofpoint-ORIG-GUID: wrrSiGkfJrFgnfgQA22olYgMU7neo7ll
X-Proofpoint-GUID: wrrSiGkfJrFgnfgQA22olYgMU7neo7ll

Hi-

Just a note:

https://github.com/oracle/ktls-utils/pull/56

This is a pull request for adding support for in-kernel QUIC
handshakes to tlshd. I plan to have a look later this week,
but anyone else is welcome to have a look and add some
comments.

Thanks!


--
Chuck Lever


