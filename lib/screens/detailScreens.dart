import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/screens/details.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Details details;

  const LocationDetailsScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: Text(details.locationTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              details.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details.locationTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(details.locationAddress,
                      style: const TextStyle(
                        fontSize: 24,
                      )),
                  const SizedBox(height: 4),
                  Text(details.locationCity,
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kinder: €${details.locationChildPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Erwachsene: €${details.locationAdultPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Show on Map'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
