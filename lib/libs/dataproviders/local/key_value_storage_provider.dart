import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  static final StorageProvider _instance = StorageProvider._internal();
  SharedPreferences? _prefs;

  StorageProvider._internal();

  factory StorageProvider() {
    return _instance;
  }

  Future<void> _ensurePrefsInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _ensurePrefsInitialized();
    _prefs?.setString(key, value);
  }

  Future<String?> getString(String key) async {
    await _ensurePrefsInitialized();
    return _prefs?.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _ensurePrefsInitialized();
    _prefs?.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    await _ensurePrefsInitialized();
    return _prefs?.getInt(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _ensurePrefsInitialized();
    _prefs?.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    await _ensurePrefsInitialized();
    return _prefs?.getBool(key);
  }

  Future<void> saveDouble(String key, double value) async {
    await _ensurePrefsInitialized();
    _prefs?.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    await _ensurePrefsInitialized();
    return _prefs?.getDouble(key);
  }

  Future<void> removeValue(String key) async {
    await _ensurePrefsInitialized();
    _prefs?.remove(key);
  }

  Future<void> clearAll() async {
    await _ensurePrefsInitialized();
    _prefs?.clear();
  }
}
