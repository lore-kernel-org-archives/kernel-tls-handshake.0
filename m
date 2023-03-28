Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B88474
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:45:20 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SEdV3n031260;
	Tue, 28 Mar 2023 14:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cApkdwPGft5Lht4PiPVdY68bS+8U+8x9YjG/vpZt1s8=;
 b=Zu2nDC4tSjViTqtM810YiSgIpsGbm2/xyWXq/OjSYUc+1iVWJ/GBGukJ2EkPFWQdh0m5
 qDcWI6G2JNMrv0r05EN+SXX3FUav+atZMHg/bZi0PPwvseoRFYI5KWZ/sajI9UlmHt60
 hwxL0K3VLd1vEKkRNRf1Kut35FPOSyNSyKlJUJN1VCEHp33o52Ozri5NkhHYd4ZIqSfa
 unnpFBEOHfjqZ5mKynGZgQSXiOiooNpb9HtKLPrjm//9RtBBLb3HRdLPWvkS+eOm0UNN
 TgkHqASTAJXKVjdE4l7dKJdO+JThUD9Za8U+yn35pD6wdUHcBw9KwnMOyTk5HQi6FMpj 3Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm26k81nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:45:10 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SDkuEm005447;
	Tue, 28 Mar 2023 14:45:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd6gjvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 14:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpJwFI4VKr+2v38Y6RmUc4jNDTCeJt9K+JNt/ovfDHrUYf9MpBOFFmX1fztY2vcFnE+VlXX/dhVzL8PdFRMk+Pfy/mC0a3GfkgY4hFqsGQwzeeXM8IeEw+cIMfEBuSsEIuLFWyNNSPV7Swg3oPXBqCTYmYgYOYLwJuB3QPli+4XVaEM5IEbru7qMtmY6hQTyAnCQ+i7p5WDzfiBPngi2xZjpYfa4S2pQHCc+c8cqGnHuLRYB89XoeDG7vNKc/T3q2Q/9wzYy5iDsCneJhvuvKueO0sdLGIEQ54HW0rzv3HopdjNjWijj1VbhLEC1vLq4gqTeVOsAWUb43w3j9xggZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cApkdwPGft5Lht4PiPVdY68bS+8U+8x9YjG/vpZt1s8=;
 b=NxUMrz3F6TJ0XnEMWDFn9is5gZ8cnOPssD7WcCZkOQ489jj/n30kTVCBj+z2Bz8ybbVCnGutWRzzInpTiDnEs4RZJVm81oBYobwPgNtK6TpBAjoRhQ7pfYeNA/2/uY13i1CkeEyzLPLRlQc8hDzMZT4rTmiDrPXyJFL4XKlKg8t5lrVDdxZSmKAGFSsN8DJFs9eyYWsm+liF/a9vlUMUTcEHSX3SGAx/41mtiXd+h1kgoy6DrhjAIgKx2zLPW4n6zWhhFvsItPgoiomf2dfhkeIA+jREbqxBtkNPY/vM+hB3JrvOpjBmD58x/kgAzNq3RGWwcqsdF8oRccNFlpurfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cApkdwPGft5Lht4PiPVdY68bS+8U+8x9YjG/vpZt1s8=;
 b=KG28pa/K5aUJmjQW1tVdkVS+M8XEELS/AbOtrrxUu84cPJcOat++KK62HH5SqH2whdgP3Vwgcts1cweYXMEbUQ+pTSxAzcfUnOIO0NlC9jDMVCgw7yzfBpTbU1Y00cuk1Ifg/iZkWFAQpZGdmaNLnGhoUecUb8W69riIC8EufUo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH2PR10MB4295.namprd10.prod.outlook.com (2603:10b6:610:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 14:45:06 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 14:45:06 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: Jeff Layton <jlayton@kernel.org>,
        "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QJjIAgAATTgCAAAb7gIAAAraAgAABsoA=
Date: Tue, 28 Mar 2023 14:45:06 +0000
Message-ID: <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH2PR10MB4295:EE_
x-ms-office365-filtering-correlation-id: 845845a3-6bc8-4314-f447-08db2f9b057b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uJPGv1VEUJkRTKzjMgR3c64KF0Faq/ebZYou7/DvRuov25HbYeNqum8n9roOtI6U1Feo3lj6p7B38hQnYd/ZWQJtiSpHLtFhP9rUjQ68evCa4h2ploiyIW41apf6ngYCjTHpNhd7EIKpO9inG3NXHSrKc0s8pGIeonf02DqoQkcD23O7raCzbHxZjDOpDapXYgN5yxONjW9st15lTSFYptkrVAWbgOhChQ1+gLqPfGAEDS4INTy54SFszfgxDdR0kYC3SoQ1VL3rvmqwc8INCVfn0rcC/xEZWpslmFun0HodMPB67BPjlsjCB9jGrPrPFJNS7bxX5FMbAr63D8+NgOxVVOnn46GIS6VoyZ6ccNJ8xQ+nCEvdaOjQMTovU+qjK0f7tHT/K3cws/GarnfYUeoA4U6mQvetjsFkOpJwjQicrKqoyvxjRXXjN19Rk0xJ5IQ5EG8/2pcQumPht2aZNrQ2RvW0yG1M8FIIPyMZgUroC6KInuYlwrIJ2ygcJJDN7DcdIHDYbwaTlxVaJgkehfhbgsWprH7oo6lvnMIltGI1BVpnYqKKUJdM8clTdJ7qKTYfAC026D6iDmFaIFwnAq0r4TaW2HJoSaRI0imQQsG/8lsNck1MNGfuzJTfd/PwCh7N12CVnfHSJTVdZNQj6w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(6916009)(4326008)(66899021)(71200400001)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(316002)(478600001)(54906003)(8676002)(38100700002)(2906002)(186003)(53546011)(6506007)(6512007)(33656002)(2616005)(83380400001)(26005)(36756003)(38070700005)(122000001)(86362001)(5660300002)(41300700001)(6486002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aTN3UDdsQ3JsMzVSWHFWbHdpYlRKTmpnTWg5WElHcXByYTBXUGtiSFNFbVNP?=
 =?utf-8?B?NUFYdjVHK244NWhUczhNRGZYWWlObHc0UnQ1ekx0V2NzSU5TdER4OWpMRkJF?=
 =?utf-8?B?anRtZGxuanZsekI4TWJnbTJiQVRlZS83L3EwOUVwZENoaTB2dXNUaFBKN2Nj?=
 =?utf-8?B?UG12QUpzc1g4dTRKa0FVRktwVkE4QWsvSXowMjRCcWNPd0xLVkhEY05jRkdQ?=
 =?utf-8?B?RjRBUTYySUpFWTZCNFF2blI1N1VGS2ZuM3dpc3FDb215NWd6Wm9OUjltRUVB?=
 =?utf-8?B?N2tkMTF6WE12VG5VV0FKSEVZc0ttNUc2QmlYVDc1N0hGMlIraGVHQ3R4bml5?=
 =?utf-8?B?ZGZjSUs1VnFsODBaY0tibVFFY0hyWHVpMUYxRjY4VXdyRm5NT3BlQU5FYzl4?=
 =?utf-8?B?c3kxQktRdUlNQ3ZjVVlDZ3llMU5sYlo2ODlEL3RSaHZMY1Q4RVRFM0dtZzJL?=
 =?utf-8?B?S0tkOFNFRE5yblZqOEV2a1llWFlNaFR3SU45SDE3ZThMRjV1M3NBVzZsRVU5?=
 =?utf-8?B?eHgwaFFIUVNkL3E2ck5uT1ZvSUJKa0Z4Q2p1WWg1VXJ0WFdiamtTWVdYU0U1?=
 =?utf-8?B?UDl2NjRhV3o5Tk85TEUrdEgrb1lSUHBveS9sM0srSjUxbkkrSTd0RjhudjNC?=
 =?utf-8?B?NEQvSVdGUWx6S2ZaMEZQUmc0WkxuNFpXK0lkRlNUSHNCTDIrazdjMXZ4SVpH?=
 =?utf-8?B?WWxyVVY1S3B5aUZnNVZROEtPSXNjbncvdlJTQklOZ0JvbXlLUjFwYkQ0VFZW?=
 =?utf-8?B?VGgweC9vRDNERFdCYmJDMVJvUUl2c1B0dTNtS1VQV0I3TmdDSDljQXZ4dmE2?=
 =?utf-8?B?ZEpTdVhaZk1BZGYxZEtaMmw1VzFwbzc5OFRaVjFzK2d0cEtmOENmS05NNFA3?=
 =?utf-8?B?SnRHazlSa1VaRkZJQnRXWFZpWUY4anRSTW80a0ZYYXpLeGpmMm5hZ3lzejJx?=
 =?utf-8?B?QVUveWVmQmNGVlhBOXhUSzR6Q3VBNG1wSHYvdG1FUU44STdDcTZqTG81TkpT?=
 =?utf-8?B?NEw5cXNUdUlmMlFCYVdxRlU5YkkwTE1ianFnQnByQXVxQjREQ3ZDazB0c0hs?=
 =?utf-8?B?WDhZMy9yUjR3V1lyL3ZxMCtvdG5qZ1lBZ2kvNXJsMEkxa1E1dnlJRGszSUhj?=
 =?utf-8?B?V25Gemx4dE9RM3dxaExScDN1aE9YL05GMi9aN2w2RHRvTWNWZUxrYVU3cERv?=
 =?utf-8?B?a3hnL1Z5b0t3ekdydVQ2UFlGMy9FYVlLaTVpQmg5alNsdWNlb0tXMUloamJB?=
 =?utf-8?B?OVZveUNTSEQ1YVA2QTNwNGNrcXZXZFYxc2tFODVXVU1iV1NadFpyRmZVdkRW?=
 =?utf-8?B?RVRna1lKek04c0FxMjltOXpUMXVtdGdxZVE3WDFQcTk4S3dOSEp3QlA5djNi?=
 =?utf-8?B?TE56dDBydFRQMEtpREN6UEhDRDMrUTBCa0tGM1lKL2F5WEx3QXdpQmJPUDly?=
 =?utf-8?B?TEFDYkdKMlc3QVMxMDV3b2llb0pzb0laZkFpZHNPVmlob3BtK2syeGFmcFgr?=
 =?utf-8?B?QWkwYXJKSjU1MGhqdkR1Z3F2MWVMUkpzWXhJU2NjWXFEcWZjSGpCaFJIb3FR?=
 =?utf-8?B?S240S1lqREdSUTR0WE9LRy9RUjl0TVlXbEJPaDdLZFZoRWFDdlQ1S1lnSDFF?=
 =?utf-8?B?TTJPeStzRXBJN0xCVk9KQnREaGxtZU1ocWF0WTBOMy9mRkJSN1pZUHRockFy?=
 =?utf-8?B?VHRadWMxSjIwKzhwTjVHLzU2Mmd6SXdjWUJXR3ZYTENpaWYrcEhrSjMvT1hF?=
 =?utf-8?B?cFVIM2dzTXNPbVk1elN6NlkzRHlvblk3WmltOERjQmRyNThMeHl4N0hqdlFS?=
 =?utf-8?B?VjlhVjJqQVFhcSs3K01LK0w2bFZEbC90L1Y0RjdreDlZVEVpWlhMaSswa3A3?=
 =?utf-8?B?eUlZT2NUVTkxRk5XcmN1NCttODZMREVOWjFEVkNobDBvOUhQZENnR2ZscHlL?=
 =?utf-8?B?M04yc0JubERZL2dKUFk5N3Uzck1hdldNLzljaHVTY0wyUXVoR2YxL1pQaHYw?=
 =?utf-8?B?WGF4QlczZjNBTzlYUG9ZSU1Fc1NiV1FBcUJmVjRnWUs1SGM4NURSbndDdm96?=
 =?utf-8?B?aWRxUDRBWFpoOHFLUVpKWG4rcUNtVVhLczRIeDF6eTl0cXhZMlQyMFM3NjJI?=
 =?utf-8?B?TEs5NnUvaHlyTHlMUTZHRWNnWkNKVWI5Vlp6MkpZYkZJcWZDbmxlWWphVUVW?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A2547ABB88354E90F924A77F92AF97@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RBRtYXC2A0Ej6nELFe5nf2OPcs88svbWrDyxG5oKEh7q+PNIuFBMH3NeMdkw21bj3LEPQ7wyjD5d3XyExQ1nqKSqVwY5YJY66upGvY51hT3ZW3EV2Z6WMFplHkK9UOXKbFQAyATCKnI+H+UkGdU4AfhPUvy5c2a4ici8zosAcP0evKtIflOQCKBefPYIiBZjuAtg59ouTwxpRh44WRrfX2PccM4o5VGLJjPjpdYHR94EwmW/h17ldVwNRgXIj68UHIA3Fdwao48TIvNFGjDDj1K6Rx69xrP4WwxwL29g65yVhJfkXf03WxT+IZ1vGT/F1pfQLmpWumI8cL7Ob1WaJPUM6pAmgXsTt7UQsgHmcmf7GHq2L7a9tl88Xi+ewsUe1E+rnZdTdSCSNJUkzsV72Fbs67UQYcbfc9ecuQwYkDpSKHVmF9Mcn2+Tjm4XH8JLIjN2oZUMeeF4BqvQG0Zs0KPKugyRpOv/4n1uIcPtAgNmRgD6qcKliqSjTQgVVWuwmzp2Ri1qot7ETYEGS5TMPFTicEUeJiDNtafbOvUpfW6nJ9cNtsyoFfGQQOtjCyxmSOSYrH2dfEEarTB31hmViOs7enn53q7qe4m2Xp6tziRWexY5uBKfh+R+pOs5LiYXJrU4MX6bvJJQat0KnKYSXmm7xGW1ul6MbBNz9tBR6KZwOyphHWbgTEkaoXpoQxQMcRlmtyWOH7NL1OpMY1HIG802T0LEwf58rUSzDq7rOreop3/qm+4ajwCj7hucho69RsBr5orfMAOv9vL5w3b1KvoaoFpkhmES5L4fa2WGHEtJA2S39ZPDh2UcmagFEJba
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845845a3-6bc8-4314-f447-08db2f9b057b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 14:45:06.1102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2dB/NISBKS0aRRlXwODckBx+4fZqU3oRpLWWDH2Yyhke2NXHoNO3g7HKqGBm+Aod1uEPYWq6mMImLRnLTdaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=850 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280115
X-Proofpoint-GUID: YlDHwzMUYPb0uYR5j0OupGQlsCWsglaZ
X-Proofpoint-ORIG-GUID: YlDHwzMUYPb0uYR5j0OupGQlsCWsglaZ

DQoNCj4gT24gTWFyIDI4LCAyMDIzLCBhdCAxMDozOSBBTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFn
bG9AdW1pY2guZWR1PiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDI4LCAyMDIzIGF0IDEwOjI5
4oCvQU0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6DQo+PiANCj4+IEl0
J3MgdHJ1ZSB0aGF0IGl0IGlzIGxlc3Mgc2VjdXJlIHRoYW4gaGF2aW5nIGZ1bGwgY2hhaW4tb2Yt
dHJ1c3QsIGJ1dA0KPj4gdGhpcyBzZWVtcyBsaWtlIGEgY2FzZSBvZiAicGVyZmVjdCBiZWluZyB0
aGUgZW5lbXkgb2YgZ29vZCIuIElmIHdlIGRvbid0DQo+PiBhbGxvdyBmb3Igc2VsZi1zaWduZWQg
Y2VydGlmaWNhdGVzLCB0aGVuIHdlJ3ZlIGNyZWF0ZWQgYSByYXRoZXIgbGFyZ2UNCj4+IGh1cmRs
ZSBmb3IgYW55b25lIHdobyB3YW50cyB0byBkZXBsb3kgdGhpcy4NCj4+IA0KPj4gT25lIHRoaW5n
IHdlIGNvdWxkIGRvIGlzIHJlaW5zdGF0ZSB0aGUgdGxzaGQgb3B0aW9uLCBidXQgc3RpbGwgYWxs
b3cgaXQNCj4+IHRvIGNoZWNrIHRoZSBzaWduYXR1cmUuIFRoZW4gaXQgY291bGQgbG9nIHNvbWV0
aGluZyBpZiB0aGF0IGNoZWNrIGZhaWxzDQo+PiBidXQgc3RpbGwgYWxsb3cgdGhlIGNvbm5lY3Rp
b24uDQo+PiANCj4+IFdlIHNob3VsZCBvZiBjb3Vyc2UgZG9jdW1lbnQgd2h5IHVzaW5nIHRoYXQg
b3B0aW9uIGlzIG5vdCBpZGVhbCwgYnV0DQo+PiByaXBwaW5nIGl0IG91dCBlbnRpcmVseSBzZWVt
cyByYXRoZXIgZHJhY29uaWFuLiBUaGF0J3MganVzdCBnb2luZyB0bw0KPj4gZHJpdmUgcGVvcGxl
IHRvIG5vdCB1c2UgVExTIGF0IGFsbCBiZWNhdXNlIG9mIHRoZSBoYXNzbGUgZmFjdG9yLg0KPiAN
Cj4gSSB3b3VsZCBhcmd1ZSB0aGF0ICJubyB2ZXJpZmljYXRpb24iIG9wdGlvbiBzaG91bGQgb25s
eSBiZSBhbGxvd2VkIGluDQo+IHNvbWUgZXh0cmVtZSBjYXNlcy4gTGlrZSBzYXkgaGF2aW5nIGFu
IG9wdGlvbiB0aGF0IGV4cGxpY2l0bHkgc2F5cw0KPiBpdCdzIHJ1bm5pbmcgaW4gYSBkZWJ1ZyBt
b2RlIGFuZCBzYXkgb24gdGhlIGZvcmVncm91bmQgb25seSAoLWQgLWYNCj4gLS1ub3ZlcmlmeSku
IEhhdmluZyBzdWNoIG9wdGlvbnMgbWlnaHQgY2xlYXJseSBzdGF0ZSB0aGUgaW50ZW50IGlzIHRv
DQo+IGRlYnVnIG9ubHkgYW5kIG5vdCBydW4gZm9yIGFueSB1c2VyIHVzYWdlLg0KPiANCj4gSSBh
bHNvIGRvbid0IHNlZSBhIHJlYWwgcmVhc29uIGZvciAibm92ZXJpZnkiIG9wdGlvbiBleGNlcHQg
dG8gcmVtb3ZlDQo+IGZydXN0cmF0aW9ucyBkdXJpbmcgdGhlIHNldHVwLg0KDQpJIG1pZ2h0IHB1
dCBpdCB0aGlzIHdheTogd2UgZG9uJ3Qgd2FudCB0byBoYXZlIGN1c3RvbWVycyBpbnN0YWxsaW5n
DQpzb21ldGhpbmcgb24gdGhlaXIgY2xpZW50cyB3aG9zZSBvdXQtb2YtdGhlLXNocmlua3dyYXAg
Y29uZmlndXJhdGlvbg0KaXMgbGVzcyB0aGFuIHNlY3VyZS4gIm5vIHZlcmlmaWNhdGlvbiIgaXMg
bGVzcyB0aGFuIHNlY3VyZS4NCg0KTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBoYXZlIHNvbWUg
a2luZCBvZiB3YXkgdG8gZ2V0IHNlbGYtc2lnbmVkDQpjZXJ0cyB3b3JraW5nIHdpdGggbm8gY2xp
ZW50LXNpZGUgY29uZmlndXJhdGlvbiBuZWVkZWQuIElmIHRoZQ0KY2xpZW50IG1vdW50cyB3aXRo
ICJ4cHJ0c2VjPXRscyIgaXQgc2hvdWxkIHdvcmsuIERvIHdlIG5lZWQgdG8NCnBsdW1iIHRoYXQg
aW50byBvdXIgaGFuZHNoYWtlIHVwY2FsbCBhbmQgbWFrZSAiYW5vbnltb3VzIg0KaGFuZHNoYWtl
cyBleHBsaWNpdGx5IGFsbG93IHVucmVjb2duaXplZCBzaWduZXJzPw0KDQotLQ0KQ2h1Y2sgTGV2
ZXINCg0KDQo=
