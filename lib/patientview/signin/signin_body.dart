import 'package:android_testing/patientview/signin/signin_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../components/already_have_an_account.dart';
import '../../components/app_layout.dart';
import '../../components/constants.dart';
import '../../components/rounded_input_filed.dart';
import '../../components/rounded_password_field.dart';
import '../../doctors view/login/logindoctor.dart';
import '../home/homepage.dart';
import '../signup/signup.dart';

class BodyLogin extends StatelessWidget {
  final Widget child;
  const BodyLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignInBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DIPLO APP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Gap(AppLayout.getHeight(20)),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.24,
              ),
              SizedBox(height: size.height * 0.01),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(
                width: size.width * 0.8,
                // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
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
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccount(
                login: true,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUp();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DoctorLoginView();
                      },
                    ),
                  );
                },
                child: Text("Sign in as a specialist/doctor"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
