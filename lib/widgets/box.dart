import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box(
    this.widget, {
    super.key,
    double? margin,
    double? padding,
  })  : margin = margin ?? 0,
        padding = padding ?? 0;

  final Widget widget;
  final double margin;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: widget,
    );
  }
}
