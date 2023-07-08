import "package:flutter/material.dart";

class Txt extends StatelessWidget {
  /// 引数のラベル文字列を元にテキストウィジェットを返す
  const Txt(
    this.label, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color == null ? Colors.black : color!,
      fontWeight: fontWeight == null ? FontWeight.normal : fontWeight!,
      fontSize: fontSize,
    );
    return Text(
      label,
      style: style,
    );
  }
}
