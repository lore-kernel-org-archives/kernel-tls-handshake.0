Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E233CC
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 13:43:27 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GCx9km003178;
	Thu, 16 Mar 2023 13:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=LQ3SsQek07XYjWPyywUWd4WOqftt9SrwjLAIeOMlrfk=;
 b=x0SQwg/8I1V3DM6d/ODsZKkul3KUYI9uDvEqDTfHzN2IlptlhPNy8D1ISNl0mznVmYq6
 GW6IMfo9mzjykCvMNmYFDZipn2uWjRs5nhOK2wDU0avvTuENwtsN6LA8ewdBO+z9F2FG
 HNCQSYpgoRUQ+pWUbGeR3CzpdJmR+Ln1hmm2BxxS3RMB10SfY+PiM79Xya/6n7D0R/uk
 MoGlY60O5wxRJQW4kt2yAVVODy+5i7SFUlBNjZod88vKC2V86CQpkuyH0LCtqMO6aEqt
 cWNoohQcQjeoBL95hK7UcK3WeBWa2nLhAVXcUqeyk36k5QIOZ6uzKGZAF75sdKdKfNnA RA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pbs29s611-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 13:43:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32GD96Ga036674;
	Thu, 16 Mar 2023 13:43:25 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pc01pt6fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 13:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUtF1M0wSUBsU22XIJPlCyBG0dCN0Kk2zwLKsImzKmc7uzJep1G/L7+sXd9HTt+CfMkJiQb4P8kReIc+Y77C0RKqJAxE73Lr16tM95UVB7TP5tdxBdxNyAblOVSWmmYElPTNf7jstGjhwmOH4NSNiYej/SSSq0eQ6yUR2s/fDXREu6+8YYciGJlFimKmjiT7DROy/gz72hZP9C+xL7mSFXi5w6LSuoG7dQxTwv5Cuhw0vepwoFWtDZLj/BDpTGeYVtpOPXfr/rLaSxqGuoBF8VqZihqmsLSBbbHoe59IEK7WtJhq19YsHxsfcFqJ2sOlWmbnDADv63NIRNMvLNB5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQ3SsQek07XYjWPyywUWd4WOqftt9SrwjLAIeOMlrfk=;
 b=MkvSgOL6IquwbW6W65bXEcsgW0sNYKb7Kpzl5bx5YldnU3iQhNM5VRKWvn49Cd6mmZ9FCEx9Sw+F1a279i3Z/Vpbcsh0/QXR7lSCC3tOXMn/T1qD7F0yRQnMo/Ryhpio4pOHoNS+8tceNBEeG3G0tQV6sIpIzY+8C4uRKhuP0ww8L4aTcP9dtmYuTnIC9gNf1jCx5+8qL9dnRkrf/kcwGnXZew5bM3aWz+JfOqzjh7K/3XG/kLYhsdmw+M5+pq83pHi4ZDJwY5o8C3KQ8BhI0DvYtoh1RvirrU5viEQQYYtEyXyBbqnY+2ar/65SWWiRjIeyroEPnxEu8nzdRna9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ3SsQek07XYjWPyywUWd4WOqftt9SrwjLAIeOMlrfk=;
 b=vAz65+9RG3vqrZsk7vHtOLLWeA/H6bVp+PYVykZzvniq0OtxxGY4IaPYYbSU3Gq8fj/PhZn/DvziWUOJ/Ok/lz8RhRnCCgkNWE9MMXoXJtG+tFoW2eMN+GBG/dC35o/PSJMbH4Xaun1bZQG0HueK3K2TQHS0dhxvuecRtEPMAzk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB6421.namprd10.prod.outlook.com (2603:10b6:a03:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 13:43:23 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:43:22 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: sk_data_ready callback restore
Thread-Topic: sk_data_ready callback restore
Thread-Index: AQHZV/oxTU7X/WpZQ0aBeXQVYvkZ+a79aFiAgAABZwCAAADZAA==
Date: Thu, 16 Mar 2023 13:43:22 +0000
Message-ID: <5B3796A0-0714-4DC2-BBB3-7E13BA7F4BC3@oracle.com>
References: <7464fd83-7cfa-d075-71a4-6ff6ed73529d@suse.de>
 <21D9A8DF-9A7D-4DC9-98A8-D50A06A548EF@oracle.com>
 <df87dd51-4e21-9447-d064-eba4f67ad35f@suse.de>
In-Reply-To: <df87dd51-4e21-9447-d064-eba4f67ad35f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB6421:EE_
x-ms-office365-filtering-correlation-id: c03a4a8c-8bd2-4b40-e43f-08db26246936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Mne9gTGh/9dqbbFLz7XeqSiMswNFxo1hkLd4/rvpGjsMRFCEJLH9fDLiRojTKZc5/sAk+14IY8zpG3GKiLJGUOPQzdIcyqk2V9mkaoaK/vQoTXZIUQ1/8X0G6B/6b6MO5lw43BlKDlmQwmzBwTfN5rOlGh261kvQvu8hjcoVEKPgQ6Bj7oifDKSRfPxYeEQRo2GILYNYL52FvxKyCljI0Faa8lAyre0PHw1Kr/DDeYhTdRA4sDoONZC2f0EIof1+yABaj5186G7HBs6uXfu4CcaH8Xh5Bzp0aHEesedNldASmxU0rvIE63EYqQvIy6YW0ySzlSt9sh0hF3rBh8vY1zOUMrqlSRyyeo1nk05VmcY6vFTEGQSmI6x1ujbu7xfa7Bao2I4phJ7stmn5SajI18U/gVYyYj/3GeqLROV18SQHjzhqPdhvU5blRoY94OaJBXpP+ixrWIoxyAbWQTUOlYdjTDhoR97HfEirbMTvz4rCdgbcWimO/7WL57oC5QSiI4RtvSIQZyBAOLPbHuC5IV0iT1tKSzHvOkwai9VZXRVXnyN/OJX5D6ouvhsCPK897b4ZJc85NvqqkTCOytPcyphig4GHfEps8Dugn9ykg1pAre0DGK5fIQLvPnAOhzCxpjrFolUUa40mC1auUxLN/82ADhAwesayEEEdh20Gvkp02qdxKpK5fplolRZXAhyXOJJzZ//5SEIbHGzOmg6uYeU6t8bwxt/sO7mU1H0Wnww=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(7116003)(5660300002)(8936002)(41300700001)(2906002)(33656002)(66556008)(76116006)(91956017)(64756008)(4326008)(66476007)(66446008)(8676002)(66946007)(83380400001)(6512007)(26005)(316002)(71200400001)(6486002)(2616005)(36756003)(6506007)(53546011)(186003)(86362001)(478600001)(6916009)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?U2MnP10fhUx1+IHw7AEKK9wRFVzja3tbtlJX5ATuVUkU9Qcmr74tK6zO/rpR?=
 =?us-ascii?Q?EhT3BiB2XxYHbi3yxjC85hYEY2hEN7+0PqbybXKHIc4ApKneKKLvj0zi9+r1?=
 =?us-ascii?Q?UumVBgcQDSZPl3hD1EuAGPyZr07TMA80JDveQG0jytDVrGL7tDFI1GRkjsLb?=
 =?us-ascii?Q?AOQgn3UcWhI/ExWgi91/YWsj0tSE5nbGX3KRqbfWLSzmq0R8FMLR3AYjoSrq?=
 =?us-ascii?Q?AFdXGiRynREfhwsnwOHHF+WlyWCxl5kkxW8SCU2O07V93J0CbKT+DdEHyy4S?=
 =?us-ascii?Q?DcHGRTZ+mOVZqHKgkV8wsLMQ16/HNrqqRDxpqEaLjYQBNk46bmwttrGcKotF?=
 =?us-ascii?Q?Pi5dkYQlR5AHeD4ynB+RK4HGNJ1waDrDUiF1C3OsL+omF5feJCP4e635Dq8a?=
 =?us-ascii?Q?VcD4w66gAIbxV1oIddHNvOAyCCR8ddd2HRv1CFJ+UrNztcNZp+SqueKxISQr?=
 =?us-ascii?Q?CgFmHp70SzAwPZzKh24jBPMht2+tDkTVvmHE8QB78BZtTcKbfhnbgvNBrXpG?=
 =?us-ascii?Q?bLNU71hfH79gGnkYTpYwDxOnaxcwfj0hNq5nqgyXA5VIrRwuTMZO7wxgyvyC?=
 =?us-ascii?Q?7dgMxDt71SSiJynrUg3lr/6jp13UT5O6XpKEBzKI6oQH5cY5xpnt2salzfx1?=
 =?us-ascii?Q?oGXszRrzrv63HXOZBcg4ZTi0ao6pBic938/WmqaWD/twNRKOE1/QtpIPPiVY?=
 =?us-ascii?Q?IuXllpaTuKvWeqoEhWQonht3Xn8ZuiarJUVsO1zRLoVXoZz9+9d/KXnXOdBI?=
 =?us-ascii?Q?crRFVuehSFNWpLeInZ7J9Z+wU4O02q5HpYIn6t+kZI7C2PNpqZRDfXpfVTWz?=
 =?us-ascii?Q?2kSfaE93uDIinOo5Z98Op6o7flJzoHtJ+uRe1bot/gAALhm50txTHi8kFSAf?=
 =?us-ascii?Q?U/i5IB08a1KRWRvCklw7UFGHKN1uuKN4C1zUhzMYKi2jFF5ClvdLNOI4wLJB?=
 =?us-ascii?Q?BwiFo6BcebWyBdMClwnpiJc4BYXbiJGI+l4mJ0xltjvTKAN1hq6WLsDYZ/7w?=
 =?us-ascii?Q?R7/FV4KRNixqDxjAlDaz7aeH4/U78PPArat7ZTDHOkisO/p5orA8JdFViOd7?=
 =?us-ascii?Q?srDDcVQ3GcrjCGpI16BSrvEYCojVwKepHpLy7TIG/qokeGsuqXe4KLP/MV6I?=
 =?us-ascii?Q?7FLDzHCd/q3MB6Wf9LBuZeiyH2m9cxasqxRsUiub/M81LvRP0CelQdGJE9Tm?=
 =?us-ascii?Q?u18PgEhscxc6sK9oom2pUkxACluUSBGn/9+omd9XZJ64+4i5DBa8p3kMaOMq?=
 =?us-ascii?Q?jWDtm4nsciSaMlTkGcIY9IMeXAgyfYMyHL4fUcOMufPMZofuB7CmRbTRnR6B?=
 =?us-ascii?Q?F7qgMPNE+9FQaCvkbdfKlckhhTPlZ55Yrhl6vPNGLnQJZWGJVSb4C7hPEpRv?=
 =?us-ascii?Q?u69i+qaJtE8jM5aDNeQog4AiM14aWXelq33ChxXCAVCtJfvYLaGvSfFRPAHS?=
 =?us-ascii?Q?6SBJYKZKYsnJ6wTBD0hMjJS62dUKqgUelj1Ikf59r1j6mVZdGBnBqNN/ZRRb?=
 =?us-ascii?Q?1s1pqHEeMF3S/qZmANGzR9Sdx5cT1nnXyQEM7po5M3D7BAJSBc34uW7rEKpt?=
 =?us-ascii?Q?Vx69AA+iAYpIoja82O8Vl5EhWnbpxBFIGSWtyuox5AAo6sWOfB1iOKWEvHyE?=
 =?us-ascii?Q?1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A0039D4E7524AA42B060431F0B25AED7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7EDi4cGbfZdjtCoxNZHoyP7oHssr4KRKh0zAYGf4UmBWHnJm3bbbm3PUD4J/cZCZ2KLfhDP3ZqMrrbx5Z86ly0306ImN8earkmn8UvVrsDgzqSVl8uFIVIdCmqq3i/8I62ubFR2Y+EWPUinLSlpbmAFlWhlp5hdL+n2sQSgXoTOGTs9rIdrzSecy1sljiTITT5tRmY8B6C7dFQ0Q7PDcLlPtYnqYQmDiSO3B/ifpl2kH0Ex3Vn80JkadA9GF7gAY2UUVFC67SgQSIiqN8KT0HJ6z6PF/49kBZUilVSlwHjU+l79AU9Xosq0DyGEFhEmWAQ6JyPphi3sGF32uq+0x7qoeL5Sg/VCSgHkZJ95xJeGsPjVLnHOyOznRJzboGtRixXlqQjH2aZ6WUX0H9DyGd61T4vQiMV22PAXdBONtitLybQzgjEn6U3onp3FvrCO03WCYbZ0uxYYiWXfSgNtrQQcs3uZAo+ndGBInWhUYZFapN7Q/C9E2Z7iRZWMvsFsm0WfUwe0jhyMXHl75v+xjrjbttLpapVaJ7z+WrThalq3Zglpmp0fVoeaD7t3nLsPKphvqfXRG3YoIhFRwXW54iBinEFCKIuxJNhvN4IbO0Zqyxuf314vc+tWeYqLUvRIfh0saY4Yt3xQnf6I9fjpBQXXbVCVOUhYKQYrkjKHJ3XrfYZ1I7dDWA4COClqW0hvzKKVvgy8AEPpsYd1+MCszr/gwdYx5UxGLDqW+ddSYo8c2HOPeJFINLUFaQZqg7wqzPGTD3GW+EGPh22TzAjyIJbdNoSVjidwoPAV2xKmtfLI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03a4a8c-8bd2-4b40-e43f-08db26246936
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 13:43:22.8784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iA0Tvvl8FlKNA+Dx+VvpiTq/WfjUN7blj6xawiGxUQ2pLJSKER4s3yIm5f062jkv4NSPovlpSqKgfbtIk6+joA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_09,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160112
X-Proofpoint-GUID: g695UQo3hwKZVw5xCX-j20llY8lp9sy3
X-Proofpoint-ORIG-GUID: g695UQo3hwKZVw5xCX-j20llY8lp9sy3



> On Mar 16, 2023, at 9:40 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 3/16/23 14:35, Chuck Lever III wrote:
>>> On Mar 16, 2023, at 7:26 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> Hi Chuck,
>>>=20
>>> some good news; my prototype is up and running and seems to be happy wi=
th the infrastructure:
>>>=20
>>> nvme nvme0: connecting queue 0
>>> nvme nvme0: queue 0: start TLS with key 389e6cd5 keyring 23836d8b
>>> nvmet_tcp: queue 0 hdr type 22 hlen 1 plen 33554719 size 128
>>> nvmet_tcp: queue 0: TLS ServerHello
>>> nvmet_tcp: queue 0 wakeup userspace
>>> nvme nvme0: queue 0: TLS handshake done, key 389e6cd5, status 0
>>> nvmet_tcp: queue 0: TLS handshake done, key 389e6cd5, status 0
>>>=20
>>> but there's one question: in order to get this to work I had to
>>> set the sk_data_ready() callback before starting the TLS handshake.
>>>=20
>>> queue->data_ready =3D sk->sk_data_ready;
>>> sk->sk_data_ready =3D nvmet_tcp_tls_data_ready;
>>>=20
>>> That works, but it's getting tricky once the TLS handshake is done.
>>> Naively I would have thought that I need to reset the sk_data_ready()
>>> callback
>>>=20
>>> sk->sk_data_ready =3D queue->data_ready;
>>> queue->data_ready =3D NULL;
>>>=20
>>> But as I'm paranoid I've check whether I'll be resetting the correct
>>> sk_data_ready() callback:
>>>=20
>>> WARN_ON(sk->sk_data_ready !=3D nvmet_tcp_tls_data_ready);
>>>=20
>>> before resetting.
>>> And, surprise, surprise, that WARN_ON triggers.
>>> Probably understandable, as kTLS is changing the callbacks, too.
>> Socket callbacks form a chain. Each module wanting a callback
>> saves the callback function value, then updates the socket's
>> callback function pointer to point to its callback.
>> Then, when it's data_ready callback function is invoked, it
>> calls the saved callback function first, then does whatever
>> it needs to do, and returns.
> Yes, understood; that's what my prototype does.
>=20
>>> Leaving the question: how do I _disable_ my sk_data_ready() callback?
>>> Just blindly reassigning the original callback clearly is not a good id=
ea, but doing nothing would mean that my callback will be left in place dur=
ing the entire connection, which also is not a good idea.
>>> So what is the correct way of disabling the callback?
>> The way I've done it is to add an atomic flag that is set
>> only during handshakes. When RPC's sk_data_ready callback
>> function is called, if that flag is set, just call the
>> saved callback and then return immediately without
>> doing any RPC receive processing.
> Which is what I ended up doing; it felt slightly odd as 'normal' programm=
ing rules would imply that any action you do should be reverted once you're=
 done.
> Which doesn't work here, as essentially it's impossible to restore
> the callback.

Changing the callback function addresses while the socket
is in use is racy, and also you have to preserve the callback
chain.


> But if that's the way it should be I'm fine.
> Just wanted to clarify.
>=20
> Cheers,
>=20
> Hannes

--
Chuck Lever


