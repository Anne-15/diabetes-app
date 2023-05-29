import 'package:android_testing/screens/patientview/signup/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/constants.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({super.key});

  @override
  State<PatientRegister> createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
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
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
