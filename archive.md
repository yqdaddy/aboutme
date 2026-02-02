---
layout: page
title: 文章归档
subtitle: 所有博客文章按时间排序
---

<div class="archive">
  {% assign posts_by_year = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
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

{% if site.posts.size == 0 %}
<div class="empty-state">
  <p>暂无文章，敬请期待...</p>
</div>
{% endif %}
