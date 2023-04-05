Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C773A5B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 20:32:48 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335IukGq013958
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 5 Apr 2023 20:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=CXPEZRQ4hC2InPIo19zmFWQrYlGmpEg2DEWbSmHzoqY=;
 b=jMIqaW3SD3RmirGZfoLd3lt7yKvws1PvAAyxxf9fYeYAOFXClhOeWvybg7i/j1VKOvV/
 yllz5h3RE3gnLN06aAzIOB4GEOCAUfpVrfguRwmqAo8K0CBrkCM7U+f2u57GrRnFstnG
 vHTmCpZkTj0/sBLKy4c4KesONk1N5XpTYrZV5HnODP3ge7KOY0oOiF38uqAtR0IpAzVO
 EqMkB2q6KmFaNnCAOvP84+4yqD+tQ2tjtRWOPqjIgsdh84Ez1eqXhH/kbGHCYvWz79Mv
 bp7B8xWfU5py6VFB+utcwJQkrELv1s+dx1klJb2Tzpv4vzOUJTZOE3e9BUQS42o5tyG6 5w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppcnd1du3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 20:32:47 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 335Jlab6017709
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 5 Apr 2023 20:32:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pptp961f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 20:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5lQmY0ajUA77mHRNiMFfEUK0Kdlv8Q0hkcrPmi87siVuuACpOD/Pg002vRBW3Eqw8eKY7uc8vvYle6m5yttj17Ko27Sw9Benx/dm0c5puYtkz1NkUy0gRf248FtnJ4kby0ET9oXWh26nTdl3D+XPv+PP/W9OSDJf6GiJrgye9rRD+IK7h7mSQdhBcYieh6qAu6JFx4cYrrcGCAj4diYclG5LtVSow4S93Rgg2dAOWPxcKUT1+w74lJ5T6zjdiYx5DmrwWz5q/GO/mUlCpA0LnaPosEZNNszEUTaFY3KkJ3b7VgVwe3JzaNdQ7LFbMFkD7OG8d8UINpSRP4usCRv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXPEZRQ4hC2InPIo19zmFWQrYlGmpEg2DEWbSmHzoqY=;
 b=FtU7txj+73L8vgIFisM1VcdLTrZLU2uA+6+Sw2XGrah3+KDnIp8yo12ZfY5xxufYq6zD/KUy8bnpuPGNC06bInlxjXtK+kmes+8RXedWAq1xC4uTDy76wNGW+M8aQrhr+jsHudg6mRbccnVt/C8Yp+ERyY+b7eMuh61KSzvyx4F8JjTUCKUeLa8ci83CO5ObFX1xDnVffHeCBYU3IYMlKKqwc2EAplOoLe3yOJNw4nr27cn9GH412qd4yeYtGi5ODWsgWa8co+oAjQ4/cv+/TQrS8ta3Q/Bkh2F1nCq5E1hcdrkbN8xoVIkIlGjsyL2VYGn+foYIKHtXgtLqzeKlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXPEZRQ4hC2InPIo19zmFWQrYlGmpEg2DEWbSmHzoqY=;
 b=qRSRo36iLFKzvaxTtkRTR0hmiEOyGCsG490bZnts+wsiaMYfpugavORvqNc7VdybfxoPTrulonAoh1SGxvIOyHdKh/gLueG8+11GtlCxL++bakE5Cwrwps940w/d8+bLZsQSBoYuRLjgH4cvQMZskpvoXKG2owwynazL+9jMHDA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7416.namprd10.prod.outlook.com (2603:10b6:610:156::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Wed, 5 Apr
 2023 20:32:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 20:32:44 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: pre-release of netlink v9 kernel
Thread-Topic: pre-release of netlink v9 kernel
Thread-Index: AQHZZ/3G4R2V00jOPEm8//NyW5UHAQ==
Date: Wed, 5 Apr 2023 20:32:44 +0000
Message-ID: <F800AEFD-7E3B-4133-BADF-6FAF610A2827@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH3PR10MB7416:EE_
x-ms-office365-filtering-correlation-id: 31a45204-7296-4f72-8b8b-08db3614e97b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JnzA0Mjx3xqfYMGdCDd6DzXPaDosCSBJKkv/ZsfrwQAd9sLT4Ps4bmDExIWpTI3mfmGb/XkbV9a9XnJdxQsB6WypotkjOGFyEVXuY9LXeqFwky2OJcy7o+nNyZtG8YSvcnffE95RK6yk8a334lqKPvsxbI3ucfisZoox8tRo6ScSaTXuzThCakEHTNEyH8VGd7344Hu/mDImX3D0acuPvdC5rqCRTqgOCPIg3D9buI/8vZFwDyL2GXY/qIpXNCxyHuA3JIFhCZO6zSbVqwhZBgJuwaY//Nbb7B5EZbD26MUy5xjLzt4N9T2k/TlS1Q3ycp/H4xLPRc3DSgov1doqtYUUps5eISgvF/YLOia/DhccgDnA8riFlWr6JA1qd5NB0n8WkqKK6YIE+WJKTAkpDfFeWQZ5CNE4uIVfMJrQwd22qLk6jelMpY93aU36qVzR6ZB4Mt18HUadnwtUTOepbI87zwK0iYPrFz2xcRT9tOtUeYfze5hL/rRCMXGbMhAhGGTwKEjMYAAj0lum2ywsLnc0U+JCW6NjDXSdBF+D1mx3Zw0+sCZtHra6juP4NFmmcP6vUjPMkXXwVCyTkCDzicXMFXTsWU33u9nTeyg+FH+f2mc61eV5t+/boJ/wRtnIkrdjAAPtwOhf/c1XXW8XQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(2616005)(41300700001)(122000001)(91956017)(86362001)(36756003)(186003)(966005)(66946007)(6916009)(66476007)(66556008)(64756008)(66446008)(26005)(6506007)(6512007)(76116006)(8936002)(558084003)(8676002)(2906002)(6486002)(38100700002)(71200400001)(5660300002)(33656002)(38070700005)(316002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t3n01gVfe1a+dN4WplR92vatXZd9OcwAjNTh97CTdBuWRB4/x4htQixv9S+H?=
 =?us-ascii?Q?PMlqG8GpFbGT3jOKtl1+XgGYJU5IyTMzAOHL00vuqt20GFjGb4OMa3NgMgml?=
 =?us-ascii?Q?F/y4tKpj79sTOL6obK9+PvkjXaukS1qlXr3TeFUAVY+qDN/UNNfv0eAzvDWW?=
 =?us-ascii?Q?0xdDsNQozsNYTPc+E2s+0GaqvSkfhmTQpGKOsjUoASbcXs8H4AXdZJsiOIIa?=
 =?us-ascii?Q?yuMrEqbCU3KD2IPGX4+Ng6JWuuTyqptWvsl93/tVU45qc7LngAH5J6d+P1Lp?=
 =?us-ascii?Q?xJm/7uTI+nJ1sfOn5OHhOJpNybfL+iyULt/lALi161oTV+1NnPILoPgUTorb?=
 =?us-ascii?Q?gNAt8nhdPG12DGNtPa9MlHL25Z0wSaxK6ueSMO9j0yzM0L84PWB6fb2ILyf1?=
 =?us-ascii?Q?BuzwVSNm/Pbu1lDD5+xhg9WLYIoTr84qjHNZehnErokJjHGGJN1tYBpJA643?=
 =?us-ascii?Q?2aTkhYcSVo/gvp1r0XpWDpRGAA17MyS7m1BDFLeY+OPX2StmpGKP4fBphIUM?=
 =?us-ascii?Q?/sc9YIsWnRnMNwcUBVBe0kxpoRgjnEqNyXM2b8iaNvj+95z5+SlCs1WeH4jW?=
 =?us-ascii?Q?Vw2bK52fnuim//SuEpTod+suLvbm2De9EdJ0LN9Xmped0ItPPCdhcZlYRbiw?=
 =?us-ascii?Q?y7+xp6oMAjzH4/BnqcgNuGt81jxKI+Xk/wyyCM09JSzgo3UxtnC2nEyKvbw7?=
 =?us-ascii?Q?ww4yan550jq11vXO8rHiYKuZA9DOHEg0FCzYo77x+X6I9kqFf2p+fwJxqvyU?=
 =?us-ascii?Q?3T8ItYBdyg/+2PjCFZLnXUssGbj3ejHohFcbTqdYYtRj/Cxtivv/iGbUOgz4?=
 =?us-ascii?Q?d7aL+YCt9Yas8FAW0rzWiQl0UUaeKlilClG3NBB0JpV4CVzpLm01HSpUEP8e?=
 =?us-ascii?Q?T+zhSTdwIvUtOfqsKbx+wiCzfAIz7hB/kgMe8uE+bs1H+0z/310mc2gEcY6+?=
 =?us-ascii?Q?SsKA67S4u9kafSqYWMjo2yh6GGEzRm31jgG6Gde6BYWBEXluMWaYRwFrIij0?=
 =?us-ascii?Q?Ouatb9mAerjgIbWIKG7chR9SMsScIXJhtE3NrI1TIkRvaquTSqIv3dvb0mWn?=
 =?us-ascii?Q?OvUFCZl4vSgGq9IdbiM0pCHVt+MNucNjjv9pyLw1EBTF3vDtIIlW3cEEAgaa?=
 =?us-ascii?Q?Zb/dvs7nDMOmKvdwZWAXJhothojDMrI2rfGwvZlL2QaGI2vrAPoRSlqgbWgT?=
 =?us-ascii?Q?NdaZqDmSm3Kpbfmdq0tNbSL3PQIBguTkGEXZob7BqanvF4HrFRg3sA0L4bgM?=
 =?us-ascii?Q?MXLqo8eBgRZjaqOJK6S7Kp7RjFerBL+F3W+2tFoYQFD4NG2VnMpAJXUMmzR5?=
 =?us-ascii?Q?CFUykBvo1SgGFfbdyCrnB2v+0qrWSszbUBSo5hM2DogN74aaYi3cVR+brb4A?=
 =?us-ascii?Q?MkVuYz++vBwPY2fdDwPSFMjJB4P1UeFcviT8QsKnrjRdkF5OswO/HP/L+N3A?=
 =?us-ascii?Q?JXsF0TEIj14QbwUIhU6gQdCbCVo1n8hfu8EM5m66vKZiRvp5YOcEAGxn78Fm?=
 =?us-ascii?Q?d45jdD1QQSAJeQqVPPKs6ft0c03x1NLQmO5lEJ748uFyUNuIml4l7LtC4kE7?=
 =?us-ascii?Q?ldLl0kQVjJjjNahKlPXdKr6NqX5dyXBamzV6gPpOjXn8UMOSGf64vTuy9GOR?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2CF4106F7F1224C855B88E15D9002E2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	drN7TEPibWfKJvlcQ3R+3cS5lUfru9Pfrk41qJrKytcbm4gYxwWSLT1jcA1+dKtiNar5NhC+yqtaRP71RsJup9lay1FCg5wV/yLfBNAaGz9i9TFnDRMUNaZ2/U6i3WBkZqDr+UFhi5esLLb7q6DmNmEJAcluJu0d8HzEXCmAlYCRTKIrm+EaHalNSHUcor/h2gG3EIYSY3bS6iMFmjlAWNEEm5m5jzA4pCJtJ0eRvKvcMgCMuUG9l6IT1iMrKh1LSrIJZV4aZS7r+iaUrd5npJIHpmb1GjHe2kOfHbHxIKAqEU0w3YtiAEg49fh8IhoDLx0hXHRvAaDNP0pw/H8FBsENqyjWf0FDgjP9X2ATTTlJZV5neDLn2iDJOf2G3NrILjWukBSMMasTQJKn6xszdyxznH4PNe1FtBSI81aOZGoUpCRJj9sa7lO9P86cY/ctXx7LR+8C7a2h7NPDhnD0FBvZqWvHHUrSorTkNm0VYbVulcL5W7lGPsK4GAZFV7YHyRd5wKEaqOEBzgY/UfA1auCDBkC9uUjGmkP4IyBTMWzJSZZt4oRKN4kVKd2N5F9golnYrVqTqZwpe9cGVY+uyzjtYox7DjxdLRe9ETsBGu6Et0pjl1a19wchD1sJf1hO0qxLZ3EAWMGq1pWjoSQs0el+ZWioJHF/XRLDyyMk+C0YCZ91EfEqS+RJcVHLYAKxFIjI2CtpznL9OE+DGlYFCIcvt7BhXtfL8ys8Stc+j/ZVMbxetNb7VqoN74HWPv/R
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a45204-7296-4f72-8b8b-08db3614e97b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 20:32:44.7466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjKg9cLrOf4shEOj0toMSgzkJHLOWOiBoYU/AblkrOQlfYwhPFez5h5MPdboGmj8qPqSgJu5v90dOoPofvHdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7416
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=580 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050183
X-Proofpoint-GUID: 26ZDvo3VBX2UsB_1wjM-pve6qMU4GJdI
X-Proofpoint-ORIG-GUID: 26ZDvo3VBX2UsB_1wjM-pve6qMU4GJdI

I've collected recent fixes here:

Link: https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
Tag: netlink-test-20230405


--
Chuck Lever


