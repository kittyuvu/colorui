import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

typedef ReListMap = List<Map<String, dynamic>>;

ReListMap kColors = [
  {"title": "嫣红", "class": "red", "color": CuColors.red},
  {"title": "桔橙", "class": "orange", "color": CuColors.orange},
  {"title": "明黄", "class": "yellow", "color": CuColors.yellow},
  {"title": "橄榄", "class": "olive", "color": CuColors.olive},
  {"title": "森绿", "class": "green", "color": CuColors.green},
  {"title": "天青", "class": "cyan", "color": CuColors.cyan},
  {"title": "海蓝", "class": "blue", "color": CuColors.blue},
  {"title": "姹紫", "class": "purple", "color": CuColors.purple},
  {"title": "木槿", "class": "mauve", "color": CuColors.mauve},
  {"title": "桃粉", "class": "pink", "color": CuColors.pink},
  {"title": "棕褐", "class": "brown", "color": CuColors.brown},
  {"title": "玄灰", "class": "grey", "color": CuColors.grey},
  {"title": "草灰", "class": "gray", "color": CuColors.gray},
  {"title": "墨黑", "class": "black", "color": CuColors.black},
  {"title": "雅白", "class": "white", "color": CuColors.white},
];
ReListMap kLightColors = [
  {"title": "嫣红", "class": "red", "color": CuColors.redLight},
  {"title": "桔橙", "class": "orange", "color": CuColors.orangeLight},
  {"title": "明黄", "class": "yellow", "color": CuColors.yellowLight},
  {"title": "橄榄", "class": "olive", "color": CuColors.oliveLight},
  {"title": "森绿", "class": "green", "color": CuColors.greenLight},
  {"title": "天青", "class": "cyan", "color": CuColors.cyanLight},
  {"title": "海蓝", "class": "blue", "color": CuColors.blueLight},
  {"title": "姹紫", "class": "purple", "color": CuColors.purpleLight},
  {"title": "木槿", "class": "mauve", "color": CuColors.mauveLight},
  {"title": "桃粉", "class": "pink", "color": CuColors.pinkLight},
  {"title": "棕褐", "class": "brown", "color": CuColors.brownLight},
  {"title": "玄灰", "class": "grey", "color": CuColors.greyLight},
];

ReListMap kLinearGradients = [
  {"title": "嫣红", "class": "red", "color": CuLinearGradient.red},
  {"title": "桔橙", "class": "orange", "color": CuLinearGradient.orange},
  {"title": "明黄", "class": "yellow", "color": CuLinearGradient.yellow},
  {"title": "橄榄", "class": "olive", "color": CuLinearGradient.olive},
  {"title": "森绿", "class": "green", "color": CuLinearGradient.green},
  {"title": "天青", "class": "cyan", "color": CuLinearGradient.cyan},
  {"title": "海蓝", "class": "blue", "color": CuLinearGradient.blue},
  {"title": "姹紫", "class": "purple", "color": CuLinearGradient.purple},
  {"title": "木槿", "class": "mauve", "color": CuLinearGradient.mauve},
  {"title": "桃粉", "class": "pink", "color": CuLinearGradient.pink},
  {"title": "棕褐", "class": "brown", "color": CuLinearGradient.brown},
  {"title": "玄灰", "class": "grey", "color": CuLinearGradient.grey},
];

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({super.key});

  @override
  State<BackgroundPage> createState() => BackgroundPageState();
}

class BackgroundPageState extends State<BackgroundPage> {
  Widget buildBlock(Map<String, dynamic> item) {
    String title = item["title"];
    var $color = item["color"];
    Color? color;
    LinearGradient? gradient;
    if ($color is Color) {
      color = $color;
    } else if ($color is LinearGradient) {
      gradient = $color;
    }
    return SizedBox(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
              gradient: gradient,
            ),
            clipBehavior: Clip.hardEdge,
            width: 120,
            height: 120,
          ),
          hSpacing,
          Text(title),
        ],
      ),
    );
  }

  Widget buildColors(ReListMap data, String title, {int count = 2}) {
    return Column(children: [
      CuTitle(title: title),
      hSpacing,
      Wrap(
        spacing: 9,
        runSpacing: 6,
        children: data.map(buildBlock).toList(),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "背景"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "AKA: 文本颜色",
                  style: const TextStyle().$pink.$bold,
                ),
                buildColors(kColors, "背景色"),
                hSpacing,
                buildColors(kLightColors, "亮色背景色"),
                hSpacing,
                buildColors(kLinearGradients, "渐变背景色"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
