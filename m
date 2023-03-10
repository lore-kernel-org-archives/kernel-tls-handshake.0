Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BFD516
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 10 Mar 2023 17:44:02 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32AF4UAc016614;
	Fri, 10 Mar 2023 17:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5dJm4sujVHAG7jR6yrno4dWuP1/Qo0KvXLzu+aTaOhk=;
 b=JwahnOfLbRRn7wnf0A+zz/HFZboE7Vg+Lxb1urd8UFy9V9OfQnf0/uowbOhjAyYlTww+
 FImFSSKkEwPTC7SqmhVNkRi8+PhHfmYws26MT5GYHz2tpBzyfmosmR3tOSXZWD8UggKv
 fa/GeqcznwsIDqELW9YR50ONXFKQmYOsmA51TXfxomUuLHlQ3waKKLOPwFikfEzpAjde
 kI8GYtqso+8e/n/cCWGfLRwqsNOFcaDC6xZzjFfpzn+aOVYt0jcN6Bk79fDwxl5mRaLL
 yqOKs/920Vyhw3q+y4qtJwo7E8kaql0Q2KDQ9fNr2yNApa+DolE0GRVKkggJtlBavmHJ vg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn9a5m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Mar 2023 17:44:01 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32AHUogP015409;
	Fri, 10 Mar 2023 17:43:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p6g9wwxkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Mar 2023 17:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0qGkvG6q0MVcbfLv4seCwcF5gVvrTD7Q0u3UdeXwlithPiwNc/3KW379riHjr0OmcdDOO5D6xak/ztzp/iBGiUqioW/z9bqaiiLtI5qV1R/bJ2nAVZoW0hITuZhpgzSka5IQAHWgS3WdZCzbz1SBEjrYNsP/KOlqFa4DCj1SPLUjT6cwomRPSTFjHmTUid44A0OQAUOGuhwtyxKr0yGJ5Cj5KR7nnw6RjZZxmSxyPH2PAjGmvv4TlIvwXkZsyWgHHA77Zs00iw4kU9zAiu0AoJl03CWn0/J7nYhkX9PpRdVmqJsTjPYHSQ11FI2ZZueJxVMS9ruWVo/yJ7v93qdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dJm4sujVHAG7jR6yrno4dWuP1/Qo0KvXLzu+aTaOhk=;
 b=CoiG/q5C8hfeW9i0/LjmH95xkVPFP6HSjpxCUyjoxrEv09UInVuPGDbrnqPRn0ybqhTCnIfmuoVHrmIAo7iTBRUibkH7+t7yBWpHcdebbcm21SeyP1ACa1DSAkq2JtK1FXe1KH43oYyzbQVPLSwL77ZOobtZzJ+P6QY/aMuIFNKUKi7qS7mZv/+JX0tsXTU3My6j/2SPtRo6nrtuziJCEwvXOU+GrOLG3q67QYLWJPl7gcq1KDW0UolcwZyVVHR+6rW+Box3xTp9eZGmBP8p9leqZ5Z6eCJWprVWm2WtTNTt/m1qqULSFxZgUmTFn1raryi5sMa+HLy3PI8dcrj/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dJm4sujVHAG7jR6yrno4dWuP1/Qo0KvXLzu+aTaOhk=;
 b=RMB7ezsVbg9ELslThmVbPhrZYQVtlL5Qy88z2hBr6WrD3gOEf5xtrc3Fm+tTpUtqNRuFCSAbPR83IdpL51AOwudPnhB5RNmyIw7RUBIn+49i6ydKThftugtvpbpfnxTbFngu94bWNhiYbjGDBqVTkxmPBLRYX3wszzzwh8n1//s=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 17:43:54 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 17:43:53 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: psock patch
Thread-Topic: psock patch
Thread-Index: AQHZU3NoymXVnDg4y0SgFznK063VMK70SNuA
Date: Fri, 10 Mar 2023 17:43:53 +0000
Message-ID: <4CD3907E-6A39-4575-9482-3D265C1627F2@oracle.com>
References: <7e6a350f-e4b8-c245-83bf-a4ccca2f46bc@suse.de>
In-Reply-To: <7e6a350f-e4b8-c245-83bf-a4ccca2f46bc@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH2PR10MB4392:EE_
x-ms-office365-filtering-correlation-id: 57c034fd-0ef2-4dc3-582a-08db218f0432
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QWhjgPFxqD9iBjZbg/O522kpiLxuOUC08e2bQh96d/l1jAZLwm9nUeB3PmT3YMi/ILz210ZOymo2+klVx7uuYrdZ5FEYEfARtLX/+WEbgUVuVnebrok4buu+PtGEUMW83jIADoN59LCL8M8Ji67ymuoul6+JiLJZIPUVfCE5VPZAJvU6vG+z1neDGMjrHwSnVekEzP7UmWtIQHrtRqEAKHz2X/KCnqL9dzsIrKrqoINzksNiO4vCUICJYD1SGj63BwC0nZrsHsNVUGH0RoJWKH0dgn9nfiCXUSZ0CF4Nu3j4DTGjHn74zA0TNWHWQ3ToMe6KoLtuT+TUBVdwC4yH9kxLH/pbxWWbto5uAnNYDQfuJtJoa4/9/T/dbukkaU5FGaGuYoNMA+Th7YcW7tTmje4Pb0mP3P6u9witN9kLUdH0YelWR2j+Tne8L/MlwFC0Mr7Xxx5IZV9XRF90m/AZnqMJITk84RuTP1wkhFBjuNb9LCuphPFRCWX7Sz3QLN/2YVdVkhyktVty3+qzdoqsqE+4pFYK+X9Bc8qZxGibTfsl8n9essIFY3C0twg5dodYA69mH6D6KB38W93fckCxs++NmvoMjH0bAYG71pS/m4XRiQ/pS6ssnUdZ81ZiIPXn8HklUHyrAtUzbwoYPQ32OftCT+ACfrv0PofuX5p8ZD0QRKnaWy1IhX+pTFNhzN6qoBSWW+b6v3qfGHGSHIhXAOgmmrhxJ0Kko4mmpLyaoEg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199018)(3480700007)(36756003)(33656002)(478600001)(122000001)(38100700002)(38070700005)(316002)(71200400001)(6486002)(2616005)(91956017)(6512007)(6506007)(186003)(53546011)(26005)(4744005)(2906002)(5660300002)(66556008)(76116006)(8676002)(7116003)(66446008)(64756008)(6916009)(66476007)(8936002)(41300700001)(86362001)(66946007)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?70pMCsrffgd2q0ag2y3sDedKsjfoKAdme377LNuNQTRFYBNSjPbhq8IA3vRN?=
 =?us-ascii?Q?+1uUVX7o7ywH0hSJIT11nAuAjFWtVEBwwU8WmtABva7iHQ8GluFqLw0TJqg6?=
 =?us-ascii?Q?ievcFOWM45E5syXhLDpQtVUnk6a4YzLJHTOhIJVjSQY3fj0ef1Jtx3tzMSk7?=
 =?us-ascii?Q?8txmGupBwqK8MkoQwCrszyYY5fUv4MQLhjciK+Dhht7W6Tiqq6zX+qM/kGCi?=
 =?us-ascii?Q?EzTRc35epRnUazUloDAph6lGVoqaTfaFPxFmTdnK4JmOSGWlzGPcQzpnbYkk?=
 =?us-ascii?Q?TcUUdfzaQH2gO+sNROQ1jRmnW9yzcQlnlixZbW+L0kWF/zWjVQIOolsIcLch?=
 =?us-ascii?Q?zL8sj3C1k5nTzdCWl5g7lW6QGHHQurGauEP3K2o+6STfsRnwg/rLS3dnVEad?=
 =?us-ascii?Q?WKmfhxPY9yarqh8UoqDLl26kbwwP4G7ALs1mbPtAe/C3wDKZUrtHa87nQG7B?=
 =?us-ascii?Q?o+LXf/2zuaQNzGmFePTLaykNjFHQE/THlkjxhiuCLhNa+xPyflcM59UKKq4v?=
 =?us-ascii?Q?vCVbEx2DyDmpNghcjmlpn3MHS7TmD/EqLPljWYPzcg66xZo3v58kFLODJtlK?=
 =?us-ascii?Q?5DhP38Dl8OanBtngmYbegG4wRzISFne0V/UaSc4hlaHOKrCx/w4suUqcrMlm?=
 =?us-ascii?Q?v7o5tJonYs7SdTezxxYJxtqqUGqGwEOdJ+U3iTMnoxPD6YLJkWVDKcpXBtYU?=
 =?us-ascii?Q?gPNhlo8qYTjRaiTUn/JDZVSor2UXhF/MWqXRjjWikW0QzCAQLM/nZtErztXD?=
 =?us-ascii?Q?f+vwVPCBmM/XpCGktdrI/sNuSA8otsZyGeRX1zRVX07RnKb8lu7vNEs/joEm?=
 =?us-ascii?Q?dGXMPX0zyRjk9K7a8UPUvF0GOH1Ku6KnRI99d+G9dYVLSKHbPKozpauW+PT6?=
 =?us-ascii?Q?kDfn5dkacOcrIMTJSUDN4Wc1tqRiHgDsQSB9ueTKwwiEVpE6q7zFYF/bzrqq?=
 =?us-ascii?Q?ShYV3tHS0iHvX1ftYdqsceOFD0hKj3uB6gx+coeE557TdsW5rVw/uelVc3MV?=
 =?us-ascii?Q?kz56wbf+7Aa0Pqh3Qiz73wDWUVbQ0L1SkcVLIpQgD7XX1jCESf2sMV8mtnMb?=
 =?us-ascii?Q?dALaBgOdlf9a4oV50xFbZYk4NfnhBYi06zm4x1lV98tkIFO1jGzajYD36FRc?=
 =?us-ascii?Q?ESQbaa8B6udPY5I+gQ9j2cS3K6mKFD6M5tWe5ySfnyPcPrOToApX4D+YVbxK?=
 =?us-ascii?Q?oNaIPsTAC7WtY2FqQjRzjk/bDChnTx8hUPEVRuxAR9hiCdEN0LNuypuh/a5T?=
 =?us-ascii?Q?2OFh4NBSORkUcjmUtnOtdd1UQiDp3ANoM1DpSGkiBKIa61p98tFi0xzyg8QH?=
 =?us-ascii?Q?b+dvCqxSsiiJRYAiHLlztq8Jsli3yUWhw67U9fcIatqo7txNev8R18g9mQgu?=
 =?us-ascii?Q?E+YJnOMBqn9yKhCMA072BXKS8C9+gzuAI7NJEu/WiTO+ifeJjSWoOdA3Pejj?=
 =?us-ascii?Q?TSm1Vfi821PPXozoIRlmvpfZPgg79JXnFchkMfG9aF53p0nxf3dUb5eLAviF?=
 =?us-ascii?Q?qQLhvJWrsulnXNxI1FTzw1iqZk4cDRPj4vDRAjnXysF4GAFr1VOodbB9DHjV?=
 =?us-ascii?Q?n9/N3KTBLwsyrqPHvnZoMXs15ya34V3xAIs+lghThuVOY0dr4cYs5xRdXMM8?=
 =?us-ascii?Q?mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E553FA9B47873B45B06024AC202DEFC9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zgvXCJa3BBkYHuAdjgfKX5osyxrF164kBd6oM/mbVC5aeGDNxQG5gzrpqbskCN9P0x+/FW4U1bqZ8uRJKEakOOJP/O4UGIH21maVGfrYQDeYThDuuyOrtb2gJnXaM307MlEStzIda/ScnUJ+TGM7folexTfm0atx8lJe1EPvBGEpnmOggX2OSWh/eHMlvVATvpCIoTG8QLsijEnBsn8ihZd2Uhm5F6AhUQ/BD/Jxbv7y2UH67cFlwi/JbCT6ESiIYpv0Xi6PyUMFVnaaOJk1WtTBPH4VUwn7mvVe/AR9ta3QaJMn/8SdTH8p9d4yuLqIhOiSf8hbEhQvdnZ5cLjBmfdJm0I4xBgZpVjZrByHGEoB3JXeWHghO8jRKPk28YHoTCbnhRWDv/cNCewet8MfhCNRb21vXS3MioL2GI8JcHMiIGABBuSNtrpy17jUoi4OOo6wmIQ0nyovYlQNkKYFfhDpNogmUud+WycotTWbacwIydWKt5M023hSmrIbAKbth7r+YFJxWjPjvU+BpJPXvm2oNdyBqIj3OQNXo/yjH/2ur9r/HWSo1ZHqDypPqvH4VSzTN9GpOGA5r9ug1Bc9L2smpR0P1zManeMqJs1IUZdRw0A8YASQyR2jAoiqs8VthKu1CqUqT3Q8M0/6qO9yQik0DG7JKb7xsOwq9b7T0C33tHAkM7xUK3m9cfBnopkf7jb4EpSeG48QZ8Kjn8QDzaDGqwP/h98ioEBhsDeJyTvaNB8b98EtLhGzmI9b16n3DyPM4dtkcF4v6WKVpuiRJIMkmNnlpSUaAupNItvF8i0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c034fd-0ef2-4dc3-582a-08db218f0432
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 17:43:53.7349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEryxrMMhpyeBnN4ue9Mk8hA1nw6j0Dhh8LrpMJp67zt+q0EGe2I2aCrkHuqNRaLWDDjOWUpt1PouXbhj4zDow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100141
X-Proofpoint-GUID: GHeb5l8E2nprRcZbIdkN-ErCNsMoEFuR
X-Proofpoint-ORIG-GUID: GHeb5l8E2nprRcZbIdkN-ErCNsMoEFuR



> On Mar 10, 2023, at 12:11 PM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi Chuck,
>=20
> for the previous accept()-based patch series you had a
> patch 'net: Add distinct sk_psock field', claiming that it
> was required to get kTLS and any other ULP using sk_user_data
> to run.
> What happened to it?

commit 2a0133723f9e ("net: fix refcount bug in sk_psock_get (2)")
in v6.0 made it safer to share the sk_user_data field, and broke
the patch that I had.


> Is it still required?

It appears to be unnecessary now for for the RPC consumers. Likely
unnecessary for anyone else using sk_user_data, but YMMV.

But as I said, my old patch won't apply after v6.0, IIRC.


> Reason I'm asking is that I'm seeing odd stalls during encrypted traffic
> (command timeouts etc), whereas the TLS connection itself seems
> to be happy.


--
Chuck Lever


