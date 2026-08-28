import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/about_me_modal/about_me_view.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_view.dart';
import 'package:flutter_testing/widgets/modals/resume_modal/resume_view.dart';
import 'package:flutter_testing/widgets/modals/skill_modal/skills_view.dart';
import 'package:flutter_testing/widgets/name/name.dart';
import 'package:flutter_testing/widgets/container/container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Name(),
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      'Projects',
                      'assets/project.webp',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ProjectView(),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      'About Me',
                      'assets/about_me.webp',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AboutMeView(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                      'Skills',
                      'assets/skills.webp',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SkillsView(),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      'Resume',
                      'assets/resume.webp',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ResumeView(),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      'Contacts',
                      'assets/contact.webp',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ResumeView(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
