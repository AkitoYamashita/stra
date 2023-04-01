import 'package:flutter/material.dart';
import 'package:stra/stra.dart';

class Btn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final int created;

  Btn({
    Key? key,
    String? label,
    VoidCallback? onPressed,
  }) : this.init(
          key: key,
          label: label,
          onPressed: onPressed,
          created: DateTime.now().millisecondsSinceEpoch,
        );
  Btn.init({
    super.key,
    String? label,
    VoidCallback? onPressed,
    required this.created,
  })  : label = label ?? "Label",
        onPressed = onPressed ??
            (() {
              Stra.log(
                  "$created->Btn.onPressed@${DateTime.now().toIso8601String()}");
            });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        backgroundColor: Colors.grey,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
