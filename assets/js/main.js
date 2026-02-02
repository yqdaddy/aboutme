// 码孖AI 博客主脚本

document.addEventListener('DOMContentLoaded', function() {
  // 移动端导航切换
  const navToggle = document.querySelector('.nav-toggle');
  const siteNav = document.querySelector('.site-nav');

  if (navToggle && siteNav) {
    navToggle.addEventListener('click', function() {
      siteNav.classList.toggle('active');
      navToggle.classList.toggle('active');
    });

    // 点击导航链接后关闭菜单
    const navLinks = siteNav.querySelectorAll('a');
    navLinks.forEach(function(link) {
      link.addEventListener('click', function() {
        siteNav.classList.remove('active');
        navToggle.classList.remove('active');
      });
    });
  }

  // 平滑滚动到锚点
  document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
    anchor.addEventListener('click', function(e) {
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;

      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        e.preventDefault();
        targetElement.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });

  // 代码块复制功能
  document.querySelectorAll('pre code').forEach(function(codeBlock) {
    const pre = codeBlock.parentNode;
    const copyButton = document.createElement('button');
    copyButton.className = 'copy-button';
    copyButton.textContent = '复制';
    copyButton.style.cssText = `
      position: absolute;
      top: 8px;
      right: 8px;
      padding: 4px 8px;
      font-size: 12px;
      background: rgba(255,255,255,0.1);
      color: #e5e7eb;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      opacity: 0;
      transition: opacity 0.2s;
    `;

    pre.style.position = 'relative';
    pre.appendChild(copyButton);

    pre.addEventListener('mouseenter', function() {
      copyButton.style.opacity = '1';
    });

    pre.addEventListener('mouseleave', function() {
      copyButton.style.opacity = '0';
    });

    copyButton.addEventListener('click', function() {
      navigator.clipboard.writeText(codeBlock.textContent).then(function() {
        copyButton.textContent = '已复制!';
        setTimeout(function() {
          copyButton.textContent = '复制';
        }, 2000);
      });
    });
  });

  // 图片懒加载
  if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver(function(entries) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          const image = entry.target;
          if (image.dataset.src) {
            image.src = image.dataset.src;
            image.removeAttribute('data-src');
          }
          imageObserver.unobserve(image);
        }
      });
    });

    document.querySelectorAll('img[data-src]').forEach(function(img) {
      imageObserver.observe(img);
    });
  }
});
