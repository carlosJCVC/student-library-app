abstract class AbstractStorageService {
  Future<void> setKeyValue<T>(String key, T value);
  Future<T?> getValueByKey<T>(String key);
  Future<bool> removeByKey(String key);
}
