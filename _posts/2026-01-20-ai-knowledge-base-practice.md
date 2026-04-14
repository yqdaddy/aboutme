---
layout: post
title: "企业级 AI 知识库实战：数十万商品数据的智能分类与结构化"
date: 2026-01-20 10:00:00 +0800
categories: [项目实战, AI]
tags: [AI知识库, LLM, 数据结构化, 企业AI]
author: 码孖AI
---

当企业拥有数十万级的非结构化数据时，如何利用 AI 进行智能分类与结构化？本文将分享我们在电商场景下构建企业级 AI 知识库的完整实践。

## 业务背景

我们的电商平台积累了大量商品数据，面临几个核心问题：

1. **分类混乱**：商家上传商品时分类不准确
2. **属性缺失**：商品属性填写不完整
3. **描述质量差**：商品描述参差不齐
4. **人工成本高**：运营人员疲于数据清洗

**目标**：用 AI 自动化解决这些问题，降低人工成本 70%+

## 解决方案架构

```
┌─────────────────────────────────────────────────────┐
│                    AI 知识库系统                     │
├─────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐ │
│  │  智能分类   │  │  属性提取   │  │  内容优化   │ │
│  │   模块     │  │    模块     │  │    模块     │ │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘ │
│         │               │               │         │
│         └───────────────┼───────────────┘         │
│                         ▼                          │
│              ┌─────────────────────┐              │
│              │     LLM 调用层      │              │
│              │  (多模型策略路由)   │              │
│              └──────────┬──────────┘              │
│                         │                          │
│         ┌───────────────┼───────────────┐         │
│         ▼               ▼               ▼         │
│    ┌─────────┐    ┌─────────┐    ┌─────────┐     │
│    │ Claude  │    │  GPT-4  │    │ 本地模型 │     │
│    └─────────┘    └─────────┘    └─────────┘     │
└─────────────────────────────────────────────────────┘
```

## 核心功能实现

### 1. 智能分类

**问题**：商品被放错类目，影响搜索和推荐

**方案**：基于商品标题 + 描述 + 图片，AI 自动推荐正确类目

```python
CATEGORY_PROMPT = """
你是一个电商商品分类专家。根据以下商品信息，判断其所属类目。

商品标题：{title}
商品描述：{description}
可选类目：{categories}

请返回最匹配的类目ID和置信度（0-1），格式如下：
{{"category_id": "xxx", "confidence": 0.95, "reason": "判断理由"}}
"""

def classify_product(product):
    prompt = CATEGORY_PROMPT.format(
        title=product.title,
        description=product.description,
        categories=get_category_tree()
    )
    result = llm.chat(prompt)

    # 置信度低于阈值时转人工
    if result.confidence < 0.8:
        return send_to_manual_review(product, result)

    return result.category_id
```

**效果**：
- 分类准确率：92%
- 人工复核量减少 85%

### 2. 属性提取

**问题**：商品属性填写不完整，影响筛选功能

**方案**：从商品描述中自动提取结构化属性

```python
ATTRIBUTE_PROMPT = """
从以下商品信息中提取属性值。

商品：{title}
描述：{description}
需要提取的属性：{required_attrs}

返回 JSON 格式：
{{"品牌": "xxx", "规格": "xxx", "材质": "xxx", ...}}

如果无法确定某个属性，返回 null。
"""

def extract_attributes(product, category_attrs):
    prompt = ATTRIBUTE_PROMPT.format(
        title=product.title,
        description=product.description,
        required_attrs=category_attrs
    )
    return llm.chat(prompt, response_format="json")
```

**效果**：
- 属性完整度从 45% 提升到 89%
- 单商品处理时间 < 2秒

### 3. 内容优化

**问题**：商品描述质量参差不齐

**方案**：AI 辅助生成/优化商品描述

```python
OPTIMIZE_PROMPT = """
你是一个电商文案专家。请优化以下商品描述，使其更具吸引力和专业性。

原描述：{original}
商品属性：{attributes}

要求：
1. 突出核心卖点
2. 语言简洁有力
3. 不夸大事实
4. 字数控制在 200 字以内
"""
```

## 工程化实践

### 多模型策略

不同任务使用不同模型，平衡效果和成本：

| 任务类型 | 模型选择 | 原因 |
|----------|----------|------|
| 简单分类 | 本地模型 | 成本低，速度快 |
| 复杂分类 | GPT-4 | 准确率高 |
| 属性提取 | Claude | JSON 格式稳定 |
| 内容生成 | GPT-4 | 文案质量好 |

### 成本控制

```python
class CostController:
    def __init__(self, daily_budget=1000):
        self.daily_budget = daily_budget
        self.today_cost = 0

    def can_call(self, model, tokens):
        estimated_cost = self.estimate_cost(model, tokens)
        return self.today_cost + estimated_cost < self.daily_budget

    def on_call_complete(self, actual_cost):
        self.today_cost += actual_cost
        if self.today_cost > self.daily_budget * 0.8:
            self.alert("AI 调用成本即将超预算")
```

### 质量监控

```
┌─────────────────────────────────────────┐
│           AI 质量监控大屏                │
├─────────────┬─────────────┬─────────────┤
│  分类准确率  │  提取成功率  │  日均调用量  │
│    92.3%   │    89.1%    │   15,234    │
├─────────────┼─────────────┼─────────────┤
│  今日成本    │  人工复核率  │  异常告警    │
│   ¥856     │    8.2%     │     3      │
└─────────────┴─────────────┴─────────────┘
```

## 落地效果

| 指标 | 优化前 | 优化后 |
|------|--------|--------|
| 商品分类准确率 | 65% | 92% |
| 属性完整度 | 45% | 89% |
| 单商品处理时间 | 5分钟（人工）| 2秒（AI） |
| 日处理能力 | 500件 | 50000件 |
| 人工成本 | 10人 | 2人（复核） |

## 经验总结

### 1. AI 不是万能的

- 复杂场景仍需人工兜底
- 建立 AI + 人工的协作流程
- 持续收集反馈优化模型

### 2. Prompt 是核心资产

- 好的 Prompt 比选模型更重要
- 建立 Prompt 版本管理
- A/B 测试优化 Prompt 效果

### 3. 成本意识很重要

- 不是所有任务都需要最好的模型
- 建立成本监控和预警机制
- 考虑本地模型降低成本

### 4. 数据质量决定效果

- AI 输出质量取决于输入质量
- 建立数据清洗前置流程
- 垃圾进垃圾出，这点不会变

---

AI 在企业场景的真正价值，不在于取代人，而在于让人从重复劳动中解放出来，专注于更有创造性的工作。
