import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/app_layout.dart';

import 'doctor_login_form_widget.dart';

class DoctorLoginView extends StatelessWidget {
  const DoctorLoginView({super.key});

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
                SizedBox(height: AppLayout.getHeight(10.0)),
                Text(
                  "For doctos/nurses",
                  style: Styles.headerStyle4,
                ),
                //login form
                DoctorLoginForm(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
