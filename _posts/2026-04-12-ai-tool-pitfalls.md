---
layout: post
title: "做了一个 AI 工具，踩了一堆坑"
date: 2026-04-12
categories: [AI]
---

# 做了一个 AI 工具，踩了一堆坑

![封面图](images/ai-tool-pitfalls-cover.png)

> 微信反爬虫、9 Provider 图片生成、visibility:hidden……每一个坑都是"没想到会这样"，每一个坑都是工程的本分。

---

## 一、微信反爬虫：三分钟变成三天

WeWrite 有个功能：从公众号文章 URL 提取正文，学习排版风格。

原本以为很简单。`requests.get(url)`，解析 HTML，提取 `#js_content`，完事。

第一天测试，报错了。

微信检测到请求来自脚本，直接返回空白页面。不是 403，是 200 —— 但内容是空的。

**这就是坑了：你以为成功了，其实是失败。**

---

## 二、四级 Fallback：像剥洋葱一样

没办法，开始加 fallback。

**Level 1**：普通 requests，带 UA。大多数文章能过。

**Level 2**：Camoufox 反检测浏览器。这是个专门做反爬的库，模拟真实浏览器指纹。微信的机器人检测被绕过了。

但装 Camoufox 要装 Firefox，要装依赖，Mac 上还有权限问题。折腾半天。

**Level 3**：Playwright。当 Camoufox 都不行时，用 Playwright 启动真正的 Chrome。

**Level 4**：实在不行，让用户自己保存 HTML 文件，传进来。

就这样，一个三分钟的功能，变成了三天的工程。

![四级Fallback示意](images/fallback-levels.png)

---

## 三、visibility:hidden：最阴险的坑

有了浏览器，以为万事大吉。

结果抓到的内容还是空的。

用 Chrome DevTools 一看，`#js_content` 这个 div 确实有内容。但 HTML 里写着：

```html
<div id="js_content" style="visibility:hidden">
  ...内容在这里...
</div>
```

**微信把内容藏起来了。不是 `display:none`，是 `visibility:hidden`。**

`display:none`，元素不在渲染树里，requests 抓不到。`visibility:hidden`，元素在渲染树里，只是看不见。

requests 抓的是原始 HTML，里面有内容。但 BeautifulSoup 默认解析时，某些情况下会把 hidden 的元素处理掉。

又是一个坑。

---

## 四、图片生成：九个 Provider 的接力赛

文章要有配图。WeWrite 支持 AI 图片生成。

原本想用一个 provider。但：

- OpenAI 的 DALL-E 3，$20/月，额度有限
- 豆包的 doubao-seedream，便宜但偶尔不稳定
- Gemini 的 Imagen，好用但国内访问困难
- 阿里的通义万象，稳定但风格偏保守

**没有完美的 provider。**

怎么办？做成 fallback 链：

```
doubao → openai → gemini → dashscope → minimax → replicate → azure → openrouter → jimeng
```

9 个 provider，一个挂了自动换下一个。

代码写好了。测试。发现：

- 有的 provider 返回 base64，有的返回 URL
- 有的 provider 返回 PNG，有的返回 WebP
- 有的 provider 图片太大，微信超过 5MB 会拒绝上传

又写了一堆处理逻辑：base64 解码、格式转换、压缩、重试……

**一个"生成图片"的功能，变成了一个微型 CDN。**

---

## 五、这些坑，值不值得踩？

有人问：这么折腾，有必要么？

我说：

**如果你的工具只给自己用，没必要。凑合能跑就行。**

**如果你想让别人也能用——每个坑都得踩。**

因为用户的环境千奇百怪：

- 有人用 Windows，有人用 Mac，有人用 Linux
- 有人网络通，有人网络不通
- 有人有 OpenAI key，有人只有阿里云 key
- 有人懂命令行，有人只会双击图标

**你的工具得覆盖所有这些情况。**

这不是过度设计。这是工程的本分。

---

## 六、一个预判

接下来一年，会看到很多 AI 工具。

大部分会死在"坑"上：

- 模型调用失败，没有 fallback
- 网络不通，没有处理
- 用户不会配置，直接放弃

真正能活下去的工具，不是功能最炫的，而是坑填得最扎实的。

---

## 结语

做 WeWrite 这几个月，踩的坑比写的代码多。

四级 fallback、九个 provider、visibility:hidden 处理、微信兼容修复……

每一处都是"没想到会这样"，每一处都是"好吧那就这样处理"。

**这不是技术问题，是工程问题。**

技术是知道怎么调用 API。工程是知道 API 调用失败时怎么办。

大抵如此罢。

---

## 关于码孖AI

码孖AI，专注 AI 工程化落地。我们相信：AI 不是来替代程序员的，是来帮程序员省时间的——前提是，你得会用。

**关注我，持续更新实战踩坑指南。**