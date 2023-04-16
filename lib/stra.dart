import 'dart:async';
import 'dart:developer' as developer;

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
}
