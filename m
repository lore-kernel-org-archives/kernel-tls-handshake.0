Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C38F42
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 20:37:57 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GKYgUX001890;
	Thu, 16 Mar 2023 20:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=/R9e2EMR8/hJkNzAsGg1Z/WPQj+lpwXP/B2zj8c0XoA=;
 b=asFxI62FfA3qUdfoCg0uEp0xs8ZVPZuvYenk7LKX9VQ43l2uxqyeTDPNvy2/6fY+Dd/W
 GnX8KBYRVClDiDbVZ1rR/eLda/UKlIvj4Aj/+MXLqQfCCROvSeNr0BDhmyQi7lY8AgRc
 hlKGiP/gTHCdYy6+gGyDnl4OlMtRLIEvwc4oQxmP7TIbhC93jfd1yX9azKwvsIM0wD+0
 1Fj/Gaj8DdqH3+DGYPZXkD2GxcLeodizRZOwTggLllEsb7zdWz/VBZBYGmPXJA9zZkdS
 cRH0Sn8PWfk719Uyi2l8BI7cAUHQQLLL9WMVFaFP1mvD3/0K1T+paKPxZcz7ZC2ACiJq rg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pbs2aj74e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 20:37:56 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32GJhrpo037068;
	Thu, 16 Mar 2023 20:37:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3pbq9j3t21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 20:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzxjTBca9wlZk7KJeXuDlrE7aTr3r/9iBDzliil2vcMRrcuS/85rosGdcthNVjZze1hMeyOCmJ6MT2SjkY+P0LlJLku8H4QE5K04gPInT9aq2qVphdeTPdllECpeb2AXEiOETKzfRzlt1cIVuMkK0p+B6mF/A508ulm3HdsdM7DOpl9updmyFmJO8TR5xaYl0zslZKf9u8uHvX6dsLMLr9yjEhwjucywldo9lPd+fGFrGlp5ECdl4tcYP0hbQxwQKXmyANQBbeobYVlab0BxcksSdqQ624iNf0+XNudVZEITxY2gWlsecBgk83tGxclu+bJhTW0Ivl5rT2WdQ0/daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/R9e2EMR8/hJkNzAsGg1Z/WPQj+lpwXP/B2zj8c0XoA=;
 b=QUgyT+f50KAjYCAE6CNiQt8nb7xKkBUo7FyteHivBQ5KPvfMhSLrSwv1Z+vg7XM9O5TfufXxF7cUqoCdW38+mVcsiQC0YDgf4NjTELcofAvfMMyTAVqxfbIoZE7jiuCmj9RUvkKNuhtdCjWCLmCN5kR/hREeAxOtApzRQX4QsTdNgSyylThp3u9rHSirJUvwt/bt23Vt2OR1N9hhSkD9QoV4FZpwLDZiljz3rCwE2eySq0r5/OFcKaQgdvKII7hiC4zQT/VSkRSXfQ0kLMqhIJtZmpHtoQfx35DU+kD3m/H2zPhbe+cDk0BJIjuh9EF11b1iG8/OhkuZ/37MCTsbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/R9e2EMR8/hJkNzAsGg1Z/WPQj+lpwXP/B2zj8c0XoA=;
 b=cjeBlTYF1xlpr6eOQlvZRVPxdiD02S10Ia29mvxb/bhUeVKPWYDhw7ljiSd4stHMTBl2KF0tspKFQpp0ffb055DTgYUtKpcnyk6XFbXII91IEC2ldHpZclyxgILTYuvJi+gN6WFM38trAmIoWPA+LfvhvkLuqldcHaj1EQNd8cg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4704.namprd10.prod.outlook.com (2603:10b6:a03:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 20:37:53 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 20:37:53 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "Kornievskaia, Olga" <Olga.Kornievskaia@netapp.com>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Some issues
Thread-Topic: Some issues
Thread-Index: AQHZWChzXPD+FlnpTUejUaUWpiNY6K792XoAgAAEkAA=
Date: Thu, 16 Mar 2023 20:37:52 +0000
Message-ID: <DD14E29C-12DD-4B20-AA34-7D18EEA6EC72@oracle.com>
References: 
 <DM6PR06MB40747889A1DA72122394C26E93BC9@DM6PR06MB4074.namprd06.prod.outlook.com>
 <9D2259FD-7FEB-4670-9062-7161C2DBFA3F@oracle.com>
In-Reply-To: <9D2259FD-7FEB-4670-9062-7161C2DBFA3F@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4704:EE_
x-ms-office365-filtering-correlation-id: d38cab63-e71a-45a4-2879-08db265e50f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dCF+zT7wZoa3hPHXOXDXGQLThZc6TY/qP+6v8y3eIRJJ3vZmawdHBZwxKgxbRrUjExFON/GC2nkpbsnn+5gffzV/HlR4sCrBgYBAYti0il1uNH8y+jcxePMopWRyNA1rIEY9F2qPZQJV7HBsg04fKdj1yv3n/di1chZ0gwMA3BCKewzAvmJ78PFTcuf/1drQlWjlPJ4FnKSxgQSmG8ZLf1dPIg2997lLtJhctmJwCdN5MjSroYZdFJNfISznUXxlRLzntdCAzssPRJDeAgj1JwCT9lCJ9PVG6Wt+EQMUUziJMlBC8NMjIeqHJ1SKDO+x6pMCUOpBZOWV+L7bAQPUVv5EizpE7BgJv3HVxdBR5hJeORgQZvCMFrlgL3Rd6GynMzMbLrNMn4I+Dkt1kehwZyT/ZOga0kaLU1q4Ot0CUOrNHMwDA9mlPdK79obCLyURadHv2LEt3JIl7v26aojgGQYv0QiAomTIq91/JZbF5DIWTuvibN1ki9xyLY69uQg+h3KDZg0JcUh8gugFakRKASMnTRLhxgWtXKBXxFNQqDqlTye/jYHrBrAXKcEPgRZK/WZXA42Tg5BT9i5W5N3ExaVtWNpSFg4QMh81oCGFf8v7sAtzKPIU2UgjkTl6Zf3WngaZ+nG6Zs8kDmTRrDk4B706hHCdShS4tXO7Nk7rrKY8bg6y3dnNz/84EYNurrxAkXP/NwOrRKPgCRQ/5Xjeyij8PK5PNUiSLk3iYz0obRw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(41300700001)(5660300002)(8936002)(7116003)(2906002)(86362001)(38070700005)(3480700007)(36756003)(33656002)(38100700002)(122000001)(71200400001)(478600001)(66556008)(91956017)(66446008)(6916009)(8676002)(66476007)(6486002)(76116006)(64756008)(66946007)(26005)(83380400001)(4326008)(316002)(186003)(6512007)(6506007)(2616005)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a05IRFFGYk9MeExUOVNQSWlpSXMrNXNYNWdTWGlJWnhBM2VZM2c1SHBodTA3?=
 =?utf-8?B?dmRaQnVoVzBhRGtoOVB5emtoSUh4UUpXMGhjOXFhYnR2V1NaMFQwaXdRZElr?=
 =?utf-8?B?Tlpwa01FK0V1THFQbFpJQTAzdTlUWkJXTnU1S1lwcC8wSERRNkVUZ2RhV0Nt?=
 =?utf-8?B?ampwSjlXa1VEZ1Uxc0xnVi96SlNOVnR6WUQzK2l3TnNaMTlJdWloRUZVMDdr?=
 =?utf-8?B?eExMT0lnYldObXJ1S3JocnFZUUdHdHc3bnpSYmhMTkRvdHhGanF2ZlRGUERn?=
 =?utf-8?B?NmQwVHk2elB6NnJGOUpVSlk4T00rZnRrZkhWK0xTQXNMV29ZNkdOZzF2QVk1?=
 =?utf-8?B?dDR5dWR3Rmh6VTFBRmtFVUI1M1pnelZaWWJDOUdXYnBJZGJIdnlLWXVFMWND?=
 =?utf-8?B?SWFLS2RsemhYZU50dmw4UHdyL3ZrbXdNR3hTbVZuUng1N0FXcmZTY2dLVlEy?=
 =?utf-8?B?V3JsclVmdkRHZkI5MWwyVGN2dTBsQy9HeVpKSHV3Q2xVQmdaUzZZY29sczJw?=
 =?utf-8?B?MFZ1OHBFYklBeldldHZRdENGWUdWN0lCWWE4dHBhbkhVK0JIM3NTOWRscGNX?=
 =?utf-8?B?Qk1MRG12Z1pud2I4ZExKVVBJV0hHejQ5TXoxL3phcFRpemowSmJuNFhOaTV0?=
 =?utf-8?B?M1NRYVFFM001TTdHWHdxRWxTMUtrelRuSWJmTHlCL010SHUxck4wdEhHWTdm?=
 =?utf-8?B?YjMrYyt4ZmVRK3c5YXNmdFVQR0NIVko2U1JsZGR3bnVYOVZITEdOUXVGSy9D?=
 =?utf-8?B?emNBb01HbHJ1bE9PMnp0NzIvYitmaTNZamExZWVtWm04UWNlZTdka0FPYWJ5?=
 =?utf-8?B?Vm5TMzE0OWR1bXpGWVNjd084Wi9MSzlOUHMxTHk0L01HM0l0L3loaEpXTGg5?=
 =?utf-8?B?ZXJUTno3VUUySmVOUldrUmdUcVZuYmMyUXVzWitHR1Jrb1JQZ2lHcVN1RXJh?=
 =?utf-8?B?MXNsbmlSVzZDUzB4Yjc3cENodEp1UnhZa0lDQ3pobVlsZFRrZk5PT1BGSGZE?=
 =?utf-8?B?V2IwSHBGVVRMOW1JSU1zOUltcTA5dnZJQW5VZzhTRHd2UWl6U0k2SlBERkpF?=
 =?utf-8?B?djhGN1NEcXNEZi9nMTdTNzZYRGMyakd6SDdDLzkybWJlNzRtZ3liZzVMWW1o?=
 =?utf-8?B?KytyNEZZYnRYeVBKSlJheGZnREQ2a1A5bXN4TDAyVmYwWmdFcEVkdXlaRytX?=
 =?utf-8?B?YUEwY2d6NFlYSkdDUUxmckFnaUFhODNxelU2YUhRWEgxYWFXRldFUHZteGhG?=
 =?utf-8?B?Mi9ZUHFNaWtnallZOVpiOWtCb0E5eUpoSk1GU3crbjBydEtSRXVpc1IvQ2JO?=
 =?utf-8?B?VVJDRWlJZjJ1djFoQUFwNVZOblFFZEdldTluZ0dNZnNWMXRib2kwTlViRzM4?=
 =?utf-8?B?Q3BoSlI1dDR0ZmRreGI1SEpPcU5PdWMvdDZrdjlOM0ZwVVlzMUpocmwxaWFS?=
 =?utf-8?B?RTIrNEY3by85WERGZjFtODE3TnFpTncvQ25CV3FzMnZQaGhic09UcXgzanUv?=
 =?utf-8?B?NDNBN21OZzNjK0dsT1Vid1JHMERBM29RaUxyYXdrRlQvdG0vUHhncVdURUVv?=
 =?utf-8?B?QVZHODRLcXZ6WitjOUdRd25UZmY1dXZRQ25IQnJkOXE4aVhxUHM2dWZGSVFF?=
 =?utf-8?B?UDhMUFNFMUxmbFRvVmdXUVRqWHFhdWFhNG5yVW9naWdrVmp4UGpzekh1a0xG?=
 =?utf-8?B?UWJONUZMRzI2bllQTWNDb3dUOUg2RXhreTJUWkt2VWdROUxZSTdnNWVTaWsv?=
 =?utf-8?B?L3FmU0pNL3prQzVhdFU5ZzFna0VlM2RPTzFjMzNyNkxZcjN6c2V6REFkMVMr?=
 =?utf-8?B?MmE4ZzdUbHpWblRSL21hYjJ2TkZCZVVHTTA2eHJVR0lKSHp2ek1SY21yT0ZX?=
 =?utf-8?B?UzhQd3hYdUNPQ3dDcENXVC82TFlVZnZRY1hxLzRrQTNxYmVWam9kNmFidXBD?=
 =?utf-8?B?TjdwbTRTOUV2UmVXalRueG5BL0IzRGtBdm5TVmlISW83QnhyTWlpSU5Gdzg3?=
 =?utf-8?B?aGlqSnRDQ1dwN3U2STE4dDNYc1c1SC9rcEhETm45bUZET0FFMGkySWt5WE9H?=
 =?utf-8?B?bHFkZlRUam90ekNDV0c3ZXhJOHdEeDFhaHY4ZmF0YllqN3dsUUxBZ21OazVT?=
 =?utf-8?B?d01mVWgyZmwzZG5QMnZRMHBOSGRhSnF1TVluaFJ5emRnWnhMbGlEYWFvYWw4?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C08E3C0B7F5EEF46AF4BB8887288F005@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Iz2q+nwx0Qwu9KKTInYRABL2QF+IRyVksjkT5EZ/L+CC7br3zHFA3IyFv7FLetNhFOw3kX8nzZGGP7KFL/w1exmvRGvjVdl9XI1s6KuqMu5ki6MP3CBL9NMKwWdGvwxYNbqvBM22cjMKbPX5eRvZoewJqJauKd7RQOP5BmA7pJGFK5wXsCL9Pee/XeAcxrFMWsSKbWUvTUJmoLNa3oqHqGTvGc1q8tMeKnifGKVGstqSCkxPnR815ru3ilYj4DHjN+myQh/Geg5Nk57aKv+2sSAS5z7gU6rA3gXO/dbPTl0aXPewOzKv3vK69K6wUlFkbogi3PRNeBRitPwOIJkTB0m2RM+lmO/4D1TotCFpYbLc+P8B14bSLjd53D4Y2Ac8SKGIHpv7xYdbuOUpeRlEg4Is8SP2cR95wHgq6QpdbhnBSRnUtbu4zJfTVXjLn4c8cKzvmT0UhWKa8J05xNTGZuhn9foxVsbFyIK108Z+A95bvje+f5w5HQIARrikk23fuW683x2gRGt8Mn4KIPtB0EEuzHXlMMIHsvzm+FxX0POuyBh9m+DIHKgAzsoDlDSf/cuwTpd7gMJhV19Fma/YRgPbxptYSxnPcHWez9l+0seFxludxAHmIWk3CjfOO7/BXdAk3uHSEUmDRiRGfpcFM4L5HrDFB4pSy2d7o3vRk/lMY95xnr2/Zj2s0NJ6oeB07uniZY0yDyIl0rqLNNJwHqjFE/wkrIqJ7Q86ysYj7DlPgZvLxJBuq3byAM8wCapQvvFAoEhauE6n/WOTU+MmOGATZ0Sm5mkhYzCczsNluhA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38cab63-e71a-45a4-2879-08db265e50f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 20:37:52.9639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlBjkEUfG5FQ+g7RHYJoTiO8x1VwJA7dnFVML8gVFJX+8yxVqmzJQ4Ga/LyOi98LekSh+N+Tf03X8KWNq8dYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4704
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160154
X-Proofpoint-GUID: 7ll8iDC3CvAxHBQA4pbUFfcJ4l1j5G7g
X-Proofpoint-ORIG-GUID: 7ll8iDC3CvAxHBQA4pbUFfcJ4l1j5G7g

DQoNCj4gT24gTWFyIDE2LCAyMDIzLCBhdCA0OjIxIFBNLCBDaHVjayBMZXZlciBJSUkgPGNodWNr
LmxldmVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gTWFyIDE2LCAyMDIz
LCBhdCA0OjEzIFBNLCBLb3JuaWV2c2thaWEsIE9sZ2EgPE9sZ2EuS29ybmlldnNrYWlhQG5ldGFw
cC5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBmb2xrcywNCj4+IA0KPj4gSeKAmW0gc2VlaW5nIGlz
c3VlcyB3aXRoICBkb2luZyBtdWx0aXBsZSBoYW5kc2hha2UgY2FsbHMuIEkgdGhpbmsgdGhlIGVh
c2llc3Qgd2F5IHRvIGhpdCB0aGlzIGlzIHRvIGRvOg0KPj4gDQo+PiBbYWdsb0B1bmtub3duMDAw
YzI5YzVkNjUzIH5dJCBzdWRvIG1vdW50IC1vIHZlcnM9NC4yLHNlYz1zeXMseHBydHNlYz10bHMs
bmNvbm5lY3Q9MTYgMTkyLjE2OC4xLjEwNjovbmZzc2hhcmUgL21udA0KPj4gbW91bnQubmZzOiAv
bW50IGlzIGJ1c3kgb3IgYWxyZWFkeSBtb3VudGVkIG9yIHNoYXJlY2FjaGUgZmFpbA0KPj4gDQo+
PiBIb3dldmVyLCBuY29ubmVjdCBpc27igJl0IHJlYWxseSBuZWVkZWQuIEnigJl2ZSByYW4gaW50
byB0aGlzIHdoZW4gSSB3b3VsZCBkbyBtb3VudC91bW91bnQgYW5kIHJlcGVhdC4NCj4+IA0KPj4g
V2hhdCBJIHNlZW0gdG8gbm90aWNlIGlzIHRoYXQgb24gYSByZXBlYXRlZCBtb3VudCwgdGhlIGNs
aWVudCB3b3VsZCBnZXQgdGhlIGhhbmRzaGFrZSB1cGNhbGwgYW5kIHNlbmQgdGhlIGNsaWVudCBo
ZWxsbyBhbmQgdGhlbiB0aGVyZSB3b3VsZCBiZSBhIGh1bWFuIG5vdGljZWFibGUgcGF1c2UgKG5l
dHdvcmsgd291bGQgaGF2ZSB0aGUgcGFja2V0IHNlbnQgdG8gc2VydmVyKSBidXQgb24gdGhlIHNl
cnZlciBzaWRlIEkgd291bGQgc2VlIGFueSBvdXRwdXQgZnJvbSB0aGUgdGxzaGQsIGFzIGlmIHRo
ZSB1cGNhbGwgZGlkbuKAmXQgaGFwcGVuLg0KPiANCj4gSSBmaXhlZCB0aGlzIG9uZSB5ZXN0ZXJk
YXkuDQo+IA0KPiBUaGUgc2VydmVyIHNpZGUgaGFzIHRvIHNldCBYUFRfREFUQSBhZnRlciBhIGhh
bmRzaGFrZSBjb21wbGV0ZXMuDQo+IE90aGVyd2lzZSwgaWYgdGhlIGNsaWVudCdzIFJQQyBhcnJp
dmVkIGJlZm9yZSB0bHNoZCBjYWxscyBET05FLA0KPiBpdCB3aWxsIGJlIG1pc3NlZCBhbmQgdGhl
IHNlcnZlciBqdXN0IHNpdHMgdGhlcmUgc3RhcmluZyBhdCB5b3UuDQoNClRoaXMgaXMgYSBzZXJ2
ZXItc2lkZSBmaXgsIGJ0dy4NCg0KDQo+PiBJdCB3b3VsZCBzZWVtIHRoYXQgdGhlIGNsaWVudCB0
aGVuIHRpbWVzIG91dCB0aGUgcmVxdWVzdC4gSXQgd291bGQgZG8gYW5vdGhlciBUQ1AgY29ubmVj
dGlvbiBhbmQgYW5vdGhlciBOVUxMIGNhbGwgYW5kIGhhbmRzaGFrZSBpbml0aWF0aW9uLiBBbmQg
dGhhdCBtaWdodCBvciBtaWdodCBub3Qgc3VjY2VlZC4gQnV0IHRoZSBzb2NrZXQgdGhhdCBnb3Qg
dGltZWQgb3V0IHdvdWxkbuKAmXQgYmUgY2xvc2VkIHVudGlsIGl0IGdvZXMgaW50byBrZWVwIGFs
aXZlIHN0YXRlIGFuZCB0aGVuIGV2ZW50dWFsbHkgZ2V0cyBmaW4tZWQuIEF0IHRoZSB0cmFuc3Bv
cnQgbGF5ZXIgSSB3b3VsZG7igJl0IHNlZSBhbiBleHRyYSB4cHJ0IHRoYXQgZG9lc27igJl0IGdv
IGF3YXkgc28gSeKAmW0gbm90IHN1cmUgaG93IHRoYXQgc29ja2V0IHN0YXlzIGFyb3VuZC4gIEdp
dmVuIHRoYXQgaXQgc2VlbXMgbGlrZSBpdCBtaWdodCBiZSB0aGUgc2VydmVyIHRoYXTigJlzIOKA
nG1pc3NpbmfigJ0gdXBjYWxscyBzbyBwcm9ibGVtIG1pZ2h0IG5vdCBiZSBvbiB0aGUgY2xpZW50
IHNpZGUgYnV0IEnigJltIG5vdCBzdXJlLg0KPj4gDQo+PiBBbnkgdGhvdWdodHMsIHdoYXQgbWln
aHQgYmUgaGFwcGVuaW5nPw0KPiANCj4gWWVzLCBJIGp1c3QgZml4ZWQgdGhpcyBidWcgYW4gaG91
ciBhZ28uIDotKQ0KPiANCj4gVGhlIHByb2JsZW0gaXMgaGFuZHNoYWtlX3NrX2Rlc3RydWN0IGlz
IGFsd2F5cyBjYWxsZWQgd2l0aA0KPiBhIHN0cnVjdCBzb2NrIHdob3NlIHNrX3NvY2tldCBmaWVs
ZCBpcyBOVUxMLiBUaGF0IE5VTEwgaXMNCj4gcGFzc2VkIHRvIGhhbmRzaGFrZV9yZXFfaGFzaF9s
b29rdXAoKSB3aG8gdGhlbiBjYW5ub3QgZmluZA0KPiBhbnkgbWF0Y2hpbmcgaGFuZHNoYWtlX3Jl
cSwgYW5kIHNvIGl0IGxlYXZlcyB0aGUgYWN0dWFsDQo+IG1hdGNoaW5nIGhhbmRzaGFrZV9yZXEg
aW4gdGhlIGhhc2ggdGFibGUuDQo+IA0KPiBJZiB0aGUgc3RydWN0IHNvY2tldCBpcyBmcmVlZCBh
bmQgdGhlbiBhbm90aGVyIHN0cnVjdCBzb2NrZXQNCj4gaXMgYWxsb2NhdGVkIGF0IHRoZSBzYW1l
IG1lbW9yeSBhZGRyZXNzLCB0aGF0IG1hdGNoZXMgdGhlDQo+IGhhbmRzaGFrZV9yZXEgdGhhdCB3
YXMgb3JwaGFuZWQgaW4gdGhlIGhhc2ggdGFibGUsIGFuZA0KPiBoYW5kc2hha2VfcmVxX3N1Ym1p
dCB3aWxsIGNsYWltIHRoYXQgc29ja2V0IGFscmVhZHkgaGFzIGENCj4gcGVuZGluZyBoYW5kc2hh
a2UuIC1FQlVTWS4NCg0KVGhpcyBvbmUgaXMgYSBjbGllbnQtc2lkZSBmaXguDQoNCg0KPiBJIHdp
bGwgcHVzaCB0aGUgZml4IGluIGEgZmV3IG1pbnV0ZXMsIEknbSBqdXN0IHJ1bm5pbmcgYQ0KPiBm
ZXcgdGVzdHMuDQoNCkl0IHNlZW1zIE9LLCBzbyBJIHB1c2hlZCBpdCBvdXQuIFBpY2sgdXANCnRv
cGljLXJwYy13aXRoLXRscy11cGNhbGwgYW5kIHRoZSBuZXcga3Rscy11dGlscyAod2hpY2gNCnNo
b3VsZG4ndCBiZSBzdHJpY3RseSBuZWNlc3NhcnksIGJ1dCB0aGVyZSBhcmUgYSBoYW5kZnVsDQpv
ZiBidWcgZml4ZXMgdGhlcmUgdG9vKS4NCg0KSSdtIHN0aWxsIHdhaXRpbmcgZm9yIEpha3ViJ3Mg
bGljZW5zaW5nIGNoYW5nZXMsIHdoaWNoIGhlDQpzYWlkIHNob3VsZCBiZSBpbiBuZXQtbmV4dCB0
b2RheS4NCg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=
