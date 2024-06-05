Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB217BBF
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Jun 2024 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595398; cv=fail; b=urlk0MeCz4scWlIs0QKgpPQeFz068xXXl3Z89+xSddwZmRxvdd9qgboCoIf+yrk8mNLJhOkepxkERUsjy7EkPhAVfwTAKh7xXfAKF7L7dhxy6DLglqKzPkkFIePP9jAzDkPLP6i7xi0cCf1GGf1A701+OZ9va6ZvY/TICNnL7B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595398; c=relaxed/simple;
	bh=hF8tMy+qLnJVpP5BUvpzBNMR/d3rbIC/RySfAdK3wDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KN36Ve42G3U978decJFNKoITP8OZKAVlrm/aSjpRqD6IXEd0slEQovl/Svz04nAGFkine+iwi2X8cwE3pXz9FeihErWfb6k9MEzxpE/st3DE4eM4Nzg8QTcqA8r4ZingBm49ozgG8SUSSQ0PE2qWzE+gn2FW19nTJiT3FZLErSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aS/h6A8j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w+YkK5Vt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aS/h6A8j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w+YkK5Vt"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Cg6Ad015969;
	Wed, 5 Jun 2024 13:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc : content-id :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=hF8tMy+qLnJVpP5BUvpzBNMR/d3rbIC/RySfAdK3wDw=;
 b=aS/h6A8jQIo8ksagJorAxP9pbYrf0nv81JzXwlUNAl/R5Oc9CoEN99aR6QJPnWUo8WE0
 pLoo4loBZYBMfPgX+CRAb/DajkS0qFzsN0hn4xaE0ENsUeI+KR5eK5FiSSLGU1OqE/pV
 bWnxso0SRCZCQ5nqbhfFiauFikv0opPkh6ewxfLiY0tCoYLm8p6dkY8HF8c7WRuNib2W
 hrkkaNlxVqGmfCuxoezaM0ZVnG2ptO3dlA5nUecJm6E7S2nXw8twRYzpinEnJuPzhkOb
 JkCbPNCwXtBXPj+ExIkpE2Z56PTJ7re1Add/2POI93/EobLWnNe9eh2DSsXMdHDNZLXZ 0A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbtw99rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2024 13:49:48 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 455DEt3v005493;
	Wed, 5 Jun 2024 13:49:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmf0jku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2024 13:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjdv/GapUCxvw2sbUbW/9BU+T8QzKxJh6y9/4nfU6zimA0MaId0n4xhaLkv9tBnC9Mb/mzGOxnZe7X6+eW4U84rVQFAx4Dkz7OMOS2ZXZMYqSnFpJ3pIExj1fhb5LvmTFlGTiNYNxq30w7A5KCGgCX58xFSJVTkPO4hErpf+7av/i1sMF8kjO9s3lxj0XQbxaKW+dDiihT42rMU0idWBrp2dv79q2qU+KJXDrg9SnVKWQQe3F7gkdGa0DlwZ5zjpkVawIAlWShSWcNIhB+wi3F4TbesLDW+NJhIwxv8kUpmoDEo8XF3S6DQ8LY2mlbeSlk+MUfYeA8PqFhmgi3ai5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF8tMy+qLnJVpP5BUvpzBNMR/d3rbIC/RySfAdK3wDw=;
 b=RtvEoTiGq0BdRynLr13/Aa/bKCLiBBcIB0fecydQAjp46wU2NvWPG8YuDDU09IVT1D2o24ylmRDLnAYkDPXdmX+TsY09vc/ZIfBmS1MbpTvQBzSspa/2k0URZbCW1mPVQyqTHKF/qDC/78OXUzidWvr4bB3aZDMPFvT/0HHIsEpAVEK8GWa4Srjvu6jLIhPR/VUccgDV3FWl7xifeFd4wWWyuwVWwzpayNYXw/BPAFrw40CaFCgN8PNuCeb9GXPsBMSPotD4eh5gozUjBTedzT7/hIKnteLEvegNNfFHzBZP/9kiZ2kecaDu4p6am3WCPc4fXP6jRySwQZlM/nVe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF8tMy+qLnJVpP5BUvpzBNMR/d3rbIC/RySfAdK3wDw=;
 b=w+YkK5VtsqN/daqxkU9QDvlM504Dy4eFqipGRnUgRTEL+G6atjVV8WEIOtIGRQlTzFg8SEP7GHhVBOQMIwZw9/XyV9gVfQGlyhoNsZR3AWSp5OIFdlaz8mROKkC+D/k7QQ2yAxNCgRD5wCqhX0lzqU/ltoaleyj2Lu/RiV9r+fk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BY5PR10MB4386.namprd10.prod.outlook.com (2603:10b6:a03:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 13:49:45 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.7633.033; Wed, 5 Jun 2024
 13:49:45 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Olga Kornievskaia <olga.kornievskaia@gmail.com>,
        Olga Kornievskaia
	<kolga@netapp.com>
CC: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: tlshd.conf question
Thread-Topic: tlshd.conf question
Thread-Index: AQHatq7l5IFJnVygAEuJeUIDaPRZF7G5MQcA
Date: Wed, 5 Jun 2024 13:49:45 +0000
Message-ID: <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com>
References: 
 <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
In-Reply-To: 
 <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BY5PR10MB4386:EE_
x-ms-office365-filtering-correlation-id: 5cfc5d52-b155-4d74-7e6f-08dc85665bea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y3Y0UDA4NWlrQ3M1VnloZExEa1lFaW82M3ZRRWpDMVB4dldDM1lYTTRpM1Nw?=
 =?utf-8?B?MllmQ2EvcUdEakNFNEFKZDZQWXNwWjNKa00yUHN5UVg4WkpoaGg4ZU1YUzVn?=
 =?utf-8?B?eUhqajI5Mnl0Ky9Pd1hPelJkTVR4YjFxNEdIU3VhMEk1S3ExNFNFenV4OVZo?=
 =?utf-8?B?NU0rUS9lU2VPdGVZWC9zUU1wU1ozUHpNRDg0NHdObkFLRjlpTzVYZ0s3VEkx?=
 =?utf-8?B?cnVFdDR1dTl3amJORWVUNHBxYW55VnVFcVVIYUxqSHNKK0w5eGxSbVVNQm9T?=
 =?utf-8?B?SzZ0dWl2S3lHUUFJU1hJb2tzSzEyMWh0RWpwRktndklBdmkrd2hrVmRrYkdP?=
 =?utf-8?B?UW9naDZnVmJJRkZ2ZmxtZjYxUjJWM1NSN2FHSS8wWExkVjUwVXNWYytzK3NW?=
 =?utf-8?B?WER2dk96c1JRYmhpWXJNOVBldWlpZURzVC9lNWdBb2pjeHV6c3NnK3ZnUmhw?=
 =?utf-8?B?Q3AzTWZuR2dHMUJtOGt0U1dWeWYyZFl2aVd0MjlQazlRK29CS0ZYcll1MFFj?=
 =?utf-8?B?c1F2dnI1YytqWllzT0VKTnB5bXN3aXF4U0xBU1ZrenNWWWZweTdjVVI3UDkw?=
 =?utf-8?B?MytFWWYzSTBKeXp3ZEp0RkkyWWF4THNZVWdSWmtSV2NlQ3UvY0poSkpvZHFT?=
 =?utf-8?B?MUx4dEtvSEV3bFVqeGVWVHRxS25MOE9NU1BVY0ZPUFVUcFJiYmNBT2V6WERJ?=
 =?utf-8?B?LzBLdHo3UHRTU20yOGhnaktFc2Zsb3hsd25RcTd1cXA1YzBNUzg0N01EUGhY?=
 =?utf-8?B?UXg5WnlLVFBieFRoNUxwVzlKZFU4U3d3dzd4SnM5QWYrRmRlVElXcE5RcTBR?=
 =?utf-8?B?c3JkVC9RcnBrdU5uejJXUjVwV2FmZ0xsYXV1UHgxV0JkditqaWQvaDB0anQ5?=
 =?utf-8?B?MVF1NDlpTndiQVdtdEF4cmRFemV3UVdKSk5Cc0NCRU5HbWhGK0QwVExxbDYv?=
 =?utf-8?B?Wk9SQVhkRTE3NDc4UjN4dkFSb0dZSGt1MGNUUDVRd1RRbWEvUkpzb0ZMbU02?=
 =?utf-8?B?bDlJTFF3bGdpdytWQ2pteE9ISDZFU2k5dWJWQjZUb2Z0N1lCRXRzbWh2eC9V?=
 =?utf-8?B?NzFKaTlXbVlBWTY5elo0OUZXa2Q5UnoxbGRSWUQwL3dFOSt2TTcwdlhZbU1E?=
 =?utf-8?B?bit2Z3pjaWlDU2U2RmpXWEVCNC92eTNId0c3eVlBSHF4R3hkSGUvQmgwNDI1?=
 =?utf-8?B?MDBxYXBLOUtqR25iN0NIdlcwbGdYUFRoMGJKcjZaa0txRk9WcklkWDNxRTU2?=
 =?utf-8?B?SlFHTjdvZi9VRVZ2MXVGZVJGVkVwS1QrOG14WVgxNnJRQVBVU3JBK0FEaFVr?=
 =?utf-8?B?TU9HMk1QU1RMdUtnZ1N2STFzK3p6cVI1T3h1ak42NkJqUDZiVDBBR3BoSXdI?=
 =?utf-8?B?S2dQS2R2RFY1Q1p2akxCMU5La0MySlhTS3ArRm9xYkZNZ09QNlptVDN1TklI?=
 =?utf-8?B?NHFBa1BxWW5hMjQ0ZFlKMU9PUUk1ei9Ob3hxd1ZPbkJvTDJLTGJXdW9GZDNL?=
 =?utf-8?B?Rk91WmQxQTh2NWg4NHN6RWRUOWxKbEE4UDdTbEhKcG02V1R2dlp3cG5GK292?=
 =?utf-8?B?M21LZFFJWU84KzVNYU9rWEpsWlQ1dThkL3FoUGJmOHJnbFEzV0JucFJINWJv?=
 =?utf-8?B?dUF3SHduSElNWUtIeG5LZGRGRmlPWGQvRFNsZlVydEpuaUE3SW01Q2ZvN1pm?=
 =?utf-8?B?dWdTYVc0T2UvT29Xc0ZRZ3R4R1Q2SnJpaWlOVS9XK1VXN3Q0bUJnb1Rkek5B?=
 =?utf-8?B?WS9hcmlaWWlkMWpiS0tUTlpUOWFlL2tCZnE4RVFwZDVzK3hOb0kwZktqZzZG?=
 =?utf-8?Q?TiqRQku7IxV65N7io4vHTKOZhBo/usuJOM1ng=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dTRTblpkWXZoSVFjNDNkRnlFRXhiZ1FqQWtUSXp1akczWFNuUWtESTVURHpO?=
 =?utf-8?B?blpIMkJaQ25RYzBlZlhOZGlRODJnQjFnNUFRNStCZExWUVVMRUZHNzB3b3NJ?=
 =?utf-8?B?Z2h5K2I3NFllcWdiWEdxL2J4K21CUUQ2OXRPZ0IwNitNbXhrbG16WjFPd1J5?=
 =?utf-8?B?TW9FUG5iN2hDak50S3pkMEdHbzBaeldIcU1waXpyakxPM1JDMnczS1hFMzFy?=
 =?utf-8?B?VTlFYlpZNFhpNHI2OEJYaEdwcE9HK0pzLzZld0QyY1ZhM3o4aHdobVhYb1p2?=
 =?utf-8?B?Vnl6VDJjZHBONzZiTVdrbjdqWFVLR0hTbmJDNS9xNGprejdkZHdhckJHTE9y?=
 =?utf-8?B?Ums1RXZWQmlhYm1UZmQvemNSUGRGSkJjWm1aNU1aKzBkMjlEK2JySFdpSENs?=
 =?utf-8?B?ajZ0RUNKbTNtTEoxYThCN1dlMllpMTJ0VTJ6MzVHV1hjbFZEWmFxQjZBQlIx?=
 =?utf-8?B?d0duS05oeGNMK29wWnN5aU12YnBSNDlzTzIycnI2aGtxM2psUHRYVm5jTFFD?=
 =?utf-8?B?WGZRc1FhRm1kSmR3OFlTWkNVWHlaaDZRTlhmU3RVVFpZYWp5dDBtRCtoK1J4?=
 =?utf-8?B?SENmMlRSQXhlTEtPb2lXVGlKMURkVXVWMGo2WEU0a2tXblFxM1g3V3RlSFJM?=
 =?utf-8?B?SDNHc0ZvM1pWbTNOUC9NY1JSS2hFRFdwY1g2YmdpVVdXRUZUTm1ScDhsZTNB?=
 =?utf-8?B?UTFLMWdmUTdTSnkxTGc4VVI1cDNGb0l2aTdkQ1J4bEVtNy9QY3JjZXZ1TitD?=
 =?utf-8?B?T3gyZythV3Y4T2xYNWdPc0I1YWdIVmd1NStsVGxhU2hiU042MWJ0SkpIcVFU?=
 =?utf-8?B?dVNUbzc0RFZZaTA4R1EzbUFISy95WVNUWTVzSWZjL2hQOVJ5S0Z0TmlTU0N0?=
 =?utf-8?B?VmZWekFHSjVUcVUvcmJaQUlGQU9SK3AxaUo2QlArVUc5NHI1MHludkdERFlN?=
 =?utf-8?B?Q0RodW04cldiMUFybUFXUnhtUURXZXJ4NllRWUlOQ21hZ0FLS2xuTzJzV3Q5?=
 =?utf-8?B?L0owUXZ6N2E0ZVkyR3QwVjJsaURTbXBSZ0FGdDQ3NE50V1dKV1NNbzNPZkFH?=
 =?utf-8?B?Q0pwdjZRdm1uL3BkL0wwWng0Y0lCWTl0c3pnV29jMWdBNUVZWFhZc240Ujho?=
 =?utf-8?B?dW81c0NCRHhOMTdQc1hTRWV0VmtsZE1XaCtFWmVJdmVwV2tWY2V4Y1VDeVZp?=
 =?utf-8?B?eXlMTkNJVlE3K0pzdU5welpLSC9NMkdrK2FNZUVoMDFvei84MnlrRDNJbGsv?=
 =?utf-8?B?QVFSNUJOWCt2TmpYNjlocmNpNVF6SCt2aUNNL0NSMmFqazduN2kzb2MrclRM?=
 =?utf-8?B?bEFMa214dkUvKzBRZ0FwVWw3Zk1qc09wR1JFR2lVUmpBNnl6VHZGaGxIaFBz?=
 =?utf-8?B?NGkwN005ZTBXa1NsSmN1K2d4MDg3MmtsSlRMMng2b0tkbEg4VWIvUmVIa3I1?=
 =?utf-8?B?UGZxWllqMVh4N3hDSGp0QXE1RkdzVGxSVDg4QVhUNWVPNVFNVU9LckNLdWJt?=
 =?utf-8?B?NDFxNk9lOHllekdHZHQvTW9mTGtJYmYvMmdQSUcyNlJQRUFxVUF1d1gyejI0?=
 =?utf-8?B?eTYra0gvM003UGpaL0JWSlFvbWZFWDljenFZR2pjRGhKNWJ0aEJpQ3dqNVhT?=
 =?utf-8?B?R3JVSm1iYndQbTkvRmlUTXpXNFNndkxpREFzTHpBYWJTdG9aVEJCbHZDcnpO?=
 =?utf-8?B?TkFXM2VHQ2xvQ1FCZ3RxVE1IWjdVcGNQTkwrK2lnYXdGdGhGM2tKQVAxK21k?=
 =?utf-8?B?bVBkS01TbkpTS1RGdVJYekpCcWpFMTF3Z3p6ZitoWWpHdWNVb0dYcFdrbWtp?=
 =?utf-8?B?TDRxR1ZQZE9UYUUyc3c4UDRiMWpNTWNHMXR6L3F0WGRjZGVBTnFHb0E3M2VW?=
 =?utf-8?B?UCsxeWYwVFdvbkplV2lKYjJHTmhxVVk1aXdrdnRJWGsrSG1OT3FNOENHKzJq?=
 =?utf-8?B?NFZXMHh6NzZUNGQybjV4NDBqMkRuMncwU1RkS1kwVmkxZncwdzBQV1hJOEM4?=
 =?utf-8?B?b2xndGpvd1Z4WHYyOUlScjU5U21zeWd6ZTR4Vlc4NXBHVklOSm85aElmZXVn?=
 =?utf-8?B?UmtvZnRDVEhBNWJOdU4rc3lLYzlsYnFITDhxNU9MR1owampEalhFdTI2clY0?=
 =?utf-8?B?d1JJOG1YZUpYbTVjRUFudTBXRWpzN0RFNkIvc2JOZFdRZFZzN05MeVdGUTF0?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FABEDED6881B743A373886F728EF42B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M7LqfU4PfbPQdbPjqJrX4wDtl+fpYDlg8mgU7EJNOG3iG7jlcZAgapQJbmWlRMH/83B2PgtZZ8MSqZ81fykCe4lbYt86K5OwMJSego+eYYnkFG/cdfKxsuhXCYVqm/dCzZXMxX7VXe4XrmTbTOmh6idpVDZj9u7pIBUvTuwZvW8vId+TDDSS/z/3BNIh4ldiWDpl2GycCqWNX/2/iUmfKAJUyoEYedvnFrXRhUY3vzL0GQF9w0tpxu7MKjg3YEldQ9sHDpYPqDT/k9eZ02q9LQ0rY7VWsWIwM5jw7aFN3whirZ5z3YX5ivqLQXD4BlAkrqIS6w6WFpKGxicGQHuhiv25rgsiQmu1LJa8KBg5cOnauXKP+EaWEvyu1Tq8Rk5hHdL5yfFSQcQv3HfFriMEMCBZLJbHlSFWmKH6p/VYvXqww2as56TgrQQPKOssc88/5OtNBhhr4yE+wkK6dwZy+ZCl0fcL8KEalbeomI9CNGshcsGMspaWHEfbXC2CsFEWpwZxaHhyCOe9iVXHXJGSfIGKxUGX/SJ4hGnWySlA+w6hR1IG8GUH1ZoPxmatfanB8j0HDferENDhegZHlTFE/xDj1jL0rBJ924Co7H5E1XA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfc5d52-b155-4d74-7e6f-08dc85665bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 13:49:45.4472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8ZQux/REGn5io+laRsQ8HJudeCz+KgvKQ1fazuv6xVRBKlg+aur6+bGadyMtkFR3yDPhVVp1L+ZuheWXO4Qmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4386
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050105
X-Proofpoint-GUID: qyNU4Bq14GQa_J71xFRYhpdjGzTgxbo-
X-Proofpoint-ORIG-GUID: qyNU4Bq14GQa_J71xFRYhpdjGzTgxbo-

WyBSZWRpcmVjdGluZyB0byBnbWFpbC9uZXRhcHAgYWRkcmVzc2VzIF0NCg0KTWF5YmUgPGFnbG9A
dW1pY2guZWR1PiBpcyBub3Qgc3Vic2NyaWJlZCB0byBrZGV2b3BzQC4uLj8NCg0KDQo+IE9uIEp1
biA0LCAyMDI0LCBhdCAyOjQx4oCvUE0sIE9sZ2EgS29ybmlldnNrYWlhIDxhZ2xvQHVtaWNoLmVk
dT4gd3JvdGU6DQo+IA0KPiBIaSBDaHVjaywNCj4gDQo+IFNob3VsZCAicGF0aG5hbWVzIiBpbiB0
aGUgImF1dGhlbnRpY2F0aW9uIiBzZWN0aW9uIGlnbm9yZSBhbnkgc3BhY2VzDQo+IHRoYXQgbWln
aHQgYmUgcHJlc2VudCBpbiB0aGUgc2FtZSBsaW5lIGFmdGVyIHRoZSBuYW1lIGJlIGlnbm9yZWQ/
DQo+IA0KPiBJdCB0b29rIG1lIGJ5IHN1cnByaXNlIHRoYXQgdGhleSB3ZXJlbid0IGFuZCBpdCB0
b29rIG1lIHRvbyBsb25nIHRvDQo+IHJlYWxpc2UgdGhhdCBJIGhhZDoNCj4gIng1MDkuY2VydGlm
aWNhdGU9L3Jvb3Qvc2VydmVyLmNydCAiIGFuZCBub3QNCj4gIng1MDkuY2VydGlmaWNhdGU9L3Jv
b3Qvc2VydmVyLmNydCIgaW4gbXkgY29uZmlnLg0KDQpBZ3JlZWQsIHRoYXQncyBzdXJwcmlzaW5n
IGJlaGF2aW9yLiB0bHNoZCB1c2VzIGEgcG9wdWxhcg0KbGlicmFyeSB0byBwYXJzZSBpdHMgY29u
ZmlnIGZpbGUuLi4gbWF5YmUgdGhlcmUncyBhbiBvcHRpb24NCnRvIHRoZSBsaWJyYXJ5IEFQSSB0
aGF0IGNhbiBnZXQgaXQgdG8gYmVoYXZlIGJldHRlci4NCg0KSSB3b3VsZCBsaWtlIHRvIGJlIGFi
bGUgdG8gc3VwcG9ydCBibGFua3MgaW5zaWRlIG9mIHBhdGgNCm5hbWVzLCBidXQgSSdtIG5vdCBz
dXJlIGhvdyB0aGF0IHdvdWxkIHdvcmsuDQoNCkFueXdheSwgY2FuIHlvdSBvcGVuIGFuIGlzc3Vl
IHRyYWNrZXIgdGlja2V0IGZvciB0aGlzPw0KDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
