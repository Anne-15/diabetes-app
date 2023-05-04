import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import '../screens/doctors view/appointments/appointments.dart';
import '../screens/doctors view/home/homedoctor.dart';
import '../screens/doctors view/profile/doctor_profile.dart';

class DoctorNavBar extends StatefulWidget {
  const DoctorNavBar({super.key});

  @override
  State<DoctorNavBar> createState() => _DoctorNavBarState();
}

class _DoctorNavBarState extends State<DoctorNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeDoctor(),
    const DoctorAppointments(),
    const Text('Articles'),
    const Text('Chats'),
    const DoctorProfile()
  ];

  void _onClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      backgroundColor: Styles.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onClick,
          elevation: 20,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Styles.c1,
          unselectedItemColor: const Color(0xFFEDE7F6),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule_rounded), label: "Appointments"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded), label: "Articles"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: "Profile"),
          ]),
    );
  }
}
