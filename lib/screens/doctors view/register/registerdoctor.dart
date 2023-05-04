import 'package:android_testing/screens/doctors%20view/register/registerdoctor_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class RegisterDoctorPage extends StatelessWidget {
  const RegisterDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.c6.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.2,
              ),
              Text(
                "Diplo App",
                style: Styles.headerStyle1,
              ),
              Text(
                "Welcome to the app, enjoy your experience!",
                style: Styles.headerStyle3,
              ),
              SizedBox(height: AppLayout.getHeight(10.0)),
              Text(
                "For doctors/nurses",
                style: Styles.headerStyle4,
              ),
              //register form
              RegisterDoctorForm(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
