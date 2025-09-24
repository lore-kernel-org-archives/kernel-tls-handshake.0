Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5510FD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758672322; cv=fail; b=lHbd02+mPhQ8Nc5C8OQUNCwUURETUbxNCZLfwwV6qJboAs21GUpu9eZevzmSfmHmmS9Zr9sc1i881OxlC1AriSgZOZk/Q87d/G+bKhO1o9UB0UPxfEKtUjX2Qj3PXbp2z5gBCabzlkewgRSR3SzM24lwMW3m0mFBB8o299EwMnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758672322; c=relaxed/simple;
	bh=KgGJvYWmVbdUrQblfvg7XHWyCDH2CNJzTAGKNExrHVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hmi7jpBg+dvojmYjuxTGIRd5jt8BwOOLSITi2512nAsg/Adpq49V99ajgA3LdWOsP1FkUDTvwWt7eL0HpdieS/mN37fm14B1gY0NqSv+1msTA6Rrg7yue6vVDmzo0EXzYwzMfrvtapZAk90zTJc5fH4O1En+b/9OkqsQGaeVRTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qjc9vOws; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FhfqzaNx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qjc9vOws";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FhfqzaNx"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLcO7W025588;
	Wed, 24 Sep 2025 00:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=txJEEw4QL6Das5XZjOHUZsHpwNzKfufI+x9bDWitX9M=; b=
	Qjc9vOws/QvD7Qb1SPU0AF8T8InJ12V0Sx7/sruu6Mk7eXaYIGiYCt2qfKd1EzBD
	ivqdghba/P3gXf7Ay4h4iyu3tB4+YaT/ITDVCspXM4qBrnoBiFaZm8goRd4QP7/y
	761uSjQpIOLctlX2ShdXJWRpLKsbW+3Q9jmU47VePAeFEXgJN4eIk0ZrV0ov7bFU
	zxTcZm27zDxmYPM91hoPJG4ST04e86PtmMrr25IFTOR6HUgy3XD4ZfDSKgHap8VU
	iJoQbgf+CZ4eicRnHEArZlQgd2UvSY7wplSa977jIqgI+WiX4bkVMtWyb9b4UjeF
	6/CpuvXBDqIq97+yCCo3ug==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k23dtd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 00:05:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLg4eV013276;
	Wed, 24 Sep 2025 00:05:17 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012041.outbound.protection.outlook.com [40.107.200.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8x7kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 00:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOGHJXReX2ANp4SXW4GvuCFgImgjsfaD8a+mTATGgTEkxj0l84saKMWdd/VYLOWyDDAi/vIuIdtOv/Smmy3HUztaH49xdmn/G8zxOtChD1RR3Zv4A2CTM1quz+l6fRGAD/CaaD8yJ6Ed+c+CtIGYgXONePU5jnmInKvyCSiRX+lSvvDu5dljtN7g30/Fx0SL5uHrMTXC0NFEXnpx9pLNz+Gbc4i8X2fmuGhBNILzWq4DJHRaXboHa4/AOPGi2bK30WVG5PCjgRbbUtalUltqlL+iRkDq7LeOAe8etK1A2XuM0lpPSc5nBiiktubHnuSXKU372FrhNIjAFheI88ZlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txJEEw4QL6Das5XZjOHUZsHpwNzKfufI+x9bDWitX9M=;
 b=zDC/RWx95KJcP4vohceM382F1AC1An1arCQAwk7rKBiZGUq6e425cbtyC24WwE9nXBsvfIeVKUdlXQISX944aicee65gAdcQVXoF0aRgO/e7f4hha2luYHv0Qovp/hyhdlBQbDflR/4MsDbi9eg8WIQ6tjV1CNnLxyW34nKNhYtF03suOY4nDCSsAXsylnNwFhJGeEtLySPMJ9EJr849m9T4GTijESmrg01Udb67blohIYPVgp4ISkLHug88rtT0/+uRoCxExMGdLhT5pO8lheeudGTuaWzoP7QXcqdwaNuYrBDo+Yu1l7EmR4QW+o+NOj0z5SnxcjoW7J5gqbA6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txJEEw4QL6Das5XZjOHUZsHpwNzKfufI+x9bDWitX9M=;
 b=FhfqzaNxLdPdSSye6rlnVwVKuLLaTp16cf8N82CejOZv+lRVVH4ueh4phk7G7j2oLieKwp7JlYq55IMpPv+ZlcP509KJjLXqICOXd+34iD0McZSqeyF4VVVHhGwTu8bONyOyPIxYW2R991zfelVqjINXHAaWrBm2TQUmvlmsLVA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB7418.namprd10.prod.outlook.com (2603:10b6:208:445::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 00:05:14 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 00:05:14 +0000
Message-ID: <875cb069-d762-454a-b01e-26344a16050e@oracle.com>
Date: Tue, 23 Sep 2025 20:05:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Xin Long <lucien.xin@gmail.com>
Cc: Benjamin Coddington <bcodding@redhat.com>,
        kernel-tls-handshake@lists.linux.dev
References: <20250922220710.1255102-1-cel@kernel.org>
 <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
 <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com>
 <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
 <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com>
 <CADvbK_cVUHwx16Q_uQAoae5rLRkTZSZenQjgiP=3Nn-LUkUCAg@mail.gmail.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <CADvbK_cVUHwx16Q_uQAoae5rLRkTZSZenQjgiP=3Nn-LUkUCAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:610:e7::7) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: ada5cca8-8ab6-4b1e-4ace-08ddfafe0968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU9WeHQyYWtSOEdkUk01Z3VncDRpMGNJaExONk5OdTZ3L2g5SUJnT1BKNW4v?=
 =?utf-8?B?eVRCbjR2Yy8vRVVmek85ZmRUZG5pZ1FiaW1keDN2ajYyOW94S0R1TVhGZExn?=
 =?utf-8?B?bVoyNFBqblIxS2FSbWFjaWlKd0FhRWdZNG5kcE1wZTlabENoQTJQRG9nQlF1?=
 =?utf-8?B?QWs1dzgwbFhpc0ZlSzk4Z1I0ZGNRVFdZeHY1YWRxZ2kvWS9HejhGUWZOM2VR?=
 =?utf-8?B?WndKVnhlcXZwN2pya1l6OE1wOVBTbVYrVEhha2I2bzJRcVN6Z0cvZUhPRURI?=
 =?utf-8?B?UFRrRStkV3ZWeEwzRlZjMkZlVGtEY3VTRzRDdEUzTkV4aWRWc2prTno0dTgy?=
 =?utf-8?B?ZUdydUpJV25wNHF1UEdYYkpBdGtHZDg5MHlqWDRrNlpXR05yNklXeWFSUitS?=
 =?utf-8?B?TEk0RkJkM0xDNDdnMUV2SHFKWlBYV1pPUHZUdXZwN0QyTXV3RUpSbEhsVzEx?=
 =?utf-8?B?V2NNREl6Z3hDTFRxVTdlV3owMDNlU1BKdVFISU9Dalp3cjh1Z3htL2ptcUhF?=
 =?utf-8?B?OVJYbVZkTlV6M0ZvcnRxM1QwT1R1dEhBSGVUclhyWTdraDkyTnJ6RTM5TjBZ?=
 =?utf-8?B?U2lRLzFlZXo2UUQ0Q2VTcmJVVWpTd0Y4VCtQWERpZXNPVW9STXYvN1VmWG10?=
 =?utf-8?B?UUpKQ2x1M1FUZXpHbUxoZkxpTDR0Y2dNL3FNeFVITjM0ZDhLNldRbWFvWVI1?=
 =?utf-8?B?ZndWajFSRU9SUWMvaTgwbWY2cy8yeUdHZFdKWGpNRGtUdWQremRDdkk2M2Mw?=
 =?utf-8?B?cGJOVUdyVm5OY2Fqd1JYZWVFb2k3dUlKN1hoNjVlaGFHUlk3ZG9obTFuOUMv?=
 =?utf-8?B?YmJpbmovMEtmTzk5VmljdDdKdDVwcXhmRXN4ZnJZLzJFZnozRmNTdXVqZ3VN?=
 =?utf-8?B?bldjeXFRWXgvSU11Mk5aaGV0LzFOR2hWZE1tNXFVbTIrbitxbUYvTi9JcUtk?=
 =?utf-8?B?ellocU15dHJtNU1FRmRjMkNJMXluTTE0QTJGdlNYYkVFNmxPd2ZvWm95dnRB?=
 =?utf-8?B?NGsvUDBnSzU4TjB1QlE1WkJnWVFsTG85V2pIVE9hYXRMYmR0dXBld1lxU3Iw?=
 =?utf-8?B?aHYvSC91V1k2RVd3amd6SXk0dWFwNVpKVHJTUysrQ0srYlVCWnRQVnJPRnlu?=
 =?utf-8?B?Vm9hOGR5YzZldktxbnk2UVFkUU1EOWxQTENJaWg0My8yNGd1Qm9WeEdBV1Zv?=
 =?utf-8?B?K2J5bjljWC9KNEFCL3ZxWFRUTGJUa3lja1psQVlMS2xJdzhXK1hEK3ZTQ2pU?=
 =?utf-8?B?OHBsVm95SHpsYW9VbkRTQ2hpcTZzeUZwSkhqUmk0cGFzYk56cWJDT0prU1lQ?=
 =?utf-8?B?NXRsY0prWFdHRmZXeHdoNk9jWDJlTUcxaTBYTHg1WVhhZjV6V0hIL1ErV3RM?=
 =?utf-8?B?U2tJaHQxMElNY0VxdkdFajdXSi9zZzRVM1djcHB5SFRNcG5PWEpOYmpxcXhM?=
 =?utf-8?B?aEJIdGpobXlOSEE4Tzl1dFk2dDN5R210ZEZRTWZjNlhpTGpBbTE2SVlkYTNu?=
 =?utf-8?B?Z2k0UW13WmpnditSUGE5dW1mZlpwQU4vV2VYODl3SnpseFArMDg5dGxUQjk1?=
 =?utf-8?B?VkZFSEswQlF1L3NSb0sxT1MzU0ZqcE5iQWNyc2RINStDS0dzSW1wYndkRGZO?=
 =?utf-8?B?OUpHTTlVdXhkRzNTckhXUU5uK2tCYWd2bVBRS3h3Y0ZVMmVFV1lvR3NSdEd2?=
 =?utf-8?B?SlNCVUwyWmdIOGh1SWxMWnJmSHhtNDFDZ015K2dpajBIb0ovL3hxQ0wrQ0Nw?=
 =?utf-8?B?bFIvT1JVWGZZR1RleURGdjZZdGh4ZHFVdGtRNXJzL2p2aDhhRDBZekNmc2xk?=
 =?utf-8?B?OTFOY1ZDOC8xbW9KemVaVkNiUGZIRFRzQ1dzU1VTd1RjYmpWSEhTWVpVRjhH?=
 =?utf-8?B?bUFhWm5ydVQ2eWtURkRwWm5CV1dVMXpJcU9GakVWTGRrRFlTb2NrMWIwWUlN?=
 =?utf-8?Q?bO2rtnjvB9k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzYraWk2djM4OTRHOUdrQkhkaUlVdmJXeEVUa3dLMUxtdExMSmp2cXloQVdK?=
 =?utf-8?B?NGRRdUhycTZzZ3dSM2hMYTRuNkZKZkhGVi84dUlrZW9FSXJVb0FyNjgydzhJ?=
 =?utf-8?B?YkZhLzBWMFY3V0dIR3p1cTV2WUx1bnlTNExuK2x6bHZobnJQcis0WmhQaElZ?=
 =?utf-8?B?WUhua3pWSzg0c09ON2xvYnlwcFNNRENpcUswd05uNjJWUXphcVArdjNvM1NR?=
 =?utf-8?B?SGwycGhBME9qcUVvNDFRRVMvM1Q2Wi9kVGRzRjVqdmNPbm9yYkpicVVwUnJa?=
 =?utf-8?B?M3A1QWpKUHg0SksxR2NsdWRuU2s0cDJwMnVLakJ0ckM1YmpqY0lYYUFwcVNR?=
 =?utf-8?B?UGMyQ2xrR2tMc0hlZEZTWUcranNqYUtqcGZDQWdXMVgweFN2MnpONlJUS2ow?=
 =?utf-8?B?K25lT2w4MlM1NHRNRGZzMjdOZ2x4Y0FiTitRZFhEQ1pNYVZERS83WThyemdm?=
 =?utf-8?B?MjhDdXZpSkI5ZW1CYWsvUVo2Tk5UMXRMS1JYNld4b25JRzNnMjVrOVJVMzJv?=
 =?utf-8?B?VERzeGhyUGFNa21ncGNzbFRFOHRudWR5MDJ1WnN1WFZjNEFadnpHRHo2L1g4?=
 =?utf-8?B?UUpqNzVyTVRRczlXb1UzYzVDU0VlYXZLY1RlUEJCR3JOSE9vSTFJRzAxcVFN?=
 =?utf-8?B?aGVEVFoyK0pkUFg3WDRoa0N3T2E5eWFxdFplOFUzaHFKazg5Tk13N3hPckwr?=
 =?utf-8?B?aXJLdzlFSklzYzhLc2NJY05TOThUT0I4a1ZBWmhzOFhlZGR5KzcxcnVFRElk?=
 =?utf-8?B?OVlwbVMweERLa0ZySHJ6T0VXZE0wWVpWWU9WS2FCMnlBenpkQ04wYzJvSDAr?=
 =?utf-8?B?RzdwZ1FxQ21wUjBTY2RZZ24xQ2VIWkhQdkZmNXpPOTRuSWptaHhnbG9sWXhF?=
 =?utf-8?B?VFpzdndqMWg5Uzk2UUNFT2t2TGR0YmVmTSsvNkpYUGxpZ0pOcmlma25PWmFF?=
 =?utf-8?B?TEZaQnRXeFBqb3dhZXdUbVZRdmE1ZmJRNGlzSkEvV3pmNHU0emlJTUJLM2gz?=
 =?utf-8?B?bWZtWEEveDh4QXR5WmMxbmN4YTc5YTFiekNVNDBzYnBPR3hmZ2tQYmZsdDla?=
 =?utf-8?B?MlI4dUtEeXJ0UlBEMld1RjY5SUYxd0h5eUxxRlZQSDlmbGhPWWp3T242amxp?=
 =?utf-8?B?bW5Dd2FDcjBNVExFVURPK1RwMlhBRmYrcEplME9CSm0rcjVsc3I1UjlET1A3?=
 =?utf-8?B?a2JrcER1elNwclVib0RWc3oyUm83WlFqT2Z0aFlDS2Z6Y3RkaUltLzhteVBl?=
 =?utf-8?B?QXhZejJ2Y1NFaVdrNU5LTmJhbmJZTmdQcEl5MGNwdHlVajA1SFVad1BHeis3?=
 =?utf-8?B?UHJKZDdQdE9QVUxoTHUxRHFsdTV5Nm1VOTQ0ekczS2l5YWZKSHRwNVdqM3lJ?=
 =?utf-8?B?SWptOERnQUR6b1BDRjAwRHY2cDg4REJLM1V6aVdqV0RQZnVBLzl4eGNPUm1t?=
 =?utf-8?B?amtyeHdJTzBWbVVzWTJuNFpyeWlpYUNYR090M0VOeW9mWWo4Ym1NTmtJNDla?=
 =?utf-8?B?SjRYVWZ6QVdKdUYyTWVvTUd5K1IxV1hMeEZFWVVLNVI0SzM3bW43YVMvVDND?=
 =?utf-8?B?VDF1OUx1VVBCYTF5akU3SWRpc1BFbXNOTnFFZnA3ZmRxTjBjL202SWJlR3E4?=
 =?utf-8?B?RFZad1U3VEkyelFyVTk4dmFNcEdVQlE0QmJ0Nk9nOVFiSDFFWHhTaU1xOUJX?=
 =?utf-8?B?eW5jTitkTFErSURGdStEUFhQVW5wMk4ra0d4Rkt2eHI4TWVPc3U4VktRV0Jk?=
 =?utf-8?B?eGJOd21TbW1Jdm1WaHo4czk4MERIRlFwcWpSLzZDME94T3BXQXhoV2ZnOERT?=
 =?utf-8?B?L05yY1BLQ2drQzZnWUk2WURyZXhicmpBdXRnS0J0bk1rREtITmRCUDZYVS9U?=
 =?utf-8?B?dVk3WXA0TVZFQ0FPWGtBTzdGd3lLNS83bmEvdVFqOGpOQzIxUVJvSlJMMmxo?=
 =?utf-8?B?NVhubmNxZjZsa0ZSbS9qWVA2WGJZZHVGZlU3OTZsWVJkcVJ3Z2NWOTVxVHlZ?=
 =?utf-8?B?UXp5cUpTVGd1Tlp5TngwY01OZEZmbWJzdmNjQXFoZCtqNjRwbjhtRGpMMkRo?=
 =?utf-8?B?UWZzRXJSTzJWRzdyUkIwMlZoNXdyZjcwZVBBbVdGT2trTzRVaFFYMHFTdTA4?=
 =?utf-8?Q?xhoajhJWwsP1vxaFuG3lhGeqh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K0xhILM8KxPekPurcAQKyqqmsl5jypJO/HTWDnrQePjEUGNKvuraHBap+rQU7W76v8IyZh+l9oeTL3kakgIKJH3ZxK+UtV9UUGpN7he59GhrjAFrrzcESiVuEJf6J3GdMiuHWEKlxqM0qTxt8xk2LGcPWLWqsOwUhEY3ZvuHTocaF+DXXtmlM9TNnYbHtfoYiqSGUlVxagFIGP2CcYyOVTOzibSDNlx3WVP6dD2eZbCbdkHLYEFKzSGFSBnBjmutB0OKTtIVzxRP08Gxi+E53ZNeUbqDHHnT8cN45bllCcdBoNaJdvCOtuJvuk+6tJ0nEz1iYXekvh1etl8fNx4uN/RRDk7Svx+y+M4LoPLHvNfxCJd8pSetu5UyfBUeViCL1W+IQD4iJdxfyQ9zwLmpq8Ue0WvxUKgbjosH71ag19Ak1ZfqWHBkm8oieudnFZKDMczythXqYnSTR3ygwAtkiHlgk0VEAl0v9pmiSmaxMOhIlHz8Rq3OTP9em92TNs9TA8r8pBJvxkptbgcx7ceW1n88keIHVbfig/11ndZeVMaQqxibc9vizgvqlOz7VXn5j9jH8+zXqfsO7DwMZdMD3uATF0PrEF4v1PXfS2e2PX0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada5cca8-8ab6-4b1e-4ace-08ddfafe0968
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 00:05:14.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkQprkboTs/rRDCIqyWSarJ4UDW4KVdD6iS/yCVzZFQs2kWmeWkhhbgAWUcs3+Z9Cz4Ux1OxVLrztOOSw4pVJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7418
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230217
X-Authority-Analysis: v=2.4 cv=C5XpyRP+ c=1 sm=1 tr=0 ts=68d335be b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=BCTD4L9I9o-L-VXmXqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12085
X-Proofpoint-GUID: ZJMXJ6GnRF5hzCdWHU1cb7C7GSQJ6HeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNiBTYWx0ZWRfXx10kZ/EdMy0s
 wRgV4qzwhYoW57t52UBzR+r2RXs5S1obGJjvVwYg3Y6moXwe7Og96mSTzIeJUV7Cd3I6TLvDhG3
 iF7EjXi9NpVScy65/LalP/riFbIQlpAJy99zKS33tXkUOXuk45rqWgZqjp5fgEPjgsDcN5hi43O
 4clmYOV8z66wGnNqDA6GdBUrIyTMGx1kFoM1VyNQ5U4rIjiT1oG3DhS+8YNz7tuWgoZsqD3e2sV
 /Z6J7dOLnPkFM9NGBs0aeKSDneumjqUrw9Z54phZtTvoIAKdzXZQISsPTRRxE4UWAqfeRFA6BLa
 q2vxyZtY4+JEG27qkTMD0S4s+iUxHnC5arsKezDSlmzqlNgihioYPjs6hqjH0ZrP6DD+Cibt4yL
 XJMWrmnCQVBJq06W+TJsLEahlYKBYQ==
X-Proofpoint-ORIG-GUID: ZJMXJ6GnRF5hzCdWHU1cb7C7GSQJ6HeW

On 9/23/25 5:00 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 7:05 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 9/23/25 3:41 PM, Xin Long wrote:
>>> On Tue, Sep 23, 2025 at 5:02 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>
>>>> On 9/23/25 1:27 PM, Xin Long wrote:
>>>>> On Tue, Sep 23, 2025 at 3:18 PM Chuck Lever <chuck.lever@oracle.com> wrote:
>>>>>>
>>>>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
>>>>>>> From: Chuck Lever <chuck.lever@oracle.com>
>>>>>>>
>>>>>>> Static analysis tools have noticed that
>>>>>>> tlshd_quic_serverhello_handshake() expects its helper functions to
>>>>>>> return errno values, but two of them return GNUTLS_E_* values in
>>>>>>> most cases. Convert those functions to always return errno values
>>>>>>> or zero (on success).
>>>>>>>
>>>>>>> Cc: Xin Long <lucien.xin@gmail.com>
>>>>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
>>>>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>>>>>>> ---
>>>>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
>>>>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>>>>>
>>>>>> Xin -
>>>>>>
>>>>>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
>>>>>> Callers expect an errno, but internally the utility functions set that
>>>>>> field to a GNUTLS_E_ value.
>>>>>>
>>>>>> Can you apply this patch, fix up quic.c as well, and then test both and
>>>>>> post the fixes here?
>>>>>>
>>>>> Sure.
>>>>>
>>>>> But conn->errcode is used to pass the err to parms->session_status.
>>>>> What does parms->session_status expect? errno or GNUTLS_E_ value?
>>>>
>>>> session_status contains a positive errno or zero.
>>>>
>>>>
>>>>> looking at tlshd_start_tls_handshake():
>>>>>                 /* Any errors here should default to blocking access: */
>>>>>                 parms->session_status = EACCES; <---
>>>>>                 switch (ret) {
>>>>>                 case GNUTLS_E_CERTIFICATE_ERROR:
>>>>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
>>>>>                         tlshd_log_cert_verification_error(session);
>>>>>                         break;
>>>>>                 case -ETIMEDOUT:
>>>>>                         tlshd_log_gnutls_error(ret);
>>>>>                         parms->session_status = -ret; <----
>>>>>         parms->session_status = tlshd_initialize_ktls(session);
>>>>>
>>>>> It also seems mixed, no?
>>>>
>>>> The -ETIMEDOUT arm sets session_status to -ret. ret always contains the
>>>> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
>>>>
>>>> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
>>>> gnutls to kernel"). Passing -ETIMEDOUT directly to
>>>> tlshd_log_gnutls_error() does seem a little bogus.
>>>>
>>>
>>> Got it. I'm trying to align the QUIC err process with tls13 code.
>>>
>>> - tlshd_tls13_client_x509_handshake()
>>> - tlshd_tls13_client_psk_handshake()
>>>
>>> - tlshd_tls13_server_x509_handshake()
>>> - tlshd_tls13_server_psk_handshake()
>>>
>>> It seems to me that: When gnutls_xxx() returns errs in these functions,
>>> it only logs them, and doesn't set any value to parms->session_status,
>>> but sets it until tlshd_start_tls_handshake().
>>>
>>> So my suggestion is: not touch these functions for QUIC code:
>>>
>>> - tlshd_quic_client_set_x509_session()
>>> - tlshd_quic_client_set_psk_session()
>>>
>>> - tlshd_quic_server_set_x509_session()
>>> - tlshd_quic_server_set_psk_session()
>>>
>>> but change their callers tlshd_quic_client/serverhello_handshake():
>>>
>>> @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
>>> tlshd_handshake_parms *parms)
>>>                 ret = -EINVAL;
>>>                 tlshd_log_debug("Unrecognized auth mode (%d)",
>>> parms->auth_mode);
>>>         }
>>> -       if (ret) {
>>> -               conn->errcode = -ret;
>>> -               goto out;
>>> +       if (!ret) {
>>
>>    if (ret == GNUTLS_E_SUCCESSS) {
>>
>> is preferred.
>>
>>
>>> +               tlshd_quic_start_handshake(conn);
>>> +               parms->session_status = conn->errcode;
>>>         }
>>> -
>>> -       tlshd_quic_start_handshake(conn);
>>> -out:
>>> -       parms->session_status = conn->errcode;
>>>         tlshd_quic_conn_destroy(conn);
>>
>> We usually express the return code checking as
>>
>>    do something
>>    if (error) {
>>       error flow
>>    }
>>
>> That's why the goto is in there. But I'll leave it up to you in
>> the quic code.
>>
>>
>>> and then in tlshd_quic_start_handshake(), keep the code setting
>>> conn->errcode = errno, but set conn->errcode = EACCES for all
>>> GNUTLS_E_ places.
>>>
>>> What do you think?
>>
>> I think that still mixes the error return values for the internal
>> functions?
>>
>> The reason I noticed this is I'm trying to add proper Doxygen
>> comments in here. The internal functions need to be consistent about
>> returning either only GNUTLS_E or errno. The documenting comments
>> can't say "returns GNUTLS_E, negative errno, or zero", for example.
>>
> I see, how about if I do this in all GNUTLS_E returned functions?
> 
> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> index db5db31..0ee1157 100644
> --- a/src/tlshd/server.c
> +++ b/src/tlshd/server.c
> @@ -538,7 +538,7 @@ err:
>         tlshd_x509_server_put_privkey();
>         tlshd_x509_server_put_certs();
>         tlshd_log_gnutls_error(ret);
> -       return ret;
> +       return ret ? -EACCES : 0;
>  }
> 
> This way, we will not need to change their callers.

IMHO we want to distinguish between a temporary memory allocation
failure, invalid input, and a permanent access failure.


-- 
Chuck Lever
