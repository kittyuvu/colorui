import 'dart:math';

import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

var kShape = [
  {
    "shape": CuShape.radius,
  },
  {
    "shape": CuShape.round,
  },
  {
    "shape": CuShape.ellipse,
  },
];

var kSize = [
  {
    "size": CuAvatarSize.sm,
    "name": "sm",
    "font": 8.0,
  },
  {
    "size": CuAvatarSize.df,
    "name": "df",
    "font": 11.0,
  },
  {
    "size": CuAvatarSize.lg,
    "name": "lg",
    "font": 14.0,
  },
  {
    "size": CuAvatarSize.xl,
    "name": "xl",
    "font": 17.0,
  },
  {
    "size": CuAvatarSize.xxl,
    "name": "xxl",
    "font": 20.0,
  },
  {
    "size": CuAvatarSize.sl,
    "name": "sl",
    "font": 23.0,
  }
];

var kBg = [
  {"bg": CuColors.pink},
  {"bg": CuColors.blue},
  {"lg": CuLinearGradient.yellow},
  {"lg": CuLinearGradient.brown}
];

var zeder = [
  {
    "user": "as-cii",
    "avatar": "https://avatars.githubusercontent.com/u/482957?v=4"
  },
  {
    "user": "maxbrunsfeld",
    "avatar": "https://avatars.githubusercontent.com/u/326587?v=4"
  },
  {
    "user": "mikayla-maki",
    "avatar": "https://avatars.githubusercontent.com/u/2280405?v=4"
  },
  {
    "user": "nathansobo",
    "avatar": "https://avatars.githubusercontent.com/u/1789?v=4"
  },
  {
    "user": "maxdeviant",
    "avatar": "https://avatars.githubusercontent.com/u/1486634?v=4"
  },
  {
    "user": "ConradIrwin",
    "avatar": "https://avatars.githubusercontent.com/u/94272?v=4"
  },
  {
    "user": "SomeoneToIgnore",
    "avatar": "https://avatars.githubusercontent.com/u/2690773?v=4"
  },
  {
    "user": "iamnbutler",
    "avatar": "https://avatars.githubusercontent.com/u/1714999?v=4"
  },
  {
    "user": "osiewicz",
    "avatar": "https://avatars.githubusercontent.com/u/24362066?v=4"
  },
  {
    "user": "JosephTLyons",
    "avatar": "https://avatars.githubusercontent.com/u/19867440?v=4"
  },
  {
    "user": "ForLoveOfCats",
    "avatar": "https://avatars.githubusercontent.com/u/30666851?v=4"
  },
  {
    "user": "Kethku",
    "avatar": "https://avatars.githubusercontent.com/u/3323631?v=4"
  },
  {
    "user": "KCaverly",
    "avatar": "https://avatars.githubusercontent.com/u/22121886?v=4"
  },
  {
    "user": "mrnugget",
    "avatar": "https://avatars.githubusercontent.com/u/1185253?v=4"
  },
  {
    "user": "petros",
    "avatar": "https://avatars.githubusercontent.com/u/28818?v=4"
  },
  {
    "user": "bennetbo",
    "avatar": "https://avatars.githubusercontent.com/u/53836821?v=4"
  },
  {
    "user": "JunkuiZhang",
    "avatar": "https://avatars.githubusercontent.com/u/14981363?v=4"
  },
  {
    "user": "kvark",
    "avatar": "https://avatars.githubusercontent.com/u/107301?v=4"
  },
  {
    "user": "rgbkrk",
    "avatar": "https://avatars.githubusercontent.com/u/836375?v=4"
  },
  {
    "user": "notpeter",
    "avatar": "https://avatars.githubusercontent.com/u/145113?v=4"
  },
  {
    "user": "huacnlee",
    "avatar": "https://avatars.githubusercontent.com/u/5518?v=4"
  },
  {
    "user": "renovate[bot]",
    "avatar": "https://avatars.githubusercontent.com/in/2740?v=4"
  },
  {
    "user": "apricotbucket28",
    "avatar": "https://avatars.githubusercontent.com/u/71973804?v=4"
  },
  {
    "user": "sonufrienko",
    "avatar": "https://avatars.githubusercontent.com/u/16773498?v=4"
  },
  {
    "user": "alygin",
    "avatar": "https://avatars.githubusercontent.com/u/2101250?v=4"
  },
  {
    "user": "weartist",
    "avatar": "https://avatars.githubusercontent.com/u/17105034?v=4"
  },
  {
    "user": "d1y",
    "avatar": "https://avatars.githubusercontent.com/u/45585937?v=4"
  },
  {
    "user": "kazatsuyu",
    "avatar": "https://avatars.githubusercontent.com/u/6465609?v=4"
  },
  {
    "user": "zaucy",
    "avatar": "https://avatars.githubusercontent.com/u/1284289?v=4"
  },
  {
    "user": "PixelJanitor",
    "avatar": "https://avatars.githubusercontent.com/u/1648941?v=4"
  }
];

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  bool randomBool() {
    return Random().nextBool();
  }

  Widget buildZeder() {
    return Wrap(
      children: zeder.map((item) {
        var avatar = item["avatar"] as String;
        var user = item["user"] as String;
        var isEllipse = randomBool();
        return SizedBox(
          width: 88,
          height: 88,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CuAvatar(
                size: CuAvatarSize.xl,
                shape: isEllipse ? CuShape.ellipse : CuShape.round,
                background: CuColors.$,
                image: NetworkImage(avatar),
              ),
              4.hSpace,
              Text(
                user,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle().$sm,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget buildBadge({
    required dynamic shape,
    required Widget child,
    color = CuColors.red,
    position = CuAvatarBadgePostion.topRight,
    offset = const Size(-8, -8),
  }) {
    return CuAvatar(
      background: CuColors.black,
      size: CuAvatarSize.xl,
      shape: shape,
      badgePosition: position,
      badgeOffset: offset,
      badge: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: 6.$radiusCircle,
        ),
        padding: [2, 3].$edge,
        child: child,
      ),
      child: const Icon(
        CuIcons.githubCircle,
        color: CuColors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(),
        backgroundColor: "#f1f1f1".$color,
        body: Padding(
          padding: 16.$edgeAll,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CuTitle(title: "简介"),
                12.hSpace,
                const Text("头像组件,可以适配文字,图片以及图标。"),
                18.hSpace,
                const CuTitle(title: "形状"),
                hSpacing,
                Row(
                  children: [
                    Container(
                      padding: [1, 6].$edge,
                      decoration: BoxDecoration(
                        color: CuColors.white,
                        border: Border.all(
                            color: CuColors.gray.$opacity(.42), width: 1),
                        borderRadius: 4.$radiusCircle,
                      ),
                      child: const Text("radius,round,ellipse"),
                    ),
                    6.wSpace,
                    const Text("提供圆角,圆形,和超椭圆形状。"),
                  ],
                ),
                hSpacing,
                Row(
                  children: kShape.map((item) {
                    return Row(
                      children: [
                        CuAvatar(
                          background: CuColors.gray,
                          size: CuAvatarSize.df,
                          shape: item["shape"] as dynamic,
                        ),
                        6.wSpace,
                      ],
                    );
                  }).toList(),
                ),
                18.hSpace,
                const CuTitle(title: "大小"),
                Row(
                  children: kSize.map((item) {
                    return Row(
                      children: [
                        CuAvatar(
                          background: CuColors.white,
                          size: item["size"] as dynamic,
                          shape: CuShape.ellipse,
                          shadow: CuBoxShadow(),
                          child: Center(
                            child: Text(
                              item["name"] as dynamic,
                              style: TextStyle(
                                fontSize: item["font"] as dynamic,
                              ).$black,
                            ),
                          ),
                        ),
                        12.wSpace,
                      ],
                    );
                  }).toList(),
                ),
                hSpacing,
                const CuTitle(title: "背景颜色"),
                hSpacing,
                Row(
                  children: kBg.map((item) {
                    Color? bg;
                    LinearGradient? lg;
                    if (item["bg"] is Color) {
                      bg = item["bg"] as Color;
                    }
                    if (item["lg"] is LinearGradient) {
                      lg = item["lg"] as LinearGradient;
                    }
                    return Row(
                      children: [
                        CuAvatar(
                          background: bg,
                          gradient: lg,
                          size: CuAvatarSize.xxl,
                          shape: CuShape.ellipse,
                        ),
                        9.wSpace,
                      ],
                    );
                  }).toList(),
                ),
                hSpacing,
                const CuTitle(title: "图像"),
                hSpacing,
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "zed 编辑器的贡献者列表(截止到 2024-08-06)",
                    textAlign: TextAlign.center,
                    style: const TextStyle().$blue.$lg.$bold,
                  ),
                ),
                Divider(color: CuColors.gray.$opacity(.2)),
                hSpacing,
                buildZeder(),
                hSpacing,
                const CuTitle(title: "图标"),
                hSpacing,
                Row(
                  children: kShape.map((item) {
                    return Row(
                      children: [
                        CuAvatar(
                          background: CuColors.black,
                          customSize: 36,
                          shape: item["shape"] as dynamic,
                          child: const Icon(
                            CuIcons.githubCircle,
                            color: CuColors.white,
                          ),
                        ),
                        6.wSpace,
                      ],
                    );
                  }).toList(),
                ),
                24.hSpace,
                const CuTitle(title: "角标(逼死强迫症)"),
                24.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        buildBadge(
                          shape: CuShape.ellipse,
                          child: Text(
                            "+888",
                            style: const TextStyle().$white.$xs,
                          ),
                        ),
                        12.wSpace,
                      ],
                    ),
                    Row(
                      children: [
                        buildBadge(
                          shape: CuShape.ellipse,
                          color: CuColors.blue,
                          child: Text(
                            "SVIP",
                            style: const TextStyle().$white.$xs,
                          ),
                        ),
                        12.wSpace,
                      ],
                    ),
                    Row(
                      children: [
                        buildBadge(
                          shape: CuShape.ellipse,
                          color: CuColors.white,
                          position: CuAvatarBadgePostion.bottomRight,
                          offset: const Size(-4, -4),
                          child: Text(
                            "♂",
                            style: const TextStyle().$blue.$xs,
                          ),
                        ),
                        12.wSpace,
                      ],
                    ),
                    Row(
                      children: [
                        buildBadge(
                          shape: CuShape.ellipse,
                          color: CuColors.white,
                          position: CuAvatarBadgePostion.bottomLeft,
                          offset: const Size(-4, -4),
                          child: Text(
                            "♀",
                            style: const TextStyle().$pink.$xs,
                          ),
                        ),
                        12.wSpace,
                      ],
                    ),
                    Row(
                      children: [
                        buildBadge(
                          shape: CuShape.ellipse,
                          color: CuColors.blue,
                          position: CuAvatarBadgePostion.topLeft,
                          child: Text(
                            "user",
                            style: const TextStyle().$white.$xs,
                          ),
                        ),
                        12.wSpace,
                      ],
                    )
                  ],
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
