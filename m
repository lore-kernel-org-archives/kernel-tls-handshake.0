Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C6AD2D
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 21:44:41 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HLSvUh006482;
	Mon, 17 Apr 2023 21:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=as3Z5urcqqnDwzywiULTraOPi4ZcbbsqBfpcw1E+j+M=;
 b=nK+J0RtHK/Jg8VH5QU+s/QsnnL0Y6rUvXBjWvXk00irYFCRPRSlAQxuJNhDLHkKe+4YB
 McpSgDADLh+o0ujdYHTKyoPjKZiNTKHpS012/dEr+DdmlMhD0SAUpSMSumaYHU4+D7gl
 WYYSLnFqB+O0dl8hV3uVmtyh93pqTnBo7Hf+QUEObg1EpyQBkNSxAFcovhQaDEhcUyl6
 WdbN2PzVx+ohyUD4nABFw63CHX9KXUMw+Be1E3kiXPsLiU1/nSPFjm8VOCp27B/YYagN
 bUeMs7wM/6GtXwg93zWE813P5xHbvcawV9ETY+36mQbmRihvnKB+22otF5sQ2GxgxYht 4g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykhtv8da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 21:44:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33HLcEm4029889;
	Mon, 17 Apr 2023 21:44:34 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pyjc47nkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 21:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCRdsWMXxUyghfirIPkc63SSyfWqCYm6v0YjMKYLNkp/N4dXaoEm7ZqbiNPQKjOimYtOQ2P7vBjs/XsZ1/d4xpKP+fD1sG3ylutIA3kIZNY2E2bcSitQT8c6YvN6EIy+cm57ZNlc4IHKLBY1pdi5bbVRtRt4Nv9ux2A6VeBGMYy+hqM5Qdh92caVA5s4rf41PB9INz1B1tJ1mPrn+RN30b6oO8954Pd/lSVMJGVn5XJ8rAvlIv9t95N0WbVoJzS/UJnTU42PY7yYgE1tBp3qcOWei2ifXn8VKXR9vhVk8oQ5DHZAnH/AbY+ISjxsKb+L7ZtGWd8Q3YuA2JoLOlcpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as3Z5urcqqnDwzywiULTraOPi4ZcbbsqBfpcw1E+j+M=;
 b=hay3egCXJjaxudR/529Sg+cKLBf1BgR1asgVFdOPvPS6uO3yPt3yij7tkL6X8CdJc2FkiML35C1J35rrBdABHzotVtnNlhfxw87NEYG//7CHemUi+BbtlF8H9S4SOuSBtU++ttC3bNPyvzJyPz9d+JymZ0vQKBpkGjaue/KGnFbV+JprtKdl3HCSDiQ5V6xJRjvYQY/0abs9/HrfZ3yAX8/eKZRTDwlvfDHhKXc9TlQj60htHQS8OkXlciPMInDbIrADfeYFtXB98WKZLMkdbYyTyRrIPWyc24TAKYSnYFIglxd5ml6BPDhORKJpOT8R1I3wi43dQ/7iVxFJw2mHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as3Z5urcqqnDwzywiULTraOPi4ZcbbsqBfpcw1E+j+M=;
 b=q/kZ+SACYLpEl5IYXSu0RQC/aIpFH1KVsDsaz3coY9ZkvNG0lklMi7ZscfhX6S6e3zpqgkKKPVHI6wbGlReCQRuGJPIExZ4T1d1/IdpKe5KCe2FB01OlMxiOmrOw0ET53Bdshyey0YbpbMlWeZ2CJLofPpj51gG5bT5LLIBHEi0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4146.namprd10.prod.outlook.com (2603:10b6:a03:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 21:44:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%7]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 21:44:31 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <aglo@umich.edu>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: advice on kernel configs for NFS with TLS
Thread-Topic: advice on kernel configs for NFS with TLS
Thread-Index: 
 AQHZbw3ReqyVHyuJYk2stoCneux3Sq8rRQMAgAAJeICAAACigIABfwcAgAMl6ICAABlhgA==
Date: Mon, 17 Apr 2023 21:44:31 +0000
Message-ID: <69C7EFCD-7E5B-483F-B278-6B460D966FE5@oracle.com>
References: 
 <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
 <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
 <BC5EA691-3858-4E83-B0B2-E0FAB44C3FCC@oracle.com>
 <99E0BBA5-B7AA-4FAB-86D8-D125689211B9@oracle.com>
 <CAN-5tyGd27YrqNX1G9Kjg2Y0TLP=9m_K+gAf+wVw_Hsr4PeC-g@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyGd27YrqNX1G9Kjg2Y0TLP=9m_K+gAf+wVw_Hsr4PeC-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BY5PR10MB4146:EE_
x-ms-office365-filtering-correlation-id: 56c0d5f3-51a4-413d-362f-08db3f8cedac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nTnYWXtfV7ZGAmzBG26503kztzyY2VN19k3tP5IF5nFCZIrOli0C7tCsixFn6Gjh3q21WsqGGBWJS+NeaUO4ZE7MBY+prOtq2NUiFMD8/LOn7m3tXP8hBiVC9LLkb/bEW0m8vCwXhKEvPExVdef45WcHYeYBYVlYIzLeW1GBWpYMPpG0ZcqPsJfKWCOzYK/ZdGJmEVv/jfV3aI8+8lRwmL+hSdogigorxjs56IRv0lwCiPywjyde5EYiYZ0iBZ72tH0xrbIeLxOIJuGL8gX7QNtdcvpC9ynrWF4M5NFOVM++gyfO2OLoeSlQ23duxw+PIeOPHgQo0oL32tJ93pBuXuc592/I7kbRfR5IqsZa4Umw/rj8aqDxI0RE4fjsy6SUmanj3iE9JbzeIvgjJNB+yxqZTaKK5fAcXYAnqayf7C932HJ6RspIeucRVrBpCTUnToYUb13pXfiCCzfXvltAZ5qQBXNfBFj/kPAGBduT8fP+Pep3IPQAlixZS5xll2wZW+HhFRo08pRhTFRJOTrLFbiniF5EblBRPI0HydBG/zG49fLkmDlphpse0xjWbt1YSID6igf2zSHv4XqyyrLMu82G+KBIoa7J4m3nq0kV5gtlUzekIIdXUVAkCvAdUUBUTLcw20JZ6u1roKJyWBnJpQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(36756003)(38070700005)(2906002)(5660300002)(8936002)(8676002)(41300700001)(122000001)(86362001)(33656002)(38100700002)(478600001)(2616005)(26005)(6506007)(53546011)(6512007)(186003)(71200400001)(6486002)(6916009)(4326008)(91956017)(64756008)(66476007)(66556008)(66946007)(76116006)(66446008)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VGtKT01NS01OYXdPWnplR29NdkhaT2pUc28vL2l3OGo0NEN5UmZiL3FXK1lW?=
 =?utf-8?B?T2FDaWlOeXV6aFVMU2RrSHZwOGsvV3VweXptSncwanNNaGIxa09wY2U3QnpT?=
 =?utf-8?B?eXRTaVJXbUZuam8vTXRpQzErcmtySnVBRnVCTHJIdzNsTndDY2lTdklrbmhK?=
 =?utf-8?B?RWprcDYvQ3ZOWHFGZFR2cDdFbHg4NUR3UWtpN3lDSjBZdlRFbm5uQVgwTGdS?=
 =?utf-8?B?NnNoaTc4TElBYzluYVlvQnNmU01KVG9vdFdmYS9zeThxclRaT0hrTkRGdVFq?=
 =?utf-8?B?eFJ2V3BhMjYrT3dsZUxpcHFsd0VveGJBSUZqSm5xY012V210WjUzRU1DQ0FM?=
 =?utf-8?B?ZEZ1ZWRwZ0Y2bHQvbjJpWTByOFVZNWIwcUw5Q2RydHlPZlNsa2UzTHpRcVZF?=
 =?utf-8?B?bTdjeEhna1BBcTg5NC85OElvamV0d3lmS2tEZjhDY0g2a2hVWHo0OHB4VTY0?=
 =?utf-8?B?d3k0RmVjMkZMUDNibGMvaFQvTEpIQmtQOHZyWi9ZQUZCQXlTblNJRVNMY3NP?=
 =?utf-8?B?bDQ2MXZmVGN6VytYQ05TdjdGVHJaelE4T25OeEpLdjBmcUtwNTB2THpxUWoy?=
 =?utf-8?B?SzBRS2ZWbnY2OUJUTTEzN2lNcE5OZ2lzREdOT3dJVnJDZFlFbmtBeDVOZmk3?=
 =?utf-8?B?R1dlNTMwU0hxdUVIa0taTnF3elRSZm1Xd2xsblZRZEppWkM5VVhBbXJ1U0c4?=
 =?utf-8?B?RlpSaEQ0MGpwUjlZbUJvY0dKR2VaLzJPOVdYWEwxOXdyOGlnd1VOQlNCS3Bu?=
 =?utf-8?B?TmtycVRvL0RjYTdNdE9nWStNL2NBSG9Ub1d0dzlJSkwxUXFSaFhGQlN6aDUv?=
 =?utf-8?B?aDZEejRZMlJWRERpNFhVUkhlUXpBbWNjYzkyb1BMTzMrVzU2Y3lhcGNTU0dW?=
 =?utf-8?B?UXBiZ1BxMG8xVjVIbVZYc0c5S2NiRDJ6QVc5OUEyU0UrNmJKVTJIWUQ4NmZm?=
 =?utf-8?B?QlR6dldOVjhyRHByaU1mRXpKb0gyKzlqeHFtdGVrUE1aeDlGWTd1UjArQkYz?=
 =?utf-8?B?VXpPYnpIdGp6SzUweVpVSTVzS3FQS1VDY2cxb1VUdDJSUUZCZ3A3T0JLUHFr?=
 =?utf-8?B?TWMvR2dNdEdiUGNzMm05Y0thQkFyUlVLRjZISkZGMjZsc09mQmVJYWY0VzBL?=
 =?utf-8?B?dEJiUHlXK25LdVFxM2FvcUtzWlJWakZPUGI2WXhqNmNoR2p0TmgvVUdCczFj?=
 =?utf-8?B?VDIyck5UYUdYbU9NaUxJdGEyWjl0c2RuUVBDTWUwZ0dxcVBDZENLUnoyL2RB?=
 =?utf-8?B?K21vQ0M1TDJNZ3BDMmRLdkI1c0tkVEhNa3picXYyY0pCdlBEVW1zMW5ITmdI?=
 =?utf-8?B?OWROemVUOGFrQklDTlkxNGorNUNvMkFzSW9ZY0I1NE5lVjdHT3dPck5FUGE0?=
 =?utf-8?B?ZzhsV2xYQks0dVQ4aHRDZHJEWVhMSjVNOG5NeU1BbVhwaFFlWlBxNUJMZEVC?=
 =?utf-8?B?NEVXTEFlcXJFQ3k1WHNhMWYrVFVzV0Y3Zk1Xazl0K2xrZkhhSWRiSFFtWWJ1?=
 =?utf-8?B?WVdROWFod1BOWEI0a0V2NERaODNYT25yd201aWpMZHZSVzF3RytweDVMM01p?=
 =?utf-8?B?UVVXVnJuUXZXTnp5QTZ4RWVuKzBkYXJFME5Rb2VqRTJTVU5HUWhFOEpEV0d4?=
 =?utf-8?B?Szg3ZURyR3BhR2RHVWszT25UZDZOakcrTlFDOUNadVdZQU9nRjU3RW4zVUY5?=
 =?utf-8?B?WjNEeEtXcnRJekIyMCthSlVLNEZ3TTJIMHhUY3lqbUFKbFRSdEttVklmM1Zo?=
 =?utf-8?B?VzZGVUhlRUhBS05mTEJIUFpJd2R6c0dvZ1owSkxvVThhVmdFaHdCYkFSZXhS?=
 =?utf-8?B?WUdaMHZta1JkS3R0UDV2c2pDcFo4MHkzMGNGa2lJSDR5U1pMR3EzRjRtV3E3?=
 =?utf-8?B?c0hmVEJ0K2pFandzS3YwaEJaSEZtcjNpaUR0V0V1UlNYckdORW9EU0dtMncz?=
 =?utf-8?B?YjZNQXd0anp5bWlQQUoxdnoxcU00WVV3aUwwaG0rNHRtUUZ6Q2FSVmZJRnA4?=
 =?utf-8?B?SXJWaThqazc5Y3BMKzh6aEMyMldKTmlIVHErMGs4aHo4N3lYSlFMbmpDQ3lk?=
 =?utf-8?B?a0c2Mm9nQjJnQndHRkJaRmRQZlc0dm5Bb0NwbjR4dXUvTTdmQzRrN1ZYNCt1?=
 =?utf-8?B?ZXppcGNJYStiRXYvdzMzVEZtSDhOL01VM08ydUN2VmMxbUpJV2l2TXpGaUhz?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F44318B343492C4BBC5E2D4A0F390D1F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OrD/67ppN080cBoa0RXgw2GpPdZYuuCa1+epc1NRNbNvKNSzlWJkghqn2GmX7O1rv8jvKIEFoE4iN7oyTEwzqDEPD6mVrHS0JTn5gIhCOd0xjzkUdub+usJGdMSWKilB15nANSGw7jYuoFUaBO3UYsB9iCyCrzIPNUBZrEYQOSmRAolVoCYSXjEPSAJySVpD0sW1VBMwMDHxKIwK1ysJDqymoe4f+5rzE1SrC21UvffRTKtwfnDV3G9p14DMefI5guzXBriMw33oQocShaQGVD5yFOymioCt775V2vPahzIDYGo7CI4lzTuVlnj5OnvC7Uq4LqLPepdPIkK/Oe6l8vKfHKnbMf+kPapjKzBZBu+rUbRHZvm3ETVlVsC2icIySnNGyb3wyGsf9gkSg70UazXv6XSiJDdfJFzTZ4r5x9TIvLJnXoeSYHFCkwaoz9TtGKefzWF6yrTq7ACQC8b01IxCDLKLQTZBQWvhw7TyEil6QmugOGsjhiJG6nZkElyiqBCn8W8ZCeuT8imoIswofptkb36dY6ZpqouJ6feJGLYOZWBBlVuBicI+6tUGxvneWhO4k7toWCFpBx1y/CrlFS0GJFORolpvepnY1WIEpOAvqsH5SOKoRuPsKxswZFneJGqNwr42aCcV2DcixtwtqppOb9szV9+AxmlRvWHzXs7uvKcxtOyPhNjPADO6xMeCgreFWdq+q/aKthecgongubp9i05jNyiXu1kGgS5Q1jAel1XaNkeeSzcz9aKVGwgr1ZDDarZzIkAuv7oHQVe24iU1cjOVPa/O51+KCcVsLfY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c0d5f3-51a4-413d-362f-08db3f8cedac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 21:44:31.8382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTE9ZBRKsEQLQhGYawunWvp16eYvp465RVR7+SZQGCNW3iCXkUF4oiiKLD/BjCqGYdrS31GsTJg6CmE11WyjEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4146
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_14,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170192
X-Proofpoint-GUID: bcOoYZFf5DuXpeVUVBf0QYuTGt0_dDLk
X-Proofpoint-ORIG-GUID: bcOoYZFf5DuXpeVUVBf0QYuTGt0_dDLk

DQoNCj4gT24gQXByIDE3LCAyMDIzLCBhdCA0OjEzIFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWds
b0B1bWljaC5lZHU+IHdyb3RlOg0KPiANCj4gT24gU2F0LCBBcHIgMTUsIDIwMjMgYXQgNDowOeKA
r1BNIENodWNrIExldmVyIElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IA0KPj4+IE9uIEFwciAxNCwgMjAyMywgYXQgNToxOCBQTSwgQ2h1Y2sgTGV2ZXIgSUlJIDxj
aHVjay5sZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4+PiANCj4+Pj4gT24gQXByIDE0LCAyMDIz
LCBhdCA1OjE1IFBNLCBPbGdhIEtvcm5pZXZza2FpYSA8YWdsb0B1bWljaC5lZHU+IHdyb3RlOg0K
Pj4+PiANCj4+Pj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNDo0MuKAr1BNIENodWNrIExldmVy
IElJSSA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+PiBPbiBB
cHIgMTQsIDIwMjMsIGF0IDQ6MTQgUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVk
dT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkgZm9sa3MsDQo+Pj4+Pj4gDQo+Pj4+Pj4gRG8g
d2UgaGF2ZSBndWlkZWxpbmVzIGZvciBob3cgb25lIHdlcmUgdG8gYnVpbGQgYSBrZXJuZWwgdGhh
dCB3b3VsZA0KPj4+Pj4+IHN1cHBvcnQgTkZTIHdpdGggVExTPyBBcyBpbiB3aGF0IGtlcm5lbCBv
cHRpb25zIGFyZSByZXF1aXJlZCB0byBiZQ0KPj4+Pj4+IHR1cm5lZCBvbiAoYW5kIHdoYXQgb2Zm
KT8gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBpZiBvbmUgd2VyZQ0KPj4+Pj4+IHRv
IHN0YXJ0IHdpdGggYSBiYXNlIFJIRUw5IGtlcm5lbCBjb25maWcgdGhhdCB3b3VsZCBiZSBzdWZm
aWNpZW50LiBCdXQNCj4+Pj4+PiBJIGJlbGlldmUgSSdtIHdyb25nLg0KPj4+Pj4+IA0KPj4+Pj4+
IEZvciBzb21lIHJlYXNvbiB3aGVuIENPTkZJR19LVU5JVCBpcyBlbmFibGVkIGl0IGxlYWRzIHRv
IGEga2VybmVsDQo+Pj4+Pj4gd2hlcmUgdGhlIHVwY2FsbCBkb2Vzbid0IGhhcHBlbi4gVGhlIGtl
cm5lbCBsb2dzIHRoYXQgaXQgZGlkDQo+Pj4+Pj4gaGFuZHNoYWtlX3N1Ym1pdCgpIGJ1dCB0aGUg
dGxzaGQgbmV2ZXIgZ2V0cyBhbnl0aGluZy4gSSBkb24ndCBrbm93IHdoeQ0KPj4+Pj4+IHRoaXMg
a2VybmVsIG9wdGlvbnMgbGVhZHMgdG8gdGhpcyBiZWhhdmlvciBhcyBJJ20gYXQgYSBsb3NzIGhv
dyB0bw0KPj4+Pj4+IGRlYnVnIG5ldGxpbmsgdXBjYWxsLg0KPj4+Pj4gDQo+Pj4+PiBoYW5kc2hh
a2VfZ2VubF9ub3RpZnkoKSBpcyBhIG5vLW9wIHdoZW4gQ09ORklHX0tVTklUIGlzIGVuYWJsZWQu
DQo+Pj4+PiANCj4+Pj4+IE5vdCBzdWdnZXN0aW5nIHRoYXQncyB0aGUgYmVzdCBsb25nLXRlcm0g
YXJyYW5nZW1lbnQsIGJ1dA0KPj4+Pj4gbm90aWZpY2F0aW9uIGlzIGRpc2FibGVkIHdoZW4gS1VO
SVQgaXMgcnVubmluZyBzbyB0aGF0DQo+Pj4+PiB0aGUgS3VuaXQgdGVzdHMgZG9uJ3QgZGVwZW5k
IG9uIGhhdmluZyBhIHRsc2hkIHJ1bm5pbmcuDQo+Pj4+IA0KPj4+PiBUaGFuayB5b3UgZm9yIHRo
ZSBleHBsYW5hdGlvbi4gSXMgaXQgZmFpciB0byBzYXkgdGhhdCB0byBoYXZlIE5GUyB3aXRoDQo+
Pj4+IFRMUyBDT05GSUdfS1VOSVQgbXVzdCBiZSBvZmY/IEluIHRoYXQgY2FzZSwgSmVmZiwgd2hh
dCB3aWxsIFJIRUwgZG8gYXMNCj4+Pj4gaXQgZGVmaW5lcyBpdCBieSBkZWZhdWx0PyBPciBkb2Vz
IGl0IG1lYW4gdGhhdCBoYW5kc2hha2VfZ2VubF9ub3RpZnkoKQ0KPj4+PiBuZWVkcyB0byBiZSBy
ZWltcGxlbWVudGVkIHRvIG1ha2Ugc3VyZSBpdCdzIG5ldmVyIGEgbm8tb3A/DQo+Pj4gDQo+Pj4g
SSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IGRpc3RyaWJ1dGlvbnMgYnVpbGQgd2l0aCBDT05GSUdfS1VO
SVQNCj4+PiBlbmFibGVkLiBJJ2xsIGhhdmUgdG8gZmlndXJlIG91dCBhbm90aGVyIHdheSB0byBk
aXNhYmxlDQo+Pj4gdGxzaGQgbm90aWZpY2F0aW9uIHdoZW4gcnVubmluZyBLdW5pdCB0ZXN0cy4N
Cj4+IA0KPj4gVXNpbmcgYSBkaXNjb25uZWN0ZWQgdGFnIGRpZG4ndCBzZWVtIGxpa2UgYSBwb3B1
bGFyIGlkZWEsIHNvDQo+PiBJJ3ZlIHB1c2hlZCBhIGZpeCB0byB0b3BpYy1ycGMtd2l0aC10bHMt
dXBjYWxsLiBZb3Ugc2hvdWxkDQo+PiBub3cgYmUgYWJsZSB0byBidWlsZCBhIHdvcmtpbmcgUlBD
LXdpdGgtVExTIHN5c3RlbSB3aXRoDQo+PiBDT05GSUdfS1VOSVQgc2V0Lg0KPj4gDQo+PiBUaGlz
IHB1c2ggYWxzbyByZWJhc2VzIHRoZSBicmFuY2ggb24gdGhlIGxhdGVzdCBuZXQtbmV4dCB0cmVl
LA0KPj4gYW5kIGF0dGVtcHRzIHRvIGFkZHJlc3MgdGhlIHdhcm5pbmcgYWJvdXQgLmt1bml0Y29u
ZmlnIGZpbGVzDQo+PiBiZWluZyBpZ25vcmVkLg0KPiANCj4gSSd2ZSBqdXN0IGdvdHRlbiBhIHYx
MCB2ZXJzaW9uIEkgYmVsaWV2ZSBhbmQgYnVpbHQgaXQgKHdpdGggS1VOSVQgb24pDQo+IGFuZCBJ
IGRpZG4ndCBnZXQgdGhlIHVwY2FsbC4NCj4gDQo+IEknbSBhdCBjb21taXQgM2NmNDkyNGUzZDZl
NjllZTQyZTkxNzAwN2FjOTIyN2IxNTc2YmMzOSAoSEVBRCAtPg0KPiBjaHVjay1ycGMtd2l0aC10
bHMtMDQxNw0KPiAyMDIzLCBjaHVjay90b3BpYy1ycGMtd2l0aC10bHMtdXBjYWxsKQ0KPiANCj4g
QSBnaXQgbG9nIHNob3dzIHRoZSAuZ2l0aWdub3JlIHBhdGNoIHNvIEkgYmVsaWV2ZSBJIGRvIGhh
dmUgdGhlIHYxMCBwYXRjaGVzLg0KDQotIENvbmZpcm0gdGhhdCBub3RpZmljYXRpb24gaXMgd29y
a2luZyBpZiBDT05GSUdfS1VOSVQgaXMgZGlzYWJsZWQNCg0KLSBJbnN0cnVtZW50IGhhbmRzaGFr
ZV9nZW5sX25vdGlmeSgpIHRvIHNlZSB3aGVyZSBpdCBpcyBmYWlsaW5nDQoNCg0KDQotLQ0KQ2h1
Y2sgTGV2ZXINCg0KDQo=
