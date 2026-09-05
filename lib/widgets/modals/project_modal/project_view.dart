import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/modals/apple_dialog_scaffold.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_card.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_list.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppleDialogScaffold(
      title: 'Projects',
      maxWidth: 1020,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width < 520
              ? 1
              : width < 760
              ? 2
              : width < 980
              ? 3
              : 4;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.groupedBackground(context),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.separator(context)),
            ),
            child: SizedBox(
              height: math.min(MediaQuery.sizeOf(context).height * 0.62, 540),
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return ProjectCard(
                    title: project['title']! as String,
                    image: project['image']! as String,
                    route: project['route']! as String,
                    tags: List<String>.from(project['tags']! as List),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
