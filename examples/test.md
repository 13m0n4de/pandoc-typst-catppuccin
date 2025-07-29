# Pandoc Typst Catppuccin 模板测试

这是一个全面的中文 Markdown 测试文档，用于验证 **Catppuccin Typst 模板**在 Pandoc 工作流中的所有功能。本文档涵盖了从基础语法到现代扩展的各种 Markdown 特性。

## 一、基础文本格式

### 1.1 标题层次

这里展示了六级标题的效果，测试文本在不同标题级别下的显示效果。

#### 1.1.1 四级标题测试

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

##### 1.1.1.1 五级标题

深层级标题的样式。

###### 1.1.1.1.1 六级标题

最深层级的标题样式测试。

### 1.2 文本强调

这是普通段落文本。**这是加粗文本**用于强调重要内容。*这是斜体文本*通常用于引用或特殊说明。***这是加粗斜体文本***结合了两种强调效果。

支持中英文混排：**文档转换 Document Conversion**，*排版系统 Typesetting System*，以及 ***模板设计 Template Design***。

还支持 ~~删除线文本~~，表示已经过时或需要修正的内容。

### 1.3 段落和换行

这是第一个段落。段落之间通过空行分隔，这样可以确保良好的阅读体验。

这是第二个段落。\
这一行通过两个空格实现了硬换行。\
这样可以在同一段落内强制换行。

中文标点符号测试：，。！？；：（）「」《》【】

英文标点符号测试：,.!?;:()""''

## 二、列表功能

### 2.1 无序列表

- 第一个列表项
- 第二个列表项
    - 嵌套列表项 1
    - 嵌套列表项 2
        - 更深层的嵌套
        - 包含 **加粗文本** 的列表项
- 包含中英文的列表项：文档处理 Document Processing
- 包含 `内联代码` 的列表项
- 包含链接的列表项：[Typst 官网](https://typst.app/)

### 2.2 有序列表

1. 第一步：安装工具

1. 第二步：配置环境

    1. 安装 Pandoc
    1. 安装 Typst
    1. 安装字体

1. 第三步：编写文档

1. 最后一步：生成 PDF：

    运行 `pandoc input.md -t pdf -o output.pdf --pdf-engine=typst -V template=catppuccin-typst.typ`

### 2.3 任务列表

- [x] 已完成的任务
- [x] 另一个已完成的任务
- [ ] 待完成的任务
- [ ] 包含 **重要内容** 的任务
- [x] 已完成：模板测试 Template Testing

## 三、代码相关

### 3.1 内联代码

在文档转换中，我们可能需要执行帮助命令，比如 `pandoc --version`。

文件路径示例：`./templates/catppuccin-typst.typ`，配置选项：`--pdf-engine=typst`。

### 3.2 代码块

```bash
# 基本的 Pandoc 转换命令
pandoc input.md -o output.pdf

# 使用 Typst 引擎和自定义模板
pandoc input.md -t pdf \
    --pdf-engine=typst \
    -V template=catppuccin-typst.typ \
    -o output.pdf
```

## 四、链接和图片

### 4.1 各种链接形式

这是一个 [内联链接](https://typst.app/) 到 Typst 官方网站。

这是一个 [带说明文字的链接](https://pandoc.org "Pandoc 文档转换工具") 到 Pandoc。

自动链接测试：https://catppuccin.com 和 contact@example.com

中文混合链接：访问 [Catppuccin 主题官网](https://catppuccin.com) 了解更多配色方案信息。

### 4.2 图片

![示例图片](examples/test_image.svg "这是图片标题")

## 五、表格功能

### 5.1 基础表格

| 工具     | 类型     | 主要用途       |
| -------- | -------- | -------------- |
| Pandoc   | 转换器   | 文档格式转换   |
| Typst    | 排版引擎 | 文档排版       |
| LaTeX    | 排版系统 | 学术论文排版   |
| Markdown | 标记语言 | 轻量级文档编写 |

### 5.2 复杂表格（对齐）

| 项目名称     | 当前状态 | 完成度值 | 备注说明                 |
| :----------- | :------: | -------: | ------------------------ |
| Alpha        |  进行中  |       85 | 核心功能开发已基本完成   |
| Beta Project | 等待审核 |      100 | 所有测试用例通过         |
| Gamma        |  已暂停  |       42 | 需要重新评估技术方案     |
| Delta System | 规划阶段 |       15 | 项目正在规划和设计       |
| Epsilon      | 即将发布 |       98 | 最后的文档整理和优化工作 |

### 5.3 包含代码和格式的表格

| 命令             | 功能       | 说明             |
| ---------------- | ---------- | ---------------- |
| `pandoc --help`  | 查看帮助   | 显示所有选项     |
| `typst compile`  | 编译文档   | **Typst** → PDF  |
| `pandoc -t html` | 转换为网页 | 生成 *HTML* 文件 |
| **重要命令**     | ~~已弃用~~ | `新的替代方案`   |

## 六、引用和 Callouts

### 6.1 普通引用块

> 这是一个普通的引用块。
>
> 引用块可以包含多个段落，也可以包含其他 Markdown 元素。
>
> > 这是嵌套的引用块。
> > 用于表示引用中的引用。

### 6.2 Callouts

> [!NOTE] 使用说明
>
> 这是一个信息提示框，用于显示一般性的使用说明。

> [!TIP] 排版技巧
>
> 💡 这是一个技巧提示框，用于分享有用的建议。

> [!IMPORTANT] 重要提醒
>
> ⚠️ 这是重要信息提示框，用于强调关键配置。

> [!WARNING] 注意事项
>
> 🚨 这是警告信息框，用于提醒潜在的问题。

> [!DANGER] 常见错误
>
> ☢️ 这是危险警告框，用于标识容易出错的操作。

> [!INFO|aside-l] 测试 `[!TYPE|additional]` 语法的支持。
>
> 此处没有对 `aside-l` 编写额外样式，所以应显示为普通的 INFO 样式。

## 七、数学公式

### 7.1 内联数学公式

在文档排版中，我们经常需要使用数学公式，比如黄金比例 $\phi = \frac{1 + \sqrt{5}}{2}$，或者页面比例 $ratio = \frac{width}{height}$。

字体大小计算：基础字号为 $11pt$，标题字号为 $11pt \times 1.8 = 19.8pt$。

### 7.2 块级数学公式

哈希函数的不同实现方式：

$$
hash(key) = \begin{cases}
key \bmod M & \text{除法哈希} \\
\lfloor \frac{M}{W} \times (a \times key \bmod W) \rfloor & \text{乘法哈希} \\
(h_1(key) + i \times h_2(key)) \bmod M & \text{双重哈希}
\end{cases}
$$

## 八、分割线和特殊元素

---

这是一条分割线，用于分隔不同的内容段落。

### 8.1 定义列表

Pandoc
: 通用文档转换工具
: 支持多种输入和输出格式

Typst
: 现代排版系统
: 专注于科学和技术文档

Markdown
: 轻量级标记语言
: 易于阅读和编写

模板 Template
: 预定义的文档样式
: 用于统一文档外观

## 九、高级功能测试

### 9.1 嵌套结构

1. **第一层：文档准备**

    > [!NOTE] 准备阶段说明
    >
    > 这个阶段需要准备好所有必要的工具和模板。

    - 安装 Pandoc

    - 配置 Typst

        ```bash
        # 检查工具版本
        pandoc --version
        typst --version
        ```

    - 选择模板

1. **第二层：文档编写**

    包含格式示例的任务：

    - [x] 编写 Markdown 内容

    - [ ] 添加图片和表格

        ```markdown
        ![图片描述](./image.png)
        ```

    - [ ] 校对和优化

## 十、总结

本测试文档涵盖了以下 Markdown 功能：

- ✅ **基础语法**：标题、段落、强调、列表
- ✅ **代码功能**：内联代码、代码块、语法高亮
- ✅ **链接图片**：各种链接形式、图片显示
- ✅ **表格功能**：基础表格、对齐、复杂表格
- ✅ **引用块**：普通引用、Callouts
- ✅ **数学公式**：内联公式、块级公式
- ✅ **高级功能**：脚注、定义列表、任务列表
- ✅ **中文支持**：中文字体、标点、排版
- ✅ **混合排版**：中英文混排、特殊字符
