import 'package:flutter/material.dart';
import 'package:happy_place/config/colors.dart';
import 'package:happy_place/feature/locations/repo/details.dart';
import 'package:happy_place/feature/locations/screens/detail_screens.dart';
import 'package:happy_place/feature/locations/widgets/category_buttons.dart';
import 'package:happy_place/shared/widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text(
          'HappyPlace',
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
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryButtons()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list,
                      size: 40,
                    ),
                    Text(
                      'Alle Kategorien',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Favoriten',
              style: TextStyle(
                color: hpwhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final details = detailData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LocationDetailsScreen(details: details),
                    ),
                  );
                },
                child: Card(
                  child: Image.asset(details.imagePath),
                ),
              );
            },
            childCount: detailData.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        )
      ]),
      bottomNavigationBar: const NavBar(),
    );
  }
}
