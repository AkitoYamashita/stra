import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class Stra {
  /// Straコンストラクタ（シングルトン）
  factory Stra({String? name}) {
    if (!_kv.containsKey('name')) {
      _kv['name'] = name ?? 'STRA';
    }
    return _instance;
  }

  /// 内部用の別名コンストラクタ
  Stra._internal(); // Internal

  /// シングルトンのインスタンス
  static final Stra _instance = Stra._internal();

  /// ストアのインスタンス
  static final _kv = <String, dynamic>{};

  /// デバッグフラグ（default:false）
  static bool _debug = false;

  /// デバッグタグ名(default:空文字)
  static String debugTagName = '';

  /// コンソールログ
  static String consoleLog = 'consoleLog';

  /// デバッグフラグを真偽値で返す
  static bool get debug => _debug;

  /// デバッグフラグを設定する
  static set debug(bool newDebug) {
    log(newDebug ? 'STRA_DEBUG_ENABLED' : 'STRA_DEBUG_DISABLED');
    _debug = newDebug;
  }

  /// ストアにキーと値を入れる（既に同名のキーがあっても上書きする）
  static void set(String key, dynamic value) {
    if (_debug) log('Stra.set -> $key : $value');
    _kv[key] = value;
  }

  /// ストアにキーと値を入れる（既に同名のキーがある場合はなにもしない）
  static bool setOrSkip(String key, dynamic value) {
    final skip = _kv.containsKey(key);
    if (_debug) {
      log("Stra.setOrSkip -> ${skip ? "Skip" : "$key : $value"}");
    }
    if (!skip) _kv[key] = value;
    return !skip; // true -> set success, false -> skipped
  }

  /// ストアのキー一覧を返す
  static Iterable<String> getKeys() {
    final ks = _kv.keys;
    if (_debug) log('Stra.getKeys -> $ks');
    return ks;
  }

  /// ストアからキー名を元に値を返す
  static dynamic get(String key) {
    if (_debug) log('Stra.get -> $key : ${_kv[key]}');
    return _kv[key];
  }

  /// dart:developerのラッパー関数
  static void log(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: debugTagName,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 引数の文字列に`ECHO:`を先頭につけて返す
  static String echo(String message) {
    return 'ECHO:$message';
  }

  /// 戻るボタンを生成し返す
  static ElevatedButton backBtn(BuildContext context, String? label) {
    return ElevatedButton(
      child: Text(label ?? 'back'),
      onPressed: () {
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
    );
  }

  /// ウィジェットを中央寄せのScaffoldでラップして返す
  static Scaffold scaffold(Widget body) {
    return Scaffold(body: Center(child: body));
  }

  /// Navigator向けの画面遷移エフェクト（フェードイン）
  static PageRouteBuilder<T> fadein<T>(
    Widget Function(BuildContext, Animation<double>, Animation<double>)
        pageBuilder,
  ) {
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        final doubleAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: doubleAnimation,
          child: child,
        );
      },
    );
  }

  /// Navigator向けの画面遷移エフェクト（ブラックアウト）
  static PageRouteBuilder<T> blackout<T>(
    Widget Function(BuildContext, Animation<double>, Animation<double>)
        pageBuilder,
  ) {
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final color = ColorTween(
          begin: Colors.transparent,
          end: Colors.black,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.1, curve: Curves.easeInOut),
          ),
        );
        final opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.1, 0.2, curve: Curves.easeInOut),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              color: color.value,
              child: Opacity(
                opacity: opacity.value,
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }
}
