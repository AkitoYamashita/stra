import 'package:flutter/material.dart';
import 'package:stra/stra.dart';

class Btn extends StatelessWidget {
  /// 引数のラベル名と押下時のイベント、paddingを元にボタンウィジェットを返す
  /// ※押下時のイベント指定がない場合は、押下時に現在時刻をログ出力する処理を設定する
  Btn({
    Key? key,
    String? label,
    ButtonStyle? style,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
  }) : this.init(
          key: key,
          label: label,
          style: style,
          onPressed: onPressed,
          created: DateTime.now().millisecondsSinceEpoch,
          padding: padding,
        );

  Btn.init({
    super.key,
    String? label,
    ButtonStyle? style,
    VoidCallback? onPressed,
    required this.created,
    EdgeInsetsGeometry? padding,
  })  : label = label ?? 'Label',
        style = style ??
            ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              backgroundColor: Colors.grey,
            ),
        onPressed = onPressed ??
            (() {
              Stra.log(
                '$created->Btn.onPressed@${DateTime.now().toIso8601String()}',
              );
            }),
        padding = padding ?? EdgeInsets.zero;

  final String label;
  final ButtonStyle? style;
  final VoidCallback onPressed;
  final int created;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
