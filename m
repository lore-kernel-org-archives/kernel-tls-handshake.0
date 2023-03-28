Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF68465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:00:45 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SDeDC1030493;
	Tue, 28 Mar 2023 14:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+bATCSd4gR2wsmnThsvw5DleTbXWdDHMs6k2fxAqmYM=;
 b=dlMGya2wAoTUnoZN2/n2H38v2M+VPlIIscNECwAVt6OhKMYJzPil99GrY9C3CuWEuluG
 Q4oESQt9JyIGoi0NByJPpwxHLJUVylZYXKxoFwnmtIAhyh/mwm87gUFyNB5jXhx485nc
 Pvri8lB1985ejCwt7QpVqec6cN/R8zim0K9M35+CTGyGtpWp9LViyRTVdCz8G067447u
 Zd1X/Rth+ushpJ7odIKjyQNeRRmKQl6oW96w69fpxgv4G8qUc4AW6OCNuXmeefNAz3A+
 Zq/WHsGHls4j3OSbOZj+BOmV3KhI4cFRdba7tX71IpRUSxwhgZsut5+b2nWfb3h+BSog mQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm1ar03vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:00:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SCAGQt027462;
	Tue, 28 Mar 2023 13:55:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdcy8uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 13:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6/qt0Wv6rKP6f/H3/rxVZ4ByjPhhPjJ/4AptbL8eHtMFFw58JiiZ5byHJtKwLdlaD7buWnfTg1wTsesG99MgVxbhfuRnAFcidX9idQ3EUIqDUha7VmeMIyH7SlED6C9UdcqbZPcUiGOMP3URsgPqI8epfuoOzVM7UGDGj7scv2+LHLOGkZmpoviIZuAmRMScZn5yUkvSdPc79xYPJ+qg5XgsEZxPf5xHc/BQX5b2uUG1Su7Zkz4MgQoJJC1j3uyy09wQ83o7A3o+4waDG3igtCdPfLTrlVsJ7IyxfPH2FBj4XxCt8kFc+41H5C9YqiXr+mnfgOeejw7pGfeiR7KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bATCSd4gR2wsmnThsvw5DleTbXWdDHMs6k2fxAqmYM=;
 b=T3chLfAmoTlCiPBa57rb3dTPTlNFzHeZTJ8vD5WekizB0DpOue3bs84td9/Ou7P0vv+gWPlNo7+2o1vOcmR+hfyk7ElzUHKaWAaEsPGYW+96xkgjiUICxyvu/bQZqSdppaP0vLfV92F1MZRnFo+g4vtqTYkMS9ARMNvLNS2ZOficfo8wY949cVRv2pnMHHMKIF4kYH+Tn555uv3Gb0CqDFpggRJMWifuqUvTLfSPnkNk2yCLqT9vH3ibwGPIfZA09oGbFbsEsh20tXd7Rj+PGqjwy20Y125Na35Ea6A5vq6/VkkYqQPmPWUyS9ks7xrkDVfSrYoKzAtkopszWcTTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bATCSd4gR2wsmnThsvw5DleTbXWdDHMs6k2fxAqmYM=;
 b=sFzz4/kjny9EL2/T7o7H3jUvW0CnV+gHcbYc8+OL1TC0n+tZHYBzsQu/41ilayMkZ2I3R5plI4UL8/6Wz/CqJoWgcE6t1bjZCsA5vUklHVfTNgq158vz+QjtoMAa3E+t9KzJYn0fXe+o4lbiDQ8cF7UtSrU3xnGpB6tpFNWP6YQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA2PR10MB4777.namprd10.prod.outlook.com (2603:10b6:806:116::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 13:55:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 13:55:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QL9wAgAAHJwA=
Date: Tue, 28 Mar 2023 13:55:27 +0000
Message-ID: <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
In-Reply-To: <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SA2PR10MB4777:EE_
x-ms-office365-filtering-correlation-id: 8a1456d6-30ad-4e4b-11c6-08db2f9415d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mUrojJZXIGp17JuEjz5I5NXbhVRcyb4AcTk2meWU06h4hRQIu6nsJVr9GdzpA5AllQPHka4058gawAG1/VQQCcm2WOxHYZkAb+JDZGxpp1jPLwroXStIW/ps7lSTSoREr7S5GbJk88aRkhXmdNf+Kep15D4UGj7RgQGNeKjVPH7k/GUSQBQj26eYoYobgzXLcdnxrnkZv11ru5odPXO16TdC1fntX7Dpd+h8ceJNTCPDNVuQg/Yhpx4LtwbOcTFhkLu0H02WrVHC9pqRceJFQbetvRhcxVdQhmEQ+SMSLQtDL64nTAvtzcj0QwTrfZwyBBoTi7GeXy1r8auZnCVBqNjfZpdSPQwp+5QpThxVfX44WwnjfkTxMX4ba4a9pRpdy1/KW9Nu/jIson8Nr6Aa34sSCOmT/odWu4vZLC3gGocuSp71FwW6IrI3JBuJp0uDbod/FpWDk8gV10DU72oCWvbRVHn9qmXKWEyxADjVs0JSRAICLLZKou0JzR5OyDLp+r8X4HZWpC5AO+PPsGkSJcyFc6hEUBWGz3r+DolzxxX5SyqnOmYjMf6dmX+7o13LFZWwLBrzy7i8x10TrhXD4mSngFkVe/yNdEpjnKi1PMR+wLqiFsY2gOGXOZs1Xa3rMKhZm3F8nq34J1rPpa2q7Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(36756003)(122000001)(86362001)(38070700005)(26005)(186003)(53546011)(2616005)(33656002)(83380400001)(6506007)(6512007)(8936002)(5660300002)(41300700001)(966005)(6486002)(71200400001)(91956017)(76116006)(4326008)(6916009)(8676002)(2906002)(38100700002)(66946007)(316002)(66476007)(64756008)(66446008)(66556008)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?R1feOOX9h1SseaLAfodSIFdighcv+GSmQGcgkJ4R1VAtVAJImla8RGLKDWH8?=
 =?us-ascii?Q?Q6i7xiFApM2BND0ovHUslZXavpypq95ITcP+VK3T6v3nJsg0imp6Q4a1f7VD?=
 =?us-ascii?Q?ISKnZsL8nymdg+ve9GJqrab/n2ssPTJOBrOwJiiTPpEzW2pmEt9j/jvmOhmp?=
 =?us-ascii?Q?jWiWugQdpS1eUKgjUShhFaNdTEp8XwL/Ir8eO+3BElv03hqiS8a/uj6wR2Yj?=
 =?us-ascii?Q?JgrcvdLoR51603gzwW8WKZ9b0ion8UMlIn4V9B+mB9HtBkpwvmsMNCdFJ3Jp?=
 =?us-ascii?Q?alnpWapyEsri7pUl3CvtiLSSCgksQLEz8MM0pt58fafE3NyfV2MWum78tut5?=
 =?us-ascii?Q?/XZ0JKXAph1jMsX/g3KO9ZcwL4IId5U2XCm9og6XIBilLFaieGXsHwegfSol?=
 =?us-ascii?Q?TKgj2XdIrRROfx4KVRRN36g9wWVcu9/jR1NtoXWuqxqDD2ulT9A8a0kbA3nw?=
 =?us-ascii?Q?eaP83jVbQKGQ1E6Octz2wPi4GlM0YXkhC96xQYU5QpYGHimVgtEmZ91dpM5p?=
 =?us-ascii?Q?GBWZHolrke23ZhgmhRZNR/F0TY7sMqkS4FwGmuK+QxpASiNdr0fQH5oZ7tQp?=
 =?us-ascii?Q?xj6Ff8b2s0bsR/qxvEm6fVwR3cRCmNB78xMCUJOFbgXre7cKDhzhkAiKUUO9?=
 =?us-ascii?Q?GtF62Oa16r3q6yn8FQ9dXcHcEPy16mz2xY6YaqH9sz7QPjOx91sYOkndNcYm?=
 =?us-ascii?Q?/hKTAHzwEL8AFGAx7GtCAr9DuyXdliGqfCrIX+/LBUFZEds3CyLpTOxd5MWH?=
 =?us-ascii?Q?UGORaKMUJOnDzL6mp1Q+TSKSAc7iW8vJ7Tj6iR8Dm2JjLmyoKAZSoWICKYfX?=
 =?us-ascii?Q?4MrZU1QQeTnqU1a/FnB0GAa3kU9obHlSHCVLvAKYW0iSAiQkcB0vIcKPPNii?=
 =?us-ascii?Q?n3TS3LgzC+gg2g2q1LnhLMUDIvHPX5E5y9fEqkK/7vxL5wmKY8BjJkZLSeug?=
 =?us-ascii?Q?TN+abP0mlZZ4XXdb7jvlh7oX0MzYdX9dQJOFkoexMBvP/qQOD+Fa4Y781SRE?=
 =?us-ascii?Q?XIVjN7Rw/m//Mzo8gvnZjUBnVkumAm4Lazs+RLDAs0KhRS+svsFHxjsqbXfc?=
 =?us-ascii?Q?IsiRCQNP9+SQcdr7kEORmbevxT3C0dMPtAKwVrF/IZSMH5WhRUq/Ia9AcMO6?=
 =?us-ascii?Q?98EjMXah+m4IP7AvJ+/cx/XXiV9weM0WmfoemXu5powZOWNMlb7H7FodABGU?=
 =?us-ascii?Q?hLcip3lfVlGlG7t+vuCVLEeijRHTvAc6VYMFwc+O8b6CCBh3/GKDRr88gi0L?=
 =?us-ascii?Q?K0IodIalAWLE6kHinFEMm50g3LsujesfY8zkdnFlZC38yik8EGTIUF2OzvEC?=
 =?us-ascii?Q?Joue1OrMBXq+SQqfXWEA9qYaoAEV/sj8zqHDtq/IMf0OkKaCv6mBtbuLeCfG?=
 =?us-ascii?Q?2sQmtx0eppkR/Int+hsQKGb8LD7PAun2dwVxiXpmOWklo4H8EHFRDVrLuZOu?=
 =?us-ascii?Q?OJfh6csEs75SksqRSZ7/VbpQbW3tMCzQpsK5LgnJdoILS0418zH9SYmx7rR7?=
 =?us-ascii?Q?fGHgQo/vT5XcD5EAr+guAb1DHB7TC3QEhXiOI+qv6YSSYtkh112EEqtI4Ov+?=
 =?us-ascii?Q?zIlfczBn3wWPB/XYNKupAvqjLzCvxsL4Gq5HvNo4dYSV1REZL4pzhVfmDVMF?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BF948398E321447AD84E293E5B5CF8D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	si/CqrFSqJVle33e6BjSAlp59mmI18AknSZvjImWm041ll8fxPRtOqU//1jNF9/R9DlPuAW50+XGlFaZBQONwP6x5IRQKp0YgHnLoxlYI2KVeg9RFZMYuzYljsaEk3m9tWZVCDNzfvon+JBvvcvmKAfVbwsxpMXzHS+wARzD3N3JNNgBfYSFdjQ2USS2rLT31ebHDFIUDccYetQGrrSgVpzWf8w5aGApD091sN3euXYqbrsJxS095R1zrZwyPRXI1NxzxoEFY8Sxdsur3PbWgChNYyJAMIkM7Ls/gTqigz+HGHWjN3Z0naSnTEEch5y2IXetr9Cra1wqrfGQIAHxyKtbVhYuB9KsAAKsR5MDWiphBjnQGaqmDeZk10DWklYgIBLiWm8+vK2SfJ0WXMjN6T/NYxKqA9b7vXHItgbMLuVKowvzWXzdbFtYIO6g9+KI7aYOEiUyoJaI18SL3FgQWFx6pTzFFNLzTZ4KYLsPR0MynAAfAQysmNFKYyGsXXU8x0Fcyq8XySaM1+YwkGd+S47lMTckQnTtj/a7m/5xUYNZytB17n0NbaCt2KtzDEiq40W0OMH1Vvb66oNe7XP/5u3q2+/IsNeccEZKg0Qz99To5+Wj0OoNh8kjrIoinA4CUtGCQhZPs2UIubOEuWKajgXEmO42lsdYp7SpLrw1Ddc6WDRpLQyvn1OHxaoLjIYmBFLAA/nkEbvixwGn8A/JBEmFz4kX0n6l6SImiCy08agnGk0p2iJ6kyX8SBauPelqc+JvhxfJ4uk0QfYZ4ptG7pFEwWiV8Y2F8XcpjwguiE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1456d6-30ad-4e4b-11c6-08db2f9415d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 13:55:27.0809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8w1s0rcyXCPm6oH7nJ9VFfdyznH9fgqEzlOKBOyT9Lpjm3H43Bns/cK3be5KQkuTvH5tS38NYDgvGpVxFjTGuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4777
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=989 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280110
X-Proofpoint-ORIG-GUID: zCxX5vWQjBfghEc5VeYTZe14UAbnQAyt
X-Proofpoint-GUID: zCxX5vWQjBfghEc5VeYTZe14UAbnQAyt



> On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.com> wro=
te:
>=20
>=20
>=20
>> On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> wrote:
>>=20
>> Hi Chuck!
>>=20
>> I have started the packaging work for Fedora for ktls-utils:
>>=20
>>   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
>>=20
>> I also built packages for this in copr:
>>=20
>>   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
>>=20
>> ...and built some interim nfs-utils packages with the requisite exportfs
>> patches:
>>=20
>>   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
>=20
> Note that the nfs-utils changes aren't necessary to support
> the kernel server in "opportunistic" mode -- the server will
> use RPC-with-TLS if a client requests it, but otherwise does
> not restrict access.
>=20
> Client side also has no nfs-utils requirements at this time,
> since the new mount options are handled by the kernel.

In case I wasn't clear:

This was meant as a suggestion. If you want to simplify your
test set-up a bit, the nfs-utils piece isn't needed at this
point. But feel free to include it if you like!


--
Chuck Lever


