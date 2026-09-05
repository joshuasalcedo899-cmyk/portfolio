import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: AppColors.background(context),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1000,
          maxHeight: MediaQuery.sizeOf(context).height - 40,
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
