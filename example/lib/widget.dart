import 'package:colorui/colorui.dart';
import 'package:flutter/cupertino.dart';
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
var hSpacing = 12.hSpace;

/// 12px
/// ```
/// < - - - >
/// ```
var wSpacing = 12.wSpace;

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
          color: CuColors.blue,
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
              borderRadius: 12.$radiusCircle,
              boxShadow: CuBoxShadow.lg$(),
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
