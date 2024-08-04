import 'package:flutter/widgets.dart';

enum CuBoxShadowSize { sm, df, lg }

// copy by color-ui
// --ui-Shadow: 0 .5em 1em rgba(0, 0, 0, 0.15);
// --ui-Shadow-sm: 0 .125em .25em rgba(0, 0, 0, 0.075);
// --ui-Shadow-lg: 0 1em 3em rgba(0, 0, 0, 0.175);

const kBoxShadowDefualtDFOpacity = 0.15;
const kBoxShadowDefaultSMOpacity = 0.075;
const kBoxShadowDefaultLGOpacity = 0.175;

double _getDefaultOpacity(CuBoxShadowSize size) {
  switch (size) {
    case CuBoxShadowSize.sm:
      return kBoxShadowDefaultSMOpacity;
    case CuBoxShadowSize.df:
      return kBoxShadowDefualtDFOpacity;
    case CuBoxShadowSize.lg:
      return kBoxShadowDefaultLGOpacity;
  }
}

double _getSize(CuBoxShadowSize size) {
  switch (size) {
    case CuBoxShadowSize.sm:
      return .125 * 16;
    case CuBoxShadowSize.df:
      return .5 * 16;
    case CuBoxShadowSize.lg:
      return 1 * 16;
  }
}

double _getBlur(CuBoxShadowSize size) {
  switch (size) {
    case CuBoxShadowSize.sm:
      return .25 * 16;
    case CuBoxShadowSize.df:
      return 1 * 16;
    case CuBoxShadowSize.lg:
      return 3 * 16;
  }
}

Color _color(Color? value, CuBoxShadowSize size, double? opacity) {
  var $opacity = _getDefaultOpacity(size);
  var cx = value ?? Color.fromRGBO(0, 0, 0, $opacity);
  if (opacity != null) {
    $opacity = opacity;
  }
  return cx.withOpacity($opacity);
}

Offset _offset(CuBoxShadowSize size) => Offset(0, _getSize(size));

class CuBoxShadow extends BoxShadow {
  CuBoxShadow({
    this.value,
    this.size = CuBoxShadowSize.df,
    this.opacity,
  }) : super(
          offset: _offset(size),
          color: _color(value, size, opacity),
          blurRadius: _getBlur(size),
        );

  factory CuBoxShadow.sm({Color? color, double? opacity}) => CuBoxShadow(
        size: CuBoxShadowSize.sm,
        value: color,
        opacity: opacity,
      );

  factory CuBoxShadow.df({Color? color, double? opacity}) => CuBoxShadow(
        size: CuBoxShadowSize.df,
        value: color,
        opacity: opacity,
      );

  factory CuBoxShadow.lg({Color? color, double? opacity}) => CuBoxShadow(
        size: CuBoxShadowSize.lg,
        value: color,
        opacity: opacity,
      );

  /// List[sm]
  static sm$({Color? color, double? opacity}) {
    return [CuBoxShadow.sm(color: color, opacity: opacity)];
  }

  /// List[df]
  static df$({Color? color, double? opacity}) {
    return [CuBoxShadow.df(color: color, opacity: opacity)];
  }

  /// List[lg]
  static lg$({Color? color, double? opacity}) {
    return [CuBoxShadow.lg(color: color, opacity: opacity)];
  }

  final CuBoxShadowSize size;
  final Color? value;
  final double? opacity;
}
