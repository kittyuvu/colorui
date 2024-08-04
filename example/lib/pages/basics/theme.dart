import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => ThemePageState();
}

class ThemePageState extends State<ThemePage> {
  bool lightEnable = false;
  bool darkEnable = false;
  @override
  Widget build(BuildContext context) {
    late Color bg;
    if (darkEnable) {
      bg = CuColors.black.withOpacity(.88);
    } else {
      bg = CuColors.grey.withOpacity(.42);
    }
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(title: "主题"),
        backgroundColor: bg,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      lightEnable = !lightEnable;
                      darkEnable = false;
                      setState(() {});
                    },
                    child: SimplePhone(
                      width: 95,
                      height: 160,
                      active: lightEnable,
                      backgroundColor: CuColors.white,
                      activeColor: CuColors.blue,
                      xColor: CuColors.grey,
                    ),
                  ),
                  32.wSpace,
                  GestureDetector(
                    onTap: () {
                      darkEnable = !darkEnable;
                      lightEnable = false;
                      setState(() {});
                    },
                    child: SimplePhone(
                      width: 95,
                      height: 160,
                      active: darkEnable,
                      backgroundColor: CuColors.black.withOpacity(.88),
                      xColor: CuColors.white,
                    ),
                  ),
                ],
              ),
              hSpacing,
              Text(
                "然而暂未支持~",
                style: TextStyle(
                  color: darkEnable ? CuColors.white : CuColors.blue,
                ),
              ),
              hSpacing,
              CupertinoButton.filled(
                padding: 66.$edgeLR,
                onPressed: () {
                  if (lightEnable) {
                    lightEnable = false;
                    darkEnable = true;
                  } else {
                    lightEnable = true;
                    darkEnable = false;
                  }
                  setState(() {});
                },
                child: Text("切换", style: const TextStyle().$df),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimplePhone extends StatelessWidget {
  const SimplePhone({
    super.key,
    required this.width,
    required this.height,
    required this.active,
    this.activeColor = CuColors.blue,
    this.backgroundColor = CuColors.white,
    this.blockColor = CuColors.grey,
    this.xColor = CuColors.grey,
  });
  final double width;
  final double height;
  final bool active;
  final Color activeColor;
  final Color backgroundColor;
  final Color blockColor;
  final Color xColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SimplePhonePaint(
        active: active,
        activeColor: activeColor,
        backgroundColor: backgroundColor,
        blockColor: blockColor,
        xColor: xColor,
      ),
      size: Size(width, height),
    );
  }
}

class SimplePhonePaint extends CustomPainter {
  SimplePhonePaint({
    required this.active,
    this.activeColor = CuColors.red,
    this.backgroundColor = CuColors.white,
    this.blockColor = CuColors.grey,
    this.xColor = CuColors.grey,
  });

  final bool active;
  final Color activeColor;
  final Color backgroundColor;
  final Color blockColor;
  final Color xColor;

  double wScale = .8;
  double mainBlockScale = .32;
  double secondBlockScale = .16;
  double mainBlockOffsetTop = 12;
  double secondBlockOffsetTop = 4;
  double xScale = .5;
  double xHeight = 2;
  drawShell(Canvas cx, Size size) {
    // 画一个白色的圆角矩形
    draw({bool border = false}) {
      Paint paint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = border ? xHeight : 0
        ..style = border ? PaintingStyle.stroke : PaintingStyle.fill
        ..color = border ? activeColor : backgroundColor;
      var radius = const Radius.circular(12);
      var rect = Rect.fromLTRB(0, 0, size.width, size.height);
      var rrect = RRect.fromRectAndRadius(rect, radius);
      cx.drawRRect(rrect, paint);
    }

    draw();
    if (active) draw(border: true);

    // 画第一块
    {
      Paint paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..color = active ? activeColor : blockColor;
      var radius = const Radius.circular(6);
      var width = size.width * wScale;
      var height = size.height * mainBlockScale;
      var rect = Rect.fromCenter(
        center: Offset(
          (width / 2) + (size.width * (1 - wScale) * .5),
          (height / 2) + mainBlockOffsetTop,
        ),
        width: width,
        height: height,
      );
      var rrect = RRect.fromRectAndRadius(rect, radius);
      cx.drawRRect(rrect, paint);
    }

    drawBlock(double top) {
      Paint paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..color = blockColor;
      var radius = const Radius.circular(6);
      var width = size.width * wScale;
      var height = size.height * secondBlockScale;
      var rect = Rect.fromCenter(
        center: Offset(
          (width / 2) + (size.width * (1 - wScale) * .5),
          (height / 2) + top,
        ),
        width: width,
        height: height,
      );
      var rrect = RRect.fromRectAndRadius(rect, radius);
      cx.drawRRect(rrect, paint);
    }

    drawBlock(
      (mainBlockOffsetTop + size.height * mainBlockScale) +
          secondBlockOffsetTop,
    );
    drawBlock(
      (mainBlockOffsetTop + size.height * mainBlockScale) +
          secondBlockOffsetTop +
          (size.height * secondBlockScale + secondBlockOffsetTop),
    );

    {
      Paint paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = xHeight
        ..color = xColor;
      var width = size.width * xScale;
      // 已知总宽度为 x
      // 需要自动居中的块宽度为 w
      // 则 x1 = (x - w) / 2
      //    x2 = (x - w) / 2 + w
      var p1 = Offset((size.width - width) / 2,
          size.height - secondBlockOffsetTop - xHeight);
      var p2 = Offset((size.width - width) / 2 + width,
          size.height - secondBlockOffsetTop - xHeight);
      cx.drawLine(p1, p2, paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawShell(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! SimplePhonePaint) return false;
    return oldDelegate.active != active ||
        oldDelegate.activeColor != activeColor;
  }
}
