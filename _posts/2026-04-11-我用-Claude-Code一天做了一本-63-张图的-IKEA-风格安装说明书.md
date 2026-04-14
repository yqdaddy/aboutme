---
layout: post
title: "我用 Claude Code，一天做了一本 63 张图的 IKEA 风格安装说明书"
date: 2026-04-11 10:00:00 +0800
categories: [AI, 技术]
tags: [Claude, AI, Agent, 技术]
author: 码孖AI
---

=========================================

卓勋说

> 不是设计师，没学过 Illustrator ，连 IKEA 说明书长什么样都是现查的。但最后，我真干出来了。

![01_bz00001_配件总览俯视全景](https://mmbiz.qpic.cn/mmbiz_jpg/b88KvCjdBlET1gjFBTvzlKILhwKukS7wfO0huw9fY4L6yutJPjfwtAljxuUoPYKeevu1sNLoLOvo0zCWtE93R8BJxGGOLjlhtEh00W6D1CU/640?from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

事情是这样的。

朋友开了个家具厂，做电动升降储物床。厂里没人懂设计，每次出新包装，都得找外包公司画说明书。一张图一百，六十多张图，外加排版另算。

工期两周。

我说我试试用 AI 做。

朋友说你别扯了，那玩意儿能画技术线稿？ IKEA 那种白底黑线的？

我说我不知道，但我可以试试。

一天后，我把一本 14 页、 63 张图、带繁体中文、越南文、英文三语的 PDF 甩他桌上。

他翻完沉默了半天，说：你这要多少钱？

我说，零成本。

---

第一步：一句提示词开局
-----------

上午 8 点 08 分。

我在 `～/zwork/installationHM` 目录下打开 Claude Code ，输入了第一句话：

> 帮我根据 frames\_all 目录内的截图文件时间顺序，做白底轮廓安装示意说明书，参考 Installation-instructions.pdf ，使用 IKEA 的风格 + 文字描述，可以使用现有的图做 AI 参考生图，最后给我pdf文件。

就这么一句。

没有拆解，没有规划，没有任务列表。

我只知道我要什么：一本跟 PDF 参考文件类似的说明书， IKEA 风格，白底黑线。

目录里有 63 张截图，是从安装视频里切出来的。还有个 427KB 的 PDF ，是越南语版的参考说明书。

够了。

---

第二步：让 AI 自己拆任务
--------------

Claude Code 扫了一眼目录，回了个报告：

```
Total Files: 63 JPEG screenshot files Time Range: 00:15:37 to 00:43:20 (approximately 28 minutes of assembly) Product: upholstered storage bed with hydraulic lift mechanism 
```

然后它自己把 63 张图按时间顺序分成了 12 个步骤：

| 步骤 | 时间戳 | 说明 |
| --- | --- | --- |
| 1 | 00:15:37 | 配件铺地 + 安装木块 |
| 2 | 00:16:xx | 预装螺丝和连接件 |
| 3 | 00:17:35 | 安装气杆到基板 |
| 4 | 00:19:17 | 连接侧板和床头板 |
| 5 | 00:21:30 | 床头板完成（菱形拉扣） |
| ... | ... | ... |

我说好，就按这个来。

---

第三步：第一次尝试，失败
------------

![Image](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

最开始，我们想走捷径。

写了个 Python 脚本，直接用 OpenCV 做边缘检测：

```
edges = cv2.Canny(gray, 50, 150) 
```

生成的图长这样：

```
一团模糊的黑白线条，完全看不清结构
```

我说这什么鬼？

它说这是边缘检测，但问题是照片里的阴影也被检测成线条了。

试了三版：

•Canny 边缘检测 → 阴影太乱

•自适应阈值 → 线条太粗

•Laplacian 算子 → 细节丢失

我说算了，这路不通。

---

第四步：换 AI 生图
-----------

我决定用 Gemini 的图片生成 API 。

第一张图的提示词是这么写的：

```
生成一张 IKEA 风格安装说明书示意图：白色背景，黑色简洁线条画， 展示床的零件平铺在地面上，包括床头板、侧板、床板、气动机架、 螺丝配件等所有零件整齐摆放。线条简洁清晰，类似宜家说明书风格。 
```

调用了 API ，返回了个 JSON 。

解开一看——

```
{   "status": "success",   "image": "base64 encoded image..." } 
```

能用了。

但问题是： 63 张图，每张都要写一遍提示词？

我说你能不能批量生成？

它说可以。

---

第五步：批量生成 63 个提示词
----------------

![14_bz00014_工人准备安装床侧板](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

它写了个脚本，扫描 `frames_all` 目录，给每张截图生成一个提示词文件。

最后生成了 63 个 `.txt` 文件，存在 `image_prompts/` 目录里。

每个文件长这样：

```
## 元数据 - **参考图**：`frames_all/bz00031.jpg` - **安装步骤**：步骤 4 安装气杆机构 / P6  ## IKEA 风格描述 白色背景，黑色细线技术线稿。配件平铺展示：L 形木质支撑架长臂加短臂直角、小型固定木块、6 颗长螺丝并排，用字母标注。等轴测视角，尺寸标注。  ## 提示词 IKEA style technical line drawing, white background black fine lines.  Parts flat-lay: L-shaped wooden support bracket (right angle), small  fixing block, 6 long screws in row. Letter labels, dimension callouts.  Isometric view. No color. 
```

63 个文件，一键生成。

---

第六步：调用生图 Skill
--------------

有了提示词，下一步是调用 `image-generation` Skill 生成图片。

但不是直接调——得先测几张。

我挑了 5 张图，手动跑了一轮。

效果还行，但有几张构图不对。比如「工人准备安装床侧板」那张，参考图里工人是站着的，生成的图里工人蹲着。

我回去改提示词，加了句：

> 工人站立姿势，准备将床侧板插入框架

再生成，就对了。

确认流程没问题后，它写了个脚本，循环调用 63 次。

脚本从凌晨 2 点跑到下午 3 点半，中间有失败重试、有换 appid 、有删掉不满意的图重做。

最后 63 张图，一张不少，全部生成完毕。

---

第七步：排版成书
--------

![23_bz00023_两人展示床头板正面](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

图有了，得排版。

我说用 InDesign ？

它说你会用？

我说我不会。

它说那你用 HTML 吧，写个打印友好的样式，直接浏览器打印成 PDF 。

它写了个 `generate_html.py`，两百行代码：

```
#!/usr/bin/env python3 import os, base64, re  IMG_DIR = '/path/to/generated_images' OUTPUT = '/path/to/安装说明书.html' 
```

我跑了一下，生成了个 HTML 文件，浏览器打开一看：

真像那么回事。

封面是产品完成图，配件页是 5 张配件展示，步骤页是 4 张图一排，完成页是 8 张角度图。

我点了打印，存成 PDF 。

14 页， 63 张图，文件大小 19MB 。

---

第八步：三语翻译
--------

朋友说能不能加个越南文？他们厂有一部分货出口越南。

我说行。

它说用 DeepL API 或者 Google Translate API ，写个脚本把中文翻译成越南文和英文，再重新生成 HTML 。

我找了个免费的翻译 API ，写了个脚本，把说明书里的文字全翻了一遍。

重新生成 HTML ，再存成 PDF 。

三语版本，搞定。

---

复盘：整个过程花了多久？
------------

![31_bz00031_气杆支撑架配件展示](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

来，看时间戳（从 deja 历史记录里扒的）：

•**8:08 AM**：开局，第一次调用 API 生图

•**8:19 AM**：启动批量生成脚本

•**3:33 PM**： 63 张图全部生成完毕

•**4:42 PM**： HTML 排版完成

•**5:14 PM**：项目完成

实际耗时：

**1 天**。

其中大部分时间在等 AI 生图（ 63 张图，每张约 1 分钟），剩下时间：

•跟 Claude Code 对话拆解任务：约 1 小时

•调试脚本和改提示词：约 1 小时

•排版、翻译、导出 PDF ：约 1 小时

---

核心代码复盘
------

整个项目，真正手写的代码不到 300 行：

| 文件 | 行数 | 用途 |
| --- | --- | --- |
| `manual_lineart.py` | 80 | 初步尝试边缘检测（失败方案） |
| `gen_all_images.py` | 60 | 批量调用 API 生图脚本 |
| `generate_html.py` | 120 | HTML 排版 + 打印 |
| 各种 one-liner | 40 | 救火脚本（删图/重做/转换格式） |

剩下的，全是跟 Claude Code 对话「聊」出来的。

---

踩坑记录
----

### 坑 1 ：边缘检测走不通

![45_bz00045_电连接插头对接特写](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

第一版方案是用 OpenCV 做边缘检测，以为能直接把照片转成线稿。

结果生成的图一团模糊，阴影全被检测成线条。

**经验**：照片转线稿不是简单的边缘检测， AI 生成比传统图像处理更靠谱。

### 坑 2 ：工人姿势总不对

有张图是「工人准备安装床侧板」，参考图里工人站着，生成的图里工人蹲着。

改了三版提示词：

•~~worker preparing to install side panel~~ → 生成蹲着的

•~~worker standing, installing panel~~ → 生成弯腰的

•**工人站立姿势，准备将床侧板插入框架** → 对了

**经验**：动作描述要具体到「姿势 + 目标」。

### 坑 3 ： API 会失败，要能重跑

![48_bz00048_三人配合翻转安装床板](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

63 张图不是一次性生成的。

第一批跑了 4 张（ 01-05 手动， 06-63 批量），结果有几张构图不对。

删了 3 张重做（ 44 、 53 、 55 ），换了个 appid 再跑。

**经验**：批量脚本要能断点续跑，别跑完了才发现全错了。

### 坑 4 ： HTML 打印时图片被截断

![54_bz00054_升起状态检查连接工人操作](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

第一版 CSS 没设 `page-break-inside: avoid;`，打印时图片跨页了。

加了这句：

```
.step-item {      page-break-inside: avoid;  } 
```

解决。

**经验**：打印 CSS 要单独测，屏幕看着没问题不等于打印没问题。

---

最后说句实在话
-------

![56_bz00056_完成状态正面全景](data:image/svg+xml,%3C%3Fxml%20version='1.0'%20encoding='UTF-8'%3F%3E%3Csvg%20width='1px'%20height='1px'%20viewBox='0%200%201%201'%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

我不是设计师，就是一个程序员。

但这事做完，我有个感觉：

AI 这东西，真不是来替代人的。它是来帮你省时间的——前提是你得会用。

你得知道要什么，知道怎么问，知道怎么改。

它给你初稿，你给它反馈。它改一版，你看一眼，再改一版。

来回五轮，东西就成了。

这过程，没人能替你干。

AI 只是把「执行」那部分包了，「判断」那部分，还是得你来。

所以别焦虑。

焦虑没用，学怎么提问才有用。

---

项目文件清单
------

如果你想复现这个项目，以下是关键文件：

```
installationHM/ ├── frames_all/                    # 63 张原始截图 ├── image_prompts/                 # 63 个提示词文件 ├── generated_images/              # 63 张生成的线稿图 ├── scripts/ │   ├── manual_lineart.py         # 边缘检测脚本（废弃） │   └── generate_html.py          # HTML 生成脚本 ├── 安装说明书.html        # 最终 HTML 输出 ├── 安装说明书.pdf         # 最终 PDF 输出 └── 说明书框架文档.md               # 完整规格说明 
```

---

**关于码孖 AI**

码孖 AI ，专注 AI 工程化落地。我们相信： AI 不是来替代程序员的，是来帮程序员省时间的——前提是，你得会用。

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