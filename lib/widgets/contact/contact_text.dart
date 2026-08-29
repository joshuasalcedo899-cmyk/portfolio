import 'package:flutter/material.dart';

class ContactText extends StatelessWidget {
  final String iconPath;
  const ContactText(this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(iconPath, width: 50));
  }
}
