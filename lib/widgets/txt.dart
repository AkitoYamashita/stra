import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  /// 引数のラベル文字列を元にテキストウィジェットを返す
  const Txt(
    this.label, {
    super.key,
    this.color,
    this.fontSize,
  });

  final String label;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color == null ? Colors.black : color!,
      fontSize: fontSize,
    );
    return Text(
      label,
      style: style,
    );
  }
}
