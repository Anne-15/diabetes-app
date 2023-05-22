import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/splashscreen/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SpalshScreen extends StatelessWidget {
  SpalshScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashScreenController.animate.value ? 0 : -30,
              left: splashScreenController.animate.value ? 0 : -30,
              child: Image(
                height: AppLayout.getHeight(100),
                image: AssetImage('assets/images/main_top.png'),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left:
                  splashScreenController.animate.value ? size.width * 0.1 : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Interact and enjoy life together",
                      style: Styles.headerStyle1,
                    ),
                    Text(
                      "Learn from each other",
                      style: Styles.headerStyle3,
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashScreenController.animate.value ? 300 : 0,
              left: 50,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: SvgPicture.asset(
                  'assets/icons/login.svg',
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: splashScreenController.animate.value ? 40 : 0,
                right: 50,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: Container(
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Styles.c1),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Styles.c12,
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
