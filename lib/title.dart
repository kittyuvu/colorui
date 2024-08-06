import 'package:colorui/colorui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

enum CuTitleDepth { h1, h2, h3, h4 }

enum CuTitleStyle { plain, dot, line }

enum CuTitleAlign { left, center, right }

var kCuTitleIcon = CuIcons.titles;
var kCuTitleIconSize = CuFontSizes.df;

class CuTitle extends StatelessWidget {
  const CuTitle({
    super.key,
    this.depth = CuTitleDepth.h2,
    this.style = CuTitleStyle.plain,
    required this.title,
    this.titleStyle,
    this.desc,
    this.descStyle,
    this.descSpacing,
    this.isIcon = true,
    this.icon,
    this.iconColor,
    this.iconSpacing,
    this.decorationColor,
    this.align = CuTitleAlign.left,
  });

  final CuTitleDepth? depth;
  final CuTitleStyle style;

  final String title;
  final TextStyle? titleStyle;

  final String? desc;
  final TextStyle? descStyle;
  final double? descSpacing;

  final bool isIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSpacing;

  final Color? decorationColor;

  final CuTitleAlign align;

  bool get isPlain => style == CuTitleStyle.plain;

  Widget get $icon {
    if (!isIcon || !isPlain) return const SizedBox.shrink();
    return Icon(
      icon ?? kCuTitleIcon,
      size: $fontSize,
      color: iconColor ?? CuColors.blue,
    );
  }

  Widget get $title {
    return Text(
      title,
      style: titleStyle ??
          TextStyle(
            fontSize: $fontSize,
            fontWeight: (depth == CuTitleDepth.h1 ||
                    depth == CuTitleDepth.h2 ||
                    depth == CuTitleDepth.h3)
                ? FontWeight.bold
                : null,
            color: CuColors.black,
          ),
    );
  }

  Widget get $desc {
    if (desc == null) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        (descSpacing ?? 4.0).wSpace,
        Text(
          desc!,
          style: descStyle ??
              TextStyle(
                fontSize: $fontSize * .66,
                color: CuColors.black.withOpacity(.66),
              ),
        ),
      ],
    );
  }

  double get $fontSize {
    switch (depth) {
      case CuTitleDepth.h1:
        return CuFontSizes.xxl;
      case CuTitleDepth.h2:
        return CuFontSizes.xl;
      case CuTitleDepth.h3:
        return CuFontSizes.lg;
      case CuTitleDepth.h4:
        return CuFontSizes.df;
      default:
        return CuFontSizes.df;
    }
  }

  buildCircle() {
    return Positioned(
      top: -4,
      left: -4,
      child: Container(
        width: $fontSize,
        height: $fontSize,
        decoration: BoxDecoration(
            color: decorationColor ?? CuColors.blue, shape: BoxShape.circle),
      ),
    );
  }

  buildLine() {
    return Positioned(
      bottom: align == CuTitleAlign.left ? 2 : 5,
      left: align == CuTitleAlign.left ? 2 : null,
      right: align == CuTitleAlign.right ? 2 : null,
      child: Container(
        width: 46,
        height: 8,
        decoration: const BoxDecoration(
          color: CuColors.blue,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }

  MainAxisAlignment get mainAxisAlignment {
    switch (align) {
      case CuTitleAlign.left:
        return MainAxisAlignment.start;
      case CuTitleAlign.center:
        return MainAxisAlignment.center;
      case CuTitleAlign.right:
        return MainAxisAlignment.end;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        $icon,
        (iconSpacing ?? 3.0).wSpace,
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (style == CuTitleStyle.dot) buildCircle(),
            if (style == CuTitleStyle.line) buildLine(),
            Row(
              children: [
                $title,
                $desc,
              ],
            ),
          ],
        ),
      ],
    );
  }
}
