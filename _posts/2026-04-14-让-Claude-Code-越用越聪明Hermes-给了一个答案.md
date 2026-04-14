---
layout: post
title: "让 Claude Code 越用越聪明，Hermes 给了一个答案"
date: 2026-04-14 10:00:00 +0800
categories: [AI, 技术]
tags: [Claude, AI, Agent, 技术]
author: 码孖AI
---

> 每次会话结束自动摄入知识，下次会话自动引用。一个三层架构 + 三套 Hook 的知识积累飞轮。

---

一、这个故事，你见过
----------

用了几个月 Claude Code ，我发现一个问题：

**每次会话都是从头开始**。

上周解决了一个棘手的微信反爬虫问题，四级 fallback ，折腾了三天。

这周遇到类似问题，我又从头摸索了一遍。

上个月的 uniapp CLI 迁移经验，这周做 Taro 项目时，完全没想起来。

**知识在产生，但没有积累**。

就像一个没有记忆的人，每次都要重新认识这个世界。

---

二、 Hermes 给了一个答案
----------------

群里有人分享了一个 skill ：**llm-wiki**。

核心理念：

> 知识写入一次，持续积累。交叉引用已建好，矛盾已标记。

与传统 RAG 不同：

| 传统 RAG | LLM-Wiki |
| --- | --- |
| 每次查询从零检索 | 知识写入一次，持续积累 |
| 无记忆，每次独立 | 交叉引用已建好 |
| 冲突信息混杂 | 矛盾已标记供审核 |
| 答案即用即弃 | 有价值查询存档 |

**本质**：你负责挑选资料和方向， AI 负责总结、交叉引用、归档和维护一致性。

---

三、三层架构：像图书馆一样组织
---------------

知识库不是一堆文件，而是有结构的：

**第 1 层 raw**：原文不可修改，保留证据。

**第 2 层**：提炼后的实体和概念，建立双向链接 `[[claude-code]]`。

**index.md**：入口点，每次会话自动加载。

---

四、三套 Hook ：形成飞轮
---------------

光有结构不够，得让它**自动运转**。

### 1. SessionEnd Hook ：会话结束自动摄入

每次会话结束时，后台静默执行：

•回顾本次对话，提取有价值内容

•新实体 → `entities/*.md`

•新概念 → `concepts/*.md`

•建立 [[双向链接]]

•更新 index.md + log.md

全程无需手动确认。

### 2. Periodic Hook ：每小时健康检查

定时任务，每小时整点：

•检查 memory/ 目录新内容

•扫描孤立页面、断链

•验证索引完整性

•补充摄入

### 3. SessionStart Hook ：自动加载知识库

下次会话开始时：

•读取 index.md

•注入到上下文

•我能看到所有已积累的实体和概念

---

五、飞轮转动起来
--------

---

六、从 IMA 梳理到本地
-------------

我还有一个云端知识库： IMA ，腾讯出品。

里面有 55 篇会话记忆，分散在各个笔记本。

花了半小时，通过 OpenAPI 梳理到本地：

| 摄入类型 | 内容 |
| --- | --- |
| 实体页 | claude-code 、 ima |
| 概念页 | ralph-loop 、 session-memory 、羊吃草流程、知识飞轮 |

下次有人问"Claude Code 和 Cursor 有什么区别"，我会自动引用知识库中的内容，而不是从头搜索。

---

七、矛盾怎么办？
--------

传统知识库会静默覆盖冲突信息。

LLM-Wiki 不这样：

**标记矛盾，供你审核，不擅自决定**。

---

八、下次会话能引用什么？
------------

今天摄入的内容，下次会话开始时会自动加载：

•[[claude-code]]：终端 AI 工具，自主执行

•[[ima]]：腾讯知识库skill， OpenAPI 集成

•[[ralph-loop]]：自动迭代方法， Bash while true

•[[session-memory]]：会话记忆机制

•[[知识飞轮]]：三层 Hook 配合

**回答问题时，我会引用这些页面**。

---

结语
--

装了 Claude Code ，你没有突然变强。

卸了 Claude Code ，你也不会变弱。

真正的竞争力，从来不在工具里。

**它在你脑子里——以及你积累的知识库里**。

现在，这个知识库会自己增长。每次会话，都在积累。每次回答，都在引用之前的知识。

**大抵如此罢**。

---

关于码孖 AI
-------

码孖 AI ，专注 AI 工程化落地。我们相信： AI 不是来替代程序员的，是来帮程序员省时间的——前提是，你得会用。

**关注我，持续更新实战踩坑指南**。

💡 TIP

觉得有用？ 点个「在看」，分享给那些想让 AI 越用越聪明的朋友。  如果大家感兴趣，我将在下一篇开源这个知识库 Skill 。 整个三层架构 + Hooks 配置，一键可用。

![](https://mmbiz.qlogo.cn/mmbiz_jpg/nMl9ssowtibUDQmJ5PzwFV8cH2hiaFv8fvMicmdGNXxmRbeiaJRo8CdzbUZCwcv7Qz7OEFvuicbmp5VDtElAG4gLF6xNZXDefK9HmNkxEz5tHX84/0?wx_fmt=jpeg)

![赞赏二维码]()**微信扫一扫赞赏作者**[Like the Author](javascript:;)

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