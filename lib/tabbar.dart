import 'package:colorui/colors.dart';
import 'package:colorui/extensions.dart';
import 'package:flutter/material.dart';

/// 默认颜色(文字和 icon)
var kTabbarDefualtColor = const Color(0xff959496);

/// 默认选中颜色(文字和 icon)
var kTabbarSelectedColor = CuColors.blue;

/// 默认文字大小
var kTabbarFontsize = 14.0;

/// 默认图片大小
var kTabbarImageSize = 24;

/// 线条模式高度
var kLineModeSize = const Size(24, 4);
var kDotModeSize = const Size(6, 6);

enum SelectedMode {
  // 普通
  plain,
  // 线条
  line,
  // 圆点
  dot,

  /// ![郭德纲](https://i1.kknews.cc/O_tATXtS_p2Ixj4WxTVkKhMLm-OHEvbeBL-7rnE/0.jpg)
  @Deprecated("no no no no no no no")
  scale,
}

/// Alias of CuTabbar<T, CuTabbarItem>
typedef CuTabbarMap<T> = Map<T, CuTabbarItem>;

/// The image provider of the asset image
ImageProvider cuImage(String path) => AssetImage(path);

class CuTabbarItem {
  CuTabbarItem({
    this.child,
    this.label,
    this.labelFontSize,
    this.labelColor,
    this.labelSelectedColor,
    this.image,
    this.imageSelected,
    this.imageSize,
    this.imageFit,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconSelectedColor,
    this.iconWidget,
    this.onTap,
    this.flex = 1,
    this.disabled = false,
  });

  /// 自定义渲染
  ///
  /// 它如果存在优先级最高
  Widget? child;

  /// 文字
  String? label;

  /// 文字颜色
  Color? labelColor;

  /// 文字选中颜色
  Color? labelSelectedColor;

  /// 文字大小
  double? labelFontSize;

  /// 文字 widget
  /// 它如果存在优先级高于 [label]
  Widget? labelWidget;

  /// 图片
  ImageProvider? image;

  /// 被选中图片
  ImageProvider? imageSelected;

  /// 图片填充模式
  BoxFit? imageFit;

  /// 图片大小
  Size? imageSize;

  /// 自定义图片 widget
  ///
  /// 它如果存在优先级高于 [image] [icon]
  Widget? iconWidget;

  /// 图标
  IconData? icon;

  /// 图标大小
  double? iconSize;

  /// 图标颜色
  Color? iconColor;

  /// 图标选中颜色
  Color? iconSelectedColor;

  /// 是否禁用
  bool disabled;

  /// 宽度比例
  int flex;

  /// 线条模式高度
  Size? lineModeSize;

  /// 圆点模式大小
  Size? dotModeSize;

  /// 点击事件
  VoidCallback? onTap;
}

class CuTabbar<T> extends StatelessWidget implements PreferredSizeWidget {
  const CuTabbar({
    super.key,
    required this.items,
    this.selected,
    this.onItemTap,
    this.iconColor,
    this.iconSelectedColor,
    this.iconSize,
    this.imageSize,
    this.decoration,
    this.labelFontSize,
    this.labelColor,
    this.labelSelectedColor,
    this.lineModeSize,
    this.dotModeSize,
    this.disabled = false,
    this.backgroundColor = CuColors.white,
    this.height = kBottomNavigationBarHeight,
    this.spacing = 12.0,
    this.contentSpacing = 4.0,
    this.mode = SelectedMode.plain,
  }) : assert(items.length >= 2);
  final SelectedMode mode;
  final double height;

  /// The items of [CuTabbarItem]
  /// 优先级没有 [items] 中高
  final Map<T, CuTabbarItem> items;

  /// 图标颜色
  final Color? iconColor;

  /// 图标选中颜色
  final Color? iconSelectedColor;

  /// 图标大小
  final double? iconSize;

  /// 图片大小
  final Size? imageSize;

  /// 单个 item 点击事件, 携带回来 [T]
  final ValueChanged<T>? onItemTap;

  /// 当前选中的 item<[T]>
  final T? selected;

  /// 背景颜色
  final Color backgroundColor;

  /// 左右间距
  final double spacing;

  /// 内容之间的间隙(通常是图标和文字)
  final double contentSpacing;

  /// 如果不满意 [spacing] 可以自己改
  final BoxDecoration? decoration;

  /// 文字大小
  final double? labelFontSize;

  /// 文字颜色
  final Color? labelColor;

  /// 文字选中颜色
  final Color? labelSelectedColor;

  /// 是否(全局)禁用
  final bool disabled;

  /// 线条模式高度
  final Size? lineModeSize;

  /// 圆点模式大小
  final Size? dotModeSize;

  Widget buildImage(bool isCurr, CuTabbarItem curr) {
    return Builder(builder: (context) {
      assert(curr.image != null);
      var image = (isCurr ? curr.imageSelected : curr.image) ?? curr.image!;
      var width =
          (curr.imageSize?.width ?? imageSize?.width ?? kTabbarImageSize)
              .toDouble();
      var height =
          (curr.imageSize?.height ?? imageSize?.height ?? kTabbarImageSize)
              .toDouble();
      return Image(
        image: image,
        width: width,
        height: height,
        fit: curr.imageFit ?? BoxFit.cover,
      );
    });
  }

  Widget buildIcon(bool isCurr, CuTabbarItem curr) {
    return Builder(builder: (context) {
      var size = curr.iconSize ?? iconSize ?? 18;
      var color = isCurr
          ? (curr.iconSelectedColor ??
              iconSelectedColor ??
              kTabbarSelectedColor)
          : (curr.iconColor ?? iconColor ?? kTabbarDefualtColor);
      return Icon(curr.icon!, size: size, color: color);
    });
  }

  Widget buildLine(bool isCurr, CuTabbarItem curr) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: getLabelColor(isCurr, curr),
        borderRadius: BorderRadius.circular(2 /* hardcode */),
      ),
      child: SizedBox(
        width: curr.lineModeSize?.width ??
            lineModeSize?.width ??
            kLineModeSize.width,
        height: curr.lineModeSize?.height ??
            lineModeSize?.height ??
            kLineModeSize.height,
      ),
    );
  }

  Widget buildDot(bool isCurr, CuTabbarItem curr) {
    return Container(
      width:
          curr.dotModeSize?.width ?? dotModeSize?.width ?? kDotModeSize.width,
      height:
          curr.dotModeSize?.width ?? dotModeSize?.width ?? kDotModeSize.width,
      decoration: BoxDecoration(
        color: getLabelColor(isCurr, curr),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildLabel(bool isCurr, CuTabbarItem curr) {
    return Builder(
      builder: (context) {
        var color = getLabelColor(isCurr, curr);
        var fontSize = getLabelFontSize(curr);
        return Text(
          curr.label!,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        );
      },
    );
  }

  Widget buileRealLabel(bool isCurr, CuTabbarItem curr) {
    if (!isCurr) return buildLabel(isCurr, curr);
    switch (mode) {
      case SelectedMode.line:
        return buildLine(isCurr, curr);
      case SelectedMode.dot:
        return buildDot(isCurr, curr);
      case SelectedMode.plain:
        return buildLabel(isCurr, curr);
      default:
        return const SizedBox.shrink();
    }
  }

  onTap$(CuTabbarItem curr, T id) {
    bool isDisabled = disabled || curr.disabled;
    if (isDisabled) return;
    if (curr.onTap != null) {
      curr.onTap!();
    } else if (onItemTap != null) {
      onItemTap!(id);
    }
  }

  getLabelColor(bool isCurr, CuTabbarItem curr) {
    var color = isCurr
        ? (curr.labelSelectedColor ??
            labelSelectedColor ??
            kTabbarSelectedColor)
        : (curr.labelColor ?? labelColor ?? kTabbarDefualtColor);
    return color;
  }

  getLabelFontSize(CuTabbarItem curr) {
    var fontSize = curr.labelFontSize ?? labelFontSize ?? kTabbarFontsize;
    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: spacing),
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            border: Border(
              top: BorderSide(
                color: CuColors.black.withOpacity(0.09),
              ),
            ),
          ),
      child: Row(
        children: items.entries.map((item) {
          var id = item.key;
          var curr = item.value;
          if (curr.child != null) return curr.child!;
          bool isCurr = selected != null && id == selected;
          bool isDisabled = disabled || curr.disabled;
          return Expanded(
            flex: curr.flex,
            child: InkWell(
              mouseCursor: isDisabled
                  ? SystemMouseCursors.forbidden
                  : SystemMouseCursors.click,
              onTap: () => onTap$(curr, id),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (curr.iconWidget != null)
                    curr.iconWidget!
                  else if (curr.image != null)
                    buildImage(isCurr, curr)
                  else if (curr.icon != null)
                    buildIcon(isCurr, curr),
                  contentSpacing.hSpace,
                  if (curr.labelWidget != null)
                    curr.labelWidget!
                  else
                    buileRealLabel(isCurr, curr),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
