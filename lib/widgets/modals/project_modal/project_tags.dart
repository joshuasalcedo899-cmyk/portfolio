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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            color: const Color.fromARGB(83, 156, 153, 153),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            tag,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        );
      }).toList(),
    );
  }
}
