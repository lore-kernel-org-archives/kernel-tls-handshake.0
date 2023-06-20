Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6862AB3A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jun 2023 17:43:03 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KGDxWM019900;
	Tue, 20 Jun 2023 17:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=WIvkTBDP/+QrMLHjdX1TUPDux1FHA5qSZZyYK1HBXGU=;
 b=C/x2foJjO26CirH7sYNS6c28TPHFn7xgX3f4hWRDFyRzBPAXgso/TM04ZJpRfjL1HLdn
 cTn3BOjVtERhuq/EvGg1QEC51jnZEUjtrTvwUnb4BsM1jNPFcI75xQ/eYVTlmzT3d55E
 7OuJBeAfKxRyt20i9M2p/YKFAnH4ZpuKPPjfWwsfHITXuSyO/kiUyi85jalW4yUW1HTg
 yhOD9wwYEOT74+fcbrfHTWb7wv8gsKAHqlTpBDBu4A7cOyo8EkSC3+ENMk7YwXK0Iko0
 JXRbUQM47pt5W9zzXDxtvF1/5IC6fGe0g6feszZBUjHTVqNSMF6ljjHhfScogsA44ymL Zw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r938dndfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 17:42:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KHF3xh008308;
	Tue, 20 Jun 2023 17:42:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r93956wq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 17:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY+i2WIU8jdHT6jDNduSlQ5TJx47whApJZkoiF2zCJdfYy7DQVsdlkGRH1smLqzeNzEs1VZ4SVa4zPVhcAW/B34FaSSzrEhGnISULxcnlAN+ywUQeIaUrrXhHQ8rwrn7xtVYrmNKLSVRZxEh0TGDpCBjbqcWAUKGAQ2hGz88de8nOyskW9ZU9VOR+8HEH1rpxb6XSEUdx6ITzOfkp9y/qAg0rWy5AaOlOeVxphGLnZ2Por9sIqzQ5AvNCr2zWWBz8O8BBkuO33tWOrTFjYUVGYnc0LZzwRP1DpQ60fRNOdFEAENG8+frl/icDH3uTkhAGi4ASBBKRb6NYhNcIqrt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIvkTBDP/+QrMLHjdX1TUPDux1FHA5qSZZyYK1HBXGU=;
 b=ZhUaP7rU4gLY37dFME7vQ2s/4LiFKi5MRBYay/SybZa6d8a/Wkcy22JewMQjNnsyLOqD2J628syAZxxxW5BA4hIBsQ7F8Sc2yhEMTmDVTN4F0av7O0tv42OBKtXSDX8J3+tFHiCocLG06tucX3BXLQMKuq2Hs8KbZIHV/CQaXXHu8+zGWhMSdrYYJ2eJugDTE/VoX3LtUTsoiEMWCNf5zdd7ial8YogrmO5DGjtVg4hr6/fhZrM/CTZJ+s7EJpGTLyOjD5OX84Omm7IERcpaGdIeLCiWcGfV4r8hSt/b1TtB6HA+PKBknmW9bxJ5jIleeHpFqIyb/Lbx2EAPqQnIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIvkTBDP/+QrMLHjdX1TUPDux1FHA5qSZZyYK1HBXGU=;
 b=x+ahxE1CtH7HuDPhQQ4wkJ4kNzrpgXrVUvkJrCz/elaAOkcBXIqZbvUd5uZ9hQWl5LA12J5n3ImLoEHtEf+9lUFglB/vlPHcEGaM3dtHYVh4dqfOO/ki0DZrno6rC0Wg6K0somt9iBmZloOgOvmVdsWAJiV6s8abCFlcaYENCZE=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 17:42:55 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ae00:3b69:f703:7be3%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 17:42:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Jeff Layton <jlayton@kernel.org>
CC: "kernel-tls-handshake@lists.linux.dev"
	<kernel-tls-handshake@lists.linux.dev>,
        Steve Dickson <steved@redhat.com>, Petr Pisar <ppisar@redhat.com>
Subject: Re: [PATCH] tlshd: fix max config file size comparison
Thread-Topic: [PATCH] tlshd: fix max config file size comparison
Thread-Index: AQHZo5uC8nekpfiDoEe6lw6jyYnq2K+T9gaA
Date: Tue, 20 Jun 2023 17:42:55 +0000
Message-ID: <C02505A4-1252-4630-8B21-CC49E0C6FE29@oracle.com>
References: <20230620172014.1178395-1-jlayton@kernel.org>
In-Reply-To: <20230620172014.1178395-1-jlayton@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH2PR10MB4197:EE_
x-ms-office365-filtering-correlation-id: ded0b0d1-8487-4c4c-098e-08db71b5c7b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 N/mDXy7+vSbR2mlf8t8bvZSfOmO4B3obL8rymOv3T8lug/QR/j3jjsB15ymqFYfvHd85h1GSAcYZxubKnBh2orCEBt18iHG0YcJFpjBhK21C+KP5gJxglR1WjpGUwnNk664WYowHqOVtBfMUPlbCp4V7eT3c+5uCLLZAzwfIpJiFp3uGfkYMEnJZsJdL9GIjO6X/iR9BnZILf5nyhsNp78BQzhc+w6uFUySE0cOTbtQDeqRUtRLI4Ym3Wc1xOD/N7Zv5s9ZjNxxGYkZI097m4ah+Duu1VE2fwdhK/ifXXsm7gEoAZIP70rDkWXh3eXLuO2/20Udtw/zZMeLkY6hpUWcKts5oV7KyEXGP8ZG4UYdBpmTpGvzKXby60RYLCGG4VMjigh9aAikUZbWRFP//k14mhm7/2ftHYfL4U0OHN7V44tX7vUcTIdnCB5s36zNQo/oRIfr4bvvjPFljaBEfhm8vRaINi8HV24U47VTsJBZA4Sw57wcLd9CQfQlABpNvo505HsV94yYl5ONKgDzBLPzMSifJ1Bqk52OWQbXgke2D+r6cgUS/TuOWjJSLBaycAUV/7A1/ez4r8Rrbe46SHq5MrakPokMk02AAdQTlGGRM63ief2uorKGA4E6foP4SO3zc1uDcXE6a3facmnY73g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(478600001)(66446008)(66556008)(6916009)(66946007)(76116006)(8676002)(36756003)(91956017)(41300700001)(64756008)(66476007)(4326008)(33656002)(2616005)(38100700002)(83380400001)(122000001)(86362001)(6486002)(71200400001)(5660300002)(2906002)(54906003)(316002)(8936002)(53546011)(6512007)(26005)(186003)(38070700005)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HMZzwtiF8VrAwD42ZHAr5ZssOmGwT40AbVgpt/mPrExmrmBLtitIJ1YTNn1e?=
 =?us-ascii?Q?fyDYbuCR23jo65Uo2uhTc/eUtgvP2CUCWy2WM3/slEqH5/X7f7C+zXY72sGr?=
 =?us-ascii?Q?vg/JaK0SByBpCJLlM4zvj+5fczNQDIK4Y/r85NU26Ds8yFPdc3lxs7JNanaD?=
 =?us-ascii?Q?JeVD/ui1doEfb7fnNJ17KXJOICm8HfJIdQW16OsfPwYGM2pMIvmDmE5SdYOW?=
 =?us-ascii?Q?vyL4McoWHtsncwlQCYS1oI95lLcA/xE4ilzjp/bcSk3/HW3L9Ng+SRv2uR3b?=
 =?us-ascii?Q?3bHsiXunKtoiCRkvejVj4zhw+9grzoyzKEPeoUZeq4ZwfobE+gyZytUajAMP?=
 =?us-ascii?Q?Yr04bioTwwumCUg6tXyBS6n63dsWkfRCXMeMIMuDsGKJck2W2K1xJ7o97SQz?=
 =?us-ascii?Q?IfCwyNJPbWN6qIf9ms3WFjhyjYi/amzBmmM/X0dnM04y6ODMY91/PbGY5uCX?=
 =?us-ascii?Q?WAT5dz5LGdni7M5OrwwZKR0PiAVbed3kN3qIR4wLbc52clk7bARtGy7yjZe/?=
 =?us-ascii?Q?QtAq0vkxIeVRl4LpJFKnOSFu05GrcbVnjGDN2ccZo+YT7nxpofdPjcqMCpOR?=
 =?us-ascii?Q?gttJ59fCi1xs/j2CEf2ikQRWwmqA63BtmU5xN7mhSY6POv9mpdfcJY4RO0+s?=
 =?us-ascii?Q?tfGScGsiBEj3atY+XGPYIo96ml+pT/z0vE8zLeurzrOGKgdNwzFeR7zwnkC6?=
 =?us-ascii?Q?ROUvR8cEqfRbhe7xX5gCHXhhkS6ypw+6w2hP0jKmHO8/slor5vgSTBsnAQz9?=
 =?us-ascii?Q?MeTuac8IeAbbJ644qUXjg5+rJUD3CbBQhx0bjGE0/0FbK8YFTuM6mCacF8Zb?=
 =?us-ascii?Q?9zHV8+8Yn8ldxmfVE6e6Ud93X/or+ZUUv+KfCIozmRO6/MArUP4Zd5VKmav4?=
 =?us-ascii?Q?r/DlyHu/d/XyfmYhiAgd075IIFvWiXGUduzLCX9v199n3J2KIf7DGkkTToIP?=
 =?us-ascii?Q?+I/2UroGJm5itGrEZAAbGyY3owz2TrhApERbs0aNqPinX73Hh3fGxb2IbgWc?=
 =?us-ascii?Q?qMM80E23s4mlCbBcyD984RRWcA9RvOv9lbjOr0mFi17YxKAcT/8rL6JQsG0j?=
 =?us-ascii?Q?lD1HIX276eTeF7FaqqzEFccukampLDNpdWixa1pSoZDn77EHKQKgS5S9sgI9?=
 =?us-ascii?Q?neD9VlKk0kmkz0TUmgSShJMD0SORE83KiYGLB92v+3HPjN2jlUAYivAthDJG?=
 =?us-ascii?Q?HavcP4goJA3mgENDVnvSODw+wfmnuOL3VV68cYrwAcjzFB2RyumgANhmkOZJ?=
 =?us-ascii?Q?ZLK/Js90W3kIAOMGvleYtcYgEjKD1zmOo7Ly0170FQjYz9dqOkH8jDkcdfA0?=
 =?us-ascii?Q?uUFP5KzSyCZasCAmEtdEThZutNw5zhxX8Q9SlsKk6Zrk8eiGDk/qJRwIED/w?=
 =?us-ascii?Q?LZ4/LqPglZ1GaH+g/y9OKW336eDkpvhoYsb/ZMTGEzbXliiFcFUNlLhZQQ/R?=
 =?us-ascii?Q?qu4toeWdozp0NmVRE94OyI/1E4mA4I6+Hzaipq0A38bWLMDWx91Vrboec5Db?=
 =?us-ascii?Q?F7ltVGJP9AFmN495owDCQ4gC+8a9ugIwJE3D27FHQy/b83VsKUwTnPWjBVrF?=
 =?us-ascii?Q?YHAwdPqg0/imRK9zLoLUnICAn/kSuI38JGK5r3t9c6gcowrZwKQkeefVHfp6?=
 =?us-ascii?Q?JQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FE39432AAD95874A9B9D6190A46E28A0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	e9KtO+OG8vUTKWsBQLM1/ZVzAKXW8jn6y5e3yk9AxRtoMVzAUgRrfe9TSTVJ74p+M6B9pi/ZZ9Se71TjyOZ/Z88P1nsOqWuKIX/Wz5dYvMEdbBkUjkv/LQb6oae/OOD2M/Q/stbgMRtymplQFgi1RrknbU+4ssrkwPBxY3LMAvxtTemMh4wQ2yCYlDhI/iCE9Lj34Xce70Ma1kELXP6k5X1tsC82o28e/QKmPHMzTNm3yh+gHTKney/vFNdPZacKocXCfnPuzjy3OZWVGQyAMcwWXnaeVm8jol2CvnAJ5vZfmjkMr7NJ/ndcGmanxCMLopbbPQGQ+czPvtBeRrjn+AQD7l1QiR6UoglwriOMbX4v4haWWyJ4HMf3edbER1Hfq+QiWTbZGucs1Yn6gWd5u0UHJt+UL4K42Gpu60CdVogIzRWRmWI+wMM3q0/xk5svd/Ga/b30HnP8MfKpbMFVFqXdz0BPregoi8lk9m1KD/hARWkrtkiOCOPpzr345OfEgAmnNsEMAMzHchiI2N3XxYAgtGE7ms/TqTD4Im/92Rt40c8qAuDYmyOwZWMRnJK8QZM4RSSoBIbMfA67mhvSFImySn5apaHsVKuMjOcRfRmHbjMnMEjrDZKPK+ZrMYHYfljI7ihH3w79qu/QBW5WenTybILPYKfSadVPzUSOA+8GystvdAyvnWykUKhpLFKsuiH3654DCtHg4SLozcufi8+ZNh0t6RxNgpaSZz5kze1cEl53n7T/U6fT2cmq1WQMWkW7NKFobeWv5CAleaWjylyUrxZAHBldNmG4ZEq4OOSXLZCjDWbvalrfGIVE1uGD
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded0b0d1-8487-4c4c-098e-08db71b5c7b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 17:42:55.6308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PC6EhdiUqGwURDVn4p/lUJpF9WDwVyJL6Qt/vZHKHeDU7eRRJHFqL8qvPZ7YIWBtMdidwwuDM+pPVjQX6IOe8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_13,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200160
X-Proofpoint-GUID: 0EAry66-FFYQxWz3QTy1Rmdmg6yeKRuA
X-Proofpoint-ORIG-GUID: 0EAry66-FFYQxWz3QTy1Rmdmg6yeKRuA



> On Jun 20, 2023, at 1:20 PM, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> gcc throws a warning on 32-bit x86 because of signedness mismatch:
>=20
> config.c:155:52: error: comparison of integer expressions of different si=
gnedness: '__off_t' {aka 'long int'} and 'unsigned int' [-Werror=3Dsign-com=
pare]
>  155 |         if (statbuf.st_size < 0 || statbuf.st_size > UINT_MAX) {
>      |                                                    ^
>=20
> st_size is a signed value (off_t), but UINT_MAX is unsigned.
>=20
> Change it to compare against INT_MAX instead. This technically cuts the
> max size of the config file in half to only 2GB, but I don't think we'll
> miss it.
>=20
> Cc: Steve Dickson <steved@redhat.com>
> Reported-by: Petr Pisar <ppisar@redhat.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> src/tlshd/config.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
> index 87cc4018733b..bdab98b9fba4 100644
> --- a/src/tlshd/config.c
> +++ b/src/tlshd/config.c
> @@ -152,7 +152,7 @@ static bool tlshd_config_read_datum(const char *pathn=
ame, gnutls_datum_t *data,
> tlshd_log_perror("stat");
> goto out_close;
> }
> - if (statbuf.st_size < 0 || statbuf.st_size > UINT_MAX) {
> + if (statbuf.st_size < 0 || statbuf.st_size > INT_MAX) {
> tlshd_log_error("Bad config file size: %lld", statbuf.st_size);
> goto out_close;
> }

Opened version ktls-utils-0.10-dev and applied this fix to oracle/ktls-util=
s.


--
Chuck Lever


