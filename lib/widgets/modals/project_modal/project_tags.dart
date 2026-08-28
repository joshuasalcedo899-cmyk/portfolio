import 'package:flutter/material.dart';

class ProjectTags extends StatelessWidget {
  final List<String> tags;
  const ProjectTags(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            tag,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
    );
  }
}