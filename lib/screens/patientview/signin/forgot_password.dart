import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/signup_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(SignupController());
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
                //reset password form
                Form(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Styles.c1,
                            ),
                            label: Text("Email"),
                            hintText: "Email Address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: AppLayout.getHeight(30)),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: size.width * 0.6,
                            height: AppLayout.getHeight(40.0),
                            child: ClipRRect(
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Styles.primaryColor),
                                ),
                                onPressed: () {
                                  SignupController.instance.resetPassword(
                                    controller.emailAddress.text.trim(),
                                  );
                                  // context.go('/navbar');
                                },
                                child: Text(
                                  "Reset Password",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
