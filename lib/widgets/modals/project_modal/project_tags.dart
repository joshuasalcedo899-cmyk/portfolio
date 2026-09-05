import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class ProjectTags extends StatelessWidget {
  final List<String> tags;
  const ProjectTags(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.map((tag) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.fill(context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              tag,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.label(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
