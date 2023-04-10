Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D705C99
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 20:19:06 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AJL5wA026894
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 19:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=1+MArsggJ6cf/RGJrGz74m3L20KuntrkQGlHSCfSUs0=;
 b=RF1bjrl9fFw1NxNOQu44pw6aU/tjUpfTgbVNl1nZmvWr3n6TAp3Ja1C5zK8jrxJYKaDg
 DiLw5yvH1uR/KgYfCJ7kOhigIajG8w3U5b0XW1b5aVUihbF9Zgy/TRhdGm6A2gy+GVJH
 lSIu8GM01k+EQlaAc6Y398iejhu5YKfmgPwLP7OIOD0WzSQ2Xur25dRJkw1fvZ4nigWw
 zy12QQnUbDb3dNjvjHafGwpDVE8tYZ+sCSdKE1T6RNMVS+SsoEIjf6JF1D+j39k+jGLs
 x9XWX4bGYVF1xF3kDp9ESi+Aj/7+VepJOj3NG8lb7IqC3jMjSwBGnuqRfjJ4itVLwQRE sw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bvunxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 19:32:16 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33AHgHwa001797
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 19:32:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3puwe5q8u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 10 Apr 2023 19:32:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7eZQD5PBVs8kBi5DSjvcijUrzINnrTnobCre92Q1xF7G8RVXjpvfuS/upHtKAfZwlIuWAeEcqjeGipfYTxyj9Unwdom6v8tcPXSLbEgw0tnx/b+9gXtaDcAjaAwCWRDiexHilMJLElPiiHn7eKuVhcXwKPFjKHyaQ0Dtze4PsGHQ/mgn6zCPYKSo/9e8gS9HecaYquaHwVJ6gHTm2DILAMZ6LyiH2k2mPhjn8qY9bwkKGkE1XisJoUJbj1cgJppPkZP9M8YwqO5guqEMysLI9G6GG9E7L/coqcfm2QMSfxiL/j/V3RZc28LCByDOSv/NDdBx4375CFmuV0zfr/L/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+MArsggJ6cf/RGJrGz74m3L20KuntrkQGlHSCfSUs0=;
 b=ZHOZPQS810UIG+P7a7nsrAzovx4mutir3SHNgaWqbR7VK/MytNZQyGIaomvHhZZ2hoC5FacPkkT1w7sJQRHkD37t7CVzQI8/qi+dBzj0nQxft2Dv7dD7TPByHUBQ/hbC1QXp3fArb5C1H4D9OTwJ/h4OMJem+xoaaZKNfq3UqV4H+F4VhtyXk2M+qh2Iq2FSb6rjg4Ndj/dryV+kBUUxGOma5fPPxXwehj3gASiFI1h9InUq6/aBr1tlDvIPf5TVsdM/Y7uAHw8psag0CNmT8F6V6YHC2fQUOHaTRzVPtk8QD/NM1rcUFdAHkV2FGGKHBwG1INImxQ3GP2/MVa2Y+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+MArsggJ6cf/RGJrGz74m3L20KuntrkQGlHSCfSUs0=;
 b=FaSVdzqikqpEwjFOn/n6qdHEtQ+QuhZlpl3GBEem4eJ8sgJ9pxnmj6/scYGGnqMGahv9lCJRvsnWx9SgZiPh7CXvu1Trkfvv04jfLVgRdMZ+RWW0qw7lDn/BP3AtYt7KT+YUU41DD9DMpNNV8W6K7SjgAZsUvsy3/ksCjbOBMzU=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN7PR10MB6382.namprd10.prod.outlook.com (2603:10b6:806:26e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Mon, 10 Apr
 2023 19:32:11 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6277.035; Mon, 10 Apr 2023
 19:32:11 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: pre-release of netlink v9 kernel
Thread-Topic: pre-release of netlink v9 kernel
Thread-Index: AQHZZ/3HzAdQBG0JeEaCk2n1lw2eVq8k9kKA
Date: Mon, 10 Apr 2023 19:32:11 +0000
Message-ID: <16EB9884-474D-4449-9F81-2DB1A77B7DC7@oracle.com>
References: <F800AEFD-7E3B-4133-BADF-6FAF610A2827@oracle.com>
In-Reply-To: <F800AEFD-7E3B-4133-BADF-6FAF610A2827@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SN7PR10MB6382:EE_
x-ms-office365-filtering-correlation-id: ccc9262d-5b39-4ca8-7bae-08db39fa482c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4cnxOEUC2OPVImSSmwl41R/bXG/TeyE9Ve9nhll4DTq2RLYOtjjNslQBMVkC00pem1SbR7BTqTKr9rGemnWKVnuN99Zhe4zJC5njur7m+A1sHX9YlcSJ0MGOMeNEVlD6iVOYPlQGr5IbQFQ8bXL9Qb6Npb9mgA+ZSIgbSQcqtRCQNz51aKGbfGmQ80geoRFZffDv5cBJVRrzBWsOxIXKuYrt6PRzw5C2QUIcx1/6Y0d8vc+Qvuvaj8WRVv0492oXTbb+RgVaS3UuOcCD71YKi3rcat8ZaLABSZygU3olIR51VRzliv7QTQiZpbITrQ2NVDfK/sEWlYYPUsscvJzr9MX4wNQU3gfclHscjZcpPg6/QU5wqqx0y4nPP3iu2bZXbfkW4lkdHzFUuBqlEYAJUR+tI3p/rweRraeSRIgwdBQba90m41GDhfWyku42segks1L4V7ckeUFnz7dY1H5fORc/BZN22V1GiX60WwXU05j1DAnDICxVuSllGAHnrhx9XAjRdPWZueX28vWceEOy7oSe8KEEbkQ6quLT9Eb0fm/SuG48W4MaUFQ3fyXI5/jOvWI4MN6+ynmdqaoh1lgPWY8EoRDCsQhDwW17/2U+IbnopUGeL4L9MhhfeEJPVmxef0HVO8zh+TO+9wORRHVbJQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(478600001)(6486002)(66476007)(8676002)(66946007)(6916009)(64756008)(66556008)(38070700005)(71200400001)(66446008)(76116006)(316002)(91956017)(966005)(41300700001)(33656002)(36756003)(86362001)(2616005)(6512007)(53546011)(6506007)(26005)(5660300002)(8936002)(4744005)(2906002)(38100700002)(122000001)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/8QPLr7wZpc7i3XdPDe4fDAdoAuuJam8lTDOgKooBKJF46Ct3X8V8t8p59Cz?=
 =?us-ascii?Q?uAz08oL6y7ypIUdFY2vUAdoNd9yCUFiVydVnFkCG9ml6tVw+PTweazOXjU3A?=
 =?us-ascii?Q?PTEmPyK1qRS304vOctEG6S/EuuZLpJthECfrEYM6eNbCMm21S8v0u0xQu3FN?=
 =?us-ascii?Q?RqifcgYb4h0ZNwMbIo3zBDN+qdGjc8o6IGkH8RjoJU0HMXD3gYnvjIqsUBd6?=
 =?us-ascii?Q?+OfnVzubQQtJq0kFEeSpikirfveika4FVT1oyk1eyK9Oc47XQCgfkZtdgVKq?=
 =?us-ascii?Q?LYSllqaNW0FIR5y1TwR7HLG2XWRlkokxLBP+nXmwfn/TOLU2N7mkpde8Gks4?=
 =?us-ascii?Q?K9Hp1veRb/BhzeRj/GmiH28LeTiSVMlVHsPsYR4pdxFARAaSPz759erH7ELY?=
 =?us-ascii?Q?1AdxmCNuGF5kgcPKDcS4uTT4RevtVQk9KdrA8wMa8ST6jai+1L+N9KVRcFrj?=
 =?us-ascii?Q?bT8y/nSYzkr6Zv75BsALDh2ZiJd6m8q8pW/mhDHHziTro0XowurO5TXexn1j?=
 =?us-ascii?Q?VZYm7eaR1UamA0i1ShjHt5QYQ4ceGbcGHZAIjxMO4YEsAq0eMIKVLTKgSp72?=
 =?us-ascii?Q?UbA7G+qhIpSj4WtvJJJ4K+LIysx7FeX/tz0KFgIkAZS1mIhq02Y0rd3vLgbT?=
 =?us-ascii?Q?JmGxMLEHVhgmW7x3clH7JdznoA1L4t1IYbANWUPS+6OilD5syZ5SVgxZMm3J?=
 =?us-ascii?Q?095lyEXvlbIuD0cb3NvbQNWSvKA4T4xihEis4+XMcBkMWO1CTiOZEs80xHf1?=
 =?us-ascii?Q?s3RaaC5Oa2Oak3d47EIgTrCI3ebn74j4XjO8Fb3Vn7c7o73fo9VvgEbxTLjh?=
 =?us-ascii?Q?miIpHTiN8XJiV5O+lQDPuHgB3SiAS6oSTESXkJubc5kRr8xCRO3GIWLgRATG?=
 =?us-ascii?Q?5kz7PM4NyGNkamnJiv7vC8ayCyVQG9NEv2NJREraZ8AbBJFDLAYnzA+lHh3e?=
 =?us-ascii?Q?5/Vztxizh2IbWyyK1leL0DKY9Uw2k46Yqq3BDQgHIOGj1te+BhBdF/qUkL4+?=
 =?us-ascii?Q?wdBJxm6vwX2IuWMolv36cYIHecFeq6TMpND1EIFtS1Vr7321fpz5B5OdCxK/?=
 =?us-ascii?Q?PKnDmKhy0rpf5qHTJ8a9uzGMZaEWf3ONiM5KgUL/Vqbm/Y3g41bYsb8Lszt7?=
 =?us-ascii?Q?0lhWUzgECrJCRqVVyjq8Hf+DVPiOUrf0j10xjObOGa72xw4ic37lqCuuvJEq?=
 =?us-ascii?Q?Jco79Mz/ELRFVygO2KIh/snhcd45DUeNnRx1CqMPxK6LSGHNj+7F167hMchS?=
 =?us-ascii?Q?pI4J/igWHCfIFfIv2SvbuVSKWadkQO5QDysezgGNj2ng8fC+X9q4nqKPDJqS?=
 =?us-ascii?Q?vbvf2SSJyqy4He3uhLqspsDoKS5kowBeKGx/dpK1F4LwrWj3ezZp/vD7oOus?=
 =?us-ascii?Q?/nMHXUiKhXd1fHEHaVUKhzUQ/qPJSIUo8xEnF9Qmjo2rfsGjyE/S/Q39x1K6?=
 =?us-ascii?Q?upUhlNkVrWaWmr05qp1RG3HLFyuthIjWCosJE6ZvPhXszbl/hCBEiFdVtrX5?=
 =?us-ascii?Q?krIiPEAE+OYbrSx6gzk1GZWOreRG53Bh1ptbYuKN5ANcDy4vNfDMMOhhT+Hr?=
 =?us-ascii?Q?bQ2kop7m8T6JSZQ1vyMrqDADYseRPZsO0k2cbqCUktE3Hh+Xvq9MDSpOqPuC?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <004FD1F650157E4E925D21E6BF5C1853@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UXGNGYh59FIz+IRldQY0yInQTQiDjmiD7pqUIy1yKnRf1IWrXz7KG/3ju9b4hYZX8lmn52tl/OZez/AHFGo/DWBmkjb9GReQWkDjLJbm35h16AjMeBfWo4SjxbVc7NnizO2Uy6oo9cygwbm2IpIPopOL57nwfP0lHTD9loydJ1HO6LNimsDkG0c6Zltykd0HMr1RYYXGW0DhIW6ISGRg9D+P3cC2BZ7kEkMX2LjhCv/Dh1GHXX6kPjTq7JUkYeewNLa5Mh+PVVvbMYFJ/ZYdNClvgqITe7wo432jq+xzU58+enhumeABOHXn5sHGb7l79LZYFKFzOiIZJ9giA5FarTU+4/OuT5LvWSaPx8W+Unbl1AH583H0VZAGMjVTr/ZhckGFmu2QmIhHWJaMtTaz9+hwhRsy2jiFoTX1l5czKGLrjby1UggEbWzXpKTDA/W1iVftm7a6xb6Vi1hNZ/tkLHViRY+r5K1r9P3cIniiI4D3LZJMegaipLdb/bbEd+vFkyhS9UFxpmLseDIsgd8HoKaDRJFYrRMjjDWtKQQIhOmB3Hw1Qx3Ic2jdXPqyjGYq8WFKUIctOwxSbEOWttjqCuRzIsCdQeGevEBkOAv1sVuLHC+ZyeG8OC8sMjyhX8JIDdag7qafPn6ySPKP/0GAzibopsih8L+02qIb/67IgelpE7XGXVQwxW/ZivWp3FM2LPGt1pG/FNEt4jaWMweWG0zEb0iWFoV1P3cDDp2mPrTcgccax4UfuKi8uw+xHbPYOumm4NOd+WxtIkBXGECUow==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc9262d-5b39-4ca8-7bae-08db39fa482c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 19:32:11.8105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jxq4nBGmaIwXpxNiyyNSzjgVBQCoYcqyUP9uBsRaBzrgrcpmf/BE7ZA2gSAHtkEI/pfXcjLFLcOIKj+SlDAbWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6382
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_14,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100168
X-Proofpoint-GUID: bDPdzMiHMFnK4-F5Q0DM0JdyftAbf4oF
X-Proofpoint-ORIG-GUID: bDPdzMiHMFnK4-F5Q0DM0JdyftAbf4oF


> On Apr 5, 2023, at 4:32 PM, Chuck Lever III <chuck.lever@oracle.com> wrot=
e:
>=20
> I've collected recent fixes here:
>=20
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> Tag: netlink-test-20230405

Hi -

I've received a couple of questions about next steps...

I'd like to post a v9 of the handshake upcall patches to netdev@ later
this week. Has anyone got test results they'd like to share before I
do that?

(Please pull the netlink-test-20230405 tag to get the latest).


--
Chuck Lever


