Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682519914
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  2 Jun 2023 14:11:02 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352CsYWe030711
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 2 Jun 2023 14:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=7DrujSiWETcRNrh9QC6AmWWiAhMc2EU0C0It3lBw5CQ=;
 b=T7CD66D7E4Qd++OTsfEfiZ3RdyLEbTnNnU3RepZaMXDuenRdVcRUZWMAeLXqUSIu/iLw
 uxACTKYNC+v5WrbmlF0KoLAiebUXwRJ89P1STCnOYE0ZriMVOIyryOPWSq16jaGC4EZr
 t8Bcu4eXg+HiXPIqLE5PLXuy8YiCTFDeeszfevYWdcMVVQ+e3j/wH0wvIjxQ0F+Ts6PK
 7u98c+Zpnap2tTjbAKxHY2Z+efYgnE+hVXPwV8v3p+JAEamEiGYJW21Do19gltiQ/lwE
 loGzXkngiBzDO8es+sX8q6OaF+00fcG2unetHvUJVN1WdQL7Zq1ujZzpsQhtZZby12Tv EA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qvhmeu1eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 02 Jun 2023 14:10:56 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 352E8rVt031830
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 2 Jun 2023 14:10:55 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3qu8qd6csq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 02 Jun 2023 14:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYD/A/Q3TIlBytKSTQeS5PRGUKM/JSb05qkNcf71b0HANMxAG7Cm0LAbkdVNLR5g9ZFq1mqC6ig/TvtrvHTWoGIEOZLyHyhO1YikV92AxwtGXHo5F8JPc2rx+L+HtVoKIkCAoh2y0rXw7wre2Tmxq6RGtusP94WzMkNUwJB7nQsjNUKxV4diroxr2BKsoAY2E5dnCWeiGkXpQSIfNcTLp4tsdIUjShW1IIa8vMYTI2msPA5iyKsHx4dgHZI05bsP24TG+sGI67NOQoF85VVYhzy2HxgBpY38LxmtA3CiipW1FFYmCFrhetBpnWfJorq5ZiuesCfsJseD/zz6kNe64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DrujSiWETcRNrh9QC6AmWWiAhMc2EU0C0It3lBw5CQ=;
 b=TCBdUOytivNC+MU4wqg+/bn34ncC/mP/WDgyDx/88uQiyYqgcWhXzJN1QNbG5+cuQ/B8F1GcSXewUMXmV4N4QtFAHM+UbSVsSgg0uVbch/mRvb5gX0SvwxHrDZHRPzoYlEApWnKpFg/Hr0+QIzcx9pGIuLIhYF1a/YF1VxJIqerkB34JMdOnkfVrDNCvzHAmbjJ2KlBGHxTvHSpJ1xIdkIf9pq+clGonqw0MfB9XAvN0roqz7A93qxOaCI5RCrHayzxJ2339W4QUy8GuwzXDg7cEn49kKoGXXg+Ax5/WuDTCemS+Fn1RTKDngj7OL1Yeij1GmZwCowEBws5VibLZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DrujSiWETcRNrh9QC6AmWWiAhMc2EU0C0It3lBw5CQ=;
 b=VhUbBiUjDO2D0M6fRr+IaywbkmTMh9CZgwyug/nGO3zl2g7DFjkBRiUjn5WJ24FLLKSRTzecK0Z/du0Izhc6PuAK9P2+Cni0IZYFkO+I0pdZTJKemkeh3tdyummfZXOhc3TUcsDdUvXm2HjE09dbUSmfYYXt0Dt6C1dNj7zak5w=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA0PR10MB6427.namprd10.prod.outlook.com (2603:10b6:806:2c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Fri, 2 Jun
 2023 14:10:53 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 14:10:53 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
Thread-Topic: what should happen for proto=rdma,xprtsec=tls
Thread-Index: 
 AQHZkzrk6rAEvRS9WEuMQJIn/kwPgK9zT9YAgAAFcQCAARVtgIAAChGAgABHx4CAAZuSgIABOXWA
Date: Fri, 2 Jun 2023 14:10:53 +0000
Message-ID: <193AAC9B-6455-4239-8A82-D71E4D02B883@oracle.com>
References: 
 <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
 <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
 <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
 <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
 <F44356CE-9A7E-4D6D-ADC8-AF9407CBAD1F@oracle.com>
 <6BD3F10C-8859-42D3-9035-A23D8F3EB712@oracle.com>
In-Reply-To: <6BD3F10C-8859-42D3-9035-A23D8F3EB712@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SA0PR10MB6427:EE_
x-ms-office365-filtering-correlation-id: 6075d67e-fa93-4c54-cc56-08db63732d7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eFUY0XS5lRRvx6FiCS5PX+lxZbGFhPOR/qQ3XYvslowo2unxqjaQS/sKckfJvn/hqpWQGSAxspGTmeFKez02RNlSWvQdhg5f8sNjPrYRsz+AQTZspn1m868zAb8FyqpI8AkdBl5y4ie6W7e1lEaTxMVOFstw1uQnHwkY1Ao57dDpjpN/+rvUiz8sDufQY+BIjHQqikJ0vAo5RKKCWwaa+nXXH6SrfnEveJb3+GAVWMA3YOxCnYvpIOB+E3KoMdsqIJjtEk3TWXELJOIYlgT8VjrZA5cjNojpxJMX573pZ0fnVhVT4chGSZK7s3c1HEU+c0rViGwe/RzPOsyd2CbC/WrGqGUPQp1bQOxsWRXBL8dQ6124FYw4b3qOCJTpb1oYtPNeGuSBNN8LHZ1FHhL9lV6ShsmYXU0KuZGCyo26kW+k8jW9P8bHTZ2v4zAnq1JGcngy/Xp/nF8Gu0u5AYKyRzYFRCZe8OoozV52a7JZ33WeINgtPWevhKWjSVQcvycSKeTDMDhJJOeJ9nQOZDjVmvLveN5z2HlCCZV9IqlqJzQ/Ok//4sA/uKJRYbmY+7r0RVi/P3nQOPER7SXegi3/ngtczLdQ4jOzfbmakVuhhcBEsDdBY5uYN4G459HOR3pq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(966005)(186003)(2616005)(41300700001)(38100700002)(83380400001)(6486002)(26005)(53546011)(6506007)(6512007)(478600001)(122000001)(71200400001)(66476007)(6916009)(91956017)(66946007)(66446008)(64756008)(76116006)(66556008)(316002)(2906002)(8936002)(8676002)(5660300002)(38070700005)(36756003)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MDRxVXdRL1VWUHdkdGUrZEplQW1ldWg3enBlWkJMdnZ6TGtuLzN0ejZsNVUz?=
 =?utf-8?B?NlZlaDZ0bTB0dHlQOVlVUFhGUUdSNlRWdmdjTE9MOFIycUU0MW1KQVpsUFFG?=
 =?utf-8?B?NjRHa2JLakIwMmlwV2lWMEV6RWYxcy9RaUUyQU9BZURTNVBVZ1lHcFRNc3NC?=
 =?utf-8?B?L044TkR5MnhBdzI0Q25CK1Q3VlhKREg0VFJFY1RNV1JHMXArRHVmR2UzUVd6?=
 =?utf-8?B?UkxhdjNkTWxMaVRUSFR0Y3FuZkJub3NCZXNvNE1aR2xsUTVkRU1YU3A4WXdI?=
 =?utf-8?B?K0FzeDVYMWtpZW5DeThyNCs0YjhCWExqYjFFTWlxTS9BaithZzFEcWZudXZY?=
 =?utf-8?B?bjBxV0JrRVpDZjdMM0RpclZnRkJURjlUUU5laDliREl1a00yQ3BPMlhKUWFr?=
 =?utf-8?B?OEdKbm9DWVg2RXVVand2MHN0UnR6SndwUmIzdHM0VGlqbVdHeEhRTXJQWUxP?=
 =?utf-8?B?Ty9JdlN5TUljRWVlZjhHam00TENKUnd0d0JycU9jUFZaajNERytwWHlLcHhW?=
 =?utf-8?B?K2M4U3p1cmxhdzNXT0VqZU9CR0hBMXVXWk83c1VoYk1iazdzMzNqaUFJbXlF?=
 =?utf-8?B?QStFckQxVThjUnZialdyQ1VxNVMvMFltWTMxZkdHMi85UlY3UXBPalVLUmMv?=
 =?utf-8?B?aGcveDZEWVY3K2l3dDlKVVNNUGx5cHhiTkU5RHBnL3Mxb0lwSUYrUTN1SHhJ?=
 =?utf-8?B?SVg1YmkyWXg0ZHhjN2FuTzlSY0d0cnA5QlVWamN4MTVSZDdtU1JiWFpab3g3?=
 =?utf-8?B?bUhDOUIxam44SUdVZDllZHkxdmVtT3I3UTlCckVZeHdDWHVsbDM1N0dleEpD?=
 =?utf-8?B?cm05SnVMaDV0Syt4dTBUV2xLbDVPQysvemVycEtWTmJSTjdzRkNRd3kzS0Zx?=
 =?utf-8?B?N1lYaEFqWW5SQmtuaENWOS9nbEZuUWZqZ29MNGRyL1lpdC9VemtOSHJEODRS?=
 =?utf-8?B?YnRVSE85MGVZeTlLZTZ4eVZueU1yTFpyQjdXWnpqTnllSVhmMWtFK2hzbHgx?=
 =?utf-8?B?bGNuMmQyY2Q2QlRKZXlBWHgzM01ydk1qY0JhaWFFd1JCeVVDOGVFRjVLUEVJ?=
 =?utf-8?B?RStkUVY2MVFRVWZLaVB5dXpFVzZ0eXBTN2JKQnRkNzdBQjJ1Kzk2NWhqbUFq?=
 =?utf-8?B?VnRoTDZQM29Kd2ZaVlpOMnIwbVVESG1YWWNVdW1Na2JnS2pQWkI0R2lKSDdJ?=
 =?utf-8?B?M0lvcWJUWGtVQzRnY2s5VnpQc1l4RHkwNUxyWkF3czVPNHA0S0tGcHFSSUtn?=
 =?utf-8?B?VFRLYmFWd1ZBa01WMDZxSHY2ZmJJcHpuQTdyaTl2c1lwcmZDcTFZVTdJeFBS?=
 =?utf-8?B?MlBVeVF0eVo5U1R0cVg1MVJMR3pJN3RFSzZkZnJvR25wOTRtZm9RWXUwQ3lH?=
 =?utf-8?B?aFppUm05Vmx6RTlFSHJRd1NYNGVDUVczTzJpOVpCRllnVmNuVzdnUytmQVFR?=
 =?utf-8?B?RTYrRFFQRWMvSUtkQTRYS0VCVTlMRDJFczdOWFV3RVRFSmRoMjJ6NnpsVjhh?=
 =?utf-8?B?SmVEbzlxNWdzdlpTTUh4VEtiN3VlOWxqeHRNRUtMSkxQS0dKeHcvaFpDQjl2?=
 =?utf-8?B?WG9ZclJNUWFUcWc4elVWb3BjSWtWaHlHeEJjdWtSQkVWQngvbi9nRjhTd3JF?=
 =?utf-8?B?RXFEL0Q1dVRDcy8zelNsNjhiaFUrMzhZV1N4T3h4ZFBnbk1PV2lkQUVjaGhO?=
 =?utf-8?B?Sm5OTTFhKzlWenc4aGVxSjV0YW4rOElqUlFxSzJGU2Y4MSt0QVJOU2FrbnNW?=
 =?utf-8?B?VFdYb08rMWNWZGViQXY5Y1pJUDNhcHZ3b1BpTG83WVNjQXU0dDFCcGtnTnRT?=
 =?utf-8?B?NERNUHpzWTQ1eTAxNXNMNUpMb1F0MGl3RWhwZzFRcDBKRnV1aE9HY1owcGhN?=
 =?utf-8?B?Z3NZN0lZcGgrY0JPUk9jVStGZUNVVGZVSFlCNDZoQ1p4bVpDTnFIQWJOZmNP?=
 =?utf-8?B?aTNVUmFjeXlXWG1mWEhDTzRjcVpKN251STFKZ3V2c2h3M1J2M3R2UllPemdt?=
 =?utf-8?B?ZUhhdk0yeWx0dW1tTUlHRng0c3ZLOXJlT1FyeDJocFM3T1gra3Zud1N4ZFR3?=
 =?utf-8?B?QVRTVi9HTnRzbGhZY2t0b3ZYemoyVTBUT3NlQld1VmQ5ZFhadW91eG9hblV0?=
 =?utf-8?B?YjNvMkxzVHVOTk5WUHNDeGNWdGo0SVFoR2laV0NYY1VwSGQwVy83OU5IMzhx?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <956D78414B9EB945B11254E20D5B4D83@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oHk4QDEmyaVtXChvWCSIVNZ7BLnVWRF++BeRyo7yWjFsUBpys/bEy0Htab/VVjiZNsocjxaVPkBFpw9RV0k8ZMbkChjA1zIWUMXO/OJbYtzrg5FwiJ4E1+pKjmJLFbP5wUb9dULaYxvPCQLnO2umKd3OOhk3CdZ7w84uUZ+rmIEUOj1XPBN6owVRVX2n1bhbruo1xBUiiTcdac/y5LhuVh+hAGs/WeYYS8G/mBumMYpYyFKUtHmCusJKiPCRFAcj8eFzSdoRPlYzH0ASWaxf2mUVoHJzjYWThLfF4NiZIyNs8IiReSKLhK8hk774X1oC8IYhL8Pjzs++8V3HWXUfvmcaXPsBE+R6rgI1GuRGB+9wX5RZybgCNvE+oGhFF1Bzs5yKjjm3RDEeaQt+fLJB0uPn8l6E5O2U5aLi76+mjBbOyoCt3S4BrVsXDpa7tYB2O855f5PMIIW/H2nL9NkE3FhVlq1qOi7Q2QnuIUWcUjMeCR+Arlm/vgIMtUMa/3SsUlg4SdZXlzWjfoGOHFtt2lMEiRT2VAcPQUk5xzwQ9KESaJSu8cKmg0b1RGA5z3NR2DCgZ5q0T1d++Eru44OJ6leM4GGMqCgVgg8ETpPO+rMZ8HKjnaIlhpDCwtvy04SvUSd8w/b/UVIqS2r/lcHOaci0lV9WNyPyWCBfXDbf9xdl6RAlTBiQHvqNQsxcHkAqTWBBP6IAlmDaKoTwj8ftBYaEsAy0iH5fNYd+ZB15B7G3ff6rN71/XBsEvgFH7vAa
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6075d67e-fa93-4c54-cc56-08db63732d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 14:10:53.8510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pk4nV2wqnQbY2KtJ3kqPw4lBJct3TpSNa4TC3N0b2yb242TTA/UxlVyGqkG8NiGqKuE6RQTtjTXoWUj4bmtEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_10,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306020107
X-Proofpoint-ORIG-GUID: 3cyW8E5aoaif8C75jDGZf1sLHRaOXj_F
X-Proofpoint-GUID: 3cyW8E5aoaif8C75jDGZf1sLHRaOXj_F

DQo+IE9uIEp1biAxLCAyMDIzLCBhdCAzOjI4IFBNLCBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxl
dmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4+IE9uIE1heSAzMSwgMjAyMywgYXQgMjo1NSBQ
TSwgQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVjay5sZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4+IA0K
Pj4+IE9uIE1heSAzMSwgMjAyMywgYXQgMTA6MzggQU0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xv
QHVtaWNoLmVkdT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTA6
MDPigK9BTSBDaHVjayBMZXZlciBJSUkgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0K
Pj4+PiANCj4+Pj4+IE9uIE1heSAzMCwgMjAyMywgYXQgNToyOSBQTSwgT2xnYSBLb3JuaWV2c2th
aWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gVHVlLCBNYXkgMzAs
IDIwMjMgYXQgNToxMOKAr1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNv
bT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIE1heSAzMCwgMjAyMywgYXQgNTowOCBQTSwg
T2xnYSBLb3JuaWV2c2thaWEgPGFnbG9AdW1pY2guZWR1PiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IEhpIENodWNrLA0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSBkaWQNCj4+Pj4+Pj4gW2FnbG9AdW5r
bm93bjAwMGMyOWRiYTYxNiB+XSQgc3VkbyBtb3VudCAtbw0KPj4+Pj4+PiB2ZXJzPTQuMixzZWM9
c3lzLHhwcnRzZWM9dGxzLHByb3RvPXJkbWEscG9ydD0yMDA0OQ0KPj4+Pj4+PiAxOTIuMTY4LjEu
MTA2Oi9uZnNzaGFyZSAvbW50DQo+Pj4+Pj4+IHdoaWNoIHN1Y2NlZWRlZCBhbmQgdGhlbiBJIGRp
ZCAibW91bnQiIHdoaWNoIGRpc3BsYXlzOg0KPj4+Pj4+PiAxOTIuMTY4LjEuMTA2Oi9uZnNzaGFy
ZSBvbiAvbW50IHR5cGUgbmZzNA0KPj4+Pj4+PiAocncscmVsYXRpbWUsdmVycz00LjIscnNpemU9
MjYyMTQ0LHdzaXplPTI2MjE0NCxuYW1sZW49MjU1LGhhcmQscHJvdG89cmRtYSxwb3J0PTIwMDQ5
LHRpbWVvPTYwMCxyZXRyYW5zPTIsc2VjPXN5cyx4cHJ0c2VjPXRscyxjbGllbnRhZGRyPTE5Mi4x
NjguMS4xMTksbG9jYWxfbG9jaz1ub25lLGFkZHI9MTkyLjE2OC4xLjEwNikNCj4+Pj4+Pj4gTmF0
dXJhbGx5IG5vIFRMUyBoYXBwZW5zIGZvciByZG1hIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhpcyBt
b3VudA0KPj4+Pj4+PiBzaG91bGQgZmFpbD8gb3IgSWYgdGhlICJtb3VudCIgYWZ0ZXJ3YXJkcyBz
aG91bGRuJ3QgZGlzcGxheS9jbGFpbSB0aGF0DQo+Pj4+Pj4+IGl0J3MgZG9pbmcgeHBydHNlYz10
bHM/DQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhhdCBtb3VudCByZXF1ZXN0IHNob3VsZCBoYXZlIGZhaWxl
ZC4NCj4+Pj4+IA0KPj4+Pj4gU28gcGVyaGFwcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4+Pj4g
DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvbmZzL2ZzX2NvbnRleHQuYyBiL2ZzL25mcy9mc19jb250
ZXh0LmMNCj4+Pj4+IGluZGV4IGU0OWUzZDE4ZWY4OC4uNWZjMjI5YTc2OTBiIDEwMDY0NA0KPj4+
Pj4gLS0tIGEvZnMvbmZzL2ZzX2NvbnRleHQuYw0KPj4+Pj4gKysrIGIvZnMvbmZzL2ZzX2NvbnRl
eHQuYw0KPj4+Pj4gQEAgLTMzNCw3ICszMzQsMTAgQEAgc3RhdGljIGludCBuZnNfdmFsaWRhdGVf
dHJhbnNwb3J0X3Byb3RvY29sKHN0cnVjdA0KPj4+Pj4gZnNfY29udGV4dCAqZmMsDQo+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ludmFsaWRfdHJhbnNwb3J0X3VkcDsNCj4+Pj4+
ICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4gICAgIGNhc2UgWFBSVF9UUkFOU1BPUlRfVENQOg0K
Pj4+Pj4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4gICAgIGNhc2UgWFBSVF9UUkFOU1BP
UlRfUkRNQToNCj4+Pj4+ICsgICAgICAgICAgICAgICBpZiAoY3R4LT54cHJ0c2VjLnBvbGljeSAh
PSBSUENfWFBSVFNFQ19OT05FKQ0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXRfaW52YWxpZF90cmFuc3BvcnRfcmRtYTsNCj4+Pj4+ICAgICAgICAgICAgIGJyZWFrOw0KPj4+
Pj4gICAgIGRlZmF1bHQ6DQo+Pj4+PiAgICAgICAgICAgICBjdHgtPm5mc19zZXJ2ZXIucHJvdG9j
b2wgPSBYUFJUX1RSQU5TUE9SVF9UQ1A7DQo+Pj4+PiBAQCAtMzQyLDYgKzM0NSw4IEBAIHN0YXRp
YyBpbnQgbmZzX3ZhbGlkYXRlX3RyYW5zcG9ydF9wcm90b2NvbChzdHJ1Y3QNCj4+Pj4+IGZzX2Nv
bnRleHQgKmZjLA0KPj4+Pj4gICAgIHJldHVybiAwOw0KPj4+Pj4gb3V0X2ludmFsaWRfdHJhbnNw
b3J0X3VkcDoNCj4+Pj4+ICAgICByZXR1cm4gbmZzX2ludmFsZihmYywgIk5GUzogVW5zdXBwb3J0
ZWQgdHJhbnNwb3J0IHByb3RvY29sIHVkcCIpOw0KPj4+Pj4gK291dF9pbnZhbGlkX3RyYW5zcG9y
dF9yZG1hOg0KPj4+Pj4gKyAgICAgICByZXR1cm4gbmZzX2ludmFsZihmYywgIk5GUzogVW5zdXBw
b3J0ZWQgeHBydHNlYyBvcHRpb24gZm9yIHJkbWEiKTsNCj4+Pj4+IH0NCj4+Pj4+IA0KPj4+Pj4g
W2FnbG9AdW5rbm93bjAwMGMyOWRiYTYxNiB+XSRzdWRvIG1vdW50IC1vDQo+Pj4+PiB2ZXJzPTQu
MixzZWM9c3lzLHhwcnRzZWM9dGxzLHByb3RvPXJkbWEscG9ydD0yMDA0OQ0KPj4+Pj4gMTkyLjE2
OC4xLjEwNjovbmZzc2hhcmUgL21udA0KPj4+Pj4gbW91bnQubmZzOiBhbiBpbmNvcnJlY3QgbW91
bnQgb3B0aW9uIHdhcyBzcGVjaWZpZWQNCj4+Pj4+IA0KPj4+Pj4gSSB3YXMgZXhwZWN0aW5nIHRv
IHNlZSAiTkZTOiBVbnN1cHBvcnRlZCB4cHJ0c2VjIG9wdGlvbiBmb3IgcmRtYSIgbm90DQo+Pj4+
PiB0aGUgImFuIGluY29ycmVjdCBtb3VudCBvcHRpb24gd2FzIHNwZWNpZmllZCIuIEJ1dCBpZiBJ
IHRyeSB0byBkbw0KPj4+Pj4gInByb3RvPXVkcCIgSSBkb24ndCBzZWUgdGhlICJ1bnN1cHBvcnRl
ZCB0cmFuc3BvcnQgcHJvdG9jb2wgdWRwIiBzbw0KPj4+Pj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhp
cyBuZnNfaW52YWxmKCkgaXMgc3VwcG9zZWQgdG8gZG8uDQo+Pj4+IA0KPj4+PiBBcmNoaXRlY3R1
cmFsbHksIHRoZSBORlMgY2xpZW50IHNob3VsZCBwYXNzIHRoZXNlIG9wdGlvbg0KPj4+PiBzZXR0
aW5ncyBkb3duIHRvIFJQQyBhbmQgbGV0IHRoZSB0cmFuc3BvcnQgdGVsbCBpdCB0aGF0DQo+Pj4+
IFRMUyBpc24ndCBhdmFpbGFibGUuDQo+Pj4+IA0KPj4+PiBJIHRob3VnaHQgUkRNQSB3YXMgbWlz
c2luZyB0aGUgZnVuY3Rpb25zIHRoYXQgbWFya2VkIGl0DQo+Pj4+IGFzIHN1cHBvcnRpbmcgVExT
LCBhbmQgc28gaXQgc2hvdWxkIGhhdmUgZmFpbGVkIHRoZSBtb3VudC4NCj4+Pj4gSSBtdXN0IGhh
dmUgbWlzc2VkIHNvbWV0aGluZy4NCj4+PiANCj4+PiBBaCwgb2suDQo+Pj4gDQo+Pj4gU28gaW4g
dGhhdCBjYXNlIGhlcmUncyBhbm90aGVyIChmYWlsdXJlKSBvbmUgZm9yIHlvdSAtLS0gbW91bnQg
b3Zlcg0KPj4+IFVEUCB3aXRoIHhwcnRzZWM9dGxzLg0KPj4+IA0KPj4+IFthZ2xvQHVua25vd24w
MDBjMjlkYmE2MTYgfl0kIHN1ZG8gbW91bnQgLW8NCj4+PiB2ZXJzPTMsc2VjPXN5cyxwcm90bz11
ZHAseHBydHNlYz10bHMgMTkyLjE2OC4xLjEyNTovdm9sMSAvbW50DQo+Pj4gDQo+Pj4gMTkyLjE2
OC4xLjEyNTovdm9sMSBvbiAvbW50IHR5cGUgbmZzDQo+Pj4gKHJ3LHJlbGF0aW1lLHZlcnM9Myxy
c2l6ZT0zMjc2OCx3c2l6ZT0zMjc2OCxuYW1sZW49MjU1LGhhcmQscHJvdG89dWRwLHRpbWVvPTEx
LHJldHJhbnM9MyxzZWM9c3lzLHhwcnRzZWM9dGxzLG1vdW50YWRkcj0xOTIuMTY4LjEuMTI1LG1v
dW50dmVycz0zLG1vdW50cG9ydD02MzUsbW91bnRwcm90bz11ZHAsbG9jYWxfbG9jaz1ub25lLGFk
ZHI9MTkyLjE2OC4xLjEyNSkNCj4+IA0KPj4gSWYgd2UgZXZlciBhZGQgRFRMUyBzdXBwb3J0LCB0
aGF0IHNob3VsZCB3b3JrLiBJdCB3b24ndCB0b2RheSwNCj4+IHRob3VnaCwgYW5kIHRoZSBtb3Vu
dCBzaG91bGQgZmFpbC4gSWYgeW91IGFzayBmb3IgeHBydHNlYz10bHMNCj4+IGFuZCB0aGUgdHJh
bnNwb3J0IGNhbm5vdCBwcm92aWRlIGl0LCB0aGUgbW91bnQgbmVlZHMgdG8gZmFpbC4NCj4+IA0K
Pj4gSSdtIGdvaW5nIHRvIGhhdmUgdG8gcmV3cml0ZSBhbGwgb2YgdGhpcyBkdWUgdG8gVHJvbmQn
cyBtb3N0DQo+PiByZWNlbnQgcmV2aWV3IGNvbW1lbnQsIHNvIEknbGwgYmUgc3VyZSB0byB0cnkg
dGhlIG90aGVyDQo+PiB0cmFuc3BvcnRzIGJlZm9yZSBzaGlwcGluZyB0aGUgbmV4dCB2ZXJzaW9u
Lg0KPiANCj4gVG8gc3VwcG9ydCB1c2luZyBhbiB4cHJ0X2NsYXNzIGFzIFRyb25kIHN1Z2dlc3Rl
ZCwgdGhlIE5GUw0KPiBjbGllbnQgd2lsbCBoYXZlIHRvIGNoZWNrIHRoZSBzcGVjaWZpZWQgY29t
YmluYXRpb24gb2YgbmV0aWQNCj4gYW5kIHhwcnRzZWMgcG9saWN5LCBqdXN0IGFzIHlvdSBzdWdn
ZXN0ZWQuIFRlc3Rpbmcgbm93Lg0KDQpJJ3ZlIHB1c2hlZCBhbiB1cGRhdGUgdG8gdGhlIHRvcGlj
LXJwYy13aXRoLXRscy11cGNhbGwgYnJhbmNoIGluOg0KDQpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jZWwvbGludXguZ2l0DQoNClRoZSB1cGRhdGUgYXR0
ZW1wdHMgdG8gYWRkcmVzcyBUcm9uZCdzIHJlcXVlc3QgZm9yIGEgbmV3DQp4cHJ0X2NsYXNzIGZv
ciBSUEMgb24gVENQIHdpdGggVExTLg0KDQpQbGVhc2UgdHJ5IGl0IG91dC4gSSdkIGxpa2UgdG8g
cG9zdCB2NCBvZiB0aGlzIHNlcmllcyBuZXh0IHdlZWsuDQoNCg0KLS0NCkNodWNrIExldmVyDQoN
Cg0K
