// 用于 Pandoc 转换 PDF 的 Typst 模板，采用 Catppuccin 主题
// 使用方法：pandoc input.md -t pdf -o output.pdf --pdf-engine=typst -V template=catppuccin-typst.typ

#import "@preview/catppuccin:1.0.0": catppuccin, flavors, get-flavor

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

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
  mainfont: "LXGW Bright",
  monofont: "Hack Nerd Font",
  fontsize: 11pt,
  sectionnumbering: none,
  pagenumbering: "1",
  flavor: "macchiato",
  doc,
) = {
  let current-flavor = if type(flavor) == str {
    get-flavor(flavor)
  } else {
    get-flavor(content-to-string(flavor))
  }

  set document(
    title: title,
    author: authors.map(author => content-to-string(author)),
    keywords: keywords,
  )

  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols,
    number-align: right,
  )

  show: catppuccin.with(current-flavor)

  set text(
    lang: lang,
    region: region,
    font: mainfont,
    size: fontsize,
    weight: "regular",
  )

  // 段落
  set par(
    spacing: 1.4em,
    leading: 0.9em,
    justify: true,
    first-line-indent: 0em,
  )

  // 分割线
  show line: it => {
    v(1em)
    block(
      width: 100%,
      height: 1.5pt,
      fill: current-flavor.colors.overlay1.rgb,
    )
    v(1em)
  }

  // 标题
  show heading: it => {
    set text(fill: current-flavor.colors.lavender.rgb, hyphenate: false)
    set block(breakable: false)
    it
  }

  show heading.where(level: 1): it => {
    if counter(page).get().first() > 1 { pagebreak(weak: true) }
    set text(size: 1.8em, weight: "bold")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  show heading.where(level: 2): it => {
    set text(size: 1.4em, weight: "semibold")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  show heading.where(level: 3): it => {
    set text(size: 1.2em, weight: "semibold")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  show heading.where(level: 4): it => {
    set text(size: 1.1em, weight: "medium")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  show heading.where(level: 5): it => {
    set text(size: 1.05em, weight: "medium")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  show heading.where(level: 6): it => {
    set text(size: 1em, weight: "regular", style: "italic")
    set block(above: 1.8em, below: 1.8em, sticky: true)
    it
  }

  // 代码块
  show raw.where(block: true): it => {
    set text(font: monofont, size: 0.9em)
    set block(
      fill: if current-flavor.identifier == "latte" { current-flavor.colors.mantle.rgb } else {
        current-flavor.colors.surface0.rgb
      },
      stroke: 1pt + current-flavor.colors.surface2.rgb,
      radius: 6pt,
      inset: 1em,
      width: 100%,
      above: 1.2em,
      below: 1.2em,
    )
    it
  }

  // 内联代码
  show raw.where(block: false): it => {
    set text(font: monofont, size: 0.9em, fill: current-flavor.colors.peach.rgb)
    box(
      fill: if current-flavor.identifier == "latte" { current-flavor.colors.crust.rgb } else {
        current-flavor.colors.surface1.rgb
      },
      inset: (x: 0.5em, y: 0.2em),
      radius: 3pt,
      it,
    )
  }

  // 链接
  show link: it => {
    set text(fill: current-flavor.colors.blue.rgb)
    underline(it, stroke: 0.8pt + current-flavor.colors.blue.rgb)
  }

  // 引用
  show ref: it => {
    set text(fill: current-flavor.colors.teal.rgb)
    it
  }

  // 引用块和 Callout
  show quote.where(block: true): it => {
    let content-str = repr(it.body)
    let callout-match = content-str.match(
      regex("(?i)\[!(NOTE|INFO|TIP|SUCCESS|WARNING|CAUTION|IMPORTANT|DANGER)(\|[^\]]*)?"),
    )

    let border-color = if callout-match != none {
      let callout-type = upper(callout-match.captures.at(0))
      if callout-type in ("NOTE", "INFO") {
        current-flavor.colors.blue.rgb
      } else if callout-type in ("TIP", "SUCCESS") {
        current-flavor.colors.green.rgb
      } else if callout-type in ("WARNING", "CAUTION") {
        current-flavor.colors.yellow.rgb
      } else if callout-type in ("IMPORTANT", "DANGER") {
        current-flavor.colors.red.rgb
      } else {
        current-flavor.colors.overlay1.rgb
      }
    } else {
      current-flavor.colors.overlay1.rgb
    }

    set text(fill: current-flavor.colors.subtext0.rgb)
    block(
      fill: if current-flavor.identifier == "latte" { current-flavor.colors.crust.rgb } else {
        current-flavor.colors.surface1.rgb
      },
      inset: (left: 1em, right: 1em, top: 0.8em, bottom: 0.8em),
      radius: 0pt,
      stroke: (left: 4pt + border-color, rest: none),
      spacing: 1.2em,
      width: 100%,
    )[
      #it.body
    ]
  }

  // 强调和加粗
  show emph: set text(fill: current-flavor.colors.green.rgb)
  show strong: set text(fill: current-flavor.colors.sapphire.rgb, weight: "medium")

  // 列表
  set list(
    marker: text(fill: current-flavor.colors.sapphire.rgb)[•],
    indent: 1em,
    spacing: 1.2em,
  )

  // 列表项
  set enum(
    numbering: n => text(fill: current-flavor.colors.sapphire.rgb)[#n.],
    indent: 1em,
    spacing: 1.2em,
  )

  // 表格
  show table: set text(size: 0.9em)
  set table(
    stroke: 0.8pt + current-flavor.colors.surface2.rgb,
    fill: (x, y) => if calc.odd(y) {
      if current-flavor.identifier == "latte" { current-flavor.colors.mantle.rgb } else {
        current-flavor.colors.surface0.rgb
      }
    } else {
      if current-flavor.identifier == "latte" { current-flavor.colors.crust.rgb } else {
        current-flavor.colors.surface1.rgb
      }
    },
    inset: 0.6em,
  )

  // 图片和图表
  show figure: it => {
    set block(above: 1.4em, below: 1.4em, breakable: false)
    it
  }

  show figure.caption: it => {
    set text(size: 0.9em, fill: current-flavor.colors.subtext1.rgb, style: "italic")
    v(0.5em)
    it
  }

  // 脚注
  show footnote.entry: it => {
    set text(size: 0.9em, fill: current-flavor.colors.subtext0.rgb)
    set par(hanging-indent: 1em)
    it
  }

  // 数学公式
  show math.equation.where(block: true): it => {
    set block(
      inset: 1em,
      fill: if current-flavor.identifier == "latte" { current-flavor.colors.mantle.rgb } else {
        current-flavor.colors.surface0.rgb
      },
      radius: 6pt,
      above: 1.2em,
      below: 1.2em,
    )
    it
  }

  doc

  // 页脚
  v(2em)
  align(center)[
    #set text(size: 0.8em, fill: current-flavor.colors.overlay0.rgb, style: "italic")
    Generated with Pandoc and Typst using Catppuccin #current-flavor.name theme
  ]
}
