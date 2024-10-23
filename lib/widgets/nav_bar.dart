import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: hpBlue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
            color: Colors.grey,
          ),
          label: 'Maps',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            color: Colors.grey,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: 'Profil',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          label: 'Menü',
        ),
      ],
      currentIndex: 0, // Set the initial selected index
      selectedItemColor: Colors.blue,
      onTap: (index) {
        print('Selected index: $index');
      },
    );
  }
}
