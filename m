Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54E14AB8
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 31 May 2023 14:03:10 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VDOVpe031854;
	Wed, 31 May 2023 14:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=CzKAjWmuIr6kXSRm+k73NjIXeaJlyyR7u85yCDajO/g=;
 b=MNvDH2KACj2N2mFVtawcSO8AVDcwHayFvZrA86xjOPjv/B4vPfwCNEE/CrMPweGvumAG
 CuoZh8qo/InuCgnf9JpVYGf6xhI4pzamgUTi+qyi+wygjEP0or/V8vPzGSL3EsN3RGtv
 maFS1/R3rGDimKiNNNPa4+xzYG7SXxD3EEID5rU7pbkmktvizv8WWtWGdVrSjTx9FMGC
 E4RjmIUkV2bfbtyKCVYmZ7k/I0SqHoa+ZKtVBBKUxzRFpq8h1wzfTCYND1Ey0aKoly53
 uLT8XL/VFC08bRKVs/iyYwlalhXHc9ay4JUHPWPCz9qiT+gz4iAPLhwy/7gae03eW5X/ 0w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhmjnxag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 14:03:03 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34VDBDFQ019825;
	Wed, 31 May 2023 14:03:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qu8a5uhyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 14:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYTYkwwiGr8Xo66X+D39jQEMT+m2TPr0aUBZVSJOrCUTqflc0s4ePF4RKaLFrQGeWDRkPqyQ7vjmcNd3wzMpulxYdqvr6HfN9nexGeQFlPIC82EbYDGXJVjtWkNSWWP6ZLoAuKzizBxH5auaj+oKhYwiygeb2NTa995R7oV2Y8P6Iqg8ngXZfKGJ6NufFxJiCJ+fL7FkEkqXxA39o+ObkHR8KGBR6QoJ5rUMX2xAE4MVVv+VHg0Z1E+PtFanXhSrGHQIjXcC2vk7onDdB4kG0bDTjCEIh48W6coNMIIp8weMh8F5ljB1O1kMIdRkXYfZADkYp3n8P0VAgoMMiXeqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzKAjWmuIr6kXSRm+k73NjIXeaJlyyR7u85yCDajO/g=;
 b=bARa1fRojvsjyXJe/B+rRhR+cwk4vL1JlJGDvkbcB4d2XF6tVFgaxntTpogX2ukPME4A86ifLV3ZcnxvRKZUa6p+rwxLME8rbm0mjHJDq3JzeWO8AIsvbY4s9VXRml3ADjZgHzF0eIMlxFaVsC2JnalxS3GDWcxfy/Wyb02v8m1z6IpTlkgQVtSWej+EGfIAa52PjunCfNxBtgg3w55nQsgBifza++wFZosOAsCadaIBB2LBuEeW7mu0O/X4KVShoRVtXdRsqUHMHNqo7CRd/qA6KmVwoA3S9PS6SFl/26UQvhcfSOFHr+OW/6vV2BWlmoMf4tpZQtimkp0u3JreoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzKAjWmuIr6kXSRm+k73NjIXeaJlyyR7u85yCDajO/g=;
 b=LjccuMOzjMQghBo+gU3Vc6ZDsUz3GRaLQNnT70Bxh498J29Qxm7+EMXvKycKHTF/XXM0Llq7V9+fqEMY7cQRky2VAdkAdRUqIpn6yZb40G3SagObudZSTHSKmXEYBwQVBYEE6Lhj9ctHGrXKMe4eCc1q47zEuIF/ClP0tFbPvQM=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7105.namprd10.prod.outlook.com (2603:10b6:510:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 14:03:00 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 14:03:00 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
Thread-Topic: what should happen for proto=rdma,xprtsec=tls
Thread-Index: AQHZkzrk6rAEvRS9WEuMQJIn/kwPgK9zT9YAgAAFcQCAARVtgA==
Date: Wed, 31 May 2023 14:03:00 +0000
Message-ID: <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
References: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
 <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB7105:EE_
x-ms-office365-filtering-correlation-id: 15528bfd-1235-4129-f379-08db61dfbe5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a5GAzSKhbbJq3zgI2zYUft+JCcnDEYgZGilhs988cxeBAUE1BFNULFf2cGCj7PzAAr/Obo7PVy/BL0M8FIDnntzmj6aZFVwab0npCmZkAsntZZiwzbhEbF+L+8T/5mqRDIbHtCojKvkLPvOAmg0x+exdhQ0EyE2qYuYaP1EsGxe0yBhPjGlnS6Ao70T4IHn7BA2Kx5LCOiYYi6xhWqlB4JnMzKb1tPzz3wwfvD4Vo0CXTclKJ4ejw/p1/TeUcknMeAzKI4zhDHNpFgT+Sid2hCzb/R4Jo55V6VPV89Uqa003Sjgzh1vGb6GnjS757MMMfZTv5LPIXEfye45inLNf7ZFrbKgxWZM4xhMBd/G42Z1CImxbFKvWH/aXqD4jlVfDX+u2fUHjNWqBVdhLrt55E1H7pSvjR1BCc2DMnkbVotbnbmOaJE/B5PgRDDVLYlcifedJq0k4BDxRWrweuyz26SkhLyZSUGqi5TZHZCzJD2fq1MRQIiLihHG3xCkwb74hmPYbwcQcUefO0gyciaMiILjPvAqFrjUPEgxxW5f/frtpE4EumMk2zTY8wlJIVUtOTzm/SmUt0SaUXfFXEz7ohQm47TwkTEziAJlNo7iwBtkbWWXMO75Up6CJgjpX6+xghJoalszui3Ix4OVLFBPgRw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199021)(38100700002)(83380400001)(2906002)(122000001)(41300700001)(316002)(2616005)(76116006)(38070700005)(4326008)(66446008)(64756008)(66556008)(66946007)(66476007)(6916009)(478600001)(5660300002)(26005)(91956017)(86362001)(186003)(8676002)(6486002)(36756003)(8936002)(71200400001)(33656002)(6506007)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cytwWkFXSjg5UnVXQkpGc0xPQ1FyRk5yNHRLZU1MbUJCUDdpNmlaOWJBQ0pC?=
 =?utf-8?B?czZGSWRhbUlCYVlMQS9Ob3E1bi95Q3RSaS9nRUZBRjREVzcxenF0eFpoU0lr?=
 =?utf-8?B?MkJoK0l0Sm9BYTY1RW4wdGcyUEt6ektGeWdEUlpKbHNycjczOUNzRk04RWFj?=
 =?utf-8?B?a2FxV1Zhd2tkUzIxVUxBdk5sU0VxcEVwZUJ1SzJCVnUrcFFHU2ZJVjFJeWln?=
 =?utf-8?B?UlVBMEtJTGRGVEZoUVhvazBRdEczTnkxZ2RvblBFbzJ3eVlPMTVGY3EvYUNB?=
 =?utf-8?B?bkxlaFdOaWl3VlVQLzgvUy8rWFlpSm1YZ1cycFBLQWdGd0NQeGh3cEVJWW8v?=
 =?utf-8?B?eWczS3U2UGd0OU9ER2trbkphQmZFVEpvSTZmeTRjWjNFcnBaLzVObCs1OXl4?=
 =?utf-8?B?N0dyTzRpQXdudGlLK2VuaEJrTjVIRm9sd0NlNFVaakdZa0EwLzY5azhzTmxx?=
 =?utf-8?B?V3k4RUppU3kzUkVUeTUvaHRZN2dMc1Vmc2Erc2x6SHYremQ5Njh4Z3dpUkU2?=
 =?utf-8?B?SlRvaEgzV2VxMlRHNDNvQ3haNjM1aFpwMG9pTTdQU1l5aFhrK2NXUHZwYkVJ?=
 =?utf-8?B?cHdFNWl3NjNPUGg0UTc1SElKeGk3dElZeFB2TU9yb1F2QmxKamRVZE05UG9E?=
 =?utf-8?B?bW54WTN1V2F5eGZyVVhId2dSQms1ZkFIRTNMdGlFVzJLUkk5OS93UEFnbXlI?=
 =?utf-8?B?ZHQwSyt0clhCM3FNVG1seVAxNnlXaG5BUWNmS05vV0ZKdVBYeXZoOTZTTVV3?=
 =?utf-8?B?SzEyYlhTbDNrQmtQNGFBNzMvMmRIRkcrdjQzbTlnTlV5akRsVUdSKzhVTFJh?=
 =?utf-8?B?VVdyVGxmUk9CczZCdkFMQ1pNUS9PaWk4cG5zK1N0YmRxNUlaMEdvMURUT0Nv?=
 =?utf-8?B?dFA0Z1l4dXNRTnB3b3NEd003bE81WmpwOE9ZNlFtd094TmtXWGErMmhld040?=
 =?utf-8?B?OFVkeGFaa1hITXRrYUhwdGlMdG0wcnNvWEZOdkpPSng2cDdpMzNEbUUvOU9m?=
 =?utf-8?B?YzRvV2tBT0ovdmNLTTN4N25XYzBTL3IzNFMybzlBNUdITEJVQ0owSm44YUJn?=
 =?utf-8?B?R2hFQjNCNlZLdmRjd1A3SWd0SnpzeHUrSjJHVHoza3ROY1FXUzA5NmJMbFFD?=
 =?utf-8?B?aVl5SlNpS3V3a0lxRXkxWnIvLzlUWTFCS1ZvOHU5V2dCdGFpdjg2T0VpK1lL?=
 =?utf-8?B?OWs3aGhldUhYeG1tRkwvVXZ5QXY4eEZaMGZ6VHpNOHJ6MG04MU5XQmgvMDlu?=
 =?utf-8?B?QldKYUk0cm8xMHNTelFMZDZQQ0N1Mk5GV0pwWXVJZU1ZZ011MS81bkJhVnYr?=
 =?utf-8?B?aWlCUXVCOXlkbmxqcHVNcjErbUsxRGRhWkpsZ05GT041WkM5SEsybzJxT0VX?=
 =?utf-8?B?bTlnaFNLREFqem0wYkwzOXdMMTQ4Y0IxQUNNSlJIdmRMakdPaGVSVkkrMDFW?=
 =?utf-8?B?VkRWbzV6R3hZNDZEdzVUZjNzVTNVUnlKZFh6ajFEVmdSY0F1U3FKV1hiMUdS?=
 =?utf-8?B?dlE0bEgwK0V0L3RTcGRqMlp6aDJjaTZodlNRZjZ5cU5DZEppQnhsM05OMjhh?=
 =?utf-8?B?L003WHJNYW1nUGhSc09vdFRrL1huZkQvN2FtY0Y1cVd5NkN5Z1FoS1VlempS?=
 =?utf-8?B?UDlYWTZ2OTZydklhQXZKYytTN2h2b3BQTUxrdWo0ZXJFRVRPU0UwRmlaSXV6?=
 =?utf-8?B?alNKTXlERkRDRXRqMEM4eWp2WTFDSHZPRXdETFZHTkZhbkNnR3l6MjZ4L1JZ?=
 =?utf-8?B?ejdOa2tqVmpVTkxYdkN2YjFJaCszbGQvSTd5QmNXdjRJdjhWVlhuU1ZDRGhk?=
 =?utf-8?B?MVg1RVJKSUMyVWUzZGNXVW9CczlwTVBTTDVMOFVJdVc0cnhVMW13NjZPWDZW?=
 =?utf-8?B?UGVsM2JVQkg5T252VE0xMnBMQis5Q2hwbVBlTGZIcFBHeEhkZXM5TDNHWEtE?=
 =?utf-8?B?MDhHOWFBeW9wa1NlU0FnMDhzWC9xbng4SkFnZVEwR2JlTlpOOHFhclRpOGRI?=
 =?utf-8?B?QkhndlFpNFpYSFRSR2I5YXBvN0tiRlNpcWJxKzNxYm5uOWgwa2ZRNzd0T2hM?=
 =?utf-8?B?UXErY0k1NVlya0JqcnRCUnJQSUZHSFh5QzE5d3FZcVdMcU9ZMW1odENySUtx?=
 =?utf-8?B?TmY0OXc1K0NPSFQreDlhWi9uNXBNeVM2RldnaW1jSjdQN29YRFRkdkl1SGxU?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B56CF4F46EB8D4FA5C9375A080B742B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8YaKdCaA+7GOJAQ33qQx9f6VisxikdHs1H2GNIoufLIKNd0y8Omri9n3QgpOVJUQewlVoc074Xx5GUHFTUPzKfsxOFtlZTGG/PpENbJkgdAC5wP0IoTE1SA/xpr2kv9xzizFeSt7VWhxMjwpqy0ZNIf2188z90ljZI+l4I4nl8l263265X5C3rdlMoDTEU1dGk5YxG4HlLAmktnGxPoa058wqNjzbZM9Aflggeg6oJZ19LBKYpM4huM/ln8Op8xMAlUP7kIBhRXr7WjQmHQmPaFu34WOu6NPkoxZpNrQFTISdKGBsOAKGWthd0V3cyoKsyAnVk498r8PZB26yydDGndynJVa7ynpuzfYhxkjVTbsgjNZnD1k6bmG6MZ9y4BEBWVAnwPlJOuwAgUtySWchpUdoJzOkwy430E0dyS9rbxHffeIWDY8aB4EiMDnCCi3JUYXrnJJlm7s1I++9olmzCPak3cxz5AJ9EkP+YWxtwuJv2BptgLRonTP+Hi68oNIb9pWVeU/PZBKl/WYFui7oTdDBScWIkHKRS6aqYNAHYv+EtXucMaXqmY55+hy4s4zJE1vFHZ1HE0LYN/qlD39d5tqwrbcRHvCs+gzlxJ1oNl2c/GQwxPfEVYrHUCGDfzc7AfduM95/sFZiKiOx5B51OSKlICEv+/fkkqBr6Svky33Og01DE7lcN/nrIVH3nlXneo9shl8WUX0SSpzjdw4Y5acHeplKqDLY80KeIVdvRIaNqEzxxlhFL9aBO0APh1B5z5Zl4S4cVG8QgnkawFYYkIqZFpPK91h9mC6eNLe4s4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15528bfd-1235-4129-f379-08db61dfbe5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 14:03:00.2159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VA/Lte3DrKmOIo7XrtfpkCRIoDEOvLO9/meeBHjDepHDk5XHyY/5wbOQJkxoI3rKHqff4Lyoi9XQf15b5RasBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7105
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310120
X-Proofpoint-ORIG-GUID: ujzUIel8nNWa90D5KVq_p6gSFn_FxY4r
X-Proofpoint-GUID: ujzUIel8nNWa90D5KVq_p6gSFn_FxY4r

DQoNCj4gT24gTWF5IDMwLCAyMDIzLCBhdCA1OjI5IFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWds
b0B1bWljaC5lZHU+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgNToxMOKA
r1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IA0KPj4gDQo+Pj4gT24gTWF5IDMwLCAyMDIzLCBhdCA1OjA4IFBNLCBPbGdhIEtvcm5pZXZz
a2FpYSA8YWdsb0B1bWljaC5lZHU+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIENodWNrLA0KPj4+IA0K
Pj4+IEkgZGlkDQo+Pj4gW2FnbG9AdW5rbm93bjAwMGMyOWRiYTYxNiB+XSQgc3VkbyBtb3VudCAt
bw0KPj4+IHZlcnM9NC4yLHNlYz1zeXMseHBydHNlYz10bHMscHJvdG89cmRtYSxwb3J0PTIwMDQ5
DQo+Pj4gMTkyLjE2OC4xLjEwNjovbmZzc2hhcmUgL21udA0KPj4+IHdoaWNoIHN1Y2NlZWRlZCBh
bmQgdGhlbiBJIGRpZCAibW91bnQiIHdoaWNoIGRpc3BsYXlzOg0KPj4+IDE5Mi4xNjguMS4xMDY6
L25mc3NoYXJlIG9uIC9tbnQgdHlwZSBuZnM0DQo+Pj4gKHJ3LHJlbGF0aW1lLHZlcnM9NC4yLHJz
aXplPTI2MjE0NCx3c2l6ZT0yNjIxNDQsbmFtbGVuPTI1NSxoYXJkLHByb3RvPXJkbWEscG9ydD0y
MDA0OSx0aW1lbz02MDAscmV0cmFucz0yLHNlYz1zeXMseHBydHNlYz10bHMsY2xpZW50YWRkcj0x
OTIuMTY4LjEuMTE5LGxvY2FsX2xvY2s9bm9uZSxhZGRyPTE5Mi4xNjguMS4xMDYpDQo+Pj4gTmF0
dXJhbGx5IG5vIFRMUyBoYXBwZW5zIGZvciByZG1hIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhpcyBt
b3VudA0KPj4+IHNob3VsZCBmYWlsPyBvciBJZiB0aGUgIm1vdW50IiBhZnRlcndhcmRzIHNob3Vs
ZG4ndCBkaXNwbGF5L2NsYWltIHRoYXQNCj4+PiBpdCdzIGRvaW5nIHhwcnRzZWM9dGxzPw0KPj4g
DQo+PiBUaGF0IG1vdW50IHJlcXVlc3Qgc2hvdWxkIGhhdmUgZmFpbGVkLg0KPiANCj4gU28gcGVy
aGFwcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gZGlmZiAtLWdpdCBhL2ZzL25mcy9mc19j
b250ZXh0LmMgYi9mcy9uZnMvZnNfY29udGV4dC5jDQo+IGluZGV4IGU0OWUzZDE4ZWY4OC4uNWZj
MjI5YTc2OTBiIDEwMDY0NA0KPiAtLS0gYS9mcy9uZnMvZnNfY29udGV4dC5jDQo+ICsrKyBiL2Zz
L25mcy9mc19jb250ZXh0LmMNCj4gQEAgLTMzNCw3ICszMzQsMTAgQEAgc3RhdGljIGludCBuZnNf
dmFsaWRhdGVfdHJhbnNwb3J0X3Byb3RvY29sKHN0cnVjdA0KPiBmc19jb250ZXh0ICpmYywNCj4g
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9pbnZhbGlkX3RyYW5zcG9ydF91ZHA7DQo+
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgY2FzZSBYUFJUX1RSQU5TUE9SVF9UQ1A6
DQo+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gICAgICAgIGNhc2UgWFBSVF9UUkFOU1BPUlRf
UkRNQToNCj4gKyAgICAgICAgICAgICAgIGlmIChjdHgtPnhwcnRzZWMucG9saWN5ICE9IFJQQ19Y
UFJUU0VDX05PTkUpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ludmFsaWRf
dHJhbnNwb3J0X3JkbWE7DQo+ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgZGVmYXVs
dDoNCj4gICAgICAgICAgICAgICAgY3R4LT5uZnNfc2VydmVyLnByb3RvY29sID0gWFBSVF9UUkFO
U1BPUlRfVENQOw0KPiBAQCAtMzQyLDYgKzM0NSw4IEBAIHN0YXRpYyBpbnQgbmZzX3ZhbGlkYXRl
X3RyYW5zcG9ydF9wcm90b2NvbChzdHJ1Y3QNCj4gZnNfY29udGV4dCAqZmMsDQo+ICAgICAgICBy
ZXR1cm4gMDsNCj4gb3V0X2ludmFsaWRfdHJhbnNwb3J0X3VkcDoNCj4gICAgICAgIHJldHVybiBu
ZnNfaW52YWxmKGZjLCAiTkZTOiBVbnN1cHBvcnRlZCB0cmFuc3BvcnQgcHJvdG9jb2wgdWRwIik7
DQo+ICtvdXRfaW52YWxpZF90cmFuc3BvcnRfcmRtYToNCj4gKyAgICAgICByZXR1cm4gbmZzX2lu
dmFsZihmYywgIk5GUzogVW5zdXBwb3J0ZWQgeHBydHNlYyBvcHRpb24gZm9yIHJkbWEiKTsNCj4g
fQ0KPiANCj4gW2FnbG9AdW5rbm93bjAwMGMyOWRiYTYxNiB+XSRzdWRvIG1vdW50IC1vDQo+IHZl
cnM9NC4yLHNlYz1zeXMseHBydHNlYz10bHMscHJvdG89cmRtYSxwb3J0PTIwMDQ5DQo+IDE5Mi4x
NjguMS4xMDY6L25mc3NoYXJlIC9tbnQNCj4gbW91bnQubmZzOiBhbiBpbmNvcnJlY3QgbW91bnQg
b3B0aW9uIHdhcyBzcGVjaWZpZWQNCj4gDQo+IEkgd2FzIGV4cGVjdGluZyB0byBzZWUgIk5GUzog
VW5zdXBwb3J0ZWQgeHBydHNlYyBvcHRpb24gZm9yIHJkbWEiIG5vdA0KPiB0aGUgImFuIGluY29y
cmVjdCBtb3VudCBvcHRpb24gd2FzIHNwZWNpZmllZCIuIEJ1dCBpZiBJIHRyeSB0byBkbw0KPiAi
cHJvdG89dWRwIiBJIGRvbid0IHNlZSB0aGUgInVuc3VwcG9ydGVkIHRyYW5zcG9ydCBwcm90b2Nv
bCB1ZHAiIHNvDQo+IEknbSBub3Qgc3VyZSB3aGF0IHRoaXMgbmZzX2ludmFsZigpIGlzIHN1cHBv
c2VkIHRvIGRvLg0KDQpBcmNoaXRlY3R1cmFsbHksIHRoZSBORlMgY2xpZW50IHNob3VsZCBwYXNz
IHRoZXNlIG9wdGlvbg0Kc2V0dGluZ3MgZG93biB0byBSUEMgYW5kIGxldCB0aGUgdHJhbnNwb3J0
IHRlbGwgaXQgdGhhdA0KVExTIGlzbid0IGF2YWlsYWJsZS4NCg0KSSB0aG91Z2h0IFJETUEgd2Fz
IG1pc3NpbmcgdGhlIGZ1bmN0aW9ucyB0aGF0IG1hcmtlZCBpdA0KYXMgc3VwcG9ydGluZyBUTFMs
IGFuZCBzbyBpdCBzaG91bGQgaGF2ZSBmYWlsZWQgdGhlIG1vdW50Lg0KSSBtdXN0IGhhdmUgbWlz
c2VkIHNvbWV0aGluZy4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
