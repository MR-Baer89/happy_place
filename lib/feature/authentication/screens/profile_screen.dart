import 'package:flutter/material.dart';
import 'package:happy_place/config/colors.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/mr_baer.png'),
              ),
              const SizedBox(height: 20),
              const Text('Mr. Bär',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('d-mueller29@t-online.de.'),
              Container(
                decoration: BoxDecoration(
                  color: hpwhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Name: Dirk Müller'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.pin_drop_outlined),
                      title: Text('Region: Westerwald'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.child_friendly_outlined),
                      title: Text('Kinder: Junge, Mädchen'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.star_border_outlined),
                      title: Text('Favoriten: Wildparks, Freizeitparks'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
