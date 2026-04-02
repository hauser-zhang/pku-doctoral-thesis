# 北京大学博士学位论文 LaTeX 模板（2026）

[![License: LPPL](https://img.shields.io/badge/License-LPPL--1.3c-blue.svg)](https://www.latex-project.org/lppl/)
[![pkuthss](https://img.shields.io/badge/pkuthss-v1.9.4-green.svg)](https://github.com/CasperVector/pkuthss)
[![2026](https://img.shields.io/badge/PKU%20Word%20Template-2026-red.svg)]()

本模板适用于**北京大学博士学位论文**的 LaTeX 排版，对齐 **2026 年北京大学研究生院官方 Word 模板**。基于 [pkuthss v1.9.4](https://github.com/CasperVector/pkuthss) 修改定制，通过对官方 Word 模板 XML 的精确测量，系统修正了 pkuthss 默认值与最新官方格式要求之间的偏差。

> **专业适用说明**：本模板格式已严格对齐 **2026 年未来技术学院·生物医学工程**方向的 Word 官方模板（逐项 XML 测量验证）。北大各院系的 Word 模板在个别格式细节上可能存在差异，使用前请与本院系最新 Word 模板对照核查关键格式项（页边距、标题间距等）。

---

## 为什么做这个模板？

目前已有 [pkuthss](https://github.com/CasperVector/pkuthss) 等优秀的北大论文 LaTeX 模板，但在使用过程中发现：

- 现有模板库与**最新北大 Word 官方模板**在多处格式细节上存在偏差（上边距、章标题间距、封面字号等）
- pkuthss 上游虽仍在维护，但针对最新 Word 模板的格式细节校正较为滞后

因此本项目在 pkuthss v1.9.4 基础上，通过 Word XML 精确测量，补全了格式对齐工作，供有需要的同学直接使用。

此外，后续计划持续开源以下内容，帮助更多同学**加速博士论文写作**：

- 📝 **写作 Skill**：基于 Claude Code 的章节撰写、学术润色等写作技能脚本
- 🤖 **AI Agent 工作流**：文献综述自动化、算法形式化、审稿意见回应等 AI 辅助写作流程
- 🔬 **领域知识库**：生物信息学常用术语、规范表达、引用格式等

欢迎 Star ⭐ 关注更新，也欢迎 Issue / PR 反馈！

---

## 与官方 Word 模板的对齐说明

经过 Word 模板 XML 精确测量，本模板对 pkuthss 默认值进行了以下校正：

| 格式项 | pkuthss 默认 | Word 模板要求 | 本模板 |
|--------|-------------|--------------|--------|
| 上边距 | 3.1 cm (ugly) | 3.0 cm | ✅ 3.0 cm |
| 下边距 | 3.0 cm | 2.5 cm | ✅ 2.5 cm |
| 页眉距顶边缘 | 1.9 cm | 2.0 cm | ✅ 2.0 cm |
| 页脚距底边缘 | ~1.7 cm | 1.75 cm | ✅ 1.76 cm |
| 封面标题字号 | 小一 (24pt) | 一号 (26pt) | ✅ 26pt |
| 章标题段前间距 | 0pt | 24pt | ✅ 24pt |
| 一级节标题段前 | 20pt | 24pt | ✅ 24pt |
| 各级节标题段后 | 5pt | 6pt | ✅ 6pt |
| 页眉分隔线粗细 | 0.75bp | ~0.5pt | ✅ 0.5bp |
| 英文摘要结构 | 含英文题目+作者 | 仅 ABSTRACT | ✅ 符合规范 |
| 目录章条目字体 | 宋体 | 黑体 | ✅ 黑体 |

---

## 系统要求

- **TeX 发行版**：TeX Live 2023+ 或 MiKTeX 25+
- **编译引擎**：XeLaTeX（必须）
- **参考文献**：Biber（biblatex 后端）
- **操作系统**：Windows / macOS / Linux 均支持

### 字体要求

| 字体 | 用途 | Windows | macOS / Linux |
|------|------|---------|---------------|
| Times New Roman | 英文正文 | 系统自带 | 需单独安装 |
| Arial | ABSTRACT 标题 | 系统自带 | 需单独安装 |
| 宋体 (SimSun) | 中文正文 | 系统自带 | 需安装中文字体包 |
| 黑体 (SimHei) | 标题 | 系统自带 | 需安装中文字体包 |
| 仿宋 (FangSong) | 封面作者信息 | 系统自带 | 需安装中文字体包 |

macOS/Linux 中文字体推荐：`apt install fonts-wqy-zenhei`（Ubuntu）或安装 [Noto CJK](https://github.com/notofonts/noto-cjk)。

---

## 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/hauser-zhang/pku-doctoral-thesis.git
cd pku-doctoral-thesis
```

### 2. 填写论文信息

编辑 `thesis-main.tex` 中的 `\pkuthssinfo{...}` 块，填入论文题目、作者、导师等信息。

### 3. 撰写各章内容

各章文件位于 `chapters/` 目录：

```
chapters/
├── 01-introduction/chapter01.tex    ← 第一章：引言
├── 02-literature-review/chapter02.tex
├── 03-methods/chapter03.tex
├── 04-experiments/chapter04.tex
├── 05-discussion/chapter05.tex
└── 06-conclusion/chapter06.tex
```

### 4. 添加参考文献

在 `references/references.bib` 中添加 BibTeX 条目，正文中使用 `\cite{key}` 引用。

### 5. 编译

```bash
# 一键完整编译（推荐）
bash scripts/build.sh

# 快速编译（单次 XeLaTeX，修改正文后使用）
bash scripts/build.sh quick

# 监视模式（保存后自动重新编译）
bash scripts/build.sh watch

# 清理编译产物
bash scripts/build.sh clean
```

---

## 编译脚本

`scripts/build.sh` 支持以下模式：

| 命令 | 说明 |
|------|------|
| `bash scripts/build.sh` | 完整编译（latexmk，含参考文献）**推荐** |
| `bash scripts/build.sh quick` | 单次 XeLaTeX（仅修改正文文字时） |
| `bash scripts/build.sh watch` | 监视模式，文件变更后自动编译 |
| `bash scripts/build.sh clean` | 清理编译产物（保留 .tex 源文件） |
| `bash scripts/build.sh help` | 显示帮助信息 |

---

## 目录结构

```
.
├── thesis-main.tex          ← 主文件（编译入口）
├── pkuthss.cls              ← 文档类（已校正 2 处格式）
├── pkuthss.def              ← 标签定义
├── pkuthss-utf8.def         ← UTF-8 标签
├── pkulogo.eps              ← 北京大学校徽
├── pkuword.eps              ← 北京大学校名
├── chapters/                ← 各章 .tex 文件
├── references/
│   └── references.bib       ← 参考文献数据库
├── figures/                 ← 图片
├── tables/                  ← 表格数据
├── appendices/              ← 附录
└── scripts/
    ├── build.sh             ← 编译脚本
    └── word-export.sh       ← 转换为 Word 草稿（Pandoc，实验性）
```

---

## 格式规范摘要

依据《北京大学研究生学位论文规范》：

| 元素 | 规范 |
|------|------|
| 纸张 | A4，双面打印 |
| 页边距 | 上3.0 / 下2.5 / 左2.6 / 右2.6 cm |
| 正文字体 | 宋体小四(12pt) + Times New Roman |
| 正文行距 | 固定值 20pt，首行缩进 2 字符 |
| 章标题 | 黑体三号(16pt)，居中，段前24pt，段后18pt |
| 一级节标题 | 黑体四号(14pt)，居左，段前24pt，段后6pt |
| 二级节标题 | 黑体13pt，居左，段前12pt，段后6pt |
| 引用格式 | GB/T 7714-2015，顺序编码制（上标方括号） |
| 页码 | 前置部分大写罗马数字，正文阿拉伯数字 |

---

## 与上游 pkuthss 的关系

本模板以 [pkuthss v1.9.4](https://github.com/CasperVector/pkuthss) 为基础，针对最新 Word 模板做了针对性格式校正：

1. **pkuthss.cls** 修改了 2 处：封面标题字号（小一→一号）、页眉线粗细（0.75bp→0.5bp）
2. **thesis-main.tex** 通过 `\ctexset` 和 `\geometry` 覆盖了标题间距、页面布局等参数

如需了解底层实现细节，可参阅上游文档：`texdoc pkuthss`

---

## License

- **pkuthss.cls** 及相关文件：[LPPL 1.3c](https://www.latex-project.org/lppl/)，版权归 Casper Ti. Vector 等
- **本模板新增内容**（thesis-main.tex、scripts/、README 等）：公共领域（Public Domain）

北大校徽（pkulogo.eps / pkuword.eps）版权归北京大学所有，仅限学术用途。
