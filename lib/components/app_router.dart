import 'package:android_testing/screens/onboarding/onboarding_screen.dart';
import 'package:android_testing/screens/patientview/appointments/appointments.dart';
import 'package:android_testing/screens/patientview/chats/chats.dart';
import 'package:android_testing/screens/patientview/chats/single_chart.dart';
import 'package:android_testing/screens/patientview/home/homepage.dart';
import 'package:android_testing/screens/patientview/profile/profilescreen.dart';
import 'package:android_testing/screens/patientview/profile/updateprofile.dart';
import 'package:android_testing/screens/welcomescreen/welcome_screen.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:go_router/go_router.dart';

import '../screens/doctors view/home/homedoctor.dart';
import '../screens/doctors view/login/logindoctor.dart';
import '../screens/doctors view/register/registerdoctor.dart';
import '../screens/patientview/articles/allarticlesview.dart';
import '../screens/patientview/articles/writearticle.dart';
import '../screens/patientview/signin/login.dart';
import '../screens/patientview/signup/register.dart';
import '../widgets/navigationbar.dart';

final GoRouter router = GoRouter(routes: [
  //patient's view
  GoRoute(
    path: "/",
    builder: (context, state) => WelcomeScreen(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => PatientLogin(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => PatientRegister(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => Home(),
  ),
  GoRoute(
    path: "/write_article",
    builder: (context, state) => MyArticles(),
  ),
  GoRoute(
    path: "/all_article",
    builder: (context, state) => AllArticles(),
  ),
  GoRoute(
    path: "/appointments",
    builder: (context, state) => MyAppointments(),
  ),
  GoRoute(
    path: "/profile",
    builder: (context, state) => MyProfile(),
  ),
  GoRoute(
    path: "/update_profile",
    builder: (context, state) => UpdateProfile(),
  ),
  GoRoute(
    path: "/navbar",
    builder: (context, state) => BottomBar(),
  ),
  GoRoute(
    path: "/chats",
    builder: (context, state) => ChatApp(),
  ),

  GoRoute(
    path: "/single_chat",
    builder: (context, state) => SingleChat(),
  ),

  //doctor's views
  GoRoute(
    path: "/doctor_login",
    builder: (context, state) => DoctorLoginView(),
  ),
  GoRoute(
    path: "/doctor_register",
    builder: (context, state) => RegisterDoctorPage(),
  ),
  GoRoute(
    path: "/doctor_home",
    builder: (context, state) => HomeDoctor(),
  ),
  GoRoute(
    path: "/doctor_navbar",
    builder: (context, state) => DoctorNavBar(),
  ),

  //both users view
  GoRoute(
    path: "/onboarding",
    builder: (context, state) => OnboardingScreen(),
  ),
]);
