import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/feature/locations/widgets/category_button.dart';

class CategoryButtons extends StatelessWidget {
  CategoryButtons({super.key});

  final List<Widget> categoryButtons = [
    CategoryButton(
      text: 'Chats',
      icon: Icons.chat,
      onPressed: () {},
    ),
    CategoryButton(
      text: 'Kalender',
      icon: Icons.calendar_month,
      onPressed: () {},
    ),
    CategoryButton(
      text: 'Indoor Spielplätze',
      icon: Icons.skateboarding,
      onPressed: () {},
    ),
    CategoryButton(
      text: 'FreizeitParks',
      icon: Icons.attractions,
      onPressed: () {},
    ),
    CategoryButton(
      text: 'Schwimmbäder',
      icon: Icons.pool,
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text(
          'Kategorien',
          style: TextStyle(color: hpwhite, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: hpwhite,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.mic,
              color: hpwhite,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: categoryButtons,
          ),
        ),
      ),
    );
  }
}
