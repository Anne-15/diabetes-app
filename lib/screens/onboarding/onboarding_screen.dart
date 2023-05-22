import 'package:android_testing/components/image_constants.dart';
import 'package:android_testing/components/text_constants.dart';
import 'package:android_testing/screens/onboarding/model_onboarding.dart';
import 'package:android_testing/screens/onboarding/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../components/constants.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pages = [
      OnboardingPage(
        model: OnboardingModel(
            image: onboardingImage1,
            title: onboardingtitle,
            subTitle: subtitle,
            counterText: counter1,
            height: size.height,
            bgColor: Styles.c2),
      ),
      OnboardingPage(
        model: OnboardingModel(
            image: onboardingImage2,
            title: onboardingtitle,
            subTitle: subtitle,
            counterText: counter2,
            height: size.height,
            bgColor: Styles.c6),
      ),
      OnboardingPage(
        model: OnboardingModel(
            image: onboardingImage3,
            title: onboardingtitle,
            subTitle: subtitle,
            counterText: counter3,
            height: size.height,
            bgColor: Styles.c12),
      ),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: onPageChangeCallback,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextpage = controller.currentPage + 1;
                controller.animateToPage(page: nextpage);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20.0),
                foregroundColor: Colors.white,
              ),
              child: Container(
                // color: Styles.c1,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Styles.c1,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  // color: Styles.c1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPageChangeCallback(int activePageIndex) {
    currentPage = activePageIndex;
  }
}
