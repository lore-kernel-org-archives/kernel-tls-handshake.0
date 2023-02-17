Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D15692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:26:15 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7hw16001514;
	Fri, 17 Feb 2023 12:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=oM3G9XOd/Y+9Lbp+uwNqkp0nUoyj9vjJXBDBig5ziSA=;
 b=W6DEawL7YK55eY925VOxjcdG9rPCfrwq2KLkuVVTr46DIW56QDZLpBUrsIk0k/1x0Y1z
 lx1ZJLxMVTo5ke2Mkp02VE0np2RJ5SSu08TpiMGFPnvN/CGbJTtsDLm8lenTDFcHPBkF
 sjPQcwaeploVIfWJVOkI3TUorHKwG8KjkTQG8BsEhZFT+XTOgCNnZxyc3N2JrxXk+9ZE
 YEYHNLbqGiE6hGFlHfWrZxtY0sxR2DcjOnoZiTsxU71M5CNL+lRJ+ekWyj7Yk9R0OMAu
 3aDQ3s3cDn7QM3v86piwZb2JkbegT51HapIxN2/tRuHvZZYnBlwfCp+ph6F4yymx/k1B Lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1ednne4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:26:14 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HBZIE3014131;
	Fri, 17 Feb 2023 12:26:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f9raw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 12:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeQSuDHdnlZMHkrmNds+5YbS513fxiaWnAjxnKX3kEe3uOmN4nPI82CrftE8Pr/dQsuDjG/GtxpLiSkArE/IL9E4hSHSUaZfxoJ4v7Br8ypbOT86pT4uUZHaQ90OeRZuaO5GPdV+18Yd301ABulcmI8RJNgoUU8AF59iFghNrtBerYcPVwZsurbRAod1g10/b/ZJByalsrHSdfmCp4IO/3+QWZ5Q8mhBeqLU6eSyPeWmKuOU+r+/YhCyIS61m+ymdu2qU1uzQS61MohBqb3Cg2/RU9H2f5+IlOAcouVcg5tgDvkCk7MEcvwMqE5BdaGMsdi9SJ2D6tCo5+P2LzMVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM3G9XOd/Y+9Lbp+uwNqkp0nUoyj9vjJXBDBig5ziSA=;
 b=hNkwr/XnJ3OX3Cd3WdiVrNMhCDBThk+q140GlGgMmyq3d3PrwvZeX44wsDuzfSNtaWIroeHdkeEkRo88ZNFwyslUDGVVQE1AH93COolDlGZ50IKcj0OSPfFHnxOkSk09VZHgcfupC/GIiaY3Fi9/fWu71Tu6nQPr283xL3b+Om4lC/xnlULO69NM8JBRSD8e/2cOdMxzpLL0x2ceDk96IGHkRX444C1IRoGBD1/5BAKfFtp2Aou4UCF3+FnmWOk+BrNaRky9M1AquLn4pFoHMAFPtYvZSk44oVW0eyZCxo7yifLpjAL7+8jp4ZpAtLyfNUHKHvHEd09/WqPqs6/B8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM3G9XOd/Y+9Lbp+uwNqkp0nUoyj9vjJXBDBig5ziSA=;
 b=DM5mdxxqAcKCg9+tU5v9VTZv+hvyIN97rASotn6QMakO806yEYyNWYEr+wBW0hZ2bobG+XeoSHe30ZUznonFoo8qoYmt89ooIS1BpwazhJdqHFQRSC/zB9EpQgNEqnuEVYbBE+QgSe9t/HYamth/rIqP5goY0I4x0w3NrXcMkFo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM4PR10MB6157.namprd10.prod.outlook.com (2603:10b6:8:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 12:26:06 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%8]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 12:26:06 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Hannes Reinecke <hare@suse.de>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>
Subject: Re: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Topic: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Thread-Index: AQHZQsNvcqwDi8CCoUGJ+FCjN2no0K7TCOcAgAAFF4CAAAJ+AA==
Date: Fri, 17 Feb 2023 12:26:06 +0000
Message-ID: <5FB819A0-65F0-4DA0-A748-3380D88F97F5@oracle.com>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-2-hare@suse.de>
 <DAF4B451-D056-4309-BDA5-5C20D38A3121@oracle.com>
 <c206b986-0989-6b09-e7a3-24147803ee37@suse.de>
In-Reply-To: <c206b986-0989-6b09-e7a3-24147803ee37@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DM4PR10MB6157:EE_
x-ms-office365-filtering-correlation-id: 27581a6b-b3c5-4ce0-d473-08db10e224be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BSNnF7H7mbWFxHaLdpsqEkzLSFfBhfHOjDL0pMUAaAQg95Bdyt/5uTRDGwsivPdJnAs4IbAAiHYTl/7r8A/+U8sOVYJHM3r24FH88opai8PvuFiFIGiQKb/IUARwMS7fWkabHdY/OU5jUiKhUOScVnmQxTz0cufqXF1rj1/S2hxvirVn8LKu0yzPDsUK2Au5oVYoMFAfjcYVyFrT2t00l7gaQyUnQpz71Q5CCJ66W9d2d/TUeNJJUYibaBLGnDNuc89DA38xd2PqLO+y68+84/KKdA0fJiJ1BvLc/ube8gh5tt5lQ8Zijydx7zkjglS4h90+YZt3zlueN5+MTeGwbKr4DWGbebAofEspk7mW1QlwqZDHlCYfJ7OWs7PmLc8s2dPkW0ykQudb0Go+jFm6/m11q5xGg1ghb25lgCkUrY92fN5+OY3xvi8Te0jy1m5gmf6z5d5HUapUbyCOjP8Ph2PlVS8e2Ybldylm6FJO+C07yUeg8L/XtIDrsXxegCAr5rHNqzKZdVwZXjoV+V1TTP6der/GVP3HCZ0zUkg+D/GTBYzBi7VtHK6mSaLry8faS9QV4ctCxeLrrO5YW4k8hGHCUZ+pkBxfdA0/UizvYaxKhmC+EvMmcxoxgL36997mvTwI6kvoM9gNmUmQfqwF3lzBR9hIBm+dGDvilzkxyZzOTUGK7npdBmyDPYb7FWSvT8K0VXA20tRHrtAbaI0xBO1vKoZ+jEyqlvoAXM3zKQI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(38070700005)(38100700002)(6486002)(2906002)(36756003)(71200400001)(186003)(26005)(86362001)(6506007)(53546011)(6512007)(2616005)(122000001)(478600001)(66556008)(83380400001)(8936002)(41300700001)(6916009)(5660300002)(66946007)(66476007)(4326008)(8676002)(64756008)(66446008)(33656002)(91956017)(76116006)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nELnWzTxVMtc0AqrtFRpmTBiqc1rnJhm4WS/JOQCaXAOOHgiukpJRaB4+4o3?=
 =?us-ascii?Q?E3tnmT8ITL1pBRAFsUeKIaZdmPB5YaiZi4C1YucZOhDMwCpj71CiWwG1L9dm?=
 =?us-ascii?Q?44rvPu2hiVdAc+eg7tczWh46zasOR+Oo/OrJSGJceUTciIEXJef5idAi1751?=
 =?us-ascii?Q?SjObTrkv+YRBvmqa1T01ElG/p+gzXJlm7JqTccPje370IAUlT0d52/wxp+ah?=
 =?us-ascii?Q?hmW0rRHseGRufqS33RiKUn4F4yWVvZAZNQvhSZpsSGEq3jQQ0CPEWKQByQOQ?=
 =?us-ascii?Q?9ViqoOnh+JOHq7Jb736kqqUvemh1YaStivht6IN+JFM24NNGA3vfU3nEwEZM?=
 =?us-ascii?Q?2Z2XxeNj1Je/NA0ldf5UhBhUWO9l4su8HHyBzN520H6M/3DCGh6ZfVKeDG9a?=
 =?us-ascii?Q?eaWjv33cnac6Rri/s+Gd/2WInCANT5O17kYJ2CjLojpZi7dAG+Li+TB2xccS?=
 =?us-ascii?Q?Q1mQpdWfgyqNy5tqUyknjIQsesJUVh8hcjQDmixugtWKd7RxFlb6l3zw/x82?=
 =?us-ascii?Q?07EBy+HaarIWi3Nx70bikfW2Qo11ozGvU91gAu8bKRImw5gY0plNXA3Z0Ofw?=
 =?us-ascii?Q?96K2AcKrPj7svC5DirfpO0gcxxZLn8oHyzvkpOfAfBA47CKKSWCeYXaOnvf6?=
 =?us-ascii?Q?87Dr8IhOrET3QqG22N7JIWgbhGHFDCRlEe/lUz1vGqJNO1P0gguqBQj9RCwL?=
 =?us-ascii?Q?pwthGQJUGJqPMTdlgWP6wrb+0iXVorR2YhDzTZvm+Rc34bawUhveFl+zEKhg?=
 =?us-ascii?Q?dLZtgTGMU4ZHUony/xQGwyFY2vY2YP9pE6GamBF6ORaB0HsdTTWoI9gYE0GI?=
 =?us-ascii?Q?iXDm88ymKyD3MlLpzXHxh0syMmzbzi9SUQ2n7hHLqL1DAxqH3F1qn8JDWDB1?=
 =?us-ascii?Q?60+7ZQXT8IyW1l9T4PDjkQ9b5S4Ay0ar4UoBslRKOGW+Cy54qTS446A5+RnL?=
 =?us-ascii?Q?IyevB9ER4C/1r83S5d9iKbxb2fosEFP+Y9O+CRenXcbDWFX7j4HmyrmELkqJ?=
 =?us-ascii?Q?T1gpxTH+zdfTGDQ9yG8nVR0DjpWjC0aUeP1UIjdg2uIjEUeMiCY8tHAdVnAr?=
 =?us-ascii?Q?n5Ds3he0sb5XafJPYNjAQ5I0tynDA58gd1zPyK68R33r46ako4+P2jE4trdJ?=
 =?us-ascii?Q?MlBOji1dfW+hT4bcJpE4dzlj+g49FNC3h7tRxRkoVhqH8o5Afq24t5nbw6qs?=
 =?us-ascii?Q?d8KuHqCKdoDUAzxFtDkXcT/LlBnM6X2qzzOySuh6xVmASlR7MNNYFegEXFl3?=
 =?us-ascii?Q?UbvIoXzr+2hfzs3uIT30vGD4/Xox5CVHXeOxnAVblAvnG/E9ZZymWxqaU3IG?=
 =?us-ascii?Q?mJlrkZTVi76UCi7/L6pWSKk/FImfAjlmnhRLxBf0oUZgEU3a0D6FYmhzHNs6?=
 =?us-ascii?Q?lJXheGsERlpa6A8ayeHppCjgNOfx9b4VoXhT5rEjo5Tri3XNDyiMvZW52qAU?=
 =?us-ascii?Q?VVWYm+7cDF2Cck76qCxjNz4nkObT+Le6XUYEWJUZv/2ZqNQ/IoZf4vl5+14R?=
 =?us-ascii?Q?FKXLMtomxvEMrRllD7dmgti6opfv4js6Lc+B0Ufifw0ybsst4ujPjiwfhs2W?=
 =?us-ascii?Q?psnCANo6OjTIlVm7grYxQ8Oyd4bPu9CMbvbY5NdhY5STJGlk5C+/9uuqOht4?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <864F49BDB2C1574FA2212980B02B65A3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GCHdceodryPgXzj38gZCOj7Sb6KffkTZpNUodWfcKVA1FfSTKNEVFzAfVwwLKaSXTPXOvQmVBWTlUIL/EjrWij1IpI+2MTFTUPRQ/WgYy7LwoM5EFfsyvyU4bQzNIfviwdrIVZf63OTa5GPJWlokeLLNjqLvFrKp6pMATjxSVmKk26LFkMWspxNYIUVnxWUdkUAyxFN5G5DkK194f3dK8HNf3pJ7XKozltlOv6/ieYlzZw2cujfWViUIN4x4dDD4WnV6pmzirLs0NpVTdAjMuM7RBjWZEzrGqKsO0HXnex0JUEGJ3NEnB7CQDL6Q+OpXOwSLPOZS59CNgLvadBhzYnPcefymhh/m8ITOo3pwcJww9R5f+OSE+zvuQOwV3G6UPHc4ZRz/u95v+Xp0H/HQpLlNXwkVaHPEz7Z7zEk4pfXkDFndskHCTnoClWr/Y76shI2RLzVBg+DQEOtKyBy1byMNK4zN/8IpdeoQivRjsBjaI71P/1fULToKE0eTQd6IIxgCS9vNcz1wVZNb4fqxOOW6NXopbFHYhSH5JOLF3LN8WHgX7+23aD8HkXwFVoPyAGQXIU/iAw9wKV+31D4DoybDQUZeCFEu2tUOX8PYSTW+m3mjw9qrC2d6ZhyT6z94ScxRuW7pqWq2ZSMoFtcSI0xctxSY9Q/qaFjjh6ppJy12hZxzF5akr3ZjX29M3qmwdjYWzyq7pyQTJ8xhZI3nRzqw9KRKlxdWMGnYjpGW8E2JUGRa7j7Ep9N5xI5ihbL8jZFSrfHwJMSVcnSMKmkbQa8jMoRu9QU+cWArRkWi/9U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27581a6b-b3c5-4ce0-d473-08db10e224be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:26:06.8040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MG6dVn7DakwLMgx5jznTyMIWvMTtxr38GgIx6x9OBQkgGm76h74AftEd0+wI77ZydVMb8/JXSOUopGh3Zuvk9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170111
X-Proofpoint-GUID: FBo34RIaHGt5k9MFEpfpGlmEqGkO4bxV
X-Proofpoint-ORIG-GUID: FBo34RIaHGt5k9MFEpfpGlmEqGkO4bxV



> On Feb 17, 2023, at 7:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>=20
> On 2/17/23 12:58, Chuck Lever III wrote:
>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>=20
>>> Add a 'timeout' netlink attribute to the 'request' netlink
>>> message to allow the kernel to communicate an internal timeout
>>> to userspace.
>> Can you describe the use caae?
>> I'm not clear on why we need to parametrize the handshake
>> timeout. Why would it need to be changed? Why would, say,
>> a PSK handshake need a different timeout than x.509? And,
>> why doesn't a timeout wait in the API consumer work just
>> as well?
>> Last we left this, you were using the timeout to work
>> around some socket reference counting issues. I think we
>> need to address those first.
> The problem is that we have have a timeout on the kernel side, and anothe=
r timeout on the userland side.
> This is primarily an issue for the client, as the kernel code
> needs to continue _eventually_, otherwise the connection will
> stall.
> So we do need a timeout for the client to ensure forward progress.
> Hence the kernel client needs a timeout to eventually declare the handsha=
ke non-functional and either abort or retry without TLS.
>=20
> But as the kernel now has a timeout, that would need to be transported
> to userland to tell the application to stop trying after a certain time.
> Which is what this parameter does.
>=20
> The alternative would be to kill the application directly from the kernel=
 (or send some other signal), but that's really nasty and then we would nee=
d to worry about cleanup effects. Hence I'd rather not.

Actually IMO this is a cleaner overall approach. The cleanup
here would be the same as if the handshake agent crashed, and
that needs to work properly. It also needs to work if the
user driving the application handshake request is signaled
(system shutting down, user hit ^C, etc).


> This approach has the benefit that the kernel can wait slightly longer th=
an the timeout sent to userspace (in my code I've added two seconds), givin=
g userspace enough time to send a completion message to the kernel.
> With that we can be sure that userspace has given up control of the socke=
t, and we remain the sole owner.
> Without such a message it's always tricky to figure out _who_ has control=
 over the socket, leading to all sorts of reference counting issues.

It's not difficult. Kill the handshake agent, and that closes
the user space fd. The kernel now has control of the socket.


--
Chuck Lever



