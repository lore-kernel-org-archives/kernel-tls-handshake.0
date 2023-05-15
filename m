Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4779D4
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 May 2023 12:43:27 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F6TpuN008262
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 May 2023 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=pz13KGkuBKD6WIhpGzMvlXhkg0vBEWb3TVLi7UkIUjw=;
 b=PZXWlFP1OcpmNcVEkFAV0gQXRQo/bNUfhbI5d1zrdFk/s67zyJUTuYLRp7QLJC4fmzW3
 lVaFsD67suKzipUhWmX5MPb1Y2JM+WNl0JdLWLaFxsKRFLzdTsq3A7Ypin+TcEQjKgJW
 LIly4Il+D4tYyHaw1ftY+Vok1rqYdT375wGU8sJ2+mYQ/ryPsJFMoJxvUoQ7Sqn5d5vi
 zgjxdtCCG2O/nfl4eClMhVieEa9DKQvH+ySwFxH6ZuPDHx+fbW/+PpFuVou4LdgoyM6l
 DbTYOXm4tcW2SGu7hgqDTiwmnQL29Rzmof/fsLJ0GeQ4rAwq2NrL0hoUyV9yGJ+8oddX RA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qj2kdfwv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 May 2023 12:43:21 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34FBkCYP036960
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 May 2023 12:43:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3qj108v08s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 May 2023 12:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdyGYlQ5TCjglrbbMKEeh6qTHd5TqTO1cX6PEMXLw51gyb0ESSC3PAzp+YneOqswNBxLAR7heDzwCsceW9IuBmSjOCuRbTMEOvqUb1OnSRtVsPJBz6gDwh7T6wpBjdyz56is4hKF5IAgIoGTH6ECEDvks/57o0/Gcp1fgyAmIRLerVauHXZqVG1+ozp5tOuYHVeMH0ip1rpyC7jri5tQ0CeXmJPl1dGfGvuqqUEIXorylUCZ5t59ZEx01/t/p5N3WgjwpGJWxFMOB7hY/ZmkN1hdyC/vdT3XhTd1Np0kfCpUZofG+oM9hK9VGc2BbJAFVDA6IXL5SfiXwGtRFCp74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz13KGkuBKD6WIhpGzMvlXhkg0vBEWb3TVLi7UkIUjw=;
 b=ZwVweXQYpNZhP6rcCJseLtDHuhIknA1XX+EjjfaVY6GbADILjq1/YPjih2yQRN61z2+cZxirS1m8J1zYMhUtfP8YN70OiNVsPlKjyrNqED9XJ/oHzUn5Cy/gdDvaAsq5HGDaEHbezy3wrC7R4Z6YIGh6rFkDxLCAd2HVvLlSwR+MyhLGTR/Xoo28znr+v5LxiaWs5+Wt/KGHNLFbraonzhdAZXlOcpgvNrrqLxFpNsYYlh1SJhgJ7SspKCXENzNUtbmS6CMDx/ydZzZfDQ3QoceEGXGDmsFM9rZ1fmapMb+ETyKbVaJxI+v3flcNNTanBD9qsPLOc/RdxDLuNdpr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz13KGkuBKD6WIhpGzMvlXhkg0vBEWb3TVLi7UkIUjw=;
 b=awH2Hvd1y+ch/ezi6x0kLodjQ0HleQP5KI0uphikvl6KuDkYsMOwyGeCUODuYz75G+DUtrxvpil7quj5bVHm+YD8toBNAnXu7y1ez5e1+/rt0QEd/Gqsz6yq76+JjP8zYJrTuyL5mMPr6+owxDRr8tEDmrZe4Jx33AUnEBuFP2k=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CO1PR10MB4418.namprd10.prod.outlook.com (2603:10b6:303:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 12:43:17 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 12:43:17 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZhyrSezSoV8aPpUqwhxGh1ojf7Q==
Date: Mon, 15 May 2023 12:43:17 +0000
Message-ID: <98A6938D-CBA0-45F0-A893-9F0BFB73ACBC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CO1PR10MB4418:EE_
x-ms-office365-filtering-correlation-id: 811e37f3-251b-4c86-5e41-08db5541f529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4EuXeo6Gn31cR4Qeu9YNhuBGmI5Hx7OPHkM88EsyEllFlkcwu5QRrtU/2PAW12f1SfbpLwNIPc68o/hoPVbLMFHEamBwsvg98UVvJjHSx/2hvY2xw/Avx8khzMjjW92r7HRXfH6SQBsb4AdeWkxSuYqJIaudsYQBF8VgcaNt6DeRBR7P8/9DavpmbT8tj99Nno8gUerMPwKVoW6JTr620fwml4125qgTxgeMJ8MyWTG1Abn32baX3N4yc2blmocInQbCqtECM5sOh4dN9eAc8Fn/BCA5+R9dqd7Gp++4uNj8A1qGqftR4+IeJrIJt3jpebvN8MpOqXzvwqsE5uJGcrIsP1wobQ/41kCfuMQz29p/TD/PsongPjry8Vl82cQAsjzRV7vVoSgPCWltzJN/213izTt80pVuOzIAHtjXDCaHocJeEeB5ZgG11XRVFmYL1xEPud+8f2FPZ7w2ZAZKP9blJP0swWps0buM/Lv56iIXueZ5a7dhcFvH5bquFqaLnleaEaHoHzv0Q80ttRY3G3kPsdRXl/GzviLobTBwrdLRL7aTrdh1oTYIFHzwVaYjnWi2rmh0ZrGK3pPv75powRPOdHjB7Z1VbA0B8eVaeUKHrdXgF3FPrN4QCOzwN4Xrv3qxDEPVqCl4hXnm87GV2w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(966005)(66446008)(64756008)(66946007)(66476007)(6916009)(66556008)(478600001)(6486002)(76116006)(86362001)(91956017)(316002)(33656002)(36756003)(83380400001)(186003)(26005)(6512007)(2616005)(6506007)(71200400001)(8936002)(5660300002)(8676002)(2906002)(4744005)(122000001)(41300700001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3NMcW1ZaFBNb2tTd3NTTjdHUzhCSXp3OFBKTVpkVTZBU29kUVdmb0NMM0d4?=
 =?utf-8?B?d3I2TzRpRjROTmtrNXlQUVVKdjJMZ1NxOGVzOU9aYVpqb0p5TzhXanFLZkFj?=
 =?utf-8?B?L05GN3B6RTNsNTgraHpQcWNpRXJOZGhscUlNanA1WEk2MU1lenVnczg1M2Zo?=
 =?utf-8?B?WUpKY2R0Qjg1dlhheGNUaC9UQnVvS2R2aFYzRHBVWUhzL0xxc3BXWFNhbFAr?=
 =?utf-8?B?ZEFOMHRSTDM3cmV6VHFFMC9vRDAzbUMzYlZPSk1KdGdacjhORmRscUR0bnJR?=
 =?utf-8?B?VlZmeW1uSHRuWHNRQmZwY0RIMFlTWFpaS3oxL2VwME9rdFQxdERBY3g0TWpl?=
 =?utf-8?B?cEVQSUk5ZEdQUVlMN29qQjNudG1uOEVlanlmTVdCUlBlOVRncmI5K3ZWMVpC?=
 =?utf-8?B?eVRrYTRUS2tkWklyQTUzcFM5QXcrRFpZWTFuLzl5SFRwY0gzcHhMc2Z0eVdr?=
 =?utf-8?B?WXNYNGMyTFlBMTN3NU9XdG5MdExPSng3Y1JEMjFNRzI3SlF3QjB6L1lrZVQx?=
 =?utf-8?B?YzdSaUViSGt3UU45Y3JZajBSaSt3eXVwODFQTFpnaVE0azJSN2phbzBIeE11?=
 =?utf-8?B?WHh6a0pVRCt5NisydGVDU3Rhejd6V09PV1d0cmhSSVp0Y1YwVWRHbDFVUmtN?=
 =?utf-8?B?U2Z6cms0T1lRMXY4bHRiSmY1NkpScFdHOHprNllMdHBlbWI2Qkl6bm15SEhT?=
 =?utf-8?B?Qkd5ZlNVTzIwL293eFZ1dzlEV2NyK0trOVc0N1FGRFB5WnNDSDVILzBZUjRa?=
 =?utf-8?B?WGozenJDR1BVa1ZTUFpCU3hqZnBCZ2ZTOGkvVlp2VENBSnpJY2VVYWg3aEUw?=
 =?utf-8?B?RHN0ZzBpbm5QWXkvSHEvY3k2dE5RMnR1TGlFM3Jrcm94V0o2a0tJa1I3V0lu?=
 =?utf-8?B?c2hieUZiSkdQTFAwVVE0K1FFWW02MllXVEdYOVJVb2dHcEJZS2NKV3d5bThu?=
 =?utf-8?B?eS9YVW5FRk15QXdNZStyWS8rdjhHQU93QTJUTXlYRG0rZnZNOU9DYnVxNm1Y?=
 =?utf-8?B?dStEK3pDdnRvdm5ieVBYNnlNK1hzbS9ZQTRtdnFZUWRHMnZDWEtPcnR6eEJL?=
 =?utf-8?B?YmlobHR2ZXlwTDZPV3dzMnNQQzVFOG1mK1NQcW8zYmQ0OTlZR3c4U2xRNzI1?=
 =?utf-8?B?QTZPNUNkRUtBczF5U09XUHpaeTh6WUpRM0lUV1dYcUZDQ25ncTV6and6Z3FO?=
 =?utf-8?B?TFo3cnVwelpXWFJoKzdZNTJIeTE4ZFFaNkxseVlDMmFVTjVxR1pLTURMdU5S?=
 =?utf-8?B?UnpjbExmVXA1dTdBd3dRcGxKYW1Wb3dyMkJKcDNSdldseFpuZ1MwYWUrOURN?=
 =?utf-8?B?Y2dQYzRiTy9IVjJrU1lUbElKWEE2SFZDQUlSc3BFMUVQM1hlbEk5Tm5lMnZO?=
 =?utf-8?B?MHJ3NmJvdkVkYXk2SFc3V25CNnFOT3crdGRkUmlpR3BRWWJuci9yV3FNSDBa?=
 =?utf-8?B?WlNsVXBpZEU3NTVYTUs4TGYzSE5EMEJjQmtmZHc4bmx3aEZhVDRMS1VTUElO?=
 =?utf-8?B?WjIrbG93eTg0SlUwbWVTVkUzVXY0S09HM3IwcW5sWmZxWlhTZGlZbUlFVTJs?=
 =?utf-8?B?dTZZdnYyb3VqVzhSUWRXNWJZTGN0ZTlnZWZseHQyZExhanNJYTR0ZjNyNnBk?=
 =?utf-8?B?cGVZbDk0ZmRxTXdjMk9LZzlNaGFRR2ZZaUVncTJ3Tk5rVUNIbkZSOFlvS1Zo?=
 =?utf-8?B?ZTl5c2s0ZlNnemRmWjZucEE0enVZWTJjUGdraE0vWjdZeHI4azlXME5rRXQ1?=
 =?utf-8?B?NzVXQzBWWDhOZFp2MThsdElFZC96VDh2ZDlGNUZBOWYwUHdyWEN2Q1IzTGow?=
 =?utf-8?B?cXJOVjhtdWVKQldldVYybGVZWjFkQ2MxdmhhNmNwTGtzVjBRYmk4aU5ickJr?=
 =?utf-8?B?Z01tdURkZC9kOFgvczJkaXp2ZXUyYzJyL1owWHVNemp4eUtUbEw5SUVhOFJz?=
 =?utf-8?B?NWVDZk00bjlpT2hOS3MyUlBFUEpDWHdjajhYd3lBYmw0cW4rRzhrMVpZQVB6?=
 =?utf-8?B?MElKbW80cWM1UTRwN2graStWNkFXR3hkVEVoVGhqY3hBb2I1VzdLa24yekdO?=
 =?utf-8?B?dEZiVHBNQ2V0QzFOUzMvUW9hQzIwN0R3eWs3L1MyMkFDMnNOMElGSXVUUjJi?=
 =?utf-8?B?ZFhBSEFxMVhKZGQ4Mm1KenBETHBKMkprMXpMckJUVmtwZWFrR2I4cGJqMG5o?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9897CB11DECA7C4FB4FE44281EE0EC2C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7CT1kt3wkG6M65Avnj7tXrmLgLQMmWoqyVT+pkAD3pbpkMEFSk8s6aaISP4MCp9G3zHd7/ZrcseEP/y25IqdVAW/gtlgqetfq7W11+POW46vgcLFdnQdT5ieQveqeKZ8zGVeLH5vNIWC3f8u+drkVvB0MBcsZQZFQBbusd/4HdUxvvfR+UvHYh9zgNV1CG8Fzgo6Jl+q55IOZIQyIuyPg03uJzzr1qHZyBVt8E/9N+eUx0AOWqsaKwVr++ia9Y8l2x4048JglOf8UGWbyzslzW+iYQXBK8+At7/M5QQVWI/kUVamEEMW750J/p52cU5eh4LEPzWcfVXf0v3oyglJ9yc37PO+DcPKW63z/+B873zAP7s5TXqHQQ+gjMEW64z5kGI4PgaNvp/4qTc9RbRwaLo9i4mKdJvwUP2rODhYOwH9gS5kzf4d47DpCF2mL3iVqQ3rxdFIfHukkpcd+xWQp4GzYM9td7DGFzJni3sTj1luFrq6Nt6WXOInEm1Rkfk2uDH18fpEZ1iwgqwsZe9BJO75ZZDi6KTDQZvD2E0U6jHolt7p/XXNq6FWVnwzdeBWMqUX8rGsEewn/HPqMKWBTgE1/wPqr8RWrMpxLH9SJPUPiOy/94uvgZlGubPcnwmnWc146E1Gy5qKltdimwfvUGYKmNE3oyD43HjAd+vxoGYX7RDD3iNrY0xH2VIYG5u9pIhcimgmBt/IlLhEmWrKtr3bpAkmnowLfHEFuATNfRTrTLAfDgkUYkuf1Z10iVL3IxqUwR2F+X6aSp9WWVMouw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e37f3-251b-4c86-5e41-08db5541f529
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 12:43:17.7232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76y7Q2+6mONMMa4jAsyB2Z7wNd7aKUZHtdf9Yo0EH7C2NpvN5ydbwONxu1h04p4Z0KV5kjEVp2Bdnqn92cZTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4418
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=866 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150110
X-Proofpoint-GUID: RZWyEcCh_LuPsCA5975ef5bX1WPdNmmN
X-Proofpoint-ORIG-GUID: RZWyEcCh_LuPsCA5975ef5bX1WPdNmmN

SGVyZSdzIHlvdXIgZnJpZW5kbHkgcmVtaW5kZXIgdGhhdCB0aGUgaW4ta2VybmVsIFRMUyB0YXNr
IGZvcmNlDQptZWV0aW5nIHdpbGwgYmUgaGVsZCB0b21vcnJvdywgVHVlc2RheSwgTWF5IDE2IGF0
IDEwOjMwDQpVUy9FYXN0ZXJuLiBUaGUgWm9vbSBjby1vcmRpbmF0ZXMgYXJlOg0KDQpTaW5nbGUg
Y2xpY2sgVVJMIHRvIGpvaW4gWm9vbTogaHR0cHM6Ly9vcmFjbGUuem9vbS51cy9qLzk3NDU1Mzgx
MjYzP3B3ZD1SMFJ2WTBSUlJuSkdaVVZKYjFkTUsyTkJkVVJYWnowOQ0KDQpNZWV0aW5nIElEOiA5
NzQgNTUzOCAxMjYzDQpQYXNzd29yZDogODY4NzU3MjQNCg0KUG9zc2libGUgYWdlbmRhIHRvcGlj
cyBpbmNsdWRlOg0KICAg4oCiIGt0bHMtdXRpbHMgMC45IHByZS1yZWxlYXNlIHBhcnR5DQogICDi
gKIgUmVwb3J0IG91dCBmcm9tIHRoZSBMU0YgU3VtbWl0DQogICDigKIgTkZTIGNsaWVudCBuZXh0
IHN0ZXBzDQoNCkJyaW5nIHlvdXIgZmF2b3JpdGUgaG90IChvciBhZHVsdCkgYmV2ZXJhZ2UuDQoN
Ci0tDQpDaHVjayBMZXZlcg0KDQoNCg==
