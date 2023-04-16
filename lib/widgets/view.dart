import 'package:flutter/material.dart';

class View extends StatelessWidget {
  /// 引数のウィジェットリスト（children）を元にスキャフォールドウィジェットを返す
  /// スキャフォールドのデフォルト背景色は白（透過弱）
  /// ウィジェットリストをラップするコンテナの背景色は白、枠付き（灰色）、余白(padding)は5
  /// _widgetCallback引数を利用することで個別のラッパー処理が可能
  const View({
    super.key,
    required this.children,
    Widget Function(Widget widget)? widgetWrapperCallback,
    Widget Function(Widget widget)? widgetCallback,
    Color? bgColor,
  })  : bgColor = bgColor ?? const Color.fromARGB(200, 255, 255, 255),
        widgetWrapperCallback = widgetWrapperCallback ?? _widgetCallback,
        widgetCallback = widgetCallback ?? _widgetCallback;

  final List<Widget> children;
  final Widget Function(Widget widget) widgetWrapperCallback;
  final Widget Function(Widget widget) widgetCallback;
  final Color bgColor;

  static Widget _widgetCallback(Widget widget) => widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: Colors.white,
        ),
        child: widgetWrapperCallback(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.map(widgetCallback).toList(),
          ),
        ),
      ),
    );
  }
}
