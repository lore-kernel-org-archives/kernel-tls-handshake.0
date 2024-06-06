Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056C73BBCC
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Jun 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696752; cv=fail; b=jclaHaqthwY/AVyHJxKZlibLdysE5+vLqQQxrbUwR31DLd8FL3/Fm55URiUlehSxDLvvV8tu1Hy4Daz1hDGABuE2G/9JGkWlRL6pmQyVKpk4bsjOu19SbFSSwaLNDOCv57EpscmqFeFwT7yEqFs4HxhxjA8O030b1lJvUyipSNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696752; c=relaxed/simple;
	bh=wd2OoOLnTCAj8eYnOdtEsiuEteOqy5CSmlyFZjK+xYA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJ1fdyy0dMooCACLFZVFeCK/ctIXso8nFKj/GedoPDWNY2YwN1fhXkWpDCR66wyQ1TX3YHZE/IRDQlScoO2DAp5eBU09EHj5NEKDM4mSQTd5YI+z9xmXGhNPEKCsJ5SQijuTNDwN6HQKvugZ2LPR6dBDxLecAoBPXIVKa8wNgqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mhWHW7dN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uSJ4In3y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mhWHW7dN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uSJ4In3y"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 456HfuC2009969;
	Thu, 6 Jun 2024 17:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc : content-id :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=wd2OoOLnTCAj8eYnOdtEsiuEteOqy5CSmlyFZjK+xYA=;
 b=mhWHW7dNTxJE1h+8Dc48fjzHTV4/yPW0ygCm0vM/aFHJHCBmL5Xumnl/J61W0xlwCZ3i
 0tFu5J3y1qpEEyRYMlUWkYVFIrp5ZYgwRiFxAe+pmmFLKIUzhPR4T5pNubv9TP8+Aclu
 ZSz7hOEgbRqftCe+0YI6jvKDUByPuDrTQyABiocXP7GeSkY5EWXevPl2XBAvzTMSJs5f
 WhSB5CT8pZch0EqZSku165u4WLXA4MGBxmaRwhGIG/yj76maBOZtAHLxIRlAnUcQfK+t
 YZWwnPRx+QZjIapG+nwHUOZOwXgeqs/fWe0/2LxM12naigcSG1X8I/xLjxOlT4SeWP0e hw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbqn43hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 17:59:09 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 456HGKAn015603;
	Thu, 6 Jun 2024 17:59:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjfmgfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 17:59:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4BESLuV2hlO0Un+JSykdgozM86oRwcPrLJrYUPOv3lVOaA2uA3lfLYk1xzgn2PN2Oj9NX9L+k4R/b/SD1hAtiffKbdLGHFOdu9rYvDIOMA9ULw0SKb40if78OX2WLwafrFxwD9XBKOktHtNLyXIV4/ZjEhD7q3cWDQQFyZ5JU92aidaog7WBa3/kjq2zBARupCS58l3C0DVebv7UP5r9iG/5VNF2EeB5Q7Tz3zPCK96cmfxQ7g+ck9F16uxq2QFooqkx6JufMOhyyfLJx4grB+CczzO80OmL28Y4cRhmtsECgAEbZiunBUFQxk+W1WwyfSe0ubwzWxDOXip0s5FfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd2OoOLnTCAj8eYnOdtEsiuEteOqy5CSmlyFZjK+xYA=;
 b=GomR2/284+pucHETstIvfa+Knd/746z0YlrmWs77M/KrIJWawHkjLVdI80Yzg9YeJQ469hty/vE8pFIcpIzXZSCVzxWLhwrfOnXXOWfOBBMupfQP6Aj2y2p2+qKFxZJpWST+Y57yoSZs8qHugOax//bxf4L5phmYY6lF1bWPzZRr4KTn6tOWTsKDNEqxskpym4mYljtR89uN6Wvl12Y8yX3zJb7U//dnEmqzlyYSoVwQ7LtNgXWTanZc9mMbWqmDYrmprmkiDpnADDVUFws0+wXoLCNxzmqE51yPCnPF2bodw4QFNK0z7uijS9cAvbpGZSvhD9SeZPfwtRznnbQEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd2OoOLnTCAj8eYnOdtEsiuEteOqy5CSmlyFZjK+xYA=;
 b=uSJ4In3yo4JhGiAvtdsoh239rxRlmeJEu1UJ06GFK87VrFlI0eWF7nxUz2juSaqdPkm1OaYf5QAMQ/ybT8ll2j4aJkFoJupYv+wQp+WlY++ULEDuBDhTf07Ig+/A56el62R2XvjIuWMEQjy6YzM55vjy2dY/PEBOqyBeRU1JT8Q=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7768.namprd10.prod.outlook.com (2603:10b6:510:30d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 17:59:05 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:59:05 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <olga.kornievskaia@gmail.com>
CC: Olga Kornievskaia <kolga@netapp.com>,
        kernel-tls-handshake
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: tlshd.conf question
Thread-Topic: tlshd.conf question
Thread-Index: AQHatq7l5IFJnVygAEuJeUIDaPRZF7G5MQcAgAAQ9gCAAccKgA==
Date: Thu, 6 Jun 2024 17:59:05 +0000
Message-ID: <2D1C791F-C5A1-4985-9BFF-DD2E5753071E@oracle.com>
References: 
 <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
 <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com>
 <CAN-5tyEP-+s_8LppBqos0+sWTbUq-nwL6+q-rSK7tz6Gzd2B-w@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyEP-+s_8LppBqos0+sWTbUq-nwL6+q-rSK7tz6Gzd2B-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB7768:EE_
x-ms-office365-filtering-correlation-id: 2a6b52c0-e086-46ea-bcab-08dc86525b39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZlU2cUIzVEcxMGJyaGNTSE9YK2Ztby9GeDM4b3ZoQWVYTW5QdGVhRVVoR1g0?=
 =?utf-8?B?dmRmTVo0VThBcWhnSVVaUzJ6NUlQMVBURjlvNzdFZzJsYWdCR3JnejJTcmxr?=
 =?utf-8?B?TkdUejlnTEJocGl2Y0dQZFptVWhtaDJHcGYzcS8vVkJCQmtvMWgwc1VuWHpP?=
 =?utf-8?B?YWVoM1JqQmlLN3JoK2NWQzY3THBRWnpIT3kwaEJBcFVHWkMrMkxSVklOZS9n?=
 =?utf-8?B?eCtKeDRWcE1nYUx6QnVzZ2k3SEhOemwwWEZxU2sxTWdZeDFvQWRTVGRSV0cr?=
 =?utf-8?B?d1B4VnpqQzVKYjYrQTNHMk15d1BmZE9LVGd0ZFUvSFRIelMxbi9ldzEyUlFk?=
 =?utf-8?B?T0IzN0czemtLZWZtV2FXbkN5andZdFRFWVpYejNaVHZ4eFlFWlp5MmlPSlVw?=
 =?utf-8?B?L2RMempuVTlzN3NCQUl1dE5BOUozUnRCNWdON2FKczIzTFBibkxVK2tPcjhj?=
 =?utf-8?B?ZlFxSmhxcFgxcVVkZWpUNVlHcEJrSFhnUjRUcStOaFpOeEhSbGQ0amQwUVF3?=
 =?utf-8?B?WndpZnhjWTJnVUQ0Sm5ZeWx2VjBTQXVOUEhhcG9JNGF0MHNYV2ZDS3BuNHIy?=
 =?utf-8?B?T2dIRVA4QnBYL0MrbTdOMXI3TzFXeHhMVnJobStjZFRJYVdJbnp3WGhTb1E1?=
 =?utf-8?B?SHNreUFMdXRibUlsZVBSTHVmVVN6NHN3aWIvem81VXhWNjlCbXJXMU10VU1T?=
 =?utf-8?B?NGRybFh4cnR3dHdrekh6V0JjaHMwNXhPU1B1TWJiNFUzbDR2cC96UmgxdWNx?=
 =?utf-8?B?akIrODNuSktyb1V6R0x3ZTBHMjE5WWhvWCsvc3p0a1BYZC90SEd3OHRyUTY5?=
 =?utf-8?B?Nk5NLzRWa1pBYmt0U0NjM0JZMmk0KzZWd2NoVjZpZGZsNEdWUUVsM3psbCtz?=
 =?utf-8?B?REk5S2FMMi9ac3UwZ05QeGFZSnFxeDkvWXhkTGVKNHVXNVAyV2JGamZiNzl6?=
 =?utf-8?B?WGc3S25GWExKYmZjV3YwTGwrTU5ZZW10VWNXRDNlNFREVFRnTHVTTXJabzd0?=
 =?utf-8?B?cVVMMzllM1hSdnh1M20xSXdtam91K0t5bjdIZUdJL1h2eXljc2MxN2hNNFRo?=
 =?utf-8?B?UTJOQzM1eWllYjRmU3NtbTZBK1NyN2JmWk5VOHdjQ0c1eFZjbUIzL3lOZThp?=
 =?utf-8?B?Qy9PUmk1Ykd3ZmoyV3VneTlvN2RaNWREQlJCQUJFTzFUYnFiaUxXVTFhYzhq?=
 =?utf-8?B?QjNib0ovVUlxZnFHVGxSNmVad05JY0hab3RMN1dCaFRtcHNIMlNrOHJBTkFU?=
 =?utf-8?B?ZlRoWFBnOW1CMFV2dmxBaGZaNEh2a2RYMkZhUW9NL0hMU1FiUVdXUGRJR0Jw?=
 =?utf-8?B?c0dXeDc3blFXdlhpS2xST1dtdEorK3pLTUJ2OFJpWkh2TlBjVE9wQXIwdEJk?=
 =?utf-8?B?OW41SEFHU0RBbXB5ZGhKQ2xkdEFtRVVaeFVBTTZKUEFOaEZ5V1dTMGxmLzZk?=
 =?utf-8?B?VVEyTG5laURyRW85RlpvWTdqbS9BQm9YU3JOWTNFdW4xWVVTSGdkdnBLNE9N?=
 =?utf-8?B?d2FQaXBIV2svZnJrY1BUZThrZnhEZURIeGFpNWcycTJvd3V5TEZXdWR3QStL?=
 =?utf-8?B?WUpPMEoxb3ZkQmc3cDVKbUJPcU8ycDFWbi9FTXJWWW53Z01UTGN3ZThBcUpN?=
 =?utf-8?B?eWVDNFRHcldSVlRvQ2I1aCtyM2poRWRBUC9SQVgwSjBHakpiNDgxdFBsVytE?=
 =?utf-8?B?dVVWV01zWUl2TEM2T2NIV201Z0hZMW1ibzE0QXp5S2VRWHBYWVNXa0pweWtu?=
 =?utf-8?B?T3ZFU0g5QXhZQ1VLYjR6YVNTTTAvZmU0UE04Q3JIY2ZiSERsU1FlOUJXNTRW?=
 =?utf-8?Q?cP43FGBWEwvkn/k5ws0JW91AxTc38+Dibo1fc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkFONlZkRjF6d2F4WndWeWdZU3JhOEFEeWJCSXVTNDMyZThtU05EVit0Q0d5?=
 =?utf-8?B?VUFwbklzbTNZVlFhOTY3WE9NUnFQNVJ6cmpGRThCemNVd0s3VWU2c3BkMkxq?=
 =?utf-8?B?ZGZCMnYvd0JxRmFpRW5oZE9vL3BVZDdickk3TGF4eVkxdnB5UmxRUjI3SG9S?=
 =?utf-8?B?YTlUbTZ3M2cvTEE5MXBpWnFGUitpZ29RN2JTQi9FNkpmQlV4Qnk3NkhiVzIy?=
 =?utf-8?B?c0crbEtRZzRNK3Zob2tmaldjWmsxc2E2bUZUOGswWlVhdGwrclRZYm9YUEFL?=
 =?utf-8?B?SG8waFFCWjFLTlU4Z29rbUVNWENKUlowejByc1Z4R09lM3RMVlcrRWRQSUxE?=
 =?utf-8?B?SjhkUXhLTDJLejdtMDNUY1RabVZvOUhXbDF1RUt1Z2xzdVRxRjdFc3R3NjI0?=
 =?utf-8?B?ZHk1Ulgyai9sVFR1SzhEZStoQ3dQd1UrT3o4TjhlZ1N5NFBTUVFxRmcrYUVh?=
 =?utf-8?B?dGN1Z21ydnJMa0lHMk1qbE82bEh2Nml5V0daU2tkMURpNnlDanQ1NUtseHZW?=
 =?utf-8?B?aE9zR21hVkEvc1g1MURTdlAzNW9rcHFWdHp4VE9KckZqa0hLTUV5RjNQL0tC?=
 =?utf-8?B?d28xVzJJNmo4YkllTzJZcHhmZFIwbHFtWHJQT1hUR3lVeEY4UmJQRzFJeWFK?=
 =?utf-8?B?TW9STDFuczUxRzl5bDQ3a0JvZVRxYTViNDlmdCszZUo2QUJyU0Z2S2ZMTU9l?=
 =?utf-8?B?d1FvMjN1OGZJQWNLdytIVExPRjE2Mmg4QmR5dHlhTVpOeVBrdlNseFBMWGpt?=
 =?utf-8?B?VFZYRUI0QTdveU5vekVNOEMvcDlWV1F3OFA4dVhpY2VpYTlldW9tMEFlWE10?=
 =?utf-8?B?Wk9tVzRJb0dLOEw5ZGVwQW5rdTJEZGFRK2lTUGFXUlJSY3BCMnc4RXk4bStr?=
 =?utf-8?B?Mlk0Z1g3YXRXd3hBR2NBcnZtTHRhUXl3TmdrMzRZdkJvRWYxZkNsM1h5MjA4?=
 =?utf-8?B?R3J5cGt3RVRUT1duMldWQkVGZDFIR0RuV2sxTlVFSEJIY3Q1Y3lra1B0SFNQ?=
 =?utf-8?B?V1ZBMS9nNmVoSTA1MEx3cGU3bkxKcGliYWpKK0ltSUg0N1hPOHlzZTY1QXFn?=
 =?utf-8?B?eEhUbzV4YnViRTI1TFBkQ3JGODYzM25KaGFNZmZGNjIyNEdQQzBNOGp3Q0RW?=
 =?utf-8?B?cG5ubDgvaTNPUlMvVEVKNUkxY05SaGtqRFVaWEhlWk8veXUvT05xa0FvZnZX?=
 =?utf-8?B?UkJ1U0k1VzBicDQyeXYwYkQrQ1l1ajFLWHUyZkNtdVJVRW14VUpCNTJZZi83?=
 =?utf-8?B?bnQ4cDFBOHJzN0l2bHNjK1BjSXNuYlM4T0IwWTdabWd4RDljMHo4UGlRMmsw?=
 =?utf-8?B?Q3BqYkRqbUVhRTdNd0pvZ00vdUZtYUNFNnoydWlnaTZsZmhFd0JmWHp4Qmtk?=
 =?utf-8?B?dFpOemo1a2dQLzhSVFFmcVBHTzVTcVJRdGhIYlR1aHhNaVloQmJjZ0Q4VS8x?=
 =?utf-8?B?TndhcDJsNzlUVE50NjNtMXJuUWNoYzFpRVp0Z2Y5UXJJNC9GZ3ZtS3lxRmdy?=
 =?utf-8?B?YmNuMzR1UzMyL0F0TnlrenMzWDBRTWUvNE5ENll4Z2YzYXBCN3VpckNLNGhQ?=
 =?utf-8?B?RzhGaFFGMkdUSzdFOXVURzQybkgyS2Q0UlNDL3FBMDNNU2xBdjdjYU9Gb2hW?=
 =?utf-8?B?Z0YzOHdmSlZRQytTMEwwN1dRWXRLYW9Tc3NOckViM0Rxc0dqdTBtbENDc3dL?=
 =?utf-8?B?c0hrTXgrbjdkVUd4b0d2aU5GSTBzTlFySUZmSmZhTmRocEZpWXE1THlFVkhW?=
 =?utf-8?B?a21Od1c4Y1RhVlY4S3licXU2R21NS081R2JwZXdLMEJnWmRzU2laYXd2Y3lM?=
 =?utf-8?B?NFBOOUtYbWF6allaT1N6cmlwVWcvQkNWc2NVSDRFeDNVRHBFQkVDa3BkOUkr?=
 =?utf-8?B?WnNPblM1YlJnMEI5OUNkQUJWQUtaNFpsV2g1b1h6MndFQlR3Ujdrekw2eERR?=
 =?utf-8?B?bURmYis3cDhVWVBxNXpMaGZnUHd1Y3JaVGNvNDhpcS9NZWhhZ2NCUk5CeU5B?=
 =?utf-8?B?WDArV1VmektvU0tYRDdhMzRjcy9HME5Rb2pCY1lkNkt0MGwvNDdudkFIcXlJ?=
 =?utf-8?B?eFZZbmlrUUxFeDJtK0F0ODYyMXZONjFWQVhQNEV4eE9sdDhIRDlpbTlsZkpW?=
 =?utf-8?B?UnhOMGFLVUs3dE1uZWhRMmZDYndRK1QvR25uM1R6WWs3a0IrOXorVTlITEVC?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85DFF74D70A5394AB690265DE3E15DC7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uYohbzmirOL3gvm1GzC0ar2YUm1Ldqb8wxAm2kCYFTK9nO6iLztfcm+4jTQu3CjhIVnV+hOy/M5ccmb1WFBPlCdKOS/pM5v+OenxisqM1YNMeTVtzLaV8QJ9uvVNipoQKN1h60d0DAiGqCYDrsSc4LUMqYH4DPw+2uGTXVJnvkx2Sgw8uvwE/LWbjdo4mbmDdQ4Jv+kYN/akeJvPff/fsRhiW2IRbNwH6trx3eyGWYoHhSr2jzolnrLMPnGXZBAv4Ywp9EKd4iLH8xFjIebCLxhCdJI81x4VrqRRtXDZ0l8ZZvSDW+NXvNFfDtSARvi33piBxqU0wJcbPjuXG9S2XtYhB0bNlQzQFUAvT8liN36pcMkQJ1WhSprUGtl0Icg3W7kJbr5UNiQrqm0wypxPen3YOqkF/KnPpQxcB4Zx0bV9yTrBnZoTIxqfTktM4uk0z2YRZj2SwdR2pXieg/cC0EF+kd4VNdhf8Hs4gGULV5S15vfWAkzyOKZOw+7g2qnkvBTzCdYcPdDCJfzC1ZhVPoYypcgFSGcq7NB1AAYe4qUemZXLGHe84/MtVY03DmuisT0nPdILBBpRbUCQzs6KHD0xlrvT0yN9Nt2vU3q5taw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6b52c0-e086-46ea-bcab-08dc86525b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 17:59:05.5645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J63Okvudc8pvRnEy6kLn+/IwymTsVasfOLZalXy7eP0eDLg9FYBiuQfxNNSCtEFABwEfac8P3W8LNSMQFoqyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7768
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406060124
X-Proofpoint-ORIG-GUID: RUQe7K8Fc0lYJ1cc9LU7ciFyiAp6aCII
X-Proofpoint-GUID: RUQe7K8Fc0lYJ1cc9LU7ciFyiAp6aCII

DQoNCj4gT24gSnVuIDUsIDIwMjQsIGF0IDEwOjUw4oCvQU0sIE9sZ2EgS29ybmlldnNrYWlhIDxv
bGdhLmtvcm5pZXZza2FpYUBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKdW4gNSwg
MjAyNCBhdCA5OjQ54oCvQU0gQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5sZXZlckBvcmFjbGUuY29t
PiB3cm90ZToNCj4+IA0KPj4gWyBSZWRpcmVjdGluZyB0byBnbWFpbC9uZXRhcHAgYWRkcmVzc2Vz
IF0NCj4+IA0KPj4gTWF5YmUgPGFnbG9AdW1pY2guZWR1PiBpcyBub3Qgc3Vic2NyaWJlZCB0byBr
ZGV2b3BzQC4uLj8NCj4+IA0KPj4gDQo+Pj4gT24gSnVuIDQsIDIwMjQsIGF0IDI6NDHigK9QTSwg
T2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+PiANCj4+PiBIaSBD
aHVjaywNCj4+PiANCj4+PiBTaG91bGQgInBhdGhuYW1lcyIgaW4gdGhlICJhdXRoZW50aWNhdGlv
biIgc2VjdGlvbiBpZ25vcmUgYW55IHNwYWNlcw0KPj4+IHRoYXQgbWlnaHQgYmUgcHJlc2VudCBp
biB0aGUgc2FtZSBsaW5lIGFmdGVyIHRoZSBuYW1lIGJlIGlnbm9yZWQ/DQo+Pj4gDQo+Pj4gSXQg
dG9vayBtZSBieSBzdXJwcmlzZSB0aGF0IHRoZXkgd2VyZW4ndCBhbmQgaXQgdG9vayBtZSB0b28g
bG9uZyB0bw0KPj4+IHJlYWxpc2UgdGhhdCBJIGhhZDoNCj4+PiAieDUwOS5jZXJ0aWZpY2F0ZT0v
cm9vdC9zZXJ2ZXIuY3J0ICIgYW5kIG5vdA0KPj4+ICJ4NTA5LmNlcnRpZmljYXRlPS9yb290L3Nl
cnZlci5jcnQiIGluIG15IGNvbmZpZy4NCj4+IA0KPj4gQWdyZWVkLCB0aGF0J3Mgc3VycHJpc2lu
ZyBiZWhhdmlvci4gdGxzaGQgdXNlcyBhIHBvcHVsYXINCj4+IGxpYnJhcnkgdG8gcGFyc2UgaXRz
IGNvbmZpZyBmaWxlLi4uIG1heWJlIHRoZXJlJ3MgYW4gb3B0aW9uDQo+PiB0byB0aGUgbGlicmFy
eSBBUEkgdGhhdCBjYW4gZ2V0IGl0IHRvIGJlaGF2ZSBiZXR0ZXIuDQo+PiANCj4+IEkgd291bGQg
bGlrZSB0byBiZSBhYmxlIHRvIHN1cHBvcnQgYmxhbmtzIGluc2lkZSBvZiBwYXRoDQo+PiBuYW1l
cywgYnV0IEknbSBub3Qgc3VyZSBob3cgdGhhdCB3b3VsZCB3b3JrLg0KPj4gDQo+PiBBbnl3YXks
IGNhbiB5b3Ugb3BlbiBhbiBpc3N1ZSB0cmFja2VyIHRpY2tldCBmb3IgdGhpcz8NCj4gDQo+IEkg
aGF2ZSBvcGVuZWQgaXQuDQo+IA0KPiBJIHRoaW5rIGFzIGEgZmlyc3Qgc3RlcCwgbXkgaW5pdGlh
bCBzdWdnZXN0aW9uIGlzIHRvIHVwZGF0ZSB0aGUgbWFuDQo+IHBhZ2UgdG8gaGlnaGxpZ2h0IHRo
ZSBmYWN0IHRoYXQgbmFtZXMgc2hvdWxkbid0IGhhdmUgYW55IGV4dHJhDQo+IGNoYXJhY3RlcnMg
YXBwZW5kZWQuIElmIHRoYXQncyBhY2NlcHRhYmxlIEkgY2FuIHRha2UgYSBzdGFiIGF0IHRoZSBt
YW4NCj4gcGFnZSBwYXRjaC4NCj4gDQo+IERvbid0IHdlIHdhbnQgdG8gYWxsb3cgaGF2aW5nIHNw
YWNlcyBpbiB0aGUgcGF0aG5hbWU/IEJ1dCBJJ20gbm90IHN1cmUNCj4gd2hhdCByZWFsIHZhbHVl
IGlzIHRvIGhhdmUgYSBsZWdpdGltYXRlIG5hbWUgdGhhdCBlbmRzIG9uIHNwYWNlIG9yDQo+IHRh
Yi4gQnV0IGlmIHdlIGRvIGFsbG93IHNwYWNlcyBpbiBuYW1lcywgc2hvdWxkbid0IHRoZXJlIGJl
IHJ1bGVzIHN1Y2gNCj4gdGhhdCB0aGUgbmFtZSBuZWVkcyB0byBiZSBpbiBkb3VibGUgcXVvdGVz
PyBJIHdvdWxkIGxpa2UgdG8gYWRkIEkgaGF2ZQ0KPiBub3QgZXhwZXJpbWVudGVkIHdpdGggY3Jl
YXRpbmcgYW5kIHVzaW5nIHN1Y2ggbmFtZSBpbiB0bHNoZC5jb25mLCBJJ20NCj4ganVzdCBzcGVj
dWxhdGluZyBoZXJlLiBZb3UgbWVudGlvbmVkIHRoYXQgdGxzaGQgaXMgdXNpbmcgYSBwb3B1bGFy
DQo+IHBhcnNpbmcgbGlicmFyeSB3aGljaCBwZXJoYXBzIGxpc3RzIHNvbWV3aGVyZSB3aGF0IGl0
cyBzeW50YXggcnVsZXMNCj4gYXJlPw0KDQpJdCdzIEdsaWIuIFRoZSBjb25maWcgZmlsZSBpcyB0
cmVhdGVkIGFzIGEgcmF3IGtleS12YWx1ZSBzdG9yZS4NCkhhdmUgYSBsb29rIGZvciBkb2N1bWVu
dGF0aW9uLCBidXQgSSBoYXZlbid0IGZvdW5kIGFueXRoaW5nIHRoYXQNCnN1Z2dlc3RzIGl0IHRy
ZWF0cyB0aGVzZSBibG9icyBhcyBhbnl0aGluZyBlbHNlIGJ5IGFuIHVucHJvY2Vzc2VkDQpVVEYt
OCBzdHJpbmcuIElmIHdlIHdhbnQgZXh0cmEgZXNjYXBpbmcsIHdlJ2xsIGhhdmUgdG8gYWRkIHRo
YXQNCmV4cGxpY2l0bHkgdG8gdGxzaGQuDQoNCg0KPiBSZWdhcmRsZXNzIG9mIHdoYXQgaXMgZGVj
aWRlZCBhYm91dCB0aGUgc3BhY2VzL3RhYnMgSSBmZWVsIGxpa2UgdGhpcw0KPiBzaG91bGQgYmUg
YWdyZWVkIGJ5IHRoZSBjb21tdW5pdHkgYW5kIHRoZW4gZG9jdW1lbnRlZCBpbiB0aGUgbWFuIHBh
Z2UNCj4gYXMgdG8gdGhlIGFwcHJvcHJpYXRlIHN5bnRheCB0byBiZSB1c2VkPw0KDQpQcm9wb3Nl
IGEgbWFuIHBhZ2UgcGF0Y2ggaGVyZSwgSSB0aGluaywgYW5kIHdlIGNhbiBkaXNjdXNzIGl0Lg0K
DQpOb3RlIHRoYXQgSSd2ZSBiZWVuIGFza2VkIHRvIGN1dCBrdGxzLXV0aWxzIDAuMTEgQVNBUC4g
Q2FuIHdlDQpnZXQgdGhpcyBmaW5pc2hlZCBieSBuZXh0IHdlZWs/DQoNCg0KLS0NCkNodWNrIExl
dmVyDQoNCg0K
