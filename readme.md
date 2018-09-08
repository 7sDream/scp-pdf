![SCP][logo]

# SCP 基金会内部人员参考手册

# 下载

v1.3 版本之后新增了 6 寸 Kindle 专版，使用 Kindle 的用户请下载带
.kindle 的 pdf。

Kindle 版本在机器上的预览照片[见下](#kindle-版)。

电脑用户下载没后缀的就好。

手机用户下载哪个版本都可以，不过我推荐下电脑版，用横屏阅读方式。

[最新版 v1.17][last-release]

[历史版本][all-release]

# 介绍

SCP 系列文章的整理，主要包含 SCP 档案，说不定以后会加入背景设定啊什么之类的。

所有文章均来自 [SCP 中文 Wiki][scp-wiki-cn]。

# 包含内容

最新版包含的主要内容：

* SCP 001 的全部提案
* SCP 002 - 170
* 已收录 SCP 项目的相关档案和 Tale
* 一些合集（中心）内容
* 一些附录

# 预览

## 封面

![Cover][preview-cover]

## 目录

![Contents][preview-contents]

![preview-heritage][preview-heritage]

## 各种框框

![Box1][preview-box]

## 字体颜色

![color][preview-color]

## 特殊字符（Emoji）

![emoji][preview-emoji]

## 长表格

![table][preview-table]

## Kindle 版

![box][preview-kindle-box]

![text][preview-kindle-text]

![cover][preview-kindle-cover]

![preview-kindle-heritage][preview-kindle-heritage]

## 字体

目前有两个字体配置的版本，`notofira` 和 `sarasa`。

它们分别需要安装的字体见下表（特殊字符字体任何配置均需要安装）：

- notofira 配置
  * Noto Sans CJK SC（中文）
  * Noto Sans Mono CJK SC（中文等宽）
  * Noto Sans（英文）
  * Fira Code（英文等宽）
- saresa 配置
  * Sarasa Gothic （中文，中文等宽）
  * Noto Sans （英文）
  * Iosevka Term （英文等宽）
- 特殊字符公用字体
  * Noto Emoji（Emoji）
  * FreeSerif（特殊符号）
  * DejaVu Sans（特殊符号）
  * HanaMinB （中日韩统一表意文字扩展区字符）

这两个字体配置并没有很大区别，仅仅在等宽部分 `sarasa` 能做到中文字符宽度等于两倍
因为字符宽度，能够更好的对齐，见下图：

![font-configure-compare][font-configure-compare]

为了找支持某特殊字符的字体这个我还写了个[小脚本][which-fonts-support-project]。

# 从源文件编译

### Linux

因为各个 Linux 包差别较大，无法做统一说明，请各位自行查阅使用发行版的软件仓库安装上述字体（如果仓库里没有就手动安装一下）。

然后安装 `tex-live` 这个包，一般发型版里这个包还是都有的。

### macOS

#### 安装 MacTex

```bash
brew cask install mactex
```

#### 安装所需字体

必选字体

```bash
brew cask install font-dejavu-sans font-freesans font-hanamina font-noto-emoji
```

如果你想使用 notofira 配置编译，需还安装：

```bash
brew cask install font-noto-sans-cjk font-noto-sans font-fira-code
```

如果使用 sarasa 编译配置，则安装：

```bash
brew cask install font-sarasa-gothic font-iosevka font-iosevka-slab
```

#### 安装辅助工具

```bash
brew install gnu-sed --with-default-names
brew install grep --with-default-names
```

### Windows

恕我无能为力，Sorry。

### 最后一步

先用 tex-live 自带的升级工具把各个包升级到最新版本。

必须更新的是 `chngcntr` 宏包，它在 1.1a 之前的版本有一个[小问题](https://tex.stackexchange.com/questions/425600/latex-error-command-counterwithout-already-defined)会造成编译失败。

然后尝试编译：

```bash
git clone https://github.com/7sDream/scp-pdf.git
cd scp-pdf
make
open scp.pdf
```

## 计划

有时间的话就排一个 SCP，争取做到一天一篇？

每 10 篇发一个版本……大概这样把。

## 帮忙

按照相同的格式排版一篇试试看，我弄了一些 macro 之类的来辅助排版，常用的格式应该都没问题了。

从 dev 分支新建一个分支，然后加上你的新篇目，或者做一些校对工作之类的。

如果是第一次 PR 需要看一眼 editors.tex 和 version.tex，加上自己，如果是校对工作需要在发布说明部分描述一下，新增篇目就不用了，因为发布的时候会统一写。

然后 PR 到 dev 分支，应该就行了。

一个简易版本的 AutoGen 正在编写中……

## LICENSE

CC-BY-SA

[logo]: https://raw.githubusercontent.com/7sDream/scp-pdf/master/images/git_logo.png
[all-release]: https://github.com/7sDream/scp-pdf/releases
[last-release]: https://github.com/7sDream/scp-pdf/releases/latest
[scp-wiki-cn]: http://scp-wiki-cn.wikidot.com/

[which-fonts-support-project]: https://github.com/7sDream/which_fonts_support
[font-configure-compare]: https://i.loli.net/2018/02/24/5a917392f1801.png

[preview-cover]: http://rikka-10066868.image.myqcloud.com/f50a0449-2c37-4a71-97b6-f35163fbcd04.png
[preview-contents]: http://rikka-10066868.image.myqcloud.com/60a49415-f846-4054-b362-28d4edb18153.png
[preview-heritage]: http://rikka-10066868.image.myqcloud.com/902317c6-10eb-4bf5-bb0a-42947e37a9ba.png
[preview-box]: http://rikka-10066868.image.myqcloud.com/ecb1be0b-6541-4776-a05c-f122c731e2dd.png
[preview-color]: http://rikka-10066868.image.myqcloud.com/257c1aca-9031-41e7-b821-f3f06d10a734.png
[preview-emoji]: http://rikka-10066868.image.myqcloud.com/f48ce1e8-0c4e-470e-ad3c-7a5670045591.png
[preview-table]: http://rikka-10066868.image.myqcloud.com/91f2e472-296a-4b8e-8b58-b99787c683e0.png

[preview-kindle-cover]: http://rikka-10066868.image.myqcloud.com/5461794e-821f-4b2d-ba31-6c7b5eb604bc.png
[preview-kindle-heritage]: http://rikka-10066868.image.myqcloud.com/2d6618c6-1eab-4074-9bb8-7532d806f58e.jpeg
[preview-kindle-box]: http://rikka-10066868.image.myqcloud.com/c5831e83-5157-4823-8bb3-144bd4dbc447.png
[preview-kindle-text]: http://rikka-10066868.image.myqcloud.com/fb2cd4d7-60b8-4164-a3c7-226b4c1efd35.png
