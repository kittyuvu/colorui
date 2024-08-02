import 'dart:ui';

import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';

const bgIMG = "https://beta3.color-ui.com/01.jpeg";

class MenuItem {
  MenuItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    this.bg,
    this.href = "",
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Gradient? bg;
  final String href;
}

/// https://beta3.color-ui.com
Map<String, List<MenuItem>> menus = {
  "基础": [
    MenuItem(
      title: "系统",
      subTitle: 'system',
      icon: CuIcons.set,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "主题",
      subTitle: 'theme',
      icon: CuIcons.paint,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "导航栏",
      subTitle: 'navbar',
      icon: CuIcons.topbar,
      bg: CuLinearGradient.pink,
    ),
    MenuItem(
      title: "背景",
      subTitle: 'background',
      icon: CuIcons.palette,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "文本",
      subTitle: 'text',
      icon: CuIcons.aa,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "图标",
      subTitle: 'icon',
      icon: CuIcons.magic,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "阴影",
      subTitle: 'shadow',
      icon: CuIcons.darkmode,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "边框",
      subTitle: 'border',
      icon: CuIcons.box,
      bg: CuLinearGradient.green,
    ),
  ],
  "视图": [
    MenuItem(
      title: "头像",
      subTitle: 'avatar',
      icon: CuIcons.avatar,
      bg: CuLinearGradient.brown,
    ),
    MenuItem(
      title: "标题",
      subTitle: 'title',
      icon: CuIcons.tt,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "标签",
      subTitle: 'tag',
      icon: CuIcons.tag,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "按钮",
      subTitle: 'button',
      icon: CuIcons.ellipse,
      bg: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "图片",
      subTitle: 'image',
      icon: CuIcons.pic,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
        title: "代码",
        subTitle: 'code',
        icon: CuIcons.codeBox,
        bg: CuLinearGradient.red),
    MenuItem(
      title: "进度条",
      subTitle: 'progress',
      icon: CuIcons.progress,
      bg: CuLinearGradient.cyan,
    ),
    MenuItem(
      title: "加载中",
      subTitle: 'loading',
      icon: CuIcons.loaderFill,
      bg: CuLinearGradient.mauve,
    ),
  ],
  "布局": [
    MenuItem(
      title: "容器",
      subTitle: 'flex',
      icon: CuIcons.viewAgenda,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "菜单",
      subTitle: 'menu',
      icon: CuIcons.viewAgenda,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "浮动",
      subTitle: 'float',
      icon: CuIcons.dashboard,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "卡片",
      subTitle: 'card',
      icon: CuIcons.card,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
        title: "列表",
        subTitle: 'list',
        icon: CuIcons.viewList,
        bg: CuLinearGradient.grey),
    MenuItem(
      title: "栅格",
      subTitle: 'grid',
      icon: CuIcons.grid,
      bg: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "时间轴",
      subTitle: 'timeline',
      icon: CuIcons.stock,
      bg: CuLinearGradient.red,
    ),
    MenuItem(
      title: "表格",
      subTitle: 'table',
      icon: CuIcons.grid,
      bg: CuLinearGradient.blue,
    ),
  ],
  "交互": [
    MenuItem(
      title: "气泡框",
      subTitle: 'popover',
      icon: CuIcons.popover,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "模态框",
      subTitle: 'modal',
      icon: CuIcons.stop,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "轻提示",
      subTitle: 'toast',
      icon: CuIcons.subtitles,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "抽屉",
      subTitle: 'drawer',
      icon: CuIcons.quill,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "折叠面板",
      subTitle: 'collapse',
      icon: CuIcons.viewDay,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "选项卡",
      subTitle: 'tab',
      icon: CuIcons.viewArray,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "轮播图",
      subTitle: 'swiper',
      icon: CuIcons.viewCarousel,
      bg: CuLinearGradient.red,
    ),
    MenuItem(
      title: "步骤条",
      subTitle: 'steps',
      icon: CuIcons.gitCommit,
      bg: CuLinearGradient.mauve,
    ),
  ],
  "表单": [
    MenuItem(
      title: "输入框",
      subTitle: 'input',
      icon: CuIcons.input,
      bg: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "单选框",
      subTitle: 'radio',
      icon: CuIcons.radiobox,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "复选框",
      subTitle: 'checkbox',
      icon: CuIcons.checkbox,
      bg: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "开关",
      subTitle: 'switch',
      icon: CuIcons.toggle,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "选择器",
      subTitle: 'picker',
      icon: CuIcons.viewHeadline,
      bg: CuLinearGradient.pink,
    ),
  ],
};

void main() {
  runApp(const UIExample());
}

class UIExample extends StatelessWidget {
  const UIExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: DragonScrollBehavior(),
      home: const UIKit(),
    );
  }
}

class UIKit extends StatelessWidget {
  const UIKit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(bgIMG),
          ),
        ),
        child: const UIApp(),
      ),
    );
  }
}

class UIApp extends StatefulWidget {
  const UIApp({super.key});

  @override
  State<UIApp> createState() => _UIAppState();
}

class _UIAppState extends State<UIApp> {
  Widget px({required Widget child, double? top}) {
    double $top = top ?? 0;
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: $top,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    late Widget ret;
    Widget child = SingleChildScrollView(
      child: Column(
        children: menus.entries.map((item) {
          return Column(
            children: [
              px(top: 24, child: CuAction(title: item.key)),
              px(
                top: 10,
                child: GridView.builder(
                  itemBuilder: (BuildContext cx, idx) {
                    var curr = item.value[idx];
                    return CuSimpleCard(
                      data: curr,
                      bg: curr.bg,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: item.value.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 6,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
    if (width > 600) {
      ret = Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0x00afa6a6).withOpacity(1),
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 1,
              )
            ],
          ),
          width: 420,
          height: height * 0.72,
          child: child,
        ),
      );
    } else {
      ret = child;
    }
    return ret;
  }
}

class CuSimpleCard extends StatelessWidget {
  const CuSimpleCard({
    super.key,
    required this.data,
    this.bg,
  });
  final MenuItem data;
  final Gradient? bg;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: CuSimpleLine(
                        width: double.infinity,
                        mainWidth: .42,
                        size: 1.5,
                        mainSize: 3,
                        color: Colors.white,
                        mainColor: Colors.white,
                      ),
                    ),
                    Text(
                      data.subTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Builder(builder: (context) {
                  return Icon(data.icon, color: Colors.white);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CuSimpleLine extends StatelessWidget {
  const CuSimpleLine({
    super.key,
    required this.width,
    this.size = 2,
    this.mainWidth = .42,
    this.mainSize = 4,
    this.color = const Color(0xFF323232),
    this.mainColor = const Color(0xFF000000),
  });
  final double width;
  final double mainWidth;
  final double size;
  final double mainSize;
  final Color color;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SimpleDecorationLine(
        lineWidth: width,
        lineHeight: size,
        mainLineWidth: mainWidth,
        mainLineHeight: mainSize,
        color: color,
        mainColor: mainColor,
      ),
      size: Size(width, size + mainSize),
    );
  }
}

class SimpleDecorationLine extends CustomPainter {
  SimpleDecorationLine({
    this.lineWidth = 120,
    this.lineHeight = 1,
    this.mainLineWidth = .42, // real is (120 * .42)
    this.mainLineHeight = 2,
    required this.color,
    required this.mainColor,
  });

  final double lineWidth;
  final double lineHeight;
  final double mainLineWidth;
  final double mainLineHeight;
  final Color color;
  final Color mainColor;

  double calcMaxWidth(Size size) {
    late double maxWidth;
    if (lineWidth == double.infinity) {
      maxWidth = size.width;
    } else {
      maxWidth = lineWidth;
    }
    return maxWidth;
  }

  //   x = 0, mainH + lineH * .5       y = W, mainH + lineH * .5
  // [ x===============================y  ]
  drawLine(Canvas cx, Size size) {
    Paint mainPaint = Paint()
      ..color = color
      ..strokeWidth = lineHeight
      ..style = PaintingStyle.stroke;
    double maxWidth = calcMaxWidth(size);
    double offsetY = mainLineHeight + lineHeight * .5;
    var start = Offset(0, offsetY);
    var end = Offset(maxWidth, offsetY);
    cx.drawLine(start, end, mainPaint);
  }

  //   x = 0, mainH * .5           y = mainW * W, mainH * .5
  // [ x===========================y  ]
  drawMainLine(Canvas cx, Size size) {
    Paint mainPaint = Paint()
      ..color = mainColor
      ..strokeWidth = mainLineHeight
      ..style = PaintingStyle.stroke;
    double maxWidth = calcMaxWidth(size);
    double offsetX = mainLineWidth * maxWidth;
    double offsetY = mainLineHeight * .5;
    var start = Offset(0, offsetY);
    var end = Offset(offsetX, offsetY);
    cx.drawLine(start, end, mainPaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawLine(canvas, size);
    drawMainLine(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CuAction extends StatelessWidget {
  const CuAction({
    super.key,
    required this.title,
  });
  final String title;

  Widget get left {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 6,
      height: 18,
    );
  }

  Widget get right {
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              left,
              const SizedBox(width: 8),
              Expanded(
                  child: Text(title, style: const TextStyle(fontSize: 18))),
            ],
          ),
        ),
        right,
      ],
    );
  }
}

class DragonScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
