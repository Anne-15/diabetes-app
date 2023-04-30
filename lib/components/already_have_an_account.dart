import 'package:flutter/cupertino.dart';

import 'constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function? press;

  const AlreadyHaveAnAccount({super.key, required this.login, this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already have an account ? ",
          style: TextStyle(color: Styles.primaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Styles.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
