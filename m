Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E59464
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  9 Mar 2023 14:41:22 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3297egTI018301
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 9 Mar 2023 14:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=q6VdvKmB3BPUz0H4RYIG+Ill9+XvcEMkMtrqZHnWxLc=;
 b=nmZeO3AzC2PTqZeiAhklfLOy1xkm4z9acXib15q+CG5LTOLgtsbkvFvo6RzF8duaUDTV
 212Wu/G84OdsTYDjfeoEMh0ldrmdkQWEFC6J3FH5YJeGpvk7wvz7Lwx9VIO6HrZWECVC
 CyhMLizhL3q9Q5F3X3kuWpS+BVtAI43bqLW8WhDHhMcSymYoakDifFQMarYMW5En1PWK
 fXJHqqHSluj/4nGJM/hYERWKk7A/sUTNiW10jeL9MOLdwgDi3+AFD3KoRXXgjq6c24rp
 FK+SU0GuNgBTQv2X8CBYlYQi5Bl+DTFK/AltvT1qfCAyHyfl14NpkqGkZeNvU8A15yWo Vg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn97608-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 09 Mar 2023 14:41:22 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 329DNBC7036420
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 9 Mar 2023 14:41:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p6g4732xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 09 Mar 2023 14:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfAEFlHNzA3A6cisHhcOIx9KahXtquORMZYf+bKvwJsxaIFinbQA8Q21QtotyBhlctJmNdmXzfJU0F4NdGu2ndxQxbenNr9h7t72GxAS+FY9VCyYGfJgK1lcwQaj3Zzn6d41Six012AXs34oanyGg7qtUNtLuN4dDt5dvo9VQt6yhXPgS07kQS+SJxZHh4mXvrL8Y/ffWwxbHNbpxtM+mChU6qcXTqfqT1nfW72cnD7Cq6m5/SMcDsHYquPdEDUL4AaugD0i2B7+dG0hfT+kwDbe/d54AlIckLL8P4JPTrxS2psAsx+5PXlGScQ6slHJiFpA8RwilCK5ChwugebnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6VdvKmB3BPUz0H4RYIG+Ill9+XvcEMkMtrqZHnWxLc=;
 b=KP3G78genocFMokD3/X2e9rAMGqoMDFezKQvrifvnppbga3XGmrJFgMA2h2U4eev0EGBZ+5agbYBflReOjcFc6x0UP2K1kkiG+dbUTYMWORzkle69FLA4YDDDiZYZV4C0OIPGPLTH4lUf097T9eJZCEqzX975Ivs/87AQRGtt5R/iWR2xB1XobJ2lXZAObYtpCybo2r8XkTdjNajpaNmkICPjha5SJ4ile0mF6hzk6YrjivsRHuADTBQrDOgWk5iSdqjZal4aUZT4IvBxfLJM05moxu4NGgcYlKm96samlgTMPzuIwu/41gcvyeWGfcJvxcmTsvurBy0GpSAXzp3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6VdvKmB3BPUz0H4RYIG+Ill9+XvcEMkMtrqZHnWxLc=;
 b=OjOyxbBGba2dHYjySle8ctj8Zfp78jOeK1ZNTfxkbKll58TwUZ06aASahRFf9gZ4HHkiVolRoZrQErIQv74aA5TiEeOyAn8tC3Rin4RiHIPZ5GNv8CqU8qqyvXFDbsImEWbaUAfxJ0IDSc9COJ/c7yziNCa2bbqW6NGP740VOPU=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 14:41:19 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:41:18 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: pre-release of v7
Thread-Topic: pre-release of v7
Thread-Index: AQHZUpU1lJpDPWkMHku89BG1i1DaTg==
Date: Thu, 9 Mar 2023 14:41:18 +0000
Message-ID: <D6172FF4-D42F-4677-987E-D0B80326AD11@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB5117:EE_
x-ms-office365-filtering-correlation-id: fc2d468a-9125-4b45-d292-08db20ac582e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Zobx8pzx8G1hI9ndtDBjXCkr1P76mCB4VtX6Jkh5G2Ti0aYbZ8JJd7s+3KHZTv8XgMhTszKHWgUjDeB9f75Z72Nnju968HJK3jksUFJ7ZMtVurQkUb122f9T7OFmQ2Uw4oLy1mlBb1I7CdUtUyjhplUniDzwOx5OhB02jKJpQD3xQ3IsNp/b5ZRYeB0m9zy6QA8IM7W5tedn25Tjp5U5vb65DiSEMk28608wsnY2DaZw4tbZ+a5CFsIb/2fDSYbD4XoJms7bN7KO0pDMBCkiUEjuGcXI4VIuPJzMp9gtiHRdUSNKvSVmvb8esyei7MNicM/7U2SSwBsMXjiS6cA2fXfhYkEL/ztosKqrWcU8B0j/cnfmDbWxukB8lrCU2F9CH1BXsU/Sa008JhDWBJ7R+IVzYT9R8lBGosfZpNB0tJfPk9q9Yv0s+hWSbs6N5GngQhW4E2jllLGdLLPAjrEpBBGN/cxJBgl8eXIcWG+yLcM9RayPNibJn3SFNSC4OcF6MO/LDbApOjQjX0Ue8+dCsI1TSn0CSkiPCgxpZP8a0ow1cJDbGsPor8wce3Lzs4CWu7mwlXZFcdGK3DJjlDDPPrytNPfc7wWPQRzihJWXTwSM9+oUCXv6UWrIB6BnIoPvldP+CduZz+I6y95ziHrhKAbn6vrxTL15do8vZbuf1j6l0Y7bRTUyvSE9ssHo25XTVSBQLNd19vSULCKaVvSTRS/lIR9x15/u49Ci0JHwNpiBYWEnGJbMOw6oXGDZRcumDGTnV6KCqe23MlMxgyqDwg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(66899018)(38070700005)(66946007)(2906002)(5660300002)(26005)(8676002)(8936002)(36756003)(41300700001)(66446008)(66476007)(33656002)(64756008)(66556008)(6916009)(76116006)(316002)(91956017)(86362001)(71200400001)(478600001)(6486002)(966005)(122000001)(38100700002)(6506007)(6512007)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xbD78Hz9zkIJXwWJO5nP7vEzXjCnFT2pwGcPyWfcKTUODM0vkkRZgeJ1tBtv?=
 =?us-ascii?Q?chsIicHfe3IYtaf2z6Srkiw+Xq2XxGTPNLTzfk2L8U4614yuGUkBPlJHgQrZ?=
 =?us-ascii?Q?CdMCH9QV5ZImZTXf9vpDgfO+F+PEjrQhSZZwmwGHs7kXyeStQ9E/BsH69pbf?=
 =?us-ascii?Q?RqVWnRwV12+c47loGEmoRz+vNtsvBS2LZne8iEsVYJu3ji5yPJHQumpo9riS?=
 =?us-ascii?Q?snrtZrIIn3DzkRgyDURlylCgGMgVKQtPTm22LAT4LxFCGkMHtgdeRScNKlXE?=
 =?us-ascii?Q?BjTT49VM/c6o8/Wce3lu/PDuqhnnrRU6P7nuLpPs3LLHFB97SLkuLghPjAY4?=
 =?us-ascii?Q?T5Bvvf1HC58T2XRg5jhqYk6wS0xPWlYZDHvlfR9bdjGSD9tHd1H06fPzTHdt?=
 =?us-ascii?Q?BnCdiNnEFAzfvfPWu3h71OfiRVTzWA5/OYT6ve7aECb9xXlr84Uy9kpm6sp3?=
 =?us-ascii?Q?2T7njUt39hKrQNzUpqiHP7jlGPubwGPFNdxqiMvez8nap81RyhgIHrnGqRke?=
 =?us-ascii?Q?aBZ7CTvq0bbhAFehiiyg9AzyZpIT4R1XC1oMaAyDnAR64JPnNWl5CrmD1ckN?=
 =?us-ascii?Q?EzXBhuJJ92KXWCYIKapqLYkGkjN+GEnzWR/HjOQ7mgAssaFbSLkFHzptUvVZ?=
 =?us-ascii?Q?4kruxukpr0f9Sp4E2J3cMlry7T2gPFScwNG6ha11Qom7zz1LcdqWQWFh9iL+?=
 =?us-ascii?Q?DIrm2PfzuQlh3OC6L+6H3T0JgdoYYnUDoxbOvH7iJqdSp647Dp5Y7UypNB/l?=
 =?us-ascii?Q?piZzyRoYh83keh1mWcRygFZLImBXPOhqgigIt0In1Ra4Dq0vQDslIe4zMJGH?=
 =?us-ascii?Q?Bez8n0mZ+x7WYqJ3vo4Y9UwMlr+HH0kKEPMRvURlnc49Zz90IYgpCWiFVf2a?=
 =?us-ascii?Q?ggSwHKqo2v0jApYmG5cs1nRW8itjkHBCHt31lmf3/4Ub3HTK2Ir1jQDBspRE?=
 =?us-ascii?Q?cTiggVpDDfpjCfWdVWlwgmX1eWPrZBmazWF4O63eYL1db4uilf+tSaWFvT8O?=
 =?us-ascii?Q?o63RgIja4oyrb6euY6AbC/ElKywCCvPGf8PNzL3FHdQGaErTraDvvzRNiEBW?=
 =?us-ascii?Q?GaR3uREoxkRY6fNsjX8Qylt2pqbD3knfheByKAg08b6EzZNK+3x9Dh2t/q4j?=
 =?us-ascii?Q?GaNWE6RdeewjgV9BYlnKoYMevusb1hFNk3pZykZ8UC6Q2NsUQojR/pHe34uT?=
 =?us-ascii?Q?VvfGaQTcLLzkajxPOqomG7/V1nwImktdgPym8mqHLtbD3qfSZ8fbfeXKUEcG?=
 =?us-ascii?Q?FYOtdt6yvC3S6T2K1yPxVCBK7XsvYH97u8Z14oUolymuHFv5xaLaA8Wz9Z5v?=
 =?us-ascii?Q?gnZjpWFk12du7YNu3b2Zz63tJXJ2ZelUXyseseFTb1XVTlRIiklAOj8OppCg?=
 =?us-ascii?Q?NYnVEgGG2EZA6NEG8++/SgwbeQaWi/Zvie4FlDkj6mHAvsghoKlt7WaEzgZQ?=
 =?us-ascii?Q?xCuuujkfvtrOMkP/P4gAEogO7mpcDxIwpNQVMIxCPgyY74kkkW5KRA7h3T0i?=
 =?us-ascii?Q?3dn2qGTYVHVe1KUMelE0x7cHa8pq2KcEjGCvbZfeCZgohAsV/NUmoZB+Mqtz?=
 =?us-ascii?Q?FyAvvWuq+KivSPiIS/bS9kjg0rUpu2TNaed0o55UY4h4DHgVLleEaJzcrOvv?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <836F496A1276A24586660C3B4133F8EB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HU4qt1pfl+HFi1+4TjTkJgX9ReYbW/aZ1lruBvFSQ71M9pZnIUIS0AnUEq47deJrgeTYacYi/2ptW8FffQ+7QT0q1rhxlxz7hz1EawYvdj7n7S+AR9IZMsyHyKjpN/P9+YI4/RuQXWc9tyke4VXfbvFagP/ovfRO3l4mURxtLhdYmDL+P96c5o6kD0RfJAs8AyL+58bBJtNiQWOjTIPiTXcser/CvIALUyZFGP3X3mTVRimWNxYb80h/JMhOnn5O55Oa+jA0iKFf2n1UGwbzyVLSIYPdIFTSNZVVw4idJnEjEwc/j8E4sMEvkTcBenE7cM1os0p+loAwIUX5Vu2zQWt87nMdnCaYkL3WIyagx+crSKAwTabkbEaicocnyss80TAof2ZRiY8fLtFSDxVP55Ml/x6gG5TEg7gOoLEsHVZaoFvGK/vgIbYr8hRC2bB1/jaxRExadPdHM8Nf9B+6UBKXXYLDpxAKlCEv3VGXv/1Ra8KAxN2BiMtD7a7kYwPVBOYTRZRIMV53Ivboy4lXhGCAZnQXURpDrl/Vm3qFn9Gb48vUO9s4lfbdyx0rxft1ZKDV8AIEIKbTTZkkb/gM2IzTqYTQIoKic34zsKFWGYcB1uSxlaOp247YXsaOGDSopqHJdlZNE/Z5bCAsdMfYjDsS4lP3kcG6urSMtvayfAMJ8Fd2H9sUH5xNF3Fb38CTcfnXGobYzS7tgsCrHJBzsBW9HVECAiAOswpn5D88H+FJC2Ca2RD6P/95BjsIJtdK
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2d468a-9125-4b45-d292-08db20ac582e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 14:41:18.8359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lTU1J8v2a/qs/dlKi+nroWkYoqvxrXTN2ifO1i1r4zlG5a/7vrYdgmg8KvdfKf/QqZ0LKj3PruqKuKpo11o2Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=430 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090117
X-Proofpoint-GUID: mXwgEu39Yl1xBxG7FIli6Ez8_2dZ9H5C
X-Proofpoint-ORIG-GUID: mXwgEu39Yl1xBxG7FIli6Ez8_2dZ9H5C

Hi-

I'm now trying to take a step or two towards a more typical development
process for the kernel patches and ktls-utils, as we replace the old
upcall mechanism with netlink. This is in preparation for a release of
ktls-utils-0.8, once netdev is close to happy with the kernel part.

I have pushed pre-release branches of v7 so you can comment early, test
it, or send me patches /before/ I post "Another crack at a handshake
upcall mechanism" v7 on netdev@. What a concept, eh?


Kernel part: The upcall-v7 branch in

https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git


User space part: The netlink-v7 branch in

https://github.com/oracle/ktls-utils


The one thing I'm waiting on now is for Jakub to deal properly with
the license and copyright notices in the YAML specs and generated C
source code. As an old SunRPC hand, I feel that the code generator
needs to copy the spec's license and copyright notices verbatim to
the generated C code. Jakub is not certain this is required; his code
generator adds a license notice that is sometimes not compatible with
the spec's license.

We are planning to loop the Linux Foundation in to try to extract some
legal advice.

--
Chuck Lever


