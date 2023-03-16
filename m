Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097633CC
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 13:35:31 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GCxGj5020306;
	Thu, 16 Mar 2023 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=nuWH3Ys5DIqu7dyjEwppAoZWLExZGYclLIGiEMIQG7U=;
 b=hWtb/HNFK8s/LcWi74qLV5FiqqqCn5z6dJMi9cRux2lBdgxEs3M3YzgQ17WvVm5Qa/zj
 dzXl5yS2t+V1EEItprxOPGrqZP6mW/vNsKiEbPO+yTDPBirSBYaUHEXNOlzf/oTCG/h0
 E2orY8GB824gQALK/2XG74fOrXDH6UXwkBg5uBsUHhxnS31zXtkWtxYFXc7EYHG+wqLE
 POpC8lxRMlq5ajestP2dsYgveXRtwdv5wkDUU3Zq2oakXShM5v19DS6V6cjSl3eMmt8a
 lDleRRbqpsMXsd7FRWxyrpyCvMjNOHdLJpMp3jLNsgkQX8oEg9rh/s3dD7dG28KKrIDS 0g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pbs2914h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 13:35:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32GCPeSY029810;
	Thu, 16 Mar 2023 13:35:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pbqq594wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 13:35:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgX8wHPix1y1PTSLhQmQpp+3gxuS2UkmsGoYtrVCnFeHu4lYYTflruOkFTzwm9lMgyPOc3loJA75OWRpNqJ40hnbwrpBUQPHdGAoxH6h2zwi03YTL29tXk6ygX6+wO0aZEpJRyu8L8XaqOECH3WouaAX4j76259Anv0XYMoUuCD7DZ7NmfLuQjuwR5g2cBdy4gyPP+ceH6E7D6cWI3y5/3l8mXoANB29GHa4XooxLY4BGY8nx5ypqKVFK3aRJkncJLPcBRdmhgEEnXdx31nWOvA8CITbJMLBnau0GmHNgSTUXTP9G5KVYSkxtsddC98uBJV3xKHRdLE6FbzNNUPXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuWH3Ys5DIqu7dyjEwppAoZWLExZGYclLIGiEMIQG7U=;
 b=MJV+L7u8tt5ROyVGVZde31G0cj3kGTXRd0p7dt+K7nggf3k9wrheHUcG6uj75VBaO9Cmm8ZuArT19yb9qMwyDlek14SBRiRaI9SPHabgC6qILdWVhrukwA05i+JiU/B6vzlc0cCbdxsGksNS32goXsNscOprkNbILo34b8DFbUdAZNeknaHJNeFyu6+Jz0VMnTTq3S+JIwTU9LR6l2ORceueTA2tRj0u9Vx5dYcRunQmDchluqh5Jmt67eUgKVRn0C4ytMw/DcEkBTzHulRRy4ZfcrFhdko/4OMvDxEyHrN+Wo1g42mGzTaKVRJbqYB8LVbVrJ7KSzGCTRtu80zvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuWH3Ys5DIqu7dyjEwppAoZWLExZGYclLIGiEMIQG7U=;
 b=0LB+Q7GRq2dYG2Yt5fTi5611rLONRww2hzluSJXu7qmqBwptZ0e1aYhTmh2Hc1ppJioOCLKylqBoBM4szKWuEbxma1hs9ILm4re05PY1WvXnJUSc+TWjHzLQuhN/tKlZDyTNlNOzyLbObUksgiBCpyeTT/EJDfPxFW4P2Ffh+Wg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4306.namprd10.prod.outlook.com (2603:10b6:a03:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 13:35:20 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:35:20 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: sk_data_ready callback restore
Thread-Topic: sk_data_ready callback restore
Thread-Index: AQHZV/oxTU7X/WpZQ0aBeXQVYvkZ+a79aFiA
Date: Thu, 16 Mar 2023 13:35:20 +0000
Message-ID: <21D9A8DF-9A7D-4DC9-98A8-D50A06A548EF@oracle.com>
References: <7464fd83-7cfa-d075-71a4-6ff6ed73529d@suse.de>
In-Reply-To: <7464fd83-7cfa-d075-71a4-6ff6ed73529d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BY5PR10MB4306:EE_
x-ms-office365-filtering-correlation-id: 6d42d389-815a-4d7e-7226-08db2623498c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +qpwN+5YksH4J3+5W2zObfJ5hPVcOuteMjIYoFzlcdz8cOPQecPFgKsGCuq1uELFEn3VtK0ZxfLnrU25Iskgi5QSDGpJeYipSVglcj7X4qiwbO6kWvwWAtwjJlSHEV8bFpv9RJujWAUVooqqle7G7kbJo4tZVjp6XJ/js9R8jAXmXuHEYHQEcf82/dRFBQdx9yer6Cn4qxjq7nJztk+iHdINr4phkLr4xHM20R1I2a/qxIrkd6RLzqHMOisqgET3fSoZhMfXIdqyJ23CpRFdSloY39nUHBk+MAIyOyreGzvaT3fEC2LZWF6txTFtPDDzIwHl3O5LudTZdYOqjEbq8vGtsVF4U73VA42jm/RTBL5IuHvvjVIww8k6Zo+tASpdENHV4QlLohrWROcr98IAUW0nhCyrLHRPclhS/DKZcT2U7UnOIfzb5ypolYFjGttQA32k9UWlwuUjhSO43L8Go41K2mfnF3Qoh3ZoHsKfIRJtU1bfBlZsl9zfPX6TxQNLc5UGSXMddpgkQ80afISA02RUe0XlZS2JVy8OzBMQt/xc/qFM7O9EYp5Sn45jRIM5TjHre7WxXLWLHQvmJR6kjvMj3nhn5saTjDI0vhJhek2D94NQTgQ//CnHUeCazD1nUpaZUgk1vk8AAmmNPmaOly93TNFw/Zi4TLNweVNHXUEBZo/Kc9ekNCATDaAkoyctnsMlRd6PfZVHOyx6+G1NMh7Fe2xxIkEouwx34PvMOBc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(5660300002)(7116003)(8936002)(6916009)(4326008)(41300700001)(33656002)(86362001)(36756003)(38070700005)(122000001)(38100700002)(2906002)(2616005)(186003)(71200400001)(83380400001)(478600001)(6506007)(6512007)(26005)(6486002)(966005)(53546011)(8676002)(316002)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?e5Qo1p2UKg9eUMeVUtWI01+Jpv8gDmSKWArKO3E8Vj02T9nBZVxkMoVzLzKC?=
 =?us-ascii?Q?yDNhVxu3w1BkybgWB7wObXN7Cl0PzDlXsimfiOS2kLtzNO2v61Er4ovQFgRD?=
 =?us-ascii?Q?1GulxjlV8h3i5oitzEq9O30PISO73jK1fN7N9Vewb7CBs2KdbijCHIHOvMXq?=
 =?us-ascii?Q?7kA4yknIZgeNpaCZ5HlHQYLeso7oGvWac33HW6kur1GI8N777eHE3V/hZsPo?=
 =?us-ascii?Q?0IvmyEzzZ0ynKayQzAtvLH7KSLyrVS4ZGgbhtb8rwRagqGFHUFM/3LhoN6Y8?=
 =?us-ascii?Q?+xrAcWT3nwWaiJ8gYOyC7x2A5XElxy2UwdIHZa8A90N+02liZAQ+udx0MBm2?=
 =?us-ascii?Q?I9JIxZL1WLSxZ0U/6KEiLMRibfVtKbdwd+vcx8M5Jnc8hSMiWTU9YbdJELfQ?=
 =?us-ascii?Q?5OLynxfO+eXYpIqYzwooCgiKG5CmQcwVNh0DxPk9hnCsyPBcBY9M5LAvn0bJ?=
 =?us-ascii?Q?2s3lzd2frJ6LEAGPGEVBUoOL/FpYCFEyCJkVH6/XWP6WawDP/4Bh+4KkGQqM?=
 =?us-ascii?Q?S0BmEKmKtlm0aYlbBqxXQcrDcsMWPgtdJsMGA37QllG6ifkO9MZaGO8qnLEr?=
 =?us-ascii?Q?ha8kSI/QDSETBWv5THn8v4EpjQAAThUV7C0atlVtXsLuHN4hT9huLTYU7uFf?=
 =?us-ascii?Q?TFHyRe3oxfCFS0VVGRxrDmm+6SzpF/JhBQ+exGWMG8Ha2+VI3fHFGyIfdAqU?=
 =?us-ascii?Q?+OnH0soXI64IaUoxtqq+axMAdGYAnJsmNtdDpVMr9q30ec9cY4MU55Mi2rLL?=
 =?us-ascii?Q?IOSNkx8YZsHBymzuryewbZve5rXKC0OAkAI9yzlHwixQz2cy0eiFB6k912ps?=
 =?us-ascii?Q?liFFS71qAT4jQI8XL/57aVCRmalz8fNX7xrZY2E8W5zhQd8Lng8NIda9HFEi?=
 =?us-ascii?Q?OOy33uX4ajoYuH3xiUjLZIfdDK3NImyZx1Y2itaV8XiPIBURRsbtuwsad69M?=
 =?us-ascii?Q?ei0C18Y9jVwoiH/CVz7kxk0SW+TjE+rjJ/m4oK+uPP3yKn9WnonvkrEXMJz4?=
 =?us-ascii?Q?Su/vmwOLJIWEl4UvpZy0xKBlDrnaqJURJmY2WQXjoNAuPSOXad96Yy2pAytX?=
 =?us-ascii?Q?QIHyCMo+3l/vbXft863QZQGi6m/0AtHVNOlN6AooTQdj6a5uhjMTuX1kWvU0?=
 =?us-ascii?Q?/fMYbiwCE4P9hYMJnapsYgwSayOQ0Qs+W5Qi1MYQcQPqOIPLPsMg7I6dhFMX?=
 =?us-ascii?Q?wWQdh+XvS0LRJ8Q1tr8qd0wqcigDvmARVzfzrr1zD1WPY2l+jBtzEJTFXGWc?=
 =?us-ascii?Q?9rreLCDrbSiQG8FEi1hoEnwXDpavPXGXreQ9vrg8Bfun1snTeudgkXXAeP8J?=
 =?us-ascii?Q?1O1y9d7PZ5okZYlIoy9+TEI4xxiYpsdHKF8cnB0q6W0efpmsxY1lljRgA1Ud?=
 =?us-ascii?Q?2DRQhn07ZX5jcFpmUQJ9ptSYp0YArB+cvhCdaxDX49AzfFHWw8pyy7N+N50V?=
 =?us-ascii?Q?NVtnHFz397UV5XIhOkYfhnTpoav1K3G4FPrd+9yoS9fI9MQaxsbH7n6+wxot?=
 =?us-ascii?Q?HyK2OSH/Sin0wMo/SbGhC7F1vJ0EURqdrpgo4nu5OmlHU+IuKAFtmi0fxCqa?=
 =?us-ascii?Q?t2TNsPH8iujDioFArYtKg5eAiEhSZ6hltWkajjWNKoCg+eFezY77lr0wOUO7?=
 =?us-ascii?Q?Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46AC578508DEC34EBDB1D3AF0731B499@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	l+FSk+ymWYPOcZT4Wkhg4XUB98O7lHRpChlVjnSjFqnGXQqKA21rh31osa1nsJ4oHJquzcQi5E7LOkyiNkqEP6djh7kXdW8cHsE/BhBwdYElI+/jm/DI7lj5KXk7xu2KS/qrPqGE7tDqPKSvISrFTjlZs7MIqbBBc7UHTcL+ak7apn4RTDEzMkeTD6UujCsF46YQ0EmgA0p8+ol+X3Mu73C3dWtRnN/b+NmvBzZiiSLVUOX02uvCBNZ7FfzCofpQkC6dkuV+p8EgTtZVaA3G9tEbk9J/eLWuKGh9IUl0MXqG6juWczgAAH+/OLjB2mBEZJQPJK03n+Dzm6JkBAybw50sgNf+BtRbzUFbzYIaYtzi48uL3A02hcwc2+CYzZlAwoWIyl0HQBKKjqOTezFgspUuMrSm/wm4hatSFT1T+TZDBu9Zyw7kABZbPBcjlJEU4xhbnuDQ3wXW8IfBbCcSpRw4UFG5N6ZB49qs/7AO+kpu/YLq2BoS1XmmRevOtyHzNULIC9JFjeqoFfyDA0V5UMpMSyrDw3vtDMNJfpXPvhq9PFL0uU3VihT5LC95ocAwZQ2DEotMvs1JmieZxnzx16CFdalKVndZ/3CLVprAN6yeSCIluMq5UI0wvZb/2399ebxqBSeBLmOKudGArSvaVO8R/7/GObsxJfbIxUSRGHkPeHFANsqCsxxW1Au5vytvUk6A/yzgAEsVXNGDjHW9WwKyWYlincgwRjjZdQWl3P7VFOdlelLzSdfC/eWapdjRAWHF/v4txaMa9QTDEi+bCROpt8sxN7OqMeC2iMxm8V8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d42d389-815a-4d7e-7226-08db2623498c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 13:35:20.2240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PERTqbkU7bUUxUXkJd5MX93dphWBOt6WXluY4DAxVgZmcxJqoUcmVCeGJQNhCHOQ4aFl0D4OCNbsxot07Yol+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4306
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_09,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160111
X-Proofpoint-ORIG-GUID: Mw2-G6TVZYx9TSpnRkq7YZsN3SB1hKvb
X-Proofpoint-GUID: Mw2-G6TVZYx9TSpnRkq7YZsN3SB1hKvb



> On Mar 16, 2023, at 7:26 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> Hi Chuck,
>=20
> some good news; my prototype is up and running and seems to be happy with=
 the infrastructure:
>=20
> nvme nvme0: connecting queue 0
> nvme nvme0: queue 0: start TLS with key 389e6cd5 keyring 23836d8b
> nvmet_tcp: queue 0 hdr type 22 hlen 1 plen 33554719 size 128
> nvmet_tcp: queue 0: TLS ServerHello
> nvmet_tcp: queue 0 wakeup userspace
> nvme nvme0: queue 0: TLS handshake done, key 389e6cd5, status 0
> nvmet_tcp: queue 0: TLS handshake done, key 389e6cd5, status 0
>=20
> but there's one question: in order to get this to work I had to
> set the sk_data_ready() callback before starting the TLS handshake.
>=20
> queue->data_ready =3D sk->sk_data_ready;
> sk->sk_data_ready =3D nvmet_tcp_tls_data_ready;
>=20
> That works, but it's getting tricky once the TLS handshake is done.
> Naively I would have thought that I need to reset the sk_data_ready()
> callback
>=20
> sk->sk_data_ready =3D queue->data_ready;
> queue->data_ready =3D NULL;
>=20
> But as I'm paranoid I've check whether I'll be resetting the correct
> sk_data_ready() callback:
>=20
> WARN_ON(sk->sk_data_ready !=3D nvmet_tcp_tls_data_ready);
>=20
> before resetting.
> And, surprise, surprise, that WARN_ON triggers.
> Probably understandable, as kTLS is changing the callbacks, too.

Socket callbacks form a chain. Each module wanting a callback
saves the callback function value, then updates the socket's
callback function pointer to point to its callback.

Then, when it's data_ready callback function is invoked, it
calls the saved callback function first, then does whatever
it needs to do, and returns.


> Leaving the question: how do I _disable_ my sk_data_ready() callback?
> Just blindly reassigning the original callback clearly is not a good idea=
, but doing nothing would mean that my callback will be left in place durin=
g the entire connection, which also is not a good idea.
> So what is the correct way of disabling the callback?

The way I've done it is to add an atomic flag that is set
only during handshakes. When RPC's sk_data_ready callback
function is called, if that flag is set, just call the
saved callback and then return immediately without
doing any RPC receive processing.

Here's the RPC client side that demonstrates both how
callback chaining works and how I disable the function
during a handshake:

https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/tree/net/sunr=
pc/xprtsock.c?h=3Dtopic-rpc-with-tls-upcall#n1436


--
Chuck Lever


