Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AC200BC
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 21:10:39 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UKO8TW003930;
	Tue, 30 May 2023 21:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=QQrMz4Fz5v8bvr1VFFe/HtXAXAMY9N3P5L+w68i/Nfg=;
 b=eMJLxLHtfNIx4sfl8PAN4sDg0z/MbIsoeG9wScL9a/RSrlLLgQo9EPXem0+dY6PeEnRH
 FUN3glhArJcWk+aQkpx/rRAAFGP6tU79BvvYGY37P5FMuNQCHoE5L+2WYKrsg0HuWI9A
 ThTAaIsqYh2vIt1Cu4p++UOwnLP5ZD6yGxJv+95wgakPlowN7wbmjt12lzGdQ05YCR7t
 Qm9NpDPvSwTkLNneGpsKVyrh8tWi3kIEq1obN4PQAyDRsslcLzs3h/RbBJ5jeTm7BG9w
 jnDOcnqHsiMbY7Ji5GDAPlxRFG75h2T7h5Zt7R7V3+GVRBlSwPyNMTXrNDOultfGnKPm 0g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhwwbwd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 May 2023 21:10:38 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34UJr0Av004391;
	Tue, 30 May 2023 21:10:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3qv4yc38kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 May 2023 21:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3nB3ueIcKc7/fsGurYWdAbraNw16ScNV7JYrQHGVTw+IIpSOqrBv2WkVwS1v0P1QE7MvSXiVD4aYxLEiYIj1QrddOi3DojHAzouuUh/a4epC/hCTkIDN1vK6w+jwKLJK+GROZlOJ+xRNKMeI6XQYHjXaV7jvnKc1IoVylmVrv9CRYN/tsudTz+NAPQzTGwBBDbZRj8rGzpMAqAv10J/nMbhCtbg+NLxVxRi5cMnmkYui/7Ca869hur+yqNVP9FyAuyPVcy35l1UHNv8ZeiP991WBD6WY1tDPC70DybJIu1Z0CSPwPzsoch4xXNa1hE/jjkexSotRyxBZ0bj4Bl6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQrMz4Fz5v8bvr1VFFe/HtXAXAMY9N3P5L+w68i/Nfg=;
 b=N8iOanX6F+pB+fT5nXaYK0srB7ERmZv7FEXQorPrFHyzY0TCFV9N/9PHuSKkUDva/uopE8cP+SjtbS7omBeTYJkzzwvPnDhqWNBAPRJqIqmItjlhplM4t0p9TBXrdzcwDC9/26NvZGOxto2b+NDuIzIVks4t/bkZIG1SwY643RujKAG2wqDNhpa3bbIUtU/9sevm8znOIPiM2qdi1tZxAvnYStCdRjvxG9QGxkl9MOUjNMqLkwXRlAZ1UZluwSrR2pD1VEDSCGvQIOqvAeZaBy4Fo9hKqX3htJxs+hdhheUrE7ncowkyrWCRev/7aQ1jlRcqLZsFBXVSlRT9OeALtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQrMz4Fz5v8bvr1VFFe/HtXAXAMY9N3P5L+w68i/Nfg=;
 b=MSPslDVhFBs5inSy6wsQW6k3qioLKIPVCoZo6jZpGNE3i9mf5C2uV78Ux9EVkU9l4TFVMAF47lpaA+jV51XNHfESSBIuJGdc9SDK02QNo/WLubJ2TeZqijvjY0bdq5jF1c/ZqvAymC6HOSpIvo73O+rIENfhvONENra2Yo62kpQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4243.namprd10.prod.outlook.com (2603:10b6:a03:210::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Tue, 30 May
 2023 21:10:35 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 21:10:35 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
Thread-Topic: what should happen for proto=rdma,xprtsec=tls
Thread-Index: AQHZkzrk6rAEvRS9WEuMQJIn/kwPgK9zT9YA
Date: Tue, 30 May 2023 21:10:35 +0000
Message-ID: <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
References: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BY5PR10MB4243:EE_
x-ms-office365-filtering-correlation-id: b68aa1db-d977-4021-d787-08db61524f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J/lSoq3JhnFU3S3Iy1jLv42wwGXlDSMmE4yLWW7yUQJjY1OaGokFo04d8fhvOH0pgkLrl1pb8xDLDhkxgWtY/8bc1GQXRCHZNKwJOx5N4UhsO6bmS6PambSUExriYyXOMeCckEPNk446tDjTy7TmzQBAJUTKhBDOgOPxLJ33LtChFn01ec1/xFROiYd50YG/xUlcW1XAO3nt9dvAVQmtxgRVfRLMW/O2Db7vPgilXFxeNkZEh2XqWChHLmz0LRTJvLp16A6S39rIuoPnAkAxpacRf6h9gkZ0xwA832RSNWR/WjWrBXMHjM6+gXNOnShAVqOtpnoPBT7a0H2KM272qSSR2nUht2lQcJ4qfm1pRw9ToIR+It+wYJBmd8EqZS1z0sDvwM05HsI4i6Nu3WGLCDctX9WD577Kt9X5Ziu3o+xYcJsGuVa5YJ6asolXZht2B8FrST2mPfWT4aR0CO3Nqw7JUQOx1sFShoBdsk6DyYkbQ/vO8DIzQK+Q/kw8ZX19gQMIIPILQ5G7OWzLHBTb5xZQkmYxCwbuiPXJpQDi38lkw4hD6YayLwii48VBF5R1P8GlpcJwZoMgQRLkBzHCG4cfIrQJU1cWnPwwrov3jWzKmW0NZlI/ZSCfY6smr76WiuTLg2KxcdjBuFa1jy1/UQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(186003)(38100700002)(41300700001)(2616005)(71200400001)(83380400001)(53546011)(6512007)(6506007)(26005)(6486002)(478600001)(6916009)(64756008)(66476007)(66556008)(66946007)(66446008)(122000001)(91956017)(4326008)(316002)(76116006)(5660300002)(8936002)(8676002)(2906002)(4744005)(33656002)(86362001)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TUE2feWT+I0cpVCJBMJQ4PMW5kICANcxVdPJKGoG1iHXDIOKI/LMS/wFk8oG?=
 =?us-ascii?Q?SceZsSYXMIKzUpNTyi5gy8tgXAwMHp0UyP+3or75ZqdFhYz5/9yCmREbnA8P?=
 =?us-ascii?Q?jZPTJbML0XLknrbRdGi7clGXY9Mgtn+RdXYrI1/JPjMQhnLouW6RIeaFI2S7?=
 =?us-ascii?Q?ilaXebVfQq/8q0tV1ZfxZabRD4AqRDyLXkgo1CX5vthcvyBALicMt/zCA/39?=
 =?us-ascii?Q?z0F8P4NC4F0Yo6nG+jkp9xKu8vbY88SwySYW3ACWmI/w2Gvewvv+PvocNRpr?=
 =?us-ascii?Q?0dQgd0zVALqPlPHNWPhcoCpbrbl71rYaoiNfNAM2fmOqhRlcHvTogLIujjyA?=
 =?us-ascii?Q?TXCPOwx4abjULg8LW33wN7UJ/AgY/8FtmD7cz7qy2dJ+34CumzE3i1rR8Vyl?=
 =?us-ascii?Q?Lu7cd1LJhOa+CoMMzEf0ylfaA8oJyqRbsIlaCv9fivNeh5MpnBJmMj670DE9?=
 =?us-ascii?Q?6ZGZYSpKWPGPrO+fm0PR8COdquJONDyppnFmI+9sLNC0OEKqCyruPZoDFzW/?=
 =?us-ascii?Q?8J9T9lHY4RTpzvOEXvrLyiaMmQOHXVXhD6I2ELR4TuzLBzgSBUFO7MS2TH4f?=
 =?us-ascii?Q?UArYklfMYB/nMnzn8hy//jwSTSNqty5ZDPZVQNmcpSg1qngeiLqo6bYpWGxI?=
 =?us-ascii?Q?ZVzRuewWEgsmG2CxUusDPPvhF6rdc7+TlHlSZ5S0JqYWc3vZDwOY6xxaKmW9?=
 =?us-ascii?Q?iOUdVRBN76ikIElxnbu0yCvpVRXSKtgZQlRezNyLaKu+FZQDqT7WBZo8MU3l?=
 =?us-ascii?Q?QM3gUmXkjRmtrlYG2vhWcLsiXX6XbAULHplgCJM3Lcl5u3UiHdSFt4xBOYme?=
 =?us-ascii?Q?vWUwhRXMuY3F/aMSJeoL64ueDzXZsP/1g0niIemLlk9DOA/Oe19IE6XHA26A?=
 =?us-ascii?Q?Q+c8kE3d38q4R2BzecEecodTN2iPDL+pAjW5JWTmc4CWjgjfRHRZUT3B+hr0?=
 =?us-ascii?Q?3doHqc+Cz8JYNRJproAh5yy1L3cwKqYqwvPe08zuc4v1gvzsZBpcxIGYKFVb?=
 =?us-ascii?Q?dpD5ufde2VQZ5Ue+sJxEJNvEgnG3yHJ9EqdQhb3mLsWC7bIt9LcIJ10Aa665?=
 =?us-ascii?Q?HQZDM5q/bHPxjOTdJt8zyDyeyla6SUdBhsqLypgF5Nftev5PehyOhfZbMTpa?=
 =?us-ascii?Q?An0MxEQI67z6km1FWHOSjxGTakvx+/FqFzCcozAECnRiyLQmUCEEo2G087fK?=
 =?us-ascii?Q?4SY0zGgY6xPOeeOFD7ccS/gtM+9U/DzDcLBET5cik3NLrdN9tH2xIj8HWEiZ?=
 =?us-ascii?Q?260XVnw7YoQFoKDLTCQzLHaeWf2Z/lSx/C+L8G1W0m5OquIldmo1I/6q7iBV?=
 =?us-ascii?Q?brwZYK+UofO1UtYul36RnBbAQS5Jva9iZtE3G7l05uUXYe9LlNKJZqPUtn4C?=
 =?us-ascii?Q?ixiAujRBLOoWUVBNc4jKJI6ZdJAIQzYw5hoEffy5cGkrw5dRpY4ELp8gvXqn?=
 =?us-ascii?Q?mdQdixqXMCvNyg1nVJC+tYSV7bmMecIadLrjKPPHR9qahpjQqrwphspJU4Dl?=
 =?us-ascii?Q?2Tt8gj7JrYAvDX8Sx1PBk47bnyGF50QulSaaBqtFo//DAML+cgnE4JKxsBHG?=
 =?us-ascii?Q?dNXoj6VH0n0grYdJugVZ/84nB6woCaDqnmMCwKC9FhPCBISYSY1gi4jOchjh?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BA2E33F5F7FE34693EF0CBD07D33CB4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xP0+NIVHJ2k3HhsFnxIIbtB0VQI/yGwYupH94mj2ziIyDG/vDfR47K3U/fHh72tuH72Rwzw6G1hRAN94I/TgxhppbelcbdgsDlzjCO+6OEEnvITk66vV/eBik14PD+Jt/RISBGobmrlTwUzEekgL5Ahpmx20TmirEz5jShaoSDtpBQrb1kmsHwAoNBlBq0CPyAJXw2QmaLM4YCaivm84tAbadSFDBOxEE318wrjN/59w3iSaaSmcWKvDMjP/W8z3z8ud7Pf61M5yo0Yt5I4WQvmVMBkLS2XxZ1c1hHjIxZf31MhWoukAFy+nl1Kk3Uklaa2/yfh/84RWSKvUIBQH6xSQ5roy0L8hA8vmBEjgmXV2CQhW6hyDAamWj7S3FIRg163ei274uXscBgPD2676rjxt6BLiicbocGTxe1ZrM9Q7moCvffawxNMeapc639RbXGio9sLBuRKOeOhqc1dEzQW+7tGLbosn9nBv88MbOSnd1iDeqXwiNdZwViLOFfhWBr6cp0Pw5NrbHkUfRciMMo4oU3B2OCO3UwqmJ4QEv40ezPsEqBMBGLawXb3SnC5/rXVIQJcVCUGfZcaV552shEIlamWgT5JY5hc4Qn89A87Nt7VO74WK2IhIeWwB0z5L8wCiZsGdb/hABNZsyjVscwxAXbsE1SXPYUO4WfLc6YA1AQWQxiJb5E4satrSAb3DQXn99ru8NQOirUkdOCX8MPZDlWMLgaQKWFX9VLcdH4Xp+k5FKV67iehcDgk0d3RbEBhHggNLVNVrNDx7IObh4nQz8KgOZmTvQkqzm7qsgXI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68aa1db-d977-4021-d787-08db61524f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 21:10:35.1237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooDan4hckqn/X4O1ymObHH/AHAi+dhcLExikOAxXZscKLhMTq+yMU8vHlX6AMpFAFKIltwdIG5pLXHtUKBrgAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4243
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_16,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300171
X-Proofpoint-ORIG-GUID: ynJcEfcf_Nzvb2u4CWOK8sKjmI2DMPG_
X-Proofpoint-GUID: ynJcEfcf_Nzvb2u4CWOK8sKjmI2DMPG_



> On May 30, 2023, at 5:08 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
>=20
> Hi Chuck,
>=20
> I did
> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> 192.168.1.106:/nfsshare /mnt
> which succeeded and then I did "mount" which displays:
> 192.168.1.106:/nfsshare on /mnt type nfs4
> (rw,relatime,vers=3D4.2,rsize=3D262144,wsize=3D262144,namlen=3D255,hard,p=
roto=3Drdma,port=3D20049,timeo=3D600,retrans=3D2,sec=3Dsys,xprtsec=3Dtls,cl=
ientaddr=3D192.168.1.119,local_lock=3Dnone,addr=3D192.168.1.106)
> Naturally no TLS happens for rdma but I'm not sure if this mount
> should fail? or If the "mount" afterwards shouldn't display/claim that
> it's doing xprtsec=3Dtls?

That mount request should have failed.


--
Chuck Lever


