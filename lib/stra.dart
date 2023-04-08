import 'dart:async';
import 'dart:developer' as developer;

class Stra {
  /// Contructor
  factory Stra({String? name}) {
    if (!_kv.containsKey('name')) {
      _kv['name'] = name ?? 'Stra';
    }
    return _instance;
  }
  Stra._internal(); // Internal

  static final Stra _instance = Stra._internal();
  static bool _debug = false;
  static String debugTagName = '';
  static String consoleLog = 'consoleLog';
  static final _kv = <String, dynamic>{};

  /// Accessor
  static bool get debug => _debug;
  static set debug(bool newDebug) {
    log(newDebug ? 'STRA_DEBUG_ENABLED' : 'STRA_DEBUG_DISABLED');
    _debug = newDebug;
  }

  static void set(String key, dynamic value) {
    if (_debug) log('Stra.set -> $key : $value');
    _kv[key] = value;
  }

  static bool setOrSkip(String key, dynamic value) {
    final skip = _kv.containsKey(key);
    if (_debug) {
      log("Stra.setOrSkip -> ${skip ? "Skip" : "$key : $value"}");
    }
    if (!skip) _kv[key] = value;
    return !skip; // true -> set success, false -> skipped
  }

  static dynamic get(String key) {
    if (_debug) log('Stra.get -> $key : ${_kv[key]}');
    return _kv[key];
  }

  static String getString(String key) {
    if (_debug) log('Stra.getString -> $key : ${_kv[key]}');
    return _kv[key] as String;
  }

  /// Method
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
}
