---
layout: post
title: "RAG 系列第二章：准备工作——环境搭建与 API 配置"
date: 2026-04-14
categories: [AI]
---

# RAG 系列第二章：准备工作——环境搭建与 API 配置

> **这是 RAG 系列第二章**。上一章我们了解了"什么是 RAG"，这章讲"怎么开始"——先把环境搭好，API 配好，才能动手写代码。很多新手卡在这一步，我们帮你省掉踩坑时间。

---

## 系列导航

本系列参考 [DataWhale All-in-RAG](https://datawhalechina.github.io/all-in-rag/) 教程，聚焦实战落地。

| 章节      | 主题                     | 状态                                                         |
| ------- | ---------------------- | ---------------------------------------------------------- |
| 第一章     | RAG 简介：让 AI "查资料" 再回答  | ✅ [已发布](https://mp.weixin.qq.com/s/ZAshhNmreA8eoZWFJQNUPg) |
| **第二章** | **准备工作：环境搭建与 API 配置**  | 📝 本篇                                                      |
| 第三章     | 四步构建 RAG：从零到运行         | 🔜 敬请期待                                                    |
| 第四章     | 数据加载：PDF、Word、网页多格式处理  | 🔜 敬请期待                                                    |
| 第五章     | 文本分块：切分策略与参数选择         | 🔜 敬请期待                                                    |
| 第六章     | 向量嵌入：Embedding 模型选择与实战 | 🔜 敬请期待                                                    |

👉 **没看上一篇？** 先花3分钟了解 RAG 基础：[点击阅读第一章](https://mp.weixin.qq.com/s/ZAshhNmreA8eoZWFJQNUPg)

---

## 一、准备工作：新手最容易卡的地方

很多新手想学 RAG，打开教程看到：

```
pip install langchain
export OPENAI_API_KEY=sk-xxx
```

然后卡住了：

- "pip install 报错怎么办？"
- "API Key 从哪申请？"
- "我没有 OpenAI 账号怎么办？"
- "Windows 怎么配置环境变量？"

这章专门解决这些问题。**看完你就能：**

- 申请到免费的 API Key
- 配置好 Python 开发环境
- 跑起第一个 RAG 程序

---

## 二、大模型 API 配置：先拿到"钥匙"

RAG 需要调用大模型，先搞定 API Key。

### 2.1 国内推荐：DeepSeek API

DeepSeek 是国内大模型厂商，**免费额度足够学习使用**。

**申请步骤**：

1. 访问 [DeepSeek 开放平台](https://platform.deepseek.com/)
2. 注册登录（支持微信扫码）
3. 点击「API Keys」→「创建 API Key」
4. 复制保存密钥（**只显示一次，务必保存**）

> ⚠️ **重要提醒**：API Key 创建后只完整显示一次，务必立即保存到安全地方。

### 2.2 备选方案：其他 API

| API          | 优势     | 获取方式                                     |
| ------------ | ------ | ---------------------------------------- |
| **OpenAI**   | 效果最强   | 需要海外账号 + 付费                              |
| **通义千问（阿里）** | 中文效果好  | [阿里云开放平台](https://dashscope.aliyun.com/) |
| **智谱 GLM**   | 成本低    | [智谱开放平台](https://open.bigmodel.cn/)      |
| **硅基流动**     | 聚合多家模型 | [硅基流动](https://siliconflow.cn/)          |

### 2.3 API Key 存放位置

推荐放在环境变量中，**不要写在代码里**（容易泄露）。

---

## 三、开发环境配置：Python 虚拟环境

### 3.1 为什么需要虚拟环境？

不同项目依赖不同版本的库，混在一起会冲突。虚拟环境让每个项目有独立的"依赖空间"。

### 3.2 安装 Miniconda（推荐）

Miniconda 是轻量版的 Anaconda，适合 Python 开发。

**下载地址**：[清华镜像站](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/)（国内快）

**安装步骤**：

```bash
# macOS/Linux
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Windows：下载 .exe 文件直接安装
# 注意：安装时不要勾选 "Add to PATH"，手动配置更安全
```

### 3.3 创建虚拟环境

```bash
# 创建名为 rag 的虚拟环境，Python 3.12
conda create --name rag python=3.12

# 激活环境
conda activate rag

# 查看当前环境
conda info --envs
```

### 3.4 配置环境变量

**macOS/Linux**：在 `~/.bashrc` 或 `~/.zshrc` 末尾添加：

```bash
export DEEPSEEK_API_KEY="你的密钥"
```

然后执行：

```bash
source ~/.bashrc  # 或 source ~/.zshrc
```

**Windows**：

1. 打开「系统属性」→「高级」→「环境变量」
2. 点击「新建用户变量」
3. 变量名：`DEEPSEEK_API_KEY`
4. 变量值：你的密钥

---

## 四、依赖安装：RAG 项目需要哪些库？

### 4.1 核心依赖

创建 `requirements.txt`：

```text
langchain>=0.3.0
langchain-community>=0.3.0
langchain-openai>=0.2.0
chromadb>=0.5.0
sentence-transformers>=2.2.0
pypdf>=4.0.0
python-docx>=1.1.0
```

### 4.2 安装命令

```bash
# 激活虚拟环境
conda activate rag

# 安装依赖
pip install -r requirements.txt

# 国内加速（清华镜像）
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 4.3 验证安装

```python
# 测试脚本 test_env.py
import langchain
import chromadb
import sentence_transformers

print(f"LangChain: {langchain.__version__}")
print(f"ChromaDB: {chromadb.__version__}")
print("环境配置成功！")
```

运行：

```bash
python test_env.py
```

---

## 五、云环境方案：不想本地折腾？

如果你本地环境配置困难，可以用云端开发环境。

### 5.1 GitHub Codespaces（推荐）

GitHub 提供的云端开发环境，**每月免费 60 小时**。

**使用步骤**：

1. Fork [DataWhale all-in-rag 项目](https://github.com/datawhalechina/all-in-rag)

2. 点击「Code」→「Codespaces」→「New codespace」

3. 等待环境创建完成（约2分钟）

4. 在终端配置 API Key：

   ```bash
   export DEEPSEEK_API_KEY="你的密钥"
   ```

5. 安装依赖：

   ```bash
   cd code
   pip install -r requirements.txt
   ```

### 5.2 Cloud Studio（国内推荐）

腾讯云提供的云端开发环境，**每月免费 50 小时**。

**优势**：

- 国内访问快
- 不需要 GitHub 账号
- 预装 Python 环境

**使用步骤**：

1. 访问 [Cloud Studio](https://cloudstudio.net/)

2. 从 Git 仓库导入项目地址

3. 创建应用

4. 在终端执行：

   ```bash
   su ubuntu  # 切换普通用户
   sudo chown -R ubuntu:ubuntu code models
   cd code && pip install -r requirements.txt
   ```

---

## 六、Windows 环境补充

Windows 用户可能遇到一些特殊问题。

### 6.1 Miniconda PATH 配置

安装时不要勾选 "Add to PATH"，手动添加这三个路径：

```text
C:\Users\你的用户名\miniconda3
C:\Users\你的用户名\miniconda3\Scripts
C:\Users\你的用户名\miniconda3\Library\bin
```

### 6.2 Conda 镜像源配置

```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```

### 6.3 PowerShell 执行权限

如果 PowerShell 报错"无法执行脚本"：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 七、环境配置清单

完成后检查这个清单：

| 检查项          | 命令                                                           | 预期结果          |
| ------------ | ------------------------------------------------------------ | ------------- |
| Python 版本    | `python --version`                                           | Python 3.12.x |
| 虚拟环境激活       | `conda info --envs`                                          | 当前环境显示 `rag`  |
| API Key 配置   | `echo $DEEPSEEK_API_KEY`                                     | 显示你的密钥        |
| LangChain 安装 | `python -c "import langchain; print(langchain.__version__)"` | 显示版本号         |
| ChromaDB 安装  | `python -c "import chromadb"`                                | 无报错           |

---

## 八、常见问题

| 问题                  | 原因      | 解决方案                                                |
| ------------------- | ------- | --------------------------------------------------- |
| `pip install` 报错    | 网络问题    | 用清华镜像 `-i https://pypi.tuna.tsinghua.edu.cn/simple` |
| `conda create` 慢    | 默认源在国外  | 配置清华镜像源                                             |
| API Key 无效          | 复制错误/过期 | 重新申请，确保完整复制                                         |
| PowerShell 执行报错     | 权限限制    | 执行 `Set-ExecutionPolicy RemoteSigned`               |
| ModuleNotFoundError | 虚拟环境未激活 | 执行 `conda activate rag`                             |

---

## 九、本章小结

**准备工作三步走**：

1. **申请 API Key**：DeepSeek 免费，适合学习
2. **配置虚拟环境**：Miniconda + conda create
3. **安装依赖**：pip install -i 清华镜像

记住：**环境搭好了，后面写代码才不会卡。**

---

## 下章预告

第三章：**四步构建 RAG：从零到运行**

内容包括：

- 加载文档（PDF、Word）
- 文本分块
- 向量化存储
- 检索生成

**10行代码跑起第一个 RAG 程序。**

---

## 参考资料

- [DataWhale All-in-RAG：准备工作](https://datawhalechina.github.io/all-in-rag/#/chapter1/02_preparation)
- [DeepSeek 开放平台](https://platform.deepseek.com/)
- [Miniconda 清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [Cloud Studio](https://cloudstudio.net/)

---

**关于码孖 AI**

码孖 AI，专注 AI 工程化落地。环境搭建、API 配置，这些"准备工作"我们帮你踩过坑了，你照着做就行。

**关注我，下一章带你写第一个 RAG 程序。**