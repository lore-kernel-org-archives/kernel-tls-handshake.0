Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68C20F6
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 20:42:25 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EGuvVT001443;
	Fri, 14 Apr 2023 20:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=CFHdKXQw+vJaR+Qpp1QMFr69//LwIT2GEZZBqOUqbFE=;
 b=N1toT5SvzSSGGItpdnGijf6ad+ZO93aL0HQ0l98kGtME5iSDkD1uAQHamZsjA8rZfpiQ
 XhjoDkB/Jlmi+CErNpGDJC91ywpwUOvD8l38h7rGULuv5kwU31bp5JOfPBW5cc8aZNxb
 T18t+bYDOCzV3vWXKbd8d0A3m6Q9GFOzGDf4sGiQu5qTJk1DELYVGQNvN4+Pa60/E6VE
 PTQtEogG7usREHN48ZLnmVlwYbAnBNrYiKRLgfQPs63gE55dSe/WK1mMX9ZEXVv3l49n
 g65hNVVUst9nKRIFQKVTG5lN8m4uBOFUb27eJhsyfeybIh93V67Nei2OPwY5sTgKnhQQ jA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bw6wx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Apr 2023 20:42:18 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33EKTcSv040335;
	Fri, 14 Apr 2023 20:42:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3puw8cbejd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Apr 2023 20:42:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jqrry100/ORGh+F2nfjIHEYZ13ROgxArA5CLRE9S3OjkuNOVzX+3S0RAXezvTddzrajnZBB07AQXzXtuCio6NW0hDvzK9O/IrZ5XodBPdAInPGHND2439JhGn330lQ/KBBfefFoNfgS3J7/N1bF0JFQVjPy+x59UM67lM57srIz3rTZlAhFpfsoQR4IcnA91SisO5elBsz2kXSO8brCDnNDoO6XQUSNpxmzaxrlXKNs9CsoH3/Whu+tvckrFRyM6Vw9xHmTq5Qt8meLCn+KWD5f1K+8PI89szS8cnkbM4xOi2pSdX0kVEaygtzU+mg3xOk40nFNYp5WKLyBwO2i9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFHdKXQw+vJaR+Qpp1QMFr69//LwIT2GEZZBqOUqbFE=;
 b=f8jyjxEP+xvcCYVcOPd7wBC+PptGXQoFWC8stjh1wXZsFzrAZ/l0ZexIzjmHxPwUZTLZEkKUXmdZc/6Y/9zVGiznCvfCvc8CL2dbh5dLv0fSZnEo/CgTpmvol7jyF8ueYEIw+MQ5l+dgV3HoNwAatx8KaQ5KJVRS05npl0F3DOotZqtn+UKy8vkoxHzqYbjHt1Sa2FcObpXqy8YITwTAQTpdmm0YU9OM+79l4X69a5N0KfTVcC7LkhBze9zWH6y+zuYS7+sucMDYYt5DfvRWVxJJHjiWvt5LDz4QPjR8DRbhGGGzguDeSeW4K88soOS9Byc3pdat/v7xCxEXNODK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFHdKXQw+vJaR+Qpp1QMFr69//LwIT2GEZZBqOUqbFE=;
 b=edm2fBgOYO4ohIoqhhqomo3pCEHw38XQF4ygMGALkOWzFLQMpL7WxegGmNixLDeO7DOKJ++S8P89DxIsByEKhmbhm1OsEok3Wv+8A4IttuDVQISqmAqVbizKoJS+9Z4cXXWXAVineJ/yv4H7Ma4ZxFan8yCoHPz4Wa4A8FZM27o=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5329.namprd10.prod.outlook.com (2603:10b6:208:307::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 20:42:11 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 20:42:10 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: advice on kernel configs for NFS with TLS
Thread-Topic: advice on kernel configs for NFS with TLS
Thread-Index: AQHZbw3ReqyVHyuJYk2stoCneux3Sq8rRQMA
Date: Fri, 14 Apr 2023 20:42:10 +0000
Message-ID: <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
References: 
 <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB5329:EE_
x-ms-office365-filtering-correlation-id: 8ed9df75-d2d3-4ded-daaa-08db3d28b8ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nnoydSopej3s6P38ERMT40GooQybr0bnBaZgfwenOmg1DRY8XFg0ANbUNfNG9JDLAAHHZz1jVOflxuHeXI2KoiuAlncQ4+0Uf5jPb6q3RDFMJzANMte3JABrJ9j771/zu0ReWHH70O8IcJAj1nHgig9B/P+kIR7d+XLV/DJy5PtSiYh4vBfHA9H9er6OfvdCE4cUXz2EPishFfUQQugwXylfat7OiSq79zHqtXd5IwuKx0wlMr9NI0xy+eVx6xT38JgikJAs8iY+a/S7mJsLoBaQrxLK9+uwGXaSsz37Ns/rXAcEACaZ3ZwLg4x+9TvuYd6zAnhAANIF6+1wmTDzuzpI4WagL4elt8YcSzrqgXWSPuwTOcioDO9ldHDMgNX1fvM3UqeK3qsb8af+/HGrEjVvSI7wsue+C624M5HByywQPZ4VMsgJwA787YEhh7jVWiWrqSBrPr9s5sbSxx1pqfAlrFTJVTuo+rEEy/dVCwNycPbW4posXr9Qqbh3qh23p+5pAsgj0e5IFQmd1PILBjiBJA1KObsKH8JoZ/KYBDTs3MrIxZuWsqTgkZ5PmWGh/yfNjS6iXxn3byX73c/IhvcXI2AjOpfY5JOLhNT1iRiWBCBak3fxh9v6FajZJErT6EOjfHnZYuTBB3YDkQ/6xg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(2616005)(83380400001)(76116006)(6506007)(26005)(186003)(91956017)(71200400001)(6486002)(478600001)(6512007)(53546011)(4744005)(2906002)(122000001)(38070700005)(8936002)(36756003)(33656002)(38100700002)(5660300002)(66446008)(66556008)(6916009)(66476007)(41300700001)(64756008)(4326008)(316002)(66946007)(86362001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?J3WvGnuAn9AEbmJx5f6DLizYabUJo4K2cabNlNU733iZn6trHUwQqDLRWi+K?=
 =?us-ascii?Q?YZoWBRnCQMgOJyeGh1nxAo2vRhcfy+sx/92HnTApUrMEJCejQkHTCA21hfYG?=
 =?us-ascii?Q?pcMFjjXkKtby35SmoUyQLI0AxkOcrPprURMe7yWRpWbP3jN+TDPOSEk7ToWO?=
 =?us-ascii?Q?xiTo4oT4gBUxkcEqqV+j+AF93ebWTVAJd8xwidISsrypLA6GEu3fHPzAYtHC?=
 =?us-ascii?Q?hR824W2ZWvxJzy80KnMo5iv1hWgHRZ5IaNR3l/rdKEukj9VvDjBGi8NqbAKe?=
 =?us-ascii?Q?5+ayFSdfnwEwbOiOGmL8AxlygOBviOVyGfes0wIZMLWy5rf2oT1s2d1YK1Cl?=
 =?us-ascii?Q?QRc1XYC4O5L6deHvkFyZbnql0r7WxgyQ+A3Np6r3mrnU35/lpCDevlh39mkf?=
 =?us-ascii?Q?Ghf2WwQtZQPyEzDQHRcPpyBivXkhMDN6WofXciY2MmHu9l+252Y6Xy48dwLH?=
 =?us-ascii?Q?o9fiV/yksS2xC9lV1TRMUTazISONnzGmwxprH8L1wQWwQR+QAxSplBhJA62t?=
 =?us-ascii?Q?q6V6VMzr8uUnnkYSJ5Une0/w4UgmW3yOPlYqxYRRa3ed/GMZjcxIHpcweFH3?=
 =?us-ascii?Q?hEPtWS99mqFnBPXTsajZ72RYOBMk6XA2K3lb9HE01FOtiUCaxSCOMKSBpzLZ?=
 =?us-ascii?Q?PJzJNDbI2o+Q7Nfj/UxSmJCfNkflQDZXWxsPomTsiGEZieU0QzNffzW/f5iK?=
 =?us-ascii?Q?Dn3VJh111lyO5yLL/7SwP8QMvE0X0h1kvfl/P1Li3TqxSh1Ic5Qj3J0OHt/W?=
 =?us-ascii?Q?QFrNmLeCItAH8EdwDOF7UQ+3LffjrDab3+5AybXO/E81n0vpcEwO/PZna40J?=
 =?us-ascii?Q?3b4yjIbJ+ubZj2QjBTc0/0JuN42nG5h+ka4wer3ZejP+IEGgN+0WvezVrvl6?=
 =?us-ascii?Q?WLzo+jm+ditTPUWswrZ3avJf9nhiqTrWvKVhwR9T9Wv/1ruad6TcLy/aIVWA?=
 =?us-ascii?Q?N7p/sSqtPrKBNE/TES1yajuHwTnNTEhcvFKk6kfHy7f0EGThAMdPLhf0wr+t?=
 =?us-ascii?Q?Bj27pILjNX9vt5HW9a20KBwRI7QfFPsNUGfqOIgK0DJFyx1cgEMizreRi/mq?=
 =?us-ascii?Q?fIEERH88o/NOo2wshObYNLeGpwKIcjmeDoCvDiTl5UM4RgLThBqO8Z4s9xIU?=
 =?us-ascii?Q?3x4YOfbAP28oX33SvpfK5FVzzazT1X1y7Tm3a8yO6pJwYzWrVsMYhw3LQR5Y?=
 =?us-ascii?Q?wPFnjl6uF8gKS5Mjh/e/Sb8DzF82AP4erlOpObDqA6kGgrYDPJN6RzjRwzua?=
 =?us-ascii?Q?JyYObcr+gF7ag8RjY7CPDH8uoVpXElrcw0pMYKL6pWdVsSICZrJvh1ZbdaDR?=
 =?us-ascii?Q?DhdodA96Icx3rrV58By/m344jF9va/IylL/vFPtF9ipHwyyzR7pKD0SuQKXy?=
 =?us-ascii?Q?m9zxMNXueWf5t7CALohv9KVUo+7D5fKXK+dztxrfDBzQXAHs23IWxUgV9hZ5?=
 =?us-ascii?Q?7kR9HW4XXmA8v2Bk4TyrkrsX6xozLaYjlXE7YAY1IWXDSechLelIFCOPX6wy?=
 =?us-ascii?Q?ZwvcLm4E5SXiLViRy3kG0rKT15W8L/8TC71S8QF+YtMBMtDrLNIF8rbDX+yP?=
 =?us-ascii?Q?NSo5e4C4XbK/OFbIKvlD3qRxPuptGLDrsHYyv7ljsTDDa8ee2ZSyXIpwwjMW?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59AFAC49E4C54B409DE4D7A66A1FBD68@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	E3pJl01RbQ1VOKt7Yd2OGJkPDNdTwn3JFcqFsp0pzRNjH5A67rNcEaaNGAd+W8VLGgypjcqZZszvT9ANM7azac9Iy6lE1mSPlTsu5txUUPHU3xn8uvYdfreuj6txsmINhAABKxUkcbo7TDeh9g52RF6LiUmD2/kSI7YHy+l+F67yq0IBXAff64tX/F1KYZPsaXe84lE/E3+23vfqx4hqmfTfIGc2UscNzwa0llkzPRUSEcXVLhYQA54Cn4CDCruqsQykkfJO+JdvNZdzhbW/01ywzd8wEzyDDSjU3RS/h6qpnCymoBXotRdcausaabUahTbEM1H9TjUxCcjO/tZaZnk1ECthkdZ5EiO4aj3jJL6kZkOBQ3NYUWUovpdOd/e+UjaDePDp1JCLBEpj5OUzss6uD7vWrnf38u5OXOKADhkUXb9fU0cDylunrWmB6LnbaHsb0PKosak/DxfWybuudX1LV1Dnxmt4yx0IXhN3yMH82X2RcNFM2WZfqszBWTxuRRWu8GwZejQ9PMk3NfQceDTZLKnzxd70UfSIp4AN+k+Qq7MK6KOd5t2XRM0vVtgwf+8NZTJezDphDpjyPjFRAGUrDqnwRVZRnxa6emwPSga4bXDF5EavPYZxgWpldNbhv2xWutCSG7FFFYi8hxdM4QWqaHsf4IYGYrR6uR4+NNlJusePuyeNvC1ORJ9/JvxbC7Q5GiAyQC8xeu941Sudk+o1/W+pJKlkytf95Gjujpbi5/LzUDL2cvKi+6qFUnAvFfnaWH91jmmG47pNG7RrRJ4+sHDHt1FnNbuG04WK30w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed9df75-d2d3-4ded-daaa-08db3d28b8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 20:42:10.8968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5C+48AT03jp0zMTDxKjl06TLSnMf3z8Ad7meJTQerkX5qpn4cqUHMIOqPSwpTTJxKF3a0e1N4UZdndCbBVV1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_13,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140182
X-Proofpoint-GUID: noNi6kUCAoX0WpWb1bgl4P-oAeuHLyl1
X-Proofpoint-ORIG-GUID: noNi6kUCAoX0WpWb1bgl4P-oAeuHLyl1



> On Apr 14, 2023, at 4:14 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> Hi folks,
>=20
> Do we have guidelines for how one were to build a kernel that would
> support NFS with TLS? As in what kernel options are required to be
> turned on (and what off)? I was under the impression that if one were
> to start with a base RHEL9 kernel config that would be sufficient. But
> I believe I'm wrong.
>=20
> For some reason when CONFIG_KUNIT is enabled it leads to a kernel
> where the upcall doesn't happen. The kernel logs that it did
> handshake_submit() but the tlshd never gets anything. I don't know why
> this kernel options leads to this behavior as I'm at a loss how to
> debug netlink upcall.

handshake_genl_notify() is a no-op when CONFIG_KUNIT is enabled.

Not suggesting that's the best long-term arrangement, but
notification is disabled when KUNIT is running so that
the Kunit tests don't depend on having a tlshd running.


--
Chuck Lever


