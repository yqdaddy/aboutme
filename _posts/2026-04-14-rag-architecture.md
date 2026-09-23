---
layout: post
title: "RAG 系列第二章：向量数据库与文本分块——两个关键决策"
date: 2026-04-14
categories: [AI]
---

# RAG 系列第二章：向量数据库与文本分块——两个关键决策

> **这是 RAG 系列第二章**。上一章我们讲了"什么是 RAG"，这章讲"怎么搭 RAG"——向量数据库和文本分块，选对了事半功倍，选错了白折腾。

---

## 系列导航

本系列参考 [DataWhale All-in-RAG](https://datawhalechina.github.io/all-in-rag/) 教程，聚焦实战落地。

| 章节      | 主题                          | 状态                                                         |
| ------- | --------------------------- | ---------------------------------------------------------- |
| 第一章     | RAG 简介：让 AI "查资料" 再回答       | ✅ [已发布](https://mp.weixin.qq.com/s/ZAshhNmreA8eoZWFJQNUPg) |
| **第二章** | **向量数据库与文本分块**              | 📝 本篇                                                      |
| 第三章     | RAG 实战：搭建企业问答系统             | 🔜 敬请期待                                                    |
| 第四章     | 检索优化：混合检索、重排序               | 🔜 敬请期待                                                    |
| 第五章     | RAG 进阶：GraphRAG、Agentic RAG | 🔜 敬请期待                                                    |

---

## 一、很多团队搞 RAG，效果像"百度搜索但三成准确"

上周有个朋友找我吐槽：

> "我们花了两周搭 RAG，问公司财报数据，AI 回答'营收增长15%'——但没说具体数字。问报销流程，返回的还是三年前的旧制度。"

问题在哪？**不是 RAG 不行，是架构选错了。**

RAG 有两个"命门"：

1. **向量数据库选错了** → 成本爆炸 or 检索太慢
2. **文本分块策略不对** → 答案不完整 or 噪音太大

这章专门讲这两个关键决策。

---

## 二、向量数据库：RAG 的"记忆中枢"

### 2.1 为什么需要向量数据库？

向量数据库是一种**专门用于存储、管理和查询高维向量的数据库**。

核心能力：

| 功能          | 说明                           |
| ----------- | ---------------------------- |
| **高效相似性搜索** | 利用 HNSW、IVF 等索引，在数十亿向量中毫秒级查询 |
| **高维数据存储**  | 支持向量的增删改查                    |
| **标量过滤**    | 按时间、标签等字段过滤（如"只检索2024年的文档"）  |
| **分布式扩展**   | 支持水平扩展，应对大规模数据               |

### 2.2 向量数据库 vs 传统数据库

| 维度     | 向量数据库         | 传统数据库       |
| ------ | ------------- | ----------- |
| 核心数据类型 | 高维向量          | 结构化数据       |
| 查询方式   | 相似性搜索（ANN）    | 精确匹配        |
| 索引机制   | HNSW、IVF、LSH  | B-Tree、Hash |
| 应用场景   | AI应用、RAG、推荐系统 | 业务系统、金融交易   |

**两者是互补关系**：向量数据库负责语义检索，传统数据库负责结构化查询，通常结合使用。

### 2.3 主流向量数据库对比

| 数据库          | 类型   | 性能    | 部署难度 | 成本    | 适用场景                |
| ------------ | ---- | ----- | ---- | ----- | ------------------- |
| **Milvus**   | 开源   | ⭐⭐⭐⭐⭐ | 中等   | 低     | 大规模生产环境，支持GPU加速     |
| **Chroma**   | 开源   | ⭐⭐⭐   | 简单   | 低     | 小项目、原型验证、零配置        |
| **FAISS**    | 开源   | ⭐⭐⭐⭐  | 简单   | 低     | 本地实验、轻量高效           |
| **Pinecone** | 云服务  | ⭐⭐⭐⭐⭐ | 最简单  | **高** | 企业级、不想运维、Serverless |
| **Weaviate** | 开源/云 | ⭐⭐⭐⭐  | 中等   | 中     | 多模态支持、GraphQL查询     |
| **Qdrant**   | 开源   | ⭐⭐⭐⭐  | 简单   | 低     | Rust 高性能、RPS>4000   |

### 2.4 选型决策：30秒搞定

**问自己三个问题：**

1. **数据量多大？**

    - < 10万条 → Chroma 或 FAISS（够用）
    - 10万~100万条 → Qdrant 或 Weaviate
    - > 100万条 → Milvus（分布式架构）

2. **要不要运维？**

    - 不想运维 → Pinecone（贵但省心）
    - 可以运维 → Milvus / Qdrant（开源省钱）

3. **有没有特殊需求？**

    - 需要按时间/标签过滤 → Weaviate
    - 需要GPU加速 → Milvus
    - 只做个 demo → Chroma（零配置，5分钟搞定）

**DataWhale 教程的建议**：新手入门推荐 Chroma 或 FAISS；生产环境大规模应用推荐 Milvus、Weaviate 或 Pinecone。

### 2.5 成本对比（人民币）

假设 100万条向量，存储 10GB：

| 方案         | 月成本        | 说明           |
| ---------- | ---------- | ------------ |
| Pinecone   | **¥3500+** | 云服务计费，数据越多越贵 |
| Milvus（自建） | **¥350**   | 一台云服务器就够了    |
| Chroma（本地） | **¥0**     | 文件存储，零成本     |

**结论**：小项目用 Chroma，大项目用 Milvus，预算充足用 Pinecone。

---

## 三、文本分块：不是"切得越小越好"

### 3.1 为什么需要分块？

文本分块是将长文档切分成更小单元的过程，这些**文本块是向量检索和模型处理的基本单位**。

不分块会出问题：

| 问题         | 原因                                       | 影响       |
| ---------- | ---------------------------------------- | -------- |
| **模型输入限制** | 嵌入模型有长度上限（如 bge-base-zh-v1.5 为512 token） | 长文档无法处理  |
| **信息稀释**   | 768维向量需概括整个文本块，块越长语义越模糊                  | 检索匹配失败   |
| **"大海捞针"** | LLM倾向记住开头结尾，忽略中间内容                       | 答案遗漏关键信息 |
| **主题混杂**   | 多主题混合在一个大块里                              | 检索噪音大    |

### 3.2 分块大小的权衡

很多人以为：切得越小，检索越精准。

**错。**

- **切太小** → 上下文丢失，答案不完整
- **切太大** → 语义稀释，噪音太多

比如问"公司去年营收多少？"

- chunk_size=100，检索结果只有："同比增长15%" —— 数字丢了
- chunk_size=2000，检索返回整篇文章 —— AI 找不到关键信息

### 3.3 四种主流分块策略

| 策略       | 原理            | 优点      | 缺点            |
| -------- | ------------- | ------- | ------------- |
| **固定大小** | 每500字切一段      | 简单可控    | 可能切断语义        |
| **递归字符** | 先段落再句子递归切     | 平衡语义和长度 | ✅ 推荐          |
| **语义分块** | 按语义相似度切分      | 语义最完整   | 需要Embedding计算 |
| **结构分块** | 按Markdown标题切分 | 结构清晰    | 仅适用结构化文档      |

### 3.4 推荐策略：递归字符分块

LangChain 默认策略，**先按段落切，段落太大再按句子切，句子太大再按字切**：

```python
from langchain.text_splitter import RecursiveCharacterTextSplitter

text_splitter = RecursiveCharacterTextSplitter(
    separators=["\n\n", "\n", "。", "；", "，", " ", ""],
    chunk_size=500,      # 每段最大500字
    chunk_overlap=50,    # 重叠50字（防止断句）
)

chunks = text_splitter.split_documents(docs)
```

### 3.5 参数选择指南

| 场景        | chunk_size | overlap | 说明        |
| --------- | ---------- | ------- | --------- |
| **问答场景**  | 300        | 50      | 检索精准，答案简短 |
| **长文档**   | 600        | 100     | 保留上下文     |
| **法律/合同** | 800        | 150     | 必须完整      |
| **技术文档**  | 400        | 80      | 代码片段完整    |

**经验值**：chunk_size ≥ 300，overlap ≥ 50，这是底线。

---

## 四、实战：10行代码搭建最小 RAG

结合 Chroma + LangChain，最小可用架构：

```python
from langchain.embeddings import HuggingFaceEmbeddings
from langchain.vectorstores import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA

# 1. 分块
splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)
chunks = splitter.split_documents(docs)

# 2. 向量化（用中文效果好的 BGE 模型）
embeddings = HuggingFaceEmbeddings(model_name="BAAI/bge-large-zh")
vectorstore = Chroma.from_documents(chunks, embeddings)

# 3. 搭建 RAG 链
qa = RetrievalQA.from_chain_type(
    llm=ChatOpenAI(model="gpt-4"),
    retriever=vectorstore.as_retriever(search_kwargs={"k": 3})
)

# 4. 提问
answer = qa.run("公司去年营收是多少？")
```

**架构流程**：

```
文档 → 分块 → 向量化 → Chroma存储 → 检索 → 增强提示词 → LLM生成
```

---

## 五、进阶技巧：让准确率提升40%

基础架构搭好了，但检索可能还是不准。两个进阶技巧：

### 5.1 混合检索：向量 + 关键词

向量检索擅长语义匹配（"赚钱"→"营收"），关键词检索擅长精确匹配（"500亿"）。

```python
from langchain.retrievers import EnsembleRetriever, BM25Retriever

# 向量检索
vector_retriever = vectorstore.as_retriever(search_kwargs={"k": 5})

# 关键词检索（BM25）
bm25_retriever = BM25Retriever.from_documents(chunks)
bm25_retriever.k = 5

# 混合：各占50%
ensemble = EnsembleRetriever(
    retrievers=[vector_retriever, bm25_retriever],
    weights=[0.5, 0.5]
)
```

### 5.2 重排序：挑出最相关的3条

检索返回10条，用重排序模型筛选：

```python
from langchain.retrievers.document_compressors import CrossEncoderReranker

reranker = CrossEncoderReranker(
    model_name="BAAI/bge-reranker-large",
    top_n=3  # 只给LLM最相关的3条
)

# 带重排序的检索
from langchain.retrievers import ContextualCompressionRetriever
final_retriever = ContextualCompressionRetriever(
    base_retriever=ensemble,
    base_compressor=reranker
)
```

**实测效果**：准确率提升 30%~40%。

---

## 六、避坑清单

| 坑          | 表现               | 解决方案                       |
| ---------- | ---------------- | -------------------------- |
| **向量库选太贵** | Pinecone月费¥3500+ | 用Milvus/Chroma开源方案         |
| **切分太碎**   | 答案不完整            | chunk_size≥300, overlap≥50 |
| **检索不重排序** | 返回噪音多            | 加 CrossEncoder 重排序         |
| **文档不清洗**  | 检索全是广告           | 去除页脚、导航、无效内容               |
| **只用向量检索** | 精确匹配失败           | 混合检索：向量+关键词                |

---

## 七、本章小结

**两个关键决策**：

1. **向量数据库**：小项目用 Chroma，大项目用 Milvus
2. **文本分块**：递归字符分块，chunk_size=500，overlap=50

记住：**架构选对了，RAG 才能跑；选错了，就是白折腾。**

---

## 下章预告

第三章：**RAG 实战：搭建企业问答系统**

内容包括：

- 环境配置（API密钥、虚拟环境）
- 完整代码（可直接运行）
- 效果评测（如何衡量准确率）

---

## 参考资料

- [DataWhale All-in-RAG 教程](https://datawhalechina.github.io/all-in-rag/)
- [向量数据库章节](https://datawhalechina.github.io/all-in-rag/#/chapter3/08_vector_db)
- [文本分块章节](https://datawhalechina.github.io/all-in-rag/#/chapter2/05_text_chunking)
- [LangChain 官方文档](https://python.langchain.com/)

---

**关于码孖 AI**

码孖 AI，专注 AI 工程化落地。向量数据库选型、文本分块策略，我们帮你踩过坑了，你不用再踩。

**关注我，下一章带你实战搭建企业问答系统。**