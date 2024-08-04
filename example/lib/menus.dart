import 'package:colorui/colorui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItem {
  MenuItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    this.name = "",
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Gradient color;
  final String name;
}

/// https://beta3.color-ui.com
Map<String, List<MenuItem>> kMenus = {
  "基础": [
    MenuItem(
      title: "系统",
      subTitle: 'system',
      icon: CuIcons.set,
      color: CuLinearGradient.green,
      name: "system",
    ),
    MenuItem(
      title: "主题",
      subTitle: 'theme',
      icon: CuIcons.paint,
      color: CuLinearGradient.green,
      name: "theme",
    ),
    MenuItem(
      title: "导航栏",
      subTitle: 'navbar',
      icon: CuIcons.topbar,
      color: CuLinearGradient.pink,
      name: "navbar",
    ),
    MenuItem(
      title: "底部导航",
      subTitle: 'tabbar',
      icon: CuIcons.box,
      color: CuLinearGradient.blue,
      name: "tabbar",
    ),
    MenuItem(
      title: "背景",
      subTitle: 'background',
      icon: CuIcons.palette,
      color: CuLinearGradient.orange,
      name: "background",
    ),
    MenuItem(
      title: "文本",
      subTitle: 'text',
      icon: CuIcons.aa,
      color: CuLinearGradient.green,
      name: "text",
    ),
    MenuItem(
      title: "图标",
      subTitle: 'icon',
      icon: CuIcons.magic,
      color: CuLinearGradient.blue,
      name: "icons",
    ),
    MenuItem(
      title: "阴影",
      subTitle: 'shadow',
      icon: CuIcons.darkmode,
      color: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "边框",
      subTitle: 'border',
      icon: CuIcons.box,
      color: CuLinearGradient.green,
    ),
  ],
  "视图": [
    MenuItem(
      title: "头像",
      subTitle: 'avatar',
      icon: CuIcons.avatar,
      color: CuLinearGradient.brown,
    ),
    MenuItem(
      title: "标题",
      subTitle: 'title',
      icon: CuIcons.tt,
      color: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "标签",
      subTitle: 'tag',
      icon: CuIcons.tag,
      color: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "按钮",
      subTitle: 'button',
      icon: CuIcons.ellipse,
      color: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "图片",
      subTitle: 'image',
      icon: CuIcons.pic,
      color: CuLinearGradient.mauve,
    ),
    MenuItem(
        title: "代码",
        subTitle: 'code',
        icon: CuIcons.codeBox,
        color: CuLinearGradient.red),
    MenuItem(
      title: "进度条",
      subTitle: 'progress',
      icon: CuIcons.progress,
      color: CuLinearGradient.cyan,
    ),
    MenuItem(
      title: "加载中",
      subTitle: 'loading',
      icon: CuIcons.loaderFill,
      color: CuLinearGradient.mauve,
    ),
  ],
  "布局": [
    MenuItem(
      title: "容器",
      subTitle: 'flex',
      icon: CuIcons.viewAgenda,
      color: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "菜单",
      subTitle: 'menu',
      icon: CuIcons.viewAgenda,
      color: CuLinearGradient.green,
    ),
    MenuItem(
      title: "浮动",
      subTitle: 'float',
      icon: CuIcons.dashboard,
      color: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "卡片",
      subTitle: 'card',
      icon: CuIcons.card,
      color: CuLinearGradient.olive,
    ),
    MenuItem(
        title: "列表",
        subTitle: 'list',
        icon: CuIcons.viewList,
        color: CuLinearGradient.grey),
    MenuItem(
      title: "栅格",
      subTitle: 'grid',
      icon: CuIcons.grid,
      color: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "时间轴",
      subTitle: 'timeline',
      icon: CuIcons.stock,
      color: CuLinearGradient.red,
    ),
    MenuItem(
      title: "表格",
      subTitle: 'table',
      icon: CuIcons.grid,
      color: CuLinearGradient.blue,
    ),
  ],
  "交互": [
    MenuItem(
      title: "气泡框",
      subTitle: 'popover',
      icon: CuIcons.popover,
      color: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "模态框",
      subTitle: 'modal',
      icon: CuIcons.stop,
      color: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "轻提示",
      subTitle: 'toast',
      icon: CuIcons.subtitles,
      color: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "抽屉",
      subTitle: 'drawer',
      icon: CuIcons.quill,
      color: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "折叠面板",
      subTitle: 'collapse',
      icon: CuIcons.viewDay,
      color: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "选项卡",
      subTitle: 'tab',
      icon: CuIcons.viewArray,
      color: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "轮播图",
      subTitle: 'swiper',
      icon: CuIcons.viewCarousel,
      color: CuLinearGradient.red,
    ),
    MenuItem(
      title: "步骤条",
      subTitle: 'steps',
      icon: CuIcons.gitCommit,
      color: CuLinearGradient.mauve,
    ),
  ],
  "表单": [
    MenuItem(
      title: "输入框",
      subTitle: 'input',
      icon: CuIcons.input,
      color: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "单选框",
      subTitle: 'radio',
      icon: CuIcons.radiobox,
      color: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "复选框",
      subTitle: 'checkbox',
      icon: CuIcons.checkbox,
      color: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "开关",
      subTitle: 'switch',
      icon: CuIcons.toggle,
      color: CuLinearGradient.green,
    ),
    MenuItem(
      title: "选择器",
      subTitle: 'picker',
      icon: CuIcons.viewHeadline,
      color: CuLinearGradient.pink,
    ),
  ],
};
