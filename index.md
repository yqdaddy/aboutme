---
layout: default
title: 首页
---

<div class="hero">
  <div class="container">
    <div class="hero-content">
      <h1 class="hero-title">码孖哥</h1>
      <p class="hero-subtitle">15年+ 互联网技术负责人的技术博客</p>
      <p class="hero-description">ToB SaaS · 智能货柜 · AI大模型工程化落地</p>
      <div class="hero-actions">
        <a href="{{ '/about' | relative_url }}" class="btn btn-primary">关于我</a>
        <a href="{{ '/archive' | relative_url }}" class="btn btn-secondary">浏览文章</a>
      </div>
    </div>
  </div>
</div>

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

<!-- 项目亮点 -->
<section class="highlights-section">
  <div class="container">
    <h2 class="section-title">项目亮点</h2>
    <div class="highlights-grid">
      <div class="highlight-card">
        <span class="highlight-badge">ToB + ToC</span>
        <h3>水贝珠宝产业平台</h3>
        <p>面向深圳水贝 IBC 珠宝产业带，集成实时金价、内容种草、互动玩法、线下商家连接</p>
      </div>
      <div class="highlight-card">
        <span class="highlight-badge">0 → 1</span>
        <h3>智能货柜售卖系统</h3>
        <p>完整智能售卖系统闭环：下单/开门/识别/结算/补货，支持规模化铺设</p>
      </div>
      <div class="highlight-card">
        <span class="highlight-badge">S2B2C</span>
        <h3>鲸旦电商平台</h3>
        <p>微服务架构，支撑百万级用户规模，自动化部署与多端统一开发</p>
      </div>
    </div>
  </div>
</section>

<!-- 技术栈 -->
<section class="techstack-section">
  <div class="container">
    <h2 class="section-title">技术栈</h2>
    <div class="techstack-wrapper">
      <div class="techstack-category">
        <h4>后端技术</h4>
        <div class="tech-tags">
          <span>Java</span>
          <span>Spring Boot</span>
          <span>Spring Cloud</span>
          <span>MySQL</span>
          <span>Redis</span>
          <span>Elasticsearch</span>
          <span>RabbitMQ</span>
          <span>Docker</span>
        </div>
      </div>
      <div class="techstack-category">
        <h4>AI & 数据</h4>
        <div class="tech-tags">
          <span>LLM</span>
          <span>RAG</span>
          <span>向量检索</span>
          <span>AI 知识库</span>
          <span>语义搜索</span>
        </div>
      </div>
      <div class="techstack-category">
        <h4>AI 研发提效</h4>
        <div class="tech-tags">
          <span>Claude Code</span>
          <span>Cursor</span>
          <span>Trae</span>
          <span>CodeBuddy</span>
        </div>
      </div>
      <div class="techstack-category">
        <h4>前端 & 多端</h4>
        <div class="tech-tags">
          <span>Vue</span>
          <span>UniApp</span>
          <span>小程序</span>
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

<!-- 最新文章 -->
<section class="latest-posts">
  <div class="container">
    <h2 class="section-title">最新文章</h2>
    <div class="posts-grid">
      {% for post in site.posts limit:6 %}
      <article class="post-card">
        <a href="{{ post.url | relative_url }}" class="post-card-link">
          <div class="post-card-content">
            <time class="post-card-date">{{ post.date | date: "%Y-%m-%d" }}</time>
            <h3 class="post-card-title">{{ post.title }}</h3>
            <p class="post-card-excerpt">{{ post.excerpt | strip_html | truncate: 120 }}</p>
            {% if post.tags.size > 0 %}
            <div class="post-card-tags">
              {% for tag in post.tags limit:3 %}
              <span class="tag-small">#{{ tag }}</span>
              {% endfor %}
            </div>
            {% endif %}
          </div>
        </a>
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

<!-- 关于我预览 -->
<section class="about-preview">
  <div class="container">
    <div class="about-card">
      <h2>关于我</h2>
      <p>15年+ 互联网行业技术负责人，长期深耕 ToB SaaS、平台型系统、智能货柜与 AI 工程化应用，具备从 0 到 1 架构设计 → 技术选型 → 系统落地 → 规模化运营的完整闭环经验。</p>
      <div class="about-strengths">
        <div class="strength-tag">🔧 能下沉一线解决复杂系统与架构问题</div>
        <div class="strength-tag">📈 能自上而下规划技术路线与演进策略</div>
        <div class="strength-tag">👥 能带领技术团队稳定交付，支撑业务持续增长</div>
      </div>
      <a href="{{ '/about' | relative_url }}" class="btn btn-primary">了解更多</a>
    </div>
  </div>
</section>
