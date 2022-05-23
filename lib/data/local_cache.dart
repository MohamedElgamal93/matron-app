import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalCache {
  late final FlutterSecureStorage _storage;

  final iosOptions = const IOSOptions(
    accessibility: IOSAccessibility.first_unlock,
  );
  final androidOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  LocalCache() {
    _storage = FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  Future<void> save(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> saveBool(String key, bool value) async {
    return await _storage.write(key: key, value: value ? "1" : "0");
  }

  // 1 = true
  // 0 = false
  Future<bool?> getBool(String key) async {
    String? value = await _storage.read(key: key);
    if (value == null) {
      return null;
    } else {
      return value == "1";
    }
  }

  Future<void> delete(String key) async {
    return await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }
}
