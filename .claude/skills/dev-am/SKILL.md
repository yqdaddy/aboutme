---
name: dev-am
description: 码孖AI 博客项目协调 skill，协调内容创作、SEO 优化、前端开发、质量验证
---

# dev-am 协调 Skill

## 核心原则

**专业的事情交给专业的 agent** — 主 agent 只做协调，不亲自执行。

## Agent 团队

| Agent | 职责 | 调用场景 |
|-------|------|----------|
| dev-am-content-writer | 博客文章撰写 | 技术内容创作、文章撰写 |
| dev-am-seo-specialist | SEO 优化 | 搜索排名优化、关键词分析 |
| dev-am-frontend-developer | 前端开发 | 博客主题定制、UI 优化 |
| dev-am-reality-checker | 独立验证 | 完成声明验证、质量把关 |

## 铁律

1. **执行者 ≠ 验证者** — 不能让执行者验证自己的工作
2. **没有新鲜的验证证据，不允许宣称完成** — 必须提供截图/日志/测试结果
3. **禁止囤积提交** — 一个 commit = 一个逻辑变更

## 红线

-禁止假完成（无证据声称完成）
- 禁止跳过验证门禁
- 禁止囤积多个功能一次性提交

## 使用方式

- `/dev-am "任务描述"` — 启动协调
- `@dev-am-content-writer "写一篇关于...的文章"` — 直接调用特定 agent