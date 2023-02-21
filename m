Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E64D8F78
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 21:52:34 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LKNmg3030393
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 21:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=NlslOvMxvqos1NbhIxfcMZPjGNHW40I07hKVRH8zSro=;
 b=HY91PjnS0Pv4kOV+z/cDCeZhKNnUQ7oXQxnPfnX99x2jZUVlCI7DjD7WOsEDfJ7fu4Bk
 8TgU3yvawL96iBIpvy3U1xFzrnwY7FqwkPU1ECx+7M7BG7yDcYWbBAOKc9GdUYmqRLJU
 nAlvPR2tjlhBFTOqQymhnVjiPffzGsv3eV0ZWJuaZz6AArxUe6bghwEpcGbUbVovTlEk
 +Th8Wf1iDW9A94SPSp+ieGrO2Rlg/lwLwV0KhJF4fRSR0uTuuT42Fd7uV9z2SlX+08oB
 o1/w2lk6MWzmZAPjChuhMZoLltPptTpxUAfCOMg+yXowJ0OJJ0os2PpPCG1E8ls35eP3 ng== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn3dpfmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 21:52:28 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31LKwurd027305
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 21:52:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn460284-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 21:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hih7/h2+qENAy94pnAeOgB9T4bwaNsuMrfNH7ZC9Hl+29j5gKyTuS6Ae2cxHrP3k6KLwYfS7opTp+/t6RIfXEyujhSWpy/YmmOF2wQmDIvJsimO5bGvscXg+A5s62Xq9+pglHzOC7duD8e8zN1p5onsTUP/QgGtIEYtSdgEGRSwwt7OQ+3Ae5dq2F1zuHCwAXu6woX5oSlYBHT/w7hx4Jcm8DZKHlk/6iYWPScNMExPyailg/1o5MdqnptZ2+o/fM23OIXDUNXtlWf+ofqueSg4nU2qcPoP8nh5muwKofqNU5/7U2mOkrxLiJsd96GVxbV0IPXLRfq7SyKlXQTZWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlslOvMxvqos1NbhIxfcMZPjGNHW40I07hKVRH8zSro=;
 b=jgephw3O6zFG1IgJK2/CqlZx8Pt4iFi0C/A9+RzMDDuxGcT7jqjEFV937xzEurWEDUnjzOZWnLbqMsTZSPUoDKVQJNn4fsrwiaAIv4qp1Wr/so2u+bV7am4bN4VjAi8ikGZBCm54/eVD5+v7pca0N3LYq6POzeUzE7VuBw+Lfj05jLGvD2bAKExY6dKX/pDBKXeSJr7jNP9D9O8fi1n/Ql5gS2QI9gp2GPX/vTVrMKWzOqWv2/Vm6byOSEHqWfcKHRc8eil6vCghex7fWrAvK76OCkoltFc2bSgtylDi71bbue2eerhouMwOQHW2RUwoXGTZD+OoQniO4ussAOXd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlslOvMxvqos1NbhIxfcMZPjGNHW40I07hKVRH8zSro=;
 b=qCW1lvD+/jt8CVi3fFMQveaSghrjiO1tzyRC8tdOMfPPFBF92mz2ficiR6VQ60Yf6ywnC71myOUtiesQCcbk/Ct9MilBgqv2ICbYUdQzDytYHgy6BgKHtaMzm481ji+QMMiIgwNRLVPv9/X2sg1ngKaVkk9Mq0gxtCDrnRDSbjs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA2PR10MB4731.namprd10.prod.outlook.com (2603:10b6:806:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Tue, 21 Feb
 2023 21:52:25 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.016; Tue, 21 Feb 2023
 21:52:25 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: list subscription information
Thread-Topic: list subscription information
Thread-Index: AQHZRj7IoIwqO3uv706SNAgKCcTyqg==
Date: Tue, 21 Feb 2023 21:52:25 +0000
Message-ID: <986A9F57-6E9F-4940-8278-8AC60FC995DC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SA2PR10MB4731:EE_
x-ms-office365-filtering-correlation-id: c3e4b045-94fa-4c0e-5ff0-08db1455eb21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rgmDKp2TOkLqIcZXG+TEuUUo5Wrvvuj2xR5XpyjndadRSj6pPJY5/AXfz9JHOlx/dqJiO39KT6Cl+Revq81k4qC52mvkGyEj3w0/oHjPIBfWHLdsmJ9e8vrry1DSJ+OrECVYfkZ4X/1/VDnwB5Q1oBKGSxumMTlRohT9aNGicjskodE7oF9JmHGP1jE1tclsaY5LbkcdlJ35LYZp+FM3g0QPxKsLpwUeE/YuL1JzRHFx9jSs15+Ry7ma/mJ1/aK0YITOTgdNPQwYoUxsZFbApka/UynQ9zCwisVa4b+SNP1Hi5gCJVtp6v04HsiwM4UXCNakropTXdlsGK69P+oJHYH4KCIMSD/S1zFRFXiJBUCPHqkCcusiMR1ZzN9FqmEOrCfM+tckCtO41eQSva67XSxJ1b69Yo1ahTImPJLw/QwvnhejFtbLtMtj3faJU/C6ujekLXI4qNgTlapr6i/nHh7RQiVitau1VomB6B6D0MqFM5YLtKTuI+4QUFVUI8PmybAhnvpQZultVz2FBuwIxMl6yRx5ePHQXoh7S5J6ex+FigUGLBzuMXOMc4EUX6OUMJj8y3PDKdiWj5lN6lj6oScA5l5J5kUG6VOWUNpItz65zXSt1E0kBDNEg3PU+aD6rHbpIcAMhVVYagOi3+bkLM2vO7tnhAxXfybC2v9n+3ZQYl4XTA93JPgkNLOFvdxL5mMzMPhyap7Vh9MyXj/GxFtBE8tKwfhCy7dwC7FT+DOwShBVcvPhrIKeAh4pxRpn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(316002)(478600001)(38100700002)(122000001)(36756003)(2906002)(4744005)(38070700005)(6916009)(33656002)(66446008)(66556008)(91956017)(64756008)(66476007)(76116006)(66946007)(7116003)(8676002)(86362001)(41300700001)(3480700007)(8936002)(5660300002)(6506007)(6512007)(966005)(6486002)(71200400001)(66899018)(2616005)(26005)(186003)(1406899021)(133083001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?C2c5AU8mox5A9MaHwhL7oghLAAtM6wSg7bzpwGNUPQSKS94eCmGaYeP+Nrzj?=
 =?us-ascii?Q?RHBneeuswRsTtKr2IXhA3y3CffYVh99w4/ak/DVwcwfltarz1FD1/hIO+n7x?=
 =?us-ascii?Q?sG1vzBhQ06doOPunVRXcKBx4I75ICSLi17vL1QxWIlLkZqz/A5t54qjaq4Ni?=
 =?us-ascii?Q?SSd2XFCZFgrSij4gOBLMEziz0tS17zgVcNXpZKDGGpDWyPpvFquLSGX6gf2u?=
 =?us-ascii?Q?5sXRttUsJvc6221gaelS//r5Xjt7/xgVVqj2/zgiuqfxEuz+KP+ovuJZqjSa?=
 =?us-ascii?Q?HDWtTMqH4TE+a8PPUEMIW5dSog74I4Qs0p2bmKEflhMLA14gwHNykLWO2FJ9?=
 =?us-ascii?Q?Xf8LrGxQzpSfe66VPbi/XBXsVeeKgSurkxQMmfLJfALv2ZJNYAsfwUZTZ8Bu?=
 =?us-ascii?Q?HQA5O91jTNo8IpgC1D4EqpNNAvl11qJsv0iiH3LmF4mTfGhlyOMYzk0brpsv?=
 =?us-ascii?Q?3HRsxfEysVc6KqwbgrP/ZB62sBGrjBkB9qfGG8csFfyHmoIV6f4Sz3PeeMQ+?=
 =?us-ascii?Q?N37knv63WUAGoNy6AsdOFAXPciN8HLoVxlxBLtJFRqpR2FhUEfI/O/HFUVee?=
 =?us-ascii?Q?7TU/5uN/cxiZOLx/5T28ogX1IhASTzeqqnIQMRdeOjnmU0JsWGEDP8wCfo1w?=
 =?us-ascii?Q?WMQfbVep9sdA6u8tn83OO1QysfTgywjlXvfBkHWEGoKfArXku9THbcJbKPRn?=
 =?us-ascii?Q?L/TuFWGUxMotkUUti6GMKcoEHWJYOY4SB/yGNJjvKJJqhJKF2yVFo53yTWAB?=
 =?us-ascii?Q?S6S5EBfvU6eUsc516Zlv7vlSwXAdGF0QtL2sH0gH7eM53YHTQ8VqiBF81el2?=
 =?us-ascii?Q?3B3qxGQgu/JQAF6+droSrNH56XDINiD0Ue+18P6Xm8FpCyUmWWRDHc56tFZ6?=
 =?us-ascii?Q?7XyTuXrSnJvqGmlSWZP5PEPkOvYOlcdhnh0O7YIfi6Jx/Yn6u6yGES5xikQ6?=
 =?us-ascii?Q?hQ2yMOyrZmiT6OccGYYFIX0kySfk/EGwPj5EQDAIbbCikEI4P8spB59P9vQ3?=
 =?us-ascii?Q?Anf7XDgEL42zNLtm92TKK+PChlM6+HYdhtzati7Jh1Spw+dkP32ub3W6BprP?=
 =?us-ascii?Q?nkkKovqgLAlXHDzbbXi4tHQXfZK6ZtVLjFCoIlYFzutH4NuFW9zCvO4OLI1S?=
 =?us-ascii?Q?tnGPC2dxL7gor7z38Ff22PZphWox+U6N8ay1JIjNENF+5QGgpXD0uvYLnHYz?=
 =?us-ascii?Q?Eq9e4lyOuzP7jVzSKsOGKHJCnkrmwp0/XqpHbexlwAgSwRp+Dkpf8om8l9px?=
 =?us-ascii?Q?97n8GRzTXC8smW6ZChVFiXpUDZJuRve+m9LqIFcYRmQPVBLbX540THUNo/1D?=
 =?us-ascii?Q?HMwuM15N+cgwOfegDUNyraSU5pzyfNvoF6sd4RZpIYS45ElNvG9HjyGTZkex?=
 =?us-ascii?Q?QyG2wDrynhur2oU7WWA7hivemEGyT40zWlB7uFo1atKgbedyaufnyjUOceqg?=
 =?us-ascii?Q?MRgFMvZczZ2MYN0cvNlTiQoCSWYRcp8Ixi5rsy+GWh9iD1lTH/I806bKz6QS?=
 =?us-ascii?Q?W4yR3ZO/lwc5Wj7QKxEVhBISeeoMqwl1wgTv2mNtpj0l/OBq4nYA816+WQjT?=
 =?us-ascii?Q?DbRfLJJ0eQE23Q1zRhQi3PC6VyTQTXEJ/egf/6Fcmw46xVDOy86Eices8AqR?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB0025E520B63C449E35CDE5D2D08D18@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BsOj6eyPKEQC1AnvosqmaIspns8v4ugJYprs7IYxS4HjTr+BcBZMgU2tqDVx0zsy/jddfyTBK5OppIwY7JnipwW/WAq2j+xHNq+CBEBq70ay2Ok99icpDoean8Z94pbwHN1K+5xp1JHJpQzenlnUHkf8XEv+0Vugmej15RiPsdDP9xmNcYPUDnGHhJU8JHiLUbgtJT4oEtdDI3UG/VKk10lJ2ZwDQUn52NlfSxyqK/TfjHtO1NzZ8akCUIpT6wrLrFAD8kCXm9rluV4lPqmjgaZ14VEoO4D7qXFkXp70c1dqUQJBrtCyagx/F8MXjuI7SjzNgUoLodMlF6AQDNowf4PN0xxFfkjTea1Waq14081eHTZyxaALQFbBBcQC+b8ejpvP7lhtNM49/h/FYq0gGwIpxKdQAR0qJInCZTJSMjoOtJzEM6luHTdF+WIJu+H7Je7+JfZGjRzYYLNdgVeJaWArVJ561f1Q6tX2wBqKpaVTsmqxl2JfTQqUc1rLnl2SOhz8va9LGuF51w4DHl7E6nYB/Frbl8J2reFTik4FjdUjMrGOuJWPX/z+gIagkjELp0E0e8134qNLxFmrw5DCMRQWvOPSR0dMCJpTkbbnyJOKL4OIK20BiscjDWrHBFlWkO5Xb3cnp73AGDAe6/qsu+PLgmeVpTOxsARTpsG6lJPXg3KWJEzAQiBuKYrXxWTLY4dLbFusWjmqEc1LWhm0I2AP/6A2nUYNPbqdn83/zxcx9lvwEE2RMXDqlnzmskaKpIvwqWyZaRoR9WOe2cx8kQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e4b045-94fa-4c0e-5ff0-08db1455eb21
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 21:52:25.2040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tpjue5dh9Fb0vopvtNg/Cax1rR3YHVZLtz3v9n7pHWlZs/7hobWpejy+e9vFFzzcSBc1/sRUqGCeRiV9jZvHIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4731
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=946 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210188
X-Proofpoint-GUID: MtbPnUsL0zkzu1VLTEos_LthHfc6JUD9
X-Proofpoint-ORIG-GUID: MtbPnUsL0zkzu1VLTEos_LthHfc6JUD9

Hi-

I'd like to stop using individual addresses, but still ensure
that you continue to receive pertinent email regarding in-kernel
TLS development. I've subscribed you all to the list via the
email addresses that I've been using up until now.

- Those who are no longer interested in this content can
  unsubscribe at any time.

- Anyone who wants to use a different address for subscribing to
  this list should subscribe using their preferred address, and
  then unsubscribe the original address.

The web UI for our little home is on this page:

   https://subspace.kernel.org/lists.linux.dev.html

Note also that this is a public mailing list. If there's someone
who could benefit from the information we share here, please
invite them to subscribe.

--
Chuck Lever



