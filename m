Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE921C08
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 15:01:05 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KDiIR8003776
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 15:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=KDN8EEsAHnqBNEUM81ZLDCtXIGh8pfGFVQLSmPEzfmo=;
 b=RHBiuhxRbFuEioLu+J/c/y060hCq1p9eQkNFPCRtMIZ39+E5HgNCeJS+s+trDXNGc/sU
 /6wfDOCD/w01D6SBs1XqwDcazI29LFevSFJE+/Gm6mUQGwUsKXEyurl3cwsW/z69oE18
 h4NFzHv/06iCnDmfMzlWTCJSbcg86k+e1dyFSnjYpPPkMJNnB6hgDRGKIlMmW1pgGBle
 45jWbOlZW2lMS9Gta4ZzHNGG99csplQCmh7nsl60x8MR5NvFcIN/eXr+s1H0qRAQyM3u
 Fl0r8jHbSNos1jk+P1wv/TaSzyO2KB3bCxwpA1NHtq7MDoUr0dYhq14vHUaF07TTlAqd 6Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd433kq81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 15:01:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32KDreDF026556
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 15:00:59 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pd3r4dgc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 15:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL+gHoOLBUW2IBinPjAqtf5HUVzDKVBFFWIyj27qF87EW5K6mpiHfOeP9kDMdY5aHmMUGty6rMugATtA9wpKBKng8fAiGtQIclx57C8+B+3kzujVrPi64GTmLPNQoeLLfos8yeI1CIQ9Gmts7vFZFB/p0IW1CRcg+MD69c1A9PXgXDv7g84CqHGiIgZFvPL2hm77K3wCZvwKupahsXLpELaF2h1SMVSgmlpNpkBTNEbVwoGh6XNSYAW1Cz7CiGAOGal4tG6Sewmr+EJ8LzNksP4LXnFil1RFluJwVb9PCzyRwwsG46MsvWqe91BlKuzChQcdD4TT0g7dUeguSZ9i6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDN8EEsAHnqBNEUM81ZLDCtXIGh8pfGFVQLSmPEzfmo=;
 b=UYVAkmlbQ4GFw9rQ0LF2Q6y4ciMeF4qwQZvvC/O30LBmhOoCVw2GA08Q7la96TcPLGymMdm1l7b3jUVqaPW0IMOH04kNa3NczdxE3YdLSPv8U77MR1Irvp5AL0e6WSdQVtKoYF/K2u6BSXD6XL98ulKMQuxjXVsSpUh95XFG4YD1jVG8bI2oFB13+YVhL1vqxJv7sV0QpofYfNAsGLQYCjS9qmHumjclzW+6RjvPU7PaKN53yP27TRKon1uEJfVV+5ZTJceQKUB9s/4dWdzS3AlaEPLiWXb5cbNICWS1FtXkksCe0wRp5EQDk4UlFdinzmHyLgWaMnLIvTugzK0mQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDN8EEsAHnqBNEUM81ZLDCtXIGh8pfGFVQLSmPEzfmo=;
 b=PtNuU4RNrkk9PlHnOYZjvhSLGlgT7nWVO+uPGZEPlQk/erDI4c1b57j/onxJKJFdEis5k8/OhCeW1y+5wI7AxT9p7hB77C9NiTwJRNiZR8DoQZ30kX9rgH/qyGjfHCEwVDS4OZL5o9m8MrcQsCEPi/JUrT7HNH7moFeo11OIYnI=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW4PR10MB5882.namprd10.prod.outlook.com (2603:10b6:303:18f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:00:52 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:00:52 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZWzzDAFQLezKIqUCU9FmWVv/RVw==
Date: Mon, 20 Mar 2023 15:00:52 +0000
Message-ID: <F790B259-F288-4449-82E0-4E0813701F65@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MW4PR10MB5882:EE_
x-ms-office365-filtering-correlation-id: f25f0f97-0be3-4430-c653-08db2953e633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Av5TNztefKyYJzPBJBFGh4CNxIiYsIfdnjmmQrveVqUNPtaVZ7+MRO4daYA8nawiDktUAZeelfSzh8wwSaiPUoVWWyGPQe3xCEoH+jn6UFgWmxDEZMVxJg2lvo0Uz1ndmfmnCMo8QFitobBrSDS7qM+X1Gjyvz/zJk4Ao/dvKpC44+cnlf3ynLp2cEVpd/CwJBCs01oQcgRTgI6EdSOJTSBLBkgOxMqZr3AggOsR9DXOJDFMR4k321oMN39GfzU2Q+ztPw7LPvgghl5Ho9HOhUAdhOaFHUWocDMMWqSkcGJBGaH617bLHZfW3oyXqzg5vbXnxlDBSWyPsj/6u8pV3hwjJEEmD8XbNEewRDkTTewCp75nN11NhVVk1MNIdCeUExo2iH4NFVCjJCy90I3S0TuIlP/otHR6dT0YpMeSfNEYkY1ugt+DCTdpY3gzL9ZfU8uT0YE9NOrbLorf1MXnW5aZxImnENm2KLGakRbF4bi/z9oUdPK6JYEiLWcWmz41GRbeT/uHpDZ87oYhzie6PrylbHFsb43RT8kaxGJQtlIDXsrvVlYCoah4bRkF8vHY0kF1uNmP6Vk6Gqmv47Abv1ZBwz7UXkzsqijRwutdxd84XueuT0P7FOg9OHbEPEem5mPsZ3dY2Dj56b2BGLMfpjG9MLuTC11TOjmcOy1zRjXAzyI5d8fNQoO/LDbbM+7WFmfpQkjXHSKQumRDve0wtzu7dPyOF0mGFX8tZGvEdbU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199018)(8676002)(36756003)(6916009)(64756008)(66556008)(8936002)(2906002)(66476007)(66946007)(4744005)(76116006)(66446008)(5660300002)(38070700005)(86362001)(33656002)(38100700002)(122000001)(6506007)(91956017)(6512007)(6486002)(966005)(26005)(478600001)(316002)(71200400001)(41300700001)(83380400001)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?y4GjnStFKtuCgndPZkSRX6JvBKBrW6H834zCdF46DzIycIMVSC+rk+hzYrNa?=
 =?us-ascii?Q?s0XHZQgHJQIiMfRylkXSjg2v4JK30jRW1prYdkogvD/9FeSpC/6eBj5KY355?=
 =?us-ascii?Q?POkz4CqyhXC3dv4JAaZsommmdAgXhKb/eNgXRePHyI5Q/oFkxRRKZjPQX87U?=
 =?us-ascii?Q?7TF9ysGplkye/Qbp+ESzSG1aJfhlGwstzg2iouZ5fiYdX433Z1KV0GCzZ6Uj?=
 =?us-ascii?Q?ojOpgz/3TzkmDdVM//qrD8ur92eS8K0DTHo8w3KUFQ23R8UtkyX2DYTvboCF?=
 =?us-ascii?Q?TX6LDyQpZWwgZcpbDJOXWv6rhrc2ZFJDtXS4Q14CHWgFd2AqEok162LzNKCL?=
 =?us-ascii?Q?WDETrKIDyZKV5bU5JfEdr3A18C6DOm/6KQPtRbRf+wb+Br1SdzkkfzEMvkjv?=
 =?us-ascii?Q?gJZikf895TgHdVFk3xOW0cgEl4XAMwZzI5qIz2f0gPwqAYUWOWTgKh02bzxC?=
 =?us-ascii?Q?qmmYnutpMi3kcVY/50N+ymv8Cxox9E1kFj6IXfe3OgI32JrpEZNvxlRGTbz1?=
 =?us-ascii?Q?Bq5cpaccSzHinARkSHwAI3Xds+9gC0p/IR1NsDAJ7lpmdfZ6PKUdkjdCZ1ot?=
 =?us-ascii?Q?GfUZTFVGNBFBYW/GmzyN82KSl7LRlWJ9HYItzQ+j51e6X61mIgAf4ZdqELGA?=
 =?us-ascii?Q?dtWyWSdxdTb/zqKAuV78yXwumqv+bqiW6tjIbzWQCGMa6/pH3sLknDGmbQxq?=
 =?us-ascii?Q?bpr+L7nTzJgjJBm/9nbYj3OLOg/fl5Clj8rPwCpoxEiEeSJ1J8Sh1T/LgejE?=
 =?us-ascii?Q?/fjwXfB9G2+66zrW6raUoFVpIe0oWLLPVOOjyCWRsU3pDx1JRZo4QyTIS0ok?=
 =?us-ascii?Q?u8QseFa3/L/BZkk08aU2UkeoSJg7dC4qbZ8v/kCpFbmvQvZipPMrTDjOv8Wf?=
 =?us-ascii?Q?okU9DhwfKfQoYISPLW0eztsfvukK1abYuxNJ6Dbjn0oVVq4kJMQgFdxMGPrN?=
 =?us-ascii?Q?Uv4Pux8WYruUkb4cdsX8cnXw6s8ag7bn+1BuM7H7ZZizhI3dTTmc48I/MJ+g?=
 =?us-ascii?Q?FvbhU49TttNjBGjlBwM5TUJNbvJHYojuO7Zf8p8MLFzRVP3e4JcB8VX2IInD?=
 =?us-ascii?Q?JUhdcrJiapznKmS/vL+hYLnoq+hQGW/ZMgK932Uz3/OcFjXiNYy9jI+1jDPO?=
 =?us-ascii?Q?yVHgR7P9me7xacA15vyXgf3VGV6O6UCxy4ffzTM7HY6+OIOqeoQmXllJHQHc?=
 =?us-ascii?Q?wtITa9fd/WUBF0zdjBQUOHPr/YSkD5M9PITddCq0N543dIxUiB66XjkqPwK7?=
 =?us-ascii?Q?TBeNjtCPjDbtpHz31fMfT8qDN5yeYLMXBaDw4fJibRcqPBDO9UnUcQbhsM1/?=
 =?us-ascii?Q?ZlntZgFUWC3UgxBvt/BLmzyJQShHuSgf9luPiJGHy8qOSzpj9TJ9K/lgJn+N?=
 =?us-ascii?Q?ZmuwpgI+TilW/+q4kIGX9yvIuGZ0EWJX6L821pXT3nHnKop536hQt8jJVQ4z?=
 =?us-ascii?Q?+tdxyY4Om0vQjcaJ3pUCX39S5tH/rf89fvj+JUBoCxxaXgFydnFh4bpcxIki?=
 =?us-ascii?Q?Y1lHzRc1O7MRwFRLoeDMGS8u5Y8ATMWyCx5RCFUlDd6KQ+GkC6hu/DsgIqwC?=
 =?us-ascii?Q?Gng1Yy/G2zPLC7SeRbUeAIduU2pIjOLQfN5v5K3QDhIhQWkCeavyEbS1tLiY?=
 =?us-ascii?Q?0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB7B0E2837E8FF4F91102CEA5913BA68@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uIAu/AW5ptfQKmvK59s7LAph2HBZOXV3cGDxVxS4d6iUqVCUqCWfcDoWghpIYZNEnBKGrp3ujQgEUOQknmw2RZtUIyTZhZ6MLS/YyChZTBG4o+QPG92WeU4VhJqPAK3w1YEWTpVkKqjaeVr1X8/wJN188jyQVjTnQTsatMlHAzzAm93NAHfc+siUQ+vUascYBZyJrlzAUEfOlV8K+tEc8z8UWcXHWoIL7c3+UEFmvGzLoUI9L9xeyJFnJ8cxcRxjAK6qrZOA7yY35RC84ZjW8KyJJmVMQkeDzKoYBu659ghhUMOHI1GuXmEJu/VJzOX6tLmpPJTtWaU6rzLF3NLW3N4+6MWGb+UiEsLbZ7unnfZBTmeGUMiVxNKsoBP8ZDfpfMdHQ9CoZJWh3iEsDCuxWFPMtEFkdRqVmCEKT3I47x1Axvrd4n/F8DDtNuYA5lFM4Svz0tay3gZt+ARGe/VkmsNwdgLBGLcdbGVFiKiqBvXCh/Y9R/Xz2pi1tMu+k+kigX/TpT6OkFTg8fnS2TbUBryEmLETOUZazPD2/39v6N8k/YOn8JOqJuvnQy1p8Gv1/fBxhfNbtO4vP2RKcwMLQz39fuvaYDjola45kkq4c6FoYPOwpOHKVRDQw/JaWi+1Cl7s1a41+z8aXrHgPdU2Fs1TpTYbiL8dB7FSrl3bWF3hPMUHdxTPeLcp/sn0MjJI4wP5SqHDRtBIJCAKE89DbAaWImEpfmFJRD642tp8ScGITQ9x9hrnw5aBQhvd4BeDXbRg6OHHmuKqOGBh0NSkFg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25f0f97-0be3-4430-c653-08db2953e633
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 15:00:52.3765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3c2JKaV0/eTBQMJImIXUQC75VCskjDA/gQVGTkGVyRsCx/XAh43T8xtve4fb+8HvB+JLd80Zji750IvTxx/JLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5882
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_10,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxlogscore=635 mlxscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200127
X-Proofpoint-ORIG-GUID: AuGxKN44e-JQBVauVTonyCi8MhpD8A_G
X-Proofpoint-GUID: AuGxKN44e-JQBVauVTonyCi8MhpD8A_G

Hi folks-

Here's your friendly reminder that the in-kernel TLS task force
meeting will be held tomorrow, Tuesday, March 21 at 10:30
US/Eastern. Note that the US switched to DST last week, so the
meeting time may be different than last time, depending on your
locale.

The Zoom co-ordinates are:

Single click URL to join Zoom: https://oracle.zoom.us/j/97455381263?pwd=3DR=
0RvY0RRRnJGZUVJb1dMK2NBdURXZz09

Meeting ID: 974 5538 1263
Password: 86875724

Possible agenda items include:
- Conversion of upcall mechanism to netlink

Bring your favorite hot (or adult) beverage.


--
Chuck Lever


