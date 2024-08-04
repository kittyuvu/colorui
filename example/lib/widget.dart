import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kMaxScreenWidth = 600;
const kBgIMG = "https://beta3.color-ui.com/01.jpeg";

/// 12px
/// ```
///   ^
///   |
///   |
///   |
///   v
/// ```
var hSpacing = const SizedBox(height: 12);

/// 12px
/// ```
/// < - - - >
/// ```
var wSpacing = const SizedBox(width: 12);

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
    final width = (_cx ?? context).width;
    final height = (_cx ?? context).height;
    if (width > kMaxScreenWidth) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff0ca5e9),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(kBgIMG),
          ),
        ),
        child: Center(
          child: Container(
            clipBehavior: Clip.hardEdge,
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
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        right,
      ],
    );
  }
}
