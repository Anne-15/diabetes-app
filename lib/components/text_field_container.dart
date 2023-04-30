import 'package:flutter/material.dart';
import 'constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Styles.c4,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
