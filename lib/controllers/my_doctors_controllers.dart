import 'package:get/get.dart';

import '../models/my_doctors.dart';
import '../repository/my_doctors_repository.dart';

class GetMyDoctorsControllers extends GetxController {
  static GetMyDoctorsControllers get instance => Get.find();

  final _mydoctorsRepo = Get.put(MyDoctorsRepository());

  //get all doctors
  Future<List<MyDoctorsModel>> getAllMyDoctors() async {
    return await _mydoctorsRepo.allMyDoctors();
  }
}
