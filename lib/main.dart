import 'package:android_testing/components/constants.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/screens/patientview/articles/single_article.dart';
import 'package:android_testing/screens/patientview/chats/chats.dart';
import 'package:android_testing/screens/welcomescreen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  // ignore: unused_local_variable
  // var clientID = ClientId(Secret.getId(), "");
  // const _scopes = const [cal.CalendarApi.CalendarScope];
  // await clientViaUserConsent(_clientID, _scopes, prompt)
  //     .then((AuthClient client) async {
  //   CalendarClient.calendar = cal.CalendarApi(client);
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
      home: ChatApp(),
    );
  }
}
