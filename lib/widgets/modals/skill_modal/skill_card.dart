import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class SkillCard extends StatelessWidget {
  final String label;

  const SkillCard({super.key, required this.label});

  static const _iconPaths = {
    'unity': 'assets/stack/unity.svg',
    'c#': 'assets/stack/c#.svg',
    'python': 'assets/stack/python.svg',
    'pytorch': 'assets/stack/pytorch.svg',
    'firebase': 'assets/stack/firebase.svg',
    'javascript': 'assets/stack/js.svg',
    'php': 'assets/stack/php.svg',
    'css': 'assets/stack/css3.svg',
    'node.js': 'assets/stack/nodejs.svg',
    'flutter': 'assets/stack/flutter.svg',
    'mysql': 'assets/stack/mysql.svg',

  };

  @override
  Widget build(BuildContext context) {
    final iconPath = _iconPaths[label.trim().toLowerCase()];

    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        image: true,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 29, 29, 29),
              border: Border.all(color: AppColors.separator(context)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: iconPath == null
                ? Icon(
                    CupertinoIcons.chevron_left_slash_chevron_right,
                    color: AppColors.secondaryLabel(context),
                    size: 24,
                  )
                  : FractionallySizedBox(
                      widthFactor: 0.62,
                      heightFactor: 0.62,
                      child: SvgPicture.asset(
                        iconPath,
                        fit: BoxFit.contain,
                      ),
                  ),
          ),
          ),
        ),
      );
  }
}