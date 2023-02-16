Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6B6FD6
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 17:17:09 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GFONeu028032;
	Thu, 16 Feb 2023 17:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=6wVGp6fuMX0OkF5aBExuyhxqDFCWxjfcKYckPwNSRmg=;
 b=yqQZV8MnlR0EivDvlKEm58MaWDmojegsFZictFAMuty1jpPL5ychZile7oMFHOQ9smmJ
 QGX1GslLYNumwrLNDBoUpjM9X1E8oD59Fie8tUM99RDQWGV3s8jZ+XI0oI7c0OmOAcHG
 h/6mIiUvo0jEv8C71/85OjBImj4B0u+Q1ONA4hM9D0dteJc0N021sESHVWKi5VzfBxuk
 g4IvHI+uBCYzlt7Sp/N2DmF54LO6rOZLgUhfe/7tm8FyFIAsEcoXKu26mAJ0wZQzIyq4
 +uPREtaW2SjmZpjiPhLozQBHV207ltm1TeWish2xMNnGYEKZYmNjEZzj1WxvRI/2ZUlg 3A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3ju3rfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 17:17:08 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31GGBJf8015113;
	Thu, 16 Feb 2023 17:17:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f8wv7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 17:17:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQdzyPSIuB3SWnjyz4z9yI92bazM3JjYHB1t2xsU78N/dVz84X9Gldocnmt/U3PCaz0inhPsciZC77Xie5rzx457bRZ61/3QOcYaB2mQh0ENVI/fGrl3qRWAeLSXMjYo4jt3lg33Z6ev7fvNutE4C8pdhHk81lqrIHjUiHS2V5C76bHHt37HmE9mNnO8n3PlUrTEgHe/LaYX0gLqv3J6TahtwEk4FK3OjhTe3NcXFFM3cklOF3jGP1Y8Jii4jhLnJpMg4tTpLrODxtlrOY/ReZ2/Ofhe61y4Q41hvQXNlqOpvQjLgNDEz+1Vyw6arziKJys1LPhg4uFUQrLe+O0oeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wVGp6fuMX0OkF5aBExuyhxqDFCWxjfcKYckPwNSRmg=;
 b=YU+A0dvcKJVEWqxYWC3kgGFq5n/p+0J2sQR5Yf9GHS6m4tcNcwkz7oXLFi8pS+tjuD2AWn3Gxkb/pDgguBNxdJiLh5J287F89Pl4tdKKvS4xaSCogGWUuRN2qNgQFzAJzi+qmGkxpCOTrU8wh85qFaFQSwLnc/l6TtOk7PweuT5kBkfGAj6f4uVpmHkjo0XMAjk6nSJ2ghrRRqLU+UdN06lodz8SPXfoVRKBF3OFqxtCqO3uOMTXuLfn3CDeahMbl1plwWU/bb6o9iVcIOZ593mK03t4/1/Ovx8VGA+r14eTJm7N8qx1DDFVXdHGDrXmnFkbNoNeDWDkrF+VFukyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wVGp6fuMX0OkF5aBExuyhxqDFCWxjfcKYckPwNSRmg=;
 b=KxPiOMU4tiRQWWNQDXX2PNp8r3ioklokbhvm83x5uAJEP+XNPpKASaoDZ0RYrWopMO6zq/toy1epGXynbw2UtTEOKpZuTFvXmgH2LZiXm3RKHrmtBGVBjyYf2sebS97YuEkZly0n2V+qt2IFkI2hfFMIbY4zJCuLCb2EEC2ERmc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 17:17:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 17:17:05 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Test results from v4
Thread-Topic: Test results from v4
Thread-Index: AQHZQh+Dx9f0SmrC/0yC4lLUT8Ke3q7RvBcAgAAPNYCAAAVwgA==
Date: Thu, 16 Feb 2023 17:17:05 +0000
Message-ID: <66F7EBA7-AA44-4FAD-B7E2-20FBEBC74C2A@oracle.com>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
 <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
In-Reply-To: <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA0PR10MB7135:EE_
x-ms-office365-filtering-correlation-id: 111d9fc5-04e4-4f1e-7261-08db1041a0a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 S7V2K7/jZAaukpB5ABhVVpM4GgC41D9VNV0Byl9Y9XRMVhiRjzycwoKxiXtOAfwWICRxiod7EYvzjP1IcVXyNbojxAzrsGgdGtqVQgeMlRNRM8+HQAYERV7rhhZvvCAkUIG/xw8E66lL1DISuCGWHACtFfCe8vrK6ApbfChWwg9nGIyYWWMvCKEjoJ2YNvrtA0admAM3vJhoy6L5/ii7kYXF1CT42MZ+06dOxb5uW+r0/9eHeeP9/p9r9a2OoqVgz+YBqNE3cq/tbpcV1H+Lk2bbAgPUOSXu7FixfdQiJxzZBhsy1vmQvzOBCYxbcHLcq40HAkqXv3F0NmJ85ohul9Jc9CGMyNP5vu8InpuBHZiJpX5qPN1590VwJ1u/BcRt4fSSRj0EpzKea+Nt0v+5y5TJqQ3SdElORPhFGAQ029div3zdcU2eCxVlEquP9+NyS05kR9sswM84uWtWjUYoxiR+Khh01OeZwOP9yhYyHvU3PFUzJrT/CKFqb7mMEMCN4pmiBFTjiCYIPWJr1KhEPlGhAtHI+Cf5FNM18r6od5RRi3/HdtcuOZRpfWXKPhO6tE71FfeQwMusyzCGvxPb/yLUMkVeLFwLC7OQRmNlt39DirbHESm4s9LLR6WuxG3gEhT+ehtpUUbqD0Py92nV+fzQWsVeXffDUaUj/BhCAqf0+8XWkE8zgTfPH/ZY4EdgxJXOle2tTb/DzHcNdReLcJaF5s3yCjyLvFxgNlpCC6o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199018)(5660300002)(8936002)(6486002)(41300700001)(2906002)(8676002)(6916009)(4326008)(76116006)(66476007)(64756008)(66946007)(66556008)(66446008)(91956017)(71200400001)(53546011)(316002)(478600001)(26005)(83380400001)(36756003)(6506007)(558084003)(186003)(33656002)(6512007)(86362001)(2616005)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mROciE7ccOU+7zIag6l9UqsgrMJkOiHexU934fiOgbkDVb4lw9RchGc4JIjQ?=
 =?us-ascii?Q?mjShqepkSIuOwjP7vNKhGCogG6Z7r+DkWbG2dzSM/on1uMVJnwZcnjaVkQ1c?=
 =?us-ascii?Q?3xPsk1eG4+7YsL4Cr6yTZt+ZWZyUSjnEb3AiEqkj9GJrDYhv7qdyzCFIdB+y?=
 =?us-ascii?Q?mArjuNd/c8362V1j12DSUDyve/9DPtNbweQAOYqpNh3iq8DKUSQGHXon+HZP?=
 =?us-ascii?Q?hQIkW1kE474bxJ6HoR/lWyhf5i3NPymIDI1DFglUAnD7VNJ6xSZ2aMtOoDD1?=
 =?us-ascii?Q?Ayu1ll1x13M0MnHopP2+bSz5LHV2/FY5F8RMfoYg4TB67MySt0+q7f3sToJA?=
 =?us-ascii?Q?9AGdJbfTftW8kd2FyUcPRQ4MtfisdOw/6iBpqPySe0Z3XSU3/3ll+2h9p/Md?=
 =?us-ascii?Q?LTfCQjpzVa6ehUZUflBo0pL+W9i/RcQvnSp37eXtfT8PJ0HuM5AslLKsjX/M?=
 =?us-ascii?Q?wIHZ8fgDMFwQ6Ye3CcXMOvyn8Rp4MSGiowX2qaabbAsLDTOwlfGxXSBgLrXj?=
 =?us-ascii?Q?uNCgIHJJljC4luHmjBd2xGOMK7a0LIJPcVltVsDQCkBWIh2YmUxN9pjxurCi?=
 =?us-ascii?Q?H5MdFRvOEtW4xl/wmv0q9xUAbN5/b0KyH9g4nAJelifjrAyibpGbmpminrl5?=
 =?us-ascii?Q?BwRKk92XDRFaWMmDaNvKLkmqSnadEeUMGeJgRq00huGegmqKIfsvXQ48iTIO?=
 =?us-ascii?Q?uuhfGCQ6l/ADw5FavKxJkB2KhSzRTPRF+s3X7S1dVmQgFBdDWCC2GVH3Vh1O?=
 =?us-ascii?Q?bkbIPJipJbSpxBO6Rqg0OtgEQDz1c4ALqh2UfyJ/dzunz61mqF8PNi+Suvjd?=
 =?us-ascii?Q?eTJM09PEwj5SAg0ePEqstfO89T7CKYFMXO3LB/hcKlBphVAcLgK1KAKatF1v?=
 =?us-ascii?Q?3atkpJg7ZMIegSHvdtC/jcaoWOukvRfdExpF7lLSOBUCLItC5Y6vAjCYOJ1D?=
 =?us-ascii?Q?4JsPo251fq8K0BVwS731p5HwmiGbgYgKo2Kj3mexbK8IoQEubqVF8Q77yZvx?=
 =?us-ascii?Q?MzQSJSyX/d6jd+4Jk+ZfE9bkuiRGuh1ocJmd1VYZ+YPce7XvjOvhCjzKiNZD?=
 =?us-ascii?Q?e4/EzHuC9G8JPaBA9SGuryzueCFi0pLHcp+cLFV9Fi8CerAVSD+iHG12nRrz?=
 =?us-ascii?Q?rY/kCq43yaZsW5ZmJGb40v8g5vrd85MTuXcluioceXqfrGNzbCYMdvHUre27?=
 =?us-ascii?Q?NV+OgLgGYQLZgT3Osw6d4i8wgotjxdG1bnR9bfnKdxXFT4ahkAqzi+pYYX6n?=
 =?us-ascii?Q?BLyWSb8UL+6umYmwUGhVHUA2XK5C53yo1YSfWFyLEjmxw1UfL62L/H0S0mtE?=
 =?us-ascii?Q?Z/75X6dndUVR2FUK4RfS3gR5hc4TQZpDesPm73rVdxWtQhLaOOxv5M4jnCkd?=
 =?us-ascii?Q?6PYCLYFtJjP93aBp+ZKWFQsMG1rNoHPISBq/ii4WQlR1EQB463MMYo+vxPo2?=
 =?us-ascii?Q?sE4yJzXSEnCwq8Djakq93NCQJPoM7eCRMU3R9asgE3aZlF/z2LW0B9NpT3fY?=
 =?us-ascii?Q?luyAoJdqWCKNFNSiV3Wdrxx3ko2IHIrvElC1oiqRhC2RdTkBw21mLSAgNSoM?=
 =?us-ascii?Q?UU4dawZN1sGrXNd+yKuEJsdpzWf7Mb6jNhcdM2xwio18jNOTpfii+vfpdh0n?=
 =?us-ascii?Q?Jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C050701B07CDDF429043177C5DF4311C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	JwD4vG8KWsXebGR0zTuM3ib9Qit5b2NtzuUc/gkSEee9MZ2IE0c7tJWNbEcfc9Pw/VK+PxKdqujLOiWc5KlOgu4eayktC9WbApQD1D2KZtRUFF4C0a+y5kiEJNdAm1KBQ5e+ZV1MxrecaPn3yRIPI3Z64YSZ+m7IPVanI12gbicwJEriEqMYKFGwILtN0ddQ9S9A+gqXbOPc6Wrd8A0CCKNE+lHl3Iv+xl1Fe50q7+P/WMlV0we7E96MVhDgrg6xdoZxhceGCH+VKsLVoA8l5BapJxRStwKXyN0xrfIdc0d0E8OzTUCWxVDuHogjxPoSv4umQRqvY+0P1QT3Skauil222ReeGdoEbADmm8rQm9llnLwoj/2pvkeJ0Gxx3oyUPl4SQQsSpD40qkTHiWe7vverLTx6lqbwJVhjsjOrexfyfh5jiCdgur5kcOJ2hPgpikvmv8Jg2WyK7SKSV8Cl6FJxs+FG7KqhiEFTjo4g+KeqHQhXmZsyks138ewe5xTMdBWz4v2SlF1m4vptHNkO2PcgcHLuuhNz+UzmlF+DkNK88PsPk5O6FWxC978Z7vpPBMi8/lwKwkLG1//tjHV9gEVerHuICLNlMoG26v58IlKowwNkJKL+vnCchRc5Dnoc1N1WqKS3D70Qf4WRit2i3DpUvcQo0FxsXmmh8H6X1T4Wr/ecW0d/y4ecVCFiyhBz86WGQmK9l9l0All+5eliRNg+blz6Yi5qU3cXjibu42spZe8HGaW6bdzBf4ubWrSotS8Uf/k4IjoTNwTYs8Sl81MIESLbb17DOZlrSdcSeYM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111d9fc5-04e4-4f1e-7261-08db1041a0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 17:17:05.6507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqoXGkX1viKwivclNFQVf0GYquKYKdqJJWADzIv5LqPWBYxKJ3Y74k9Orh5p+aeZ4SQI1w6eRE+vqWwoEz+J7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_13,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=839 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160150
X-Proofpoint-ORIG-GUID: 3sGWq4vzQH6Dn4bziQ70lkD5YZQmztOM
X-Proofpoint-GUID: 3sGWq4vzQH6Dn4bziQ70lkD5YZQmztOM


> On Feb 16, 2023, at 11:57 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
>=20
> I've got some patches queued up to enable PSK for v4 (both client and ser=
ver side), how should I post them? Here on the list or on the general linux=
-block / linux-nvme list?

Start here, let's see what you got.


--
Chuck Lever



