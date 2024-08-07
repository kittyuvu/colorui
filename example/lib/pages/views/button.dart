import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(),
        body: Padding(
          padding: 8.$edgeAll,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hSpacing,
                const CuTitle(title: "按钮"),
                hSpacing,
                Container(
                  width: 180,
                  padding: [4, 9].$edge,
                  decoration: BoxDecoration(
                    color: CuColors.blue,
                    border: CuColors.blue.$border,
                    borderRadius: 12.$radiusCircle,
                    boxShadow:
                        CuBoxShadow.sm$(color: CuColors.blue, opacity: .24),
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(CuIcons.githubCircle, color: CuColors.white),
                        4.2.wSpace,
                        "kittyuvu/colorui".$tx(color: CuColors.white)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
