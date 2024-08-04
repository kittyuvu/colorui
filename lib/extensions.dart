// https://pub.dev/packages/awesome_extensions
import 'package:colorui/utils.dart' as utils;
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

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

extension CuSpaceWidgetDouble on double {
  /// Return self height spacing placeholder widget
  Widget get hSpace {
    return SizedBox(height: this);
  }

  /// Return self width spacing placeholder widget
  Widget get wSpace {
    return SizedBox(width: this);
  }
}
