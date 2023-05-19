import 'dart:io' show Platform;

class Secret {
  static const WEB_CLIENT_ID = "521701419256-ujjn14ina4cvmotlr2gruapvpv0qdu36.apps.googleusercontent.com";
  static const IOS_CLIENT_ID = "521701419256-sr12r8dnte9t0q0v592dpictfk71vt9b.apps.googleusercontent.com";
  static String getId() =>
      Platform.isAndroid ? Secret.WEB_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
