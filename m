Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D86AA9
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 13:44:52 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7iMEZ010009;
	Fri, 17 Feb 2023 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Fk5ZXDHk0WSA2puxJHLsHRF4ycXNnYyEVWDYT7W4yaE=;
 b=3AlNiRtxjiq6ijjbiwnWMm1wBCR1Uf1mDAFpMdV3J53QYr5s6VZXw1wwCMEPe7izdaU5
 f2rah8PGqo7+3/GpOJa01CQD6eA09Zg9vRkWQMButcdmX0J8aT6lOl3ezkmmnHevFdhV
 scF/eHlsunNpfZ0DTdgBsjH2YepkDGY2AjxBFIp2jSAJ43JnDciQCgJ5S7RCYrYs37qA
 9xQ8chbTuJWcnk7xvJOx8/34aCA8KCKvaXhW/wS4tf6PM/ezqYJooJfiTGl0hznBFbW3
 YGOhsctMmoIaREgpSeLrw2G7fjMhnuAV4k/HmcmfjfQLsTkVAxoWm1WVRdACRBzqQMTg Gw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1xbdx4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 13:44:51 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HCZBR5012172;
	Fri, 17 Feb 2023 13:44:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1fa430d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 13:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRGtGln9uug4zgBX7tq9jgq0mUZK1p+T2nndcvP1sgSy2s6Po9xXB1QgPo7yVwB5W3we5I+1saSL0Pkqh2l8/WVF1L2lNVVF/FbiCqV1Tn3bJzbX771LqHNRCzBI1i+T7RHmUJfaEpspQ4WD21di/unlRQuzder1tCIh7EaIU0Nivx5r5cB2LpOZuhQTIe8d9K4vsa676pdOApz2PS2IqQfXUmNdLRMNrUnSueLY3xxATSfkNK9xLZPfDr3uApo1rjeIVt5Jr19uWDXXuEyV1OTzQLd8jzHwmHjo0KkPXm6Lnf9zUIt4h8HkIeebm5Gl6167yLjBy1fsZRTNp8kBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk5ZXDHk0WSA2puxJHLsHRF4ycXNnYyEVWDYT7W4yaE=;
 b=XLc2+YMfUs+fO/xxhBT4D336YlZNNY3NaaW3fmbiuP3HutiCSZP+tDLIy6a73XIA7vIr5b3a9UeRfoC+31E0lDBcWYs+ada08Iz4ATpXkB0IkLtx56NQzXNFrjLN17CB8vt2n+l5ou1I/1Tf9xp5y89dTef3fKU6uPxtSbIgsNW7JqJ/8BprWEVKQIpoI8wX/XB3Xm06Nn3MMzLRs9pDwqHQu31wzsHC2UkSkanp1H+DdYRa83hCfu8yq2wLC/mHf0yOiSuVmAmspcoJ2J5BMkLJXPwIEe9KTsaz7HZfy7ALao1vEbwTV8h6EN45uDsi9Y2k6t3mF6YLJhp/qoA86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk5ZXDHk0WSA2puxJHLsHRF4ycXNnYyEVWDYT7W4yaE=;
 b=nlGrZOoqlyIldni4P4zAnvmwN37+3T8I5/GExdg3gSjXauf9wShJuvhCXyT0l5BM04YOymbIF3Y75FxuijKy0xlAdbD9Bu+cJVJyrh4JaAqmr3zQ3hJLKJQAtxMxyUgoUEwBV/KcQbLNfL8SQ7HkdVz8+oSZe4Yrs01RULhvmZk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS7PR10MB4896.namprd10.prod.outlook.com (2603:10b6:5:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Fri, 17 Feb
 2023 13:44:48 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 13:44:48 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
CC: David Howells <dhowells@redhat.com>,
        Benjamin Coddington
	<bcodding@redhat.com>,
        Scott Mayhew <smayhew@redhat.com>, Long Xin
	<lxin@redhat.com>,
        "jmeneghi@redhat.com" <jmeneghi@redhat.com>,
        Jeff Layton
	<jlayton@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Enzo Matsumiya
	<ematsumiya@suse.de>,
        Olga Kornievskaia <kolga@netapp.com>, Bill Baker
	<webbaker@gmail.com>,
        Rena Shah <Rena.Shah@microsoft.com>
Subject: Reminder: In-kernel TLS task force meeting
Thread-Topic: Reminder: In-kernel TLS task force meeting
Thread-Index: AQHZQtYAYBhUv2M8WkWrMdMt3YfqWw==
Date: Fri, 17 Feb 2023 13:44:48 +0000
Message-ID: <0EBA6CA3-EDF8-4C78-ADDC-61D66213CB0D@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS7PR10MB4896:EE_
x-ms-office365-filtering-correlation-id: e8e8d78d-97db-43ac-4ee9-08db10ed2306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kgMjnmp7ymczZRi9GEbpbP3sWkysfvr+EonA8FJ2vg57vLJAArUzTdTRxDpFocSyD7jENp5V+E1O5j/h0a3mIuTmpzfD2TvquF9NQz2SuVGKMrF5iPHe/XsjQF0lec65NI7jyYayp+4UlS+n5bj9T/Ke9c5xYFeU4hqn0QpoayczutL+MSRjISVwUQzGGnu7E+e/E4XleMmHF007z8Yvfl6b8dtywGgX4lhb0a1pM00o2CAwQ7WQhSnAnG3/k2c/tx8hwRZB8zAI7zwyo/LcL0gcJKYOjefaaapMvtczI3zim4FW/T1iKhlWhmLRhRCgNx96Kg3CPkNIoRrq08roqW/ymlPl3KccnsAnBxI+pZbBh+H3oGVs2cI7YcKtmt2TstB2NhuY3VuSvHfzWmqSculI+CkSsQYoQ7Y8dlLHyPOZOimwO0Bg6xbimmGN20Fpcm5Fo0Uu/23tlSRtkYrK3DKDhrrYm6oCbPgvCwB9hx9htclZbXL6yjIjYhSiK/qc7KlNlvvoyGd3RJEVa1WiYnuTq5TQLR68WqhcgrHUekMubKj/JI+rRTNqez6OHPUENWS5KKAIXCDI0qOXuxtAmSxie5shHN0ojiPHsX0qx/CJmGdEEzTjT2wMSz+12g4jyu3oDpSBKlJ7o1nvk3B+CWwC6Rmxbi37aFUw1UR9+e5NNguRRBEXGysCtWrRVTqiUF82ix9PTK4Vapg1tu/4tjkhepEqr/fWTJEz2WCwRZs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199018)(83380400001)(6916009)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(91956017)(316002)(4326008)(8936002)(7416002)(5660300002)(41300700001)(2616005)(6512007)(6506007)(26005)(186003)(478600001)(54906003)(966005)(6486002)(71200400001)(33656002)(36756003)(38070700005)(86362001)(2906002)(4744005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0mlMVZzDUdVdXMLgWBy7/SbeCe/IUyVgmb507bWxvGRF7sTewwbndUAn3Olm?=
 =?us-ascii?Q?t72oCLukJffXNsUiNxo13ThfGZYIhRW17lTQjeCpBsxHuBEcMiLGbpfFqSIX?=
 =?us-ascii?Q?Nvqq5LChZHu4WXB+mce8f5hEkdwGkeReF6xApUFqzvT5n6O/SIfQWrvPbclJ?=
 =?us-ascii?Q?cdmmoq/MtYwKmsBuHPXHCvLTTbIGbpTL7n5bTNiLOnLEd7IlQnQCiZoeYMkU?=
 =?us-ascii?Q?Z0OxjfiDQzkhHaxhC+Ptri6dhRo2T2SShQ9lq6Ha7shKz0Z1LpqfQ640bR6v?=
 =?us-ascii?Q?toftNI11CQmdODo+SH+0mVut/zSq9BpjmBTm1M9/seSP2a31A/TM9zu1NA2X?=
 =?us-ascii?Q?eBHyNkoXNgSuGdZyR0ldBy4XWkVznv31bK2l6dBVPYQPpfyldxtboLEtONpX?=
 =?us-ascii?Q?22uhie+Il4fxKBprzXm96az7ID/3NIA2Cdn6JYuKqW4cEB6x4LdNjvVY2HHv?=
 =?us-ascii?Q?gTypila7l7S/icMRkWBXtl00u+IJqH2gd/gr+XekpaPy8yHj5Hu5NK0wAgU4?=
 =?us-ascii?Q?Z+qcqWTajnw+D3LCM0DPdsFmHSjLprJY7hAMj/EGbYi2IT8SjFsjz+NXXlV+?=
 =?us-ascii?Q?bfdBBTG5Vuq8cgvZXlR3GM74xqKZWObCeG+QuZpL9mWB1kWPCKQVm83fjfUN?=
 =?us-ascii?Q?YUQmxIPMzrxijSOrQFasp6/TQEb+VJx2YO3wrP6jrK7fYS8pze6wP4fcWyg2?=
 =?us-ascii?Q?LaXb44gB5ASJ/DLr70/VNZBlcUkji7IGHp/MQH0txUovDrwGx6u5nmoeHqzX?=
 =?us-ascii?Q?3vjLq5nAuodTbfFr63hd2r95E6EjGdAayyM1awZS/sG2WlvZYvak70YixEwE?=
 =?us-ascii?Q?sxQ/Cfn3WgcMTFOEtH/BUj0TOC0C2tUv6KIjT4RzNIJt32R1ft470kgPQPaH?=
 =?us-ascii?Q?QErgcbVJeIPbW4LQxexl5IlDbGFKiyAl0QYQw/mcb6iDLBmSQuLOMn2XwnDQ?=
 =?us-ascii?Q?HCkwzVP65w+5dWgxLVHlz4XsyQwfFlDL6ONk7AAYQho/W052NQriPzC98Tvj?=
 =?us-ascii?Q?NXbnDp1N8rwF53lHHhndU5sDo2qaWMCbrqe7IW8P525vL/pE/tmKmpzuwUHM?=
 =?us-ascii?Q?g0Iv/nB7FUEbBmMvyxvVkPsq045uMHh3m3R+asiHTGqlOFCqSrxXWwAumiLm?=
 =?us-ascii?Q?OFOnv3Y4p/6YrEgr0rSEVhRDwN9JRluCm7fqQoQt3RM5Ze1cx0BZcZD7QiO+?=
 =?us-ascii?Q?kToPQdmbkn59LV+Lwxd9RizRqYK6e5Mf9SNwDR38q3tyWjqihUNnVOVUZbDq?=
 =?us-ascii?Q?dSIhKhD06ywe8PQFfDGtQl0pEoYGYZJ0fL0pkiIDqWJN8kCBEZISbMwQorim?=
 =?us-ascii?Q?7LfEXG6VECN4CfErI0EOovk2QSfHpbAQ2pY0s3AvIPpxpsluXkS/JjPHdDSG?=
 =?us-ascii?Q?Z/s5STEJkxihJu125ETly4qIbuY1O9rK8hFCg0g0ctijqS/OYRXQrQaGnFkg?=
 =?us-ascii?Q?de30gbufNoPaai70YwU69WgVvhAoe9zUxx5HGT+DId72ka4ccJM9eXfUR+n4?=
 =?us-ascii?Q?H2BJTHyP/GQNuxwq0/s1XXWjUHF315nYVxVCUh4o5JOF4M/1pqwTzxG8Iq7W?=
 =?us-ascii?Q?H11oB7cxhpFPxMPHtfBVIefzKHXS2s431Tai0BH+Xw747eyo4x+AReY7gTop?=
 =?us-ascii?Q?8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9B08B5403810B045AE0B899811828B9B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7j463y1IeckamQI3cYBTryE3rSsm6Gdpt/aM1RS3QkoSzbaQNyDxYsH5POcsJtO+wfvIqgNqRQWmcD60dUW1rkFNUnWuPMwVQNqk194mxduJkTRyBqhIFxTum7ZYsthbElxz6o68YL+D9xLyDfC8fPTftluXmO56nSK6U+LtBwpJiB+vJ+fTuFJZXmA3ezC1JDw34SyqpiJeoIyltjcwMEl1YGdK/0HMhId8mrXZvgqPJGeiDUYK+UXRyWiLyvSO7yssIPcKXgCZY+yINCaSkGo/P3Tf5YrEGg/rSC/ErAtvnxFzpdnYN8k2/amgNeBnhwcOMT29E6KbxhyonsVriYGPHM2vdbV7WZ2+KHwtj/8zgkVMHz/UjEf2AKO5Yr7QRuNe42HCV05dM/zh4WP9TRulf1CGzdkzJa4zhUZwGw+TqhPkyIZO1g0ymCb+TcomckecFTRSGl8KFtVzhtRkNtKQpRrgnSVanhBO9uWkcEE/G4PMIXUEZ1D0V7eLhYHmpVBtbUAP9da5UKAM8nQI5QczEBiXoCfUNAMNvSc8XNxcz2nZAw+uo02n6xN0rn33Rd+DJhYoffcS9k56xtzteTOpLeTqjcUEG9pMF4iERza1w9c+dlbc+dvionyuyoxkDrwlE9wuH/KlTjqOC5kd3lxZCsvGziDaUBnqW4AHm95TOR9qu+aon+58Zt3Kzxkk+oh8ekhvLO28yShuq7FXbnwiCbrQA9A7IBVh6piaOk83XJVde5T90e5R9Vg9pGRc8TdC/8pYraiGtf5uVUnfCPlNJ3cLeF0FjhpXZ7cBVqYqF+nevzjd2B61Le+yybMteLAXdXPJpqLfbKWaAEQLt57+Prfb5NQik0LP6If76ltgA+RtUHPHPXSFjulzlGDPKOin92NJFF8/7Xl52RGCTA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e8d78d-97db-43ac-4ee9-08db10ed2306
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 13:44:48.3654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Gf6xkrB0rwaAjqSbeyayYgdM4XI+RUUX5rbNrS5ugYexzhKkaQi5hT26IWrzBeIJZvJY0inafM1r69TIygobg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4896
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=952 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170124
X-Proofpoint-ORIG-GUID: vS3CIVmjxe9aABNvsZynqRTrBUWnlt0t
X-Proofpoint-GUID: vS3CIVmjxe9aABNvsZynqRTrBUWnlt0t

Hi folks-

Here's your friendly reminder that the in-kernel TLS task force
meeting will be held Tuesday, February 21 at 10:30 US/Eastern.
The reminder is a few days early this time because February 20
is Presidents Day [US].

The Zoom co-ordinates are:

Single click URL to join Zoom: https://oracle.zoom.us/j/97455381263?pwd=3DR=
0RvY0RRRnJGZUVJb1dMK2NBdURXZz09

Meeting ID: 974 5538 1263
Password: 86875724

Possible agenda items include:
- Conversion of upcall mechanism to netlink

Bring your favorite hot (or adult) beverage.


Note: lists.linux.dev list owners do not have visibility of
list subscribers, so I can't tell who has subscribed to
kernel-tls-handshake@. I've copied individuals and the list
for this reminder. Next time I will use only the list address.

Please subscribe to the list as soon as you can so you do not
miss important information.

--
Chuck Lever



