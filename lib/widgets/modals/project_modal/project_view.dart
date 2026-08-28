import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_card.dart';

class ProjectView extends StatelessWidget {
  final projects = [
    {'title': 'ARIA', 'image': 'assets/ARIA.png', 'bgColor': Colors.black},
    {'title': 'Automated Mail Tracker', 'image': 'assets/contacts/facebook.png', 'bgColor': Colors.white},
  ];
  ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    bgColor: project['bgColor']! as Color,
                    tags: ['Unity', 'C#', 'Python', 'AI', 'AR', 'Chatbot'],
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
