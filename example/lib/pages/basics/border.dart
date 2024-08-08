import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

List<List<dynamic>> kBorders = [
  [
    [1, CuColors.black].$border,
    "全边框",
    CuColors.redLight
  ],
  [
    [1, CuColors.black].$borderL,
    "左边框",
    CuColors.blueLight
  ],
  [
    [1, CuColors.black].$borderR,
    "右边框",
    CuColors.cyanLight
  ],
  [
    [1, CuColors.black].$borderT,
    "上边框",
    CuColors.brownLight
  ],
  [
    [1, CuColors.black, 1].$borderB,
    "下边框",
    CuColors.oliveLight
  ],
];

class BorderPage extends StatefulWidget {
  const BorderPage({super.key});

  @override
  State<BorderPage> createState() => _BorderPageState();
}

class _BorderPageState extends State<BorderPage> {
  Widget buildBlock(List<dynamic> cx) {
    var border = cx[0] as BoxBorder;
    var title = cx[1] as String;
    var color = cx[2] as Color;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 42,
          decoration: BoxDecoration(
            border: border,
            color: color,
          ),
          alignment: Alignment.center,
          child: title.$tx(align: TextAlign.center),
        ),
        12.hSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "边框"),
        body: Padding(
          padding: 12.$edge,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CuTitle(title: "边框演示"),
                hSpacing,
                "> 我们也支持虚线哦!".$tx(
                  color: CuColors.blue,
                  weight: FontWeight.bold,
                ),
                hSpacing,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: 4.2.$radiusCircle,
                    border: [2, CuColors.blue, 1].$border,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: 18.$edge,
                    child: Column(
                      children: kBorders.map(buildBlock).toList(),
                    ),
                  ),
                ),
                hSpacing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
