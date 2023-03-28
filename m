Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783408BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:06:02 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SExuxP006127;
	Tue, 28 Mar 2023 15:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=PPW0QsDriBL4cMgyJUKJy/ERLwfCwUl7QJT9VNDndPQ=;
 b=oq8kQuJnOGYxX5YQJA56ep03LUirNYjf4+rDdisbTNAkl6ysfe2B9CqYxblspC3RHFAy
 jhA1pvRl2uM2Z60DjzY9N//BudzQNesjzGKB8EPBuZA5yTVM/n2KvjpWGuXxUiVrwfd2
 iPiersoO/zz/WoKBIM7lTJcQRM2GzPTjSaJZVE63wRWCmD5KxuEDZPrmUsWCvnt3MFB0
 MmqKiQO1qQoNS2Xe26lUawR8vFy38YgDxU/hedcbsZUajs06m6kGcAJPjbQfN49ngTIz
 0csPqFKU0tSo8NVLFQyg7vDKq2fTP1vp+8bCCGaQ43/i+fAjHvf4AqW63nbUg7LGoOCo pw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm2fx818p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 15:05:55 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SE6H7s009307;
	Tue, 28 Mar 2023 15:05:54 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdd1t72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 15:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmYmNapU2ws+OYy+FqbHx+Wudj4JtFTN9W0nXOy65XQw8/3JoRzWnsgSGxx3JRntV8HfGl7MBxlBL/ngB4CkTC8KOwtTpL1ABatSV0+44XSoIkz2qM/vVHTRtVyMbJO8oz4GpT8KgyYa76ooJUY/AApfi9QirKJnMFLPHX+GRs5uCsw6qn5xqi8MlkbAWMUY3lkixbD3quHGZnqRnrc0Sx9ugjttTI5t77GhzHIJ2ZrpKVW/eNGnzUhC7lKRiJ3zlz7Watoro4NgUnYlzwTvaOeCNqt2s+mgipcmfxHoRUMcAjqiby9FLq3BAaBm45kXL0vClGWK893owzExyIQfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPW0QsDriBL4cMgyJUKJy/ERLwfCwUl7QJT9VNDndPQ=;
 b=RHaEz/MV/NRerg+ZRxjDOX1BwitBnTQzPlsERZshDIdPSb87NYIK/hBdl8qQm68Bb6MImil0rUWCkbXSWUokeFjvcJ7sOUBKEm6nc2e5OWmH1ICi9sf6xc/kQKTyg21B59Z1X3jhojCRBfLoLzw7RTy0aGGPqLU9aRS6A7re+/WT/9V/e75IwdeAWcE0C2ocn2IvAX4po5iALSn9GV/95uDV5ip9gtODieuOBosQMsl/NK+ZlyNdRFMpwjJNL3F5iFxzmuYdjbkvF6VlEkLwMxDLvBvatpOd0hg+u4l02kkrn4wVhzB4vag6Kc/+3nd+raksqMOnCYGyyDh2Od98Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPW0QsDriBL4cMgyJUKJy/ERLwfCwUl7QJT9VNDndPQ=;
 b=vqyICfKBj3vR7F1tdcvOT98zJm2QHCc6bl8hFq68uWg0eCnl0GcMGpJ9/561CskSE0krEWC275GiTLxHZj49KEbf9szlFeHgVXT0B2H28f+i1DCQ4laDg4HYPQ5JK0dckJgZM0TMxwVPdqYbg9MM1cpm7Als7vvqP3InMwHAzvE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CO1PR10MB4641.namprd10.prod.outlook.com (2603:10b6:303:6d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:05:51 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:05:51 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Olga Kornievskaia <aglo@umich.edu>,
        "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: 
 AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QJjIAgAATTgCAAAb7gIAAAraAgAABsoCAAAUXAIAAALUA
Date: Tue, 28 Mar 2023 15:05:51 +0000
Message-ID: <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
 <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
In-Reply-To: <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CO1PR10MB4641:EE_
x-ms-office365-filtering-correlation-id: 487f731b-2a12-403a-da6a-08db2f9debbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 laAOJY+icU11Nq28k+awCcRy4lo+lUwkWWjXkUBw/9Sdav27sLNX/mUcjNDrfDkG6wW6q8GXwIogoq1L6ZbtDJNMKIbR0agCbauPxw6KeYkGsZEclithOqT2vxwFmcoTN0ZfaZP2+PKweH44IDscEwoZojjnFua2l2UzNT0re1b/q88XiUT8pGK3tlSzKMIpAekju4Te1ZfPaHMftPRcFVKl0ou9TG70w4ZHsirO2U1/HGLkkb7EaDNrFvybNL37bFx8HfgOeqNA4aHyYzLI7nCHQHPBtWO4vgNv4sF+E/ZYleeQXK/K0fusIST0EmXqUAVl9dzg3YCDd+Jwp8LPJc2Zl7cHhrN2/8s8W99uNZ1h8qBSmXh6L0LkUnqrzT0j2Yk4HZxraKv2dUMdC8jXh/X90WHz98aHpLxWR8tNHwdC7gOcDnnFxtA/Rn3xD510rkcZE6O4ykkF4EeY4raqLC3A34pcGXAKSRZCDyt19cH6YhotJ3dmIMuPbdu21AdZctTusupjm/nlUj1qmSgbY1BWWsgeWgtoscJmbk80i+mQKwgFbbVQ04jZQuLDpdyGJyw36IYxLgRMNOzHzkB8XxKv7oHrfEVZ7iLUuROwjh0JaY/GRTiFk8v8Ua3wW8QvXry1MqLJoigtXAUcHlm5XA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(66899021)(36756003)(86362001)(33656002)(316002)(83380400001)(54906003)(41300700001)(76116006)(64756008)(66946007)(4326008)(66556008)(66476007)(6916009)(8676002)(66446008)(6506007)(6486002)(6512007)(53546011)(26005)(2616005)(186003)(71200400001)(478600001)(91956017)(38070700005)(122000001)(2906002)(8936002)(5660300002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2xjZW43RHNoc1pYOXNMeitaMjkvK0RDM0lxc2pkQlZyYTNQc2ZvOXo1WFRx?=
 =?utf-8?B?VC9GdWxJSUhUNEFHWlVLN0VYZGQxVkhhcDlaVWN6cExTNmV1TTdac3gyUU13?=
 =?utf-8?B?Z3FhZEdPUy9wSGxIdTVhNS95eWlkeU53UGMxeWZCR3lmaDNIN3FTRHNoMkho?=
 =?utf-8?B?S2JFb1dHWEFhUDBOakdwdG04NVlTNy9LTUsrd3BiWXliMkptUVhNVElaODZk?=
 =?utf-8?B?STVkU2ltL0cxdG5EMHVvMDUzYmdlQUdTNmp0M3UvR0JGWlNNenc1NUlZVndv?=
 =?utf-8?B?ajZJSlNZODRTbjJ1dDJmVlQ1MDVRSVhSQ2pkcnBWckR2ZXl0cG8wSUtLbEJo?=
 =?utf-8?B?ci9lTnhNb3ZlcjFPalRTMlVUNStvNVZwNWtTL2UydjRuS0tZU1N2UzNZOXFQ?=
 =?utf-8?B?b3o4ZytybnRFbEhtMTJOaTFEb2lXUm0rNTQrOWZPZlY1YThxT2lxeXllejM2?=
 =?utf-8?B?MnpZWGt6Ykxsb3hrUXpUdCtwdlE4VzlFQjRoZzYyekxjQVprdGYrS2hMQjJB?=
 =?utf-8?B?UFRzREhLU0gwMjArZXhhb0cveUFTcVJMcnRqUzR4V05iZXR1OHRLNmwvVHhP?=
 =?utf-8?B?WlN2ZjVCS0YwbndWYlEyalNkd1RiSUowbCs1S2hOWkF4N3NsTURCdDdkVzhx?=
 =?utf-8?B?bVRnd1luaE5XeWNOTnB6b2dQclNXSE5pRTZaeFA2S2syTk1DSUxxNWQ5RWJr?=
 =?utf-8?B?WEhzV3RJM1JCbzV1VHRzTmtZL3R3bGVqcTR3VVZzaFpMZlJDaE1LOUdRQlpQ?=
 =?utf-8?B?L3diaW5mZ1FQN2c0T1RqSzgwcldLRTZWK3JyMlhHenpPMy9XY252ZS9uL3BQ?=
 =?utf-8?B?SW1YS3ZGOTduaHpQditwbmJiNWd3Y2JCaDJEWWdvcjZLbzdCckk3d28vZW12?=
 =?utf-8?B?WnQxNU85bHFTbmh1a3N6dlNTWGRweUFnTnpwa1Njc09TRHRWRkYrcXFXcDN3?=
 =?utf-8?B?SHloeUE4YVhiY1laQnF0MUJodUlYZXZmai9rdllDRHJ6QmJzYVc3V0JBaW81?=
 =?utf-8?B?N0laU1RVV1Bib3NDOHh2VDg5T2xGVWdqZXNIcldwTVJiMzl0NEJDL0JKdEZM?=
 =?utf-8?B?eVEvaUFZMFFOUnFqQ2pwVFZ6cmp5b1lxUXBCQ3JsRWdrK1l4ZmN5ZG9obk9Q?=
 =?utf-8?B?SkFYYzc0d1VIcTZObS9EZFRLQWVrUTA1ZWxVMFZaYVhNZndUdFhVVm1QTFFv?=
 =?utf-8?B?N0dheUxZSFJtcllQTkswQXUwYllyNkUybGpnZDA3TGZtK295TFlYZm5VekJp?=
 =?utf-8?B?eXdlekxHYnpvMHg3bklLeW5HMU1nbFJ0dEJNREFudTR3WVE3RFFMd2Nzb1hR?=
 =?utf-8?B?dzJzQkZ4TmtwYzRoei9hdHEvUERydWQxNmo2YTZRZGI0U2RQTHFQSTIrL1Vk?=
 =?utf-8?B?MkpDN29RV0QvNkN3Q3c0Tm1tRmJaU0ozQ2FYK2xGQzkzTEJ4dC93RSsvK3FL?=
 =?utf-8?B?TVlUZVN1VkJJTWhpcjhUUW04RGowNy8rc3Bab3BrZFJuSnQzZXA4TlZYL3NP?=
 =?utf-8?B?cTBMWDhqMmFOVHRTaVRNendjWVBTR3lzZk02SVlzK3VBKzBqL1J2eWRIRmYx?=
 =?utf-8?B?THNkMmVSM3dPTUlLT0g3R3MvVUlZMjdnZ0c4YlY4V3lGSzNDaEM3U3dCK0pp?=
 =?utf-8?B?WDdBNGZUak5mZk1GRjFoQzZMbHNpNzNIWEx0ekFXNXlxMFdrWXBpMGZBQzk2?=
 =?utf-8?B?K1B3L1FHVHE5VTJ1Um9LbEpIR3Bnck5nNVJMbEZNdUdvR3lzRmhMMEdVeXNo?=
 =?utf-8?B?ZUp4eTBwUzVvTVVjbmhWUHBkRG9nNXQ0K2drdjJvVUNCMi9BS2VicTFlODVh?=
 =?utf-8?B?YlRoS2xJczhWeGtpVzdEeUg2bXBuNGV4OHhYTnhjQU1UMjRBUFVkaGN2blBS?=
 =?utf-8?B?YmZQbUp0Z3Y2d0MzZWZJbjhvODJkeWE5NmVrTFp0R0lqMGo0YUo3eFdtSVpt?=
 =?utf-8?B?S3JzNDZ1ZnFnNXNHbGJRTUpsK0xGQU8zL1dxQkNTdHdxSjZoQ09vdnBQNk9L?=
 =?utf-8?B?cWdWYkt2U2lHdVRrNjFKVkg2NDhrQy9yTzFpVjV6MGM4QzNuNG5oRjI3cG85?=
 =?utf-8?B?TDhCV3RWWkxqOEQ2KzlsRDQxNXQ5aVdCM3RkOGFlU3BIWVJrV25Mc1c4dEdN?=
 =?utf-8?B?VFNDT2VDUDAxeE5KNzhQMW4rNHBTRjg1UTF0RTdaM0toTXJ6eldXZ2RmTzV5?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B0522D6B001DC42A0B1AD3BC23931E6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	sU+RYhTkcUKmkUtIqXEQSbTmSraV0Jd2vyCX8YRx4bwOuP/Wrg22aliTkpe6bCxCeYR4v+MDDlciEfeDCtHTFdXM/pnsjVmT//WWfRkNAkkFzaLmOijp2N2vyPgAlZRxtJvJpCMAiY4C1kKivcclXaHHFxxfmBNnpF03mFYgIK657X5Mf7FqXllOp38drgtjGq70aWQ0QZ4QlW0H1LhyhUknUqntO6Efp29WrV71f6ehxTBzzJaJvPljUVnHhe+7dARFqTh+s0D77Wt0LTloMPLbJVzwJpbyqaNKOAbhRLc3nec7cFuK0XK/l56C8fU8e5NahOhY3KjW9P+aUyekVPcwaO48L2RzE25y2pd6uQn/EEzIe+wiqyqB38kuF7mFn8H2bD0SKxJlmH0aXdjR8owOpiiqjOmoBIT+yWM2WQ3u+sGUy9KjWNwrEu7xBNLdfy6wXUobabCjnr69cf16BpzcQrzWoD4lTEvj8WYQzkoprQAQIAFxN/GtlAkUdwy/9uWAKuquPQLor85Bs+/wLfnPB+eowwfVGRwzGyTuIjE0oEFDBzq6qKjDsSign944YUozVuKD1/lLlyDIaD4cv4VvdisZ2egP9ZJAmqk6iUROaRfv8jQvhlHOPtb71jgRfWTrNS3KWgF/ywyUOt6WQdWZx70qMnKGEStY4i+5Ew/udBnq6kFL1F1bV/yGyE5yNFXhDz6j+6mMozhgjO1vF20v8N+wJMD3IYK/Ct9gQc0smjtKtS3KKr7wR1csjggNru1ugVrFUSXMXupEl09+3pmbFh3aSF6g+8yUPg3vbOHDh0N3p97Ei8LD5H0Fow9R
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487f731b-2a12-403a-da6a-08db2f9debbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:05:51.3964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG9ZUjOyfNT10fAiVnDXjpn+dk8EQNTvE8PaO5OIKnDDVCAcpf//njUr+WJOCIwJr19QlZKZS2B7eOoZRigAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4641
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280118
X-Proofpoint-ORIG-GUID: WcT13yS2xwM43R5EKNLGM5e6nrazwthK
X-Proofpoint-GUID: WcT13yS2xwM43R5EKNLGM5e6nrazwthK

DQoNCj4gT24gTWFyIDI4LCAyMDIzLCBhdCAxMTowMyBBTSwgSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDIwMjMtMDMtMjggYXQgMTQ6NDUgKzAw
MDAsIENodWNrIExldmVyIElJSSB3cm90ZToNCj4+IA0KPj4+IE9uIE1hciAyOCwgMjAyMywgYXQg
MTA6MzkgQU0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gT24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMTA6MjnigK9BTSBKZWZmIExheXRvbiA8amxh
eXRvbkBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEl0J3MgdHJ1ZSB0aGF0IGl0IGlz
IGxlc3Mgc2VjdXJlIHRoYW4gaGF2aW5nIGZ1bGwgY2hhaW4tb2YtdHJ1c3QsIGJ1dA0KPj4+PiB0
aGlzIHNlZW1zIGxpa2UgYSBjYXNlIG9mICJwZXJmZWN0IGJlaW5nIHRoZSBlbmVteSBvZiBnb29k
Ii4gSWYgd2UgZG9uJ3QNCj4+Pj4gYWxsb3cgZm9yIHNlbGYtc2lnbmVkIGNlcnRpZmljYXRlcywg
dGhlbiB3ZSd2ZSBjcmVhdGVkIGEgcmF0aGVyIGxhcmdlDQo+Pj4+IGh1cmRsZSBmb3IgYW55b25l
IHdobyB3YW50cyB0byBkZXBsb3kgdGhpcy4NCj4+Pj4gDQo+Pj4+IE9uZSB0aGluZyB3ZSBjb3Vs
ZCBkbyBpcyByZWluc3RhdGUgdGhlIHRsc2hkIG9wdGlvbiwgYnV0IHN0aWxsIGFsbG93IGl0DQo+
Pj4+IHRvIGNoZWNrIHRoZSBzaWduYXR1cmUuIFRoZW4gaXQgY291bGQgbG9nIHNvbWV0aGluZyBp
ZiB0aGF0IGNoZWNrIGZhaWxzDQo+Pj4+IGJ1dCBzdGlsbCBhbGxvdyB0aGUgY29ubmVjdGlvbi4N
Cj4+Pj4gDQo+Pj4+IFdlIHNob3VsZCBvZiBjb3Vyc2UgZG9jdW1lbnQgd2h5IHVzaW5nIHRoYXQg
b3B0aW9uIGlzIG5vdCBpZGVhbCwgYnV0DQo+Pj4+IHJpcHBpbmcgaXQgb3V0IGVudGlyZWx5IHNl
ZW1zIHJhdGhlciBkcmFjb25pYW4uIFRoYXQncyBqdXN0IGdvaW5nIHRvDQo+Pj4+IGRyaXZlIHBl
b3BsZSB0byBub3QgdXNlIFRMUyBhdCBhbGwgYmVjYXVzZSBvZiB0aGUgaGFzc2xlIGZhY3Rvci4N
Cj4+PiANCj4+PiBJIHdvdWxkIGFyZ3VlIHRoYXQgIm5vIHZlcmlmaWNhdGlvbiIgb3B0aW9uIHNo
b3VsZCBvbmx5IGJlIGFsbG93ZWQgaW4NCj4+PiBzb21lIGV4dHJlbWUgY2FzZXMuIExpa2Ugc2F5
IGhhdmluZyBhbiBvcHRpb24gdGhhdCBleHBsaWNpdGx5IHNheXMNCj4+PiBpdCdzIHJ1bm5pbmcg
aW4gYSBkZWJ1ZyBtb2RlIGFuZCBzYXkgb24gdGhlIGZvcmVncm91bmQgb25seSAoLWQgLWYNCj4+
PiAtLW5vdmVyaWZ5KS4gSGF2aW5nIHN1Y2ggb3B0aW9ucyBtaWdodCBjbGVhcmx5IHN0YXRlIHRo
ZSBpbnRlbnQgaXMgdG8NCj4+PiBkZWJ1ZyBvbmx5IGFuZCBub3QgcnVuIGZvciBhbnkgdXNlciB1
c2FnZS4NCj4+PiANCj4+PiBJIGFsc28gZG9uJ3Qgc2VlIGEgcmVhbCByZWFzb24gZm9yICJub3Zl
cmlmeSIgb3B0aW9uIGV4Y2VwdCB0byByZW1vdmUNCj4+PiBmcnVzdHJhdGlvbnMgZHVyaW5nIHRo
ZSBzZXR1cC4NCj4+IA0KPj4gSSBtaWdodCBwdXQgaXQgdGhpcyB3YXk6IHdlIGRvbid0IHdhbnQg
dG8gaGF2ZSBjdXN0b21lcnMgaW5zdGFsbGluZw0KPj4gc29tZXRoaW5nIG9uIHRoZWlyIGNsaWVu
dHMgd2hvc2Ugb3V0LW9mLXRoZS1zaHJpbmt3cmFwIGNvbmZpZ3VyYXRpb24NCj4+IGlzIGxlc3Mg
dGhhbiBzZWN1cmUuICJubyB2ZXJpZmljYXRpb24iIGlzIGxlc3MgdGhhbiBzZWN1cmUuDQo+PiAN
Cj4+IE15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gaGF2ZSBzb21lIGtpbmQgb2Ygd2F5IHRvIGdl
dCBzZWxmLXNpZ25lZA0KPj4gY2VydHMgd29ya2luZyB3aXRoIG5vIGNsaWVudC1zaWRlIGNvbmZp
Z3VyYXRpb24gbmVlZGVkLiBJZiB0aGUNCj4+IGNsaWVudCBtb3VudHMgd2l0aCAieHBydHNlYz10
bHMiIGl0IHNob3VsZCB3b3JrLiBEbyB3ZSBuZWVkIHRvDQo+PiBwbHVtYiB0aGF0IGludG8gb3Vy
IGhhbmRzaGFrZSB1cGNhbGwgYW5kIG1ha2UgImFub255bW91cyINCj4+IGhhbmRzaGFrZXMgZXhw
bGljaXRseSBhbGxvdyB1bnJlY29nbml6ZWQgc2lnbmVycz8NCj4+IA0KPiANCj4gU2luY2UgdGhl
IGNsaWVudCBpcyB0aGUgc2lkZSB0aGF0J3MgcmVqZWN0aW5nIHRoaW5ncywgaGF2aW5nIGEgbW91
bnQNCj4gb3B0aW9uIHRoYXQgYWxsb3dzIHlvdSB0byByZWxheCB0aGF0IGNoZWNrIHNlZW1zIGxp
a2UgdGhlIHJpZ2h0DQo+IGFwcHJvYWNoLg0KPiANCj4gSG93IGFib3V0IGEgbmV3IHhwcnRzZWM9
IG9wdGlvbj8gTWF5YmUgInhwcnRzZWM9bnZ0bHMiIChubyB2ZXJpZnkgVExTKT8NCj4gVGhhdCB3
b3VsZCBhbGxvdyB0aGluZ3MgdG8gd29yayBvdXQgb2YgdGhlIGJveCwgYnV0IHN0aWxsIGxlYXZl
DQo+IHhwcnRzZWM9dGxzIGFzIHRoZSBtb3JlIHNlY3VyZSBtZXRob2QuDQoNCk5haC4geHBydHNl
Yz10bHMgaXMgc3VwcG9zZWQgdG8gYmUgbGVzcyBzZWN1cmU6IG5vIGF1dGhlbnRpY2F0aW9uLA0K
anVzdCBlbmNyeXB0aW9uLiBUaGUgc2VjdXJlIG1ldGhvZCBpcyB4cHJ0c2VjPW10bHMuDQoNCklN
TyB4cHJ0c2VjPXRscyBuZWVkcyB0byBza2lwIHRoZSBzaWduZXIgY2hlY2suIEkgdGhpbmsgSSBj
YW4gbWFrZQ0KdGxzaGQgZG8gdGhhdC4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
