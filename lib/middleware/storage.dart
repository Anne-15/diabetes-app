import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _pref.setStringList(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _pref.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _pref.remove(key);
  }
}
