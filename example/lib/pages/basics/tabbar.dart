import 'dart:math';

import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int getRandomWithMinAndMax({int min = 0, required int max}) {
  final $seed = Random();
  return min + $seed.nextInt(max - min);
}

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  CuTabbarMap<String> menus1 = {
    "home": CuTabbarItem(
      label: "首页",
      icon: CuIcons.home,
    ),
    "template": CuTabbarItem(
      label: "模板",
      icon: CuIcons.magic,
    ),
    "hot": CuTabbarItem(
      label: "商店",
      icon: CuIcons.circle,
    ),
    "profile": CuTabbarItem(
      label: "我的",
      icon: CuIcons.avatar,
    ),
  };

  double menu2Size = 24;
  Size get menu2Size$ {
    return Size(menu2Size, menu2Size);
  }

  Color menu2SelectedColor = CuColors.pink;

  String menu1Selected = "home";

  var menu3Style = SelectedMode.plain;

  $tap(dynamic id) {
    menu1Selected = id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(title: "底部导航"),
        backgroundColor: CuColors.greyLight,
        body: Padding(
          padding: 8.$edgeAll,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CuAction(title: "基本用法"),
                hSpacing,
                CuTabbar<String>(
                  iconSize: 20,
                  selected: menu1Selected,
                  onItemTap: $tap,
                  items: menus1,
                ),
                hSpacing,
                CupertinoButton.filled(
                  child: const Text("随机禁用"),
                  onPressed: () {
                    var keys = menus1.keys.toList();
                    int $idx = 0;
                    while (keys[$idx] == menu1Selected) {
                      $idx = getRandomWithMinAndMax(max: keys.length);
                    }
                    var keyName = keys[$idx];
                    menus1.entries.map((entry) {
                      var $id = entry.key;
                      if ($id == keyName) {
                        entry.value.disabled = true;
                      } else {
                        entry.value.disabled = false;
                      }
                    }).toList();
                    debugPrint("disabled $keyName");
                    setState(() {});
                  },
                ),
                const CuAction(title: "图片用法"),
                hSpacing,
                CuTabbar(
                  selected: menu1Selected,
                  labelSelectedColor: menu2SelectedColor,
                  imageSize: menu2Size$,
                  onItemTap: $tap,
                  items: {
                    "home": CuTabbarItem(
                      label: "首页",
                      image: cuImage("assets/tabs/document.png"),
                      imageSelected: cuImage("assets/tabs/document_cur.png"),
                    ),
                    "template": CuTabbarItem(
                      label: "模板",
                      icon: CuIcons.magic,
                      image: cuImage("assets/tabs/tpl.png"),
                      imageSelected: cuImage("assets/tabs/tpl_cur.png"),
                    ),
                    "hot": CuTabbarItem(
                      label: "商店",
                      icon: CuIcons.circle,
                      image: cuImage("assets/tabs/find.png"),
                      imageSelected: cuImage("assets/tabs/find_cur.png"),
                    ),
                    "profile": CuTabbarItem(
                      label: "我的",
                      icon: CuIcons.avatar,
                      image: cuImage("assets/tabs/my.png"),
                      imageSelected: cuImage("assets/tabs/my_cur.png"),
                    ),
                  },
                ),
                9.hSpace,
                Row(
                  children: [
                    const Text("图片大小: "),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <double>[12, 18, 21, 24].map((px) {
                          return IconButton(
                            icon: Text(
                              px.toString(),
                              style: TextStyle(
                                color: menu2Size == px
                                    ? CuColors.pink
                                    : CuColors.gray,
                              ),
                            ),
                            onPressed: () {
                              menu2Size = px;
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("文字选中颜色: "),
                    Expanded(
                      child: Row(
                        children: [
                          {
                            "color": CuColors.pink,
                            "label": "粉色",
                          },
                          {
                            "color": CuColors.blue,
                            "label": "蓝色",
                          },
                          {
                            "color": CuColors.green,
                            "label": "绿色",
                          },
                          {
                            "color": CuColors.yellow,
                            "label": "黄色",
                          },
                        ].map((item) {
                          return IconButton(
                            icon: Text(item["label"] as String,
                                style: TextStyle(
                                  color: item["color"] as Color,
                                )),
                            onPressed: () {
                              menu2SelectedColor = item["color"] as Color;
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                hSpacing,
                const CuAction(title: "样式"),
                hSpacing,
                CuTabbar(
                  selected: menu1Selected,
                  labelSelectedColor: CuColors.blue,
                  mode: menu3Style,
                  onItemTap: $tap,
                  items: {
                    "home": CuTabbarItem(
                      label: "首页",
                      image: cuImage("assets/tabs/document.png"),
                      imageSelected: cuImage("assets/tabs/document_cur.png"),
                    ),
                    "template": CuTabbarItem(
                      label: "模板",
                      icon: CuIcons.magic,
                      image: cuImage("assets/tabs/tpl.png"),
                      imageSelected: cuImage("assets/tabs/tpl_cur.png"),
                    ),
                    "hot": CuTabbarItem(
                      label: "商店",
                      icon: CuIcons.circle,
                      image: cuImage("assets/tabs/find.png"),
                      imageSelected: cuImage("assets/tabs/find_cur.png"),
                    ),
                    "profile": CuTabbarItem(
                      label: "我的",
                      icon: CuIcons.avatar,
                      image: cuImage("assets/tabs/my.png"),
                      imageSelected: cuImage("assets/tabs/my_cur.png"),
                    ),
                  },
                ),
                hSpacing,
                Row(
                  children: [
                    const Text("样式: "),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          {
                            "mode": SelectedMode.plain,
                            "label": "普通",
                          },
                          {
                            "mode": SelectedMode.line,
                            "label": "线条",
                          },
                          {
                            "mode": SelectedMode.dot,
                            "label": "圆点",
                          },
                        ].map((item) {
                          return IconButton(
                            icon: Text(
                              item["label"] as String,
                              style: TextStyle(
                                color:
                                    (item["mode"] as SelectedMode) == menu3Style
                                        ? CuColors.pink
                                        : CuColors.gray,
                              ),
                            ),
                            onPressed: () {
                              menu3Style = item["mode"] as SelectedMode;
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                hSpacing,
                const CuAction(title: "自定义渲染"),
                hSpacing,
                CuTabbar(
                  onItemTap: $tap,
                  selected: menu1Selected,
                  items: {
                    "home": CuTabbarItem(
                      label: "首页",
                      icon: CuIcons.home,
                    ),
                    "template": CuTabbarItem(
                      label: "模板",
                      icon: CuIcons.magic,
                    ),
                    "add": CuTabbarItem(
                      flex: 3,
                      child: InkWell(
                        mouseCursor: SystemMouseCursors.click,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: CuColors.blue,
                            borderRadius: 20.$radiusCircle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: CuColors.white,
                                  borderRadius: 4.$radiusCircle,
                                ),
                                child: const Icon(
                                  CuIcons.add,
                                  color: Colors.blue,
                                ),
                              ),
                              5.wSpace,
                              Text("发布日常", style: const TextStyle().$white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    "hot": CuTabbarItem(
                      label: "商店",
                      icon: CuIcons.circle,
                    ),
                    "profile": CuTabbarItem(
                      label: "我的",
                      icon: CuIcons.avatar,
                    ),
                  },
                ),
                120.hSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
