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
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      context: context,
      child: Scaffold(
        appBar: const CuNavbar(title: "系统"),
        backgroundColor: CuColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: [24, 18].$edge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CuAction(title: "简介"),
                6.hSpace,
                Text(kInfo),
                hSpacing,
                Text(
                  "Flutter 版本未实现完整功能~",
                  style: const TextStyle().$bold.$pink.$lg,
                ),
                Image.network(
                  "https://avatars.githubusercontent.com/u/45585937?v=4",
                  width: 88,
                  height: 88,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
