#!/bin/bash
# ============================================================
# 北京大学博士学位论文 — 编译脚本
#
# 用法：
#   bash scripts/build.sh          # 完整编译（推荐）
#   bash scripts/build.sh quick    # 快速单次编译
#   bash scripts/build.sh watch    # 监视模式（自动重编译）
#   bash scripts/build.sh clean    # 清理编译产物
#   bash scripts/build.sh help     # 显示帮助
# ============================================================

set -e
cd "$(dirname "$0")/.."

MAIN="thesis-main"

print_help() {
  cat <<'EOF'
用法：bash scripts/build.sh [模式]

模式：
  （默认）  完整编译：latexmk -xelatex（含参考文献，推荐首次或有引用变更时使用）
  quick     快速编译：单次 xelatex（仅修改正文文字，无新引用时使用）
  watch     监视模式：文件变更后自动重新编译（需 latexmk 支持）
  clean     清理编译产物（保留 .tex 源文件和 .pdf）
  help      显示本帮助信息

示例：
  bash scripts/build.sh           # 完整编译
  bash scripts/build.sh quick     # 快速查看排版效果
  bash scripts/build.sh watch     # 写作时保持后台编译
  bash scripts/build.sh clean     # 提交前清理临时文件
EOF
}

MODE=${1:-full}

case "$MODE" in
  full|"")
    echo "==> 完整编译（XeLaTeX + Biber）..."
    latexmk -xelatex -interaction=nonstopmode "$MAIN.tex"
    echo ""
    echo "==> 编译完成：$MAIN.pdf"
    ;;
  quick)
    echo "==> 快速编译（单次 XeLaTeX）..."
    xelatex -interaction=nonstopmode "$MAIN.tex"
    echo ""
    echo "==> 完成：$MAIN.pdf（注意：参考文献可能未更新，如需更新请运行完整编译）"
    ;;
  watch)
    echo "==> 监视模式启动（Ctrl+C 退出）..."
    latexmk -xelatex -pvc -interaction=nonstopmode "$MAIN.tex"
    ;;
  clean)
    echo "==> 清理编译产物..."
    latexmk -xelatex -c "$MAIN.tex"
    # 额外清理 biblatex/biber 产物
    rm -f "$MAIN.bbl" "$MAIN.bcf" "$MAIN.run.xml"
    echo "==> 清理完成（.tex 源文件和 .pdf 已保留）"
    ;;
  help|-h|--help)
    print_help
    ;;
  *)
    echo "错误：未知模式 '$MODE'"
    echo ""
    print_help
    exit 1
    ;;
esac
