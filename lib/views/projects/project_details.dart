import 'package:flutter/material.dart';
import 'package:flutter_testing/views/projects/project_item_list.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectItem project;
  const ProjectDetailPage({super.key, required this.project});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24.0, 50, 24, 24),
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: project.techStack
                .map((tech) => Chip(label: Text(tech)))
                .toList(),
          ),
          const SizedBox(height: 20),
          Text(project.description),
          // Render links, screenshots, etc. dynamically
        ],
      ),
    );
  }
}
