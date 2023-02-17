Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6493D65
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:32:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7i7pT006248;
	Fri, 17 Feb 2023 12:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fUk1iEWkaHws9NE7aRuN9zTHHG0z17VOEkcjNX1Q18c=;
 b=seTC607fM01JX42Y4rnQl36BwKHNMjyg75z7/z9APPiBxmBPlPJf9H1SBE4hTWhyJx/z
 7smF8OB7i1/aRFS/wCmwlJa9W91yZvkSdzLpFMPd0gQQKHJfsN28geVZLSI5FbLkDAKI
 5Q3wdC5+Skio/1i17H1gX7so94mL6dKSTAfWhmNdvnxbPEuS20Yf0MriCc6H2OPEl5H+
 aFBmDzNSqvrPMGO2U0W8/zRkoiQbKd7B9fiWkctOIl18Wp+Dr66ZxhmvYzaTx7WWD5Df
 LB8AoVtIgoywwUIUdQJ+D9hTNlvb6KlTDBrz7RAlbt4nOQydxBzPUH62xenFAQk3yA/8 aQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m15w2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:32:37 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HA2Ygb022839;
	Fri, 17 Feb 2023 12:32:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa28b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9MD09ePvudZKjsD4nFx92zoew0VYGo5sNun2O4QTHK7MGybO1H4nIrzGkhRfiNzLHghH+zuYv+4rAhmfQZ8anVuOIRHq91EKa/Z0YHv7MtuA5MmmYWSBajCvpgVbd0f8sd6PRROPyGWu1CAZCSXECGiWdWAMYhYi23jjGE9Arp29MU8rrDQ0sCkdCQeN0ocjIRRgwN/gzbwSncptEC2DRPLf8r9kejiUoTaj6rfpwbqYfI+mWSgjRD0g3dV4unan3mcM2aLH4pZJQSbJ85GODMHSyJ9LgmCT78J8diuJQnC21/2ytx/UY1ry1xxxTc0KVraFhYEMaxIQZPMYDdJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUk1iEWkaHws9NE7aRuN9zTHHG0z17VOEkcjNX1Q18c=;
 b=ZGj1zjmqsrJwqjvfr0huuv+5Y0MBNFxhjLmxRV0oguxTpORXi202WsydYgH2Rxq+EEVcOe/Ycbrk8g3YxOn/H3dKhQ7hProcyifF2M52wyZ3O56Vl4diXrCOXLfeyq2DxVXMwHhOADlZ9uIFvuF79oeDTuRH6lYaZa7V3WvEQXWE5svXH8K1vZwTgTmXdP68G5vwLho5xGIe9hL6f8Qvtcscw5wk9BcxE03yfMaH/NX0D+t1l0yzJsKxcZBHDtBbGa0Aymt6lT7Wk1KM0OMlkasf1TzqVXOlQvcusrQgSmqB+See7spCI5S8kp3i6yJsAjWfphGBtKOnWhnZ9z5NfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUk1iEWkaHws9NE7aRuN9zTHHG0z17VOEkcjNX1Q18c=;
 b=aNUPcnz3YNoJ16y0ePVRWJzbMBa4inooty6I4Y9x3j+wTilIUZh5bP8iUh7g7/oroq4jMbrRFwAYyoaNwdYmhmUjAA7ONn6CkCgY2wr85rZEPOiY08Dh10NaZbNkO9StcmBzsKfJNmxUxkUSybHMX9MfJY667fpS4TJ0Iz9/kpM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB5830.namprd10.prod.outlook.com (2603:10b6:510:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 12:32:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 12:32:33 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Topic: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Index: AQHZQsNvC2IL5YDnyE6t4SYpSohVu67TCWCAgAAGoYCAAAJHAA==
Date: Fri, 17 Feb 2023 12:32:32 +0000
Message-ID: <2A306B7C-583D-4746-AD31-F7E9DD895209@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-3-hare@suse.de>
 <53831F87-46AC-457C-BF87-83A7EFF04120@oracle.com>
 <89b2e4b6-3f9e-51f4-1a6c-ec9a94208c84@suse.de>
In-Reply-To: <89b2e4b6-3f9e-51f4-1a6c-ec9a94208c84@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB5830:EE_
x-ms-office365-filtering-correlation-id: ecc7bc7d-8e57-43f7-02a1-08db10e30af0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IZRUEN0H3VCuqJKSJjbNzxKbqQH31gURiawGJ1CUeepBnN7LPadF7lRSXLrdhF236Py5rYDm7Ggegj/2dG6JoqZF6WGl/cViv6FFQc/eSxwSmyr19vH5hUt+X0ACqZYB0xeNpWSVpln4IqTlPPG9Fdg45kL7HJFf7EwPa8xAuXL80aOhTWRWEubE85YHzGjWOKY1N1v8vmLe5Bc0MRWtbRwppP6cXHehDJUelQAdsO1/2ShcE1oTZzxMR1sc9HQtx4QqJniJbced4/fseyILIUVkxtVcv4jgck00XIsHIpqAIbZeoBY4o1iXogYOfFLVO27eEWavbbsBIzOthlUZf2PCxbnZ3yaBU7zKokIJtlDSD+66Sas20beo5idAhTRx6ZP9LWKFzAeoH3MuU1kQxD9LdRuNEHZAcl9Z1dPpkqBcB0+Bl0gIbJUusLo/ggJ4izFoWt03BdhCskqo5jw5KleDQmES5SEWuCKqQRbIkuFDe08TDnBkl/2++7gepHKv7Moee8XooN0eLg2WWY97vnQcfoF4ePB8i6msNrUrTpz/4o/tCA8IxNcU4bz1n5QxEZeFvXCTP8pypcc+gZAEjAteiSi6WYPMnYznvcNcY9hehKYLKlnORBMOF/japainA66bBOxbLOSghR0fEdKlp5RFU/w7EciCkFrlTOlcoUFlsq5lI95ilNGH9BuzIDrqaz9sGq4Wz9ZXAWlkC8wDVA9cCVLysDBIYC1ciPSsGKA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(33656002)(2906002)(66476007)(91956017)(8676002)(66946007)(66446008)(6916009)(8936002)(76116006)(64756008)(4326008)(5660300002)(38070700005)(38100700002)(66556008)(86362001)(122000001)(36756003)(478600001)(71200400001)(6486002)(316002)(6506007)(41300700001)(26005)(2616005)(83380400001)(6512007)(186003)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3Klbvac9mmd+cmMGTkkvLvE9ajTfM0FkqBEfR2VDfZosjAeESVmzkJGwUNaF?=
 =?us-ascii?Q?dHbwfMBXUl5HKIV5/PgRNY92HGCAM/Fq/e8NC0pjfZfsJJbrC/dvhUwLL5N0?=
 =?us-ascii?Q?T9LQ8BFH/DPsie5PpR+KymPgioqbMvGMBeS/g0KeoWzkk+xjp3gkFd8LyOqJ?=
 =?us-ascii?Q?vgVNN0VtsCkLXMeemDqastmbuuT35WCLOaDd6g32F4MWPu2RtYKu0GxNVp3G?=
 =?us-ascii?Q?/riX7gqHeg50wATG2PVyhd5mTsYPUzjmWCRsGepRLqPlGR0wkpdYhjJHL54f?=
 =?us-ascii?Q?vpCRDQqarwqVChaYJw9v5EQgqaga2TTwNAYkxdoR2qAB4KvgrMXrEG2QVbuV?=
 =?us-ascii?Q?UEedghM0gqGGAJ6oXXj+X1VSFapcdGRTW1eEQeEwaefvZB9ioh/TmJtt5Xk0?=
 =?us-ascii?Q?h0tkxaSLERogeHS+b+AMRPCGacflKIpIDXD/v3i/uzTHg8zd06IbhkQAVBYq?=
 =?us-ascii?Q?aDbMdTseRvTQObGXG+mBxUR/z3jOZkARmbBTRVS57OcQ6wWoRCqxdbw9ggR6?=
 =?us-ascii?Q?w48jFf69k3rziGfCg3FBbK7dgmUraZM1fCE+oH+NrMBUJDB+VYobayYPzINq?=
 =?us-ascii?Q?ubx99L3hDtqnNVVgPPJL4h9+iFizVl23tAcZoD4wS9p0U/Es/C796/lxoWug?=
 =?us-ascii?Q?en2AsWrUiTS5Ntii4NJjDZfvYNFM3QvwnDp2UnD+NfdaCAQzeO8e2m5bK8PJ?=
 =?us-ascii?Q?yKiN2q/kUgCTgjRWqJFA39GXgTu8hJjokTbHLcnzKj5Gc8tNwxcLcwg9sCwe?=
 =?us-ascii?Q?3gCVTHn9MksX8BE3/Hwi6mqOQTr6FxOT64GWXfhCFsTrZKPfqVIB33kzHOpO?=
 =?us-ascii?Q?3ZJp5VcfOGQBDrEWIKxMtlx30l8VwEilrM0qfzZEY+pTvxnZ/cU2wOVcieTq?=
 =?us-ascii?Q?j4vKc7zuCAoQaXxDEOT9GF0thBwAmK38egl8l6klCyTlj8Z/kxhyEyXoC4hJ?=
 =?us-ascii?Q?dDRKUH8iuL4f9Lx9bI/ZChI9KzXCrujFujhuBK+2NCHdsHyYWUS4RM2ucVDf?=
 =?us-ascii?Q?2JlPSFMFuXqsXUbnsNZOAeT+ONxieij9vATe6Wwua024CUkuSCWGTUdAv2hx?=
 =?us-ascii?Q?+Zp1rducn2ErUq3bSuGAnx8n3F+YeMZWJuTq8dPKGORRGxKH7eI0XJgzeF58?=
 =?us-ascii?Q?1LvgAumzM2kOTnO4n/5whEZK69HpbKhBt5yqB4sFsKmLjByiHy9TTSeGBnxB?=
 =?us-ascii?Q?rJZZbG/kT4iMcEgo+qo3gBSEqZSWQewV48Br93/yG8sQOyXIuD1gYkDX5bF+?=
 =?us-ascii?Q?Bm96jfjmEu6H983BRmjltWrtTWnnZlBGVzaTxgECURsEm7XkBvHDssDHirvU?=
 =?us-ascii?Q?DfMPabSy6Dcud3r9ZTIWbUNue1Q1CNUXWhS5wRjikQl96yb2OvCijECyDS1I?=
 =?us-ascii?Q?ubSCtIeL0ialcdhc6sQmosTz8Ga2oxwotXJNaGT9wN44pdiibfqLC0s56Ynk?=
 =?us-ascii?Q?x0EprudPcDXWLlec4c85BH9H/TUuEwmksrcCQ3SnmCtChoJGcBIQG0nVkRn9?=
 =?us-ascii?Q?2HiArG5tq4RcXdw7cIFfAkPZPdo+1f6oEtXEHyXQimZPGysc4vfKidaCsbhD?=
 =?us-ascii?Q?C3OMe6GQneyd2YuMUrcfIcMOz4FPmtQy9cNNqJ91pvxyc/A/uysY6VkBWmqX?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD83970255C4B9488D6D5EB2C383292F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gi/WHSKS9ldca6rJkFmEdV8q+G2ViPGHrUIhiqmSzJ2xDqKhTsY69MErkuX40G6kyJZHDl4ay611PG9O2EXykXbfJ6e0wbiIdD6a41H8wjL22NUDP3WfwT2np/htspFF4qkGaxY9lNb/uOsDrvayCqy0hr1lNBHH6DgQz5rYQ6y74sS5YeUiWKuP3oA5pACUaIytTKC3TFXKK6uBR65nEBEgkyLJKehU0OpFW1UglA4FBtpfcpDXMFZd69wTQeenKCcA3JmS9behTy3m2Wg16QE+SUrzenz5PoDxdwgWGjeBdpv2Iol3BoKFTOcorYKOZ/24kPUdcBRftQ2834yM512STXPQ+OszrbJt9hEshc14xRnGerP8I84mfPy0GCaNH2D3bU55DR6psXPMpGSe5ZShZcjMCLGvwH69DD2RemOlye0FWDhRaFBFjuchB3pslIHvvi2/CIfC2XW4u8tq6ieosLvOusJFQeTnU9lbI6S/1jhf+q+Y7Gsxa6Cbld1tBjg7z6W9fEELs61jjqhPp3IQrxp1/gSPqq6Evbu7GmpWYE4zB3eXwD8sOLE0rGYutZ+onKVlARS4ELQeXDTpS2gcXZKuE9oBUwPDBhtjFpHwfsmrTufB6LEXOzHq9bvbDO31EnElvzw6jAs8LLlgeVyv0BdisBiplBkzs1YUvx1y9hyB+0kSxwtFzFYZNSWep1KFt3MDtabq8BeAeyw8EimzkzfEuYdvPuAkW1tFZo4DVvxU9DXPmlCATwwcyTC+B38ImQeh5ZWFyTJM6SU/cLDR7XkqnyLpV7DMErU8dsk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc7bc7d-8e57-43f7-02a1-08db10e30af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:32:32.9867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEPeK+RGzBDP23SRd6vR/aVgVEbvZgZCeIh5yBEGUgIGo20XfbPt6/qkUkMQhIhShb2LMUf5rY2Fy7HfdztddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170112
X-Proofpoint-GUID: aRXms1QjCw3URPKC7Y-NIzQfMJwqOzG-
X-Proofpoint-ORIG-GUID: aRXms1QjCw3URPKC7Y-NIzQfMJwqOzG-



> On Feb 17, 2023, at 7:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/17/23 13:00, Chuck Lever III wrote:
>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> Add a 'keyring' netlink attribute to the 'request' netlink
>>> message to allow the kernel to communicate the keyring to use
>>> to userspace.
>> Can you add some detail about the use case? I'm not
>> clear about how the keyring is to be used.
>> Is this keyring going to be the same for all operations
>> with this particular tlshd? If that's the case, why not
>> have tlshd do a GET_KEYRING downcall once when it starts
>> up?
> And that's the key (sic!) here:
> with this attribute each tlshd instance can have a _different_
> keyring.

What do you mean by "tlshd instance"? Do you mean each tlshd
child process needs its own keyring?


> Idea is to prep the server side with the keyring to use, and then
> reflect that choice to the userspace application such that it can
> lookup the key in that keyring, too.
>=20
> (Note to self: need to change the initial keyring to be the process keyri=
ng, not the session keyring for that to work)
>=20
> With that we can be sure that both sides (kernel and userspace) will have=
 access to the same set of keys.
> Idea is to have only _one_ place which need to be configured; in this
> case you would need to update the kernel side to allow for individual
> keyrings.
> Without this you would need to configure tlshd to use the correct keys, a=
nd it'll be rather tricky to configure different keys for individual connec=
tions.

I thought the issue was keeping the keys private by setting up
a keyring that is accessible only to the kernel and that tlshd
instance? Did I miss something?

Seems like the tlshd child's process keyring is already set up
this way? I'd like to understand if there's already something
available to fill this role.

--
Chuck Lever



