#!/bin/bash

# Iconify 图标下载脚本
# 从 Iconify API 下载 SVG 图标到 assets/icons/

ICONS_DIR="assets/icons"
INDEX_FILE="$ICONS_DIR/index.json"
ICONIFY_API="https://api.iconify.design"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 创建目录
mkdir -p "$ICONS_DIR"

# 显示帮助
show_help() {
  echo "用法: $0 [选项] <图标名称...>"
  echo ""
  echo "选项:"
  echo "  --index     只更新索引文件"
  echo "  --help      显示帮助信息"
  echo ""
  echo "图标名称格式: <图标集>:<图标名>"
  echo "示例:"
  echo "  $0 lucide:home"
  echo "  $0 tabler:brand-github heroicons:heart"
  echo ""
  echo "支持中文搜索（返回匹配的图标名）:"
  echo "  $0 --search 首页"
}

# 下载单个图标
download_icon() {
  local icon_spec="$1"
  local set_name="${icon_spec%%:*}"
  local icon_name="${icon_spec##*:}"

  if [[ "$set_name" == "$icon_spec" ]]; then
    # 没有指定图标集，默认使用 lucide
    set_name="lucide"
  fi

  local output_file="$ICONS_DIR/${icon_name}.svg"

  echo -n "下载 $set_name:$icon_name... "

  # 从 Iconify API 获取 SVG
  local svg_content=$(curl -s "$ICONIFY_API/$set_name/$icon_name.svg")

  if [[ -z "$svg_content" || "$svg_content" == *"error"* ]]; then
    echo -e "${RED}失败${NC}"
    echo "  错误: 无法获取图标，请检查图标集和图标名称"
    return 1
  fi

  # 保存 SVG 文件
  echo "$svg_content" > "$output_file"
  echo -e "${GREEN}成功${NC} → $output_file"
  return 0
}

# 更新索引文件
update_index() {
  echo "更新图标索引..."

  local icons_json='[]'

  for svg_file in "$ICONS_DIR"/*.svg; do
    if [[ -f "$svg_file" ]]; then
      local filename=$(basename "$svg_file" .svg)

      # 尝试从文件推断图标集（默认 lucide）
      local set_name="lucide"

      # 添加到 JSON 数组
      icons_json=$(echo "$icons_json" | jq --arg name "$filename" \
        --arg file "$filename.svg" \
        --arg set "$set_name" \
        '. += [{"name": $name, "file": $file, "set": $set}]')
    fi
  done

  # 写入索引文件
  echo "{\"icons\": $icons_json}" | jq '.' > "$INDEX_FILE"
  echo -e "${GREEN}索引已更新${NC} → $INDEX_FILE"
}

# 检查依赖
check_deps() {
  if ! command -v curl &> /dev/null; then
    echo -e "${RED}错误: 需要安装 curl${NC}"
    exit 1
  fi

  if ! command -v jq &> /dev/null; then
    echo -e "${YELLOW}警告: 建议安装 jq 以生成索引文件${NC}"
  fi
}

# 主函数
main() {
  check_deps

  if [[ $# -eq 0 ]]; then
    show_help
    exit 0
  fi

  case "$1" in
    --help|-h)
      show_help
      exit 0
      ;;
    --index)
      update_index
      exit 0
      ;;
    --search)
      echo "中文搜索功能开发中..."
      echo "请访问 https://icon-sets.iconify.design/ 进行搜索"
      exit 0
      ;;
  esac

  # 下载图标
  local success=0
  local failed=0

  for icon_spec in "$@"; do
    if download_icon "$icon_spec"; then
      ((success++))
    else
      ((failed++))
    fi
  done

  echo ""
  echo "完成: $success 成功, $failed 失败"

  # 更新索引
  if command -v jq &> /dev/null && [[ $success -gt 0 ]]; then
    update_index
  fi
}

main "$@"