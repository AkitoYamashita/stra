import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  const Txt({super.key, String? label}) : label = label ?? "StraTxt";
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}
