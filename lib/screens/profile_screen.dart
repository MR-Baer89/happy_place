import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text(
          'Mein Profil',
          style: TextStyle(
              fontSize: 24, color: hpwhite, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/mr_baer.png'),
            ),
            SizedBox(height: 20),
            Text('Mr. Bär',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text('mr.baer@hotmail.com'),
          ],
        ),
      ),
    );
  }
}
