import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:happy_pleace/feature/chat/widgets/chatContainer.dart';

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
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChatContainer(),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hey wie gehts dir?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Gut und selbst?', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Schlechten Leuten geht es immer gut 🤣 .\nHast du heute schon was vor?',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                Spacer(),
                TextField(
                  decoration: InputDecoration(hintText: 'Nachricht schreiben'),
                ),
              ],
            ),
          ),
        ));
  }
}
