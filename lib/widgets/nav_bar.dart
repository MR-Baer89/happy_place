import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/screens/chatScreen.dart';
import 'package:happy_pleace/screens/profile_screen.dart';

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
        // Replace with your home screen navigation logic (if applicable)
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
