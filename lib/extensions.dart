// https://pub.dev/packages/awesome_extensions
import 'package:colorui/colors.dart';
import 'package:colorui/utils.dart' as utils;
import 'package:colorui/var.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension JSArray<T> on List<T> {
  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
  List<T> filter(bool Function(T) test) {
    return where(test).toList();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/find
  T find(bool Function(T) test, [T Function()? orElse]) {
    return firstWhere(test, orElse: orElse);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex
  int findIndex(bool Function(T) test, [int start = 0]) {
    return indexWhere(test, start);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/includes
  bool includes(T item) {
    return contains(item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/pop
  T pop() {
    return removeLast();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/shift
  T shift() {
    return removeAt(0);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift
  unshift(T item) {
    insert(0, item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse
  List<T> reverse() {
    return reversed.toList();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/push
  push(T item) {
    add(item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/slice
  List<T> slice(int start, [int? end]) {
    return sublist(start, end);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/some
  bool some(bool Function(T) test) {
    return any(test);
  }

  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  forEachWithIndex(void Function(T, int idx) callback) {
    for (int i = 0; i < length; i++) {
      callback(this[i], i);
    }
  }
}

extension JSString on String {
  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/concat
  String concat(String other) {
    return this + other;
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/includes
  bool includes(String other) => contains(other);

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd
  String trimEnd() => trimRight();

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart
  String trimStart() => trimLeft();
}

extension CuContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  bool get isMobile => Platform.isAndroid || Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
  bool get isMacOS => Platform.isMacOS;
  bool get isWindows => Platform.isWindows;
  bool get isLinux => Platform.isLinux;
}

extension CuStringUtil on String {
  /// Converts a hex, rgb, or rgba color string to Color object. Works with opacity values as well.
  ///
  /// e.g.:
  /// ```
  ///       "#000"                    -> Color(0xff000000)
  ///       "#cc3333"                 -> Color(0xffcc3333)
  ///       "#cc3333dd"               -> Color(0xddcc3333)
  ///       "rgb(204, 44, 81)"        -> Color(0xffcc2c51)
  ///       "rgba(204, 44, 81, 0.20)" -> Color(0x33cc2c51)
  ///       "rgba(204, 44, 81, 0.80)" -> Color(0xcccc2c51)
  /// ```
  /// https://gist.github.com/whiplashoo/afe1c8e542c6bf8e8b2659eb9d9a4071
  Color get toColor {
    return utils.hexOrRGBToColor(this);
  }

  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  bool get isURL => utils.isURL(this);

  bool get isIP => utils.isIP(this);

  bool get isNumber {
    return double.tryParse(this) != null;
  }
}

extension CuColorUtil on Color {
  /// Returns a hex string representation of the color.
  ///
  /// e.g.: Color(0xff000000) -> "#000000"
  String get toHex {
    return utils.colorToHex(this);
  }
}

extension CuTextStyle on TextStyle {
  /// |> 10.0
  /// 说明文本，标签文字或关注度低的文字
  TextStyle get $xs => copyWith(fontSize: CuFontSizes.xs);

  /// |> 12.0
  /// 页面辅助信息，次级内容等
  TextStyle get $sm => copyWith(fontSize: CuFontSizes.sm);

  /// |> 14.0
  /// 页面默认字号，用于摘要或阅读文本
  TextStyle get $df => copyWith(fontSize: CuFontSizes.df);

  /// |> 16.0
  /// 页面三级标题，首要层级显示内容
  TextStyle get $lg => copyWith(fontSize: CuFontSizes.lg);

  /// |> 18.0
  /// 页面二级标题，用于结果页等单一信息页
  TextStyle get $xl => copyWith(fontSize: CuFontSizes.xl);

  /// |> 22.0
  /// 页面一级标题,或者用于金额数字等信息
  TextStyle get $xxl => copyWith(fontSize: CuFontSizes.xxl);

  /// |> FontWeight.bold
  TextStyle get $bold => copyWith(fontWeight: FontWeight.bold);

  /// |> FontWeight.w600
  TextStyle get $normal => copyWith(fontWeight: FontWeight.normal);

  /// 嫣红
  TextStyle get $red => copyWith(color: CuColors.red);

  /// 桔橙
  TextStyle get $orange => copyWith(color: CuColors.orange);

  /// 明黄
  TextStyle get $yellow => copyWith(color: CuColors.yellow);

  /// 橄榄
  TextStyle get $olive => copyWith(color: CuColors.olive);

  /// 森绿
  TextStyle get $green => copyWith(color: CuColors.green);

  /// 天青
  TextStyle get $cyan => copyWith(color: CuColors.cyan);

  /// 海蓝
  TextStyle get $blue => copyWith(color: CuColors.blue);

  /// 姹紫
  TextStyle get $purple => copyWith(color: CuColors.purple);

  /// 木槿
  TextStyle get $mauve => copyWith(color: CuColors.mauve);

  /// 桃粉
  TextStyle get $pink => copyWith(color: CuColors.pink);

  /// 棕褐
  TextStyle get $brown => copyWith(color: CuColors.brown);

  /// 玄灰
  TextStyle get $grey => copyWith(color: CuColors.grey);

  /// 草灰
  TextStyle get $gray => copyWith(color: CuColors.gray);

  /// 墨黑
  TextStyle get $black => copyWith(color: CuColors.black);

  /// 雅白
  TextStyle get $white => copyWith(color: CuColors.white);

  /// 嫣红(亮色)
  TextStyle get $redLight => copyWith(color: CuColors.redLight);

  /// 桔橙(亮色)
  TextStyle get $orangeLight => copyWith(color: CuColors.orangeLight);

  /// 明黄(亮色)
  TextStyle get $yellowLight => copyWith(color: CuColors.yellowLight);

  /// 橄榄(亮色)
  TextStyle get $oliveLight => copyWith(color: CuColors.oliveLight);

  /// 森绿(亮色)
  TextStyle get $greenLight => copyWith(color: CuColors.greenLight);

  /// 天青(亮色)
  TextStyle get $cyanLight => copyWith(color: CuColors.cyanLight);

  /// 海蓝(亮色)
  TextStyle get $blueLight => copyWith(color: CuColors.blueLight);

  /// 姹紫(亮色)
  TextStyle get $purpleLight => copyWith(color: CuColors.purpleLight);

  /// 木槿(亮色)
  TextStyle get $mauveLight => copyWith(color: CuColors.mauveLight);

  /// 桃粉(亮色)
  TextStyle get $pinkLight => copyWith(color: CuColors.pinkLight);

  /// 棕褐(亮色)
  TextStyle get $brownLight => copyWith(color: CuColors.brownLight);

  /// 玄灰(亮色)
  TextStyle get $greyLight => copyWith(color: CuColors.greyLight);
}

extension CuIntEdgeInsets on int {
  EdgeInsetsGeometry get $edgeAll => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry get $edgeL => EdgeInsets.only(left: toDouble());
  EdgeInsetsGeometry get $edgeR => EdgeInsets.only(right: toDouble());
  EdgeInsetsGeometry get $edgeT => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get $edgeB => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get $edgeTB =>
      EdgeInsets.only(top: toDouble(), bottom: toDouble());
  EdgeInsetsGeometry get $edgeLR =>
      EdgeInsets.only(left: toDouble(), right: toDouble());
}

extension CuDoubleEdgeInsets on double {
  EdgeInsetsGeometry get $edgeAll => EdgeInsets.all(this);
  EdgeInsetsGeometry get $edgeL => EdgeInsets.only(left: this);
  EdgeInsetsGeometry get $edgeR => EdgeInsets.only(right: this);
  EdgeInsetsGeometry get $edgeT => EdgeInsets.only(top: this);
  EdgeInsetsGeometry get $edgeB => EdgeInsets.only(bottom: this);
  EdgeInsetsGeometry get $edgeTB => EdgeInsets.only(top: this, bottom: this);
  EdgeInsetsGeometry get $edgeLR => EdgeInsets.only(left: this, right: this);
}

extension CuBorderRadiusCircularWithDouble on double {
  /// 圆角
  BorderRadiusGeometry get $radiusCircle => BorderRadius.circular(this);
}

extension CuBorderRadiusCircularWithInt on int {
  /// 圆角
  BorderRadiusGeometry get $radiusCircle => BorderRadius.circular(toDouble());
}

extension CuIntSpaceWidget on int {
  /// Return self height spacing placeholder widget
  Widget get hSpace {
    return SizedBox(height: toDouble());
  }

  /// Return self width spacing placeholder widget
  Widget get wSpace {
    return SizedBox(width: toDouble());
  }
}

extension CuDoubleSpaceWidget on double {
  /// Return self height spacing placeholder widget
  Widget get hSpace {
    return SizedBox(height: this);
  }

  /// Return self width spacing placeholder widget
  Widget get wSpace {
    return SizedBox(width: this);
  }
}

extension CuEdgeInsetsSetter on EdgeInsets {
  /// top | bottom
  EdgeInsets $TB(double value) => copyWith(top: value, bottom: value);

  /// left | right
  EdgeInsets $LR(double value) => copyWith(left: value, right: value);

  /// left
  EdgeInsets $L(double value) => copyWith(left: value);

  /// right
  EdgeInsets $R(double value) => copyWith(right: value);

  /// top
  EdgeInsets $T(double value) => copyWith(top: value);

  /// bottom
  EdgeInsets $B(double value) => copyWith(bottom: value);
}

extension CuEdgeInsetsListWithInt on List<int> {
  /// [0] => top, bottom
  ///
  /// [1] => left, right
  EdgeInsets get $edge {
    assert(length == 2);
    return EdgeInsets.symmetric(
      vertical: this[0].toDouble(),
      horizontal: this[1].toDouble(),
    );
  }
}

extension CuEdgeInsetsListWithDouble on List<double> {
  /// [0] => top, bottom
  ///
  /// [1] => left, right
  EdgeInsets get $edge {
    assert(length == 2);
    return EdgeInsets.symmetric(
      vertical: this[0],
      horizontal: this[1],
    );
  }
}
