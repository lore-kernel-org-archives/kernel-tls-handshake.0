Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96725111AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:52:07 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HIGwBB009765
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=2UxUOz3PB6CqymXdqUbslSnBJcVK6sP4FEDPHqMG/SM=;
 b=xhqw20h6WZFrohft5r6DMOoNfo1vsUIhD2NSsHRRwAD/hbEmNTxnXA2o9zXS4vTIfTcD
 d8QZJ7koY1J666Fn8fMk/tCuEtfvhSRnw7YgqZrjQiF1I8O6ZRCmQurHU6dUDIt4Z2bz
 HZjufDddPYjYZtFOWPrXifZxhkfWZHeucuJ03l/m/X9x6nfaw3vFPL3vQW2y+g3BwqOZ
 H0VXLvUSAASj4BSOe/xE3uFO+TaT5lP7Xu3spo+zWSuJsZoRZ6U7cF/yZzq6pkM4Lq6C
 VZPQFbLSkfrpw9Xign9AlwO2cI5PkCLtbp+lEm9qpZhG0ZgMYDCcOOdpLKh7DJVtYJO+ Lw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qmx8j11kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:52:06 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34HHA3kK034011
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:52:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qj106a73a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 18:52:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuUyBaRSB4x5D8Yl5HJxQCKt9/ooQ9YMGvkDoEv+B6DSoNcyhPOO4vGlUmRQGT7psnY6UUvcSghkGnqGeGEj93ZpELS9/5OHuRq42cQwzN/GAbdMuVTPAbLusG4DNZzn+mtpDlzCVTih633UjXS8bqGt7W9Vd21fPx8odc4xTsl5YZR8K4CKvCUyD/lZhonvKzycouvrbmB8S5fGcTFRyF4azd1Kpp82zMTATeNSOFf8msOdDGOEFV43hN2Ze7WDKTma+BJma5NskQ98G0jPo4L2rkRjhvOh8D3/sp8OHwUtJcaayeXnTjAKM3hdITmEUAOEU6c2WYC4UjMpHwEC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UxUOz3PB6CqymXdqUbslSnBJcVK6sP4FEDPHqMG/SM=;
 b=Pt8/Fyflup6ObyC51oAaal+lpCYLN3ZQzk4R9MpMw+IybZ0hsE62hwLHi8lggxxIJFj4BCgnBjy8APvGoUSPMzDktYwbTiXkMpRtPylpaJvPZFVeZYItLberTmycpdNSSWKEExYBt+1xYwIhYUBPBqSk4PwHYhIGePXBMnDvmlsgKI6ZbqTl3II3MI6lvnI96kf+UWuF3d+GDRJ+MlD3D0DpRAFOTeG0lr1K10Mgw2XGH8Ov+lVhytvtEZp21eD784+kC8XlqZ9VfOq3L1XKursO5h6KN29IpCB1wDXOX1VoK1ZZYWXh4/1/3eC2CqgelE6JvnB7RkUP7/uH8UcHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UxUOz3PB6CqymXdqUbslSnBJcVK6sP4FEDPHqMG/SM=;
 b=kJSjD79YD2SagYGw/0CJvLILlXu+bdeLO7PNHX0J0d65Hhq+sdqTllygJdBFlX9TtS2XGcnfDUNJvFvM1x24jvk1NuCSCjre6pgX/XtdEfWnuHQK6oquFDReoMXRixBb4qSL3cqgQ5Sc2osV17cS9ww9AfE+AMW6w90VITzApho=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN4PR10MB5557.namprd10.prod.outlook.com (2603:10b6:806:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 18:52:04 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:52:04 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: [ANNOUNCE] ktls-utils 0.9 has been released
Thread-Topic: [ANNOUNCE] ktls-utils 0.9 has been released
Thread-Index: AQHZiPCrHFQQU0nuy02tCCqU5XbjMg==
Date: Wed, 17 May 2023 18:52:03 +0000
Message-ID: <48A3A079-E780-4781-8EBC-0CA620D9C1FC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SN4PR10MB5557:EE_
x-ms-office365-filtering-correlation-id: 0d3c9394-b202-47d7-5ba8-08db5707ce42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wb2jWaV0zQPmivJH/DepdR0ohMNz+CK+/TBHSt18Na6eI+71k/4VpJ6sRk6aCOoyGCS6Eh0mFmEgJvmrh9jZAe1crjjMASCrqFRNYFrmppVNHWbJ34CLa6AkPkn0ZiYf4qHKGEYu/6KmiKuaifNiVyquuLgqDwUiQ8wVj7vwUk9TVd/F+LXu+h1b0VFqwnFpwqzXUO0tlEpkgTnDAC9kSnoQolTMHzyLfkY/y8ARFPY5xX2bpvl8IEBNTyjGnBPnqn7RNGUG0uGKzvoeGHDTdUMtE4X6YUO34hlii28Z9iRsm+H+A5vhX8QoaiEy/WCdI1gp/uGPTbcsKWzE4EiIZAnXQTbMvBsUBb5pbRTGppNJC6Ky1DLGif+UVvQcW6LGVMYhcVg7dlBh+jkpMsmQml4+YT/q+rhv5wgqZWe8AAoh4dlt8jlFo+DBRsXua51aZ3MXUkKZ5fWUTcgPT6/LWsgOcrAFQI5NRdmqoTHdD798jTsmebY0JALwik/Q478jYoZ7oTrsHZloUxC6fVT58/ztGqOpbOFmpz0C84xfGwECA9jL9NEuKC/h1SKBiZVjjxMCbXYRZdBQaOY8yBdqWV39dVmQJoUHc8rj5uO8XdFUj64kGB5JUcfxSuKW9kvZi+f4te/QqXGsFHhlVeqWJA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(66446008)(66946007)(478600001)(66476007)(6916009)(66556008)(76116006)(6486002)(64756008)(316002)(86362001)(91956017)(966005)(36756003)(33656002)(4744005)(186003)(26005)(6512007)(6506007)(71200400001)(83380400001)(5660300002)(8936002)(2906002)(8676002)(2616005)(38070700005)(41300700001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FPN2MsYMMm5FdcbKXLJkyzy7KdrvwY6SHP6tujCQf8OUHOVSSUHMjh78I0aP?=
 =?us-ascii?Q?WTSOnWdX28FniUVhiaYA+RsJceZpQHEFwVk+6T/ru35tQkYt+ier23MNZj9w?=
 =?us-ascii?Q?LZnUNVXs5u9fpzSAVIgzwdTKMDPtbJz9ClFA6Yr6jJvFFXoGZpCRq1MkcTDe?=
 =?us-ascii?Q?D8tp0toU+xeC593AsWVnwn4G0DLHNiLCJZwRBu40rnJyKm/C+LPwoCRKe8PI?=
 =?us-ascii?Q?bEXXVC++zo8zQS6NRgvUPyUDLlfBB6HNHUZUz2DMfoUrGdX71zR/0LWbr0Ei?=
 =?us-ascii?Q?QE9Thp0DTS8MNS/ZCqV8PXzpKLkpVVMbsVkz4FZcmQn3HcZLpGJVVPYT8ikM?=
 =?us-ascii?Q?MR6tphnOuj2UoqUEqVVSH1Ot8EiQixvFVa6gsgg1UhK4jy0tmzUk30R/17Vp?=
 =?us-ascii?Q?Mr4acNIVTBD9nzoKIKHCZYlMMeUuBJcP7EE88XMUeRaNiiv6AsOXhu+H3gLR?=
 =?us-ascii?Q?cu+Q/HXQeXxF1QVbYMt9Je58+kyJqg2lfKXsPp5PFOw4M9ytQ41LT03UjhRH?=
 =?us-ascii?Q?G/IWIbz1ZHb6OprPj1AT49jNpc0PBL0iRuuSBn6UqgGg8J/6nsk3aScqgi0D?=
 =?us-ascii?Q?VeWIxaKT3QqtmanWQ1xRNa+EYoGPbxT+gFHumTDodPAhdot0iuqmhuV40/FW?=
 =?us-ascii?Q?FLYXXlOpV2oMqrziqBwGS5AzmScgeXeV1fIOyfZxoQHPM2qqsAAXtW+42h1v?=
 =?us-ascii?Q?iCca+LDNwPBBP5bZXySNOA2jvRYA8hiHf0Jz9WqX728wKTI0aI5NmMQbe0cx?=
 =?us-ascii?Q?72GPtzZum5nXRRgttG5pPy6QvRJVahdzbQTgmQeY3FfAA98kJ2ifNn4CIRQT?=
 =?us-ascii?Q?cWD7lMcVlkHVyJvcLde473Rkie+wmRrsBFufbsLRBDMs9DsN1Gz4ex/Sb4Y9?=
 =?us-ascii?Q?zRQAYnb559XECshRRHhvD1tRIbdDflKDPmmXoWAESAnAOeKTm+QEW4il/ijF?=
 =?us-ascii?Q?OWm7EE4uisqLraedbpS5VfrA+2CygMssrp54KWWxyptc3Efig4YBXSG6hLsv?=
 =?us-ascii?Q?vRrm//8U22wOpoSafOBNeIJnbUK06NXgldP4TN2G9rcY4VZ+Z1NIn54f5joU?=
 =?us-ascii?Q?axACWmTzmicAmNgUv5BzdUUuoI+f9TGx1cZ3QfbVElTYSXlrjQfexS2vWaj+?=
 =?us-ascii?Q?gTd9z7XsrDtNLUF8Qv9mRhBE0fZtWm8l5X/5VIO0nO2lH7Ddpsl2WapSaoZK?=
 =?us-ascii?Q?/swW9ZVEg6AbDA7w9g4D5SZM+JFk+icsCCTdhPPdWiANG8l0/kfnxjf7V0Kz?=
 =?us-ascii?Q?DQqVXpDiBe19dLEXUzW/IArdBXemUx0CQcOlgibFusvUS1YFjAtcPZ+T4fVE?=
 =?us-ascii?Q?G3ZiRnbkaA7ACD1myB2zl9IRg56tPBu8Xsply6cepzwNRqw6pMrfzUlsIITr?=
 =?us-ascii?Q?tFM3KWYjxWwYg8sBNRXyoZkRu8Px2dLqemKxFKu7GL7xn0/eEc1Ufb4GGM+c?=
 =?us-ascii?Q?++DxdRNGWRu0wPyyBY24joAqA/7+bkHw+7oMrKDCwcDBMtCXrDLUkrTfgun7?=
 =?us-ascii?Q?NkolRwXfISz6rjVaUGUxS9XvHe5aDSN7nSwgHcq4OpsfOO5fIBHHR5m3pjTI?=
 =?us-ascii?Q?MwX8frbm4GzzcwsIjHBy6budOWMrBMEj7Jcprw5mIwP7SY0WmXX4y/RO9FY6?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7BC77175488CC34BAE28CE45C22F3D5E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HO8mc/dbfAP5O6YWjjSrPA0Ao9yFELBW8kmIwAG9+7IlqpEyVtU+qt/hcEfkekHBvP+QOQ2+oS7piXVJRQg8LcCG4wVYSn+b4k6JuakN6CBO4vExTSWdxMPsP5AYwsqoQiWW09CBu05lOelVknSckfnWSoxQH+djAhVNfcAhtoCoFxKOdWvWn/mhQddraMi6UabwjfvdACH2/GYEH02HTSikhO5ILqD/OHCcFz9XNUxcEy6uopxL2mXmVh5riDv17Bthtqd+ntMMG8OOdiHSl5qHpc/enZtZqphH75/AbJQEluuT8PMSHjqxh9EapGD7oLW0zZLnneT5/hxlfOLmpNomVIJ/dkDOimxfnlP0fcvbuDTl8GXpeLP/G2z0NG04Dfh5xMAZliKYjVSDo6uerSXX/EfJKkCBA4Mj5x3oAfK6+aTDEmFWmL2NGI8Q3gxd6DQeBVVfC+hxrUf8jcdjlQJyAxc0sNoClRo2bE1EFfU+YjcWiU4V+Bdd/bR8sh14NqSV/yq2vS6Q2XqxhPCDJAZXE9IyxLyKNKI3nmDmDFHhtdWxcG0Jq6/DH+4EVDmtEFsvW/wR2W0qmTM5RkgUV3v3155aGJOgvu+oYOAgiAJdolf6Ok7CDRv4bM5Xg/YDEV3hej8sNommhTKbnIz9ydMKUSp5o65zhB7RT+un+6Bdj+6FYIAytkkuev0/6wirQ+nmTKyYdgumauU2vt38GeuajHcTz/vH+yYzOCTwnLb4YBis3ukGNv5hG5CBvxph4627BroWJors88H5Svpl7Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3c9394-b202-47d7-5ba8-08db5707ce42
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 18:52:03.9855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oe66gubuI+EAovv8vq84AZtvhyKxKBIcKDGkUOMl2gMpYCkJopF2T/pTciBy/kC5J7Wdwvr4kj6dL+yl5S4EzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170156
X-Proofpoint-GUID: 28hQomvjHtrGyB1FpO6DZLSkxSlswsC8
X-Proofpoint-ORIG-GUID: 28hQomvjHtrGyB1FpO6DZLSkxSlswsC8

ktls-utils 0.9 - 2023-05-17
 * Cipher negotiaion now conforms with distro security policies
 * Improve Server Name Indicator support
 * Disable Nagle during handshakes
 * Send TLS Alerts on handshake errors

See https://github.com/oracle/ktls-utils/releases/tag/ktls-utils-0.9
to download release assets.

--
Chuck Lever


