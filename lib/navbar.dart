import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';

/// 导航栏
///
/// ```dart
/// CuNavbar(
///   title: '详情页',
///   backTitle: '返回',
///   onBack: () {
///     print('返回');
///   },
/// )
/// ```
class CuNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CuNavbar({
    super.key,
    this.back,
    this.backTitle,
    this.context,
    this.onBack,
    this.title,
    this.titleText,
    this.trailing,
    this.decoration,
    this.backgroundColor,
    this.height = kToolbarHeight,
    this.spacing = 6,
  });
  final double height;
  final VoidCallback? onBack;
  final BuildContext? context;
  final Widget? back;
  final double spacing;
  final String? backTitle;
  final Widget? title;
  final String? titleText;
  final Widget? trailing;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  BuildContext? get $cx => context;

  BoxDecoration get $decoration {
    if (decoration != null) return decoration!;
    return BoxDecoration(
      color: backgroundColor ?? CuColors.white,
      border: Border(
        bottom: BorderSide(
          color: CuColors.black.withOpacity(.06),
          width: 1,
        ),
      ),
    );
  }

  Widget buildLeft(BuildContext context) {
    return Positioned(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (onBack != null) {
              onBack!();
            } else {
              Navigator.pop($cx ?? context);
            }
          },
          child: Padding(
            padding: spacing.$edgeL,
            child: SizedBox(
              height: double.infinity,
              child: Builder(
                builder: (_) {
                  if (back != null) return back!;
                  Widget $icon = const Icon(CuIcons.back, size: 18);
                  if (backTitle != null) {
                    return Row(
                      children: [$icon, Text(backTitle!)],
                    );
                  } else {
                    return $icon;
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: $decoration,
      child: Stack(
        children: [
          if (title != null)
            title!
          else if (titleText != null)
            Center(child: Text(titleText!)),
          buildLeft(context),
          if (trailing != null)
            Positioned(
              top: 0,
              right: 0,
              child: Row(
                children: [
                  SizedBox(height: height, child: trailing!),
                  spacing.wSpace,
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
