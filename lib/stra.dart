import 'dart:developer' as developer;
import 'dart:async';

class Stra {
  static final Stra _instance = Stra._internal();
  static bool _debug = false;
  static String debugTagName = "";
  static String consoleLog = "consoleLog";
  static final Map _kv = <String, dynamic>{};

  /// Contructor
  Stra._internal(); // Internal
  factory Stra({String? name}) {
    if (!_kv.containsKey("name")) {
      _kv["name"] = name ?? "Stra";
    }
    return _instance;
  }

  /// Accessor
  static bool get debug => _debug;
  static set debug(bool newDebug) {
    log(newDebug ? "STRA_DEBUG_MODE" : "STRA_NO_DEBUG_MODE");
    _debug = newDebug;
  }

  static void set(String key, dynamic value) {
    if (_debug) log("Stra.set -> $key : ${value.toString()}");
    _kv[key] = value;
  }

  static bool setOrSkip(String key, dynamic value) {
    bool skip = _kv.containsKey(key);
    if (_debug) {
      log("Stra.setOrSkip -> ${skip ? "Skip" : "$key : ${value.toString()}"}");
    }
    if (!skip) _kv[key] = value;
    return !skip; // true -> set success, false -> skipped
  }

  static dynamic get(String key) {
    if (_debug) log("Stra.get -> $key : ${_kv[key].toString()}");
    return _kv[key];
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
