import 'package:android_testing/components/constants.dart';
// import 'package:android_testing/models/calendar_client.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// ignore: deprecated_member_use
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:googleapis/calendar/v3.dart' as calendar;

import 'firebase_options.dart';
// import 'middleware/secrets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  // void prompt(String url) async {
  //   // ignore: deprecated_member_use
  //   if (await canLaunch(url)) {
  //     // ignore: deprecated_member_use
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // var clientId = ClientId(Secret.WEB_CLIENT_ID);
  // const scopes = [calendar.CalendarApi.calendarScope];
  // await clientViaUserConsent(clientId, scopes, prompt)
  //     .then((AuthClient client) {
  //   CalendarClient.calendar = calendar.CalendarApi(client);
  // });

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
      home: DoctorNavBar(),
    );
  }
}
