Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA065692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:00:45 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7hprf015280;
	Fri, 17 Feb 2023 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Za7/ZaKAHYk4A4lqLQ6NgrGUDh7Fic47zNYk12FzSGw=;
 b=YznSB5RiGqOeTZ+sEy+kqi/+srAZnJtd0ERDv2FW0xUunRreuqEyoQbfh3iYoL3DHBfe
 hXX3W1tBHQGh8pxCVNwwcCnTo0fsE7srkbPMe89gL1w1n8hyRj+LfXoiKjWLNTq6GZ5G
 XG4xz3qZZQpII0wtn1LtnphUBELqJXoNp+TCSC0pjhgcgkERmKVKk0Ktz/F16orWgRRd
 ZpwsHGHyTtGYaS3pMXgcadSv1ebKgK5X4IVEDg8Sj/Sp41La2k5NInPzN7w2wshrwPl8
 mjLU5sdO6uhFt89xsOc7McmtLpIKLgd4vvNElDTaLKIfO6Elq1WsgYgj2EsxBW/mpIgj lQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2wa5s4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:00:44 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31H9aIw0015258;
	Fri, 17 Feb 2023 12:00:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa3mwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCYxAKXBuPRoeaa7EamYswb6R5262QDe9wjtgZt7dB8kbN2MZ6TFhPSbksS274mDKPehuop3gblhFgzj1x4yvPtkqjGF7PqG4DKGVa41hjNZZnPjkIt4/8DcHsbtSDVO4bwEFJHyEU+UHrBKikxTmrhmyWXQO+bkR0xexJXbSSTfhjhq+J8TwL3VQ3aEFQxuv580mEan3MVdtdTxy2A2EkuNxWP0LsToNlsAlqTGEN6NIRbTbPH65BfyOSjqHfqI6DFtYj1h72ifw9So1soTyLKbcBYgQBRYtxRHSjduXBOXBKVq4nHH0nBtwjpqrVwXiZYPUcNEIOccYp30EZaMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za7/ZaKAHYk4A4lqLQ6NgrGUDh7Fic47zNYk12FzSGw=;
 b=DOGfX+ZRwrboEs6lSE1z47OpoU1E1rLhWMBBaEj3I7Rv72LCJ8SSS1RO3iilqgWtekl+9BBS3O+ylb1gAjbuitY+4YnqMZfAEAZs0yFHyndBS6B4L474gneRJoPhv53WXgHvHkEHwZmareQPMg7NMkB8ZGYWtyuSLpaOCwRP8MgQperKUxQwBlp3HEOX8TQ5jChXCqP9VeN67Oi0BhwIlRH4xysf9XkdFk76BRVx90XGvKSlPk9ncdYML7WhdT2UCLD/7UVvmmoyr9RuSsOOdREcMf91THLktMyKdZBYVSYv8hfAAElEhmps2ZX11c9svLjTmmHiARk2dU1Dfq0oOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za7/ZaKAHYk4A4lqLQ6NgrGUDh7Fic47zNYk12FzSGw=;
 b=hW4i3KNz7z38Q9qHoUOUG35P/Qy1sAYPgjLC7zrpjKe/jMpNH9O+DSIWbUW6WQhVW6D3zsuh8M2lDevmMxo1N3GwLuL+6hmpTx2LPBMcNRuh9XUHZUCaW517Rj7HRkNwa3bzJ/4fSrlCPrORgkjpFoxrDKmhtLhaXcSiNkJp2Lc=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB6176.namprd10.prod.outlook.com (2603:10b6:8:c0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.12; Fri, 17 Feb 2023 12:00:40 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 12:00:40 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Topic: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Index: AQHZQsNvC2IL5YDnyE6t4SYpSohVu67TCWCA
Date: Fri, 17 Feb 2023 12:00:40 +0000
Message-ID: <53831F87-46AC-457C-BF87-83A7EFF04120@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-3-hare@suse.de>
In-Reply-To: <20230217113145.18916-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS0PR10MB6176:EE_
x-ms-office365-filtering-correlation-id: 35c6cfe3-4442-487a-e4c4-08db10de96e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gOzOHPTti9+GinAGIBDlnbN/fSRxOhWY15OptRqcy7Qi7/ZDjeddgqzRRtYw74dGMgGkmWa15oXli8NWOKFLKzQHVfHXsm1Ld/s6oTx0hI8UOkmXZFMAHURlRh7keT0t6/lA0Z7U3yqEFapXaZSpU0C345QwEgFPKMKxvNlJ5cnx3vy860GVs0U1fT3jWZwETUWPyiZnLufxkz2g/nid4rYgXfjFprdQ0HCOQUlnVlZtikpgW9QZWE5ABMZc+/axPJEuQTsgXzIzRsq4Bkpep9GBcioUL91QCOThvtpS1+JGT1ObAVxqm0EM25K4k7dYYALGn10sXYeL52pMemQja0isDcGQIrPefo7G2USMIY9R0RKZo6CPIB5cJ0HzwPjtcBNmGoK+rLQ00mY9vd752UOAarmZUfFosbtULeZd3449qqW1vSVR9r0/oy0ZU1mWXHvRZisy7sI56gQSEYeC3uGLAAVNiKWRbofhb7LsQa0Oa7fSG6M3RskT8Z6hvc0Hpy+HNjXTw5beQPteeJ8TLN1jTtSLy25C+mQIy9sINUGvdTEzlCxGp343WN3nIV+t5DYyv05KPegh1Q7UbWazeaRZ2jmO7Cb4RF+pVGI5/jiK0SDxkgMwU9PkF3afx5CAfsnMIn+MLCXiZ4Aeh80SlTCC/7D0mR6eK25qdJDwnzG4HPOdDZm4rAH3pBEkuNzEq4+1k6Ubeq80+tJX577tZqeaPk4dEgpb5bhAOIHZhdE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199018)(64756008)(36756003)(41300700001)(8936002)(5660300002)(2906002)(76116006)(6916009)(4326008)(66946007)(6486002)(66446008)(478600001)(66556008)(8676002)(71200400001)(91956017)(316002)(66476007)(6512007)(6506007)(38100700002)(122000001)(38070700005)(2616005)(53546011)(186003)(26005)(33656002)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VukbDhKiNLDdSgs68n6kS26uV+GBZAUQeuy1UM8an4qWhcRTFi5LnQ/3Y0fD?=
 =?us-ascii?Q?fz3NDq/EkzdU8AK6a/3pidoQTto0Eq3h33HdSZ+DfJn+Mo1M0FnAfEBYHG26?=
 =?us-ascii?Q?0kFRP2lTpMysu+WzJw+FKXRB/2Ts1PUB9KvtnEwNeQtu29uxNaRww6PsI8FU?=
 =?us-ascii?Q?xJGmdlNuBISdZ+HKIZ7RzAdPZ312dkRDHbYCoNLXSJt1CqHFBrEcsS9IraKE?=
 =?us-ascii?Q?+ERObzyhwriRhdOkG2wipEGHOZWbCarluczQjP6xC+YxpS/kWyq85RIn60id?=
 =?us-ascii?Q?l8F2oUY+pNfH3CHYOjjCql5FVWbUBkm50BNlYcc3fc/CIJAhR7/4AjNibZHl?=
 =?us-ascii?Q?f1LvSUV9BuaXYHk5W0fGIlTWaRvuyqhmRrREZJpiaUgJANT0MmBZ72S93G4H?=
 =?us-ascii?Q?UlO7LPQngrqmX0bE31u/eGq0nEofgIzh36pl5nRtyVob2jO9JmpOFB0kLnQM?=
 =?us-ascii?Q?hjnko3K4c1HUhLAmlu4X6kn6aYLYjC42L+m8HpH2QydoIxenoe2dOyVKMWJ0?=
 =?us-ascii?Q?l+4iJeDpWVJtYelM8R5SsXQn+LPZKNHwGjvMPx09wWkvkGODBh0Li6Hmxzep?=
 =?us-ascii?Q?dH50uqrMBKT8gljftDZDBjrbVdu0YGnHy3lN9ch4yAzn6HXXl4F1PDegnrYn?=
 =?us-ascii?Q?t8ci97tiwlzeSxh2/znBYVDYyKbhJoxnsYit39kzPxwcyAo3sLORcHlXn72s?=
 =?us-ascii?Q?GC8nSohClK8k8EDXUOBei2rFtWQZqn24IIDtdzp/aVE2w+Dr8KCj69H1PBBn?=
 =?us-ascii?Q?8Zw/H2196jA8kDy5H1wOo07xCXHtFeGFNT01B6JoxAQlYkqeeFA54p5VXQ/v?=
 =?us-ascii?Q?tWXC4m/9Jxz9cZ8Hi6cLYLO7QdsoXcKw8miFpNatUkAT3OGQp08RaTxXsfQ7?=
 =?us-ascii?Q?YiyCSinZZm2SP8VQaSwKe3QENijnuvct3pVZO9bNlN/uDOO0M+1IdgtO7Tyu?=
 =?us-ascii?Q?V7Jys4mON+zGyzlIkNo3C11KC2JtNuDH65apBZoGK9EuqtxleH55GnB5pPfG?=
 =?us-ascii?Q?x+iS6/sGs3eSzt2g9zqY/RYW2bNw19rawaJHUNaRnMMtFSfcveUu2qO0VaC/?=
 =?us-ascii?Q?i7fnw8iMf5NZ67KpHyoHy7XPcBw9Yn0dAnrac7Um/BLv8H3mQE4s/zojES5v?=
 =?us-ascii?Q?V+p/K2cHLuYFiKMf6Xy6nMuj0uwo8gVrewZOp8Cea4CwknuSagiKk1LHdlRQ?=
 =?us-ascii?Q?TucH0JIjdF45G5FJx+bPyUMjI45zrX/GyUamF8rsTLF0Xhik2CI2FkOAPwg7?=
 =?us-ascii?Q?zvrXIRrvJm5k21i0EPnlBCyA5gZq7f+SUkerv50sXK9fje9L3jT9lKSze4U7?=
 =?us-ascii?Q?8O1+u2tDFypHjSpTd1LQohpGCRkqr9Q7G8waqaCZV3kifJk0Xn0mwUWgdU2m?=
 =?us-ascii?Q?ee3QdtwbD5qLpjhdwPBa/9+VEPs/gKhyYF8HGhu3DnOSlmOpd087EXjZkNET?=
 =?us-ascii?Q?7cDdsCSl4b0QinA0hisTk3nrwx8EPyJUqeXv7UakMQ7owb1iZsiEiSklufFS?=
 =?us-ascii?Q?M/ARSbJLo7UkFuSTH1ZeexYRcwLyRIMn4rt0QCjStVLwsLlY4CEkkd/F77p8?=
 =?us-ascii?Q?pICoYJLSL6RuIxkzY0ne8Grc//JFLX6VM5sFJw8iCdr4T1g5btrLcd/EZ8ai?=
 =?us-ascii?Q?9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CB860DB684C2946B8F8FA475921894F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nFKAA2SLFMMseR1mObpcsZEvslXIPzRUhCRQ5ZwmQKdlBP4qf9cv5aF227Upp8KYIh536Ta1OcTDTpHrnJot5Dr3PIx5CHd2kMb5JIQTS2jtrtNcK48PkyzobtxNoKOonduqNaIwZQfq57ToGph0McmpuTJ1bHiob6JZeH84feVe8oyNpo76Ft0c45NKPzbvZ/tdxHrkvSyLwqvfpKhkiMGw+eHD0yTF4Hli/FVuh2zQN89GBpwEE2kMIlVtCq7Mrt3Rk+71mf8h6EkB3OJHtWjaFTBzDPYP/0ozU86Yu8JIWfGWwm+5OTRMmbRx/KrpiwRNcgPtSaZfLt9FLEjxPjRdYMPGZD8GPKg9zgIQp/cCSfel2+U14ckQFIAE4YDZTA24UlozVxwDQYw/UJM5NK08MWFScAdppVNFzlWjVtlCsBbeOnJ5iPjCRhneSgbUaef9RVTSQd/2iSqzyBZRhSMQTaQvjfhZttiHGbLaugBPPg5AotQd85vQJ2oX6yDBIs9vyUpKh+Da2FXZI92jtigBIQoNNPHP7jvPsJxO+9DbEjhPLlg2sgAhGZhJj2eBYFSbmDrqBsbhlVUIMXFi+H9dpR7e/jQ+ODUWK6+LoKqqOo9wtND32qnW2nd0/yHA5W6g5KrOFwh7zZwWtG56VlKd860UIrhxrejzd4KPPEE2Vb/qHXHe1WvK8vIfdgTywtkw2Ikr/L4hxM5Ff/BDQ2ed0kkIKSGmcQ8vV+GEicBX4g4dCmd7/812jHy6Fb2WTUos0kfyB7cCf+3paTmKVgh9awSvbrDlgLrg5gJbRTE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c6cfe3-4442-487a-e4c4-08db10de96e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:00:40.3177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/NRcZQVO0xG8a13JBSRFjrL7jfC7VC552/SCKjkMIzIrINNurZYN5xG7AFG+2JOxg5Z3uNWWx7WqqZOAnOT9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170108
X-Proofpoint-GUID: G4UJrg6UXmHHugBvfgf_Som5did49QEw
X-Proofpoint-ORIG-GUID: G4UJrg6UXmHHugBvfgf_Som5did49QEw



> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Add a 'keyring' netlink attribute to the 'request' netlink
> message to allow the kernel to communicate the keyring to use
> to userspace.

Can you add some detail about the use case? I'm not
clear about how the keyring is to be used.

Is this keyring going to be the same for all operations
with this particular tlshd? If that's the case, why not
have tlshd do a GET_KEYRING downcall once when it starts
up?


> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
> include/net/tls.h              | 1 +
> include/uapi/linux/handshake.h | 1 +
> net/tls/tls_handshake.c        | 8 ++++++++
> 3 files changed, 10 insertions(+)
>=20
> diff --git a/include/net/tls.h b/include/net/tls.h
> index 51bf5a083cce..f4baf3b4b179 100644
> --- a/include/net/tls.h
> +++ b/include/net/tls.h
> @@ -524,6 +524,7 @@ enum {
> 	TLS_NO_CERT =3D 0,
> 	TLS_NO_PRIVKEY =3D 0,
> 	TLS_NO_TIMEOUT =3D 0,
> +	TLS_NO_KEYRING =3D 0,
> };
>=20
> typedef void	(*tls_done_func_t)(void *data, int status,
> diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshak=
e.h
> index b007e346cfc8..83705b1d1e9a 100644
> --- a/include/uapi/linux/handshake.h
> +++ b/include/uapi/linux/handshake.h
> @@ -65,6 +65,7 @@ enum handshake_tls_accept_attrs {
> 	HANDSHAKE_GENL_ATTR_TLS_X509_PRIVKEY,
> 	HANDSHAKE_GENL_ATTR_TLS_PSK,
> 	HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
> +	HANDSHAKE_GENL_ATTR_TLS_KEYRING,
>=20
> 	__HANDSHAKE_GENL_ATTR_TLS_ACCEPT_MAX
> };
> diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
> index 66adac8d660a..8171b3c8f3a5 100644
> --- a/net/tls/tls_handshake.c
> +++ b/net/tls/tls_handshake.c
> @@ -43,6 +43,7 @@ struct tls_handshake_req {
> 	int			th_type;
> 	int			th_auth_type;
> 	unsigned int		th_timeout;
> +	key_serial_t		th_keyring;
> 	key_serial_t		th_peerid;
> 	key_serial_t		th_certificate;
> 	key_serial_t		th_privkey;
> @@ -74,6 +75,7 @@ tls_handshake_req_init(struct handshake_req *req, tls_d=
one_func_t done,
> 	treq->th_certificate =3D TLS_NO_CERT;
> 	treq->th_privkey =3D TLS_NO_PRIVKEY;
> 	treq->th_timeout =3D TLS_NO_TIMEOUT;
> +	treq->th_keyring =3D TLS_NO_KEYRING;
> 	return treq;
> }
>=20
> @@ -170,6 +172,12 @@ static int tls_handshake_put_accept_resp(struct sk_b=
uff *msg,
> 		if (ret < 0)
> 			goto out;
> 	}
> +	if (treq->th_keyring !=3D TLS_NO_KEYRING) {
> +		ret =3D nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_KEYRING,
> +				  treq->th_keyring);
> +		if (ret < 0)
> +			goto out;
> +	}
>=20
> 	ret =3D nla_put_string(msg, HANDSHAKE_GENL_ATTR_TLS_PRIORITIES,
> 			     treq->th_priorities);
> --=20
> 2.35.3
>=20

--
Chuck Lever



