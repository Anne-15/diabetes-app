import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/controllers/signup_controller.dart';
import 'package:android_testing/screens/patientview/signup/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class PatientRegister extends StatelessWidget {
  const PatientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              //register form
              SignUpForm(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
