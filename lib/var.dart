import 'package:flutter/material.dart';

class CuFontSizes {
  /// 说明文本，标签文字或关注度低的文字
  static const xs = 10.0;

  /// 页面辅助信息，次级内容等
  static const sm = 12.0;

  /// 页面默认字号，用于摘要或阅读文本
  static const df = 14.0;

  /// 页面三级标题，首要层级显示内容
  static const lg = 16.0;

  /// 页面二级标题，用于结果页等单一信息页
  static const xl = 18.0;

  /// 页面一级标题,或者用于金额数字等信息
  static const xxl = 22.0;
}

/// 形状
enum CuShape {
  /// 圆角
  radius,

  /// 圆形
  round,

  /// 超椭圆
  ellipse,
}

/// 鼠标指针, 从 CSS 样式里继承过来
class CuCursors {
  /// cursor: default;
  static const $ = SystemMouseCursors.basic;

  /// cursor: pointer;
  static const pointer = SystemMouseCursors.click;

  /// cursor: not-allowed;
  static const notAllow = SystemMouseCursors.forbidden;
}
