Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7F2AB3B
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Oct 2023 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FClfIorW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WZoCgFqw"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396Cc1SS010257
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 6 Oct 2023 17:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=9jku/I+YmQTppqThZQbO39vx/fLOxHtMsZGBeiNjekE=;
 b=FClfIorWzKsU8IH3IpPz5pHe+7qymy2PVgULDkk20ha2JCXnuJ03qqWFFrROfWneYNq2
 /j6+Y5T/8EPEHWyIKelhoA4L29uh1T7w5MRpSwLdD9/65GA5ZiNLwA3a+BD4JeMtAMlZ
 15k2n70RgoTG5kzEG8/ylubKaf/yd39sypUa6aJVQ1KIenHCGrMb6QdIQatdbJY1Jn9w
 a+Dl/cW1uMw58/Bm2Xm6ItEqxBaj7frD7cXLKu10nbAvn3N6YoMXnE2/H/8uzsdnK03R
 zXVisN0DHEApdvBkcAcxNtE6VJAfONPPrBkiAEfzK2KJoX9V6eArJBvRyfiuLc3ei+zm uw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3teakcme9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 06 Oct 2023 17:33:55 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 396HVKHl033745
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 6 Oct 2023 17:33:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tea4b7cgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 06 Oct 2023 17:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrifaDJQjexaacwkmKVr++PvvcIEjGrnGiorNtzRzpNKwCPpiqykNmOuGGDbJNVyvOFXHW84A5NeICwcXWlmrdV3cq5j3FdyzfEQFhtf/cWSw2hZpnBbYgyBiug4+s8B5C2iLsI5NAZtRcGPZIzMy8+GDk/QwOYRmNaRaeUyEYAiIeQ0T9ISDfbOIpJMpbIor3mkn7/VZEWoWOyAMCGOokaZVHhYZMdCl0sm71xO2hXDNR/Fe97bh10sC5Z4qBjRT8sWsPgOhfZ+1zMTWT09hf6KA+GhvIMNRv5L19ZDPzLAX0IsjqllrHgNvoaQLk9rfhgZHKmV6W1/ct3YwpTuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jku/I+YmQTppqThZQbO39vx/fLOxHtMsZGBeiNjekE=;
 b=fdla1UD1VDj7KI85T2kcPXGoFrxraujb+UWUpUa3GrnF36aizqOR/j9YfvzwxxDpS5xoDm1SK0adrCISQkK+tenL1Coo1f96wGPnykZmOBGheCyaYeiKhxQ9PtJmR12qvFFqwRwHowPBxBSP4pFLyCfBODPGdrl6wGlHmos3RLSkot237dunfe8U0tCa3SLAfHtGcU+fM4Q6heOpEk3rqRXs20XfEBOwx1CJ/lFt6t5KMiUFG1TKyQ7wkslXvURi5r9Md1bcUqk02hak9D+oCfqHwwvJslQTz8dnMIUgV6ae0W6ak1jmCTlqhe7HJVKQRatEb8Zst7+NWyT4y4XohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jku/I+YmQTppqThZQbO39vx/fLOxHtMsZGBeiNjekE=;
 b=WZoCgFqwt5KBDgQCUK9EFY2n+EOoKWdBspK+RPfiaPObTuhyjJ5kr6kbAQpv09FtjnuNmgAVoqqGP2JJccHpxwTpCQgT+w2JLrqJP6B2dGKu3Gt2GAfyVdQ2yX7/QDVid49W6LAn0MTGHqBQcxE4y0kYj/P2P5A1t68DcQzTw2A=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH8PR10MB6410.namprd10.prod.outlook.com (2603:10b6:510:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 6 Oct
 2023 17:33:53 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::cf32:e9b3:e1e0:9641]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::cf32:e9b3:e1e0:9641%4]) with mapi id 15.20.6838.040; Fri, 6 Oct 2023
 17:33:53 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: NVMe standards for TLS
Thread-Topic: NVMe standards for TLS
Thread-Index: AQHZ+HtG1VysyY88ukGF8ayl4V6ZMg==
Date: Fri, 6 Oct 2023 17:33:52 +0000
Message-ID: <6CC80C5D-CB9F-412D-BF93-B1F5C391707A@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH8PR10MB6410:EE_
x-ms-office365-filtering-correlation-id: 4aff7673-fa04-46f0-5116-08dbc69268db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U9e8nGK2PjnjZZYwHAf0NcykigZobu//nTTBFhcDI/dldrp9+4bW17CJ523J8zb1DAdHx6aE82Bna6huCbKrTuu4x7wIV59/G4cMPjLldzHG+6mEp+ws3KfDf+yneIkG+OvN+Cp/Suofn68L34hJCNwR5afKjj0NlR1OPaVgyNEt/RwY2u3FCTeHwG92UDzIjSQHCZ5uCdlMckS6Wy3F33plgbzN3tL7NuFXe8QYQ5vIRPug9xESrLhPbB89h4PdRrIUSpNTvKq74ZDaA2fBBM+zqoaDVrkhZzSDjxqFCXOhK5+xk9xDor6ocbzrJ+CBg1zsZR1/b0GmuTNBxGvC99DPBNzx2is1aLJC8MXMZD8qJdOSyEJS6JBfoeewIteb47+tbzPGS1+72WW3hWAp/eloj6bCQxY2mOhxdQcBU6/00B3+/+8+adD/rx8Sth6Vy4F8YHhbufsxuJefoBRmGdfU4wD0RJY3wRR/dwrrweItbMTmFCYZDTNyv0H8Y4jq2KdQmxVxiDdYPFTI0VpNWvsnie4v3tZ9vuvci+hKmVIoJ6wCW5X5uoJpyi2n5diBoaQnhGVxWb50BlXOkUSLhzKzP3fFu1Irtcghc15Kf/RD6m7U4sHvMx/B1CXTumb8aULJCAw9eS7jocoCit7N3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(64756008)(5660300002)(6916009)(66476007)(3480700007)(41300700001)(91956017)(8676002)(6506007)(66556008)(478600001)(8936002)(6512007)(2616005)(66446008)(26005)(316002)(122000001)(76116006)(66946007)(558084003)(38070700005)(36756003)(33656002)(86362001)(38100700002)(6486002)(71200400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xNJnZNOwMZ8YxSVsLsUrFsjNujqEdVT5jIoAh2UINO84J/VJod5ENSPa0Y9N?=
 =?us-ascii?Q?To6SBuAPE9muv83fhAFdAcDzWJNL/wC2alS4bA84uyDNQPC2sEaQaERfi+5X?=
 =?us-ascii?Q?DObjnfulnTYCNa9vJazDNO97l5caLN7yGgdfd7sYAtvnBZrcDHHiGrl+cuSZ?=
 =?us-ascii?Q?JKIn4MNQPMaAK2temJHpX3tXJq5KvxJz1U8H1CQ/UQNnKxxNsFZ+Bo/lBkkN?=
 =?us-ascii?Q?X94k+QCWOZWVHP7cGluLMu+apbv7EbJSjD31mHooN8xod3Rm1MiIrkcjcxiu?=
 =?us-ascii?Q?CUquR3/pKwUJJeRBf6q/2/6pUvkaHCDwA6t/2BFDQKo4VjXYQ1U0h8v37dl7?=
 =?us-ascii?Q?GJuA3JdWzU4XBwO8314BkDWHpNHSWvFSCPXEiItCvWGUlpj+0CEolpSmW0Zg?=
 =?us-ascii?Q?QUVMlehmwoF114t1fBGofHk2DJgVSXTDW3T7HJu+DBxoLCKPge5zqC3XiJfB?=
 =?us-ascii?Q?mxfRP5bYBNXdmtnUU9hl8bGo20xwjamCVnUk40fAoxXThtnvDkH+EZu5EmvS?=
 =?us-ascii?Q?EEaeelIRf0HProU7lGrLgCe9e8FtgXpZKAP1H8665oc5oRCPJoG0viFD1/6P?=
 =?us-ascii?Q?h27BHKjNRASq7TOMDy4JVolJ4fCyZYScINferBbExC6qrqfm4OAr3qZKc3yX?=
 =?us-ascii?Q?+pShzXWMQeFr6l/ZpQ2hjefbKXBz/PjR4V+GBTKb+jSm/aRR+30j8NTmQi+m?=
 =?us-ascii?Q?AzmxRdnrwJETVL5hJT8hR8Jz0Kv101L4WzOD4CJ2MZUsq7c28VjupFnw6M9m?=
 =?us-ascii?Q?QKhdC5R5VTBa5kNZITxi2SP2KBTw37vjhJzmfSnBbr0qOUkYEHl69LAhioXu?=
 =?us-ascii?Q?eZiLbYh2cNmgZuVCmHWdCY2/E+rBkZ8yNiXT/YdOxv824d9+K5E+MjRRhEza?=
 =?us-ascii?Q?MtEDCcDvi5H1OfkARDNnbBOndzUnv9TTdI/kefFIxpwFfemIynDtlECMU3vV?=
 =?us-ascii?Q?Ny/CqhlaaL0ED4V+Gb1Azc+BSFI/eTtHWUDtafTTXVonIHoh68FJPZZ87lcK?=
 =?us-ascii?Q?9HWqrtWxHD58m3r/0b5xUTAgfILsjbV0NZLePGQirANPkjabki3+3uamv7Wz?=
 =?us-ascii?Q?xXPVMryawUSzQdTKBeyqNPHAJ8tN7VCSB8IFTUpOchaBbSAhD8avmqXJpOre?=
 =?us-ascii?Q?/ThCWbBYQb0PhofhBcNLZRjA28yf1j7pJrlP5iHWsrxnispOD5YppJSHvF1V?=
 =?us-ascii?Q?JKYYpxCE1bIapHuhhy2tB3m6hHPUUv8RjimO+TNMevntt/4stEuMAD8Z6BSC?=
 =?us-ascii?Q?VvhddoI0WGwkBK1GCI5v2WaZbZ7wfwgiPq3U2ktgd0cHPgA7aCVik2cetdi5?=
 =?us-ascii?Q?Oj4mXV0Q8bzq4wwCmP2Dk4l2ADTxwldqh+l3axEVAgWLT+DxqvVyBV72DrHM?=
 =?us-ascii?Q?lpEJ7ejUIy5UgTjeAlRggvmSF9FPm8FOtbRBzKDvFVYXjyV2sQ4EqVfF5bMH?=
 =?us-ascii?Q?13s38Vmf1bQThyCHxbKcoodL6U7OTaa+cQZ9xswbMV1NJi3TwpYza9yT0paA?=
 =?us-ascii?Q?zOWe07/ozEnp1Ppfso3GQ+L18LB6sMn7PfCUHdHuYTSAdN37HU7ZH/WJaXwU?=
 =?us-ascii?Q?q1UijIDY2mJ0npc1ZIIBTMoAl40GLWIS4J0jrCf3J6mF55Q89OPSsfA++LTM?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F10762720502A44A4AAD11460F2617E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	85/P/buit2BAJbPtir0Jy40CSl041HDWGz/fDqDbBM0qfejZLFBKLRdSuzy3rt0lsi7E+sGC5NygtNhL9KRZi42txv58nD9Vsxy2Rui2qZljCUUEwsSQD/oEUJ4HYNdeYfc/f0R800Ww+FZMWkTd34Wc4eKViuN5OrJ+iIudHmS1mRpW4Z6KoVOKwzV8MqrABj8WJH+JofpMyoB/hn2owZ6otlw5Py1O2YDDm+RIt/rsZrgu8DhpQn6c52bud2IpCn9Lh3VxiBxIgzJ1XpW5ex3fdariMHBgOhN/36WmSlf20uaSP7SigY9v4CTYx5myNZkpD6ne2dV8E7bPTAjmlnl4C7kRkk4s28lHeb3ygBBZAsFzjDhmWbIV+gCqwoSYhLuxxN5nNedPN6YA98xac0VkSxpc8UeOa6sHsM+Vvyg+NL6+NEgn4Doat4K1mAR0awYa/bDovfgkPxB2oyea58ci2o01515HMtOh3cvYscKibPERi92WazxZuco1mjZ/4AicE090ZOs7FwogGkll1tNi+CuaFNZ9QG5l4GCPTV7b6jF7fHt+zJlPkmArjoK0p4Ts1ySJv7yHT5jVOLWcpIZ24xAruF3hkxn4gqhnPjIBVMFdjHpio/K2IHBXK8w/eGYZDZxJNnoCYtv/e1hJiltYPn6cLrn5kxwCaZgDbb2dIQd33ZJKLoe/YtAAMBQX3IJKaDeCuvAUbWnpjRCiebx5Qoqw7uNgGhZ9uQ5veGeKUQ/dx87RkT3WwEOM8JY8RiKJohEDe2b7TzB8GcCIkA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aff7673-fa04-46f0-5116-08dbc69268db
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:33:52.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2nHmQh0KYrKKwN+WmDJIm+b1jihwI3hy5z1swu67cQfsWLJ/AaJwH4M6FUISBq3vwYV2rdz+uSr2Es+hqmmkCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6410
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=522
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060131
X-Proofpoint-GUID: ridjzPCJLm7VaDKIwmknrwfVCtOrSGij
X-Proofpoint-ORIG-GUID: ridjzPCJLm7VaDKIwmknrwfVCtOrSGij

Hi-

I'm finishing up some slides for NetDev 0x17 describing the in-kernel
TLS handshake facility. For use cases, I have listed RPC-with-TLS,
QUICv1, and NVMe. Does someone have a reference to the NVMe
specification for using TLS that I can cite?


--
Chuck Lever


