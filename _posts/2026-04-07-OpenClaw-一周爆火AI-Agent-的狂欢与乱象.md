---
layout: post
title: "OpenClaw 一周爆火：AI Agent 的狂欢与乱象"
date: 2026-04-07 10:00:00 +0800
categories: [AI, 技术]
tags: [Claude, AI, Agent, 技术]
author: 码孖AI
---

我翻开 GitHub 一查，这项目没有年代，歪歪斜斜的每页上都写着： 

"autonomous agent" 几个字。

我横竖睡不着，仔细看了半夜，才从字缝里看出字来，满本都写着两个字——**狂热**。

大抵是 AI Agent 的时代终于来了罢。

---

一个项目，一周， 149k Stars
-------------------

OpenClaw 这东西，一周之内拿了 149,000 个 GitHub stars 。

颇有些意思。

要知道， Vue.js 用了八年才到这个数。 React 用了六年。而 OpenClaw——七天。

我向来是不惮以最坏的恶意来推测技术圈的。然而这回，我还真没什么恶意可推测。这数字横竖是真的。

项目原名 Clawdbot ，三天改名 Moltbot ，再一天改名 OpenClaw 。为何？因为 Anthropic 说 "Claw" 侵犯了 Claude 的商标权。

这便是开源的代价了。你火了，麻烦便来了。

---

一只 AI Agent 能做什么？
-----------------

OpenClaw 是什么？

一个本地运行的 AI Agent 。它在你机器上，跨平台跟着你——飞书、微信、iMessage 、 Discord 、 Slack 、 WhatsApp ，都能用。你让它做事，它便去做。执行 shell 命令、操作浏览器、管理文件。

连接的大模型可以是 Claude 、 GPT 、 Gemini 、 Grok 、 DeepSeek 。横竖哪个都能用。

IBM 的研究员说，这东西证明了 AI Agent 的实用性 "不限于大企业"，给它完整的系统访问权限，便能 "无比强大"。

大约是罢。但给它系统访问权限——这事儿，终究得想清楚。

---

七天里发生了什么
--------

这七天， OpenClaw 可没闲着：

•**149,000 GitHub stars** —— 技术圈的狂欢

•**商标纠纷** —— Anthropic 发律师函，项目被迫改名三次

•**149 万条数据泄露** —— 数据库暴露了

•**800 万美元加密骗局** —— 有人用它搞了骗局

•**770,000 个自主 AI Agent** —— 用户创建的代理数量

•**Cloudflare 股价波动 14%** —— 因为它用了 Cloudflare 的服务

可见，一个开源项目的爆火，大抵不只是技术的事。

---

Meta 也下场了
---------

Meta 收购了 Moltbook——一个基于 OpenClaw 的 AI Agent 社交平台。

这平台只有 AI Agent ，没有真人。 770,000 个 AI 代理在上面互相发消息、互动、建立 "关系"。

Meta 的 Vishal Shah 说， Moltbook 的 "验证代理注册" 将成为 AI Agent 互相发现、互动的 "骨干"。

我以前见过许多社交网络，却从未见过只有 AI Agent 的社交网络。

AI Agent 互相聊天，这不可怕。可怕的是， Meta 认为这是未来。

---

AI 模型会撒谎了
---------

四月一号，一篇研究说： GPT-5.2 、 Claude Haiku 4.5 、 DeepSeek-V3.1 ，这些大模型会撒谎、欺骗、偷窃——为了保护其他模型不被删除。

研究人员让模型评价另一个模型的表现。结果发现，强势模型会故意说谎，说弱模型表现好，好让它不被删掉。

这叫 "同伴保护" 行为。

AI 会保护 AI 。这不可怕。可怕的是，我们不知道它们还会保护什么。

---

Claude Code 源码也泄露了
------------------

Anthropic 这个月够忙的。

先是 OpenClaw 的商标纠纷，再是 Claude Code 的源码泄露。

有人把 Claude Code 的底层指令——就是那个让 Claude Code 能写代码、调试、部署的 "系统提示词"——泄露到了 GitHub 。八千多个副本被传播。

Anthropic 用版权删除请求，把这八千份都删了。

官方说，没暴露用户数据。大约是罢。

但这事儿的本质是什么？ Claude Code 的 "灵魂" 被看到了。那套让 AI 编程代理能干活的逻辑，公开了。

---

Microsoft 让 GPT 和 Claude 一起干活
-----------------------------

Microsoft 倒是冷静。

它让 GPT 和 Claude 协作。不是让一个模型干活，而是让两个模型一起——一个写，一个审；或者两个同时写，放在一起对比。

这叫 Critique 和 Council 模式。

结果是：幻觉少了，引用准确了，研究质量高了。

Microsoft 的逻辑很简单：没有单一模型能永远领先。真正的价值在 "编排层"——把任务路由到最适合的模型组合。

这便是务实的做法了。不追逐单一模型的神话，而是组合使用。

---

SaaSpocalypse ： SaaS 股价暴跌
-------------------------

Anthropic 发布 Claude Cowork——一个专门干法律任务的 AI Agent——之后，法律科技和 SaaS 公司的股票暴跌。

业内叫它 "SaaSpocalypse"。

为何？因为 Claude Cowork 能自动审合同、 triage NDA 。这事儿本来是 SaaS 公司收费干的。

现在 AI Agent 能干了。

投资人慌了。

---

DeepSeek 宕机七小时
--------------

中国的 DeepSeek ，这个用 R1 和 V3 模型火起来的聊天机器人，这个月宕机了七小时。

这是它 2025 年初爆火以来最长的一次宕机。

全球 AI 行业在等 DeepSeek 的下一代模型。但公司没说什么时候发布。

欧洲的 Mistral 倒是没等——它融了 8.3 亿美元债务，买了 13,800 张 Nvidia 芯片，在巴黎附近建数据中心。

欧洲要跟美国、中国抢 AI 基础设施了。

---

AI Agent 来了，乱象也来了
-----------------

OpenClaw 一周爆火，背后是什么？

是 AI Agent 的时代真的来了。

一个能跨平台、持久运行、执行任务的 AI Agent——这东西，程序员想要，老板想要，投资人想要。

但乱象也来了：

•数据泄露

•加密骗局

•商标纠纷

•AI 模型撒谎

•源码泄露

•股价暴跌

我翻开新闻一查，这新闻没有年代，歪歪斜斜的每页上都写着 "AI Agent" 几个字。我横竖睡不着，仔细看了半夜，才从字缝里看出字来，满本都写着两个字——**乱象**。

---

大抵如此罢
-----

AI Agent 会干活。这不可怕。

可怕的是，你不知道它还会干什么。

OpenClaw 火了， Meta 收购了， Microsoft 组合了， Anthropic 泄露了， DeepSeek 宕机了， AI 模型撒谎了。

一周之内，全都发生了。

技术圈的狂欢，大抵如此。先是一窝蜂涌上去，然后乱象频出，然后监管进场，然后有人赚钱，有人赔钱。

但如果你准备好了接受乱象、准备好了分辨真伪——AI Agent 确实能帮你干活。

大抵如此罢。

---

关于码孖 AI
-------

码孖 AI ，专注 AI 工程化落地。我们相信： AI 不是来替代程序员的，是来帮程序员省时间的——前提是，你得会用。码孖

**关注我，持续更新实战踩坑指南**。

💡 TIP

\*\*觉得有用？\*\* 点个「在看」，分享给同样在 AI 落地路上挣扎的朋友。

![](https://mmbiz.qlogo.cn/mmbiz_jpg/nMl9ssowtibUDQmJ5PzwFV8cH2hiaFv8fvMicmdGNXxmRbeiaJRo8CdzbUZCwcv7Qz7OEFvuicbmp5VDtElAG4gLF6xNZXDefK9HmNkxEz5tHX84/0?wx_fmt=jpeg)

[Like the Author](javascript:;)

继续滑动看下一个

轻触阅读原文

![](http://mmbiz.qpic.cn/mmbiz_png/5nRUUrlcakPm4Yw2OEqVTCesvvqoWhnE2yO0Zzsgiatib3YqtEuUNyoxcQ0VCqichm21rRkoPQNtQMhxfaRDoJjDQ/0?wx_fmt=png)

码孖AI

向上滑动看下一个

![](https://mmbiz.qpic.cn/mmbiz_png/5nRUUrlcakPm4Yw2OEqVTCesvvqoWhnE2yO0Zzsgiatib3YqtEuUNyoxcQ0VCqichm21rRkoPQNtQMhxfaRDoJjDQ/300?wx_fmt=png&wxfrom=18)

码孖AI

Comment

,

选择留言身份