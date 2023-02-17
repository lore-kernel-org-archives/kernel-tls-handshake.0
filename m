Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4D6AA0
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:38:06 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7hgtI014913;
	Fri, 17 Feb 2023 12:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tqHDVzd7fkgEmCGou0S3dUJZXpf6xsg2msdWG7yyu48=;
 b=z/NxGGjNIaAKJpsNLC35HioviC6FrWTzV0jyk5OrEBZv1OlBu26Gx3KrG5IMdzwDvuXE
 07WFW/kCDYMuLoFjAoPgI6VhFKLLAruqLpPDFhkqO6iUyw8C/bsiqqXPcmsYZmlys2xy
 hQwRWjKznXy1tMVey5tIaBzA0ksWq0DsckYxzNnsgKkK3RAi31fVU2Bn6gjsK1RFqIi8
 p70won2emdwuqQFjpJN7sxxO0kJHtZzgirwyQEHErRKqFCYOF5PW3YDrD4DCejECq56M
 FUQBWfQyC/gPmEAIyBnytBzHuFb4LSSuYIA1AT3PliteCCe5T0F6knEuL9R0B1FnrgpZ Uw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2wa5tyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:38:05 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HABde5012133;
	Fri, 17 Feb 2023 12:38:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa25ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBqMNOlqHwPmQyyWGAAkpf64hQlOOSKmxJUCpYNXM0ifB7L0lHp0Gewf2FpF1wbf8GH+I49FeljIzEAvZQo2/d/vFrBJW7aI7cY0BLjE+2EtfuYrW133cJWi7u3BtOd9nGztwg+9Vs81YhMbzPxAUuDlfnKQMoRyuiM6AKJXdgqzkUHCz0zG2l2/CAv0+/FDDmebeFK6pvjQl2/ciMTsL3XOtfkc2xMHsarWklJOIkXJbBkw2LVjiiFAvPZ4NKfnnp2ASQB8m9uuy4WXinGKTyRUfeI3cqMX9dGPKzygYdMQeK7/y1En3M0LqUDCe2NeaaArhVQpA/Q+zWS/iotbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqHDVzd7fkgEmCGou0S3dUJZXpf6xsg2msdWG7yyu48=;
 b=EgZLXFdcn8RwqVECPCQBbckWJ8i/I3P7DlU/uzDTnf/3k4NSIvDBURGemZyT3//WpUQVzrUBNUzsuNwv2flghF9Y9zov3G49hVdfpOGINFjpUtAncrtJZ8IuiTKU5RS/n0Iyn0uKpSwSiDrNgklmokxJpudkrbZATMaQWqpxkdYlpaucX6QUm/DoTMWXIZl3vfF4+veSkNEYQq4dbTYVb/Aq6wVj8VkhBWzmHc2OKXOhvnzKp4tfLsSd6sL0l4QHw0LS4UHRT/rAFrTY5iaSQpCqe1z9y8d92pqV1O0EHKBrZuyUFC+6w+eCOxWrS2MA6PWCWZjUC7/QFWmKOrEaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqHDVzd7fkgEmCGou0S3dUJZXpf6xsg2msdWG7yyu48=;
 b=eJ0Ys3bWfjfDQu7R+s4Pbe88VFuDzVoyz6wJgGk9IueH+tdgdHA5PU0rMkLsD2fZRFdtlUWCJPTryNAQtHT7J35tUSNmjG+RjGAtsIGtqcEGQRwymqp/umZ3AnFG97E1EQ43hsJVnCsqEn/e9AlQ3I0HC1S8NmiKIfhLDP8UQgA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB5830.namprd10.prod.outlook.com (2603:10b6:510:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 12:38:02 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 12:38:02 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Topic: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Index: AQHZQsNvcqwDi8CCoUGJ+FCjN2no0K7TCOcAgAAFF4CAAAJ+AIAAAvWAgAAAYIA=
Date: Fri, 17 Feb 2023 12:38:02 +0000
Message-ID: <519CEED5-F0B4-4049-B17F-B1A28CB5E50C@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-2-hare@suse.de>
 <DAF4B451-D056-4309-BDA5-5C20D38A3121@oracle.com>
 <c206b986-0989-6b09-e7a3-24147803ee37@suse.de>
 <5FB819A0-65F0-4DA0-A748-3380D88F97F5@oracle.com>
 <9e7b5dad-0afe-f839-eb13-ce8b4fc1dce8@suse.de>
In-Reply-To: <9e7b5dad-0afe-f839-eb13-ce8b4fc1dce8@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB5830:EE_
x-ms-office365-filtering-correlation-id: e2f26c6f-446e-4458-2812-08db10e3cf30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 npKKr5/ZoHHJIh8lBDuhNzEMxsasVW0PIYMaaO8xQ2l5T6iU9vT2rgNrCA1BnzUZXWUe5eMuyeZOJaVIbCUjm098rYw00DZ+RNmgUe+gtwS2oX6NO6qL7eNgaCljiBMy7DstxTn8VzsHxhcCD26F0pWgKOwMhNTCBXxhYisu6qF/7hi0fIWRy5A29K5VKeOYzHAOASvb1ONYOJICTAO+nFylLyjq9SAuDAju1l2FNZNpOWzvQdOi82xvaROvG+OaQkvGee/6RsM0o70eDJf/R6a3bhVTTO+GwYk4tuul8hWF0upW9bgiQyjUybrTCnyW+nkjYrVgVJw4qE7sHLuCUTVy8fuS3PRxMED5Jgxbk82CcTOCFTzFD0GqzIyNTpOiMMZJdK4n164uGuDRf6hVQjXx3PqB3XjBnKqsUEHdefrtsnN9znPtyNU3G8xJDbl4dsEDI//wHPfR+BYjiEI54dL/DOQiLncjOTmg92m0DkVkmKOl0su8ruVHN3YopIJMxkvlG5HvwrTUlZXTPjc/j+v+idg8ZmC60VzPXa49JA/R4MjHS0B7ytFeE/c9sHIVk5fCvDFBXnn24QWj3owYzFdAdB8ZncK/mLlSkrNmk7QFtMKZjQqDjy2mSgMwV7kIDvbTkKZhxEUIrUCNVPA64ye7EI+TYWehc7gC/R9DwAKlPzPPeTvvieW8zYZaQKNnFr6stkW1BCkaW9yNjZzhY+cX7+gcc+H69lmEtitYXJw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(33656002)(2906002)(66476007)(91956017)(8676002)(66946007)(66446008)(6916009)(8936002)(76116006)(64756008)(4326008)(5660300002)(38070700005)(38100700002)(66556008)(86362001)(122000001)(36756003)(478600001)(71200400001)(6486002)(316002)(6506007)(41300700001)(26005)(2616005)(83380400001)(6512007)(186003)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XVrgP3xAysBOjGZrsA0mJN826AUBc0NyH2ZPpkZSjnlZha3Dcvvkryn4ENkm?=
 =?us-ascii?Q?bFlc/q28WQO0tjlEcpt7v6GWp6db9oGaMghVAxG4/dRhGxE7V49W/vIKDmHU?=
 =?us-ascii?Q?astq+tYlk4mhYOzg/8iG8F8PrkBEq11nd75NJERNggGMh8Y61f/mMP+Ob719?=
 =?us-ascii?Q?XekA6UiML6ek2WpP9YeAq4KiLqc0XtDUduDmMwOfdU/BpOmOFuBkvfz7MIKq?=
 =?us-ascii?Q?M+r0sEmLg6sG0XXfflQDcQFC0vVrgD8CVvVhi0RIqJky9kIZCokGxl/W7p5p?=
 =?us-ascii?Q?rQw/Yt7Bm0Il0WIv4Z21v39Kqw7d7vZ++MHk/8yuRiJw3CJvgxBDTVlRyWra?=
 =?us-ascii?Q?iMy9XeMxHE6FYNKOiEMH6fSxkeXb4Vt/LVFucpnDSph/gGhbyapyv0VMzVA1?=
 =?us-ascii?Q?M+jzHYFH6vYkGrGDU2GTMbLtZ3BSmh7HdKXCXUQw+EvlMurmd+tmfp8lgpKI?=
 =?us-ascii?Q?29ExG3s/9NFECAB1CbwNrTPs8aHQMv3/ikVjekLwfMNAuXd4p21wu1G5RONj?=
 =?us-ascii?Q?qTQrJ58LCTVDny3ErS/xyyt93jx+3iC8NnxLQEmqQbQCUlpmPszoMJCUKgKK?=
 =?us-ascii?Q?n7Eezz4Lox6AfH7zf6oqXBTKMriV7HfK1YAR/5BT/LhmoPqqRWLwJrRXtf3r?=
 =?us-ascii?Q?RtvI+6ZcuP7w0aUR31sk/2WvwMPRo5mRDLwOAgeVSxS4ts3mY9U8DhKvXPw4?=
 =?us-ascii?Q?2a4z59Lps+HVpfDNNYYDhEjhkyZrdfik5k+OP5EpphTA+1m7Ctsptt9eXOhE?=
 =?us-ascii?Q?OJNWpXibDKdwb6yaKTg7K9RBOUNqgJFP6Av5jVCjpKjiqhRH/HfTf3DeSdxd?=
 =?us-ascii?Q?Cjdt/twGaww9NQAjSZ1oRBhNd9v+LjdlEFsaOWP/vF4bKzdTPZGkMsK9Qniz?=
 =?us-ascii?Q?4/wJGue5mpwQgYSk3Qrwt5R6twTXXXHSZYVqEVsd/ylDeLsYgx+bU6Aiqar4?=
 =?us-ascii?Q?oft1X0PMx7hb4JJ6WzHhdUJk7tP0OyQkOHH+NRznGyYYICW4Krd/Q1ymIZ3A?=
 =?us-ascii?Q?Jn5Vt/r6lDcgcJKtAEBNzwqoYLiE2ZTvQ2UjtdCadnwbhH+6PCPHkesLAJRl?=
 =?us-ascii?Q?w36vzGxTS06VsZe1rtaBEY7eiiD+Ob7wJ3Lic5fUjXsnPPWoyn+43tDmEU4M?=
 =?us-ascii?Q?inA9/ucGhGxumSbPgL9hIEzqCVGuQPsuchRD398WmVnrRBeH6ov9281k6F96?=
 =?us-ascii?Q?KxfrmzmAyxC2qSIHR0ZpKsqjMtSWHcYVDo9GlcIcwJ0LGzgFbJrvTEEL5SMj?=
 =?us-ascii?Q?6myLK0F019/UuJ0UznFQ45lU/GgAL/XENdqssDba59aVVR1kK9RGvW2NnQrg?=
 =?us-ascii?Q?Q7peA0Ipvev19ZBRxTKHx4LqrBXOla9nBhkewqYgCMHNYw+UuzxiyU89JJt2?=
 =?us-ascii?Q?s5YmcY86rL5EpvZpVI8Tnbq5ieQvsVZ68waSDJXjdD+AjsbiYzfQg0G+EXqf?=
 =?us-ascii?Q?yiJnmlLP8+drOm8NR8a6cyPfKItSN5F/chYaPx5UrLA/OLJhKKAbYrKg16Sx?=
 =?us-ascii?Q?JhMt8Lj6WZgdktBahNgm6hvRzoIETD7++iaLT8bmvdJsTGtWo9s9mYYTJWU0?=
 =?us-ascii?Q?XDJ4Yl0ZNRYNwEi7RaThXIwMVbfpEemiR+28hXawSxHUMUECOVesYVHpQOpN?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F059B5C8230824ABD3EED20F7C4BF91@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+T2rBwEHjc+0AzGd+jRhRZACOGJ6M8UUlEMPSnA4aigYE//Km1eMvqUZEscsruY3W5agBaLZHiUC9YKQMA5xnQ0W81S+ngqB99Km/pkbB4wm9XnvRDnJa+WZMHHYj5RA7AChZOyoS+yvIGtAYSWhBGAUwjeQTs/2hKhgSWKoTbCrM7Zbkm3SsBdUrgHhC1kVC2Z3ru3sTAMakApbOyaQFw1ZvSEV6ddehStJNMdNtCOuHyfCGq8v6AnGWP8vX1EjMVECQ+Vppnw0rS60UwGE1ucGe8GVpdAFu7tQn34Wgq8vTEXCytqXGOXfQYJonoJMo1jzli872A68aXpmisQvtVK/FScP1YKI8KpsHXE/V/BwIqLH84DsHorqP0mM7YDpHuvW970ndXQFDumpW1FqjhD2S18ZLlruKqMZ//s3UbyXjBd/BB3/qVpHro0ja1i35WE8wyVU/EAmY4G4aKracEbLT8nGsSAb27wooiwEyE+1oO/kAxozafypdFYMKUZY2BE6zs5/Ks/wJDmi8efgNqX18H6mlmgD2sz5sImVbDyb1WtMeUGzPCpYWZDZK3M1ZLSVti4vZpodcIXrFal+Ir8CuIvZI1TENEz/PvNh94rwb0amY4Kdn4QO5i8NyHQHDG77aTDbXWxY2i/LrDqulxIA3W6cdSGB7Ovdp1QXcWF3d5R/jfh5mEpoVUVrioWgM1HGN73g4VKiBlQvape1dOp0D6pQojP040bcgy8LAx09pqjnAmDPpi6zN2Wq1G9c47MOkZlD7dwYkojFyEG91PX9ZwqlsV/HgIMmthLyApo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f26c6f-446e-4458-2812-08db10e3cf30
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:38:02.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mngwEzwixfeliPbH83cNgnDziQAFWIt6NJUknRUlkz08vNWxWjmoZrDPLh6IUAKcxGUYg+th8cez0P6CQEbOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170114
X-Proofpoint-GUID: FeowLFQ_gPqjuHJdFovKPP17xphXRVka
X-Proofpoint-ORIG-GUID: FeowLFQ_gPqjuHJdFovKPP17xphXRVka



> On Feb 17, 2023, at 7:36 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/17/23 13:26, Chuck Lever III wrote:
>>> On Feb 17, 2023, at 7:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> On 2/17/23 12:58, Chuck Lever III wrote:
>>>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>>=20
>>>>> Add a 'timeout' netlink attribute to the 'request' netlink
>>>>> message to allow the kernel to communicate an internal timeout
>>>>> to userspace.
>>>> Can you describe the use caae?
>>>> I'm not clear on why we need to parametrize the handshake
>>>> timeout. Why would it need to be changed? Why would, say,
>>>> a PSK handshake need a different timeout than x.509? And,
>>>> why doesn't a timeout wait in the API consumer work just
>>>> as well?
>>>> Last we left this, you were using the timeout to work
>>>> around some socket reference counting issues. I think we
>>>> need to address those first.
>>> The problem is that we have have a timeout on the kernel side, and anot=
her timeout on the userland side.
>>> This is primarily an issue for the client, as the kernel code
>>> needs to continue _eventually_, otherwise the connection will
>>> stall.
>>> So we do need a timeout for the client to ensure forward progress.
>>> Hence the kernel client needs a timeout to eventually declare the hands=
hake
>>> non-functional and either abort or retry without TLS.
>>>=20
>>> But as the kernel now has a timeout, that would need to be transported
>>> to userland to tell the application to stop trying after a certain time=
.
>>> Which is what this parameter does.
>>>=20
>>> The alternative would be to kill the application directly from the kern=
el
>>> (or send some other signal), but that's really nasty and then we would =
need
>>> to worry about cleanup effects. Hence I'd rather not.
>> Actually IMO this is a cleaner overall approach. The cleanup
>> here would be the same as if the handshake agent crashed, and
>> that needs to work properly. It also needs to work if the
>> user driving the application handshake request is signaled
>> (system shutting down, user hit ^C, etc).
>=20
> True.
>=20
>>> This approach has the benefit that the kernel can wait slightly longer
>>> than the timeout sent to userspace (in my code I've added two seconds),
>>> giving userspace enough time to send a completion message to the kernel=
.
>>> With that we can be sure that userspace has given up control of the soc=
ket,
>>> and we remain the sole owner.
>>> Without such a message it's always tricky to figure out _who_ has contr=
ol
>>> over the socket, leading to all sorts of reference counting issues.
>> It's not difficult. Kill the handshake agent, and that closes
>> the user space fd. The kernel now has control of the socket.
> Hmm. Okay, if you say so ... let's see what happens if I do that.
> Timeouts are easy to trigger with my setup :-)

I'm pretty sure this won't work well with v4.

--
Chuck Lever



