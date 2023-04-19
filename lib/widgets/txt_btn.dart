import 'package:flutter/material.dart';

class TxtBtn extends StatelessWidget {
  TxtBtn({
    super.key,
    required this.child,
    VoidCallback? onPressed,
    this.padding,
    this.style,
  }) : onPressed = onPressed ?? (() {});

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            padding:
                padding != null ? MaterialStateProperty.all(padding) : null,
            minimumSize: MaterialStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
      child: child,
    );
  }
}
