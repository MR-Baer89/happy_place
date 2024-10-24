import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/screens/detailScreens';
import 'package:happy_pleace/widgets/category_button.dart';
import 'package:happy_pleace/widgets/nav_bar.dart';
import 'package:happy_pleace/model/location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Location> locations = [
      Location(
          locationTitle: 'Tolli Park',
          locationAddress: 'Nikolaus-Otto-Straße 11',
          locationCity: '56727 Mayen',
          imagePath: 'assets/locations/tollipark.png',
          locationChildPrice: 7.00,
          locationAdultPrice: 5.00),
      Location(
        locationTitle: 'Taunus Wunderland',
        locationAddress: 'Haus Zur Schanze 1',
        locationCity: '65388 Schlangenbad',
        imagePath: 'assets/locations/taunus-wunderland.png',
        locationChildPrice: 27.50,
        locationAdultPrice: 31.50,
      ),
      Location(
        locationTitle: 'Wild- und Freizeitpark Klotten',
        locationAddress: 'Wildparkstraße 1',
        locationCity: '56818 Klotten',
        imagePath: 'assets/locations/klotten.png',
        locationChildPrice: 27.50,
        locationAdultPrice: 29.50,
      ),
      Location(
        locationTitle: 'Phantasialand',
        locationAddress: 'Berggeeiststraße 31- 41',
        locationCity: '50321 Brül',
        imagePath: 'assets/locations/phantasialand.png',
        locationChildPrice: 57.00,
        locationAdultPrice: 57.00,
      ),
      Location(
        locationTitle: 'Flippolino',
        locationAddress: 'Auf dem Molzberg 5- 7',
        locationCity: '57548 Kirchen (Sieg)',
        imagePath: 'assets/locations/flippolino.jpg',
        locationChildPrice: 13.00,
        locationAdultPrice: 7.00,
      ),
      Location(
        locationTitle: 'Movie Park Germany',
        locationAddress: 'Werner- Allee 1',
        locationCity: '46244 Bottrop',
        imagePath: 'assets/locations/Moviepark.png',
        locationChildPrice: 52.90,
        locationAdultPrice: 57.90,
      ),
      Location(
          locationTitle: 'Tier- Erlebnispark Bell',
          locationAddress: 'Am Markt 1',
          locationCity: '56288 Bell (Hundsrück)',
          imagePath: 'assets/locations/bell.png',
          locationChildPrice: 9.50,
          locationAdultPrice: 13.50),
    ];

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
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.mic,
              color: hpwhite,
            ),
            onPressed: () {
              // Implement voice search functionality
            },
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
                  MaterialPageRoute(builder: (context) => _categoryButtons()),
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
              final location = locations[index];
              return GestureDetector(
                onTap: () {
                  final location = locations[index];
                  final details = Details(
                    locationTitle: location.locationTitle,
                    locationAddress: location.locationAddress,
                    locationCity: location.locationCity,
                    imagePath: location.imagePath,
                    locationChildPrice: location.locationChildPrice,
                    locationAdultPrice: location.locationAdultPrice,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LocationDetailsScreen(details: details),
                    ),
                  );
                },
                child: Card(
                  child: Image.asset(location.imagePath),
                ),
              );
            },
            childCount: locations.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ]),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class _categoryButtons extends StatelessWidget {
  _categoryButtons();

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
