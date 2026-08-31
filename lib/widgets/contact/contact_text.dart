import 'package:flutter/material.dart';

class ContactText extends StatelessWidget {
  final String details;
  final String iconPath;
  const ContactText(this.details, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset(iconPath, width: 50),
          Text(details)
        ],
      ));
  }
}
