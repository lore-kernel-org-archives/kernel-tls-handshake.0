Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9EE5CB8
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Feb 2023 14:10:27 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-530b9a0a789so44142697b3.13
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Feb 2023 06:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1rUf3+9wIgF3l2mdW1nV/t9WoYl2tvmK8dk/y+sd2jY=;
        b=pUX3kq/LkgS9yjR9zjAlmt5PzZND8bTptSfxiqkgF1y2QeT6vwUBfnWRvY80nRtRHh
         3VOtbzsqVfatOa8JEoP9UFRfp3xIwqryAHVnUrpzNsgAGqkR0OaSEwhMItqjas3EiaZe
         4xBuHN1nZl/3txAqm+fBdUW+lJVenzJJttWkn6UkjTWVTBQEe7MkeZVEWBaYmczzDgZP
         vrQI5dMUSwd88dqzxETPrb0jRGj7GhRA0PDFa3/cW6TGa7rts+nKRGhT0rjXCeanwhEw
         wh9xFVKSsaa1HPUHSjWFlHdWIYK7FpJHyL9JNI/JlqjBGRVtZWUZ3SULAlDQIXfs/bn9
         HKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rUf3+9wIgF3l2mdW1nV/t9WoYl2tvmK8dk/y+sd2jY=;
        b=Qd0PRJ2N01OiWEEJKopcyr8vVSUR3Ji6EfsKquQt7O8yuhcBEF0LTOMP9vBUBgJHy2
         xJyZI/IR6kJLI1ANBAMcHa8N+CPKK+4q1j0iCS5d7ow8bzksWdMzsU6DxYgm45aBegNL
         8iXPm8qx38vWtsfJ63HQvNAK50j/PK2EAHKml4FUzBglqI7RrSFMhuNBfyr74mZHpyyZ
         WGqPcIr9/6oibLcWpkMN6JlSXkorKASfBM3NqZ0PZNjveUyKgLTwx5eJwMYX8W/k6UDY
         5LWTogvmOSLSsGZ4k0AbUpfCxMeB2DnqT8JI4qXA/sa6tp95tB1FJipSX2Wdg9cootaI
         LOSQ==
X-Gm-Message-State: AO0yUKX20h7YO84svGz08agQ4jz0naHegZZ8kLQiJP1ALlX3cmsmwBNX
	+UzdZZP6jVTGpN0sGhrgJLP9WJUZsZCED4CyC3JFDRnLmTpuoQ==
X-Google-Smtp-Source: AK7set8asV+wLwzOf1jwvg34Q9gyKkmo6+ELXdLWP6cmW+1M4sjl0IUS78MkglezEkbHFuHIPtrakqxKCVbLrreKEV4=
X-Received: by 2002:a25:f508:0:b0:8e5:4ac0:fa1f with SMTP id
 a8-20020a25f508000000b008e54ac0fa1fmr205825ybe.339.1676470226127; Wed, 15 Feb
 2023 06:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Wed, 15 Feb 2023 19:40:15 +0530
Message-ID: <CAH=dH9-2sywW1YBMNT7AY0_sZbDO0zErrw8eeRL0UWbdNQiisQ@mail.gmail.com>
Subject: Test Mail
To: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello

Mail to test kernel-tls-handshake. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
