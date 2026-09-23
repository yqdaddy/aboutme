---
layout: page
title: 文章归档
subtitle: 所有博客文章按时间排序
pagination:
  enabled: true
  per_page: 20
---

<div class="archive">
  {% assign posts_by_year = paginator.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
  {% for year in posts_by_year %}
  <div class="archive-year">
    <h2 class="year-title">{{ year.name }}</h2>
    <ul class="archive-list">
      {% for post in year.items %}
      <li class="archive-item">
        <time class="archive-date">{{ post.date | date: "%m-%d" }}</time>
        <a href="{{ post.url | relative_url }}" class="archive-link">{{ post.title }}</a>
      </li>
      {% endfor %}
    </ul>
  </div>
  {% endfor %}
</div>

{% if paginator.total_pages > 1 %}
<nav class="pagination">
  {% if paginator.previous_page %}
  <a href="{{ paginator.previous_page_path | relative_url }}" class="pagination-prev">&larr; 上一页</a>
  {% endif %}
  <span class="pagination-info">第 {{ paginator.page }} / {{ paginator.total_pages }} 页</span>
  {% if paginator.next_page %}
  <a href="{{ paginator.next_page_path | relative_url }}" class="pagination-next">下一页 &rarr;</a>
  {% endif %}
</nav>
{% endif %}

{% if site.posts.size == 0 %}
<div class="empty-state">
  <p>暂无文章，敬请期待...</p>
</div>
{% endif %}
