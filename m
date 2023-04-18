Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C84AFE6
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:42:01 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IEwurj031698
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=osmIM7lUtIwKeLcJmokQfhRb5ccuBLMKn2lAgMVmvLM=;
 b=busavky1JveVAe0nSNhTcf3ke91obXP+SARYYPnrpklvjOZh7v9a7I3wJK2/cTFxqyN4
 O9Tvm9eejaJ6KUaz4AP6LafLopP0sMdGWUwb+sdWp8KxQ0O/sd1pwJGMLoikeOtPk+ZW
 5OM5gPqsEcsnQ94r9niam9ye3Ty8V88SHa0mlsfogORU3JgB5H1bQAxyZaZthWfgVjJs
 Ku3/iWu2f092z3CtpPcIjV0TUA0yjCjgI7YVXrCUQ2cosbz1KP2Y43y1Hxlat6Wk0Jsc
 yss0ig0xTAlEjLgN3wZoXnybEcakM4sZJjK+g0hGi9t1PsnfFPI52ik8J4npgXcFVGVq +w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykycxgv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:42:00 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33IH0IDk037117
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:41:59 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pyjcbxy1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrfGc5kCLIoWs7nTZyIrmTjXQKyIuXxR6psjMud08Tf4OibLj8OWCeIpCXo8uB4T55Xop8Is7vrfLo0fxT7ZpoH22KqXuvxp3UubTKK1kDnQAu+Lj8IdA4kxmNN4J+SazVqcaC739zb7hYCbCauEh6C9sIelaWPvlI/gQtxSrNf7hKzLPykMti/rzjDCrek5PXNJuIIm5CN6Pa+zfb+RlrnIxL/zSTRsKM68ck9SzbgWjmumJQQXe7HxEwko+5NvcBSjtSwxzdud2fxZamvVI8ANmKvEaWpAQAIrAtI7rlgtpeQNK9zrDJOKDbD/XlZrKqvPh2LEjYnK6HW7f7wJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osmIM7lUtIwKeLcJmokQfhRb5ccuBLMKn2lAgMVmvLM=;
 b=fBi00Bz/ImjYzLW6TZmMvw48XDbjgp06pfp0BScPL749tqEwpZ7V0d4fiY+tGufBONiS63tMHNb3DICl7cw9IpTbM51LnNpQfhhaJN46fESdtxITlZNV5ZeDnClWS1FXn/FNRva9EQWLyrhDVHwmszpz5ighPkHyAoqcGnb9Y17EkfRSddgvWih8u8q/o4/VLYgcFvsDn7b3QXbPahFERD5qybj8xnJKi4qry4rCyrgZEzCP34+4/nt+jyHtiXZmW+Z5oSTHvVLLHzxzCErJRczxuuVapVX2qiQcZisO1Nj3iKYKcCrWltQpkIw9U/Wuv/9BuMDT9YYmTushTG7q6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osmIM7lUtIwKeLcJmokQfhRb5ccuBLMKn2lAgMVmvLM=;
 b=Um8OtL4MXtcVu+H6xK32MpOn00dHdbSg0rcS1II3VmHH4BlMCrdjlm4AoxX2Zh4iAYiz7F7/XdmlE8Yb4CuYV0FW7MZEtOWD00Q2yIMN9ztG6njY8g3XkKMDf071MAY1yjerde7bGT6SaBMlpnNi6iC7oKuc/VQ/HTf7ypdM2Lk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CO1PR10MB4433.namprd10.prod.outlook.com (2603:10b6:303:6e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 18:41:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 18:41:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Chelsio device support for TLS offload
Thread-Topic: Chelsio device support for TLS offload
Thread-Index: AQHZciVzd2kVWjonnEqzwud8aGsQJw==
Date: Tue, 18 Apr 2023 18:41:55 +0000
Message-ID: <96CC95E8-473B-4A23-A3CC-5BCCCECCBFC2@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CO1PR10MB4433:EE_
x-ms-office365-filtering-correlation-id: 32b5c0a9-f8aa-41f1-f0c8-08db403c95c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uerFos2RXyqCZ9VKXoX5x3BLNIF+8SAk2YO9wYtMxIvTtDPpLG7NtxIWc03JYE4NW24yznwp2Qv+k/1gFJ6JlgrNeipHkqw6UDtUzK9f2UMJHc9Viel13DPXcPjV0HBWMRv4OsWPKa3RmMw2kaNNu7thdvvaLslhC+Qrh21PvivX2yxPl3R16L6n+pcDC4KOJG+9ZIWoi/o4IuOSnrjc5/2bQlHmy/8p6PfG0OXVaCkYr9O56o4388ZPA0oTkIlAvZNE70EmGhXwK7T6s8v1eZwmrXdcjA9TBNzLUX6fun0HSs5fIgDkWIUspsJHqx82ARJno35mBkUHfCKccn/CeM/to0CLos/6GT+LQOq8TOuxtKa7V0nMZR6HzVJrVv0enC+gFFdLiDNac6pLgAA1qKtqsEmKcXv0VOijS478f7xpniriRZ/fDDHeleiGOLBT1cxFqfoTntkfs4sfb7aYu6T7SjPc6d20c81YA3gap9kySKRoWtp/kcofN3kJU94CUXxQG70TZpoPd4tmvCaR+Ey3eE2qFx9biuwAmKpurQN6M6jLQTzbj6ol/hYLBT46H48e+nRav6QWoUeCrUNyljVgt2dYL9kf10IcX6rELbfaPp1at/C/2PmI5bdNPq1b
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(8936002)(36756003)(38100700002)(8676002)(122000001)(38070700005)(2906002)(558084003)(33656002)(86362001)(5660300002)(478600001)(6486002)(71200400001)(186003)(2616005)(966005)(66946007)(6506007)(76116006)(66476007)(6512007)(66446008)(26005)(41300700001)(316002)(91956017)(6916009)(64756008)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mpJ94soTRPj4X/wmXS/H5aG6BiRgZPJ7GuPo7RWgwc8QKkk9eTzenSEUp2pC?=
 =?us-ascii?Q?nkQTX3An6UazX3NnIBBuSakYLTwj5mnOj1iNXMxhVgBnG/Yh2ovHY3kO1KYi?=
 =?us-ascii?Q?eBSE2Aqvk8HptMqvOHSv8WgEd9pQPUXkIv+s21nxYl3OVE37vpwzFsSYH3c0?=
 =?us-ascii?Q?wh5TFRnwzMShLBPveLJu9D8fskqsyRqQswvKq/rE3zXqYfNRMhufX36n49ne?=
 =?us-ascii?Q?PflzVdLV+8Q5Ioa3meMK8SkpPtWH5iOZGooCJmsboBr4Gy1XJR+AwSnQ184w?=
 =?us-ascii?Q?jWuTTiTY0Ip4AkOq4JW3Cc7VTRm7yds5K/fzhxK//jGoXa+7NEHhl8oUqwXg?=
 =?us-ascii?Q?M2eLA0nQR97BCIM8LNyi4cqDcN7Sxk709GKQxnQZMEY8HfmgmZ8zyqM79Fbv?=
 =?us-ascii?Q?ZeE83bvnKtS1VTZTZ6grl6DAPIo/sIyL0s0dthjpa/5ddzhJ9KiunFAcSRdq?=
 =?us-ascii?Q?aFIf35URAaaCI9xi9t/HcwJ+quq58/pIzYQNesj2NzSMQ+aWFGOD9j1q+d/D?=
 =?us-ascii?Q?Hp0JG3aEl6xpVv5AwsmhEhvSPi9mBKn8u3naqd49eATPrOsgDMctZ/8yuyIW?=
 =?us-ascii?Q?XLA3O/UJSPEuh2x8DXfDhRlmxd3QV/kVcDtS/7NtJ12hRBfyoY+nuTs8ymJx?=
 =?us-ascii?Q?TCiUWvOcTk3wRezBALTUXY4oA6phAGZY1VHl01SRy6ZFbICypA7/qx7PwZkD?=
 =?us-ascii?Q?+ls7QfjKtzgkzeN930XclGQGJNpEzl2C/l3Ph43fMFKhj/ATtbvHPMF5N6nm?=
 =?us-ascii?Q?Ge8ZIHFsbdsbDV/uB+On8Q67L3HfS3dcuUc0iuaB5cq7GmVUXbfQ+KP7I+LK?=
 =?us-ascii?Q?IbdPPvREkKWp9Oh1SYsZKHZNzTRYBd3eb2uTJfHHEJgIgHYDjME2yHms97jF?=
 =?us-ascii?Q?ZYVgomP9Yj0KMK9yrMyejz7ffLjWFfZJaLR2HSLBC8PkBefy4YBRA+/Fw+dW?=
 =?us-ascii?Q?QDryldpyMzZVdJiydwlkVF3ylLkdf2zy8XXKL0YlkYLyhw6LQzvUxpAefsA2?=
 =?us-ascii?Q?KgZ2TxpJlnkNrD5yNBxtVu9Xb1h+GSdBc4krOvOpH9UrcoG+NQxB/iyguR8c?=
 =?us-ascii?Q?9jT/CfuHUsL4uA26RN7GzlE2p9CxDWPtKZ2HpjuTt5d55JQeS1Dz7gPDhQro?=
 =?us-ascii?Q?rhIRAb/niJ+96LERMWexnDGeS1DXYQwrhQtBriK8kJHcybromYLZ406uTj3K?=
 =?us-ascii?Q?9SFarWuusB6hXtK/l+7iMlSy3J9QfP+ujB2Xs8XxYRGit4BmZfC7YPMtZxk8?=
 =?us-ascii?Q?Fb6L1zKVI0zyhE+2YcOhrVzH+Wl88JFgSB7Z5ycoWN7doepMra6pjldTpbT2?=
 =?us-ascii?Q?mkdRC4K7gVgVr1O2UTRGVWVfQ/NRSBZ9yD7e3W6m2cgGbRC0aui5MOJf2aLB?=
 =?us-ascii?Q?dX/YbB9qjsoylsc3jbEeOZ3wgVxn7tgi8U34jt82hFiHi07kGiFC5LbnstOo?=
 =?us-ascii?Q?cn4+XMbCkxNsOJEXxA0m2ta71LqP/5+mz1t/VPrh2N80/LYButaL6eV8TeIU?=
 =?us-ascii?Q?oCirxfPzkRk/7MHdLXIs5MIzpIGLqh05FSxvAfIPYb+7spB+Bd3Cx+TK3oTl?=
 =?us-ascii?Q?03KOnIsHkIHBBOnBU9ZxOSvYsFigfXd4s4Ricty6jQqaGQv+p1ZeocOt61nA?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AA92522C0DD024BAD58212E2A398516@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nLFll0ESBlxJyos44C8ldXxqsqxp+nEjQoggcBnYtCMP9VOJR21hOtMDxutjrzJ4aW7YK7C+klb2I3resgSk2YTUHOCGlenyRNVi1QckcpqpmPtUysQXMVm5TedUQ/a432GmcsUrA32Ay10Yffufg2ai55tpKk+5xnSbROp9tVBs+iGb11c46YPsVx3mXE9e/Z6yBnyKG4W01jyljThlN1cMqh9Du6gEYFCy3wkRvrhjkbNSgxapzq7mM/ujgdkUh7UC+yjIn27J5x0DGx0tA980ftMIqifE7DIpkN4N7BMykD1F7nI4/8YoKwGdtMUHiQ+HjMyIbKb/fjYhJPgLaQ24Ic0f/sr0q5ExJ+IGHN6vPAUfy8o3YwvELrd1ES03rKtwKjRBJu+aIdisl/oatbCsuL7ENPAmq3126kWtfWq1dBrw0o6cu8P0trJj66PVRgbVyLELCGV/kUIOTSrqj+AQgYQs8deAaT/FVUKL4m1ncHBQdfJV7i+zjznIgbYaO7BLFY9wyg4jJz8reTNnAJ60NXFlxRRXkevcuJflP/pKm1MPYcNr/mSNf08wU6p5CVJQymS4p0fz3lRdSyhaLYBd4t3bMeSlA7u3eRjAyv8PR1+I9BUFNAzlXtekgEQog9oRn5kQrnmiKwmiFw6UUQSlFZFQaMt7FFJnODqpmAadEzktzGnOdgSXI4IcLeyhYlgIeRiMO5vp6suOdaOTPp6epCB5Y6adbSBcYj81RuPIIskioDiTeWCphNwKkTRgLlMVxWlmLB0uflQECr+3xA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b5c0a9-f8aa-41f1-f0c8-08db403c95c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 18:41:55.7706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwta/VkDvvfuq9qc0xMDX/5u0Ab0G2DhZWY9/3Lw+DiEMxY9SVR+z8fQzW3pt4LS+YMyVSaLbZbIDCJBxRbLMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4433
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_13,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=853 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180152
X-Proofpoint-GUID: NaavHZv77GZZ3n8MfGwYGkmceGFrAJYZ
X-Proofpoint-ORIG-GUID: NaavHZv77GZZ3n8MfGwYGkmceGFrAJYZ

Following up this morning's conversation:

  https://www.chelsio.com/crypto-solution/

There is a hardware support list near the bottom of that page.

--
Chuck Lever


