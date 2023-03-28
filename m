Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5C8474
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:41:51 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SEeEcf023202;
	Tue, 28 Mar 2023 14:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=LT1UkRbET9oYJdnAGfz4LMYACwkb9I5gAmT/p0iWS2c=;
 b=GU9Z2hv4CSK2YTvhxjhTp3HACNWB17prPUU3i98uDO/PJJOhNPI0NQIecnvIvPcnlVUV
 01EugtcrGDilK//uFpfel0Qmkf4/URgwzKYvHCdmYGtc+QbN78bd2vxXfJ4uHMxzV6os
 gr2T36kId8h0auF5wizwjxVdfqIMkOotbVYuGdveQp4FsV/M8hP6ymaQjtDt/MuMmgCq
 r0E6tK5KIJl6OcOP8pZEah39vsohRYlZHKqlXVZSpNBWPypoGcMXHQYXWwtefh7QopN6
 ry6N1mddxndAEv5ZFju40IHmllhllMIBhi7utfaaTI6dfJvyaLtjQVsT4f7GOKHGGEet /g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm26rg0gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:41:48 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SEIfeN005470;
	Tue, 28 Mar 2023 14:41:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd6ge60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:41:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eu+ZGZNBtuP0bESGpkg+NHoaFZh7EAvbDhDg0m84es8MfpxOJKeAxDx4DeWDBjbboG9tgCWTuCd6wOWN/DS3HuvAKAmQ054rZN8SCwhdDPGGbek0MncXAHoFUUVkWfAqPN3+GWzIySz5OOFgTyZVvcpPVS/+N41ES/WwuoWXj9v4Ibvun4Ivu86ibtD5aKcvlPHoAnjYQ5Dvt1yPmsMmL9QKXu36yWK9F7lF4egviVFlVdPiTvIZ9O6hGnrKPdcN6Hb4AmKHvxDHfNm6w5sq9wys05rN7ocRIKsypftrUZYtyDq7fU+D4LV3OTAzbIxrlz+wX33AGwq7M1V5FmYIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT1UkRbET9oYJdnAGfz4LMYACwkb9I5gAmT/p0iWS2c=;
 b=bcct8WQqwwKiC3AxCxqxpxkULHbIFtW76ox2WaPSMpOYPlkKDrZmx0pXvWAxcToqaERdE2AomYNwuumw+mm7UEiyL/AmwmYsQeVL6Ee49IzCB5jkmdFHWAaGBWccl+PmbIzyVdxheT2QJesNaihyv4I4+KP2HywYTqMCL6AW12ZiJHmOLwqKhcVvretIjJA2dGHoxNTXFS34EJbbbiDyIXbtCy5Bl1xlAQD4e9y/ciUcAPnBDZZiOiivh0o7xlrs3+LX/q8KRpODn+xYNx54ZYc8BBIqxC7VPKyt7iJJ7reNxIxr+SYqkRYY6uJBDqBvdRvv7HR8HJ8L4cCUJ8z+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT1UkRbET9oYJdnAGfz4LMYACwkb9I5gAmT/p0iWS2c=;
 b=SZKtFvjhuatQEAgF7pR1olnhlnTD7uKyADB+WjiqxX8qMpgTR+nD96jd9MWytG/3hJ8NSgPIz5BzcjnxWqvj2CchwL4m0T23+njrcsMrlBKFfI0ZuEvlB+Ia7PHpmk4az7lG2gfZUHU9Xs4G4vRGP6OMt4z5YESNyTo6GRBqlhk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7212.namprd10.prod.outlook.com (2603:10b6:610:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 14:41:46 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 14:41:46 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QJjIAgAATTgCAAAb7gIAAA3mA
Date: Tue, 28 Mar 2023 14:41:45 +0000
Message-ID: <7DE1DDC4-2270-4F70-9A7E-D981E4FEFAB2@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
In-Reply-To: <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH3PR10MB7212:EE_
x-ms-office365-filtering-correlation-id: cf3bef82-5e28-44f9-dfd7-08db2f9a8e2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 POzHsPBTWtXAAnt5eplsalBPNVHc87qnFTtNAjBefvRi97ldvYMESHZqYPYo+SXr3fezAHmuCQX3NvFLk+JzhpZaMcGNBLq0U2gVkAf4fSEu7Iw2va624vI5CtrSm2sK9knBqJY4FXmIpM6G1yD0TEJxGwJhWsA3I2DDbJy2/biyVe0CSYwu9m0hLLsG4efsJDcgh+AyTnVLOgBglhW2sKGFxfv+FQCK3dXIwnccH5ZjDINLTPMVHwNVy/Mv7L/o+WVTTvgJNyYohpM/oHz/BWrO7jmeEUN4D9C7XNHwj6R3QUEJQypQHPRN3DnTEffzG99otIkWyutPt722TrE/Ix7faX3am1f+cvlRNzd8Iq2PTwbQtbggZI0j6t2BSnktuZqaCv8xONmvGwtYfKYEIAbY4sHPlZ3tY3bnRKlIOoZrNbXhOfZcA9k1fhvYLG7xApsnhevlLm5Yp667gFQ3AZ1Dm6bN/rCTELlehz6n6VQqq4ubvMmnRvlGvrNh+vVc0nI6yTiyZq1v25tIWEj3BZ+wcrtQkDUWo4yEYytDw2phXeqK33j2G9DUX30EyhuXaSb9bdjK/g24vrjUrWRD1Yw0hMhSQjIZ19hCVoCsOuXNtRENPCWVxTKGmXW+6rLM2TtO/hffMafzMqKc4g+YIQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(91956017)(186003)(71200400001)(6486002)(6506007)(53546011)(76116006)(316002)(6512007)(64756008)(66446008)(8676002)(4326008)(66476007)(66946007)(66556008)(6916009)(66899021)(2616005)(478600001)(26005)(41300700001)(5660300002)(8936002)(2906002)(83380400001)(122000001)(86362001)(38100700002)(38070700005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HbkTM3J4SQ2ikkHvACsLlKYBQhQcBq0epA7/FGPMfBYCpmek+QRvdFrfnPZC?=
 =?us-ascii?Q?nsH9Y5SUNizGaFe5aXZ6by2oIwXVq5EciPQ7v2lmVUvox7bRrZFmTdc3O1Ks?=
 =?us-ascii?Q?wBbDcwgQ730WylAVFOIlDYyaCZiJXv/5JglYkjKwL9ZN/bSLVDEHt0KSZcXU?=
 =?us-ascii?Q?Bov9YhtOcLj1zAx24zG9unvRQzaCBPRAqIK2AT6WfBaDBC3UD5IkCKOT9ftx?=
 =?us-ascii?Q?wqJNdAjua6TkuUP5BzHM+a68uk9+bGfV9ZwyaaXZKAA88hXC4WqNSmXsm8HE?=
 =?us-ascii?Q?oPXF53TblT3tmLKtnxISGVvRomhktD6HKd7Hzhgu06yH5uXt2CicyHYrAHWu?=
 =?us-ascii?Q?wo3gcswLC4jq6ag845a6F9iSfgqgF3CRWNh2leCTnJVUT/2M146RtA13zxBN?=
 =?us-ascii?Q?WjqCiPWERBVCsem1x7wYwhnCY9l60mBRAGeF9zzAoH2W2wQizMACMKldPGLw?=
 =?us-ascii?Q?nw9ejprwUn+dv0eDeiWlCcM04wDJR3e7xWgV/ffHdw8LCNxZE/3s6SjIqc6M?=
 =?us-ascii?Q?y4Ehb29UaOc80DVsPXIyA0bmzUntwdfGv0wJTrCZfsz0r/PVTSXz0aY8NGzV?=
 =?us-ascii?Q?+f/6OmauZ1aogxdy51BiPO81gdOChzEn8vUEYClatErh+dLhJZxk9usva4i6?=
 =?us-ascii?Q?S0PRY2tfH2nPxB5zjOIBfexuNvljk39QoD05+JAppBtnj4t/yywdYeYkZUsQ?=
 =?us-ascii?Q?frqTvnVbP2ThskiejjYvmB8wvcdR5bxnTUEkvy4xQMDqBOfYsop2yt/dcMKq?=
 =?us-ascii?Q?uHXX88fg1lt56wozXyfPf+l+/Iz28MqIuAgU1bY6JQlBQhqG7db915A594UU?=
 =?us-ascii?Q?aKtg3NPlkHoQF3LfMWu1Igq2E64MxwnH/vzwDWbbNX+76H3MmCGeoZETgNzN?=
 =?us-ascii?Q?lGki0T0VufSYD1QYNzzFfUR39T1ohYhEfPB/b7VGtT+vtQe/LoEBKFnc6XZ/?=
 =?us-ascii?Q?g9DQCLH3WuC5PC/LwytDd7XkaMalwt1pV9lsuuoFlXdKR0lrD0BvvVRSzX+3?=
 =?us-ascii?Q?aPHbxwqbiHa0wS4u7UVFxGvQV9kb5IC0yN+QgbRYOCFg334u4YGUUcjxOsIr?=
 =?us-ascii?Q?PRXde0PCOFLI6vvUdm/9BRY0PsNrjn5dFXMzUaQrD45Zane+mqczpduEZMJQ?=
 =?us-ascii?Q?9L78ppBNl1F8IydpD8PFqDGSaZ9wG1eYhugKHoE5Dma4BjL2BxuCB+PIs5HF?=
 =?us-ascii?Q?yvhf4r2pv40pbzpnr4W8LgbuQcOeFzkBJR1J3RycHjFvSm8TdulQTO+jkc3H?=
 =?us-ascii?Q?5C8FJnBxTYVSj+Xwp+249jIK+RHmxViSMkUJshFyaQD1tKKKK2m/9w1b8ih7?=
 =?us-ascii?Q?NXuIDcgPVngV6LRjDeMJS8ULDh4HV2Esw5T2ARM00bJJa5eiwGSBsIlv1FpE?=
 =?us-ascii?Q?BnuIILlW4lTJqKgsOra0Fc2j1NFSv04CocUBok/sSmRuAiEy+hu4tTabKvxi?=
 =?us-ascii?Q?EYe3CnMaYHeb2kxJaWBMHNa4FwRttRBuh9TgzWcmxXszNqkDFnjH1ovZEjCS?=
 =?us-ascii?Q?AcXcpbG2XazUOR86YviLMxQpwWU6X+ot1cmyqgICQcNkqf39W7zfNR/IjyE4?=
 =?us-ascii?Q?5k+jh3mBrFdT84s/bLARguGb+x58G0HxKy7EIP5c6iNfhn5g17MxCb+l7MMr?=
 =?us-ascii?Q?1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7031237EE3BFF342AC96DBE8317265BE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pIKorNKxckgmaY0gPKsFYFwHtBwR50J1zLK3ROZbmdfOSkozwm8ZMwIw2wGssEqQHobO8YAZezUYfAyaoOmSu5+Ug3Bq1xaqvRMGCusg86kZ1cFGeyt+z6UrrzsN7kYqWDxospdBSLF5PG7sM4ba2i6d3SXNOHUwbGjjaUc6yXPBJgqjtPHhtykVSU0abv/3l4WWhmiWCPXmo1t3Awj1uWAEKA4lOI96XMuISdXCxz+bbNW+97OeyTf7iwgRbA8kfhVzXb6TxZ9/qrP+8p74xFzayVrE7L3rqvfXbg8B2fkeSFps1I6BNbA3PvuppFyJvcW/DJlobVVptFo04LPa7Gtk26RoHOcxVeVrjdjuVsm8YmyL/OMgHksZqHuQvrw3EdCORm3qtg0h83SdZ7Rjqrzz53BylIqXKVt3uPU7sO7q01fjw0qRI9gcJ0j0O/E18c/siJWCriIw0iOBphLLsG3Sgxh4pZkbYBg1lOM/FFR2PlSzKG2zpWRT7fyqoJ3iiselIDGb29JOK+foWCKv1GiV0Km1uc+JAQlZPcKqDS/j4eUE8Ejkqz0t5S2NXiSIsC0CUU8dX6cuN3NU4EM8d6ESlFmAOqgSXCH1sVtWn7Uj9J/yXYmBeC/d04OKi21h0ojuYEHydyY1ZWBPR93iI5GyIiUiOL74rTFfH1OhGKh8D63AMQ1ovJuT7/saViB9bYXfpJHKH+UUKOfJMjPtMUyBIP+rgk0iH4b1GWnt/59mtdxaQOxFFkQhKpbgrE71NK/e1apknKUrxe02vEvnFj19DNH4B6B1K9wxDbvZcqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3bef82-5e28-44f9-dfd7-08db2f9a8e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 14:41:45.9420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kldX8Avze4UuIwVFdaUsch4Bi7if2e0anWlQuyvGEI0BBEG7t5TAWlh6cmaC1+9aIwgziKL3HtHvn4EQkhOnWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7212
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280115
X-Proofpoint-ORIG-GUID: RKaQYK77s6v9MTz-E37iVpW1oxDO94Ok
X-Proofpoint-GUID: RKaQYK77s6v9MTz-E37iVpW1oxDO94Ok



> On Mar 28, 2023, at 10:29 AM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Tue, 2023-03-28 at 14:04 +0000, Chuck Lever III wrote:
>>=20
>>> On Mar 28, 2023, at 8:55 AM, Jeff Layton <jlayton@kernel.org> wrote:
>>>=20
>>> I wonder...should we have the ktls-utils package install a self-signed =
cert by default?
>>=20
>> So this idea is intriguing, I had some similar thoughts.
>>=20
>> I'm not sure what the security implications of all this are.
>> We'd first need to look at other certificate-based packages
>> in Fedora to see if they offer a similar quick-setup. The
>> cert would have to be created at install time.
>=20
> I think when apache is installed, a self-signed cert is created. You
> don't have to use it, but it's what gets initially installed.

If apache does it, then it sounds OK to do.


>>> I created a self-signed
>>> cert and tried to use it, but the client rejects it with this:
>>>=20
>>>   Mar 28 09:01:20 nfsclnt tlshd[1092]: Certificate signer not found.
>>>=20
>>> Is there a way to make it not try to validate the cert chain?
>>=20
>> Olga also found that self-signed server certs are not
>> working as we'd like. tlshd had a mechanism to force the
>> clients not to check the signer, but it was removed
>> because it was deemed insecure.
>>=20
>> I'd like to find a way to make self-signed work seamlessly.
>=20
> Ditto. A lot of people are going to want to use TLS opportunistically
> without deploying their own CA and issuing "real" certificates.

Yer preachin' to the choir, son.


> It's true that it is less secure than having full chain-of-trust, but
> this seems like a case of "perfect being the enemy of good". If we don't
> allow for self-signed certificates, then we've created a rather large
> hurdle for anyone who wants to deploy this.
>=20
> One thing we could do is reinstate the tlshd option, but still allow it
> to check the signature. Then it could log something if that check fails
> but still allow the connection.
>=20
> We should of course document why using that option is not ideal, but
> ripping it out entirely seems rather draconian. That's just going to
> drive people to not use TLS at all because of the hassle factor.

I'd prefer that no client-side administration is necessary to make
this work. Adding the server's self-signed cert on all clients
is not what I had in mind, as that is the kind of "key distribution
hassle" that RPC-with-TLS was intended to eliminate.

(But I'm glad that gets you closer to working).

--
Chuck Lever


