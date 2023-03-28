Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F098BEB
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:47:41 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SEe6BC023065;
	Tue, 28 Mar 2023 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=RusS8aCFFZQExZOtdHbX07ZFChFkj/drulAwTNASPGU=;
 b=JJ6cT8FathcAddtFA31SoulC5IhqG9yYC2XXkC9Q2OlwR37r3r0yTUV6uKa7HskB2M7t
 LezIh2DIyFNGnR7qRadUh0seJYzOMRg8NqKXDhzrHoR1aq2/EbE5q7RnE0+s3sWoAkXh
 sG9x8rzzXUcj0mru0JUiJHIZy2v4OrsLScMqZIYsM5s2rJkSoRByWMIQsjaSRrmkMTjs
 IFU56ai/Nbq15Cb/CZVQaDsfTmQQznarciQFy/3WMR6aAkoWZJwStGsSckKRwCixHemV
 Ias+fQ9Lok+SAhkiJ/PwIZSHMFwyxUielAIr+cCT7+R67Ba3tADFgMpFf2KMlWrqlYq9 mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm26rg2wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:47:34 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SELm41005502;
	Tue, 28 Mar 2023 14:47:27 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd6gnu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYvFVEmn4sP3g/3CJolwwjPUXYnZBkUaWsMVP8gA2l1/e9vZPux1OLAlfDS4oI23pHlj1KXyOQycSM+f0osCxXKwnSjbmKflYTQLm22cd8Co1Tu6dXoBQYKoNThyKrV9Z+4GM/zEOmNPH5mjSOFIkYHQLMyBqHxflQBKepVBSw/hdMYUsN3E424e2FiTO3Jl8gclLww9EuyXibEQUUcFxk/MWVrXeDC070mnJzbmS9kQdet/RTfLOfbZ7Pi5i5auIX0j4bvSiECvMxu1Jx0RgEPnUUCEi9OKYfG1dwydFo0jOys5aj+tQ+sd5hDgxcFXMI8/jG2uTs1hTJMQFOO/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RusS8aCFFZQExZOtdHbX07ZFChFkj/drulAwTNASPGU=;
 b=ildrMZwGbSvhsEk5XhR2CMSHmiikCKbPFK086DgDyC5JEI43vihrEN/0Wkw0GhGpP/xyRi2P1htSftjg8PyPG8eAg3eqW6GtKgv6muUFOnSTIcLojRZ2Q2koeDAmzp6/syRMp2N1p421XWVR4+lJHtrJhq0ZZ2i0Dx+vTc1hP8Ts8RAXg/rUNRTvMoF4cNIjoPV/2tDIPp+N3M43+Txgjf+X1a7e1NVSRIHz1jKDcrOPKU+5/IVykldEU1annSXFEwNWkD/SCAkqMEw/SjIAtkSMeRCrbpEC7PJb79yLOirpyOwDSAEYMB3iNTHynysIiKUCrsS7J8urk2qfWOVdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RusS8aCFFZQExZOtdHbX07ZFChFkj/drulAwTNASPGU=;
 b=cCk4SkLzY5u+aN69SdG+dHxhhcJPvWk1gNQ84fFcOuaSQdx0bSunYCYY0kPGOaNP0xRajBenrAGPvTnzhXLm6a7Oyt+W+1E+thH0yW+WNUgbRKvY+RN0jy9an8V15GfgJWPMNwRJMSmKVeKkBoz3YjqTpp7C5lru1/XijKcG39c=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN2PR10MB4127.namprd10.prod.outlook.com (2603:10b6:208:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 14:47:25 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 14:47:25 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: Jeff Layton <jlayton@kernel.org>,
        "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: 
 AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QL9wAgAAHJwCAAAUpAIAAAyWAgAADtYCAAAGpAIAAANuA
Date: Tue, 28 Mar 2023 14:47:25 +0000
Message-ID: <F31CB471-2480-4E16-9840-E3D637B6E38E@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
 <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
 <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
 <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com>
 <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
 <CAN-5tyHLRkhn6wiEMf-JfbSWR-ovi9GZ4THvP9bmTJxTENc8iA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyHLRkhn6wiEMf-JfbSWR-ovi9GZ4THvP9bmTJxTENc8iA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MN2PR10MB4127:EE_
x-ms-office365-filtering-correlation-id: e49d8a4c-7fc4-433a-94da-08db2f9b58c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LlD/GVmX6zsO8QSqZINMEw1YpkrWUDg/Ww9qWZ59vOYCZcdK/QJB5xFFjPNbvGe7G3gEeK+g+KYAzmT7ctwVhyXFdgmcWj48OG+2x1Wd0AIue7OBuPnPWaoWpUwSiYWwUcvXVgTuBE4FldlbmBx9qfi2/nfzCSpoWV2oMBClEGiJ4jiMlFRVDsTotX7IpqSHLTvYvB3I2JRjVk79qGKDhcl8pM1TuFh/6UB7jvn6P3OxrlHoYk3+kJ+ITjRPo5Q+4VGvYV+FgUk6lme03z/7ByMru+fjpbuvRTca8PRvrJ8PBG3eIcyep788Lmv5euH1fWa20ZyPwdTn0vBYnaMOfRLfdHe3ujaly95I2dXBbLdKv31ekblBljxrAbG7EuEUd+1c9Dih6BTlmrUcMmpqlPNinO53j/xBkyyaNsQqR+DwlKRRxXELDP/a42xFVJgRTnmLMSDbXf/UNV2GaErT/uLLP1t2d0HTQCj6/YH740Tc96zukQJX78fgvHnTvl9rhzvyvht3nOsEArM7b/+B5g6XgxAo6pjVqsciwphc9XwriZrj6B43GqFI7TcDvXr9vW0SzBnmkYvzFI/69MYwsxEg0nrR1mfJEAo2P5tlO+w4St8t0nr68JVQ6w7sXcPraF3kRI19a/wtA86aygpP9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(91956017)(2616005)(83380400001)(2906002)(8676002)(6916009)(64756008)(66946007)(66556008)(4326008)(66476007)(6512007)(478600001)(76116006)(54906003)(71200400001)(38070700005)(316002)(26005)(53546011)(4744005)(186003)(6506007)(36756003)(86362001)(41300700001)(66446008)(122000001)(6486002)(33656002)(38100700002)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GbgyuaRJHOGfyPpYyNMDZrIEHfFg7tiWilGWf426xXOj/CPEOa0w+rUtVRfH?=
 =?us-ascii?Q?JTgGmwyBCt2ZwFLWO8vrDAMuYbhBqo2uVUrEaKTuPxV8zVqHG4JLfoG1V6sK?=
 =?us-ascii?Q?0pqBNB/b3C9f6m2ZB/m4VQ1EDjNEOj6DXMGLNCm6Tmb2xz2UT/0/FxRES0Cr?=
 =?us-ascii?Q?VzzC6NoNJ+iWKDJfsWwZeVseBHpRLl7Uw6yBoQ80KHP0cWdEavZqTIux6ReR?=
 =?us-ascii?Q?HjTcFvlaNxLYG4eM8O/mV+H5citEoSEaFNANgVWe8fubyNE0tRqkCFYPisBp?=
 =?us-ascii?Q?36c7svGKptgIRnmarNRd2Hwoy5JLgf4UTWyYAeyFCWz/SAerRm7r8sNGX6Rk?=
 =?us-ascii?Q?aL+hnsARbJCO071R6D2CdxhapL+WnDOos9bGnp9HF6tg9FwLjRYBK1XXxZV3?=
 =?us-ascii?Q?lcu0hGbCn9Ilqm0ZPDAQ4AZm4OzM1+O+R79ncFHd2VJOGFzq9f1IUPbHJ19c?=
 =?us-ascii?Q?pyM6/G3Hp4+KogmMVUqL45kcLx/jICj94mOzBU8j+Fot3X59KCgVrM2I6GmR?=
 =?us-ascii?Q?AvnWUdDSwgytgOrbqgdw7JXH877XcC9d2usqajilPNkJxrSE6NoUkA1TSlA4?=
 =?us-ascii?Q?IsmGPQG6hoiZQ2CvjCOxJIBqtjKsOlYVEeN9DuPrWlmRCxyyXywNBrxPZulW?=
 =?us-ascii?Q?8Yh7V/5K3m2Ec2RDxU7VpgaLF2oQlUvdwtvXk5fTnRj6gLqmQ9BgWXysvy+d?=
 =?us-ascii?Q?TS0zxugSswDHSkgo5El76hWz3/HUqHV5BUo3LgBZJgkJ5ezUjT2ge94mzKVa?=
 =?us-ascii?Q?E/6i4/uE+B2Cx7W/MdZm2qxd1KLXgtD2aB3A00YA4cnYWeKhYnLpCRI+/JUK?=
 =?us-ascii?Q?CDhWLkzTJkYqRkw3jezSJVPmnQP2W0jRQ2u4NaGVtMltBwoW+5s7CpPDvltv?=
 =?us-ascii?Q?3P16Yx2ZhpABIKUaoX/ltIvML9Kd+UTF9A9dvjn3GfBUhUqO65c9EMDtQeSd?=
 =?us-ascii?Q?+SWx5094kpka1puAzznhBhHtujo798x4HANm5c3JqTGf6QltGs1mtohQ4sk6?=
 =?us-ascii?Q?UsCcg1VablutAB2Vq8lJYPXVJ30Wu5lTDQuQCE9G8Z65L6QWLgZuhnArBMOA?=
 =?us-ascii?Q?jbflxCMbDmSDYoalL0T30v9Jf/tJKTYazDYmeOa2VaRf0x6jnsikIbXS9zol?=
 =?us-ascii?Q?lJfs+rOuyA8HHmsiYdoAYfyetysk8L2CTl75ucSj8uOEvqWDPjIHgud0E6ul?=
 =?us-ascii?Q?WPg75qtV4W2RPazzpR78G1JNfw6IG3E4oPZvaXewvAI6Pr2KCpXyjzffaaFJ?=
 =?us-ascii?Q?q7DGKEqqfz0UCgcN74AunStZW1t76y6eyrOlxsN6qm02ApU02JV5aV/5UU1a?=
 =?us-ascii?Q?zOH6HcXTNIwr8MO7nkLd3u+f4Xed6KbcaaUn1By7ds7hTq8MUrzJAw16WgNa?=
 =?us-ascii?Q?GM8x/W5A9KbMHARSDSBoX3o/+OwQi9GKeorjaZsLuGA0u1+43MKmE6xX1dk/?=
 =?us-ascii?Q?T/M78KjnoJJ7pJaDsDwcy06JIqsjcnCPgQmuYqw7KxBICfKaaclhOJ64ItnZ?=
 =?us-ascii?Q?tvfDg60AbvBO8K3OHS+glP1joUBbxCIczfoRTJF3vMSwgvCn1EFdf1H1Z9aE?=
 =?us-ascii?Q?wNuS9ldXFwDTIT+0fdHdnZd2QA0+kNskFRRH6ZTEodc/dZziCpIQP2u2BKiW?=
 =?us-ascii?Q?bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A320B89C636E2F4B9C9774413CC096B4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ifohuP1ZQ38dLqx602JEfGmKnEHf47MhN7ghAq15X6a7dcKLVVMnLVzku/r/46O+GFJcDw+wI9gOvtCsDZXL7M0sTL+3N6+SxLjtFD50lwuL1rIUCWBWMwn9AyNYXBEBphKiFzFu2VMhZ0kXm/71pGYEAHhTJBfwy6WeyPhq/N3t89t2jGvbsXlG2zMJy6funy/ZNdEQp3fMy1NTZqUTzMUbyG6dQ1Z3+a4/Ey3Sg+ypwfKvYRCbNCQ04Z3GzZmbtbf42Iqnwl5IZ6hF8fuf7MGuMBwaUZmWk5NPVSWbMGftJiPptwY7afXER+8dAuKnIblB0poonu3JVdmm/F3jDnrpwBXFmNUAVEZRbv+0tDhsd4Y3X9MayTZrhKYh2zxIOYuACCzr13TK0WO9JPi//eypBDMVv4NdhGot6lrrr2zAM8zH0jZWIlwxI3h4QTfzsWXbBz3247uKC0+NnrO0+k4Jplc7dlaUPhtQTZewSasY1Yro45inqrApRwiEG7qFAcDW2GC7h1lVnoLE43irsaVC91yf2D43zCftVEUDJdGys04nFiOEfhiFSdhNrJfC412AE0Q5RzVsDluKxTlQqiZxs/KKV41hduxFc6UUAI3FFXtxqmgHFmm9RztFu6RZj7T6SYhYl0FptpBvB7MmDw3vtNGIhlk4J051DHUfa03pwRFp7Na4AHsaR6buEPxYOE8AdffpO1h+sCeDmoKBeCzeje+PKebvYa8iMbSvab1XE4mYsReZ1rFIVm3CQUVLu+jVJ0/0hAB/dv/WLLqCnZOTOmZJwacoBNocpzgWdW6A+ZNhvgAsb/ZALLDwVYG8
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d8a4c-7fc4-433a-94da-08db2f9b58c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 14:47:25.8280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFD7LbblJ0/q47+B8QxSBeN05TZ/AFqLv3j6Id7wEqNeuON4WHBkhh5dtgoakzQk48Mlsb31ouuGMPLrisaBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280115
X-Proofpoint-ORIG-GUID: vih10aFTGnyG4lppofcrsektvoG2FhHa
X-Proofpoint-GUID: vih10aFTGnyG4lppofcrsektvoG2FhHa



> On Mar 28, 2023, at 10:44 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> My next stumble which Chuck helped me was that negotiated cipher was
> ChaCha20Poly which I didn't have enabled in my kernel. So look that
> you have CONFIG_CRYPTO_CHACHA20POLY1305  compiled in the kernel.

Yeah, I think tlshd's ability to detect what is supported by the
local kernel is still not perfect. To that end I was thinking of
adding a configuration option to /etc/tlshd.conf to enable and
disable these algorithms.

Does anyone know if ChaCha and Poly1305 is going to be enabled
in present or future Fedora/OpenSuSE kernels?


--
Chuck Lever


