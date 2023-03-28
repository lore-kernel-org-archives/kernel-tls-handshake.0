Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1D2F2A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 20:33:47 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SKTqB3005871;
	Tue, 28 Mar 2023 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gytSg5dHquhVIRAIeYTF3CYpYEENMvBWxfrqVXsq+uo=;
 b=hhL8sCRwZaYFWELrzSfNYQt1GorBDL9P7Qb5XYZSvy1OO46HZJiCV6qAdDBuOKNbeLXH
 N7HwHJUh60iUc4OJEgRcoveerNdEVOjlfGgcrM2zODSD/r0rtsNOr1Djlyax3ZUvPpNN
 EhDhHNeoglR3cmnkXyfICgBPOP7JRGerk+m7iCT+9EhW71vKqKJO4eEnyVMP+VP/P9Hl
 rCDCSIi+0xMh1iFMSTptyvl6tqGIoKiAcnADVP2/ZXHX/iaKstNqyO6LU8nJ3lUpW1LK
 KNj8GGIB9FBdR1H5ol8SSpnq0vIPXHjel7WTAN+B+THpPkqWTPrmv1RPMDQ8chPOTbHy Jg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm7av008k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 20:33:40 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SK5PjE009373;
	Tue, 28 Mar 2023 20:33:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqddest8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 20:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyoSG5zphiT9UtBHeL38Huw/zxeuXVB13X3tqby85QgYLXBJBTsyEsmH9MizdsU/vk7CfIvwyDnHLKcenAjuAUTrCR/05+EZz38Db/0qAyFjCLJIeQWIX/nrsvv+sAK7qZLmhptMmAlmGWbHth2xjxkkmzAlYl2s3/KF3VLXE7lAoB4m0tEHMpc9jsjrgpClGfsZ+NzdAR0Tt0Dc/jhl82CV7tWH3v+n8wH7kX83aDP+/hj1df+aTIcZGSv7OPdcKfL7WA3SYWTkKQ1CORMWGngZ+L3VBQ8JxPZQQXy/UNAce4DOXncu2GkGanes6OoUfcUVt0C9YW+wiMFRRDGiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gytSg5dHquhVIRAIeYTF3CYpYEENMvBWxfrqVXsq+uo=;
 b=QNywHl0G7iFaf2As0TxI7Hl0HXnjcBpYbWXXTJ47KTcIAl2zHBFan2wYMWmCmaDHfGZSVChwd8NxP35o2zTkKJgGy82FJ6OMd3YvY2UTrUUNGPom9VdG4Aw+IPx3KYWApWeuekJURWH52dbmg9qmzmJsLQrbb4k/vShx4r/7/zQZBGpuMyK3B/4Rl5ve0vE4q0FdszAdccC1TYz4XjtOOGQrW5wVp1ClNx71+AIKFgp3u7BUiyxuNZu8K/oX1bP1C8d9LB2Ic/XyxMC4JMqTqw/7jOdplw4Aw7aXrBC+Xm+lsX5jZAxDak3rR3BzY+e6BwMCj5PtMIwG1Dn7DkVJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gytSg5dHquhVIRAIeYTF3CYpYEENMvBWxfrqVXsq+uo=;
 b=n/nVmEQfhEQWMVstMfyTOQX4RDBLNskKl7s4mdIm5taMng4j5FXmzF6UMhlaabITIGLfSL6ndHjIzj1saK5e7qLn9Orc6w2XcpAHNzpw8z+WotzVru/dpR05U0fM5W9KyHV8dANW7YgC4sTbxkGCotFCV21n2rdiwZGG7X6jVFs=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BL3PR10MB6067.namprd10.prod.outlook.com (2603:10b6:208:3b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Tue, 28 Mar
 2023 20:33:37 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 20:33:37 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH] handshake: set hr_sk field earlier in
 handshake_req_submit
Thread-Topic: [PATCH] handshake: set hr_sk field earlier in
 handshake_req_submit
Thread-Index: AQHZYaCenEGtEBksLEmHM307ffyXCa8QfpMAgAAmGYCAAAE0AA==
Date: Tue, 28 Mar 2023 20:33:37 +0000
Message-ID: <9EA1F276-E7F6-492B-AF14-B5C97670C121@oracle.com>
References: <20230328181040.292486-1-jlayton@kernel.org>
 <CE691A38-999E-4128-880D-F6A5AEB20D79@oracle.com>
 <44b718e213a57ea3018f4fac6c648c35ed1d1977.camel@kernel.org>
In-Reply-To: <44b718e213a57ea3018f4fac6c648c35ed1d1977.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BL3PR10MB6067:EE_
x-ms-office365-filtering-correlation-id: ac33fcf1-f020-4bcc-da49-08db2fcbb5b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 os0LbFsRjG3iSfuN91Ko46+NLBdWXvm5Sbyp9HClV7tXHffL0oLmM+4wMr3Mcj9igwx5mZp4B/wLuNrKh+CajR95+eQVZMlLEneWZq4jUM/I2UYcTUCe9M1N0oHknPCABtUOckfwl+Ey8socPFhKYHbmv5VTV/W6uKfQr6tRuKNKiGNnVQPY81wLnefbYfjMtWC7DVxdwJEyt1RXw4Z69xVnUYmcamgXyYcw5YXBtXmKU3wkP+/tELv0AfsEWKXFIjvn1/I6uLFO1exZF4+pNx/9JA9u6xngm5EaRhFEcyDQPhSKHAYrvo9HDqCC/XBvQd32cBDapVm6IS+we48EQ86AB8TXDkeLhorcWFBDSt8Bk01e/BOClUwZ3s2arDKIy71RglAIqDZEehjRLxGXsvvxumtc56hLc95ecsvQ4txlwRivPt+RBYJ4pACQdnakp9PaXfsMBfZBULGJfj2Gz1sbATPJP3DeDlRYn1nqFHahlA2Bc7miZbDf25dH0VvNKRwKo2sLx53FIwE7u98WnDdTwrdL56Y4D9rR4lCD64gAwKMKTSWZZK0wB3rZNCE50amXGmNP2xfQQzdQ4B2NZpxyjRhada+xL2Yqz1Axtp3rdHTN8zLGn7+gU/hYES5gSjU38tiHyWbnKUJpSi/CQA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(8936002)(91956017)(83380400001)(2616005)(2906002)(41300700001)(86362001)(36756003)(38100700002)(5660300002)(66446008)(33656002)(122000001)(6486002)(478600001)(71200400001)(76116006)(66946007)(66556008)(8676002)(6916009)(64756008)(66476007)(6512007)(4326008)(4744005)(186003)(6506007)(38070700005)(316002)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gQjr2P6zpNMc2Gts6vLVpt+PI9emOwFxcTivuhlwd5UrgzMBXXwMqQcliTfF?=
 =?us-ascii?Q?lxKtM/4B1jAlnzY5py57UjrGrBFUjPLDZ4FKwLH6ox8oIi+PWdBlEwEM9yxG?=
 =?us-ascii?Q?+6CuyqW21HDwcawB/mUpVXPykRZBKyS1HHGlYfAwLldsW+hAnOJqeh9rIg0i?=
 =?us-ascii?Q?CPFRgl6u0nE31h/U26sX5+tPxefB229RbJBWo5zyYL8mKnWTw4Vfw/MzJAS+?=
 =?us-ascii?Q?EVnlCnLaDGbGOJcd5yTxUQC/Hob5GMvNITwwibjAZis5b3MBIVDzwQ2m0Tn7?=
 =?us-ascii?Q?BgHmtx0FIUNlL/MMdqMSuaalxRof67MqrxVFxw3HNgT/7IVoXpFAF4nNAqbr?=
 =?us-ascii?Q?UoBCS2U1NXtA7dY2dPh7+K1qzw1VxCh6BFN/5OgUJ0Tk9s4HbcIfS0E5wQ4A?=
 =?us-ascii?Q?tlNhQs9KNKd0FBXqP6c3OuIQOYNA4pqME8py6enQ23XwdUCaj8+TFkQY0MJZ?=
 =?us-ascii?Q?7QgeIInjvGomWibQtVyfWovb25opTSWMMv29EcdS4e+Hb9iz0kGAfWlinUcT?=
 =?us-ascii?Q?6KGVonNN9PbjGtE9CriLfSm2rmeGielL2n/oaDZY5AsLaWvBkWGgEDOuxZwQ?=
 =?us-ascii?Q?NTC7BtHGbeJmdkk+Jp1OT5LamD+iucYnjxG5daTmeEOR6v69vRWfmzdcH+Qe?=
 =?us-ascii?Q?HhzYl3kI3o4hYlld9/g3CahMN389YrafhD7C6IO7fks7+spsi94Ao4t7ZX42?=
 =?us-ascii?Q?vsalOSermLyEWPz2PyxBEbZmJqc77b8jOKKeS3G/0dZmxHfbLsBuzSXkM3fW?=
 =?us-ascii?Q?5B8r8b86I4sF654NN5g8AnN2dA9Dpt89S+6TQ6la0OoLWZa2HHOs4P+XwzHd?=
 =?us-ascii?Q?ysLxl2UcZpmXVqkDyh0njLJ67qvHGhZ2eaofNeNAOZ4awU37E59+BKtafnet?=
 =?us-ascii?Q?SAix6aFOFENKsdlOmR6Hh77FEZCQQyLo+39jM8dtOfuQQW865pEz3XN+0Vza?=
 =?us-ascii?Q?k96hn9eQEae4JFdl8Rs2sJ5yZctVUdK45TvTq/gzOPw0FBeaoUM1Qt3VJ2/U?=
 =?us-ascii?Q?rWmo3MVYioJoIektyhEoNk+Fwp76gi0Ol9mBmCtegqV1C4Hsq6qnQHpfBaX0?=
 =?us-ascii?Q?zfBB7owUsPTJYcwqs0og7BVv0Yg3+qa5nZJfUosNN4AB9+MCQDk5izduRprX?=
 =?us-ascii?Q?+beGw7d43x2J9x9Badn4pImWmSR5dwuhQgopsWxE+5V0ohCXCjEPjTILI827?=
 =?us-ascii?Q?IsvsExjXhqqdnhDVCXd/Y+7QaEF5v+sWnNHm/gztO9Sp1UAYA7n4XlQw/76W?=
 =?us-ascii?Q?R4FNWpE29b+lEsosQpe4I/9p+ritNzCbnhmXLi2dosvMTfGhNOI04kHMeAH3?=
 =?us-ascii?Q?ptoNGVDuDid6RVdxbS1hxj2fhTl9ny57ywTYU0cxnXBpwGWRCvzpyAoLhKcf?=
 =?us-ascii?Q?Mw12+TcJKqwJBzKuTGVQlEca7gIIyLcXIS9VbmAD/bvlOn/nc38NHjNN9qKF?=
 =?us-ascii?Q?SOT6mwjQ+3TRJ3Bhq3z7srUmpr0GkFbS7FGJ+lzWOqIGHZ2MKMLBgUZeNy7o?=
 =?us-ascii?Q?SF8ZUwk+uvDhEYnFgprwbZq+k6e+8pLo8q6+s+nnima0EDm4OWpiSl16jNW4?=
 =?us-ascii?Q?E0LmqjLdka5HJkwWA/FvsqL8H33mmpbKWFojAAOT2oFwizUI+U56mnFN4nqr?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E4FD4AFAF5E564AB16422E8C14BDFFA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iVEkZjOpaFmMISWkYAAc2BGUgae3/k6zgIrcg2jHPsfaBZwnPg2XEZ9bw3AEK6/5r0UUzKqrNi9qHJJ9JrMowrdkHFaYnr7vVPyEd1yJOC9wAld8vNBtA2rLZ/zlV3/3q61/qp/wGz2gb8EpbjWdl07gW2bGvlTnBMlkxM37he9mDG1y8MoihyEs7GsL7jkYQzvqyf+xMBlCbqojOclhWX41Zw+O7nKIkc4UaZstrYWUeWG9O2NMoblPZ8kU7Ps2vRS8bxaiSz1Rbik90JEiU8Nj7ZB081NKnKwxnOG/tabP4A0Q8qfv2LUfdi4tyFa3bPMyG5t4i38Ki39AhJrE+wVoi6VbU+fhChixSzSQTMiUayTlwhbAXLU0FhzUXyIiuA6FrXgnvHKZp5rqKjwRRkmCKa7ZrzRRPtpgFhlHXueLXlVWyVKS2e3bl/Vq9tqll4dQ11+wRtDw6JmuzQfF1uBssjykXxqQKbu7Ja5IQq/T5bc0nLr0Fnu6quBv/YwJ0mSv9I/QDPOiRp4YtWc/Shz8z2hDNufK6AiI/Blk49TTydoSEQGj/Px+wI85Rc0dkFoxDhCSonhcGtm4jBo0bzdM6PdKzmKc3sGISoFsch23ZlhQrWv+icVL3o/Oz6qHJCM9tqkz5DpmcjpOEwSLarkIF1CJMaI0EVMOgdATFGqDbpnMLIVEX/uiMz3NEb2261iVoBAvLMcSABz+VA20ptVJYthZ3Lk2CGpdqQiqh3Dls3puU7kU7RiW5nQvE7Gu/+8ecBiW5vLXDuna7IyWf1744c9gTm07Xm+g5FCWoM0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac33fcf1-f020-4bcc-da49-08db2fcbb5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 20:33:37.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TARQvr9USQAhFUqd5y3LdxMBzUWcIKNk6zuoQT0AbyEDOGdPelYGnscN1ARzXNG0cBqWtM4newUeyqyGNm0zWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=960 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280159
X-Proofpoint-GUID: ehnc_8oIDJJh2Xg6cBIynlFWb4_M4VBd
X-Proofpoint-ORIG-GUID: ehnc_8oIDJJh2Xg6cBIynlFWb4_M4VBd



> On Mar 28, 2023, at 4:29 PM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Tue, 2023-03-28 at 18:12 +0000, Chuck Lever III wrote:
>>=20
>>> On Mar 28, 2023, at 2:10 PM, Jeff Layton <jlayton@kernel.org> wrote:
>>>=20
>>> Otherwise, the request is always hashed with the socket set to a NULL
>>> pointer.
>>=20
>> Sounds plausible. I will need to check the clean-up paths too.
>=20
> You're right about the error paths. The sock refcounting will need to be
> fixed up for sure.
>=20
> With this but fixed on both ends though, it works for me pretty
> consistently now. I guess I was just unlucky with the hashing!

No, you might be the first person to test this code after I
addressed Paolo's reference counting concerns. It was working
fine before I made those changes.


--
Chuck Lever


