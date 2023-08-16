Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087553D60
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:01:41 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GH4H6o010823
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=aJhqqW6dM8q3WhzYGaM2LRTsqoLYDVcfi13suqft2Ec=;
 b=w78KI7WLXvY+OxiS+iNnISrFi1iIJKT6Wc9uB155zq7bJ8FDIOwm57NKjW1KOOgfg0Eu
 a5Apz6QY60o5P7YD5i8gLLkiCJw3TyAU2ckfnZc3gAIS2wC4FGJSUMcXZktJuUueCy4p
 OKhDKdDgm78mxCXJ2bxJFSu1kcmeQ22IR9PahjXmj8gC5LiHjc14s4L1059bvr1OctVJ
 96NzgcnJOfXK+Hw9sod7NWEu7RYhJ6YE02JAziedji284D1+f9+xNm3GinWfjoKhK+b1
 575Bpw5FwhsC1JKtplFyk3IRAtS/j0f5cgjhjh4AMw7mV21bk9UsM7vuNS9Pc1YV7R4r Lg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3se61c7rgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:01:35 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37GIIau7019766
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:01:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sey3x5k4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Aug 2023 19:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1AiPl8FoEjP0Znli9rfQYCCQwVpp2bjspq9ZGTdUWKcAnhNIkQhMsCMQlQAacwA7UUF9dIVE1BiNnEUlpI8OA5fyayGdZUyy/JekaNsWnzk+kGUOb1fAvjuiRJQD99rpF0OxXABijtw4XNG70GARU1h7GmOaU4n9Yn5S9v4kKJLUcodrdXtIZ2gGCynY81ePiZBDB6KWo1z0sqRJb9Thz7bKr4evcMn6ZGzkAgIc+LHagPtuNLexmM9aKXuilVkh8oCMDb2kv9t5Uvdx6JJcgHnhkswsptwt7iA5FcUPnvBkvjA6rAlkuihoD9pZidg1C4IU5rtcsPOC2R6o19e5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJhqqW6dM8q3WhzYGaM2LRTsqoLYDVcfi13suqft2Ec=;
 b=gVewjNbGN2pk1Wkgzr0io4Jw6we0/nXDOQgC/d2dI8posth0diSFI0QpPsKV8ZI5i0/bbJvibwySU9xZDEaACMKEj6+1x1DaSfJSit1BSrxbHqDl8oNrxJ7zKyenYmnZniwFpjUCE1M6q38wyHBZlbZDk97tlF6njeCiqrxht+c6DMfbo/h1RuoTEMYM9gtqlFWnD96dBT/ZCaD2eL5MShPbjXLr/Edtr2ZPh9nZd7I1t2vTZyEDkxujfgdvPapkIL12uRzlS3r+fMHVO+8aJowiU6lgyRKhDVgCtK78AjwhS/H+qth48PM+T9s9uq30IWCfGpUp83d0PbT+tRi0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJhqqW6dM8q3WhzYGaM2LRTsqoLYDVcfi13suqft2Ec=;
 b=HSpjU8bqqK5f6Jisakpanh4iRWT0fxGGQguvLAfV9shnQPLzRLG8ajoTQ/iHZtBdg+EFsHdXrAiEyvTfqpr/vtC4twC/Z3nX5UiTz2AmPlIFXIZPHxM9zX1kE7qXavCgSZVmEs+bcF7IcF/Zeci7OHwnKKD139M8Tn54WgOKGW4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SN7PR10MB6522.namprd10.prod.outlook.com (2603:10b6:806:2a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 19:01:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 19:01:32 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: mount-by-IP-address with TLS
Thread-Topic: mount-by-IP-address with TLS
Thread-Index: AQHZ0HQSqJCUJBXE6EC+cGMAHsLNlQ==
Date: Wed, 16 Aug 2023 19:01:32 +0000
Message-ID: <9674EE10-AA24-4868-A2AF-2785C10A7BD3@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SN7PR10MB6522:EE_
x-ms-office365-filtering-correlation-id: 2bd59974-2867-491e-ca43-08db9e8b34ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UgzGdaCLzg6nNdyhhKDfGwmRHSJPz+toLS3GKkRzs8yPR2mUkaHeeQWFQ9jvwKj4b76njhZtGdC0RDx0fU8q7AemdSArSfe8Iymae5uiWAZh7TRYkvOPBCxKRmAG4rCxh4wtMFB+pPEYoCy+X2nJ0pmzhXD/mEXPFaxdOCj3Jw31lrrhJZ1Fvhcoii0LdpRjFpcw+Jy9uH9XrsoFxvOlqrol+39EnhmNXQve7jr8Dvon6HnqfauT6WE8GeeixDmfp2keaVKBc5ZHwxkJj28kQql2LSC1tIIJslQ1t3Ceefnok10aMNC5t2nL5vw/ngMSjkeqHbcY+b1nxnPF3+7182KPXadZw90e1NMLCayE/0P6d7M7iCeR0xYb73rM+IqIUHZDyupnorEzlM8D9CKetXSWI2147yve2zqdAmRGYuGXxMBDpTlzRLgfOkDsU7Hb7I7W9/IV79Trlf9AgnlgYFkmuugwrc+4l+JByzy2FTsy4GsEfUBS8EfxGLoOHmV2AltutVqKsaa2BoujsQOwHAeJYc4KNzP5E/WKmc6P4E/zbyRGb7PtbhYRVDOtqrT9VhKXTwvd/4vzEbc9asQKKpQT/nZg/sOekco9btPIBsZ3UY0MvMQgViPzIBlMKfu0xdgYfDFtdpz+NvTBSXNk8g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(316002)(76116006)(6916009)(66946007)(91956017)(66556008)(66476007)(64756008)(66446008)(122000001)(966005)(5660300002)(41300700001)(38100700002)(38070700005)(8676002)(8936002)(66899024)(2906002)(4744005)(83380400001)(26005)(478600001)(86362001)(6512007)(33656002)(6506007)(36756003)(71200400001)(2616005)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gSnKcL+osQJk/kZ3XoRYjPQu/1LACx8w0kof6ruidpWcHRej2ZwDRzYCbtWD?=
 =?us-ascii?Q?2KrcRDXjNnWQkzx7fPomouHfHv+fFwKT1qlKsqv8Lsz+DA2cfYwPzvxGK4/A?=
 =?us-ascii?Q?okh6CpSD5RT0aMHFkmMCTIfwjnfYHPDrUtpM32U+8cZ7gm5ppK9lCuXCy0tu?=
 =?us-ascii?Q?VSyJVdx8CQUe8FnHs5kbhPLGJAZrR39CXnTQvi8HqdVGwRGT19gL3yMzjE5r?=
 =?us-ascii?Q?OJOQPgG7H5p3CzHzEWFVDH0qamk8BZmupo7D2sf8IWZbFQwB3/iIZTT5g/6m?=
 =?us-ascii?Q?Y+IwIuCvDTD9VULVZ9ZiVf820BMFnWhdGMeoXsGaKi+zvaGCZiKQElYfImaP?=
 =?us-ascii?Q?fN2ErOw7FbJP19+O86VrVpAtvm2XUfbMNkKqIX9ipGdgC56v+lycTMnmrNoa?=
 =?us-ascii?Q?35wdKyJhcvRMJwRk5tvQ7CqneW80cZld68L4ISv8E3Gu7+JwNBF+MAtxrCj5?=
 =?us-ascii?Q?s/N5el3IDTfwAAuDi/NYYbw6irAAi3r+qfTWaPjIfqZicgF+14RyIW37/aH8?=
 =?us-ascii?Q?UsMNIKoeepo9WVTcexley9oJLpDk7Ph4FvBb0u23gXMD4QWVKEMp+EzzkC0u?=
 =?us-ascii?Q?l6e9rVz86fIXeNbHmigyspcOQ7mJlPXalk6Qfw8w2RubZvdVoCRjtHe7yTJk?=
 =?us-ascii?Q?YdANzS8XRi/R/Q6i73daQHZPpE89NUiwitXgrV8vcTAC/gKcxauu+V82FxhY?=
 =?us-ascii?Q?MsMHCtrvloP4enrDMd1nmHTrA+jBN9zyr6jwuMh1XrMHmPh0XJD1wWAjrIUb?=
 =?us-ascii?Q?rgbnqmEWsyPMG9hRXF2rN/O8gBFa8fC8yYH7HpbxcWewA2E0km6fi25lvxOJ?=
 =?us-ascii?Q?IJjE6ZDN0xYycWnQiq7xNLBCRtv/uoZ8PjXdzWY4143iasQ27Q6l4oNRmqXI?=
 =?us-ascii?Q?OmRdSXEDH9Mqg+F+q4Kdf7j5Zi9MXlhTa4hssFq+HSIvF5orA8ShYbvk0W0B?=
 =?us-ascii?Q?3VwufJYwmK+7Kav7OzkHHHHEKB+l7Hgmr/Z79WxXnCS7D8xbMHevVBJygrFb?=
 =?us-ascii?Q?rURrs8O/i1fS+WvMaNvBAEj9Pnib0zGMpVz2c2OuRdCsbEMmGnO/gFiJml7l?=
 =?us-ascii?Q?ogDMZ9qGE1UJ724PvL4vo8+tN1/AfwpyPmv1P0JrXs/rikzWj0YzBQjEVofJ?=
 =?us-ascii?Q?0KOew6PJ+kI3xpeByfFTYd8WtU2jFmDbSpP6qsw8QC4PiqAwWEa/5RitOiGO?=
 =?us-ascii?Q?Iy0k4bKzSNPojdHI2pg44DjhBdYzmMZVlipxqDbPFGC+ZDQyH2k4RrNTMiKB?=
 =?us-ascii?Q?vp+Jr+gv/zcPCcRHxeZIginbmlxnpqZa0+EfzFfLHp0W/BMvUTsJeydbNevn?=
 =?us-ascii?Q?F/Vn4R19nvi14aYGIzn5OtspGvjr9aIBUTa5iP4n5t8Kx9aokIbwHRefTFIx?=
 =?us-ascii?Q?URjwA4UtF698WiAUIBJ9ewvUhOOMJIcB+hMDbpWcbiC6YEUNR+2JcJh/L9Pl?=
 =?us-ascii?Q?68UBqp191rrXb45OhFRz0dykR7QyUWRnweb4MSD03jOmXZIZ/SAmhO8BO9T2?=
 =?us-ascii?Q?CrKTrk7eSPJ+7Ra1p9XCFmz5WiBIhCgQ4HmwyGpx5lOW6hnYcbIdYU+WPphR?=
 =?us-ascii?Q?fxGLIgqNItdL3En7qkreB237bMIO3K/TMwXgc2kveEN+NfvZ4kXp3aIqu210?=
 =?us-ascii?Q?mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <776E78EADB33FF4FB6E98A64A03D2780@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jFSLmoSJIRTirdS3rBoAkMofh5x5i6HqK3CCxD48x/p42RLpPiJgyRXzO+XJYklJMNHaZDiX1ESKyYnZhVYHQWf5tfnOa8G1YSaN0f43i1O6bwRg1GbD9TBcIC59YW/5xH+SX7T2B9CZVCWX3yDdofNHrxKNzvWGKiUk0vSOP/BMl3PVpEE7kE7uI+poiLcoOOoZ+eSoCHLEBYbYzIKebUdFySNAJu6HF8HSGgYEMORBBfIs2a7m1sbgresxmjcFzrfOgTVfFQ60DRHao8bRQF1yTtdqxqJd2tf8rL1Iej9NAZ8vEQOK1VKbNhRXqDmWivS/nNi7/W6PGxBcDKCMUxZu6B7I2B0ZcpZ/GUZCT3K0zOfQ9INdxqHirvTpR4njU2Ef6AelWz5sBIXNOwRVVtUcB44ENj7H7eV4EwsASV/Yymz4jIBTbpqvFevfd9xY3KxqaCo/3nI11eHKLonUnyvweiJKC3Knrzm5XAxYWGsI+B/V9fJ2IUdq+dJOXkwGcnJOEBk7rhTRooVsWwahb2Ca3851yxqx7uhwmRW9C6ZS4f3isY7PLE4qs48P1B9gLH7mat5kbPSszPWAnITVEDyT/lr9niR1a0vQYHKugC+PD/xrBlRGElW5mWcTKlE7HSTs9rVzRGXXcLgvvZ2dWjPUbcJAkSM94iruS42S0klIs23tnq4UsQaV8+rq/uGI64txaVr5+Q62U8dtDaZ2Rdskb2W+nppKaRoLZc7IuQK+h08xMI/7Sdv8LvNywXd8FHP6fRbeknYq9eaztnqgHg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd59974-2867-491e-ca43-08db9e8b34ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 19:01:32.3945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMD4TAKvidCrV9YgRSr7G0GzIGeCpODpREunifDlEvRxsvgFLOjzws/GHdlZK/oKu7/Vgne0LbNnqA33q8R8kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6522
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_18,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160167
X-Proofpoint-GUID: x8SJAO3nDpOVPL9TJdICaPhj8MdNW42w
X-Proofpoint-ORIG-GUID: x8SJAO3nDpOVPL9TJdICaPhj8MdNW42w

Ben Hutchings raised a concern about using reverse DNS to deal with
mount-by-IP-address:

https://github.com/oracle/ktls-utils/issues/22

My security expert agrees that the reverse DNS query here is a problem.

The proposed solution is to forbid TLS mounts where the peername (passed
from mount.nfs) does not match the server's certificate, either its
SubjectName or SubjectAltName. One of those I believe is permitted to
contain an IP address.

Will this handle pNFS layouts and fs_locations properly?


--
Chuck Lever


