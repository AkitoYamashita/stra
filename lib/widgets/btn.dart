import "package:flutter/material.dart";
import "package:stra/stra.dart";
import "package:stra/widgets/txt.dart";

class Btn extends StatelessWidget {
  /// 引数のラベル名(またはchildウィジェット)と押下時のイベント、スタイル指定を元にボタンウィジェットを返す
  /// ※押下時のイベント指定がない場合は、押下時に現在時刻をログ出力する処理を設定する
  Btn({
    Key? key,
    EdgeInsetsGeometry? wrapperPadding,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    ButtonStyle? buttonStyle,
    VoidCallback? onPressed,
    String? label,
    Widget? child,
  }) : this.init(
          key: key,
          wrapperPadding: wrapperPadding,
          padding: padding,
          minimumSize: minimumSize,
          buttonStyle: buttonStyle,
          onPressed: onPressed,
          created: DateTime.now().millisecondsSinceEpoch,
          label: label,
          child: child,
        );

  Btn.init({
    super.key,
    EdgeInsetsGeometry? wrapperPadding,
    EdgeInsetsGeometry? padding,
    this.minimumSize,
    this.buttonStyle,
    VoidCallback? onPressed,
    required this.created,
    String? label,
    this.child,
  })  : wrapperPadding = wrapperPadding ?? EdgeInsets.zero,
        padding = padding ??
            const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 15,
            ),
        onPressed = onPressed ??
            (() {
              Stra.log(
                "$created->Btn.onPressed@${Stra.now()}",
              );
            }),
        label = label ?? "Label";

  final EdgeInsetsGeometry wrapperPadding;
  final ButtonStyle? buttonStyle;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final int created;
  final String label;
  final Widget? child;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wrapperPadding,
      child: ElevatedButton(
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              padding: padding,
              minimumSize: minimumSize,
              side: const BorderSide(
                color: Colors.black26,
              ),
              shadowColor: Colors.transparent,
              backgroundColor: const Color.fromARGB(255, 180, 180, 180),
            ),
        onPressed: onPressed,
        child: child ?? Txt(label),
      ),
    );
  }
}
