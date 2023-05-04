import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class DoctorCategories extends StatefulWidget {
  const DoctorCategories({
    super.key,
  });

  @override
  State<DoctorCategories> createState() => _DoctorCategoriesState();
}

class _DoctorCategoriesState extends State<DoctorCategories> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Patients', 'All Contacts'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Styles.c6,
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: (Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                )),
              );
            }),
      ),
    );
  }
}
