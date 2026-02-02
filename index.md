---
layout: default
title: 首页
---

<div class="hero">
  <div class="container">
    <div class="hero-content">
      <h1 class="hero-title">码孖AI</h1>
      <p class="hero-subtitle">15年+ 互联网技术负责人的技术博客</p>
      <p class="hero-description">ToB SaaS · 智能硬件 · AI大模型工程化落地</p>
      <div class="hero-actions">
        <a href="{{ '/about' | relative_url }}" class="btn btn-primary">关于我</a>
        <a href="{{ '/archive' | relative_url }}" class="btn btn-secondary">浏览文章</a>
      </div>
    </div>
  </div>
</div>

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

<section class="about-preview">
  <div class="container">
    <div class="about-card">
      <h2>关于我</h2>
      <p><strong>技术负责人 / 技术总监</strong></p>
      <p>15年+ 互联网行业技术负责人，长期深耕 ToB SaaS、平台型系统、智能硬件与 AI 工程化应用，具备从 0 到 1 架构设计 → 技术选型 → 系统落地 → 规模化运营的完整闭环经验。</p>
      <div class="skill-tags">
        <span>系统架构</span>
        <span>ToB SaaS</span>
        <span>AI大模型</span>
        <span>团队管理</span>
        <span>微服务</span>
        <span>RAG</span>
      </div>
      <a href="{{ '/about' | relative_url }}" class="btn btn-primary">了解更多</a>
    </div>
  </div>
</section>
