import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin FontAwesome {
  IconData? _faIcon;
  Color? _faColor;
  double? _faSize;

  IconData? get faIcon => _faIcon;
  set faIcon(IconData? newIcon) => _faIcon = newIcon;
  Color? get faColor => _faColor;
  set faColor(Color? newColor) => _faColor = newColor;
  double? get faSize => _faSize;
  set faSize(double? newSize) => _faSize = newSize;

  /// FaIcon(package:font_awesome_flutter)のラッパー
  /// 引数でアイコン(https://fontawesome.com/icons/)や
  /// 色、サイズの指定がされておらず
  /// 既に共通設定されている場合はそれを参照する（呼び出し時に上書き可能）
  ///
  /// 例:
  /// XXX.faIcon = FontAwesomeIcons.solidHeart;
  /// XXX.faColor = Colors.pink;
  /// XXX.faSize = 14;
  ///
  /// Text.rich(
  ///   TextSpan(
  ///     children: [
  ///       const TextSpan(text: 'サンプル'),
  ///       WidgetSpan(
  ///         child: XXX.fa(
  ///           color: Colors.red,
  ///           size: 20,
  ///         ),
  ///       ),
  ///     ],
  ///   ),
  /// )
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
