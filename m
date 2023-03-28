Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555FAD3C
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 18:13:06 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SI4eMx011503;
	Tue, 28 Mar 2023 18:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=P7WD9g8u1xjL/albUeyREvBtPMXwL789jheYViBXfcQ=;
 b=hSzbvFz+ZAiXctfv0YGLV93fdA98IaXhODlHqno7nngX8StIMIf66GiJ8y+NR94mzsY2
 u6/AFGufFSRAhrAoHa+Ut7R0ASgBmmCuKJIzSlPdp2MhA1iGofTwqAv+Ed9W5e30I0jO
 lwhXqowp0rRAaim5T3GsH/tfNcciU13FgNEN2lMK817lCvXOyCbyY91hojaFkat3kygG
 L1pKf0+/uNHhaAfGfFJ793TjVpdchHTLkHrn3p/gb6U75dZdEQEbgAdpiziHt3rgmorR
 rsdaSt3uzBjCRw0a3wdUkdn1sdpsTw4jufQU77aLhQKWRhW7EdkrAfU9Hq0x2bohnZf1 Gg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm56m021d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 18:12:57 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SI4gVW020439;
	Tue, 28 Mar 2023 18:12:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd715xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 18:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N96JSQAh5ULi4Lo31XNHJyhAD07SD/y/DdqEOnFityOhdPtbiEHael1k75Xvtzsgp/T3xx227H+OOU5pHn+ZI4MN/j1UIDFZ5WUmxH7srollo9t7X8QwhzvtpU0ahMq2pYfTc0uxenU1X1JmIiYhsoF01wGQupvGn6fzhBVxTqEG06b8xFwYXa10BStzV4ZFhmSTGVlmau0lketv58yXJuyL18yjKu/5Jj8rYtaqVhcWo4ttSiigIlCU7GA/yLkSOOxg1O761//kFOngDhV/Mz9bHkcr0QfPV5NVlS2ybR/WkJdKYTXX+rAYdFdQe8ZOQvboBEYjG/Lft1MURmhmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7WD9g8u1xjL/albUeyREvBtPMXwL789jheYViBXfcQ=;
 b=FEHsbAgmHSr95pffiPivHx37WIyY3pr4ewUjiUJChG2xDUDNbjCCDTzXrJG+GNeg/9YTIrSUKcDSdhgqytDjxargU1mMLAFZmE6/2OI41H7inH9vG+ysrCSFeuuinKmLOrAElJ8Qr7n8GdpNF+u+aJKdxzeUYhdBjtXkfvx69NjQMnLs+LSJpCRTIyZyi37xo846jRbOa5ANtZu60yGpU2iTHbageKdkzO5GY+dogqALwh0Dqo4cATDqkU2532gDv3rhS9f8TP5tLto5gpiTrCqeRol/bzG/d0q6xBLXO6N09VGghwVvR6h7zoIebgwJnUYYzNQl2Fuw6A5srNaCZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7WD9g8u1xjL/albUeyREvBtPMXwL789jheYViBXfcQ=;
 b=jAqUSSIRTUSMv6l8Yo5N4zeSh9w/KDHuHiRPQ0oDAqq2noEnBHKzW2c3xAA00ZPMGbUtDqn+I1t8s6ruwi+vTfoMlvl5cddZv5aT20OLxG0ayH9IVAcC8/bJE3qB3XuGUS12aj2SOPs5PKL22s67ItOkZ7BGpTg/wRkPSJjUc+w=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BN0PR10MB5045.namprd10.prod.outlook.com (2603:10b6:408:116::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 18:12:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 18:12:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH] handshake: set hr_sk field earlier in
 handshake_req_submit
Thread-Topic: [PATCH] handshake: set hr_sk field earlier in
 handshake_req_submit
Thread-Index: AQHZYaCenEGtEBksLEmHM307ffyXCa8QfpMA
Date: Tue, 28 Mar 2023 18:12:55 +0000
Message-ID: <CE691A38-999E-4128-880D-F6A5AEB20D79@oracle.com>
References: <20230328181040.292486-1-jlayton@kernel.org>
In-Reply-To: <20230328181040.292486-1-jlayton@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BN0PR10MB5045:EE_
x-ms-office365-filtering-correlation-id: 21802486-26c1-4356-3643-08db2fb80dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 l/VGnd5ah1/53qN/RIxBLKe4xV/WhtIhdl6nrWOgYYcmR6aJDDgxuinM/608SsuPDiuD8v5zj/Jbn+Wddkh/wb0O/aVobJga9yDdgyFCwj9etoYaOzDDMONhi3/k8S40bxsJdyaqEkoHa7SOPDi9e7NumSqbb0YYmdFc7I0HPFAUmZr36fV9FP741Wxf+RGayoblkSzC5LkqcZdAKgRy01bCYRIUn2UJxGAAemR7ae+EQQWip7h0HUcgPEpOzIGvfLassf68A6mJmWqdL9LMTEkk/9wqIulV8PgkRZTSstFGg4Gf5ktEZ0JXXAcolaZYEwOW7Oh3gNM1o5tiDnDBoNG/n59baobAbp3CFoBQMk2QJRoldyupNI3WuSwgbqfm/g18YAD+F6m3vSm2BfT5cISh1kXbZRkcgrZye7hGA9LHBlaMCczrKoFjLlCFUp/+YQjwWtGbxCzfQy0JHEJ/aR4S+noLie7z3AGTV42PuNvyJgW2VhjjrOKd/+6l3s0iIU7YR6WWIc/RJw0RC9AFAqO8DmftMiHv7vpWchqbzA2323YtM2LbQQPKKa/zU2Z7KHzTTwY7r3wLsUavPA+0f+OCd8yNP5uu3+8CYpWQlJGcH26dZ2i//JmLvYfS9XmFpR3enIttuFMOxqyoJFbz6w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(38070700005)(33656002)(122000001)(38100700002)(86362001)(76116006)(66476007)(36756003)(8676002)(64756008)(66556008)(66446008)(66946007)(6916009)(4326008)(91956017)(186003)(5660300002)(8936002)(2616005)(41300700001)(478600001)(71200400001)(6486002)(6506007)(6512007)(53546011)(83380400001)(316002)(26005)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jrQlC3K9pCr+s7ngo3Wr8+0e8qtBBLHmQ/g//K7LTz2HSAAdtETld9+O4ZmN?=
 =?us-ascii?Q?j/fqHLpouLZKn65I57RNIAqtw+M85cI79bJIyft7Y33fujsnPsGIq57PTtBY?=
 =?us-ascii?Q?aeoCzyRj6Tr6qbFg7A5t/MgE5JlmOjaszeD3iHPrcGtzYONOG0RXD3dX74D/?=
 =?us-ascii?Q?tBFBHtjkYb5i/yEDOPXGJ4NpmNDCXPYs0iGZyook+PxUkPU9wVARFA5iFzCI?=
 =?us-ascii?Q?/bLzZK1Ml1i6uj1YaReNuMECzeieYQcbpeXnP8wUz1uEj7Y5/Yj8PBqvqqca?=
 =?us-ascii?Q?QvwZRPnVZFo6wuYXpkahR2EEaUJnsOC4yfGQiKf8BdFmt0eoYvdoufc5Ha1l?=
 =?us-ascii?Q?q/8Y5FpocQzXEYFXMaWlZim6jbMMr97yMa7AJjTEScPAPR4xEEh2AP+EZOLR?=
 =?us-ascii?Q?hy0FHzIj1pqHGT4h/mOW+fDVtkFbODhS4em+WsCrTz2kifRtTVy3Dj190Q+f?=
 =?us-ascii?Q?6U7BuUhMpZ5V6ZisfWVs7531/DS6DNugZo1XSky97Mf/apQ1H/SdT5XijdmI?=
 =?us-ascii?Q?11ST/YKOEf37rqc+SETg4qFQ6FgOw62KYHBTU6D228jPrXNvCXmMkXhdoDF3?=
 =?us-ascii?Q?LpjILobXFPkUUljK+jIJNf/gZl2glIjeA8zXhGh/RWV3SqyDp+CSDtaCn+O3?=
 =?us-ascii?Q?VyU98Nulh+gyV8a2dBORuxjsvvMsAr898IacVgiKwFCGVuwThtW5zDSirthj?=
 =?us-ascii?Q?kt/aIlTL3eGemG0n1lHbBq3tMNb//iRF0hfACK8A4yR2C9f5ClSoa/rZnjWS?=
 =?us-ascii?Q?5mj36FG6PUqSgs6yBRQ7w8ss53ih+UfI5qUDuuA+dNu454BSQqLvzU+aq2wJ?=
 =?us-ascii?Q?CCME4XMbPCgMjeImyJDNa1DWFjAv4rGlzLY+Z2vhKFcBwYg48x2zdaYnbFGc?=
 =?us-ascii?Q?4r2v7sxzKEkoN1pPT3+1WaRaJhX0SgtrSze8AxmT5SVRAWT1mmebkmbk+xZy?=
 =?us-ascii?Q?ZFyCROpAqvL8JQFD+ikFzIvdowME09+FwEjfO7D5doCjBxXR7eqeby5SFp0+?=
 =?us-ascii?Q?o5ZBJZWYHk9xnsxvbSzjKQmM9WuvHTc0XDYU7G5HSCUO7wOYuIF0XQA1O3Lk?=
 =?us-ascii?Q?QSLySKcUaiZp6mJtvl+EuNVYt+i0nsOyjB3sVgagkj2P7IpLQOWzSPZKmsUz?=
 =?us-ascii?Q?gB60wgzOP3wtgJ0P6x/cLgLnypg780jlGtAwfLuoWT8PGekgx6pWnW9nXOFW?=
 =?us-ascii?Q?T4DhxFSMa2iMRcEXKaPev/BXxrPdI25fugPi3lFSOG0yVGu+iQBvrD8m+Vx8?=
 =?us-ascii?Q?TyyELz55LgXC9hulSUDEXy/4oJDkYcOo43+AAP2Dg6pA4n+2AsZBV6VQs6v9?=
 =?us-ascii?Q?/HyTDBkV05eT6P0seECQBbopCPM7WOA+hhasK/Cw57q3P0TVlR/Ts1soMMbm?=
 =?us-ascii?Q?8uCSvLPh1Wh3OlY+e23ZGqZwCOIepjwpSrYMfFu/p82IlzlNB2aWZB4epNkR?=
 =?us-ascii?Q?5yRAi6XWCODhrXb7wJBbyQbLIB9OvckZ1+WWdR0HsJa70DZXO1H5VeySecdt?=
 =?us-ascii?Q?cgIRAWgS82VKOZ8XnCra/dq0ArEDARm23iPyzzw5erqDRJJ7jXF5wnbZiU0S?=
 =?us-ascii?Q?b12ui2HjlqWmIo9BdDRr/OSh1yGMqjTwDmcpShcsqqGfP1jnN1+E8gdjMaVz?=
 =?us-ascii?Q?Eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD452D201B04654E80FE84F990CA4571@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Smc4ouFuU/MT/CMNmrwy6zBNC4coRpEOGzY7RifKYxVKWmzGSboJFVY+u7EN4VLw4Ity7p+L13gQGUI6qid6w3lNKvqKrZOudgmB9BXn1b/cLgSVsCWnRbfCc8gLAFmFXZo561XoSw9Ppp4KnFAVLtl57w8DoLfXztpaptJ30a8SnW2UN7QacaBKhHm6AKKNijautaeI9C3yh5+M9C2eKy/XLjQqdRlzJPsrQdjIna/aycoAUhXvCs5gL4E5bM6XjcDeQGKo6duf+18BHjGJ6//IMWo3IlSfdvMjfZTZtyJWQO1MX9p60KN4inU/s4tt1WgSN/EK7rdMqCI/7/GeSYELSbYX6LLo83yRuoroFObxAHtK9VFfmzb7pebiwCbb0XcFCe9GZCBRRSWCL3ZB8u0JpPsvvc6glN3kCpNu2OONLEJLLjIRVznveRpe/2VV/TwtKMZI31YhVqHnJ4K8D9qlRdYEIuaUnUezIKUq+q+xNEQvx9jZi42sGRx1QtlYAxqHCL0maSsJTNNJPHqUAZGzpLviNQdVB8/UYchGWMNqQTLUGWhmcc1ekZ8yeCuZaMp3lY4gGaF8PaOqJjiCH48bJpcNsK2SaKGrOpmypZEz2czH91RBJUINk+zmYKKHAX7KFTbzpXmLMkOvjnGDxh7mYwsuc7j/b3NmRkbyENFZwHxJE6JQjZNEgzQkjEP6FPMT9KttcldiD3B8hrwnZlk0E1KfZ1kquTj0yNAA4cGlfLfkUXxbeegqlDaXqFy9Nh7bsCd1z3gP87gptpH+ihE2hHtt45srrO0ZotncXd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21802486-26c1-4356-3643-08db2fb80dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 18:12:55.3556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbXf+YTrjKvVsyYnc3kGuqUH8kXbBKbaaNjSpPbWU4Fti1FAOEfaZmeCNhKvDWiI6kTiq2np0fVDW/69njsIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5045
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280143
X-Proofpoint-GUID: AWddy1HV1vUekaE7TnWe5_WVwLGOL0E_
X-Proofpoint-ORIG-GUID: AWddy1HV1vUekaE7TnWe5_WVwLGOL0E_



> On Mar 28, 2023, at 2:10 PM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> Otherwise, the request is always hashed with the socket set to a NULL
> pointer.

Sounds plausible. I will need to check the clean-up paths too.


> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> net/handshake/request.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I think this is the problem I was hitting earlier. Chuck, feel free to
> fold this into the original patch that adds this code.
>=20
> diff --git a/net/handshake/request.c b/net/handshake/request.c
> index 54ba304b5bef..44a097210e59 100644
> --- a/net/handshake/request.c
> +++ b/net/handshake/request.c
> @@ -207,6 +207,7 @@ int handshake_req_submit(struct socket *sock, struct =
handshake_req *req,
> 	if (READ_ONCE(hn->hn_pending) >=3D hn->hn_pending_max)
> 		goto out_err;
>=20
> +	req->hr_sk =3D sk;
> 	req->hr_odestruct =3D sk->sk_destruct;
> 	sk->sk_destruct =3D handshake_sk_destruct;
> 	spin_lock(&hn->hn_lock);
> @@ -230,7 +231,6 @@ int handshake_req_submit(struct socket *sock, struct =
handshake_req *req,
>=20
> 	/* Prevent socket release while a handshake request is pending */
> 	sock_hold(sk);
> -	req->hr_sk =3D sk;
>=20
> 	trace_handshake_submit(net, req, sk);
> 	return 0;
> --=20
> 2.39.2
>=20

--
Chuck Lever


