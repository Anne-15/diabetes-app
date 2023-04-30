import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Styles.c9.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Styles.c1,
        ),
      ),
      title: Text(title),
      trailing: endIcon
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Styles.c9.withOpacity(0.1),
              ),
              child: Icon(
                Icons.chevron_right_outlined,
                color: Colors.grey,
                size: 18.0,
              ),
            )
          : null,
    );
  }
}
