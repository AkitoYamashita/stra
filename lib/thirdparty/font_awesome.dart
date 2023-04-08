import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin WithFontAwesome {
  IconData? _faIcon;
  Color? _faColor;
  double? _faSize;

  /// Accessor
  IconData? get faIcon => _faIcon;
  set faIcon(IconData? newIcon) => _faIcon = newIcon;
  Color? get faColor => _faColor;
  set faColor(Color? newColor) => _faColor = newColor;
  double? get faSize => _faSize;
  set faSize(double? newSize) => _faSize = newSize;

  FaIcon fa({
    IconData? icon,
    Key? key,
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) {
    icon ??= _faIcon ?? FontAwesomeIcons.circleQuestion;
    if (color == null && _faColor != null) color = _faColor;
    if (size == null && _faSize != null) size = _faSize;
    return FaIcon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
