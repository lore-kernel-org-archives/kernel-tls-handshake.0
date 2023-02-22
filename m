Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863ED2F3F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Feb 2023 16:23:00 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31MGFfqK008514;
	Wed, 22 Feb 2023 16:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=uGQl2VB6Ed9Uq2JXETENV1lZX616wZumepbJ12RK0VU=;
 b=yRiiN8EHWTX0rcbe67ZlDFRU1eMdyZr58gBjsSxaQb95+On6/nnDoGE9R7ym0YP3oI0k
 vgUFEw/tsWFnbiu6c5kLUwdBuQDyAz2pAahwgaaddx6hqLXUyTt7dNHbLbyg+hO5qa0I
 fK0Euqksx6rpIROOEyZh4bEG3YTlfq9mHReXUdra0R77Yk51jnHK4iwncyKB4NxZi2sW
 MsWSIwfSudGmCxHaHwN8TgiVgWJXRGnHUI1CKL/4V2IlN6Pq8cnFg8IEgcnwsmLRSJzL
 ikNe7RlT0R4vIin6XCaRJNyX9KAUK712h2tuw8sj+qTYURYMAE5n4JKEShwaxLFt1DxE Tg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntp9trdhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 16:22:59 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31MGF9xG027316;
	Wed, 22 Feb 2023 16:22:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn4719ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 16:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP0U3acl8YywOROQK0zBE9XIZbu4Ghp7pJRPHjedjJHWDDNtIIudrsNRvCdEO/QhcKaBXyN/sWPerBqFh+wYuybtYqUDX3KmE+n0CSMS7e/re7COuMGd+V+u+MZrM33vlBFHXhqo1h5h3moo5qF+XEEIMHfVr9dJOqO+ZWeDDbiovOYjpNqoD4osN0ST7+COavRgdQORfq2ACDd2F9Lui0i4AD2en5S2dRkeU/r+RYfQfkJgQ4O7UN9JpmAIPjTBusUCZfZbaeJjWpOzGycbObK0gYrbdtxQw1OlUK5YnFTYUt6rL/Ceed8hPKaQdroTZ7gxZj/yHErBj7/FV3KR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGQl2VB6Ed9Uq2JXETENV1lZX616wZumepbJ12RK0VU=;
 b=dKRMGPAHoZ4y9K8O8hp+tm9Oh+WlUUdsDu+voaxQkSQfnaeX1s+4MPl5UybbyUS7Qf1S6Q6gBrkRZfwWaWnFK2RVnHvlxw6vCdiUrJheSMF0EIkd9Op3PtCI0QCirJU25BMpGmPMOya7HaBoGQlqMyib2QS82/UTXbxbw8k8lOTjKgU7NZgikhCyyMvZkvlaMDiAZK16wL22NIpIgQfhYH3UIsdQb07gk6RK/7wAX+NIOCngRPr3cI4ayXhDNLp+wkB945sO7vKSMHfOfq0IQGIsFzbIuvOv4fdE9iPqXuUKNvWvSgUrdVJfRx/fQdipm72q3mh7JR55y2epGdDRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGQl2VB6Ed9Uq2JXETENV1lZX616wZumepbJ12RK0VU=;
 b=KQB12ci1RJXIwfc7BMNr+cH/ZFPmhz/1vzAvi3zmtR+UdEu2H4glAW80DAxALLc1cvfchHmC3ndVkcLEr29I/ZbpzSngY3BfoCEWrqaWRgV1GQun9aIHDEzWXm2dXutvcHFNf+V6La/otXPSOiE0DUFgwcp7sVpkOe/sqA7Wj1s=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ1PR10MB6004.namprd10.prod.outlook.com (2603:10b6:a03:45d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 16:22:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 16:22:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Test results from v4
Thread-Topic: Test results from v4
Thread-Index: 
 AQHZQh+Dx9f0SmrC/0yC4lLUT8Ke3q7RvBcAgAAPNYCAAAVwgIABMxcAgAAFjQCACCY1AA==
Date: Wed, 22 Feb 2023 16:22:55 +0000
Message-ID: <F803D43B-3FED-4DB2-92B1-F58E9CF59BE3@oracle.com>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
 <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
 <66F7EBA7-AA44-4FAD-B7E2-20FBEBC74C2A@oracle.com>
 <0aafe14a-5153-c02c-85d3-9568bc7e3bd0@suse.de>
 <F3635EA5-456E-4226-952C-6C7A96B20B14@oracle.com>
In-Reply-To: <F3635EA5-456E-4226-952C-6C7A96B20B14@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ1PR10MB6004:EE_
x-ms-office365-filtering-correlation-id: 60e76aed-bf24-41f0-fd07-08db14f10d9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BX/4MvGOZ+SYQIxTmh0kRsvNB9ccmK9auONrcdiNV5a6K1LDlYK0yCaOGdfUEIM1HpM+mPEEKbSKzeQSEVMw1GREQyzglSHIHtc/rPbMPjD3StUsBeasxe7kgdi6c/guPVY5AjZ647eXFtxOKN1C18eA/cRxizoKq6xUR1w9u/MSibKYBKgNIi2Ielk8Guo/6Kma0XhwGfPvcwuDHCm3X/5O5J5hHW+htR7IH4yHzLDECQu7L9L9Zp058t06vpaARkITrYkb3GaEeqnRzRqlwjAfWxFDHVPrSjYXuc0DYTaw06dobZjVFU3ed7ICkSpNjpEX2Z0sCjzxBRytT4SLfrkiQxYpiHEVjljH+6fW1q+c7fz5jPbPibzV+6WVzgL9GTdBVOXCdnZ8An42djo6ocuGjiFl0vT2ekCyMyfQDwqDFxQMwnpbVrZWSW6PcYh6G9SQX0BmkYZMCWg4uFZrBl7Q/yOEfZCVeZSdxpX+4+01/eiFi16ZMccxD685RBJ5jPHLErSLknjplCacjLzGf5IOcp7qkCbfaHSgdvbjI8hMQUXh/ZuhYrJ4lHs8NomTFPHz/L3po2rMCR9bft1VYmDViQqZVc/ZA3aqkazqNehrSEP3uLTZVdihum0Zngw9mI+0BuLeHjwhFAa+Y+hyd3FOBa38kriE8stREk0+IqNBgm/aKcIaehbWoJzFfJZ/X4iPIN2fo+yLJmcgY6R9iqBMmthHbcvbK3GKXkICVyE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199018)(5660300002)(83380400001)(36756003)(38070700005)(122000001)(38100700002)(2906002)(71200400001)(478600001)(6486002)(86362001)(2616005)(6506007)(33656002)(6512007)(53546011)(26005)(186003)(91956017)(66556008)(316002)(66446008)(66476007)(66946007)(64756008)(6916009)(8676002)(4326008)(76116006)(8936002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nP9M+juZIkSYlFvuDm58PE0/dsI2YhvigG01YXGzKjAwtEutUc20W6toZrI8?=
 =?us-ascii?Q?GTYmM04vfU0Q3IelU9NvHhmrDB/xrb96Fj74opya//D0gH8W1RUM1jEGdpb0?=
 =?us-ascii?Q?QkwRewLNJhS9DGsTr4BED3OaSjsqmvJm/JzhRpcWIlzvUwGK4ZKfPDOZ927A?=
 =?us-ascii?Q?W/9pBYlIPmxSqZV9sEb7WlNDXFDttZlXeEFuzOyKvhc/9MUdXhoIYQVG4zGN?=
 =?us-ascii?Q?lJcEB8WcxO9vytbU1cYHrFcsxPx6d/jWTzHqyI2nnz4c4RVbeJcO6hNy9eYo?=
 =?us-ascii?Q?WnNJPeehYBk0qCu0Ci0Dh2IeAH04vduqbzoqVEKxbPU4UwFV/i15PDiRcyeC?=
 =?us-ascii?Q?pXk6kwHVlRdrNwSy0FNN4OjdpOc9xKgqWrvmCjS0jmLDyb14a/D0O017Zrev?=
 =?us-ascii?Q?xpu0f69q9ab2E2eHOt8Ne7ehjul4D3jrYtXQV2M1I2+VcRMwsgsCPWrO1lOC?=
 =?us-ascii?Q?4ZQdmsV24pCK/4qQBAyiHpVSIbnY2IzEGBJ9bOBjLOoeiA6gMWs0CBaO927F?=
 =?us-ascii?Q?RNidchS1D7vnLmFFa/YbHRmB29p7AjNnjwiQEC6mMCEg/2CuyYjlM84roLL5?=
 =?us-ascii?Q?0jA374H8/NiO+KALu52juF1YDSgkrakK5OVUVdqsonSjLCOHzn2D3iie2L57?=
 =?us-ascii?Q?0HPJeDnfGnRxVtJgLrbxjyLS8L2hx/AVPQDCpk2hlN2YXbNKJdcFFq9+WvyV?=
 =?us-ascii?Q?TU6etZoSIvKmVppf8s/RwuDvGMr+Lhd1ouspnGTWD17wBbRt3msd1W1Z4M6j?=
 =?us-ascii?Q?QFfzjB+C4k+pFHz0s+vgJVoXHRMoag2SAYdRKXyyZCnyYDBiJ2TXq3RGzbnO?=
 =?us-ascii?Q?2VqQF+CHPAZ69z9C7YCZJWfqLJwqyjPUmwWnWHWX8fhznnAuGNK8geQN4u5l?=
 =?us-ascii?Q?nWiNc9vqA4eoW8OsgHrbO7sCry7X9ZfzbAQTqPRJw8Y7RSeIiZ/o4Z8nBe7D?=
 =?us-ascii?Q?arYoLnwEOyDeZ3/A7PtqqFqOcdI+/TIDy8DUGfzjzP0RS+SesO7MCtF7YNFw?=
 =?us-ascii?Q?iipmeOZbqFzH29aTgawRs1KXu5YBXIXKTtGvmCZopvcSHlSmBw2B3m6A+GxJ?=
 =?us-ascii?Q?iocEHMWx+gC3jrs/qTqC+Eu47+bnqiRnigiBVeOv5jN+cZTyHAiX2FQDYJDd?=
 =?us-ascii?Q?vIL8R0gjecMRDNxMSD8K/OV1xDBLeBR7gdLg4WZ5WOLTnZ4JoqCWIkFT4IzV?=
 =?us-ascii?Q?KdkVoR+N/ejpbM03qendB+aCfWd+CJ0Ot1pFtcnCwlKhq/3LPHlPGdKGNlYd?=
 =?us-ascii?Q?MRuDAoleBcj/RlG1ny5hsz7isYyjq/E/hnmoJ45o54QNPIVr/B1DM+lMBfsd?=
 =?us-ascii?Q?mdxNYm0U7OSyDhz6l4LRIdjkzCK474HVrrq3ccPtfgCzwGf2t/vM+qlYghUg?=
 =?us-ascii?Q?VXH1uaQwE7b1f6JhEHzqKihtjAGVWscB45Bo8uLqCitM2/tfGpCdmHrKxavn?=
 =?us-ascii?Q?txyXAIvd3lRdK1BukaN7vG8plI5GRyF8jeZ0EFn5EzQ1mrSXJNhKIF6RQ+8V?=
 =?us-ascii?Q?lp0vMGtimwRY/UmebkEPIxsfUYTnH6wzpVNrhTqHf9SYCzRL3RfejznvSf0s?=
 =?us-ascii?Q?kkaNmOIR06h0HPAZyHRDHsn76VJ2dm6iANDJ50Zig5VIADmYmv+S9V5xcASo?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B051E361A0A6754FA1AF6893F67862A3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	H3OW62ekYJy0w1DXguSRuvJDK1qG62pirfgTzNK3xxNvqj9O2rT/vD4fV87EQirLnl92uJN8EUNUdtf3s01Ywqr/p7j0cK1JqriuUkCT6/bCUaNNSXxcLWyfFBbdHCu1+AJeqkHhis5K50+1SchtFEWIARqG7Tqg7LkTYyO4SBMKVpL6QJdto6wCNGavBxoY79v4zL1hQdELfGi3g+M4IZG+iWZSkoLLjvjmj/CfNq+icqebSyInVx/8gBCdRceFkEMirZLskGPpLqFqnmqnDUZAA3m/GVbZztPb6dgW4ojVn1RNnxyjKKRBVfGUAKrlnp5gWjffyMpx1ch6L6rtyvwX0mKAftHh9w5t0HCZblyow6k/5jNN5FxWgg2wDW/ti+UG0X0CyObGjlMTKbed1ZjiPev1SbsOEOptDFeeUv2Jr11DQ2hOUT1KX/pUicLNJ3s3nIYHtIzgAwsM8xsmI39rdM/mowarJhjPACupj3Hn2jXNVlt13wc1HCvxFiJIXd7+7A9dKoM4HfY+kggONJ7YzCK4D9Bbo+McTdVG2GPdiSlnCy9RCOCB2/boAiKDYrS8yPgNZeCXZ4tusqc1mDsmbyAG4igNYyrNWmE1LRs5e4/WUd7QRKwTxex7j6f2gScRPUk5x2+pv5Ws6ZPS4vmNpmuZj7TJAqfsYM64wbHbaNbbPahxAkuRAh8Y7i+Lb964fTSNFoBlydGvfBe6P9G8cWXTXhno67ZB6WtIyZW8aT9OTXgRPgiDtUB1AhPLdnFm+7Plcqc9Dnm5TmhDAJgWTB0vjPgkVzEPvPbigtA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e76aed-bf24-41f0-fd07-08db14f10d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 16:22:55.0629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLBpZbNH7HKb+FWvfNE2KwzTaMGl/3Aw4JhdPUa05wXmk/gXVT5/FbTW7tEqdDRC+zD2/iRG1or+9PMWtG/Dlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_06,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220143
X-Proofpoint-GUID: 9oSj0GdqSln3L9kV5jKpTCJjkILyGla0
X-Proofpoint-ORIG-GUID: 9oSj0GdqSln3L9kV5jKpTCJjkILyGla0



> On Feb 17, 2023, at 6:56 AM, Chuck Lever III <chuck.lever@oracle.com> wro=
te:
>=20
>=20
>=20
>> On Feb 17, 2023, at 6:36 AM, Hannes Reinecke <hare@suse.de> wrote:
>>=20
>> On 2/16/23 18:17, Chuck Lever III wrote:
>>>> On Feb 16, 2023, at 11:57 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>=20
>>>>=20
>>>> I've got some patches queued up to enable PSK for v4 (both client and =
server side), how should I post them? Here on the list or on the general li=
nux-block / linux-nvme list?
>>> Start here, let's see what you got.
>> Done.
>>=20
>> Handshake looks good, _except_ that the server side refuses to fetch new=
 packets until client side closes the connection due to a timeout:
>>=20
>> tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Preparing Packet Handsh=
ake(22) with length: 559 and min pad: 0
>> tlshd[11024]: (11024) gnutls(9): ENC[0x209cc40]: cipher: NULL, MAC: MAC-=
NULL, Epoch: 0
>> tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Sent Packet[1] Handshak=
e(22) in epoch 0 and length: 564
>> tlshd[11024]: (11024) gnutls: The operation timed out (-319)
>> tlshd[11024]: (11024) Handshake with c472.arch.suse.de (10.161.60.216) f=
ailed
>> tlshd[11023]: (11023) gnutls(5): REC[0x209cbc0]: SSL 3.1 Handshake packe=
t received. Epoch 0, length: 559
>>=20
>> Any idea what could be causing it?
>=20
> Since the handshake failed, my first guess is that you haven't
> re-enabled your server's data_ready callback when the handshake
> fails.

I noticed this while working on v5:

+static int tls_handshake_put_accept_resp(struct sk_buff *msg,
+					 struct tls_handshake_req *treq)
+{
+	struct nlattr *entry_attr;
+	int ret;
+
+	ret =3D -EMSGSIZE;
+	entry_attr =3D nla_nest_start(msg, HANDSHAKE_GENL_ATTR_ACCEPT);
+	if (!entry_attr)
+		goto out;
+
+	ret =3D nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_TYPE,
+			  HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO);
+	if (ret < 0)
+		goto out;

This is unconditionally setting TLS_TYPE to CLIENTHELLO.
Instead, it needs to do this:

+	ret =3D nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_TYPE,
+			  treq->th_type);

That way the handshake agent sees a SERVERHELLO request.


> But honestly I haven't tested the case where the handshake
> fails but the server wants to continue using the socket.
> Obviously that is something we want to work -- the server
> itself needs to decide whether to continue using that
> connection.
>=20
>=20
>> (And I checked, the ClientHello packet really is on the wire, so it's a =
server-side thingie).
>> I'm pretty sure the server side doesn't set any callbacks to the socket =
(yet), so I'm a bit at a loss what could be the reason here.
>=20
> --
> Chuck Lever
>=20
>=20
>=20
>=20

--
Chuck Lever



