import 'dart:async';

import 'package:android_testing/components/constants.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    checkEmailVerificationStatus();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload();
      setState(() {
        isEmailVerified = user.emailVerified;
      });
      if (!isEmailVerified) {
        sendVerificationEmail();
        timer = Timer.periodic(const Duration(seconds: 3), (timer) {
          checkEmailVerificationStatus();
        });
      } else {
        timer?.cancel();
        navigateToDoctorNavBar();
      }
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.sendEmailVerification();

        setState(() {
          canResend = false;
        });
        await Future.delayed(const Duration(minutes: 5));
        setState(() {
          canResend = true;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void navigateToDoctorNavBar() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DoctorNavBar()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? DoctorNavBar()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Verify Email",
                style: Styles.headerStyle2,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A verification email has been sent to your email",
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: canResend ? sendVerificationEmail : null,
                    icon: const Icon(Icons.email_outlined),
                    label: const Text("Resend Email"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
