import 'package:flutter/material.dart';
import 'package:stra/widgets/col.dart';

class View extends StatelessWidget {
  /// 引数のウィジェットリスト（children）を元にスキャフォールドウィジェットを返す
  /// safeAreaCallback引数を利用することでオーバーフロー用のラッパー処理が可能
  /// wrapperCallback引数を利用することでウィジェットリストのラッパー処理が可能
  /// widgetCallback引数を利用することで個別のラッパー処理が可能
  /// ※Desktop/Webアプリケーションで水平方向の(マウスドラッグによる)スクロールを有効にするため、
  /// MaterialScrollBehaviorのオーバーライドし、MaterialAppのscrollBehaviorへ設定する必要有り
  const View({
    super.key,
    required this.children,
    Widget Function(Widget widget)? safeAreaCallback,
    Widget Function(List<Widget> listWidget)? wrapperCallback,
    Widget Function(Widget widget)? widgetCallback,
    bool? appBarDisable,
    Color? backgroundColor,
  })  : appBarDisable = appBarDisable ?? false,
        backgroundColor =
            backgroundColor ?? const Color.fromARGB(255, 180, 180, 180),
        safeAreaCallback = safeAreaCallback ?? _safeAreaCallback,
        wrapperCallback = wrapperCallback ?? _wrapperCallback,
        widgetCallback = widgetCallback ?? _widgetCallback;

  final List<Widget> children;
  final Widget Function(Widget widget) safeAreaCallback;
  final Widget Function(List<Widget> listWidget) wrapperCallback;
  final Widget Function(Widget widget) widgetCallback;
  final bool appBarDisable;
  final Color backgroundColor;

  static Widget _safeAreaCallback(Widget widget) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: widget,
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _wrapperCallback(List<Widget> listWidget) {
    return Center(
      child: Col(
        backgroundColor: Colors.transparent,
        mainAxisSize: MainAxisSize.min, //max
        mainAxisAlignment: MainAxisAlignment.start, //start
        crossAxisAlignment: CrossAxisAlignment.start, //center
        children: listWidget,
      ),
    );
  }

  static Widget _widgetCallback(Widget widget) => widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDisable ? null : AppBar(title: const Text('View')),
      backgroundColor: backgroundColor,
      body: safeAreaCallback(
        wrapperCallback(
          children.map(widgetCallback).toList(),
        ),
      ),
    );
  }
}
