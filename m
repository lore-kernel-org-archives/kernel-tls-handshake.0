Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB75182D4
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 31 May 2023 18:56:10 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VERWTG016287;
	Wed, 31 May 2023 18:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=eIvbEu7fcqvNiC5tV045f4t1Rtq0gJYlp0v0FLDCLA0=;
 b=xhVbiPPZNh994bvJqvvwxEYtJyJSAB6T5HJBepwBhTjekb589JjYbCZwrU9Fl3sVNIfn
 SAk8D2Ct+an6vG0u0eZUeTYGjpaTP6S/P1nxgP6YScgXEdNIDJbqS6zeFyPkQ8Ue5FPH
 7yFOC58O7uZ50z2fGegIY2h0MgZujMTzxownOLWFv2i7w5hIMBhhqLTQDN/4YdOiITFd
 TzkCgw8RwAwfUOOmOakdg/BwWEqbCKaRZf9h5xGpoEYLJrIU66qMZ+siXrFyjhJMELDY
 oSzUYcg225jI1tDQpyoDtYDZCu0S+gYmmLgr1sXPDb5E8Gx35deF+C7xV98e9HkHYJLR Aw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhmeppxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 18:55:59 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34VIAoeB019749;
	Wed, 31 May 2023 18:55:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qu8a6a4yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 18:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdtGOdpi90Z965tqJaGiN6pZu7W8n5HG444fcYWy7LMe/G6hmZIcSm/PDltNmGEvVTq7tV03NrRYhDVckhyxJBDzbj3txtLYO0rWThWnk2NtXLeeqsd3Pao0slW+Fg22EwL6FvlsUhANwlQRtpMKCWuA1udYHIj5u7IrD6RueyfhFsKeTor03Zdlj9DSKW4adL5vFMf15LUtyMTCFvCpLe4j8eefEeQ5cHHr2IOFrkLWIMp7MmGqrNqAT67DqdrqawC2idlY8YT/m5vTiSFfwyw7MpaPzSfzrpKnFCxtHVQwGT6+OYtPVRmn5Lhca9IpwwdFiMem7vX9TPQjeOlTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIvbEu7fcqvNiC5tV045f4t1Rtq0gJYlp0v0FLDCLA0=;
 b=A2AYn6waqpZucWvAbOvHd9zhyCeytb8pelFspGFE7RArANlCJNty0nX3ddhwavWcDpJkZiFmjLFpAk+R1m2xlqkgME2sMTD1r5opnw4tRB4LOLv4fiFKsztKEpbkJJBeSvzYmGdlfm2WBRvJC3ShLrRYo/JcoRVoPqKPikZjEdcNTd8Panxa8OdY/WFYdlb7EZa3gd9sYKfUho+3D+W6gDUe/XlkVuMRY28XKImGT2qQ3lwUz4qp3jxH1LamZ/OCukpIaN3wexlnge6NN/Qiq15zDleyEj4KMujJ+1LIcc1DaaG7iEWI6jId9zPc6ZDcmZHdJ0zSkMxP1op7Om5f0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIvbEu7fcqvNiC5tV045f4t1Rtq0gJYlp0v0FLDCLA0=;
 b=aJGglQAAR92n3gcTuf/XEslHOzJI1AJ6S1MQFVfLn8z2EcsBJuLzmFL2s49wQIYobacAfp5TkLKhQKHF9EnI92HZZxz+q5UB3ofvcWIVSkB4EYXBicQiybWdrfccxLtjvhDX8Mzk6IfrC2X/e1RivbtbzvIHk6+N1usmAHJFKi4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CO1PR10MB4579.namprd10.prod.outlook.com (2603:10b6:303:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 18:55:56 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 18:55:56 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
Thread-Topic: what should happen for proto=rdma,xprtsec=tls
Thread-Index: AQHZkzrk6rAEvRS9WEuMQJIn/kwPgK9zT9YAgAAFcQCAARVtgIAAChGAgABHx4A=
Date: Wed, 31 May 2023 18:55:56 +0000
Message-ID: <F44356CE-9A7E-4D6D-ADC8-AF9407CBAD1F@oracle.com>
References: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
 <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
 <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
 <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CO1PR10MB4579:EE_
x-ms-office365-filtering-correlation-id: 15870946-316f-4900-52a3-08db6208aa62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hDI2YiiGG39unORHfC7G9aG66CrsHzEzNZTvLf9DiK07CZlf3n6MzJ27B7nR2pCHQxIz765pM8c+bOjqAmbULv6w4xS4I0QbweUP1UWapvpxBpbTaRV4qRA+e3jy+m3m49Q11C/Xo9PnfcTnVaITSP4uUOMzW8GTEPdWNS1Jwn21cDP+wtuxIAHeF5QFN9HSsOZuhTRtvYXCukmpxbXMwj7n8HpBuhHNGvWEi6V210idQvLAzudTHJIVq1j2R9fLR6+TLYFnnKeN+43J2HxqqRMnk3plPEvvBb4BBHvgqzrpOsptBuwDjmZOgycrHFjqGoIjdlQ9TuSWcfXXz4O7JheLryxQp05mHBz/YY7Z+z9PptpStNLBol6hV2t/xAo0/UfE9rUS9SCD29eo13s4mHEbCqX2biKpCq9XkPV6dKnO+YniqyJaWZuJBHPj/+e7wB77lU9iTiHc5l2ubmh+saEnbbArsn1U8YLCacqr9RQGRQ796+Vm94FPYCRe0lqBbLeLN65l9Td+wWrK4sgbDBEVP45K4fHdmnSMVMebGw6Ey8cKPyWOmI81N9csSjZ573UFJmCJP6nOwoAmPAXtwLgHqlDNwNskPtGMQ5xomrZ2WAB4ztpz4yhNCOXeDMhv3tV/Dx6SIFp6W/XaWei3Tw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(38070700005)(6486002)(122000001)(2906002)(186003)(41300700001)(86362001)(38100700002)(8676002)(8936002)(2616005)(478600001)(33656002)(53546011)(26005)(6512007)(71200400001)(316002)(6506007)(83380400001)(64756008)(4326008)(91956017)(76116006)(66946007)(66556008)(36756003)(6916009)(66446008)(66476007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c0lDVU8rVDFWbVpGTTRUYjJ2a3pPUDFFdGRZaE9ZZTdQSHNBMXNWbEI0L3Zk?=
 =?utf-8?B?U0p6Q3BFS3I0ZGluaXRxM24vZ3lpSVpkRGJ2UG1OR2toWWJGVlpKeE1TcFFn?=
 =?utf-8?B?TVlGU2xPejc1LzVoRGkzODUzTkROZTl6V3EvdEZqL293RmpHdDRDV2tqRklm?=
 =?utf-8?B?cjkrdUQ3TnFMTGNWUmZ6NTZhcUdPMFlDNURRTUZTSFN1OGVXWUVDVVQ1Qlhq?=
 =?utf-8?B?dERKRTJQYXpHZkdibmxJdE42OEppbC9IdzZ3c0JwVTlTSmNnME01QkhHaW9N?=
 =?utf-8?B?UzFIUzJWQUx6eE5WT3dwc29mREZVVloxdzF0ZE1FMjVpeVovU25sZlV5R2l4?=
 =?utf-8?B?Q3dQdUZQeUxLZ0dUTklaL1FEeTBYdDJZUUtpUTM1dGVHS2RZZjNLbVRENnZI?=
 =?utf-8?B?NmJWYXVsaEEyNkZsaGNxRTRjUWJGTXh1aWN3eDMwNFkwOTZhNGlobUJzYWFX?=
 =?utf-8?B?akpQYjJ1T0F2Y2NTb3ZTVTJNcFFLbGNGR2srOWdNVHFORjN3YldGMlFMWlFi?=
 =?utf-8?B?alRNOFdKOHpyUkNHTGpXN3VvbmkzajI2RXUwZ2I5VHlUcmx0VVdwbkJkSklu?=
 =?utf-8?B?T09TM2ZoejVUemFYSUtad0xDdjBnMTZWdS9pWlJuWHBIdEFvRkFmQkpNRzVj?=
 =?utf-8?B?TXdOamR0RUl1NnpyRHRQdEo0YTNyK0lBSnhwdXlmS1g0bVpKQ3orQkVaM3hH?=
 =?utf-8?B?bEkvS1dLOVNkeHkycDhJUkRsUXJyemY1M2ExbVlsZk9HbnRITmxtcTZaYnZu?=
 =?utf-8?B?ajdWL0d1QW02Q3pJVDhUeGUvYmhHTm84M1RvcEplU2xQMDBsQmpFL1o4Nnln?=
 =?utf-8?B?ckpUbkdYbXI4OGdpbzhjcmVLVFFOMC9SNWtLMkx4MGlDRmV3UDdvUXp3Qll6?=
 =?utf-8?B?ZUJlTGVUck4vOVNqRVE0Y20yQVg2NFVRQ0dvc2VDcHZYZ2VJck1uQ3F2Y29q?=
 =?utf-8?B?V05mYmxUYkc0R2ZuYlNKY0p2aUlWK3NWRjVGSWRNUnE3eW94WFJEWnIyWXo0?=
 =?utf-8?B?SW1jUG1XSVN1cGRqMmZRVEpETVZmT0wvYTROYWFZZXVodTFBdTBBdlVWYkd3?=
 =?utf-8?B?R0Y5OUdWalJjTFlHQ1FMMzk2dWJKSENudmpIWWVxZ1RmVzNVRnhxRldPUWZw?=
 =?utf-8?B?QTFpZldDeHJFeitndzdNWWNoRDFkYTJBb3JqT0lmbmlTY0l5TmRMejZoWXlo?=
 =?utf-8?B?b0RKL1VjeGJ6UHJOTFZyUWl6SzRITGJuN1FJVDF6T083elpXWjRMQnBtcE5x?=
 =?utf-8?B?ZVpkeGRyN2ROMTBhdHdEemljVjVWVlY3bXJYSitOdlZjVFlseDJKSUdxeUlx?=
 =?utf-8?B?QmJQK2dWcFRxckFFM2hhZVd4b1B0cTZ2Si9JQm1rVG1kd2xBM1R4UE5RVnF6?=
 =?utf-8?B?MDV4TXNaUTFFU1hVNjF1SlZENldzeVRzZTdMb2dOOXJhbU1FcWF4TGVLUE95?=
 =?utf-8?B?OURFZ3JQU1p6Rjh2bFh0U2pXTEc5YVE5YVozbUlqbDRYN3JwclNHMTBnTWdq?=
 =?utf-8?B?N0FrYjNuMkc2U1dHZUtMRlZiQytWRnV4bDViZms1Y3NtaE5mWkFvN0psdnN2?=
 =?utf-8?B?MDVVN1FqM1NmdWZ4Z3dBNUhPNW10TklGdThySE9uanE5QmUvdjl1Q0FFakxS?=
 =?utf-8?B?bis4aERraWZkN2pJUWNSMURpV0dtdzJZQ2hSeTRRbXJmaFBTWWkwSUJsaFVo?=
 =?utf-8?B?YTB3dytvREJzZ1o0dExleGpsLzVHUXlxR0hVYlZkWURWSVdSRmhUUDY4Qnor?=
 =?utf-8?B?WnRUaC94UUtUYlZMSnUxUWVyb2JRaFQzZnAxektuSGJ1TzgzRTByNitvd1NK?=
 =?utf-8?B?MFZhVVl6dzhacFZMZEs4YmdDRnhFSnllcHlBbm0rZWEvS0pQbUg2SndOczZn?=
 =?utf-8?B?YVZsL2E4UWQ5TXhsZk1NaUFJcGt2NjdHcUVKODZiekFLaCtuSE9peEN0dVc2?=
 =?utf-8?B?Tm56VFB3N3FmMkFjaDlhZHNLaTRXUUd0MGhHRHliK1d0VUxKOVBjV0xORGIz?=
 =?utf-8?B?NDhFMG0wKzNzN214UjQyZmpnanpoazlDT1h2VFpqZC9xMFo5QXo3LzUzdHRu?=
 =?utf-8?B?RkplYXZIMUhlOExQTkRaUmh6Tm9ocnRxdDBQODFFWE1rSjRmekF2RnBrcnMy?=
 =?utf-8?B?U0hHem9ONlhzNTEvMDJjbHZOMDJqUW9YcGNHaG9KOHRwdGNUb0hKcEx3KzRk?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4F456199B0B8144ADA79CDD45B47FD5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4Y4RqetyjmKBliA/MBjT1PjqS9OgVEXTmhtVIuWoTSJsWIzD/F/tiniy3tiQvvhkZhfeOnky3ZqWQGsGLPMBoh6WSpX50qTAb+aKyc9AEk6e8spA7+gTA67EjgAlJeLOX53tnGXwbg2/gG/AO6p5XehJWw4957vbV2Z2WAQ+TcEpjRYqiqxD1FYTGEx030EM/zdIPeOFe6MHaYUFei2iMVq9Hms/pkgPJrV+oKFiVVXtDlRB+2jVAPiYmmW5K9Q46L0pvaDkQ1pkRPJaQEvJ2D1ozvIbhm3rAVI9hRlnkxCdq66ZiTRBCNdi3HoHJqf5lcYLuiWeqdxF1Rz/scoW7erXcwxr8HJ96kSWiZc9HkLKwInjX3f5v5b25UnZ/cRLcZHil/YRlUIUJUh+VEleMrY6/hjf2ndhq1X4q0n61qEmrVn8x4qiN3bRkfrkDNHNT5Xe3kKVa+0/uhCwMXDXyTlgAgpPOMf241G5S68bKXeE2Ulcsm3Jlr7gSEE8NEJWjOxgfhoJOsiLUYTIxs8wQOfGU3sx7VObZca5/CCqtwkAuU5HnltVfuB60AKi/R5lFYU+BQcR2cS4mZwaqVXl6YCJdEEEPtVGmNrFphAdCydDADIGT15owtiI121QLvP/sxjIq9JJLLjkyH+nzQeuzRB9Wg6Mf1uR/m4HZv8HpXpHh9kkQ8jv2nQJKPDaEP2SWmaPSkRRwMGzG9M282cAI/51ku+mjwiuTQegfbl4agjMNFAkerCh4yieJoF93b721lI8flZJe3Iay5K9UluGfygNsRFr5UX1xKqWw7fiojM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15870946-316f-4900-52a3-08db6208aa62
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 18:55:56.0852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmWHAJiVvstWODlTPGTQYyAevTbfgRDeZwgwks2FO9XUF4VNAyHVWL+aPC70mQK5IljWa7zIF3ptE0gS9ddRIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4579
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_14,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310160
X-Proofpoint-ORIG-GUID: R06kWTGFONrfT58ugS7TppFKEREudamU
X-Proofpoint-GUID: R06kWTGFONrfT58ugS7TppFKEREudamU

DQoNCj4gT24gTWF5IDMxLCAyMDIzLCBhdCAxMDozOCBBTSwgT2xnYSBLb3JuaWV2c2thaWEgPGFn
bG9AdW1pY2guZWR1PiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTWF5IDMxLCAyMDIzIGF0IDEwOjAz
4oCvQU0gQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5sZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4+
IA0KPj4gDQo+PiANCj4+PiBPbiBNYXkgMzAsIDIwMjMsIGF0IDU6MjkgUE0sIE9sZ2EgS29ybmll
dnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBNYXkgMzAs
IDIwMjMgYXQgNToxMOKAr1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNv
bT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiBNYXkgMzAsIDIwMjMsIGF0
IDU6MDggUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4+
PiANCj4+Pj4+IEhpIENodWNrLA0KPj4+Pj4gDQo+Pj4+PiBJIGRpZA0KPj4+Pj4gW2FnbG9AdW5r
bm93bjAwMGMyOWRiYTYxNiB+XSQgc3VkbyBtb3VudCAtbw0KPj4+Pj4gdmVycz00LjIsc2VjPXN5
cyx4cHJ0c2VjPXRscyxwcm90bz1yZG1hLHBvcnQ9MjAwNDkNCj4+Pj4+IDE5Mi4xNjguMS4xMDY6
L25mc3NoYXJlIC9tbnQNCj4+Pj4+IHdoaWNoIHN1Y2NlZWRlZCBhbmQgdGhlbiBJIGRpZCAibW91
bnQiIHdoaWNoIGRpc3BsYXlzOg0KPj4+Pj4gMTkyLjE2OC4xLjEwNjovbmZzc2hhcmUgb24gL21u
dCB0eXBlIG5mczQNCj4+Pj4+IChydyxyZWxhdGltZSx2ZXJzPTQuMixyc2l6ZT0yNjIxNDQsd3Np
emU9MjYyMTQ0LG5hbWxlbj0yNTUsaGFyZCxwcm90bz1yZG1hLHBvcnQ9MjAwNDksdGltZW89NjAw
LHJldHJhbnM9MixzZWM9c3lzLHhwcnRzZWM9dGxzLGNsaWVudGFkZHI9MTkyLjE2OC4xLjExOSxs
b2NhbF9sb2NrPW5vbmUsYWRkcj0xOTIuMTY4LjEuMTA2KQ0KPj4+Pj4gTmF0dXJhbGx5IG5vIFRM
UyBoYXBwZW5zIGZvciByZG1hIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhpcyBtb3VudA0KPj4+Pj4g
c2hvdWxkIGZhaWw/IG9yIElmIHRoZSAibW91bnQiIGFmdGVyd2FyZHMgc2hvdWxkbid0IGRpc3Bs
YXkvY2xhaW0gdGhhdA0KPj4+Pj4gaXQncyBkb2luZyB4cHJ0c2VjPXRscz8NCj4+Pj4gDQo+Pj4+
IFRoYXQgbW91bnQgcmVxdWVzdCBzaG91bGQgaGF2ZSBmYWlsZWQuDQo+Pj4gDQo+Pj4gU28gcGVy
aGFwcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS9mcy9uZnMv
ZnNfY29udGV4dC5jIGIvZnMvbmZzL2ZzX2NvbnRleHQuYw0KPj4+IGluZGV4IGU0OWUzZDE4ZWY4
OC4uNWZjMjI5YTc2OTBiIDEwMDY0NA0KPj4+IC0tLSBhL2ZzL25mcy9mc19jb250ZXh0LmMNCj4+
PiArKysgYi9mcy9uZnMvZnNfY29udGV4dC5jDQo+Pj4gQEAgLTMzNCw3ICszMzQsMTAgQEAgc3Rh
dGljIGludCBuZnNfdmFsaWRhdGVfdHJhbnNwb3J0X3Byb3RvY29sKHN0cnVjdA0KPj4+IGZzX2Nv
bnRleHQgKmZjLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9pbnZhbGlkX3Ry
YW5zcG9ydF91ZHA7DQo+Pj4gICAgICAgICAgICAgICBicmVhazsNCj4+PiAgICAgICBjYXNlIFhQ
UlRfVFJBTlNQT1JUX1RDUDoNCj4+PiArICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4gICAgICAg
Y2FzZSBYUFJUX1RSQU5TUE9SVF9SRE1BOg0KPj4+ICsgICAgICAgICAgICAgICBpZiAoY3R4LT54
cHJ0c2VjLnBvbGljeSAhPSBSUENfWFBSVFNFQ19OT05FKQ0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gb3V0X2ludmFsaWRfdHJhbnNwb3J0X3JkbWE7DQo+Pj4gICAgICAgICAgICAg
ICBicmVhazsNCj4+PiAgICAgICBkZWZhdWx0Og0KPj4+ICAgICAgICAgICAgICAgY3R4LT5uZnNf
c2VydmVyLnByb3RvY29sID0gWFBSVF9UUkFOU1BPUlRfVENQOw0KPj4+IEBAIC0zNDIsNiArMzQ1
LDggQEAgc3RhdGljIGludCBuZnNfdmFsaWRhdGVfdHJhbnNwb3J0X3Byb3RvY29sKHN0cnVjdA0K
Pj4+IGZzX2NvbnRleHQgKmZjLA0KPj4+ICAgICAgIHJldHVybiAwOw0KPj4+IG91dF9pbnZhbGlk
X3RyYW5zcG9ydF91ZHA6DQo+Pj4gICAgICAgcmV0dXJuIG5mc19pbnZhbGYoZmMsICJORlM6IFVu
c3VwcG9ydGVkIHRyYW5zcG9ydCBwcm90b2NvbCB1ZHAiKTsNCj4+PiArb3V0X2ludmFsaWRfdHJh
bnNwb3J0X3JkbWE6DQo+Pj4gKyAgICAgICByZXR1cm4gbmZzX2ludmFsZihmYywgIk5GUzogVW5z
dXBwb3J0ZWQgeHBydHNlYyBvcHRpb24gZm9yIHJkbWEiKTsNCj4+PiB9DQo+Pj4gDQo+Pj4gW2Fn
bG9AdW5rbm93bjAwMGMyOWRiYTYxNiB+XSRzdWRvIG1vdW50IC1vDQo+Pj4gdmVycz00LjIsc2Vj
PXN5cyx4cHJ0c2VjPXRscyxwcm90bz1yZG1hLHBvcnQ9MjAwNDkNCj4+PiAxOTIuMTY4LjEuMTA2
Oi9uZnNzaGFyZSAvbW50DQo+Pj4gbW91bnQubmZzOiBhbiBpbmNvcnJlY3QgbW91bnQgb3B0aW9u
IHdhcyBzcGVjaWZpZWQNCj4+PiANCj4+PiBJIHdhcyBleHBlY3RpbmcgdG8gc2VlICJORlM6IFVu
c3VwcG9ydGVkIHhwcnRzZWMgb3B0aW9uIGZvciByZG1hIiBub3QNCj4+PiB0aGUgImFuIGluY29y
cmVjdCBtb3VudCBvcHRpb24gd2FzIHNwZWNpZmllZCIuIEJ1dCBpZiBJIHRyeSB0byBkbw0KPj4+
ICJwcm90bz11ZHAiIEkgZG9uJ3Qgc2VlIHRoZSAidW5zdXBwb3J0ZWQgdHJhbnNwb3J0IHByb3Rv
Y29sIHVkcCIgc28NCj4+PiBJJ20gbm90IHN1cmUgd2hhdCB0aGlzIG5mc19pbnZhbGYoKSBpcyBz
dXBwb3NlZCB0byBkby4NCj4+IA0KPj4gQXJjaGl0ZWN0dXJhbGx5LCB0aGUgTkZTIGNsaWVudCBz
aG91bGQgcGFzcyB0aGVzZSBvcHRpb24NCj4+IHNldHRpbmdzIGRvd24gdG8gUlBDIGFuZCBsZXQg
dGhlIHRyYW5zcG9ydCB0ZWxsIGl0IHRoYXQNCj4+IFRMUyBpc24ndCBhdmFpbGFibGUuDQo+PiAN
Cj4+IEkgdGhvdWdodCBSRE1BIHdhcyBtaXNzaW5nIHRoZSBmdW5jdGlvbnMgdGhhdCBtYXJrZWQg
aXQNCj4+IGFzIHN1cHBvcnRpbmcgVExTLCBhbmQgc28gaXQgc2hvdWxkIGhhdmUgZmFpbGVkIHRo
ZSBtb3VudC4NCj4+IEkgbXVzdCBoYXZlIG1pc3NlZCBzb21ldGhpbmcuDQo+IA0KPiBBaCwgb2su
DQo+IA0KPiBTbyBpbiB0aGF0IGNhc2UgaGVyZSdzIGFub3RoZXIgKGZhaWx1cmUpIG9uZSBmb3Ig
eW91IC0tLSBtb3VudCBvdmVyDQo+IFVEUCB3aXRoIHhwcnRzZWM9dGxzLg0KPiANCj4gW2FnbG9A
dW5rbm93bjAwMGMyOWRiYTYxNiB+XSQgc3VkbyBtb3VudCAtbw0KPiB2ZXJzPTMsc2VjPXN5cyxw
cm90bz11ZHAseHBydHNlYz10bHMgMTkyLjE2OC4xLjEyNTovdm9sMSAvbW50DQo+IA0KPiAxOTIu
MTY4LjEuMTI1Oi92b2wxIG9uIC9tbnQgdHlwZSBuZnMNCj4gKHJ3LHJlbGF0aW1lLHZlcnM9Myxy
c2l6ZT0zMjc2OCx3c2l6ZT0zMjc2OCxuYW1sZW49MjU1LGhhcmQscHJvdG89dWRwLHRpbWVvPTEx
LHJldHJhbnM9MyxzZWM9c3lzLHhwcnRzZWM9dGxzLG1vdW50YWRkcj0xOTIuMTY4LjEuMTI1LG1v
dW50dmVycz0zLG1vdW50cG9ydD02MzUsbW91bnRwcm90bz11ZHAsbG9jYWxfbG9jaz1ub25lLGFk
ZHI9MTkyLjE2OC4xLjEyNSkNCg0KSWYgd2UgZXZlciBhZGQgRFRMUyBzdXBwb3J0LCB0aGF0IHNo
b3VsZCB3b3JrLiBJdCB3b24ndCB0b2RheSwNCnRob3VnaCwgYW5kIHRoZSBtb3VudCBzaG91bGQg
ZmFpbC4gSWYgeW91IGFzayBmb3IgeHBydHNlYz10bHMNCmFuZCB0aGUgdHJhbnNwb3J0IGNhbm5v
dCBwcm92aWRlIGl0LCB0aGUgbW91bnQgbmVlZHMgdG8gZmFpbC4NCg0KSSdtIGdvaW5nIHRvIGhh
dmUgdG8gcmV3cml0ZSBhbGwgb2YgdGhpcyBkdWUgdG8gVHJvbmQncyBtb3N0DQpyZWNlbnQgcmV2
aWV3IGNvbW1lbnQsIHNvIEknbGwgYmUgc3VyZSB0byB0cnkgdGhlIG90aGVyDQp0cmFuc3BvcnRz
IGJlZm9yZSBzaGlwcGluZyB0aGUgbmV4dCB2ZXJzaW9uLg0KDQoNCi0tDQpDaHVjayBMZXZlcg0K
DQoNCg==
