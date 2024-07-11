Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD614B95A
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Jul 2024 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720710100; cv=fail; b=SfLQT3kbXal9UCnwqpKLSPzKpYB+rE3U4+KU7U2AUwE/MAP9Iksn0/ufeUlgdbrsy9xw2qCa6XV+eRw1Yl16NBWZZzQ7BNTChmjdryHrGnb/E+M6UEE4xcyWaIJRV1rjlNkyIiaoq38VGkJFzailz5A0phbKICTe2AP09LjCDrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720710100; c=relaxed/simple;
	bh=0JrVntMDwxXAbRzBwEajphOvGswZ1I1xz5JxdIE9xTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=scZqwB9TmqoU/eFTpD2YamxwGtGGXYAvxOQwosj5NvyOzxkVWiwE/ii8Ukox6zsAEFKietOEugiCGQyZcr9dm2T6OGOUzA8Slg9ntao5xOPdQn7Fl9ex+SXBuN2wD35+kCUpxZ/PvsUV7I0GXn9rFKjJSa9R1fmcdudv8ed/LLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ohPUL4e9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p34sAyJn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ohPUL4e9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p34sAyJn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BEtXQY006246;
	Thu, 11 Jul 2024 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=corp-2023-11-20; bh=0JrVntMDwxXAbRzBwEajphOvGswZ1I1xz5JxdIE9x
	TM=; b=ohPUL4e9Ls1N20Ao3w+9XJc/skH6CCxUOr/+pucKyW4DUvH8e4xN2PkSB
	aBw+hJfKKiJjiHO/VTvFPFlwDkcxO+vlj+WwsNNEB8ueoIRmfjArsjwFThArQix3
	ke5H/je3gYQjxM1WCFmogtvyvtGRyliOzGqN27rByZKVpY38/SdGgyL2V3iSUgE/
	bpZ6H01GXH8EYITMx3OgSnX59RI5lgfLlDNPMJJG+9y21JmLFFLHCaELCfB76Fl+
	jkD0f9dK1xRi/ws9FikdX9B1q429vihoiGUB8d7gEFJLTYPYpztLzKiSA4EwRpuC
	MakieP8yg3G6zSa5V3EngdjviDrZA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406xfssvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 15:01:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46BEwaMw022604;
	Thu, 11 Jul 2024 15:01:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv2kqta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 15:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoKgqVrRvpkV/9Yzk3xzy2j9FldCAubdBO2OLbDlAsI+VG6TBdkxZPXKwd2ZX/etKFkM3ptsiDokW+yh+9eLreU2dfabudzKoL3PcsPZa5K6pyUz1DaUXRmWKrFrJ5ND/yKMLZguSEZa1fsF7zsxe4ba+iSYtXp+fyKolPzkC8WXwRNn+BMQ4qqvEBNvbGEUzM4xVUSGxmRb3C/BPEiMpLiD9hYZSBjn2LIX66dBGYLYTXSQP5uk4hMmXpkeL97XagBFIrKlAokvc7LDMwEbYrEolVEaQSERK9TEv8HHLG8sBbvBH6qLhtFuKQr3ABCuk2OxTzlKFnB0ROLHsFFJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JrVntMDwxXAbRzBwEajphOvGswZ1I1xz5JxdIE9xTM=;
 b=tvExeFW38Wn1ZMiHcPgGk239+BPzmG+P3H6j0T1cwIs4wbKk4j+vJOe7+/rMSijxi/PS4t5+y3EKFNYklYaYIkCvnyBFSKkWxjU8MO760ksdyvWb4hLlROmm/JwbS0ZeiipO24P5GJ+3Plo0CL/eQGmzECq7Xf6sqLcPOR9rAZFIf/WISUN463Nbsx75R6+LRozb7LYT2pcmyznv8tBz4LCfH67sbeWc9MK6RGm0S7iEpr3bGoi5HVrXxLySDnJav8UUhTaY+T1sR+x3zni5r2P05ZtyBIF6xFjjC+eV11THyCb5w1EofFzGbwRB1wJXD2i+XcXvITizxzWSm1XwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JrVntMDwxXAbRzBwEajphOvGswZ1I1xz5JxdIE9xTM=;
 b=p34sAyJnXz/JpkuIJF/coiKHUaLU1id48gzr96dhEz8+6o8SCMkkSYFO54uGOsZ6TFk9ezR8jRxG12ddfyhLpVXfMTUL9J5/28WbeUDJ4FcpL6jPRvM+GTQLMqNTpvNMsLrAi2VdxBCbUXs+ykY51w0KzNGH2+ygx9pqtmIUPEw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB6193.namprd10.prod.outlook.com (2603:10b6:208:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 15:01:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 15:01:32 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
CC: Steve Dickson <SteveD@redhat.com>
Subject: Re: patch review for upstream ktls-utils
Thread-Topic: patch review for upstream ktls-utils
Thread-Index: AQHa0V3nlsPf38iL9Uyi2p0TWjDKXrHxo6YA
Date: Thu, 11 Jul 2024 15:01:32 +0000
Message-ID: <51FCC68D-03C0-4B96-BAD7-9248D6D80405@oracle.com>
References: <EDDA7FA4-FEDF-4687-A6A6-112D9CEC90FA@oracle.com>
In-Reply-To: <EDDA7FA4-FEDF-4687-A6A6-112D9CEC90FA@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB6193:EE_
x-ms-office365-filtering-correlation-id: d4cda7cc-b28e-41d5-b13f-08dca1ba5a2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MGlQM29heUhJUUZjYnhQQTA2c0duK3JINUdNRm5naW5OSG5oYmxtTEpIejVH?=
 =?utf-8?B?aHBGUU50Ymg4cUpMeHM5Vml4Q3B5S2ZTemhFai92QWh3TTFVN1ZlV2ZqRHdP?=
 =?utf-8?B?RkFLQklDRkM3Vmp2ZWFUZDlka2E1ZjVqeExTeTZTU0NHMFRVZEk0TDUwWFlx?=
 =?utf-8?B?QXRVSVN3THA2dURMRHhZd2RvdVN3SVplRzJrSU1CdmtqSlFuMDhheDJYSWhW?=
 =?utf-8?B?dnIrL0NqN3ZrUkErYUtlMk9WY2pPRDRpbEZBZEFTVGRpWE5XNWFqSDUvQzRL?=
 =?utf-8?B?ZStRNk90WDZrSmZmLzhVR3Y5SThpYVIwTmRXaWxwWlRSaFJjU2xjaEMrejJ4?=
 =?utf-8?B?STNNQVdTRTdCY2VrSFNYa3hCUWt5VjBnVnJ3NnFnQUE2YmNlVzNoRUR0TUF1?=
 =?utf-8?B?S3VBUjZvRm9QNWQ2NmRtZnN4T2w0M05UaEVORFM3Mkpvc0F2bVgwODloeGsz?=
 =?utf-8?B?azVyZElIZWdvWnYxditqUHRzUzByR3hON2lvSXp2K05NQmowR1ZiT1dOVWd2?=
 =?utf-8?B?SDZyc0FMZ0MybFZVSXhYZEwrL0wwajI5NGl3amRqa1ovaUNFdm1IRCs5eEdq?=
 =?utf-8?B?aWZJekcyWnRWYkFvT3h6TzBNMmg5RGVGYXBCNmlmSUgrN0NGQWI2ZkdkUll2?=
 =?utf-8?B?ZCs3MFo0WmRZWXF6UHBmbUFGZEhzaEpjaEYrTy9aeGZDeHBJajBlWHUwaWNZ?=
 =?utf-8?B?KzFDemtuVEg5VXJ4TUNGcmgwSG1VcWpkeGVSamF0UGlrQjUzWlQzb1RPNm5Z?=
 =?utf-8?B?UHJ6OHRPZlZlZWovN2owMFE2UUg2dDFtSk5yeWx1Q2Vvc3VJU3FQMEt3UlR4?=
 =?utf-8?B?dFcyNkRtV21vck9kSkpvdk5MbmtNclVWL0h1eFN5cmVBeHZTRW91eG10U2pV?=
 =?utf-8?B?eDBXQ1RZc2tvSTJ2YmU1UUFIa0RZYzNLajJUYnVVKytIM3RmZzVCSEtYcEh5?=
 =?utf-8?B?ZXA0WFM2bjk3MThKNkhLQ0NyckozNWcvenlxamt3aHY2TWtlYkdHWWI1Zzhk?=
 =?utf-8?B?RnVSL1doMUNneWF4N1FIRWtGYm0vZ3NrWVp1MThLRVdRSCtCV1p0RTU0bzJR?=
 =?utf-8?B?bEpzTmE1cm80V2NZTzMvVUNwMk02WFJMUEIrbXR4c0Z4Y0lZS3V0RzJmbEt5?=
 =?utf-8?B?R0FUak5IZ0JQcFBQOURsVmlDUkNTTUMxZFFmMGs0R0FwT09ydWdsbzBUNXp4?=
 =?utf-8?B?QXVtek1LYklvZkFUR3dXWDNqakhOclZ0cWRLKzJINnlPZ0l1K1hQTStsbmw5?=
 =?utf-8?B?SUxQN3J2QUxRbSs1YS94M2t6dHhVUFo5UWE2alA1ZFZYckRhcEVyeVAzSWE3?=
 =?utf-8?B?Y3Ezak11amM5TFY3enVFWlJBL3I0Ui90cHozUEFVOVdoNk5rYVFEdGxYTnR4?=
 =?utf-8?B?RTRDaXpBVEYvdUI2MGFrZkhzNURzc29JZUYrc3A0M2xsaGZFNS9BL3RJV3Jy?=
 =?utf-8?B?OXc1VStoSkZmWi8rQXFXRTRwUk9aTG5MV1pHL1U3OEFNQUZpL1lVQ05Xc1p4?=
 =?utf-8?B?OW5lL3hmTVF0blJKSlJRMVJmUVFMZExKb2Fqb1VFZkt3TFJ2MzJmemplMEEy?=
 =?utf-8?B?ZDliRjBxendxQW5qRzc1ajlDNEx4OHR3bEV4K1k2U0hMNE9rTUVhdHQ2R2ZP?=
 =?utf-8?B?MUl3OW00UzRaakJ0T0ZWUmRPK3VZT2x0bWJTZ0UvOUhHSXptZDJxczlGRVRt?=
 =?utf-8?B?b2NUOGVMdFZlc0J1SStrZllhTTVoK2VPaTZUQWlEeVQzOWVST1FEbEhPaktk?=
 =?utf-8?B?Q2JVNzUxVkcrVUF0S09MM0NDcWNzSG9JYXZ1MStkdHovWGw0WlB5azhmVWx1?=
 =?utf-8?Q?/HKdTJxMKw214APh15Ja8a9i7/8yJFzRjFo3Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTFlRkZvRmVYSUtuOW5ESDVJcGw3MC9mdkp4SkgzVyswZnMwVXNKdFFDZ2x5?=
 =?utf-8?B?cVFsMXZrdzlodGlMdFZsSU5tRzR1THlicXgxa0xrSmxMVUc1QTAwVFd6M0xk?=
 =?utf-8?B?a0d4OXZpQmJMcE4yL3BScXNFRFA4ZjdHTFFSZ01xamJkWHo1SEYvT2NEMHdV?=
 =?utf-8?B?a21ZN1ZKOE5yNnlaUExockF4UUduMld1RXl6OHZobEtLcFZQSW50MUFDR3dO?=
 =?utf-8?B?UFVwUU4xUzhTbGFjOENaVFdSM0t4TnhQYjFwbE5CNUh3dWs0K0F3TVRCd1NW?=
 =?utf-8?B?TmpsaHdBYWhXYXIwS0VjU1Q0Rms2RGV3N3pwTi8wb2xMR0JrbTRhamVGQXpa?=
 =?utf-8?B?SndLUEIrVmJNNHdnbFBkUmFaNUlmNnRvSlFPMHhPZDZlN24vSDBhUWVYMXJ4?=
 =?utf-8?B?amYwSmt6dytiOERKcXJwYmxQR203aUthdThMY0o4S0pVVEIxWFMzc0tBK3hT?=
 =?utf-8?B?Q2ZYL3E1RFpSSUgxUFJCTDVNRG1WU2Y0b1FBWE0zNmRaMkxpV2JKZ3FyenRq?=
 =?utf-8?B?b2xkeVV1YktsT3RNZ2hQR0hiK0NBMzFZeGdwSE8vUkNlL2hYdzU2dVBXVEla?=
 =?utf-8?B?dDJTUDltNXQvRGhCUG52NWlqblZxZGp5ZGRrWDY3Mmd2MGlabzNocEZlWUxq?=
 =?utf-8?B?TkU3STZ0b2Y0NDFsSXVZMzdXNFNISU9UeGZCeWhHLzhaZEJWUldzQ0oyRmxr?=
 =?utf-8?B?Q1NEeGFTOW40Zy9GV2NMaWo2bm5MWDFJOFZiQ2s5dlUwZEhMaXozZldjdVJy?=
 =?utf-8?B?UWkrd2l4Y1BjS01od3RBdGdNZlpkUlc5VHlrS05kRzdISHplcllKRE5YQlpz?=
 =?utf-8?B?UTZKTWRwdlQ1VDF6SHN1Rm93bVZJc0lpUG1zOTBRUXVibHBzaElIbjVocWd5?=
 =?utf-8?B?UUhIdTlVMkVqUWNtU0k1aEpKYVQrZzA0TGdvRmY0cjVKc3A3WmRVbzFMckxs?=
 =?utf-8?B?Wm12UXZnS3pYS1RBRUZIU0JWVURjdzZZVG5NKzhiV0hPN2FhYmcxck12K1Uw?=
 =?utf-8?B?RHMvdVpNYXBBOTloVjNJVC91cFpkVSt6YmtZOWM0bDdSRlBQc213Ym5zTytz?=
 =?utf-8?B?RzZhTk5DU21FcllPNExzRW9vUitCc0VpY0sxWE5xVkFoSXExdFdQWDFTT0lD?=
 =?utf-8?B?Q3ZSRlRjbTU0eitZZ0MvYzZhcnExTGVldElwV1VzUmwvWHZzQWRVME5FUjdw?=
 =?utf-8?B?R1pNaENiNWlxdEFnbmM4N01Xc25EcjFGWldUZzdxa3h0NFdpYjFSU2lqQzU5?=
 =?utf-8?B?OWdlckZkdzBHa2wxMjgwbVNhcWJSOFpsS2d3OWxmeGdJNmhFeHZBZXMvbytT?=
 =?utf-8?B?MDNxNG1GWitkZS9nT0xRU2JaVkFoVmFaVk5BcVRTellNMmNMT0NnTXdRc2Fs?=
 =?utf-8?B?Y2xuYTJtM0Z4S1VVd3R2ekJZb0svdVNyS2tja0REY29aeWxEcWU5T3hjeTQ5?=
 =?utf-8?B?N0J1a0JsY203SjE0MmlVZEo3b0NWYmVVNlZxYVpwM3JEL1lDc2k5RUhRSUkx?=
 =?utf-8?B?LzBRNVU5YXpnQ0FrclhkWFhtekxwZ0dVQ3d4Uk5ZMEtFNTJWR21qWVc4b2xU?=
 =?utf-8?B?UkNlRTZqNVFDVGx0K09mNE1OMU9rZ1Y5WDhiSGl3UTZyMnFOMEp6Um5BRUFp?=
 =?utf-8?B?QktsSVVFWXB3VXVLR1FFcU1SYlpOa09GMFBGK1JGYjlmNktaOFZnc0prMHhC?=
 =?utf-8?B?UGs0OWZkclZUMzdwd1R0OVBnRENtM1NuR3VVOXVveXh3b09WclAzT1pFZnNW?=
 =?utf-8?B?NlFQUGI3aDNnbWdqY1B2b0xjcXJsR2VoN2FHL1RCSFRQeFNWYW54ZGY2Yk5X?=
 =?utf-8?B?UWFWbHdBaEo4YVFJY2psME1BY2YxMVpMbThSamdrN3gvcThoZ0E3OTdoNDdJ?=
 =?utf-8?B?WHYvUlc4dGdiM3pZVGRTMzdQN0drdmdCMVJHNyt1cVNnMmkyK3p6WEJPdHk3?=
 =?utf-8?B?N1A5WmNyR09pbm8yR1Ztc3F6Q2NKTVpxeEtYWGlrd3p3SmFRVGEyWU9NWTlM?=
 =?utf-8?B?YjBQMGRXSVNxdmFnZTVOUE5yUG8zMlJ5N3orcTFKMjR2R3lveGx1amRHNlJ5?=
 =?utf-8?B?NVRyQ0h1TUhZZlJzd3JJNmpUM2lJdW9LRzh1Y0F0dTBxVmwvU2dyTmRzeXR5?=
 =?utf-8?B?aWpZNUdKOW45UXBpeHFDVWNBcExuTUh0QnhmdmwzR2E4UmF1cGNQcWxjZUlk?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09A1260B1335C6498EAE0184719096D5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v6LTGF2t0bt2jgq4xfg5UGA2oFJB2qfnFYvHE46QejpQoAesUoSq2HG2gOexcU2Zh9UynNCmsmINwr8lg5jWaciwOnUILLB3clVpcrTSJIUdvJUZXvb5H1SCIX/LW9mNqDzCDyygHl6fRi2r9y1LnE9vZN1Nrp516dQSSDaOpabG25dzKZQEQWkkg+cp4UDr7sWkhU7wO0+7B/g6iBdGj6t59ERaxYH/FeDMTodjLk3hxI4mHIZfINA8znL7J0Jbklf121QvPEF9MeFQ516DfrcJ9uAo9+lt17tecTgvPLzcq7lIcmkLuhfPmk1LOxjHwAUKpVRinAZXj2g7ZHxr7t9F34fHLxPW49cq03OH6KEiZxrMMD9Oq+Q+Rt6z/sav6f0cibGtgwuhjAL/HAqkJctdUujKgjnFc4Z4c+ZmxYhJhmYmd5fzPKbr1uXwvNdvRXKvyRR7ylXRVV6EIUmpaZ4vZCSFLNCwm5UCnqaoSB8Tgq4ML20GmoeoQsdvjyHkwcOzaTprBbo00C2BG8HoH/RLkmlAcwLMkjxutPMzSmQBihLBkjFk9LJdzQgeDG3DmOhPKYWmSNfbulBN0+fipS7lh/x4jYjqOB+dcy9xK8o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cda7cc-b28e-41d5-b13f-08dca1ba5a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 15:01:32.8068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WwSV9YjqSC29g3rR8wnAzq0LwxyIxQgjJYC0MqjwqtGg5qGJRulRbgoEGAUqYI8DOd4iIDW/eTEegmBk08jX5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6193
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_10,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407110107
X-Proofpoint-ORIG-GUID: jRL9RPxS13dKDPwTtnBwq9v2t7Irg5AH
X-Proofpoint-GUID: jRL9RPxS13dKDPwTtnBwq9v2t7Irg5AH

DQoNCj4gT24gSnVsIDgsIDIwMjQsIGF0IDE6NDDigK9QTSwgQ2h1Y2sgTGV2ZXIgSUlJIDxjaHVj
ay5sZXZlckBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IFN0ZXZlIGFza2VkIHdoeSBhIG51bWJl
ciBvZiByZWNlbnQgY29tbWl0cyB0byB0aGUNCj4gdXBzdHJlYW0ga3Rscy11dGlscyByZXBvIHdl
cmUgbmV2ZXIgcG9zdGVkIHRvIHRoaXMNCj4gbWFpbGluZyBsaXN0IGZvciByZXZpZXcuIFRoZSBh
bnN3ZXIgaXMgbW9yZSBjb21wbGV4DQo+IHRoYW4gSSB3b3VsZCBwcmVmZXIsIGJ1dCBoZXJlIGdv
ZXMuDQo+IA0KPiBUaGUgaW5zdHJ1Y3Rpb25zIGZvciBjb250cmlidXRpbmcgdG8gdGhpcyBjb2Rl
IGJhc2UNCj4gYXJlIGhlcmU6DQo+IA0KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFjbGUva3Rs
cy11dGlscy9ibG9iL21haW4vQ09OVFJJQlVUSU5HLm1kDQo+IA0KPiBJdCBtZW50aW9ucyBjcmVh
dGluZyBhIEdpdEh1YiBwdWxsIHJlcXVlc3QuIFRoYXQgaXMNCj4gdGhlIHVzdWFsIG1ldGhvZCB0
byBjb250cmlidXRlIHRvIGNvZGUgdW5kZXIgdGhlDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFj
bGUgcHJvamVjdCAtLSBwZXJoYXBzIHRoZQ0KPiAvb25seS8gbWV0aG9kIHRvIGNvbnRyaWJ1dGUg
dG8gT3JhY2xlLWNvbnRyb2xsZWQNCj4gcmVwb3MuIEluZGVlZCwgZXZlbiByZXBvIG1haW50YWlu
ZXJzIGFyZSBub3QNCj4gcGVybWl0dGVkIHRvIHVzZSAiZ2l0IHB1c2giIG9uIHRoZXNlIHJlcG9z
Lg0KPiANCj4gU28gZm9yIG1hbnkgcmVjZW50IHBhdGNoZXMsIEkndmUganVzdCB0YWtlbiB0aGUg
UFJzDQo+IHRoYXQgd2VyZSBvcGVuZWQgb24gR2l0SHViLiBPbmNlIG9yIHR3aWNlLCBJIGhhdmUN
Cj4gZW1haWxlZCBrZXJuZWwtdGxzLWhhbmRzaGFrZUAgdG8gYXNrIGZvbGtzIHRvIGhhdmUNCj4g
YSBsb29rIGF0IHRoZSBQUiBvbiBHaXRIdWIuDQo+IA0KPiBGb3IgcGF0Y2hlcyBwb3N0ZWQgZGly
ZWN0bHkgb24ga2VybmVsLXRscy1oYW5kc2hha2VALA0KPiBJIGFwcGx5IHRoZW0gdG8gYSBwZXJz
b25hbCBicmFuY2gsIHB1c2ggdGhlbSB0byBhDQo+IEdpdEh1YiBmb3JrIG9mIG9yYWNsZS9rdGxz
LXV0aWxzLCBhbmQgdGhlbiBjcmVhdGUgYQ0KPiBQUiBmcm9tIHRoYXQgZm9yay4NCj4gDQo+IFVu
dGlsIG5vdywga3Rscy11dGlscyBoYXMgYmVlbiAiZXhwZXJpbWVudGFsIiBlbm91Z2gNCj4gdGhh
dCBwYXRjaCByZXZpZXcgaGFzIGJlZW4gYSAibmljZSB0byBoYXZlIiByYXRoZXINCj4gdGhhbiBh
ICJuZWVkIHRvIGhhdmUiIC0tIGJ1dCB0aGF0IHdpbGwgYmUgY2hhbmdpbmcNCj4gc29vbiBlbm91
Z2guDQo+IA0KPiBJIHdvdWxkIGxpa2UgbW9yZSByZXZpZXcgb2Ygd29yayB0aGF0IGlzIHN1Ym1p
dHRlZA0KPiBvbmx5IHZpYSBhIEdpdEh1YiBQUi4gVG93YXJkcyB0aGF0IGVuZCBJIGhhdmUNCj4g
bG9va2VkIGludG8gc2V0dGluZyBhbiBlbWFpbCBub3RpZmljYXRpb24gdGhhdCBpcw0KPiBzZW50
IHdoZW5ldmVyIHNvbWVvbmUgb3BlbnMgYSBQUi4gR2l0SHViIGRvZXMgbm90DQo+IGFwcGVhciB0
byBzdXBwb3J0IHRoYXQuIEkgc3RpbGwgaGF2ZSB0byBjaGVjayB0bw0KPiBzZWUgaWYgSSBjYW4g
c2V0IHVwIGEgR2l0SHViIEFjdGlvbiB0byBkbyBzZW5kDQo+IGVtYWlsIGZvciBlYWNoIFBSLiBU
aGUgdXN1YWwgYXBwcm9hY2ggZm9yIEdIIGlzDQo+IGZvciBwZW9wbGUgdG8gV2F0Y2ggYSByZXBv
IChpZSwgb3B0LWluIHRvDQo+IG5vdGlmaWNhdGlvbnMpIGFuZCB0aGF0J3MgYXdrd2FyZCB0byBk
byBmb3IgYQ0KPiBtYWlsaW5nIGxpc3QuDQo+IA0KPiBJJ20gcmVhY2hpbmcgb3V0IG5vdyB0byBz
ZWUgaWYgYW55b25lIGhhcyBvdGhlcg0KPiBzdWdnZXN0aW9ucyBvciB0aG91Z2h0cy4NCg0KSSdt
IHN0aWxsIGxvb2tpbmcgaW50byBjcmFmdGluZyBhIEdIIEFjdGlvbiB0bw0Kc2VuZCBlbWFpbCBu
b3RpZmljYXRpb24gZm9yIGVhY2ggcHVsbCByZXF1ZXN0Lg0KDQpJbiB0aGUgbWVhbnRpbWUsIGlm
IHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBnZXR0aW5nDQpub3RpZmllZCBhYm91dCBwdWxsIHJlcXVl
c3RzLCBwbGVhc2UgZ28gdG8geW91cg0KR2l0SHViIGFjY291bnQgYW5kICJ3YXRjaCIgdGhlIG9y
YWNsZS9rdGxzLXV0aWxzDQpyZXBvLg0KDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg==
