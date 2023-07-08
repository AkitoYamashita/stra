import "package:flutter/material.dart";

/// 引数のウィジェットをContainer+@でラップして返す
/// margin,paddingでそれぞれ余白を指定可能（default:0）
class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    BoxBorder? boxBorder;
    if (borderColor != null) {
      boxBorder = Border.all(
        color: borderColor!,
        width: borderWidth ?? 1.0,
      );
    }
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: boxBorder,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
