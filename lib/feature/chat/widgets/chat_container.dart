import 'package:flutter/material.dart';
import 'package:happy_place/config/colors.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: shadowBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profilimage/Anna.png')),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Anna Schlosser',
              style: TextStyle(
                  fontSize: 16, color: hpwhite, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
