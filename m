Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476A6FDC
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Feb 2023 14:44:17 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RCWXrd003332;
	Mon, 27 Feb 2023 14:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=KF7EmYolxlBQja3VBCdGGHZZEQnlZMbft5UnI6ULGvM=;
 b=ybcaEFqzNB/ha+hZC8r2tpEDrwQNMWgoB9WVWasUEY+AYIIfiBfDh7azJq0J+cVCG7O2
 ei2cbhVzV7Q1jh93nib1LXnvr8SPHtNLJDfWIwLkeGOldMBr89jmpxmHIgvLHxze9j7y
 0cyYiTqwhkN0yQNi/lJTenBrzhQ/YqyMV3+S4UO+o4/B+N3q0TL7/S9CmcOh1kvcxcaf
 I42AM0UAAoV6NTyWcuVreenRlEFUigaqaG/x005mWdQw0UCJuU/R5T89Nyj4WGxXtyVt
 RlNVeaFS41z5wryvYHukHexNa5qY0SJSd4jhu2mmwUH4fVzWh1K7GTJJ2flxhhadz3LG Aw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybb2bmw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Feb 2023 14:44:16 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31RE9qMO029370;
	Mon, 27 Feb 2023 14:44:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ny8sbd2va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Feb 2023 14:44:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJbeD228desh0f1V9YDtVKPN7Qooq3laadBBTRm3LmkLtb6tk8OGk+3fWC/Y+mve+hN/IVTHGAAgOnoroioq4Mqw0LX4Q0PlO+dQJZycziYaPyqDaj7+nZ3sJCb/GdEESc0g5SO2TZHQFmyUH8A+lcsZ/ATOfkFbv2Gl0EAaGbKXcj7TcGfTF36BSqGV3dfQ2xqwM4sumrbnL39il4VZwYG3eMcen1WsoTc+BCBRVFI4zbZfBMj9Rf7u5A2gUoZK0zojfDth1WoZ0n/dPC95S3ObMyfO+jnZpBjPpzUvJ4TPAsbvFx5GM9zRHCx0BJeTWPMANbWc67ntP5MQ2Pie8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF7EmYolxlBQja3VBCdGGHZZEQnlZMbft5UnI6ULGvM=;
 b=MNiybCIrXwhgYbezt83zI7cefUja85OrQKybk98/iF3x30H90tkP/N8+18ehENykhk7L2dSRf8tnEt3VfcwuRfBSYoSK48h4d4QTsInNJj/obm+TbcitVACpAAacGeIh2thgoz7I0fJZhLX1LOWxmm4Ch5WmoMEnKA8UFWnJZ2fZfe4deOc6M/d+o9KZ/0Qznxx8SpFahbvikSAA83xWhhDM932KsGmAfIeu9NICikCGzCFV6e7+lD5+N0uNDvjT54DI5dPSE7isSbB9B9xLEsEOBydBV+LhteRzmOXPvi+5CzRRjdqWywtVBXsSJ5vpf1OjLw1uXzkVj/G58t1Jkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF7EmYolxlBQja3VBCdGGHZZEQnlZMbft5UnI6ULGvM=;
 b=Hiv4O7he1O/Sf6A+vNdC4CdnN4UaqPNTb+9YUyZw86KM+kOXKC8dK/JKQx197bZaeXkpvU+NJJiX1YYgF/QCG9Oe5I44OXMkmIUQInPoTeD4sZM1N5GjaOjR1ELBkUnO8vUkKVQdvdiEidygelqUF5X9QuCV34+ggYhtOD+Ps3E=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW5PR10MB5739.namprd10.prod.outlook.com (2603:10b6:303:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.12; Mon, 27 Feb
 2023 14:44:13 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%7]) with mapi id 15.20.6156.016; Mon, 27 Feb 2023
 14:44:13 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: new netlink attributes - thoughts
Thread-Topic: new netlink attributes - thoughts
Thread-Index: AQHZRkRmmcX4P1Xvekm6+6amHAW65K7ib5+AgAB3wQA=
Date: Mon, 27 Feb 2023 14:44:13 +0000
Message-ID: <4B4C7760-3634-44FD-BEDD-23A21C421AB7@oracle.com>
References: <6B769C89-B427-48ED-A20A-E96D13B8FA8E@oracle.com>
 <06d4da85-3802-781f-c886-21ae6141e6a7@suse.de>
In-Reply-To: <06d4da85-3802-781f-c886-21ae6141e6a7@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MW5PR10MB5739:EE_
x-ms-office365-filtering-correlation-id: 2fd1f311-5cb2-4758-9c6d-08db18d117e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G1AuPcCM7UlPvf15kxo2HwxLzUDJ7d8xgc9dCwSRYW0TkfykwFrQdCMKMAP1O8cY0jYQA6EjuFWYLo0mTsxccvKMtxmvxLBdE/RK2cRXJbszA1tIBri/vO1Iu8t8PvF2b3UtZSx9tcjtlt8bXIFsqsPMBplKmkpUI/2RZNW9osbuwhWT3oywMolF1E3r1iywA7jNSJ3cELYgBkIxH4BpdgSYuHiG478rBsV2L0XcD8xszD64KXw4rpByqkCpWim0OETzBDiVws8/wp9ZOGtjBpb/tWHHOHdS2p80jOuulOsk1gIHbBvg3iKraBh6QlymkVNfp65TlbIwGS/6lLcMAZGV+iGVP7u6Xqa/A/WpJQrURqSJlFFJrRnJuEPe8y8mgejP4FwyWtzFRVjdNLL67n9SQpBzZXhfyDYBEAU5hlQSpCPPEUbGc1o6J/l+BQjGGCPOeo1nEliQzkKKYLqIo8bUa0X1hKcouH8ZA8chZVYJAucX3/N4Xvmi5xIYec6LCjA79Wluv5h/7sxso+VuGXoJM4qfkxNj5CrY1kKrTTkk282GaugYrKGNifk/rVAhzYxNv78zMHKHcqIrNwUuYIrDNaRW3SZi4x81rP+Z9poqjjJtMKzzQqMTK2QyfoiE9+syi06R9Md0THxGrJSKmVpZJFdRgCvRbhwG5asILz//evsnKvREyosE969dq39Zavj7cZACKweY79oxttUW1Dh1SnH7MRb4WNeKp5NyN3U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(64756008)(4326008)(66446008)(8676002)(5660300002)(6916009)(53546011)(6506007)(6512007)(2906002)(41300700001)(478600001)(316002)(8936002)(66556008)(66476007)(71200400001)(6486002)(66899018)(26005)(186003)(2616005)(83380400001)(66946007)(76116006)(91956017)(122000001)(38100700002)(86362001)(38070700005)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4apO6zQlQIWL/zqM3sO0LH+J2IAzQD+ZqcaaU90S4cwbMs5HLScy5Rcm5If/?=
 =?us-ascii?Q?+BJ2YVhy7fBRcoe8OX8+0WMzzUJtV2Q2mw+HR6drMcZpSR6TwaekvlLMCa3K?=
 =?us-ascii?Q?PbRmdai9LJ5Ikz8X/WCW4LIdGEwZFG+02enUFIC/TocBpDaMQIBlhUUUzdKN?=
 =?us-ascii?Q?/+bAW8wKYQXuaBK3wdVDlhCzWW2ATkJ8k+nYk7DIloYQzproBI3p5+fT5qqa?=
 =?us-ascii?Q?r+MtMqnzzOdGviI+3hsxMZaG48H78ErJ6raaxfRFfyxqXicbPV97unB/Rv5D?=
 =?us-ascii?Q?WHyCMmj2zjlrY/BUvmwErMFndgAzyTUcD6+/EPriCVYO8uwIDTGLkI4uXynd?=
 =?us-ascii?Q?9m+SRkZCLa4b3wwW7k6/ue6Ae0dskdZL0q9ImRyvl/KdeWXWPuAOt7XC1+pS?=
 =?us-ascii?Q?IQWMhsShuD8QbR+3NQp2shQ/N9FNiZvZ5tGC+9TL4POgrNM4GIC1VqnoTGM1?=
 =?us-ascii?Q?MZnvxZuX2m8/xRUgChOwhDPsuYZv+Exzo9plI2l2Twxe8AaKJDEnr/FNosmT?=
 =?us-ascii?Q?tg2xCQt0amzQujgOqSguo/0SRay53XlvG2ZbQ0c8WUA576f+MX5mRgY+KbtC?=
 =?us-ascii?Q?Qx5AnoB2ELZvid3Oarguv8zySzAgkUnmIl1koCz7iZwYvAkW9exWUEvJm4tH?=
 =?us-ascii?Q?nNTcIyioHA73sUA7LEy2/qnAWeKv1LR0JFkt2T8KUkqojM1fcAOdG/UaLTpN?=
 =?us-ascii?Q?qdN2HeIX7rNlRq2YDvHPRK2gHkPJfCNMy1+69vM811EZVavVGE/ICBIG9d6D?=
 =?us-ascii?Q?DJf2SteUTFkJe9SJMGudG1uRG98nCRowohhdqxWm/5UdfnGThlFbmzSIVJlJ?=
 =?us-ascii?Q?wib+AcEuH0eC1VM8QvTPpk5WQ/B56VaKJJghict0PVoPMUSb5p0t0LVezH3i?=
 =?us-ascii?Q?xbSxEqIQTFJTMK+e085rL0hqGbNTtnJk0+c7EsMcoNSJgkitpO09LyCfVGUt?=
 =?us-ascii?Q?KryZuZEJnX+7XbbXvZC5RPcXuKhNp/apfnY1QXHfaf5kTkUSPfMGeVUaZk6D?=
 =?us-ascii?Q?5KM7fxEAbkXFOISJAkGzUU0QpsUpexsEK0gNfgcNe3IFeAud/wxmyneZeBBK?=
 =?us-ascii?Q?O6faNAW7VkQfAgUPdn8MsteQLgn0OL2Mwrd2gZDfyIEBMoCuamT039vCv1T1?=
 =?us-ascii?Q?nk2VcK8JQATa9l9Tk5pKbRCEi9XzaiUlbBV3VvQSo5mJfV+W85zVJTyLjefL?=
 =?us-ascii?Q?sj+5Oa5mmRr6GOJjix6Mvi7pVFLeurfvtMUiaD3v/SDw6oMRA67mL6i4ytke?=
 =?us-ascii?Q?lzVH+fTyuASjUM3MtD7Vl/ohqY8poK/PzRPaT2uObgX4ceSqku3PUU4VT/5B?=
 =?us-ascii?Q?1awZbchBchPwIWiCFoJjs2p7ySwrzsVBJ0GSZLjYe2d5E4ypoAUDAOS4RPey?=
 =?us-ascii?Q?vgKD0jBl2cqHD8db7fvxbsAFauk4aszh7YYZlBBaIYagNEfpW+6r0J5+5EfX?=
 =?us-ascii?Q?pXnirOUsfAMBXdAgCng3y6BX8pN8GKlMyTLRDSMOmSXje4daBVp2vLR/hMeS?=
 =?us-ascii?Q?5jbI/fa78uw9muxkrhRhyd91dI1x+VUm8HuUAGx9GUy3VWjLaJ9ASYBdtT+e?=
 =?us-ascii?Q?ZXo21tk4Txlaemfo4JVCQw26EVVgfkCdYAaFK6wYelotzyPA5XL3smXnZmv8?=
 =?us-ascii?Q?0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AEA38AD144F2F44D9302BCD96D9C33FE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0K5kpy49Ac2eBSaS729xJ2gVl/WJfL5dXAOeIgEKgxEfe6GKqzdf7CchX16wForTDQL1XIxZwlsEJYiN7SKAH7dEN2JvevF4dR7Qf2vmOQgiaUIedp4+JQLY48HloOehfDsfrc77wBUzrWYeUfBf/yk4hy0GgTmi51T1LcIhrspMp3Js81Y78AaG/rbIeggqwBgySIHz/TA5MAqQ3l9/jncZ+o1F+ppP0CY26mz5WU5Cpqiiyt40uSNs8HEiaLJXGi6cONQ4hAYyEt/e1+CTqzZrZxFP0z58Egiv018/qM7Y/ey97rVBWiplu3qIcQu6asm2Fbn7K3bd6C0N1hR2fICpHYV8C+h+z8v4tPsndd59ENhK6fAVpcIqXcAkib0fKej8BoupuU9ugGKnA9+vKsk6ihLIuwVoN5V3UJqtGcITy6vGWkkYqHAh2jt6UDy5bIozVCJX9M7f5FHC2njjVA7LEEkSGJHxv0h0WAb34zMXqW/0GdBLy3QQkG/BBmlp/dC9DrMjf5zJOxDbhX+gbjRMdUe+9g9TW1TGTZQRKkxzE6DYjtcrHDTXzlfWKtqgOn8XIPikJXmOHHTbQ/AzvQFdLO+JJsI14haCACdDwF3R3W+ggT46B7gwe0VIY6Y1TCCJmKgHh1sbBmlC3zwzDyc+BvMLd1wmzbK7voVruEvJ8cGalpXtC6mGJ8cw2u3t8SZ0hWqeDO4QKR7IR1a3na462ZCQEwfHXrq/Vn6G7rcnysw2al4hiOI09Q+S0A6GY6TnLAw6FoggnHG2SC0e3BuDo9Rqv5dNO6824VdQWps=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd1f311-5cb2-4758-9c6d-08db18d117e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 14:44:13.0390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLluoZnLkwxlPc4jeA4DSTmt5hwtxl0HLxOVh4YMkISkr2PlwX0T++NnSDzYb/jHC+s5Tn54+Rl/8wCpaccsAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_10,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270113
X-Proofpoint-GUID: n-DxykbnpBwhyCe49o7SblNC2W4wcaee
X-Proofpoint-ORIG-GUID: n-DxykbnpBwhyCe49o7SblNC2W4wcaee



> On Feb 27, 2023, at 2:35 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/21/23 23:32, Chuck Lever III wrote:
>> Thanks for the broad conversation during this morning's call.
>> We're now using netlink to handle the interactions between the kernel
>> and handshake agents (eg, tlshd), replacing the old listen/poll/
>> accept/close mechanism.
>> Before asking netdev to merge the handshake upcall mechanism, I'd like
>> the netlink protocol to be stable. The protocol is extensible, but
>> because it comprises an API contract between the kernel and user space,
>> we should strive to minimize any significant changes once it has been
>> merged into the kernel.
>> For those who are not familiar with netlink:
>> - A netlink operation is simply a remote procedure call.
>> - An attribute is simply an argument or result data item within a
>>   netlink operation.
>> Aside from the attributes that contain the socket file descriptor and
>> the status of the session, there are three more recent additions that
>> we need to close on.
>> 1. remote-peerid
>> The DONE netlink operation now carries the key serial number of a key
>> that contains the remote peer's identity. The content of that key can
>> be an x.509 certificate or another form of peer identity.
>> I'd like to make this into an attribute that can appear more than once
>> in the DONE reply, since more than one identity can be passed during a
>> handshake negotiation.
>> This information would then be passed back to the kernel consumer who
>> requested the handshake so that it can make security policy decisions
>> based on the remote's identity.
> I'm all for the attribute method; we should keep the number of static (ie=
 non-attribute) content as small as possible to allow for easier protocol u=
pdates in future versions.
>=20
> The multi-identity issue seems to be less pressing, as every implementati=
on I've looked at only supports a single identity.
>=20
> But having only a single identity means that we need to distinguish (at l=
east) three status cases in the DONE call:
> - OK
> - Identity rejected
> - Failure
> As the caller might wish to retry with another identification.

The DONE call now returns an errno status. We can define as many
particular failure modes as we like.


>> 3. keyring
>> The idea is to have a private keyring that the handshake agent and the
>> user requesting the session would use to share certificates, PSKs, and
>> bundles.
>> Hannes suggested passing that keyring's serial to the handshake agent,
>> to have it link that keyring into its own session keyring.
>> It might be a bit more secure if the kernel links that keyring into the
>> handshake agent's session keyring as part of the ACCEPT operation.
> Good point.
> Question, though:
> Session, thread, or process keyring?
> I would opt for the process keyring, as that would match the internal des=
ign of tlshd and would (in theory) allow to have different keyrings for eac=
h ACCEPT
>=20
>> We might also specify the name of a keyring containing other additional
>> shared items, via /etc/tlshd.conf. That's outside the realm of netlink
>> attributes, though.
> Not quite. We could keep the 'keyring' attribute for the netlink interfac=
e, and allow it to be specified by the REQUEST call.
> The kernel part would then link/use that keyring for their internal looku=
p.

If tlshd links in any keyrings that might be mentioned in /etc/tlshd.conf,
I'm not sure the kernel needs to take any action?


> Another issue when dealing with keyrings and keys in general:
> Should we aim for specific types, or should we stay with the generic 'use=
r' type?

I played with using an asymmetric key type for the x509 certificates. The
problem is that the kernel's asymmetric key support wants to parse the
key into a data structure; it doesn't actually save the certificate itself.

We need to preserve the certificate because that is then handed back to
user space to do the handshake. So we are forced to use a key type that
does not adulterate its content.


> Having specific types has the benefit that you don't need to check the ke=
y itself; any key of this type can be used.
> (Which, incidentally, is the model I'm using for NVMe-TLS).
> One has to implement that key-type in kernel-space, though.
> Using the generic 'user' type has the advantage that you don't need to in=
vent your own key type, and consequently don't need to modify the kernel he=
re.
> However, key lookup is quite cumbersome, as you don't know _who_ added th=
at particular key, and so you have to rely on other mechanisms like having =
a specific identity format to figure out if that's a key you can use.
>=20
> Overall I'm very much in favour of having a dedicated key type, but then
> I'm bound to say that.
>=20
> But if we do that, though, it might be good to have a 'keytype' netlink a=
ttribute, too.

--
Chuck Lever



