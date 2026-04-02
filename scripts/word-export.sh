#!/bin/bash
# 转换为 Word 格式（需要安装 pandoc）
# 用法：bash scripts/word-export.sh

set -e
cd "$(dirname "$0")/.."

echo "转换 PDF → Word（通过 Pandoc）..."
echo "注意：Pandoc 转换为七八成相似，复杂公式/图表位置需手动调整"

pandoc thesis-main.tex \
  --from=latex \
  --to=docx \
  --output=thesis-main.docx \
  --bibliography=references/references.bib \
  --csl=scripts/chinese-gb7714-2015-numeric.csl \
  2>&1

echo "输出：thesis-main.docx（请手动检查格式）"
