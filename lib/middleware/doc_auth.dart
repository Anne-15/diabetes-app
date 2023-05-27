import 'package:android_testing/screens/doctors%20view/login/logindoctor.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DocAuthPage extends StatelessWidget {
  const DocAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return DoctorNavBar();
          } else {
            return DoctorLoginView();
          }
        }),
      ),
    );
  }
}
