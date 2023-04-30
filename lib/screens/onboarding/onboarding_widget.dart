import 'package:flutter/cupertino.dart';

import '../../components/constants.dart';
import 'model_onboarding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: model.height * 0.4),
          Column(
            children: [
              Text(
                model.title,
                style: Styles.headerStyle1,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: Styles.headerStyle3,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
