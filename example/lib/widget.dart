import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kMaxScreenWidth = 600;
const kBgIMG = "https://beta3.color-ui.com/01.jpeg";

class UIMainLayout extends StatelessWidget {
  const UIMainLayout({
    super.key,
    required this.child,
    this.context,
  });
  final Widget child;
  final BuildContext? context;
  BuildContext? get _cx => context;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(_cx ?? context).size.width;
    final height = MediaQuery.of(_cx ?? context).size.height;
    if (width > kMaxScreenWidth) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: CuColors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(kBgIMG),
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: CuColors.white,
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
        ),
      );
    }
    return child;
  }
}

@Deprecated("不要使用")
class CuSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CuSimpleAppBar({
    super.key,
    this.onBack,
    this.title,
  });

  final VoidCallback? onBack;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CuColors.white,
        border: Border(
          bottom: BorderSide(
            color: CuColors.black.withOpacity(.12),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CuActionBar(
          centerTitle: title,
          onTapLeft: () {
            if (onBack != null) {
              onBack!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

// 啊! 这里好蠢啊, 没不要这么复杂啊
@Deprecated("不要使用")
class CuActionBar extends StatelessWidget {
  const CuActionBar({
    super.key,
    this.leftWidget,
    this.leftTitle,
    this.centerWidget,
    this.centerTitle,
    this.rightWidget,
    this.rightIcon,
    this.onTapLeft,
  });

  final Widget? leftWidget;
  final String? leftTitle;
  final Widget? centerWidget;
  final String? centerTitle;
  final Widget? rightWidget;
  final IconData? rightIcon;
  final VoidCallback? onTapLeft;

  Widget get left {
    if (leftWidget != null) return leftWidget!;
    return GestureDetector(
      onTap: onTapLeft,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            const Icon(
              CuIcons.back,
              size: 16,
            ),
            if (leftTitle != null) Text(leftTitle!),
          ],
        ),
      ),
    );
  }

  Widget get center {
    if (centerWidget != null) return centerWidget!;
    if (centerTitle != null) {
      return Expanded(
        child: Center(
          child: Text(centerTitle!),
        ),
      );
    }
    return const Expanded(child: SizedBox.shrink());
  }

  Widget get right {
    if (rightWidget != null) return rightWidget!;
    if (rightIcon != null) return Icon(rightIcon!);
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        left,
        center,
        right,
      ],
    );
  }
}

class CuAction extends StatelessWidget {
  const CuAction({
    super.key,
    required this.title,
    this.color = CuColors.blue,
    this.radius = 12,
  });
  final String title;
  final Color color;
  final double radius;

  Widget get left {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
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
