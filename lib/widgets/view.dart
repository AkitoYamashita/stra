import 'package:flutter/material.dart';

class View extends StatelessWidget {
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
