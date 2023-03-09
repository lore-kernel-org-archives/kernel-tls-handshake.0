Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FEC292
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  9 Mar 2023 20:20:50 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329Hmm2m019904;
	Thu, 9 Mar 2023 20:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=f0i/w+asG0yIZZiffREiJbZ+sjgUmdtQ8ClOGEp0YvY=;
 b=f1/uV0VLfUn8hjgCM51IvPxmbQ+l3fqT1oR25qD4Ou8D8eRzFIDlSAsrskvRivQ0nyYJ
 R6w+ma/vzE4Hj1yhqEKA76dVIn08SrbGEDKjQWFkWcAqlZl0KJw/UKCVH2C2VwIU6QL+
 HNJYkK/7TPVctRiEzmY8BPoGdoKc9qrXnnBO0iXehkpOPOIQeJiJuegh/Vwz9sgzfpIC
 3yIDrPgR08D+N7HWDPk0SJeyNxT0SP9v1KJTTjRh2GSv/LDgYPMu86uJwJPn/jCEneJg
 T6edASuFwVBfqhpYDXG3hgUw78DJrmz3Gy9ZScpHPs2u2I67TxB1rHmIja+BDR4bIivX rA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j3s1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Mar 2023 20:20:42 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 329JjOnM022378;
	Thu, 9 Mar 2023 20:20:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p6frasswp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Mar 2023 20:20:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft7k1k1EWi3Uo7p1mQ5gVuOFgabKdMhD41BpRQqG+DSjjwT3xRKYwV8prdcg04Q5GB1YF4i94ugC/tRRa/n3DkUWRMxW9aKTgXEefvyPoeSN2zj+YhYaeg8dG/ykY8XzHa/nlOUh99DS8yS6/JEr70Y//7MvkEu7GRQqi2sUU93rji9fJ5GAu6wQ4B+F5cD/xCK9opjs9kkUEBN35Q6AGB6F5bzIwois8JXg5texFysy19RzBhKmiQwQv+5Z8sJLRltUjCw3hybbDuJHJoaZfa8QWSD40VD6ryz0XoZBG5nTjQcmpAXJWRkKXV56uhlOuF8VW2qnK2N1hAfftjrO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0i/w+asG0yIZZiffREiJbZ+sjgUmdtQ8ClOGEp0YvY=;
 b=bkuPNGwaSzNkiff3owFdES1WhKzhZ+ETXmTEAVujJ29hBhLqVwBVrs1ipHeiOQAut6Ybwremn9qAr5+vACYW9B7S9DgggbrRBuaFRFMjKuS3LkCaAhvpLOqUDOakgN/md07r6mCBh6hccyNNhfxFNJM78qXwIiEgy79Rxnsxso+F69t1xYqU/ECrqNpv2Ko9ZTtn89RmURr/chBnFseu3ALKQyxy/WBSg9Nayw+scS7DWp9RTev17HtV4jODGTn1S9Qln4fHAB0FNWbR9mghhzv7tl772fBpFeO7FYOa8xhswjr3CLShRbRBn3sK4znq3TQKYA3PFH66C+cJexc2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0i/w+asG0yIZZiffREiJbZ+sjgUmdtQ8ClOGEp0YvY=;
 b=D/8GC1k4AZrs8UfP8e4/6ucIX9TYCHrWpBVxCsftnwcTpfYjpEWvLndMsXCDdX4ryo5HKrucysIyecLXYJvoZS6liG8zorGq/+RfFHA4n8I1cOgn0NXrP+U8Z1Me8krcYdGlFhFMVaGUAIW8sCxXZYEWL4FB+aH6IdgR9+n3T+U=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM4PR10MB6159.namprd10.prod.outlook.com (2603:10b6:8:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 20:20:40 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 20:20:40 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: pre-release of v7
Thread-Topic: pre-release of v7
Thread-Index: AQHZUpU11Eh2ApmTZ0+y+4t+lpZC+K7yxN4AgAAfMoA=
Date: Thu, 9 Mar 2023 20:20:40 +0000
Message-ID: <46AB1958-D9BB-43F6-B992-71C59430AC53@oracle.com>
References: <D6172FF4-D42F-4677-987E-D0B80326AD11@oracle.com>
 <022a5a5b-3771-ca67-e01a-d043f12c4278@suse.de>
In-Reply-To: <022a5a5b-3771-ca67-e01a-d043f12c4278@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DM4PR10MB6159:EE_
x-ms-office365-filtering-correlation-id: e177176a-a12b-406b-453e-08db20dbc08a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OPn27ijfwZc6sIqQ5VHVLVqJ3AAwmayyRfaKcTvrTI0XkeSFjmJdu256Jef1v1vrZKFiWCMwG4k1M9epI/Sl6omanHuuZn0l91rzF70RJlaDjhViJR2SchHUZ7Fh8nQllwvGKEtBuurMyDfiIPxR4EHz/NhZVRbjixG7cTcEbLcew/36lI+2U/VDtPE4MM0mBR3MYTUjchpwIlD4MG/0Of+XCJ2nClyokot1/pJvKVOEykoguP8L1PSJwKL1PoHf+7Da4Y1rVG2KgpASn31OrJXdoDneKKKGnpa9gZuWoFpW8i/aj0F3vrJOag6Bx0Cbjsq8Qy+HAhWr9155k3w/bc65Qe826vcnQyX7q7KLBetPGHdqceZfcH6ijcCht8teoi4ic5o7xdYhrJ9jwlSq8PktRSPm8wv0zC1/ZaWf0xYTYxtgdZN5vXRJxLIbWYOIE2sGWMy2Zj6MisjXeO2+V08lMYadJ6ciB1kqStSXYpD1cqH4Jd7WOxgOukAlg1WFtXFL291m9/f0pnMKWRHF/zaFix7ueMrx57stQI6bmJjqHGm9bF+bIY/dMQvf6U8r697ehWkBnFKzGUuUo/CXh16lIzG4DYcHTh5Af0KNy7F+G3nr24Nqm8Tuf5aMFAJpaxEy4qt8KI9BhnOlDUKgGHu3RpywaEzsmlZPGMYNS0k4vP+fWuVPEW4XzEJWu6C2MFvRKpSoOmg0TcnLnFbWQiJJRP/tB00HwvgSaQ0r3xG9Yua7ZefTvUDdirIb9CEgYhoK27VfoMrFS5UcZU+L9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199018)(53546011)(83380400001)(478600001)(966005)(6486002)(91956017)(38100700002)(66556008)(66476007)(64756008)(86362001)(316002)(66946007)(76116006)(38070700005)(33656002)(71200400001)(4326008)(36756003)(66446008)(6916009)(2906002)(8676002)(122000001)(41300700001)(5660300002)(8936002)(186003)(6512007)(66899018)(2616005)(26005)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0hBNytDN2JOamkvd3IvQ1c5amNOdEtoK1dWRncya2pmRWV0dCsrdTk3ZWJ6?=
 =?utf-8?B?ZCtqcUgwc3UyRE80YmZYbUZJTXVTcTJzakVxZ3hIYnc3WlkyLythTE9jK3F2?=
 =?utf-8?B?eVIwdnV2ODM3ellocEpLQ1g1Q2x0ZVVxSk5MK0poUWZwanFWUElmVXpOUDNk?=
 =?utf-8?B?UU9JUE1pZmc5UmU4VDFIeGNnV2h3cVpHS2tYbnBaSVIzZ3VHY1QvZXFwQ3dn?=
 =?utf-8?B?S3E2bWRaVVhsYTZVTWtSSm5BMnJ5RkcrbzNmQStKS2dWZnRKcDhLeFZLSzg5?=
 =?utf-8?B?bERmS21pTTNjc05ZU2ZtM2hQQTZxL1k2bStiSGw0L1J6dVhiYkVQeG5jdjN1?=
 =?utf-8?B?WXk1dVNRbzN1SWpMS0ExbXE0cEhoOEFxTFF6L2hzNFRNWUFBaCtIQitvUS9y?=
 =?utf-8?B?UjdWVkQ1aVA5L2ZFSzZCd0lQS1pWUUxUK2MyaGN6NkZVS1kzbUdGeW1YeGVW?=
 =?utf-8?B?eE1nNWpmN0dOK2VjVzV4d1YySzNReURRTTNKSC93UFB6YjZMSmlhMGpMdTA5?=
 =?utf-8?B?QU9DamhCc1MxWnA4OXVOOVFPTHI1ZkZQMmJnUDN5OC81dm13a3RXd25SOEor?=
 =?utf-8?B?TUsybWlWbVFwbzFDM3doQmFTY3ZicVFQL0JGcisxL3g0eS9PdnVoYmp4eW9K?=
 =?utf-8?B?SXh3aUV2NG1zMXBrdFc3RmJGc1dDbFRBME5HdnNhSzhXdjdSVGlZTHR2K3VJ?=
 =?utf-8?B?MFgwT3MxdytORzRZOEZwbHh4OGJOL05qVDBrZW0vbWRncTE1d0t5TmU3ZlIv?=
 =?utf-8?B?RERZR3JhNHVYL1VJVmR6OU5rYXhMd0RCeXlSU0Jody9wNlNxWmVjTDM1N2lv?=
 =?utf-8?B?QjFhRlBrL3NBd0dFMUFsdW5scEtpVFRXZXJHemRLa3U1dFZVV0gzcHRiUTVL?=
 =?utf-8?B?THl6aXppQXdVSUw0bWhVZVkzRlU0S2RoZWo4QnJIRmdMZVNMeGlPL0hycTdx?=
 =?utf-8?B?dDdzN0tqY05QcUw0N2pNaXpHbDZVUnF0ZHNaNnlvTWM4amVwWkYyb25JN1ll?=
 =?utf-8?B?WFliOU12S3VwV2g4dHpITTgwZ1AvRXR6bk5DRnpiQVh2eTgrNmRTMll3YWJN?=
 =?utf-8?B?cVpSLzR4NWVRMk93T0pnTER6bUtpOXAwZUk2M0d6SWxNTGttU3dENFlrSmho?=
 =?utf-8?B?NEpCUzhqMlNVYmFzQ2lmZUpyOGdRMFF6Y3hKeVY3RXpRWnpkUFVHU1ZoSjk3?=
 =?utf-8?B?dUNwVmR5dGMvOXA1cmRHNjVka3c2bWhEVW1pTTUxdkdLTkRhcEdjT0lsdGxS?=
 =?utf-8?B?WW9UeUMzOWI3UnZyT1Z5aWtmd0JwR0QxVnpDeDVIL2czVXMvZmJFZzVsZStS?=
 =?utf-8?B?MDQ3UjIwcVFLeG1IRFhvbDM3Q3BDbTYxR0RUTlhBK0dxbk43aXBDcEpoOHRR?=
 =?utf-8?B?VW9mR0N1UFZLKzhURjJ0YU1OVWxINjd4bTExZURqbTZ0VWdiUHlIWGYvNVhi?=
 =?utf-8?B?ZnFuZTloZXJyUEFhOThqaTRNSkg2OWxKaU4xMVZCa3IrU2VhSW44Z0pTRGpJ?=
 =?utf-8?B?Q0Fub0dSUzlEVjJ3UHdEWmUvNjNLTXZJMVlsVlJsakZWWW9NajNRTVBHbVhy?=
 =?utf-8?B?cDZwQ29kQlhBT3g5NjkrOWQ4QTZkb0tLbldROWoxRjczTVFWYWsrZUZIRzFM?=
 =?utf-8?B?NzFVQkdlTTF6cTZRaXh6ZWIyd21YSFExTElwcGd3RDFYSVhKWVdwUEV3VDNV?=
 =?utf-8?B?NFNBajVPSzByMEU3R0w2bVBkRzFXYjdDTDVSUGUzcGlVWko4YjYxaGpMMFhq?=
 =?utf-8?B?VTEraG5yUEt0clNNRGtiU1hYT0F2MGR5ZGJSN0FBTlJuSWFpcEIwdUFzMGVv?=
 =?utf-8?B?UnZyRzY0ZWtHcGZOalVTbXRMY2ZJcE14Q0dGazNHNVNqcE5qSDVZR3VZWUhv?=
 =?utf-8?B?WVlsUzNVb1REUGcyOUljOHA2OEJ2TlRxc05pK1FzYTd6RllYWkl2RmI0dHlU?=
 =?utf-8?B?dThtQTJDNWtzMEJ5dVZSb1NHbVB6cHVkWjh3RnJjZjA1V2hQTnZnSUtzbHF1?=
 =?utf-8?B?ZERaVVhielYveWYyOGxnSkNKUUoxZ1p6OTR5ZG5qOElnQUVrWEErTktURVVK?=
 =?utf-8?B?K2lLL294UWZSZ28wRDU1TUZCbGhtczBqQW5EalZ6TDlwdXVPajhxRmdoRG9I?=
 =?utf-8?B?L3hiK21DWGdpajhBYkN1VFkyT0sxQUlScFN2SnZzSUdUdzRINUNoc0hwUEhn?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0B94FE6EB29DD4FAC87257F86B68697@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ff7CpCuTTphekFDG4C8WUxG1ew6nKNw9Xc8H85R1uBxihdFgOu/CB2jAsTeP33DEKD/Sh0gZpKqROos1imSDVAP3p4uXE1JPm90Y0gQcVaKI9Sz3dW9qfE3b63osprW8sKOsNYdTPaB4mUOn2Ucdy+ryh8iNF6cSzjU6HHJTGuOcqMFixF5xb+8rcDHDU1cOcpCL2LeCla0gLfVywOCl5kp0YCtVtbAL0dER0G6R8TtMmeAQj8Iw54A7Rg+gQHpxYu6viqmifaN+dZWZf3xCO0bCeE+KAB+tO0UQ13OYNNwnktvtS31/jMdOfBPtG8ArfSqQyy4VhNgYmMM31GQXo2xhgMprPch3Ma7718jgFNHx3dXQryWnV6l6gddICKBtSAAraxiSdhft/kzxcUm+RZl0j6O+EpuAbybnyQz2qoArxpaVXIYCFGLafsUyjGgrOT4zwTXRAGgrnVa3TXJ+y2ki3VGZAx8AlrDk8C9mMHQWh2v7+ql6/Ql71kd8j8Ss9/SGRTdFauTGf/iDQPQN+XAw88NtFGsUU8abetLUK6CgWsj8dsHw+am4ChDaBeQ0FK65mMP+EwQlA+JLZiSGVK3x7Uiy2hkZ1SOMO6b53C/CqheNDQn/1dqFvbD+3SCiN2c4E1EvZ4BAnpYMuTTSt62kCz4+D7sZ8+oXu6zjTiR1I1sGPttV+3yCY7GLO4x/K8HK0E7Y/VBs2BminiWzmcEs5/d704C9ubwKW59muRcsSfOmkECLnqfzBK9QvcVkPbMkWQIWtvL4HBT1sJ88ag==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e177176a-a12b-406b-453e-08db20dbc08a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 20:20:40.2802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDO44aHABZtcfGtLJDfrHX3HP/2DDFCljyUjpLXWEeofx6TWLhJKw5X0Tvr3WzDD20qMmCIId0UsBZ6MEUzsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_12,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090164
X-Proofpoint-GUID: RWgtsPVRYOsd5ghcNySm6VAygD6Rp42Q
X-Proofpoint-ORIG-GUID: RWgtsPVRYOsd5ghcNySm6VAygD6Rp42Q

DQoNCj4gT24gTWFyIDksIDIwMjMsIGF0IDE6MjkgUE0sIEhhbm5lcyBSZWluZWNrZSA8aGFyZUBz
dXNlLmRlPiB3cm90ZToNCj4gDQo+IE9uIDMvOS8yMyAxNTo0MSwgQ2h1Y2sgTGV2ZXIgSUlJIHdy
b3RlOg0KPj4gSGktDQo+PiBJJ20gbm93IHRyeWluZyB0byB0YWtlIGEgc3RlcCBvciB0d28gdG93
YXJkcyBhIG1vcmUgdHlwaWNhbCBkZXZlbG9wbWVudA0KPj4gcHJvY2VzcyBmb3IgdGhlIGtlcm5l
bCBwYXRjaGVzIGFuZCBrdGxzLXV0aWxzLCBhcyB3ZSByZXBsYWNlIHRoZSBvbGQNCj4+IHVwY2Fs
bCBtZWNoYW5pc20gd2l0aCBuZXRsaW5rLiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIGZvciBhIHJl
bGVhc2Ugb2YNCj4+IGt0bHMtdXRpbHMtMC44LCBvbmNlIG5ldGRldiBpcyBjbG9zZSB0byBoYXBw
eSB3aXRoIHRoZSBrZXJuZWwgcGFydC4NCj4+IEkgaGF2ZSBwdXNoZWQgcHJlLXJlbGVhc2UgYnJh
bmNoZXMgb2Ygdjcgc28geW91IGNhbiBjb21tZW50IGVhcmx5LCB0ZXN0DQo+PiBpdCwgb3Igc2Vu
ZCBtZSBwYXRjaGVzIC9iZWZvcmUvIEkgcG9zdCAiQW5vdGhlciBjcmFjayBhdCBhIGhhbmRzaGFr
ZQ0KPj4gdXBjYWxsIG1lY2hhbmlzbSIgdjcgb24gbmV0ZGV2QC4gV2hhdCBhIGNvbmNlcHQsIGVo
Pw0KPiA8YXBwbGF1c2U+DQo+IA0KPj4gS2VybmVsIHBhcnQ6IFRoZSB1cGNhbGwtdjcgYnJhbmNo
IGluDQo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9j
ZWwvbGludXguZ2l0DQo+IEhtbS4gR3Vlc3MgSSdsbCBicmFuY2ggb2ZmIHRoYXQsIGFuZCBwdXNo
IG15IHBhdGNoZXMgb24gdG9wIG9mDQo+IHRoYXQuIFRoZXkgcHJvYmFibHkgaGF2ZSB0byBnbyB2
aWEgYSBkaWZmZXJlbnQgbWFpbnRhaW5lciAocmVhZDogaGNoKSwNCj4gc28ga2VlcGluZyB0aGVt
IHNlcGFyYXRlbHkgbWlnaHQgYmUgdXNlZnVsLg0KPiANCj4gT3IgaGF2aW5nIHRoZW0gb24geW91
ciB0cmVlLCB0b28/DQo+IER1bm5vLg0KDQpUaGUgZmlyc3QgdHdvIGNvbW1pdHMgaW4gdG9waWMt
cnBjLXdpdGgtdGxzLXVwY2FsbCB3aWxsIGdvDQp0aHJvdWdoIG5ldGRldi4gVGhlIGxhc3QgdGhy
ZWUgY29tbWl0cyBJIGNhbiB0YWtlIHRocm91Z2gNCnRoZSBuZnNkIHRyZWUuIFRoZSByZW1haW5p
bmcgY29tbWl0cyB3aWxsIGdvIHRocm91Z2ggdGhlDQpuZnMgY2xpZW50IHRyZWUuDQoNCklNTyBo
YXZpbmcgdGhlIGxhdGVzdCBQU0sgd29yayBpbmNsdWRlZCB3aWxsIGJlIGdvb2QgZm9yDQphbnlv
bmUgd2FudGluZyBhIGNlbnRyYWwgcGxhY2UgdG8gZ2V0IGFsbCBvZiB0aGlzIHdvcmssIGFuZA0K
aXQgd2lsbCBtYWtlIGl0IGEgbGl0dGxlIGVhc2llciBmb3IgbWUgdG8gdGVzdCBQU0suDQoNCkkn
bSBub3QgcGxhbm5pbmcgdG8gc2VuZCBpdCBhbGwgdGhyb3VnaCBvbmUgdHJlZSB1bmxlc3MgdGhl
DQpvdGhlciB0cmVlIG1haW50YWluZXJzIGFzayBtZSB0by4NCg0KDQo+PiBVc2VyIHNwYWNlIHBh
cnQ6IFRoZSBuZXRsaW5rLXY3IGJyYW5jaCBpbg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL29yYWNs
ZS9rdGxzLXV0aWxzDQo+IEFoLiBUaGVyZSB3YXMgdGhlICdiZWZvcmUnIHBhcnQgb2YgeW91ciBt
YWlsLi4uDQo+IEkndmUgcHVzaGVkIGEgcGF0Y2hzZXQgZm9yIHRoZSAnbmV0bGluaycgYnJhbmNo
LCBjb250YWluaW5nIGZpeGVzDQo+IHRvIGdldCBQU0sgcnVubmluZy4NCj4gV2lsbCBiZSByZWJh
c2luZyB0aGVtIHRvIHY3Lg0KDQoJ4oCiIDhlYWEyM2YgbmV0bGluazogZGUtY29uc3RpZnkgbmxh
X3BvbGljeQ0KDQpJJ20gZHJvcHBpbmcgdGhpcyBvbmUuIE15IGxpYm5sIGhlYWRlcnMgaGF2ZSBh
ICJjb25zdCIsIHNvDQp0aGUgY29tcGlsZXIgY29tcGxhaW50IHlvdSBzZWUgaXMgY2xlYXJseSBk
dWUgdG8gYSBsb2NhbGx5DQphZ2VkIHZlcnNpb24gb2YgbGlibmwuIFRoaXMgY2hhbmdlIHdvdWxk
IGJyZWFrIG15IGJ1aWxkcy4NCg0KDQoJ4oCiIDdkMmEyZWEga3RsczogYWRkICd1c2VfcHNrJyBh
cmd1bWVudCB0byB0bHNoZF9tYWtlX3ByaW9yaXRlc19zdHJpbmcoKQ0KDQpJJ2xsIHJld29yayB0
aGlzIGEgYml0IGFuZCBmb2xkIGl0IGludG8gbmV0bGluay12Ny4NCg0KDQoJ4oCiIDM2M2FkMzcg
bmV0bGluazogUmVzaHVmZmxlIGFyZ3VtZW50IHBhcnNpbmcgaW4gdGxzaGRfZ2VubF92YWxpZF9o
YW5kbGVyKCkNCg0KSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuIFRoZXJlIGlzIG5vIGxvbmdlciBh
biBBQ0NFUFRfU1RBVFVTDQphdHRyaWJ1dGUgLS0gdGhlIHY3IGtlcm5lbCBub3cgcmV0dXJucyBh
biBpbnZhbGlkIG1lc3NhZ2Ugd2l0aA0KYSBub24temVybyBlcnJuby4NCg0KVGhlIHBhdGNoIGRl
c2NyaXB0aW9uIGRvZXMgbm90IGhlbHAgbWUgdW5kZXJzdGFuZCB3aHkgdGhlDQphdHRyaWJ1dGUg
cGFyc2luZyBvcmRlciBtYXR0ZXJzLg0KDQoNCgnigKIgMmU2YjcxYyBuZXRsaW5rOiBObyBrZXkg
aXMgYWx3YXlzIGFuIGVycm9yDQoNCkl0J3Mgbm90IGFuIGVycm9yIGZvciBhbm9ueW1vdXMgaGFu
ZHNoYWtlcy4gVGhpcyBwYXRjaA0KaW50cm9kdWNlcyBhIGxheWVyaW5nIHZpb2xhdGlvbiAtLSB0
aGUgdGxzaGRfZ2VubF9kb25lKCkgY2FsbA0Kc2hvdWxkbid0IHR1cm4gYSAic3VjY2VzcyIgcmVw
bHkgaW50byBhbiBlcnJvciByZXBseSAtLSBpdCdzDQpqb2IgaXMgb25seSB0byBmb3JtIHRoZSBy
ZXBseSBtZXNzYWdlLCBub3QgdG8gZW5mb3JjZSBwb2xpY3kuDQoNCklmIHRoaXMgY29uZGl0aW9u
IG5lZWRzIHRvIGJlIGFuIGVycm9yLCB0aGUgaGFuZHNoYWtlIHNwZWNpZmljDQpjb2RlIG5lZWRz
IHRvIGRlY2lkZSB0aGF0IGJlZm9yZSBnZW5sX2RvbmUgaXMgZXZlciBjYWxsZWQuDQoNCkJ1dCBt
b3JlIHByZWZlcmFibHksIHRoZSBrZXJuZWwgY29uc3VtZXIgZm9yIFBTSyBzaG91bGQgd29yaw0K
bGlrZSB4LjUwOSAoYXMgd2UgZGlzY3Vzc2VkIGxhc3Qgd2VlaykuIFRoZSBjb25zdW1lciBuZWVk
cyB0bw0KZ2V0IHRoZSBET05FIGRvd25jYWxsIGFuZCB0aGVuIGRlY2lkZSB0aGF0LCBzaW5jZSB0
aGVyZSdzIG5vDQpwZWVyIElELCB0aGlzIGlzIGFjdHVhbGx5IG5vdCBhIHVzYWJsZSBUTFMgc2Vz
c2lvbi4gKFRoYXQgd2lsbA0KYmUgdGhlIGNhc2UgZm9yIHguNTA5IGhhbmRzaGFrZXMgd2hlcmUg
dGhlIGNsaWVudCBkaWQgbm90IG9mZmVyDQphIGNlcnRpZmljYXRlLCBidXQgdGhlIHNlcnZlcidz
IHNlY3VyaXR5IHBvbGljeSByZXF1aXJlcyBvbmUpLg0KDQoNCgnigKIgZjBlOTk1NiBzZXJ2ZXI6
IHNldCBwZWVyIGlkIGZvciBQU0sNCgnigKIgNjY1MWE0YSBjbGllbnQ6IHNldCBwZWVyIElEIGZv
ciBQU0sNCg0KSSB0aGluayB5b3UgbWlzdW5kZXJzdGFuZCB3aGF0IHRoZSBzZXNzaW9uX3BlZXJp
ZCBpcy4gSXQncyB0aGUNCnBlZXIgSUQgb2YgdGhlIC9yZW1vdGUvIHBlZXIsIG5vdCB0aGUgbG9j
YWwgcGVlciBJRCB0aGF0IHRoZQ0KcmVtb3RlIGNob3NlLiBUaGlzIGF0dHJpYnV0ZSBoYXMgYmVl
biByZW5hbWVkIGluIHY3IHRvIGJldHRlcg0KcmVmbGVjdCBpdHMgcHVycG9zZS4NCg0KSWYgUFNL
IGNvbnN1bWVycyBuZWVkIHRvIGtub3cgdGhlIGxvY2FsIHBlZXIgSUQgY2hvc2VuIGJ5IHRoZQ0K
cmVtb3RlLCB0aGF0IElNTyBuZWVkcyB0byBiZSBhIHNlcGFyYXRlIG5ldGxpbmsgYXR0cmlidXRl
Lg0KDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
