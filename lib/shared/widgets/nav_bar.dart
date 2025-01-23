import 'package:flutter/material.dart';
import 'package:happy_place/config/colors.dart';
import 'package:happy_place/feature/authentication/screens/profile_screen.dart';
import 'package:happy_place/feature/calendar/screens/calendar_screen.dart';
import 'package:happy_place/feature/chat/screens/chat_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  // Function to navigate to the selected screen
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatScreen()));
        break;
      case 1:
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TabelCalendar()));
        break;
      default:
        print('Invalid navigation index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: shadowBlue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            color: hpwhite,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: hpwhite,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: hpwhite,
          ),
          label: 'Profil',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: hpwhite,
            ),
            label: 'Kalender'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: hpwhite,
          ),
          label: 'Menü',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: const Color.fromARGB(255, 240, 241, 243),
      onTap: (index) => _onItemTapped(index, context),
    );
  }
}
