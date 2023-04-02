import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({
    super.key,
    required this.children,
    double? padding,
    Color? bgColor,
  })  : padding = padding ?? 5.0,
        bgColor = bgColor ?? const Color.fromARGB(200, 255, 255, 255);
  final List<Widget> children;
  final double padding;
  final Color bgColor;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.map((child) {
              return Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
