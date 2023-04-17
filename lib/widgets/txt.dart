import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  /// 引数のラベル名を元にテキストウィジェットを返す
  /// ※ラベル名の指定がない場合は、デフォルトの文字列を設定
  const Txt({super.key, String? label}) : label = label ?? 'Txt';
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}
