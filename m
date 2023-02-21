Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18438EA4
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 22:32:40 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LKNeso023092
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 22:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=D2ftA+uNMjr14oVDJI6IAr15gvScomMeMh5cYzlfrEc=;
 b=eOp0fS0Dphvtlcc1XPETLyh53chm3+GqjAREN3I46Ac7Ho2+g50LabXi3fJRLMqGhUrX
 ioKUIu/9gyUnFytBFJRMwTdx8xSHIzj0W3k78TUsboLd/WJzqe3f0EKUhhAGsZQYtejf
 Po0u+G1vmGky7oJIiI7bczaLZJFJyWfgbUTstA10q4nxpJYxdjmoUOZMVWsgeEUqN0vV
 CCI60m7S4fS0hURoDXaldJhjqAAvLUgDQaKbBZAYtYgkJ5ggndjnlzTlToz9M9Zs6igP
 Gwr8tB5W4PYEjKJYHCamJOB9i22evDPo98epdFDBX5KxYS1jGgYpn4hH/48W524u4l7u dA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcejqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 22:32:39 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31LMCgX6023480
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 22:32:39 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn45tsyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Feb 2023 22:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImDcR2XGEErd1ePLtzA1HTygC6mCHnAzuI9iUPvGT4Ugyam9uqQ8cvbjVn03ZAD9qMxRxio5T/NkNP7LjtL7V2QW34lx6KzJfbKws466UhTPhj6XQ1mpDwArPRcrfMERU73+B7OsUkdza/Pomau2P+6dMT+KlmfGUpqSX1Cw6lnAMhYZMN4tg+lZ/M/erzgx3O2Kst3ylwbM239hw8TpXyIWoW3G1wkwxfqYTRngHK42ni2g5GvLU2WO/9J5GGsUchgblRMuvrPWHeaQnfZ/vnUVQoyt/MFqJxG74SBTNfBIUhLO9NsxUEbMNfj+QOf49mpo7d0SD143W1vQYzjP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2ftA+uNMjr14oVDJI6IAr15gvScomMeMh5cYzlfrEc=;
 b=iMmdsblj30iCW6LLbtRMauslJVfn0eaAtroJ6Gy4qdpvkAEPOI9e4pLtd1Fmn4UL3+YuHKbEXPlmDElAW3GbfOs64DSTXcNLeCsLecsjKdZ3s//A/w33BSXnyALAzDfT6UPSSdI1yxmhrP0p0yKMOAzSF6Ce4zUyYmL5k2H2mIfG/bWODPZHh05wzkRA6jGXs+YqV9tMlyRQGsHQWBEAmNC/sUhDTgB+2kLuQpU+O7HG9IeGXelaDhk6jZYpQtOs/YJ6efNkF+HMT7l6jPB3rCcPZ0qBDoY5IkBxbcjcPAPta1WRiZlOk5g3+7LFAsNNxQqbvNXW5J+Oa3wZR2Lemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2ftA+uNMjr14oVDJI6IAr15gvScomMeMh5cYzlfrEc=;
 b=tI//NFSqHbIAWEcDi3zaF8woV7FkNuDrCdn7w81Sx9UVY31A5F1TTDP6MkZd0BrIBVkT1GUYJl9Ilt1pKOtvVIT0SMOcij+ben2cpYNrMzi8L3bKDEzn/jKQF5pxQLRgeEGJvbXGL0mtySaZenj51wxSuqdGb2i2R2paMg3COPQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB6713.namprd10.prod.outlook.com (2603:10b6:610:143::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.16; Tue, 21 Feb
 2023 22:32:37 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.016; Tue, 21 Feb 2023
 22:32:37 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: new netlink attributes - thoughts
Thread-Topic: new netlink attributes - thoughts
Thread-Index: AQHZRkRmBh5ePVxFLUu5z/DaXgPGCw==
Date: Tue, 21 Feb 2023 22:32:37 +0000
Message-ID: <6B769C89-B427-48ED-A20A-E96D13B8FA8E@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH3PR10MB6713:EE_
x-ms-office365-filtering-correlation-id: 89d0e289-d07a-4477-bc4b-08db145b88e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f467QpHCvXfVYwJsXimI66WrsY4TzL2Efzu8pnE9WM59A7Ng84w6VuFdEyXa3A0YkPKU6yt2mZaSbFXLSO1foPz/ENqWWkbRWNFnQKCz7xQexyzD45XvVWwjPWuxzKq2wk34tjUGqZ1g/oUjmtCUalm0TPvFMETNGV/rn3Ag536AsYvxMfcZWE5b4jrSIbzQP5LCwudbxE/xyoOo+gbxtBuvds6chMgRxXgBkvtdsnzltQrrytqXA9Z26c3KcyTZ63UKPxOiTFFne/WG7WrrcXdXRgalGPR5d5FI7+a/pZOW1sUPEL4bK6B+otQhflSE1nz//8K5y/mMjoZs6zyZUS1xbKeNx4tGfp7AKo4MCpmokFZpoQXLmafHeQ3vSE/ag46SRYCxB5tAfJSdMEDKbKFmXQAaAIm2O63ziZXwhDBZ0aj+qzsfrkFYvEwQ0Px/GlPyHc2vfxb7E604NzszXn9f5mt/oVf5S7cEm9n5Z4tSKAhvDRhFUyr0RUBdDhOTXDqz7AcFqWV5Ha1MgtIsf86YbZucmwXoLqyUWW3TZy9BQRrFGQ5A82vdtpua8i2AMkS03n9s0WqWSfIqKFYj4qX/GM18RsmUJJAXmw2JopueHWbbx1xjhTkn3RM6JP9zXWRp+ddMNrMdVxxYhgg18++hAuQcsih+twLbpuUoo11Q2VNVIMy2VcJ2Sd3hCn3Oj5IFEgVTo1rTRRuPA/2o/GEaxJ7iUcqFCsQYLepjEac=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(38070700005)(122000001)(38100700002)(36756003)(86362001)(33656002)(66556008)(5660300002)(8936002)(8676002)(66476007)(76116006)(2906002)(64756008)(6916009)(91956017)(66446008)(66946007)(41300700001)(2616005)(186003)(26005)(6512007)(83380400001)(6506007)(316002)(6486002)(478600001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kAlgMI66rcPxyDIQCKojMyf0uGClUk2Xd6U6++VKnaPF92E+50KmFjNL5MTQ?=
 =?us-ascii?Q?shf8u1aT6rRFUTbKxCW/OPCjQwQD7DgbcPH+EsQqK03DKspfLICtDUQ+i+Lr?=
 =?us-ascii?Q?FFYixNF03mJTGHjqkQtJxdNQN4RFptUhfe2UKQ1Le5fTo4tZmv+Z0LKHIZr3?=
 =?us-ascii?Q?Z0my3x96GIuYnLxo5VLMUdwirpUV2Txt0zvwHE8JRAn+eHXfSPr+T4OXHlxC?=
 =?us-ascii?Q?wZGwHMrmSQTazYknWWw8b/Gt8bhaNPz+Mxeo5QC2/e8XEHPfiMGeB0B0teex?=
 =?us-ascii?Q?QizhXl7EdrIOxf6Nyme+uj/h/creelnQTAk/HmQz0GHLib9dh7bEm4FHFlIH?=
 =?us-ascii?Q?A7k6v8XNc6rjNMKiuIZfeecpLhJpZdNWZXFmN1HqBVpRBKi6+HIjhCqZgGh5?=
 =?us-ascii?Q?XYWwpbrVqIPMgQJZTzXsXfuTsE16lZrpxrVs79qmw1YNKuzo+Xc9OJr9+QDZ?=
 =?us-ascii?Q?XEFvkYUvQSwf7fDXKebowo6ZpMzTl61lM/TFk6GtbDvXAL9rI/gunzJvop/n?=
 =?us-ascii?Q?scjXeLGnILm5IAQz6c9s2PS8krL6PUoA7hqtyArO402dk9vQhysd0DmpuOY7?=
 =?us-ascii?Q?jwSfkQd4vj0ZpWUdnY4CJgUMV4CsRzfR3CM1keaWvEUgABzV9MeOOWtWSGYE?=
 =?us-ascii?Q?mLhqAr3BJbc0yNhSoIP3V8EDcf5yEO14Wjmwc9kcxQrIRWvHnF6ofbd99V/e?=
 =?us-ascii?Q?2qLwIOGx9pzfAdiwhSdEdef/wcRrR9dl5tz1ncIwkCdoq4eyr294h4MkX4Gi?=
 =?us-ascii?Q?F858b4sXjMi+N2TngGnzNGWERE1PhL7yX7MvNqWRDxhqCHLx38BwF7LM5lbq?=
 =?us-ascii?Q?kqPva7uBXBn8OD6GCnRkT65q2MO62ZoZmcA+ezDtqoMODxBEvzNMtfvzV+FV?=
 =?us-ascii?Q?/lFnDs6dXevGqXfAnRLGQdITBWgw11lkcH87VC8wvIJZ3vgtS0+BIJjmFAZ8?=
 =?us-ascii?Q?UnmhJAYb4HsUWbvN7ROCUJI4klA6lo18pmrOCgIUapLQRumjF/bpwLiN42mE?=
 =?us-ascii?Q?bpaZqDfJa2i9LqzvQ9YqnIgguSlnrbw+BN7gKzAjUCvYWouwQAnKaBuMq5ja?=
 =?us-ascii?Q?GvWId/m1S4FdcDdiBtI+KLtHiE9jJgm9Lb6A1WGnMwLlp+BvlShMeASZWk+V?=
 =?us-ascii?Q?W88zHOszJ1efWucB0bqwFRd8y1r4MleD050/X5um3EcyQtK095UYR55qJfZY?=
 =?us-ascii?Q?a+0zqF2eLxIMKLkFqS49Y+9shHxyQgeWLP0YA5Ncqi5o7Minhd0MLr1TXoNW?=
 =?us-ascii?Q?4bn5zPcgmEZTtO1wQP66fAfM5BghPKUy3ngcrh0DntXb1YZ3hJ62yA7QPKNe?=
 =?us-ascii?Q?LEqHqPc5Ehp5tfr8gYJBCWF2AIPkeFOqP7L1xcUxZVOlV1ZAnjb8DFaHm3KR?=
 =?us-ascii?Q?bOqBy5QUqRy9VfW+kC3AXTTqn58shJ49msrAX1ud4S18TOAZxSksfMhoVDbY?=
 =?us-ascii?Q?nnm9Qve9PA4p66HH+fJF4dKHhrr3bYJdVBPIQEd4vLMr97cUk+yDQwJZSwzL?=
 =?us-ascii?Q?8UI9cywTuhRsnlnc4lUreNfIHTTkBBVFV1wLRjYIL76PaUJyDhGOCufIVd83?=
 =?us-ascii?Q?NMVj4wrt3THSnQnGExtaTX67Q/henDc5Fg160ZBfLRk2KkUv4+c7yzUvHFN/?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5072CCD7531BA84D93EACD8DE70AB5DB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FokFVdSW7ZFSWdsDj1w4YMdveQ5BzLpwaUme71dkLhu6vS6hLcw7IdfkZ5p2lqvmfEhGRP9oOqSOE7TqVQOxpTM/+I/JIC5xenE4fzlbPXr41wl+jdvJrzayHgwGcaqV/R9oGpLCQUQKeJPj6yFcJeREHyGgfBBDytjM47O2aoSNotxmXy1vk6+2tqdGwN5qQh/iZP2E7kLh3p22qx38oefi4pfUPxikQv48K4NY6HMt+/vPy5DWs8y31k5BntGZw16ly9u+9zZ6yNSyWa1x4/7kxUsLRWvOj84X64N7yYAxUxRHVZ63aBR+5a4FuQ9dWwAlnT/cDOns1c0HsfGUyK1P/z/M3QUi8TJdI7giur9qL0T0Ug+tLitM6X5EqV99huRHB1zDaeMk0HxcLwpIT8HYnveK/vqicyCRPDj45VELBcpnGv4arml2ZSA8C6UKCY1Zfe9NFtGYP23Q484NuTMh3kapdrR9AAeZCt6IGylRV1ZqvblLVPUDLvqfqI3Ei4nMQL1dEBcsP6cAsz5tK4cw6Dj/CvsxWxmE2Q9cjmvc3SJexKoy62ePbt1x2sazry12SQ7C6xav7R3KRrAhj3t8HTRNSwiuF2b+qj7ENDxawrBgu8pV26QsyMDwIbMbbKFbe+hSBFcia+SG+kyrfi62TnjX8zJZc4cvLJdQ5ZNQvtHzhEms/dbi0/QNV3wpLAUZg7y0+LxYanZXtP89zDCFI83VDkMuOfThMbhB0job/Xm47V3qUnqmAqagTMrT0aJsNBqZEfoC8eDCTY5Wyw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d0e289-d07a-4477-bc4b-08db145b88e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 22:32:37.4278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQWDpZsuYBX3ccNJKNxKiQd+DcmNk1BywHR1cK0Y/S9JxA24p68UvYU+0IDLrm2usNrtN7/ZVtnYI1WXeILjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6713
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210194
X-Proofpoint-GUID: o1_GJN3EKfSeD4Lij6oVlsVnLFSVdSlp
X-Proofpoint-ORIG-GUID: o1_GJN3EKfSeD4Lij6oVlsVnLFSVdSlp

Thanks for the broad conversation during this morning's call.

We're now using netlink to handle the interactions between the kernel
and handshake agents (eg, tlshd), replacing the old listen/poll/
accept/close mechanism.

Before asking netdev to merge the handshake upcall mechanism, I'd like
the netlink protocol to be stable. The protocol is extensible, but
because it comprises an API contract between the kernel and user space,
we should strive to minimize any significant changes once it has been
merged into the kernel.

For those who are not familiar with netlink:

- A netlink operation is simply a remote procedure call.

- An attribute is simply an argument or result data item within a
  netlink operation.

Aside from the attributes that contain the socket file descriptor and
the status of the session, there are three more recent additions that
we need to close on.

1. remote-peerid

The DONE netlink operation now carries the key serial number of a key
that contains the remote peer's identity. The content of that key can
be an x.509 certificate or another form of peer identity.

I'd like to make this into an attribute that can appear more than once
in the DONE reply, since more than one identity can be passed during a
handshake negotiation.

This information would then be passed back to the kernel consumer who
requested the handshake so that it can make security policy decisions
based on the remote's identity.


2. timeout

Hannes has suggested adding a timeout attribute to the ACCEPT reply to
cause the handshake agent to give up after a bit.

My thought was the kernel consumer would instead provide timeout
handling and cancel the handshake request in that case. The handshake
agent would continue trying until told to stop or until the remote
breaks the connection.

v5 is supposed to have more robust support for recovering from
cancelation, ^C, and other sundry signals. Proper reference counting
would keep the socket around until both the kernel and user space
are done with it.


3. keyring

The idea is to have a private keyring that the handshake agent and the
user requesting the session would use to share certificates, PSKs, and
bundles.

Hannes suggested passing that keyring's serial to the handshake agent,
to have it link that keyring into its own session keyring.

It might be a bit more secure if the kernel links that keyring into the
handshake agent's session keyring as part of the ACCEPT operation.

We might also specify the name of a keyring containing other additional
shared items, via /etc/tlshd.conf. That's outside the realm of netlink
attributes, though.


--
Chuck Lever



