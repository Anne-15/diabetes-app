import 'package:android_testing/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../register/registerdoctor.dart';

class DoctorLoginForm extends StatelessWidget {
  const DoctorLoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline_outlined,
                color: Styles.c1,
              ),
              label: Text("Email"),
              hintText: "Email Address",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: AppLayout.getHeight(10)),
          TextFormField(
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
              onPressed: () {},
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
                  onPressed: () => context.go('/doctor_navbar'),
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
            press: () => context.go('/doctor_register'),
          ),
        ],
      ),
    ));
  }
}
