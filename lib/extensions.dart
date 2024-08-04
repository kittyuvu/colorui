// https://pub.dev/packages/awesome_extensions
import 'package:flutter/widgets.dart';

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
