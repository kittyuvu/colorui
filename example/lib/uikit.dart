import 'package:colorui/colorui.dart';
import 'package:example/extensions.dart';
import 'package:example/menus.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UIKit extends StatelessWidget {
  const UIKit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: UIApp());
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
    Widget child = SingleChildScrollView(
      child: Column(
        children: kMenus.entries.map((item) {
          return Column(
            children: [
              px(
                top: 24,
                child: CuAction(
                  title: item.key,
                  color: CuColors.blue,
                ),
              ),
              px(
                top: 10,
                child: GridView.builder(
                  itemBuilder: (BuildContext cx, idx) {
                    var curr = item.value[idx];
                    return CuSimpleCard(
                      data: curr,
                      color: curr.color,
                      onTap: () {
                        if (curr.name.isNotEmpty) {
                          context.pushNamed(curr.name);
                        }
                      },
                    );
                  },
                  shrinkWrap: true,
                  itemCount: item.value.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
    return UIMainLayout(context: context, child: child);
  }
}

class CuSimpleCard extends StatelessWidget {
  const CuSimpleCard({
    super.key,
    required this.data,
    this.color,
    this.onTap,
  });
  final MenuItem data;
  final Gradient? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: color,
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
                        data.subTitle.capitalize,
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
