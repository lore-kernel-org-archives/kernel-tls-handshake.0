Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC913AD28
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 20:21:36 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GIiRpb004998;
	Thu, 16 Mar 2023 20:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=sjtpDv5pzmVKLc2pUUrHjde48MCPeaBDpHKcOwUT26k=;
 b=Ie0luKtX6rDAjjuMc61ZFc9A1aUQn8xEN38zBPTSFRZnLJfvY+xajwecc40HfZqZ3ufK
 iEyoEFmIdUhiHhnvBJo6kv5fj70TqUlYR0KzDQHTC2yEPDNRWqugyupidGj+CqYgM4VF
 ZI1qHYnOyHS0vthwfCMx8GEzKgWd5vrxEnF9+fe5Mc6rEyciR975o7x1wmjCJcggrLNW
 nu1VGZhxWY9rRb+kxoIKQpCO4rhyqMLLZwqc/cA/qZbniXYC5ljG3KP4pztHjTyrPX05
 9q5V0x6Yd6bG9/XAIutYAgqrErU9meQKamXcuk8TLfB7Bcx98wKxAu/gQ3F9es9xLxzg 6w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pbs2aj6eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 20:21:35 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32GKLU1X029748;
	Thu, 16 Mar 2023 20:21:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pbqq5tc8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 20:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB1WqOb2E7SfoH+iaWhAB7+tNGZfHc+nsPVHF5RLiR7/e0UtGYb3XosQaokkCeOy7vWCMiSmb/eiODRL4uGBWY4V6amYs6mp4BQADQrqFMCJWipMigKEnyyR1e6zNNWLJA8e0yEi6naJUGZjMO80KAsUQOOzbC7l1UWSxX2tW+/eliRnTKkeMf8nml70JlQCtpCxtlaSmYmBz9pIyGEmuHvpMmj9vjYZHdurI7aFrqpxS0ZZjuby0kBnWXgOwwVhUa7vVFuZ4bhY6YragB9hIaHBTBcjKw1lLTb0f4f108zFra96mSSQ6YXl058Wihu7ml9VBIUvWBZI0CZLDSPeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjtpDv5pzmVKLc2pUUrHjde48MCPeaBDpHKcOwUT26k=;
 b=SgTMsNVDTGycDHnyTAVRi93yJnA4NkYt6eh/5kXJs2doXV4NYvTY2DP8H32P10UbLgmZwE8aGgOWRUF5z6ceqB6TC4VDitBz/3WOyAyC8FFcx8M1Gq0Iu8vc8/0XoO4yDsSe/1LmZc8Qxjci/js5NzRdeJNCiFb7NOrW46x5FhcvqGDEzQim8TcXF9BMjR02VhjYvQbYcOpBaENHK3KxZZypbZYQ7fZNGt6fGkPAwW0qxiBQw9Zp9tFeqek4ryP1Hy89ZiK0sFlPLV0lx3QCXynXOdmaiHQJcY0FdSqfTtilKQTQwlZG3cCDlCz02GwFZpy2HlB45oaE2wDx3hdWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjtpDv5pzmVKLc2pUUrHjde48MCPeaBDpHKcOwUT26k=;
 b=ghNAmtfJHcuKmUlV5yCPrrDLO/LP0mIQbfbuqAnVf7PbZPzit7HPBmbu+GWW2gVK3H8O6pk2uO/RhFfc1q5FAjFAKVngu2tsxEdtFkZif1pNJahp0nae0rq7V0WeiU70B0AMuURTFTj6txx2yxso1r9iLxFOng/18bz4Cli3B84=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7012.namprd10.prod.outlook.com (2603:10b6:510:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 20:21:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 20:21:33 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "Kornievskaia, Olga" <Olga.Kornievskaia@netapp.com>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Some issues
Thread-Topic: Some issues
Thread-Index: AQHZWChzXPD+FlnpTUejUaUWpiNY6K792XoA
Date: Thu, 16 Mar 2023 20:21:32 +0000
Message-ID: <9D2259FD-7FEB-4670-9062-7161C2DBFA3F@oracle.com>
References: 
 <DM6PR06MB40747889A1DA72122394C26E93BC9@DM6PR06MB4074.namprd06.prod.outlook.com>
In-Reply-To: 
 <DM6PR06MB40747889A1DA72122394C26E93BC9@DM6PR06MB4074.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB7012:EE_
x-ms-office365-filtering-correlation-id: 0ac74a29-e81c-49db-c573-08db265c08cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ictSSl39WeO8B++Rkvrk0rmTsKL4/r3aZ/4/yRmqn14MgXDhQPVBIQKQLtDyn9Lgf8fPRahZWz3dxynyZYYxqIjG7wX1Qr3//2Gze9gYold/NxXuX9J2SKGRcZrc0QSC20ENYaw66RzP02pifZ1U75IWF7qVS0BEx+HbRL56QVYlU2AzflHUoDH+hOANvkpAQDBKR9jqZu0iLjvSvU1zGse353+/ILD4KDnsN2W+V8BDLfWtfeUw3WDpAecQZlkMq19svKFBMSh0iNMzFCeU8+5PDWeSMlpcVuW0yoo1VIxY3IpKi7qZZ7J98WuDfshQwjXFVIaBCp5jwotgia6ay0dPzZWyJavoH7tFZQVbo7q/KWkUqxyx3wLeGahPkLnMpzVpi/cOT+EcUeUeBHmgzHCGc6x9588/Robwk+dpdpzWm/EQnaUKyTRnE0XRQnFweImgz2DAN8xP0bnQg9KeqqYqWLBQgGRg6Zhn+u2/qk+n+vr86TqnjW880Aaecu7hnJr84HhN1EcArWsBaSPaWRVNqtJLLv2DJtyBtiwK9zIlgb/x4J4MCIKFWu6ahyyemkMSSkqU/sTTLSmaqpMpVvJVMY4lTkfm4jUlqK6fDbwJpnXVT0uJABXNXRQMi1n/MSUad6HCa6wERPoDthDR3aJ4YTvB2Y+P+zCVqAoWpAifijoduGlXHOSh/wyFwHLIw+o1sUycDkckk4P0AZ1c/vlTRiPmgr+DB3ly39RsZWg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199018)(5660300002)(7116003)(41300700001)(8936002)(33656002)(2906002)(3480700007)(86362001)(38070700005)(38100700002)(122000001)(66946007)(36756003)(66556008)(71200400001)(478600001)(66446008)(64756008)(6486002)(91956017)(76116006)(6916009)(66476007)(8676002)(4326008)(2616005)(316002)(6506007)(26005)(83380400001)(186003)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U29nc3YyYzU5QU1jaERWMDBLSWs5S1dwZnZQWWxBaDZrSkZUTHJoWEMxK2xM?=
 =?utf-8?B?WkdNbDRpVEZDSjFEV1hYR0dRR0hId1VuUWwyRlNBZy9lTC8wb1JGaXRKTWll?=
 =?utf-8?B?d3hENWdBSHJkMGRFWHBPYlZxSEpGVjZQUlQvRExGcXZVQzhkMHJ1dkxqdFhm?=
 =?utf-8?B?OW03QldCd3R0MW5RTGsvT1FDSFNOYlFKbFFPOHFWWkIwRmIrY3RwZWU3Sit4?=
 =?utf-8?B?RFlUSHd6SU5LZDl1K0tPMUk5dFlHVkg0OXA2VXIyY08rcS9ibkRqdVpzTWti?=
 =?utf-8?B?VW05c3F6QlJUc3dlbkd5WlJWd1J2bTBwR0M0RG42R3pLVmtyNWpHN3EzNkMz?=
 =?utf-8?B?WVgzdTM1WWF1VHR6YklZNWJ6a2w2Q3pQL3c1cVBiMkJFcW1PNW9aandoWHp5?=
 =?utf-8?B?empQNEUxWjA0OVdpOWdRTUVXRUx6TUo4Rm9CNTRDY3ZXc0J2NGIzSVBmMlBy?=
 =?utf-8?B?cllnMkVMY0hBM1hQK1NrYVErN1BjZWhOT3RCOU9lcGlXR0pVOFh4WTQ0MGdI?=
 =?utf-8?B?SysxTTFiNmN6UmVGNVRVK3Vrb0QvR1pIMUEwbzBSY0tYUjFtMy9BeEVtbW9O?=
 =?utf-8?B?U2xsWkRyM0l6bzc4M0ZLeU5kZVFPbG5lMzV5M3d0bDdSQXpQTHBJVVdGN0pM?=
 =?utf-8?B?enc5UDUxY2JCR29Mek1MampjLzc1U0orV0U5SGcwMTkxMGp6MDBzV0lxSC9Y?=
 =?utf-8?B?RndIWjdEVTZqZkU2cVhpbnF6NTFWNlg0Zll2YUozQnFCRVJnVEV1NndyRU9M?=
 =?utf-8?B?WHJ5RmhJZHQwdm42djJ2dU5PcVhwajQxUTR2UkdlMm1ieXNXNjd0RTNNY1Jo?=
 =?utf-8?B?SHRoRjNXUTdkYVlhYkcwZUVmVXJPaVpWMUFLeFVsRmlUWDEyZUYxd1dLSERT?=
 =?utf-8?B?VVkrWjQ1UlU1NTl4eHY4WU5MbWIvWkttUGJnOW93L0RBWEk3LzVBeUkxVGlL?=
 =?utf-8?B?dVViTjBsbzZOamVnOFhjdWI2bVhEUW9KNkp3Wkk0RVhhVHpTdW5XTUJ5VHdN?=
 =?utf-8?B?OWZFTGNkdzl1Y0ViZWZJWEJuQVpMaWFGb1RFdXpuaHJyVkhiKzRRdnFIbVIx?=
 =?utf-8?B?SHpCTVYvNzdCYlpjVUcwUFVTY0VzcnNDQ1ZZU1pTNzYvb29odFlzdFFTcHlh?=
 =?utf-8?B?a291YTJBNmtlK3p6dzRJUjk1b3hTSEZuR05qM3YxdkIrWEJlT2RRVDk0bEYw?=
 =?utf-8?B?eisyanRCdDBXWEk0R2t1UHVOMGZ5OExYYkZYM0RENmd4L0wxWmM5aERJMmRQ?=
 =?utf-8?B?ZVpuRkh1RndQN3c3VG56czJTVUtpalI0c3V6TStINmZZbmFVTzBOTnlmRHRy?=
 =?utf-8?B?OFFhRUdEekI5YkJob1YvRzZCNHI4RHlqL2MvNURLZHdNWUxwYzE3QUh1eUJz?=
 =?utf-8?B?T2VYd1lXR1hMa1JmaTRhaU41MTQ1V01rbGRYeTlEcjd6cklUcHBiZ0JUbDVV?=
 =?utf-8?B?UU9OZk5HMjE4b015bVl3bnVHT0NtMk1QVVM0L2hlMW42ejE3bTVETjZDOUN6?=
 =?utf-8?B?VEFpVEN6bmVHRGU5NjBvOE5zd21ucXpxWUM2MkFUUUhVUW1Pb2FjWmhuYjBB?=
 =?utf-8?B?VkZNSG83MHdvS2xlNFpDS0FhMnB4d3k5Q1JXZ3d5WXBMaVNuci84bWFjLzJE?=
 =?utf-8?B?WCtOMjdTTFJpa3c2d1lHRDdPM3owT3V6WHVGUUluYW1LKzR2aTBabFVRQ0hZ?=
 =?utf-8?B?TDloQzVYNXNtWUh1WnhEenVNRTFraEFra05XMFpQN2s5ZENpbjEyeVVoMXBF?=
 =?utf-8?B?RjBPOVhQUHRXS21kSmJJanVPenRlWWVyN3BjUll0Qzl5OWNpSlViTnVXTzlh?=
 =?utf-8?B?RWY2NkxlNGdnVU05RlVuT0lzQm1nZ0M5NzlzOUtVKzZObTBXNTcxaHNnTDI4?=
 =?utf-8?B?SWJQdFlPZFB3N1pmb3FRWjZrdlZZTnQySWJxZzFZVTZGZDlwaExtTmlvSERl?=
 =?utf-8?B?VmhzMU9LMjRYUmE0K29IRnFEa1RNL0dobC9xS3UrS1RjRWxkTnBUaEFMRDRD?=
 =?utf-8?B?ZGZUYk4zNnVwSUtFSjBqKzMvR21SOEJuOG8wRi90UzErRXBTOWFacEdrZXZw?=
 =?utf-8?B?aW02R2FsUEdBYTFja1JnM2M2cm8wTTJJTGFSTWVtZDlvZlFrN1VSY3ZuMWJM?=
 =?utf-8?B?V0txMTRVMmxPOUxnWXErajNqeDhGUEUreFdSTzdzMEFLVWVYVDgxS29EYS9w?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C7CE5B49454204CA9C6641EDD01C1F2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zfXcHGJjmkP2Qioz6s12cvlIwl/4XvN+mCBd98Yk616TsRjjliYu3j6+6v5atf2F1Ify9RyeqP3PAepeMvuXrtpSJolI2lx93Ef8Ej+NuvP2FZyk6kJztYjwx71wCgz0zdv0pTQbVC/8255u8oV5rAo4Gyi2cB27gK2+5cAUwSrlUCANWs9pqd0NNpujOKkVlCqkSOGgsEdUSKetmHaT2zH8vAzr3TxOAChRmOJAHUl/5JLZP3ALRf+B8zYaBHS3p4GzCcjGrNRptcGEEZVzQawyUxtQAFXX15Olw5axvXmR9h6Ff/voQMovnqINg2cwJXxNumwX04+ZMT2ieERZ2l8ElpqTYTeq/fcH7UE4sYwgpQPls7IYkQqvteeAGR4NbSOzvkXhtXA0wbAIy3xGZ2YRHnYzj7RgXHeD15XOMhdfIbVIM/MqSDCQAW8g9eAfHYPOnAw9tzSWuVBidvyLt9hkHab6zkju9jlT4oR0lD9KzISM/guKl0XJWXzfjguP4xmEGOp0UlKfmunuFhaCyxLK0m2X8ZQmtgOaf3xvVqwsdYAkMZ6zt5Nzi9na6SY+HPkwKxEvY2j+HD+iatJ1Vg1rVQoGTIrPUs56uGbKj0xw/HpZ9SC/Lhxt/z/yEiE0vBZ6yKdwhCoifOLdZ8dkngJw+t2/hJzHqMzirOcMOwUukTRFXDMuS9vONlilOX+aG0hhFt33CFcaNsWpAFdwRwccXgyCAjdGTBcgwspqtSXayNHIsw4WefW9/E2v8gAFHgceb9zjCJn7eAWcN9PB7yBpQrHiiMzRyd8KG+dvs6I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac74a29-e81c-49db-c573-08db265c08cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 20:21:32.8981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/V0rKEKpeI+S2I3eaoOaSv4BbcoQEfCA01FoZiIPc4+BC7/ixCf1St0RINqsmfosZhmkKCa47FIQVo4ZfnArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_13,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160153
X-Proofpoint-GUID: jslKmwQ3Kd4glpWysyj8b6Yqs6W8hO_U
X-Proofpoint-ORIG-GUID: jslKmwQ3Kd4glpWysyj8b6Yqs6W8hO_U

DQoNCj4gT24gTWFyIDE2LCAyMDIzLCBhdCA0OjEzIFBNLCBLb3JuaWV2c2thaWEsIE9sZ2EgPE9s
Z2EuS29ybmlldnNrYWlhQG5ldGFwcC5jb20+IHdyb3RlOg0KPiANCj4gSGkgZm9sa3MsDQo+ICAN
Cj4gSeKAmW0gc2VlaW5nIGlzc3VlcyB3aXRoICBkb2luZyBtdWx0aXBsZSBoYW5kc2hha2UgY2Fs
bHMuIEkgdGhpbmsgdGhlIGVhc2llc3Qgd2F5IHRvIGhpdCB0aGlzIGlzIHRvIGRvOg0KPiAgDQo+
IFthZ2xvQHVua25vd24wMDBjMjljNWQ2NTMgfl0kIHN1ZG8gbW91bnQgLW8gdmVycz00LjIsc2Vj
PXN5cyx4cHJ0c2VjPXRscyxuY29ubmVjdD0xNiAxOTIuMTY4LjEuMTA2Oi9uZnNzaGFyZSAvbW50
DQo+IG1vdW50Lm5mczogL21udCBpcyBidXN5IG9yIGFscmVhZHkgbW91bnRlZCBvciBzaGFyZWNh
Y2hlIGZhaWwNCj4gIA0KPiBIb3dldmVyLCBuY29ubmVjdCBpc27igJl0IHJlYWxseSBuZWVkZWQu
IEnigJl2ZSByYW4gaW50byB0aGlzIHdoZW4gSSB3b3VsZCBkbyBtb3VudC91bW91bnQgYW5kIHJl
cGVhdC4NCj4gIA0KPiBXaGF0IEkgc2VlbSB0byBub3RpY2UgaXMgdGhhdCBvbiBhIHJlcGVhdGVk
IG1vdW50LCB0aGUgY2xpZW50IHdvdWxkIGdldCB0aGUgaGFuZHNoYWtlIHVwY2FsbCBhbmQgc2Vu
ZCB0aGUgY2xpZW50IGhlbGxvIGFuZCB0aGVuIHRoZXJlIHdvdWxkIGJlIGEgaHVtYW4gbm90aWNl
YWJsZSBwYXVzZSAobmV0d29yayB3b3VsZCBoYXZlIHRoZSBwYWNrZXQgc2VudCB0byBzZXJ2ZXIp
IGJ1dCBvbiB0aGUgc2VydmVyIHNpZGUgSSB3b3VsZCBzZWUgYW55IG91dHB1dCBmcm9tIHRoZSB0
bHNoZCwgYXMgaWYgdGhlIHVwY2FsbCBkaWRu4oCZdCBoYXBwZW4uDQoNCkkgZml4ZWQgdGhpcyBv
bmUgeWVzdGVyZGF5Lg0KDQpUaGUgc2VydmVyIHNpZGUgaGFzIHRvIHNldCBYUFRfREFUQSBhZnRl
ciBhIGhhbmRzaGFrZSBjb21wbGV0ZXMuDQpPdGhlcndpc2UsIGlmIHRoZSBjbGllbnQncyBSUEMg
YXJyaXZlZCBiZWZvcmUgdGxzaGQgY2FsbHMgRE9ORSwNCml0IHdpbGwgYmUgbWlzc2VkIGFuZCB0
aGUgc2VydmVyIGp1c3Qgc2l0cyB0aGVyZSBzdGFyaW5nIGF0IHlvdS4NCg0KDQo+IEl0IHdvdWxk
IHNlZW0gdGhhdCB0aGUgY2xpZW50IHRoZW4gdGltZXMgb3V0IHRoZSByZXF1ZXN0LiBJdCB3b3Vs
ZCBkbyBhbm90aGVyIFRDUCBjb25uZWN0aW9uIGFuZCBhbm90aGVyIE5VTEwgY2FsbCBhbmQgaGFu
ZHNoYWtlIGluaXRpYXRpb24uIEFuZCB0aGF0IG1pZ2h0IG9yIG1pZ2h0IG5vdCBzdWNjZWVkLiBC
dXQgdGhlIHNvY2tldCB0aGF0IGdvdCB0aW1lZCBvdXQgd291bGRu4oCZdCBiZSBjbG9zZWQgdW50
aWwgaXQgZ29lcyBpbnRvIGtlZXAgYWxpdmUgc3RhdGUgYW5kIHRoZW4gZXZlbnR1YWxseSBnZXRz
IGZpbi1lZC4gQXQgdGhlIHRyYW5zcG9ydCBsYXllciBJIHdvdWxkbuKAmXQgc2VlIGFuIGV4dHJh
IHhwcnQgdGhhdCBkb2VzbuKAmXQgZ28gYXdheSBzbyBJ4oCZbSBub3Qgc3VyZSBob3cgdGhhdCBz
b2NrZXQgc3RheXMgYXJvdW5kLiAgR2l2ZW4gdGhhdCBpdCBzZWVtcyBsaWtlIGl0IG1pZ2h0IGJl
IHRoZSBzZXJ2ZXIgdGhhdOKAmXMg4oCcbWlzc2luZ+KAnSB1cGNhbGxzIHNvIHByb2JsZW0gbWln
aHQgbm90IGJlIG9uIHRoZSBjbGllbnQgc2lkZSBidXQgSeKAmW0gbm90IHN1cmUuDQo+ICANCj4g
QW55IHRob3VnaHRzLCB3aGF0IG1pZ2h0IGJlIGhhcHBlbmluZz8NCg0KWWVzLCBJIGp1c3QgZml4
ZWQgdGhpcyBidWcgYW4gaG91ciBhZ28uIDotKQ0KDQpUaGUgcHJvYmxlbSBpcyBoYW5kc2hha2Vf
c2tfZGVzdHJ1Y3QgaXMgYWx3YXlzIGNhbGxlZCB3aXRoDQphIHN0cnVjdCBzb2NrIHdob3NlIHNr
X3NvY2tldCBmaWVsZCBpcyBOVUxMLiBUaGF0IE5VTEwgaXMNCnBhc3NlZCB0byBoYW5kc2hha2Vf
cmVxX2hhc2hfbG9va3VwKCkgd2hvIHRoZW4gY2Fubm90IGZpbmQNCmFueSBtYXRjaGluZyBoYW5k
c2hha2VfcmVxLCBhbmQgc28gaXQgbGVhdmVzIHRoZSBhY3R1YWwNCm1hdGNoaW5nIGhhbmRzaGFr
ZV9yZXEgaW4gdGhlIGhhc2ggdGFibGUuDQoNCklmIHRoZSBzdHJ1Y3Qgc29ja2V0IGlzIGZyZWVk
IGFuZCB0aGVuIGFub3RoZXIgc3RydWN0IHNvY2tldA0KaXMgYWxsb2NhdGVkIGF0IHRoZSBzYW1l
IG1lbW9yeSBhZGRyZXNzLCB0aGF0IG1hdGNoZXMgdGhlDQpoYW5kc2hha2VfcmVxIHRoYXQgd2Fz
IG9ycGhhbmVkIGluIHRoZSBoYXNoIHRhYmxlLCBhbmQNCmhhbmRzaGFrZV9yZXFfc3VibWl0IHdp
bGwgY2xhaW0gdGhhdCBzb2NrZXQgYWxyZWFkeSBoYXMgYQ0KcGVuZGluZyBoYW5kc2hha2UuIC1F
QlVTWS4NCg0KSSB3aWxsIHB1c2ggdGhlIGZpeCBpbiBhIGZldyBtaW51dGVzLCBJJ20ganVzdCBy
dW5uaW5nIGENCmZldyB0ZXN0cy4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
