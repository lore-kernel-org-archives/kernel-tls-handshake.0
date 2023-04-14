Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9A6ADC
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 21:18:29 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EGv9vg020096;
	Fri, 14 Apr 2023 21:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=YZyNwB+7tgFt+kzEsi9rpDXv/y+fvtlUn1OEyiDeVtE=;
 b=F8rfxhH5k5qnlYoybR7N80X4m9m68HgBMUT612D5kFdMB2pC+abaUtUP5Fw/T0TxsQ8y
 sFiXkC4mBgOUEioKGjbNTffjGjK4A6HpnqsmIhReQiuEUc7PgdvnELzSNIPLy1u1fwGj
 FAYt6aBDBTGRzAnqh8RkEZ0cHv0SJ2OPmS0x0qaF4TKzqTEH3YPh0MJM4qUjz2nGweH6
 ZvHktGhlxG+MjkvIaGw+ROPMbpj6FMab1EQ97Hxt8NpKRdziCJuM56mb9CA4jRwwqBxV
 iRnzDdbH4BNBKyw6SxxtDGlAOAMgUomXVUqvXTB2Jc/nI5cAd4Ov2H4TwgzeKyxiY3RN xQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bwq6w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Apr 2023 21:18:23 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33EKp7da011441;
	Fri, 14 Apr 2023 21:18:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3puw96kmvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Apr 2023 21:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHUd6MPoqqUdseQ+B2yffi7wBi8YcbwFmyzQoGXITo25BpJAAjm9VmD15LEIFxy/tCTrkurMaSJ75Kf4iaYF0BbwBKsMgydqc4I+STTPvACx/eigtDGBJ1FXkGutdozgIm4jOL/AVifB2OD8fGX+0aJLHkWcpDqyaeAHSPz8GaCtW1GBmaBgUKaSxBTW4Baf9zcd/CPKBMouO9zD1Ol69hrpdUYmokuHLS0WWSNBwU0k6RkJosKeU+7MgHa0i00C5LtQjIQsjFFBR498CQ8p3JNQzofjnlulhYCGTkBL9XafFJ6F+bOtCdrScToGdSQdui0wFkTdO+C17hen+PmsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZyNwB+7tgFt+kzEsi9rpDXv/y+fvtlUn1OEyiDeVtE=;
 b=lrw9kKNgxdnANU4gQTVbJ4AQnw+r6u4XdwcPa0qc+gSJtfmU/R5yAeiCRSR1Mbk3qLrHJ01RrIHb5KjoaqbwQxOIpCYab5DDLNb3N9mXIFMnp1xE+Vn5sA4YTQtrHRUfCxY/BSUZ7U5WYH+LMHyYk3F8TqtsOv7mph4sSkHDLAPIldx/spIqlBU6bpnM6fdMNZ5FeUuVe2tNTl7lLLJeZI/r0Wi9SheQJiRRF/E9byU8ksQQCvY12oE4teinr+8ahz+1NV9nP9QWcKhAWaD0JjNvFNMECGeARVf/MRypFjF8aRqOWvkJ6sF0ApfHvaAUWfsG0BVLvfhJZthxFOPfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZyNwB+7tgFt+kzEsi9rpDXv/y+fvtlUn1OEyiDeVtE=;
 b=rrQBHaBXHB0oYPHpaAPJ6siGTea2j+PhCF7UAnZH215qSPI3poKX61mQWjMgcDc7PHNu1xUaC2BPd9qOg5Bs7WllVI/OqlnvsEsLbOSk3Ybdfc25noioii5NmK5zqbex56v2vThIlAcQ0FY9YveXiri0fbTW9nPODxynrg9ERtE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6531.namprd10.prod.outlook.com (2603:10b6:510:202::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 14 Apr
 2023 21:18:20 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:18:20 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: advice on kernel configs for NFS with TLS
Thread-Topic: advice on kernel configs for NFS with TLS
Thread-Index: AQHZbw3ReqyVHyuJYk2stoCneux3Sq8rRQMAgAAJeICAAACigA==
Date: Fri, 14 Apr 2023 21:18:20 +0000
Message-ID: <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com>
References: 
 <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
 <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6531:EE_
x-ms-office365-filtering-correlation-id: bd6378e7-a6a8-484a-26c3-08db3d2dc5b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iC4R5hqzEZBFM23til2vXzD1rBsM6+mq04+zhXYKvq/zm5YfxwPSKKHjRas8ufdQWuMkkvbqRPMOi9Mgs/JQQmSF8E77Rr5d/8oZmYlWFYtNcG3jS16HRh+1JOeZeVe7dPRBp+6yoIJkSw41+rkqaDcoK1sHqviuCAjEX/R5yjvtb3Kb0zr5Oq90E/R6Da66sT/8qOYmgynqT1RyRPBgcVmVmtlIb1jO2OkywnfGRykSvefsdIppmXVavwdlMqLJQd5awIBmE9feeAcwL3unynZ/HoULFj4F5hZ+cLEtlnE5JZAcmBywrrCZU0mp4s90U95frZxVLmQF9l3iPEx2rdY0Zf9fI3440tDCgIarZVV+rhf7COkFBn58kl1IjG0HbQST0E2atF9SL4Ldc/A5cvGgycb0dv7NVoXhh7Gp/LKYA+tahlyw9Xzf+bpPqa3F+hi02uuiDabOqh+gsJxnHTYjRzm7K80dN4gn5AehhiNpmzKsW5ChMLDpCd+26TqBtLppioXOET8a2BWZpiNc3wfOyoFbYdbpwi30bU0iPLflW+gvRdasJYy9U+lPMddA+35JK4C2MgUlkx/3ZC7b4rUnsdRb+Fh6e1cAF1DhdvU56iM0+m8iOposw/TbbrBqi4lPykuJZDhkw7in5agvlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(316002)(5660300002)(8936002)(36756003)(38070700005)(76116006)(2906002)(8676002)(33656002)(66556008)(66446008)(6916009)(4326008)(86362001)(64756008)(66476007)(91956017)(6506007)(41300700001)(6512007)(53546011)(122000001)(186003)(26005)(66946007)(2616005)(83380400001)(38100700002)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RXl2TjZ2MndlNU5LdVgwTk1HMnN2NmZDdnI2cTA5cy9CeTdLWXV1bXhKTU1F?=
 =?utf-8?B?VGh6T05KZmpzeVUxU0pRZGxEaWE3ZE4zemlqc3lyQ3FpblZ6M1ZNcVJXQ29p?=
 =?utf-8?B?bUl2bVpFc21LdkVINlVFRWZva3lQbmZZWkNHeU9DTHh3WnJtQ0UyRjZUN2Zp?=
 =?utf-8?B?S0x2NmpqRTBPamdaRmtjZDF5a2JmQnFMTXh3bktHQ2ladVpRQVRqTmRWRWp5?=
 =?utf-8?B?ZlVGNG01ck1zMTN6YUlsNmdVR3UvQ3hUZlNTakJSKzdFYlg4T1BlNjVoSzZk?=
 =?utf-8?B?L0tTUVlkdnBzVnlUTlRMY2poLzZmU1FYR2FXSVdkZ2JKUCtpOEZEamI4a1Fh?=
 =?utf-8?B?N1VyVzluMlB0WkhwSGV6d1NHUGFIUGhkbWR4R0dpNG1RYTg1ZTE0ZDJQVmFN?=
 =?utf-8?B?VmJ4RTFEVW9SU3Q0VGNqYkhJM0lOQkRxa2dUbHJYWktUVFF1SlBkeVdUSTFo?=
 =?utf-8?B?bTBrclFGK0FORTErN2VTZXhVelBLdE9sWEJJeU41RzhTUm4zR2owc0ZrZW4z?=
 =?utf-8?B?b1lwQ2toMVpMNDZ1NDFVSjVkdGxBVFdwcHlwWlhlZkRiRUJidjNtMmJDM0hN?=
 =?utf-8?B?L1czT2NNSVh1a2tPUGNld1YyK2lubGRmL0VxTlFJajZiaTMwTm1lQ0dRNTZs?=
 =?utf-8?B?UlU2Sjl2QUFXaHZFdGRGRXNjNU9rdXg2b0JWTEpFNFEzMDcwQ0hFb0NOeTlW?=
 =?utf-8?B?UWpVZFN2ei8wQnd1MEQxRm4yYThlZ3d0MmNtMlRoWFZjR3U5MTFHVHh0cDVM?=
 =?utf-8?B?dEd1WGFEVkxPM3lzTDBCZUJMTVkzS1RON3JCVnk0RktmQjV1RGdhRno0dDky?=
 =?utf-8?B?cEl0OVZiK1RXUDFSZWdacUROUEJzaEorbFRuNUpWcmN4ckE4L1hSZWpQSFc5?=
 =?utf-8?B?bkN3bzVYczZ4cWVJdzBkZFNkaU1kL3c3NzQ4aHRVaFZMeTZpN1A3Mk1HTEh5?=
 =?utf-8?B?czBIbHEvV3RrU2dOd05oVEFrUmF4OWkzN29TRVVvQXRUQkxRcXgyUWlCWFpk?=
 =?utf-8?B?dUVscmRZQ2gzZHJQa3R5eEg4Mm0xdHVESmNqUFd6T3JtZG1URjlwamlNOUdS?=
 =?utf-8?B?VS9PNSsrL05uSkRsN1FNaDg2eTliNVQrdjN6Wm42Um13b3dzS1g3L0Q3TGlV?=
 =?utf-8?B?L0IrZ3hwZHVLTGFwMDZEZEpMdTF5V0hHQUFjNHhhRjVMOFlpZVkzTlBHcGoz?=
 =?utf-8?B?cWF5UG9HN1o1ckQ1eG9RYUw5MzdQODd5Vm9GZGxrY3JlU21qdWdYUUZmR1A1?=
 =?utf-8?B?M3p5RjNHb0hSdTJ5Z3B0WnF5dk9MMVdtd211dkhXNjkyemFuTkRZSTF0Q2tP?=
 =?utf-8?B?MHVqT0xDeHRzOUp1aDFBN2Q3clRVUVU4SDFiSk5helBRcGxLTHlXUTlNS0RW?=
 =?utf-8?B?b1REcVBBRktLbStldSsxNXAwOXZqUHVhWmMrRVkrZnpKOENMcGduaGFZUndJ?=
 =?utf-8?B?bzRITGNsc0U4WG81c3RhQjd4bVh0aXJmZy9IM0NRN0lleHdtWlg3THlCVC9r?=
 =?utf-8?B?dThUNXdReFMzSXZ3K1RpTVRUQUFOK05KcEgyQ1J1RVg3ZGJ3d3BPMWtHQ21E?=
 =?utf-8?B?eTZwcFZVekNEaDRkdTNmdFRiemw0eCtnenZ4ajNQVlVKd0Z2Y0YzRTJseTdy?=
 =?utf-8?B?NU9NVVZhVG9hWEJsdTltWGp5aXNUallJVDhza0t0ajUwM2VTcXpySnd5U25o?=
 =?utf-8?B?V1RjalBNdVlJbi9pTDBGR0lTa1FEOEkyd0V0Zmk3amJSTUtxZVFCRlFTN2w5?=
 =?utf-8?B?T0R0alhwTVFEVHd1MTdacUtLVDFVMXYyMzlkUWVhZ0hyN2JGbTVSVjczSUNZ?=
 =?utf-8?B?blJkd2VLZU8wZWIxenN5b1hta3dhQWF2bW1wQ3RmVXl6VFF4U0cyK283bzBz?=
 =?utf-8?B?bSsydjBmWkVwcEdvRzVSTHVXQzZUMkJDVjA2SldUVXV1WHViNU4wNHRiQlk0?=
 =?utf-8?B?OXZlZUViaXZTOG15MUZJTnpUaWZ1UncrWmI0VGxTTXZ5bUtZcTFycWJ5Wkxv?=
 =?utf-8?B?ZWJxMHdsMVdHYUJLYkljaEVjbG9nWmxVQy84dm94Z0xUUU1iRnpUcm4zREkz?=
 =?utf-8?B?Tk50aks0dVFxU2dzekRBYWZZbnJ6ZzdTMkU0WDJ1eWRJMFc4UTUwMFk1ZTg3?=
 =?utf-8?B?NzVOZGtJWTI5OWVieWRPVjFRUDErZngzWndpckRtNzBCV25aRXpFdzZ0VnJm?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CE5BEE5B7C9044795C65B5E6DF7BF76@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FcvUxUqyX+t8YYbZSwTMl8dTmRRE7o9tffsOLeXZ/hiPuZAlELcvk4siijJheCHCRUcYwzX5//Hdpt3IQ+s1JoeO5R74+TzbpdleT7wSKTotmq805sXP6msvX/+mIvio8aSauuc9IrZLV+IUUP1Q4c3amAgH1UviIvHQVRIBR5XFt8lNzhIqjos2Hst1hj1WefzUVMgLVy2olpeY0DprBi0yRJEDd3El4wEVWbAOLRWn9WvwhmMZDDL7AdRJGwU2n44Obie7ybBQBTPmFzBmJtmfg+2qcWnrGF+TdGfrjakhGKZnOM6kmGf7Ej1XPThuvA9dj2KZAaLutVH/BhByOCRDJPuzH/btceDh4oVrTCSKn/MPFjQvlxu9rhZGMaAMzvktpjM/vTUQRcUeTpowpY0OisoPw7FT8uwbVTV2cOXM6bdBSwcF/e8dSiw+GI3pKp2xb0pVqjba7YLlMUpDsZR302GET3qw9AUaM+OHIKofsj5gW8QGMh9QVRPeF2NDA8p6gDDwL+eGokm1WfknT5u11XDlhup1EwiDapSM4bLlLb0WkxuFAyAKDGfd2wXrhs7GYDw9OAnf40H72Oe3p7V4Y0ZV9+3YwuWR3WUuAUxkF2r6WnN5wZGfNI0NU5vLIYToYhr1HdivJLIIqiuOlXRPAX4qlhuqCqa+jFxn5ArXiMF+B2I8GWwMsen9ayejzESHljhgA13l8MSCepMNAfOJ2aTzqjsjAqsVRVnDJvYmR0I6YbKW6Iqmaj6LSsnQ4Hwv+94KPsRaPokTj5lk3zkrbWhi9Xu14DSzvdy5G3A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6378e7-a6a8-484a-26c3-08db3d2dc5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 21:18:20.2460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taZynF6bEejho9gvMf7iXUsK0ubXZXeb0nc4keTcl/8YRdiqEWSgEU18qv1uYmTvt+O/cI761NBo0bJqZMDWQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_13,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140187
X-Proofpoint-ORIG-GUID: wec4Nz3R2hDQIDqkYsDIprwpGdGZmhuu
X-Proofpoint-GUID: wec4Nz3R2hDQIDqkYsDIprwpGdGZmhuu

DQo+IE9uIEFwciAxNCwgMjAyMywgYXQgNToxNSBQTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFnbG9A
dW1pY2guZWR1PiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDQ6NDLigK9Q
TSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4gDQo+
Pj4gT24gQXByIDE0LCAyMDIzLCBhdCA0OjE0IFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWdsb0B1
bWljaC5lZHU+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIGZvbGtzLA0KPj4+IA0KPj4+IERvIHdlIGhh
dmUgZ3VpZGVsaW5lcyBmb3IgaG93IG9uZSB3ZXJlIHRvIGJ1aWxkIGEga2VybmVsIHRoYXQgd291
bGQNCj4+PiBzdXBwb3J0IE5GUyB3aXRoIFRMUz8gQXMgaW4gd2hhdCBrZXJuZWwgb3B0aW9ucyBh
cmUgcmVxdWlyZWQgdG8gYmUNCj4+PiB0dXJuZWQgb24gKGFuZCB3aGF0IG9mZik/IEkgd2FzIHVu
ZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgaWYgb25lIHdlcmUNCj4+PiB0byBzdGFydCB3aXRoIGEg
YmFzZSBSSEVMOSBrZXJuZWwgY29uZmlnIHRoYXQgd291bGQgYmUgc3VmZmljaWVudC4gQnV0DQo+
Pj4gSSBiZWxpZXZlIEknbSB3cm9uZy4NCj4+PiANCj4+PiBGb3Igc29tZSByZWFzb24gd2hlbiBD
T05GSUdfS1VOSVQgaXMgZW5hYmxlZCBpdCBsZWFkcyB0byBhIGtlcm5lbA0KPj4+IHdoZXJlIHRo
ZSB1cGNhbGwgZG9lc24ndCBoYXBwZW4uIFRoZSBrZXJuZWwgbG9ncyB0aGF0IGl0IGRpZA0KPj4+
IGhhbmRzaGFrZV9zdWJtaXQoKSBidXQgdGhlIHRsc2hkIG5ldmVyIGdldHMgYW55dGhpbmcuIEkg
ZG9uJ3Qga25vdyB3aHkNCj4+PiB0aGlzIGtlcm5lbCBvcHRpb25zIGxlYWRzIHRvIHRoaXMgYmVo
YXZpb3IgYXMgSSdtIGF0IGEgbG9zcyBob3cgdG8NCj4+PiBkZWJ1ZyBuZXRsaW5rIHVwY2FsbC4N
Cj4+IA0KPj4gaGFuZHNoYWtlX2dlbmxfbm90aWZ5KCkgaXMgYSBuby1vcCB3aGVuIENPTkZJR19L
VU5JVCBpcyBlbmFibGVkLg0KPj4gDQo+PiBOb3Qgc3VnZ2VzdGluZyB0aGF0J3MgdGhlIGJlc3Qg
bG9uZy10ZXJtIGFycmFuZ2VtZW50LCBidXQNCj4+IG5vdGlmaWNhdGlvbiBpcyBkaXNhYmxlZCB3
aGVuIEtVTklUIGlzIHJ1bm5pbmcgc28gdGhhdA0KPj4gdGhlIEt1bml0IHRlc3RzIGRvbid0IGRl
cGVuZCBvbiBoYXZpbmcgYSB0bHNoZCBydW5uaW5nLg0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUg
ZXhwbGFuYXRpb24uIElzIGl0IGZhaXIgdG8gc2F5IHRoYXQgdG8gaGF2ZSBORlMgd2l0aA0KPiBU
TFMgQ09ORklHX0tVTklUIG11c3QgYmUgb2ZmPyBJbiB0aGF0IGNhc2UsIEplZmYsIHdoYXQgd2ls
bCBSSEVMIGRvIGFzDQo+IGl0IGRlZmluZXMgaXQgYnkgZGVmYXVsdD8gT3IgZG9lcyBpdCBtZWFu
IHRoYXQgaGFuZHNoYWtlX2dlbmxfbm90aWZ5KCkNCj4gbmVlZHMgdG8gYmUgcmVpbXBsZW1lbnRl
ZCB0byBtYWtlIHN1cmUgaXQncyBuZXZlciBhIG5vLW9wPw0KDQpJIGRpZG4ndCByZWFsaXplIHRo
YXQgZGlzdHJpYnV0aW9ucyBidWlsZCB3aXRoIENPTkZJR19LVU5JVA0KZW5hYmxlZC4gSSdsbCBo
YXZlIHRvIGZpZ3VyZSBvdXQgYW5vdGhlciB3YXkgdG8gZGlzYWJsZQ0KdGxzaGQgbm90aWZpY2F0
aW9uIHdoZW4gcnVubmluZyBLdW5pdCB0ZXN0cy4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
