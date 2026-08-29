import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_card.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_list.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: 1200,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Projects',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 400,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
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
          ],
        ),
      ),
    );
  }
}
