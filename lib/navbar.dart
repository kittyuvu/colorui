import 'package:colorui/colorui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CuNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CuNavbar({
    super.key,
    this.back,
    this.backTitle,
    this.context,
    this.onBack,
    this.title,
    this.height = 50,
    this.backSpacing = 6,
  });
  final double height;
  final VoidCallback? onBack;
  final BuildContext? context;
  final Widget? back;
  final double backSpacing;
  final String? backTitle;
  final String? title;
  BuildContext? get $cx => context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: CuColors.white,
        border: Border(
          bottom: BorderSide(
            color: CuColors.black.withOpacity(.06),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        children: [
          if (title != null)
            Center(
              child: Text(title!),
            ),
          Positioned(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              // 占位太小了, 很难点击
              child: GestureDetector(
                onTap: () {
                  if (onBack != null) {
                    onBack!();
                  } else {
                    Navigator.pop($cx ?? context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(left: backSpacing),
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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
