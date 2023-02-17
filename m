Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD36AA9
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 13:57:23 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7hhN2027198;
	Fri, 17 Feb 2023 11:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=nvhUL9qCM3b//csFFI/PNcHggXkqvm5PV4mVjyQxfd4=;
 b=1PzSeL6ykZ4XbGGOM5YIFCWQGP5EXUQkkybbPiJSn2B60maqXqbEQo0prTI0F3hVkugG
 5Um4im4ckiUIdN/6GXAB3qJbe7Oel5b6+AiWgJDuUaRUMt5FgHlJ6JtPOH3ga3SeRQvW
 7KM/dTnVyoAoEnIUgvyptKuqk7kxne72y9RhwXF66YBjxU4PCmGPcbOUAvgtQYIDyIp1
 0pHd/38HkBw3BtMjZ4yQg+vesnFtrXT6jjDpql/kAhSj38w3wLmuNhjFNLWIA9tyh7gA
 zcND1ZeoWtcn3bIxlsoWPNmzLW/bRy4Ln9RXDCnR746Vh8iC3Zp1IZ+R0qYHLzscW/hf BA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np32cnrtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:56:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HALGET036070;
	Fri, 17 Feb 2023 11:56:07 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa2n4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 11:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwg1dXdnDYkF33SdSCI86Xz4E9U5fGUX90MEj5jAsuAb2FsrkrLkHHeKfYVMBDNOuPEyNdMVgtW6OCpr9C9tKiPXV6aCdN5zraQGAtjwPZiFHlr1TtPpl/m7xV08bpZMpAj91TyXlfmcUZ02F2qXeFXYzCubnTIG5oEzZzPUsrzMReTVf/LnU7hIOcGw18BAV0slLYzFIgA1rxWu7sO9RXZ7uuY7WqPIcv73YQkl+yUZ3+2LqB4mohe+HR4zEGsf07BUo8CBLMjt4+dyhceOG26CP5QgGJ/ngrpbD2ilkHb2SsOPw7X30grZaFU9KDsLY2v8LNiHccWyNUqZ0p5V4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvhUL9qCM3b//csFFI/PNcHggXkqvm5PV4mVjyQxfd4=;
 b=PwVVz4hGkXp1A5OwrUn+YfY3bNDyEnZXDDLak2aXDMil1dblkFmUan8YxqTcA7xWEMjIorqoaZ1kavtQS5z32CQ2jbEuojH3+f02OEW/WXd5TtBrzRYWFeisEPbov3ve/bqP+cjSDYNztBNq3qArtaiiPQGq9yiWsu/xX74DakNsYHpNgLHzS7Ju7Nm9fT/bHdVvLiOOx11Aij46y1+3g86Xa16+4I1Mosf+sbsq6iyUGTOBT273H7qGpahkt1+LfosMgpSFRGu4WTeuJahRMBFA9a3nnyJszLc5yaCVwhLKMvx0Wx+Aqm8aI+NUcH8lhBZRPa4opCrRXiQZtFLyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvhUL9qCM3b//csFFI/PNcHggXkqvm5PV4mVjyQxfd4=;
 b=Em31w40vxJNPYUcz18GiRM40tfQx91LpOZIchCbc0m1PWYuHu0UEFsGoaHg4Jshbi5fdTvJWEPfl2UPqXaxeDh3byKWEJVA5Va4LLz2BLATrwmcB21ZJ7tfZKxjrxIg7btnz6dLzDN3XOWWlAVW3IJkQeid0sfpZaKKWxWSeS6g=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB4877.namprd10.prod.outlook.com (2603:10b6:5:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.13; Fri, 17 Feb
 2023 11:56:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 11:56:05 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Test results from v4
Thread-Topic: Test results from v4
Thread-Index: AQHZQh+Dx9f0SmrC/0yC4lLUT8Ke3q7RvBcAgAAPNYCAAAVwgIABMxcAgAAFjQA=
Date: Fri, 17 Feb 2023 11:56:05 +0000
Message-ID: <F3635EA5-456E-4226-952C-6C7A96B20B14@oracle.com>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
 <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
 <66F7EBA7-AA44-4FAD-B7E2-20FBEBC74C2A@oracle.com>
 <0aafe14a-5153-c02c-85d3-9568bc7e3bd0@suse.de>
In-Reply-To: <0aafe14a-5153-c02c-85d3-9568bc7e3bd0@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB4877:EE_
x-ms-office365-filtering-correlation-id: 4dbe0539-c74d-46c5-756e-08db10ddf2f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 axy5b8aDBzZDtJq4BKdemKKlND2f/3hGpzSzPOGidOGAJELgVjDTVYxUz+nmibklPzv6yBPY2NrI4UQHaxWuYGK3BvuH0VWqdi32Ovk+TOCC7ghwwhnpZVfJgji40n6i4ZHdC5f2a9s6ui5NM2iiOuNjmtsRadsvEBw/0MZxl+mv9KyRU+peX7+ADzldBxwX2GkhH1gAfGI4aIMpJ3zPI4I9To0b6UFfSe3b7gQ1/08Z2zfA1HhlLkO3B2BOJs5G1nXF8fZmmnZlZxX1sEPU0ymLXAo+wQ46eMHmEj5k5lKbk/iqU1uO+dT/+n+0prZDwEpf7B67SsXbPQaQCvTlZ/gHl4VJYi9j2bOjRK06d6cBACIlpCEMi4cB+SRRbxW054IKnlZtSddoAcjT9Re63Uj7vufi4T65ArYFeVFhqSYZtM7CyniJRCGYQZIzrLcE4H14Xirb9u6LY4s83+FbWkZQjdsGF2+zo0lhuTMCgNJLhYgYflqRKLYFc+D99R6OHBzlZISbvQzVWhO/Uc2JTaruM366Lble91aFVRFovNGWOJBGta1KZy24OruBD1+x0NM8FZvmnRLH6XLI+ZVJL+VQSKIj2yiSOHdJtzK30tms5UlnSHV/MQWcoWV/iS6JS+8fM0qv2hWilzpQ/flezDB9K4uaGE3NxGrnpNL8dPGZKXSjFlWq55iermP9xCRVrIZB9zpZh/H+6Ra3PcA6/niHo7maXugeMJNHPpRvaBU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(38070700005)(71200400001)(122000001)(2616005)(83380400001)(5660300002)(41300700001)(6486002)(66446008)(36756003)(64756008)(6916009)(66556008)(66946007)(66476007)(4326008)(8676002)(76116006)(86362001)(33656002)(91956017)(316002)(478600001)(8936002)(2906002)(38100700002)(26005)(186003)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3A55sNDaQDB/q2DX/8S/YoHGt9AmCioJhpjA+/BLvAp2n2Vq5HcSg5vPlOW6?=
 =?us-ascii?Q?3ivsn6wlIR2A1+fgSRowEDV4jbGVB++ZANinRFQ7o0yZ1FbYlnyMketCT1Jv?=
 =?us-ascii?Q?OiVE2WIHY6lG0Qxb2QsLcs9gRWC+IsUOK7Jh6z4i5E/RBq+YE9YV4SvEa5Eu?=
 =?us-ascii?Q?k4pwPeqPI1LpMAHlbRPVZGHNJwYM6undDhj20chPFk+0SlS2RBbwJ5jUCeBC?=
 =?us-ascii?Q?cXxhy+0Zg5qur8z44sZ/GxAUXDThFLbdPG8/7OpJ5c78hjeKS3gnInBFMazd?=
 =?us-ascii?Q?PdNLXRfHrKPTBBC61YgtVEI/fGxqq93a4Xf3mM8f0nRDXATQSGvcOPd2hufw?=
 =?us-ascii?Q?CvLwJabCY6tiNa5CpYuDAK6uVC3vwKryDFb8lZZ5breVgSeLIXj42hi/l0Z5?=
 =?us-ascii?Q?gQHp4d71T7eWtg+P95dv9+hMq3iFOw+qNorzfJTLWi5BXT0IOe7ct3C9s0+Q?=
 =?us-ascii?Q?PSLFxPDFprHHebMY1Y2p0T4gxe3T3wOrzp+X6Ylb88qBhtjT0gfihPW4TAvC?=
 =?us-ascii?Q?QKKAn8QxmRkxSzVOoLQ+aLOjno3dsVKLcmM8FtAPJrqNlpuNTQG9uKrqrYIo?=
 =?us-ascii?Q?p/lPmf3Ri7DTx2Lig/+w4toI/AtFhXEPUYnqc5ZBBhcpe5fElOOSY308Cfme?=
 =?us-ascii?Q?zPXrRB+/hEaSJVxgs6ITUpoX5jRMMPnYYdm0AX7lHu3xadjKa3iG6mVkGqkE?=
 =?us-ascii?Q?PEUd5i1kiX7xA28afaloOCLOBE8d9lT+ZIN9NvGpadILwhUYdLR/b3CzkrA3?=
 =?us-ascii?Q?CXdyThcQVR1chqL2tDT1zlHVOn3GDR7WgCl4XdJ99fsPSi6yMjqhbWR6Jygm?=
 =?us-ascii?Q?6+06yGNZSAXTwMEYyEKbSHWc/j1qPTmXBJQ3kETIRyCt04NzsqIUhlVev48Z?=
 =?us-ascii?Q?pckUhfdE5K8U2ENmGmDgNqaGJvTNVC68mZBQi9xONGVVRoejOtyWVSIGjvvk?=
 =?us-ascii?Q?G/VRKmwsdzrZ7a0nYg+HLy6nUiNwST7eQ23iAZMUpFXnLYMrz1AXnArLoHw6?=
 =?us-ascii?Q?lWV1Wx2iRaTUi5xh4MdukK3lpZkXvVryP3bwm1eqUYFXIUHvaxUvvKw98F0T?=
 =?us-ascii?Q?7S9WYSJRcyZDWkn9HaQrz2fz2zM0osEyTPh9m1Ci11ehPxai/P8NQUw+IBsc?=
 =?us-ascii?Q?tX776Q/000DL6XzkE5mJZiBUdQw3uqX5jVu+0uCGveWVk0MiDHzb6aDZENjq?=
 =?us-ascii?Q?MjAhSTPKK978VxARB2GE8I7u3Br8Pk9QP3SVFOZLSDHxeJ2n5vRiyo2Me2ME?=
 =?us-ascii?Q?7hZe8RVhvqR+/cs6wJJ6+jpb44rJs9j9wGWNMLDY99YjTgwCJO3iYD1ZJ9Bc?=
 =?us-ascii?Q?nL+FMFZcIlAriP7BgECxGUHUdl1Can/Hw2JFZzkfMH7t2iquRJWCfZhjf2wk?=
 =?us-ascii?Q?ZPU3XkEiGzsswclvprSxGqBAZADzfr1LJNaDXFkyZZ0s/n4KJO4Qv+9ieTCv?=
 =?us-ascii?Q?OFa98t6MibZ2nl1gxqIHpjbZl4b5SvgCEWFVUUSao7PEmQTw6DoOOAzgBDXc?=
 =?us-ascii?Q?u6VDn3be9ZqbSfMXJIPmspfnWeNBZbfwDcsdfu4J6sFBI7Tkkh5xCHHoUKmY?=
 =?us-ascii?Q?OThtYmzkBEZVpEODaKMWVT1RBf+bBVV/7cBkjdMDuvASGsQvjzxLiuQ6U77l?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA833B9F8DDE3D4381FEE53ACEAA1E18@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IzIKPy6J9NFfFhqhM4Db6FydwD/a5UD0weK4nP9gOj2+8NNWN27fMpWt68DHsFoPa0c/hEBjZJlhjnFDuqkRKGZeMcXEJ2zQxmU7EldrUTlJvO9Q18+J/ChM/NxE33b3qgrFvZ/oU+1LGd2E5M/3lj7DpCHHqkTyDmK5w5WXDfTs5m3WQNPM6g8lvpCR3oPYggYeRQnmOKOvl6XyP32NjduwmZbi5M31AzRSKztnsQ4xLTp2VIdxf3KOzaPoUlh8Dv+fNle/QOWIueGnECwPOGMDF8j6x9LViLhUFUzCIzcoxCicQ/4+DoVSDA1B8qQFsmPcgQEHinJJtnseXntQzgQSQ4wzkDd9XH5TCCMUeFGq9/ZQf1nEZB4TgEVBU5EvM4WJsQEe5EijCrwQrp+f8wl60QVb12PBCZm5G490gWZvnpV1GLGGYB8EF5j1+KT6Mch+wPcMY/FYeAFcLxF3bpOr6gkePyb3uAru30ZuzwxZqYS6QHTcRcj9bxgAVBbwrnmzJp774pFKvethE0qWwyrpfhcsHk2OIA8v+5moLLvNLcvNZiWTT3BXK2PidcGJtMT+N3/kN2lI3QdkhO57gkQAvvZK9t5x5s0OvRaj5al9QKLZIhgzbC1XeXQQOBJcGjBvSKU/uGHkNK19g7tvfAGCn1rBbsM9H3jabj0bo6JjlNRv/hHKFkCIM5AEB0eJHlLM9J9TqV/Vt8ClMPgO/Zk8MAqYUjGzE4YMkGoaTLl9ZyLZ1AWTG447fvGyTSRGOSkC2fBLX/ZScVTOSKFsLUTkL90/2BRwElESWmEIJuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbe0539-c74d-46c5-756e-08db10ddf2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 11:56:05.2537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSZ1UHRvmpjGN6tNqMAGMl7jsScfqrtwDWMlFcyMSNgMzFZ7Tj9lTwh2SwAJ8VQaKqbDkxEEwly00x4+whLgfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4877
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170107
X-Proofpoint-GUID: zMO_CgLsarqCRAWCJEDL7NzGxm3g3lvG
X-Proofpoint-ORIG-GUID: zMO_CgLsarqCRAWCJEDL7NzGxm3g3lvG



> On Feb 17, 2023, at 6:36 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/16/23 18:17, Chuck Lever III wrote:
>>> On Feb 16, 2023, at 11:57 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>>=20
>>> I've got some patches queued up to enable PSK for v4 (both client and s=
erver side), how should I post them? Here on the list or on the general lin=
ux-block / linux-nvme list?
>> Start here, let's see what you got.
> Done.
>=20
> Handshake looks good, _except_ that the server side refuses to fetch new =
packets until client side closes the connection due to a timeout:
>=20
> tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Preparing Packet Handsha=
ke(22) with length: 559 and min pad: 0
> tlshd[11024]: (11024) gnutls(9): ENC[0x209cc40]: cipher: NULL, MAC: MAC-N=
ULL, Epoch: 0
> tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Sent Packet[1] Handshake=
(22) in epoch 0 and length: 564
> tlshd[11024]: (11024) gnutls: The operation timed out (-319)
> tlshd[11024]: (11024) Handshake with c472.arch.suse.de (10.161.60.216) fa=
iled
> tlshd[11023]: (11023) gnutls(5): REC[0x209cbc0]: SSL 3.1 Handshake packet=
 received. Epoch 0, length: 559
>=20
> Any idea what could be causing it?

Since the handshake failed, my first guess is that you haven't
re-enabled your server's data_ready callback when the handshake
fails.

But honestly I haven't tested the case where the handshake
fails but the server wants to continue using the socket.
Obviously that is something we want to work -- the server
itself needs to decide whether to continue using that
connection.


> (And I checked, the ClientHello packet really is on the wire, so it's a s=
erver-side thingie).
> I'm pretty sure the server side doesn't set any callbacks to the socket (=
yet), so I'm a bit at a loss what could be the reason here.

--
Chuck Lever



