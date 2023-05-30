import 'package:android_testing/screens/patientview/signup/register.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/signup_controller.dart';
import 'forgot_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<void> signIn(String emailAddress, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Check if the user's email is verified
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        // Login successful, navigate to the next screen
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBar(),
          ),
        );
      } else {
        // User's email is not verified
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please verify your email to sign in.'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Error occurred during sign-in
      String errorMessage = 'An error occurred, please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  }

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
                width: widget.size.width * 0.6,
                height: AppLayout.getHeight(40.0),
                child: ClipRRect(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () async {
                      final email = controller.emailAddress.text.trim();
                      final password = controller.password.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please provide your email and password'),
                          ),
                        );
                      } else {
                        await signIn(email, password);
                      }
                      // ignore: use_build_context_synchronously
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: widget.size.height * 0.03),
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
