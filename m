Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E376E749A
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 20:01:31 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335J6BLM029014;
	Wed, 5 Apr 2023 20:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Gttxf+CqJQ/zFtRV4mVyTi/WKZH/dfqok5y0MNtc21A=;
 b=mpqvX1I9NNnBP4KcZNPY+GE1FyWeppMDPSbQfvqtDEbthiCGT1GcPo4ZktBiGYGnRXqf
 Hx7zXUDr1PGUTRm6gooXm9xIGXCh1aUGWmilzSkjKsvoPcLrjTQ17pW+V/T1dV1/5a+h
 Y0QXtCBtjMn+0eG6Y7+t/zkdFa5+xJJoDNmWtuk1RbZWu3qyebcFHAfWx8bwAn3udg64
 ybGGHjFHg9nd/M8f2B1cAysRC6jROtRcUOGctMtQuvfKcgFMbO7NdDlmzjKhmn4/jzBl
 6lldV/GvWRGG5X7yoREM3UahkPo/mA7sfc0yniPwytodeFiDqLJzn+CRAAr6rW2+Ovla Tg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppcgasat8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Apr 2023 20:01:30 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 335JajtS027965;
	Wed, 5 Apr 2023 20:01:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ppturvfyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Apr 2023 20:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O78iNPdVgGmOKjP0gTyEAW+WzhoOiYMQZnc4r3hKx60gNwDN6sXMS0R3sAcCpHhuL73Lfyw9LsGAQmFy1E2ZE0oxDKaDrCNhcfua8rgh+cfPvNs1huproaplIwbnDRiPQRvXzP7dEn9o0wdOvvD1Ib/3ZErNMDG5wckQrr9CEuapHk2/oc/cHfHSk65Tk93EzS5PyI64s9TORIm7Omy574GsR/F2QQ+2RWI96aw9gcye4LfK3+kz3kD5uRNUV/isQS++8c32wbK7fG6mHB35fLnuteMHbXHrghoSii9MCtpAyUUY1xDIQLP9bBsKADB2sR4uaaI3tzMJ6m2BboxvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gttxf+CqJQ/zFtRV4mVyTi/WKZH/dfqok5y0MNtc21A=;
 b=ZS/IHhZ3JAgoQU5hxu2y6MFiXjN1EmxJ7gGKlAv74wDChNjsM4SUIPD+GQ4FEJQUAtZKphTuGV1mGGqLeYxmZ0maQ0+t6yGMv00tQqIlfsV0GH2ni7O+wvLk2Op1HZ7fSua9hauiGOjAbw8D/b9YLEU+Ufp6mivTH76YbpYc2Pz1CUXsmT6q0SxPur5tfjX3Mh41ZqJTbNtJxPd41XTrTeFy6s1AYZ8zhnVx8LGJebs2AW5vT6X3vhmq2c/x9X9Rh2+/RMCxSdsZP4jeOVznmsH0aUNhwq/+TLP9J2NSBcXilP6ib7IquBGgHcgR0O94f+VoA5pXlc8T6yly8+dSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gttxf+CqJQ/zFtRV4mVyTi/WKZH/dfqok5y0MNtc21A=;
 b=E5T9rv+Y/0kFTwEZB1QPUgsoGaT9LHHKacBKQZ/T8mcjgwTPvSYZg3Ykg3AavkXzCLs5IIsuvc8naeWmS/YKcj+ACiMv8c2pohn242Kt6EkU3IwspM9XGVjlHcHIHdAfOQbC6D2fFSggpnljWmm4emUoLJC/NgcMLw7aU5smhJ4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM4PR10MB6789.namprd10.prod.outlook.com (2603:10b6:8:10b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 20:01:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 20:01:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: help debug
Thread-Topic: help debug
Thread-Index: AQHZZ/ZlL7DmTJVADE+ki2LSsW5lZq8dItUA
Date: Wed, 5 Apr 2023 20:01:26 +0000
Message-ID: <D54E2E36-ACA5-4596-9B9C-087F1567FEB2@oracle.com>
References: 
 <CAN-5tyEhjsMW=GL5WJue3qPWx3+L2OLFxXSDzbH2y4e+aUJ23w@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyEhjsMW=GL5WJue3qPWx3+L2OLFxXSDzbH2y4e+aUJ23w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DM4PR10MB6789:EE_
x-ms-office365-filtering-correlation-id: 83bb58b0-e8bc-47bd-cc93-08db36108a47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VNWqO2e6KYpNZ5oUp9UOtuXMTJxOIqwzgyAqUVWWEhiKgO+0W6r7TRmGmgQc4iuS+9LRCeeMJdm+WSenLBYGedMO2clAOqOFivhFD4kU9kGZLnGEO+bsBFjNVMRIjmzWlpG3c8JyusoFqdwcG91nrzFChxrm7eK0IwTqhWyftqGkrrp6hmXj5C5LeNmaWiKYcmpN/7vYX9Rnr16EDlw1P14vQWOlljNMJogJccGFGuQeIdBuzapEXQVAsanHQ6gXGb0FtS5NhgY05V8tZXhNiCvM/oefe5ne4+1A9L1KYcsduM1JB6tHUaJ9OGDTVFPfq7ECChWmtb6NfUKwe7Oe+nCR2U6U/TVvLq4hPSlAxS5hjQ+Ejgy+B1iS3TYZsfRWBnBW+RGN09DPnyP7/gDs6ZmfdtMsvdVnHkZhPisDZrYu7BTZI+3eWc2jroVGfVwCA0iIO7qdpKIeAJQdKuaKA3ilGOZt7oiGvgbROD4fdKZZmcrViR6rj2oPdR4M+fx18Irn+WmOdFkS9OLhqltFDrVFIrvup5DDI/FThyBQ4Ur3KPcWCNsXhAqbSbDoqOS6LjP8Xw4+gln8HcSrNgL1LBgQdmeRfZfQwQIjWbenkYCH7kBx+P3SK8KaCeU9SC32HVXw/sU/qo6ZMwKTfYJDcw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(376002)(39860400002)(84040400005)(451199021)(33656002)(38070700005)(86362001)(3480700007)(38100700002)(122000001)(316002)(71200400001)(64756008)(66946007)(91956017)(4326008)(76116006)(66476007)(8676002)(66556008)(2906002)(478600001)(6916009)(186003)(7116003)(36756003)(66446008)(6512007)(53546011)(26005)(6486002)(6506007)(41300700001)(5660300002)(8936002)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yF6vZphDMQG8KcTpIFVQl5KNszZzlPOZddca52SOrVHoK4ech+TaiBmvfMjI?=
 =?us-ascii?Q?wZ6Sumzlv9fEtCKyi23qUEPpiW8xMN93m0wRATCTfSpB6Lw0q+VgH/DiM901?=
 =?us-ascii?Q?xcGd370VBP/VYNM10r0aXn+AOfEuMf7o5odqZ5U0SEPbmjdqzzlJCpwgZLxw?=
 =?us-ascii?Q?LJftEiql/78T7uMwpAdEJwQ7pcxqH1Jgi798NdQIFEhmDdqNoxItxvON1HNV?=
 =?us-ascii?Q?Gx6YZqhopI6ja3bB4fNCtYLn8BkOOFX/kOKb87STfs906cHBmESumWjpbGj6?=
 =?us-ascii?Q?4krN3W4IAUq8Bt8mpT6MTWjP05Al9idaMqEn/05en/XADp+YGzHDdIcbeeev?=
 =?us-ascii?Q?WF6hCLgFHsmD2kF7Scfl4CD6+qBMQrhyK9orS/zTBrD6ZKmRg15higVtvTOJ?=
 =?us-ascii?Q?BiR8OV0MW8ifOHqf5X02N/zvqrz/voj0G5fguptKhIkp5VTTivU/glmn6lK1?=
 =?us-ascii?Q?q1PCI2sHlwuZaI8kW7C1IK4oZF/6k9zCVyvHXikbZrDRie6tDtvToot3h99H?=
 =?us-ascii?Q?qrUHdsLowJfMaSKfU3iZOBCr1c683cOMDbrgsCdqPVfdlREr1oZV9HdSs4Zw?=
 =?us-ascii?Q?hJ0NNL43JQO2TqkPm6vJYqpW9mbgEvNcPlwCANvGlGJJ+vMnMGkfD1aBN/4b?=
 =?us-ascii?Q?lAqdxtumaWU62iXKL2rpGZteMsjkI4OGyZp6O2Gc1Q5z7eCJrzTS2G285bR9?=
 =?us-ascii?Q?sjO4LXwiAojO0SiBM/RtMev0Jr1LDVjC61+y2lV9MJp8KHC1K7mTA3C6vbUJ?=
 =?us-ascii?Q?XHnCfzk6IqDalI+1+xxL/7kHqCXLcsyeq161HiAixKWm66ed6Q+2akT8/RmC?=
 =?us-ascii?Q?d+Z2f/GLTckjUdrxY9BOIrVYhYDrIaR2yBBrsh9XePkllWyDRdESdb/ZJ0QX?=
 =?us-ascii?Q?Y4QLdocHFNt33RmM/+02GRXIGefafG/jJpOiM7kceGZaBVZY6kd2GExjy2YY?=
 =?us-ascii?Q?wW0x95R5zZPuztOkE7ZqEtVGnWXzkIaRN7b9eonv5hwYiqRFRhlMOJszE4ge?=
 =?us-ascii?Q?s8zCB8fp7Mm0i4QMh1jIvCrKIpus/QRnJ0lOSUa5n0I6Ga5BFTOLVAj2Oog2?=
 =?us-ascii?Q?iyrcQu/Cs02+TzNpDsRKU2iEJFQF7YSi3Acfr7Od9sdwuJB/PChLHFzdaK1Q?=
 =?us-ascii?Q?Rgsdg+rqEQGCfUuNveb2BeKHzCVArUOSpcdswAgWqcu4ussxR0WhhPE4impJ?=
 =?us-ascii?Q?0GxAb99B0/SZKBC21Q5/56UGQ1hdbTEoJdIsnY5Bp0WAdnuBJItXrJJ3EmnU?=
 =?us-ascii?Q?HJJIAQxS8UBjNE2Bw0K4DyfVfQJD0CodHQnbLXy9NhAz5rv2ntC+eSzr+8Py?=
 =?us-ascii?Q?MPKEWK4pgFml190q1I9gktDzFKvX6Tfhvpl2wnAOsoEvZz3LgzX4mCQJg322?=
 =?us-ascii?Q?eZohPQLUmJR46rNox9SyPA0jOeO5SCbLzdvFd1h/i/HTHufL6lPPdJqy+CEA?=
 =?us-ascii?Q?nRssqmJ3P0EQi/DdCoGV0iCMzGhpo/1+pgd3txv4L026est4lY4fLWewPqp0?=
 =?us-ascii?Q?yiA2YU4O49rmgf7feik9iNQUGpZTKyhKwoovoG+g+pk63GnYYENxJTK9l3lj?=
 =?us-ascii?Q?q++/OejW+UJheFSh6YiNdDKPR0XEPaV7yOzvUzIFOKy0TVuFgBhv2lcDFttF?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8B18F45B6B8AB4A98DAE9F3DF218745@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UdEdpCUD17cyYpqmgOxNJdYn6mUrG0aqzF34uWe1lqmgWLyJOFCgOTS2T1OnFZvh4htnELYtS3GmdWrZEmD7cGzcMTilMU8vRANPUUE1L8xpzSIhHMhMLakBLamDdFPTF+iUtXfRnkDiW3vtxhgc6P5EEvTEMol8FsfEhcIBTJtqmy1SJfhRjHLCPEX9p5mIqxi7ROX7EHol69lvz+JDTUXl57d+rDyqypnUzLLf9DukiwAkL+pf/8XZFsDgkg31mGpgssZWID1WCwr3KCtkJJioXq9VCbCcybhtKXe2/3GTmU/nc00oj2Cd12XrKuud6Dph05kDZajQ3coa8OvoeG+SWJ3+UPGQjiIHAy1xj6S+T3JSG5YEJx3epeY8nFFty56T6kgS74HdHIVD+2Kydu7rcIBJG9nKUGjpLWWh+3xgQR6Rd+ZgYkuXLbcSrz7thFdbrl80Nlhch7TGTXzVxUtY8uWLCOObQhNC4htwXsxSjQFUeDy5f0uA5ab/pbXxKpDRJ3w6VQDYjuD0k4ntkiD3EVCUVLUDviE9PnExkbs6di9b9e8FrDC8m4DB3+q1OBUuTeUuEao7SbIB6RghMO/aVficAZnmKeUW0V2/tBKOaM5yB9LIYrs38Vu9DMTS54zV6WUOcMCp2YpkvHcnYSJawkKRbtQVjOaGRh+0fczhzVAZi4fwPCtbfFeWOBWuIcJlv7KSfdohJERqUKEJt/PgFmfQaGHGeLbUSw8kO4RrnpUyvrDig840zD3vK8Ll8y46wv5wqFDyihW35YRSGxv/yXAfbGXWPod8+imtE7g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bb58b0-e8bc-47bd-cc93-08db36108a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 20:01:26.9782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lhJieMmHQUTBVzdd2XRrEULU8b8QpCFO7U459KRmKFMHfdzL9sRd6cRgq5nxzSrgz6t2seOPRaJWbRJZWKLYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6789
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_14,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304050179
X-Proofpoint-GUID: AATToCkT39ACf8gYgbW5ICQbrJghNO6-
X-Proofpoint-ORIG-GUID: AATToCkT39ACf8gYgbW5ICQbrJghNO6-



> On Apr 5, 2023, at 3:39 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> Hi Chuck,
>=20
> Can you help debug why an upcall isn't happening?
>=20
> Client sends a null call tls, gets starttls response. But doesn't do
> any upcall to the tlshd.
>=20
> On the tracepoints it logs handshake_submit and then handshake_cancel.
> There is nothing in "tlshd -s" past the start messages. Network traces
> don't show that server is doing anything bad after sending the null
> call reply.
>=20
> Including the snippet of the handshake tracepoints (and whatever was
> in between
>=20
>   kworker/u16:1-6440    [006] ..... 10146.917766: handshake_submit:
> req=3D000000008e5985ea sk=3D000000002dfa1873
>          <idle>-0       [006] ..s2. 10147.035627: xs_data_ready:
> peer=3D[10.63.20.131]:2049
>   kworker/u16:1-6440    [006] ..... 10157.153020: handshake_cancel:
> req=3D000000008e5985ea sk=3D000000002dfa1873
>   kworker/u16:1-6440    [006] ..... 10157.153047:
> rpc_tls_not_started: server=3D10.63.20.131 nfsv4
> requested_policy=3Dtls-anon
>=20
> Any pointers to what might be going on or how to debug this further?

The kernel is submitting a handshake request, and ten seconds later
it times out while waiting for tlshd. There's no ACCEPT downcall.

The nldebug messages are noisy, you should turn nl_debug down. What's
your debug=3D setting? Feel free to suggest more tlshd_log_debug call
sites.


> Here's startup stuff of tlshd.
> [root@scs000128074 tlshd]# ./tlshd -s
> tlshd[4564]: Built from ktls-utils 0.8 on Apr  5 2023 11:50:57
> DBG<4>        lib/object.c:66   nl_object_alloc: Allocated new object 0xb=
56ad0
> DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56b50: Allocated
> new message, maxlen=3D4096
> DBG<2>           lib/msg.c:518  nlmsg_put: msg 0xb56b50: Added netlink
> header type=3D16, flags=3D0, pid=3D0, seq=3D0
> DBG<2>           lib/msg.c:425  nlmsg_reserve: msg 0xb56b50: Reserved
> 4 (4) bytes, pad=3D4, nlmsg_len=3D20
> DBG<2>     lib/genl/genl.c:358  genlmsg_put: msg 0xb56b50: Added
> generic netlink header cmd=3D3 version=3D1
> DBG<2>          lib/attr.c:474  nla_reserve: msg 0xb56b50: attr
> <0xb578c4> 2: Reserved 16 (10) bytes at offset +4 nlmsg_len=3D36
> DBG<2>          lib/attr.c:509  nla_put: msg 0xb56b50: attr <0xb578c4>
> 2: Wrote 10 bytes at offset +4
> DBG<4>            lib/nl.c:343  nl_sendmsg: sent 36 bytes
> DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a8=
0
> DBG<3>            lib/nl.c:845  recvmsgs: recvmsgs(0xb56a80): Read 164 by=
tes
> DBG<3>            lib/nl.c:849  recvmsgs: recvmsgs(0xb56a80):
> Processing valid message...
> DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56c90: Allocated
> new message, maxlen=3D164
> DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
> 0xb56c90, 0 remaining
> DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56c90: Freed
> DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a8=
0
> DBG<3>            lib/nl.c:845  recvmsgs: recvmsgs(0xb56a80): Read 36 byt=
es
> DBG<3>            lib/nl.c:849  recvmsgs: recvmsgs(0xb56a80):
> Processing valid message...
> DBG<2>           lib/msg.c:277  __nlmsg_alloc: msg 0xb56f00: Allocated
> new message, maxlen=3D36
> DBG<3>            lib/nl.c:897  recvmsgs: recvmsgs(0xb56a80):
> Increased expected sequence number to 1680718792
> DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
> 0xb56f00, 0 remaining
> DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56f00: Freed
> DBG<4>           lib/msg.c:565  nlmsg_free: Returned message reference
> 0xb56b50, 0 remaining
> DBG<2>           lib/msg.c:572  nlmsg_free: msg 0xb56b50: Freed
> DBG<4>        lib/object.c:221  nl_object_put: Returned object
> reference 0xb56ad0, 0 remaining
> DBG<4>        lib/object.c:187  nl_object_free: Freed object 0xb56ad0
> DBG<3>            lib/nl.c:836  recvmsgs: Attempting to read from 0xb56a8=
0
>=20
>=20
> ktls-utils are at:
> commit a00615232c0fc04caea066cd25c33f9ffc5d3fd2 (HEAD ->
> 04052022-v0.8-main, tag: ktls-utils-0.8, origin/main, origin/HEAD)
> Author: Chuck Lever <chuck.lever@oracle.com>
> Date:   Wed Apr 5 10:56:35 2023 -0400
>=20
>    Release ktls-utils 0.8
>=20
>    Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>=20
> Kernel patches are at:
> commit 46588cade103b446f74a7ee160a83cd2a80399e7 (HEAD ->
> chuck-rpc-with-tls-04032023, chuck/topic-rpc-with-tls-upcall)
> Author: Chuck Lever <chuck.lever@oracle.com>
> Date:   Mon May 24 17:07:29 2021 -0400
>=20
>    NFS: Add an "xprtsec=3D" NFS mount option
>=20

--
Chuck Lever


