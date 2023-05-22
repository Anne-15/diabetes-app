import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:get/get.dart';

class GetUsersController extends GetxController {
  static GetUsersController get instance => Get.find();

  final _articleRepo = Get.put(UserRepository());

//get all the list of users
  Future<List<UserModel>> getAllUsers() async {
    return await _articleRepo.allUsers();
  }
}
