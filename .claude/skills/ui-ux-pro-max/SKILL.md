---
name: ui-ux-pro-max
description: "UI/UX 专业规范 - 布局、交互、可用性的最佳实践"
triggers:
  - 页面设计
  - 组件开发
  - 交互实现
  - 用户体验
  - 响应式
---

# UI/UX Pro Max - 专业设计规范

> 好的设计不只是好看，更要好用。

## 布局体系

### 容器宽度

```css
/* 内容最大宽度 */
--content-max: 720px;      /* 文章正文 */
--section-max: 1200px;     /* 页面区块 */
--hero-max: 1440px;        /* 首屏大图 */
```

### 间距系统（8pt Grid）

```css
--spacing-1: 4px;
--spacing-2: 8px;
--spacing-3: 12px;
--spacing-4: 16px;
--spacing-6: 24px;
--spacing-8: 32px;
--spacing-12: 48px;
--spacing-16: 64px;
```

**使用原则**：
- 组件内部：4px、8px、12px
- 组件间距：16px、24px、32px
- 区块间距：48px、64px、96px

### 响应式断点

```css
/* 移动优先 */
--breakpoint-sm: 640px;    /* 手机横屏 */
--breakpoint-md: 768px;    /* 平板竖屏 */
--breakpoint-lg: 1024px;   /* 平板横屏/小屏电脑 */
--breakpoint-xl: 1280px;   /* 桌面 */
--breakpoint-2xl: 1536px;  /* 大屏 */
```

## 视觉层级

### 字体层级

| 层级 | 大小 | 字重 | 用途 |
|------|------|------|------|
| H1 | 2.5rem (40px) | 800 | 页面标题 |
| H2 | 2rem (32px) | 700 | 区块标题 |
| H3 | 1.5rem (24px) | 600 | 小节标题 |
| H4 | 1.25rem (20px) | 600 | 卡片标题 |
| 正文 | 1rem (16px) | 400 | 正文内容 |
| 小字 | 0.875rem (14px) | 400 | 辅助文字 |
| 注释 | 0.75rem (12px) | 400 | 标签、时间 |

### 颜色层级

```css
/* 文字层级 */
--text-color: #1c1917;        /* 主要内容 */
--text-secondary: #57534e;    /* 次要内容 */
--text-muted: #78716c;        /* 辅助信息 */

/* 背景层级 */
--bg-color: #ffffff;          /* 最底层 */
--bg-secondary: #fafaf9;      /* 卡片背景 */
--bg-tertiary: #f5f5f4;       /* 区块背景 */
```

### 阴影层级

```css
--shadow-sm: 0 1px 2px rgba(0,0,0,0.05);           /* 卡片默认 */
--shadow-md: 0 4px 6px rgba(0,0,0,0.1);            /* 悬浮态 */
--shadow-lg: 0 10px 15px rgba(0,0,0,0.1);          /* 弹窗 */
--shadow-xl: 0 20px 25px rgba(0,0,0,0.1);          /* 模态框 */
```

## 交互模式

### 状态设计

每个可交互元素必须有 4 种状态：

1. **默认态** - 正常显示
2. **悬浮态** - cursor: pointer 触发
   - 背景：加深 5-10%
   - 阴影：提升一级
   - 过渡：transition: all 0.2s ease
3. **激活态** - 点击瞬间
   - 缩放：scale(0.98)
   - 背景继续加深
4. **禁用态** - 不可操作
   - opacity: 0.5
   - cursor: not-allowed

### 可点击区域

- 最小尺寸：44px × 44px（移动端）
- 按钮 padding：12px 24px（PC）、16px 32px（移动）
- 链接间距：至少 8px

### 反馈机制

- 即时反馈：点击后 100ms 内有视觉响应
- 加载状态：超过 200ms 显示 loading
- 成功/失败：明确的状态提示

## 可用性清单

### 表单设计

- [ ] 标签清晰（不依赖 placeholder）
- [ ] 输入框高度 40-48px
- [ ] 错误提示紧邻输入框
- [ ] Tab 键顺序合理
- [ ] 必填项有视觉标记

### 导航设计

- [ ] 当前位置明确
- [ ] 最多 3 级导航
- [ ] 面包屑支持返回
- [ ] 搜索功能可用

### 内容可读性

- [ ] 行宽 45-75 字符
- [ ] 行高 1.5-1.75
- [ ] 段落间距 ≥ 行高
- [ ] 对比度 ≥ 4.5:1（正文）

### 移动端

- [ ] 触摸目标 ≥ 44px
- [ ] 无水平滚动
- [ ] 表单适配键盘
- [ ] 底部留安全区

## 性能与动效

### 过渡时间

```css
--transition-fast: 150ms;    /* 微交互 */
--transition-normal: 200ms;  /* 状态切换 */
--transition-slow: 300ms;    /* 页面切换 */
```

### 缓动函数

```css
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-bounce: cubic-bezier(0.34, 1.56, 0.64, 1);
```

### 性能原则

- 避免动画：width、height、top、left
- 推荐动画：transform、opacity
- will-change 仅用于已优化动画
- 滚动区域使用 overflow: auto + -webkit-overflow-scrolling: touch

## 本项目专属

Jekyll 博客特点：
1. **文章页**：720px 最大宽度，专注阅读
2. **列表页**：卡片式布局，响应式网格
3. **导航**：简洁顶部导航，移动端汉堡菜单
4. **字体加载**：Google Fonts + font-display: swap

当前设计系统变量在 `assets/css/style.css` 的 `:root` 中定义。