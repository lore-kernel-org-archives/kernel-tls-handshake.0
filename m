Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26879C8
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 16:10:12 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GFO7q5011757;
	Thu, 16 Feb 2023 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=AUN5KbPIyEdu/ik8bCYKkC5mRFzYXq43oaf39nX5hcY=;
 b=EhhJlrv4HhG1Tk6q16nfH/Kv+sYKGmdOLSjWwRDr2N9a34wUo+fBYYqRIs1e5lMd+gLO
 rGgwKBYRffxmDSsFBIikwYRc4tu7p4Ed3R4rQf9ESPsWL0b02bANqfaoROg3BBT/i5UT
 e7biRV+mrEd6m2G/+eB4hLV9JkUt8XXinx2z8KWRUMoy4UXkfXLApBpKwN8aYTc/gXoh
 9bUukYgf/kJmZBsKzkluJxAcaSYhDGnL1SQI212gFWwljNCLeSf2muf9twoOM4Y/uRRQ
 XKQuxr00nMLxtz6ey877kl33noLOCMJIFj48tZBV2ossKGYThbhbglyEXvBTqeiL6pC9 Sw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m13p0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 16:10:12 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31GEkvVx003630;
	Thu, 16 Feb 2023 16:10:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f8v76j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 16:10:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFuMM4j/ijHdp/uKU3xIim2+wT0GR6gASvS7+QK27U8LSs2+uuh0hZT6qVOTwN2XggVO76Y8r/1mvYA1rTvFf10ZX+IiZrpekLMwj9VW9EBTnds+iT4ylhJ1K+zwaNblHTIcp1SEyj2e0CtGKHOvcgMa85Tyhr62hY17nf4w46KK+GSeeOB5gJEn3ULRj+iNw76WnChN4PpFmY71yWAYkFaMDVwOpQHEg3W6vbFmNpD8VL+jkBlbJvlmLy7N+FMjvMzSTIFRHtE6DAofOOaFr4VUzlwnvemYSTJ3k4QvfZccOo0LcDqHW6x4fQwyxdUNIKypV6HMlVy10+K7lXWnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUN5KbPIyEdu/ik8bCYKkC5mRFzYXq43oaf39nX5hcY=;
 b=RXSR5+hzeA48woScLMYpYAgtzRwr8mCcWkZ+SA1m/0so/yQU25NwAqU4Vv09sGSWLQdLLFCNGDlsjoaZAoACTgDsiMI8gd3apBNgzKBo4OfStFlSCUL/cHP6muL2xsoAYKDt2KWx525I5/sJhP3CQzWpLOhD4940w34VYNpiRpcz27uXWjyuwzM2odbwh+wfSaJRkhV/DlztOqNAfCgsXmOM+OXHLXocQnIaxrZ2fmAh5WHuuRJDQKlBfCZb1kwI5j8T5qEwMzQz16zXN41OsAY1ViTUNOSnpX9g7ixx3FG1drwCKTpA5HD7VeJZg0T0oYaJR+P4McQR7CTzFEtrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUN5KbPIyEdu/ik8bCYKkC5mRFzYXq43oaf39nX5hcY=;
 b=CpQ116sI0XP49+5v91xK6WrW/ReRVn8HiP8771sAwrOU9xiD+cOYQFbK6xAnmX/VCVk7DGvwg1sgQz2Aa4H7GmPuK7kczycc4t8L3izjMffwxwzWeLqdVBYcN/Uyx8tVHnpkPHshaB3aZXhoEKr2KQ7tDE40k+gH/RV8CikIYIM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY8PR10MB6660.namprd10.prod.outlook.com (2603:10b6:930:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 16:10:09 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 16:10:09 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Test results from v4
Thread-Topic: Test results from v4
Thread-Index: AQHZQh+Dx9f0SmrC/0yC4lLUT8Ke3q7RvBcAgAAB8AA=
Date: Thu, 16 Feb 2023 16:10:08 +0000
Message-ID: <88633B2A-074C-4FA2-BAA2-8ECAD3B74DB3@oracle.com>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
In-Reply-To: <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CY8PR10MB6660:EE_
x-ms-office365-filtering-correlation-id: b859c8cc-5536-4ea8-f8d9-08db10384687
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TcrIqZhWyXBVf/wkJUlhY2LWPGVKhlB0mYZHLdvic4qODqm6ZgkAImxEjH9b5QPYPgMXWfAbc0ZoZq+Ppzc5KWWbqwexrDH8t+j/w6U3Zmc8YG1I/Jm2DoNSJ0s//yrCu5WJca0rv3TFD99BPDJ/HojW8IDJ6XTWwl7Ne6Za/DZgRvYyT8L6zNjMy3nAX7hFnv/DzOZjhy4kUovSL40P5/SL2LarQ+gSitAuCpemGzeq1YkoXh81MwvG1uLbGLBcmlnxYYQnmBTkxYz7bhnI+vL+xJIyf0p72dzg8RG/0PT+Vms84i9OdeWqFv1WZ9+4EB93LkKjDr2peeblld6LywQ197hzyKh/L6kARhncMhtNRG8gz71YofEEKS/TcqtC7ETlnKYK6Tw2FJ0G8eP22EuD+t5EypSMy4bPoVQKys8/2yPC4FaYjmAucoHvzqGfszu3T/T/uBhV2rkKUMJ2tO4PyxvYO/aCy6OA2cmM3acsXfDkT/aXdu3oZs25IwtNwBAWd8GF3cRoCquRHbeUBFTj7spg/ldep5B3Eh9W+rittkcdi12mBMLqQfglexzTrvkac0j/uEkp/K8goET8g8UpUnIDMJda8vVeQBma1WKXCaDB/OCnnr2ojVoe1IcI5DtokeWUrz0W6nBRpCayUbPbSx6pCQdObaNbKr8lud86sVtbWujj/2TgQpOxO+wCn5bv1fcV8ElgQcTzXF11d0YnbvQeBS63vAcYPrxpCo4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199018)(36756003)(2906002)(71200400001)(2616005)(38070700005)(122000001)(83380400001)(64756008)(316002)(66556008)(33656002)(91956017)(8676002)(8936002)(4326008)(66946007)(5660300002)(66476007)(6916009)(66446008)(41300700001)(76116006)(53546011)(26005)(86362001)(186003)(6512007)(6506007)(478600001)(6486002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RAeL/oQajFOI9EdSSCazpcRAYASwg/61T0l65q9JP+EQyjo4ocldh/XvozeU?=
 =?us-ascii?Q?wY/1NLV2FQSIbc1XS9AjjJQOjlTmq+ayO/4iOG9VIH949BpMo5oJX2wlLOp+?=
 =?us-ascii?Q?mryxcUo8Fx2S90LRlIjD9FikJIML1YOtcGyJxqH1R5v2Qk+HH85EeQimzGg2?=
 =?us-ascii?Q?iy17a6ZdsEUSkelk5SiHwVCDv68H9HupCnJurZaNGtgj2V8w+m1cs/QFJE4H?=
 =?us-ascii?Q?FImg5ZNfmJs2fT1lHpDjLq9VtyAzsBaeUfEwH6wwvOQfvxJwEHf+tkXyipk7?=
 =?us-ascii?Q?rAQ48DpYbtsqQOcNlos9MNP8bTHkAXmiAIGrH0z8J54OBofuu9FcYCnF/0Ry?=
 =?us-ascii?Q?xzlIm3bXQGgdYqjm8IgVTh4jojqJIAWUggKeuQ+rnAS1X8JW1Djh7QOL7i8u?=
 =?us-ascii?Q?xkpoh1W/5yBrXZhOyJ57sXL/vvVQmSoS+HdZLtX/dm9Z2hqNu6yp5k6FnpEL?=
 =?us-ascii?Q?ViYEquVWZ1Yv4azoaJ9u/c0YWzzlWygAtk8DTvlYdktFt8AGjolRx9+qZy/s?=
 =?us-ascii?Q?awSMVuqVq52v0bplI7H3ajxqq9Kop4e1QdXiGzkvs8Ztg96+wG7qbtAMrwm0?=
 =?us-ascii?Q?IRnnCgslVe4abpZfM+rINCNnHyEJSJqwjLRfIvBL3sl6XxiEL9lQgHe5QfBr?=
 =?us-ascii?Q?tL6f059M0U1dSebsxsCwm4C3Omzmx2+xG1npY0pT/GFLo0vllZH2gHDSuWXB?=
 =?us-ascii?Q?190viT2jzORvXXtDgObzWXxqxo+zzo+VbAMR5E6hRQgbsEGe3GLLs5N3VO5i?=
 =?us-ascii?Q?GoQO6661MbtCMJ0oJpsV+MF8ZJ+FB+H67C3gyZxGj0EBarXmRTmfjEMBVzHf?=
 =?us-ascii?Q?qKP64kry4Xb+fGmzoMSTiBmdigMq1/0t+ui8dERJ3FaArBFhLPtCNu/f4EPG?=
 =?us-ascii?Q?kYN7YQ7HYsxQ5yH+WMdsbe5rpJ1pkfRJa1T6H5FebbZbIRWSQxG3vl98uv47?=
 =?us-ascii?Q?F3CFaBl9Few23Icdxx4T+vLGOErW5yDvOimbZNmY032K2h72v3kXj+bcwY5g?=
 =?us-ascii?Q?pZOzJlqKy6kblyR6H/KesiPrsh09X6cmu8kP1sSvrNqb66oaA4HhC/Ya9K7e?=
 =?us-ascii?Q?Jg7DuxFp9ftHc3UDB3uhmIVCqDRl7ETfeH71puSHgnOVe/BH1iyveXqJmqM2?=
 =?us-ascii?Q?nAaIahjdJ/9d8AfabYfEQt7Q8V77YyvGBcG9GgOmh0mMlgHQ7nMzW4xl7Iaf?=
 =?us-ascii?Q?aU4fTDrc2gcSlcpiSZAEccsGODLhXqbSDlaFVEKD6btMsdHSUxjE1RkSh23Q?=
 =?us-ascii?Q?1UEYp59mXdBD0EkE9H6psGEJ29z+nd4uJFpiEEmdAS1/C0VPEo5b/rBKaL7f?=
 =?us-ascii?Q?MRTzQyvs5WT8gYHwR+Ns2ZNTy+Xw6P96k/SRZG8LwDFIbG0swPdOMxKTPDJ0?=
 =?us-ascii?Q?irhdLAWvPvMN4wqYQLwspYbh8IsJS3PLZiJmJhdKvCYtciGpJfQV2QtoDSJN?=
 =?us-ascii?Q?hYcJCaaQDmScat5UDBtyxdm6E3OFyDSzNy9/Id48ow3L8ZLtCw46KWD2NhP2?=
 =?us-ascii?Q?USeZt04xgK/H+mFB3Su2vtWCvVvdSBURadD+d3vU0LOJLGK3s5vpYz14o/Dt?=
 =?us-ascii?Q?X+VzHDOshkgIBCdd/UbDAstqDeoWJPpgqqYoU5Y2iO3QqTYAX7Djs7w3FtaD?=
 =?us-ascii?Q?/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FF326B3E476B54996F0A677514F8119@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	WmvvMFOmqjXhBCC9YQz2vBu8pItTPQy5TyDmzP4lxZzHhbd9j+bD+MXuo7jdTKwOW3AW+a8svqq++MXydFhueY0n6ILVM7DJjSf+ULLrOb9uwnlCef8vDolNBhH/M2M6ZAihhsFc2geYQGNnSTqeQNue0dRjMWQVU1bc/Dp9ykG5PL3ZXUgZ0HrAuUYuZvOJEoKSF0gkafvWZ6oJp3gTIM+ZTT1bBo7H5iMmaI9wgd5rnrKrQSH4u8v5Wp5Tk0PhdppAfxuOEOubf9Xt500Y99aPyxbijt5AB/da4S2VZy+EoD1qjF6XJbxf4VGf4Svot68VYxJO8esa14rLnVsd84qTV8YXongm1L1za414vaZxjx4N4wzevtxg7ObfSyrI07syOwVSAb6/PNx+So1GdYjHps4/XM5RGmNlvfQlhtFC7AX32MKAG2XuYa5FCl9jT/j+wXd6gSRKlGMBjv9BYoJBlb2YGL/fud1uxouyIXzD6jBVWjPaJdGCc/cjVTMCAd4tJ63m0o37tCQdvC71i+4shTl3F3g7eMF1MvLSXnNV5j29jzgxmkWbJUauTIaI7QWs7P7eWCtXvf6fGsqE6OZR7AQ+88jsv13503gXcsnrF9nFVTQ8w9TE+tkbkS1CjgHIpEpdepUWNIoqcLtgOJg8MZ+8CPbl5LU316Oy88uC3bc3guvTNA38OAxgOrS/gNxVFIbguv0vnv8v8i2iOJMM+feNBGImLOTMtnYYP1mz0dAMSFe3HA7buCZIMvs3xnr1CDj39xJ0CmhDoZSL/hfSSapODwohv9FczPjCE7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b859c8cc-5536-4ea8-f8d9-08db10384687
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 16:10:08.9961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jqidhz9tl/HpeJSEV3HBlWkMLhFIhC8srLhLx4Y8ZnhWhpzp5kbP9k3ilKSlq/dnYgJ+h00dmypf1TWjL/G40Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_12,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160140
X-Proofpoint-GUID: EUVRzJ5pNmArxMlMGAH1G9o4gtFffAPL
X-Proofpoint-ORIG-GUID: EUVRzJ5pNmArxMlMGAH1G9o4gtFffAPL



> On Feb 16, 2023, at 11:03 AM, Chuck Lever III <chuck.lever@oracle.com> wr=
ote:
>=20
>=20
>=20
>> On Feb 16, 2023, at 10:58 AM, Hannes Reinecke <hare@suse.de> wrote:
>>=20
>> Hi Chuck,
>>=20
>> I've given v4 a spin on my testbed, and ... well, things could've been b=
etter :-(
>>=20
>> Biggest issue is that I've lost connectivity to my testbed (openssl-base=
d). It always kicks me back with:
>>=20
>> SSL routines:tls_choose_sigalg:no suitable signature algorithm
>>=20
>> for whatever reasons.
>> I try to fiddle with the priority string, but it's _really_ annoying.
>=20
> Haven't seen that, could be a PSK-specific thing?
>=20
>=20
>> And also reference counting is wrong:
>=20
> That's not terribly surprising.
>=20
>=20
>> unreferenced object 0xffff9989c22a0018 (size 24):
>> comm "tlshd", pid 2332, jiffies 4294964098 (age 1513.848s)
>> hex dump (first 24 bytes):
>>   00 00 00 00 00 00 00 00 a8 31 85 c1 89 99 ff ff  .........1......
>>   00 00 00 00 00 00 00 00                          ........
>> backtrace:
>>   [<ffffffffa00ad3e4>] security_file_alloc+0x24/0x90
>>   [<ffffffff9ffbb747>] __alloc_file+0x57/0xc0
>>   [<ffffffff9ffbbbc3>] alloc_empty_file+0x43/0xf0
>>   [<ffffffff9ffbbcad>] alloc_file+0x2d/0x170
>>   [<ffffffff9ffbbea7>] alloc_file_pseudo+0xa7/0x100
>>   [<ffffffffa05158a9>] sock_alloc_file+0x39/0xa0
>>   [<ffffffffa073594b>] handshake_genl_cmd_accept+0x19b/0x2a0
>>   [<ffffffffa05d44e7>] genl_family_rcv_msg_doit.isra.19+0xf7/0x120
>>   [<ffffffffa05d495f>] genl_rcv_msg+0x19f/0x2a0
>>   [<ffffffffa05d3286>] netlink_rcv_skb+0x56/0x110
>>   [<ffffffffa05d3cc4>] genl_rcv+0x24/0x40
>>   [<ffffffffa05d277b>] netlink_unicast+0x1bb/0x290
>>   [<ffffffffa05d2bc5>] netlink_sendmsg+0x365/0x4d0
>>   [<ffffffffa0516e9f>] sock_sendmsg+0x5f/0x70
>>   [<ffffffffa0517211>] ____sys_sendmsg+0x201/0x280
>>   [<ffffffffa0519ca8>] ___sys_sendmsg+0x88/0xd0
>>=20
>> But I guess you've found these already.
>=20
> Nope, I haven't seen that either, but I'm not looking for
> memory leaks yet. My focus right now is to address netdev's
> concerns, so I haven't enabled kmemleak (as it slows down
> the dev loop). Not crashing is a higher priority than
> leaking right at the moment.

Or, to put this another way: I'm trying to address the
reference counting issues by addressing Paolo's request
for adding a socket destructor callback.


--
Chuck Lever



