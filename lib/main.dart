import 'package:android_testing/components/constants.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/screens/doctors%20view/appointments/appointments.dart';
import 'package:android_testing/screens/doctors%20view/home/homedoctor.dart';
import 'package:android_testing/screens/doctors%20view/login/logindoctor.dart';
import 'package:android_testing/screens/patientview/articles/allarticlesview.dart';
import 'package:android_testing/screens/patientview/chats/chats.dart';
import 'package:android_testing/screens/patientview/chats/single_chart.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/app_router.dart';
import 'firebase_options.dart';
import 'screens/doctors view/chats/all_chats.dart';
import 'screens/doctors view/register/registerdoctor.dart';
import 'screens/patientview/signup/register.dart';
import 'screens/welcomescreen/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diplo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Styles.backgroundColor,
        ),
      ),
      // routerConfig: router,
      home: PatientRegister(),
    );
  }
}
