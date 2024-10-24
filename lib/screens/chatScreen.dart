import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text(
          'Chats',
          style: TextStyle(color: hpwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text('krjnj llm cnkjo knnikjn'),
                  );
                },
              ),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Nachricht schreiben'),
            ),
          ],
        ),
      ),
    );
  }
}
