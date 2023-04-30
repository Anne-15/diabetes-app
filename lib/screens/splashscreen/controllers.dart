import 'package:android_testing/screens/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(microseconds: 500));
    animate.value = true;
  }
}
