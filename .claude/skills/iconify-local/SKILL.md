---
name: iconify-local
description: "图标本地化 - 从 Iconify 搜索并下载图标到项目"
triggers:
  - 添加图标
  - 图标搜索
  - SVG 图标
  - 图标下载
---

# Iconify Local - 图标本地化

> 不要手撸 SVG，从 Iconify 获取高质量图标。

## 图标搜索指南

### 推荐图标集

| 图标集 | 特点 | 适合场景 |
|--------|------|----------|
| **Lucide** | 线性、现代、统一 | 通用界面 |
| **Tabler Icons** | 粗细一致、数量多 | 管理后台 |
| **Heroicons** | 简洁、Apple 风格 | 产品官网 |
| **Phosphor** | 粗细可调、灵活 | 灵活设计 |
| **Carbon** | IBM 设计、专业 | 企业产品 |
| **Remix Icon** | 种类全、有填充版 | 通用 |
| **Solar** | 粗线条、现代 | 科技感 |

### 搜索方式

1. **官网搜索**：https://icon-sets.iconify.design/
2. **VS Code 插件**：Iconify IntelliSense
3. **Figma 插件**：Iconify

### 选择原则

- 保持同一图标集（不要混用）
- 粗细一致（stroke-width）
- 风格匹配（线性/填充/双色）
- 考虑可读性（小尺寸测试）

## 下载流程

### 方法一：使用脚本（推荐）

```bash
# 下载单个图标
./scripts/fetch-icons.sh lucide:home

# 下载多个图标
./scripts/fetch-icons.sh lucide:home lucide:user lucide:settings

# 从其他图标集
./scripts/fetch-icons.sh tabler:brand-github heroicons:heart
```

### 方法二：手动下载

1. 访问 https://icon-sets.iconify.design/
2. 搜索图标名称
3. 点击图标 → Copy SVG
4. 创建文件 `assets/icons/[icon-name].svg`
5. 粘贴 SVG 代码
6. 运行 `./scripts/fetch-icons.sh --index` 更新索引

## 文件组织

```
assets/
└── icons/
    ├── home.svg
    ├── user.svg
    ├── settings.svg
    └── index.json    # 图标索引
```

### index.json 格式

```json
{
  "icons": [
    {
      "name": "home",
      "file": "home.svg",
      "set": "lucide",
      "tags": ["home", "house", "main"]
    },
    {
      "name": "user",
      "file": "user.svg",
      "set": "lucide",
      "tags": ["user", "person", "profile"]
    }
  ]
}
```

## 在项目中使用

### Jekyll/Liquid

```html
<!-- 方式一：直接 include -->
{% include icon.html name="home" %}

<!-- 方式二：内联 SVG -->
<svg class="icon" viewBox="0 0 24 24">
  <use href="/assets/icons/sprite.svg#home"></use>
</svg>
```

### HTML

```html
<!-- 方式一：img 标签 -->
<img src="/assets/icons/home.svg" class="icon" alt="首页">

<!-- 方式二：内联 SVG -->
<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
</svg>
```

### CSS 样式

```css
.icon {
  width: 1em;
  height: 1em;
  stroke: currentColor;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  fill: none;
  vertical-align: middle;
}

/* 不同尺寸 */
.icon-sm { width: 16px; height: 16px; }
.icon-md { width: 20px; height: 20px; }
.icon-lg { width: 24px; height: 24px; }
.icon-xl { width: 32px; height: 32px; }
```

## 本项目现有图标

当前已下载图标（`assets/icons/`）：
- `bot.svg` - 机器人/AI
- `brain.svg` - 思维/智能
- `building-2.svg` - 建筑/企业
- `clock.svg` - 时间
- `code-2.svg` - 代码
- `smartphone.svg` - 移动端
- `sparkles.svg` - 亮点/AI
- `trophy.svg` - 成就
- `users.svg` - 用户
- `zap.svg` - 快速/效率

所有图标来自 Lucide 图标集，保持 stroke-width: 2。

## 注意事项

1. **不要修改 SVG 源码** - 保持原样，用 CSS 控制样式
2. **保持命名一致** - 使用图标集原名
3. **定期更新索引** - 添加新图标后运行 `--index`
4. **考虑可访问性** - 图标需有 alt 或 aria-label