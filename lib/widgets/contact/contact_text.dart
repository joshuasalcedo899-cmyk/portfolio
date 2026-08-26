import 'package:flutter/material.dart';

class ContactText extends StatelessWidget {
  final String title;
  final String iconPath;
  const ContactText(this.title, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 20.0,
        ),
        Text(
          ' : $title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
