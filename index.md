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

<!-- 核心能力 - UI优化版 -->
<section class="capabilities-section">
  <div class="container">
    <h2 class="section-title">核心能力</h2>
    <div class="capabilities-grid">
      <div class="capability-card capability-card-blue">
        <div class="capability-bar"></div>
        <div class="capability-icon">🏗️</div>
        <h3>系统架构</h3>
        <p>ToB SaaS 平台架构设计，高并发/高可用分布式系统，微服务架构落地</p>
      </div>
      <div class="capability-card capability-card-purple">
        <div class="capability-bar"></div>
        <div class="capability-icon">🤖</div>
        <h3>AI 工程化</h3>
        <p>大模型应用落地，RAG 检索增强生成，企业级 AI 知识库构建</p>
      </div>
      <div class="capability-card capability-card-green">
        <div class="capability-bar"></div>
        <div class="capability-icon">👥</div>
        <h3>团队管理</h3>
        <p>10+ 人技术团队搭建与管理，研发流程规范化，技术与业务深度协同</p>
      </div>
      <div class="capability-card capability-card-orange">
        <div class="capability-bar"></div>
        <div class="capability-icon">📱</div>
        <h3>多端开发</h3>
        <p>后台 / 小程序 / App / H5 多端统一架构，UniApp 跨平台方案</p>
      </div>
    </div>
  </div>
</section>

<!-- 项目亮点 - UI优化版 -->
<section class="highlights-section">
  <div class="container">
    <h2 class="section-title">项目亮点</h2>
    <div class="highlights-grid">
      <div class="highlight-card highlight-card-blue">
        <div class="highlight-bar"></div>
        <div class="highlight-content">
          <span class="highlight-badge">ToB + ToC</span>
          <h3>水贝珠宝产业平台</h3>
          <p>面向深圳水贝 IBC 珠宝产业带，集成实时金价、内容种草、互动玩法、线下商家连接</p>
        </div>
      </div>
      <div class="highlight-card highlight-card-green">
        <div class="highlight-bar"></div>
        <div class="highlight-content">
          <span class="highlight-badge highlight-badge-green">0 → 1</span>
          <h3>智能货柜售卖系统</h3>
          <p>完整智能售卖系统闭环：下单/开门/识别/结算/补货，支持规模化铺设</p>
        </div>
      </div>
      <div class="highlight-card highlight-card-purple">
        <div class="highlight-bar"></div>
        <div class="highlight-content">
          <span class="highlight-badge highlight-badge-purple">S2B2C</span>
          <h3>鲸旦电商平台</h3>
          <p>微服务架构，支撑百万级用户规模，自动化部署与多端统一开发</p>
        </div>
      </div>
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

<!-- 关于我预览 - UI优化版 -->
<section class="about-preview">
  <div class="container">
    <div class="about-card about-card-rich">
      <div class="about-bar"></div>
      <div class="about-content">
        <h2>关于我</h2>
        <p>15年+ 互联网行业技术负责人，长期深耕 ToB SaaS、平台型系统、智能货柜与 AI 工程化应用，具备从 0 到 1 架构设计 → 技术选型 → 系统落地 → 规模化运营的完整闭环经验。</p>
        <div class="about-strengths">
          <div class="strength-tag strength-tag-blue">🔧 能下沉一线解决复杂系统与架构问题</div>
          <div class="strength-tag strength-tag-purple">📈 能自上而下规划技术路线与演进策略</div>
          <div class="strength-tag strength-tag-green">👥 能带领技术团队稳定交付，支撑业务持续增长</div>
        </div>
        <a href="{{ '/about' | relative_url }}" class="btn btn-primary">了解更多</a>
      </div>
    </div>
  </div>
</section>
