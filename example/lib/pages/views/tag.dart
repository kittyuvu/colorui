import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  List<String> repos = [
    "kittyuvu/colorui",
    "waifu-project/movie",
    "d1y/neovideo"
  ];

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
          appBar: const CuNavbar(titleText: "标签"),
          body: Padding(
            padding: 12.$edgeAll,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacing,
                  const CuTitle(title: "标签示例"),
                  hSpacing,
                  "> 小陈的开源项目有哪些呢?".$tx(color: CuColors.pink),
                  hSpacing,
                  Wrap(
                    runSpacing: 12,
                    spacing: 6,
                    children: repos.mapWithIndex((item, idx) {
                      late LinearGradient lg;
                      if (idx == 0) {
                        lg = CuLinearGradient.blue;
                      } else if (idx == 1) {
                        lg = CuLinearGradient.purple;
                      } else {
                        lg = CuLinearGradient.olive;
                      }
                      return CuTag(
                        text: item,
                        icon: CuIcons.github,
                        shape: CuShape.radius,
                        iconSize: 18,
                        disabled: idx == 0,
                        gradient: lg,
                        color: CuColors.white,
                        textSize: 14,
                        borderRadius: 12.0.$radiusCircle,
                        border: CuColors.blue.$border,
                        shadow: CuBoxShadow.df(
                          color: CuColors.blue,
                          opacity: .42,
                        ),
                        trailing: const Icon(
                          CuIcons.close,
                          color: CuColors.white,
                          size: 12,
                        ),
                        onTap: () {
                          debugPrint("onTap");
                        },
                        onTrailingTap: () {
                          debugPrint("onTrailingTap");
                        },
                      );
                    }).toList(),
                  ),
                  hSpacing,
                  CuColors.greyLight.$divider,
                  hSpacing,
                  "> TODOOOOO".$tx(color: CuColors.blue),
                ],
              ),
            ),
          )),
    );
  }
}
