import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// 头像形状
enum CuAvatarShape {
  /// 圆角
  radius,

  /// 圆形
  round,

  /// 超椭圆
  ellipse,
}

enum CuAvatarSize { sm, df, lg, xl, xxl, sl }

enum CuAvatarBadgePostion {
  /// 左上
  topLeft,

  /// 右上
  topRight,

  /// 左下
  bottomLeft,

  /// 右下
  bottomRight,
}

double _getAvatarSize(CuAvatarSize size) {
  switch (size) {
    case CuAvatarSize.sm:
      return 24;
    case CuAvatarSize.df:
      return 32;
    case CuAvatarSize.lg:
      return 40;
    case CuAvatarSize.xl:
      return 48;
    case CuAvatarSize.xxl:
      return 56;
    case CuAvatarSize.sl:
      return 64;
  }
}

class CuAvatar extends StatelessWidget {
  const CuAvatar({
    super.key,
    this.size = CuAvatarSize.df,
    this.shape = CuAvatarShape.radius,
    this.shadow,
    this.image,
    this.imageFit,
    this.customSize,
    this.background,
    this.gradient,
    this.badge,
    this.badgeOffset,
    this.badgePosition,
    this.child,
  });

  final CuAvatarShape shape;
  final CuAvatarSize size;
  final double? customSize;
  final CuBoxShadow? shadow;

  final Color? background;
  final LinearGradient? gradient;

  final Widget? child;
  final ImageProvider? image;
  final BoxFit? imageFit;

  final Widget? badge;
  final CuAvatarBadgePostion? badgePosition;
  final Size? badgeOffset;

  double get width => customSize ?? _getAvatarSize(size);

  double get height => customSize ?? _getAvatarSize(size);

  Decoration get decoration {
    Color? color = background ?? (gradient != null ? null : CuColors.white);
    if (shape == CuAvatarShape.ellipse) {
      return ShapeDecoration(
        color: color,
        gradient: gradient,
        shape: SuperellipseShape(borderRadius: 24.$radiusCircle),
        shadows: shadow != null ? [shadow!] : null,
      );
    }
    return BoxDecoration(
      boxShadow: shadow != null ? [shadow!] : null,
      gradient: gradient,
      color: color,
      borderRadius: shape == CuAvatarShape.radius ? 5.0.$radiusCircle : null,
      shape:
          shape == CuAvatarShape.round ? BoxShape.circle : BoxShape.rectangle,
    );
  }

  Widget? get $child {
    if (image != null) {
      return Image(
        image: image!,
        fit: imageFit ?? BoxFit.cover,
      );
    }
    return child;
  }

  Widget get $badge {
    var offset = badgeOffset ?? const Size(0,0);
    var w = offset.width;
    var h = offset.height;
    late Widget $badge;// stupid!
    if (badgePosition == CuAvatarBadgePostion.topLeft) {
      $badge = Positioned(
        top: h,
        left: w,
        child: badge!,
      );
    }
    if (badgePosition == CuAvatarBadgePostion.topRight) {
      $badge = Positioned(
        top: h,
        right: w,
        child: badge!,
      );
    }
    if (badgePosition == CuAvatarBadgePostion.bottomLeft) {
      $badge = Positioned(
        bottom: h,
        left: w,
        child: badge!,
      );
    }
    if (badgePosition == CuAvatarBadgePostion.bottomRight) {
      $badge = Positioned(
        bottom: h,
        right: w,
        child: badge!,
      );
    }
    return $badge;
  }

  @override
  Widget build(BuildContext context) {
    var box = Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: decoration,
      child: $child,
    );
    if (badge != null) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          box,
          $badge,
        ],
      );
    }
    return box;
  }
}

/// copy by https://github.com/Salby/superellipse_shape
/// Creates a shape constituting a transition between a rectangle and a circle.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Material(
///     shape: SuperellipseShape(
///       borderRadius: BorderRadius.circular(24.0),
///     ),
///   );
/// }
/// ```
class SuperellipseShape extends ShapeBorder {
  /// The arguments must not be null.
  const SuperellipseShape({
    this.side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
  });

  /// The radii for each corner.
  ///
  /// Each corner [Radius] defines the endpoints for a line segment that
  /// spans the corner. The endpoints are located in the same place as
  /// They would be for [RoundedRectangleBorder].
  ///
  /// Negative radius values are clamped to 0.0 by [getInnerPath] and
  /// [getOuterPath].
  final BorderRadiusGeometry borderRadius;

  /// The style of this border.
  final BorderSide side;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      side: side.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  double _clampToShortest(RRect rrect, double value) =>
      value > rrect.shortestSide ? rrect.shortestSide : value;

  Path _getPath(RRect rrect) {
    /// Define the different variables of [rrect].
    final double left = rrect.left;
    final double right = rrect.right;
    final double top = rrect.top;
    final double bottom = rrect.bottom;

    /// Radii will be clamped to the value of the shortest side
    /// of [rrect] to avoid strange tie-fighter shapes.
    final double tlRadiusX =
        math.max(0.0, _clampToShortest(rrect, rrect.tlRadiusX));
    final double tlRadiusY =
        math.max(0.0, _clampToShortest(rrect, rrect.tlRadiusY));
    final double trRadiusX =
        math.max(0.0, _clampToShortest(rrect, rrect.trRadiusX));
    final double trRadiusY =
        math.max(0.0, _clampToShortest(rrect, rrect.trRadiusY));
    final double blRadiusX =
        math.max(0.0, _clampToShortest(rrect, rrect.blRadiusX));
    final double blRadiusY =
        math.max(0.0, _clampToShortest(rrect, rrect.blRadiusY));
    final double brRadiusX =
        math.max(0.0, _clampToShortest(rrect, rrect.brRadiusX));
    final double brRadiusY =
        math.max(0.0, _clampToShortest(rrect, rrect.brRadiusY));

    return Path()
      ..moveTo(left, top + tlRadiusX)
      ..cubicTo(left, top, left, top, left + tlRadiusY, top)
      ..lineTo(right - trRadiusX, top)
      ..cubicTo(right, top, right, top, right, top + trRadiusY)
      ..lineTo(right, bottom - blRadiusX)
      ..cubicTo(right, bottom, right, bottom, right - blRadiusY, bottom)
      ..lineTo(left + brRadiusX, bottom)
      ..cubicTo(left, bottom, left, bottom, left, bottom - brRadiusY)
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(
        borderRadius.resolve(textDirection).toRRect(rect).deflate(side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) return;
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        Path path = getOuterPath(rect, textDirection: textDirection);
        var paint = side.toPaint();
        canvas.drawPath(path, paint);
        break;
    }
  }
}
