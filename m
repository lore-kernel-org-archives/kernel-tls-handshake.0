Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6347EF
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Feb 2023 07:35:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A07C219ED;
	Mon, 27 Feb 2023 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677483336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8tNPSQP6dYVr+Ds2k6HrPoHrLgNSPjbp37bUmM/jXc=;
	b=yTo67aeseQKk3PQ515t3/9mKSAAHn5NlYH6FHzggrnuExRXbpjJoRwvUJokZyMieNgEbeO
	2LHoFykXbQ+u/Kzb/OYwFMjcXGHxzUuS0GniwYWCzL40wyqw+qN8skkDAIAYC1P6kbv5xz
	PjcLo4athiU3UDnpHwtmqmzHfDrb7zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677483336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8tNPSQP6dYVr+Ds2k6HrPoHrLgNSPjbp37bUmM/jXc=;
	b=xgyZM1mi9BvHzjV1smyCuCQ7lXuQ0e+hEMF1Tgz/Yg+GzojFTvp3q6dpCSixKTp21cyTwI
	dPbuFVz+sVx5LPAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF33A13A43;
	Mon, 27 Feb 2023 07:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5aT9OEdd/GOLHQAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 27 Feb 2023 07:35:35 +0000
Message-ID: <06d4da85-3802-781f-c886-21ae6141e6a7@suse.de>
Date: Mon, 27 Feb 2023 08:35:35 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: new netlink attributes - thoughts
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <6B769C89-B427-48ED-A20A-E96D13B8FA8E@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6B769C89-B427-48ED-A20A-E96D13B8FA8E@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/21/23 23:32, Chuck Lever III wrote:
> Thanks for the broad conversation during this morning's call.
> 
> We're now using netlink to handle the interactions between the kernel
> and handshake agents (eg, tlshd), replacing the old listen/poll/
> accept/close mechanism.
> 
> Before asking netdev to merge the handshake upcall mechanism, I'd like
> the netlink protocol to be stable. The protocol is extensible, but
> because it comprises an API contract between the kernel and user space,
> we should strive to minimize any significant changes once it has been
> merged into the kernel.
> 
> For those who are not familiar with netlink:
> 
> - A netlink operation is simply a remote procedure call.
> 
> - An attribute is simply an argument or result data item within a
>    netlink operation.
> 
> Aside from the attributes that contain the socket file descriptor and
> the status of the session, there are three more recent additions that
> we need to close on.
> 
> 1. remote-peerid
> 
> The DONE netlink operation now carries the key serial number of a key
> that contains the remote peer's identity. The content of that key can
> be an x.509 certificate or another form of peer identity.
> 
> I'd like to make this into an attribute that can appear more than once
> in the DONE reply, since more than one identity can be passed during a
> handshake negotiation.
> 
> This information would then be passed back to the kernel consumer who
> requested the handshake so that it can make security policy decisions
> based on the remote's identity.
> 
I'm all for the attribute method; we should keep the number of static 
(ie non-attribute) content as small as possible to allow for easier 
protocol updates in future versions.

The multi-identity issue seems to be less pressing, as every 
implementation I've looked at only supports a single identity.

But having only a single identity means that we need to distinguish (at 
least) three status cases in the DONE call:
- OK
- Identity rejected
- Failure
As the caller might wish to retry with another identification.

> 
> 2. timeout
> 
> Hannes has suggested adding a timeout attribute to the ACCEPT reply to
> cause the handshake agent to give up after a bit.
> 
> My thought was the kernel consumer would instead provide timeout
> handling and cancel the handshake request in that case. The handshake
> agent would continue trying until told to stop or until the remote
> breaks the connection.
> 
> v5 is supposed to have more robust support for recovering from
> cancelation, ^C, and other sundry signals. Proper reference counting
> would keep the socket around until both the kernel and user space
> are done with it.
> 
Seeing that we need to have a robust mechanism for 
cancelling/terminating the user-space application anyway I'm fine with 
dropping the 'timeout' attribute.

> 
> 3. keyring
> 
> The idea is to have a private keyring that the handshake agent and the
> user requesting the session would use to share certificates, PSKs, and
> bundles.
> 
> Hannes suggested passing that keyring's serial to the handshake agent,
> to have it link that keyring into its own session keyring.
> 
> It might be a bit more secure if the kernel links that keyring into the
> handshake agent's session keyring as part of the ACCEPT operation.
> 
Good point.
Question, though:
Session, thread, or process keyring?
I would opt for the process keyring, as that would match the internal 
design of tlshd and would (in theory) allow to have different keyrings 
for each ACCEPT

> We might also specify the name of a keyring containing other additional
> shared items, via /etc/tlshd.conf. That's outside the realm of netlink
> attributes, though.
> 
Not quite. We could keep the 'keyring' attribute for the netlink 
interface, and allow it to be specified by the REQUEST call.
The kernel part would then link/use that keyring for their internal lookup.

Another issue when dealing with keyrings and keys in general:
Should we aim for specific types, or should we stay with the generic 
'user' type?

Having specific types has the benefit that you don't need to check the 
key itself; any key of this type can be used.
(Which, incidentally, is the model I'm using for NVMe-TLS).
One has to implement that key-type in kernel-space, though.
Using the generic 'user' type has the advantage that you don't need to 
invent your own key type, and consequently don't need to modify the 
kernel here.
However, key lookup is quite cumbersome, as you don't know _who_ added 
that particular key, and so you have to rely on other mechanisms like 
having a specific identity format to figure out if that's a key you can use.

Overall I'm very much in favour of having a dedicated key type, but then
I'm bound to say that.

But if we do that, though, it might be good to have a 'keytype' netlink 
attribute, too.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

