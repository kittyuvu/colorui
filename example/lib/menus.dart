import 'package:colorui/colorui.dart';
import 'package:flutter/widgets.dart';

class MenuItem {
  MenuItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    this.bg,
    this.href = "",
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Gradient? bg;
  final String href;
}

/// https://beta3.color-ui.com
Map<String, List<MenuItem>> kMenus = {
  "基础": [
    MenuItem(
      title: "系统",
      subTitle: 'system',
      icon: CuIcons.set,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "主题",
      subTitle: 'theme',
      icon: CuIcons.paint,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "导航栏",
      subTitle: 'navbar',
      icon: CuIcons.topbar,
      bg: CuLinearGradient.pink,
    ),
    MenuItem(
      title: "背景",
      subTitle: 'background',
      icon: CuIcons.palette,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "文本",
      subTitle: 'text',
      icon: CuIcons.aa,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "图标",
      subTitle: 'icon',
      icon: CuIcons.magic,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "阴影",
      subTitle: 'shadow',
      icon: CuIcons.darkmode,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "边框",
      subTitle: 'border',
      icon: CuIcons.box,
      bg: CuLinearGradient.green,
    ),
  ],
  "视图": [
    MenuItem(
      title: "头像",
      subTitle: 'avatar',
      icon: CuIcons.avatar,
      bg: CuLinearGradient.brown,
    ),
    MenuItem(
      title: "标题",
      subTitle: 'title',
      icon: CuIcons.tt,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "标签",
      subTitle: 'tag',
      icon: CuIcons.tag,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "按钮",
      subTitle: 'button',
      icon: CuIcons.ellipse,
      bg: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "图片",
      subTitle: 'image',
      icon: CuIcons.pic,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
        title: "代码",
        subTitle: 'code',
        icon: CuIcons.codeBox,
        bg: CuLinearGradient.red),
    MenuItem(
      title: "进度条",
      subTitle: 'progress',
      icon: CuIcons.progress,
      bg: CuLinearGradient.cyan,
    ),
    MenuItem(
      title: "加载中",
      subTitle: 'loading',
      icon: CuIcons.loaderFill,
      bg: CuLinearGradient.mauve,
    ),
  ],
  "布局": [
    MenuItem(
      title: "容器",
      subTitle: 'flex',
      icon: CuIcons.viewAgenda,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "菜单",
      subTitle: 'menu',
      icon: CuIcons.viewAgenda,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "浮动",
      subTitle: 'float',
      icon: CuIcons.dashboard,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "卡片",
      subTitle: 'card',
      icon: CuIcons.card,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
        title: "列表",
        subTitle: 'list',
        icon: CuIcons.viewList,
        bg: CuLinearGradient.grey),
    MenuItem(
      title: "栅格",
      subTitle: 'grid',
      icon: CuIcons.grid,
      bg: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "时间轴",
      subTitle: 'timeline',
      icon: CuIcons.stock,
      bg: CuLinearGradient.red,
    ),
    MenuItem(
      title: "表格",
      subTitle: 'table',
      icon: CuIcons.grid,
      bg: CuLinearGradient.blue,
    ),
  ],
  "交互": [
    MenuItem(
      title: "气泡框",
      subTitle: 'popover',
      icon: CuIcons.popover,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "模态框",
      subTitle: 'modal',
      icon: CuIcons.stop,
      bg: CuLinearGradient.blue,
    ),
    MenuItem(
      title: "轻提示",
      subTitle: 'toast',
      icon: CuIcons.subtitles,
      bg: CuLinearGradient.mauve,
    ),
    MenuItem(
      title: "抽屉",
      subTitle: 'drawer',
      icon: CuIcons.quill,
      bg: CuLinearGradient.orange,
    ),
    MenuItem(
      title: "折叠面板",
      subTitle: 'collapse',
      icon: CuIcons.viewDay,
      bg: CuLinearGradient.yellow,
    ),
    MenuItem(
      title: "选项卡",
      subTitle: 'tab',
      icon: CuIcons.viewArray,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "轮播图",
      subTitle: 'swiper',
      icon: CuIcons.viewCarousel,
      bg: CuLinearGradient.red,
    ),
    MenuItem(
      title: "步骤条",
      subTitle: 'steps',
      icon: CuIcons.gitCommit,
      bg: CuLinearGradient.mauve,
    ),
  ],
  "表单": [
    MenuItem(
      title: "输入框",
      subTitle: 'input',
      icon: CuIcons.input,
      bg: CuLinearGradient.purple,
    ),
    MenuItem(
      title: "单选框",
      subTitle: 'radio',
      icon: CuIcons.radiobox,
      bg: CuLinearGradient.olive,
    ),
    MenuItem(
      title: "复选框",
      subTitle: 'checkbox',
      icon: CuIcons.checkbox,
      bg: CuLinearGradient.grey,
    ),
    MenuItem(
      title: "开关",
      subTitle: 'switch',
      icon: CuIcons.toggle,
      bg: CuLinearGradient.green,
    ),
    MenuItem(
      title: "选择器",
      subTitle: 'picker',
      icon: CuIcons.viewHeadline,
      bg: CuLinearGradient.pink,
    ),
  ],
};
