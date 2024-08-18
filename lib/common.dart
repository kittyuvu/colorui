import 'dart:convert';
import 'dart:math';

class CuRandom {
  /// Return random bool
  bool $bool() {
    return Random().nextBool();
  }

  /// Return random int([min] and [max])
  int $int({int min = 0, required int max}) {
    return Random().nextInt(max - min) + min;
  }

  /// Return random double([min] and [max])
  double $double({double min = 0, required int max}) {
    return Random().nextDouble() * (max - min) + min;
  }

  /// Return random string([length])
  String $string({int length = 6}) {
    return String.fromCharCodes(
      Iterable.generate(length, (_) => $int(max: 62)),
    );
  }
}

/// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON
class JSON {
  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
  static parse<T>(String json) {
    return jsonDecode(json) as T; 
  }

  /// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
  static String stringify(dynamic json) {
    return jsonEncode(json);
  }
}

/// noop
var $noop = () {};

/// noop + one param
var $noop1 = (dynamic p1) {};

/// noop + two param
var $noop2 = (dynamic p1, dynamic p2) {};
