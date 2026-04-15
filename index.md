---
layout: default
title: 首页
---

<!-- 新版 Hero 区域 - 左右布局 -->
<section class="hero-split">
  <div class="container">
    <div class="hero-split-grid">
      <!-- 左侧文字内容 -->
      <div class="hero-text">
        <h1 class="hero-headline">把 AI 从概念，<br>变成真正能落地的系统</h1>
        <div class="hero-subtitles">
          <p class="hero-subtitle-line">15年+ 互联网技术负责人的技术博客</p>
          <p class="hero-subtitle-line accent">专注 AI 工程化 · 大模型应用 · 企业级系统架构</p>
        </div>
        <p class="hero-intro">
          记录 AI Agent、Claude Code、RAG、ToB SaaS、智能硬件系统的<br>
          实战经验、架构设计与真实踩坑，帮你少走弯路。
        </p>
        <div class="hero-pills">
          <span class="pill">AI 工程化</span>
          <span class="pill">AI Agent / Claude Code</span>
          <span class="pill">ToB SaaS 架构</span>
          <span class="pill">智能货柜系统</span>
          <span class="pill">技术负责人 / CTO</span>
        </div>
        <div class="hero-cta">
          <a href="{{ '/archive' | relative_url }}" class="btn btn-primary btn-lg">查看精选文章</a>
          <a href="{{ '/about' | relative_url }}" class="btn btn-outline btn-lg">我的项目与解决方案</a>
        </div>
      </div>
      <!-- 右侧图片区域 -->
      <div class="hero-visual">
        <div class="hero-illustration">
          <svg viewBox="0 0 500 400" fill="none" xmlns="http://www.w3.org/2000/svg">
            <!-- 背景渐变圆 -->
            <defs>
              <linearGradient id="bgGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" style="stop-color:#1e3a5f;stop-opacity:0.1" />
                <stop offset="100%" style="stop-color:#7c3aed;stop-opacity:0.15" />
              </linearGradient>
              <linearGradient id="nodeGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" style="stop-color:#2563eb" />
                <stop offset="100%" style="stop-color:#7c3aed" />
              </linearGradient>
              <linearGradient id="lineGrad" x1="0%" y1="0%" x2="100%" y2="0%">
                <stop offset="0%" style="stop-color:#2563eb;stop-opacity:0.6" />
                <stop offset="100%" style="stop-color:#7c3aed;stop-opacity:0.6" />
              </linearGradient>
            </defs>

            <!-- 背景装饰圆 -->
            <circle cx="250" cy="200" r="180" fill="url(#bgGrad)" />
            <circle cx="250" cy="200" r="140" fill="none" stroke="url(#lineGrad)" stroke-width="1" stroke-dasharray="8 4" opacity="0.5"/>
            <circle cx="250" cy="200" r="100" fill="none" stroke="url(#lineGrad)" stroke-width="1" stroke-dasharray="4 4" opacity="0.3"/>

            <!-- 连接线 -->
            <line x1="250" y1="200" x2="120" y2="100" stroke="url(#lineGrad)" stroke-width="2"/>
            <line x1="250" y1="200" x2="380" y2="100" stroke="url(#lineGrad)" stroke-width="2"/>
            <line x1="250" y1="200" x2="100" y2="250" stroke="url(#lineGrad)" stroke-width="2"/>
            <line x1="250" y1="200" x2="400" y2="250" stroke="url(#lineGrad)" stroke-width="2"/>
            <line x1="250" y1="200" x2="180" y2="320" stroke="url(#lineGrad)" stroke-width="2"/>
            <line x1="250" y1="200" x2="320" y2="320" stroke="url(#lineGrad)" stroke-width="2"/>

            <!-- 中心 AI 节点 -->
            <circle cx="250" cy="200" r="45" fill="url(#nodeGrad)" opacity="0.9"/>
            <text x="250" y="195" text-anchor="middle" fill="white" font-size="14" font-weight="600">AI</text>
            <text x="250" y="212" text-anchor="middle" fill="white" font-size="10" opacity="0.9">Agent</text>

            <!-- 周围节点 -->
            <!-- RAG -->
            <circle cx="120" cy="100" r="28" fill="#1d4ed8" opacity="0.85"/>
            <text x="120" y="104" text-anchor="middle" fill="white" font-size="11" font-weight="500">RAG</text>

            <!-- LLM -->
            <circle cx="380" cy="100" r="28" fill="#7c3aed" opacity="0.85"/>
            <text x="380" y="104" text-anchor="middle" fill="white" font-size="11" font-weight="500">LLM</text>

            <!-- SaaS -->
            <circle cx="100" cy="250" r="28" fill="#0891b2" opacity="0.85"/>
            <text x="100" y="254" text-anchor="middle" fill="white" font-size="11" font-weight="500">SaaS</text>

            <!-- IoT -->
            <circle cx="400" cy="250" r="28" fill="#059669" opacity="0.85"/>
            <text x="400" y="254" text-anchor="middle" fill="white" font-size="11" font-weight="500">IoT</text>

            <!-- 数据 -->
            <circle cx="180" cy="320" r="28" fill="#dc2626" opacity="0.85"/>
            <text x="180" y="324" text-anchor="middle" fill="white" font-size="11" font-weight="500">Data</text>

            <!-- API -->
            <circle cx="320" cy="320" r="28" fill="#ca8a04" opacity="0.85"/>
            <text x="320" y="324" text-anchor="middle" fill="white" font-size="11" font-weight="500">API</text>

            <!-- 数据流动画点 -->
            <circle r="4" fill="#60a5fa">
              <animateMotion dur="3s" repeatCount="indefinite" path="M250,200 L120,100"/>
            </circle>
            <circle r="4" fill="#a78bfa">
              <animateMotion dur="3.5s" repeatCount="indefinite" path="M250,200 L380,100"/>
            </circle>
            <circle r="4" fill="#22d3ee">
              <animateMotion dur="4s" repeatCount="indefinite" path="M250,200 L100,250"/>
            </circle>
            <circle r="4" fill="#34d399">
              <animateMotion dur="3.2s" repeatCount="indefinite" path="M250,200 L400,250"/>
            </circle>
          </svg>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 第一屏底部信息卡片 -->
<section class="hero-features">
  <div class="container">
    <div class="hero-features-grid">
      <div class="hero-feature-card">
        <div class="feature-icon">🤖</div>
        <h3>AI 工程化</h3>
        <p>从 Prompt 到系统级落地</p>
      </div>
      <div class="hero-feature-card">
        <div class="feature-icon">⚡</div>
        <h3>Claude Code / Agent</h3>
        <p>自动化真实生产环境</p>
      </div>
      <div class="hero-feature-card">
        <div class="feature-icon">🏗️</div>
        <h3>ToB 系统架构</h3>
        <p>SaaS + 硬件 + 数据闭环</p>
      </div>
    </div>
  </div>
</section>

<!-- 最新文章 -->
<section class="latest-posts">
  <div class="container">
    <h2 class="section-title">最新文章</h2>
    <div class="posts-grid">
      {% for post in site.posts limit:6 %}
      {% assign index = forloop.index0 %}

      <!-- 标签颜色分类判断 -->
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
          {% if post.tags.size > 0 %}
          <div class="post-card-tags-rich">
            {% for tag in post.tags limit:2 %}
            <span class="tag-colored {{ color_class }}">{{ tag }}</span>
            {% endfor %}
          </div>
          {% endif %}
          <p class="post-card-excerpt">{{ post.excerpt | strip_html | truncate: 120 }}</p>
          <div class="post-card-footer">
            <span class="post-card-reading-time">📖 预计 {{ post.content | number_of_words | divided_by: 180 }} 分钟</span>
            {% if post.featured %}
            <span class="post-card-featured">⭐ 精选</span>
            {% endif %}
          </div>
        </div>
        <a href="{{ post.url | relative_url }}" class="post-card-link" style="position: absolute; inset: 0; z-index: 1;"></a>
      </article>
      {% endfor %}
    </div>
    {% if site.posts.size > 6 %}
    <div class="section-more">
      <a href="{{ '/archive' | relative_url }}" class="btn btn-outline">查看全部文章</a>
    </div>
    {% endif %}
  </div>
</section>

<!-- 核心能力 -->
<section class="capabilities-section">
  <div class="container">
    <h2 class="section-title">核心能力</h2>
    <div class="capabilities-grid">
      <div class="capability-card">
        <div class="capability-icon">🏗️</div>
        <h3>系统架构</h3>
        <p>ToB SaaS 平台架构设计，高并发/高可用分布式系统，微服务架构落地</p>
      </div>
      <div class="capability-card">
        <div class="capability-icon">🤖</div>
        <h3>AI 工程化</h3>
        <p>大模型应用落地，RAG 检索增强生成，企业级 AI 知识库构建</p>
      </div>
      <div class="capability-card">
        <div class="capability-icon">👥</div>
        <h3>团队管理</h3>
        <p>10+ 人技术团队搭建与管理，研发流程规范化，技术与业务深度协同</p>
      </div>
      <div class="capability-card">
        <div class="capability-icon">📱</div>
        <h3>多端开发</h3>
        <p>后台 / 小程序 / App / H5 多端统一架构，UniApp 跨平台方案</p>
      </div>
    </div>
  </div>
</section>

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

<!-- 数据亮点 -->
<section class="stats-section">
  <div class="container">
    <div class="stats-grid">
      <div class="stat-item">
        <span class="stat-number">15+</span>
        <span class="stat-label">年技术经验</span>
      </div>
      <div class="stat-item">
        <span class="stat-number">300万+</span>
        <span class="stat-label">年服务用户</span>
      </div>
      <div class="stat-item">
        <span class="stat-number">10+</span>
        <span class="stat-label">人团队管理</span>
      </div>
      <div class="stat-item">
        <span class="stat-number">6+</span>
        <span class="stat-label">核心项目交付</span>
      </div>
    </div>
  </div>
</section>

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
