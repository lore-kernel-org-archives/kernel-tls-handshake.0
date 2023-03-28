Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F698BFB
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:48:55 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SFdXXK026181;
	Tue, 28 Mar 2023 15:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ut7LWoRzQM7RgWZu2EagVxFTPo07kGz5J45UO1+tR58=;
 b=qYlLK2Hj27bk9RPGvnLZztsxxPH2wY+FXzSn9VLqGXcsQoNAUfhc9GGwo9/dDZTjmC8g
 APVMOzMAtYxKI2gjSSVmbBPXh/B6m8YjP3arzv+0J9BjBqhpQDAb5Kxraqu0rL/H8AXZ
 27EwbwbGFP/s1LumVTmfR6NwxZUaA5kbuyB8WfdqcrX2WB+Zqz0pEVS7UUhsq0lAnP/n
 brlR0kKAwW9hZYCV5PF53C+/8FU8X78TgOp2GFRrgyXtLLjlbzmc3txo0L4VpA9K5uyY
 DVAHxaYBDW0FaL4x06Bt/qe13k5oT+nDAf5ZlDAGtYdHz3Iw/cBTAhqj9jmqfhTGtTOv xw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm32kg16f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 15:48:52 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32SElDdP026767;
	Tue, 28 Mar 2023 15:48:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3phqdd482j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 15:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0DHKgw5cQ5yPXOw67+1pp2LQaMtQxRERNCqkwOzQxaCgY/Y8pP8anhjGWhJ2DvYvyYxZM8AuzoLpTo9rJfwh9D8sAIaiZicsKQqgPUiyS+J3mTbXb5rUVSBZDu+FY+ft1NnQJFSPuTGJNiNBbs2c1ilw+N86hSsNkW+lLtc8+I3MfN/ZXt5HZ6ojKD1lP2M9XYjwaFuyzc61L4ZcedbzXZI6JcURLn+FdL2j/z7mVyt5R5q3URZW739UT9EZiykeRgX3uyv7rqCPTkjgBjUfbyBEvKuuUWnv7OKc5Gr0tleeTBDxw8DPms9NqVvSix9BqWPXdwDr9Ygnz3q9+mNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut7LWoRzQM7RgWZu2EagVxFTPo07kGz5J45UO1+tR58=;
 b=NFAN0B465GPHs3g9U1a/bvBnlb1QUjmNTWUAD4Jh1S90OuOcqSI/VfauNFIz2/g9q+qtAUQLHwzvVpzlr2m67aiQV00EvuaDae7xq3gQzu3uCLBmayw8l0/DO9CTJr+kGsqgScb3jJxtLU6Ppc7v9h1lqbUAz6cCEKWPBtHJ+rQTk/Xg0tTDkHhohBkugNOw0QbTYECylX+j8HdLsCVXHPzT0aW64yEA4fMOlj2xf+BMcCTp/zElfbRAgZ5+ziAOusn9aCqyNWYbREN0lm+9GL7QHCEgSd366Rr6CaOGUktVUpwYgf+a0ipd4Cf8H3X4IRkySZpDAmB5f+4DhWQhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut7LWoRzQM7RgWZu2EagVxFTPo07kGz5J45UO1+tR58=;
 b=TJbxvAimV5FDKVy6qfViDbxsOv3HZ1cl2nUQNYzER9XW8RwgXqH4FLUX9Ov0ADUcc2s/X1MX9oLYal94lc/KazK4/8sXi0uf+kr+Df4nQG7oaRKr/CXs/dBIaXBrXaEaeqvlNe0dlV9GWSHEs9+DpPJBoONufcOgdGmjLz2Hvog=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB5216.namprd10.prod.outlook.com (2603:10b6:5:38e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:48:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:48:45 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: Jeff Layton <jlayton@kernel.org>,
        "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: problems getting rpc over tls to work
Thread-Topic: problems getting rpc over tls to work
Thread-Index: 
 AQHZYXDCA0hJbwdiPUy5qr2jSN8s068QJjIAgAATTgCAAAb7gIAAAraAgAABsoCAAAUXAIAAALUAgAAD14CAAAMhgIAABQQA
Date: Tue, 28 Mar 2023 15:48:45 +0000
Message-ID: <8EF6F5A3-C7B5-4910-B855-1661F384AB6D@oracle.com>
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com>
 <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
 <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
 <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
 <CAN-5tyFS7zS-mfQqeaz7O1MvCpyeJ2uZBzHRNYgHzd_Qzy=7JQ@mail.gmail.com>
 <CAN-5tyHsULqAt2L5m_F8tfJRfEkJvRP-6e=D9p5bdDiKhWMGqw@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyHsULqAt2L5m_F8tfJRfEkJvRP-6e=D9p5bdDiKhWMGqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB5216:EE_
x-ms-office365-filtering-correlation-id: 13fae4cb-68c3-4910-47df-08db2fa3e9e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m+WWDHjiAD0SR7Z8Jj1vW85ccYf6DdKx4JDlGgkNSZ2+cvr6m6hzOAN0eznNOr933DwGwg+aZtBJxhB4RZoa/ywydTsJlsXuwrH5YJvM5VFN5OpGaMtRPrNGOlH/8d7mjjMpLQYbkwY9/uznj/ia8n8xIMVPrQ28pHcaOa/v7tb2uu0S/8+Kw/EFyJEn9D0qWS/S4vhskY4/HlPxVatECS5keernxswTf1+nmN8niPoAxlK2AhhAdEOPiEaLgSwb2/2H5098jk7jPHX+fHUrbH6WcuZIHF54UiFAf818PIbrYD2tQAZ1R8PsPMx6c3efBebAXnXDqODS5VIcJB54sh6iuSZUFIxDH8CmzRIogwXd2E6uKwu35ybQDbnAUOMtsHMS6BoS0Kw/cZul+n99kajJgH3cHCgRrCct4STil+kOfM1SO5ttdrONBaLj0V7cY6gLg4h3YM46lwC9rtNc495xezzyr3ZFB87HboszsOVT/HyeqRR1FjmJxORJJSIiGE0mgwCrbbLg/IW/6SNzWuWUcUuqAlKX/kU2htz+rz5On1/gDVyxoPSyBKvAuKr3kjX3lSxMGKsQvrj6BjvoOHDe5WUS1+RNs5vby45k+290dcBt+p//G/IYbU8PMrVPKGp7rC3F0Cmv3AfNfRCMBA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(53546011)(6512007)(6506007)(26005)(6486002)(71200400001)(66476007)(86362001)(186003)(54906003)(316002)(478600001)(8676002)(66946007)(66556008)(64756008)(41300700001)(76116006)(91956017)(4326008)(122000001)(8936002)(6916009)(5660300002)(38100700002)(33656002)(66446008)(66899021)(2616005)(83380400001)(36756003)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OUNJVndWelpYNHNXWkYzeXFnNFZDYi9QbHpSQ3JmZUZoMHZNK2lja3ZLRUF5?=
 =?utf-8?B?THN6N0g4dTZRMVNzMHhWOHU1NXNrUk1pS0cxV080NnVVR1gwQjc0VnVxek1t?=
 =?utf-8?B?d0JZT2JXeUNmMnB6bHpta1U5TkYzMjdvUTFaWjh2TGkwcHBxV3VIRmtuTExh?=
 =?utf-8?B?bXNSd0l5akhPSW9HZFVLUkNVQjdyWWZSaWVSU0ZqdWRaVXBVMzUwYXdqbk9t?=
 =?utf-8?B?VSs3Mzl5Tzh2NGxHSFF4M1pZdXhRd25YZ3dRa0FRVTR1eWxGckc1cnZYQjln?=
 =?utf-8?B?WlpkYVlUblVTcEFtNkRlN2FZWWpPSGg5bjlySFhtQlNyRUgwaFhMYmwrcWxa?=
 =?utf-8?B?R1grN2pGc0V0V2tSd2R0cXZya1QwQVZTVTlrTyt5Tlc2OTlKMlB0VFFkRGRQ?=
 =?utf-8?B?aWF3dkdjTVJjTXJ0M3pWL0tSNVVWb3MvcWdBaXZucVhkV3lUaXVwMFhDVG0w?=
 =?utf-8?B?N0Q5Tm1hVHNoSHJJZER2RWROcjJwOHdCMTlISTI1SnYzN3hST05obWVtaGxE?=
 =?utf-8?B?QVg3MHlyNmE5UUxkS1I4NHFvanRjb3JuQ3hESUJHYU9Tdno2b3NxM2NqdWVv?=
 =?utf-8?B?dFFLYjFXdkxxUXdaUko1YWZxTHkxb0pRUkt6TFc1UnQvTVZEMGlqd0hvaHlv?=
 =?utf-8?B?Z0tPc2w2SjQ4OUszSyt5SU45MjBLMyswM0VRbldnYnIrYXdWUVZKSFVEUUFv?=
 =?utf-8?B?WlBrL3QxTTljUkJUSmI1bHVBK3dpN0dNb2JYRWVBLzNrbFIrQmZ4b3lPcjVH?=
 =?utf-8?B?NHNkSy9UbUE2WXVaU0V5R3E1c29NYi94bERVVHhEaGYwbVN4RFBseThwRk52?=
 =?utf-8?B?L0ZEYis3bElsbFVKKzZYSmRMczNUWWFVT2RXL3JFV2daK1BSNWh6eXZwVm8x?=
 =?utf-8?B?bXlXYWY2S1d6UVh4QmlJVHFQRlZTbytuSm5pVVFzQUJJVWhiamtpQlRPV1pm?=
 =?utf-8?B?SE1zZkhlVnprWWxwRGNZZ0paTFhZVlFtM2VTVlV0Y0dNalp5OXJNSGcwa2pa?=
 =?utf-8?B?UGlMMzJLeHJDUkEwUi9mbEhlNkVQRHhiYU9JVHFvOXJsNGdidUdaTHN6U2h5?=
 =?utf-8?B?cVpObUhxdEwvdXNjVTlTdnlaZEpndlRjY0NiQStiRVNFQ2ZzT1hCaUMzSGRZ?=
 =?utf-8?B?Q1JONW5TL1hkZ0V6MzZvdFFQVG1yekF2aWd0V2htTFF2ZmlManJDTE5mUzFD?=
 =?utf-8?B?WndVVytEeUxpSC83ZEZXMldZZjhyejJDaUU4QldRMG9aSURyMmJBamh6SFoz?=
 =?utf-8?B?c3FzbGJBUVBPTEhRV3ZXaUxHbWtBTlN3eFloVHFPRUZKNUdwYXcvU2dmOWdj?=
 =?utf-8?B?UTBuQ1ZpWWRSYU1HY0tVQWgxVXcwMFZtRWIwc2M4WWVxUXlpMko2QXFSWk9p?=
 =?utf-8?B?QmJncHpuZ0ZjRlZTb09EWHhWRElmQklsMHJpOGs0MHQwSnBZYy80UXhyY01r?=
 =?utf-8?B?RHlyb24xdEo4eTBFMGVlc3lLNDNzcmFpZ2pCME5pSlRsYzhEeHYxcUFYVS9B?=
 =?utf-8?B?dkg0ZDJGcVVNSlJndDNHbmdEQmdTNEN6bFAzcGUvTUlld3NHT1lOMHRPbm80?=
 =?utf-8?B?R3ZJUUk0ekNrRTEvTmVDUjU0UGIwN1QvRmRHT21OQTBiU1FrQk53NjM1dU5w?=
 =?utf-8?B?RUloNjE0VWRJOERrVVRsUDBJMSt3YmtKMUVQemRUbHA3UWxGYlVWZnZyclly?=
 =?utf-8?B?Rk83eExhTmVOcnlXR1lFRnlLVHoyS3JkQTRyZTFVR1Jab0xaM2YzZVQyK2tt?=
 =?utf-8?B?QnMrNkFBbzJsbHkyZ1lzRnhBZWlMY1dJVmloekdDRG5GdFRTZS9TUW9oYWh5?=
 =?utf-8?B?cExpaCtlV29jd2s5T1FCem9MUG93NUxGeE5GZENoS1dKQ0dUSGhxemVobGJI?=
 =?utf-8?B?dHFWMjlEUk5tWHZ3MUdVS2VsakQ3UkpNUWZkekluM1QraDEyRnVmR0p1KzNK?=
 =?utf-8?B?MkVvOTBMeEZwbXdoWnZIMDI0VDlyaU9kVU5KN25UN1NxbnllYldqNmc1dlF6?=
 =?utf-8?B?RTQ5YWRLVUQ3N2ZUaTFCZExqQWN0VG95ZkFmYXJmRjE5Qm0yRHczOTNSaVh1?=
 =?utf-8?B?U2hTVFAzMjl2RERLSHN2Uy9ZS0puQm5GVGh6WEZRN3o4bE9aMDdBZXhOdHEw?=
 =?utf-8?B?U1VrcmpENExaSGxnU0pNZC9qRUtSVHFiTk5OamFyV0g4TEpiY04yY056emhk?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F874C2CC815D847ABAD7FD8502DA3B4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eq0f4ut/vnhH1m1ouP4dZLIUWTwlUTJgAofGmsZljwWM/Hd4asoNLXmnsB0qWQ6EQkEzv/gpvzcIsbmtxun7uay6cKqeFvqVSudlFSWR0R563JH98lb/mJzsmnhKjEsxYe2220PndDN6BzwGcTdSsg39BD9dKDKdeorXeNLtMt4JWrGmwS6X2zmTWZ1n8Yprxxrv6hACOGYCyd+7ai67BghRrLrRRbmVjWsmoze4DEFMMHE3y356fyOaAaCAEQ9GDy7owpVMmHagYXQmrePhQfq39EdIUT3EFwWbrxnjqTia51aERzMdQI/iMGUqaDCKggIg9xtcUdWX6b3XvmsYWdxcjr/CdA7eWAzyQtkzLspwtAnSLT4zax03nn+r1iHdpW7opgGMfK+v1AwTj4w5xhwHm1D6eqcwrfNuBqcK3wGHrXovaEAI4RZ0Hidamrrq9lY5e3JFPnHYjI9udDVBT/M91JWb83ALq/f+iRx1guCFuPCOl8d7IGAtX3/MLMliqQ0u4d4QTNFG7msl03n2HnQtYSGfEw+XiIlSwhX/7/00Zwm1GrHrpxikSyuUe79jmBFLj1f1Zmvw5r36XDIWCItSd7IH1ERHkzqHg4oB1n9JX91fVJliHc2J6jzI7yp8jCk34Q4kR7Md6qFYQvtW9uJY3dXZKgjYQMackZ5cLu4OB18lJureKeaT3MDE8hG1193tszNINDgS23Mbg5cNwupagPIOyjhRb5xkRaE86N5RI+LvYEBBXX7D4Kuwdp+aCI86zm6LYOdkMYWSPpzv0ZJVhAfc1wqEJ4cK0TvLfcYu2MKgUZOGnEKDbz9Yu3R+
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fae4cb-68c3-4910-47df-08db2fa3e9e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:48:45.3094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buHLjvLNG0fI3DxzP94bBFFBnPx09XuRi768OJZaiI2l2wzPZg+1j6Szep5leilC0dO7fqqzFdZwiuQdyIwB3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280123
X-Proofpoint-GUID: N2JXcLfx_3xw-QHuKUkz9o8mIQ5L5yuJ
X-Proofpoint-ORIG-GUID: N2JXcLfx_3xw-QHuKUkz9o8mIQ5L5yuJ

DQoNCj4gT24gTWFyIDI4LCAyMDIzLCBhdCAxMTozMCBBTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFn
bG9AdW1pY2guZWR1PiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDI4LCAyMDIzIGF0IDExOjE5
4oCvQU0gT2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+IA0KPj4g
T24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMTE6MDbigK9BTSBDaHVjayBMZXZlciBJSUkgPGNodWNr
LmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+PiBPbiBNYXIg
MjgsIDIwMjMsIGF0IDExOjAzIEFNLCBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3
cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIFR1ZSwgMjAyMy0wMy0yOCBhdCAxNDo0NSArMDAwMCwgQ2h1
Y2sgTGV2ZXIgSUlJIHdyb3RlOg0KPj4+Pj4gDQo+Pj4+Pj4gT24gTWFyIDI4LCAyMDIzLCBhdCAx
MDozOSBBTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+Pj4+
PiANCj4+Pj4+PiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCAxMDoyOeKAr0FNIEplZmYgTGF5dG9u
IDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXQncyB0cnVl
IHRoYXQgaXQgaXMgbGVzcyBzZWN1cmUgdGhhbiBoYXZpbmcgZnVsbCBjaGFpbi1vZi10cnVzdCwg
YnV0DQo+Pj4+Pj4+IHRoaXMgc2VlbXMgbGlrZSBhIGNhc2Ugb2YgInBlcmZlY3QgYmVpbmcgdGhl
IGVuZW15IG9mIGdvb2QiLiBJZiB3ZSBkb24ndA0KPj4+Pj4+PiBhbGxvdyBmb3Igc2VsZi1zaWdu
ZWQgY2VydGlmaWNhdGVzLCB0aGVuIHdlJ3ZlIGNyZWF0ZWQgYSByYXRoZXIgbGFyZ2UNCj4+Pj4+
Pj4gaHVyZGxlIGZvciBhbnlvbmUgd2hvIHdhbnRzIHRvIGRlcGxveSB0aGlzLg0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gT25lIHRoaW5nIHdlIGNvdWxkIGRvIGlzIHJlaW5zdGF0ZSB0aGUgdGxzaGQgb3B0
aW9uLCBidXQgc3RpbGwgYWxsb3cgaXQNCj4+Pj4+Pj4gdG8gY2hlY2sgdGhlIHNpZ25hdHVyZS4g
VGhlbiBpdCBjb3VsZCBsb2cgc29tZXRoaW5nIGlmIHRoYXQgY2hlY2sgZmFpbHMNCj4+Pj4+Pj4g
YnV0IHN0aWxsIGFsbG93IHRoZSBjb25uZWN0aW9uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gV2Ugc2hv
dWxkIG9mIGNvdXJzZSBkb2N1bWVudCB3aHkgdXNpbmcgdGhhdCBvcHRpb24gaXMgbm90IGlkZWFs
LCBidXQNCj4+Pj4+Pj4gcmlwcGluZyBpdCBvdXQgZW50aXJlbHkgc2VlbXMgcmF0aGVyIGRyYWNv
bmlhbi4gVGhhdCdzIGp1c3QgZ29pbmcgdG8NCj4+Pj4+Pj4gZHJpdmUgcGVvcGxlIHRvIG5vdCB1
c2UgVExTIGF0IGFsbCBiZWNhdXNlIG9mIHRoZSBoYXNzbGUgZmFjdG9yLg0KPj4+Pj4+IA0KPj4+
Pj4+IEkgd291bGQgYXJndWUgdGhhdCAibm8gdmVyaWZpY2F0aW9uIiBvcHRpb24gc2hvdWxkIG9u
bHkgYmUgYWxsb3dlZCBpbg0KPj4+Pj4+IHNvbWUgZXh0cmVtZSBjYXNlcy4gTGlrZSBzYXkgaGF2
aW5nIGFuIG9wdGlvbiB0aGF0IGV4cGxpY2l0bHkgc2F5cw0KPj4+Pj4+IGl0J3MgcnVubmluZyBp
biBhIGRlYnVnIG1vZGUgYW5kIHNheSBvbiB0aGUgZm9yZWdyb3VuZCBvbmx5ICgtZCAtZg0KPj4+
Pj4+IC0tbm92ZXJpZnkpLiBIYXZpbmcgc3VjaCBvcHRpb25zIG1pZ2h0IGNsZWFybHkgc3RhdGUg
dGhlIGludGVudCBpcyB0bw0KPj4+Pj4+IGRlYnVnIG9ubHkgYW5kIG5vdCBydW4gZm9yIGFueSB1
c2VyIHVzYWdlLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgYWxzbyBkb24ndCBzZWUgYSByZWFsIHJlYXNv
biBmb3IgIm5vdmVyaWZ5IiBvcHRpb24gZXhjZXB0IHRvIHJlbW92ZQ0KPj4+Pj4+IGZydXN0cmF0
aW9ucyBkdXJpbmcgdGhlIHNldHVwLg0KPj4+Pj4gDQo+Pj4+PiBJIG1pZ2h0IHB1dCBpdCB0aGlz
IHdheTogd2UgZG9uJ3Qgd2FudCB0byBoYXZlIGN1c3RvbWVycyBpbnN0YWxsaW5nDQo+Pj4+PiBz
b21ldGhpbmcgb24gdGhlaXIgY2xpZW50cyB3aG9zZSBvdXQtb2YtdGhlLXNocmlua3dyYXAgY29u
ZmlndXJhdGlvbg0KPj4+Pj4gaXMgbGVzcyB0aGFuIHNlY3VyZS4gIm5vIHZlcmlmaWNhdGlvbiIg
aXMgbGVzcyB0aGFuIHNlY3VyZS4NCj4+Pj4+IA0KPj4+Pj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBi
ZSB0byBoYXZlIHNvbWUga2luZCBvZiB3YXkgdG8gZ2V0IHNlbGYtc2lnbmVkDQo+Pj4+PiBjZXJ0
cyB3b3JraW5nIHdpdGggbm8gY2xpZW50LXNpZGUgY29uZmlndXJhdGlvbiBuZWVkZWQuIElmIHRo
ZQ0KPj4+Pj4gY2xpZW50IG1vdW50cyB3aXRoICJ4cHJ0c2VjPXRscyIgaXQgc2hvdWxkIHdvcmsu
IERvIHdlIG5lZWQgdG8NCj4+Pj4+IHBsdW1iIHRoYXQgaW50byBvdXIgaGFuZHNoYWtlIHVwY2Fs
bCBhbmQgbWFrZSAiYW5vbnltb3VzIg0KPj4+Pj4gaGFuZHNoYWtlcyBleHBsaWNpdGx5IGFsbG93
IHVucmVjb2duaXplZCBzaWduZXJzPw0KPj4+Pj4gDQo+Pj4+IA0KPj4+PiBTaW5jZSB0aGUgY2xp
ZW50IGlzIHRoZSBzaWRlIHRoYXQncyByZWplY3RpbmcgdGhpbmdzLCBoYXZpbmcgYSBtb3VudA0K
Pj4+PiBvcHRpb24gdGhhdCBhbGxvd3MgeW91IHRvIHJlbGF4IHRoYXQgY2hlY2sgc2VlbXMgbGlr
ZSB0aGUgcmlnaHQNCj4+Pj4gYXBwcm9hY2guDQo+Pj4+IA0KPj4+PiBIb3cgYWJvdXQgYSBuZXcg
eHBydHNlYz0gb3B0aW9uPyBNYXliZSAieHBydHNlYz1udnRscyIgKG5vIHZlcmlmeSBUTFMpPw0K
Pj4+PiBUaGF0IHdvdWxkIGFsbG93IHRoaW5ncyB0byB3b3JrIG91dCBvZiB0aGUgYm94LCBidXQg
c3RpbGwgbGVhdmUNCj4+Pj4geHBydHNlYz10bHMgYXMgdGhlIG1vcmUgc2VjdXJlIG1ldGhvZC4N
Cj4+PiANCj4+PiBOYWguIHhwcnRzZWM9dGxzIGlzIHN1cHBvc2VkIHRvIGJlIGxlc3Mgc2VjdXJl
OiBubyBhdXRoZW50aWNhdGlvbiwNCj4+PiBqdXN0IGVuY3J5cHRpb24uIFRoZSBzZWN1cmUgbWV0
aG9kIGlzIHhwcnRzZWM9bXRscy4NCj4+IA0KPj4gV2hhdCdzIHRoZSBwb2ludCBvZiAibm8gYXV0
aGVudGljYXRpb24iLiBJIHRob3VnaHQgdGhlIHNlcnZlciBpcw0KPj4gYWx3YXlzIGF1dGhlbnRp
Y2F0ZWQuDQo+IA0KPiBTb3JyeSBPayB3ZSBhcmUgZGlzY3Vzc2luZyBubyBhdXRoZW50aWNhdGlv
bi4gQnV0IG15IHBvaW50IHdhcyAiVExTIg0KPiBpbiBpdHMga25vdyBkb2Vzbid0IG1lYW4gbGVz
cyBzZWN1cmUgYW5kIGFsd2F5cyBkb2VzIHNlcnZlciBzaWRlDQo+IGF1dGhlbnRpY2F0aW9uLiBJ
biB0aGUgZWFybHkgZGF5cyBvZiBUTFMsIHlvdSBjb3VsZCBjaG9vc2UgdG8gZG8gcHVyZQ0KPiBE
aWZmaWUgaGVsbG1hbiBhbmQgdGhhdCB3YXMgIm5vIGF1dGhlbnRpY2F0aW9uIiBidXQgdGhhdCdz
IG5vIGxvbmdlcg0KPiBhbiBvcHRpb24uDQo+IA0KPiBIVFRQUyBleHBsaWNpdGx5IHByb21wdHMg
dGhhdCB1c2VyIHRvIGRvIG1hbnVhbCB2ZXJpZmljYXRpb24gKGllIHdoZW4NCj4gaXQgY291bGRu
J3QgdmVyaWZ5IHVzaW5nIGV4aXN0aW5nIENBcykuIEl0IG5ldmVyIGFsbG93cyBmb3IgIm5vDQo+
IHZlcmlmaWNhdGlvbiIgd2hpY2ggd2UgYXJlIGRpc2N1c3NpbmcgaGVyZS4NCg0KVG9kYXksIG91
ciBjbGllbnQgYWx3YXlzIGF1dGhlbnRpY2F0ZXMgdGhlIHNlcnZlci4NCg0KVGhhdCBtZWFucyB0
aGF0IGZvciBzZWxmLXNpZ25lZCBlbnZpcm9ubWVudHMsIHRoZSBzZXJ2ZXIncyBjZXJ0aWZpY2F0
ZQ0KaGFzIHRvIGJlIGRpc3RyaWJ1dGVkIHRvIGFsbCBjbGllbnRzLiBUaGF0IGFsc28gbWVhbnMg
dGhhdCBhdXRvbWF0aWNhbGx5DQphZGRpbmcgYSBzZWxmLXNpZ25lZCBzZXJ2ZXIgY2VydCB3aGVu
IGt0bHMtdXRpbHMgaXMgaW5zdGFsbGVkIGlzIG5vdA0KZ29pbmcgdG8gYXMgaGVscGZ1bCBhcyB3
ZSBtaWdodCB3YW50Lg0KDQpJIHJlYWxseSB3YW50ZWQgdG8gaGF2ZSBhIHdheSB0byBlbmFibGUg
ZW5jcnlwdGlvbiB3aGlsZSBhdm9pZGluZyB0aGUNCiJjbGllbnQga2V5IGRpc3RyaWJ1dGlvbiIg
cHJvYmxlbSwgYW5kIHRvIHBlcm1pdCBzZWxmLXNpZ25lZCBjZXJ0cyB0bw0KYmUgdXNlZCBpbiB0
aGlzIG1vZGUuDQoNClNvbWUgcG9zc2libGUgY2hvaWNlczoNCg0KIC0gU3RhdGUgdGhhdCB0aGUg
d2F5IHRvIGF2b2lkIGNsaWVudCBrZXkgZGlzdHJpYnV0aW9uIGlzIGZvciB0aGUNCiAgIHNlcnZl
ciBhZG1pbmlzdHJhdG9yIHRvIGFjcXVpcmUgYSBjZXJ0aWZpY2F0ZSB0aGF0IGlzIHNpZ25lZCBi
eQ0KICAgYSBDQSB0aGF0IGlzIGFscmVhZHkga25vd24gdG8gY2xpZW50cy4gVGhpcyBpcyBlYXN5
IGZvciB1cywgYW5kDQogICBJIHN1c3BlY3QgdGhlIHNlY3VyaXR5IGNvbW11bml0eSB3b3VsZCBi
ZSBhZ3JlZWFibGUgb25seSB0byB0aGlzDQogICBhbHRlcm5hdGl2ZS4NCg0KIC0gV2Vha2VuIHRo
ZSBjbGllbnQncyBzZXJ2ZXIgYXV0aGVudGljYXRpb24gc28gdGhhdCBpdCBkb2VzIG5vdA0KICAg
ZmFpbCB0aGUgaGFuZHNoYWtlIGlmIHRoZSBzZXJ2ZXIncyBjZXJ0aWZpY2F0ZSBpcyBzZWxmLXNp
Z25lZA0KICAgKG9ubHkgZm9yIHhwcnRzZWM9dGxzKS4gWWVzLCB0bHNoZCB3b3VsZCBsb2cgdGhl
IHZlcmlmaWNhdGlvbg0KICAgZmFpbHVyZS4NCg0KIC0gQWRkIGEgdGhpcmQgeHBydHNlYz0gbW9k
ZSB3aGVyZSBubyBzZXJ2ZXIgdmVyaWZpY2F0aW9uIGlzIGRvbmUuDQoNCiAtIEFkZCBhIGNvbmZp
Z3VyYXRpb24gb3B0aW9uIHRvIC9ldGMvdGxzaGQuY29uZiB0aGF0IHdlYWtlbnMNCiAgIHRoZSBh
bm9ueW1vdXMgcG9saWN5IHNvIGl0IGRvZXMgbm90IHZlcmlmeSB0aGUgc2VydmVyLg0KDQoNCj4+
PiBJTU8geHBydHNlYz10bHMgbmVlZHMgdG8gc2tpcCB0aGUgc2lnbmVyIGNoZWNrLiBJIHRoaW5r
IEkgY2FuIG1ha2UNCj4+PiB0bHNoZCBkbyB0aGF0Lg0KPj4gDQo+PiBJIGd1ZXNzIGluIHRoYXQg
Y2FzZSwgSSAoZ3J1ZGdpbmdseSkgYWdyZWUgd2l0aCBzb21ldGhpbmcgbGlrZQ0KPj4geHBydHNl
Yz1hbm9ueW1vdXMvbnZ0bHMiLg0KDQpObyBzbmFwIGRlY2lzaW9ucyB0b2RheS4gV2UgZG9uJ3Qg
cXVpdGUgaGF2ZSBhIGNvbnNlbnN1cyBvbiB0aGlzIHlldC4NCg0KQW5kLCBJIHRoaW5rIHRoZXJl
IGlzIGEgcmVhc29uYWJsZSB3b3JrYXJvdW5kIGZvciB0aGUgbW9tZW50OiBpZg0KdGhlIHNlcnZl
ciBjZXJ0IGlzIHNlbGYtc2lnbmVkLCBqdXN0IGRpc3RyaWJ1dGUgaXQgdG8gY2xpZW50cy4NCg0K
DQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
