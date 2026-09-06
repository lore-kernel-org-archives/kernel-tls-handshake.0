Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBCD2F7F05
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  6 Sep 2026 23:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788737725; cv=none; b=bmedfMwGirnyhu5atwvnX61jW7LR8gMUJDfvqUDcKlKSkMrvfewZ3kL25gLmSvRRvGXB+koGpY/IxNwpeQF5uxbUzz4MfTgSf/6mo/dupqJ45Iod8IURuWEMLFJ1+a6rRJxy4ZlQf9m/KIPW98yjeR6qPC+ctxNekaZKoeE9CNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788737725; c=relaxed/simple;
	bh=y9P/I7jMpSUi3vaw+6VaWnnEbQ/XnWwOm+dYRgQyi7E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YkQ7lUhoKU9xD6LyyVOuFdWO6fg6E5Zfv8EXaZJaIG2THfaGIr6Zb21RYB4QaHpVFeBq0CLRqih0lVngPmCvrO15n1A+hvPwSd3yhpeq4j5ItuHLvD4Bfg+mOETRzP6I3S9JlTtbuVBl60MaQyguT70xc+z/MKTpEBMwzPGC46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMIVqySB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMIVqySB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEB21F00A3E;
	Sun,  6 Sep 2026 23:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788737723;
	bh=ALYzCcc+RaUJBJ/34Hbrx2ZE/mbn0z196l6IfkOh10I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=XMIVqySB9oPfvqs6bj4lbALSUyqr17SsOhVuPZPNjpZu9Bl9QtvbYM9i/gHY+oQ1f
	 01hbrSfXtoT8H+IL4h1tRa4x2RRSmQogwvW1X/frrcfP8uDuuViXDKaHS4DsW2/TQa
	 gBN5fRXMtORMnPAOyn6FH51SC66dmlZdSR9wa9ySdw18xG6jTwxrQMMHI7RI/rAtob
	 8PKYIbzTBY2ic2g4RPbI9M9KjXBekm6AQd/ipH9rPZoZp+95avcI6BdSvyYd8SQkkc
	 PqoG41eFoVi+vOKNGseZWFpkU1+DrYLGVEK7kOtwcNRrN1WNJuxSw0TIq5MHkKFPFr
	 z+JHipJfsIjlA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF2CBF40067;
	Sun,  6 Sep 2026 19:35:22 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Sun, 06 Sep 2026 19:35:22 -0400
X-ME-Sender: <xms:uvidaja0xo1L1jCBSufBGkxr8lDssgTIP0xsAoT1GQWcxbAYf-JxJg>
    <xme:uvidatMS2rQCUK952cnMU-0XhUJ4-j_95onLIbP16CDDfgGQWzYLrLDPC3QZ-sJG-
    Aw0BLZwUMUPWZ2Ea21jkfm3YQRf4aWWNs_Ry4Y4RRlpKYw8F1u2neO2>
X-ME-Proxy-Cause: dmFkZTFVLFX03x+PcQtEHIwixJo7XwTovcoA6joIK4E9ANGU/OQvk5+Tzi+9tkTeT4tAqn
    tiOnBhFYoveZEAXCWUsR28Xr8dTHvbBlFe8FokUhwnpJ39e3Xr0HhSX5oVIWqhTi6ZjfMC
    5eIiSvgnPzEYv1h13mAHAGZr+0HGPzSQ2qObLnUwgWDbCKWhHChz12Gp/xowmXwTdlXUHx
    XLilpS0ZG3nu4stHYVLGrHKZJaWqnkYO/Rt2/BjojQ9IFXz9RMkHmPKUaKZwSdKUuun49H
    5sClSpuLOgh4bcLvOYx5VCmqvwcygp110bS/+44lSJLoFQJurP79+qw8Stl6MKbAMeNLhx
    aWR2nrdTrB7sDHQ5GlznfjQK0yn1G5CezBkrfVzfRWnz4rvx4TudhOE8RS50T6sCSH2BG+
    oEOh9mnK5JK1pZhHQbsB22FAE+ozYw4wtQN43LG5T6nLUBsTvcUVeyhlswWNk9tjj5mdZ/
    D8aQis3iXjGClzX1EiTiQRKO1Cp/ocq+J1LPwDS8Hh5UxxWuaNZbpGRKJ+wWpg2GCqoopP
    /wBVIs3liF4tUN/MkGAFKeHlvEga7kfO2wKzjNh+1Ml80hf6KWMR9BZtbqtiahYsru4VeD
    fSvLLwzqWntCwVNwW/DbGH+u1DvN1xOzPuotzP+0GfhFVoYRUJtmAII1MlBw
X-ME-Proxy: <xmx:uvidaoHTfsOz2NitL7Ig6eOrOMX3ME0CEeGU9OF9Blngyve-v8E6IQ>
    <xmx:uvidanVr9OBqq0nH8rgEgOUeZE7eM9SRMUxLG9-vlBXeAoQIbTQapQ>
    <xmx:uvidas9HOXqheMyCOlsZ4lqfzz7uiG7MoPvypyi6yPvE2dSf20qpkw>
    <xmx:uvidas6dLfiTNjEExFdR_KLcv-fiEKhgJxk4HA1Ohb4WbuL-1NRNOQ>
    <xmx:uvidatkGlk568wPptmozAzJ9S3XwSNXZoMch-_tVBTlUwwRyp-ZG5WdY>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88C777811F0; Sun,  6 Sep 2026 19:35:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A0B-5ETSpz--
Date: Sun, 06 Sep 2026 19:35:00 -0400
From: "Chuck Lever" <cel@kernel.org>
To: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 "Jakub Kicinski" <kuba@kernel.org>
Cc: netdev@vger.kernel.org, edumazet@google.com,
 "Paolo Abeni" <pabeni@redhat.com>, andrew+netdev@lunn.ch,
 "Simon Horman" <horms@kernel.org>, "Donald Hunter" <donald.hunter@gmail.com>,
 kernel-tls-handshake@lists.linux.dev, davem@davemloft.net
Message-Id: <198d7f36-0fc5-4957-a38a-7dba4b1b1d64@app.fastmail.com>
In-Reply-To: <e5de4d2a-4158-46ec-89cb-bed61e2ce2ce@fiberby.net>
References: <20260904190410.3864660-1-kuba@kernel.org>
 <e5de4d2a-4158-46ec-89cb-bed61e2ce2ce@fiberby.net>
Subject: Re: [PATCH net-next 1/2] netlink: specs: handshake: type the remaining key
 serials s32
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Sun, Sep 6, 2026, at 4:23 PM, Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> On 9/4/26 7:04 PM, Jakub Kicinski wrote:
>> include/linux/key.h has "typedef int32_t key_serial_t" and commit
>> 160f404495aa ("handshake: Fix sign of key_serial_t fields") converted
>> x509.cert and x509.privkey to s32, but accept.peer-identity,
>> accept.keyring and done.remote-auth were left as u32 - the same
>> quantity typed both ways inside one family, and a generated user space
>> struct with __s32 cert next to __u32 keyring. All three come from
>> key_serial_t storage in net/handshake/tlshd.c (treq->th_peerid[],
>> treq->th_keyring), and special keyrings are legitimately negative
>> (KEY_SPEC_PROCESS_KEYRING is -2).
>>=20
>> NLA_U32 and NLA_S32 have the same length and no range check here, so
>> the only wire effect is how the value is printed.
>>=20
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>> CC: cel@kernel.org
>> CC: donald.hunter@gmail.com
>> CC: kernel-tls-handshake@lists.linux.dev
>> ---
>>   Documentation/netlink/specs/handshake.yaml | 6 +++---
>>   net/handshake/genl.c                       | 2 +-
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentati=
on/netlink/specs/handshake.yaml
>> index ffec12b46759..9ab46da04c49 100644
>> --- a/Documentation/netlink/specs/handshake.yaml
>> +++ b/Documentation/netlink/specs/handshake.yaml
>> @@ -67,7 +67,7 @@ doc: Netlink protocol to request a transport layer =
security handshake.
>>           enum: auth
>>         -
>>           name: peer-identity
>> -        type: u32
>> +        type: s32
>>           multi-attr: true
>>         -
>>           name: certificate
>> @@ -79,7 +79,7 @@ doc: Netlink protocol to request a transport layer =
security handshake.
>>           type: string
>>         -
>>           name: keyring
>> -        type: u32
>> +        type: s32
>>     -
>>       name: done
>>       attributes:
>> @@ -93,7 +93,7 @@ doc: Netlink protocol to request a transport layer =
security handshake.
>>           type: s32
>>         -
>>           name: remote-auth
>> -        type: u32
>> +        type: s32
>>           multi-attr: true
>>  =20
>>   operations:
>> diff --git a/net/handshake/genl.c b/net/handshake/genl.c
>> index feac1ad063ee..58606c2a4600 100644
>> --- a/net/handshake/genl.c
>> +++ b/net/handshake/genl.c
>> @@ -21,7 +21,7 @@ static const struct nla_policy handshake_accept_nl_=
policy[HANDSHAKE_A_ACCEPT_HAN
>>   static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A=
_DONE_REMOTE_AUTH + 1] =3D {
>>   	[HANDSHAKE_A_DONE_STATUS] =3D NLA_POLICY_MAX(NLA_U32, MAX_ERRNO),
>>   	[HANDSHAKE_A_DONE_SOCKFD] =3D { .type =3D NLA_S32, },
>> -	[HANDSHAKE_A_DONE_REMOTE_AUTH] =3D { .type =3D NLA_U32, },
>> +	[HANDSHAKE_A_DONE_REMOTE_AUTH] =3D { .type =3D NLA_S32, },
>>   };
>>  =20
>>   /* Ops table for handshake */
>
> LGTM.
>
> Reviewed-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

For some reason, this patch (and 1/2) came to my oracle.com address but
never appeared at my cel@kernel.org address.

For both: Acked-by: Chuck Lever <cel@kernel.org>


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
