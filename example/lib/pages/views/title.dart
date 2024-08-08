import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

var kDepth = [
  {
    "depth": CuTitleDepth.h1,
    "title": "标题1",
    "desc": "副标题1",
  },
  {
    "depth": CuTitleDepth.h2,
    "title": "标题2",
    "desc": "副标题2",
  },
  {
    "depth": CuTitleDepth.h3,
    "title": "标题3",
    "desc": "副标题3",
  },
  {
    "depth": CuTitleDepth.h4,
    "title": "标题4",
    "desc": "副标题4",
  },
];

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "标题"),
        body: Padding(
          padding: 12.$edge,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CuTitle(title: "简介"),
                hSpacing,
                const Text("标题组件可以快速构建一个等级标题。包含多种样式。"),
                Divider(color: CuColors.gray.$opacity(.24)),
                hSpacing,
                Container(
                  padding: [24, 12].$edge,
                  decoration: BoxDecoration(
                    color: CuColors.greyLight,
                    borderRadius: 12.$radiusCircle,
                  ),
                  child: Column(
                    children: [
                      const CuTitle(title: "标题"),
                      12.hSpace,
                      const CuTitle(
                        title: "标题",
                        icon: CuIcons.whatshot,
                        iconColor: CuColors.red,
                        desc: "副标题",
                      ),
                      CuColors.gray.$opacity(.24).$divider,
                      Column(
                        children: kDepth.mapWithIndex((item, idx) {
                          return CuTitle(
                            depth: item["depth"] as dynamic,
                            title: item["title"] as dynamic,
                            desc: item["desc"] as dynamic,
                          );
                        }).toList(),
                      ),
                      CuColors.gray.$opacity(.24).$divider,
                      Container(
                        decoration: BoxDecoration(
                          color: CuColors.white,
                          border: CuColors.gray.$opacity(.24).$border,
                          borderRadius: 12.$radiusCircle,
                        ),
                        padding: 18.$edge,
                        child: Column(
                          children: [
                            const CuTitle(title: "普通"),
                            4.hSpace,
                            const CuTitle(
                              title: "圆点",
                              style: CuTitleStyle.dot,
                              align: CuTitleAlign.center,
                            ),
                            4.hSpace,
                            const CuTitle(
                              title: "短线",
                              style: CuTitleStyle.line,
                              align: CuTitleAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ],
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
