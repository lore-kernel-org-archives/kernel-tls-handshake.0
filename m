Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792532114;
	b=qLYQD053CwLYxoF4D+sZYE4qCmD384yYuoBbP0oN6N2KaYDvjqtWmHyhoyepGi4pax0P
	 j9nuBbvpBUkLjcjA5AoAvqjIQ1bWFa/nBzCWl/t/Rl6tmrTbeo8CM14kCw3yRm/uoSe+7
	 5lvPYIHr9m1Lh1sJ35dwoOCvm1NasMbmNosHxKyvac3yjhIuFOXu96mQFkU8kC+/QwsAi
	 7gj+fO/V9tpX2vgPutnEGhyugTf3PXVaACHWQKlPn9E6Ykwnxp16NrfM0mUvRT3dfu3Wg
	 vuxpl4t3ZU+kjuigmj0+RKd75sW6dc9ELFWXwI72am0RUCGwjW1o753gnJY/9gAg/IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
	b=KLG8Lvc6f2IgutQRqnDpyyy2S+2FH98kzeOja9wdz32jVe6bRv5Wmh+Z2j2QgOOpQQVs
	 8qc7u1hcOE5+DHC4sU+f00xTkaN0D6MwXaiAOxnSXHkmBxhVxOV8+mgQoYpqLNLsyfbp0
	 4MSMMeP18TrFxuNHVLJoYyIaSUViSpaYtPPWACh+8XSiIIn97gnTOkCIiSJStIn05IMO5
	 uHLCarHTud0yzZCJA5oeJJ4+2W4+rDgtQzQIZcujvbDRVEZ7iaaRct6LuGTrpmeX9H+2o
	 wwd0Sr/uBgLU7zEwp+kb+OHuIAn/j/am5Ot7Q7V1wppM1X0+ELT2a48+DojtdqAyGww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksrXS4MK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2897606A31F
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 21:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2897606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksrXS4MK
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-745497ac8fcso95159137.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 14:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792532112; cv=none;
        d=google.com; s=arc-20260327;
        b=C32ykLBN1rkQsy26/2IjcThdIs9cY+jf5+pQQeyqmQsMfbOeyB7vfaaYRXhAD9y9kx
         hDjV6j1HZfcFb/G00xLDfI7uPyuIDFgIw2gQQhmmzFb7E1eC6VA0UpGf+W2q9CbZqTyg
         xWy5ajaEiDoG5/ZGRr7LSSUhG9k4I28iFtHcsmqhA9G+emqvi9wn8226Sc96vm/mvLLC
         Szf/gBZrrBE0SkgWvN3Gl7pH6tpzpoc0keI6qwBXl1UsrwkczY1iQUz7Z/ry+wqkMjkU
         3EQFUJYXS3ccQN3b720afky3MFhhS82clYLFw5hx158H/SEkUkVzp4zGZ0RvxJIIu8bA
         5mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        fh=ID3pxnKEKf20oE3NxgOIP8ocVuI/+qGrDmfU2uig3PE=;
        b=olueZ1UKqQKLbjIJBN5uS0nBHu2IeGaD9XvH2sKY9fnT5WVVrmtFp5TXWsIUJ3vPHr
         RHzqPtiQDak0Tk9i8hCCnGw/UqWbghnZY/YtET6SjeU6wzKMMvuhKZzNvS3b2WVQA0fe
         Inp/x4B7NxTXouTe+lT/iaqbWC3asTUerH1MdZ+fRUigIveqoD1IXWkP9/Q4ozWNEdhJ
         Qck+enDIjnvgSzCZOKc9iwr1XvFDcvkxAtbdcBYC8IghhnLZaxou8f0cEh1ycmzPmyiE
         7WpGC2tC/6bwOcYLX2xL0v6qcF0qI0i2cHO3iyYEr6ld7EWQBEEOvR2h51ZdI9reA58S
         EuuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792532112; x=1793136912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        b=ksrXS4MKf2FXDlwP4QJknd7mq/OKje7ulmV3jIfrjtVpbYnRHMTa6vcbkpTHu8WE3n
         1HEG4PgA2M028Bq80vi/j5zwGFoUwIn4BPjfyipoBWdUzbG5gkTMwIbh5UFW6Ye3HL3E
         qOX/hRvjMr5e/LaHR+2uift3dCMeH1gMLvywwc+tUA/UbUjV/IvVcYDxwYbXjq6YFNWb
         19DOpzV9GfJaIrGBFxQaF9PHsiuYwnfRMKZoByk8J/h1Ro+wtHLMn+z7iSoRKMJnWCId
         ZvJjPgayglxyQ2Ok6d3wPxh6qxAMNWOrqvNweH1Ss9i1hybvWMiuKoRN4VDvXuV749UR
         wyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532112; x=1793136912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        b=OssIJG9FrreSFhP3a6INcBigU/ko+VMMdR0FIOXRsc5yWt0l80kuctajLHAgPK6te3
         zLJ9hdLSDuMFg8DhfV8c4ExZfvvWuzhb4Ufqppx6k/HzE84wrpAmrHPzKspmafy3r8AC
         4LN9s6JcBXrmBvjL2KAS90RhimYHvX+HsqKAaIy9HaLpD+GVsBJ/sWgfpKPomU4a5zjm
         ECCnmL0b+QZEfu1wWp5pRZhp9z2WUXHlZGKu7i+BbFCd+2Bp7/6fN/xVxVSiI2Y5FULP
         YU1LXsE8c2woqpLqhXkJmlRuoeeqLbISd4JDMW6fvTmbA6opAOXvhceQgYOx1Ek6Cn0y
         0JOg==
X-Forwarded-Encrypted: i=1; AKwUvBw4q5ysauf8VL2X0lFdlnSTrKfTN3o6VtJpgrqUaSeHWAyFIGcGE2lv15AJgQq4r4QEUiItrCUVer/8g28mdCPXEEfy7A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLv6LAfLDYx3GwCPXBTdDGhUKUu/ga+MnMxtdnCCALVGziyQCOn
	SPrTRxEdcgJy0SdBy6WYsm4aWUO2YMtmlVNYjZGvs/YZhJxQ7Pv2qbe0JuPa19aWB/TSijKIgHd
	z4fqtUcmQrrmdyMVcpfOATB5x8JcUoGo=
X-Gm-Gg: AYBFou3YWS1BIbMFogxF4NsK408W9Ak+mXeQOVHdjVDcpIbX23r5MqFMWaCQ5Hxovf1
	Vh0VIEX2NK4Btx3tS4bQwCUMfcQrZw7w7fthfWcQQc9sFbHMwaI1a+WrebpG2fkgs5AUG9Gy1XK
	p09SMudMQKM6Mh1fxllTbiat09b6nYBaair/JTWPNEWGjOBMIxesW7DuN03BOZJBZLAT98MRQXs
	tMJoBoyooXpqNnTJIfqS1XNXMTeVcuYsFHniHdjYM3diVuayV/dkeszDrt8dSF1kcZIfAwDEvtF
	2+ODFs6qfrygAdLGA+aqYeLnJ/4MjBifEnpQ0wWZmsRhMO1rnk1dYw9iP1SSnCmXCrglv8rLTnx
	+lQKmnZZVqwG9nk5JyGIRHHjdAFsFqWz8bDP9ESBGdCfDiw+lDbCOSsLbuu+n6/eRhplCDTJXrQ
	d6EMM/jnHisGDZ
X-Received: by 2002:a05:6102:448f:b0:7cc:2cd0:e73c with SMTP id
 ada2fe7eead31-7cc926c4d1cmr146631137.25.1792532112476; Tue, 20 Oct 2026
 14:35:12 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <9e1c586f76943aa9fcd96cecedec805c66fc6e07.1792164438.git.lucien.xin@gmail.com>
 <179244540161.3135.791644548439735124@kernel.org>
In-Reply-To: <179244540161.3135.791644548439735124@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:34:59 -0400
X-Gm-Features: AclHuK-cqHur22QaAJB_O1MpvembykENtwhk63DMyFXPnpV5d6Oxh4y7OPcqRQU
Message-ID: <CADvbK_cWtvHg2Mbgwe1+2TZgGDwF9DY5NO8vjim5RLwufW3e5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v17 09/15] quic: add congestion control
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When quic_cong_on_packet_lost() (net/quic/cong.c:94-99)
>   declares persistent congestion, it sets cong->window =3D=E2=80=A6
> - [Low] The commit message says the implementation "adjusts the
>   congestion window accordingly during packet transmission and=E2=80=A6
> - [Low] quic_cong_rtt_update() (net/quic/cong.c:207-209) throws away the
>   whole RTT sample when the raw send-to-ACK interval (cong->time - time)=
=E2=80=A6
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong and struct quic_cong_ops to the QUIC
> stack. They cover RTT measurement, loss and ECN handling, and pacing.
> New Reno is the only algorithm so far, and quic_init_sock() sets it up
> through quic_cong_init().
>
> > The implementation updates RTT estimates when packets are acknowledged,
> > reacts to loss and ECN signals, and adjusts the congestion window
> > accordingly during packet transmission and acknowledgment processing.
>
> [Severity: Low]
> Is this accurate for the transmit path? quic_cong_on_packet_sent() never
> touches cong->window:
>
>     if (cong->ops->on_packet_sent)
>         cong->ops->on_packet_sent(cong, time, bytes, number);
>     quic_cong_update_pacing_time(cong, bytes);
>
> The New Reno entry in quic_congs[] has no .on_packet_sent, so on transmit
> only cong->pacing_time changes.
>
> The commit message body also doesn't mention pacing. That covers the
> pacing_rate and pacing_time fields, the 2 * window / smoothed_rtt rate in
> quic_cong_pace_update(), and quic_cong_update_pacing_time(). Pacing only
> shows up in the version changelog notes.
>
> Could the commit message describe pacing, and drop the part about
> adjusting the window during transmission?
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..765f50660f0e4
> > --- /dev/null
> > +++ b/net/quic/cong.c
> > @@ -0,0 +1,287 @@
>
> [ ... ]
>
> > +/* NEW RENO APIs */
> > +static void reno_recovery(struct quic_cong *cong)
> > +{
> > +     cong->recovery_time =3D cong->time;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
> [ ... ]
>
> > +/* COMMON APIs */
> > +void quic_cong_on_packet_lost(struct quic_cong *cong, u64 time, u32 by=
tes,
> > +                           s64 number)
> > +{
> > +     if (cong->pc_detected)
> > +             return;
> > +
> > +     if (cong->pc_start_time && time > cong->pc_start_time &&
> > +         quic_cong_check_persistent_congestion(cong, time)) {
> > +             cong->pc_detected =3D 1;
> > +             cong->min_rtt_valid =3D 0;
> > +             cong->window =3D cong->min_window;
> > +             return;
> > +     }
>
> [Severity: Medium]
> Should this branch also reset cong->recovery_time?
>
> The recovery state comes only from quic_cong_in_recovery():
>
>     return time <=3D cong->recovery_time;
>
> The only place that writes recovery_time is reno_recovery(), which sets
> it to cong->time (now).
>
> Take a single loss-detection pass after a link outage:
>
>   P1 lost (pc_start_time is 0, first_rtt_time is set, not in recovery)
>     quic_cong_on_packet_lost()
>       cong->pc_start_time =3D time of P1
>       quic_reno_on_packet_lost()
>         reno_recovery()
>           cong->recovery_time =3D cong->time;    /* now */
>
>   P2 lost, sent more than the persistent congestion duration after P1
>     quic_cong_on_packet_lost()
>       quic_cong_check_persistent_congestion() returns true
>       cong->window =3D cong->min_window;
>
> Every packet still in flight was sent before now, so the ACK for each of
> them returns early here:
>
>     quic_cong_on_packet_acked()
>         if (quic_cong_in_recovery(cong, time))
>             return;
>
> In that case ops->on_packet_acked() is never called. Would the window
> then stay at min_window for at least one more RTT, until a packet sent
> after recovery_time is acked?
>
> RFC 9002 Appendix B.8 sets congestion_recovery_start_time to 0 on
> persistent congestion, so these ACKs grow the window in slow start. The
> state diagram in cong.h shows the same transition:
>
>  *             persistent congestion |   Slow     |
>  *         (O)---------------------->|   Start    |
>
> Here, though, the derived state ends up as Recovery Period, not Slow
> Start.
>
> Nothing in this patch calls the quic_cong_on_packet_* hooks yet. This
> would show up once the outqueue changes start calling them.
>
True.

Good catch.
I will reset congestion_recovery_start_time to 0 on  persistent congestion.

Thanks.
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2 ||
> > +         cong->time - time > QUIC_RTT_MAX)
> > +             return;
>
> [Severity: Low]
> Is the 6 second QUIC_RTT_MAX cutoff too tight here?
>
> cong->time - time is the raw interval from send to ACK, so it includes
> the peer's ACK delay. RFC 9000 allows max_ack_delay up to 2^14 ms, which
> matches common.h:
>
>     #define QUIC_MAX_ACK_DELAY  (16384 * 1000)
>
> For example, take a peer max_ack_delay of 8s, an ack_delay of 7s and a
> measured interval of 7.1s. The sample passes the ack_delay check but is
> still thrown away. The same happens on any path whose RTT stays above
> 6s.
>
> The early return comes before anything is updated. smoothed_rtt and
> rttvar stay at their initial 333ms and 166ms, and those feed into pto,
> loss_delay and the pacing rate.
>
> first_rtt_time also stays 0, so this condition in
> quic_cong_on_packet_lost() is never true:
>
>     if (!cong->pc_start_time && cong->first_rtt_time &&
>         time > cong->first_rtt_time)
>         cong->pc_start_time =3D time;
>
> As a result, persistent congestion tracking never starts.
>
> The v14 changelog says the cap prevents latest_rtt overflow. latest_rtt
> is a u32 in microseconds, though, so it doesn't overflow until about
> 4295 seconds.
>
> Could the limit be raised, or could ack_delay be subtracted before the
> check? Nothing in this patch calls quic_cong_rtt_update() yet, so this
> only matters once later patches call it.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com
