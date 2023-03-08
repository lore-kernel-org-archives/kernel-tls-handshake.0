Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689E6AD6
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 13:43:25 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3288E0xs010415;
	Wed, 8 Mar 2023 13:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=YTFCX2/OyVDVcecpW4Vn2GoAmM/Ovph9bivpx8ye8do=;
 b=btcMU8JxHpHR9gACOWUJDQrr/ne4Bv0rBe0hIzzUACP8vvv7MRGJNQhYWGyxyv2KjKrq
 o9hIf6I4kJl6Fi0N//SCjYAYyyjr0m6nOtSEZPDAyF0OHQlRRlqyQ4mI1CtZ37RjrJGB
 j5C0PxMPYDX3HzISpq5XwX4c+VPhAIBqdn7GlcfjfxjhEZe6dax12/SbeariShal4hcZ
 qjIuC+zpbrbYpvTZnHE9H1Ya7aX5o3+3I3qvUdZz0obv61bKRLvLgAq1QViErOHS0O+4
 qBgfSGJxoB8A1xf1fGB4fhkpm5pUD2AfL14Hj1FYBvg8tR1ECC7CfR72HhWRpekEN/22 AA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cg3ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 13:43:24 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 328CUAV6015632;
	Wed, 8 Mar 2023 13:43:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p6fem8wgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Mar 2023 13:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1DdTJfGsCJeiZp/kjDjjshGuEojatqhdd5AZo+71ue4w4fD1+BX8OyMrOwtKHhwdpE8S7MNgTcQ0eggwZqIc5kHJoG9lPZYTkP8oXCjRYWe1NMHm7jInCOLJcf5ZKSV6GNW9+kLrgIdeWx1dbpvPNmjzw2LxGsu8qGlt6FHEo82DEGv+LZwvSr8cFBKB0xeCyve5Wmjj3HAcJIMkxSLDBpUSU7kBhrEs3RJE0nYoTGy41Y11/CRffmCOUWNenMlQnDKCI4AgADyA8k5WVuwY2WmKG0aAoxeAM/DylyR7JN4Cz/VMjjTsRhAJ97PhfXJbWlEZ4XYagwNu9JRLX7m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTFCX2/OyVDVcecpW4Vn2GoAmM/Ovph9bivpx8ye8do=;
 b=GhJKbK/NtzTwaImMlZubrBAiLcCTzpwjy7UOhvWeNMXIEdOLscaUNZny8w6Wp1x+w4UjznA6vqhDNc/wmnpug4nO0e99rUjevETU/NixSvBeNkfh0Uq40aalxeAHyCWn5qyLeBbnBuvKM2IcW9YwYbztxOydAu7hTsOcqAxXPk7hq2x7EPK5tuFkfyPVHxOXiagDC7rvGuUmSMTwaDDwE7PDh9XjUEl0zEERnuKWp0/1LWLPqxWvfT+NGNs3u6iwIwU/eYjCsSC6B9UoKj3BajQOjEtUBSRoPj6E4wNRcZRmcGmieK+exL15L4uAhR6OsEDB4YE5V7X0ZjPslzyx2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTFCX2/OyVDVcecpW4Vn2GoAmM/Ovph9bivpx8ye8do=;
 b=YGFassw92cWXT5EV+WnU72raMEHQUp2/9qEw58R2lzcykGn8XIoWZeRa9aEhrAfESve7kfWAoEJbbksrMBS336HQR07VC5VL7PrB7VxehJQGHqUTAKX7IRjyyH8pWGbK5+J0yf6/I+F+eR3mEB0ZY8U9H/MOmdIQ7tDG4nU5hTk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:43:02 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 13:43:02 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: fput() considered harmful
Thread-Topic: fput() considered harmful
Thread-Index: AQHZUcFEoHLUIOt2hk6BHhAhP1frJK7w5EqA
Date: Wed, 8 Mar 2023 13:43:02 +0000
Message-ID: <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
References: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
In-Reply-To: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CY8PR10MB7244:EE_
x-ms-office365-filtering-correlation-id: 8799732e-e14f-4c6c-1be3-08db1fdb09b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9wc4bjjM3l1QAH2zdUR1QhwnrPF9j162exey9asfxsKgplp0z/vXHHvTv+u4KR9NORBMwMNePzggn2j24Zex4Auph5LhBeAmSUuiFOZe8BABXFR81eMH8u2xLvJZbIz8KSTGcdWKjA6t8V7+lOeQD0NS58xP0LAhkVhds2DtpTKxumgK35AIwmU3sz8KTX3Y4j5MgBnMd9THSrNwugD6hMsHhA3DTypn80nVaydHTqPXBoBDIRr4hT92ZCNqq+JTAEjoSdoNtO1z3dTNv70JDE2OxDqPCVn5+pr95xKoWMB6t3//Qxlnsd2ZDaxcR7pye4REWr1/VmG/onLSQq+xAVfAZl8o3JfChlKofzU1cGroxJ1DiomrDh/3Zr9ZKBbzsSTDV4pFrqjNlgfbBnowIyY1ABKCcHTWBak0Jt1DEQlJ9YzOGJ3HHb9GpKe99e2AyZggN060Du4hwQaKr6U8Toa/bv50MGkJRLcyK4OAo2AYSuKWTZAKhezXnIc2synDyevoYtJsfReWR6a9Btvib4KZAUPB/bZI35jmjJSl4NbvyiOsEHJAQTIK147aNYyi7bo9pty2+9aDbYyEJLSVbJ04YFJzobpxf9stHv3N+UCeJjenDfnlhoelGk9F0iOWVe7RuqeOGHgOq/nMFZuSrpCFgNFVlJNmQrOWd6EdC7LasMBXX9tA2LRiebr/0MrokylVUQdTer8cNyfqj9StjkNb8AypAHVHPAUCnL51FUY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(91956017)(122000001)(66476007)(66446008)(64756008)(66556008)(66946007)(8676002)(38100700002)(6916009)(4326008)(76116006)(316002)(8936002)(41300700001)(83380400001)(38070700005)(478600001)(5660300002)(86362001)(6486002)(6512007)(186003)(36756003)(6506007)(71200400001)(26005)(53546011)(33656002)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+ZJm3CYQI31MpRZBnl9+iPYJMIYWqvgkqLPnCCy9ceh+4RjKyxW+Ub9Q39wG?=
 =?us-ascii?Q?xBZqd4hihTEbcGP59gL4tmqc5gzHqkIqyRA/QDQW1Diebn3DIZuT9zFy8UTe?=
 =?us-ascii?Q?vrUizD6+jT7rwuUWaaA5n5KCgsG+UHmHU5P0WwNEwOiMRaZBmS7bmTp+Uyec?=
 =?us-ascii?Q?67jXfHIkZ6eRs8o1OTcY2shYnjHlqs7zZkcI2z7g2od8YVl8rP82R3BqJfFJ?=
 =?us-ascii?Q?6QPv92jImKUEPrXiAK8EbQNtHlGgqXTVxs5KuqURrNTvxIB4+vLG1GjI2b1S?=
 =?us-ascii?Q?fmk3xSOoOtWstQbIPpQ3NcdHANJmgYHBVzKaFVlqYQ/O4026D04X/cP67mD+?=
 =?us-ascii?Q?D/Vq7mXgOlzg6+Xgp0ursF2ZAWzLLse1sn1sqK2cx71d3YYJ1JZid5TIPCu3?=
 =?us-ascii?Q?CsBGUNKsivkYdN3pllqS0Kz8/HyjcJZNVYuKZ1bZc6sq1OSdiLIjbfoXjiyy?=
 =?us-ascii?Q?icPpYoZ6S3F80bxi257RdKC38tEyXd4fffPekrXs3K8a4dEAzHdk+fxFRADn?=
 =?us-ascii?Q?93YAhN+ZeErnJH2BxUFDX9yoMsPvPx/h9dc+Lw+hIZvYnOJHtL3ifH/IKl9U?=
 =?us-ascii?Q?m6EmNwZCPNr8ESaxU76LVuO3vtUkMeTcazTNM52VcwnAfWh5kBL7IfTYfNbm?=
 =?us-ascii?Q?xDtE431npotfUhxpGYYspy0GgAqaq3E9embCpm/ksL4YcY+Xb+7qIRfLiZpp?=
 =?us-ascii?Q?UsCaYIpIB098n4QjLJ69yUmf+EH3k0GDLA/u4xNdU1WKFUEIbxwrZhF0wsfs?=
 =?us-ascii?Q?Xjz2MI2DDntPq3jiTDqvCTylRxh0UZnZirD+jKoxWwo5mOKmFAid6zb4ZHET?=
 =?us-ascii?Q?e6T2RJ8uNV7+Zx6VrqMkQQn+qAhbAnIAXQXQh7bgc3ftfDklYxOxpJ0gDZO7?=
 =?us-ascii?Q?a/ZJJgyCjXkXtlc+ObLp1UB7rhs0bkKnkzkdnUGH+uLedmbJ7D09EGjhlYPg?=
 =?us-ascii?Q?5xeOBGD6o/5naBwkayHMV7DbzUbDh53wJrHGlKiADtheN0IK5kERTUn9e6NP?=
 =?us-ascii?Q?sOTyByQuuVIqV3/e+h9cJw6Q+sXCmYGodqahx5Ouj3PI6qegX9Yy44BMPVYD?=
 =?us-ascii?Q?fkZ1rWtWPwjaK7RO9hVzLAJjULModOKHG7wQva7aZQNuVd6SDtgWXAOXI9hV?=
 =?us-ascii?Q?XEhebvAEkWnax5KFCPMtj2EjkUTlWSw7kP4/eTtu5Hb+5vpjyyfveW19x+zO?=
 =?us-ascii?Q?TMS0rFld2J0WMj5hFbeb79FzIJPSIb++p0b6Ii9GqgaUeKcghFJePBfWr1F9?=
 =?us-ascii?Q?+Zu444Tw4FS3T3d4itBzBitlnc8h0O8q4RRw7SB0Hc8vFd71vGfFei3bXWDp?=
 =?us-ascii?Q?XXC4v9ty3Ll7OXWant2JJQwrVVWykQ1WM0Hlulr5zASbC9etlQXLxIevX2f0?=
 =?us-ascii?Q?vDiT//+iMCckrvLnC2tPRqEeWIAT4Qwt70DqUrWyTbSEO5GmzP4f+r28IRpm?=
 =?us-ascii?Q?poz+BzgNTXFOy8TiuBon7ajkHxwon3pSaHMK8phX8DDxrcFJL6+tYeXkYrad?=
 =?us-ascii?Q?Z5DXviqLua+MKmZQxBU/Ahz2S3bSoF63xMRBzxf72F/SmNmVSPQSMy7BOEEH?=
 =?us-ascii?Q?lYeejdXCiztYTz+JsezDAO6K7xCbJ0PpiuWwSFbMQsfEQVwcEftQmp9xyL3P?=
 =?us-ascii?Q?xA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <948D4452EA37C943B18C16F29A3340F2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jNLLawD6wPREFjx0ZR1Z9gkBBugzRfp4nT2VleTCfU6GaFkLkuSfCm6z3MPOun6pVuC7DHM7t1JbDp0ErZECzBQ6FIsqa6Po4jus90LvKczZ0Ht0BuvtUuy3vswzCI13I+DvXTlJjrIyzqUrur0+sR5QLVvp9ytHzT282PU5xGMUI8ZAWJ4eIWbqduBWGOW8R7t8riabWGaV7WXwOyP84tDwydIINgnA3QXa53EVI4NN9OKG/7pYH88UJxQt/W2O/Pb99vhrgE85ocRamMgWoGLlnR4ipWo8uRjJirs9pasxxF2ZoCIUwTFsApd+C6CI5GARyG9NoR+sI0tMR6MA2q5b0AgL2GAzn7M2LuHcArN4GEZu6eUwn0V8qjTtPbsR0GjkQhuPBGijWIA/yxi5TeLUDHiGfEyCR5e7/Ly8pDQ+zTTzx9GZUPiMwCYXcmuW8O9Q4CngZuS4fBlkfJpE2eTB7gd/glnmDpKqf+eaxCwDXmbJ5RLX3l8NF6nHNUhexpxkyu2mVfmzyL1BCu0YHOZvgdpYKDhCvb5g/hBqNOh3lEWZuK3cJ0Z4FZ+RdBoQsOV5ok3nhAkvCQIcYrHaQx+l89pP2/nBQ2EXuJdZli3Yi4Y69KeeKU1fWAijZnsKwLiZiQLJ/5RJMc4V0TMxrxgHRM+/65SE+1IQzimL2YI7zUfzGqG+PVKG9eqvsXdIid4z5jlmthpm6L3GBLUS5YyxA3+Zhu2TpWggrVzIosoJlu2GqchQmbCD9S8RVVirHkzmg3GHpy4hfvGG8iu8LA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8799732e-e14f-4c6c-1be3-08db1fdb09b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 13:43:02.3685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2099N4K8VYxLas9dj9D6FgCD9QsMEFdxl2zxGWQqlO5ObChaTq+WFXsLArS68pJ+YnLgKxxnrqFAv+5XBciNuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080117
X-Proofpoint-GUID: OWxFce2eHgc3VP9lv_4LZDx-Nc5elM53
X-Proofpoint-ORIG-GUID: OWxFce2eHgc3VP9lv_4LZDx-Nc5elM53



> On Mar 8, 2023, at 8:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi Chuck,
>=20
> I'm playing around with v6 and (again) facing really nasty crashes:
>=20
> [ 1662.912887] ------------[ cut here ]------------
> [ 1662.913399] kernel BUG at fs/inode.c:1763!
> [ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G     =
  E      6.2.0-rc4-54-default+ #231
> [ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0=
.0.0 02/06/2015
> [ 1662.915932] RIP: 0010:iput+0x1d/0x20
> [ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 0=
0 48 85 ff 74 0e f6 87 98 00 00 00 40
> 75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 0f 1f 44
> [ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
> [ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 000000000=
0000064
> [ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: ffff953bc=
bb23b00
> [ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: ffff953bc=
bb23b00
> [ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: ffff953bc=
b9d91d8
> [ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: ffff953b8=
3918cb8
> [ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) knlG=
S:0000000000000000
> [ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 000000000=
0350ee0
> [ 1662.923568] Call Trace:
> [ 1662.923801]  <TASK>
> [ 1662.924006]  __dentry_kill+0xca/0x160
> [ 1662.924353]  __fput+0xdf/0x240
> [ 1662.924652]  task_work_run+0x67/0xa0
> [ 1662.924992]  do_exit+0x343/0xb50
> [ 1662.925302]  do_group_exit+0x2d/0x80
> [ 1662.925644]  __x64_sys_exit_group+0x14/0x20
> [ 1662.926039]  do_syscall_64+0x31/0x80
>=20
> Key problem seems to be userspace here, which (apparently) is calling clo=
se() on the fd which we've passed from the kernel.
> While this _normally_ is not a problem, in our case we have the problem
> that the filedescriptor is associated with a socket (ie struct socket).
> And that one is shared between kernel code and userland.
> And doesn't have any refcounting whatsoever; socket_release() removes the=
 reference to the underlying file:
>=20
> 	if (!sock->file) {
> 		iput(SOCK_INODE(sock));
> 		return;
> 	}
> 	sock->file =3D NULL;
>=20
> ie if _another_ process (the kernel driver, say) is calling 'close()', to=
o, it'll run into the !sock->file condition and crash in iput().
>=20
> I have been testing various things here, not calling fput, calling get_fi=
le() etc, but either hit a crash or kmemleak complaining about
> the file not being freed.
>=20
> Have you seen similar issues?

I have, and they all vanished with the introduction of handshake_dup and ha=
ven't returned.


> And even if you haven't: relying on userspace _not_ to call 'close()'
> on the socket seems to be a quite dangerous concept.

- The kernel "closes" that file descriptor anyway when the process exits. I=
s that not the same as a user space close(2) ?

- The endpoint was created via dup, so calling close on it should merely re=
move that endpoint and not trigger a sock_release().

AIUI the reference counting of the struct file * is what prevents user spac=
e from calling ->release. So maybe NVMe needs another get_file() somewhere =
before it calls tls_server_hello_psk().


> Maybe we need to implement a 'socket_clone()' functionality?

The alternative is to create a unique set of file_ops for such shared socke=
ts, but that quickly becomes painful.

I was thinking of trying to duplicate your set up here to help diagnose. Ar=
e there instructions you like to follow for setting up a small NVMe/TCP tes=
t bed?


--
Chuck Lever


