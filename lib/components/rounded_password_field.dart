import 'package:android_testing/components/text_field_container.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: Styles.primaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: Styles.primaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
