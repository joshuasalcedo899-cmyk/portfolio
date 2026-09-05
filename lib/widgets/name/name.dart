import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: AppColors.background(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi, I am',
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.secondaryLabel(context),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Joshua Salcedo',
            style: textTheme.displaySmall?.copyWith(
              color: AppColors.label(context),
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),
        ],
      ),
    );
  }
}
