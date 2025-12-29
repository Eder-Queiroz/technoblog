import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/services/local_storage/exceptions/local_storage_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider((ref) => LocalStorage());

class LocalStorage {
  LocalStorage();
  SharedPreferences? _preferences;

  Future<SharedPreferences> get _prefs async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<bool> saveData(String key, Object value) async {
    try {
      final preferences = await _prefs;

      return switch (value) {
        String v => preferences.setString(key, v),
        int v => preferences.setInt(key, v),
        double v => preferences.setDouble(key, v),
        bool v => preferences.setBool(key, v),
        List<String> v => preferences.setStringList(key, v),
        _ => throw LocalStorageUnsupportedTypeException(
          'Unsupported type: ${value.runtimeType}',
        ),
      };
    } catch (e, st) {
      if (e is LocalStorageException) {
        rethrow;
      }
      throw LocalStorageException(e.toString(), st);
    }
  }

  Future<T?> getData<T>(String key) async {
    try {
      final preferences = await _prefs;
      final data = preferences.get(key);

      if (data == null) {
        return null;
      }

      if (data is! T) {
        throw LocalStorageTypeMismatchException(
          'Type mismatch: expected $T but got ${data.runtimeType}',
        );
      }

      return data as T;
    } catch (e, st) {
      if (e is LocalStorageException) {
        rethrow;
      }
      throw LocalStorageException(e.toString(), st);
    }
  }

  Future<bool> removeData(String key) async {
    try {
      final preferences = await _prefs;
      return preferences.remove(key);
    } catch (e, st) {
      throw LocalStorageException(e.toString(), st);
    }
  }
}
