import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';

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
    this.shape = CuShape.radius,
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

  final CuShape shape;
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
    if (shape == CuShape.ellipse) {
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
      borderRadius: shape == CuShape.radius ? 5.0.$radiusCircle : null,
      shape: shape == CuShape.round ? BoxShape.circle : BoxShape.rectangle,
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
    var offset = badgeOffset ?? const Size(0, 0);
    var w = offset.width;
    var h = offset.height;
    late Widget $badge; // stupid!
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
