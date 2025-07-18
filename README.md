# Pandoc Typst Catppuccin

自用 [Typst](https://typst.app/) 模板，采用 [Catppuccin](https://github.com/catppuccin/catppuccin) 配色主题，用于配合 [Pandoc](https://pandoc.org/) 将 Markdown 文档转换为美观的 PDF。

## 项目说明

这是一个 **Typst 模板文件** (`catppuccin-typst.typ`)，专门设计用于 Pandoc 的文档转换流程。当使用 Pandoc 将 Markdown 转换为 PDF 时，这个模板会：

- 应用 Catppuccin 配色主题的视觉样式
- 提供中文友好的字体和排版设置
- 支持代码高亮、表格、数学公式等丰富格式
- 生成具有一致美观外观的 PDF 文档

模板默认使用 [LXGW Bright](https://github.com/lxgw/LxgwBright) 字体，且排版专门为了中文写作调整。

预览效果：[test.pdf](./examples/test.pdf)

## 使用方法

```bash
pandoc input.md -t pdf -o output.pdf --pdf-engine=typst -V template=catppuccin-typst.typ
```

## 模板选项配置

### 方法一：修改模板文件

例如，想要修改 Catppuccin 风味，直接编辑 `catppuccin-typst.typ` 文件中 `conf` 函数的 `flavor` 参数：

```diff
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  lang: "zh",
  region: "CN",
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  cols: 1,
  font: "LXGW Bright",
  fontsize: 11pt,
  sectionnumbering: none,
  pagenumbering: "1",
-   flavor: "macchiato",
+   flavor: "latte",
  doc,
) = {
```

### 方法二：通过参数传递

如果希望通过 `-V flavor=latte -V monofont="Fira Code"` 这样的参数来控制模板，需要修改 Pandoc 的默认 Typst 模板，本项目提供了修改后的模板：[catppuccin-pandoc.typ](./catppuccin-pandoc.typ)。

为避免混淆，在此解释一下 [catppuccin-pandoc.typ](./catppuccin-pandoc.typ) 和 [catppuccin-typst.typ](./catppuccin-typst.typ) 的区别：

- Pandoc 模板（`catppuccin-pandoc.typ`）：Pandoc 针对 Typst 引擎的导出模板，用于控制如何调用 Typst 并传递参数
- Typst 模板（`catppuccin-typst.typ`）：实际的 Typst 样式模板，包含所有样式定义，通过 `template` 变量传入 Pandoc 模板

使用案例：

```bash
pandoc input.md -t pdf -o output.pdf --pdf-engine=typst \
    --template=catppuccin-pandoc.typ \
    -V template=catppuccin-typst.typ \
    -V mainfont="Source Han Serif SC" \
    -V monofont="Fira Code" \
    -V flavor=latte
```
