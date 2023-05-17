import 'package:shared_preferences/shared_preferences.dart';

import 'package:student_library_app/src/services/abstract_storage_service.dart';

class StorageService extends AbstractStorageService {
  Future getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValueByKey<T>(String key) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        return prefs.getInt(key);

      case String:
        return prefs.getString(key);

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeByKey(String key) async {
    final prefs = await getSharedPrefs();

    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;

      case String:
        prefs.setString(key, value as String);
        break;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }
}
