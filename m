Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD13A2545;
	Wed,  4 Mar 2026 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621137; cv=none; b=NWh+Fu1emvSQwFuO+BcIg2gtY+2crYLFrlDy03Sr6DmgdKqhPF5T7CT03OoDR9MmfoZ8fY5JmyRRw1VpEwD08oUptNPCxmMn2/WoG59ie3Zqd4k7I5nmN45hKvB5fQHY4nCc8z+75G98hH5ykXWCRD0ydf6KqbJ4mmBIr8agp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621137; c=relaxed/simple;
	bh=h7E/8o1/7HTV0SVvlIZbDHxgfXZolheekA9fIw186h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWGJbXeRTwq6ij34xhbtZmYS8DPO8LZx/Gv2IKxq4EVeTEuUF4bs+99J2SVf7HBZSspsD4WSr6Qe2/Q/JFflBi7oKL0HaJ05IugKDfALWpIUJlnJTUqGbLCHIpWcxXsrfwplawbVM3XEiAGf+Jvjc2LE36Jz7Wf43BU20/z+ehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6geBob7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6geBob7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772621132; x=1804157132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h7E/8o1/7HTV0SVvlIZbDHxgfXZolheekA9fIw186h4=;
  b=G6geBob7K/5KL+XR9FSXG/nq1wu3hznueZY0h5Swp+iD0HAvIsxJVGjp
   +Rt8iKAEm9NtfPXvnsoBt0Ltj9/BNifuB7gnMLI1jWyoGDMk55iFEL1tt
   jhmUGITt7a8Wf0fbEgi0z7N4nB4Eu3Wt/MEu1JYWoaxoN/ZhO+ITf0dhG
   oyZxHFbBBVA02mDqKgNWhWpXO9gooNlJDYmxtk1d0+nYg3LrkJnSJ2vs+
   wfs9+Y///J1p70mgTMwRK5QaWxCJoUVjAgmloUnD2THGdzmRrgIjbmQuz
   LcrjUlIS5JtVkpDDt/pCiNatJbMB7fwirmH+/E/KOrJqY8QqcWCqKA2XZ
   g==;
X-CSE-ConnectionGUID: j5b4f6O2RUaDBaNtL/yqkw==
X-CSE-MsgGUID: pN7q65IyRSmcPjG3+vHNBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77522357"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="77522357"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 02:45:32 -0800
X-CSE-ConnectionGUID: oVDTgMTCR6Gc0LsRhX4bPw==
X-CSE-MsgGUID: 5mOij3zGQFObPS2/aj14bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="222799590"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2026 02:45:28 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxjjJ-000000001fd-2npX;
	Wed, 04 Mar 2026 10:45:25 +0000
Date: Wed, 4 Mar 2026 11:44:26 +0100
From: kernel test robot <lkp@intel.com>
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kbusch@kernel.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, kch@nvidia.com, hare@suse.de,
	alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
Message-ID: <202603041124.uCwVY2n8-lkp@intel.com>
References: <20260304053500.590630-5-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304053500.590630-5-alistair.francis@wdc.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on net/main net-next/main linus/master v7.0-rc2 next-20260303]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alistair23-gmail-com/net-handshake-Store-the-key-serial-number-on-completion/20260304-134148
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260304053500.590630-5-alistair.francis%40wdc.com
patch subject: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260304/202603041124.uCwVY2n8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041124.uCwVY2n8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041124.uCwVY2n8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_try_recv':
>> drivers/nvme/host/tcp.c:1429:31: error: 'const struct proto_ops' has no member named 'read_sock_cmsg'; did you mean 'read_sock'?
    1429 |         consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
         |                               ^~~~~~~~~~~~~~
         |                               read_sock


vim +1429 drivers/nvme/host/tcp.c

  1417	
  1418	static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
  1419	{
  1420		struct socket *sock = queue->sock;
  1421		struct sock *sk = sock->sk;
  1422		read_descriptor_t rd_desc;
  1423		int consumed;
  1424	
  1425		rd_desc.arg.data = queue;
  1426		rd_desc.count = 1;
  1427		lock_sock(sk);
  1428		queue->nr_cqe = 0;
> 1429		consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
  1430						     nvme_tcp_recv_cmsg);
  1431		release_sock(sk);
  1432		return consumed == -EAGAIN ? 0 : consumed;
  1433	}
  1434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
