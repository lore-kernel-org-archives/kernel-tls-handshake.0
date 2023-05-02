Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8C33C0
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 May 2023 21:18:44 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342IOI71004679;
	Tue, 2 May 2023 21:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=uLxKpCfhja8EXcvsaoO+zDvvFsVgdGMGGr3xICkKzu0=;
 b=VO4bjh+jdsMLJe/c2Zj17PLGjGIfYed5ealMvADE+dQ1Et0rQ1SFC2R5fXYU7zwV/DDC
 rf+bZEKMcer7IasGM0Pf/M8Rb+1pskE7MRObmMW0pceUjZXPmrXL5ZvlV1OWbzSEFpki
 cMzQwUrFVBP/ZYGuIso2Et+8AcIl45htQC1v2cRaxLPYoraPBYLuBRA807zojVtMxsEo
 OS7qorJ8/Ik2j5RKeq36g+xTabHPt49fMHk8XgssibzJJeFJX/QBSSduGWptBlHOS+Xo
 ACogJMwb4Zx+zQnVPsllSEL3ML8TLqTJcf2gV4tiD+AvfWZCTlKIKae3uxq9fOPFGDUN Mg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8usuws3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 May 2023 21:18:41 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 342KJE3u027417;
	Tue, 2 May 2023 21:18:40 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3q8spcjpd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 May 2023 21:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miIqa/2rPKHKNJYxaePOtWEoAkeFQNUy9ddzbEe7lqdpqd7olRouPCFu5yxDGt3ZSq3l2m079UAxoQzcd6FFlHJQPAsDE5q88Q4mLsTgDZQXamPpfqbcZo/KNVneZo6S55mKeaYV4BZjNzLTDgNpWBEMSJIoa5rExJqW4wwPAAweDz8jXjrOkbQUtqjBnbmQokbLCuTO+RiuOzyU8qpHiNGQWz4/DMtD6sU26tjGkUCrmiPvRGkgJGoUpUK9Qmh+he1+SdYBn/XDM/mGACU7gkE2cRs5sD5f3RTTTK6QMSFVOWgT1C0ZkhysBa7BSk0fPYn361GRH15AzxB/xR6kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLxKpCfhja8EXcvsaoO+zDvvFsVgdGMGGr3xICkKzu0=;
 b=fEB/6Kwgiust5wBRBriufvhm/vkQ/3QDvdEtL7QUWfu7YbWaAgndZY4qIb7oa/nY5GRXQY35DG7VJXzHWGE/f8p7VZgEgLzf6lD0MJuCWJJgEH3gzGpzwmd9ZMZ8v0jD8NFMFjXViOu6zjCGJgI3WZ/Mpg1tzT03QyxQWltYzeuYxYUK9b7maFHKlh3+ipapkJLl0yQclFyF63Q7JCoNVyqIFNbWPt/GTodUnLuEK7667Uctp/ZWX48rHsmaMBOi//khHcJAxAffc92Idug2H4oZFn0XleymFfXKqkSaleAuAQfdwGHZ3R2oevCVRX74uJuo3LRQ61qlhKMcUTcCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLxKpCfhja8EXcvsaoO+zDvvFsVgdGMGGr3xICkKzu0=;
 b=VWEFgrut+ZNHBKgnjOpNNUjKwvrxQfi1p8IEPsTNNdXWGinndOe1RVP0oXEeDpmzrJ6USh1b6qFz0q3YeC2krualWS8E7BrJdqyc6HPYRDEcNEqAScBAIyN7CHzTKHVx144L/8BnWd5MmxsuajsWZjBah2dmkUb51pEwW8uvfn4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4624.namprd10.prod.outlook.com (2603:10b6:a03:2de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 21:18:38 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 21:18:38 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [bug report] net/handshake: Create a NETLINK service for handling
 handshake requests
Thread-Topic: [bug report] net/handshake: Create a NETLINK service for
 handling handshake requests
Thread-Index: AQHZfMy9jGfzx7nyzky7aVs608Ju9a9HfauA
Date: Tue, 2 May 2023 21:18:38 +0000
Message-ID: <FB3B84D0-2148-43D9-A0E1-153718BA07DC@oracle.com>
References: <f4e2ebae-c40f-4267-84e5-f3944d4d7f9f@kili.mountain>
In-Reply-To: <f4e2ebae-c40f-4267-84e5-f3944d4d7f9f@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4624:EE_
x-ms-office365-filtering-correlation-id: 90311307-0e27-4ab4-004f-08db4b52cbba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 adonCTZkyUeh4H2nrecvkmtFSsKiEvKb82ae9XElCouHq/hKCPgh54TY9VgZibUT+RNXBuQHqvDkcPW469GaothM8JvR+m5gxpUir9EDGVtK1/EU369+Mkb9Pp3UEIhNZnbHSde/ZHC5SuGxHRJgLGtElNGnod7MIAK/oFKGvbZ1M7a/IdEw/uH2YQP2/cgNksthb4U8JQ+PhPjE6hz1QA5AukO8iqIhjUTgfd0ndYUkuz1GuVjs17MROpowDwLchSfLZ5ij9OUcsR7a9t8g7g+IawHmr2I3rLXbZky7KM86rwcxyIoAhoqac+XE4+1MpjSdHAbd09zhgtjGu3ta3NcMkdtZ2K3FpxKm4r6kvePI1SSDzpORVD/+xaBJUmtS+HQ90/N/L6k0ksXACu2KS+mKrN8wH4xSHs3DGIaz09/RvL+6qLcsGsAL+sNJyRI0npe3+fcdj9fOJG0aMt5foX+7ZD7Fiadelt4vBuliN1u78vUGshqu26AurdMZfdpKMfON92CwCdiyMz2cGJ+vyPFrXp84fGyxMm5eef8X2h+wQ/avP6FNO9to+14aA+O2CbHpCgfyXNxA7j6UtL9S9VXeJWL5l5avA91OoZuGb7txSNG6xx91z4VHB+Er/MPjU5RYxajmBjErz+dwoP4NbA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(478600001)(36756003)(316002)(5660300002)(38100700002)(2906002)(38070700005)(8936002)(8676002)(86362001)(64756008)(66446008)(66556008)(66476007)(76116006)(122000001)(4326008)(66946007)(6916009)(91956017)(41300700001)(83380400001)(6506007)(186003)(6512007)(26005)(53546011)(6486002)(2616005)(71200400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ob3QtPgI6NSuBUvEHF4bygDpaG2tFuDJMWssaqBPauqBnbcKAvgURLlXjbvG?=
 =?us-ascii?Q?8xBA0ZWapM0vOzH3rebbj4zoTzF0W+VoLT7xijUxpgC7n9285EQ9CbXFu8lh?=
 =?us-ascii?Q?EvCv+TjwcZ7FyTVr7QbIrySJdokFQeC0V5UeY4us8NV8Mwgy+Q80rrnlkuEh?=
 =?us-ascii?Q?xjMHHOFw5XEypM/EHThYijya+5t2RMho9gh6KIexBD48EBcVevVFaoIk397H?=
 =?us-ascii?Q?pbSg3kn5qrgmz5lGy3fZP1R5anfnWipEe82FRhosPFZTUVS7WayQNlw5tFXY?=
 =?us-ascii?Q?dESro90xSv8GIlr0TWPLLtOjZzKuNHkSpaqUoTxjfvfZoOFFjbS+d48UmUdv?=
 =?us-ascii?Q?C/V4e4ugrZ1jcUUZ0ulnmBqN0w1MBbionTTOLSBySYuLFln+yz91P4a0LdfP?=
 =?us-ascii?Q?eSaOeeQmmmF4u4ehIqYITiyvpik0xwZeftFEDQ3HVAsMHe7VVpkf1BZzAGE5?=
 =?us-ascii?Q?m1BBYTgkcGsppjoCoDrnvyGSPogZibdqecJ1z+m4ORQeCRE2NrPZVb8kcrCC?=
 =?us-ascii?Q?0LFGBBUUFIxw7W1Iass0AFtTDxz5P7Hg/O7+5OHzjOrkabGUm3Nj1vz25t9j?=
 =?us-ascii?Q?HiJNXIPdi1APji+oZ9U0PaWniiATze2VAHsKhMGhqEOsav9G2XJnHXxKs2b8?=
 =?us-ascii?Q?tk/JVKKX4dl164OCLlh1A9AacV3cslRN0xhVLvdltLDDlrIDAUdaejsPSSXJ?=
 =?us-ascii?Q?fOd+AYivihBxx6/geLYXxJsR567VYX+3XmyiBeyHp4l6qRSNsKvlwmmX2ibg?=
 =?us-ascii?Q?gFh4P0ICKjuiiYzJLmisz7ZIyOhEMuWv48k0ID6wlpONnUj85im6xk7zGJ7U?=
 =?us-ascii?Q?O7AnsMLhuL0gqd3xrMgzbKPvSU+JG6TY1OnzACZrVAhJ050yp3xVCtqqtJ3p?=
 =?us-ascii?Q?vjwqrdkPOZ+fq+wz4Uvp0zyVm5rxLrMA1y+hixvmn/GFJ+Sm8kNENzbAaVDw?=
 =?us-ascii?Q?qWsTq7UKXN6ShWQfv3agGpocSJrSB1we3azRZK+nBaEIMdvTPttcXdjbt/Sa?=
 =?us-ascii?Q?M+YEQcmda4tIbLfgRDNpn5H3gkOsui6M66L3pxolkBqjNLUcqMiSlUYjuzqK?=
 =?us-ascii?Q?wHW1rpoL5pRrCYdFnVv6FtnQfl31Wf9p15qI0dzZhpn3wOzq3XWpLnaO8chC?=
 =?us-ascii?Q?bsqEtYuOvd687BHLXYTfu8XfyeFZl2yByjbPW+JhgA+5vvtf4sCwItZ8eake?=
 =?us-ascii?Q?hV4eRWqDOMKY93AH1K+ZRsNfRnEyohNwkpv7Qafh8WrNCS2wKFb7rQPgmHX1?=
 =?us-ascii?Q?Zwaxib6Np5New4t6gAAJD6nYMNzndOKngVoBPr6npHL2TuBTZXJ0hwMMZZ0N?=
 =?us-ascii?Q?El55ULgB7gGZoRCz8L7jZdj/IDAPQaPEozIQ01JNPmBZZd9ZDjJKxiyjeJAR?=
 =?us-ascii?Q?1mdMc8QFfva7+GapCWezxLWV4St5jPk224FoMt1XiwdqtJi2WT0EUZT38QEm?=
 =?us-ascii?Q?iaeAeq/Igb5tCrswUps8Jh8sV6Dsknp7vQ9bk9zMVfnym83/Ug10P92DoL8k?=
 =?us-ascii?Q?tbIPnSCjcPCGCLp0CXMbq1/UScTOh6OWctqYb9Js8XwPl9Zxt8VZWlGX5Tli?=
 =?us-ascii?Q?svFOJgXVmp4MzXMOoI+iiPx1KrYTgj1kMGKzzCKavV99ydz7KdEZFMCcu+o6?=
 =?us-ascii?Q?pA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80E4FFCFE25FED4C9E7DFE23CF68C28F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aMwxe7FP2zEbo2zGzzvLz3Mipv40rrv/t3cw+lUq36BgXn+jNKJoYTuH86JITegHkScXbrTTH/0aAracht/b6+Ze1vwSd3U5QcD86aXX0itZu70IpBMyHR57QD6uFju8zwpVBQ1WXHWouNLMIQ8kz5rxzC6BnXdf0hw1ZtUk3JZyfXWrElY8PuPLIuDWGmyEPJl0N22/Cx5pldH4owWtT6gwV2Q8gJdcelfDbGfPNqBYSAUfgnj4GmOyk3E9lZt2hTaWSQq20024uQV/eGrCO5W4vuM29WYOi9RFa3LtOx7hgbnckIpFTEyvGAlvXLYftjfKd1cBaGvshpaSTDq9ZRmGFY4Ls5FnKj3NU6GqkbQB81IY5WCLG/voTNNCZmPjEaUF7QMwyJEds2sPPUYtdKf6VGBsIIRGoBspZ/s7wjh/qcntQ8EQ5y84vuYgToD/3D6RlpUQV5vhY4yp0J+kf4z6kmonpkon+/Ib0kUiBTnv+//mhAxEiraz5q+nRwxkrhlaJ8LxqsAR6HaP2twzK2hwAewuq/Uq90YLj8fVukomtFREgfx2/loaNpR4KZ+sbTFUG5E9qajd1T/E5VNG0E4gt65iyqDGVZftsveghO4ZLQ+YOYyIN3267gkiqKz759HzHd+GmkAo1nHjsEjZfQdC9qrsFZ1XCYfyZS12lgOk17jV2MITfQvpU6u3GUUFgJlSfI84nlhJLVHjYRPC6rLLlvshyiDOkzdbuAD9ucFjAgxWAknwvHU+gp9jTgCHMxOLHnPW917KLgEVAVeY412an4WqktG2HffRKKZ/dhk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90311307-0e27-4ab4-004f-08db4b52cbba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 21:18:38.0235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KA1tFz90XtbB9LqRHyleAJyEBJOgVXTlSlqJFD5rZ1By/PNX6m4PAGYgtWhfJoUqs5DP6PJJdO1CXVlqUT7ETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305020182
X-Proofpoint-ORIG-GUID: gVU_gEC_ciiFf1ot6m-OdyjtFKaQocXV
X-Proofpoint-GUID: gVU_gEC_ciiFf1ot6m-OdyjtFKaQocXV



> On May 2, 2023, at 4:04 AM, Dan Carpenter <dan.carpenter@linaro.org> wrot=
e:
>=20
> Hello Chuck Lever,
>=20
> The patch 3b3009ea8abb: "net/handshake: Create a NETLINK service for
> handling handshake requests" from Apr 17, 2023, leads to the
> following Smatch static checker warning:
>=20
> net/handshake/netlink.c:153 handshake_nl_accept_doit()
> warn: fd used after fd_install() 'sock->file'
>=20
> net/handshake/netlink.c
>    116 int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info=
 *info)
>    117 {
>    118         struct net *net =3D sock_net(skb->sk);
>    119         struct handshake_net *hn =3D handshake_pernet(net);
>    120         struct handshake_req *req =3D NULL;
>    121         struct socket *sock;
>    122         int class, fd, err;
>    123=20
>    124         err =3D -EOPNOTSUPP;
>    125         if (!hn)
>    126                 goto out_status;
>    127=20
>    128         err =3D -EINVAL;
>    129         if (GENL_REQ_ATTR_CHECK(info, HANDSHAKE_A_ACCEPT_HANDLER_C=
LASS))
>    130                 goto out_status;
>    131         class =3D nla_get_u32(info->attrs[HANDSHAKE_A_ACCEPT_HANDL=
ER_CLASS]);
>    132=20
>    133         err =3D -EAGAIN;
>    134         req =3D handshake_req_next(hn, class);
>    135         if (!req)
>    136                 goto out_status;
>    137=20
>    138         sock =3D req->hr_sk->sk_socket;
>    139         fd =3D handshake_dup(sock);
>                     ^^^^^^^^^^^^^^^^^^^
> This calls fd_install(newfd, sock->file) so we cannot trust sock->file
> again after handshake_dup() succeeds.

I don't understand this comment, or the Smatch warning.
Can you explain more?


>    140         if (fd < 0) {
>    141                 err =3D fd;
>    142                 goto out_complete;
>    143         }
>    144         err =3D req->hr_proto->hp_accept(req, info, fd);
>    145         if (err)
>    146                 goto out_complete;
>                        ^^^^^^^^^^^^^^^^^
> This is an issue.  I believe it's better to leak the fd here and let it
> get cleaned up later when the process dies.  (I sound very confident
> here, but really I am just repeating things other people have said, like
> some kind of ChatGPT nonsense generator).
>=20
> if (err) {
> sock->file =3D NULL;
> goto out_complete;
> }

That field is owned by the API consumers. I don't think we
should set it to NULL here.


>    147=20
>    148         trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
>    149         return 0;
>    150=20
>    151 out_complete:
>    152         handshake_complete(req, -EIO, NULL);
> --> 153         fput(sock->file);

The point of this is to remove the reference that is added
by handshake_dup. There are a handful of other fput() call
sites in netlink.c -- the idea is to hold sock->file until
DONE is complete.

If anything we are double-putting if get_unused_fd_flags() fails:
the code invokes fput() once in handshake_dup, and once again
in handshake_nl_accept_doit().

Perhaps that fput() should be removed.


>    154 out_status:
>    155         trace_handshake_cmd_accept_err(net, req, NULL, err);
>    156         return err;
>    157 }
>=20
> regards,
> dan carpenter

--
Chuck Lever


