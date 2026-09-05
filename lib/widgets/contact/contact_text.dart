import 'package:flutter/material.dart';

class ContactText extends StatelessWidget {
  final String details;
  final String iconPath;
  final double iconSize;

  const ContactText(
    this.details,
    this.iconPath, {
    super.key,
    this.iconSize = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconPath, width: iconSize, height: iconSize),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            details,
            softWrap: true,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
