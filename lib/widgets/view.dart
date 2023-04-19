import 'package:flutter/material.dart';

class View extends StatelessWidget {
  /// 引数のウィジェットリスト（children）を元にスキャフォールドウィジェットを返す
  /// スキャフォールドのデフォルト背景色は白（透過弱）
  /// ウィジェットリストをラップするコンテナの背景色は白、枠付き（灰色）、余白(padding)は5
  /// widgetCallback引数を利用することで個別のラッパー処理が可能
  /// widgetWrapperCallback引数を利用することで全体ラッパー処理が可能
  /// （デフォルトはSizedBox.expandで縦横を最大まで伸ばす）
  const View({
    super.key,
    required this.children,
    Widget Function(Widget widget)? widgetWrapperCallback,
    Widget Function(Widget widget)? widgetCallback,
    bool? appBarDisable,
    Color? backgroundColor,
    MainAxisSize? mainAxisSize,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  })  : appBarDisable = appBarDisable ?? false,
        backgroundColor =
            backgroundColor ?? const Color.fromARGB(255, 180, 180, 180),
        widgetWrapperCallback = widgetWrapperCallback ?? _widgetWrapperCallback,
        widgetCallback = widgetCallback ?? _widgetCallback,
        mainAxisSize = mainAxisSize ?? MainAxisSize.max,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.start;

  final List<Widget> children;
  final Widget Function(Widget widget) widgetWrapperCallback;
  final Widget Function(Widget widget) widgetCallback;
  final bool appBarDisable;
  final Color backgroundColor;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  static Widget _widgetWrapperCallback(Widget widget) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        color: Colors.transparent,
      ),
      child: SizedBox.expand(
        child: widget,
      ),
    );
  }

  static Widget _widgetCallback(Widget widget) => widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDisable ? null : AppBar(title: const Text('View')),
      backgroundColor: backgroundColor,
      body: widgetWrapperCallback(
        Column(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children.map(widgetCallback).toList(),
        ),
      ),
    );
  }
}
