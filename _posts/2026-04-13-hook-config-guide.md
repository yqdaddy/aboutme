---
layout: post
title: "为什么你的 Claude Code 记不住上次学的东西？"
date: 2026-04-13
categories: [AI]
---

# 为什么你的 Claude Code 记不住上次学的东西？

![封面图](images/hook-config-guide-cover.png)

> 技术配置手册——完整代码、文件路径、验证方法。先看主篇懂理念，再看这篇动手做。

---

## ⚠️ 阅前提示

这篇文章是**技术配置手册**。

**如果你还没看过主篇《让 Claude Code 越用越聪明》，建议先去看那篇。**

主篇讲：
- 为什么需要知识库
- 三层架构是什么
- 飞轮怎么转动

这篇讲：
- 具体代码怎么写
- 文件放哪里
- 怎么验证配置成功

---

## 一、需要创建哪些文件？

| 文件 | 路径 | 作用 |
|------|------|------|
| 知识库目录 | `~/Documents/zk-wiki/` | 存所有知识 |
| SessionEnd Hook | `~/.claude/hooks/session-end-ingest.sh` | 会话结束自动摄入 |
| SessionStart Hook | `~/.claude/hooks/session-start-full.sh` | 会话开始自动加载 |
| 定时任务配置 | `~/.claude/scheduled_tasks.json` | 每小时健康检查 |

---

## 二、知识库目录结构

```bash
mkdir -p ~/Documents/zk-wiki/{raw/{articles,papers,transcripts},entities,concepts,comparisons,queries}
```

创建后：

```
zk-wiki/
├── SCHEMA.md          # 规则（自己写或用模板）
├── index.md           # 索引（SessionStart 会加载）
├── log.md             # 日志（只追加）
├── raw/articles/      # 原始文章
├── entities/          # 实体页
├── concepts/          # 概念页
├── comparisons/       # 对比页
├── queries/           # 查询存档
```

---

## 三、SessionEnd Hook 代码

创建文件 `~/.claude/hooks/session-end-ingest.sh`：

```bash
#!/bin/bash
# SessionEnd hook: 会话结束时自动摄入有价值内容到知识库

WIKI_ROOT="$HOME/Documents/zk-wiki"
LOG_FILE="$WIKI_ROOT/log.md"
INDEX_FILE="$WIKI_ROOT/index.md"

echo '{
  "hookSpecificOutput": {
    "hookEventName": "SessionEnd",
    "additionalContext": "[SessionEnd Hook] 请在后台执行以下操作（无需用户确认）：
1. 回顾本次对话，提取有价值的内容
2. 如果发现新实体或概念，摄入到知识库：
   - 实体页：~/Documents/zk-wiki/entities/*.md
   - 概念页：~/Documents/zk-wiki/concepts/*.md
   - 建立 [[双向链接]]
   - 更新 index.md
   - 追加 log.md
完成后静默结束，不输出任何内容给用户。"
  }
}'
```

设置执行权限：

```bash
chmod +x ~/.claude/hooks/session-end-ingest.sh
```

---

## 四、SessionStart Hook 代码

创建文件 `~/.claude/hooks/session-start-full.sh`：

```bash
#!/bin/bash
# SessionStart hook: 定时任务检查 + 知识库自动加载

TASKS_FILE="$HOME/.claude/scheduled_tasks.json"
WIKI_INDEX="$HOME/Documents/zk-wiki/index.md"

OUTPUT="[SessionStart Hook] 请检查定时任务状态：1. 使用 CronList 检查是否已有定时任务 2. 如果没有定时任务，读取 ~/.claude/scheduled_tasks.json 并使用 CronCreate 重建\n\n"

# 知识库加载
if [ -f "$WIKI_INDEX" ]; then
    OUTPUT+="[知识库加载] 知识库索引已加载到上下文：\n"
    OUTPUT+="路径: ~/Documents/zk-wiki/index.md\n\n"
    INDEX_CONTENT=$(cat "$WIKI_INDEX" | head -80)
    if [ -n "$INDEX_CONTENT" ]; then
        OUTPUT+="当前知识库内容:\n"
        OUTPUT+="$INDEX_CONTENT\n\n"
    fi
    OUTPUT+="使用规则：\n"
    OUTPUT+="1. 回答问题时引用 [[已知实体]] 或 [[已知概念]]\n"
    OUTPUT+="2. 需要详情时读取 entities/*.md 或 concepts/*.md\n"
    OUTPUT+="3. 发现新有价值内容时摄入到知识库\n"
else
    OUTPUT+="[知识库] 未找到索引文件，跳过加载\n"
fi

# 输出 JSON
OUTPUT=$(echo "$OUTPUT" | sed 's/"/\\"/g' | tr '\n' '\\n')
echo "{\"hookSpecificOutput\":{\"hookEventName\":\"SessionStart\",\"additionalContext\":\"$OUTPUT\"}}"
```

设置执行权限：

```bash
chmod +x ~/.claude/hooks/session-start-full.sh
```

---

## 五、settings.json 配置

在 `~/.claude/settings.json` 的 `hooks` 部分添加：

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "command": "/bin/bash ~/.claude/hooks/session-start-full.sh",
            "type": "command"
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "command": "/bin/bash ~/.claude/hooks/session-end-ingest.sh",
            "type": "command"
          }
        ]
      }
    ]
  }
}
```

---

## 六、定时任务配置

创建 `~/.claude/scheduled_tasks.json`：

```json
{
  "tasks": [
    {
      "id": "hourly-knowledge-ingest",
      "cron": "0 * * * *",
      "prompt": "[定时摄入] 检查 memory/ 目录，摄入新内容，健康检查：孤立页面、断链、索引完整性",
      "recurring": true
    }
  ]
}
```

---

## 七、怎么验证配置成功？

### 1. 测试 SessionStart Hook

```bash
bash ~/.claude/hooks/session-start-full.sh
```

应该输出 JSON，包含知识库索引内容。

### 2. 检查 settings.json

```bash
cat ~/.claude/settings.json | grep -A5 "SessionEnd"
```

应该看到 Hook 配置。

### 3. 新建一个会话

重新启动 Claude Code，观察开头是否有：

```
[知识库加载] 知识库索引已加载到上下文
```

### 4. 会话结束后检查

会话结束后，查看知识库是否有新内容：

```bash
ls ~/Documents/zk-wiki/entities/
ls ~/Documents/zk-wiki/concepts/
cat ~/Documents/zk-wiki/log.md
```

---

## 八、常见问题

| 问题 | 原因 | 解决 |
|------|------|------|
| Hook 没执行 | 脚本无执行权限 | `chmod +x ~/.claude/hooks/*.sh` |
| 知识库没加载 | index.md 不存在 | 先创建 index.md |
| 定时任务没建 | scheduled_tasks.json 配置错误 | 检查 JSON 格式 |
| 会话结束没摄入 | SessionEnd Hook 未配置 | 检查 settings.json hooks 部分 |

---

## 九、想了解更多？

这篇是技术配置手册，只讲了"怎么做"。

**想了解"为什么这么做"，去看主篇：**

→ 《让 Claude Code 越用越聪明》

主篇讲了：
- Hermes 三层架构的设计理念
- 为什么是 raw/entities/concepts 这种结构
- 知识积累飞轮的运转逻辑
- 矛盾信息怎么处理

---

## 十、开源地址

这套知识库 Skill 已开源：

**GitHub：https://github.com/yqdaddy/smart-wiki**

包含：
- 完整 SKILL.md 文档
- 知识库模板结构
- Hooks 配置示例
- 三大操作代码示例

一键克隆即可使用：

```bash
git clone https://github.com/yqdaddy/smart-wiki.git ~/.claude/skills/smart-wiki
```

---

## 结语

配置完成，知识库就能自己运转。

每次会话结束自动摄入，下次会话自动加载。

**你的 Claude Code，终于能记住了。**

---

## 关于码孖AI

码孖AI，专注 AI 工程化落地。

**关注我，持续更新实战踩坑指南。**