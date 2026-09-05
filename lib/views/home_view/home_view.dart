import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/contact/contact.dart';
import 'package:flutter_testing/widgets/container/container.dart';
import 'package:flutter_testing/widgets/modals/about_me_modal/about_me_view.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_view.dart';
import 'package:flutter_testing/widgets/modals/resume_modal/resume_view.dart';
import 'package:flutter_testing/widgets/modals/skill_modal/skills_view.dart';
import 'package:flutter_testing/widgets/name/name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.groupedBackground(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 760;
            final tiles = <Widget>[
              const Name(),
              ContainerBox(
                'Projects',
                'assets/braces.svg',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProjectView(),
                  );
                },
              ),
              ContainerBox(
                'About Me',
                'assets/user.svg',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutMeView(),
                  );
                },
              ),
              ContainerBox(
                'Skills',
                'assets/keyboard.svg',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const SkillsView(),
                  );
                },
              ),
              ContainerBox(
                'Resume',
                'assets/file-spreadsheet.svg',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ResumeView(),
                  );
                },
              ),
              const Contact(),
            ];

            if (isCompact) {
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: tiles.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: index == 0 ? 220 : 260,
                    child: tiles[index],
                  );
                },
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Row(
                    children: tiles
                        .take(3)
                        .map((tile) => Expanded(child: tile))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: tiles
                        .skip(3)
                        .map((tile) => Expanded(child: tile))
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
