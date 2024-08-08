// https://pub.dev/packages/awesome_extensions
// https://github.com/felixblaschke/supercharged
// 和 @supermavenAI 结对编程~

import 'package:colorui/colors.dart';
import 'package:colorui/utils.dart' as utils;
import 'package:colorui/var.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'thirdparty/r_dotted_line_border.dart';

extension JSArray<T> on List<T> {
  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].filter((item) => item > 2); // [3, 4, 5]
  /// ```
  List<T> filter(bool Function(T) test) {
    return where(test).toList();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/find
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].find((item) => item > 2); // 3
  /// ```
  T find(bool Function(T) test, [T Function()? orElse]) {
    return firstWhere(test, orElse: orElse);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].findIndex((item) => item > 2); // 2
  /// ```
  int findIndex(bool Function(T) test, [int start = 0]) {
    return indexWhere(test, start);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/includes
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].includes(3); // true
  /// ```
  bool includes(T item) {
    return contains(item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/pop
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].pop(); // 5
  /// // Return [1, 2, 3, 4]
  /// ```
  T pop() {
    return removeLast();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/shift
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].shift(); // 1
  /// // Return [2, 3, 4, 5]
  /// ```
  T shift() {
    return removeAt(0);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].unshift(0); // [0, 1, 2, 3, 4, 5]
  /// ```
  unshift(T item) {
    insert(0, item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].reverse(); // [5, 4, 3, 2, 1]
  /// ```
  List<T> reverse() {
    return reversed.toList();
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/push
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].push(0); // [1, 2, 3, 4, 5, 0]
  /// ```
  push(T item) {
    add(item);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/slice
  ///
  /// Alias [sublist]
  List<T> slice(int start, [int? end]) {
    return sublist(start, end);
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/some
  ///
  /// Example:
  /// ```dart
  /// [0, 2, 3, 4, 5].some((item) => item > 2); // false
  /// ```
  bool some(bool Function(T) test) {
    return any(test);
  }

  /// Map with index
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].mapWithIndex((item, idx) => item + idx); // [1, 3, 5, 7, 9]
  /// ```
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  /// ForEach with index
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].forEachWithIndex((item, idx) => print(item + idx)); // 1 3 5 7 9
  /// ```
  forEachWithIndex(void Function(T, int idx) callback) {
    for (int i = 0; i < length; i++) {
      callback(this[i], i);
    }
  }
}

extension JSString on String {
  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/concat
  ///
  /// Example:
  /// ```dart
  /// "hello".concat(" world"); // "hello world"
  /// ```
  String concat(String other) {
    return this + other;
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/includes
  ///
  /// Alias [contains]
  bool includes(String other) => contains(other);

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd
  ///
  /// Alias [trimRight]
  String trimEnd() => trimRight();

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart
  ///
  /// Alias [trimLeft]
  String trimStart() => trimLeft();
}

extension CuContext on BuildContext {
  /// Alias [MediaQuery.of(context).size.width]
  double get width => MediaQuery.of(this).size.width;

  /// Alias [MediaQuery.of(context).size.height]
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
  /// https://gist.github.com/whiplashoo/afe1c8e542c6bf8e8b2659eb9d9a4071
  ///
  /// Example:
  /// ```dart
  ///   "#000".$color                    -> Color(0xff000000)
  ///   "#cc3333".$color                 -> Color(0xffcc3333)
  ///   "#cc3333dd".$color               -> Color(0xddcc3333)
  ///   "rgb(204, 44, 81)".$color        -> Color(0xffcc2c51)
  ///   "rgba(204, 44, 81, 0.20)".$color -> Color(0x33cc2c51)
  ///   "rgba(204, 44, 81, 0.80)".$color -> Color(0xcccc2c51)
  /// ```
  Color get $color {
    return utils.hexOrRGBToColor(this);
  }

  /// Returns the string with the first character capitalized.
  ///
  /// Example:
  /// ```dart
  /// "hello".$capitalize; // "Hello"
  /// ```
  String get $capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Returns true if the string is a URL.
  ///
  /// Example:
  /// ```dart
  /// "https://www.baidu.com".$isURL; // true
  /// ```
  bool get $isURL => utils.isURL(this);

  /// Returns true if the string is a number.
  ///
  /// Example:
  /// ```dart
  /// "123".$isNumber; // true
  /// ```
  bool get $isNumber {
    return double.tryParse(this) != null;
  }

  /// Return lines(split by "\n")
  ///
  /// Example:
  /// ```dart
  /// "hello\nworld".$toLines; // ["hello", "world"]
  /// ```
  List<String> get $toLines {
    return split("\n");
  }

  /// Return [Text] widget
  ///
  /// Example:
  /// ```dart
  /// "你好世界".$tx(align: TextAlign.center); // Text("你好世界", textAlign: TextAlign.center)
  /// ```
  Text $tx({
    TextStyle? style,
    align = TextAlign.start,
    Color? color,
    double? size,
    String? family,
    FontWeight? weight,
  }) {
    return Text(
      this,
      style: style ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
            fontFamily: family,
          ),
      textAlign: align,
    );
  }
}

extension CuColorUtil on Color {
  /// Returns a hex string representation of the color.
  ///
  /// Example:
  /// ```dart
  /// Color(0xff000000).$hex; // "#000000"
  /// ```
  String get $hex {
    return utils.colorToHex(this);
  }

  /// ```dart
  /// "#fff".$color.$opacity(0.5); // Color(0xff000000).withOpacity(0.5)
  /// ```
  Color $opacity(double opacity) => withOpacity(opacity);

  /// Return BoxBorder.all(color: this)
  ///
  /// Example:
  /// ```dart
  /// "#fff".$color.$border; // Border.all(color: Color(0xfff))
  /// ```
  BoxBorder get $border => Border.all(color: this);

  /// ```dart
  /// CuColors.gray.$opacity(.24).$divider // Divider(color: Color(0x33000000))
  /// ```
  Divider get $divider => Divider(color: this);
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
  /// EdgeInsets.all
  ///
  /// Example:
  /// ```dart
  /// 12.$edge; // EdgeInsets.all(12)
  /// ```
  EdgeInsetsGeometry get $edge => EdgeInsets.all(toDouble());

  /// EdgeInsets.only(left)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeL; // EdgeInsets.only(left: 12)
  /// ```
  EdgeInsetsGeometry get $edgeL => EdgeInsets.only(left: toDouble());

  /// EdgeInsets.only(right)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeR; // EdgeInsets.only(right: 12)
  /// ```
  EdgeInsetsGeometry get $edgeR => EdgeInsets.only(right: toDouble());

  /// EdgeInsets.only(top)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeT; // EdgeInsets.only(top: 12)
  /// ```
  EdgeInsetsGeometry get $edgeT => EdgeInsets.only(top: toDouble());

  /// EdgeInsets.only(bottom)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeB; // EdgeInsets.only(bottom: 12)
  /// ```
  EdgeInsetsGeometry get $edgeB => EdgeInsets.only(bottom: toDouble());

  /// EdgeInsets.only(top, bottom)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeTB; // EdgeInsets.only(top: 12, bottom: 12)
  /// ```
  EdgeInsetsGeometry get $edgeTB =>
      EdgeInsets.only(top: toDouble(), bottom: toDouble());

  /// EdgeInsets.only(left, right)
  ///
  /// Example:
  /// ```dart
  /// 12.$edgeLR; // EdgeInsets.only(left: 12, right: 12)
  /// ```
  EdgeInsetsGeometry get $edgeLR =>
      EdgeInsets.only(left: toDouble(), right: toDouble());
}

extension CuDoubleEdgeInsets on double {
  /// EdgeInsets.all
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edge; // EdgeInsets.all(12.0)
  /// ```
  EdgeInsetsGeometry get $edge => EdgeInsets.all(this);

  /// EdgeInsets.only(left)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeL; // EdgeInsets.only(left: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeL => EdgeInsets.only(left: this);

  /// EdgeInsets.only(right)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeR; // EdgeInsets.only(right: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeR => EdgeInsets.only(right: this);

  /// EdgeInsets.only(top)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeT; // EdgeInsets.only(top: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeT => EdgeInsets.only(top: this);

  /// EdgeInsets.only(bottom)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeB; // EdgeInsets.only(bottom: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeB => EdgeInsets.only(bottom: this);

  /// EdgeInsets.only(top, bottom)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeTB; // EdgeInsets.only(top: 12.0, bottom: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeTB => EdgeInsets.only(top: this, bottom: this);

  /// EdgeInsets.only(left, right)
  ///
  /// Example:
  /// ```dart
  /// 12.0.$edgeLR; // EdgeInsets.only(left: 12.0, right: 12.0)
  /// ```
  EdgeInsetsGeometry get $edgeLR => EdgeInsets.only(left: this, right: this);
}

extension CuBorderRadiusCircularWithDouble on double {
  /// 圆角
  ///
  /// Example:
  /// ```dart
  /// 12.0.radiusCircle; // BorderRadius.circular(12.0)
  /// ```
  BorderRadius get $radiusCircle => BorderRadius.circular(this);
}

extension CuBorderRadiusCircularWithInt on int {
  /// 圆角
  ///
  /// Example:
  /// ```dart
  /// 12.radiusCircle; // BorderRadius.circular(12.0)
  /// ```
  BorderRadiusGeometry get $radiusCircle => BorderRadius.circular(toDouble());
}

extension CuIntSpaceWidget on int {
  /// Return self height spacing placeholder widget
  ///
  /// Example:
  /// ```dart
  /// 12.hSpace; // SizedBox(height: 12)
  /// ```
  Widget get hSpace {
    return SizedBox(height: toDouble());
  }

  /// Return self width spacing placeholder widget
  ///
  /// Example:
  /// ```dart
  /// 12.wSpace; // SizedBox(width: 12)
  /// ```
  Widget get wSpace {
    return SizedBox(width: toDouble());
  }
}

extension CuDoubleSpaceWidget on double {
  /// Return self height spacing placeholder widget
  ///
  /// Example:
  /// ```dart
  /// 12.0.hSpace; // SizedBox(height: 12.0)
  /// ```
  Widget get hSpace {
    return SizedBox(height: this);
  }

  /// Return self width spacing placeholder widget
  ///
  /// Example:
  /// ```dart
  /// 12.0.wSpace; // SizedBox(width: 12.0)
  /// ```
  Widget get wSpace {
    return SizedBox(width: this);
  }
}

/// supercharged/supercharged_dart/lib/datetime/datetime.dart
extension CuDateTime on DateTime {
  /// Returns a new [DateTime] object having added the given [duration].
  ///
  /// Example:
  /// ```dart
  /// DateTime(2020, 1, 1) + 2.days; // 3rd Jan 2020
  /// ```
  DateTime operator +(Duration duration) {
    return add(duration);
  }

  /// Returns a new [DateTime] object having subtracted the given [duration].
  ///
  /// Example:
  /// ```dart
  /// DateTime(2020, 1, 1) - 2.days; // 30th Dec 2019
  /// ```
  DateTime operator -(Duration duration) {
    return subtract(duration);
  }
}

/// supercharged/supercharged_dart/lib/double/double.dart
extension CuIntDateUitl on int {
  /// Returns a [Duration] representing the current value as seconds.
  ///
  /// Example:
  /// ```dart
  /// 30.seconds; // Duration(seconds: 30);
  /// ```
  Duration get seconds {
    return Duration(microseconds: (1000000 * this).round());
  }

  /// Returns a [Duration] representing the current value as minutes.
  ///
  /// Example:
  /// ```dart
  /// 15.minutes; // Duration(minutes: 15);
  /// ```
  Duration get minutes {
    return Duration(milliseconds: (1000 * 60 * this).round());
  }

  /// Returns a [Duration] representing the current value as hours.
  ///
  /// Example:
  /// ```dart
  /// 24.hours; // Duration(hours: 24);
  /// ```
  Duration get hours {
    return Duration(milliseconds: (1000 * 60 * 60 * this).round());
  }

  /// Returns a [Duration] representing the current value as days.
  ///
  /// Example:
  /// ```dart
  /// 14.days; // Duration(days: 14);
  /// ```
  Duration get days {
    return Duration(milliseconds: (1000 * 60 * 60 * 24 * this).round());
  }
}

extension CuIntUitl on int {
  /// Return fill length List<dynamic>
  ///
  /// Example:
  /// ```dart
  /// 12.$list.map((item) {})
  /// ```
  List get $list {
    return List.generate(this, (index) => index);
  }

  /// Each fill length list
  ///
  /// Example:
  /// ```dart
  /// 12.$each((index) {})
  /// ```
  $each(Function(int idx) cb) {
    for (var entry in $list.indexed) {
      cb(entry.$1);
    }
  }

  /// Map fill length list
  /// return [List<T>]
  ///
  /// Example:
  /// ```dart
  /// 12.$items.map<String>((item) => item.toString())
  /// ```
  List<T> $map<T>(T Function(int idx) cb) {
    return $list.indexed.map((entry) => cb(entry.$1)).toList();
  }
}

extension CuEdgeInsetsSetter on EdgeInsets {
  /// top | bottom
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$TB(24); // EdgeInsets(top: 24, bottom: 24, left: 12, right: 12)
  /// ```
  EdgeInsets $TB(double value) => copyWith(top: value, bottom: value);

  /// left | right
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$LR(24); // EdgeInsets(top: 12, bottom: 12, left: 24, right: 24)
  /// ```
  EdgeInsets $LR(double value) => copyWith(left: value, right: value);

  /// left
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$L(42); // EdgeInsets(top: 12, bottom: 12, left: 42, right: 12)
  /// ```
  EdgeInsets $L(double value) => copyWith(left: value);

  /// right
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$R(42); // EdgeInsets(top: 12, bottom: 12, left: 12, right: 42)
  /// ```
  EdgeInsets $R(double value) => copyWith(right: value);

  /// top
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$T(42); // EdgeInsets(top: 42, bottom: 12, left: 12, right: 12)
  /// ```
  EdgeInsets $T(double value) => copyWith(top: value);

  /// bottom
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(12).$B(42); // EdgeInsets(top: 12, bottom: 42, left: 12, right: 12)
  /// ```
  EdgeInsets $B(double value) => copyWith(bottom: value);
}

extension CuEdgeInsetsListWithInt on List<int> {
  /// [0] => top, bottom
  ///
  /// [1] => left, right
  ///
  /// Example:
  /// ```dart
  /// [12, 24].$edge; // EdgeInsets(top: 12, bottom: 12, left: 24, right: 24)
  /// ```
  EdgeInsets get $edge {
    assert(length == 2);
    return EdgeInsets.symmetric(
      vertical: this[0].toDouble(),
      horizontal: this[1].toDouble(),
    );
  }

  /// [0] => top
  /// [1] => bottom
  /// [2] => left
  /// [3] => right
  ///
  /// Example:
  /// ```dart
  /// [12, 24, 36, 48].$edgeAll; // EdgeInsets(top: 12, bottom: 24, left: 36, right: 48)
  /// ```
  EdgeInsets get $edgeAll {
    assert(length == 4);
    return EdgeInsets.only(
      top: this[0].toDouble(),
      bottom: this[1].toDouble(),
      left: this[2].toDouble(),
      right: this[3].toDouble(),
    );
  }
}

extension CuEdgeInsetsListWithDouble on List<double> {
  /// [0] => top, bottom
  ///
  /// [1] => left, right
  ///
  /// Example:
  /// ```dart
  /// [12.0, 24.0].$edge; // EdgeInsets(top: 12, bottom: 12, left: 24, right: 24)
  /// ```
  EdgeInsets get $edge {
    assert(length == 2);
    return EdgeInsets.symmetric(
      vertical: this[0],
      horizontal: this[1],
    );
  }

  /// [0] => top
  /// [1] => bottom
  /// [2] => left
  /// [3] => right
  ///
  /// Example:
  /// ```dart
  /// [12, 24, 36, 48].$edgeAll; // EdgeInsets(top: 12, bottom: 24, left: 36, right: 48)
  /// ```
  EdgeInsets get $edgeAll {
    assert(length == 4);
    return EdgeInsets.only(
      top: this[0],
      bottom: this[1],
      left: this[2],
      right: this[3],
    );
  }
}

extension CuCursorWithBool on bool {
  /// Return [MouseCursor]
  ///
  /// true => [SystemMouseCursors.click]
  ///
  /// false => [SystemMouseCursors.forbidden]
  ///
  /// Example:
  /// ```dart
  /// (coud == 1).$clickedCursor; // SystemMouseCursors.click
  /// ```
  MouseCursor get $clickCursor => this ? CuCursors.pointer : CuCursors.notAllow;
}

extension CuIconWithIconData on IconData {
  /// Return Icon
  ///
  /// Example:
  /// ```dart
  /// CuIcons.github.$icon // Icon(CuIcons.github)
  /// ```
  Icon get $icon => Icon(this);
}

double __$d(dynamic cx) {
  if (cx is double) {
    return cx;
  } else if (cx is int) {
    return cx.toDouble();
  }
  return 0;
}

extension CuBorderWithList on List {
  /// Return [Border]
  ///
  /// [0] => width is [double]
  ///
  /// [1] => color is [Color]
  ///
  /// [2] => has value render dot line
  ///
  /// Example:
  /// ```dart
  /// [1, CuColors.red].$border // Border.all(width: 1, color: CuColors.red)
  /// [1, CuColors.red, 1].$border // ⬆ ️dot line
  /// ```
  BoxBorder get $border {
    assert(
        length >= 2 && (first is double || first is int) && this[1] is Color);
    if (length == 3) {
      return RDottedLineBorder.all(width: __$d(first), color: this[1]);
    }
    return Border.all(width: __$d(first), color: this[1]);
  }

  /// Return [Border.$left]
  ///
  /// [0] => width is [double]
  ///
  /// [1] => color is [Color]
  ///
  /// [2] => has value render dot line
  ///
  /// Example:
  /// ```dart
  /// [1, CuColors.red].$borderL // Border(left: BorderSide(width: 1, color: CuColors.red))
  /// [1, CuColors.red, 1].$borderL // ⬆ ️dot line
  /// ```
  BoxBorder get $borderL {
    assert(
        length >= 2 && (first is double || first is int) && this[1] is Color);
    var side = BorderSide(width: __$d(first), color: this[1]);
    if (length == 3) {
      return RDottedLineBorder(left: side);
    }
    return Border(left: side);
  }

  /// Return [Border.$left]
  ///
  /// [0] => width is [double]
  ///
  /// [1] => color is [Color]
  ///
  /// Example:
  /// ```dart
  /// [1, CuColors.red].$borderR // Border(right: BorderSide(width: 1, color: CuColors.red))
  /// ```
  BoxBorder get $borderR {
    assert(
        length >= 2 && (first is double || first is int) && this[1] is Color);
    var side = BorderSide(width: __$d(first), color: this[1]);
    if (length == 3) {
      return RDottedLineBorder(right: side);
    }
    return Border(right: side);
  }

  /// Return [Border.$top]
  ///
  /// [0] => width is [double]
  ///
  /// [1] => color is [Color]
  ///
  /// Example:
  /// ```dart
  /// [1, CuColors.red].$borderT // Border(left: BorderSide(width: 1, color: CuColors.red))
  /// ```
  BoxBorder get $borderT {
    assert(
        length >= 2 && (first is double || first is int) && this[1] is Color);
    var side = BorderSide(width: __$d(first), color: this[1]);
    if (length == 3) {
      return RDottedLineBorder(top: side);
    }
    return Border(top: side);
  }

  /// Return [Border.$bottom]
  ///
  /// [0] => width is [double]
  ///
  /// [1] => color is [Color]
  ///
  /// Example:
  /// ```dart
  /// [1, CuColors.red].$borderB // Border(bottom: BorderSide(width: 1, color: CuColors.red))
  /// ```
  BoxBorder get $borderB {
    assert(
        length >= 2 && (first is double || first is int) && this[1] is Color);
    var side = BorderSide(width: __$d(first), color: this[1]);
    if (length == 3) {
      return RDottedLineBorder(bottom: side);
    }
    return Border(bottom: side);
  }
}
