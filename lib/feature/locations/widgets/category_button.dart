import 'package:flutter/material.dart';
import 'package:happy_place/config/colors.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: shadowBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: hpwhite,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: hpwhite, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
