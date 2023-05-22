import 'package:android_testing/screens/patientview/signup/register.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/signup_controller.dart';
import 'forgot_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
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
            SizedBox(height: AppLayout.getHeight(10)),
            TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint_outlined,
                  color: Styles.c1,
                ),
                label: Text("Password"),
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            SizedBox(height: AppLayout.getHeight(10)),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
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
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () async {
                      SignupController.instance.signIn(
                        controller.emailAddress.text.trim(),
                        controller.password.text.trim(),
                      );
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomBar(),
                        ),
                      );
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccount(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientRegister(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
