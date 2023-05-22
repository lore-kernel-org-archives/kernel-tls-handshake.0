Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBE168CC
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 May 2023 20:35:54 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f38b7ca98aso56462071cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 May 2023 13:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684787754; x=1687379754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIiyJ1/CYG8ugzrZM7QueNjZ1bjU5LDz8tPFKPLu/ko=;
        b=TvJZM7K7Bm8jbujEXmk08Zy4oW8Kv0E6bDXJ3yOs7GzfUcpArrQudvAayRJkuBH5wW
         50gIUUwkuOs9tgYuDePvFi5BBQg6HH8cE6Sh3GdEpNicB5YaTpSEv/YFpTvRvKHr2Eyt
         SMcMd0GEFc9rCbdG/vHFauwKhiPG66Op6hCYYqgJ698H0W8k6+0ONTQPztjDHS/3kMnn
         81ejl4d+37oeYKPvEKRgRGwrO+tNgkUzB6WeTVmJ4Y0peJz96fNq7QFg2aRz+h1MVFJ2
         Vh837wjF6E4WwPc8UTHpRdsbXk0Yg+xPlo1h3COMy3gAgdg9y1uSBNg2JTZWU0UmCF5A
         WCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684787754; x=1687379754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIiyJ1/CYG8ugzrZM7QueNjZ1bjU5LDz8tPFKPLu/ko=;
        b=aIz7oHfOC18QFD/C1f4Jcfit3+Vdji1bUk1jD8eCnWra0D0CuF9cJoSDH3BunZcCt4
         iFOua+w0IXtfo9tWJ02Lp0YCnnkx1D84jHEweOaJauFB330zv6fARW3LmL+OwqsQMpfC
         NjdNbO5jg0JUue2IjyX43vDXIHATRKx0fI/Gvic8vr4JfhKxaH9FfQexcVrR14Czw5YV
         kK6laJxEg6loBYhmyCI2h63pTm8g+3xHp3gffPIvbBBjsh4sQNCJvZmros5yQxNj7kz8
         IpsXZ3RDCdFp2MNUsQIC39fpr+ewWPemMQh723XeJDd3ruDNjmHTcU2EFEP4XakVqqVu
         ZfAw==
X-Gm-Message-State: AC+VfDwEFwulQ+DOiVh9PyOputcl1WE8yvwE1cy5wnycY9quxnPK5U16
	MxHHkneynw3s6kNzvz5A28206p1UtWihsJj+VaA=
X-Google-Smtp-Source: ACHHUZ6UXDCaYEyIz7fQvbeaTaTYmPSy8jTRs6DPTgK13EVQLVileHTU6PkcObau3UjicvU/ZFEiNjNEr9E/9c+ZfvI=
X-Received: by 2002:a05:622a:1808:b0:3f4:fd21:508d with SMTP id
 t8-20020a05622a180800b003f4fd21508dmr19912667qtc.27.1684787753611; Mon, 22
 May 2023 13:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168426587118.74246.214357450560967997.stgit@oracle-102.nfsv4bat.org>
 <168426600329.74246.10545150506762914826.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: <168426600329.74246.10545150506762914826.stgit@oracle-102.nfsv4bat.org>
From: Anna Schumaker <schumaker.anna@gmail.com>
Date: Mon, 22 May 2023 16:35:34 -0400
Message-ID: <CAFX2Jfk9up-eyLhe7s65E6+vBTjXrATREFoYJVkCBLAT_56o2g@mail.gmail.com>
Subject: Re: [PATCH RFC 04/12] SUNRPC: Refactor rpc_call_null_helper()
To: Chuck Lever <cel@kernel.org>
Cc: anna.schumaker@netapp.com, trondmy@hammerspace.com, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org, 
	kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chuck,

On Tue, May 16, 2023 at 3:42=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
> From: Chuck Lever <chuck.lever@oracle.com>
>
> I'm about to add a use case that does not want RPC_TASK_NULLCREDS.
> Refactor rpc_call_null_helper() so that callers provide NULLCREDS
> when they need it.
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  net/sunrpc/clnt.c |   16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
> index 4cdb539b5854..2dca0ae489ec 100644
> --- a/net/sunrpc/clnt.c
> +++ b/net/sunrpc/clnt.c
> @@ -2811,8 +2811,7 @@ struct rpc_task *rpc_call_null_helper(struct rpc_cl=
nt *clnt,
>                 .rpc_op_cred =3D cred,
>                 .callback_ops =3D ops ?: &rpc_null_ops,
>                 .callback_data =3D data,
> -               .flags =3D flags | RPC_TASK_SOFT | RPC_TASK_SOFTCONN |
> -                        RPC_TASK_NULLCREDS,
> +               .flags =3D flags | RPC_TASK_SOFT | RPC_TASK_SOFTCONN,
>         };
>
>         return rpc_run_task(&task_setup_data);
> @@ -2820,7 +2819,8 @@ struct rpc_task *rpc_call_null_helper(struct rpc_cl=
nt *clnt,
>
>  struct rpc_task *rpc_call_null(struct rpc_clnt *clnt, struct rpc_cred *c=
red, int flags)
>  {
> -       return rpc_call_null_helper(clnt, NULL, cred, flags, NULL, NULL);
> +       return rpc_call_null_helper(clnt, NULL, cred, flags | RPC_TASK_NU=
LLCREDS,
> +                                   NULL, NULL);
>  }
>  EXPORT_SYMBOL_GPL(rpc_call_null);

I think you missed updating rpc_ping() right below this function as
well, I'm unable to mount without the flag. Although I do wonder if it
would be easier to slightly rename rpc_call_null_helper(), and then
create a new rpc_call_null_helper() that appends the
RPC_TASK_NULLCREDS flag. Then we don't need to touch current callers,
and your new use case could call the renamed function.

What do you think?
Anna

>
> @@ -2920,12 +2920,13 @@ int rpc_clnt_test_and_add_xprt(struct rpc_clnt *c=
lnt,
>                 goto success;
>         }
>
> -       task =3D rpc_call_null_helper(clnt, xprt, NULL, RPC_TASK_ASYNC,
> -                       &rpc_cb_add_xprt_call_ops, data);
> +       task =3D rpc_call_null_helper(clnt, xprt, NULL,
> +                                   RPC_TASK_ASYNC | RPC_TASK_NULLCREDS,
> +                                   &rpc_cb_add_xprt_call_ops, data);
>         if (IS_ERR(task))
>                 return PTR_ERR(task);
> -
>         data->xps->xps_nunique_destaddr_xprts++;
> +
>         rpc_put_task(task);
>  success:
>         return 1;
> @@ -2940,7 +2941,8 @@ static int rpc_clnt_add_xprt_helper(struct rpc_clnt=
 *clnt,
>         int status =3D -EADDRINUSE;
>
>         /* Test the connection */
> -       task =3D rpc_call_null_helper(clnt, xprt, NULL, 0, NULL, NULL);
> +       task =3D rpc_call_null_helper(clnt, xprt, NULL, RPC_TASK_NULLCRED=
S,
> +                                   NULL, NULL);
>         if (IS_ERR(task))
>                 return PTR_ERR(task);
>
>
>
