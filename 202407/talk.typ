// Typst source file.
// References:
// 1. https://typst.app/docs
// 2. https://touying-typ.github.io/touying/zh/docs
#import "@preview/touying:0.4.2": *

// Choose a theme from default, simple, metropolis, dewdrop, university, aqua.
// #let s = themes.aqua.register(aspect-ratio: "16-9", lang: "zh")
// Use my cutomized theme
#import "aqua.typ"
#let s = aqua.register(aspect-ratio: "16-9", lang: "zh")

// Set the title, author, date, institution, and logo
#let s = (s.methods.info)(
  self: s,
  title: [#v(1em) GMT 绘图入门],
  author: [田冬冬],
  date: "2024-07-16",
  institution: [中国地质大学（武汉）],
  logo: text(size: 2.0em, fill: red, weight: "regular")[EarthScope InSAR 理论与实践暑期课程],
)

#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert
#show link: underline
#show figure.caption: set text(0.70em) // Set figure caption text size
// Set the default fonts for text
#set text(font: ("Times New Roman", "Kaiti SC"), lang: "zh", region: "cn")

#set figure(numbering: none) // Disable figure numbering

#let (slide, empty-slide, title-slide, focus-slide) = utils.slides(s)
#show: slides

= GMT 简介

#slide[
  #figure(
    image("assets/GMT-logo.png", width: 60%)
  )
  #set align(center)
  主页：https://www.generic-mapping-tools.org/\
  源码：https://github.com/GenericMappingTools/\
  论坛：https://forum.generic-mapping-tools.org/
]

#slide[
  *1988年* GMT 1.0

  #grid(
    columns: 2,
    gutter: 20pt,
    figure(
      image("assets/PaulWessel.jpg", height: 50%),
      caption: [
        Paul Wessel\
        University of Hawaiʻi at Mānoa\
        (1959-2024)
      ]
    ),
    figure(
      image("assets/WalterSmith.jpg", height: 50%),
      caption: [
        Walter H. F. Smith\
        NOAA
      ]
    ),
  )
][
  The GMT-System:\
  *G*\ravity, *M*\agnetics, *T*\opography
  #figure(
    image("assets/GMT-v1.0-cookbook-cover.png", height: 76%),
    caption: "GMT v1.0 Technical Reference & Cookbook"
  )
]

#slide[
  *GMT 发展历程*

  - 1988年: GMT 1.0
  - 1991年: GMT 2.0
  - 1995年: GMT 3.0
  - 2004--2018: GMT 4.x (30个小版本)
  - 2013--2019: GMT 5.x (14个小版本)
  - 2019至今: GMT 6.x (7个小版本) #pause

  GMT 最新版本：v6.5.0 (2024-01-07)
]

#slide[
  *GMT主要开发者及其活跃时间*
  #set align(center)
  #grid(
    columns: 4,
    gutter: 20pt,
    figure(
      image("assets/PaulWessel.jpg", height: 35%),
      caption: "Paul Wessel (1988-2024)"
    ),
    figure(
      image("assets/WalterSmith.jpg", height: 35%),
      caption: "Walter Smith (1988-2007)"
    ),
    figure(
      image("assets/Joaquim-Luis.png", height: 35%),
      caption: "Joaquim Luis (1999-now)"
    ),
    figure(
      image("assets/RemkoScharroo.jpg", height: 35%),
      caption: "Remko Scharroo (2004-2019)"
    ),
    figure(
      image("assets/FlorianWobbe.png", height: 35%),
      caption: "Florian Wobbe (2011-2019)"
    ),
    figure(
      image("assets/LeonardoUieda.jpg", height: 35%),
      caption: "Leonardo Uieda (2017-2020)"
    ),
    figure(
      image("assets/DongdongTian.jpg", height: 35%),
      caption: "Dongdong Tian (2018-now)"),
    figure(
      image("assets/MaxJones.jpg", height: 35%),
      caption: "Max Jones (2020-2022)"
    ),
  )
]

#slide[
  *主要功能*

  #grid(
    columns: 2,
    gutter: 20pt,
    [
      绘图功能：

      - 底图：笛卡尔、极坐标、地图投影
      - 海岸线、国界、河流、湖泊
      - 点、线、多边形、文字
      - 二维网格数据
      - 比例尺、图例、色标
      - 3D 视角
      - ...
    ],
    [
      数据处理功能：

      - 重采样 (1D/2D)
      - 滤波 (1D/2D)
      - 插值 (1D/2D/3D)
      - 数据筛选 (1D/2D)
      - 梯度 (2D)
      - ...
    ]
  )
]

#slide[
  *笛卡尔坐标与极坐标*
  #set align(center)
  #grid(
    columns: 2,
    gutter: 20pt,
    figure(image("assets/gallery-01.png", height: 35%), caption: "线性轴"),
    figure(image("assets/gallery-02.png", height: 35%), caption: "对数投影"),
    figure(image("assets/gallery-03.png", height: 35%), caption: "指数轴"),
    figure(image("assets/gallery-04.png", height: 35%), caption: "极坐标轴"),
  )
]

#slide[
  *30 种地图投影方式*
  #align(center)[
    #grid(
      columns: (1fr, 1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 10pt,
      figure(image("assets/gallery-05.png", width: 60%), caption: "Lambert投影"),
      figure(image("assets/gallery-07.png", width: 100%), caption: "Hammer投影"),
      grid.cell(
        rowspan: 2,
        figure(image("assets/gallery-08.png", height: 85%), caption: "倾斜Mercator投影")
      ),
      figure(image("assets/gallery-06.png", width: 90%), caption: "Mercator投影"),
      figure(image("assets/gallery-09.png", width: 85%), caption: "立体等角投影"),
    )
  ]
]

#slide[
  *绘制点、线数据*
  #image("assets/gallery-10.png", width: 100%)
][
  - 底图：坐标轴
  - 海岸线：陆地、海洋
  - 点和线
  - 图例
  - 文字标注
]

#slide(composer: utils.side-by-side.with(columns: (1fr, auto), gutter: 1em))[
  *绘制网格数据*
  #image("assets/gallery-12.png", width: 100%)
][
  - 底图
  - 2D 网格数据：经度、纬度、Z值
  - colorbar
]
#slide(composer: utils.side-by-side.with(columns: (1fr, auto), gutter: 1em))[
  *绘制网格数据*
  #image("assets/gallery-11.png", width: 100%)
][
  - 底图
  - 2D 网格数据：经度、纬度、Z值
  - colorbar
  - 立体效果
]

#slide[
  *3D立体视角*
  #image("assets/gallery-13.png", height: 85%)
][
  - 等值线
  - 3D立体视角
  - 3D surface mesh plot
]

#slide[
  *3D立体视角*
  #image("assets/gallery-14.png", height: 85%)
][
  - 等值线
  - 3D立体视角
  - 3D surface image plot
]

#slide[
  #text(1.25em)[*主要优点*] #pause

  + 图件精美 #pause
  + 专注于地球科学领域：地图投影、经纬度、边界条件、海岸线、比例尺、指南针等 #pause
  + 开源+免费：GNU LGPL 3.0 许可证 #pause
  + 跨平台：支持 Linux、macOS、Windows、BSD 等 #pause
  + 多种图片格式：PDF、PNG、JPEG 等 #pause
  + 模块化：遵循 Unix 的设计哲学，不同的绘图和数据处理功能分别由不同的模块实现，多个模块配合实现复杂功能 #pause
  + 命令行工具，绘图脚本化
]

#slide[
  #set align(center)
  #image("assets/citations.png", height: 100%)
]

= GMT 基础

== GMT 安装

#slide[
  #pause
  *Windows*

  1. 下载安装包
    https://mirrors.ustc.edu.cn/gmt/bin/gmt-6.5.0-win64.exe
  2. 双击安装

  #pause

  *macOS*
  ```
  brew install gmt
  ```
  #pause

  *Linux*

  - *Ubuntu*: `sudo apt install gmt gmt-dcw gmt-gshhg`
  - *Fedora*: `sudo dnf install GMT GMT-common GMT-dev GMT-doc`

  #pause

  *跨平台*
  ```
  conda install gmt -c conda-forge
  mamba install gmt -c conda-forge
  ```
]

== GMT 基础：命令行

#slide[
  #set align(center)
  #image("assets/CLI-1.png", height: 100%)
]

#slide[
  #set align(center)
  #image("assets/CLI-2.png", height: 100%)
]

#slide[
  #set align(center)
  #image("assets/CLI-3.png", height: 100%)
]

#slide[
  #set align(center)
  #image("assets/CLI-4.png", height: 100%)
]

#slide[
  #set align(center)
  #image("assets/CLI-5.png", height: 100%)
]

#slide[
  #set align(center)
  #set text(size: 1.0em, font: "DejaVu Sans Mono")
  #text(fill: red)[gmt]
  #text(fill: blue)[pscoast]
  #text(fill: green)[-JH15c -Rg -Baf -B+t"My First Map" -Ggray]
  > map.ps

  #set align(left)
  - #text(fill: red)[gmt]: GMT 命令
  - #text(fill: blue)[pscoast]: GMT 模块
  - #text(fill: green)[-JH15c]: 选项 + 参数
    - 选项以 ``-`` 开头，后接单个字符（如 ``-J``）
    - 选项后加参数（如 ``H15c``）
    - 子选项以 ``+`` 开头，后接单个字符+参数（如 ``+t"My First Map"）
    - 每个选项之间以空格分隔
    - 参数中若有空格，则用引号括起来
  - #text(fill: black)[> map.ps]: 将命令的输出保存到文件 ``map.ps`` 中
]

== GMT基础：标准选项

#slide[
  `-J` 选项：指定地图投影方式

  30 多种地图投影方式：

  - `-JM12c` 墨卡托投影，图片宽度 12 cm
  - `-JM120/12c` 墨卡托投影，投影中心为120°E，图片宽度 12 cm
  - `-JH15c` Hammer 投影，图片宽度 15 cm

  更多地图投影见：https://docs.gmt-china.org/latest/proj/

  #v(1cm)
  笛卡尔投影：

  `-JXwidth/height`

  - `-JX10c` 宽度 10 cm，高度 10 cm
  - `-JX10c/5c` 笛卡尔线性坐标轴，宽度 10 cm，高度 5 cm
]

#slide[
  `-R` 选项：指定研究区域范围

  ```
  -Rxmin/xmax/ymin/ymax
  ```

  示例：
  - `-R0/360/-90/90` 或 `-Rg`
  - `-R-180/180/-90/90` 或 `-Rd`
  - `-R-90/-70/18/36`
][
  #image("assets/option-R.png")
]

#slide[
  `-B` 选项：控制底图边框和轴。[最复杂也最简单的选项之一]

  `-Bafg`: *a* 数字标注；*f* 刻度线；*g* 网格线

  #set align(center)
  #grid(
    columns: 3,
    gutter: 1cm,
    [
      `-B`
      #image("assets/B-1.png", height: 60%)
    ],
    [
      `-Bafg`
      #image("assets/B-2.png", height: 60%)
    ],
    [
      `-Bxa5f1 -Bya2f2`
      #image("assets/B-3.png", height: 60%)
    ]
  )
]

#slide[
  `-B` 选项：控制底图边框和轴。[最复杂也最简单的选项之一]

  `-BWSEN`: 控制四条边，WSEN表示显示标注和刻度；wesn表示显示刻度但不显示标注

  #set align(center)
  #grid(
    columns: 3,
    gutter: 1cm,
    [
      `-Baf -BWSEN`
      #image("assets/B-4.png", height: 60%)
    ],
    [
      `-Bxaf+lX -Byaf+lY -BWSen`
      #image("assets/B-5.png", height: 60%)
    ],
    [
      `-Baf -BWSen+t"My Title"`
      #image("assets/B-6.png", height: 60%)
    ]
  )
]

== GMT基础：PostScript

#slide[
  *PostScript* 是一种用于描述矢量图形的页面描述语言。
  GMT 绘图模块则输出 PostScript 语句。

  #set text(0.75em)
  #grid(
    columns: 2,
    gutter: 20pt,
    [
      ```
      %! PS-Adobe-3.0
      % Draw a rectangle
      newpath
      100 100 moveto
      200 0 rlineto
      0 100 rlineto
      -200 0 rlineto
      closepath
      stroke

      % Draw some text
      /Times-Roman findfont 24 scalefont setfont
      100 150 moveto
      (Hello, PostScript!) show

      showpage
      %%Trailer
      %%EOF
      ```
    ],
    [
      #image("assets/PS-1.png", height: 50%)
    ]
  )
]

#slide[
  #set align(center)
  #set text(size: 1.0em, font: "DejaVu Sans Mono")
  #text(fill: red)[gmt]
  #text(fill: blue)[pscoast]
  #text(fill: green)[-JH15c -Rg -Baf -B+t"My First Map" -Ggray]
  > map.ps

  #pause

  #set align(left)
  如何查看 PostScript 文件？

  #text(fill: red)[gmt]
  #text(fill: blue)[psconvert]
  #text(fill: green)[-A -P -Tf]
  map.ps
  #pause

  #grid(
    columns:2,
    gutter: 4cm,
    [
      #v(2cm)
      `-T` 指定输出格式。
      - `-Tf` PDF
      - `-Tj` JPEG
      - `-Tg` PNG
    ],[
      #image("assets/coast-1.png", height: 60%)
    ]
  )
]

= GMT 主要模块

#slide[
  *GMT 模块一览*
  #set align(center)
  #image("assets/modules.png", height: 88%)
]

== GMT 主要模块: pscoast

#slide[
  *pscoast* 绘制海岸线、河流和国界等

  官方文档：https://docs.generic-mapping-tools.org/dev/pscoast.html

  #image("assets/coast-man.png")
]
#slide[
  ```
  gmt pscoast -JH15c -Rg -Baf -Gdarkgreen -Slightblue -W1/0.5p > coast-2.ps
  ```
  #grid(
    columns: (1fr, 2fr),
    gutter: 1cm,
    [
      #v(2cm)
      - `-G`：陆地颜色
      - `-S`：海洋颜色
      - `-W1/0.5p`:
        - 1 表示海岸线；
        - `0.5p` 为线宽
    ],
    [
      #image("assets/coast-2.png", width:100%)
    ]
  )
]

== GMT 主要模块: grdimage

#slide[
  *grdimage* 绘制二维网格文件

  官方文档：https://docs.generic-mapping-tools.org/dev/grdimage.html

  #image("assets/grdimage-man.png")
]

#slide[
  #set align(center)
  #set text(size: 0.9em, font: "DejaVu Sans Mono")
  gmt grdimage #text(fill: red, weight: "extrabold")[`@earth_relief_15m`] -JH15c -Rg > grdimage-1.ps

  #image("assets/grdimage-1.png", width: 80%)

]

#slide[
  #set align(center)
  #set text(size: 0.9em, font: "DejaVu Sans Mono")
  gmt grdimage `@earth_relief_15m`
  -JH15c -Rg
  #text(fill: red, weight: "extrabold")[-I+d]
  > grdimage-2.ps

  #image("assets/grdimage-2.png", width: 80%)
]

#slide[
  #set align(center)
  #set text(size: 0.9em, font: "DejaVu Sans Mono")
  gmt grdimage `@earth_relief_15m`
  -JH15c -Rg
  -I+d
  #text(fill: red, weight: "extrabold")[-Cetopo1]
  > grdimage-3.ps

  #image("assets/grdimage-3.png", width: 80%)
]

== GMT 主要模块: psxy

#slide[
  *psxy* 绘制线段、多边形和符号

  官方文档：https://docs.generic-mapping-tools.org/dev/psxy.html

  #image("assets/psxy-man.png")
]

#slide[
  #set align(center)
  #set text(size: 0.9em, font: "DejaVu Sans Mono")

  gmt psxy input.txt -R0/10/0/10 -JX10c -B
  #text(fill: red, weight: "extrabold")[-W2p,blue]
   > map.ps

  #grid(
    columns: (1fr, 2fr),
    [
      #set align(left)
      `input.txt` 文件格式为：
      ```
      2   2
      8   2
      5   7
      ```

      - `-W2p,blue` 宽度为 2p 的蓝色线段
    ],[
      #image("assets/psxy-1.png", height: 80%)
    ]
  )
]

#slide[
  #set align(center)
  #set text(size: 0.9em, font: "DejaVu Sans Mono")

  gmt psxy input.txt -R0/10/0/10 -JX10c -B -W2p,blue
  #text(fill: red, weight: "extrabold")[-L]
   > map.ps

  #grid(
    columns: (1fr, 2fr),
    [
      #set align(left)
      `input.txt` 文件格式为：
      ```
      2   2
      8   2
      5   7
      ```

      - `-L` 绘制闭合多边形（即首尾相连）
    ],[
      #image("assets/psxy-2.png", height: 80%)
    ]
  )
]

#slide[
  #set align(center)
  #set text(size: 0.85em, font: "DejaVu Sans Mono")

  gmt psxy input.txt -R0/10/0/10 -JX10c -B
  #text(fill: red, weight: "extrabold")[-Sc0.5c -W1p,blue -Gred]
   > map.ps

  #grid(
    columns: (1fr, 2fr),
    [
      #set align(left)
      `input.txt` 文件格式为：
      ```
      2   2
      8   2
      5   7
      ```

      - `-Sc0.5c`: 绘制直径为 0.5 cm 的圆
      - `-W1p,blue`：符号轮廓线宽及颜色
      - `-Gred`：符号填充颜色
    ],[
      #image("assets/psxy-3.png", height: 70%)
    ]
  )
  #image("assets/psxy-symbols.png", height: 12%)
]

== GMT主要模块: pstext

#slide[
  *pstext* 添加文字

  官方文档：https://docs.generic-mapping-tools.org/dev/pstext.html

  #image("assets/pstext-man.png")
]

#slide[
  #set align(center)
  #set text(size: 0.85em, font: "DejaVu Sans Mono")

  gmt pstext input.txt -R0/10/0/10 -JX10c -B > pstext-1.ps

  #grid(
    columns: (1fr, 2fr),
    [
      #set align(left)
      `input.txt` 文件格式为：
      ```
      2   2  TEXT1
      8   2  TEXT2
      5   7  TEXT3
      ```
    ],[
      #image("assets/pstext-1.png", height: 70%)
    ]
  )
]

#slide[
  #set align(center)
  #set text(size: 0.85em, font: "DejaVu Sans Mono")

  gmt pstext input.txt -R0/10/0/10 -JX10c -B
  #text(fill: red, weight: "extrabold")[-F+f20p,Times-Bold,red+a30]
  > pstext-2.ps

  #grid(
    columns: (1fr, 2fr),
    [
      #set align(left)
      `input.txt` 文件格式为：
      ```
      2   2  TEXT1
      8   2  TEXT2
      5   7  TEXT3
      ```

      - `+f` 控制文字大小、字体和颜色
      - `+a` 控制文字旋转角度
    ],[
      #image("assets/pstext-2.png", height: 70%)
    ]
  )
]

== GMT 组合图件

#slide[
  #grid(
    columns: 2,
    gutter: 20pt,
    [
      #set text(size: 0.75em, font: "DejaVu Sans Mono")
      #text(fill:red)[%! PS-Adobe-3.0]

      #text(fill:blue)[
      % Draw a rectangle\
      newpath\
      100 100 moveto\
      200 0 rlineto\
      0 100 rlineto\
      -200 0 rlineto\
      closepath\
      stroke\

      % Draw some text\
      /Times-Roman findfont 24 scalefont setfont\
      100 150 moveto\
      (Hello, PostScript!) show\
      ]

      #text(fill:green)[
      showpage\
      %%Trailer\
      %%EOF
      ]
    ],
    [
      #image("assets/sandwich.jpg")
    ]
  )
]

#slide[
  #set text(size: 0.85em, font: "DejaVu Sans Mono")
  gmt grdimage `@earth_relief_15m` -JH15c -Rg -Baf -I+d #text(fill: red, weight: "extrabold")[-K >] map.ps\
  gmt pscoast -J -R -W1/0.25p #text(fill: red, weight: "extrabold")[-K -O >>] map.ps\
  gmt psxy points.txt -J -R -Sc0.2c -Gred #text(fill: red, weight: "extrabold")[-K -O >>] map.ps\
  gmt pstext text.txt -J -R -F+f15p,Times-Bold,white+jTL #text(fill: red, weight: "extrabold")[-O >>] map.ps\
  gmt psconvert -A -P -Tg map.ps\

  #set text(size: 0.85em)
  注意事项：

  - `-J` 和 `-R`:
    - 第一个绘图命令需要指定完整的 `-J` 和 `-R` 选项
    - 其他绘图命令可以直接使用 `-J -R`
  - `-K` 和 `-O`
    - 第一个绘图命令使用 `-K` 选项：不输出 PS 尾部信息，但输出 PS 头部信息
    - 中间绘图命令使用 `-K -O` 选项：不输出 PS 头部和尾部信息
    - 其他绘图命令使用 `-O` 选项：不输出 PS 头部信息，但输出尾部信息
  - 输出重定向
    - 第一个绘图命令用 `>` 表示输出到新 PS 文件中（若存在，则覆盖）
    - 其他绘图命令使用 `>>` 表示输出追加到已有 PS 文件中
]
#slide[
  #image("assets/composite.png", height: 95%)
]

= GMT 现代模式


#slide[
  *GMT 经典模式*

  #set text(size: 0.85em, font: "DejaVu Sans Mono")
  gmt grdimage `@earth_relief_15m` -JH15c -Rg -Baf -I+d -K > map.ps\
  gmt pscoast -J -R -W1/0.25p -K -O >> map.ps\
  gmt psxy points.txt -J -R -Sc0.2c -Gred -K -O >> map.ps\
  gmt pstext text.txt -J -R -F+f15p,Times-Bold,white+jTL -O >> map.ps\
  gmt psconvert -A -P -Tg map.ps\
]

#slide[
  *GMT 经典模式*

  #set text(size: 0.85em, font: "DejaVu Sans Mono")
  gmt grdimage `@earth_relief_15m` -JH15c -Rg -Baf -I+d #strike(stroke: 2.0pt + red)[-K > map.ps]\
  gmt pscoast #strike(stroke: 2.0pt + red)[-J -R] -W1/0.25p #strike(stroke: 2.0pt + red)[-K -O >> map.ps]\
  gmt psxy points.txt #strike(stroke: 2.0pt + red)[-J -R] -Sc0.2c -Gred #strike(stroke: 2.0pt + red)[-K -O >> map.ps]\
  gmt pstext text.txt #strike(stroke: 2.0pt + red)[-J -R] -F+f15p,Times-Bold,white+jTL #strike(stroke: 2.0pt + red)[-O >> map.ps]\
  #strike(stroke: 2.0pt + red)[gmt psconvert -A -P -Tg map.ps]\

  #pause
  *GMT现代模式*
  #set text(size: 1.0em, font: "DejaVu Sans Mono")
  ```
  gmt begin map png
    gmt grdimage @earth_relief_15m -JH15c -Rg -Baf -I+d
    gmt coast -W1/0.25p
    gmt plot points.txt -Sc0.2c -Gred
    gmt text text.txt -F+f15p,Times-Bold,white+jTL
  gmt end show
  ```
  详情参考：https://docs.gmt-china.org/latest/migrating/classic2modern/
]

== GMT现代模式：多子图

#slide(composer: (60%, 40%))[
  #set text(0.67em)
  ```bash
  gmt begin map
    gmt subplot begin 2x2 -Fs5c/3c -A -M0.2c/0.1c -T"My Subplot Heading"
      gmt subplot set 0
      gmt basemap -R0/10/0/10 -JX? -Baf -BWSen

      gmt subplot set 1
      gmt basemap -R0/20/0/10 -JX? -Baf -BWSen

      gmt subplot set 2
      gmt basemap -R0/10/0/20 -JX? -Baf -BWSen

      gmt subplot set 3
      gmt basemap -R0/20/0/20 -JX? -Baf -BWSen
    gmt subplot end
  gmt end show
  ```
][
  #image("assets/subplot.png", width: 100%)
]

== GMT现代模式：区位图
#slide[
  #set text(0.75em)
  ```bash
  gmt begin inset-example
    gmt coast -R110E/170E/44S/9S -JM6i -B -BWSne -Wfaint -N2/1p -Gbrown -EAU+gbisque
    gmt inset begin -DjTR+w1.5i+o0.15i/0.1i -F+gwhite+p1p+c0.1c
      gmt coast -JG120/30S/? -Rg -Bg -Wfaint -Gbrown -EAU+gbisque -A5000
    gmt inset end
  gmt end show
  ```
  #image("assets/inset.png", width: 50%)
]

== GMT远程数据

#slide(composer: utils.side-by-side.with(columns: (1fr, 4fr), gutter: 1em))[
  - 地球地形起伏
  - 地球洋壳年龄
  - 地磁异常
  - 行星地形（月球、火星、水星、金星、冥王星）
  - ……
][
  #figure(
    image("assets/remote-datasets.png", width: 100%),
    caption: "https://www.generic-mapping-tools.org/remote-datasets")
]

#slide[
  语法： `@earth_relief_15m_g`

  - `earth_relief`: 数据名称
  - `15m`: 数据分辨率 `01d`, `30m`, ..., `01m`, `30s`,..., `01s`
  - `g`: 数据配准方式 `g` or `p` [可省略]

  #grid(
    columns: 2,
    gutter: 20pt,
    [
      ```bash
      gmt begin map
        gmt set GMT_DATA_SERVER china
        gmt grdimage @earth_relief_01d -Baf
      gmt end show
      ```

      中国镜像要求 GMT >= 6.5
    ], [
      #image("assets/remote-data-example.png", height: 50%)
    ]
  )


]

= Python/Julia/Matlab

== PyGMT

#slide[
  #figure(
    image("assets/pygmt-landing.png", height: 80%)
  )
  - 主页：https://www.pygmt.org/
  - 源码：https://github.com/GenericMappingTools/pygmt
]
#slide(composer: (65%, 35%))[
  #set text(0.75em)
  ```python
  import pygmt
  from pygmt.datasets import load_earth_relief

  grid = load_earth_relief(
      resolution="30s",
      region=[144.5, 145.5, 13, 14.5]
  )

  fig = pygmt.Figure()
  fig.grdimage(grid=grid, frame="a", projection="M10c", cmap="oleron")
  fig.grdcontour(grid=grid, levels=500, annotation=1000)
  fig.coast(shorelines="2p", land="lightgray")
  fig.colorbar(frame=["a1000", "x+lElevation", "y+lm"])
  fig.show()
  ```

  主要特点：

  - 更易读的参数名
  - 参数名自动补全
  - 支持 Jupyter Notebook
  - 支持 NumPy、Pandas、GeoPandas、Xarray
][
 #image("assets/pygmt-1.png", width: 90%)
]

#slide(composer: (60%, 40%))[
  NumPy + Pandas + GeoPandas + Xarray
  #set text(0.75em)
  ```python
  import numpy as np
  import pygmt

  rng = np.random.default_rng(seed=42)
  region = [150, 240, -10, 60]
  x = rng.uniform(low=region[0], high=region[1], size=100)
  y = rng.uniform(low=region[2], high=region[3], size=100)


  fig = pygmt.Figure()
  fig.basemap(region=region, projection="X15c", frame=True)
  fig.plot(x=x, y=y, style="i0.5c", fill="black")
  fig.show()
  ```
][
  #image("assets/points.png", width: 100%)
]

== GMT.jl
#slide[
  #figure(
    image("assets/julia-landing.png", height: 80%)
  )
  - 主页：https://www.generic-mapping-tools.org/GMTjl_doc/
  - GitHub：https://github.com/GenericMappingTools/GMT.jl
]

== GMT/Matlab

#slide[
  #figure(image("assets/matlab.png", height: 100%))
]

= GMT 学习资源

1. 官方文档

#image("assets/gmt-docs.png", height: 88%)

2. 中文社区文档
#image("assets/gmt-china-docs.png", height: 88%)

3. GMT6初学者视频教程 Bilibili
#image("assets/bilibili.png", height: 88%)

4. 官方论坛
#image("assets/forum.png", height: 88%)

5. 2000 人 QQ 群：
  #grid(
    columns: 2,
    gutter: 1cm,
    image("assets/QQ-group1.png", height: 88%),
    image("assets/QQ-group2.png", height: 88%)
  )

= Final Words

#slide[
  #figure(image("assets/PaulWessel.jpg"), caption: "Paul Wessel (1959-2024)")
][
  #quote(attribution: [Paul Wessel])[
  I do hope that among the thousands of GMT users there will be a small subset who feel perhaps they should give back by involving themselves at some level in the GMT community and thus ensure GMT will not disappear overnight when I do.
  ]

  #set align(right)
  ------ Paul Wessel

  #set align(left)
  #text(0.75em)[
  Wessel, P. (2024).
  The Origins of the Generic Mapping Tools: From Table Tennis to Geoscience.
  _Perspectives of Earth and Space Scientists_,
  5(1), e2023CN000231.
  ]
]
