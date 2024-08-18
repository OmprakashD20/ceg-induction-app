import "package:fpdart/fpdart.dart";
import "package:shared_preferences/shared_preferences.dart";

import "errors.dart";
import "typedefs.dart";

class PreferenceManager {
  final SharedPreferences _prefs;
  static const invalidTypeError = 'Invalid Type:';

  PreferenceManager._(this._prefs);

  static PreferenceManager? _instance;

  static Future<PreferenceManager> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferences.getInstance();
      _instance = PreferenceManager._(prefs);
    }
    return _instance!;
  }

  FutureEither<bool> setData<T>(T data, String key) async {
    assert(
        T == String || T == bool || T == int || T == double, invalidTypeError);

    try {
      final setFuncs = <Type, Future<bool> Function()>{
        String: () => _prefs.setString(key, data as String),
        bool: () => _prefs.setBool(key, data as bool),
        int: () => _prefs.setInt(key, data as int),
        double: () => _prefs.setDouble(key, data as double),
      };

      final result = await (setFuncs[T] ?? () async => false)();
      if (!result) {
        return const Left(
          Failure(
            message: 'Could not cache data',
          ),
        );
      }
      return right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  Either<Failure, T?> getData<T>(String key) {
    assert(
        T == String || T == bool || T == int || T == double, invalidTypeError);

    try {
      final getFuncs = <Type, T? Function()>{
        String: () => _prefs.getString(key) as T?,
        bool: () => _prefs.getBool(key) as T?,
        int: () => _prefs.getInt(key) as T?,
        double: () => _prefs.getDouble(key) as T?,
      };

      final data = getFuncs[T]?.call();
      if (data == null) {
        return left(
          const Failure(
            message: 'Data not found!',
          ),
        );
      }

      return right(data);
    } on DataNotFoundException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  Future<bool> removeData(String key) async {
    return await _prefs.remove(key);
  }
}
