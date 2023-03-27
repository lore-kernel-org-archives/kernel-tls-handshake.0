Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145C93233
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Mar 2023 14:22:27 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32REJXRe011141;
	Mon, 27 Mar 2023 14:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=kaeFjawZOkqVzE5Do0NmRNC5TvN8S5cDlM+WUxev9mc=;
 b=2JJMZTn6nd0v48n+p16BSkWGKArha1vSuje6duMlXykxl04E+x4J01uiKGAKee+X4kVu
 ZswFwFwKpREfxw+Bosj35u1RTFLQZYTXwfagExeZtk+3UZV7hiFsckjvU98RGAKBRp7i
 tA3LYk2bQgfRxB47Mlpl38X5IvkkpMCy4kP2z5x5n3F6ni93wMqFmPi5NiOBsriopzWg
 W3sDYnHMMakeDuHkbI23xdJ0+ac1jRDxHn8xLnmeOJT94oDbKnjp/wjb/8eQQs20nnMj
 59K4gh0EcPONIilMxrgKMMO90nP3TdQWLUhCo+lbHRfsCEvYPH7fcljQV7jFdCRH80mE lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pkct7g0aq-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 14:22:20 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32RDDQQF005444;
	Mon, 27 Mar 2023 13:58:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3phqd4tqs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 13:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0wclzaahdKx8Y05uu6k4KHDcNTKD19h/dNJA5GXLhxaxOWMJ0HK/fw5Y46NL4MVGbOykEkhGMxr1/RePv35ZmTC9OnMcxKajJNvbHTFzmlgALYJGlnabvGtgCWqglTaR/WqDBGbRD8dxhPxb654ekmM3wpFAq5JqE5a1XBzoBJ33oz3/5va4jTnMbSrUiqJiJPTZX246JlWCXKG6B+UCK9bFjTYY8RxfpfynSpzwS9AbTq3Y/mV5CMc9PAmP1Z8vnWoP2jaDiFK7RA2CzOvSbv+64RZooKw1A4z3O0Xq/VfN6W0U0yfssZwVddjkUjZK0hItL3+sb34s/185bT+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaeFjawZOkqVzE5Do0NmRNC5TvN8S5cDlM+WUxev9mc=;
 b=efS7P+ym8Py1cB7xBBIq7YpXjkx3Zp85QDx/U+DgWjdgEyBGSXfq2GGRpHqSaUFP2ESl3XvT5FC5Lavr7ewsFlen2wmPGrP0lSZaewlC4Tv9kyeZejWf4AjzvIqwP/EvjBsu9IRMwiz0IlY8Vc26VSjAnc6Ki5jmVbQfgEMNK9mtIYQUJEjustpum2WhzXpWtNClOUIigNa3HmD8G7TBuRyLYQqwlHFo7HC42kOrEmgumxkCucAc1Oh3IUW3rJcaqa14f1gJsEuUMLQVNaLu6HZgptbQFCt3j4l6E18iZBmSPBjUdx5Do2uhPprJcLPkwCvWXKaXEabJyc7jt5lEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaeFjawZOkqVzE5Do0NmRNC5TvN8S5cDlM+WUxev9mc=;
 b=k9Xsvl5lfpASrEpq5pFKZ4qabFZWGldpem1xEkrt03hFoSc9p0yawDxPRD3nU3226Ci5tg5pSCqAxJ7P3V/VTcCRzbdL+2Em/IEiT6hhCZ4/vVTgCHxa+I8fH3BNQBe+KPyCYSUzjEk1CHkJyd2orlPa94wKJB8PVYGaU4U6OVY=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM4PR10MB6229.namprd10.prod.outlook.com (2603:10b6:8:8c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 13:58:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6222.032; Mon, 27 Mar 2023
 13:58:54 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@redhat.com>, Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: ktls-utils update
Thread-Topic: ktls-utils update
Thread-Index: AQHZYLREswiKT1jgDkylVdcyJ/GG8w==
Date: Mon, 27 Mar 2023 13:58:54 +0000
Message-ID: <95A50C6B-435B-455E-BF18-4FEAF41F147F@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DM4PR10MB6229:EE_
x-ms-office365-filtering-correlation-id: e56681c0-e549-4f0b-5757-08db2ecb6739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ukB7rNTFEjhPV+xAKFa9JuMTQ/d2oSUXAdVSGSrJHV98e2AFGTvFCfgCsHpAhpf6Cp/XvQxj437KdosVBAw0njUi3N8Oil7/wvmAyWsyDwUBAyQQEYUn6R9HpfAHPY/0m4uYwD1gE8sRDDECHtFK3trr1amL7d+Twz+7k/znKLOfcVgW3jm3Rf9imvwIQDLJhQyNKPXQVZgb8/9sZRfqyeLgy8EdkBYFnG+nLwq4ZRuk9MLS0fGtT+oHTgJB86IDWyjEKjwWEt2s3TTjUou4vvOJ/2sdTd1rAnSkxr3ftOdHM2bzqfINvHsnwr420mTZNgA0aKnmUui9QZCaCEHZOu1EH67tZOwRJZaItdUQeS6q1Ep/9OpJwk/avU3kRR0ctrSH4iOyrinVdMz2eeusvuQVwGiwTHStOY4TQ1iQUqAJP4BYsjuSSD89m0QDt7a2YgOwU01hMWtaHxuXVcgMc9pftX9x6Zk0Ukad8I8eH/jw9ETAr71PL8oII2yKpKP70v5MMd7Bv72abGdC+ExeD/2OiKZpIQosYyLwPFwBTB0iuRMhQ0mQJNWqYqzuwIsx8x7azPL13QEIhvKGAuNtfKE3VZj93Vx2NS7iZ4tIvwjr3EKHbdNFhmKbFxiT4GFg7eP9WokblqFGpLRoXSwjYg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(38070700005)(91956017)(26005)(3480700007)(36756003)(41300700001)(8936002)(186003)(86362001)(66946007)(5660300002)(478600001)(71200400001)(316002)(4326008)(122000001)(110136005)(66446008)(8676002)(6512007)(76116006)(66476007)(66556008)(2906002)(6486002)(64756008)(4744005)(6506007)(33656002)(2616005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wTI5T8SyePPR050DdNKRCHwwYGvSaN4uv6SQhmtESkiE6zdjuX5gqJ7EIdN1?=
 =?us-ascii?Q?RrY0nj+Jm96xHaoXefZuUwXCGgADmMfX1u2nt7W2X4GzyREHntXZktpvBvcs?=
 =?us-ascii?Q?84GMuTG+wgVC9oIfzkJbG16m1T/RHdU78Umj/szSvDurW+ijbYQpG2iOCIVN?=
 =?us-ascii?Q?317cPZ2nxVWO7txXS3G14tPZms9d4tEiG+esZ0BOSDrmL0NIS0tYjUX3BI3V?=
 =?us-ascii?Q?aZjw8NBHLGSo4iXJVIUdfty3WhxdSvbt7+YqTBAX18Mmm0aw6Xf0PkQHyfUM?=
 =?us-ascii?Q?IVNe3aPnsq+ZtPKNt6OQMiRHh+RgVfQdGG1FGtiSlkGT7sGap6N+p5f3O8/s?=
 =?us-ascii?Q?7t5/OKBPEhcRXItygP5F0BMPxp6ZRyXgJb1WsA+k9Ptwk1j+dFrzxVM6IRxI?=
 =?us-ascii?Q?7/HP0gqFgDAhAQ1hl162yifPYNkWDKXaeVoZO+GaIte+6Gh+u9MbP+CsNf9A?=
 =?us-ascii?Q?hwUR82sKQ5f02/F2G9iJImYMJZc3kV7CXbbxMjp+wrxXno9pHP6769zkHbCs?=
 =?us-ascii?Q?nr7eSzqc/UYXBpA4T6ezLLHZmz9EBSXsZGy/Ahea/oQxcvSLYSI+lMa2/U9V?=
 =?us-ascii?Q?8hg6xTcJ6CzeHdeboJygfip9UC8owE/xsxubXJV5WXgKnXm2+QU5Xo2dLxBt?=
 =?us-ascii?Q?NIttBn96Gj6vMr7K7YNoP/KKiGZAMFEphv/LCUh2rKwaHLhIgah64tOU1k6R?=
 =?us-ascii?Q?+Z3JViNYDi9Xwb6WWPX7+Dl3xjmUZ+stGxVFEcwH+PPF3IHXgKE16b1Q+B5E?=
 =?us-ascii?Q?k6KLLsixe3XtFPZ7ZLjJaaD7PRe6u47JJc6QzNaoMfvf+8fmDZqbpOWqcPPs?=
 =?us-ascii?Q?1eR/nHdEZqVoQEHkzzfHG4V8C1ap7MX3iECCI1S/f4HRj6QhZPbymi+Ft1Ce?=
 =?us-ascii?Q?vu6L7HRiG4/ElqwV5YB+ekscAd0AUjYxCvBWTHL/qBDW8LZVp1SetAZ9BGa2?=
 =?us-ascii?Q?4hD87DichcJJmA3LYyZmMg5daDBdQYDFm2GtOE6yydM9tF1We87+tVu1iTQq?=
 =?us-ascii?Q?FyT4TjBL8EKFRbVmQ1viD5bwZWSAF8ynsTIe/+LAyBtNZT7sqACcflFR/T5g?=
 =?us-ascii?Q?WJcTIJk4HGiVyiUaFrgjFhfn56s2+qlw6q3SnFPuk6pMHMO7VEI9C9MjC9O2?=
 =?us-ascii?Q?VpPwlGPpT8ppeYR93PciZKlDqfdKlI9kzG0xCbBnSa1oPUxjXYDmpK/2typv?=
 =?us-ascii?Q?uGMP5zHYY29E7cStyS1LcCV3MEerdfLzSozeJDbBmFYOPhhZBC47K7A85Qab?=
 =?us-ascii?Q?7ixfm8AhbYr46K9FYMzutVosD1E7qYK8o7g21Cy5mY+e5pjiLceLS+U0+aaR?=
 =?us-ascii?Q?SSPrNpOR5lOekj3AVXqHu0zWLh4JKbTtr6pEhVeEnbsEhfdTC1jY8QOjdMux?=
 =?us-ascii?Q?vSJRzyIDj7ep3x1i2+nhuM5u8i7emyQVLPQfnx/Mb2HJoHEdjbkbS/tz8o5x?=
 =?us-ascii?Q?zbl/ag503UJUEBxugkklLh5C/gIzW7cl+tM7xoMLJFlbydw9hu1jE9ZyVWx1?=
 =?us-ascii?Q?6lPDHSCtSFEL3iJvho7saXCxkimBwykZvJrjf7dGCb8oWBFUyWeS7zhLDk+Z?=
 =?us-ascii?Q?QyXSVFmeTFVyTBVlK/vDDUdCjbg2dV1pvFO+uolBk3LOTxl1Epzv62Br/Vr3?=
 =?us-ascii?Q?tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <321FD157AE65884E862D213A861CBC07@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1OjOnAaeOBc6HdYA/2Ij9ZTwi/WC6QIgetCb/1rTIa+mizT9JU7vgoOuOhU53jkh4dntniywN8O4pxIcvX64QAgcIuZvmPbE9vsrDuGmILhOz1aFpaN+tRJj6M5+6ZPclOzG9zmtGhJVn+znEBbdZ4rl/F6iOd1LVW4JNM1rqq3xdaP4oF6hIV9+fw5va4XWoul25TULMEtvvktebO9PanLtm3BT0GDP63bEtO2q2Lhu/MPuRjABwqoJCskDrKNd/lDAQu+BES2ymS8Lw37NQcrfPlU5M8r7qXgr7jWeEo6+0tJNl61tl2BbxuNFYmXKWpxjJhzx5LAbn9ohHEFutuXRy9IKDliMde/GpmdJnvGAz4L5L4TnzHdVGANwtLFWCs6UEspx3X6FelIQyisEYvvP2XGWRpMFZghNx3NrlISlxoCOecG3NLTg24B7BJ3lMGOzVYMkLIsXDm6ko/H90VvR2gvTmi9aOYrwqa7j5la2EfQ7QDYkI7FABsf0TkVKPrdt+uBvm0azLgIHNO62Bu+KVfbwgkboCBAj3E0zINuqfp2onOCB5bBZxaA12OEPurPVCdmizpCkg5hbFTVyRzlpt3sS6uyaV25yXqXuXcv8j+rvUX2P5jKcBxTYqoq/hTiJ30VeA31rqTtU5aZ1EyWknfbgP1rysp+94tiTcX0K8AX44H6Idd240OhmqXt3f+FuNf7mZsf0cuO4iJdIbdYUryMOB8qqQ91atmmpY0nAt4kaiFEwczg0jrDkDbHTRomgzXE6cU1OkzPT42gQTkx5Nh72LtYtgKg0cIZrl7GtSVfRhhY6wsynT2XOk/0r
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56681c0-e549-4f0b-5757-08db2ecb6739
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 13:58:54.7827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwMSScnXC1DQVp8Xz9YuUgJQ2j9q0hT3nYA1xAps41DEZ6BXanrqeb/v+N1v0U7NhB7HqI+zcRmxVsM+ii42Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=782 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270110
X-Proofpoint-ORIG-GUID: v4b9D9x3jPjJqK7m9HWY0DW3HeNTQNul
X-Proofpoint-GUID: v4b9D9x3jPjJqK7m9HWY0DW3HeNTQNul

Hi-

I've applied all pending netlink patches to ktls-utils, and
removed the netlink and netlink-v7 branches. This means any
subsequent work will just go onto the main branch as a normal
patch instead of the chaos we've had since ktls-utils 0.7.

I'd like to start preparing for two things:

- Release of ktls-utils 0.8

- Incorporation of ktls-utils in distributions. How can we start
the process for Fedora and OpenSuSE ? I'd like to get any packaging
nits resolved before the release of 0.8.

Will distributions want a tarball release, or can they pull a tag
from a github repo? So far I've been providing both on github.

--
Chuck Lever


