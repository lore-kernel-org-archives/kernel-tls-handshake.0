Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249233E7
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Mar 2023 16:32:33 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RGJdvm020100;
	Mon, 27 Mar 2023 16:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vgl6+0FN1/E/fdBP7OM4rP7T3ADpZaeMknpWgbPNfzU=;
 b=n6Hd12dVoxmc6B/ZLX0PwHuwjnb01IdlLfMkcxbn+F8HsSDYVbNEKJOmo1qQj61Lrs2Y
 +BDTLIpvJfdBwlafvukuah3D3shTeuSjQ8WHNYfWuQVpWFp9VW28r7oTzP5fdJ9njp52
 OlWbtv0pj5iw+fJtY44vCB1BkPixF4SS3ywaN9Oqd44JhyHDcdiq+6D0jebIiuZNIWjX
 GYssZ3Cfvtjqt42zctzLCZKc96SAjgk+rO6dURMl0zfSb5XdOjaWWI/Gb6A0t01sfcWD
 5eppaTZCY+OGn30Oz2ro+FJqnAmhYQWk/sIokmXNJ0PIE0pVgv+SRULEUUe5kH7/BmsS tQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pkejg01cs-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 16:32:28 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32RFdkEu026773;
	Mon, 27 Mar 2023 16:25:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdbngjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 16:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JptJt7COisXEeIjXv7aY3j9rywlvauejgHDY95ShxAzGl4/VwicHtrpYKor1ryHqlOLHjz1eGoX574H7TLoqfGirYURtblXS8UmZ6Wrpp/pw7oo3lU9J9WH4kCyYk3lamPU8rzLjSjOHitj3Ij9BC/YcO34bueWViK/1F1o8vLXY+X3fgZk+SHSAkRZAn8F4Qb+VAX5rgt+n8+pL4OCurYw0Q9dp9BNMpybmlCZkAXviHupJQiMUik9L3VntE7+rGVXKeF6uJWorTSRnJ40MSTFgUj6eJJHft/D0j3pKgNLPB0q4pjRZJlwVdqtEBp6CZaofBjyDonLUf1oEt/35yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgl6+0FN1/E/fdBP7OM4rP7T3ADpZaeMknpWgbPNfzU=;
 b=L0Ltgw9VK+VADU7vTcrtxa5Yqm9Bj7CgLSUP1MVmwfCst14FiCqiQOCkumSH9p+evQUUbPrfwZb8g0wfwsYHenuGGjKXX/uTwxl4mhWPlHUaoWy7dZOo5LHknB9qNMAToMlCefklCEmSlMfpxxMJU3L+04vafIcF/Xd0OpDfxkOQM9RGMcBRUtD+L8L3rK/cziYtJK0J+S/oKGkh2QEOP9vYGUmGjh2oufUpLEm3cCY4FuRRC2X0jfVviCd9WMml8w4S5k7h6rebE2gKG4Mv1uRpJszaom5JetnIb2Qqp/L57kyiA+DhFPE6t/XO9bYGLOykelS74TgPkXhcMDL5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgl6+0FN1/E/fdBP7OM4rP7T3ADpZaeMknpWgbPNfzU=;
 b=LDljtDnLwav5AYVsgfJkQBltcCi+kwXN1HXKV894o72Dmhh8HMQDgZYeqJxFCWyl3fj9OGEtNR9Jx9j3yIj5PfYcJyHiqUFcZlTTVvZb1IAw7Dc/6Yce8o8mYOViNgnymc+qBIAKOR6qXHaXAZ0E+7/KXU7OEFcmsJeFo59FGp4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM4PR10MB6088.namprd10.prod.outlook.com (2603:10b6:8:8a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.43; Mon, 27 Mar 2023 16:25:57 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6222.032; Mon, 27 Mar 2023
 16:25:57 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@redhat.com>, Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: ktls-utils update
Thread-Topic: ktls-utils update
Thread-Index: AQHZYLRFaC9vHVKyeU2oMzd9IqLnKq8OwtiAgAAGGACAAAdEAA==
Date: Mon, 27 Mar 2023 16:25:57 +0000
Message-ID: <53195C9A-134E-48F5-93E2-175E4444578B@oracle.com>
References: <95A50C6B-435B-455E-BF18-4FEAF41F147F@oracle.com>
 <85c10c3e-fd89-c05c-2ed3-d8b81cf4f615@suse.de>
 <5b26b256b1b2b363ddff5a2091c5040ea87b1666.camel@redhat.com>
In-Reply-To: <5b26b256b1b2b363ddff5a2091c5040ea87b1666.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DM4PR10MB6088:EE_
x-ms-office365-filtering-correlation-id: 0a033449-ff6f-4272-3e8e-08db2edff1ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LGAnd1AMyAcUVI4y+iklwbLhINS/mr0idjX5fWG5foSjuHcd966B78M9LNWvtmTh7xBzbEhvktfmJdSyF5xWRlJbunLyeWmQnUZQA2CiuCqyLwheogoyvO8aVOteMpQXPHbtNGLl7yT1tHNCrq8KarTiKgo0orqKtu3NOHnw8E+LD0B5LJRzGQhld5Lw5PGuAX7DeMpAal35mFrINVu+DwTcpW4ijzbKgePwbhENQG7Y2fBIV0W5zCipbtedivCE3gRABYGbhmfcqMu4zsMu9SJ7RJVKGpzK1vYZ3USio0SUNDzOd6+fTgVZQFsBdk2oJYorFI2jlWse4gip1vFAPdlCkYRvBBw7YQK64Y7m79k9oz6Rl4Xr1Bd2392kc5AMuVKkI0nkI4z6aXor3Oa9uNWczb2CJQDcTuR8bd36R4HtenIl6g0pXQXB/uFlOOQEjYzXHrh66Myrk8SMh9uaB1DeGFHsnX0U8C07+/W9AtOn4ZpgUtk/2F+cFE+O/x5Us0UM294FQQLW11lCkHPzEOGK4vjngdUU94kkJhBK4UH7uwtSjOvSBNRxr+KZpPCQuEHrgGV9gjCdKay7jNKxDbZiPGRVOUR1OyKaW0M0GxwQRnHl7W24mEFvaOL6D/H7uSymP3h+IJBpY+4HUyWORQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199021)(33656002)(71200400001)(53546011)(6512007)(6506007)(26005)(3480700007)(36756003)(2616005)(6486002)(86362001)(2906002)(966005)(122000001)(8936002)(8676002)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(478600001)(41300700001)(91956017)(76116006)(38070700005)(5660300002)(316002)(110136005)(186003)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?41SCQW2r7XUiaHcV8Ndd/jYQF2NNwrqM+5Oy4L7MCnWKsUta7oljWdI1HfJy?=
 =?us-ascii?Q?RNN2xJsEO58me7VgsHw58VINCFTqljUrJsrrYj0PRrpBUJfBOmcp65fLjCSA?=
 =?us-ascii?Q?hBnXiGVY8gJJ63i3+UHZsN543jMu6GQUWzYoup97jRGVzWZBmacvzeI4EDFC?=
 =?us-ascii?Q?+JHAC7BzjAJUM3PwCC1hARrVQmxJAmSiOg8KXlznjNf5uFXl0wZ6ftnGX+rC?=
 =?us-ascii?Q?SXhSEg5Vb6bKDP/L0ZNEgFh6NkdoUI0D8wektlnJb78AsP9I5SyRESHhMtdF?=
 =?us-ascii?Q?ompMAuP68dPh0Jf206nF6ojtQizwWUT2bDShnuGSC+BoGLxJT3eI0JGiud3a?=
 =?us-ascii?Q?d/8Ul97oexPMbOWVzpgHYQ5JvGIf4kEwB1mRRBwtzl+/0zQ0edI1PUX6TfBS?=
 =?us-ascii?Q?6ssclNF+h76MNOA3rlQQ/8TPN0D4D4gQQvIaK/c+oSkbsyiJwJQE3iEUywCL?=
 =?us-ascii?Q?G7emKHegUKNx4uSWPPNR6XK1ciku3v1nyQGmiycc2pNMcfz6wm9AEcBmYQl3?=
 =?us-ascii?Q?IuzPVTivTFbhGLH7fnL5gygrEyJYdybMzLj6YYznFtUKDV2OgE7BKJUiiEdb?=
 =?us-ascii?Q?0RY9p2doRvXhMWO4sESlIdmiObFk0GjJo6WIzMQE7YNI+vE7m0LkQB3V/nNj?=
 =?us-ascii?Q?xF+fV1kU3dPqPMYZh0OubFofarC1W6hF7EHoIADCnukxfSeCkz4K+87e+HJP?=
 =?us-ascii?Q?PxudFN/7TiHPBWO6Jjp/dteBrAXa3ghozy/A+tfr0t4OBH8KNCq8eLKDwPL8?=
 =?us-ascii?Q?3PnEvXMJq9yGI7SyltUw0oaHAChB/BAGG4IgEKnOUxut4BziUffmWUscdRvS?=
 =?us-ascii?Q?HddPOKD/SBdH1zEuP+de97zYBoVISG5LwLOGWPxcQsJzYFCK55umKgcnUA1J?=
 =?us-ascii?Q?mnsFtjS+WZu//hktT7N8t5bBgp/ghYQMgmnAMByDxXstbC9DsJsJSODIZwPc?=
 =?us-ascii?Q?/w8GhJK/C3pxcPG5RMeUm3+1U2U4RKpB/tJmY4eysghJCDJSPUCuklt2Xgxb?=
 =?us-ascii?Q?hypQ/L8UiiZuSkQU7pimgqNlN7urgrsW0YHPp69rovRT69nCsTbGSUDZIrMO?=
 =?us-ascii?Q?v0ld070P3fw/ocMUYUSp3z9EgzMN34nbGSjSrzwhcMr8+wQeL+DFq6zJtxW5?=
 =?us-ascii?Q?tm+BNWj0Xw+X/qFsf/se5e5nf+Bcn+DN9lk98TSZyc+Hy+AkwsrhxZ5piHNk?=
 =?us-ascii?Q?xnT7BXhwZYWMSi+iO6INZbIScHdrEtnKXCks7+iJJsmhKj6MORv1FUpxt21W?=
 =?us-ascii?Q?XIvxNd2J4VHsu5ABbYSGf1jCMzPs5oBBPN+jGo9aSUh7Xc+UvPpfiQAwa+7W?=
 =?us-ascii?Q?hIkHZ/JxBLNTFhFHuF68X8t0GXNSL5RuxGDuUwsv0nRJ2GKAqpK78UivCh1K?=
 =?us-ascii?Q?IDgL+jKAi8g0xwgFIOrpxw3iOSfBKxurh4OPG2Vn/qxUphXtrx02wSW6XAof?=
 =?us-ascii?Q?s1jraOw1TGqFQeZmrSO9IwSGS2C/x1xBNyLQXYBAeoqNj1ubagKiXI4hLeWK?=
 =?us-ascii?Q?UJYN7dvKUnVqD5ZLUafcwTN3sN/326t6fpKMWM2kJPIgtabX+A1p1VzWZmr0?=
 =?us-ascii?Q?BR3nz9bSIc9Ur18jRqCTUBsupaLCBLeA8Ktzps0uVBtMWzKOQmRBPWnH0yai?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8B73E492270734AA8567544228F5A4D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lT+fIBlJIauPEyKp2/IUHtCCmnoiIzD/Wn7SpYlRBqdP3U8qKtbBRgD29IC7KqRRlp6Iu50eIRfSdgpixS8A81HmrUohOjgGECUI9KknFR5zAINTrtc08JRwxIVYqpRmjwtrqJQPoPlmZmXlExz9KFFq8KndD1aOQX4hKz6rzst9dgjUE1bQG2iLoU/gwnyvUN2ggXH5Zi9VS/VXAwn/x/OHhwAIESlDk+APU3nGlw92SucStezk8LnxiCAqRU/QJInLtI16Gk01+q83WXRiYksQqO8NRkJlzj+05Uv0xgXGhurywf8W0tKIU6tgBZbYKpsn6+3gPG6dME5jNFYc9MAk7CkxdUKqV/Pgt5WdkoISJ2IqJoQn4kdADYTiaTcQv43gvcdDCrKFyYfri/15KvZIRqrdGV3vl76yzqwiZfvnWTLothvPNjQvwy+MhFq5O0qqekQYlhhKVGTmpDPyP1ZK3mBva9RlcnyQYoP1dj0SRycb949ftINN7K3VpDpmu2rlmvrUtY65gILb3ohPzTz9fHeRF0LqWIS4EcBA9N0ZKy3eFCuKxfJ3XegDJLsDRs3FQ+2NuGT3GNtXD4NFfmLqq0Yi1Wair37QN+7mh5j8vjGzZCZhpPZH5DIx67lj7VoHzy8JP0lUWcLueI/kmYtB3gQn6du28MzXFbGGxL+bJFu776J9K9eyJhd7FE7swhKT5M+ua4ttDLnl6p+8JMxtWYTkyDCIcGecRHSDq7MCQMtr7d41bvcdOypJ8uQu2nPP2fmbX0j64xarHz3AcfJOqeHdT/+VS/Pur3FfZ6p1TLmex/IzBRJSH26CQIUw
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a033449-ff6f-4272-3e8e-08db2edff1ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 16:25:57.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mjxS7tWeCO3DNNedE8jjysBBHewB5fRGQdntIvsMeei9lgJLEeWbfC3HIyiB+3s0CHU6mokYx3ae2cRLh75EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6088
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270132
X-Proofpoint-GUID: Xetk4_DWj7dmJFuo6T23ls-2PkPhLepj
X-Proofpoint-ORIG-GUID: Xetk4_DWj7dmJFuo6T23ls-2PkPhLepj



> On Mar 27, 2023, at 11:59 AM, Jeff Layton <jlayton@redhat.com> wrote:
>=20
> On Mon, 2023-03-27 at 17:38 +0200, Hannes Reinecke wrote:
>> On 3/27/23 15:58, Chuck Lever III wrote:
>>> Hi-
>>>=20
>>> I've applied all pending netlink patches to ktls-utils, and
>>> removed the netlink and netlink-v7 branches. This means any
>>> subsequent work will just go onto the main branch as a normal
>>> patch instead of the chaos we've had since ktls-utils 0.7.
>>>=20
>>> I'd like to start preparing for two things:
>>>=20
>>> - Release of ktls-utils 0.8
>>>=20
>>> - Incorporation of ktls-utils in distributions. How can we start
>>> the process for Fedora and OpenSuSE ? I'd like to get any packaging
>>> nits resolved before the release of 0.8.
>>>=20
>> I got one fix pending which I haven't submitted yet, so please hold off=
=20
>> until then. Will get preparing a PR shortly.

It will be a week or so.


>>> Will distributions want a tarball release, or can they pull a tag
>>> from a github repo? So far I've been providing both on github.
>>>=20
>> We would prefer to have a tarball, as experience shows that git tags can=
=20
>> be changed and might yield different results than the tarball itself.
>> Reproducible builds and all that ...
>>=20
>=20
> Yeah, I'd agree. Having a "blessed" (and signed) tarball is best.
>=20
> If you only tag out the release, I'll need to create a tarball for the
> packaging anyway. It'd be best however if all of the disparately-stored
> tarballs had the same signature.

Release tarballs are available here:

https://github.com/oracle/ktls-utils/releases

I've attempted to have them built automatically via a GH action
when a new release tag is pushed. I'm not sure if they are signed.

You can start with ktls-utils-0.7 if that helps to get things
rolling.

--
Chuck Lever


