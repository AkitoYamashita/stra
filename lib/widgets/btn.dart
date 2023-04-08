import 'package:flutter/material.dart';
import 'package:stra/stra.dart';

class Btn extends StatelessWidget {
  Btn({
    Key? key,
    String? label,
    VoidCallback? onPressed,
    double? padding,
  }) : this.init(
          key: key,
          label: label,
          onPressed: onPressed,
          padding: padding,
          created: DateTime.now().millisecondsSinceEpoch,
        );

  Btn.init({
    super.key,
    String? label,
    VoidCallback? onPressed,
    double? padding,
    required this.created,
  })  : label = label ?? 'Label',
        onPressed = onPressed ??
            (() {
              Stra.log(
                '$created->Btn.onPressed@${DateTime.now().toIso8601String()}',
              );
            }),
        padding = padding ?? 0;

  final VoidCallback onPressed;
  final String label;
  final int created;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 15,
          ),
          backgroundColor: Colors.grey,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
