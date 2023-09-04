Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8D1FBD
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 Sep 2023 12:40:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so1895098a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 04 Sep 2023 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1693831202; x=1694436002; darn=lists.linux.dev;
        h=mime-version:message-id:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/cdwcGMi3sxkaksvy0xg39RBodRuC4UOC6m057ZLJJs=;
        b=Sjw4443edSrFptaS5q8g04XBeFey6yQB7M+re0lAmN0EY+XLGQM6ZVkyqKXFsnqSt/
         haf2qCVH5wGxX9JG83eFTe+M7yCKlXC2qtJ7GdZfy1LWTOKVx8zSBrxvmNlTgJSopP3w
         GWp/8AXWBnc4DHLpY997ch/B5zv78DMmjUkS/Lwgd4IIp8dIgv3iWH/9s2CRl0ZIy3Hc
         AE59+YbXg6XBoLN1Y47Bt75Btj7jRM+JcxkgTi5QTaoGa+dbbIIHDB7CyaJ9HO3SLYFi
         FJv36qd+Rp1yqr11ZCrVJGnD5Wag75QF6J0wk0eu4hhIqZZ5BPoY0j9OikDmCjPtT08a
         yjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693831202; x=1694436002;
        h=mime-version:message-id:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cdwcGMi3sxkaksvy0xg39RBodRuC4UOC6m057ZLJJs=;
        b=QWySyVk5rm202nQwzXIhGRYEc4GNgAGwgp3dAdZajOkoIa2JxjoJuEJDaReJe+fuqE
         syPjpMj/mXV9anK3LnDuqeLLms8hDRDCSOUYO80zFljFDaRnsxN3B7+cTAra7no5MvsB
         G0rngUjNjantGlSnfvQT1xF94MYYTukZhL7lqqLxdRnbpksIQUytoOILj+oX2MPKmzC0
         o0lCvi5YoTuxHxLpNvCInhCGNt/PqAe2QlIbi/4XHI0bPf0XDGdYPXDVinK2IguFXUL7
         4XqPeqt6T7itvirEucHYLce6yp8Ki3Q4fA1Q1sbov4zW3nbenZJwhcl/8+tySDmxcugl
         0SuQ==
X-Gm-Message-State: AOJu0YzTdlUC2lfGD59McZj9t1zVl85f6MjH7XoV2uql09quu8Ojvgvl
	CuWBaVCvCWXjEJz2CEC7xclOlR2bpQonVlPjC2FuVg==
X-Google-Smtp-Source: AGHT+IGoZeOB314Da0UfSdE/GWdLTMOX3FVNEqZPM9WJyCwzb5mxN1UbtOVAYYK2nZUI5SQbmDL52g==
X-Received: by 2002:aa7:d695:0:b0:525:5a65:6dfa with SMTP id d21-20020aa7d695000000b005255a656dfamr8086701edr.14.1693831201825;
        Mon, 04 Sep 2023 05:40:01 -0700 (PDT)
Received: from x1-carbon (2a02-8388-1ac6-6200-94b0-27b3-1dd9-8373.cable.dynamic.v6.surfer.at. [2a02:8388:1ac6:6200:94b0:27b3:1dd9:8373])
        by smtp.gmail.com with ESMTPSA id l21-20020aa7d955000000b0052338f5b2a4sm5753173eds.86.2023.09.04.05.40.01
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:40:01 -0700 (PDT)
Date: Mon, 04 Sep 2023 14:39:54 +0200
From: Moritz =?iso-8859-1?q?Wanzenb=F6ck?= <moritz.wanzenboeck@linbit.com>
Subject: low pending handshake limit
To: kernel-tls-handshake@lists.linux.dev
Message-Id: <IIOG0S.DV0B3MDEVDQF1@linbit.com>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi all,

I'm currently working on enabling TLS support for DRBD, so I'm very 
keen to use the handshake infrastructure. During testing I noticed that 
the allowed number of pending handshakes is quite low. This seems to 
stem from the following calculation:

 /*
  * Arbitrary limit to prevent handshakes that do not make
  * progress from clogging up the system. The cap scales up
  * with the amount of physical memory on the system.
  */
 si_meminfo(&si);
 tmp = si.totalram / (25 * si.mem_unit);
 hn->hn_pending_max = clamp(tmp, 3UL, 50UL);

Which, for the typical VMs I use for testing (1Gi RAM), ends up being 
just 3 handshakes. The limits in general seem too low also in the best 
case. If a node just booted, and would start connecting to all 
configured DRBD devices, we could easily hit even the upper limit of 50.

Also the calculation used doesn't seem to make too much sense to me. It 
allows more handshakes when using a smaller page size?

Would it be possible to increase the number of pending handshakes?

Best regards,
Moritz


