Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0538C1E
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 20:29:55 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VHNw3J017378
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 20:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=J8J4eLt09O3RJqfOTlsc/o5nk8tUitYIX1y+CuaacG0=;
 b=zGJAeLfZfYqcW/xD8clTFBSFRx2ff4+niDxsAE1vpuDu8mj0bijCvWDd81rpJOaX16Lx
 xmBdPQD+rRvXhHu1622w7apufWml4vPF5lBYGgd3QhidHJBiL3jLff+TXMXbBVvgIn3n
 kHt4TeNqlz4FBkmgAn92Xe2iyNFVR+GVKy1p6UaY8ZAUnyuZVRytxhY1Q5weAZv0lvE5
 MTKovWhoPTGFDYmNuYEEUmxLdbem2GW33Y4ImfAz0ZLAi5+aeOtJEPKIXZtwrHPMfsgH
 M2Kemo/AfCcvrTxX+fgut5EC8qMgr5jDsJLk+nVddI9oGFW64L6Kpm/3LGkEQ/BGXk5o Wg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmpb4y6k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 20:29:53 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32VJaisD001159
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 20:29:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdbkfrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 31 Mar 2023 20:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtx2rXbo7eGpRPSoZHCNxgJzsgWovObwpPdGvSa2IfL8Fhk0fi4oZoVg7A2qPobcf2MVw4GGHhBboGP5bR/KZTk4u+VYDAs1BqUPOuPaEo2KWNR8KAogjnVys/8n3QY9COISXlJdBpGfRqr1XOrzv3U47JLF0bOekiaXOASwVHENJyNqDcZutBPo5mwyGtmlgTLNwhH1yrAEv/SCICxJ6IbQEsDp4HxTbbM7xRx5WYd3DRnCYKmaxslFlQ5nuS7JmiWggKOg6dYLz9+VTeJD0iGP5Gp/JSssMZ9GmEw/tWyAhQkBY3mt2hOcWiq1Ii3hVH2jmAoIu0t8JrVj6rRwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8J4eLt09O3RJqfOTlsc/o5nk8tUitYIX1y+CuaacG0=;
 b=Ket9D8oLuUqh6sXuKy8ERgjdum7OvfqM3mgi0cV34JT+TMaqzgovQ8eMToSWc5PsIEGic2POHnxXO/V4DW/ZsnCvl9AeuSafTxNHSvy+eSmK8fWGQIqJRzwBEz+61uGc8dtoQvxM/xI1eTFaNTqDdmS3ZuY8H5VWIHesuewz4Qm6SDZlvc8sua9h5n+TbCuPeRhLZMODosdSK4P5lhoWVnCf+UHm7kDNaUxE9zfJOuTxNx3NL08a73Q5wjRCIwLnNRYcWfkMjAeFWIgsfCnOMGPyP19QjmN/qnHiMMShnKDFS+k84RZm28mDMyubRrrH9KUikxmuIIS8QVPO7O8Cvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8J4eLt09O3RJqfOTlsc/o5nk8tUitYIX1y+CuaacG0=;
 b=EK5gX8QCPZBwUg+JaJC2kCC5/XiYbeoFkqt0MC0Xv9Vb9jkrV68ldoLLGoIpIQAxrXOKkBCYwKak43/SKfsKFPjyKCaH4xFZHYCYatF4Ok9K/G/heu4IFkboRp7LMhsoeU1FOROlsVfTnmZgs/kl9HtlUNd8pbLVXLZDGJ8bv7g=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB7285.namprd10.prod.outlook.com (2603:10b6:208:3fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 31 Mar
 2023 20:29:51 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 20:29:50 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: topic-rpc-with-tls-upcall updated
Thread-Topic: topic-rpc-with-tls-upcall updated
Thread-Index: AQHZZA+L26JE0rOoOEmS25K0JctNqw==
Date: Fri, 31 Mar 2023 20:29:50 +0000
Message-ID: <54285FBD-437F-4F96-8FDD-2BF25CF218AC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB7285:EE_
x-ms-office365-filtering-correlation-id: cef48aeb-e8ea-4a7f-5e3e-08db3226adce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f5XTRTnf3DF5hQwu7rHTP7HqWG2zkUCNlQC80qGpBRkypQ41BcZYg140wrK1RBIi4+9YYl5FWuq95so0HYxwHvvFLVEdvCD9bqOOuL/NEK7ZAUnZkIVrs4NorewADuJZBuhADZ/9IhQIoKAQ84X0xkwvApamiLzlGRVDJg+2dVcBFqP4xrMvQ+GSNdc2kA+wuSUC7fPNqUev4DYDOevTSWl2cAe5N0Vj8F02UocCGbz1mzAsoXD30Fv+t48y+rp5ppCUCTj7nsoTWJll0E/eF0K9AsDBaartwU/kWaMX05nkA9OiEPum5fgSuA4VoyPObO1/Ib6BCR0i1fbrnEWLlh2WkpC6+wKqVQMhJGArJa5w+71DEcf4JgTmheHkUshDeSG9/px4X0qJW+sB/jF0ZAuyok0NPrPGTFEHDtrR/1L0k1xcjyeBQQOwqvjnnvGFUcye0t+Bxg90vw4GGIReiy4yRS8Y02wL55MTbgkUKb2BQPskVKARzxOILsdr5CTNhLqGFIQl4NpiUqmddhTLnOtHeMD51XGZI0sWClE42QE3wt7XT3SqSbPIfKF7r2K7Qn7HUZYgbEuBOmHnzCgLqYVPfh8zmRDhG6p/j7HwLUlB2PYHhE6WXIWzMghu3/zsjqUVOMAYEvvq73q84EA9pw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(8676002)(36756003)(6916009)(5660300002)(478600001)(26005)(76116006)(41300700001)(64756008)(33656002)(6506007)(8936002)(2616005)(83380400001)(71200400001)(15650500001)(316002)(122000001)(2906002)(4744005)(66556008)(38070700005)(66946007)(38100700002)(186003)(66446008)(66476007)(6512007)(6486002)(91956017)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6fcPwFVs57ZNEoc8ap7peLQ93yzNhjXg1sfqALcaDut+lFIYbcQEQXCEZ6UN?=
 =?us-ascii?Q?lteq6xcfpD5HSXxiWnMvSjMMUNMj4rxsm+IZsxhbG4pT4Avrro8kV4rEcpuA?=
 =?us-ascii?Q?knG7ZO9mSVbrsQfOuCICqG4UaonblyVtN8aXf1Jm9LdFO0EoWcASJG1ypwFj?=
 =?us-ascii?Q?K6zmNvbb9zBUYQIARXBZXn8iDR1S9uG/Jhy9bWd9YUh4S8hIH3/5ZBTaeAmX?=
 =?us-ascii?Q?D9TbfEwChR18UUPTeTlltKsIxfTe27F2duLPpqUoTyyy8A5atEVmn3w9Eey7?=
 =?us-ascii?Q?fRkgOSo0SXSdSV5rAOskrF/VrM+26RGm5sbVO9vS3P1JQ3NJQoBbPemV7X29?=
 =?us-ascii?Q?ibmeuePXWWbGwE0q5nLgFlcUjkvEV05SV9AoboCOIZpd02OGvlIHKVBNf28l?=
 =?us-ascii?Q?xfXTNSom1SrW4hYmGdobvZifcPfKwT7YbNrA3dGOtEZLW+xaZiITWcJUH+lM?=
 =?us-ascii?Q?H8j8nkT1XcH8T5OAimxIN18rxp0t/V3QzNH0jVu1g4d9CBFsHlrKIdOvYstj?=
 =?us-ascii?Q?3H9C0hbIFPAuoIsxDDcpdUZkSWeVaxmOZ9y8yu1ngE6fcIaQWbjWJIuMH4kn?=
 =?us-ascii?Q?gWPuGMlbqKYkbDk1Orqiou00y00QfMZjE2rFNuqzO7lnvGyGQtb4sq8wi0BT?=
 =?us-ascii?Q?YRl0QJ3RN0rpIxZv8HPVcHi+OD4m/JGQMPikUZ/JJ8NpdAbGzdIS+v4ynY6z?=
 =?us-ascii?Q?TGamNvrvpuEJoJbUjtu/YiaiN5mFHnvjRjA6FWBri8s/vm/YQmSRCqZc4Mhr?=
 =?us-ascii?Q?myCtRWA9KkOn8NahBdVb12FuFwmFq+ndhdM3KQLnmBuaJVnuZ0VfxbgmzWOr?=
 =?us-ascii?Q?EIxXuHh34DzLp8xSezHwJxckv5j+yQ0aASzsrO6JYMj6GwzBHIy5xjwpmBxe?=
 =?us-ascii?Q?VmdF30tZ33TinxgM7WfAxC+xed4f7frDBMJEEFNX+DURIycCfL0pPHvw3Pdq?=
 =?us-ascii?Q?6TzUJyjp7b6qJ+2NWYr+OP9DyJfI6B6lHv/4Lgbl/+LLa63l4OQ2mmN/Uq03?=
 =?us-ascii?Q?jNsugKGXsaPfRQbPHU3hdl1N82KTRolYCyfEivLgmGjaIxMPVkMAIeNosA8H?=
 =?us-ascii?Q?tbmFeWirpEqs0Kxt50QIcJ1fasd/1qjtFhGvrtG6qwWKTkuwReUTYj+gZTvb?=
 =?us-ascii?Q?oCijHkYXMU7OwsmmVJME7YWUDDqYzeifGURVeE0WQ+HXVYaUAGyH+ZF1qKvH?=
 =?us-ascii?Q?GzuRUOv4DVyKRBpIsxdoJ3J7qD0MAoCdt6FhqxCcQ/JN9nn+FkBJ4mC0uOvI?=
 =?us-ascii?Q?/BCbucDRmiEPh+Jzvj/xHsjfsB0bqt0zN4MBsx0qHyC02mcwMYmkjhqBnrWV?=
 =?us-ascii?Q?VUXig6SSJqLCuSH5AW8kJyqIB7Esu0TmKkCXdMyNMAL1FSnFJBEX5t+SreG0?=
 =?us-ascii?Q?+HUVFrK7sAlO9tyZgsgkTkmi8SunOTU/XjGl6IKrpg1Onf4u08C1+B7ndgFs?=
 =?us-ascii?Q?jmxl5AOuV03Hq2eOR7mTohplgRAenGxXuRmVf5M2xIen0vBdaH4Llh8y4st7?=
 =?us-ascii?Q?0Or5sz2SO5dvTymhEOXAvC/zACcG/K1YtNfuIuVthKQVfN5uGGGe79Z82dQ+?=
 =?us-ascii?Q?Dz/3zQGS9vBPf/e/NJE+GSUYB0ykz2T20ZLNa0saEpokWaSsaYl/jeAv7inc?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1316BC406C067440BBEB5E08D151E638@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LXT+T0kMPR1SLehjFLxcMnqeYpdDb0DcR2nhzAbw/7dAEGiH1XehHmitZiPDStQqPj0YSSHCOrq1pJCVFTwKfbTI0B8s5hJ0qmgu2vbXJgSuFgBDt/VGTeM+9wNaP3qQlooa3ACNB/voGZ78Caf/kWtxuPLgZ1+DC1ZOiDDZOAiFqwVYTLISzLJgmpeVQC1AjG/822gRjExt+CFtpUrfW09VcsNJ4xM+9Y2TAwZhm2Gr4ht2vlQ30AbmZUxcZ9H01rRUDfuClbofw2adAnYxL/kdzry79DilnndDoSxGJW+O3Eddnrjtsf8J320oOLviBbFCiXrSaQqrRmZDCOmSgXL0+ldM5e9Uhfxa4lwiVK86woWQcktSMKenRhandTQ1AsWUxMueNVMpK+oqiGk02asVKXdD7Zbl1sv3/7VQnm0/yD+o2RdNiTjOGxzt+Wcu+Mkvl10FLwq9BGTEcHaTBka40SETLmwOv9bd/UMC2rA8bBpfjyMIfxR41uv1Y0abyDLFNpDdcm5OS0ijPDBDDnW68V75MeQmCKrpn5/81DxcOuDf8nJTA0YkYMDW+WNWS7hH/Gqyt74P0YCMwFLq3E1mt9KTRxIbACUTn0yOuhAmdF17sSw/LePaFnbfQHTaUsp6iG77bjybyT+w7JrZ2s7NfRbWNp1B299kM9hEuCGhrUAteYG0T78jEvUq/yIs5Iw6nZMdaN6W/qT7QOmd22b1GeOHDu7vbR0PFr/IyG3eOV6qOvYXDNCme4n/Abj9MM65oI7t0M2DnhaesVWnCQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef48aeb-e8ea-4a7f-5e3e-08db3226adce
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 20:29:50.8665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3spqfq4Iyb2JYA5cLMH2CasFKEQzDA45uJH0lfT08hFfgnjz3gKXhdWLuXUjB8rvhia7jAgpZOthFUI+PyJW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7285
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=575 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310165
X-Proofpoint-GUID: ZeboDu78vi24BdJ2ycDCKnYx7xWh_-bw
X-Proofpoint-ORIG-GUID: ZeboDu78vi24BdJ2ycDCKnYx7xWh_-bw

Hi-

In preparation for posting a v8 of the kernel upcall patches to netdev@,
I've pushed an update to topic-rpc-with-tls-upcall. This update includes
these changes:

* Addressed Paolo's v7 review comments
* Added initial set of Kunit tests for the handshake API
* Moved NFS server-related commits before NFS client-related commits
* Squashed in Jeff's fix for hashing NULL sockets
* Dropped the revert of 987c7b1d094d to avoid conflict with David's
  SPLICE_PAGES work


--
Chuck Lever


