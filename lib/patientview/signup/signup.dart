import 'package:android_testing/patientview/signup/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyRegister(child: Column()),
    );
  }
}
