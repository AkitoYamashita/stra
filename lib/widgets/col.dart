import "package:flutter/material.dart";

class Col extends StatelessWidget {
  /// 引数のウィジェットリスト（children）を元にコンテナウィジェットを返す
  /// ウィジェットリストをラップするコンテナの背景色は透明、枠付き（薄灰色）、余白(padding)は2
  /// _widgetCallback引数を利用することで個別のラッパー処理が可能（デフォルトはPadding:2でラップ）
  const Col({
    super.key,
    required this.children,
    Widget Function(Widget widget)? widgetCallback,
    Color? backgroundColor,
    MainAxisSize? mainAxisSize,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  })  : backgroundColor =
            backgroundColor ?? const Color.fromARGB(255, 180, 180, 180),
        padding = padding ?? const EdgeInsets.all(2),
        margin = margin ?? const EdgeInsets.all(2),
        mainAxisSize = mainAxisSize ?? MainAxisSize.max,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        widgetCallback = widgetCallback ?? _widgetCallback;

  final List<Widget> children;
  final Widget Function(Widget widget) widgetCallback;
  final Color backgroundColor;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  static Widget _widgetCallback(Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children.map(widgetCallback).toList(),
      ),
    );
  }
}
