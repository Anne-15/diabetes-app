import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetUsersController extends GetxController {
  static GetUsersController get instance => Get.find();

  final _articleRepo = Get.put(UserRepository());

//get all the list of articles
  Future<List<UserModel>> getAllUsers() async {
    return await _articleRepo.allUsers();
  }
}
