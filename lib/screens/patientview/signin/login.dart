import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_form_widget.dart';

class PatientLogin extends StatelessWidget {
  const PatientLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: size.height * 0.3,
                ),
                Text(
                  "Diplo App",
                  style: Styles.headerStyle1,
                ),
                Text(
                  "Welcome back to the app, enjoy your experience!",
                  style: Styles.headerStyle3,
                ),
                //login form
                LoginForm(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
