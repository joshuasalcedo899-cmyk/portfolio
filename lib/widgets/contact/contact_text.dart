import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class ContactText extends StatelessWidget {
  final String details;
  final String iconPath;
  final double iconSize;
  final double tileSize;

  const ContactText(
    this.details,
    this.iconPath, {
    super.key,
    this.iconSize = 50,
    this.tileSize = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: details,
      child: Semantics(
        label: details,
        button: true,
        child: Container(
          width: tileSize,
          height: tileSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.secondaryGroupedBackground(context),
            border: Border.all(color: AppColors.separator(context)),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Image.asset(iconPath, width: iconSize, height: iconSize),
        ),
      ),
    );
  }
}
