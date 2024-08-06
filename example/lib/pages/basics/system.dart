import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

var kInfo =
    """colorUI是一个为小程序开发提供丰富UI组件和样式资源的库。 它基于小程序原生API，通过封装一系列的UI组件，帮助开发者快速构建美观、易用的小程序界面。 colorUI库的出现，极大地简化了小程序开发的复杂性，提高了开发效率，使开发者可以将更多的精力投入到业务逻辑和用户体验的设计上。""";

class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  Widget buildGithubImage(String id) {
    return Image.network(
      "https://avatars.githubusercontent.com/u/$id?v=4",
      width: 88,
      height: 88,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      context: context,
      child: Scaffold(
        appBar: const CuNavbar(
          backTitle: "返回",
          spacing: 16,
          trailing: Icon(CuIcons.more),
        ),
        backgroundColor: CuColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: [24, 18].$edge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CuTitle(title: "简介"),
                6.hSpace,
                Text(kInfo),
                hSpacing,
                Text(
                  "Flutter 版本未实现完整功能~",
                  style: const TextStyle().$bold.$pink.$lg,
                ),
                Divider(color: CuColors.grey.$opacity(.24)),
                hSpacing,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildGithubImage("45585937"),
                        8.wSpace,
                        const Icon(CuIcons.arrow),
                        8.wSpace,
                        buildGithubImage("177179763"),
                      ],
                    ),
                    18.hSpace,
                    InkWell(
                      mouseCursor: SystemMouseCursors.click,
                      child: Container(
                        padding: [4, 24].$edge,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: CuColors.grey.$opacity(.24)),
                          borderRadius: 4.$radiusCircle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(CuIcons.githubCircle),
                            4.wSpace,
                            const Text("kittyuvu/colorui"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
