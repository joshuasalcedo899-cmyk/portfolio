import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        child: Image.asset(imagePath, fit: BoxFit.contain)),
    );
  }
}
