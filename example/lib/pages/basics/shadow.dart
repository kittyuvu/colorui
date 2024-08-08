import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> kSizes = [
  {"name": "sm", "size": CuBoxShadowSize.sm},
  {"name": "df", "size": CuBoxShadowSize.df},
  {"name": "lg", "size": CuBoxShadowSize.lg},
];

class ShadowPage extends StatefulWidget {
  const ShadowPage({super.key});

  @override
  State<ShadowPage> createState() => _ShadowPageState();
}

class _ShadowPageState extends State<ShadowPage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "阴影"),
        body: Padding(
          padding: 12.$edge,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CuTitle(title: "阴影尺寸"),
                hSpacing,
                Padding(
                  padding: 8.$edgeLR,
                  child: Column(
                    children: kSizes.map((item) {
                      String name = item['name'];
                      CuBoxShadowSize size = item['size'];
                      return Padding(
                        padding: 8.$edge,
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: CuColors.white,
                            borderRadius: 12.$radiusCircle,
                            boxShadow: [CuBoxShadow(size: size)],
                          ),
                          child: Center(child: Text(name)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                hSpacing,
                const CuTitle(title: "支持颜色和自定义透明度"),
                hSpacing,
                Padding(
                  padding: 8.$edge,
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: CuColors.blue,
                      borderRadius: 12.$radiusCircle,
                      boxShadow: CuBoxShadow.df$(
                        color: CuColors.blue,
                        opacity: .66,
                      ),
                    ),
                    child: Center(
                      child: Text("海蓝", style: const TextStyle().$white),
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
