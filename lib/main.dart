import 'dart:io';

import 'package:android_testing/components/constants.dart';
import 'package:android_testing/middleware/secrets.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/screens/doctors%20view/register/registerdoctor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: <String>[CalendarApi.calendarScope]);

  Future<AuthClient> getAuthenticatedClient() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Prompt user consent and obtain an authorized HTTP client
    final AuthClient client = await clientViaUserConsent(
      ClientId(Secret.ANDROID_CLIENT_ID),
      <String>[CalendarApi.calendarScope],
      googleAuth.accessToken as PromptUserForConsent,
    );

    return client;
  }

  void initializeCalendarApi() async {
    try {
      final AuthClient client = await getAuthenticatedClient();
      client.close();
    } catch (e) {
      print('Error: $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diplo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Styles.backgroundColor,
        ),
      ),
      // routerConfig: router,
      home: RegisterDoctorPage(),
    );
  }
}
