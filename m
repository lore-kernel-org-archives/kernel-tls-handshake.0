Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C318E743
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Jan 2025 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737401018; cv=fail; b=hRdDCqrjm/w+IDBfbGM4sJge7n+6Ssoyh+SrQHKOpG5w2tb3TJgpAJezfym/FKzrqxG4THOQlQxetam5TrM/Ike6JVrjR+Vit9XxIHYfX3jQOLdTFfWmoAhTaPmUmnQqzpqS2Wtd3+KycWUly4j92KXPY4a49Sksnn7d3lYUhZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737401018; c=relaxed/simple;
	bh=VIUQlaY5iUTFdYIgc4CIcUR6E7kPLlg0hHdDxlviFiI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WVCvgU4YFP6PWYKpdTIfc/+FfzonxG+eLLy0yo3UpldR75E+ERY1JBeguLTek3f6G6OdEIykSftsVCjOQp18Boic/PgVCCa4O/qEnGD1WicWY49UPY/pXgGXUuPNiSc8MJxaRnfwZ+xanGY2Ab5xe4e0QATfipowdJtmcb9Hn4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ly5BaQZb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FkjCWT+Z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ly5BaQZb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FkjCWT+Z"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGMrtR007831;
	Mon, 20 Jan 2025 19:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=UVyUWg6Q7eGWhFlAX3V72EpQQP0GS31xXLJlLb4x5NQ=; b=
	ly5BaQZbQX+mLbtsy9m/diAEROFpwc07dCbpRqFUuO4rfEOZO4uKe//bBz+aFOm4
	rnRsSVvBgVONTm3CSp9B45ykK5maVPn9ddrwfXsRsbQvgHhfAwJLBidJdVnfgQKM
	Vo55GpwFl2PK7JLWVxUjVTuTjlLTGmG2A130M0Q8wJqbHXGI+ZMIIX+0+jKn4Ow5
	vTk5XnRYe8YSgQYtoqsmhq+0wqg3Z3CHsohZ82ISBwxc2zZWvU5SLCwoDD8EQ0au
	0NiTdZd3KMpNYZAwqv/XapaIkHkU9viVs54KgggD/QWbGXLqlCAoLsq6VC38dP4T
	LheV2qsVQUSdUbCapcr8sw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485qkv9j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 19:23:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50KJCMqc005437;
	Mon, 20 Jan 2025 19:23:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 449193dnbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 19:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psrc7AaA8YqxNzyoq8YO21FnalwFz/vSzomeExNmaqlMrrD8hTWiv4RtEZqD24CiFQsBD6cLTsoh3uppC0huFyrYcHQAgr/m4WN7eqjDVS13//ERBn4m1FvMlJ6C+S+HnAKoLjGe6pV5MFrhQkYw2WDEvp31PAQR+41Ud2WTeLZV00NrcHNaHmhk6/2anrnmpp5+1f5l2BOgLeaArueYdcAKNb/gJW8D0giFYFGy4vC5PZ2FiJbgy0V4hlZBLB7IxVhl6LvH++f5RlXbchs+j3JFIbX2K0LYqCRU1hAdcPJD7NJqai6U+56cp7JRbgBuaoMYHIq8Bm9fvy5fefuZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVyUWg6Q7eGWhFlAX3V72EpQQP0GS31xXLJlLb4x5NQ=;
 b=k2CN3JkKLBvkaT6aqTOMbe4xLRF2OK8ZG7bgyrobem5PZlKletTof2R1pJKMbht9kZBgurXv/JPq/qpgk3W6eEG5CnwqRUCw6WtmwOzxy3j6rOtUM93zEvVb/j2wlLW6vYnoiG3Xn8XVXFq7FMkEFJUn+HL8xiEIO9UrAgF2/PQ4olQQRV6Ij0gB66mmuCJW3jVEYvzWUaV9PvWe1dAtzDUw+vQNi7fFmhOToo/7pEAHJd86P9JZcFUmQGDii+rC6JwWLZo15Dol5DOz0e1g7mMYicDkQQNMReX4e5p9G0nELEMHspr5rpt2Pc8YgTQBxpZJjivdmZglLcjNcCmkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVyUWg6Q7eGWhFlAX3V72EpQQP0GS31xXLJlLb4x5NQ=;
 b=FkjCWT+Zg1V6NCyGM0MKG/kL4ARtIQKtdYs9YcmisNRlbxLG0YEy7oLXXSsPdXQUfe2waeBS7E3n2Tzf98iPAdUBRqD9ZpzrBv770z5nqPucvNViAYuH09ckoR/WrYwA/R1zFdws/iGoLWZJvvUoxaM7kOhnY7fsoail1R4NPQg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB6400.namprd10.prod.outlook.com (2603:10b6:a03:44c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 19:23:30 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 19:23:30 +0000
Message-ID: <0cc9b264-416c-48f2-8f37-41189c64582b@oracle.com>
Date: Mon, 20 Jan 2025 14:23:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: NFSv4 TLS
To: Steve Sears <sjs@hammerspace.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <PH0PR13MB493959B3B8870BFD51EAA835A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
 <c4459bfc-965d-48b4-bf28-bd9f65c7657c@oracle.com>
 <PH0PR13MB493985A7FF8BAA0B3E2A1106A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <PH0PR13MB493985A7FF8BAA0B3E2A1106A5E72@PH0PR13MB4939.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:610:b3::30) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|SJ0PR10MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c14930-ace9-4d5c-3d87-08dd3987ec66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czJhWDUxMVFrQzNnSFhIV1UxTFhvb0J5eGtrVVBUSHVhd2JlTDJLQ3NiTlRt?=
 =?utf-8?B?bTlILzBxT1hxOUt1ZHArNFN1V3YwcWZ5MWRhOGtIcEYrSG8xYnhVSnZpb05B?=
 =?utf-8?B?TEQzM1kxVTRnQnNHU2ZEeFlXbGl3aGRYaE9yYzUrVlp5V2x0bW9TYVJoRzQv?=
 =?utf-8?B?N3B0SkUxcE11MzJiR0Z0VUxxcDcyYk8yTWhwRWJSN3hMcEx6cW1Mc2xWUU1R?=
 =?utf-8?B?MC9jUXRFYmRXeUI5MkJUazkyVTBYU3YzR1pPbXZTU05TQ2VOYytEa1g3NUpB?=
 =?utf-8?B?WHczMkJxT0w5blV0WXBrZ2ZwWG9kVnlhbU00aWFab2ZlVEZKci84eVhpZlBX?=
 =?utf-8?B?UTR6TzFxUTNkYVlEK3l5Nm9qcHl5WlRGSUQyb2dOUDU5Mmg3dUF3VllNUnB4?=
 =?utf-8?B?THJ1RjhkKzlHeEhFcG5xcDNSYkhoazJjOXdmbHJWMzA2ZHFwbDZ2Kzl6TjJq?=
 =?utf-8?B?SVIwS1dNQjdwUk1yZnZycFBualJFY3pkeFcyUm1DWTZMWHIxMnhMaEQrK0Vp?=
 =?utf-8?B?d3FHWmN2SS81SGwweitaWUhhdlFybWlYVHlmM2dJR0dybnlSUWg4N2ZRNjRI?=
 =?utf-8?B?TkwwNndLSjhweGtVc1VWUURMaElITml1ckdSSktoeDJydW90cWdJNGZCYldD?=
 =?utf-8?B?NGdwa2FTRHMzYVRvU3ZTNnlOMVVYMjduWnVpMUpsQ2c3SWVpcm95ODlzWHgw?=
 =?utf-8?B?WW5CZ3cxbzFNQ2NrZnJ6cTdEYkxreC9PSVhTKzdFbTlkUHVIUWpvaDZyNVZR?=
 =?utf-8?B?dDNnclEvV1FoUExSZWlzMmYvTzZHd0FVcmNicm5lNjEzZW5rQ0E5aW9vVHBk?=
 =?utf-8?B?aUV4cVc0UFBaQ2IvWDRVWlVRQmdvbXBrYmZIQlpnbkNmZ25LQndTU1dNRThp?=
 =?utf-8?B?WExPUU9ZZ1M1SEJ4KzBDSTZlVVVnL2s0ak03WUJ6bHlxS3k2Y0REd3NiSEpT?=
 =?utf-8?B?ZTlyUWlUSVB0LzVVVG9kcmtNLzdIK3V1SGR0RU9rTjQ4RXFsa3lpRDZPZHdP?=
 =?utf-8?B?bVlSRm1KblJtU2pBNlBYMERIc3FJdWlpMzdRdVExdWZTbW44KzNJQ2JmcGhX?=
 =?utf-8?B?c1hIWjI0ZlBGR1FOWEsxNmhncVpyV0tmcGc5SWwwKzFZb2JXUVg3bFk3eUc5?=
 =?utf-8?B?TVNrcmUrcm5wWStibTlVTnhWQUh4SmlqTWdGV0F6ekVKc0ZQR1c4ZE1uWTd0?=
 =?utf-8?B?Wkh6emhpQ1FMVUF4U3ZQTW9hRDhkSGFZcWx1VlN2bFlnaWtJVlF4dW4xQ3VV?=
 =?utf-8?B?Qk9wZlovdlR0UHhrQ3VZMWM3VFJTWWVSZEV5dGVNVFFoaktKQXZIMUFaNDVD?=
 =?utf-8?B?dEFJUjh6NVp1aUhlT3lFd3JNeUM5RWtOOE54TkVnRmE2WHJMejZ3NjJkd0FZ?=
 =?utf-8?B?OVRUcGlsTldVMmFlU2pxM0RWVUFmKzhmOVEvcVlWUE8xMFdGYWVEOWhESlZx?=
 =?utf-8?B?ZDBuZS8wQ3ZFNUxVQTNwQzRTeXRHMnlZOGlsUk1XdFhkUFEvQXIxYnRmcFZv?=
 =?utf-8?B?Tml0VUdudkRIcHJaN2VsUHdDL1pudXlZZHJBSmkya2dkOUplVE9La0tqTDFK?=
 =?utf-8?B?MUdlUE5wdmkvTGxod1d1UmxYZldlaVN2ZXdGLzM0dVFsQm9aRHlPTkY2cjFy?=
 =?utf-8?B?aFJmZlhrZTFnNy9LeUVHUFZ5Q1EvZDJLUWVNQTNmNlducTZGcXdIc0tBSVlH?=
 =?utf-8?B?T1ExcmRyN2llbmovZ0lKbHBycmZLb1I0UjRZWUxsajhIOGhGMWVhMEhCWER3?=
 =?utf-8?B?NlFKNGVLWDUwYnFFVWxrcks5TUlVYlB2UXJHOURDWC9qL1BXbWUzaW82ckZM?=
 =?utf-8?Q?nN8/T6PS+rtqlFD349RqxKVMLRb6gWprJBmms=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXg3UER1c2VYZTg0TDJxcHBRdFZWdmEzaTRZSzczQmVWY2JNeFJsK0ovZkdz?=
 =?utf-8?B?K1hUN2ZtMGpkamlIajJFMCtuWG8zd2J6a1Vod0ZLZ25SblhlaVNib0U3R1Nv?=
 =?utf-8?B?bGoxckFrY0tBcVBWOCtZNXZqa3UwUnhmdEx1OEJPbDN0Vmx2YlRhWkZQMnZU?=
 =?utf-8?B?b3dMbmVjaE5OZ2ZSd3o4M1BtTUt6Z09LYjIxbCtFSldOaTFXTHdoWStBU3du?=
 =?utf-8?B?ajVRcHppcnU0S09uaGpIT0EyQ2tjUVp5UFN5dWtwb0xBa2hhc0NuZG8wUWVF?=
 =?utf-8?B?aVFNNDRHWS8xUTIyUnV5UE1OZEhiRWlyL2lYUHB0U3VHY0IwdG04NTZGSTBH?=
 =?utf-8?B?SjVUeXBFdldoUTkvQnFpY2M0TUdLNXVlY1VNelJSVnF3TEltREJHSGtDKzdS?=
 =?utf-8?B?N0tEUWdneW12Yzd2YUlpbWlvb0w1N0dmRGkyRENkUSt2WU9DK2x3c0xOUVd0?=
 =?utf-8?B?STFxN1NPS28wTlVNZmtOclF1elRNNm5pZCs0dzFFQlVMWWNTTkNWUXk4V3Nh?=
 =?utf-8?B?bzZBNFZkbUhWTHVuSUNJckY1Um8wVmtSTUZ0VU9sM2gvVkNwTy9Ic20ydkJ5?=
 =?utf-8?B?RGNhMFJaWGhSSzN1WWZoaURBdk4yVk1mNVFBTTVuVWtXMnBzYVZqQ21tK3Bv?=
 =?utf-8?B?QXZnSFowTktPSWVyK2J6ZGd1YVRxY2U4QTUvVWRZNWw4ZmNYSGt6SVNFdzhT?=
 =?utf-8?B?U28zZlhtLzlmcnI4L3JkTldFcVpyQVFNZVpYdHBmMmJTU0RlMkFNWUwralh5?=
 =?utf-8?B?SWVQOGdiNGIvenc0YXFMU1VCWHl2bFptYjZqeGJuT1BaQnF4Z3JZZm41Mm5Z?=
 =?utf-8?B?ZkJPRXRoU3FMU253RGZBUnBYRElHRFVWOTZqcGtFOS9jbTVKQTdaN01oWG9H?=
 =?utf-8?B?MDM3a2RlKzRIVDBqNmpNRlhCV0xVbUY4OUVFWmZQdmZKSnQ2eXptWTN4bFky?=
 =?utf-8?B?RCs5Qm9md1lhWjRRQ25BZVhsb1lyVFN4dUozNk5BUmI0enZnbnI0Ym1MTTNN?=
 =?utf-8?B?L2tFZEU1OFdFZEJ0WnIzekp0NTNsbmU1NXkrRTZRY1FwVWVPVFhCV2F1YUFV?=
 =?utf-8?B?TWZnQWlSYUtSNlZHYkQwc1dNeEJUbDQ3ZTN3SWZacmlkS1JXRHVjQkcwcTZr?=
 =?utf-8?B?STU3UGt6aU1FSEREWWJ3NWJMenhXUEVUeEpRc2gwSFFDbTNiTWhIOHFlRXV1?=
 =?utf-8?B?Z3g4OXhPVkRZbnVvTEdBNjJLQ3J0SnFhTzEvWlFGUkR2MDg2YjJYamoyaDV5?=
 =?utf-8?B?NjE0alpwc1hKNjNRcGMzMFVrNUdNbFFUdW5yKzVlNUxwNWZ0Z0ZqUUh4Tk5w?=
 =?utf-8?B?VnA5cCtsREI2SDBCemhHM1h5MWorcWg1U2k4cGtsSzZSMTUwbis5cU92aVZT?=
 =?utf-8?B?Z0JIbmZ5QlRVY09HcHo3eGhSS0FWSWxNckFOSUkzczdYVWFxdHlHZEdBUjNn?=
 =?utf-8?B?YmVmZEZtZ3NTczNiREliNXh4UlpqcDA3dW5FSWxLcDNIeTZ0VGQyeGdYa0xt?=
 =?utf-8?B?R0xOUjZUQWI2bm1PS01PZlBGYUE5N0w4OStMWXdpNjg0YnY2c1R3VVl6dnJv?=
 =?utf-8?B?VW5YN2FVdHFiT3N0QWVKSFJhNzJVTThyUHRvVHM1WXNGK3BLOWhHWnFGeFpj?=
 =?utf-8?B?UGlwRFRnT3hLcHcvSDRpaUhSZWpIYTdhMDczTUNRM29kNFJublY5WlUxVjdt?=
 =?utf-8?B?V0R5aGZaV1B6bUpab2Fic0w1V2JGQ0JYSXVQSEVyYjRqeWxHNlJqNGQ4REV3?=
 =?utf-8?B?QVljREhSblRXaFhuSjlqaWtpUFZ1eUJTS2NNNE9DSzYvSW92V29DOGlpdWZX?=
 =?utf-8?B?SW9zRThQNzM1TEVwRFR5TTNvdEN3d2s5dGVqR1hKbWhvT1ZNa0M2c1pWdnFB?=
 =?utf-8?B?WkFJWHp6VHlzZkZNWFFxaS9UbUZsMDR3RS9HNHpHblUvM1krOXppM1hRMTJQ?=
 =?utf-8?B?VGxuMitzcVNHZTBDR0t4SDRyajVHb1ZUOEsvYTB0cTBCUlBIRm1tN05uL0hC?=
 =?utf-8?B?aktvbWRMQ2xMSU1hNDdoK2I4NEtVT3RRUk84ckpNUHFvcHQyYmlPdjJwdEZw?=
 =?utf-8?B?ZXZERnFXWEc5cFA2ak93K051Uk9GRkU4bGQzYTdReFpSaGdpNkxmN0xFZlRM?=
 =?utf-8?B?aDUwZWFSK3BvYWJWOFh3bk5NY0R1NW9Ic0Z3Sm5XWWRmbHRKYnBKTjU3Qi96?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L28RCGY4GXlQd2w+VTiVrUfGEQ6h/FfAtUGku6nnkdk8cvphbe1Q3KU76Fa8dalI46C9xh+9HLiHhMXs4GEZ5Gu+owvSy4vYqFPtJYduIUaoY2urb6f4NpmrynMWrKq2BrQ0Jqt6Mf8hK4HgzE66lzVh3x+Gp613ccszEYnJF58d5G6owSCFPk0pSxV79bjFRkJOFtiGaU3GDV5GIzSiJvbVjxLljkdvQlYb8p7T28Vz1D5kMNzdZJRIFHjKbR/xCZfFr+k37sonirgGwoleaq5zsYDLlS8UK438VWKy4tld8tkMTJFasIgB4sfXtPE2GEjVaq7jENYU1oQEo+imI65gLCELQVMVpkaXTrEvzVmPb3aoh6JHxKEIUifZMgU8OXNaNzPbwzzUZfIXx8Gq/Kh6ajdCMKnS//hneiK2I1+ydhOIUdFZT3G65CubPf/yLPuN4N4ODfmE3I9g4k4KdWHcf9xysebb5AhaHsDsLIy4jdTuILxPhvRDwTWBy50EKAgWglpPTVRmBPKQgQGZKfcwQQ3OPvPMCL+8JSH6xy65WEIyw/0dorbCPc4IexCNzjl3HsaA9SavUZpF18fr7hKsezg4AlBLAIlKh+PMiNA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c14930-ace9-4d5c-3d87-08dd3987ec66
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 19:23:30.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57TN79bfGDNlbz8NkPm8wxo7859sDgnygg0DYyjsknr579CoZlPg99U5AVxxFkdwFZIQryzSO/fzzUIp6cs/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_05,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501200158
X-Proofpoint-ORIG-GUID: Yeg4vuhRzpyZqdazvFeMjs1g8cWJjsw5
X-Proofpoint-GUID: Yeg4vuhRzpyZqdazvFeMjs1g8cWJjsw5

On 1/20/25 2:17 PM, Steve Sears wrote:
> Thanks, that's useful.
> 
> Do you have the script you use to create the bake-a-thon certs that you 
> could share with me? Based on your response I suspect there's something 
> about the way I create them that could be the issue I'm seeing. I'll 
> experiment with it and see if I can hit on the right combo.

#!/bin/bash

if [ "$#" -ne 1 ]; then
   echo "make_certs <name of csr file>"
   exit 1
fi

cd /root/bat-ca

# client
/usr/bin/openssl x509 -req \
	-in /export/csrs/$1.csr \
	-passin file:mypass.enc \
	-CA intermediate/certs/ca-chain-bundle.cert.pem \
	-CAkey intermediate/private/intermediate.cakey.pem \
	-out /export/certs/$1.client.cert.pem \
	-CAcreateserial \
	-days 365 -sha256 -extfile client_cert_ext.cnf
/usr/bin/chmod a-w /export/certs/$1.client.cert.pem

# server
/usr/bin/openssl x509 -req \
	-in /export/csrs/$1.csr \
	-passin file:mypass.enc \
	-CA intermediate/certs/ca-chain-bundle.cert.pem \
	-CAkey intermediate/private/intermediate.cakey.pem \
	-out /export/certs/$1.server.cert.pem \
	-CAcreateserial \
	-copy_extensions copyall \
	-days 365 -sha256 -extfile server_cert_ext.cnf
/usr/bin/chmod a-w /export/certs/$1.server.cert.pem

exit 0

-- 
Chuck Lever
