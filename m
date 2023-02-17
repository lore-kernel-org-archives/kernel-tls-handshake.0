Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3DC6AA0
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:56:56 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7htkV012659;
	Fri, 17 Feb 2023 12:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=UNVesqqMVFgwM49Hl2Y3T3/Ysj7h13b4nrcQ94AvLQI=;
 b=Utktxv0fm6O5MKK4UsTA6Q9SjfH6bA8gEDmu76kuYCDsttW4yFSLLnFSJMzY4KbKAMet
 aKUK9OT62v5FtQCUJA0fKbjr5DyN+j0eXAldurMtMXPwq3us0gYKwy/4+aK/aTEcqQDs
 gSh6ddGuwe1EnklI0lNwxuSOn2oiWbAY25hP0+eYcQZr8v/49gpolHs+Cc7pBoZwp3ZX
 zLqdQKhDPXRi9LDpx5DuUJepflVX34LjS7iOveW9r0v0jQpnDafx0TOgdk1E010dDb4E
 oS2H4RS5f/fQAsHNPNJ6EIqR+7he5LNQ6fmfGFXWKNE9QC5yB5uexhhTfDX7z6M4qUh6 RA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1t3nrjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:56:53 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HCAkF3036068;
	Fri, 17 Feb 2023 12:56:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa4dbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGV5UkubWNiYe0zX2GgDxDQ3lhQGV7p+QzNREPrCcLhYVfgjLPdH379JHz3eVLfAdDl9dij4TmVtT7d0va1bp7MbacvYgQyVpa9X5ndkVpCBc7fS3pPs7ZeeRGQRzSNCKRcBpVPoASshieOB+CcYGSWFFeANuodwJuWaox4u+F33dQLnoUM2VzI4u4VeYWrk4z8gCtPSZUrU260x7pMmR4iT8CuptZazl00la+ob0Jje+z0/s+7zR2DBMds4iOqiaNZSTlccQQ/w9oVFHUWa7UatgDmLeo6U9mMPAh1hkQRHnMo0qgaFuZc/DmNJptRz4XPLeWB0dU8gsCKfHR1bcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNVesqqMVFgwM49Hl2Y3T3/Ysj7h13b4nrcQ94AvLQI=;
 b=fiX344g0JF1mTYJ11P6Od9FeXZbg+1Oh/7n+rpq74YTeJ1lYBoapxNMm8Tw6MdtW7dj8UWhajMf4ZDcm/dItoI5mH1ZI7+8H/yisyeXIJASssq1Ni8iMFjMQyzPo4lA+zDiQXYbKpoKJsSv7ylTAQ6RhrPTjg5cVfiqvqNCssEZDa5f/M1sJFVSYn0Ih02+oR2LI+437xcZgGO7iOZG5KETwAc8cYBQXxrPWA2TMD3xWsxBDHfeJJhIpozt8rmsoB376xxzQXa3fjgL1MQnP/WgjlVnXOVjy9RMdhzI8DVaFl/Dcz41vJj11ayHiOtNFC2w1IcBh1k7WDg5RUC9/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNVesqqMVFgwM49Hl2Y3T3/Ysj7h13b4nrcQ94AvLQI=;
 b=WF+l1afSXcbwFAvc6+a3A+bUxB1P0fC+Fp5+R7FNYXuiI3ZS+CNvzZpPiVbEhB2oKFP2HbKVnSuxt7lil9HYZl4AL+EH8qFquUeymzOcDsUv/syuLqfHrCnP8KPf55Ss54ckQaIS0B8pWUiYHJaEGU/sEtFp7LI+V/nMZtfahxM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Fri, 17 Feb
 2023 12:56:49 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 12:56:49 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Topic: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Thread-Index: AQHZQsNvC2IL5YDnyE6t4SYpSohVu67TCWCAgAAGoYCAAAJHAIAABIuAgAACPoA=
Date: Fri, 17 Feb 2023 12:56:49 +0000
Message-ID: <1CEEDD45-B394-44C8-B755-DDBE71965BCF@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-3-hare@suse.de>
 <53831F87-46AC-457C-BF87-83A7EFF04120@oracle.com>
 <89b2e4b6-3f9e-51f4-1a6c-ec9a94208c84@suse.de>
 <2A306B7C-583D-4746-AD31-F7E9DD895209@oracle.com>
 <dd737d0d-0bef-db60-b49b-b21b75812bea@suse.de>
In-Reply-To: <dd737d0d-0bef-db60-b49b-b21b75812bea@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BLAPR10MB5187:EE_
x-ms-office365-filtering-correlation-id: 388f9781-2997-4a98-c126-08db10e66f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 624umzKc5YsjoPihhd+YFBer3BeaFEwt8frPGkLUyehIfwIDxKMGaEQXa1Y3grWRXRCitkzysjPSnaUTxSNuPw7gOsdeO3IsPwUlBFqDgLHIuEfPfMMM8J+8pKPQAqgkTiuNsDdqyn9YgQiOibYgKarGASwWnuCKFNbajSHGHjWP9VlUN7+YVwHLP5MzsIBfaGpEvXI44FSm88/NnnKpY7JVHHIiczI4UixWOLgpKyyvyYjezZOqyTyqwOVW9Yd1K7oT5gYZEPFhbLNADZaGeafBy2/i0uFI6yjIPCz/ncgCq7t174pH0iJ0LSAbzZQYeE3hcJmiUv5Ff6+E88QPq7DKIMn8Mnq5jqmFrz3puSYntG+E99yLxEr2630OrHYH7Icpky4d9aLVOD6/WCkciOdY7/9k0nZBBYzgLKO+fZ50zzfwkeKEYIfVbWIsyppoQWdykv9tpkYpJBjpQUoAK0j1RVHVILDPJsBpHTilPChw50EVXmvAy+bO9QvoFl3CI3jLclB8cfDq1cn5Gj2q8lMbIfGxvj52QhPhi/RwrXujQQgwJm2Aq7GWieIEsEVDymYVDmQ8b2+gq5m4mOySI8zXNag26z6SNr+6MXPqSSzRHUzfBA4KY4/OOeoDLTvl8Vlsv3XoAc5sH6qWKeqHfyoaPBrIX4PJbpdEPa4oIpKRuX3fU+sDBbpLk82Tt+GKyZVZhmMnALw7DwygbGyZl97ecK2UcTvuSrsTQI4jpxs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199018)(38070700005)(71200400001)(122000001)(2616005)(83380400001)(5660300002)(41300700001)(6486002)(36756003)(8676002)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(4326008)(86362001)(76116006)(91956017)(33656002)(316002)(478600001)(8936002)(2906002)(38100700002)(26005)(186003)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LZlXGJv+fIu1u/BiwhW36oJVA8b6BhPnPnevERSDi1R5l9pqWl/OnI4QXS3u?=
 =?us-ascii?Q?xGx+tF/+k1+sz8cNzfvhpjtwk9k8H+AipaU1X9bjTG1zouO70QYh4WpMUtXx?=
 =?us-ascii?Q?Mdfk7l0OeSiGSE9shuHg7/FsOSA6kVJ0SNt6mrFIMqpOAsB8iUhMPiQfdhG5?=
 =?us-ascii?Q?wgsnBiPrcEKkrV6EDsgXQSHedfGbrwyB4HdwrNApvY41iLuYMfnldKirrCvk?=
 =?us-ascii?Q?yCpEMZSwLmg4o5GxblzzR2iiDVfMZ2HUA7pL1s/v3l71Q5Qx71ZB1I6hvhtL?=
 =?us-ascii?Q?nXdVj3CxCKaX62aYGedox3Lb6y3Aqg9Ny0QbAIrHVKjnFDOAfU3VoWBvAALE?=
 =?us-ascii?Q?q0O4pthJgGAd3Ekoc80trp8OvfEbzTiGXdoGxCdyOZxQ+a5/Rj7SNbIhWEXP?=
 =?us-ascii?Q?Ey1bWH+Ji0mbBkogVkze0L7uILVxjO9YLWODAPEid9ZnwhV8WCI8FScHLtDL?=
 =?us-ascii?Q?xRgezd0KT+mkE2SFHjGo5+TcyhVPIumydGZHALyxNyWIUxmBQW/ce5psvcwI?=
 =?us-ascii?Q?v/e2DmksysuaHlS2yS73h4kne6D6vOoOgPJFmRrvjHp9JM4c/Kqf9WNYG9rI?=
 =?us-ascii?Q?+/JypaSM3+Ji8O5Av8gHZHo74Va7gMcc9aM4nrlepzL4Vvyh9Ba56kKAYuAg?=
 =?us-ascii?Q?JceeRnNW4SRtRlGC8UfIseVO85esv7eOXQ63cJx3QuiNnMAn4uo7MTZrq+3S?=
 =?us-ascii?Q?lPnkkUKYwC9PbnAgR+YIZXnMzt7UAMmGnKAzgymx451u1n/k7RebrVJfVfp7?=
 =?us-ascii?Q?MiJo25mKPLfiGPT6OoAbCdNtRKmYUo1g0fofW7wGrNjUe6O6EgOwhd/Hi3g+?=
 =?us-ascii?Q?OibNGWWL1znnMH1p5jkCUuB34FVeC9P3VLxqCSw7Dh6w4f0G4g5SB4W82ZGr?=
 =?us-ascii?Q?0NVhVMTMY5RFpxPecO2kCcvzSlyICOPfFYc7WxsQ21GRYiqS/Kf66hH5OFhD?=
 =?us-ascii?Q?CJFzKtLIwZXcCB6VZabniwHw2rKVuDp+3zSzF4eQMPPfqAFmH16Ud1CgUNRm?=
 =?us-ascii?Q?SdtunqaqVcUOnBsqkC/RBUYsCcGqQnUl/AcGG8fJz7kNy6sejG+FJ681oz87?=
 =?us-ascii?Q?FFccg4JdWxcUCqCoUjCEvUQP1ZmXwSNZzeCjI1l8fkgj3auPfnpizOWNaGB8?=
 =?us-ascii?Q?UcIb0883cOhy/GwvIzLjppjqPjvs8GtDPk5ch7/YDL1wmm9mHzcNdQm0m6I5?=
 =?us-ascii?Q?ruvohCVazWo9BUcKkAGR2A4cMWiYjoy8YVew5uUftxspPKiyJ/4gi1MgScWO?=
 =?us-ascii?Q?c94IN8USyiToDGm5/ThrUKs5Q7mxLZnC4b/Iv9SCtW6ZLLK32Si141LbgY/+?=
 =?us-ascii?Q?r71KOtw3shSsdjC9JVWXVGX2dgxXAaEY0hxnFLw3j/d6ygfEJlkZyKiqu9/2?=
 =?us-ascii?Q?3+8bIrI0Ejoa4mylOLjYtB571KJ9xLmBPtIFKj39xRRQ7ukzB09/krYcdaz6?=
 =?us-ascii?Q?rdMLcTQhSif+QVBD5Y6/YjlvC6GGKL7adLs/aOh90vINvWMGec+8N2CWt8Fm?=
 =?us-ascii?Q?TXaB7InMc4Njgl59vO7Osgg/vResxP+YOtY8VI6LI55c/CKcTOHbqqw+e8Ol?=
 =?us-ascii?Q?g59LDrZlsmPGAqjrlhqn0VCqVqlmVn7h/O27IIhoh7JrlFI6i+AH64gdHFcn?=
 =?us-ascii?Q?pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9272A146AE6FC4D8C03323E7F024B3F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zpQHCSpwmiSgM9UJC/xJZQIeuJG00Dz8PenOdGMlm7aw+OuXNqxYFkzlbiJBfGozl2bPG1jIB/IIuWg2/rL37CdBOpXN7B52iNME1wakm8UFXkLbOQ2IyqHCdep/Xne4J3c79M/kfZQFf3K2eWHaMoUHvkiT1FY1jMtsrX7dERYsTwJwuCCPzgNB5YP1DHYqfI9Zs6x/n4whf8EvdDlKwh5/oiuhqtv0I1DxD8uIf+WN4TalRN9iLVZxZNors9JsrzroXOj0K9eEmjltDpShaWflbUQrncnghYheADCntbDiHGhfHEHa7A2VUA6blO52R6+JrhAXNSXkqD8uNYrzYEvpzzDbl2fscyVXdip76WzDSM8kJQrFMf9zTDXijleXzY2tKvpHHWlSbCCvR1vkKJg98KdCP0srmivPn2Ta2qfJjbbJQwRvU/7sbtgfsnP7P5Df7k+uPP/LQ+8AwLYKuBIFOMRwyBrp2JYsKv/HNDh5krsppScW4nr3fKyyQhVuSQDWODW4INpZtf1yM/kKw1FMw+LHdEkVhjrZ6RJBhswv2m1LRl4r+Ej5k5ZegP/D99w9OefMm6tk+pvXChSU+QoZmBSLZUkRZGWtoYY4jZDCoWVkSY83XFoVBym7ZqjbTJl8Bv1chZA0DEeOO0aLuh38F0byAX+/KtBxGFJBknm9pcqhXjSZ5ritv14YXTxGlR2pXzK0PznEo2t1xeJhRnReQmd2IBdQMhtZ2jm7vQ2MHz9J+vxjY9DMswO5qAa+eLKfUxDkTkOp41wDsYrARuhhb3Fy1Z82gL+umTTZ0bQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388f9781-2997-4a98-c126-08db10e66f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:56:49.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guhvvhbuU8lXD8EaNnzi/Ju7ujPnozFVTbwmxHCUz8nz/DL6JWx0CnU7vHwP0t6wQllV/iTG2BXf7JFcvQyI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170116
X-Proofpoint-GUID: Y0-XTql3gQ0UVkJjy_39iu3jQ0ekna93
X-Proofpoint-ORIG-GUID: Y0-XTql3gQ0UVkJjy_39iu3jQ0ekna93



> On Feb 17, 2023, at 7:48 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/17/23 13:32, Chuck Lever III wrote:
>>> On Feb 17, 2023, at 7:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> On 2/17/23 13:00, Chuck Lever III wrote:
>>>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>>=20
>>>>> Add a 'keyring' netlink attribute to the 'request' netlink
>>>>> message to allow the kernel to communicate the keyring to use
>>>>> to userspace.
>>>> Can you add some detail about the use case? I'm not
>>>> clear about how the keyring is to be used.
>>>> Is this keyring going to be the same for all operations
>>>> with this particular tlshd? If that's the case, why not
>>>> have tlshd do a GET_KEYRING downcall once when it starts
>>>> up?
>>> And that's the key (sic!) here:
>>> with this attribute each tlshd instance can have a _different_
>>> keyring.
>> What do you mean by "tlshd instance"? Do you mean each tlshd
>> child process needs its own keyring?
> It doesn't 'need' it. It already has (well, actually there are three keyr=
ing, one session-wide, one process-wide, and one per thread)
> And all this 'keyring' attribute does (or should be doing) is allowing us=
erspace to link that keyring into the process keyring.
>=20
>>> Idea is to prep the server side with the keyring to use, and then
>>> reflect that choice to the userspace application such that it can
>>> lookup the key in that keyring, too.
>>>=20
>>> (Note to self: need to change the initial keyring to be the process
>>> keyring, not the session keyring for that to work)
>>>=20
>>> With that we can be sure that both sides (kernel and userspace) will
>>> have access to the same set of keys.
>>> Idea is to have only _one_ place which need to be configured; in this
>>> case you would need to update the kernel side to allow for individual
>>> keyrings.
>>> Without this you would need to configure tlshd to use the correct keys,
>>> and it'll be rather tricky to configure different keys for individual c=
onnections.
>> I thought the issue was keeping the keys private by setting up
>> a keyring that is accessible only to the kernel and that tlshd
>> instance? Did I miss something?
> No, that's precisely it.
> By having a keyring attribute we allow for configuration of a keyring per=
 connection.
>=20
>> Seems like the tlshd child's process keyring is already set up
>> this way? I'd like to understand if there's already something
>> available to fill this role.
> The issue is to make the keys _available_ to that keyring.
> As it stands, tlshd is using fork() for each handshake.
> So we have one master process, and one process per handshake.
> The session keyring will be identical for the of these instances.
> The process keyring will be different for each of these.
> And the per-handshake process needs to be able to lookup keys; these keys=
 either must be in one of the default keyrings, linked to one of the defaul=
t keyrings, or have correct permissions.
> The last case we've dismissed as we want to restrict the permissions.
> The first case (per-session keyrings) is essentially the config option
> (which necessarily is identical for all handshake processed).
> And this patch now covers the second option, of having _different_ keyrin=
gs for each handshake process.
>=20
> Idea is that you configure the in-kernel callers of the handshake to prov=
ide the correct keyring.

I'm warming to the idea of having a private keyring per handshake.
Thanks for explaining.


> EG for nvme-tcp plan is to pass the keyring with the 'nvme connect' call,=
 and configure the keyring via the 'configfs' interface for the server side=
.
> If different keyrings should be used. If not stick with the default '.tls=
' keyring.
> For which, incidentally, I've got another patch, which I probably should =
send out, too.
>=20
> Cheers,
>=20
> Hannes

--
Chuck Lever



