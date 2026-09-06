import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/apple_dialog_scaffold.dart';
import 'package:flutter_testing/widgets/modals/skill_modal/my_stacks.dart';
import 'package:flutter_testing/widgets/modals/skill_modal/skill_card.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppleDialogScaffold(
      backgroundColor: Colors.transparent,
      title: 'SKILLS',
      maxWidth: 1020,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final stacks = myProjects
              .expand((project) => project.techStack)
              .toList();
          final columns = math.min(
            5,
            math.max(1, (constraints.maxWidth / 120).floor()),
          );

          return Container(
            decoration: BoxDecoration(
              // color: AppColors.groupedBackground(context),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              height: math.min(MediaQuery.sizeOf(context).height * 0.62, 540),
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: stacks.length,
                itemBuilder: (context, index) {
                  return SkillCard(label: stacks[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
