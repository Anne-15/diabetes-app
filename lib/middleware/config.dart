import 'dart:convert';

import 'package:android_testing/middleware/config_values.dart';
import 'package:android_testing/middleware/storage.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:get/get.dart';

class ConfigDataStore extends GetxController {
  static ConfigDataStore get to => Get.find();

  RxBool _firstOpen = false.obs;
  String token = '';
  // Rx<UserModel> _profile = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOff = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOff.isNotEmpty) {
      _firstOpen.value = true;
      // _profile(UserModel.fromFirestore(jsonEncode(profileOff)));
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) {
      return '';
    }
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  Future<void> savedProfile(UserModel profile) async {
    _firstOpen.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    setToken(profile.id!);
  }

  Future<bool> savedAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }
}
