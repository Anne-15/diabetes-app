import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/patientview/appointments/appointments.dart';
import 'package:android_testing/screens/patientview/articles/allarticlesview.dart';
import 'package:android_testing/screens/patientview/chats/chats.dart';
import 'package:android_testing/screens/patientview/home/homepage.dart';
import 'package:android_testing/screens/patientview/profile/profilescreen.dart';
import 'package:flutter/material.dart';

import '../screens/patientview/articles/writearticle.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const MyAppointments(),
    const AllArticles(),
    const ChatApp(),
    const MyProfile()
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
