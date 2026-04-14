---
layout: post
title: "Claude Code 用了半年，总结了6个必会技巧"
date: 2026-04-07 10:00:00 +0800
categories: [AI, 技术]
tags: [Claude, AI, Agent, 技术]
author: 码孖AI
---

==========================

卓勋说

**标签**： Claude Code 、 AI 编程、效率工具、开发技巧、程序员

---

用了半年 Claude Code ，我发现一个问题。

大多数人用它，就像用记事本写代码——问一句，答一句，改一句。

但 Claude Code 不是聊天机器人。它是一个能自己动手的编程搭档。

问题在于，你得教会它怎么干活。

---

技巧一：写好 CLAUDE.md ，让 AI 认识你的项目
-----------------------------

这是最基本、也最重要的一个技巧。

Claude Code 每次启动，都会读取项目根目录下的 `CLAUDE.md` 文件。这个文件，就是 AI 对你项目的"第一印象"。

我见过很多人的 CLAUDE.md ，要么没有，要么写了一堆废话。

**大抵是不明白这文件的作用罢**。

正确的写法，应该包含：

```
这是一个 Node.js 后端项目，使用 TypeScript + Express。  -使用 ESLint + Prettier -命名：变量用 camelCase，常量用 UPPER_SNAKE_CASE -禁止使用 var  -npm run dev：启动开发服务器 -npm test：运行测试 -npm run build：构建生产版本  -不要修改 .env 文件 -所有 API 都需要鉴权 
```

这样， Claude Code 就知道你的项目是什么、怎么跑、有什么规矩。

它便不会再问你"用什么框架"、"怎么启动"这类问题了。

![AI 要懂规矩](https://mmbiz.qpic.cn/sz_mmbiz_jpg/b88KvCjdBlHSYwfosRwN962hJ8FzzL8yNuEdxJhWHUWAhic8Gm31ZQRK7ynOxwjsMccW6SABUK1UcMrl4bScIL7VpbHT0iawRcZm2YPp6Ficbs/640?from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

技巧二：斜杠命令，不只是 /commit
--------------------

Claude Code 内置了 40 多个斜杠命令。但大多数人只用了 `/commit`。

这便有些浪费了。

我常用的几个：

| 命令 | 作用 | 场景 |
| --- | --- | --- |
| `/commit` | 自动生成 commit message | 写完代码，直接提交 |
| `/review` | 代码审查 | 提交前自查 |
| `/compact` | 压缩对话历史 | 对话太长时清理 |
| `/clear` | 清空对话 | 开始新任务 |
| `/help` | 查看所有命令 | 记不住命令时 |

**横竖要记住的，是这几个**。

技巧三：快捷键，比命令更快
-------------

命令要打字，快捷键不用。

| 快捷键 | 功能 |
| --- | --- |
| `Shift + Tab` | 切换运行模式 |
| `Ctrl + C` | 中断当前操作 |
| `↑` / `↓` | 翻历史命令 |

**关键的是 `Shift + Tab`**——它能在三种模式间切换：

1.**默认模式**：修改文件前会询问你

2.**自动模式**：直接修改，不询问

3.**全自动模式**：连确认都不需要

我平时用自动模式，让它自己改代码。改错了，用 git 回滚便是。

何必每一步都确认？那要多浪费时间。

技巧四： Hooks ，让 AI 自动干活
---------------------

Hooks 是 Claude Code 最被低估的功能。

它能让 AI 在特定时机自动执行命令。比如：

•每次对话开始，自动加载你的配置

•每次代码修改，自动运行 lint

•每次提交前，自动跑测试

**我以前见过程序员手动跑这些，那得多累**。

配置方法：在 `.claude/settings.json` 里写：

```
{"hooks":{"PostToolUse":[{"matcher":"Edit|Write","hooks":[{"type":"command","command":"npm run lint"}]}]}}
```

这样，每次 AI 改完代码，都会自动跑 lint 。

可见，自动化这件事， AI 比人更擅长。

![自动化干活](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

技巧五： MCP ，连接更多工具
----------------

MCP （ Model Context Protocol ）让 Claude Code 能连接外部工具。

比如：  
 - 连接数据库，直接查数据  
 - 连接 GitHub ，直接提 PR  
 - 连接浏览器，直接看效果

配置方法：

```
{"mcpServers":{"github":{"command":"mcp-github","args":[]}}}
```

**这便是一个人的开发团队了**。

当然， MCP 服务器需要单独安装。但一旦配好，效率便不可同日而语。

技巧六：权限模式，该放手时要放手
----------------

Claude Code 默认很谨慎——每改一个文件都要问你。

但你是程序员，你应该知道什么时候该放手。

在 `settings.json` 里：

```
{"permissions":{"defaultMode":"bypassPermissions"}}
```

这样， AI 就不会每一步都来烦你了。

**有人说这很危险**。

但在我看来，如果你连 git 都不用，那确实危险。但如果你用 git ，改错了随时回滚——有什么好怕的？

程序员的价值，不在于小心翼翼，而在于快速迭代。

![放手让 AI 干](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

---

最后的忠告
-----

Claude Code 是一个工具，而且是越用越顺手的工具。

但前提是，你得花时间调教它。

**配置好 CLAUDE.md ，设置好 Hooks ，装好 MCP——**

这便是你的"AI 编程搭档"了。

它不会替代你。但它能帮你省下一半的时间。

这省下来的时间，你可以喝杯茶，或者——

继续调教它。

大抵如此罢。

---

关于码孖 AI
-------

码孖 AI ，专注 AI 工程化落地。我们相信： AI 不是来替代程序员的，是来帮程序员省时间的——前提是，你得会用。

**关注我，持续更新实战踩坑指南**。

💡 TIP

\*\*觉得有用？\*\* 点个「在看」，分享给同样在 AI 落地路上挣扎的朋友。

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