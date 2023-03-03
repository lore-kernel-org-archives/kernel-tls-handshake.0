Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29A8F53
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Mar 2023 18:28:36 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 323INmsD006016;
	Fri, 3 Mar 2023 18:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tC+3HDJBf+uMIek4dpKpwv8UgTSsbrTwB6TOGIyczAY=;
 b=gnZY2tm1lSxE+96msQbwn52lcF+yp38dg7rwpP+cVDB437vpZWgG/Fl5xcyFrEO23sJF
 JGBIEvWIJXvRPaabqGqoKUm8WmJKQn6enjxqTEvwxk2ATwYT2Omhxf2WZVk2xVcLpHYt
 rdgm2TOXtirDwQqmgHJDPboosYq1zPSI4rXwgRs2azw4EnuVc7M0rg20//C0moP5Hfja
 r5jj0J3HMuSWb7JBjaU5wi7gkSuuViWa3B0e4JCBZ/aHgS2a3oWns65+OXkWYQjB1ww3
 tWyopMelwFlH1J/qlsYFEnxmKhCZLLjlt5sbmkjqQI2tCGzAy4YzrGqgJukxoNptLM8n Dg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba7pvsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Mar 2023 18:28:35 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 323HRNs4034879;
	Fri, 3 Mar 2023 18:28:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ny8shxens-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Mar 2023 18:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQz2cvCofpYfp3Q5yl4XZjH+KWcHGnuZLKdM6NbMNqvUHNXGFTqiD4cSPOu8NdjtXlUzpwIRylvJN+AnJTs1LSAhbire6eulnQBMjUjI5f6B6VBZZUyGcH4d4+nZygNegQ+hyBa2gkuCQj0wFFlBLPGzlf5pQuz+RCbq/soj0Cx5SFkY9nj8olKc3xG/i888am8kFANRvYNh7AC/fgJVfM2js1lD+QmER03b85iPWkB4t5iC1UQjbaWG7pOT4+sSZRsGIDAHpFzO0O8Ll8qRy9VlnJesRy2vTRm7aG9R2kzUDa44hI+Y3FBVQLrlGzgRZ622ofySPlx8lVHVOgWu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tC+3HDJBf+uMIek4dpKpwv8UgTSsbrTwB6TOGIyczAY=;
 b=TkW7qQvy2YTti3ReR7TB1hMiR6sX/hNPwLLmLFGq5sx/Codf6kcB/gP/dNhM3geYZ8UvvqKreMvGXniqzu3ezrl1CHqSamPWuMi9g1b7bo4CFYclKLVAz2upCtmhOnDZgY7gehWEJbPG1eiFeWRJLq0ga63w05eIuSfaPC6sXSn8lLQ3nDhsdiy3+n77m+RkxQ+uE2r833wdklZLH9FpA7R/ph4h0Dykkg/8vO87GczQPcOw8cOj3XSLfubas6IkzBTSntpJ4nF5w5B8Y/hL839NvqSNvA4qkvo1qtZn56hwnysosegfqBqAktrELm7mB6OfjRvvnp4PYWLFxJ5qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC+3HDJBf+uMIek4dpKpwv8UgTSsbrTwB6TOGIyczAY=;
 b=iTL+p2BabD5uq970NQuasmECjfQTMqYBLBe89SSdjlc/TIJj8fjHvUbGr9V6zx2vkV39MorDtuAQ7PJXYDeSHDLF18VAJos01FdTyauQl3l+E3KUN6AV9CSYT4dRoboNrdIw1QbGfSU3vuA3h63BUt+xlcW6PiF20mVXnsDW1rw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB4446.namprd10.prod.outlook.com (2603:10b6:a03:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Fri, 3 Mar
 2023 18:28:32 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 18:28:31 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: Misc fixes for v5
Thread-Topic: Misc fixes for v5
Thread-Index: AQHZTeISc3LK6Bb+xUy34ep23ZeGlK7pLe2AgAATkYCAAB6lAA==
Date: Fri, 3 Mar 2023 18:28:31 +0000
Message-ID: <3C0C9E55-F109-403B-AB67-62B35753E348@oracle.com>
References: <ee1e9c66-40b0-c373-25ee-ed5bc38203f5@suse.de>
 <7E06F1BD-7429-431B-8EE3-C495AC3CC723@oracle.com>
 <c9c2af40-b5fe-a49b-ce58-dc90d0dbe199@suse.de>
In-Reply-To: <c9c2af40-b5fe-a49b-ce58-dc90d0dbe199@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB4446:EE_
x-ms-office365-filtering-correlation-id: 1dab12d7-09fa-4497-6340-08db1c15174c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 otygahtXG0q4MkZUnXDBq8C+zJkylkWXBJODsDF1/ftxV0xknFXRKth6yRg1vBGey2bdeMHqmg48YP/zlvSdFFe1fuvCioKm9m3cHCBMf2fjFgdwZN/Lo/tbh0a5L0PeBqDENCcuPrWr2SCBnEyvqwzBHk3ZalmRhxuZgcNYJZxnZ7fQUTqvPdL0CR/tKL1WSa65KZGQ0VEOG5C/Mk4iJYBlVCCNfEcYKQ+IcrPwMcXgL7MUA6P92skNewurOsc+86MV4Q33ifA2rzCnhlG4mw0uckrB1YtWeeDSu3JYIEd5PjdK0BeTNVoHWtzVnH5CFqnswIeltTBq7kyuGRn0duiNPpJsz/VRTNQBl9b8Mt+G7MiGf7g4E69iJIQ0a1rJsv2kIT0Urn1fp3zDc+279rgxxLk+ImcQ+HyNdGtVu2kHI4wzrZ2tWuLzHYeR5KNQvJqEU0w7wBVebX8E5n3IF1ahTPSi3MaeJp8HyXqDvuRfHa0PnkRhHFhZqEp7DYG/3eEPX92I/T5CUlazwYiLIXMIsBp4mlUO6Pn+8dC7G2rO4IZqnpfjKRVEhE3ggX9VwgLinnHgUw7JeyoD3RyRIBe1lA+MGu9d/SZDbJWg4hKwPP2kZf8vo2CiehPHelsT8MmCWbbkMqiUWjv8g5VCfFFG82jrBEvesEcCS+BNAXJZ2YMi5tE3WmZ6wvxTcpgzHcIJHrrizcj7mmPwqOlvGJzicsJgyretRKQY6WUlHVk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(83380400001)(36756003)(122000001)(38100700002)(8936002)(71200400001)(5660300002)(478600001)(33656002)(86362001)(38070700005)(2616005)(26005)(186003)(6512007)(6486002)(4326008)(53546011)(6506007)(6916009)(66446008)(316002)(2906002)(66556008)(64756008)(66476007)(8676002)(66946007)(76116006)(91956017)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?i8F/Rq/O9dZpLqYcEHknPDQsrCyIj7GmDoOJvt9wUgfJ6sCSl2ytVzRKDpNR?=
 =?us-ascii?Q?qhXijXyAOuWnpGg79uEt/z9e6cXd61e92N+0viTGMS9ssrR1zZ+FuxHkK8kZ?=
 =?us-ascii?Q?+pPBYaethckQHZHjpAjeXWzv7l5HZP51VeeBrxyAShADqV12qSjV6wHq4Mp5?=
 =?us-ascii?Q?y2pBVLCOY9T0/P36y7cajASNbBGD0eApWxV8npdXKFR53qX/e2MFgMADcd3b?=
 =?us-ascii?Q?oXE1mt1SiHyFgpC4TC52dj2PMPZCr5m8OzI3UaOzyM3aA5IOjU/4IQJ/jc/t?=
 =?us-ascii?Q?b5+QRMmsq2DKCECPwXEodJb4ixHxce6XmbJMHI3JKboDRqGOXkEcTQF84JG2?=
 =?us-ascii?Q?qcExn1CqPw04/NmJGruMfOiPcGlW4BjliEmQyKHlUd9K2xh00ENvQg3ebQMI?=
 =?us-ascii?Q?iGwMNsnNb1FVgSosEw2T5rMm7xEd3QzzPoM/NL45UfQG5+nIbgwJ1wzRN1tf?=
 =?us-ascii?Q?Xnl9vlEbFLyihPE2Ru3kxYsjSDzyZ05mox+tUokfxJ2jqfTXrnBv8ikU/x53?=
 =?us-ascii?Q?/1/opEIY3GJ5RdZ7YVjpEd6m99D0pthOSUaNbwDa5VwNbpoqblAGhW7NeesO?=
 =?us-ascii?Q?puXl1t6yfX0ueDxrGViKVT2MNREh8PeMzKomXUsNPBVhYbgztX35ocOhSWEA?=
 =?us-ascii?Q?HeUKZiI5gpRaGA7vIlXuI1yrTytcEumlUEoD4b2+ktZ+7T04Pz9xGsTdVM8K?=
 =?us-ascii?Q?ztteKVouQvZ8Wr+ia0GztlxdJKC+btWQW+tQl1XbYUsVJK/DnbpBfraX4mE/?=
 =?us-ascii?Q?PvYqIgSmFP86A1+0/z1h+6dxL9TyGXAkBnrU1HIPq3VZ/aP/QwAjStZdmeWL?=
 =?us-ascii?Q?1QSZxGto/JOaAgeCqEmdltmzNNckLc0FYfZ62156YjgyeWr6cPo0n+PAj6lL?=
 =?us-ascii?Q?YA9dZ9k95zgYduDGFce0hw45AX+RRGyzF/cLDasp1zac/5/CyR+vX5SEzYtk?=
 =?us-ascii?Q?hA7lY+wtkhdXxPI6fq3RVAPWQ96MCRdfFrHjGlJGmEKUwsNvhFmOgXWLai16?=
 =?us-ascii?Q?MvHsJS20P9BOG/BJKg9E9CKQ0+duWAYmnWF0oRiCt/jwt6LlNDo8WehGxOuX?=
 =?us-ascii?Q?jl8l7udIvoZD/4cwAO/J9cd2lsR2OhuRCfvnT6IXUN95Dl9g15ypNuG3lGZa?=
 =?us-ascii?Q?N0Wbyxf9CQfgBxi+eYrCvkUQthtfpNMawuRa8eXBIxy49CBnsC+TNXmAx999?=
 =?us-ascii?Q?gLlArpFKSuBO1GgL7eA5UMt/g6KpJhsiYlS1Z2aOdTtNg+nw3McfHRbx38X+?=
 =?us-ascii?Q?SBIQd765O+71zcx/0YIs5ngNElHkdepSuK+fib/LPzIyctlG5zbsjV2UsVBe?=
 =?us-ascii?Q?8/BnCPH1c060ahQun3mU2ZskfPPcSJED8GFF1NP1x4Et155FKDOHOG6wO6zK?=
 =?us-ascii?Q?uLIMTQX0sgO96fq2LL2BP+EWmtujE3LNpr3I2oIuwoRO22pNwjGNAqOiemeO?=
 =?us-ascii?Q?cJC+gm07sk705zyO/MAEet2t/iVWLVMUs6aEQhYt3UcbPj9Er1S0h1lpVRKc?=
 =?us-ascii?Q?Oxy3KEEgLYQwp7JVSgXy+nm+CWvhVViEcO0QuGd8dr1jR4ss4FedVY4WUeWc?=
 =?us-ascii?Q?oMaBOUBmDvqa34F282ZDRF66XA8w7m+9xXtSOyUjyAaYJy3jBGuGdE9N/ez0?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC0AAE0901AC0547AE4474773EF7A413@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	W/iAGI+ml+0WOvHQJR2LkNJwpFZCVI+ip0Acg8tBU6B2XEELkX/lCWJR78Ygq0qGDZ7tSn+L/3BgVMwNQXcqKywWnS5S8ksY6IvhA923CRAKNBxybQeNFQdRhQ/wRfrpHd9o0IR/GShhBOvKH4ar1iWZxox6O6dbZs0ub7Wb6wt70PR067tEPR38jcV6kV/rdemdo+MWo52Z/1c8IjwbffQFBCn/fUh7zS+wpjcMv8TswSrR83PwNKJDWWy8oO1ElpGC3YGwR+zHNJHIg/1Q+kzeMRK90iCs4686RFF44LfJchj+CRVZv3o0Q8aIasw8NItOdqO0lfkdlnnzufidS4pwoFWIHZwy5XaOY7ze1JI23TGot39RA0+kIoNa/RUeKrofjv0AR39yIF3zGZ04hQjGKDP8QjZqmZ6g+F4TUvSGn6kMlsQRg/klbcJJriIKDvl/TrOYapVKhJo7PooAzFUwkpKCLH4x5jDrRepcbGjFOV2H8TVb7cmPWEjXIBOyQhFMsEj/S/fjWxIsc/EWZPb9QZA7cYuVfd0yiQSuOH42sKYddjM9h04QURpXuF8UNDbQjAMZDOGBHJ2icDJNMEU4iiJe5Wif2K8rcdkss6yPx8CP4HisXwdNkafqrWohmbYTL7qODwoi1VwjQqPVr6dhRzevlK0WocYqAmrlv77VtHftjeK4x+dwBEI4fPM2myIn0dR6lgrbYzFjM9CTnReAhh93u31EWrXxbpPLidCtv5DiG/rl/SxnmET1TZfJcvPvO693FokQVeflusbwCw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab12d7-09fa-4497-6340-08db1c15174c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 18:28:31.3517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7drKKWzqgrsl0mDyl1Ck0Iil2R3xUFcHwq1VuEWmOUZ9eHZe55vZMrZ8/+UT40domhgw/gecfWHPyptHIt2/GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4446
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_04,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030159
X-Proofpoint-ORIG-GUID: zg_AyOC10P0I_Wjd1KldXW5xbAFOSjbJ
X-Proofpoint-GUID: zg_AyOC10P0I_Wjd1KldXW5xbAFOSjbJ



> On Mar 3, 2023, at 11:38 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 3/3/23 16:28, Chuck Lever III wrote:
>>> On Mar 3, 2023, at 10:08 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> Hi Chuck,
>>>=20
>>> after some fiddling with nested arguments (and eventually removing them=
) I found some issues with v5.
>>> (cf the attached patch).
>> I plan to post a v6 soon that supports:
>> - a timeout attribute
>> - keyrings
>> - multiple certs and peerids per handshake
>> I still don't like the timeout attribute.
>> - Having timeouts at two layers is a known recipe for tears and
>>   sorrow.
>> - The kernel can't rely on the handshake agent to timeout and
>>   call DONE. If the agent exits before invoking DONE, there will
>>   be no handshake completion.
>> But it's not a hill I care to die on, so I added it.
> Yeah, and that's the point where the socket is closed; once
> the userspace daemon finally gives up it'll close the connection
> (for reasons still be to figured out).

Could be because your kernel consumer isn't holding a struct
file on that socket...? When the user fd is closed, that's
the last reference on that filp and the kernel closes the
socket right there.


--
Chuck Lever


