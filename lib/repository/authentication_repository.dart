import 'package:android_testing/models/signup_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/welcomescreen/welcome_screen.dart';
import '../widgets/navigationbar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    //fetch any changes
    firebaseUser.bindStream(_auth.userChanges());
    //user performs an action
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll((context) => WelcomeScreen())
        : Get.offAll((context) => DoctorNavBar());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll((context) => DoctorNavBar())
          : Get.to((context) => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPaawordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupWithEmailAndPaawordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> LoginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
