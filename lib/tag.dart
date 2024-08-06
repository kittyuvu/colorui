import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';

var kTagDisabledOpacity = 0.72;
var kTagPadding = [3, 9].$edge;
var kTagContentSpacing = 3.0;

class CuTag extends StatelessWidget {
  const CuTag({
    super.key,
    required this.text,
    this.borderRadius,
    this.border,
    this.color,
    this.textSize,
    this.textColor,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.backgroundColor,
    this.gradient,
    this.decoration,
    this.disabled = false,
    this.disabledOpacity,
    this.shape = CuShape.radius,
    this.cursor,
    this.trailing,
    this.padding,
    this.onTap,
    this.onTrailingTap,
    this.shadow,
    this.contentSpacing,
  }) : assert(shape != CuShape.round, "not support shape == CuShape.round");

  /// 文字和图标颜色
  /// 它的优先级会比 [textColor] | [iconColor] 低
  final Color? color;

  final String text;
  final double? textSize;
  final Color? textColor;

  /// 文本样式
  /// 它的优先级会比 [textColor] | [iconColor] 高
  final TextStyle? textStyle;

  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  /// 形状(注意, 不支持 [CuShape.round])
  final CuShape shape;

  final Color? backgroundColor;
  final LinearGradient? gradient;
  final BorderRadius? borderRadius;

  /// The ellipse shape border not work
  final BoxBorder? border;
  final EdgeInsets? padding;
  final BoxShadow? shadow;

  final double? contentSpacing;

  /// provide box decoration
  /// 优先级高于
  /// - [backgroundColor] | [gradient] | [borderRadius] | [border]
  final BoxDecoration? decoration;

  /// 是否禁用
  ///
  /// 禁用之后 [onTap] 不会触发
  final bool disabled;
  final double? disabledOpacity;

  final MouseCursor? cursor;

  /// 右边 widget 一般用于关闭/点赞(按钮)?
  final Widget? trailing;

  final VoidCallback? onTap;
  final VoidCallback? onTrailingTap;

  double get $contentSpacing => contentSpacing ?? kTagContentSpacing;

  Decoration get $decoration {
    if (decoration != null) return decoration!;
    if (shape == CuShape.ellipse) {
      return ShapeDecoration(
        color: backgroundColor,
        gradient: gradient,
        shape:
            SuperellipseShape(borderRadius: borderRadius ?? 24.$radiusCircle),
        shadows: shadow != null ? [shadow!] : null,
      );
    }
    return BoxDecoration(
      boxShadow: shadow != null ? [shadow!] : null,
      gradient: gradient,
      color: backgroundColor,
      borderRadius:
          shape == CuShape.radius ? (borderRadius ?? 5.0.$radiusCircle) : null,
      border: border,
      shape: shape == CuShape.round ? BoxShape.circle : BoxShape.rectangle,
    );
  }

  Widget get $icon {
    return Icon(
      icon!,
      size: iconSize,
      color: iconColor ?? color,
    );
  }

  Widget get $text {
    return Text(
      text,
      style: textStyle ??
          TextStyle(
            color: textColor ?? color,
            fontSize: textSize,
          ),
    );
  }

  Widget get $trailing {
    var child = trailing!;
    if (onTrailingTap != null) {
      child = GestureDetector(
        onTap: () {
          if (disabled) return;
          onTrailingTap?.call();
        },
        child: child,
      );
    }
    return DefaultTextStyle(
      style: TextStyle(
        color: textColor ?? color,
        fontSize: textSize,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (disabled) return;
        onTap?.call();
      },
      child: MouseRegion(
        cursor: disabled
            ? SystemMouseCursors.forbidden
            : (cursor ?? SystemMouseCursors.click),
        child: Opacity(
          opacity: disabled ? (disabledOpacity ?? kTagDisabledOpacity) : 1,
          child: Container(
            decoration: $decoration,
            padding: padding ?? kTagPadding,
            clipBehavior: Clip.hardEdge,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) $icon,
                if (icon != null) $contentSpacing.wSpace,
                $text,
                if (trailing != null) $contentSpacing.wSpace,
                if (trailing != null) $trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
