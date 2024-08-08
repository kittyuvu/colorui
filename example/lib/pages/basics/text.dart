import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> kTextSizes = [
  {
    "size": CuFontSizes.xs,
    "name": "xs",
    "text": "组件库",
    "note": "说明文本，标签文字或关注度低的文字",
  },
  {
    "size": CuFontSizes.sm,
    "name": "sm",
    "text": "@weilanwl.com by:color-ui.com",
    "note": "页面辅助信息，次级内容等",
  },
  {
    "size": CuFontSizes.df,
    "name": "df",
    "text": "专注视觉的小程序组件库",
    "note": "页面默认字号，用于摘要或阅读文本",
  },
  {
    "size": CuFontSizes.lg,
    "name": "lg",
    "text": "ColorUI组件库",
    "note": "页面三级标题，首要层级显示内容",
  },
  {
    "size": CuFontSizes.xl,
    "name": "xl",
    "text": "您的订单已提交成功！",
    "note": "页面二级标题，用于结果页等单一信息页",
  },
  {
    "size": CuFontSizes.xxl,
    "name": "xxl",
    "text": "价格: \$80",
    "note": "页面一级标题,或者用于金额数字等信息",
  },
];

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
          appBar: const CuNavbar(titleText: "文本"),
          body: Padding(
            padding: 12.$edge,
            child: Column(
              children: [
                const CuTitle(title: "尺寸示例"),
                hSpacing,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CuColors.white,
                      borderRadius: 12.$radiusCircle,
                      boxShadow: CuBoxShadow.lg$(color: CuColors.blue),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: kTextSizes.map((item) {
                          String name = item["name"];
                          double size = item["size"];
                          String note = item["note"];
                          String text = item["text"];
                          return Padding(
                            padding: 12.$edge,
                            child: Row(
                              children: [
                                Text(size.toString(),
                                    style: const TextStyle().$black.$lg),
                                12.wSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        text,
                                        style: TextStyle(fontSize: size),
                                      ),
                                      Text(note,
                                          style: const TextStyle().$gray),
                                      Text(
                                        "$name ",
                                        style: const TextStyle().$gray.$sm,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
