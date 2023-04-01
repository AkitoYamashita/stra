import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({
    super.key,
    required this.children,
    double? padding,
  }) : padding = padding ?? 5.0;
  final List<Widget> children;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
