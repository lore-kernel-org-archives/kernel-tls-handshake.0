Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92242192F9
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  3 May 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793463; cv=none; b=nEzmLkSzUfjb2RapZss1sW2EtKqDDDVxu3cp9tIJyHSZKc1nhVcOkJ9VDwYeBJmMd6esfDbD+JymXInQkYPIluyXSTYK8A2wD9kGkzljv+5WA3WMfWXa6o3BUFn6NCXFVpJZPVvU/RCV1s7tBesgoC5mltN9GnEszT6A4Yt6umo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793463; c=relaxed/simple;
	bh=KobCtF2NoedGEbE6XbclqvTtIPCxvwIWc63HzA/1X7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2QfUT85xNYOH4YcaPE/7KmCtXOzqmwM+VhBSFlbEP+rsMntXIezyB8c9bp7TgALQAbtbOBReXQgXMoLkiuPCN9+q4DSvWQpKflHIn8rB8NiRcH5Mt1tQTnbnHGtry8ZzdkkIUh5VLVIYU6RJrH1HlHmPVkFh0RkTOed5LgHpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so31851935e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 03 May 2026 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793460; x=1778398260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KobCtF2NoedGEbE6XbclqvTtIPCxvwIWc63HzA/1X7s=;
        b=fipjJ9v6rucrG8ehAgveA+dJFmTzqzMJF5kBnmAVTE7Fzp8K6VCgalygnkAg7iemKn
         lSvaDUKzd1hgFplNudLK4JDiKI1wPzoWuPBb3aY0orD3ypDVNx7j1El0KqaUgD2wy1uQ
         HRBu7QvkQGGF1sIVEOwmTsjOF1BAbuw/vv762F2ohAgqOvdBt+eloHOqBSKI//gjN7EQ
         bsTqOm3fslzTFUnCFochelV80Xd+1BRPxM7nz8A+PRlyAK2zEKXoxSfNOfO61pCjwEdU
         G/Pb1dq3omqRk6ZVrNfjxw/kMLmvyuk0/glHwf2CazsxfUoq5iPRJMnp4hC/hiEs7m6X
         Ysug==
X-Forwarded-Encrypted: i=1; AFNElJ8wiYt5LjudYINXy2xIZ9DdRac4J4uIpJawDJAlyrJmmERkl13+aWJLcwQsPS+gk5BuQHuO9gGvPpw0D+FQ8CzQXEBEWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIwIUk82fFYUUXz3+y47BQoyFEUwlE36yupwU0Bv6euqrPnNA7
	UzPTx+x17TAi+dgajUhczVdWbBPz2240K6pASHjUcYpN5vCfIH9fkFfArPo/Pg==
X-Gm-Gg: AeBDiesLaa9l4hpMQvPq/mb+Op9LcnJJSyzOUoZwP27eN+J5+dKk9huiUUP1SsCzHwX
	Hj0mPx8qQtjtXEKzNAYl5N20twgKCqnIh69NwzY5OiOhBJsD1qAdAEP96MWz133ZBFQz0umCPHw
	SOk334W4vks4E7aMRURLtM8j+GwAVoGWA/JyZ7xfI3zYnor4cmvf+aKTD9ytvCPFsvk75EvZDO6
	xQTi+77aGFAfHoEMljn9RXSGcaL8H03uqUv/PgTcMqCLL1HrZK4N6Yj/K60rvOZsiyE0dcLw3sb
	2v8kATwowv0kq2TGqHdFP/2USDIEKKg4d8PG+Qf3+GAWlpb9Q1JV+m19TWNbk+U6cxi33kJyGJc
	yfuiMSrckAtw21fd7oR/C+YbaIrf5R1K9+F8WIuB3TblaXGBDMbSoP4afR+P13KTfb5cANDnJLA
	/iNXXhSQiUZn6r2mBiiMsucdTIWYnpS5M9RuuedHEuxkK8dEqVCQhocoNX5A7gh1hL0K0Y4blvf
	w==
X-Received: by 2002:a05:600c:c058:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48a9886c2aemr49135115e9.6.1777793460200;
        Sun, 03 May 2026 00:31:00 -0700 (PDT)
Received: from [10.50.5.21] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebc4201sm288447095e9.15.2026.05.03.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 00:30:59 -0700 (PDT)
Message-ID: <44f3b3fb-8d08-4171-9f5c-ff1a643a412f@grimberg.me>
Date: Sun, 3 May 2026 10:30:57 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: fix keyring cert retrieval
To: Scott Mayhew <smayhew@redhat.com>, cel@kernel.org
Cc: linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
References: <92a53963-1e4b-42eb-af81-6be9f63f9e43@app.fastmail.com>
 <20260501195856.1126025-1-smayhew@redhat.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260501195856.1126025-1-smayhew@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/05/2026 22:58, Scott Mayhew wrote:
> The code that gets certs from keyrings currently only gets RSA certs, so
> we need to zero out the PQ certs length fields when a keyring is used.
> Otherwise the retrieval callback will look in the wrong offset in the
> tlshd_certs list.
>
> Reported-by: Sagi Grimberg <sagi@grimberg.me>
> Fixes: facd084 ("tlshd: Client-side dual certificate support")
> Fixes: 14f5349 ("tlshd: Server-side dual certificate support")
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
