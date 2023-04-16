import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin Svg {
  /// 引数のアセットパスと幅/高さのサイズ指定を元に
  /// SvgPicture(flutter_svg)形式で返す
  /// 例:
  /// svg(
  ///  'assets/images/svg.svg',
  ///   width: 128,
  ///   height: 128,
  /// )
  SvgPicture svg(
    String assetPath, {
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    Widget Function(BuildContext)? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
  }) {
    return SvgPicture.asset(
      assetPath,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
      colorFilter: colorFilter,
    );
  }
}
