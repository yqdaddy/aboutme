# 博客主页完整升级实现计划

> **面向 AI 代理的工作者：** 必需子技能：使用 superpowers:subagent-driven-development（推荐）或 superpowers:executing-plans 逐任务实现此计划。步骤使用复选框（`- [ ]`）语法来跟踪进度。

**目标：** 升级博客主页，增强个人品牌感、视觉层次清晰、有温度的用户体验

**架构：** 保持现有 Jekyll/GitHub Pages 结构，在 `index.md` 中添加新区块（时间线、技术栈矩阵），在 `style.css` 中升级卡片样式和添加新样式

**技术栈：** Jekyll 4.x、CSS3、SVG 动画、深色模式 CSS 变量

---

## 文件结构

| 文件 | 职责 | 状态 |
|------|------|------|
| `index.md` | 主页内容，包含 Hero、文章、作者、时间线、技术栈、项目区块 | 修改 |
| `assets/css/style.css` | 全局样式，包含卡片、时间线、矩阵、深色模式适配 | 修改 |
| `_layouts/default.html` | Jekyll 布局，保持不变 | 无变更 |

---

## 任务 1：文章卡片样式升级（视觉丰富型）

**文件：**
- 修改：`assets/css/style.css` (现有 `.post-card` 样式升级)
- 修改：`index.md` (文章卡片 HTML 结构调整)

**目标：** 添加彩色渐变条、图标区域、标签样式优化

**注意：** 新增样式使用 `.post-card-rich` 类作为容器，避免与现有 `.post-card-content` 样式冲突。

- [ ] **步骤 0：定义标签颜色分类映射**

建立文章标签到颜色分类的映射规则：

| 标签关键词 | 映射分类 | CSS class |
|------------|----------|-----------|
| Claude Code, Claude, Agent, RAG, LLM, AI, Prompt, 大模型 | AI/大模型 | `claude-code` |
| 实战, 案例, 项目实战, 0到1, IKEA | 实战案例 | `case-study` |
| ToB, SaaS, 微服务, 电商, S2B2C, 系统架构 | ToB SaaS | `tob-saas` |
| 踩坑, 坑, 避坑, 总结, 经验 | 踩坑总结 | `pitfall` |
| 其他/未匹配 | 默认 | `tob-saas` |

Liquid 模板判断逻辑：
```liquid
{% assign color_class = 'tob-saas' %}
{% assign icon_emoji = '🏗️' %}
{% for tag in post.tags %}
  {% if tag contains 'Claude' or tag contains 'AI' or tag contains 'RAG' or tag contains 'Agent' or tag contains 'LLM' %}
    {% assign color_class = 'claude-code' %}
    {% assign icon_emoji = '🧠' %}
    {% break %}
  {% elsif tag contains '实战' or tag contains '案例' or tag contains '0到1' %}
    {% assign color_class = 'case-study' %}
    {% assign icon_emoji = '⚡' %}
    {% break %}
  {% elsif tag contains '踩坑' or tag contains '避坑' or tag contains '总结' %}
    {% assign color_class = 'pitfall' %}
    {% assign icon_emoji = '🔧' %}
    {% break %}
  {% endif %}
{% endfor %}
```

- [ ] **步骤 1：添加彩色条样式**

在 `style.css` 中 `.post-card` 样式块后添加：

```css
/* 文章卡片彩色条 */
.post-card-bar {
  height: 4px;
  border-radius: 16px 16px 0 0;
  margin-bottom: 0;
}

.post-card-bar.claude-code {
  background: linear-gradient(90deg, #6366f1, #8b5cf6, #ec4899);
}

.post-card-bar.case-study {
  background: linear-gradient(90deg, #f59e0b, #ef4444);
}

.post-card-bar.tob-saas {
  background: linear-gradient(90deg, #10b981, #14b8a6);
}

.post-card-bar.pitfall {
  background: #10b981;
}

/* 精选文章大卡片 - 横跨两列 */
.post-card-featured-large {
  grid-column: span 2;
}

@media (max-width: 768px) {
  .post-card-featured-large {
    grid-column: span 1;
  }
}
```

- [ ] **步骤 2：添加图标区域样式**

```css
/* 文章卡片图标区域 */
.post-card-icon {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  margin-right: 12px;
  flex-shrink: 0;
}

.post-card-icon.claude-code {
  background: linear-gradient(135deg, #6366f1, #8b5cf6);
}

.post-card-icon.case-study {
  background: linear-gradient(135deg, #f59e0b, #ef4444);
}

.post-card-icon.tob-saas {
  background: linear-gradient(135deg, #10b981, #14b8a6);
}

.post-card-icon.pitfall {
  background: #10b981;
}
```

- [ ] **步骤 3：优化标签样式**

修改现有 `.tag-small` 或添加：

```css
/* 文章卡片标签 - 视觉丰富型 */
.post-card-tags-rich {
  display: flex;
  gap: 6px;
  margin-bottom: 10px;
}

.post-card-tags-rich .tag-colored {
  padding: 4px 10px;
  border-radius: 6px;
  font-size: 11px;
  font-weight: 500;
}

.post-card-tags-rich .tag-colored.claude-code {
  background: rgba(99, 102, 241, 0.15);
  color: #6366f1;
}

.post-card-tags-rich .tag-colored.case-study {
  background: rgba(245, 158, 11, 0.15);
  color: #b45309;
}

.post-card-tags-rich .tag-colored.tob-saas {
  background: rgba(16, 185, 129, 0.15);
  color: #047857;
}

.post-card-tags-rich .tag-colored.pitfall {
  background: rgba(16, 185, 129, 0.15);
  color: #047857;
}
```

- [ ] **步骤 4：添加底部信息样式**

```css
/* 文章卡片底部信息 */
.post-card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 14px;
  padding-top: 12px;
  border-top: 1px solid var(--border-color);
  font-size: 11px;
  color: var(--text-muted);
}

.post-card-reading-time {
  display: flex;
  align-items: center;
  gap: 4px;
}

.post-card-featured {
  display: flex;
  align-items: center;
  gap: 4px;
  color: #f59e0b;
}
```

- [ ] **步骤 5：修改文章卡片 HTML 结构**

在 `index.md` 的文章循环中，整合步骤 0 的判断逻辑和卡片结构：

```liquid
{% for post in site.posts limit:6 %}
{% assign index = forloop.index0 %}

<!-- 步骤0：标签颜色分类判断 -->
{% assign color_class = 'tob-saas' %}
{% assign icon_emoji = '🏗️' %}
{% for tag in post.tags %}
  {% if tag contains 'Claude' or tag contains 'AI' or tag contains 'RAG' or tag contains 'Agent' or tag contains 'LLM' %}
    {% assign color_class = 'claude-code' %}
    {% assign icon_emoji = '🧠' %}
    {% break %}
  {% elsif tag contains '实战' or tag contains '案例' or tag contains '0到1' %}
    {% assign color_class = 'case-study' %}
    {% assign icon_emoji = '⚡' %}
    {% break %}
  {% elsif tag contains '踩坑' or tag contains '避坑' or tag contains '总结' %}
    {% assign color_class = 'pitfall' %}
    {% assign icon_emoji = '🔧' %}
    {% break %}
  {% endif %}
{% endfor %}

<!-- 卡片HTML（使用动态变量） -->
<article class="post-card post-card-rich {% if post.featured %}post-card-featured-large{% endif %}" style="--index: {{ index }}">
  <div class="post-card-bar {{ color_class }}"></div>
  <div class="post-card-content">
    <div class="post-card-header">
      <div class="post-card-icon {{ color_class }}">
        <span style="color: white;">{{ icon_emoji }}</span>
      </div>
      <div>
        <h3 class="post-card-title">{{ post.title }}</h3>
        <time class="post-card-date">{{ post.date | date: "%Y-%m-%d" }}</time>
      </div>
    </div>
    <div class="post-card-tags-rich">
      {% for tag in post.tags limit:2 %}
      <span class="tag-colored {{ color_class }}">{{ tag }}</span>
      {% endfor %}
    </div>
    <p class="post-card-excerpt">{{ post.excerpt | strip_html | truncate: 120 }}</p>
    <div class="post-card-footer">
      <span class="post-card-reading-time">📖 预计 {{ post.content | number_of_words | divided_by: 180 }} 分钟</span>
      {% if post.featured %}
      <span class="post-card-featured">⭐ 精选</span>
      {% endif %}
    </div>
  </div>
</article>
{% endfor %}
```

- [ ] **步骤 6：本地预览验证**

运行：`bundle exec jekyll serve`
预期：文章卡片显示彩色条、图标、标签样式正确

- [ ] **步骤 7：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "feat: 文章卡片样式升级 - 彩色条、图标、标签优化"
```

---

## 任务 2：作者区域暖色卡片

**文件：**
- 修改：`assets/css/style.css` (新增 `.author-card` 样式)
- 修改：`index.md` (替换现有 `.about-preview` 区块)

**目标：** 创建暖色渐变背景的作者卡片，包含头像、简介、特点标签、数据展示

- [ ] **步骤 1：添加作者卡片基础样式**

```css
/* 作者卡片 - 暖色背景 */
.author-card {
  background: linear-gradient(135deg, #fef3c7, #fde68a);
  border-radius: 20px;
  padding: 32px;
  display: flex;
  gap: 24px;
  align-items: center;
}

.author-avatar-area {
  flex: 0 0 120px;
  text-align: center;
}

.author-avatar {
  width: 80px;
  height: 80px;
  background: #f59e0b;
  border: 3px solid #fcd34d;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  color: white;
  font-size: 28px;
  font-weight: 700;
}

.author-name {
  font-size: 18px;
  font-weight: 700;
  color: #1e293b;
  margin-top: 12px;
}

.author-brand {
  font-size: 12px;
  color: #92400e;
}
```

- [ ] **步骤 2：添加作者信息区域样式**

```css
/* 作者信息区域 */
.author-info {
  flex: 1;
}

.author-intro {
  font-size: 15px;
  color: #78716c;
  line-height: 1.7;
  margin-bottom: 16px;
}

.author-strengths {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.author-strength-tag {
  background: white;
  padding: 8px 16px;
  border-radius: 10px;
  font-size: 13px;
  color: #92400e;
  border: 1px solid rgba(245, 158, 11, 0.2);
}

/* 作者数据展示 */
.author-stats {
  display: flex;
  gap: 24px;
  margin-top: 16px;
  padding-top: 16px;
  border-top: 1px solid rgba(245, 158, 11, 0.3);
}

.author-stat {
  text-align: center;
}

.author-stat-number {
  font-size: 20px;
  font-weight: 700;
  color: #1e293b;
}

.author-stat-label {
  font-size: 11px;
  color: #92400e;
}
```

- [ ] **步骤 3：添加作者卡片 HTML**

在 `index.md` 中替换现有的 `.about-preview` 区块：

```html
<!-- 作者区域 -->
<section class="author-section">
  <div class="container">
    <div class="author-card">
      <div class="author-avatar-area">
        <div class="author-avatar">ZX</div>
        <div class="author-name">卓勋</div>
        <div class="author-brand">码孖AI</div>
      </div>
      <div class="author-info">
        <p class="author-intro">15年+ 技术负责人，深耕 ToB SaaS、智能硬件、AI工程化。能下沉一线解决复杂问题，能规划技术路线，能带队稳定交付。</p>
        <div class="author-strengths">
          <span class="author-strength-tag">🔧 下沉一线</span>
          <span class="author-strength-tag">📈 规划路线</span>
          <span class="author-strength-tag">👥 带队交付</span>
        </div>
        <div class="author-stats">
          <div class="author-stat">
            <div class="author-stat-number">15+</div>
            <div class="author-stat-label">年经验</div>
          </div>
          <div class="author-stat">
            <div class="author-stat-number">300万+</div>
            <div class="author-stat-label">年服务用户</div>
          </div>
          <div class="author-stat">
            <div class="author-stat-number">6+</div>
            <div class="author-stat-label">核心项目</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
```

- [ ] **步骤 4：添加作者区域响应式样式**

```css
/* 作者卡片响应式 */
@media (max-width: 768px) {
  .author-card {
    flex-direction: column;
    text-align: center;
    padding: 24px;
  }

  .author-avatar-area {
    flex: none;
  }

  .author-strengths {
    justify-content: center;
  }

  .author-stats {
    justify-content: center;
  }
}
```

- [ ] **步骤 5：本地预览验证**

运行：`bundle exec jekyll serve`
预期：作者卡片显示暖色背景、头像、简介、标签、数据

- [ ] **步骤 6：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "feat: 作者区域暖色卡片 - 头像、简介、特点标签、数据展示"
```

---

## 任务 3：时间线 SVG 动画 ✅

**文件：**
- 修改：`assets/css/style.css` (新增 `.timeline` 样式)
- 修改：`index.md` (在作者卡片后嵌入时间线 SVG)

**目标：** 创建成长历程时间线，节点按年份跨度比例分布，动画流动效果

- [x] **步骤 1：添加时间线容器样式**

```css
/* 时间线容器 */
.timeline-section {
  padding: var(--spacing-xl) 0 var(--spacing-2xl);
}

.timeline-container {
  max-width: 800px;
  margin: 0 auto;
}

.timeline-svg {
  width: 100%;
  height: auto;
}
```

- [x] **步骤 2：创建时间线 SVG**

在 `index.md` 作者卡片后添加：

```html
<!-- 成长时间线 -->
<section class="timeline-section">
  <div class="container">
    <div class="timeline-container">
      <svg viewBox="0 0 800 60" class="timeline-svg" preserveAspectRatio="xMidYMid meet">
        <!-- 渐变定义 -->
        <defs>
          <linearGradient id="timeGrad" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#fcd34d"/>
            <stop offset="50%" style="stop-color:#6366f1"/>
            <stop offset="100%" style="stop-color:#ec4899"/>
          </linearGradient>
        </defs>

        <!-- 时间线主线 -->
        <line x1="50" y1="30" x2="750" y2="30" stroke="#e2e8f0" stroke-width="3"/>

        <!-- 2010 - 入行 -->
        <circle cx="50" cy="30" r="4" fill="#fcd34d"/>
        <text x="50" y="20" text-anchor="middle" style="font-size:10px;fill:#92400e;font-weight:600;">2010</text>
        <text x="50" y="45" text-anchor="middle" style="font-size:9px;fill:#64748b;">入行</text>

        <!-- 2015 - 技术负责人 -->
        <circle cx="268.75" cy="30" r="4" fill="#f59e0b"/>
        <text x="268.75" y="20" text-anchor="middle" style="font-size:10px;fill:#92400e;font-weight:600;">2015</text>
        <text x="268.75" y="45" text-anchor="middle" style="font-size:9px;fill:#64748b;">技术负责人</text>

        <!-- 2020 - 架构师 -->
        <circle cx="487.5" cy="30" r="5" fill="#6366f1"/>
        <text x="487.5" y="20" text-anchor="middle" style="font-size:10px;fill:#1e293b;font-weight:600;">2020</text>
        <text x="487.5" y="45" text-anchor="middle" style="font-size:9px;fill:#64748b;">架构师</text>

        <!-- 2024 - AI探索 -->
        <circle cx="662.5" cy="30" r="4" fill="#8b5cf6"/>
        <text x="662.5" y="20" text-anchor="middle" style="font-size:10px;fill:#6366f1;font-weight:600;">2024</text>
        <text x="662.5" y="45" text-anchor="middle" style="font-size:9px;fill:#64748b;">AI探索</text>

        <!-- 2026 - AI工程化 -->
        <circle cx="750" cy="30" r="6" fill="#ec4899" stroke="#fce7f3" stroke-width="2"/>
        <text x="750" y="20" text-anchor="middle" style="font-size:10px;fill:#ec4899;font-weight:700;">2026</text>
        <text x="750" y="45" text-anchor="middle" style="font-size:9px;fill:#64748b;font-weight:600;">AI工程化</text>

        <!-- 连接动画线 -->
        <line x1="50" y1="30" x2="750" y2="30" stroke="url(#timeGrad)" stroke-width="3" stroke-dasharray="8 4">
          <animate attributeName="stroke-dashoffset" from="500" to="0" dur="3s" repeatCount="indefinite"/>
        </line>
      </svg>
    </div>
  </div>
</section>
```

- [x] **步骤 3：本地预览验证**

运行：`bundle exec jekyll serve`
预期：时间线显示5个节点，动画线条流动

- [x] **步骤 4：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "feat: 成长时间线 SVG 动画 - 2010到2026历程"
```

---

## 任务 4：技术栈矩阵

**文件：**
- 修改：`assets/css/style.css` (新增 `.tech-matrix` 样式)
- 修改：`index.md` (在时间线后添加技术栈矩阵区块)

**目标：** 创建深色背景的 4x4 技术栈网格，emoji 图标保持亲和力

- [ ] **步骤 1：添加技术栈矩阵基础样式**

```css
/* 技术栈矩阵 */
.tech-matrix-section {
  padding: var(--spacing-2xl) 0;
}

.tech-matrix {
  background: #1e293b;
  border-radius: 20px;
  padding: 24px;
}

.tech-matrix-title {
  text-align: center;
  color: #94a3b8;
  font-size: 12px;
  margin-bottom: 16px;
}

.tech-matrix-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 8px;
}

.tech-item {
  padding: 12px;
  border-radius: 8px;
  text-align: center;
  transition: transform 0.2s;
}

.tech-item:hover {
  transform: translateY(-2px);
}

.tech-icon {
  font-size: 16px;
  margin-bottom: 4px;
}

.tech-name {
  font-size: 12px;
  font-weight: 600;
  color: #e2e8f0;
}

.tech-desc {
  font-size: 10px;
  color: #94a3b8;
}
```

- [ ] **步骤 2：添加分类颜色样式**

```css
/* 技术栈分类颜色 */
.tech-item.ai {
  background: rgba(99, 102, 241, 0.3);
  border: 1px solid #6366f1;
}

.tech-item.backend {
  background: rgba(16, 185, 129, 0.3);
  border: 1px solid #10b981;
}

.tech-item.frontend {
  background: rgba(139, 92, 246, 0.3);
  border: 1px solid #8b5cf6;
}

.tech-item.other {
  background: rgba(245, 158, 11, 0.3);
  border: 1px solid #f59e0b;
}
```

- [ ] **步骤 3：添加技术栈矩阵 HTML**

在 `index.md` 时间线后添加：

```html
<!-- 技术栈矩阵 -->
<section class="tech-matrix-section">
  <div class="container">
    <div class="tech-matrix">
      <div class="tech-matrix-title">技术栈覆盖</div>
      <div class="tech-matrix-grid">
        <!-- AI/大模型 -->
        <div class="tech-item ai">
          <div class="tech-icon">🤖</div>
          <div class="tech-name">Claude</div>
          <div class="tech-desc">API/SDK</div>
        </div>
        <div class="tech-item ai">
          <div class="tech-icon">🧠</div>
          <div class="tech-name">RAG</div>
          <div class="tech-desc">知识库</div>
        </div>
        <div class="tech-item ai">
          <div class="tech-icon">⚡</div>
          <div class="tech-name">Agent</div>
          <div class="tech-desc">自动化</div>
        </div>
        <div class="tech-item ai">
          <div class="tech-icon">📝</div>
          <div class="tech-name">Prompt</div>
          <div class="tech-desc">工程化</div>
        </div>

        <!-- 后端 -->
        <div class="tech-item backend">
          <div class="tech-icon">🐘</div>
          <div class="tech-name">PHP</div>
          <div class="tech-desc">15年</div>
        </div>
        <div class="tech-item backend">
          <div class="tech-icon">☕</div>
          <div class="tech-name">Java</div>
          <div class="tech-desc">微服务</div>
        </div>
        <div class="tech-item backend">
          <div class="tech-icon">🐍</div>
          <div class="tech-name">Python</div>
          <div class="tech-desc">AI</div>
        </div>
        <div class="tech-item backend">
          <div class="tech-icon">🗄️</div>
          <div class="tech-name">MySQL</div>
          <div class="tech-desc">高并发</div>
        </div>

        <!-- 前端 -->
        <div class="tech-item frontend">
          <div class="tech-icon">⚛️</div>
          <div class="tech-name">Vue</div>
          <div class="tech-desc">SPA</div>
        </div>
        <div class="tech-item frontend">
          <div class="tech-icon">📱</div>
          <div class="tech-name">UniApp</div>
          <div class="tech-desc">多端</div>
        </div>
        <div class="tech-item frontend">
          <div class="tech-icon">🎨</div>
          <div class="tech-name">小程序</div>
          <div class="tech-desc">微信</div>
        </div>
        <div class="tech-item frontend">
          <div class="tech-icon">🌐</div>
          <div class="tech-name">H5</div>
          <div class="tech-desc">跨平台</div>
        </div>

        <!-- 其他 -->
        <div class="tech-item other">
          <div class="tech-icon">☁️</div>
          <div class="tech-name">阿里云</div>
          <div class="tech-desc">部署</div>
        </div>
        <div class="tech-item other">
          <div class="tech-icon">🔄</div>
          <div class="tech-name">CI/CD</div>
          <div class="tech-desc">自动化</div>
        </div>
        <div class="tech-item other">
          <div class="tech-icon">📊</div>
          <div class="tech-name">监控</div>
          <div class="tech-desc">运维</div>
        </div>
        <div class="tech-item other">
          <div class="tech-icon">👥</div>
          <div class="tech-name">团队</div>
          <div class="tech-desc">10+人</div>
        </div>
      </div>
    </div>
  </div>
</section>
```

- [ ] **步骤 4：添加响应式样式**

```css
/* 技术栈矩阵响应式 */
@media (max-width: 768px) {
  .tech-matrix-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 480px) {
  .tech-matrix {
    padding: 16px;
  }

  .tech-item {
    padding: 10px;
  }
}
```

- [ ] **步骤 5：本地预览验证**

运行：`bundle exec jekyll serve`
预期：技术栈矩阵显示 16 个卡片，深色背景，emoji 正常

- [ ] **步骤 6：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "feat: 技术栈矩阵 - 深色背景 4x4 网格"
```

---

## 任务 5：项目案例缩略

**文件：**
- 修改：`index.md` (替换现有 `.highlights-section` 为简化版本)

**目标：** 简化项目展示为三列缩略卡片

- [ ] **步骤 1：添加项目缩略卡片样式**

```css
/* 项目缩略卡片 */
.project-thumbnails {
  padding: var(--spacing-xl) 0;
}

.project-thumbnails-title {
  font-size: 16px;
  font-weight: 600;
  color: var(--text-secondary);
  margin-bottom: 12px;
}

.project-thumbnails-grid {
  display: flex;
  gap: 12px;
}

.project-thumbnail {
  flex: 1;
  background: var(--bg-secondary);
  padding: 16px;
  border-radius: 12px;
  text-align: center;
  border: 1px solid var(--border-color);
  transition: transform 0.2s;
}

.project-thumbnail:hover {
  transform: translateY(-2px);
}

.project-badge {
  font-size: 10px;
  color: var(--primary-color);
  font-weight: 600;
  margin-bottom: 4px;
}

.project-name {
  font-size: 14px;
  font-weight: 600;
  color: var(--text-color);
}
```

- [ ] **步骤 2：修改项目区块 HTML**

```html
<!-- 项目案例缩略 -->
<section class="project-thumbnails">
  <div class="container">
    <div class="project-thumbnails-title">项目案例</div>
    <div class="project-thumbnails-grid">
      <a href="{{ '/about' | relative_url }}#水贝珠宝" class="project-thumbnail">
        <div class="project-badge">ToB + ToC</div>
        <div class="project-name">水贝珠宝平台</div>
      </a>
      <a href="{{ '/about' | relative_url }}#智能货柜" class="project-thumbnail">
        <div class="project-badge">0 → 1</div>
        <div class="project-name">智能货柜系统</div>
      </a>
      <a href="{{ '/about' | relative_url }}#鲸旦电商" class="project-thumbnail">
        <div class="project-badge">S2B2C</div>
        <div class="project-name">鲸旦电商</div>
      </a>
    </div>
  </div>
</section>
```

- [ ] **步骤 3：添加响应式样式**

```css
@media (max-width: 768px) {
  .project-thumbnails-grid {
    flex-direction: column;
  }
}
```

- [ ] **步骤 4：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "feat: 项目案例缩略卡片 - 三列布局"
```

---

## 任务 6：微交互动画

**文件：**
- 修改：`assets/css/style.css` (添加悬停动画、进入动画)

**目标：** 卡片悬停上浮、标签悬停变色、文章卡片依次淡入

- [ ] **步骤 1：优化卡片悬停动画**

修改现有 `.post-card:hover` 或添加：

```css
/* 文章卡片悬停动画 */
.post-card-rich:hover {
  transform: translateY(-4px) scale(1.02);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* 彩色条悬停动画 */
.post-card:hover .post-card-bar {
  filter: brightness(1.1);
}
```

- [ ] **步骤 2：添加标签悬停效果**

```css
/* 标签悬停效果 */
.tag-colored:hover {
  filter: brightness(1.1);
  cursor: pointer;
}

.author-strength-tag:hover {
  background: #fef3c7;
  border-color: #f59e0b;
}
```

- [ ] **步骤 3：添加进入动画**

```css
/* 文章卡片进入动画 - 使用 CSS 变量 */
.posts-grid .post-card {
  opacity: 0;
  animation: fadeInUp 0.5s ease forwards;
  animation-delay: calc(var(--index, 0) * 100ms);
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

**HTML 应用示例：**
```liquid
{% for post in site.posts limit:6 %}
{% assign index = forloop.index0 %}
<article class="post-card post-card-rich {% if post.featured %}post-card-featured-large{% endif %}" style="--index: {{ index }}">
  ...
</article>
{% endfor %}
```

- [ ] **步骤 4：添加 reduced-motion 支持**

```css
/* 无障碍：减少动画 */
@media (prefers-reduced-motion: reduce) {
  .post-card,
  .hero-feature-card,
  .tech-item,
  .project-thumbnail {
    animation: none;
    transition: none;
  }
}
```

- [ ] **步骤 5：Commit**

```bash
git add assets/css/style.css
git commit -m "feat: 微交互动画 - 悬停上浮、进入淡入、reduced-motion"
```

---

## 任务 7：深色模式适配

**文件：**
- 修改：`assets/css/style.css` (添加深色模式变量和样式)

**目标：** 所有新增元素在深色模式下正确显示

- [ ] **步骤 1：添加作者卡片深色模式**

```css
[data-theme="dark"] .author-card {
  background: linear-gradient(135deg, #422006, #78350f);
}

[data-theme="dark"] .author-avatar {
  background: #92400e;
  border-color: #78350f;
}

[data-theme="dark"] .author-name {
  color: #f1f5f9;
}

[data-theme="dark"] .author-brand {
  color: #fef3c7;
}

[data-theme="dark"] .author-intro {
  color: #fef3c7;
}

[data-theme="dark"] .author-strength-tag {
  background: rgba(255, 255, 255, 0.1);
  color: #fef3c7;
  border-color: rgba(245, 158, 11, 0.3);
}

[data-theme="dark"] .author-stat-number {
  color: #f1f5f9;
}

[data-theme="dark"] .author-stat-label {
  color: #fef3c7;
}
```

- [ ] **步骤 2：添加时间线深色模式**

```css
[data-theme="dark"] .timeline-section {
  background: var(--bg-secondary);
}

[data-theme="dark"] .timeline-svg text {
  fill: #94a3b8 !important;
}

[data-theme="dark"] .timeline-svg circle {
  opacity: 0.9;
}
```

- [ ] **步骤 3：添加技术栈矩阵深色模式**

```css
[data-theme="dark"] .tech-matrix {
  background: #0f172a;
}
```

- [ ] **步骤 4：添加项目缩略卡片深色模式**

```css
[data-theme="dark"] .project-thumbnail {
  background: var(--bg-secondary);
  border-color: var(--border-color);
}

[data-theme="dark"] .project-badge {
  color: var(--accent-color);
}

[data-theme="dark"] .project-name {
  color: var(--text-color);
}
```

- [ ] **步骤 5：添加文章卡片深色模式**

```css
[data-theme="dark"] .post-card-bar.claude-code {
  background: linear-gradient(90deg, #4f46e5, #7c3aed, #db2777);
}

[data-theme="dark"] .post-card-bar.case-study {
  background: linear-gradient(90deg, #d97706, #dc2626);
}

[data-theme="dark"] .post-card-bar.tob-saas {
  background: linear-gradient(90deg, #059669, #0d9488);
}

[data-theme="dark"] .post-card-tags-rich .tag-colored.claude-code {
  background: rgba(79, 70, 229, 0.2);
  color: #a5b4fc;
}

[data-theme="dark"] .post-card-tags-rich .tag-colored.case-study {
  background: rgba(217, 119, 6, 0.2);
  color: #fcd34d;
}

[data-theme="dark"] .post-card-tags-rich .tag-colored.tob-saas {
  background: rgba(5, 150, 105, 0.2);
  color: #6ee7b7;
}
```

- [ ] **步骤 6：验证深色模式切换**

运行：`bundle exec jekyll serve`
手动切换深色模式，检查所有区块颜色

- [ ] **步骤 7：Commit**

```bash
git add assets/css/style.css
git commit -m "feat: 深色模式适配 - 作者卡片、时间线、技术栈、文章卡片"
```

---

## 任务 8：区块间距调整

**文件：**
- 修改：`assets/css/style.css` (调整各区块间距)
- 修改：`index.md` (调整区块顺序)

**目标：** 按规格文档定义的间距排列区块

- [ ] **步骤 1：添加区块间距变量**

```css
/* 区块间距 */
.section-gap-hero-features {
  padding-top: 48px;
  padding-bottom: 48px;
}

.section-gap-features-posts {
  padding-top: 64px;
}

.section-gap-posts-author {
  padding-top: 64px;
}

.section-gap-author-tech {
  padding-top: 48px;
}

.section-gap-tech-projects {
  padding-top: 48px;
}
```

- [ ] **步骤 2：调整 index.md 区块顺序**

按规格文档顺序：Hero → 特性 → 文章 → 作者 → 时间线 → 技术栈 → 项目

**现有区块处理：**
| 现有区块 | 处理方式 | 理由 |
|----------|----------|------|
| `hero-split` | 保持 | 符合规格 |
| `hero-features` | 保持 | 符合规格的特性卡片 |
| `latest-posts` | 保持，升级样式 | 添加彩色条、图标 |
| `capabilities-section` | 删除 | 规格中无此区块 |
| `highlights-section` | 替换为 `project-thumbnails` | 项目缩略卡片 |
| `stats-section` | 删除 | 数据合并到作者卡片 |
| `about-preview` | 替换为 `author-card` + `timeline-section` | 作者区域+时间线 |

**新增区块：**
- `author-section`（作者卡片）
- `timeline-section`（成长时间线）
- `tech-matrix-section`（技术栈矩阵）
- `project-thumbnails`（项目缩略）

- [ ] **步骤 3：Commit**

```bash
git add assets/css/style.css index.md
git commit -m "fix: 区块间距调整 - 符合设计规格"
```

---

## 任务 9：最终验收与性能检查

**目标：** 验证所有验收标准，检查性能指标

- [ ] **步骤 1：视觉验收检查**

| 检查项 | 验证方法 |
|--------|----------|
| Hero 动效图正常 | 本地预览 |
| 文章卡片彩色条正确 | 检查渐变渲染 |
| 作者卡片暖色背景 | 检查渐变背景 |
| 时间线节点动画 | 检查 SVG 动画 |
| 技术栈矩阵深色背景 | 检查背景色 |
| 项目缩略卡片对齐 | 检查三列布局 |

- [ ] **步骤 2：交互验收检查**

| 检查项 | 验证方法 |
|--------|----------|
| 卡片悬停上浮 | Chrome DevTools hover 模拟 |
| 标签悬停变色 | 手动悬停测试 |
| 时间线流动动画 | 观察 SVG 动画 |
| 移动端响应式 | Chrome DevTools 设备模拟 |
| 深色模式切换 | 点击主题切换按钮 |

- [ ] **步骤 3：性能验收检查**

| 检查项 | 验证方法 | 目标值 |
|--------|----------|--------|
| LCP | Chrome DevTools Lighthouse | < 2.5s |
| 动画帧率 | Chrome DevTools Performance 录制 5s | >= 55fps |
| CSS 文件增量 | `gzip -c assets/css/style.css | wc -c` | < 5KB (gzip) |

**CSS 增量对比命令：**
```bash
# 测量 gzip 压缩后大小
gzip -c assets/css/style.css | wc -c

# 获取本次开发前的起始 commit
git log --oneline -1 --before="2026-04-15"
# 或使用相对偏移（如最近10个commit之前）
git diff HEAD~10 -- assets/css/style.css | gzip | wc -c
```

- [ ] **步骤 4：Git 状态检查**

```bash
git status
git log --oneline -10
```

预期：所有变更已提交，无未跟踪文件

- [ ] **步骤 5：Push 到远程**

```bash
git push origin main
```

- [ ] **步骤 6：GitHub Pages 部署验证**

等待 GitHub Pages 构建完成，访问线上地址验证

---

## 总结

**任务总数：** 9 个任务
**预计耗时：** 2-3 小时
**关键依赖：** 无（每个任务可独立执行）

**实现优先级：**
- P0（必须）：任务 1-2（文章卡片、作者卡片）
- P1（核心）：任务 3-4（时间线、技术栈）
- P2（增强）：任务 5-8（微交互、深色模式、间距）
- P3（验收）：任务 9

---

**计划编写人：** Claude Code
**规格文档：** `docs/superpowers/specs/2026-04-15-homepage-upgrade-design.md`