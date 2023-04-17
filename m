Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15679FD
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:09:01 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H6EQCx012831
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2023-03-30;
 bh=+2Ig+wh0jCIGj9Meg78svRWp5ubxAn9RDC6lQs8jZFg=;
 b=LbUti9CICifbmIWxTBXyETr8w2Jlp4tFtqi10WUrVSsPhxCrsUBUx6T/845VcpzlP+98
 IuXBwRY7kMRm1fmaQB83HZflcOB4+bkdcz877uDmWZi3HPqqOr7i96y/5X8ROaE5gWoQ
 YBMDG98ioGzPHWyyF52YMEaZtcj9hPKJoVbKj17RR42D6E6QYi5VgkfdGzDhEu4KZzSQ
 hwhlYr/zRnXzlnWs3rI/GOGSjdtILkZenbOiYRZAgRKsEfF5SCAa7Wv1fVhpFbtS///N
 fV97Mbdr+kWYYQWkXI7kXCu5I2sNE+nd0dgpr6U6gUzWEQ156qCfs53OUkA47fZFU08w Nw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjh1k5gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:08:55 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33HDRF5T017431
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:08:54 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pyjc469ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKp1UjXHcmox5sMpgV1JJ41ki8F3L7FQtqcItvOQscXQcZIKl8e2eh3flpRZqrao35JYPFB72T4T48BNaIsGVN2+G00dfGfUzQ5UNIMx9dDxR8w2yZY3fvSplZtDCez5pG+v7T0TtIGbf0AGOSF3IJUEl4F+jc3iTtvY+e09x4JWrHiozdulNG+ImhEX0MbA3iFPFENu31nrIHdu4Tg/++RcyVcIPUFFtU0NVkyrrLDhIywEqlQZ3bJGYLNf5ICy54qicgM+HYFBTYnCE72L2zXHcvOLd9anFanz/W3peNH5eI//5Sth0IsIrqCnlidjiouTV7jePs0ZvnCa6Qe57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2Ig+wh0jCIGj9Meg78svRWp5ubxAn9RDC6lQs8jZFg=;
 b=K9mCYXP1n7JgdWxUNq6yXLSYUaUwFLcgd1cxPpTH4gokGXSTvvnwhSzj5a8ItFZUV3BGM9N3GytO1ZZmZFHWfiXDX4qTwwE5Kumqo73SSTwQsGLKZB/CpUOeMyH/Py6VqbVOhDZo3YoyZx3ObYt/C/V+zmzofC9vztPof/CftWEYCer+0m4GW4ENnlovcfGpEDaLB2wSTN+UljybKT53TnWrkLZSZEU16ktQl2WU8te11Y/14CXyEeh+YHptQrdCd85flGOxokTWruYszqANCh6ao7HAbSAzKQAJamPH8aRNwZrVP7ORbMtvWyTjpOpZy6mdxkqAPd2an1mTj/b2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2Ig+wh0jCIGj9Meg78svRWp5ubxAn9RDC6lQs8jZFg=;
 b=touw95/yTUaX3IbBjZ+CyU6QXWgqwGvt8vZyx50YO3wcalJ04E/Zz59wwGpXXzZoWNszhCV08KObBTsFAH/srkz6zCZhU39aVN+SiiTKpZ+z0JBNIc30aZlbuKaDo8FEIZY3/8orJGgFp205MhQMl1VMIpzD08yHunDb2zk22Mk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:08:52 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:08:52 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZcTYjfPpGfTUrjk6Cq9fPJWkjgg==
Date: Mon, 17 Apr 2023 14:08:52 +0000
Message-ID: <9B1C94C1-F6FB-40BE-B7D2-F9DD3C76E022@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB6805:EE_
x-ms-office365-filtering-correlation-id: 8c38c8b4-7b9c-4cc8-b9ae-08db3f4d45ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 04C2D6Iq0yMfT220ZfZPBYyuUL8aZLBGXy3QqMio2I/MxfW5CwPneLy0sPM1DR2Cr/odxjzFM7ld5AGNzPf8pd0kdeg1MeLOFywaLUyXXR4bbnbBZ26WwLm/5FafdT2tTeWVT1kdKDSPy0g7SGheq9pW1ft9omgpmgZOKch84L6sSBMExpdv9yjt6Jif3UISueH4DhqJA5QJXoVRDG/w4uTT41h7MfAFy0G6ZKM5y6DZuHEmufnFMD3d2EtCnfT+/Bzv4sR8zSnRyVozRdi2Vbh5uyFkMLtaFlthFs/1Uc40yzOZvbvalS19ET8yzMEte+SLDqUJ5YKFeelNZY95GcZBmTfp8DcZR4VW77+rcODoqS5puM+h7fTC/5x+8W3ejj9ac2nCQ7cg0USx9/jLXlJbvoha8O0azGzV86i8a2gTRcQv31kuDCQfuAXqd/bzV3SDrmQTzawq2EQ5oFryP0bsw1BePbGB7xNAR/wpW2shjjD42+dOJ3c/DJ6jLcwsB7ePZsIc1yqPuqg22TjLYwo2hHjYyuR4HUn9cawL/o4psZtBE7qAITg3gRpGQZHqcLklO8cAYzbFI7PEQcMYJaE7XyiBdjBOZOUSo1Sk5+0qYIt4Rwftfbyvohb0jPKZRXut6EbeqPx7dqa15dymsg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(6916009)(38100700002)(122000001)(91956017)(2616005)(6486002)(71200400001)(316002)(41300700001)(33656002)(8936002)(8676002)(5660300002)(2906002)(4744005)(36756003)(66476007)(66556008)(76116006)(66946007)(66446008)(64756008)(83380400001)(478600001)(6512007)(26005)(6506007)(66899021)(186003)(38070700005)(966005)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TGlPME13VUl1M1NxWkhlaWFFN3FweW4reDBGK2Vhcm43N3R3bUJSOVN4V2R6?=
 =?utf-8?B?NjBhek9EU0w3TXlQb2pQYStpVVhaYTVyRFNOcUU5c1QzemlFaUNMYWZWQ0N1?=
 =?utf-8?B?dmZDUVR2K3hjUm9aZXp3TEtZUVZTWHc1VEkyL0FRTEpCT0Z6SnBCYWEvTVZS?=
 =?utf-8?B?T3dYSnNEQ0tqTlJQcURRVEZSbmwvNzBETCtHcU8zcElHdHd6c1o3V3pQVG0r?=
 =?utf-8?B?Qk5Hc242azhPZlZnbWE2Rmczb0ZvVE52bGhXT1daeWlCNFk4N2VFRTAvZmpX?=
 =?utf-8?B?TFhuaGVjbDkyWU5Qc1V2cVkwTWQvZWM3SG5GK1A5b3oxT25RQklBL3V0N3hW?=
 =?utf-8?B?MUN6aHhIQzllUWdLdW8wb3RhdFFXMlBFc0Z1dDJLd21OU09tM1BpVFpyZG1q?=
 =?utf-8?B?WjgyakZlYlNpZmg0UnlWSFM0OUJ0ekJkTHlMU3EyOGJScU1YUWtENGEvaUN2?=
 =?utf-8?B?NTdYSURkT29SbFRWUEdFVGQwYzhQR0J4TFVwRGZjZ3pRVm5qcHlVdDUvcUNO?=
 =?utf-8?B?ZFBBeVdIM2lGdWlyNUl3MnlhaERZMlZIaGZKWXN6R3JlLzkzRXY3dHRuZS9P?=
 =?utf-8?B?Z3N3Z0xUQ09BTUZCRDE1ckRpemdVSXJJRWZzRXVKdjZHWmkvUHVkbElCZTlB?=
 =?utf-8?B?N3NZR1B5bUkzVXlnbDZXWitEcGl1dlNDQVY2UHZlMXNaUHNQb0ZnbTh5RDFE?=
 =?utf-8?B?cGZ1L2VoN2xVeXRsOEt1NGNWdlVFMzdkeDZwSnFNbDdjVHIxRUlsZTFQanZU?=
 =?utf-8?B?R080dFdvdXU1ZDZlZWJ0SUphOVl5MlFnb29aR0luSndvSWY3UlVSZFpURkt1?=
 =?utf-8?B?R2lQWllnRDd4Tzk3a1RUSTU5TW1GcDhkQy91ZFhWbWJ3YXlLWHlyNkl5MHZj?=
 =?utf-8?B?ZWdSWUNSWW1ocUlqU1UvelhoZk1LbHkzZDczSWhtVGN0dnZVMVNMQWpuQVhn?=
 =?utf-8?B?SkdFM1BpSVFZWEI5YnNUS0lMcXBaR2lWYTYybnh5aXJmbTRDb1dqYnc5VGdm?=
 =?utf-8?B?ako2bHRrSml6OXd4eDBjVTB3citnMHUyeFF2YzczVzFVZ0lrY2xvSWxienJL?=
 =?utf-8?B?WHFLR3Ywemx2Y0dvaEhGL0kxTXcySkp0Ymdldmc4MERZL2FEVU0vMFRRaG1h?=
 =?utf-8?B?MmNTeTlKNTR1S2VNcElwclF3dUUwSUFjUlNFRWNjNHdxQTlubm51WU9TNkdK?=
 =?utf-8?B?aVFvdXlCU2lycjF3czVFeVErQi9ZcHhidnVaSTlwdFZ2bGdoY0FTenQ5UU83?=
 =?utf-8?B?SGMrd3RrYkR2a2dSTHFhL2dxdlAxQTNENDVtSUorT2RLd0Y2NDhyeXBRTUMw?=
 =?utf-8?B?ejU5VzR6WEEzMnNXOTdSZHVFN2doVFhoRllrWng0eWVWZ1RjMENuaTBJUXdy?=
 =?utf-8?B?ODhGang1MEZKSG9Sdm9vbXN6VmpNVmhIdXArN3I0MlV4TzNYNXFCRnl1L3lh?=
 =?utf-8?B?d3pYc1ptc1FONXF6dHVibW95YVpvQXhuS0RMOEEvYWMxRUhRZnAwdGNtQTU3?=
 =?utf-8?B?VUpEak9ZdnpEMmt6RFF4ZXd5eVhlZkxGTkZMNXVBZ0VTcDlTclZmcVRUUHcw?=
 =?utf-8?B?WHVmYk15bVpXbXhjTDUyejBDM3ZUc2RiaG1uVUk0VjJsVHhVVHNibmdYaUJs?=
 =?utf-8?B?amx2d2xDdnNOTmFIWWZkcGZlRjNUTGNhSE90ZnVNNmpidEpJanhiSTdYRzV0?=
 =?utf-8?B?alBhckNMbGxaYzZjdkpBMjV5VjJYenBqSUxod212aklUdGtSbHZzampPTGs4?=
 =?utf-8?B?d0Jiaks1SStEZHB0NDNQczdpTmM5VkQwYTJ2OUlhRzBlYVJ1MDVLZmpDTzNu?=
 =?utf-8?B?UWhKcUpoOGhjeW1ieFIyLzRkQ0dQWDI0Yk1wYkpKU3o4dlRJOUI0TXRFamxD?=
 =?utf-8?B?bGJMMEcxeUlOMHRrUExBRCt4T1lMb1c5OGlGemRCQThzbzl4dzZLUkN6NCs0?=
 =?utf-8?B?QzN0NkU3VHJ0Qlc1Y3ZWS2t6NUtvRUVqUjEzRGxFb3ZqK3JNVEpJaWlyRDFM?=
 =?utf-8?B?ZElVZXJWVUdwNzBTemNBVlpiQk5SRlI3dmRjdHNwU0N1MTVkSFpvdllteHRn?=
 =?utf-8?B?dHlQQWZ5OEM0NTdFM29xZitMRVJFdVM1S0EyeHduRGR1RzdvV3FJZndyaENG?=
 =?utf-8?B?a1ZMRWpRU0Z4OTdqQlN2Q3E2Ny9LTzJURFgyZHRJK0ZtSG1GMVlvTFdQTWI2?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E29E3BD955C0494B98B878C12BCC3E58@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	779dO6mwP8lC7MUQ9RQpHTYzRU9VvvvvNri0qYU3jzYY2kZrOLB/jL9JaP/IJDFDJXj090/yv4/ylQY0rTangOER57kbPqh6IkqBZICIqpxAWByQHYSnQzdjbvg7OIZ/seXMMksewVFNNtI6nUWpi73gvhUfOqN8q1Z0Xdx/jztIVmQdNlSYV+/b506aA0QDgYTZkS7K+d0ysHDpkTyK8DGxc1y5RdocGeJBF2l0ryc8MoS4sXtmzjwPkqa99FgxpBCBKvtQ+WjozaUoQL2yiu7NaVTr8r9MOqNx13ayucGyDq80k+B67xKgH/Rkj7iQiZIw5GShbuBurlHylW7YG7wKOIiFLfhk6gL6j2O9lc3MPLeKnawUMxWlVCuknTxP3UbvhWrl1FWG93yvzHeshqQRxs+4YxK7iBq0x6lxuOlU2MxrPTRgTCdCxAjbNUH+hCvrkeLYvDZIxXN2RTW/W/IxqMv1KHibxRmaANw0yBK+AYOyeeKgtOne21YBmobqFI5vyByakWDW2NpQKrUwwqZ3B+D+WtYVB0lKa6uVulMcyxvF41njxoICXIyY0S6DrcmeWENZi6wGbJQC11IW4xflHLLL6HoMjocgCeNPntP1/ojoYqdqqKQkBywjXuzCzQwi6z89wjemW3zUvEokDijCxK61Ot5yCRwqm3E/LyTt7ugKT0TB0/MA/mQy8wkL/2lRscshJ1J0LtwaAdNusmTveO2ey+rV/LCQzRsDq58yqjnaCnwvGuVILEsQEIj0pKnEKyUHm+8aMFvJsZPvog==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c38c8b4-7b9c-4cc8-b9ae-08db3f4d45ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 14:08:52.2123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+Tq3/Bcw2/5ON1b88QTEy+QGDPOFvuN721hDYRtfwB9Pz8ngpaqe+HtIGS30KgMr33Aul6WXLEEDr1jHvtPLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_08,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=932 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170126
X-Proofpoint-GUID: 9-G2HNomD8vbj5qUIJIf3TOEYnzGcmkV
X-Proofpoint-ORIG-GUID: 9-G2HNomD8vbj5qUIJIf3TOEYnzGcmkV

SGkgZm9sa3MtDQoNCkhlcmUncyB5b3VyIGZyaWVuZGx5IHJlbWluZGVyIHRoYXQgdGhlIGluLWtl
cm5lbCBUTFMgdGFzayBmb3JjZQ0KbWVldGluZyB3aWxsIGJlIGhlbGQgdG9tb3Jyb3csIFR1ZXNk
YXksIEFwcmlsIDE4IGF0IDEwOjMwDQpVUy9FYXN0ZXJuLg0KDQpUaGUgWm9vbSBjby1vcmRpbmF0
ZXMgYXJlOg0KDQpTaW5nbGUgY2xpY2sgVVJMIHRvIGpvaW4gWm9vbTogaHR0cHM6Ly9vcmFjbGUu
em9vbS51cy9qLzk3NDU1MzgxMjYzP3B3ZD1SMFJ2WTBSUlJuSkdaVVZKYjFkTUsyTkJkVVJYWnow
OQ0KDQpNZWV0aW5nIElEOiA5NzQgNTUzOCAxMjYzDQpQYXNzd29yZDogODY4NzU3MjQNCg0KUG9z
c2libGUgYWdlbmRhIHRvcGljcyBpbmNsdWRlOg0KICAgIOKAoiBXYWxrIHRocm91Z2ggd2hhdCdz
IG9uIGRlY2sgZm9yIGt0bHMtdXRpbHMgMC45DQogICAgICAgIOKAoiBXb3JraW5nIFNOSQ0KICAg
ICAgICDigKIgVExTIENsb3NlIGFsZXJ0cw0KICAgIOKAoiBIb3cgc2hvdWxkIHdlIGRvY3VtZW50
IHRsc2hkJ3MgdXNlIG9mIGtleXJpbmdzPw0KICAgIOKAoiBDbGVhbiBhbmQgY29uc2lzdGVudCB3
YXkgb2YgZGVhbGluZyB3aXRoIHRoZSBkYXRhX3JlYWR5IGNhbGxiYWNrDQogICAg4oCiIERpc2N1
c3MgdGhlIGNvbnRyb3ZlcnNpZXMgYXJvdW5kIHNlbGYtc2lnbmVkIGNlcnRpZmljYXRlcyBmb3Ig
TkZTDQoNCkJyaW5nIHlvdXIgZmF2b3JpdGUgaG90IChvciBhZHVsdCkgYmV2ZXJhZ2UuDQoNCi0t
DQpDaHVjayBMZXZlcg0KDQoNCg==
